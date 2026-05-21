# Configure Generative AI Service

## Introduction

Before you can create the AI Agent, you need to connect Oracle APEX to a Generative AI provider. In this lab, you will configure OCI Generative AI as a workspace-level service and assign it to the application. This provides the LLM backend that the Procurement Agent will use to process natural language and invoke tools in the following labs.

> **Important:** Oracle APEX acts as the application layer and connects to the Generative AI provider of your choice using your own credentials. You will need an active account with a supported provider to complete this lab. Any charges for API usage are billed directly by your AI provider. Please review your provider's pricing before proceeding.

Estimated Time: 5 minutes

### Objectives

In this lab, you will:

- Configure a Generative AI Service in your APEX workspace

- Assign the Generative AI Service to the application

## Task 1: Configure Generative AI Service

In this task, you will configure OCI Generative AI as a service in your APEX workspace and assign it to the application.

1. From the left navigation, click the **App Builder** icon.

    ![Imported SCM application available in App Builder](./images/app-builder-page-dark2.png " ")

2. From **App Builder**, select **Workspace Utilities**.

    ![App Builder Workspace Utilities](./images/appbuilder-home2.png " ")

3. From **Workspace Utilities**, select **Generative AI**.

    ![Generative AI Services page](./images/genai-nav.png " ")

4. Select **Create**.

    ![Select Create on the Generative AI Services page](./images/click-create-ai.png " ")

5. On the **Create Generative AI Service** page, enter/select the following:

    > **Note:** This LiveLab uses OCI Generative AI Service as the AI provider. However, Oracle APEX supports multiple Generative AI providers, including OCI Generative AI, OpenAI, Cohere, Google Gemini, Anthropic Claude, Mistral AI, Ollama, and Generic OpenAI API Compatible. You are not required to use OCI Generative AI; you may configure any supported provider that is available in your environment.

    - AI Provider: **OCI Generative AI Service**
    - Name: **OCI Gen AI**
    - Compartment ID: Enter your OCI Compartment ID.
    - Region: Enter your OCI region. (Currently, the OCI Generative AI Service is only available in limited regions.)
    - Model ID: **meta.llama-3.3-70b-instruct** or **cohere.command-a-03-2025** (The pre-trained models are frequently deprecated. Refer to the [documentation](https://docs.oracle.com/en-us/iaas/Content/generative-ai/pretrained-models.htm#pretrained-models) for the latest pre-trained models.)
    - Used by App Builder: Toggle **On**
    - Base URL: Leave the auto-generated value unchanged.
    - Credential: Select an existing OCI credential if one is already available in your workspace. Otherwise, create a new OCI credential.

    ![Create Generative AI Service](./images/create-genai.png " ")

6. Click **Test Connection**.

    ![Test Connection on the Create Generative AI Service page](./images/test-connection.png " ")

7. Select **Create**.

    ![Select Create on the Generative AI Service page](./images/oci-genai-create.png " ")

8. Verify that the new **OCI Gen AI** service appears in the **Generative AI Services** list.

    ![Generative AI Service created](./images/gen-ai-service-created.png " ")

9. From the **Generative AI Services** page, select the **App Builder** icon in the left navigation.

    ![Navigate to App Builder from Generative AI Services](./images/app-builder-from-genai-services.png " ")

10. Select the application from the App Builder applications list.

    ![App Builder applications list](./images/appbuilder-home3.png " ")

11. On the application home page, select **Shared Components**.

    ![Application home page](./images/shared-comp.png " ")

12. From **Shared Components**, select **AI Attributes**.

    ![Shared Components](./images/shared-comp2.png " ")

13. For **Generative AI Service**, select **OCI Gen AI**, then select **Apply Changes**.

    ![AI Attributes configured with the Generative AI Service](./images/gen-ai-setting.png " ")

## Summary

The Generative AI Service is now configured and assigned to the application. You are ready to create the Procurement Agent and add tools in the next lab.

You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Sahaana Manavalan, Senior Product Manager, April 2026
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, May 2026
