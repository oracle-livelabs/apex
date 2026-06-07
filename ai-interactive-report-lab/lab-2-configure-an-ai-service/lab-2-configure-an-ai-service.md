# Configure Generative AI Service

## Introduction

Oracle APEX uses a large language model (LLM) to interpret natural language prompts and convert them into trusted, declarative report settings. Before you can use AI Interactive Report features, you need to connect APEX to a Generative AI provider. In this lab, you will generate or gather the provider credentials, configure a Workspace-level Generative AI Service, and link that service to the application. Once configured, APEX shares only report metadata and configuration context with the LLM - your business data never leaves your environment.

> **Important:** Oracle APEX acts as the application layer and connects to the Generative AI provider of your choice using your own credentials. You will need an active account with a supported provider to complete this lab. Any charges for API usage are billed directly by your AI provider. Please review your provider's pricing before proceeding.

Estimated Lab Time: 5 minutes

### Objectives

In this lab, you will:

- Generate or gather provider credentials.
- Configure a Generative AI Service in your APEX Workspace.
- Link the Generative AI Service to the application.

<if type="OCIGenAI">

## Task 1: Generate OCI API keys

In this task, you will generate the OCI API key details needed to configure OCI Generative AI Service in APEX. If you already have an OCI key pair and configuration details, you may skip this task.

1. Log in to your OCI account.

    ![OCI sign-in page](./images/oci-login.png " ")

2. Select **Profile** at the top-right corner and select your user name.

    ![Profile menu](./images/profile.png " ")

3. Open the **Tokens and keys** tab, then select **Add API key**.

    ![Tokens and keys page](./images/add-api-key.png " ")

4. In the **Add API Key** dialog, select **Generate API Key Pair**.

5. Select **Download Private Key**. A `.pem` file is saved to your local machine. You do not need to download the public key.

6. Select **Add**.

    ![Add API key](./images/add.png " ")

7. Copy and save the configuration file preview. You will use these values when configuring the Generative AI Service in APEX.

    ![Configuration file preview](./images/configuration-preview.png " ")

## Task 2: Configure Generative AI Service

In this task, you will configure OCI Generative AI Service in your APEX Workspace.

1. To configure the Generative AI Service in your Workspace, navigate to the Workspace home page from the left navigation menu and select **Enable AI** in the top navigation bar. This option appears only if no AI service has been configured yet.

    ![Open App Builder](images/navigate-to-app-builder.png " ")

    Alternatively, from the Workspace home page, navigate to **App Builder > Workspace Utilities > Generative AI** to access the configuration settings.

    ![Select Generative AI](images/navigate-to-generative-ai-services.png " ")

2. Select **Create**.

    ![Select Create](images/lick-create-ai-service.png " ")

3. On the **Create Generative AI Service** page, enter or select the following:

    - AI Provider: **OCI Generative AI Service**
    - Name: **OCI Generative AI**
    - Compartment ID: Enter your OCI Compartment ID.
    - Region: Enter an OCI region that supports OCI Generative AI Service and the selected model.
    - Model ID: **cohere.command-a-03-2025** (The pre-trained models are frequently deprecated. Refer to the [documentation](https://docs.oracle.com/en-us/iaas/Content/generative-ai/pretrained-models.htm#pretrained-models) for the latest pre-trained models.)
    - Used by App Builder: Toggle **On**
    - Base URL: Leave the auto-generated value unchanged.
    - Credential: Select an existing OCI credential if one is already available in your Workspace. Otherwise, create a new OCI credential using the configuration details from Task 1.

    ![Set the AI provider](images/set-ai-provider-and-app-builder-usage2.png " ")

    ![Set the AI provider](images/set-ai-provider-and-app-builder-usage1.png " ")

4. Select **Test Connection**.

5. If the connection is successful, select **Create**.
    If unsuccessful, verify that you have configured the IAM policy on OCI correctly. Refer to the [Identity and Access Management](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=624&p210_wec) workshop for more details.

    ![Gen AI services page](images/oci-genai-create.png " ")

</if>

<if type="OpenAI">

## Task 1: Generate an OpenAI API key

In this task, you will create an OpenAI API key to configure OpenAI as the Generative AI provider in APEX. If you already have an OpenAI API key, you may skip this task.

1. Create and log in to your [OpenAI account](https://platform.openai.com/).

    ![OpenAI sign-in page](./images/login-openai.png " ")

2. Navigate to the [API keys](https://platform.openai.com/settings/organization/api-keys) page and create a new secret key.

    ![Create secret key](./images/create-secret-key.png " ")

3. Copy and save the secret key. You will use it when you configure the Generative AI Service in APEX.

    ![Save secret key](./images/save-secret-key.png " ")

## Task 2: Configure Generative AI Service

In this task, you will configure OpenAI as a Generative AI Service in your APEX Workspace.

1. To configure the Generative AI Service in your Workspace, navigate to the Workspace home page from the left navigation menu and select **Enable AI** in the top navigation bar. This option appears only if no AI service has been configured yet.

    ![Open App Builder](images/navigate-to-app-builder.png " ")

    Alternatively, from the Workspace home page, navigate to **App Builder > Workspace Utilities > Generative AI** to access the configuration settings.

    ![Select Generative AI](images/navigate-to-generative-ai-services.png " ")

2. Select **Create**.

    ![Select Create](images/lick-create-ai-service.png " ")

3. On the **Create Generative AI Service** page, enter or select the following:

    - AI Provider: **OpenAI**
    - Name: **OpenAI**
    - Used by App Builder: Toggle **On**
    - API Key: Enter the OpenAI API key you created in Task 1.
    - AI Model: Enter the OpenAI model you want to use for this workshop.

    ![Configure OpenAI Generative AI Service](./images/open-ai-details.png " ")

4. Select **Test Connection**.

5. If the connection is successful, select **Create**.

    ![Create OpenAI Generative AI Service](./images/open-ai-create.png " ")

</if>

## Task 3: Link Your Generative AI Service to the Application

In this task, you will link the Generative AI Service you configured in Task 2 to the SCM application.

1. From the **Generative AI Services** page, select the **App Builder** icon in the left navigation.

    ![Navigate to App Builder from Generative AI Services](./images/app-builder-from-genai-services.png " ")

2. Select the **Supply Chain Management** application from the App Builder applications list.

    ![App Builder applications list](./images/select-scm-app.png " ")

3. On the Application home page, select **Shared Components**.

    ![Application home page](./images/shared-comp.png " ")

4. From **Shared Components**, select **AI Attributes**.

    ![Shared Components](./images/shared-comp2.png " ")

5. On the **AI** page, under **Generative AI**, set the **Service** to the service you configured earlier in this lab, then select **Apply Changes**.

<if type="OCIGenAI">

    ![AI Attributes configured with the Generative AI Service](./images/gen-ai-setting.png " ")

</if>

<if type="OpenAI">

    ![AI Attributes configured with the OpenAI Generative AI Service](./images/open-ai-gen-ai-setting.png " ")

</if>

## Summary

The Generative AI Service is now configured and linked to the application. APEX can now send report metadata to the LLM when processing natural language prompts. You are ready to create the AI Interactive Report in the next lab.

You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, June 2026
