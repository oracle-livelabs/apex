# Introduction

## About this Workshop

Managing stock shortages and supplier decisions manually takes time that warehouse teams do not always have. When an item drops below its reorder point and the replenishment alert is already CRITICAL, a warehouse manager needs answers fast: which items are at risk, which suppliers can help, and who has the best delivery record.

AI Agents in Oracle APEX give your application the ability to reason through these questions and act on the answers. Instead of navigating multiple reports and forms, a user can open a chat panel and have a guided conversation. The agent understands who the user is, retrieves the right data, compares options, asks for confirmation, and raises a purchase order, all without leaving the application.

In this hands-on workshop, you will build an **SCM Procurement Agent** for the **SCM Warehouse Management** application. You will define tools that allow warehouse managers to identify stock shortages, evaluate suppliers, and raise purchase orders, all from within a conversational chat interface in Oracle APEX.

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

- Define tools that retrieve user context, stock risk, supplier options, and supplier delivery performance

- Use **Augment System Prompt** tools to inject identity and timezone context automatically on every message

- Use **On Demand** tools that the AI model calls only when the conversation requires them

- Implement a **human checkpoint pattern** using a browser confirmation dialog

- Use `apex_ai.set_tool_result` to push structured results and notifications to the chat UI

- Build a complete procurement use case: **identify > evaluate > confirm > act**

## Prerequisites

- An Oracle APEX 26.1 (or later) workspace

- To complete live runtime testing in Lab 4, a workspace-level **Generative AI Service** connected to a supported chat model

## Tool Coverage Map

This workshop covers a complete procurement use case using both context tools and on-demand operational tools:

| #  | Tool Name                            | Type                     | Execution Point       |
|----|--------------------------------------|--------------------------|-----------------------|
| 1  | `get_user_context`                   | Retrieve Data            | Augment System Prompt |
| 2  | `get_browser_timezone`               | Execute Client-side Code | Augment System Prompt |
| 3  | `get_stocks_at_risk`                 | Retrieve Data            | On Demand             |
| 4  | `get_suppliers_for_item`             | Retrieve Data            | On Demand             |
| 5  | `get_supplier_delivery_performance`  | Retrieve Data            | On Demand             |
| 6  | `show_warehouses_by_supplier`        | Retrieve Data            | On Demand             |
| 7  | `confirm_action`                     | Execute Client-side Code | On Demand             |
| 8  | `raise_purchase_order`               | Execute Server-side Code | On Demand             |
{: title="Tool Coverage Map"}

## Labs

| Lab | Module | Est. Time |
| --- | --- | --- |
| 1 | [Import the Data Model, Sample Data, and Base Application](?lab=1-import-data) | 10 minutes |
| 2 | [Build an AI Agent and Add Context Tools](?lab=2-create-agent-context-tools) | 15 minutes |
| 3 | [Add Supplier Evaluation and Purchase Order Tools](?lab=3-add-core-tools) | 25 minutes |
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
