# Introduction

## About This Workshop

Managing stock shortages and supplier decisions manually takes time that warehouse teams do not always have. When an item drops below its reorder point and the replenishment alert is already CRITICAL, a warehouse manager needs answers fast: which items are at risk, which suppliers can help, and who has the best delivery record.

AI Agents in Oracle APEX give your application the ability to reason through these questions and act on the answers. Instead of navigating multiple reports and forms, a user can open a chat panel and have a guided conversation. The agent understands who the user is, retrieves the right data, compares options, asks for confirmation, and raises a purchase order, all without leaving the application.

This workshop focuses on the inventory and warehouse management aspects of supply chain: identifying stock shortages, evaluating supplier options, and raising purchase orders through a conversational AI Agent.

In this hands-on workshop, you will build an **AI Procurement Agent** for the **APEX Inventory and Warehouse Management** application. You will define tools that allow warehouse managers to identify stock shortages, evaluate suppliers, and raise purchase orders, all from within a conversational chat interface in Oracle APEX.

You will define seven tools using the three tool types available in APEX AI Agents: **Retrieve Data**, **Execute Server-side Code**, and **Execute Client-side Code**. You will also learn when to use each one, all configured declaratively within Oracle APEX.

Estimated Workshop Time: 60 minutes

## Objectives

In this workshop, you will learn how to:

- Create an AI Agent in Oracle APEX

- Define tools that retrieve user context, stock risk, supplier options, and supplier delivery performance

- Use **Augment System Prompt** tools to inject identity and timezone context automatically on every new message

- Use **On Demand** tools that the AI model calls only when the conversation requires them

- Use `apex_ai.set_tool_result` to push structured results and notifications to the chat UI

- Build a complete procurement use case: **identify > evaluate > act**

## Key Concepts

### What Is a Generative AI Agent?

A **Generative AI Agent** is a Shared Component in Oracle APEX that enables richer, conversational interactions with a Generative AI service. An agent is made up of three things:

> **Note:** Starting with Oracle APEX 26.1, AI Configurations from previous releases are now AI Agents. Your existing configurations carry over; the rename reflects the expanded capabilities, including tools and multi-step orchestration.

- **System Prompt**: defines the agent's role, rules, and behavior. It is sent to the AI service with every conversation turn and shapes how the agent reasons and responds.
- **Welcome Message**: the greeting shown to the user when they first open the chat panel.
- **Tools**: give the agent the ability to retrieve information and perform actions. The AI service decides which tools to call and when, based on what the user is asking.

### What Is an AI Tool?

**AI Tools** offer a way to provide extra knowledge and expose extra capabilities to an AI service responding to a prompt. Tools can retrieve data from the database, execute server-side PL/SQL logic, or run client-side JavaScript in the browser.

Oracle APEX provides three built-in tool types: **Retrieve Data** runs a SQL query and returns results to the agent, **Execute Server-side Code** runs a PL/SQL block to perform write actions or call APIs, and **Execute Client-side Code** runs JavaScript in the browser. You can also create custom, reusable tool plug-ins under Shared Components.

> **Note:** Starting with Oracle APEX 26.1, RAG Sources from previous releases are automatically migrated to Augment System Prompt Tools. The behavior is the same; your existing RAG integrations continue to work, now as part of the unified tool model.

### What Is an Execution Point?

Every tool has an **Execution Point** that controls when it runs:

- **Augment System Prompt**: the tool runs with each new message and its result is included as a hidden system message before the AI service processes what the user typed. Use this for context the agent always needs, such as who the user is or what timezone their browser is using.
- **On Demand**: the tool is made available to the AI service but only runs when the conversation requires it. The agent decides when to invoke it. Not all tool types support both execution points.

## Prerequisites

- An Oracle APEX 26.1 workspace. This workshop requires APEX 26.1. Some features, instructions, and screenshots may differ or not be available in prior releases.

- An API key for the AI provider of your choice: OCI Generative AI, OpenAI, Cohere, Google Gemini, Anthropic Claude, Mistral AI, Ollama, or Generic OpenAI API Compatible.

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

        OCI Generative AI Service is available in limited regions. To see whether your cloud region supports OCI Generative AI Service, visit the OCI documentation.

    - An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments: the tenancy root compartment and ManagedCompartmentForPaaS, which is created by Oracle for Oracle Platform services.

    - The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges through an OCI IAM policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.

> **Note:** The application ID in the screenshots may vary. Please ignore the application ID.

> **Important:** This workshop requires an active account with a supported Generative AI provider. Oracle APEX connects to the provider of your choice using your own credentials. Any charges for API usage are billed directly by your provider. Please review your provider's pricing before proceeding.

## Labs

| Lab | Module | Est. Time |
| --- | --- | --- |
| 1 | [Import the Data Model, Sample Data, and Base Application](?lab=1-import-data) | 10 minutes |
| 2 | [Configure Generative AI Service](?lab=2-configure-genai-service) | 10 minutes |
| 3 | [Build an AI Agent and Add Context Tools](?lab=3-create-agent-context-tools) | 15 minutes |
| 4 | [Add Supplier Evaluation and Purchase Order Tools](?lab=4-add-core-tools) | 20 minutes |
| 5 | [Add the Agent to the Application and Run the Application](?lab=5-run-application) | 10 minutes |
{: title="Workshop Labs"}

## Downloads

If you are stuck or the application is not working as expected, you can download and install the completed application as follows:

1. Download the [SCM\_INV\_WMS\_EXPORT\_APP.sql](./files/SCM_INV_WMS_EXPORT_APP.sql) completed application export file.

2. Import the **SCM\_INV\_WMS\_EXPORT\_APP.sql** file into your APEX workspace. Follow the steps in the **Import Application** wizard to import the application.

3. Follow **Lab 1 > Task 1** to load the data model and **Lab 1 > Task 2** to load the sample data.

4. Follow **Lab 2** to configure your AI provider key and Generative AI Service.

5. Skip **Lab 3** and **Lab 4**. The completed application export already includes the Procurement Agent and all seven tools.

6. Follow **Lab 5 > Task 2** to run the application and walk through the end-to-end procurement conversation.

## Uninstall the Application and Data Model

After completing the workshop, follow these steps to remove the application and data model from your workspace.

1. To delete the application, open the application from **App Builder**. On the application home page, under **Tasks** on the right side, select **Delete Application** and follow the delete wizard.

2. To remove the SCM data model and all associated database objects, download and run the [04\_SCM\_INV\_WMS\_UNINSTALL.sql](./files/04_SCM_INV_WMS_UNINSTALL.sql) script from **SQL Workshop > SQL Scripts**. This drops all tables, views, procedures, and indexes with the `SCM_` prefix.

## Learn More

- [Oracle APEX](https://apex.oracle.com)
- [APEX AI Agents Documentation](https://docs.oracle.com/en/database/oracle/apex/)
- [APEX Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [APEX Community](https://apex.oracle.com/community)

## Acknowledgements

- **Author** - Sahaana Manavalan, Senior Product Manager, April 2026
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, May 2026
