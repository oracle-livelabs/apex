# Invoke OCI Doc Understanding using REST Data Sources

## Introduction

In this lab, you create an APEX application named **Automatic Invoice Handling** using the Create App Wizard. You will also configure a REST Data Source to interact with OCI Document Understanding, Oracle Cloud Infrastructure’s service for intelligent document processing. OCI Document Understanding enables you to extract structured data, metadata, and insights from unstructured documents such as PDFs, images, and scanned files.

Throughout this lab, you will enhance the application’s home page to support invoice uploads and document processing and analysis—from data extraction to storing the results in the database.

Estimated Time: 10 Minutes

### Objectives

In this lab, you will:

- Create a new APEX application.
- Invoke OCI Document Understanding through REST Data Sources.
- Configure a Form region to Upload Invoices and Process the document.
- Create Processes to upload Invoice to Object Storage and Automate DML.
- Integrate Document Understanding API and Parse the Response.

## Task 1: Create an Application

In this task, you'll create a new application using the APEX **App Builder**. You'll configure the application’s icon, appearance, name, and key features using the **Use Create App Wizard**.

1. On the workspace home page, click down arrow **'⌄'** next to **App Builder** and click **Create**.

   ![Click Create](images/create.png " ")

2. Select **Use Create App Wizard**.

   ![Use Create App Wizard](images/use-create-app-wizard.png " ")

3. Before Name, select **Set Icon**.

   ![Set Icon](images/set-icon.png " ")

4. In the Choose Application Icon dialog, select any color and icon, then click **Save Icon**.

   ![Save Icon](images/save-icon.png " ")

5. Next to **Name**, select **Set Appearance** icon.

   ![Set Appearance](images/set-appearance.png " ")

6. For Theme Style, select **Redwood Light** and click **Save Changes**.

    ![Redwood Light](images/redwood-light.png " ")

7. In Create an Application wizard, enter/select the following:

    - Name: **Automatic Invoice Handling**

    - Features: Check **Install Progressive Web App** and **Feedback**

8. Click **Create Application**.

    ![Automatic Invoice Handling](images/create-application.png " ")

## Task 2: Invoke OCI Doc Understanding using REST Data Source

In this task, you'll configure a **REST Data Source** in the **Shared Components** to invoke the OCI Document Understanding service. You'll create the **REST Data Source** from scratch, set up authentication, define the POST operation, and add the necessary parameters for calling the OCI Document Understanding API.

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

    - Name: **Document Understanding API**

    - URL Endpoint: <https://document.aiservice.us-ashburn-1.oci.oraclecloud.com/20221109/actions/analyzeDocument>

    Click **Next**.

    >**Note**: URL Endpoint may differ based on your OCI tenancy. Refer to the following link for more details- <https://docs.oracle.com/en-us/iaas/api/#/en/vision/20220125>

   ![Create REST Data Sources](images/rest-general.png " ")

6. Under Create REST Data Source - Remote Server, click **Next**.

   ![Create REST Data Source - Remote Server](images/rest-remote.png " ")

7. Under Authentication, enter/select the following:

    - Authentication Required: Toggle **ON**

    - Credentials: **APEX\_OCI\_AI\_CRED**

8. Click **Create REST Source Manually**.
   The REST data source is created successfully. The next step is to configure the POST operation parameters for this REST Data Source.

   ![Click Create REST Source Manually](images/rest-authen.png " ")

9. On the REST Data Sources page, click **Document Understanding API**.

   ![Click Document Understanding API](images/doc-under.png " ")

10. Navigate to **Operations** tab , select **Edit icon** for the **POST** operation and enter the following:

    - Request Body Template: Copy and paste the JSON given below.

        ```
        <copy>
        {
        "compartmentId" : "#COMPARTMENT_ID#",
        "document" :
            {
                "namespaceName" : "#NAMESPACE_NAME#",
                "bucketName" : "#BUCKET_NAME#",
                "objectName" : "#OBJECT_NAME#",
                "source" : "OBJECT_STORAGE"
            },
        "features" :
            [
                {
                    "featureType" : "#FEATURE_TYPE#"
                }
            ]
        }
        <copy>
        ```

11. Click **Synchronize with Body** and then click **OK**.

    ![edit post](images/edit-post.png " ")

    ![Synchronize with Body](images/synchronize.png " ")

    ![Synchronize with Body Ok](images/synchronize-ok.png " ")

12. Under **Operation Parameters**, select **Add Parameter**.

    ![Click Add Parameter](images/add-parameter.png " ")

13. In the **Edit REST Data Source Parameter** dialog, add the following two parameters one after the other:

    |   | Type | Name | Direction | Default Value | Static |
    |---|-------|------|----------| --------------| ------ |
    | 1 | HTTP Header| Content-Type | In | application/json | ON |
    | 2 | Request or Response Body| RESPONSE | Out |  |  |
    {: title="POST Operation Parameters"}

    ![Click Timeline](images/content-type.png " ")

    ![Click Timeline](images/response.png " ")

14. Click **Apply Changes**.

    ![Click Timeline](images/apply-changes.png " ")

## Task 3: Enhance Home Page to Upload Invoices and Process the document

In this task, you'll enhance the Home page of your application to allow users to upload invoices and initiate document processing. You will create a form region, configure hidden items, add a file-upload component, and set up buttons and settings required to process invoices through OCI Document Understanding.

1. Navigate to **Application ID**.

   ![Application ID](images/app-id2.png " ")

2. Select **1-Home** page.

   ![1-Home](images/home-page.png " ")

3. Under **Breadcrumb Bar**, select **Automatic Invoice Handling** region and update Name to **Process Your Invoice**.

   ![Breadcrumb bar](images/breadcrum-bar.png " ")

4. Under **Rendering** tab, right-click **Body** and select **Create Region**.

   ![Create Region](images/create-region.png " ")

5. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **Upload Your Invoice**

        - Type: **Form**

    - Source > Table Name: **INV\_UPLOAD**

    ![Create Region](images/form.png " ")

6. Under **Upload Your Invoice** region, select **P1\_FILE\_NAME** page item, press (Shift+Down Arrow) till **P1\_DOC\_AI\_JSON** and in the property editor, update type to **Hidden**.

     ![hidden items](images/all-hidden.png " ")

7. In the **Rendering** tab, right-click **Upload Your Invoice** region and select **Create Page Item**.

   ![hidden items](images/create-page-item.png " ")

8. Now, add the following eight page items one after the other:

   |   | Identification > Name | Identification > Type | Default > Type | Default > Static | Session State > Datatype |
   |---|-------|------|----------| --------------| ------ |
   | 1 | P1\_COMPARTMENT\_ID| Hidden | Static |Enter your OCI account Compartment ID
   | 2 | P1\_CRED\_STATIC\_ID| Hidden | Static | APEX\_OCI\_AI\_CRED |
   | 3 | P1\_NAMESPACE\_NAME| Hidden | Static | Enter  Namespace which you copied while creating a Bucket|
   | 4 | P1\_BUCKET\_NAME| Hidden | Static | Enter the Bucket Name which you copied while creating a Bucket |
   | 5 | P1\_FEATURE\_TYPE| Hidden | Static | KEY\_VALUE\_EXTRACTION |
   | 6 | P1\_REGION| Hidden | Static | Enter your Region. e.g. us-ashburn-1 |
   | 7 | P1\_RESPONSE| Hidden |  |  | CLOB
   | 8 | P1\_EMP\_NO| Hidden |  |  |
   {: title="Upload your Invoice Page Items"}

   ![hidden items](images/compartment-id1.png " ")

   ![hidden items](images/response-item.png " ")

9. Under **Upload your Invoice** region, right-click **P1\_ID** page item and select **Create Page Item Below**.

   ![hidden items](images/create-page-item-below.png " ")

10. In the property editor,  Enter/select the following details:

    - Under Identification:

        - Name: **P1\_FILE\_BLOB**

        - Type: **File Upload**

    - Under Display:

        - Display As: **Block Dropzone**

        - Dropzone Description: **Select an Invoice or Receipt**

    - Under Storage:

        - File Type: **image/jpeg,image/png,application/pdf**

    ![hidden items](images/file-blob.png " ")

11. Select **P1_STATUS** and update the following:

    - Source > Query Only: **Toggle On**

    ![Create Process](./images/query-only.png " ")

12. In the **Rendering** tab, right-click **Upload Your Invoice** region and select **Create Button**.

    ![create-button](images/create-btn.png " ")

13. In the property editor, enter/select the following:

     - Under Identification:

        - Button Name: **Process_Document**

        - Label: **Process Document**

     - Layout > Slot: **Create**

     - Behavior > Database Action: **SQL INSERT action**

     Click **Save**.

    ![create-button](images/btn-details.png " ")

14. Click **Save**.

## Task 4: Create Processes to upload Invoices to Object Storage and Automate DML

In this task, you'll create the backend processes required to upload invoices to OCI Object Storage and automate database operations. You will configure an execution chain, invoke a PL/SQL API to upload files, and add an automatic DML process to handle data persistence for the invoice records.

1. Navigate to **Processing** tab, right-click **Processing** and select **Create Process**.

    ![create process](images/create-process6.png " ")

2. In the property editor, enter/select the following details:

     - Under Identification:

         - Name: **Process Invoice**

         - Type: **Execution Chain**

    ![create process](images/process-invoice.png " ")

3. In the **Processing** tab, right-click **Process Invoice** process and select **Add Child Process**.

    ![Add Child Process](images/add-child-process.png " ")

4. In the Property Editor, enter/select the following:

    - Under Identification:

        - Name: **Upload to Object Storage**

        - Type: **Invoke API**

    - Under Settings:

        - Type: **PL/SQL Procedure or Function**

        - Procedure or Function: **UPLOAD\_FILE**

   ![Add Child Process details](images/upload-to-storage.png " ")

5. Under **Upload to Object Storage** process, expand Parameters and enter the following:

    |   | Parameters | Value > Type | Value > Item |
    |---|-----------|--------------|--------------|
    | 1 | p\_file\_content| item | P1\_FILE\_BLOB |
    | 2 | p\_static\_id| item | P1\_CRED\_STATIC\_ID |
    | 3 | p\_namespace| item | P1\_NAMESPACE_NAME |
    | 4 | p\_bucket| item | P1\_BUCKET\_NAME |
    | 5 | p\_region| item | P1\_REGION |
    {: title="Upload to Object Storage Parameters"}

    ![Add Child Process details](images/param-file-content.png " ")

6. Right-click **Process Invoice** process again and select **Add Child Process**.

    ![Add Child Process details](images/add-child-process1.png " ")

7. In the Property Editor, enter/select the following details:

    - Under Identification:

        - Name: **Automatic DML**

        - Type: **Form - Automatic Row Processing (DML)**

        - Form Region: **Upload Your Invoice**

    ![Add Child Process details](images/automatic-dml.png " ")

8. Click **Save**.

## Task 5: Integrate Document Understanding API and Parse the Response

In this task, you'll invoke the REST Source to analyze uploaded documents and implement PL/SQL logic to parse and store the extracted data in our database.

1. In the **Processing** tab, right-click **Process Invoice** and select **Add Child Process**.

    ![Add Child Process details](images/add-child-process1.png " ")

2. In the Property Editor, enter/select the following details:

     - Under Identification:

        - Name: **Integrate Document Understanding API**

        - Type: **Invoke API**

     - Under Settings:

        - Type: **REST Source**

        - REST Source: **Document Understanding API**

        - Operation: **POST**

    ![Add Child Process details](images/integrate-doc.png " ")

3. Under **Integrate Document Understanding API** process, expand Parameters and select **OBJECT\_NAME**, enter the following:

     - Under Value:

        - Type: **Item**

        - Item: **P1\_FILE\_NAME**

    ![Add Child Process details](images/doc-object-name.png " ")

4. Select **RESPONSE** parameter, enter/select the following:

    - Parameter > Ignore Output: **Toggle off**

    - Value > Item: **P1\_RESPONSE**

    ![Add Child Process details](images/doc-response.png " ")

5. Right-click **Process Invoice** process and select **Add Child Process**.

    ![Add Child Process details](images/add-child-process2.png " ")

6. In the Property Editor, enter/select the following details:

    - Identification > Name: **Parse the Response**

    - Source > PL/SQL Code: Copy and paste the below code into the code editor:

        ```
        <copy>
        INSERT INTO DOCAI_RESPONSE
                (
                    document_id,
                    field_type_code,
                    field_label,
                    label_score,
                    field_value
                )
        SELECT :P1_ID,
        field_type_code,
        field_label,
        label_score,
        field_value
        FROM   JSON_TABLE(:P1_RESPONSE, '$.pages[*]'
                COLUMNS (page_number       NUMBER        PATH '$.pageNumber',
                        NESTED PATH '$.documentFields[*]' COLUMNS
                        (field_type_code VARCHAR2(50)   PATH '$.fieldType',
                            field_label     VARCHAR2(100)  PATH '$.fieldLabel.name',
                            label_score     NUMBER         PATH '$.fieldLabel.confidence',
                            field_value     VARCHAR2(1000) PATH '$.fieldValue.value'
                            ))) jt
        WHERE  jt.field_type_code = 'KEY_VALUE';
        <copy>
        ```

    ![Add Child Process details](images/parse-response.png " ")

7. Click **Save**.

## Summary

You have now learned how to create an application by invoking OCI Document Understanding using a REST data source. You enhanced the home page to enable invoice uploads and document processing. Additionally, you created processes to upload invoices to Object Storage and automate DML operations, and you integrated the Document Understanding API to parse responses.

You're now ready to move on to the next lab!

## Acknowledgements

- **Author(s)** - Roopesh Thokala, Senior Product Manager; Ankita Beri, Product Manager
- **Contributing Author** - Pankaj Goyal, Member Technical Staff
- **Last Updated By/Date** - Pankaj Goyal, Member Technical Staff, December 2025
