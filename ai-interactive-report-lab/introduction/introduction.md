# Introduction

## About This Workshop

Interactive Reports in Oracle APEX already give end users a rich set of capabilities, including filtering, sorting, control breaks, highlighting, aggregations, charts, groupings, and pivots. These features are powerful and well established, but configuring them traditionally requires moving through multiple menus, dialogs, and report settings. In practice, that means some capabilities are not used as often as they could be because they take time to discover and apply.

APEX **AI Interactive Reports** changes that experience. Instead of manually configuring a report, users can ask a question in plain language and let APEX translate that request into the right report actions. Based on the intent of the prompt, APEX can apply filters, sorting, pivots, aggregates, groupings, and column selections automatically. Each AI-generated configuration is shown as a visible chip, making the result transparent, reviewable, and easy to refine.

This workshop shows how to use that capability with SCM data. Using a Supply Chain Management application and a replenishment-focused view, you will configure AI support, create an Interactive Report on `SCM_NL2IR_REPLENISHMENT_V`, add report-level and column-level context, and use both Search with AI and the chat assistant to analyze replenishment activity in natural language.

The workshop is designed for beginner users, database developers, platform engineers, and executives who want to understand how AI Interactive Reports can make SCM analytics faster, more accessible, and easier to adopt without losing visibility into how the report was configured.

Estimated Workshop Time: 40 Minutes

### Objectives

In this workshop you will:

- Download and run the SCM data model and sample data load scripts.
- Create and review the Supply Chain Management application.
- Configure an AI provider.
- Create an Interactive Report using natural language.
- Enable natural language support for the report and add SCM report context.
- Configure column-level AI metadata for key SCM report columns.
- Use Search with AI and the chat assistant to analyze replenishment alerts.

### Prerequisites

- An APEX workspace.

- API key for the AI Provider of your choice. (OCI Gen AI, Open AI, Cohere)

- If you choose OCI Gen AI as your AI provider, the prerequisites are as follows:

    - A paid Oracle Cloud Infrastructure (OCI) account or a FREE Oracle Cloud account with $300 credits for 30 days to use on other services. Read more about it at: oracle.com/cloud/free/. The OCI account must be created in or subscribed to one of the regions that supports OCI Generative AI Service. Currently, OCI Generative AI Service is supported in the following regions:

        - Brazil East (Sao Paulo)
        - Germany Central (Frankfurt)
        - India South (Hyderabad)
        - Japan Central (Osaka)
        - UAE East (Dubai)
        - UK South (London)
        - US Midwest (Chicago)

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
| 2 | Configure an AI Service | 10 minutes |
| 3 | Create an Interactive Report Using Natural Language | 5 minutes |
| 4 | Configure Column-Level AI Attributes | 10 minutes |
| 5 | Use Search with AI | 5 minutes |
| 6 | Use the Interactive Report Chat Assistant | 5 minutes |

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, April, 2026
