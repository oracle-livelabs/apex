# Create Pages in the Application

## Introduction

In this hands-on lab, you will create a page for collecting new appointment requests. You will create pages for managing doctor appointments, incorporating workflows, task lists, and feedback.

### Objectives

In this lab, you will learn how to:
  - Create the New Appointments page
  - Create the Patient Tasks page
  - Create the Doctors Task page
  - Modify the Task Details page
  - Create the Feedback page and View appointment workflows page

Estimated Time: 20 minutes

### Prerequisites
- All the previous Labs have been completed.

## Task 1: Create the New Appointments Page

Now that the Workflow is created, let us create the Page that the Hospital Staff will use to Submit a New Appointment.

1. Navigate to your application by clicking on **Application ID <number>**. Alternatively, you can also navigate by clicking the App Builder icon for your workspace and selecting **Doctor Appointments Made Easy!** Application.

    ![navigate to doctors app made easy](./images/click-app-builder.png " ")

2. Click **Create Page**.
    ![click create page](./images/create-page.png " ")

3. In the Create a Page wizard, select **Blank Page**.
    ![select blank page](./images/select-blank-page.png " ")

4. For Page Attributes, enter/select the following:
    - Name: **New Appointment**  
    - Under Navigation:
        - Use Breadcrumb: Toggle the button to **ON**
        - Breadcrumb Parent Entry: **Home (Page 1)**
    
    Click **Create Page**.
    ![Configure blank page](./images/create-blank-page.png " ")

5. In the Page Designer, right-click on body and select **Create Region**.

    ![Create a region](./images/create-region1.png " ")

6. In the Property Editor, for Identification > Title, enter **Patient Appointment Details**.

     ![Create a region](./images/configure-static-content.png " ")

7. In the rendering pane, right-click on **Patient Appointment details** and then select **Create Page Item**.

      ![Create page item](./images/create-page-item.png " ")

8. Select the newly created item in the Rendering Tree, and then in the property editor, enter/select the following:
    - Under Identification:
        - Name: **P5_NAME**
        - Type: **Text Field**

    ![Create page item](./images/create-name-item.png " ")

9. Similarly, create the following Items under **Patient Appointment details** Region:
    - **P5\_EMAIL**
    - **P5\_DESC**
    - **P5\_APPT\_DATE**
    - **P5\_DOC** 
    - **P5\_AGE**

10. For **P5\_EMAIL**, in the property editor, enter/select the following:
    - Type: **Text Field**
    - Settings > Subtype: **E-Mail**

    ![Create page item](./images/create-email-item.png " ")

11. For **P5_DESC**, in the property Editor, perform the following changes:
      - Under Identification,
          - Name: **P5_DESC**
          - Type: **Select List**
      - Label: **Problem**
      - Under List of Values,
          - Type: **Static Values**
          - Static Values: **Display1,Display2**  
          
          Enter the following under Display and Return values:

          | Display Value |  Return Value  |
          | --- |  --- |
          | Psychiatric | PSYCHIATRY |
          | Cancer | ONCOLOGY |
          | ENT | ENT |
          | Gastroenteric | GASTRO |
          | Cardiac | CARDIOLOGY |
          | General | GENERAL |
          {: title="Display and Return Values for List of Values"}

    ![create desc item](./images/create-desc-item.png " ")

12. For **P5\_APPT\_DATE**, in the property editor, enter/select the following:
      - Identification > Type: **Date Picker**
      - Label: **Appointment Date**
      - Appearance > Format Mask: **DD-MON-YYYY HH24:MI:SS**

      ![create Appt Date item](./images/create-appt-date-item.png " ")

13. For the **P5_DOC** Page Item, in the property editor, enter/select the following:
      - Identification > Type: **Popup LOV**
      - Label: **Doctor**
      - Under List of Values:
          - Type: **SQL Query** 
          - SQL Query: Enter the following SQL Query:
          ```
          <copy>
            select dname from doctor where specialization = :P5_DESC
          </copy>
          ```
      - Cascading List of Values > Parent Item(s): **P5\_DESC**

    ![create Appt Date item](./images/create-doc-item.png " ")

14. Similarly, create **P5_AGE** with Type: **Text field**.

15. Now, right-click on **Patient Appointment Details** and select **Create Button**.

  ![create button](./images/create-button.png " ")

16. Select the newly created button, and then in the property editor, enter/select the following:
      - Identification > Name: **Submit**
      - Layout > Position: **Create**
      - Appearance > Hot: Toggle the button to **ON**

  ![configure button](./images/create-button1.png " ")


## Task 2: Create and Configure Page Process

1. In the Left Pane, navigate to the **Processing** Tab.

2. In the Processing Tab, right-click on **Processing** and select **Create Process**.

  ![create page process](./images/click-create-process.png " ")

3. Select the newly created Page Process, and then in the property editor, enter/select the following:
      - Under Identification:
          - Name: **Doctor Appointment Workflow**
          - Type: **Workflow**
      - Under Settings:
          - Type: **Start**
          - Definition: **Doctors Appointment**
          - Details Primary Key: **P5_DOC**.
      - Success message: **Appointment Submitted Successfully!**

      ![create workflow process](./images/create-workflow-process.png " ")


4. Now, configure Parameters for the Workflow Page Process. In the Processing tab, under **Doctor Appointment Workflow** , select **Patient Age**. In the property editor, enter/select the following:
    - Value > Type: **Item** 
    - Item > **P5_AGE**
      ![create workflow process](./images/configure-process-param.png " ")

5. Similarly, set the remaining parameters under **Doctor Appointment Workflow** as follows:
    - Set **Patient Email** as Item **P5\_EMAIL**
    - Set **Patient Name** as Item **P5\_NAME**
    - Set **Problem** as Item **P5\_DESC**
    - Set **Request Date** as Item **P5\_APPT\_DATE**

6. Click **Save**.


## Task 3: Create the Patient and Doctor Tasks Page

Our application has two entry points for Patients: First, to confirm an invoice request and second, to provide feedback. For this, we need to create a Unified Task List for Patients' tasks.


1. Click **+ (Plus) Icon** on the top-right corner of the page designer. Then, select **Page** from the drop-down.

  ![click page](./images/click-create-page.png " ")

2. In the Create a Page dialog, under **Component**, select **Unified Task List**.

   ![Select Unified Task List](./images/select-unified-tasks.png " ")

3. Specify the following page attributes:

    - Page Number: **6**

    - Name: **Patient Tasks**

    - Report Context: **My Tasks**

    - Use Breadcrumb: Toggle the Button to **ON**

    - Breadcrumb Parent Entry: **Home (Page 1)**

    Click **Create Page**. A unified Task List page is created.

    ![create patient tasks](./images/create-patient-tasks.png " ")   

4. Our application has 1 entry point for Doctors. Doctors need to log in to approve or reject appointment requests. For this, we will create a Doctor Tasks page. This will also be a Unified Task List page for Doctors to act on the tasks assigned to them.

  To create another Unified Task list page, click **Application ID** on the top left corner of the page designer. Application Home page appears.

6. Click **Create Page**. Create Application wizard appears.

7. Under Component, select **Unified Task List**.

    ![Select Unified Task List](./images/select-unified-tasks1.png " ")

8. Specify the following page attributes:

    - Page Number: **7**

    - Name: **Doctor Tasks**

    - Report Context: **My Tasks**

    Click **Create Page**. A unified Task List page is created.

    ![create-doctor-tasks-page](./images/create-doctor-tasks.png " ")

## Task 4: Modify the Task Details Pages

Our Application has 3 Task Definitions -  Appointment Request, Invoice Request, and Feedback Request. For each of them, we have created a Task Details page. In this task, we will rename the Pages so that they appear more meaningful in the Application.

1. In the **Doctors Appointment Made Easy!** application, navigate to **Shared Components** and select **Task Definitions**.

  ![select task definitions](./images/select-task-def.png " ")

2. In the Task Definitions page, click **Appointment Request**.

  ![select appointment request](./images/select-appointment-req.png " ")

3. In the Task Definition Editor, note the page number in the **Task Details URL** (f?p=&APP\_ID.:2:&SESSION.::&DEBUG.:RP,2:P2\_TASK\_ID:&TASK\_ID.). This points to Page 2.

  ![select appointment request](./images/configure-task-def.png " ")

4. Navigate to your application home page and click **Page 2**.

  ![navigate to page 2](./images/navigate-to-page-2.png " ")

5. Now, edit the following in the Property Editor:
    - Name: **Appointment Request Details**
    - Title: **Appointment Request Details**

  ![change title page2](./images/change-title-page2.png " ")

6. Click **Save**.

7. You now need to change the Invoice Request Details Page.

  Navigate to **Shared Components > Task Definition > Invoice Request** and similarly check the page number for the Task Details. The **Invoice Request** Task Definition points to Page 3.

8. Navigate to your Application home page and click **Page 3**.

9. Now, edit the following in the Property Editor:
    - Name: **Invoice Details**
    - Title: **Invoice Details**

  ![change title page2](./images/change-title-page3.png " ")

10. In the rendering tree, navigate to **Invoice Details > Components > Content Body > Developer Information**. Right-click on the **Developer Information** region and click **Delete**.

  ![delete developer info](./images/delete-developer-info1.png " ")

11. In the rendering tree, select **Details** classic report region. In the Property editor, edit the Title to **View Invoice**.

  ![change details title](./images/change-details-title.png " ")

  > **Note:** _Developer Information region is autogenerated for Action Tasks (non-approval). This can be removed/customized depending on the application use-case._

12. Click **Save**.

13. Navigate to **Shared Components > Task Definition > Feedback Request** and similarly check the page number for the Task Details. The **Feedback Request** Task Definition points to Page 4.

14. Navigate to your Application home page and click **Page 4**. 
    Now, edit the following in the Property Editor:
    - Name: **Feedback Details**
    - Title: **Feedback Details**

  ![change details title](./images/change-feedback-title.png " ")

15. In the rendering tree, navigate to **Feedback Details > Components > Content Body > Developer Information**. Right-click on the **Developer Information** region and click **Delete**.

  ![delete developer info](./images/delete-feedback-devinf.png " ")

16. In the Rendering Tree, click **Details** region. In the Property Editor, for Title, enter **View Appointment Details**.

  ![change details title](./images/edit-details-region.png " ")

17. In the Details Page, the patient should be able to fill out a Feedback form and submit it. On submission, it will create an entry in the **PATIENT_FEEDBACK** table for the particular doctor. We will customize the Feedback Details Page as follows:

  In the rendering tree, right click on **View Appointment Details** and click **Create Region Below**.

  ![create region below](./images/create-region-below.png " ")

18. Select the newly created region in the Rendering Tree, and then in the property editor, enter/select the following:
    - Under Identification:
        - Title: **Your Feedback**
        - Type: **Form**
    - Under Source:
        - Table: **APPOINTMENT**
        - Where:
          ```
          <copy>
          booking_id = :P4_BOOKING_ID
          </copy>
          ```
    ![configure feedback](./images/configure-feedback.png " ")

19. In the Rendering Tree, select the Page Items **P4\_FEE** and **P4\_WORKFLOW\_ID**. In the Property Editor, for Identification > Type, select **Hidden**.

  ![set items as hidden](./images/set-items-to-hidden.png " ")

20. In the rendering Tree, select **P4_SCHEDULE** and then in the property editor, for Appearance > Format Mask, select **DD-MON-YYYY HH24:MI:SS**.

   ![set items as hidden](./images/update-schedule-item.png " ")

21. Now, create two new page items under the **Your Feedback** region.
  
    In the Rendering tree, right-click **Region Body** and click **Create Page Item**.

  ![create page item](./images/create-page-item1.png " ")

22. Select the newly created page item in the Rendering Tree, and then in the property editor, enter/select the following:
    - Under Identification,
        - Name: **P4_RATING**
        - Type: **Radio Group**
    - Under List of Values,
        - Type: **Static Values**
        - Static Values: **Display1,Display2** 
        - Enter the following under Display and Return:

        | Display Value |  Return Value  |
        | --- |  --- |
        | Excellent | 1 |
        | Good | 2 |
        | Satisfactory | 3 |
        | Unsatisfactory | 4 |
        {: title="Display and Return Values for List of Values}

    ![create page item](./images/configure-rating.png " ")

23. Similarly, create a new item **P4_FEEDBACK** and set the Type as **Rich Text Editor**.

    ![create page item](./images/configure-feedback1.png " ")

24. Click **Save**.

25. In the Pre-Rendering section, add a new Process above the **Initialize Form Feedback Details** Process and name it **Populate Booking Details in Feedback Form**.

26. Select the **Populate Booking Details in Feedback Form** and in the Property Editor, enter/select the following:
    - Process Type: **Execute Code** 
    -  PL/SQL Code: Enter the following code:

    ```
    <copy>
    begin

    select booking_id into :P4_BOOKING_ID
    from appointment where booking_id = (select
         param_value
    from apex_task_parameters
    where task_id = :P4_TASK_ID and param_static_id = 'BOOKING_ID');

    end;
    </copy>
    ```

    ![create page item](./images/configure-pre-rendering.png " ")

27. In the **Left Pane**, navigate to the **Processing Tab**.

28. In the **Processing Tab**, add a new Process after the **Claim process** and name the newly created process as **Save Feedback**.

29. In the Property editor, enter/select the following:
    - Type: **Execute Code** 
    - PL/SQL code: enter the following code snippet:

    ```
    <copy>
    begin
      insert into patient_feedback (
          patient_name,
          doctor_no,
          appointment,
          feedback,
          rating,
          created_at,
          updated_at)
      values
          (:P4_PATIENT_USERNAME,
          :P4_DOCTOR_NO,
          to_timestamp_tz(:P4_SCHEDULE,'DD-MON-YYYY HH24:MI:SS'),
          :P4_FEEDBACK,
          :P4_RATING,
          systimestamp,
          systimestamp);
    end;
    </copy>
    ```

    ![create page process](./images/save-feedback.png " ")

30. For Server Side Condition > When Button Pressed, select **COMPLETE**.

    ![when button pressed](./images/button-press.png " ")

31. Click **Save**.


## Task 5: Create the Patient Appointments And Feedbacks Page

Now, you need to create a View Only page where patients can log in to view their appointments and the feedback they have left so far.

1. Click **+ (Plus) Icon** on the right-above corner of the page designer. Then, select **Page** from the drop-down.

    ![when button pressed](./images/create-page1.png " ")

2. In the Create a Page dialog, select **Blank Page**.

   ![Create Page wizard](./images/create-blank-page1.png " ")

3. Specify the following page attributes:

    - Page Number: **8**

    - Name: **Patient Appointments And Feedbacks**

    - Breadcrumb Parent Entry: **Home (Page 1)**

    Click **Create Page**. A Blank page is created.

    ![create patient tasks](./images/configure-patient-apps.png " ")   

4. In Page Designer of the newly created page, right-click on **Body** and click **Create Region**.

  ![create patient tasks](./images/create-region2.png " ")

5. In the newly created Region, go to Property Editor and enter/select the following:
      - Name: **Appointments**
      - Type: **Comments** (under Theme Components)
      - Under Identification,
          - Title: **Appointments**
          - Type: **Comments**
      - Under Source,
          - Table Name:**APPOINTMENT**
          - **Where Clause**:
          ```
          <copy>
          patient_username=:APP_USER
          </copy>
          ```
    - Appearance > Template: **Collapsible**
    ![create patient tasks](./images/configure-appointments1.png " ")

6. In the Rendering Tree, select **Appointments**, and then in the Property editor, select the **Attributes** tab and enter/select the following:
    - Under Settings,
        - Comment Text: **STATUS**
        - User Name: **DOCTOR\_EMAIL**
        - Date: **SCHEDULE**
    ![create patient tasks](./images/configure-attr.png " ")

7. In the rendering tree, right-click on **Appointments Region**, and then select **Create Region Below**.
    ![create patient tasks](./images/create-region-below1.png " ")

8. In the Property Editor, enter/select the following:
    - Under Identification,
        - Title: **Feedbacks**
        - Type: **Comments**
    - Under Source,
        - Type: **SQL Query**
        - SQL Query: copy and paste the below SQL.
        ```
        <copy>
        select ID,
             PATIENT_NAME,
             'DR.' || DNAME as DNAME,
             APPOINTMENT,
             FEEDBACK,
             RATING,
             CREATED_AT,
             UPDATED_AT
        from PATIENT_FEEDBACK, DOCTOR
       where PATIENT_NAME=:APP_USER
        and DOCTOR_NO = DNO
        </copy>
        ```

      ![configure feedbacks](./images/configure-feedbacks.png " ")

9. In the Rendering Tree, select **Feedbacks**. In the Property editor, select the **Attributes** tab and enter/select the following:
    - Under Settings,
        - Comment Text: **FEEDBACK**
        - User Name: **DNAME**
        - Date: **APPOINTMENT**

    ![configure feedbacks attr](./images/configure-feedbacks1.png " ")

10. Click **Save**.


## Task 6: Create the View Appointment Workflows Page

Finally, we need the page that the Hospital Management Staff will use to monitor the appointment workflow.

We use the Workflow Console and Details pages with **Initiated By Me** report context, which allows a logged-in user to view all Workflows Initiated by him or her.

> **Note:** _The Workflow Console allows workspace users to view and manage their workflow instances, including My Workflows for workflow owners, Admin Workflows for workflow administrators, and Initiated by Me for workflow initiators. When configuring the Workflow Console, you have different Report Contexts to choose from. You will learn about these in subsequent blogs._

1. To create the Workflow Console and Details pages, on the Application home page, select **Create Page**.

2. Under Component, select **Workflow Console**.

    ![configure feedbacks attr](./images/create-workflow-console.png " ")

3. In the Create Workflow Console wizard:
    - Under Page Definition,
        - Name: **Monitor Appointment Workflows**
        - Report Context: **Initiated By Me**
        - Form Page Name: **Appointment Workflow Details**. This is used for the Workflow Details page.
    - Under Navigation,
        - Use Breadcrumb: Toggle the button to **ON**
        - Breadcrumb Parent Entry: **Home (Page 1)**
        - Parent Navigation Menu Entry: **Home**

    ![configure feedbacks attr](./images/config-workflow-console.png " ")
4. Click **Create Page**.

5. Run the application and navigate through different pages to demonstrate the workflow, tasks, and feedback functionalities.

## Summary
You have successfully created a comprehensive Oracle APEX application for managing doctor appointments with workflows, task lists, and feedback features.

### What's Next

In the next lab, you will understand the behaviour of the **Doctor Appointments Made Easy!** application through hands-on activities. You will also perform various tasks to understand the workflow and automation implemented in the application.



## Acknowledgements
- **Author(s)** - Roopesh Thokala, Senior Product Manager & Ananya Chatterjee, Consulting Member of Technical Staff.
- **Contributor** -
- **Last Updated By/Date** - Roopesh Thokala, Senior Product Manager, December 2023   
