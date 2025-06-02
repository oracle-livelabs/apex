# Generate Email to Apply to a School using Gen AI

## Introduction

In this lab, you configure an option for the parent to apply to a school they are interested in. The letter for application is generated using the Generative AI service. The parent can review and edit the letter before submitting the application.

**Note:** The screenshots in this workshop are taken using Dark Mode in APEX 24.1.2

Estimated Time: 15 minutes

<!-- Watch the video below for a quick walk-through of the lab.
[Create an APEX App](videohub:1_a6bi2e62) -->

### Objectives

In this lab, you will:

- Use Invoke API process to invoke the Generative AI service using the APEX_AI PL/SQL API
- Generate email for applying to a school

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
        - Page Number: **7**
        - Name: **Apply to School**
        - Page Mode: **Drawer**
    - Under **Data Source**
        - Table/View Name: **NYC\_SCHOOLS\_APPS**

    Click **Next**.

     ![Create page wizard](images/form-details.png ' ')

3. Accept the Primary Key Column 1's default value as ID (Number) and click **Create Page**.

    ![Create page wizard](images/create-page.png ' ')

4. In the Rendering tree, select the following page items under Region Body:
    - P7\_SCHOOL\_ID
    - P7\_PARENT\_USER
    - P7_LETTER
    - P7_DISPOSITION
    - P7_CREATED
    - P7_UPDATED
    - P7\_UPDATE\_BY

    In the Property Editor, select Type as **Hidden**.

    ![Page Designer](images/type-hidden.png ' ')

5. In the Rendering Tree, select the page item **P7\_PARENT\_NAME**. In the Property Editor, enter/select the following:

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

6. Now, select the page item **P7\_PARENT\_USER**. In the Property Editor, enter/select the following:
    - Under Default:
        - Type: **Expression**
        - PL/SQL Expression - **:APP_USER**

   ![Page Designer](images/parent-user.png ' ')

7. Select the page item **P7_DISPOSITION**. In the Property Editor, enter/select the following:
    - Under Default:
        - Type: **Static**
        - Static Value: **APPLIED**

    ![Page Designer](images/disposition.png ' ')

8. Select the page item **P7\_PARENT\_EMAIL**. In the Property Editor, enter/select the following:
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

9. In the left pane, right-click **P7\_STUDENT\_NAME**, and select **Create Button Below**.
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
        - Name: **P7\_EMAIL**
        - Type: **Rich Text Editor**

     ![Page Designer](images/p7-email.png ' ')

13. In the left pane, right-click **P7\_LETTER** and select **Create Computation**.

    ![Page Designer](images/create-computation.png ' ')

14. With the computation selected, enter/select the following in the Property Editor:

    - Execution > Point: **After Submit**
    - Under Computation:
        - Type: **Item**
        - Item Name: **P7_EMAIL**

    ![Page Designer](images/computation-details.png ' ')

15. Now that we edited the page items, let's add one last page item for sending a final prompt to the Gen AI service. In the Rendering Tree, right-click **Apply to School** form region and select **Create Page Item**.

    ![Page Designer](images/create-final-prompt.png ' ')

16. In the Property Editor, enter/select the following:
    - Under Identification:
        - Name: **P7\_FINAL\_PROMPT**
        - Type: **Hidden**

    ![Page Designer](images/final-prompt-name.png ' ')

17. Delete the buttons that we no longer need. Select **CANCEL**, **DELETE**, and **SAVE**. Right-click and select **Delete**.
    ![Page Designer](images/delete-buttons.png ' ')

18. Select the **CREATE** button. In the Property editor, enter/select the following:

    - Identification > Label: **Send Application**
    - Under Appearance:
        - Button Template: **Text with Icon**
        - Icon: **fa-send-o**

    ![Page Designer](images/edit-create.png ' ')

## Task 3: Create a Process Execution Chain

In this task, we create a process execution chain to first prepare a prompt and then invoke the Gen AI service to generate a letter of application.

1. From the Rendering Tree, navigate to the Processing tab. Right-click **Processes** and select **Create Process**.

    ![Processing tab in Page Designer](images/create-process.png ' ')

2. In the Property Editor, enter/select the following:

    - Under Identification:
        - Name: **Generate Letter**
        - Type: **Execution Chain**

    ![Processing tab in Page Designer](images/execute-chain.png ' ')

3. Right-click on **Generate Letter** and select **Add Child Process**. In the Property Editor, enter/select the following:
    - Under Identification:
        - Name: **Prepare Prompt**
        - Type: **Execute Code**
    - Source > PL/SQL Code:
    ```
    <copy>
    DECLARE
    L_SCHOOL_NAME HIGHSCHOOLS.SCHOOL_NAME%TYPE;
    L_PROMPT CLOB;
    BEGIN
        SELECT SCHOOL_NAME INTO L_SCHOOL_NAME FROM HIGHSCHOOLS WHERE ID = :P7_SCHOOL_ID;
        L_PROMPT :=
            q'[
    As a parent of a kid who is seeking admission to a school, write an E-mail applying to a school.
    Use the below info.

    Parent Name : ]'|| :P7_PARENT_NAME||chr(10)||chr(13) ||q'[
    Applicant Name : ]'|| :P7_STUDENT_NAME||chr(10)||chr(13) ||q'[
    School Name : ]'|| initcap(L_SCHOOL_NAME)||chr(10)||chr(13);

    :P7_FINAL_PROMPT := L_PROMPT;
    END;
    </copy>
    ```

    ![Processing tab in Page Designer](images/prepare-prompt.png ' ')

     - Server-side Condition > When Button Pressed: **GENERATE_LETTER**

    ![Processing tab in Page Designer](images/server-condition.png ' ')

4. Right-click on **Generate Letter** and select **Add Child Process**.
    ![Processing tab in Page Designer](images/add-child.png ' ')

5. In the Property Editor, enter/select the following:
    - Under Identification:
        - Name: **Generative AI - Generate Letter**
        - Type: **Invoke API**
    - Under Settings:
        - Package: **APEX_AI**
        - Procedure or Function: **GENERATE**
    - Server-side Condition > When Button Pressed: **GENERATE_LETTER**

    ![Processing tab in Page Designer](images/child-gen-letter.png ' ')

6. Let us now edit the process parameters. In the left pane, under Parameters, select **Function Result**. In the Property editor, for Value > Item, enter **P7_EMAIL**.
    ![Processing tab in Page Designer](images/param-1.png ' ')

7. Select **p_prompt**. In the Property Editor, edit/select the following:
    - Under Value:
        - Type: **Item**
        - Item: **P7\_FINAL\_PROMPT**

    ![Processing tab in Page Designer](images/param-2.png ' ')

8. Select **p\_service\_static\_id**. In the Property Editor, edit/select the following:
    - Under Value:
        - Type: **Static Value**
        - Item: **oci\_gen\_ai**  (This is the Static ID of the OCI Gen AI service we created in Lab 4. You can verify the Static ID by navigating to **Workspace Utilities > Generative AI > OCI Gen AI**)

    ![Processing tab in Page Designer](images/param-3.png ' ')

9. Drag and drop the parent process, **Generate Letter** to the top.

    ![Processing tab in Page Designer](images/drag-to-top.png ' ')

10. In the left pane, select **Process form Apply to School**. In the Property Editor, enter/select the following:
    - Success Message > Success Message: **Application Sent**
    - Server-side Condition > When Button Pressed: **CREATE**

     ![Processing tab in Page Designer](images/success-msg.png ' ')

11. Create a branch to reload the page once the application is submitted. Right-click **After Processing** and select **Create Branch**.

    ![Processing tab in Page Designer](images/create-branch.png ' ')

12. In the Property Editor, enter/select the following:
    - Identification > Name: **reload page**
    - Behavior > Target: Click **No Link Defined**
        - Target > Page: **7**
        - Set Items:

            |Name | Value|
            |------|------|
            |P7\_STUDENT\_NAME | &P7\_STUDENT\_NAME.|
            |P7\_SCHOOL\_ID| &P7\_SCHOOL\_ID. |
            {: title="Set Item name and value"}

        - Success Message: Disable the Toggle Button to **OFF**.
        - Click **OK**.
    - Server-side Condition > When Button Pressed: **GENERATE_LETTER**

    ![Processing tab in Page Designer](images/reload-page.png ' ')

13. Click **Save**.

## Task 4: Create the Apply Button

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
        - Page: **7**
        - Set Items:

            |Name | Value|
            |------|------|
            |P7\_SCHOOL\_ID| &ID. |
            {: title="Set Item name and value"}
        - Clear Cache: **7**

        Click **OK**.
    - Appearance > Hot: Enable the Toggle Button to **ON**.
    - Under Server-side Condition:
        - Type: **Item is NULL**
        - Item: **APPLICATION_STATUS**
        - Execute Condition: **For Each Row**

    ![Page Designer](images/apply-action.png ' ')

5. In the left pane, select **Search Results**. In the Property Editor, switch to Attributes tab and edit the following:
    - Under Icon and Badge:
        - Badge Column: **APPLICATION_STATUS**
        - Badge CSS Classes: **&DISPOSITION_CSS.**

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
 - **Last Updated By/Date** - Apoorva Srinivas, Senior Product Manager, July 2024

