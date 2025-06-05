# Implement Image and Text Search

## Introduction

In this lab, you will enhance your APEX Social Media app by integrating semantic search capabilities that allow users to search posted images using either text or another image as the search query. Instead of relying on traditional keyword filtering, the app will understand the meaning and visual content of the query to return relevant, context-aware results.

By the end of this lab, your APEX application will support real-time, AI-powered search, enabling users to find similar or related posted images through natural language or visual input.

Estimated Time: 20 minutes

### Objectives

In this lab, you will:

- Create a Search Configuration for semantic search on posted images.

- Build a Search Page that allows users to search posted images using text queries.

- Create a Search Page for image-to-image search, where users can upload an image to find visually similar posted images.

- Edit the Timeline region to automatically generate image embeddings using the image vector provider whenever a new image is posted. These embeddings are stored in the database to support future semantic searches.

## Task 1:  Create Search Configuration for Text-Based Search

In this task, you will create a search configuration in Oracle APEX using the CLIP text vector provider, and then build a search page that allows users to perform semantic searches based on text input.

1. Navigate to **App Builder.**

    ![App Builder page](images/app-builder2.png " ")

2. Select the **APEX Social Media** application.

    ![App Builder page](images/app_builder_homepage2.png " ")

3. Select **Shared Components**.

    ![Shared components](images/shared-components.png " ")

4. Under Navigation and Search, Select **Search Configurations**.

    ![Shared components](images/shared-components2.png " ")

5. Click **Create**.

    ![Create Search Configuration](images/create-sc.png " ")

6. In the Create Search Configuration Wizard, enter the following:

    - Name: **TEXT SEARCH**
    - Search Type: **Oracle Vector Search**

    Click **Next**.

    ![Create Search Configuration](images/create-sc2.png " " =60%x*)

7. Enter/Select the following:

    - Vector Provider: **CLIP TEXT MODEL**
    - Source Type: **Table**
    - Table / View Owner: **select your schema**
    - Table / View Name: **SM_POSTS**

    Click **Next**.

    ![Create Search Configuration](images/create-sc3.png " " =60%x*)

8. Select the following:

    - Primary key Column: **ID**
    - Vector Column: **AI\_IMAGE\_VECTOR**
    - Title Column: **UPDATED_BY**

    Click **Create Search Configuration**.

    ![Create Search Configuration](images/create-sc4.png " " =60%x*)

9. In the Search Configuration Page, enter/select the following:

    - Under Icon and Display:
        - Icon Source: **Image bLOB Column**
        - Icon BLOB Column Name: **FILE_BLOB**
        - Default Result Row Template: Copy and paste the following code:

            ```
             <copy>
             <div class="a-ResultsItem &RESULT_CSS_CLASSES!ATTR.">
              {if ?ICON_VALUE/}
                {case ICON_TYPE/}
                {when INITIALS/}
                    <div class="a-ResultItem-initials u-color-var">&ICON_VALUE.</div>
                {when URL/}
                    <div class="a-ResultItem-image"><img src="&ICON_VALUE!ATTR." alt="&ENAME!ATTR." role="presentation" /></div>
                {when CLASS/}
                    <div class="a-ResultItem-icon u-color-var"><span class="fa &ICON_VALUE!ATTR." aria-hidden="true"></span></div>
                {endcase/}
             {endif/}
             </div>
             </copy>
            ```

        Click **Apply Changes**.

    ![Create Search Configuration](images/create-sc5.png " ")

## Task 2: Add Search Page for Text

In this task, we will create a Search page for Text based search.

1. Navigate to the Application homepage.

    ![App Builder](images/app-navigate.png " ")

2. Click **Create Page**.

    ![Create Page](images/create-paget.png " ")

3. In the Create a Page Wizard, Select **Search Page**.

    ![Create Page](images/create-paget2.png " " =60%x*)

4. In the Create Page Wizard, enter/select the following:

    - Page Definition > Name: **Text to Image**

    - Search Configurations > **Click the check box for Text Search**.

    ![Create Page](images/create-paget3.png " " =60%x*)

5. In the Rendering Tree, select **Page:Text to Image** and in the property  editor, copy paste the following under CSS > Inline.

    ```
     <copy>
     img{
        width : 200px;
        height : 200px;
        }
     .a-SearchResults-list{
        flex-direction: row;
        flex-wrap: wrap;
        }
     </copy>
    ```

    ![CSS Inline](images/css-inline.png " ")

6. Click **Save** to save the Page.

    ![Save and Run page](images/save-run2.png " ")

## Task 3: Create Search Page for Image

1. Click on the **+** Icon on the top right corner and select
**Page**.

    ![Create page](images/create-pages1.png " ")

2. In the Create a Page Wizard, select the Component as **Cards** and click **Next**.

    ![Create page](images/create-pages2.png " " =60%x*)

3. In the Create Cards Wizards, enter/select the following:

    - Page Definition > Name : **Image to Image**

    - Under Data Source:

        - Source Type: **SQL Query**
        - Enter a SQL SELECT statement: copy and paste the below query:

        ```
         <copy>
         WITH vector_image AS (
            SELECT apex_ai.get_vector_embeddings (
                p_value   =>  apex_web_service.blob2clobbase64(blob_content),
                p_service_static_id => 'clip_image_model') as img_vector
            FROM apex_application_temp_files
            WHERE filename = :P3_FILENAME
            ORDER BY created_on DESC
            FETCH FIRST 1 ROWS ONLY
            )
            SELECT A.*,
                TO_CHAR(ROUND(vector_distance, 3), '0.999') AS vector_distance_display
            FROM (
            SELECT
                p.id,
                p.post_comment,
                p.file_blob,
                p.file_mime,
                p.file_name,
                p.created,
                p.created_by,
                p.updated,
                p.updated_by,
                CASE
                    WHEN EXISTS (SELECT 1 FROM vector_image) THEN
                        COSINE_DISTANCE(
                            (SELECT img_vector FROM vector_image),
                            p.ai_image_vector
                        )
                    ELSE null
                END AS vector_distance
            FROM sm_posts p
            ) A
            ORDER BY A.vector_distance, A.created DESC;
         </copy>
        ```

    Click **Next**.

    ![Create page](images/create-pages3.png " " =60%x*)

4. In the Create Cards Wizard, select the following:

    - Cards Attributes > Title Column: **VECTOR\_DISTANCE\_DISPLAY**

    Click **Create Page**.

    ![Create page](images/create-pages4.png " " =60%x*)

5. In the Rendering tree, right click on the **Body** and select **Create Page Item**.

    ![Create Page item](images/create-pageitem1.png " ")

6. In the Property Editor, enter/select the following:

    - Under Identification:

        - Name: **P3_IMAGE**

        - Type: **Image Upload**

    - Label > Label: **Upload Image for Search**

    - Display > Display As: **Block Dropzone**

    - Layout > Sequence: **10**

    ![Page item](images/create-pageitem2.png " ")

    ![Page item](images/create-pageitem3.png " ")

7. Right click on the **P3_IMAGE** page item and select **Create Dynamic Action**

    ![Create Dynamic Action](images/create-das1.png " ")

8. Select the **New** Action and enter the following in the property editor:
    - Identification > Name: **Submit Image**

    ![Create Dynamic Action](images/create-das2.png " ")

9. Under True, select **Show** and enter/select the following in the property editor:

    - Identification > Action: **Submit Page**

    ![True Dynamic Action](images/das3.png " ")

10. In the Rendering Tree, right click on **Body** and select **Create Page Item**.

    ![Create Page Item](images/create-pi.png " ")

11. In the property editor, enter/select the following:

    - Under Identification:
        - Name: **P3_FILENAME**
        - Type: **Hidden**

    - Settings > Value Protected: **Toggle Off**

    ![Filename Item](images/create-pe2.png " ")

12. Right click on the **P3_FILENAME** page item and select **Create Computation**

    ![Create Computation](images/create-computation1.png " ")

13. In the property editor, enter/select the following:

    - Execution > Point: **After Submit**

    - Computation > SQL Query: Copy and paste the below code:

        ```
         <copy>
         SELECT FILENAME FROM APEX_APPLICATION_TEMP_FILES  WHERE NAME =:P3_IMAGE
         </copy>
        ```

    ![Create Computation](images/create-computation2.png " ")

14. In the Rendering tree, right click on **Body** and select
**Create Page Item**.

    ![Create Page item](images/create-items5.png " ")

15. In the Property editor, enter the following:

    - Under Identification:

        - Name: **P3\_DISPLAY\_IMAGE**
        - Type: **Display Image**

    - Label > Label: **Uploaded Search Image**

    - Under Settings:

        - Based on: **BLOB Column returned by SQL statement**

        - SQL Statement: Copy and paste the below query
            ```
             <copy>
             SELECT BLOB_CONTENT FROM APEX_APPLICATION_TEMP_FILES
             WHERE NAME =:P3_IMAGE;
             </copy>
            ```
    - Layout > Column Span: **3**

    - Appearance > Template Options: Stretch Form Item

    - Under Server-side Condition:
        - Type: **Item is NOT NULL**
        - Item: **P3_IMAGE**

    ![Display Page item](images/pa-display.png " " =30%x*)

    ![Display Page item](images/create-items6.png " ")

    ![Display Page item](images/display-item2.png " ")

16. In the Rendering tree, under Body, select **Image to Image** region, and enter/select the following in the property editor:

    - Identification >  Name: **Search Results**

    - Source > Page Items to Submit: **P3_FILENAME**

    - Under Layout:
        - Sequence: **40**
        - Start New Row: Toggle **OFF**

    - Appearance > Template: **Standard**

    ![Property Editor cards](images/change-cards1.png " ")

    ![Property Editor cards](images/change-cards3.png " ")

    - Under Attributes:
        - Appearance > Grid Columns: **4 Columns**

        - Card > Primary Key Column 1: **ID**

        - Under Media:
            - Source: **BLOB Column**
            - BLOB Column: **FILE_COLUMN**
            - Position: **First**
            - Appearance: **Square**
            - Sizing: **Cover**

    ![Property Editor cards](images/card-attributes2.png " ")

    ![Property Editor cards](images/card-attributes.png " ")
17. In the Rendering tree, right click on **Body** and select **Create Button**.

    ![Create button](images/create-clear.png " ")

18. In the Property Editor, enter/select the following:

    - Identification > Button Name: **Clear**

    - Under Layout:
        - Sequence: **10**
        - Column: **12**

    - Under Appearance:
        - Template Options:
            - Type: **Primary**
            - Width: **Stretch**

            Click **Ok**.

    ![Save](images/clear-button.png " ")

19. **Save** the page.

    ![Save](images/save-page1.png " ")

## Task 4 : Embed the uploaded images

1. Click on the **Page Finder** and Navigate to **Page 1 : Timeline**.

    ![Navigate to Page 1](images/goto-page1.png " ")

2. Select the **Processes** tab.

    ![Processes tab](images/processes.png " ")

3. Right click on Processes and select **Create Process**.

    ![Processes tab](images/create-process2.png " ")

4. In the Property Editor, enter/select the following:

    - Under Identification:
        - Name: **Image embeddings**
        - Type: **Execution Chain**

    - Under Server-side Condition:

        - When Button Pressed: **ADD_POST**
        - Type: **Item is NOT NULL**
        - Item: **P1\_FILE\_BLOB**

    ![Process Property Editor](images/execution-chain.png " ")

5. In the Processes tab, right click on the **Image embeddings** process and select **Add Child Process**.

    ![Add Child Process](images/child-process.png " ")

6. In the Property Editor, enter/select the following:

    - Under Identification:
        - Name: **Vectorize**
        - Type: **Execute Code**

    - Source > PL/SQL Code : Copy and paste the below code:

        ```
         <copy>
         BEGIN
         UPDATE sm_posts
         SET ai_image_vector = apex_ai.get_vector_embeddings (
            p_value   =>  apex_web_service.blob2clobbase64(file_blob),
            p_service_static_id => 'clip_image_model')
         WHERE id = :P1_ID;
         END;
         </copy>
        ```

    ![Process Property Editor](images/process-propertyeditor.png " ")

7. **Save** the page.

    ![Save application](images/save-run3.png " ")

## Summary

You have successfully enhanced the Social Media app by integrating semantic search features that enable users to search posted images using text or image queries. You implemented search pages for both text-based and image-to-image searches and updated the Timeline region to automatically generate and store image embeddings whenever new images are posted. These enhancements empower your APEX application to deliver fast, accurate, and intelligent search results powered by AI.

## Acknowledgments

- **Author** - Sahaana Manavalan, Senior Product Manager, June 2025
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, June 2025
