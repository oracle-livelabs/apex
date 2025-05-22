# Invoke Generative AI Agents using REST Data Sources

## Introduction

In this lab, you will set up a REST Data Source to **Create Sessions** and invoke **Ingestion Job**.

**Session Creation REST Data Source**: This REST data source is used to create a secure session with the Oracle Generative AI service. It establishes the authentication context required to interact with other AI APIs.

**Ingestion Job REST Data Source**:This REST data source triggers an ingestion job to process and embed documents into the knowledge base. It enables the AI agent to access and retrieve relevant information for RAG-based responses.

Estimated Time: 15 Minutes

### Objectives

In this lab, you will:

- Create REST Data Sources for creating session

- Create REST Data Source for Creating Ingestion Job

## Task 1: Invoke Create Session using REST Data Source

1. Navigate to **Shared Components**.

     ![Click REST Data Sources](images/shared-compss.png " ")

2. Under **Data Sources**, select **REST Data Sources**.

   ![Click REST Data Sources](images/rest-data-source2.png " ")

3. Click **Create**.

   ![Click Create](images/create-rest.png " ")

4. Select **From scratch** and click **Next**.

   ![Click From scratch](images/rest-next.png " ")

5. Under Create REST Data Source, enter/select the following:

    - REST Data Source Type: **Oracle Cloud Infrastructure (OCI)**

    - Name: **Create Session API**

    - URL Endpoint: <https://agent-runtime.generativeai.us-chicago-1.oci.oraclecloud.com/20240531/agentEndpoints/:agentEndpointId/sessions>

    - Value: your OCID from previos lab (lab 2 Task 3)

    Click **Next**.

    >**Note**:
    - URL Endpoint may differ based on your OCI tenancy. Refer to the following link for more details- <https://docs.oracle.com/en-us/iaas/api/#/en/generative-ai-agents-client/20240531/>
    - POST endpoint for Create Session: Refer to the following link for more details- <https://docs.oracle.com/en-us/iaas/api/#/en/generative-ai-agents-client/20240531/Session/CreateSession>

   ![Create REST Data Sources](images/general-tab.png " ")

6. Under Create REST Data Source - Remote Server, click **Next**.

   ![Create REST Data Source - Remote Server](images/remote-server.png " ")

7. Under Authentication, enter/select the following:

    - Authentication Required: Toggle **ON**

    - Credentials: **APEX\_OCI\_AI\_CRED**

8. Click **Create REST Source Manually**.
   The REST data source is created successfully. The next step is to configure the POST operation parameters for this REST Data Source.

   ![Click Create REST Source Manually](images/authentication-tab.png " ")

9. On the REST Data Sources page, click **Create Session API**.

   ![Click Document Understanding API](images/click-create-session.png " ")

10. Navigate to **Operations** tab , select **Edit icon** for the **POST** operation

    ![Click Edit POST](images/edit-post.png " ")

11. For **Request Body Template**: Copy and paste the JSON given below.

    ```
    <copy>
    {
      "displayName": "#AGENT_NAME#",
      "description": "#DESCRIPTION#"
    }
    </copy>
    ```

12. Click **Synchronize with Body** and click **OK**.

    ![Request Body Teamplate](images/request-body-template.png " ")

    ![Synchronize with Body Ok](images/synchronize-ok.png " ")

13. Under **Operation Parameters**, select **Add Parameter**.

    ![Click AGENT_NAME](images/add-parameter1.png " ")

14. In the **Edit REST Data Source Parameter** dialog, add the following  parameters:

    |   | Type | Name | Direction | Default Value | Static |
    |---|-------|------|----------| --------------| ------ |
    | 1. | HTTP Header| Content-Type | In | application/json | ON |
    | 2. | Request or Response Body| RESPONSE | Out |  |  |
    {: title="POST Operation Parameters"}

    ![Content Type](images/content-type1.png " ")

15. Click **Add Parameter**.

   ![Response](images/response.png " ")

## Task 2: Invoke Ingestion Job using REST Data Source

1. Navigate to **Shared Components**.

     ![Click REST Data Sources](images/shared-compss.png " ")

2. Under **Data Sources**, select **REST Data Sources**.

   ![Click REST Data Sources](images/rest-data-source2.png " ")

3. Click **Create**.

   ![Click Create](images/click-create-ingestion.png " ")

4. Select **From scratch** and click **Next**.

   ![Click From scratch](images/rest-next.png " ")

5. Under **Create REST Data Source**, enter/select the following:

    - REST Data Source Type: **Oracle Cloud Infrastructure (OCI)**

    - Name: **Create Ingestion Job API**

    - URL Endpoint: <https://agent.generativeai.us-chicago-1.oci.oraclecloud.com/20240531/dataIngestionJobs>

    Click **Next**.

    >**Note**:
    - URL Endpoint may differ based on your OCI tenancy. Refer to the following link for more details- <https://docs.oracle.com/en-us/iaas/api/#/en/generative-ai-agents/20240531>
    - POST endpoint for Ingestion job Refer to the following link for more details <https://docs.oracle.com/en-us/iaas/api/#/en/generative-ai-agents/20240531/DataIngestionJob/CreateDataIngestionJob>

   ![Create REST Data Sources](images/general-tab2.png " ")

6. Under Create REST Data Source - Remote Server, click **Next**.

   ![Create REST Data Source - Remote Server](images/remote-server-2.png " ")

7. Under Authentication, enter/select the following:

    - Authentication Required: Toggle **ON**

    - Credentials: **APEX\_OCI\_AI\_CRED**

8. Click **Create REST Source Manually**.
   The REST data source is created successfully. The next step is to configure the POST operation parameters for this REST Data Source.

   ![Click Create REST Source Manually](images/authentication-tab.png " ")

9. On the REST Data Sources page, click **Create Ingestion Job API**.

   ![Click Document Understanding API](images/click-create-ingestion-job.png " ")

10. Navigate to **Operations** tab , select **Edit icon** for the **POST** operation.

    ![Click Edit POST](images/edit-post.png " ")

11. For **Request Body Template**: Copy and paste the JSON given below.

      ```
       <copy>
       {
         "dataSourceId": "#DATASOURCEID#",
         "compartmentId": "#COMPARTMENTID#",
         "displayName": "#DISPLAYNAME#",
         "description": "#DESCRIPTION#"
       }
       </copy>
        ```

12. Click **Synchronize with Body** and click **OK**.

    ![Request Body Teamplate](images/request-body-template2.png " ")

    ![Synchronize with Body Ok](images/synchronize-ok2.png " ")

13. Under **Operation Parameters**, select **Add Parameter**.

14. In the **Edit REST Data Source Parameter** dialog, add the following two parameters one after the other:

    ![Add Parameter](images/add-parameter2.png " ")

    |   | Type | Name | Direction | Default Value | Static |
    |---|-------|------|----------| --------------| ------ |
    | 1. | HTTP Header| Content-Type | In | application/json | ON |
    | 2. | Request or Response Body| RESPONSE | Out |  |  |
    {: title="POST Operation Parameters"}

15. Click **Add Parameter**.

    ![Add Parameter](images/after-add.png " ")

## Summary

In this lab, you learned how to set up REST Data Sources for secure session creation and triggering ingestion jobs, enabling document embedding and AI agent access for RAG-based responses.

You may now proceed to the next lab.

## Acknowledgements

- **Author(s)** - Roopesh Thokala, Senior Product Manager; Shailu Srivastava, Product Manager
- **Last Updated By/Date** - Shailu Srivastava, Product Manager, May 2025
