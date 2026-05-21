# Introduction

## About this Workshop

In this workshop, you will build a dynamic and interactive **Events Management Application** using Generative Development in Oracle APEX. This workshop demonstrates how the AI-driven features of Oracle APEX can accelerate application development and simplify complex tasks, helping you create powerful applications with ease.

You will begin by creating a custom data model using natural language, quickly establishing the foundation of your application. Once the data model is ready, you will use natural language again to generate an initial application blueprint, demonstrating how AI can streamline and speed up the development process.

Next, you will enhance the application by using the **APEX Assistant** to generate SQL and HTML directly within the APEX Code Editor, simplifying the creation of both UI components and data logic.

As you proceed, you will integrate advanced AI capabilities into the application. This includes building an AI-powered Event Assistant that uses an AI Agent to answer event-related questions through an interactive **chat interface**. You will also implement a feature that uses the **Generate Text with AI** trigger action to automatically create event descriptions.

By the end of this workshop, you will understand how Oracle APEX brings together AI assistance, data-driven development, and enterprise-grade architecture to help you build intelligent applications quickly and effectively.

Estimated Time: 60 minutes

### Objectives

- Create a Custom Data Model using Generative AI.

- Generate an application blueprint using the APEX AI Assistant.

- Improve the application's UI and UX using the APEX AI Assistant to generate SQL and HTML directly in the Code Editor.

- Build an AI-powered Event Assistant that uses AI agents to answer event-related queries through a chat interface.

- Add a feature that generates event descriptions using the Generate Text with AI trigger action.

## Prerequisites

- An APEX workspace.

- An API key for the AI provider of your choice (OCI Gen AI, Open AI, Cohere, Google Gemini, Anthropic Claude, Mistral AI, Ollama and Generic(OpenAI API Compatible)).

- If you choose OCI Gen AI as your AI provider, the prerequisites are as follows:

    - A paid Oracle Cloud Infrastructure (OCI) account or a Free Oracle Cloud account with $300 in credits valid for 30 days to use on other services. Learn more at: [oracle.com/cloud/free/](https://www.oracle.com/cloud/free/). The OCI account must be created in, or subscribed to, a region that supports the OCI Generative AI service. Currently, OCI Generative AI Service is supported in the following regions:

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

    - The OCI Generative AI service is available only in select regions. To see if your cloud region supports OCI Generative AI service, visit the [documentation](https://docs.oracle.com/en-us/iaas/Content/generative-ai/overview.htm#regions).

    - An OCI compartment. An Oracle Cloud account comes with two preconfigured compartments: the tenancy (root compartment) and ManagedCompartmentForPaaS(created by Oracle for Oracle Platform services).

    - The logged-in user must have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges via an OCI IAM Policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.

    *Note: This workshop assumes you are using Oracle APEX 26.1. Some of the features might not be available in prior releases and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.*

    *Important: This workshop requires an active account with a supported Generative AI provider. Oracle APEX connects to the provider using your own credentials. Any API usage charges are billed directly by your provider. Please review your provider’s pricing before proceeding.*

## Labs

| S No. | Module | Est. Time |
|--- |--- | --- |
| 1 |[Configure a Generative AI Service in APEX](?lab=0-configure-ai-keys) | 10 minutes |
| 2 |[Create a Data Model using Generative AI](?lab=1-create-data-model-using-ai) | 10 minutes |
| 3 |[Create the Application using Generative AI](?lab=2-create-app) | 10 minutes |
| 4|[Enhance UI with AI](?lab=4-ui-apex-assistant) | 10 minutes |
| 5 |[Create an Event Chat Assistant](?lab=5-chat-bot) | 5 minutes |
| 6 | [Generate Event Description with AI](?lab=6-generate-text) | 5 minutes |
| 7 |[OPTIONAL - Enhance Charts and Database Objects using AI](?lab=3-apex-assistant) | 10 minutes |

### **Let's Get Started!**

- Click **Getting Started** from the menu on the right. If you already have an Oracle Cloud account, click on **Lab 1: Configure AI Service and Create Data Model using AI**.

>**Note**: If you have a **Free Trial** account, when your Free Trial expires your account will be converted to an **Always Free** account. You will not be able to conduct Free Tier workshops unless the Always Free environment is available. **[Click here for the Free Tier FAQ page.](https://www.oracle.com/cloud/free/faq.html)**

## Downloads

If you are stuck or the App is not working as expected, you can download and install the completed App as follows:

1. **[Click here](files/event-management-hol-app.sql)** to download the completed application.

2. Follow Lab [Appendix: Download Instructions](?lab=8-appendix) to import the application in your workspace.

## Learn More - *Useful Links*

- APEX on Autonomous:   [https://apex.oracle.com/autonomous](https://apex.oracle.com/autonomous)
- APEX Collateral:   [http://oracle.com/apex](https://www.oracle.com/apex)
- Tutorials:   [https://apex.oracle.com/en/learn/tutorials](https://apex.oracle.com/en/learn/tutorials)
- Community:  [https://apex.oracle.com/community](https://apex.oracle.com/community)
- External Site + Slack:   [http://apex.world](http://apex.world)

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, May 2026
