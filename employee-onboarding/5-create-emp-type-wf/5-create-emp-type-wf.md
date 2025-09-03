# Build Employment Type-Based Workflows in Oracle APEX

## Introduction

In this lab, you will create an **Employment Type** Workflow to automate employee training assignments. The workflow will decide the training path based on whether the employee is **Full Time** or an **Intern**, and send follow up emails. You will learn how to set up workflow parameters, variables, activities, and connections to build a complete workflow process.

### Objectives

In this lab, you learn how to:

- Create and configure a new workflow in Oracle APEX

- Define workflow parameters and variables

- Add conditional logic to handle different employment types

- Invoke backend procedures for training assignment

- Create human tasks for training allocation and email notifications

- Connect all workflow activities to ensure a complete onboarding flow

Estimated Time: 20 minutes

### Prerequisites

- All the previous Labs have been completed.

## Task 1: Create the Workflow

To create a Workflow:

1. Navigate to **Shared Components**.

   ![Navigate to Shared Components](./images/navigate-to-shared-components.png " ")

2. Under **Workflows and Automations**, select **Workflows**.

   ![Navigate to Workflows](./images/select-workflows.png " ")

3. In the Workflows Page, click **Create**.

   ![Create Workflow](./images/create-wf.png " ")

4. This will lead you to the Workflow Designer. A new workflow with a Start Activity, Execute Code Activity, and End Activity will be auto-created.

    ![Create Workflow](./images/select-wf2.png " ")

## Task 2: Modify Workflow Details

1. Select New in the Rendering tab, in the Property Editor, enter/select the following:

    - Under Identification:

        - Name: **Employment Type Workflow**
        - Title: **Employment Type Workflow**

    - Under Advanced:

        - Static ID: **Employment\_Type\_Workflow**

    ![Create Workflow](./images/select-wf.png " ")

    ![Create Workflow](./images/ef-emp-type.png " ")

2. In the left pane, select **New[Dev]** and in the property editor, for Workflow Version enter **1.0**.

    ![Create Workflow](./images/ef-emp-type2.png " ")

    > **Note:** _You may have noticed the label [Dev] next to the version in the tree on the left pane. This means that this version of the Workflow is In Development and all parts of it are editable. We will learn about workflow versioning- Active vs. In Development versions in future labs in this workshop._

## Task 3: Add Inputs for Employment Type Workflow

In this lab, you explore various aspects of workflow data using the example of a Employee Onboarding application that you are building. You will focus on understanding parameters, variables, activity variables, and additional data.

Referring to the flow chart in Lab 1, illustrating the business logic, the onboarding process begins with the HR Staff submitting New Hire details to the system, which initiates the workflow.

The inputs to the workflow will be the New Employee details. In workflow terminology, these are called **Workflow Parameters**.

1. To create Workflow Parameters, right-click **Employment Type Workflow** Workflow and select **Create Parameter**.

   ![Create Parameter](./images/create-parameter.png " ")

2. This adds a Parameter with a label "New" in the Workflow tree. In the Property Editor, enter/select the following:

    - Static ID: **EMAIL**

    - Label: **Email**

    - Data Type: **VARCHAR2**

   ![Configure Parameter](./images/create-param-email.png " ")

3. Similarly, add the following **Parameters** one after the other, given in the table below.

    |Static ID | Label | Data Type | Required|
    |----------|-------|------------|---|
    | EMPLOYEE_ID | Employee ID | VARCHAR2 | Yes |
    | EMPLOYEE_NAME | Employee Name | VARCHAR2 |  No  |
    | EMPLOYMENT_TYPE | Employment Type | VARCHAR2 | Yes |
    {: title="List of Parameters to be Created"}

    ![Add Parameter](./images/add-params2.png =50%x*)

## Task 4: Add Workflow Variables

The inputs provided to the Workflow are read-only in nature. This means that, once the workflow is submitted, their values will never be modified. The workflow needs to process and pass data from one activity to the next.

As an example, consider the following business scenario:

Before an onboarding is completed, the workflow needs to allocate trainings based on the employement type. So, the employement type of the New hire is a variable that will be determined based on this computation.

Data such as Employement Type, Employee ID, Employee Name and Email need to be updatable by the activities of the workflow as part of the execution. Such data is defined as **Workflow Variables**.

1. Right-click **1.0 [Dev]** (workflow version), select **Create Variable**.

    ![Create Variable](./images/create-variable.png " ")

2. A new variable with Name **New** gets created in the tree. In the Property Editor, enter/select the following:

    - Identification > Static ID: **APPROVER**

    - Label > Label: **Approver**

   ![Create Approver Variable](./images/create-approver.png " ")

3. Similarly, create a variable **Task Outcome**. In the Property Editor, Enter/Select the following:

    - Identification > Static ID: **TASK\_OUTCOME**

    - Label > Label: **Task Outcome**

   ![Create task outcome Variable](./images/create-variable-task.png " ")

## Task 5: Add Workflow Activity for Full Time Employees

In this task, you will create an activity for Employment Type as Full Time.

1. In the Workflow Designer, under 1.0[Dev], click on Activity and enter/select the following in the property editor:

    - Identification > Type: **Switch**
    - Switch > Type: **Check Workflow Variable**
    - Compare >  Compare Variable: **EMPLOYMENT\_TYPE**

   ![Create Activity](./images/create-switch.png " ")

2. Now from the Activities Palette, drag a **Invoke API** Activity into the Diagram Builder area and drop it on the connection joining the Activity.

   ![Create INVOKE API Activity](./images/create-api1.png " ")

3. For the newly created property, in the property editor, enter/select the following:

    - Identification > Name: **Trainings for Full-Time Employee**

    - Under Settings:
        - Type: **PL/SQL Procedure or Function**
        - Procedure or Function: **ASSIGN\_EMPLOYEE\_TRAININGS**

   ![Create INVOKE API Activity](./images/create-api2.png " ")

4. Create a connection between **Activity** and **Trainings for Full-Time Employee** and enter/select the following in the property editor:

    - Indentification > Name: **Full Time**

    - Under Condition:
        - Operator: **Is Equal To**
        - Value: **Full Time**

   ![Create INVOKE API Activity](./images/create-api3.png " ")

5. Notice in the rendering tree, there are some fields marked in Red. This activity has two Parameters, highlighted in RED to show that they are required.

6. Under **Trainings for Full-Time Employee** and select **p\_employee\_id** parameter. In the Property Editor, enter/select the following:

    - Value > Item : **EMPLOYEE_ID**

   ![link parameter for Activity](./images/params1.png " ")

7. Similarly, select **p\_employee\_type** parameter.In the Property Editor, enter/select the following:

    - Value > Item : **EMPLOYEE_TYPE**

   ![link parameter for Activity](./images/params2.png " ")

## Task 6: Create Activity for Interns

1. Similarly, Create another Activity for Intern as the Employment type. From the Activities palette, drag a **Invoke API** Activity into the Diagram Builder area and drop it on the connection joining the Activity. In the Property Editor, enter/select the following:

    - Identification > Name: **Trainings for Intern**

    - Under Settings:

        - Type: **PL/SQL Procedure or Function**
        - Procedure or Function: **ASSIGN\_EMPLOYEE\_TRAININGS**

   ![Create INVOKE API Activity](./images/create-api4.png " ")

2. Create a connection between **Activity** and **Trainings for Intern** and enter/select the following in the property editor:

    - Indentification > Name: **Intern**

    - Under Condition:

        - Operator: **Is Equal To**
        - Value: **Intern**

   ![Create connection for intern](./images/create-api5.png " ")

3. Under **Trainings for Intern** and select **p\_employee\_id** parameter. In the Property Editor, enter/select the following:

    - Value > Item : **EMPLOYEE_ID**

   ![link parameter for Activity](./images/params3.png " ")

4. Similarly, select **p\_employee\_type** parameter.In the Property Editor, enter/select the following:

    - Value > Item : **EMPLOYEE_TYPE**

   ![link parameter for Activity](./images/params4.png " ")

## Task 7: Create Activity to Assign Trainings

1. From the Activities palette, drag a **Human Task - Create** Activity into the Diagram Builder area and drop it below the **Trainings for Full-Time Employee** activity.

   ![Create activity to assign trainings](./images/assign-trainings1.png " ")

2. In the Property Editor, enter/select the following:

    - Identification > Name: **Assign Trainings**

    - Under Settings:

        - Definition: **Allocate Trainings**
        - Details Primary Key Item: **EMPLOYEE_ID**

   ![Create activity to assign trainings](./images/assign-trainings4.png " ")

3. Under the parameters tab, select **Email** and select the following in the property editor:

    - Under Value:

        - Type: **Item**
        - Item: **EMAIL**

   ![Link parameters](./images/params-emp2.png " ")

4. Similarly, select **Employee Name** and select the following in the property editor:

    - Under Value:

        - Type: **Item**
        - Item: **EMPLOYEE_NAME**

   ![Link parameters](./images/params-emp1.png " ")

## Task 8: Create Activity to send Training Completion Email

In this task, you will create a Send Email Activity to send an email to the New Hire after completion of required trainings.

1. From the Activities palette, drag a **Send Email** Activity into the Diagram Builder area and drop it below the **Assign Trainings** activity.

   ![Create activity to send email](./images/send-email.png " ")

2. In the Property Editor, enter/select the following:

    - Identification > Name: **Training Completion Email**

    - Under Settings:

        - To: **&EMAIL.**
        - Subject: **You’ve Completed Your Trainings – You are All Set, &EMPLOYEE_NAME.!**
        - Body Plain Text: copy and paste the below text

            ```
             <copy>
             Hi &EMPLOYEE_NAME.,
             Congratulations! You have successfully completed all your required trainings as part of the employee onboarding workflow!

             We are excited to officially welcome you aboard and appreciate the time and effort you have put into learning our systems, policies, and culture. With your trainings now complete, you're all set to dive into your role with confidence.

             If you have any questions, need additional resources, or want to revisit any part of the training, don't hesitate to reach out. We're here to support your growth and success every step of the way.

             Welcome again! we are glad to have you on the team!

             Best regards,
             HR Team,
             ACME Corporation.
             <copy>
            ```

   ![Create activity to send email trainings](./images/send-email2.png " ")

## Task 9: Draw connections between Activities

1. Draw Connections from **Trainings for Full-Time Employee** to **Assign Trainings** and **Trainings for Intern** to **Assign Trainings** activity.

   ![Create Connections](./images/create-conn2.png " ")

2. Similarly, draw connections from **Assign Trainings** to **Training Completion Email**.

   ![Create Connections](./images/create-conn3.png " ")

3. Finally, draw a connection from **Training Completion Email** to **End** activity to eliminate the Workflow Model's validation errors.

   ![Create Connections](./images/create-conn4.png " ")

4. Click **Save**.

    ![Save page](./images/save-page.png "")

## Summary

In this lab, you created a workflow in Oracle APEX that assigns onboarding tasks based on the employee’s employment type (Full-Time or Intern). You defined workflow parameters and variables, added automated activities to assign trainings, and configured human tasks and notifications to guide the onboarding process.

## What's Next

In the next lab, you will learn how to create a Employee Onboarding Workflow using Oracle APEX.

You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Sahaana Manavalan, Senior Product Manager; Roopesh Thokala, Senior Product Manager, August 2025
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, August 2025
