# Integrate OCI Vision with Oracle APEX

## Introduction

OCI Vision can classify images into thousands of categories to simplify common digital asset management scenarios or identify items needing attention, such as X-ray anomalies. Developers can also identify and localize objects in images to automate counting common items, such as packages and vehicles.

Optionally, to get an overview of the OCI Vision service, try the [AI Services: Introduction to OCI Vision](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=931&p210_wec=&session=6626792478361) workshop.

In this lab, you learn how to integrate OCI Vision REST API with Oracle APEX to analyze and index the images and images with text uploaded by the user.

Estimated Time: 20 Minutes

### Objectives

In this lab, you:

- Export ONNX Pipeline Model
- Grant Access to Database
- Load the ONNX Model onto the Database

## Task 1: Export ONNX Pipeline Model

In this task, you will export the CLIP Model, ONNX Pipeline Model using the OML4PY Client

1. Navigate to terminal where you have installed the OML4PY client and to start Python, copy paste the following:

    ```
     <copy>
     Python
     </copy>
    ```

   ![Start Python](images/start-python.png " ")

2. Import OML and connect to a local database/ADB:

    ```
     <copy>
     import oml
     oml.connect(user="USERNAME", password="PASSWORD", host="host.oracle.com", port=1521, service_name="service.oracle.com")
     </copy>
    ```

   ![Import OML and Connect to DB](images/import-oml.png " ")

3. To get a list of all preconfigured models, import ONNXPipelineConfig from oml.utils

    ```
     <copy>
     from oml.utils import ONNXPipelineConfig, ONNXPipeline
     print(ONNXPipelineConfig.show_preconfigured())
     </copy>
    ```

   ![List Preconfigured Model](images/list-model.png " ")

4. Export the CLIP  preconfigured embedding model to a local folder
    ```
     <copy>
     em = ONNXPipeline("openai/clip-vit-base-patch32")
     em.export2file("model_Clip_Test",output_dir="/scratch/")
     </copy>
    ```

   ![Export Model ](images/export-model.png " ")


14. Click **Apply Changes**.

    ![Click Timeline](images/apply-changes.png " ")

## Task 2: Invoke the OCI Vision REST Data Source for Image Classification

In this task, you create a page process to invoke the OCI Vision REST Data Source for image classification implemented in the previous task.

1. Navigate to the application homepage by clicking the **Application ID**.

   ![Click Timeline](images/click-app-id11.png " ")

2. Click **1-Timeline** page.

   ![Click Timeline](images/select-timeline1.png " ")

3. Right-click **Timeline** region in the Rendering Pane and Select **Create Page Item**.

   ![Click Timeline](images/create-page-item2.png " ")

4. In the Property Editor, enter the following:

    - Under Identification:

        - Name: **P1\_RESPONSE**

        - Type: **Hidden**

   ![Click Timeline](images/response-page-item1.png " ")

5. Navigate to the **Processing** Tab (left pane), right-click **Processes** and select **Create Process**.

   ![Click Timeline](images/processing.png " ")

6. In the Property Editor, enter the following:

    - Under Identification:

        - Name: **Analyze Image**

        - Type: **Execution Chain**

    - Settings > Enable **Run in Background**.

    ![Click Timeline](images/analyze-image1.png " ")

7. Right click on the **Analyze Image** process and select **Add Child Process**.

    ![Click Timeline](images/add-child-process11.png " ")

8. In the Property Editor, enter the following:

    - Under Identification:

        - Name: **Image Classification**

        - Type: **Invoke API**

    - Under Settings:

        - Type: **REST Source**

        - REST Source: **OCI Vision**

        - Operation: **POST**

    ![Click Timeline](images/child-process11.png " ")

9. Expand Parameters and Select **COMPARTMENT\_ID** and enter the following:

    - Under Value:

        - Type: **Static Value**

        - Value: **Enter the Compartment ID.**

   *Note: If using the root compartment, enter the tenancy OCID from the configuration preview file generated during API Key creation. If you use a different compartment, you can find the corresponding compartment OCID from the OCI Console.*

   ![Click Timeline](images/compartment-id.png " ")

10. Select **FEATURE_TYPE** and enter the following:

    - Under Value:

        - Type: **Static Value**

        - Value: **IMAGE_CLASSIFICATION**

    ![Click Timeline](images/feature-type.png " ")

11. Select **FILE_DATA** and enter the following:

    - Under Value:

        - Type: **SQL Query (Return Single Value)**

        - SQL Query: Copy and paste the below code in the SQL Code editor:

            ```
             <copy>
             select replace(replace(apex_web_service.blob2clobbase64(file_blob), chr(10),''),chr(13),'')
             from SM_posts
             where ID = :P1_ID;
             </copy>
            ```

    ![Click Timeline](images/file-data.png " ")

12. Select **RESPONSE** and enter the following:

    - Parameter > Disable **Ignore Output**

    - Value > Item: Select **P1\_RESPONSE**

    ![Click Timeline](images/response-param.png " ")

13. Right click on the **Analyze Image** process and select **Add Child Process**.

    ![Click Timeline](images/add-child-process12.png " ")

14. In the Property Editor, enter the following:

    - Identification > Name: **Parse Image Classification Response**

    - Source > PL/SQL Code: Copy and paste the below code in the PL/SQL Code editor:

        ```
         <copy>
         UPDATE SM_POSTS
         SET
         AI_OUTPUT = (
            SELECT
                LISTAGG(obj_name, ',') WITHIN GROUP(
                ORDER BY
                    obj_name
                )
            FROM
                JSON_TABLE ( :P1_RESPONSE, '$.labels[*]'
                    COLUMNS
                        obj_name VARCHAR2 ( 100 ) PATH '$.name[*]'
                )
         )
         WHERE
         ID = :P1_ID;
         </copy>
        ```

    ![Click Timeline](images/parse-response1.png " ")

15. Click **Save**.

## Task 3: Invoke the OCI Vision REST Data Source for Text Detection

In this task, you duplicate the page process to invoke the OCI Vision REST Data Source for text detection.

1. Under Processing, right-click **Image Classification** and select **Duplicate**. Drag and drop it under Parse Image classification Response.

    ![Click Timeline](images/duplicated1.png " ")

    ![Click Timeline](images/drag1.png " ")

2. In the Property Editor, enter the following:

    - Identification > Name: **Text Detection**

    ![Click Timeline](images/text-detection.png " ")

3. Expand Parameters, select **FEATURE_TYPE** and enter the following:

    - Under Value :

        - Type: **Static Value**

        - Value: **TEXT_DETECTION**

    ![Click Timeline](images/feature-type1.png " ")

4. Right click on the **Parse Image classification Response** child process and select **Duplicate**. Drag and drop it after **Text Detection**.

    ![Click Timeline](images/duplicate2.png " ")

    ![Click Timeline](images/drag2.png " ")

5. In the Property Editor, enter the following:

    - Identification > Name : **Parse Text Detection Response**

    - Source > PL/SQL Code: Update the below code in the PL/SQL Code editor:

        ```
         <copy>
         UPDATE SM_POSTS
         SET
         AI_OUTPUT_TD = (
            SELECT
                LISTAGG(obj_name, ',') WITHIN GROUP(
                ORDER BY
                    obj_name
                )
            FROM
                JSON_TABLE ( :P1_RESPONSE, '$.imageText.words[*]'
                    COLUMNS
                        obj_name VARCHAR2 ( 100 ) PATH'$.text[*]'
                )
         )
         WHERE
         ID = :P1_ID;
         </copy>
        ```

        ![Click Timeline](images/parse-text.png " ")

6. Click **Save**.

## Task 4: Enhance Timeline Region to include AI Search

In this task, you create a search bar where the end user can enter the search terms and search through the images and texts.

1. Go to the Rendering tab, right-click **After Logo** and select **Create Page Item**.

    ![Click Timeline](images/after-logo-page-item1.png " ")

2. In the property editor, enter the following:

    - Identification > Name: **P1\_AI\_SEARCH**

    - Label > Label: **AI Search**

    - Settings > Enable **Submit when Enter pressed**

    - Appearance > Width: **100**

   ![Click Timeline](images/ai-search-page-item1.png " ")

3. Select the **Timeline** region in the property editor and enter the following:

    ```
     <copy>
     select
     p.id,
     p.created_by AS user_name,
     p.post_comment AS comment_text,
     p.file_blob,
     p.file_mime,
     apex_util.get_since(p.created) post_date,
     (
     select count(*) from SM_REACTIONS smr
     where smr.post_id=p.id
     ) as REACTIONS,
     (
     select 'user-has-liked' from SM_REACTIONS smr
     where smr.post_id=p.id and created_by=UPPER(:APP_USER)
     ) USER_REACTION_CSS
     from SM_POSTS p
     where (:P1_AI_SEARCH IS NOT NULL AND
     (upper(ai_output) like upper('%'||:P1_AI_SEARCH||'%') OR upper(ai_output_td) like upper('%'||:P1_AI_SEARCH||'%')
     )
     )OR :P1_AI_SEARCH IS NULL
     order by p.created desc;
     <copy>
    ```

    - Page items to Submit: Select **P1\_AI\_SEARCH**

    ![Click Timeline](images/timeline-query11.png " ")

4. Click **Save and Run**.

## Summary

You now know how to integrate OCI AI Vision into Oracle APEX through a REST API Call.

You may now **proceed to the next lab**.

## Acknowledgments

- **Author** - Roopesh Thokala, Senior Product Manager
- **Co-Author** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Sahaana Manavalan,Senior Product Manager, January 2025
