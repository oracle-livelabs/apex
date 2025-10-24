# Introduction

## About this Workshop

In this workshop, you will build a dynamic and interactive Events Management application using Generative Development in Oracle APEX. This workshop is designed to showcase how AI-driven features of Oracle APEX can accelerate application development and simplify complex tasks, helping you create powerful applications with ease.

You will begin by creating a custom data model **using Oracle APEX AI Assistant**, quickly setting up the foundation for your application. Once the data model is ready, you will use the APEX Assistant to build an initial application blueprint, highlighting how AI can simplify and speed up the development process.

Next, you will customize your application using Oracle APEX low-code features, making adjustments with pre-built components that streamline the enhancement process. You also learn how to generate SQL queries with the help of APEX Assistant, simplifying the creation of complex queries for your application.

As you progress, you integrate AI-powered text generation into your application, enabling it to dynamically create and utilize text content. You will also implement an AI chat assistant by leveraging the **Show AI Assistant** dynamic Action of APEX, providing a responsive interface for real-time user interaction.

Total Workshop Time: 35 minutes

### Objectives

- Create a Custom Data Model using AI.
- Generate an application using APEX AI Assistant.
- Customize/ Enhance the application by leveraging APEX assistant to generate SQL queries in the Code Editor.
- Create an AI Chat Assistant to inquire about the Events.
- Add functionality to Generate Text with AI.

## Prerequisites

- An APEX workspace.

- API key for the AI Provider of your choice. (OCI Gen AI, Open AI, Cohere)

- If you choose OCI Gen AI as your AI provider, the prerequisites are as follows:

    - A paid Oracle Cloud Infrastructure (OCI) account or a FREE Oracle Cloud account with $300 credits for 30 days to use on other services. Read more about it at: [oracle.com/cloud/free/](https://www.oracle.com/cloud/free/). The OCI account must be created in or subscribed to one of the regions that supports OCI Generative AI Service. Currently, OCI Generative AI Service is supported in the following regions:

        - Brazil East (Sao Paulo)
        - Germany Central (Frankfurt)
        - India South (Hyderabad)
        - Japan Central (Osaka)
        - UAE East (Dubai)
        - UK South (London)
        - US Midwest (Chicago)

    - OCI Generative AI service is available in limited regions. To see if your cloud region supports OCI Generative AI service, visit the [documentation](https://docs.oracle.com/en-us/iaas/Content/generative-ai/overview.htm#regions).

    - An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments - The tenancy (root compartment) and ManagedCompartmentForPaaS (created by Oracle for Oracle Platform services).

    - The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges via an OCI IAM Policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.

    *Note: This workshop assumes you are using Oracle APEX 24.2 and Oracle Database 23ai. Some of the features might not be available in prior releases and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.*

## Labs

| | Module | Est. Time |
|--- |--- | --- |
| 1.|[Configure Generative AI Service](?lab=0-configure-ai-keys) | 5 minutes |
| 2.|[Create a Data Model using AI](?lab=1-create-data-model-using-ai) | 5 minutes |
| 3.|[Create the Application using Generative AI](?lab=2-create-app) | 5 minutes |
|4.|[Enhance Charts and Database Objects with APEX Assistant](?lab=3-apex-assistant) | 5 minutes |
| 5.|[Enhance UI with APEX Assistant](?lab=4-ui-apex-assistant) | 5 minutes |
| 6.|[Create an Event Chat Assistant](?lab=5-chat-bot) | 5 minutes |
|7.| [Generate Event Description with AI](?lab=6-generate-text) | 5 minutes |

Total estimated time: 30 minutes

### **Let's Get Started!**

- Click on **Getting Started** from the menu on the right. If you already have an Oracle Cloud account, click on **Lab 1: Configure AI Service and Create Data Model using AI**.

>**Note**: If you have a **Free Trial** account, when your Free Trial expires your account will be converted to an **Always Free** account. You will not be able to conduct Free Tier workshops unless the Always Free environment is available. **[Click here for the Free Tier FAQ page.](https://www.oracle.com/cloud/free/faq.html)**

## Downloads

If you are stuck or the App is not working as expected, you can download and install the completed App as follows:

1. **[Click here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2Fevents-management-hol.sql)** to download the completed application.

2. Import the event\_management\_hol.sql file into your workspace. Follow the Install Application wizard steps to install the app along with the Supporting Objects.

3. Once the application is installed, follow the below steps to update the Web Credentials.

    - Click the Down Arrow next to **App Builder**, click **Workspace Utilities** and then select **All Workspace Utilities**.

    ![navigate to workspace utilities](images/navigate-to-workspace-utilities.png " ")

    - Select **Web Credentials**.

    - Click **Credentials for Open AI**.

    ![select openai credentials](images/select-openai-cred.png " ")

    - In the **Web Credentials** page, enter/select the following:

        - Credential Name: **Authorization**

        - Credential Secret: Enter **YOUR_KEY**

    - Click **Apply Changes**.

    ![update open ai cred](images/update-openai-cred.png " ")

## Learn More - *Useful Links*

- APEX on Autonomous:   [https://apex.oracle.com/autonomous](https://apex.oracle.com/autonomous)
- APEX Collateral:   [https://apex.oracle.com](https://apex.oracle.com)
- Tutorials:   [https://apex.oracle.com/en/learn/tutorials](https://apex.oracle.com/en/learn/tutorials)
- Community:  [https://apex.oracle.com/community](https://apex.oracle.com/community)
- External Site + Slack:   [http://apex.world](http://apex.world)

## Acknowledgments

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, October 2025
