# Generate Email to Apply to a School using Gen AI

## Introduction

In this lab, you configure a button for the student's parent to apply to a school they are interested in. The application body letter is generated using the Generative AI service. The parent can review and edit the letter before submitting the application.

**Note:** The screenshots in this workshop are taken using Dark Mode in APEX 24.2

Estimated Time: 15 minutes

<!-- Watch the video below for a quick walk-through of the lab.
[Create an APEX App](videohub:1_a6bi2e62) -->

### Objectives

In this lab, you will:

- Configure an option for the student's parent to apply to a school
- Use Generate Text with AI dynamic action to generate text for the application letter

## Task 1: Create a Table to Store the Applications

1. Navigate to **SQL Workshop** > **Utilities** > **Quick SQL**.

    ![Navigation bar menu](images/nav-quick-sql.png ' ')

2. In the Quick SQL editor, copy and paste the following short hand syntax:

    ```
    <copy>

    NYC_SCHOOLS_APPS
        PARENT_USER vc255 /nn
        PARENT_NAME vc255 /nn
        PARENT_EMAIL vc255 /nn
        STUDENT_NAME vc255 /nn
        LETTER vc4000 /nn
        DISPOSITION vc16 DEFAULT 'PENDING' /nn
        SCHOOL_ID num /fk HIGHSCHOOLS
        CREATED date /default SYSDATE /nn
        UPDATED date
        UPDATED_BY vc255

    </copy>
    ```
    ![SQL Commands Page](images/quick-sql.png ' ') 

3. Click **Review and Run**.
    ![SQL Commands Page](images/review-run.png ' ') 

4. For Script Name, enter **NYC\_SCHOOLS\_APPS\_TABLE** and click **Run**.
    ![SQL Commands Page](images/script-name.png ' ') 

5. Click **Run Now**.
    ![SQL Commands Page](images/run-now.png ' ') 

6. The summary displays that the statements were processed successfully and the table was created.
    ![SQL Commands Page](images/success.png ' ') 

## Task 2: Create a Form Page

Let us create a new Form page for school application.

1. Navigate to your Application homepage and click **Create Page**. Select **Form**.

    ![Create page wizard](images/create-form.png ' ')

2. In the Create Form wizard, enter/select the following:
    - Under **Page Definition**
        - Page Number: **3**
        - Name: **Apply to School**
        - Page Mode: **Drawer**
    - Under **Data Source**
        - Table/View Name: **NYC\_SCHOOLS\_APPS**

    Click **Next**.

     ![Create page wizard](images/form-details.png ' ')

3. Accept the Primary Key Column 1's default value as ID (Number) and click **Create Page**.

    ![Create page wizard](images/create-page.png ' ')

4. In the Rendering tree, select the following page items under Region Body at once:
    - P3\_SCHOOL\_ID
    - P3\_PARENT\_USER
    - P3_LETTER
    - P3_DISPOSITION
    - P3_CREATED
    - P3_UPDATED
    - P3\_UPDATE\_BY

    In the Property Editor, select Type as **Hidden**.

    ![Page Designer](images/type-hidden.png ' ')

5. In the Rendering Tree, select the page item **P3\_PARENT\_NAME**. In the Property Editor, enter/select the following:

    - Identification > Type: **Display Only**
    - Under Default:
        - Type: **SQL Query (return single value)**
        - SQL Query (return single value):
        ```
        <copy>
        select initcap(first_name) || ' ' || initcap(last_name)
        from APEX_WORKSPACE_APEX_USERS
        where user_name=:APP_USER;

        </copy>
        ```

    ![Page Designer](images/parent-name.png ' ')

6. Now, select the page item **P3\_PARENT\_USER**. In the Property Editor, enter/select the following:
    - Under Default:
        - Type: **Expression**
        - PL/SQL Expression - **:APP_USER**

   ![Page Designer](images/parent-user.png ' ')

7. Select the page item **P3_DISPOSITION**. In the Property Editor, enter/select the following:
    - Under Default:
        - Type: **Static**
        - Static Value: **APPLIED**

    ![Page Designer](images/disposition.png ' ')

8. Select the page item **P3\_PARENT\_EMAIL**. In the Property Editor, enter/select the following:
    - Identification > Type: **Display Only**
    - Under Default:
        - Type: **SQL Query (return single value)**
        - SQL Query (return single value):
        ```
        <copy>
        select email from APEX_WORKSPACE_APEX_USERS where user_name=:APP_USER;
        </copy>
        ```
    ![Page Designer](images/parent-email.png ' ')

9. In the left pane, right-click **P3\_STUDENT\_NAME**, and select **Create Button Below**.
    ![Page Designer](images/create-button-below.png ' ')

10. In the Property Editor, enter/select the following:

    - Under Identification:
        - Button Name: **GENERATE_LETTER**
        - Label: **Generate Letter**

    ![Page Designer](images/generate-letter.png ' ')

11. In the left pane, right-click **Generate Letter** Button and select **Create Page Item Below**.

    ![Page Designer](images/create-item-below.png ' ')

12. In the Property Editor, enter/select the following:
    - Under Identification:
        - Name: **P3\_EMAIL**
        - Type: **Rich Text Editor**

     ![Page Designer](images/p7-email.png ' ')

13. In the left pane, right-click **P3\_LETTER** and select **Create Computation**.

    ![Page Designer](images/create-computation.png ' ')

14. With the computation selected, enter/select the following in the Property Editor:

    - Execution > Point: **After Submit**
    - Under Computation:
        - Type: **Item**
        - Item Name: **P3_EMAIL**

    ![Page Designer](images/computation-details.png ' ')

<!-- 15. Now that we edited the page items, let's add one last page item for sending a final prompt to the Gen AI service. In the Rendering Tree, right-click **Apply to School** form region and select **Create Page Item**.

    ![Page Designer](images/create-final-prompt.png ' ')

16. In the Property Editor, enter/select the following:
    - Under Identification:
        - Name: **P7\_FINAL\_PROMPT**
        - Type: **Hidden**

    ![Page Designer](images/final-prompt-name.png ' ')
-->
15. Delete the buttons that we no longer need. Select **CANCEL**, **DELETE**, and **SAVE**. Right-click and select **Delete**.
    ![Page Designer](images/delete-buttons.png ' ')

16. Select the **CREATE** button. In the Property editor, enter/select the following:

    - Identification > Label: **Send Application**
    - Under Appearance:
        - Button Template: **Text with Icon**
        - Icon: **fa-send-o**

    Click **Save**.

    ![Page Designer](images/edit-create.png ' ')

## Task 3: Create an AI Configuration 
In this task, we create an AI configuration with a RAG source. This will serve as the input for the 'Generate Text with AI' dynamic action in the upcoming task.
1. Navigate to Shared Components
    ![Page Designer](images/nav-shared-components.png ' ')

2. Under Generative AI, click AI Configurations.

    ![Shared Components page](images/ai-config.png ' ')

3. Click **Create**.

4. Enter/select the following:
    - Name: **Generate Text AI**
    - Service: **OCI Gen AI** (If configured, you can choose the Generative AI service of your choice)
    - System Prompt:
        ```
        <copy>
        As a parent of a kid who is seeking admission to a school, write an E-mail applying to a school.
        Use the info provided.
        </copy>
        ```
    Click **Create**.

    ![AI configurations page](images/ai-config-details.png ' ')

5. Once the changes are saved, click **Create RAG Source**.

    ![AI configuration details page](images/create-rag.png ' ')

6. Enter/select the following:
    - Identification > Name: **Details to Generate Email Text**
    - Under Source:
        - Type: **Function Body**
        - Language: **PL/SQL**
        - Function Body Returning CLOB:
        ```
        <copy>
        DECLARE
        L_SCHOOL_NAME HIGHSCHOOLS.SCHOOL_NAME%TYPE;
        L_PROMPT CLOB;
        BEGIN
            SELECT SCHOOL_NAME INTO L_SCHOOL_NAME FROM HIGHSCHOOLS WHERE ID = :P3_SCHOOL_ID;
            L_PROMPT :=
                q'[
                Parent Name : ]'|| :P3_PARENT_NAME||chr(10)||chr(13) ||q'[
                Applicant Name : ]'|| :P3_STUDENT_NAME||chr(10)||chr(13) ||q'[
                School Name : ]'|| initcap(L_SCHOOL_NAME)||chr(10)||chr(13);

            return L_PROMPT;

        END;
        </copy>
        ```
      
        Click **Create**.

    ![AI configuration details page](images/rag-details.png ' ')

7. Click **Apply Changes** in the AI Configurations page.

    ![AI configuration details page](images/apply-changes.png ' ')

## Task 4: Generate Email Text using AI

In this task, we use the 'Generate Text with AI' dynamic action to generate email text using Generative AI.

1. From the Generative AI Configurations page, click **Edit Page 3**.

    ![AI configuration details page](images/edit-page-3.png ' ')

2. In the Rendering pane, right-click **GENERATE_LETTER** and select **Create Dynamic Action**.

    ![Page Designer](images/create-gen-da.png ' ')

3. In the Property Editor, for Name, enter **Generate Email Text with AI**.

    ![Page Designer](images/name-da.png ' ')

4. Under True, select **Show**. In the Property Editor, enter/select the following:
    - Identification > Action: **Execute Server-side Code**
    - Under Settings:
        - Language: **PL/SQL**
        - PL/SQL Code: **null;**
        - Items to Submit: **P3\_SCHOOL\_ID,P3\_PARENT\_NAME,P3\_STUDENT\_NAME**

    This True action is executed in order to submit the values of School ID, parent name and student name to the server. By doing so, we can be rest assured that the correct values are picked by the AI configuration we created in the previous task.

    ![Page Designer](images/exec-server-side.png ' ')

5. Select the page items **P3\_SCHOOL\_ID**, **P3\_PARENT\_NAME** and **P3\_STUDENT\_NAME**. In the Property Editor, under Session Stage, for Storage select **Per Session (Persistent)**.

    ![Page Designer](images/change-session-state.png ' ')

6. Under the Generate Email Text with AI dynamic action, right-click True and select **Create TRUE Action**.

    ![Page Designer](images/create-true-action.png ' ')

7. In the Property Editor, enter/select the following:
    - Action: **Generate Text with AI**
    - Generative AI > Configuration: **Generate Text AI**
    - Input Value > Type: **Only System Prompt**
    - Use Response:
        - Type: **Item**
        - Item: **P3\_EMAIL**

    ![Page Designer](images/generate-text-true-action.png ' ')
    
8. Click **Save**.


## Task 5: Create the Apply Button

1. Navigate to Page 1. To do so, click on the Page Finder and select **Page 1**: Search and Apply.

    ![Processing tab in Page Designer](images/nav-page-1.png ' ')

2. In the Rendering Tree, select **Search Results** region. In the Property Editor, under Source, replace the existing SQL Query with the below query:
    ```
    <copy>
    select ID,
        BOROUGH,
        NEIGHBORHOOD || ', ' || BOROUGH as LOCATION ,
        SCHOOL_NAME,
        NEIGHBORHOOD,
        INTEREST,
        METHOD,
        ATTENDANCE_RATE,
        GRADUATION_RATE,
        SCHOOL_SPORTS,
        TOTAL_STUDENTS,
        to_char(TOTAL_STUDENTS,'999G999G999G999G999') as total_students_disp,
        SAFE,
        sdo_geom.sdo_distance(
            sdo_geometry(2001, 4326, sdo_point_type(longitude, latitude, null), null, null),
            sdo_geometry(2001, 4326, sdo_point_type(-73.985428, 40.748817, null), null, null),
            0.01,
            'unit=MILE'
            ) DISTANCE,
            (select DISPOSITION
                    from nyc_schools_apps where school_id=hs.id and parent_user=:APP_USER fetch first 1 rows only)
                    APPLICATION_STATUS,
                (select case DISPOSITION WHEN 'APPLIED' then 'u-success' else null end
                    from nyc_schools_apps where school_id=hs.id and parent_user=:APP_USER fetch first 1 rows only)
                    DISPOSITION_CSS
            from HIGHSCHOOLS hs
    </copy>
    ```

    ![Page Designer](images/edit-sql.png ' ')

3. In the left pane, under Search Results, right-click **Actions** and select **Create Action**.
    ![Page Designer](images/create-action.png ' ')

4. In the Property Editor, enter/select the following:
    - Under Identification:
        - Type: **Button**
        - Label: **Apply**
    - Layout > Position: **Secondary**
    - Under Link > Target: Link Builder - Target
        - Page: **3**
        - Set Items:

            |Name | Value|
            |------|------|
            |P3\_SCHOOL\_ID| &ID. |
            {: title="Set Item name and value"}
        - Clear Cache: **3**

        Click **OK**.
    - Appearance > Hot: Enable the Toggle Button to **ON**.
    - Under Server-side Condition:
        - Type: **Item is NULL**
        - Item: **APPLICATION_STATUS**
        - Execute Condition: **For Each Row**

    ![Page Designer](images/apply-action.png ' ')

5. In the left pane, select **Search Results**. In the Property Editor, switch to **Attributes** tab and edit the following:
    - Under Icon and Badge:
        - Badge Column: **APPLICATION\_STATUS**
        - Badge CSS Classes: **&DISPOSITION\_CSS.**

     ![Page Designer](images/search-attributes.png ' ')

6. In the left pane, right-click **Search Results** and select **Create Dynamic Action**.

    ![Page Designer](images/create-da.png ' ')

7. In the Property Editor, enter/select the following dynamic action properties:
    - Identification > Name: **Refresh Region After Application Sent**
    - Under When:
        - Event: **Dialog Closed**
        - Selection Type: **Region**
        - Region: **Search Results**

        ![Page Designer](images/refresh-region-da.png ' ')

8. For the True Action, select **Show** and edit the following properties:
    - Identification > Action: **Refresh**
    - Under Affected Elements:
        - Selection Type: **Region**
        - Region: **Search Results**

        ![Page Designer](images/refresh-true.png ' ')

9. Click **Save** to save all your changes.


## Summary

You now know how to invoke the Generative AI service using the APEX_AI package. You also learnt to generate emails and submit application to a school.

You may now **proceed to the next lab**.   

## Acknowledgments

 - **Authors** - Toufiq Mohammed, Senior Product Manager; Apoorva Srinivas, Senior Product Manager
 - **Contributing Author** - Pankaj Goyal, Member Technical Staff
 - **Last Updated By/Date** - Apoorva Srinivas, Senior Product Manager, February 2025

