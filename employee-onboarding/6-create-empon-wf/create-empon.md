# Create and Configure Employee Onboarding Workflow

## Introduction

In this lab, you will create an **Employee Onboarding** Workflow to automate the onboarding process for New employees. You will define workflow parameters and variables, add activities like sending emails and creating tasks, and integrate a child workflow for employment type based task assignments. This will help you learn how to build and manage workflows using Oracle APEX Workflow Designer.

### Objectives

In this lab, you learn how to:

- Create a new workflow and modify its details

- Define workflow parameters and variables

- Add activities such as Send Email, Execute Code, Human Task, and Invoke Workflow

- Link parameters and configure email templates and tasks

- Save and test the complete onboarding workflow

Estimated Time: 20 minutes

### Prerequisites

- All the previous Labs have been completed.

## Task 1: Create the Workflow

To create a Workflow:

1. Navigate to **Workflows**.

   ![Navigate to Shared Components](./images/wf-nav.png " ")

2. In the Workflows Page, click **Create**.

   ![Create Workflow](./images/create-wf.png " ")

3. This will lead you to the Workflow Designer. A new workflow with a Start Activity, Execute Code Activity, and End Activity will be auto-created.

    ![Create Workflow](./images/select-wf2.png " ")

## Task 2: Modify Workflow Details

1. Select **New** in the Rendering tab, in the Property Editor enter/select the following:

    - Under Identification:
        - Name: **Employee Onboarding**
        - Title: **Employee Onboarding**

    - Under Advanced:
        - Static ID: **EMPLOYEE\_ONBOARDING**

    ![Create Workflow](./images/select-wf.png " ")

2. In the left pane, select **New[Dev]** and in the property editor, for Workflow Version enter **1.0**.

    ![Create Workflow](./images/ef-emp-type2.png " ")

3. At this point, we will remove this activity since we plan to introduce new specific activities in subsequent sections of this lab. To do this, either right-click on the highlighted RED activity in the Workflow tree and select **Delete**, or click the three dots at the bottom right corner of the activity in the Diagram. This will open a menu, and choose **Delete** from the options provided.

   ![Delete activity using Tree](./images/delete-activity-tree.png " ")

4. Navigate to **Start**. Under **Outgoing**, select **New** and select the following:

    - Activity > To: **End**

   ![Check Errors in the Page](./images/set-end.png " ")

5. Click **Save**.

## Task 3: Add Inputs for Employment Type Workflow

In this lab, you explore various aspects of workflow data using the example of a Employee Onboarding application that you are building. You will focus on understanding parameters, variables, activity variables, and additional data.

Referring to the flow chart in Lab 1, illustrating the business logic, the employee onboarding process initiates with the HR Staff submitting New Hire details to the system, marking the commencement of the workflow.

1. To create Workflow Parameters, right-click **Employee Onboarding** Workflow and select **Create Parameter**.

   ![Create Parameter](./images/create-parameter.png " ")

2. This adds a Parameter with a label "New" in the Workflow tree. In the Property Editor, enter/select the following:

    - Static ID: **EMAIL**

    - Label: **Email**

   ![Configure Parameter](./images/create-param-email.png " ")

3. Similarly, add the following **Parameters** one after the other, given in the table below.

  |Static ID | Label | Data Type | Value Required| Direction |
  |----------|-------|------------|---|----------|
  | EMPLOYEE_ID | Employee ID | VARCHAR2 | No | In   |
  | EMPLOYEE_NAME | Employee Name | VARCHAR2 |  No  | In  |
  | EMPLOYMENT_TYPE | Employment Type | VARCHAR2 | No | In  |
  | DEPARTMENT | Department ID | NUMBER | No | In  |
  | INITIATED_BY | Initiated By | VARCHAR2 | Yes | In  |
  {: title="List of Parameters to be Created"}

    ![Add Parameter](./images/add-params2.png" ")

## Task 4: Add Workflow Variables

The inputs provided to the Employee Onboarding Workflow are read-only in nature. This means that, once the workflow is submitted, their values will never be modified. The workflow needs to process and pass data from one activity to the next.

1. Right-click **1.0 [DEV]** (workflow version), select **Create Variable**.

    ![Create Variable](./images/create-variable.png " ")

2. A new variable with Name **New** gets created in the tree. In the Property Editor, enter/select the following:

    - Identification > Static ID: **APPROVER**

    - Label > Label: **Approver**

   ![Create Approver Variable](./images/create-approver.png " ")

3. Similarly, create a variable **Task Outcome**. In the Property Editor, Enter/Select the following:

    - Identification > Static ID: **TASK\_OUTCOME**

    - Label > Label: **TaskOutcome**

   ![Create task outcome Variable](./images/create-variable-task.png " ")

4. Similarly, create a variable **Manager ID**. In the Property Editor, Enter/Select the following:

    - Identification > Static ID: **MANAGER\_ID**

    - Label > Label: **Manager ID**

    - Under Value:
        - Type: **SQL Query (return single value)**
        - SQL Query: copy and paste the below code

            ```
             <copy>
             select M.EMPLOYEE_ID
             from EMPLOYEES e, EMPLOYEES m
             where m.EMPLOYEE_ID(+)=e.MANAGER_ID and e.EMPLOYEE_ID=:EMPLOYEE_ID;
             </copy>
            ```

   ![Create task outcome Variable](./images/create-managerid.png " ")

## Task 5: Add Workflow Activities for Employee Onboarding

1. From the Activities Palette, drag an **Send Email** activity into the Diagram Builder area and drop it on the connection joining the Start and End activities.

   ![Create Activity](./images/drag-act.png " ")

2. Click the newly added **Send Email** and in the Property Editor, enter/select the following:

    - Identification > Name: **Employee Onboarding Email**

    - Under Settings:
        - To: **&EMAIL.**
        - Email Template: **Onboarding Email**
        - Under Placeholders: Map the placeholders to the Item or Value fields

            - FIRST_NAME: **&EMPLOYEE\_NAME.**
            - HR_NAME: **&INITIATED\_BY.**

   ![Create activity to send email trainings](./images/send-email.png " ")

3. Now from the Activities Palette, drag a **Execute Code** Activity into the Diagram Builder area and drop it on the connection joining **Employee Onboarding Email** and End.

   ![Create Execute Code](./images/exc-code.png " ")

4. In the Property Editor, enter/select the following:

    - Identification > Name: **Create IT and HR Records**

    - Source > PL/SQL Code: copy and paste the below code

        ```
         <copy>
         declare
         l_req_id number;
         l_count number;
         begin
         select count(*) into l_count from IT_PROVISIONING where employee_id = :EMPLOYEE_ID;
         if l_count = 0 then
         Insert into IT_PROVISIONING (EMPLOYEE_ID, EMAIL_CREATED, LAPTOP_ALLOCATED,WORKFLOW_ID)
         Values (:EMPLOYEE_ID,'N','N',:APEX$WORKFLOW_ID );

         end if;
         end;
         </copy>
        ```

    ![Create INVOKE API Activity](./images/create-code2.png " ")

5. Now from the Activities Palette, drag a **Human Task - Create** Activity into the Diagram Builder area and drop it on the connection joining **Create IT and HR Records** and End.

   ![Create Human Task](./images/create-human-task.png " ")

6. In the Property Editor, enter/select the following:

    - Identification > Name: **On boarding Tasks**

    - Under Settings:

        - Definition: **IT Setup**
        - Details Primary Key Item: **EMPLOYEE_ID**

    - Under Deadline:

        - Due On Type: **Interval**
        - Interval: **P2D**

   ![Create activity to assign trainings](./images/human-task2.png " ")

7. Under **On boarding Tasks** activity, in parameters tab, select **Department** and select the following in the property editor:

    - Under Value:

        - Type: **Item**
        - Item: **DEPARTMENT**

    ![Link Parameters](./images/dept-param.png " ")

8. Similarly, select **Email** parameter.In the Property Editor, enter/select the following:

    - Under Value:

        - Type: **Item**
        - Item: **EMAIL**

    ![link parameter for Activity](./images/email-param.png " ")

9. Similarly, select **Employee ID** parameter.In the Property Editor, enter/select the following:

    - Under Value:

        - Type: **Item**
        - Item: **EMPLOYEE\_ID**

    ![link parameter for Activity](./images/emp-id-param.png " ")

10. Similarly, select **Employee Name** parameter.In the Property Editor, enter/select the following:

    - Under Value:

        - Type: **Item**
        - Item: **EMPLOYEE\_NAME**

    ![link parameter for Activity](./images/emp-name-param.png " ")

## Task 6: Create Activity to Invoke Child Workflow

1. Create another Activity to invoke the **Employment Type Workflow**. From the Activities palette, drag a **Invoke Workflow** Activity into the Diagram Builder area and drop it on the connection joining the Activity to end.

   ![Create Invoke Workflow](./images/invoke-workflow.png " ")

2. In the Property Editor, enter/select the following:

    - Identification > Name: **Tasks based on Employment Type**

    - Settings > Definition: **Employment Type Workflow**

    ![Create Invoke Workflow Activity](./images/invoke-wf.png " ")

3. Under **Tasks based on Employment Type** and select **Employee ID** parameter. In the Property Editor, enter/select the following:

    - Value > Item : **EMPLOYEE\_ID**

   ![link parameter for Activity](./images/params3.png " ")

4. Similarly, select **Employee Type** parameter.In the Property Editor, enter/select the following:

    - Value > Item : **EMPLOYEE\_TYPE**

   ![link parameter for Activity](./images/params4.png " ")

5. Similarly, edit the below parameters:

    |Type  | Item |
  |----------|-------|
  |  Employee Name |EMPLOYEE_NAME|
  | Email | EMAIL |
  {: title="List of Parameters to be Created for Tasks based on Employment Type"}

## Task 7: Create Activity to send Onboarding Completion Email

1. From the Activities palette, drag a **Send E-Mail Task - Create** Activity into the Diagram Builder area and drop it between the **Tasks based on Employment Type** activity and **End**.

   ![Create activity to send email](./images/send-email-comp.png " ")

2. In the Property Editor, enter/select the following:

    - Identification > Name: **Onboarding Completion Email**

    - Under Settings:
        - To: **&EMAIL.**
        - Subject: **Congratulations on Completing Your Onboarding!**
        - Body Plain Text: copy and paste the below text

            ```
             <copy>
             Dear &EMPLOYEE_NAME.,

             Congratulations on successfully completing your onboarding process — and welcome officially to the team!

             We are excited to have you with us and look forward to the great work you'll do. Over the past few days, you have taken your first steps into our company culture, systems, and values, and we hope the experience has been informative and engaging.
             If you have any lingering questions or need further support, please don't hesitate to reach out to your manager or the HR team. Your growth and success are important to us, and we're here to support you every step of the way.

             Once again, welcome aboard — we are thrilled to have you with us!

             Warm regards,
             HR Team,
             ACME Corp.
             <copy>
            ```

    ![Create activity to send email trainings](./images/send-email2.png " ")

3. Click **Save**.

    ![Save page](./images/save-page.png "")

## Summary

In this lab, you learned how to create an Employee Onboarding Workflow by setting up parameters, variables, and activities. You practiced configuring workflow details, invoking child workflows, and sending automated emails to streamline the onboarding process.

## What's Next

In the next lab, you will create and customise the task and workflow pages.

You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Roopesh Thokala, Senior Product Manager; Sahaana Manavalan, Senior Product Manager, August 2025
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, August 2025
