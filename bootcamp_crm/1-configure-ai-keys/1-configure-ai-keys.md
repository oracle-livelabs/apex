# Configure a Generative AI Service in APEX

## Introduction

To use the native Generative AI features in Oracle APEX, you must first configure a Generative AI service at the workspace level.

In this lab, you will configure OpenAI as the AI provider. The OpenAI API key has already been generated for you. You will now configure the service and test the connection within your APEX workspace.

**Note:** The screenshots in this workshop are taken using Dark Mode in APEX 24.2

Estimated Time: 5 Minutes

### Objectives

In this lab, you:

- Configure an OpenAI Generative AI service in your Oracle APEX workspace.

## Task 1: Configure Generative AI Service

To use the Generative AI service in APEX, you need to first configure it at the workspace level.

1. From the App Builder, navigate to **Workspace Utilities** > **All Workspace Utilities**.

    ![Workspace homepage](images/workspace-util.png ' ')

2. Select **Generative AI**.

    ![Workspace Utilities page](images/select-gen-ai.png ' ')

3. Click **Create** to configure a Generative AI Service.

     ![Gen AI services page](images/create-gen-ai.png ' ')

4. For this workshop, choose OpenAI as the AI provider, enter/select the following:

    - AI Provider: **Open AI**

    - Name: **Open AI**

    - Used by App Builder: Toggle the button to turn it **ON**

    - Credential: **OPENAI_CREDENTIAL**

    - AI Model: **gpt-4.1**

    Click **Test Connection**.

5. If the connection is successful, click **Create**.
   If unsuccessful, go to troubleshooting section in Appendix lab.

   ![Gen AI services page](images/open-ai.png ' ')

## Summary

Congratulations! You've completed the lab.

You now know how to an generate API Key using OpenAI.

You may now **proceed to the next lab**.


## Acknowledgments

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, February 2026
