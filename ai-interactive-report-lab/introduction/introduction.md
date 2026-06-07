# Introduction

## About This Workshop

Interactive Reports in Oracle APEX offer end users a rich set of capabilities, including filtering, sorting, control breaks, highlighting, aggregations, charts, groupings, and pivots. While these features are powerful and well established, configuring them often requires navigating through multiple menus and dialogs. As a result, some capabilities may be underutilized due to discoverability challenges or the time needed to apply the appropriate settings.

APEX **AI Interactive Reports** changes that. Users can ask a question in plain language, and APEX automatically configures the report - applying filters, sorting, pivots, aggregates, groupings, and column selections based on what was asked. Every configuration the AI applies is surfaced as a visible chip, so users can see exactly what has been set, review it at a glance, and adjust anything that does not match their intent.

In this workshop, you will build a Supply Chain Management application on a replenishment-focused view (**SCM\_REPLENISHMENT\_V**), configure Generative AI support, add report-level and column-level context, and use both Search with AI and the Interactive Report Chat Assistant to analyze replenishment activity in natural language. Importantly, your business data never leaves your environment. APEX only shares report metadata and configuration context with the LLM. The actual data in your report stays where it belongs.

The workshop is designed for beginner users, database developers, platform engineers, and executives who want to understand how AI Interactive Reports can make SCM analytics faster, more accessible, and easier to adopt - without losing visibility into how the report was configured.

Estimated Workshop Time: 35 Minutes

## Objectives

In this workshop you will:

- Download and run the SCM data model and sample data scripts.
- Create and review the Supply Chain Management application.
- Configure a Generative AI provider.
- Create an Interactive Report using natural language.
- Enable natural language support for the report and add SCM report context.
- Configure column-level AI metadata for key SCM report columns.
- Use Search with AI and the Chat Assistant to analyze replenishment alerts.
- Enable dictation support for voice-to-text input.

## Prerequisites

- An APEX Workspace running on an Oracle Database 19c or later.

- An API key for the AI provider of your choice, such as OCI Generative AI, OpenAI, Cohere, Google Gemini, Anthropic Claude, Mistral AI, Ollama, or a generic OpenAI-compatible provider.

- If you choose OCI Generative AI as your AI provider, the prerequisites are as follows:

    - A paid Oracle Cloud Infrastructure (OCI) account or a free Oracle Cloud account with trial credits. Read more about it at: oracle.com/cloud/free/. The OCI account must be created in or subscribed to a region that supports OCI Generative AI Service and the model you plan to use. To see whether your cloud region supports OCI Generative AI Service, visit the documentation.

    - An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments: the tenancy (root compartment) and ManagedCompartmentForPaaS (created by Oracle for Oracle Platform services).

    - The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges via an OCI IAM Policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.

> **Note:** This workshop assumes you are using Oracle APEX 26.1. Some of the features might not be available in prior releases and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.
>
> The application ID in the screenshots may vary. Please ignore the application ID.

## Lab Modules

| # | Module | Est. Time |
| --- | --- | --- |
| 1 | Create a Supply Chain Management Application | 5 minutes |
| 2 | Configure Generative AI Service | 5 minutes |
| 3 | Create an Interactive Report Using Natural Language | 5 minutes |
| 4 | Configure Column-Level AI Attributes | 5 minutes |
| 5 | Use Search with AI | 5 minutes |
| 6 | Use the Interactive Report Chat Assistant | 5 minutes |
| 7 | Enable Dictation Support | 5 minutes |

## Downloads

If you are stuck or the application is not working as expected, you can download and install the completed application as follows:

- Download the [ai-interactive-report-lab.sql](files/ai-interactive-report-lab.sql) completed application export file.

- Import the *ai-interactive-report-lab.sql* file into your APEX Workspace. Follow the steps in the Import Application wizard to import the application.

- Follow **Lab 1 > Task 1 and Task 2** to load the data model and sample data.

- Follow **Lab 2 > Task 1** to configure the Generative AI Service.

- Follow **Lab 5 and Lab 6** to run the application and walk through the AI Interactive Report features.

## Uninstall the Application and Data Model

After completing the workshop, follow these steps to remove the application and data model from your Workspace.

1. To delete the application, open the application from **App Builder**. On the Application home page, under **Tasks** on the right side, select **Delete Application** and follow the delete wizard.

2. To remove the SCM data model and all associated database objects, download and run the [04\_SCM\_INV\_WMS\_UNINSTALL.sql](./files/04_SCM_INV_WMS_UNINSTALL.sql) script from **SQL Workshop > SQL Scripts**. This drops all tables, views, procedures, and indexes with the `SCM_` prefix.

## Learn More - *Useful Links*

- APEX on Autonomous:   [https://apex.oracle.com/autonomous](https://apex.oracle.com/autonomous)
- APEX Collateral:   [http://oracle.com/apex](https://www.oracle.com/apex)
- Tutorials:   [https://apex.oracle.com/en/learn/tutorials](https://apex.oracle.com/en/learn/tutorials)
- Community:  [https://apex.oracle.com/community](https://apex.oracle.com/community)
- External Site + Slack:   [http://apex.world](http://apex.world)

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, June 2026
