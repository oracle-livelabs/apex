# Introduction

## About This Workshop

Interactive Reports in Oracle APEX already give end users a rich set of capabilities, including filtering, sorting, control breaks, highlighting, aggregations, charts, groupings, and pivots. These features are powerful and well established, but configuring them traditionally requires moving through multiple menus, dialogs, and report settings. In practice, that means some capabilities are not used as often as they could be because they take time to discover and apply.

APEX **AI Interactive Reports** changes that experience. Instead of manually configuring a report, users can ask a question in plain language and let APEX translate that request into the right report actions. Based on the intent of the prompt, APEX can apply filters, sorting, pivots, aggregates, groupings, and column selections automatically. Each AI-generated configuration is shown as a visible chip, making the result transparent, reviewable, and easy to refine.

This workshop shows how to use that capability with SCM data. Using a Supply Chain Management application and a replenishment-focused view, you will configure AI support, create an Interactive Report on `SCM_NL2IR_REPLENISHMENT_V`, add report-level and column-level context, and use both Search with AI and the chat assistant to analyze replenishment activity in natural language.

The workshop is designed for beginner users, database developers, platform engineers, and executives who want to understand how AI Interactive Reports can make SCM analytics faster, more accessible, and easier to adopt without losing visibility into how the report was configured.

Estimated Workshop Time: 1 hour 15 minutes

### Objectives

In this workshop you will:
* Download and run the SCM data model and sample data load scripts.
* Create and review the Supply Chain Management application and baseline report.
* Configure an AI provider, credential, model, and connection for APEX.
* Create an Interactive Report using the `SCM_NL2IR_REPLENISHMENT_V` view.
* Enable natural language support for the report and add SCM report context.
* Configure column-level AI metadata for key SCM report columns.
* Use Search with AI and the chat assistant to analyze replenishment alerts.

### Prerequisites

This workshop assumes you have:
* Access to an Oracle APEX tenancy workspace.
* Permission to create credentials, shared components, views, and pages.
* The SCM sample application and SCM sample data available in the workspace or database.

## Lab Modules

| # | Module | Est. Time |
| --- | --- | --- |
| 1 | Create a Supply Chain Management Application | 10 minutes |
| 2 | Configure an AI Service | 10 minutes |
| 3 | Create an Interactive Report Using Natural Language | 15 minutes |
| 4 | Configure Column-Level AI Attributes | 10 minutes |
| 5 | Use Search with AI | 10 minutes |
| 6 | Use the Interactive Report Chat Assistant | 20 minutes |

## Acknowledgements
* **Author** - Ankita Beri, Senior Product Manager
* **Last Updated By/Date** - Ankita Beri, April 20, 2026
