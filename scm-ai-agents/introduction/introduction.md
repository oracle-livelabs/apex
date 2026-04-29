# Introduction

## About this Workshop

Managing warehouse operations manually takes time that warehouse teams do not always have. When stock is running low, inbound work is pending, outbound orders need attention, or an adjustment requires approval, a warehouse manager needs answers fast.

AI Agents in Oracle APEX give your application the ability to reason through these questions and act on the answers. Instead of navigating multiple reports and forms, a user can open a chat panel and have a guided conversation. The agent understands who the user is, retrieves the right warehouse data, asks for confirmation, and creates a controlled stock adjustment, all without leaving the application.

In this hands-on workshop, you will build a **Warehouse Operations Agent** for the **APEX Inventory and Warehouse Management** application. You will define tools that allow warehouse managers to identify low-stock items, review location balances, inspect inbound and outbound work, and create confirmed stock adjustments, all from within a conversational chat interface in Oracle APEX.

You will define eight tools using the three tool types available in APEX AI Agents: **Retrieve Data**, **Execute Server-side Code**, and **Execute Client-side Code**. You will also learn when to use each one, keeping business logic in PL/SQL and data in Oracle Database, all configured declaratively within APEX.

Estimated Workshop Time: 60 minutes

## Key Concepts

### What is a Generative AI Agent?

A **Generative AI Agent** is a Shared Component in Oracle APEX that enables richer, conversational interactions with a Generative AI service. An agent is made up of three things:

- **System Prompt**: defines the agent's role, rules, and behavior. It is sent to the AI service with every conversation turn and shapes how the agent reasons and responds.
- **Welcome Message**: the greeting shown to the user when they first open the chat panel.
- **Tools**: give the agent the ability to retrieve information and perform actions. The AI service decides which tools to call and when, based on what the user is asking.

### What is a Generative AI Tool?

**Generative AI Tools** offer a way to provide extra knowledge and expose extra capabilities to an AI service responding to a prompt. Tools can retrieve data from the database, execute server-side PL/SQL logic, or run client-side JavaScript in the browser.

Oracle APEX provides three built-in tool types:

| Tool Type | What it does |
| --- | --- |
| **Retrieve Data** | Runs a SQL query and returns the results to the agent |
| **Execute Server-side Code** | Runs a PL/SQL block to perform a write action or call an API |
| **Execute Client-side Code** | Runs JavaScript in the browser, for example to read browser state or show a dialog |
{: title="Tool Types"}

You can also create custom, reusable Generative AI Tool plug-ins under Shared Components. These plug-ins then appear in the tool type list alongside the built-in types.

### What is an Execution Point?

Every tool has an **Execution Point** that controls when it runs:

- **Augment System Prompt**: the tool runs with each new message and its result is included as a hidden system message before the AI service processes what the user typed. Use this for context the agent always needs, such as who the user is or what timezone their browser is using.
- **On Demand**: the tool is made available to the AI service but only runs when the conversation requires it. The agent decides when to invoke it. Not all tool types support both execution points.

## Objectives

In this workshop, you will learn how to:

- Create an AI Agent in Oracle APEX

- Define tools that retrieve user context, low-stock items, location balances, inbound receipts, and outbound orders

- Use **Augment System Prompt** tools to inject identity and timezone context automatically on every message

- Use **On Demand** tools that the AI model calls only when the conversation requires them

- Implement a **human checkpoint pattern** using a browser confirmation dialog

- Use `apex_ai.set_tool_result` to push structured results and notifications to the chat UI

- Build a complete warehouse operations use case: **identify > review > confirm > act**

## Prerequisites

- An APEX workspace.

- API key for the AI provider of your choice: OCI Generative AI, OpenAI, Cohere, Google Gemini, Anthropic Claude, Mistral AI, Ollama, or Generic OpenAI API Compatible.

If you choose OCI Generative AI as your AI provider, the prerequisites are as follows:

- A paid Oracle Cloud Infrastructure (OCI) account or a FREE Oracle Cloud account with $300 credits for 30 days to use on other services. Read more about it at [oracle.com/cloud/free/](https://www.oracle.com/cloud/free/).

- The OCI account must be created in or subscribed to one of the regions that supports OCI Generative AI Service. Currently, OCI Generative AI Service is supported in the following regions:

    - Brazil East (Sao Paulo)
    - Germany Central (Frankfurt)
    - India South (Hyderabad)
    - Japan Central (Osaka)
    - Saudi Arabia Central (Riyadh)
    - UAE East (Dubai)
    - UK South (London)
    - US East (Ashburn)
    - US Midwest (Chicago)
    - US West (Phoenix)

- OCI Generative AI Service is available in limited regions. To see whether your cloud region supports OCI Generative AI Service, visit the OCI documentation.

- An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments: the tenancy root compartment and `ManagedCompartmentForPaaS`, which is created by Oracle for Oracle Platform services.

- The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges through an OCI IAM policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.

> **Note:** This workshop assumes you are using Oracle APEX 26.1. Some features might not be available in prior releases, and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.

> **Note:** The application ID in the screenshots may vary. Please ignore the application ID.

## Tool Coverage Map

This workshop covers a complete warehouse operations use case using both context tools and on-demand operational tools:

| #  | Tool Name                            | Type                     | Execution Point       |
|----|--------------------------------------|--------------------------|-----------------------|
| 1  | `get_user_context`                   | Retrieve Data            | Augment System Prompt |
| 2  | `get_browser_timezone`               | Execute Client-side Code | Augment System Prompt |
| 3  | `get_low_stock_items`                | Retrieve Data            | On Demand             |
| 4  | `get_item_location_balances`         | Retrieve Data            | On Demand             |
| 5  | `get_inbound_receipts_needing_attention` | Retrieve Data        | On Demand             |
| 6  | `get_outbound_orders_needing_attention` | Retrieve Data        | On Demand             |
| 7  | `confirm_action`                     | Execute Client-side Code | On Demand             |
| 8  | `create_stock_adjustment`            | Execute Server-side Code | On Demand             |
{: title="Tool Coverage Map"}

## Labs

| Lab | Module | Est. Time |
| --- | --- | --- |
| 1 | [Import the Data Model, Sample Data, and Base Application](?lab=1-import-data) | 10 minutes |
| 2 | [Build an AI Agent and Add Context Tools](?lab=2-create-agent-context-tools) | 15 minutes |
| 3 | [Add Core Warehouse Operations Tools](?lab=3-add-core-tools) | 25 minutes |
| 4 | [Add the Agent to the Application and Run the Application](?lab=4-run-application) | 10 minutes |
{: title="Workshop Labs"}

## Learn More

- [Oracle APEX](https://apex.oracle.com)
- [APEX AI Agents Documentation](https://docs.oracle.com/en/database/oracle/apex/)
- [APEX Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [APEX Community](https://apex.oracle.com/community)

## Acknowledgements

- **Author** - Sahaana Manavalan, Senior Product Manager, April 2026
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, April 2026
