# Introduction

## About This Workshop

Interactive Reports in Oracle APEX already give end users a rich set of capabilities, including filtering, sorting, control breaks, highlighting, aggregations, charts, groupings, and pivots. These features are powerful and well established, but configuring them traditionally requires moving through multiple menus, dialogs, and report settings. In practice, that means some capabilities are not used as often as they could be because they take time to discover and apply.

APEX **AI Interactive Reports** changes that experience. Instead of manually configuring a report, users can ask a question in plain language and let APEX translate that request into the right report actions. Based on the intent of the prompt, APEX can apply filters, sorting, pivots, aggregates, groupings, and column selections automatically. Each AI-generated configuration is shown as a visible chip, making the result transparent, reviewable, and easy to refine.

This workshop shows how to use that capability with SCM data. Using a Supply Chain Management application and a replenishment-focused view, you will configure AI support, create an Interactive Report on view named **SCM\_REPLENISHMENT\_V**, add report-level and column-level context, and use both Search with AI and the chat assistant to analyze replenishment activity in natural language.

The workshop is designed for beginner users, database developers, platform engineers, and executives who want to understand how AI Interactive Reports can make SCM analytics faster, more accessible, and easier to adopt without losing visibility into how the report was configured.

Estimated Workshop Time: 30 Minutes

## Objectives

In this workshop you will:

- Download and run the SCM data model and sample data load scripts.
- Create and review the Supply Chain Management application.
- Configure  Generative AI provider.
- Create an Interactive Report using natural language.
- Enable natural language support for the report and add SCM report context.
- Configure column-level AI metadata for key SCM report columns.
- Use Search with AI and the chat assistant to analyze replenishment alerts.

## Prerequisites

- An APEX workspace.

- API key for the AI Provider of your choice. (OCI Gen AI, Open AI, Cohere, Google Gemini, Anthropic Claude, Mistral AI, Ollama and Generic(OpenAI API Compatible))

- If you choose OCI Gen AI as your AI provider, the prerequisites are as follows:

    - A paid Oracle Cloud Infrastructure (OCI) account or a FREE Oracle Cloud account with $300 credits for 30 days to use on other services. Read more about it at: oracle.com/cloud/free/. The OCI account must be created in or subscribed to one of the regions that supports OCI Generative AI Service. Currently, OCI Generative AI Service is supported in the following regions:

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

    - OCI Generative AI service is available in limited regions. To see if your cloud region supports OCI Generative AI service, visit the documentation.

    - An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments - The tenancy (root compartment) and ManagedCompartmentForPaaS (created by Oracle for Oracle Platform services).

    - The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges via an OCI IAM Policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.

*Note*:

- This workshop assumes you are using Oracle APEX 26.1. Some of the features might not be available in prior releases and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.

- The application ID in the screenshots may vary. Please ignore the application ID.

## Lab Modules

| # | Module | Est. Time |
| --- | --- | --- |
| 1 | Create a Supply Chain Management Application | 5 minutes |
| 2 | Configure Generative AI Service | 5 minutes |
| 3 | Create an Interactive Report Using Natural Language | 5 minutes |
| 4 | Configure Column-Level AI Attributes | 5 minutes |
| 5 | Use Search with AI | 5 minutes |
| 6 | Use the Interactive Report Chat Assistant | 5 minutes |

## Downloads

If you are stuck or the application is not working as expected, you can download and install the completed application as follows:

- Download the [ai-interactive-report-lab.sql](files/ai-interactive-report-lab.sql) completed application export file.

- Import the *ai-interactive-report-lab.sql* file into your APEX workspace. Follow the steps in the Import Application wizard to import the application.

- Follow **Lab 1 > Task 1** to load the data model and the sample data.

- Follow **Lab 2 > Task 1** to configure the Generative AI Service.

- Follow **Lab 5 and Lab 6** to run the application and walk through the end-to-end procurement conversation.

## Uninstall the Application and Data Model

After completing the workshop, follow these steps to remove the application and data model from your workspace.

1. To delete the application, open the application from **App Builder**. On the application home page, under **Tasks** on the right side, select **Delete Application** and follow the delete wizard.

2. To remove the SCM data model and all associated database objects, download and run the [scm-uninstall.sql](./files/scm-uninstall.sql) script from **SQL Workshop > SQL Scripts**. This drops all tables, views, procedures, and indexes with the `SCM_` prefix.

## Learn More - *Useful Links*

- APEX on Autonomous:   [https://apex.oracle.com/autonomous](https://apex.oracle.com/autonomous)
- APEX Collateral:   [http://oracle.com/apex](https://www.oracle.com/apex)
- Tutorials:   [https://apex.oracle.com/en/learn/tutorials](https://apex.oracle.com/en/learn/tutorials)
- Community:  [https://apex.oracle.com/community](https://apex.oracle.com/community)
- External Site + Slack:   [http://apex.world](http://apex.world)

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, April 2026
