# Configure an AI Service

## Introduction

This lab configures the Generative AI connection that powers natural language report creation, Search with AI, and the Interactive Report chat assistant. You will define the provider, enable App Builder usage and verify the connection before you return to the report page.

Estimated Lab Time: 10 minutes

### Objectives

In this lab, you will:

- Configure the Generative AI provider used by the SCM application.

## Task 1: Define the Generative AI Provider

This task sets the service foundation for every AI-driven action later in the workshop. A valid provider and credential ensure that report creation, AI search, and chat interactions all use the same trusted connection.

1. From the workspace home page, click **App Builder > Workspace Utilities**. If no Generative AI service has been configured for your workspace, you can also click **Enable AI** in the top navigation bar to configure it.

    ![Open App Builder](images/navigate-to-app-builder.png)

2. Click **Generative AI**.

    ![Click Generative AI](images/navigate-to-generative-ai-services.png)

3. Click **Create**.

    ![Click Create](images/click-create-ai-service.png)

4. Set **AI Provider** to the provider required for your environment. In this workshop example, use **OCI Generative AI Service**.

    ![Set the AI provider](images/set-ai-provider-and-app-builder-usage.png)

5. Enter a meaningful service name such as **my-ai-service**.

    ![Enter the AI service name](images/enter-ai-service-name.png)

6. Enter your **Compartment ID** and **Region** details if you are using **OCI Generative AI Service**.

    ![Enter the compartment and region details](images/enter-compartment-and-region.png)

7. Set **Use by App Builder** to **Yes** so AI features are available while you create the application.

    ![Enable App Builder usage](images/enable-app-builder-usage.png)

8. Create or select the credential required by the provider.

    ![Configure the AI credential](images/configure-ai-credential.png)

9. Click **Test Connection**.

    ![Save and test the AI service](images/save-and-test-ai-service.png)

10. Confirm that the connection succeeds and click **Create**.

    ![Click Create](images/click-create-ai-service-final.png)

## Summary

You configured the AI provider, enabled App Builder access, selected the workshop model, and validated the connection. The SCM application can now use AI features inside App Builder and runtime.

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, April, 2026
