# Integrate OCI Vision with Oracle APEX

## Introduction

OCI Vision can classify images into thousands of categories to simplify common digital asset management scenarios or identify items needing attention, such as X-ray anomalies. Developers can also identify and localize objects in images to automate counting common items, such as packages and vehicles.

Optionally, to get an overview of the OCI Vision service, try the [AI Services: Introduction to OCI Vision](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=931) workshop.

In this lab, you learn how to integrate OCI Vision REST API with Oracle APEX to analyze and index images and text within images uploaded by the user.

Estimated Time: 20 minutes

### Objectives

In this lab, you learn how to:

- Configure OCI Vision REST API as a REST Data Source.
- Invoke the OCI Vision REST Data Source for image classification.
- Invoke the OCI Vision REST Data Source for text detection.
- Enhance the Timeline region to include AI search.

## Task 1: Configure OCI Vision REST API as a REST Data Source

In this task, you create a REST Data Source with OCI Vision REST API as the endpoint.

1. In the left navigation bar, click the **App Builder** icon.

    ![Click App Builder](images/nav-to-app.png " ")

2. In the App Builder home page, click the **Application Name**.

    ![Click the application name in App Builder](images/nav-app.png " ")

3. In the Application home page, click **Shared Components**.

    ![Click Shared Components](images/shared.png " ")

4. Under Data Sources, click **REST Data Sources**.

    ![Click REST Data Sources](images/rest.png " ")

5. Click **Create**.

    ![Click Create](images/create-rest.png " ")

6. Leave the defaults and click **Next**.

    ![Leave the defaults and click Next](images/create-rest1.png " ")

7. Under Create REST Data Source, enter the following attributes.

    - REST Data Source Type: **Oracle Cloud Infrastructure (OCI)**

    - Name: **OCI Vision**

    - URL Endpoint: **<https://vision.aiservice.us-ashburn-1.oci.oraclecloud.com/20220125/actions/analyzeImage>**

    **Note:** The URL Endpoint may differ based on your OCI tenancy. For more information, see <https://docs.oracle.com/en-us/iaas/api/#/en/vision/20220125>.

    Click **Next**.

    ![Enter OCI Vision REST Data Source details](images/create-rest2.png " ")

8. Under Create REST Data Source - Remote Server, leave the defaults.

    Click **Next**.

    ![Click Next on Remote Server](images/remote-server.png " ")

9. Under Authentication, enter/select the following:

    - Authentication Required: **Toggle On**

    - Credentials: **apex\_ai\_cred**

    Click **Create REST Source Manually**.

    The REST Data Source is created successfully. The next step is to configure the POST operation parameters for this REST Data Source.

    ![Set Authentication and click Create REST Source Manually](images/auth.png " ")

10. On the REST Data Sources page, click **OCI Vision**.

    ![Click OCI Vision REST Data Source](images/rest-data-authentication.png " ")

11. Select the Operations tab.

    Click the **Edit** icon for the **POST** operation.

    ![Click Edit for POST operation](images/edit-post.png " ")

12. In the REST Source Operation page, enter the following:
    - Database Operation: **-Not Mapped-**

    - Request Body Template: Copy and paste the following JSON:

        ```json
        <copy>
        {
            "compartmentId": "#COMPARTMENT_ID#",
            "image": {
                "source": "INLINE",
                "data": "#FILE_DATA#"
            },
            "features": [
                {
                    "featureType": "#FEATURE_TYPE#",
                    "maxResults": 5
                }
            ]
        }
        </copy>
        ```

    ![Enter Request Body Template JSON](images/post.png " ")

13. Under Operation Parameters, click **Synchronize with body**.

    ![Click Synchronize with body](images/syncro.png " ")

14. In the pop-up window, click **OK**.

    ![Click OK in the Synchronize with Body dialog](images/add-parameter.png " ")

15. Under Operation Parameters, click **Add Parameter**.

    ![Click Add Parameter](images/add-comp.png " ")

16. In the **Edit REST Data Source Parameter** dialog, add the following two parameters one after the other:

    | #   | Type                     | Name         | Direction | Static | Default Value Type | Static Value |
    | --- | ------------------------ | ------------ | --------- | ------ | ------------------ | ------------ |
    | 1   | Request or Response Body | RESPONSE     | Out       |        |                    |              |
    | 2   | HTTP Header              | Content-Type | In        | ON     | Static             | application/json |
    {: title="POST Operation Parameters"}

    ![Add RESPONSE parameter](images/response.png " ")

    ![Add Content-Type parameter](images/content-type.png " ")

17. Click **Apply Changes**.

    ![Click Apply Changes](images/apply-changes.png " ")

## Task 2: Invoke the OCI Vision REST Data Source for Image Classification

In this task, you create a page process to invoke the OCI Vision REST Data Source for image classification implemented in the previous task.

1. Navigate to the application home page by clicking the **Application ID**.

    ![Click the Application ID](images/click-app-id11.png " ")

2. Click the **1-Timeline** page.

    ![Click 1-Timeline page](images/select-timeline1.png " ")

3. In the Rendering tab, right-click the **Timeline** region and select **Create Page Item**.

    ![Right-click Timeline and select Create Page Item](images/create-page-item.png " ")

4. In the Property Editor, enter the following:

    - Under Identification:

        - Name: **P1\_RESPONSE**

        - Type: **Hidden**

    ![Set Name to P1_RESPONSE and Type to Hidden](images/response-page-item.png " ")

5. In the left pane, navigate to the **Processing** tab.

    Right-click **Processes** and select **Create Process**.

    ![Right-click Processes and select Create Process](images/processing.png " ")

6. In the Property Editor, enter/select the following:

    - Under Identification:

        - Name: **Analyze Image**

        - Type: **Execution Chain**

    - Under Background Execution:

        - Run in Background: **Toggle On**

    ![Configure Analyze Image Execution Chain](images/analyze-image.png " ")

7. Right-click the **Analyze Image** process and select **Add Child Process**.

    ![Right-click Analyze Image and select Add Child Process](images/add-child-process.png " ")

8. In the Property Editor, enter the following:

    - Under Identification:

        - Name: **Image Classification**

        - Type: **Invoke API**

    - Under Invoke:

        - Type: **REST Source**

        - REST Source: **OCI Vision**

        - Operation: **POST**

    ![Configure Image Classification Invoke API](images/child-process.png " ")

9. In the **Rendering Tree** under the newly created child process **Image Classification**, expand Parameters and select **COMPARTMENT\_ID**. Enter the following:

    - Under Value:

        - Type: **Static Value**

        - Value: Enter the compartment OCID.

    *Note: If using the root compartment, enter the tenancy OCID from the configuration preview file generated during API key creation. If you use a different compartment, you can find the corresponding compartment OCID from the OCI Console.*

    ![Set COMPARTMENT_ID static value](images/compartment-id.png " ")

10. Select **FEATURE_TYPE** and enter the following:

    - Under Value:

        - Type: **Static Value**

        - Value: **IMAGE_CLASSIFICATION**

    ![Set FEATURE_TYPE to IMAGE_CLASSIFICATION](images/feature-type.png " ")

11. Select **FILE_DATA** and enter the following:

    - Under Value:

        - Type: **SQL Query (Return Single Value)**

        - SQL Query: Copy and paste the following code in the SQL Code editor:

            ```sql
            <copy>
            SELECT REPLACE(REPLACE(apex_web_service.blob2clobbase64(file_blob), CHR(10), ''), CHR(13), '')
            FROM sm_posts
            WHERE id = :P1_ID;
            </copy>
            ```

    ![Set FILE_DATA with SQL query](images/file-data.png " ")

12. Select **RESPONSE** and enter the following:

    - Under Parameter:

        - Ignore Output: **Toggle Off**

    - Under Value:

        - Type: **Item**
        - Item: **P1\_RESPONSE**

    ![Set RESPONSE to P1_RESPONSE item](images/response-param.png " ")

13. In the Rendering Tree, right-click the **Analyze Image** process and select **Add Child Process**.

    ![Right-click Analyze Image and add another child process](images/add-child-process2.png " ")

14. In the Property Editor, enter the following:

    - Under Identification:

        - Name: **Parse Image Classification Response**

    - Under Source:

        - PL/SQL Code: Copy and paste the following code in the PL/SQL Code editor:

        ```sql
        <copy>
        UPDATE sm_posts
        SET ai_output = (
            SELECT LISTAGG(obj_name, ',') WITHIN GROUP (ORDER BY obj_name)
            FROM JSON_TABLE(:P1_RESPONSE, '$.labels[*]'
                COLUMNS obj_name VARCHAR2(100) PATH '$.name'
            )
        )
        WHERE id = :P1_ID;
        </copy>
        ```

    ![Enter Parse Image Classification PL/SQL code](images/parse-response.png " ")

15. Click **Save**.

    ![Click Save](images/save-page.png " ")

## Task 3: Invoke the OCI Vision REST Data Source for Text Detection

In this task, you duplicate the page process to invoke the OCI Vision REST Data Source for text detection.

1. Under Processing, right-click **Image Classification** and select **Duplicate**.

    ![Duplicate Image Classification process](images/duplicated-process.png " ")

2. In the Property Editor, modify the following:

    - Under Identification:

        - Name: **Text Detection**

    - Under Execution:

        - Sequence: **40**

    ![Rename to Text Detection](images/text-detections.png " ")

3. In the Rendering Tree under **Text Detection**, expand **Parameters** and select **FEATURE_TYPE**. Modify the following:

    - Under Value:

        - Value: **TEXT_DETECTION**

    ![Set FEATURE_TYPE to TEXT_DETECTION](images/text-detection.png " ")

4. Right-click the **Parse Image Classification Response** child process and select **Duplicate**.

    ![Duplicate Parse Image Classification process](images/duplicate-proc.png " ")

5. In the Property Editor, modify the following:

    - Under Identification:

        - Name: **Parse Text Detection Response**

    - Under Source:

        - PL/SQL Code: Update the code in the PL/SQL Code editor:

            ```sql
            <copy>
            UPDATE sm_posts
            SET ai_output_td = (
                SELECT LISTAGG(obj_name, ',') WITHIN GROUP (ORDER BY obj_name)
                FROM JSON_TABLE(:P1_RESPONSE, '$.imageText.words[*]'
                    COLUMNS obj_name VARCHAR2(100) PATH '$.text'
                )
            )
            WHERE id = :P1_ID;
            </copy>
            ```

    - Under Execution:

        - Sequence: **60**

        ![Enter Parse Text Detection PL/SQL code](images/parse-text.png " ")

6. Click **Save**.

    ![Click Save](images/save-pages.png " ")

## Task 4: Enhance the Timeline Region to Include AI Search

In this task, you create a search bar where the user can enter search terms and search through images and text.

1. Go to the Rendering tab, right-click **After Logo**, and select **Create Page Item**.

    ![Right-click After Logo and select Create Page Item](images/after-logo-page-item.png " ")

2. In the Property Editor, enter the following:

    - Identification > Name: **P1\_AI\_SEARCH**

    - Label > Label: **AI Search**

    - Settings > Enable **Submit when Enter pressed**

    - Appearance > Width: **100**

    ![Configure P1_AI_SEARCH page item](images/ai-search-page-item.png " ")

3. In the Property Editor, select the **Timeline** region and enter the following:

    - Under **Source**:

        - SQL Query: Copy and paste the following query:

            ```sql
            <copy>
            SELECT
                p.id,
                p.created_by AS user_name,
                p.post_comment AS comment_text,
                p.file_blob,
                p.file_mime,
                apex_util.get_since(p.created) post_date,
                (
                    SELECT COUNT(*)
                    FROM sm_reactions smr
                    WHERE smr.post_id = p.id
                ) AS reactions,
                (
                    SELECT 'user-has-liked'
                    FROM sm_reactions smr
                    WHERE smr.post_id = p.id
                        AND created_by = UPPER(:APP_USER)
                ) user_reaction_css
            FROM sm_posts p
            WHERE (
                    :P1_AI_SEARCH IS NOT NULL
                    AND (
                        UPPER(ai_output) LIKE UPPER('%' || :P1_AI_SEARCH || '%')
                        OR UPPER(ai_output_td) LIKE UPPER('%' || :P1_AI_SEARCH || '%')
                    )
                )
                OR :P1_AI_SEARCH IS NULL
            ORDER BY p.created DESC;
            </copy>
            ```

        - Page items to Submit: **P1\_AI\_SEARCH**

    ![Update Timeline region SQL query](images/timeline-query.png " ")

4. Click **Save and Run**.

    ![Click Save and Run](images/save-run.png " ")

## Summary

You now know how to integrate OCI Vision into Oracle APEX through a REST API call.

You may now **proceed to the next lab**.

## Acknowledgments

- **Author** - Roopesh Thokala, Principal Product Manager; Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, May 2026
