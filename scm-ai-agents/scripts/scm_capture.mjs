#!/usr/bin/env node
import fs from "node:fs/promises";
import path from "node:path";
import { chromium } from "playwright";

const ROOT = process.cwd();
const BASE_URL = process.env.APEX_BASE_URL || "http://localhost:8775";
const WORKSPACE = process.env.APEX_WORKSPACE || "scm-gendev";
const USERNAME = process.env.APEX_USERNAME || "scm-gendev-user";
const PASSWORD = process.env.APEX_PASSWORD || "scm-gendev-user";
const COLOR_SCHEME = (process.env.APEX_COLOR_SCHEME || "dark").toLowerCase();

const args = process.argv.slice(2);
const command = args[0] || "probe";

function builderUrl(p = "") {
  return `${BASE_URL}/ords/r/apex/${p}`.replace(/\/+$/, "");
}

function currentSession(page) {
  try {
    return new URL(page.url()).searchParams.get("session");
  } catch {
    return null;
  }
}

async function ensureDir(filePath) {
  await fs.mkdir(path.dirname(filePath), { recursive: true });
}

async function launch() {
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage({
    viewport: { width: 1600, height: 1000 },
    deviceScaleFactor: 1,
  });
  if (COLOR_SCHEME === "dark") {
    await page.emulateMedia({ colorScheme: "dark" });
  }
  return { browser, page };
}

async function screenshot(page, outFile, fullPage = false) {
  const filePath = path.isAbsolute(outFile) ? outFile : path.join(ROOT, outFile);
  await ensureDir(filePath);
  await page.screenshot({ path: filePath, fullPage });
  console.log(filePath);
}

async function clickFirstVisible(page, selectors) {
  for (const selector of selectors) {
    const locator = page.locator(selector).first();
    if (await locator.isVisible({ timeout: 1000 }).catch(() => false)) {
      await locator.click();
      return true;
    }
  }
  return false;
}

async function fillFirstVisible(page, selectors, value) {
  for (const selector of selectors) {
    const locator = page.locator(selector).first();
    if (await locator.count()) {
      await locator.fill(value);
      return true;
    }
  }
  return false;
}

async function setInputValue(locator, value) {
  if (!(await locator.count())) {
    return false;
  }
  await locator.evaluate((el, nextValue) => {
    el.focus();
    el.value = "";
    el.dispatchEvent(new Event("input", { bubbles: true }));
    el.dispatchEvent(new Event("change", { bubbles: true }));
    el.value = nextValue;
    el.dispatchEvent(new Event("input", { bubbles: true }));
    el.dispatchEvent(new Event("change", { bubbles: true }));
    el.blur();
  }, value);
  return true;
}

async function loginIfNeeded(page) {
  const candidates = [
    builderUrl("workspace/sign-in"),
    builderUrl("workspace/home"),
    `${BASE_URL}/ords/`,
  ];

  for (const url of candidates) {
    await page.goto(url, { waitUntil: "domcontentloaded", timeout: 120000 });
    await page.waitForTimeout(1200);
    const title = await page.title();
    const body = ((await page.textContent("body")) || "").slice(0, 400);
    const notFound =
      /isn't available|not found|error/i.test(title) ||
      /isn't available|not found|application .* page .* not found/i.test(body);
    if (!notFound && (await page.locator("body").count())) {
      break;
    }
  }

  const title = await page.title();
  const hasPassword = (await page.locator("input[type='password']").count()) > 0;
  if (!/sign in|login/i.test(title) && !hasPassword) {
    return;
  }

  await fillFirstVisible(page, [
    "#F4550_P1_COMPANY",
    "input[name='p_company']",
    "input[placeholder*='Workspace']",
    "input[type='text']",
  ], WORKSPACE);
  await fillFirstVisible(page, [
    "#F4550_P1_USERNAME",
    "input[name='p_username']",
    "input[placeholder*='Username']",
  ], USERNAME);
  await fillFirstVisible(page, [
    "#F4550_P1_PASSWORD",
    "input[name='p_password']",
    "input[type='password']",
  ], PASSWORD);

  const clicked = await clickFirstVisible(page, [
    "button:has-text('Sign In')",
    "button:has-text('Login')",
    "input[type='submit']",
  ]);
  if (!clicked) {
    await page.locator("input[type='password']").first().press("Enter");
  }

  await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
  await page.waitForTimeout(3000);
}

async function dumpProbe(page) {
  const links = await page.locator("a, button").evaluateAll((els) =>
    els
      .map((el) => ({
        tag: el.tagName,
        text: (el.textContent || "").trim().replace(/\s+/g, " ").slice(0, 160),
        aria: el.getAttribute("aria-label") || "",
        href: el.getAttribute("href") || "",
        id: el.id || "",
        visible: !!(el.offsetWidth || el.offsetHeight || el.getClientRects().length),
      }))
      .filter((el) => el.visible),
  );

  const body = ((await page.textContent("body")) || "").replace(/\s+/g, " ").slice(0, 1600);
  console.log(JSON.stringify({
    title: await page.title(),
    url: page.url(),
    body,
    links,
  }, null, 2));
}

async function withTargetPath(page, targetPath) {
  let url = targetPath.startsWith("http")
    ? targetPath
    : targetPath.startsWith("/")
      ? `${BASE_URL}${targetPath}`
      : builderUrl(targetPath);
  if (!targetPath.startsWith("http")) {
    const session = currentSession(page);
    if (session) {
      const sessionUrl = new URL(url);
      if (!sessionUrl.searchParams.has("session")) {
        sessionUrl.searchParams.set("session", session);
      }
      url = sessionUrl.toString();
    }
  }
  await page.goto(url, { waitUntil: "domcontentloaded", timeout: 120000 });
  await page.waitForTimeout(2500);
}

async function runProbe() {
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runShot() {
  const outFile = args[1];
  if (!outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs shot <output-file>");
  }
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await screenshot(page, outFile, false);
  } finally {
    await browser.close();
  }
}

async function runOpen() {
  const targetPath = args[1];
  const outFile = args[2];
  if (!targetPath || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs open <path> <output-file>");
  }
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, targetPath);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runInspect() {
  const targetPath = args[1];
  if (!targetPath) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs inspect <path>");
  }
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, targetPath);
    const controls = await page.locator("input, textarea, select, button, a").evaluateAll((els) =>
      els
        .map((el) => ({
          tag: el.tagName,
          id: el.id || "",
          name: el.getAttribute("name") || "",
          type: el.getAttribute("type") || "",
          text: (el.textContent || "").trim().replace(/\s+/g, " ").slice(0, 160),
          value:
            "value" in el && typeof el.value === "string"
              ? el.value.slice(0, 160)
              : "",
          placeholder: el.getAttribute("placeholder") || "",
          href: el.getAttribute("href") || "",
          aria: el.getAttribute("aria-label") || "",
          visible: !!(el.offsetWidth || el.offsetHeight || el.getClientRects().length),
        }))
        .filter((el) => el.visible),
    );
    console.log(JSON.stringify({
      title: await page.title(),
      url: page.url(),
      controls,
    }, null, 2));
  } finally {
    await browser.close();
  }
}

async function runSqlFile() {
  const sqlFile = args[1];
  const outFile = args[2];
  if (!sqlFile || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs sql-file <sql-file> <output-file>");
  }
  const sql = await fs.readFile(path.isAbsolute(sqlFile) ? sqlFile : path.join(ROOT, sqlFile), "utf8");
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, "sql-workshop/sqlcommandprocessor");
    const editor = page.locator("textarea[aria-label='SQL Command']").first();
    await editor.evaluate((el) => el.focus());
    await page.keyboard.press(`${process.platform === "darwin" ? "Meta" : "Control"}+A`);
    await page.keyboard.press("Backspace");
    await page.keyboard.insertText(sql);
    await page.waitForTimeout(400);
    await page.getByRole("button", { name: /^Run$/ }).click();
    await page.waitForTimeout(5000);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runImportScript() {
  const sqlFile = args[1];
  const outFile = args[2];
  if (!sqlFile || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs import-script <sql-file> <output-file>");
  }
  const fullPath = path.isAbsolute(sqlFile) ? sqlFile : path.join(ROOT, sqlFile);
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, "sql-workshop/import-scripts");
    await page.locator("#P112_FILE_input").setInputFiles(fullPath);
    await page.waitForTimeout(1500);
    const nextButton = page.locator("#B45314626525446306").or(page.getByRole("button", { name: /^Next$/ })).first();
    if (await nextButton.isVisible({ timeout: 3000 }).catch(() => false)) {
      await nextButton.click();
      await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
      await page.waitForTimeout(2500);
    }
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runClick() {
  const targetPath = args[1];
  const selector = args[2];
  const outFile = args[3];
  if (!targetPath || !selector || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs click <path> <selector> <output-file>");
  }
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, targetPath);
    await page.locator(selector).first().click();
    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(2500);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runClickInspect() {
  const targetPath = args[1];
  const selector = args[2];
  if (!targetPath || !selector) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs click-inspect <path> <selector>");
  }
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, targetPath);
    await page.locator(selector).first().click();
    await page.waitForTimeout(2000);
    const controls = await page.locator("input, textarea, select, button, a").evaluateAll((els) =>
      els
        .map((el) => ({
          tag: el.tagName,
          id: el.id || "",
          name: el.getAttribute("name") || "",
          type: el.getAttribute("type") || "",
          text: (el.textContent || "").trim().replace(/\s+/g, " ").slice(0, 160),
          value:
            "value" in el && typeof el.value === "string"
              ? el.value.slice(0, 160)
              : "",
          placeholder: el.getAttribute("placeholder") || "",
          href: el.getAttribute("href") || "",
          aria: el.getAttribute("aria-label") || "",
          visible: !!(el.offsetWidth || el.offsetHeight || el.getClientRects().length),
        }))
    );
    console.log(JSON.stringify({
      title: await page.title(),
      url: page.url(),
      controls,
    }, null, 2));
  } finally {
    await browser.close();
  }
}

async function runClickFrames() {
  const targetPath = args[1];
  const selector = args[2];
  if (!targetPath || !selector) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs click-frames <path> <selector>");
  }
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, targetPath);
    await page.locator(selector).first().click();
    await page.waitForTimeout(2000);
    const frames = page.frames().map((frame) => ({
      url: frame.url(),
      name: frame.name(),
    }));
    console.log(JSON.stringify({ title: await page.title(), url: page.url(), frames }, null, 2));
  } finally {
    await browser.close();
  }
}

async function runUploadFrameInspect() {
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, "sql-workshop/sql-scripts");
    await page.locator("#B10807025483846713").click();
    await page.waitForTimeout(2000);
    const frame = page.frames().find((candidate) => candidate.url().includes("/upload-script?"));
    if (!frame) {
      throw new Error("Upload frame not found");
    }
    const controls = await frame.locator("input, textarea, select, button, a").evaluateAll((els) =>
      els.map((el) => ({
        tag: el.tagName,
        id: el.id || "",
        name: el.getAttribute("name") || "",
        type: el.getAttribute("type") || "",
        text: (el.textContent || "").trim().replace(/\s+/g, " ").slice(0, 160),
        value:
          "value" in el && typeof el.value === "string"
            ? el.value.slice(0, 160)
            : "",
        placeholder: el.getAttribute("placeholder") || "",
        href: el.getAttribute("href") || "",
        aria: el.getAttribute("aria-label") || "",
        visible: !!(el.offsetWidth || el.offsetHeight || el.getClientRects().length),
      })),
    );
    console.log(JSON.stringify({ frameUrl: frame.url(), controls }, null, 2));
  } finally {
    await browser.close();
  }
}

async function runUploadScript() {
  const sqlFile = args[1];
  const scriptName = args[2];
  const outFile = args[3];
  if (!sqlFile || !scriptName || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs upload-script <sql-file> <script-name> <output-file>");
  }
  const fullPath = path.isAbsolute(sqlFile) ? sqlFile : path.join(ROOT, sqlFile);
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, "sql-workshop/sql-scripts");
    await page.locator("#B10807025483846713").click();
    await page.waitForTimeout(1500);
    const frame = page.frames().find((candidate) => candidate.url().includes("/upload-script?"));
    if (!frame) {
      throw new Error("Upload frame not found");
    }
    await frame.locator("#P1017_FILE_input").setInputFiles(fullPath);
    await frame.locator("#P1017_SCRIPT_NAME").fill(scriptName);
    await frame.locator("#B10999819574212100").click();
    await page.waitForTimeout(3000);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runShowUploadScript() {
  const sqlFile = args[1];
  const scriptName = args[2];
  const outFile = args[3];
  if (!sqlFile || !scriptName || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs show-upload-script <sql-file> <script-name> <output-file>");
  }
  const fullPath = path.isAbsolute(sqlFile) ? sqlFile : path.join(ROOT, sqlFile);
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, "sql-workshop/sql-scripts");
    await page.locator("#B10807025483846713").click();
    await page.waitForTimeout(1500);
    const frame = page.frames().find((candidate) => candidate.url().includes("/upload-script?"));
    if (!frame) {
      throw new Error("Upload frame not found");
    }
    await frame.locator("#P1017_FILE_input").setInputFiles(fullPath);
    await frame.locator("#P1017_SCRIPT_NAME").fill(scriptName);
    await page.waitForTimeout(1000);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runUploadedScript() {
  const scriptName = args[1];
  const confirmOut = args[2];
  const resultOut = args[3];
  const resultView = (args[4] || "summary").toLowerCase();
  if (!scriptName || !confirmOut || !resultOut) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs run-uploaded-script <script-name> <confirm-output-file> <result-output-file> [summary|detail]");
  }
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, "sql-workshop/sql-scripts");
    const row = page.locator("tr").filter({ has: page.getByRole("link", { name: scriptName, exact: true }) }).first();
    await row.getByRole("link", { name: "Run", exact: true }).click();
    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(2000);
    await screenshot(page, confirmOut, false);
    await page.locator("#B372007991036").click();
    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(5000);
    if (resultView === "detail") {
      const detailToggle = page.locator("label, button, a").filter({ hasText: /^Detail$/ }).first();
      if (await detailToggle.isVisible({ timeout: 2000 }).catch(() => false)) {
        await detailToggle.click();
        await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
        await page.waitForTimeout(2000);
      }
    }
    await screenshot(page, resultOut, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runCreateQuickApp() {
  const appName = args[1];
  const outFile = args[2];
  if (!appName || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs create-quick-app <app-name> <output-file>");
  }
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, "app-builder/create-application?clear=56");
    await page.locator("#P56_APP_NAME").fill(appName);
    await page.locator("#CREATE_APP").click();
    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(5000);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runShowImportApp() {
  const sqlFile = args[1];
  const outFile = args[2];
  if (!sqlFile || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs show-import-app <sql-file> <output-file>");
  }
  const filePath = path.isAbsolute(sqlFile) ? sqlFile : path.join(ROOT, sqlFile);
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, "app-builder/import");
    await page.locator("#P460_FILE_input").setInputFiles(filePath);
    await page.waitForTimeout(1500);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runImportApp() {
  const sqlFile = args[1];
  const uploadOut = args[2];
  const completeOut = args[3];
  if (!sqlFile || !uploadOut || !completeOut) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs import-app <sql-file> <upload-output-file> <complete-output-file>");
  }
  const filePath = path.isAbsolute(sqlFile) ? sqlFile : path.join(ROOT, sqlFile);
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, "app-builder/import");
    await page.locator("#P460_FILE_input").setInputFiles(filePath);
    await page.waitForTimeout(1500);
    await screenshot(page, uploadOut, false);

    const clickNext = async () => {
      const nextButton = page.getByRole("button", { name: /next/i }).first();
      if (await nextButton.isVisible({ timeout: 1000 }).catch(() => false)) {
        await nextButton.click();
        await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
        await page.waitForTimeout(2000);
        return true;
      }
      return false;
    };

    const clickInstallLike = async () => {
      const labels = [/install/i, /import/i, /next/i, /finish/i];
      for (const label of labels) {
        const button = page.getByRole("button", { name: label }).first();
        if (await button.isVisible({ timeout: 1000 }).catch(() => false)) {
          await button.click();
          await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
          await page.waitForTimeout(2500);
          return true;
        }
      }
      return false;
    };

    for (let i = 0; i < 6; i += 1) {
      const title = await page.title();
      if (/applications - app builder|pages - app builder|application \d+/i.test(title)) {
        break;
      }
      if (await clickNext()) {
        continue;
      }
      if (await clickInstallLike()) {
        continue;
      }
      break;
    }

    await page.waitForTimeout(3000);
    await screenshot(page, completeOut, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runCreateAgent() {
  const outFile = args[1];
  if (!outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs create-agent <output-file>");
  }
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, "app-builder/shared-components?fb_flow_id=113&fb_flow_page_id=1");
    await page.locator("a:has-text('AI Agents')").first().click();
    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(2000);
    await page.locator("#B1474049947713159").click();
    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(2000);
    await page.locator("#P3504_NAME").fill("SCM Warehouse Agent");
    await page.locator("textarea[aria-label='System Prompt']").fill(
      "You are a warehouse operations assistant for a distribution warehouse. Identify issues, explain the risk, recommend an action, and wait for confirmation before taking write actions."
    );
    await page.locator("textarea[aria-label='Welcome Message']").fill(
      "Hi, I'm your Warehouse Assistant. Ask me what needs attention, or tell me to fix something."
    );
    await page.locator("#B2602403377975816").click();
    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(3000);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runDeleteUploadedScripts() {
  const scriptNames = args.slice(1);
  if (!scriptNames.length) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs delete-uploaded-scripts <script-name> [...]");
  }
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, "sql-workshop/sql-scripts");

    for (const scriptName of scriptNames) {
      const row = page.locator("tr").filter({ has: page.getByRole("link", { name: scriptName, exact: true }) }).first();
      if (!(await row.count())) {
        continue;
      }
      const checkbox = row.locator("input[name='f01']").first();
      if (await checkbox.count()) {
        await checkbox.check();
      }
    }

    await page.locator("#B10684914348921132").click();
    await page.waitForTimeout(1500);

    const confirmDelete = page
      .locator(".ui-dialog:visible .ui-dialog-buttonpane button")
      .filter({ hasText: /delete|ok|yes/i })
      .first();
    if (await confirmDelete.isVisible({ timeout: 2000 }).catch(() => false)) {
      await confirmDelete.click();
    } else {
      await page.keyboard.press("Enter").catch(() => {});
    }

    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(3000);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function openGenAiCreate(page) {
  await loginIfNeeded(page);
  await withTargetPath(page, "app-builder/generative-ai-services");
  await page.locator("#B2200229200704990").click();
  await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
  await page.waitForTimeout(2000);
}

async function deleteGenAiServiceByName(page, serviceName) {
  await loginIfNeeded(page);
  await withTargetPath(page, "app-builder/generative-ai-services");

  const serviceLink = page.getByRole("link", { name: serviceName, exact: true }).first();
  if (!(await serviceLink.isVisible({ timeout: 2000 }).catch(() => false))) {
    return false;
  }

  await serviceLink.click();
  await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
  await page.waitForTimeout(1500);

  await page.locator("#B3249256613301102").click();
  await page.waitForTimeout(1200);

  const confirmDelete = page.getByRole("button", { name: "Delete", exact: true }).last();
  if (await confirmDelete.isVisible({ timeout: 2000 }).catch(() => false)) {
    await confirmDelete.click();
  }

  await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
  await page.waitForURL(/generative-ai-services/i, { timeout: 120000 }).catch(() => {});
  await page.waitForTimeout(3000);
  return true;
}

async function fillGenAiServiceForm(page, {
  name = "OCI Gen AI",
  staticId = "oci_gen_ai",
  compartmentId = "ocid1.compartment.oc1..exampleuniqueID1234567890",
  region = "us-chicago-1",
  modelId = "meta.llama-3.3-70b-instruct",
  credentialLabel = "oci-credentials",
  userId = "ocid1.user.oc1..exampleuniqueID1234567890",
  tenancyId = "ocid1.tenancy.oc1..exampleuniqueID1234567890",
  fingerprint = "11:22:33:44:55:66:77:88:99:aa:bb:cc:dd:ee:ff:00",
  privateKey = "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDdemoExampleKey\nline2ExampleKeyMaterialOnlyForDocumentation\nline3ExampleKeyMaterialOnlyForDocumentation\n-----END PRIVATE KEY-----",
} = {}) {
  await page.locator("#P9801_AI_PROVIDER_TYPE").selectOption({ label: "OCI Generative AI Service" });
  await page.waitForTimeout(1500);

  await page.locator("#P9801_NAME").fill(name);
  await page.locator("#P9801_OCI_COMPARTMENT_ID").fill(compartmentId);
  await page.locator("#P9801_OCI_REGION").fill(region);
  await page.locator("#P9801_OCI_MODEL_ID").fill(modelId);

  const builderService = page.locator("#P9801_AI_IS_BUILDER_SERVICE");
  if (await builderService.count()) {
    const checked = await builderService.isChecked().catch(() => false);
    if (!checked) {
      await builderService.check();
    }
  }

  const defaultNewApps = page.locator("#P9801_AI_IS_DEFAULT_NEW_APPS");
  if (await defaultNewApps.count()) {
    const checked = await defaultNewApps.isChecked().catch(() => false);
    if (checked) {
      await defaultNewApps.uncheck();
    }
  }

  const credentialSelect = page.locator("#P9801_OCI_CREDENTIAL_ID");
  let selectedExistingCredential = false;
  if (await credentialSelect.count()) {
    selectedExistingCredential = await credentialSelect.selectOption({ label: credentialLabel })
      .then(() => true)
      .catch(() => false);
  }

  if (!selectedExistingCredential) {
    if (await page.locator("#P9801_OCI_USER_ID").count()) {
      await page.locator("#P9801_OCI_USER_ID").fill(userId);
    }
    if (await page.locator("#P9801_OCI_PRIVATE_KEY").count()) {
      await page.locator("#P9801_OCI_PRIVATE_KEY").fill(privateKey);
    }
    if (await page.locator("#P9801_OCI_TENANCY_ID").count()) {
      await page.locator("#P9801_OCI_TENANCY_ID").fill(tenancyId);
    }
    if (await page.locator("#P9801_OCI_FINGERPRINT").count()) {
      await page.locator("#P9801_OCI_FINGERPRINT").fill(fingerprint);
    }
  }

  const staticIdInput = page.locator("#P9801_STATIC_ID");
  if (await staticIdInput.count()) {
    await staticIdInput.fill(staticId);
  }

  await page.waitForTimeout(1000);
}

async function runShowGenAiServiceForm() {
  const outFile = args[1];
  if (!outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs show-genai-service-form <output-file>");
  }
  const { browser, page } = await launch();
  try {
    await openGenAiCreate(page);
    await fillGenAiServiceForm(page);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runCreateGenAiService() {
  const outFile = args[1];
  if (!outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs create-genai-service <output-file>");
  }
  const { browser, page } = await launch();
  try {
    await openGenAiCreate(page);
    await fillGenAiServiceForm(page);
    await page.locator("#B3250090732301103").click();
    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(4000);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runDeleteGenAiService() {
  const serviceName = args[1];
  if (!serviceName) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs delete-genai-service <service-name>");
  }
  const { browser, page } = await launch();
  try {
    const deleted = await deleteGenAiServiceByName(page, serviceName);
    console.log(JSON.stringify({ serviceName, deleted }, null, 2));
  } finally {
    await browser.close();
  }
}

async function runSetAppAiService() {
  const appId = args[1];
  const serviceName = args[2];
  const outFile = args[3];
  if (!appId || !serviceName || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs set-app-ai-service <app-id> <service-name> <output-file>");
  }
  const { browser, page } = await launch();
  try {
    await loginIfNeeded(page);
    await withTargetPath(page, `app-builder/edit-ai?fb_flow_id=${appId}`);
    await page.locator("#P523_DEFAULT_AI_SERVICE").selectOption({ label: serviceName });
    await page.waitForTimeout(1000);
    await page.locator("#B1415780778715045").click();
    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(3000);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function openAiAgentCreate(page, appId) {
  await loginIfNeeded(page);
  await withTargetPath(page, `app-builder/home?fb_flow_id=${appId}&f4000_p1_flow=${appId}&clear=RP`);
  await clickFirstVisible(page, [
    "a:has-text('Shared Components')",
    "button:has-text('Shared Components')",
  ]);
  await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
  await page.waitForTimeout(2000);
  await clickFirstVisible(page, [
    "a:has-text('Generative AI Agents')",
    "a:has-text('AI Agents')",
    "button:has-text('Generative AI Agents')",
    "button:has-text('AI Agents')",
  ]);
  await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
  await page.waitForTimeout(2000);
  await page.locator("#B1474049947713159").click();
  await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
  await page.waitForTimeout(2000);
}

async function openAiAgentDetails(page, appId, agentName = "SCM Procurement Agent") {
  await loginIfNeeded(page);
  await withTargetPath(page, `app-builder/home?fb_flow_id=${appId}&f4000_p1_flow=${appId}&clear=RP`);
  await clickFirstVisible(page, [
    "a:has-text('Shared Components')",
    "button:has-text('Shared Components')",
  ]);
  await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
  await page.waitForTimeout(2000);
  await clickFirstVisible(page, [
    "a:has-text('Generative AI Agents')",
    "a:has-text('AI Agents')",
    "button:has-text('Generative AI Agents')",
    "button:has-text('AI Agents')",
  ]);
  await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
  await page.waitForTimeout(2000);
  await page.getByRole("link", { name: agentName, exact: true }).first().click();
  await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
  await page.waitForTimeout(2500);
}

async function fillAiAgentForm(page, {
  name = "SCM Procurement Agent",
  serviceLabel = "OCI Gen AI",
  systemPrompt = `You are a procurement assistant for the SCM Warehouse Console application.
Your role is to:
- Identify items at risk in the current user's warehouse
- Explain the severity of the risk using available stock, reorder policy, alert priority, and lead time
- Find suppliers who have previously supplied the selected item
- Compare supplier performance before recommending a supplier
- Collect the warehouse, quantity, and due date needed for a purchase order
- Execute actions only after the user confirms

Always prioritise:
- CRITICAL and HIGH stock-risk items
- Items at or below reorder point
- Items with open replenishment alerts and short or threatened lead time
- Supplier recommendations with stronger on-time and quality performance

When the user asks to raise a purchase order:
- Call show_warehouses_by_supplier and ask the user to choose the warehouse
- Ask how many units are needed
- Ask when delivery is required
- Call confirm_action before raise_purchase_order
- Do not invent supplier, warehouse, quantity, or due date
- Use full_name from get_user_context as the PO owner`,
  welcomeMessage = "Hi, I'm your Procurement Agent. Ask me which stocks are at risk, or ask me to find suppliers and raise a purchase order.",
} = {}) {
  await page.locator("#P3504_NAME").fill(name);

  const service = page.locator("#P3504_REMOTE_SERVER_ID");
  if (await service.count()) {
    const options = await service.locator("option").evaluateAll((els) =>
      els.map((el) => ({ label: (el.textContent || "").trim(), value: el.getAttribute("value") || "" })),
    );
    const target = options.find((option) => option.label === serviceLabel);
    if (target) {
      await service.selectOption(target.value);
    }
  }

  await page.locator("textarea[aria-label='System Prompt']").fill(systemPrompt);
  await page.locator("textarea[aria-label='Welcome Message']").fill(welcomeMessage);
  await page.waitForTimeout(1000);
}

async function runShowAiAgentForm() {
  const appId = args[1];
  const outFile = args[2];
  if (!appId || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs show-ai-agent-form <app-id> <output-file>");
  }
  const { browser, page } = await launch();
  try {
    await openAiAgentCreate(page, appId);
    await fillAiAgentForm(page);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runShowAiAgentTools() {
  const appId = args[1];
  const outFile = args[2];
  if (!appId || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs show-ai-agent-tools <app-id> <output-file>");
  }
  const { browser, page } = await launch();
  try {
    await openAiAgentDetails(page, appId);
    const addTool = page.getByRole("button", { name: "Add Tool", exact: true }).first();
    await addTool.scrollIntoViewIfNeeded();
    await page.waitForTimeout(1000);
    await page.mouse.wheel(0, -350);
    await page.waitForTimeout(1000);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runDeleteAiTool() {
  const appId = args[1];
  const toolName = args[2];
  if (!appId || !toolName) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs delete-ai-tool <app-id> <tool-name>");
  }
  const { browser, page } = await launch();
  try {
    await openAiAgentDetails(page, appId);
    await page.getByRole("link", { name: toolName, exact: true }).first().click();
    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(2000);
    await page.getByRole("button", { name: "Delete", exact: true }).first().click();
    await page.waitForTimeout(1000);
    const confirm = page.locator(".ui-dialog:visible .ui-dialog-buttonpane button").filter({ hasText: /delete|ok|yes/i }).first();
    if (await confirm.count()) {
      await confirm.click();
    } else {
      await page.keyboard.press("Enter").catch(() => {});
    }
    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(3000);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runInspectAiToolParameterGrid() {
  const appId = args[1];
  if (!appId) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs inspect-ai-tool-parameter-grid <app-id>");
  }
  const { browser, page } = await launch();
  try {
    await openAiToolCreate(page, appId);
    const result = await page.evaluate(() => {
      const igRoot = document.querySelector("#parameters-ig_ig");
      const igText = igRoot ? (igRoot.textContent || "").replace(/\s+/g, " ").trim().slice(0, 300) : "";
      const region = window.apex?.region?.("parameters-ig");
      let columns = [];
      let modelFields = [];

      if (region) {
        const widget = region.widget();
        const gridView = widget?.interactiveGrid?.("getViews", "grid");
        const grid = gridView?.view$?.grid?.("getColumns");
        const model = gridView?.model;
        columns = Array.isArray(grid)
          ? grid.map((col) => ({
              property: col.property,
              heading: col.heading,
              elementId: col.elementId,
            }))
          : [];
        modelFields = model?.getOption?.("fields") || [];
      }

      return {
        regionId: "parameters-ig",
        igText,
        columns,
        modelFields,
      };
    });
    console.log(JSON.stringify(result, null, 2));
  } finally {
    await browser.close();
  }
}

async function runCreateAiAgent() {
  const appId = args[1];
  const outFile = args[2];
  if (!appId || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs create-ai-agent <app-id> <output-file>");
  }
  const { browser, page } = await launch();
  try {
    await openAiAgentCreate(page, appId);
    await fillAiAgentForm(page);
    await page.locator("#B2602403377975816").click();
    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(3000);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runInspectAiToolDialog() {
  const appId = args[1];
  if (!appId) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs inspect-ai-tool-dialog <app-id>");
  }
  const { browser, page } = await launch();
  try {
    await openAiAgentDetails(page, appId);
    await page.locator("#B4196921258515421").click();
    await page.waitForTimeout(2500);

    const frames = page.frames().map((frame) => ({
      url: frame.url(),
      name: frame.name(),
    }));

    const controls = await page.locator("input, textarea, select, button, a").evaluateAll((els) =>
      els
        .map((el) => ({
          tag: el.tagName,
          id: el.id || "",
          name: el.getAttribute("name") || "",
          type: el.getAttribute("type") || "",
          text: (el.textContent || "").trim().replace(/\s+/g, " ").slice(0, 160),
          value:
            "value" in el && typeof el.value === "string"
              ? el.value.slice(0, 160)
              : "",
          placeholder: el.getAttribute("placeholder") || "",
          href: el.getAttribute("href") || "",
          aria: el.getAttribute("aria-label") || "",
          visible: !!(el.offsetWidth || el.offsetHeight || el.getClientRects().length),
        }))
        .filter((el) => el.visible),
    );

    console.log(JSON.stringify({
      title: await page.title(),
      url: page.url(),
      frames,
      controls,
    }, null, 2));
  } finally {
    await browser.close();
  }
}

async function runInspectAiToolType() {
  const appId = args[1];
  const typeLabel = args[2];
  if (!appId || !typeLabel) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs inspect-ai-tool-type <app-id> <type-label>");
  }
  const { browser, page } = await launch();
  try {
    await openAiAgentDetails(page, appId);
    await page.locator("#B4196921258515421").click();
    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(2500);
    await page.locator("#P3510_TYPE").selectOption({ label: typeLabel });
    await page.waitForTimeout(2500);

    const controls = await page.locator("input, textarea, select, button, a").evaluateAll((els) =>
      els
        .map((el) => ({
          tag: el.tagName,
          id: el.id || "",
          name: el.getAttribute("name") || "",
          type: el.getAttribute("type") || "",
          text: (el.textContent || "").trim().replace(/\s+/g, " ").slice(0, 160),
          value:
            "value" in el && typeof el.value === "string"
              ? el.value.slice(0, 160)
              : "",
          placeholder: el.getAttribute("placeholder") || "",
          href: el.getAttribute("href") || "",
          aria: el.getAttribute("aria-label") || "",
          visible: !!(el.offsetWidth || el.offsetHeight || el.getClientRects().length),
        }))
        .filter((el) => el.visible),
    );

    console.log(JSON.stringify({
      title: await page.title(),
      url: page.url(),
      controls,
    }, null, 2));
  } finally {
    await browser.close();
  }
}

async function openAiToolCreate(page, appId) {
  await openAiAgentDetails(page, appId);
  await page.locator("#B4196921258515421").click();
  await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
  await page.waitForTimeout(2500);
}

function getAiToolSpec(variant) {
  if (variant === "get_user_context") {
    return {
      name: "get_user_context",
      type: "Retrieve Data",
      executionPoint: "Augment System Prompt",
      description: "Returns the current user's full name, role, warehouse, approval authority level, and manager. Injected automatically on every message before any reasoning begins. Use full_name as the PO owner when raising purchase orders. Use warehouse_id as the default warehouse context.",
      parameters: [],
      editorLabel: "SQL Query",
      editorValue: `select u.full_name,
       u.email_address,
       r.role_name,
       r.role_scope_code,
       coalesce(a.authority_level_override,
                r.approval_authority_level)  as approval_authority_level,
       w.warehouse_name,
       w.warehouse_code,
       w.warehouse_id,
       mgr.full_name                         as manager_name,
       mgr.email_address                     as manager_email
  from scm_application_users     u
  join scm_user_role_assignments  a   on a.application_user_id  = u.application_user_id
                                     and a.assignment_status_code = 'ACTIVE'
                                     and a.is_primary_role        = true
  join scm_user_roles             r   on r.user_role_id          = a.user_role_id
  left join scm_warehouses        w   on w.warehouse_id          = u.default_warehouse_id
  left join scm_application_users mgr on mgr.application_user_id = u.manager_user_id
 where u.user_name = :APP_USER`,
    };
  }

  if (variant === "get_browser_timezone") {
    return {
      name: "get_browser_timezone",
      type: "Execute Client-side Code",
      executionPoint: "Augment System Prompt",
      description: "Returns the user's browser timezone such as Asia/Kolkata or Europe/London. Injected automatically on every message. Pass this as TIMEZONE when calling raise_purchase_order so due dates are set correctly for the user's location.",
      parameters: [],
      editorLabel: "Code",
      editorValue: "return Intl.DateTimeFormat().resolvedOptions().timeZone;",
    };
  }

  if (variant === "get_stocks_at_risk") {
    return {
      name: "get_stocks_at_risk",
      type: "Retrieve Data",
      executionPoint: "On Demand",
      description: "Returns items in the current user's warehouse that are at or below their reorder point, or have an open replenishment alert. Call this when the user asks about stock risk, low stock, or what needs attention. Returns item name, available quantity, reorder point, alert priority, and supplier lead time. Results are ordered by priority then by gap size.",
      parameters: [],
      editorLabel: "SQL Query",
      editorValue: `select i.item_id, i.item_code, i.item_name, i.base_uom_code, w.warehouse_name, nvl(bal.total_available,0) as available_quantity, p.reorder_point_quantity, p.safety_stock_quantity, p.reorder_target_quantity, p.replenishment_lead_time_days, ra.priority_code as alert_priority, ra.alert_type_code, ra.alert_number, round((systimestamp-ra.raised_at)*24) as hours_open from scm_item_warehouse_policies p join scm_items i on i.item_id=p.item_id join scm_warehouses w on w.warehouse_id=p.warehouse_id left join (select sl.warehouse_id, ib.item_id, sum(ib.quantity_available) as total_available from scm_inventory_balances ib join scm_storage_locations sl on sl.storage_location_id=ib.storage_location_id where ib.stock_status_code='AVAILABLE' group by sl.warehouse_id, ib.item_id) bal on bal.warehouse_id=p.warehouse_id and bal.item_id=p.item_id left join scm_replenishment_alerts ra on ra.item_id=p.item_id and ra.warehouse_id=p.warehouse_id and ra.alert_status_code in ('OPEN','IN_REVIEW') and ra.priority_code=(select decode(max(decode(ra2.priority_code,'CRITICAL',4,'HIGH',3,'MEDIUM',2,'LOW',1)),4,'CRITICAL',3,'HIGH',2,'MEDIUM',1,'LOW') from scm_replenishment_alerts ra2 where ra2.item_id=p.item_id and ra2.warehouse_id=p.warehouse_id and ra2.alert_status_code in ('OPEN','IN_REVIEW')) where p.warehouse_id=(select default_warehouse_id from scm_application_users where user_name=:APP_USER) and p.is_active=true and p.low_stock_alert_enabled_flag=true and (nvl(bal.total_available,0)<=nvl(p.reorder_point_quantity,0) or ra.alert_number is not null) order by decode(ra.priority_code,'CRITICAL',1,'HIGH',2,'MEDIUM',3,'LOW',4,5), nvl(p.reorder_point_quantity,0)-nvl(bal.total_available,0) desc`,
    };
  }

  if (variant === "get_suppliers_for_item") {
    return {
      name: "get_suppliers_for_item",
      type: "Retrieve Data",
      executionPoint: "On Demand",
      description: "Returns active suppliers who have previously supplied the given item. Pass item_id from get_stocks_at_risk. Shows supplier name, site, total receipts, on-time rate, damage rate, and last received date. Call this when the user picks an item and asks who can supply it. Results are ordered best performer first.",
      parameters: [
        { name: "ITEM_ID", description: "Selected item identifier.", type: "NUMBER", required: true },
      ],
      editorLabel: "SQL Query",
      editorValue: `select bp.business_partner_id as supplier_id, bp.partner_number, bp.partner_name as supplier_name, ps.partner_site_id, ps.site_code, ps.site_name, count(distinct ir.inbound_receipt_id) as total_receipts, max(ir.actual_arrival_at) as last_received_at, round(100 * avg(case when ir.actual_arrival_at is not null and ir.expected_arrival_at is not null and ir.actual_arrival_at <= ir.expected_arrival_at then 1 else 0 end), 1) as on_time_rate_pct, round(100 * sum(nvl(irl.damaged_quantity, 0)) / nullif(sum(nvl(irl.received_quantity, 0)), 0), 1) as damage_rate_pct from scm_business_partners bp join scm_partner_sites ps on ps.business_partner_id = bp.business_partner_id join scm_inbound_receipts ir on ir.source_partner_id = bp.business_partner_id and ir.receipt_source_code = 'SUPPLIER' join scm_inbound_receipt_lines irl on irl.inbound_receipt_id = ir.inbound_receipt_id and irl.item_id = :ITEM_ID where bp.partner_type_code = 'SUPPLIER' and bp.partner_status_code = 'ACTIVE' group by bp.business_partner_id, bp.partner_number, bp.partner_name, ps.partner_site_id, ps.site_code, ps.site_name order by on_time_rate_pct desc nulls last, damage_rate_pct asc nulls last`,
    };
  }

  if (variant === "get_supplier_delivery_performance") {
    return {
      name: "get_supplier_delivery_performance",
      type: "Retrieve Data",
      executionPoint: "On Demand",
      description: "Returns a detailed delivery performance scorecard for a supplier over a given period. Pass supplier_id from get_suppliers_for_item. Pass TIME_PERIOD as QUARTER for last quarter or YEAR for last 12 months. Call this when the user wants to check a supplier's track record before raising a purchase order. Returns on-time rate, average delay, dock-to-stock time, damage rate, and total volumes.",
      parameters: [
        { name: "SUPPLIER_ID", description: "Selected supplier identifier.", type: "NUMBER", required: true },
        { name: "TIME_PERIOD", description: "Reporting horizon such as QUARTER or YEAR.", type: "VARCHAR2", required: true },
      ],
      editorLabel: "SQL Query",
      editorValue: `select bp.partner_name as supplier_name, count(distinct ir.inbound_receipt_id) as receipt_count, round(100 * avg(case when ir.actual_arrival_at is not null and ir.expected_arrival_at is not null and ir.actual_arrival_at <= ir.expected_arrival_at then 1 else 0 end), 1) as on_time_rate_pct, round(avg(case when ir.actual_arrival_at is not null and ir.expected_arrival_at is not null and ir.actual_arrival_at > ir.expected_arrival_at then (cast(ir.actual_arrival_at as date) - cast(ir.expected_arrival_at as date)) * 24 end), 1) as avg_delay_hours, round(avg(case when ir.actual_arrival_at is not null and ir.receiving_completed_at is not null then (cast(ir.receiving_completed_at as date) - cast(ir.actual_arrival_at as date)) * 24 end), 1) as avg_dock_to_stock_hours, sum(nvl(irl.received_quantity,0)) as total_received, sum(nvl(irl.damaged_quantity,0)) as total_damaged, sum(nvl(irl.shortage_quantity,0)) as total_shortage, sum(nvl(irl.rejected_quantity,0)) as total_rejected, round(100 * sum(nvl(irl.damaged_quantity,0)) / nullif(sum(nvl(irl.received_quantity,0)), 0), 1) as damage_rate_pct from scm_business_partners bp join scm_inbound_receipts ir on ir.source_partner_id = bp.business_partner_id and ir.receipt_source_code = 'SUPPLIER' join scm_inbound_receipt_lines irl on irl.inbound_receipt_id = ir.inbound_receipt_id where bp.business_partner_id = :SUPPLIER_ID and ir.actual_arrival_at >= case :TIME_PERIOD when 'QUARTER' then add_months(trunc(sysdate,'Q'), -3) when 'YEAR' then add_months(trunc(sysdate,'YYYY'), -12) else add_months(sysdate, -3) end and ir.actual_arrival_at < sysdate group by bp.business_partner_id, bp.partner_name`,
    };
  }

  if (variant === "show_warehouses_by_supplier") {
    return {
      name: "show_warehouses_by_supplier",
      type: "Retrieve Data",
      executionPoint: "On Demand",
      description: "Returns the list of active warehouses that the given supplier has previously delivered to. Call this when the user asks to raise a purchase order, before calling raise_purchase_order. Present the warehouse list to the user and ask them to choose which warehouse the delivery should go to. Do not choose a warehouse yourself. Wait for the user to confirm their selection, then use their chosen warehouse_id as WH_ID in raise_purchase_order.",
      parameters: [
        { name: "SUPPLIER_ID", description: "Selected supplier identifier.", type: "NUMBER", required: true },
      ],
      editorLabel: "SQL Query",
      editorValue: `select w.warehouse_id, w.warehouse_code, w.warehouse_name, w.warehouse_type_code, count(ir.inbound_receipt_id) as total_deliveries, max(ir.actual_arrival_at) as last_delivered_at from scm_warehouses w join scm_inbound_receipts ir on ir.warehouse_id = w.warehouse_id and ir.source_partner_id = :SUPPLIER_ID and ir.receipt_source_code = 'SUPPLIER' where w.warehouse_status_code = 'ACTIVE' group by w.warehouse_id, w.warehouse_code, w.warehouse_name, w.warehouse_type_code order by total_deliveries desc, last_delivered_at desc`,
    };
  }

  if (variant === "confirm_action") {
    return {
      name: "confirm_action",
      type: "Execute Client-side Code",
      executionPoint: "On Demand",
      description: "Shows a browser confirmation dialog with the provided MESSAGE. Returns \"confirmed\" if the user clicks OK, or \"denied\" if they cancel. Always call this before raise_purchase_order. Build MESSAGE as a plain-English summary of the full order: item name, quantity, supplier name, warehouse name, due date, and PO owner. If the return value is \"denied\", stop and report back to the user.",
      parameters: [
        { name: "MESSAGE", description: "Confirmation text displayed to the user.", type: "VARCHAR2", required: true },
      ],
      editorLabel: "Code",
      editorValue: `return new Promise(resolve => { apex.message.confirm(this.data.MESSAGE, okPressed => { resolve(okPressed ? "confirmed" : "denied"); }); });`,
    };
  }

  if (variant === "raise_purchase_order") {
    return {
      name: "raise_purchase_order",
      type: "Execute Server-side Code",
      executionPoint: "On Demand",
      description: "Creates a planned purchase order as a PLANNED inbound receipt for the given item and supplier. Before calling this tool you must complete these steps in order: 1. Call show_warehouses_by_supplier and ask the user to pick a warehouse. Use their answer as WH_ID. 2. Ask how many units they need. Use their answer as QUANTITY. 3. Ask when they need delivery by. Use their answer as DUE_DATE in YYYY-MM-DD format. 4. Call confirm_action with a plain-English summary and wait for \"confirmed\". Only call this tool after confirm_action returns \"confirmed\". Use full_name from get_user_context as the PO owner.",
      parameters: [
        { name: "ITEM_ID", description: "Selected item identifier.", type: "NUMBER", required: true },
        { name: "SUPPLIER_ID", description: "Selected supplier identifier.", type: "NUMBER", required: true },
        { name: "WH_ID", description: "Chosen warehouse identifier.", type: "NUMBER", required: true },
        { name: "QUANTITY", description: "Requested purchase quantity.", type: "NUMBER", required: true },
        { name: "DUE_DATE", description: "Required delivery date in YYYY-MM-DD format.", type: "VARCHAR2", required: true },
        { name: "TIMEZONE", description: "Browser timezone value for due-date conversion.", type: "VARCHAR2", required: true },
      ],
      editorLabel: "PL/SQL Code",
      editorValue: `declare v_receipt_number varchar2(30); v_receipt_id number; v_user_id number; v_item_name varchar2(200); v_uom varchar2(10); v_supplier_name varchar2(200); v_warehouse_name varchar2(200); v_seq number; v_due timestamp with time zone; begin select application_user_id into v_user_id from scm_application_users where user_name = :APP_USER; select item_name, base_uom_code into v_item_name, v_uom from scm_items where item_id = :ITEM_ID; select partner_name into v_supplier_name from scm_business_partners where business_partner_id = :SUPPLIER_ID; select warehouse_name into v_warehouse_name from scm_warehouses where warehouse_id = :WH_ID; select nvl(max(to_number(regexp_substr(receipt_number,'\\d+$'))), 0) + 1 into v_seq from scm_inbound_receipts where receipt_number like 'POR-%'; v_receipt_number := 'POR-' || lpad(v_seq, 6, '0'); v_due := to_timestamp_tz(:DUE_DATE || ' 17:00:00 ' || :TIMEZONE, 'YYYY-MM-DD HH24:MI:SS TZR'); insert into scm_inbound_receipts (receipt_number, receipt_source_code, warehouse_id, source_partner_id, receipt_status_code, expected_arrival_at, received_by) values (v_receipt_number, 'SUPPLIER', :WH_ID, :SUPPLIER_ID, 'PLANNED', v_due, :APP_USER) returning inbound_receipt_id into v_receipt_id; insert into scm_inbound_receipt_lines (inbound_receipt_id, line_number, item_id, expected_quantity, received_quantity, accepted_quantity, quarantine_quantity, damaged_quantity, shortage_quantity, overage_quantity, rejected_quantity, line_status_code) values (v_receipt_id, 1, :ITEM_ID, :QUANTITY, 0, 0, 0, 0, 0, 0, 0, 'OPEN'); update scm_replenishment_alerts set alert_status_code = 'ACTIONED', reviewed_at = systimestamp, reviewed_by_user_id = v_user_id where item_id = :ITEM_ID and warehouse_id = :WH_ID and alert_status_code in ('OPEN', 'IN_REVIEW'); apex_ai.set_tool_result(p_result => 'Purchase order ' || v_receipt_number || ' raised for ' || v_item_name || ' - ' || :QUANTITY || ' ' || v_uom || ' from ' || v_supplier_name || ' to ' || v_warehouse_name || '. Expected delivery ' || to_char(v_due, 'DD-Mon-YYYY') || '.', p_notification_message => v_receipt_number || ' raised successfully', p_notification_type => 'success'); end;`,
    };
  }

  throw new Error(`Unknown AI tool variant: ${variant}`);
}

async function fillFieldValue(locator, value) {
  if (!(await locator.count())) {
    return;
  }
  if (await locator.isVisible().catch(() => false)) {
    await locator.fill(value);
  } else {
    await locator.evaluate((el, nextValue) => {
      el.value = nextValue;
      el.dispatchEvent(new Event("input", { bubbles: true }));
      el.dispatchEvent(new Event("change", { bubbles: true }));
    }, value);
  }
}

async function setEditorValue(page, label, value) {
  const candidates = [
    `textarea[aria-label='${label}']`,
    `textarea[aria-label='${label.replace(/'/g, "\\'")}']`,
  ];
  for (const selector of candidates) {
    const locator = page.locator(selector).first();
    if (await locator.count()) {
      await fillFieldValue(locator, value);
      return;
    }
  }
  throw new Error(`Editor not found for label: ${label}`);
}

async function fillAiToolParameters(page, parameters) {
  if (!parameters.length) {
    return;
  }

  const region = page.locator("#parameters");
  await region.scrollIntoViewIfNeeded();
  await page.waitForTimeout(500);

  for (let i = 0; i < parameters.length; i += 1) {
    await region.getByRole("button", { name: "Add Parameter", exact: true }).click();
    await page.waitForTimeout(900);
    await page.evaluate((parameter) => {
      const region = window.apex.region("parameters-ig");
      const view = region.widget().interactiveGrid("getViews", "grid");
      const model = view.model;
      const selected = view.getSelectedRecords();
      const record = selected[selected.length - 1];

      model.setValue(record, "PARAM_NAME", parameter.name);
      model.setValue(record, "DESCRIPTION", parameter.description || "");
      model.setValue(record, "DATA_TYPE", { v: parameter.type, d: parameter.type });
      model.setValue(record, "IS_REQUIRED", parameter.required ? { v: "Y", d: "Yes" } : { v: "N", d: "No" });
      model.setValue(record, "ALLOWED_VALUES", parameter.allowedValues || "");
    }, parameters[i]);
    await page.waitForTimeout(700);
  }

  await page.waitForTimeout(800);
}

async function fillAiToolForm(page, variant) {
  const spec = getAiToolSpec(variant);

  const showAll = page.getByRole("link", { name: "Show All", exact: true }).first();
  if (await showAll.isVisible({ timeout: 1000 }).catch(() => false)) {
    await showAll.click().catch(() => {});
    await page.waitForTimeout(500);
  }

  await page.locator("#P3510_NAME").fill(spec.name);
  await page.locator("#P3510_TYPE").selectOption({ label: spec.type });
  await page.waitForTimeout(1000);
  const executionPoint = page.locator("#P3510_EXECUTION_POINT");
  const executionDisabled = await executionPoint.evaluate((el) => el.disabled).catch(() => false);
  if (!executionDisabled) {
    await executionPoint.selectOption({ label: spec.executionPoint });
  }
  await fillFieldValue(page.locator("#P3510_EXTRA_DESCRIPTION").first(), spec.description);
  await fillAiToolParameters(page, spec.parameters);
  await setEditorValue(page, spec.editorLabel, spec.editorValue);

  await page.waitForTimeout(1000);
}

async function runShowAiToolForm() {
  const appId = args[1];
  const variant = args[2];
  const outFile = args[3];
  if (!appId || !variant || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs show-ai-tool-form <app-id> <variant> <output-file>");
  }
  const { browser, page } = await launch();
  try {
    await openAiToolCreate(page, appId);
    await fillAiToolForm(page, variant);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runShowAiToolFormView() {
  const appId = args[1];
  const variant = args[2];
  const view = args[3];
  const outFile = args[4];
  if (!appId || !variant || !view || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs show-ai-tool-form-view <app-id> <variant> <view> <output-file>");
  }
  const { browser, page } = await launch();
  try {
    await openAiToolCreate(page, appId);
    await fillAiToolForm(page, variant);

    if (view === "top") {
      await page.evaluate(() => window.scrollTo(0, 0));
    } else if (view === "parameters") {
      const target = page.locator("#parameters").first();
      if (await target.count()) {
        await target.scrollIntoViewIfNeeded();
      }
    } else if (view === "sql") {
      const target = page.locator("textarea[aria-label='SQL Query']").first();
      if (await target.count()) {
        await target.scrollIntoViewIfNeeded();
      }
    } else if (view === "code") {
      const target = page.locator("textarea[aria-label='Code']").first();
      if (await target.count()) {
        await target.scrollIntoViewIfNeeded();
      }
    } else {
      throw new Error(`Unknown AI tool form view: ${view}`);
    }

    await page.waitForTimeout(1200);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function runCreateAiTool() {
  const appId = args[1];
  const variant = args[2];
  const outFile = args[3];
  if (!appId || !variant || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs create-ai-tool <app-id> <variant> <output-file>");
  }
  const { browser, page } = await launch();
  try {
    await openAiToolCreate(page, appId);
    await fillAiToolForm(page, variant);
    await page.locator("#B4169588554479423").click();
    await page.waitForLoadState("domcontentloaded", { timeout: 120000 }).catch(() => {});
    await page.waitForTimeout(3000);
    await screenshot(page, outFile, false);
    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

async function openPageDesigner(page, appId, pageId = "1") {
  await loginIfNeeded(page);
  await withTargetPath(page, `app-builder/page-designer?fb_flow_id=${appId}&fb_flow_page_id=${pageId}`);
  await page.waitForTimeout(2500);
}

async function runLab4Task1Step() {
  const appId = args[1];
  const step = args[2];
  const outFile = args[3];
  if (!appId || !step || !outFile) {
    throw new Error("Usage: node scm-ai-agents/scripts/scm_capture.mjs lab4-task1-step <app-id> <step> <output-file>");
  }
  const { browser, page } = await launch();
  try {
    const BUTTON_LABEL = "Procurement Assistant";
    const BUTTON_NAME = "PROCUREMENT_ASSISTANT";

    if (step === "agent-page") {
      await openAiAgentDetails(page, appId);
      await screenshot(page, outFile, false);
      await dumpProbe(page);
      return;
    }

    await openPageDesigner(page, appId, "1");

    const firstVisibleTreeLabel = async (pattern) => {
      const labels = page.locator(".a-TreeView-label");
      const count = await labels.count();
      for (let i = 0; i < count; i += 1) {
        const label = labels.nth(i);
        const text = ((await label.textContent().catch(() => "")) || "").trim();
        const matches =
          pattern instanceof RegExp ? pattern.test(text) : text === pattern;
        if (matches && (await label.isVisible().catch(() => false))) {
          return label;
        }
      }
      throw new Error(`Could not find visible tree label matching ${pattern.toString()}`);
    };

    const visibleTreeLabels = async (pattern) => {
      const matches = [];
      const labels = page.locator(".a-TreeView-label");
      const count = await labels.count();
      for (let i = 0; i < count; i += 1) {
        const label = labels.nth(i);
        const text = ((await label.textContent().catch(() => "")) || "").trim();
        const isMatch =
          pattern instanceof RegExp ? pattern.test(text) : text === pattern;
        if (isMatch && (await label.isVisible().catch(() => false))) {
          matches.push(label);
        }
      }
      return matches;
    };

    const openBreadcrumbContext = async () => {
      await (await firstVisibleTreeLabel(/^Breadcrumb$/)).click({ button: "right" });
      await page.waitForTimeout(1200);
    };

    const deleteCurrentSelection = async () => {
      await clickFirstVisible(page, [
        "#PDrenderingTreeMenu_68i",
        "button:has-text('Delete')",
        "text=Delete",
      ]).catch(() => false);
      await page.waitForTimeout(1200);
      await clickFirstVisible(page, [
        "button:has-text('Delete')",
        "button:has-text('OK')",
        ".ui-dialog-buttonpane button:has-text('Delete')",
        ".ui-dialog-buttonpane button:has-text('OK')",
        "[role='dialog'] button:has-text('Delete')",
        "[role='dialog'] button:has-text('OK')",
        "text=OK",
      ]).catch(() => false);
      await page.waitForTimeout(1800);
    };

    const resetTask1FreshState = async () => {
      const existingButton = await firstVisibleTreeLabel(/^(New|Procurement Assistant|PROCUREMENT_ASSISTANT)$/).catch(() => null);
      if (!existingButton) {
        return;
      }
      await existingButton.click({ button: "right" });
      await page.waitForTimeout(1200);
      await deleteCurrentSelection();
      const saveButton = page.locator("#button-save-page");
      if (await saveButton.isVisible({ timeout: 1000 }).catch(() => false)) {
        await saveButton.click();
        await page.waitForTimeout(2500);
      }
      await openPageDesigner(page, appId, "1");
    };

    const createNewButton = async () => {
      const existingButton = await firstVisibleTreeLabel(/^(New|Procurement Assistant|PROCUREMENT_ASSISTANT)$/).catch(() => null);
      if (existingButton) {
        await existingButton.click();
        await page.waitForTimeout(1000);
        await page.keyboard.press("ArrowRight").catch(() => {});
        await page.waitForTimeout(500);
      } else {
        await openBreadcrumbContext();
        await clickFirstVisible(page, [
          "button:has-text('Create Button Below')",
          "text=Create Button Below",
        ]);
        await page.waitForTimeout(1800);
      }
      const buttonName = page.locator("#peMain_1").first();
      if (await buttonName.count()) {
        await setInputValue(buttonName, BUTTON_NAME).catch(() => {});
        await page.waitForTimeout(300);
      }
      const buttonLabel = page.locator("#peMain_2").first();
      if (await buttonLabel.count()) {
        await setInputValue(buttonLabel, BUTTON_LABEL).catch(() => {});
        await page.waitForTimeout(300);
      }
      const region = page.locator("#peMain_4").first();
      if (await region.count()) {
        await region.selectOption({ label: "Breadcrumb" }).catch(() => {});
        await page.waitForTimeout(500);
      }
      const slot = page.locator("#peMain_5").first();
      if (await slot.count()) {
        await slot.selectOption({ label: "Next" }).catch(() => {});
        await page.waitForTimeout(700);
      }
      await page.keyboard.press("ArrowRight").catch(() => {});
      await page.waitForTimeout(500);
    };

    const openNewButtonContext = async () => {
      await createNewButton();
      await (await firstVisibleTreeLabel(/^(New|Procurement Assistant|PROCUREMENT_ASSISTANT)$/)).click({ button: "right" });
      await page.waitForTimeout(1200);
    };

    const createTriggerAction = async () => {
      await createNewButton();
      const existingTrigger = await firstVisibleTreeLabel(/^Show AI Assistant$/).catch(() => null);
      if (existingTrigger) {
        await existingTrigger.click();
        await page.waitForTimeout(1200);
        return;
      }
      await openNewButtonContext();
      await clickFirstVisible(page, [
        "button:has-text('Create Trigger Action')",
        "text=Create Trigger Action",
      ]);
      await page.waitForTimeout(2000);
    };

    const dedupeTriggerActions = async () => {
      await createNewButton();
      let triggers = await visibleTreeLabels(/^Show AI Assistant$/);
      while (triggers.length > 1) {
        const target = triggers[triggers.length - 1];
        await target.click({ button: "right" });
        await page.waitForTimeout(1200);
        await deleteCurrentSelection();
        triggers = await visibleTreeLabels(/^Show AI Assistant$/);
      }
      if (triggers.length === 1) {
        await triggers[0].click();
        await page.waitForTimeout(800);
      }
    };

    const configureShowAiAssistant = async () => {
      await createTriggerAction();
      const action = page.locator("#peMain_2").first();
      if (await action.count()) {
        await action.selectOption({ label: "Show AI Assistant" }).catch(() => {});
        await page.waitForTimeout(800);
      }
      const agent = page.locator("#peMain_17").first();
      if (await agent.count()) {
        await agent.selectOption({ label: "SCM Procurement Agent" }).catch(() => {});
        await page.waitForTimeout(500);
      }
      const quickMessage = page.locator("#peMain_26").first();
      if (await quickMessage.count()) {
        await setInputValue(quickMessage, "What stocks are at risk?").catch(() => {});
        await page.waitForTimeout(500);
      }
    };

    const freshCaptureSteps = new Set([
      "page-designer",
      "breadcrumb-context",
      "button-created",
      "button-configured",
      "new-button-context",
      "trigger-created",
      "show-ai-assistant-configured",
      "saved",
    ]);

    if (freshCaptureSteps.has(step)) {
      await resetTask1FreshState();
    }

    if (step === "page-designer") {
      await screenshot(page, outFile, false);
    } else if (step === "breadcrumb-context") {
      await openBreadcrumbContext();
      await screenshot(page, outFile, false);
    } else if (step === "button-created" || step === "button-configured") {
      await createNewButton();
      await screenshot(page, outFile, false);
    } else if (step === "new-button-context") {
      await createNewButton();
      await openNewButtonContext();
      await screenshot(page, outFile, false);
    } else if (step === "trigger-created") {
      await createTriggerAction();
      await screenshot(page, outFile, false);
    } else if (step === "show-ai-assistant-configured") {
      await dedupeTriggerActions();
      await configureShowAiAssistant();
      await screenshot(page, outFile, false);
    } else if (step === "saved") {
      await dedupeTriggerActions();
      await configureShowAiAssistant();
      await page.locator("#button-save-page").click();
      await page.waitForTimeout(2500);
      await screenshot(page, outFile, false);
    } else if (step === "cleanup-trigger-actions") {
      await dedupeTriggerActions();
      await page.locator("#button-save-page").click();
      await page.waitForTimeout(2500);
      await screenshot(page, outFile, false);
    } else if (step === "duplicate-trigger-context") {
      await createNewButton();
      const triggers = await visibleTreeLabels(/^Show AI Assistant$/);
      const target = triggers[triggers.length - 1];
      await target.click({ button: "right" });
      await page.waitForTimeout(1500);
      await screenshot(page, outFile, false);
    } else if (step === "duplicate-trigger-delete-prompt") {
      await createNewButton();
      const triggers = await visibleTreeLabels(/^Show AI Assistant$/);
      const target = triggers[triggers.length - 1];
      await target.click({ button: "right" });
      await page.waitForTimeout(1200);
      await page.locator("#PDrenderingTreeMenu_68i").click();
      await page.waitForTimeout(1500);
      await screenshot(page, outFile, false);
    } else if (step === "trigger-inspect") {
      await configureShowAiAssistant();
      const controls = await page.locator("input, select, textarea, button").evaluateAll((els) =>
        els
          .filter((el) => !!(el.offsetWidth || el.offsetHeight || el.getClientRects().length))
          .map((el) => ({
            tag: el.tagName,
            id: el.id || "",
            text: (el.textContent || "").trim().replace(/\s+/g, " ").slice(0, 120),
            value: "value" in el && typeof el.value === "string" ? el.value.slice(0, 200) : "",
            aria: el.getAttribute("aria-label") || "",
          })),
      );
      console.log(JSON.stringify(controls, null, 2));
      return;
    } else if (step === "button-inspect") {
      await createNewButton();
      const controls = await page.locator("input, select, textarea, button").evaluateAll((els) =>
        els
          .filter((el) => !!(el.offsetWidth || el.offsetHeight || el.getClientRects().length))
          .map((el) => ({
            tag: el.tagName,
            id: el.id || "",
            text: (el.textContent || "").trim().replace(/\s+/g, " ").slice(0, 120),
            value: "value" in el && typeof el.value === "string" ? el.value.slice(0, 200) : "",
            aria: el.getAttribute("aria-label") || "",
          })),
      );
      console.log(JSON.stringify(controls, null, 2));
      return;
    } else {
      throw new Error(`Unknown lab4 task1 step: ${step}`);
    }

    await dumpProbe(page);
  } finally {
    await browser.close();
  }
}

if (command === "probe") {
  await runProbe();
} else if (command === "shot") {
  await runShot();
} else if (command === "open") {
  await runOpen();
} else if (command === "inspect") {
  await runInspect();
} else if (command === "sql-file") {
  await runSqlFile();
} else if (command === "import-script") {
  await runImportScript();
} else if (command === "click") {
  await runClick();
} else if (command === "click-inspect") {
  await runClickInspect();
} else if (command === "click-frames") {
  await runClickFrames();
} else if (command === "upload-frame-inspect") {
  await runUploadFrameInspect();
} else if (command === "show-upload-script") {
  await runShowUploadScript();
} else if (command === "upload-script") {
  await runUploadScript();
} else if (command === "run-uploaded-script") {
  await runUploadedScript();
} else if (command === "create-quick-app") {
  await runCreateQuickApp();
} else if (command === "show-import-app") {
  await runShowImportApp();
} else if (command === "import-app") {
  await runImportApp();
} else if (command === "create-agent") {
  await runCreateAgent();
} else if (command === "delete-uploaded-scripts") {
  await runDeleteUploadedScripts();
} else if (command === "show-genai-service-form") {
  await runShowGenAiServiceForm();
} else if (command === "create-genai-service") {
  await runCreateGenAiService();
} else if (command === "delete-genai-service") {
  await runDeleteGenAiService();
} else if (command === "set-app-ai-service") {
  await runSetAppAiService();
} else if (command === "show-ai-agent-form") {
  await runShowAiAgentForm();
} else if (command === "show-ai-agent-tools") {
  await runShowAiAgentTools();
} else if (command === "delete-ai-tool") {
  await runDeleteAiTool();
} else if (command === "inspect-ai-tool-parameter-grid") {
  await runInspectAiToolParameterGrid();
} else if (command === "create-ai-agent") {
  await runCreateAiAgent();
} else if (command === "inspect-ai-tool-dialog") {
  await runInspectAiToolDialog();
} else if (command === "inspect-ai-tool-type") {
  await runInspectAiToolType();
} else if (command === "show-ai-tool-form") {
  await runShowAiToolForm();
} else if (command === "show-ai-tool-form-view") {
  await runShowAiToolFormView();
} else if (command === "create-ai-tool") {
  await runCreateAiTool();
} else if (command === "lab4-task1-step") {
  await runLab4Task1Step();
} else {
  throw new Error(`Unknown command: ${command}`);
}
