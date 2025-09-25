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

Watch the video below for a quick walk-through of the lab.
[Create an APEX App](videohub:1_gxnzhsr1)

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

 *Note: You may have noticed the label [Dev] next to the version in the tree on the left pane. This means that this version of the Workflow is In Development and all parts of it are editable. We will learn about workflow versioning- Active vs. In Development versions in future labs in this workshop.*

## Task 3: Add Inputs for Employment Type Workflow

In this task, you will configure the inputs to the workflow — the new employee’s details. In workflow terminology, these are called **Workflow Parameters**.

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
    | EMPLOYEE_TYPE | Employee Type | VARCHAR2 | Yes |
    {: title="List of Parameters to be Created"}

    ![Add Parameter](./images/add-params2.png "")

## Task 4: Add Workflow Activity for Full Time Employees

In this task, you will create an activity for Employee Type as Full Time.

1. In the Workflow Designer, under 1.0[Dev], click on Activity and enter/select the following in the property editor:

    - Identification > Type: **Switch**
    - Switch > Type: **Check Workflow Variable**
    - Compare >  Compare Variable: **EMPLOYEE\_TYPE**

   ![Create Activity](./images/switch-changes.png " ")

2. Now from the Activities Palette, drag a **Invoke API** Activity into the Diagram Builder area and drop it below the Activity.

   ![Create INVOKE API Activity](./images/create-api23.png " ")

3. For the newly created property, in the property editor, enter/select the following:

    - Identification > Name: **Trainings for Full-Time Employee**

    - Under Settings:
        - Type: **PL/SQL Procedure or Function**
        - Procedure or Function: **ASSIGN\_EMPLOYEE\_TRAININGS**

   ![Create INVOKE API Activity](./images/create-api31.png " ")

4. Create a connection between **Activity** and **Trainings for Full-Time Employee**. To do this, select **Activity**, click the **+** icon at the bottom, and drag the connector to **Trainings for Full-Time Employee** or another way to create a connection is to select the Activity in the rendering tree, and right click

    ![Create INVOKE API Activity](./images/create-conns.png " ")

5. In the Property Editor, enter/select the following:

    - Indentification > Name: **Full Time**

    - Under Condition:
        - Operator: **Is Equal To**
        - Value: **Full Time**

   ![Create INVOKE API Activity](./images/create-api3.png " ")

6. Notice in the Rendering Tree, there are some fields marked in Red. This activity has two Parameters, highlighted in RED to show that they are required.

7. Under **Trainings for Full-Time Employee** and select **p\_employee\_id** parameter. In the Property Editor, enter/select the following:

    - Value > Item : **EMPLOYEE_ID**

   ![link parameter for Activity](./images/params1.png " ")

8. Similarly, select **p\_employee\_type** parameter.In the Property Editor, enter/select the following:

    - Value > Item : **EMPLOYEE_TYPE**

   ![link parameter for Activity](./images/params-employee-type.png " ")

## Task 5: Create Activity for Interns

1. Similarly, Create another Activity for Intern as the Employment type. From the Activities palette, drag a **Invoke API** Activity into the Diagram Builder area. In the Property Editor, enter/select the following:

    - Identification > Name: **Trainings for Intern**

    - Under Settings:

        - Type: **PL/SQL Procedure or Function**
        - Procedure or Function: **ASSIGN\_EMPLOYEE\_TRAININGS**

   ![Create INVOKE API Activity](./images/create-api51.png " ")

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

   ![link parameter for Activity](./images/params-41.png " ")

## Task 6: Create Activity to Assign Trainings

1. From the Activities palette, drag a **Human Task - Create** Activity into the Diagram Builder area and drop it below the **Trainings for Full-Time Employee** activity.

   ![Create activity to assign trainings](./images/assign-trainings12.png " ")

2. In the Property Editor, enter/select the following:

    - Identification > Name: **Assign Trainings**

    - Under Settings:

        - Definition: **Allocate Trainings**
        - Details Primary Key Item: **EMPLOYEE_ID**

   ![Create activity to assign trainings](./images/assign-trainings22.png " ")

3. Under the parameters tab, select **Email** and select the following in the Property Editor:

    - Under Value:

        - Type: **Item**
        - Item: **EMAIL**

   ![Link parameters](./images/params-id21.png " ")

4. Similarly, select **Employee Name** and select the following in the Property Editor:

    - Under Value:

        - Type: **Item**
        - Item: **EMPLOYEE_NAME**

   ![Link parameters](./images/params-emp12.png " ")

## Task 7: Create Activity to send Training Completion Email

In this task, you will create a Send Email Activity to send an email to the New Hire after completion of required trainings.

1. From the Activities palette, drag a **Send Email** Activity into the Diagram Builder area and drop it below the **Assign Trainings** activity.

   ![Create activity to send email](./images/send-email12.png " ")

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

   ![Create activity to send email trainings](./images/send-email22.png " ")

## Task 8: Draw connections between Activities

1. Draw Connections from **Trainings for Full-Time Employee** to **Assign Trainings** and **Trainings for Intern** to **Assign Trainings** activity.

   ![Create Connections](./images/create-conn21.png " ")

2. Similarly, draw connections from **Assign Trainings** to **Training Completion Email**.

   ![Create Connections](./images/create-conn31.png " ")

3. Finally, draw a connection from **Training Completion Email** to **End** activity to eliminate the Workflow Model's validation errors.

   ![Create Connections](./images/create-conn41.png " ")

4. Click **Save**.

    ![Save page](./images/save-page.png "")

## Summary

In this lab, you created a workflow in Oracle APEX that assigns onboarding tasks based on the Employee’s Employment type (Full-Time or Intern). You defined workflow parameters and variables, added automated activities to assign trainings, and configured human tasks and notifications to guide the onboarding process.

## What's Next

In the next lab, you will learn how to create a Employee Onboarding Workflow using Oracle APEX.

You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Sahaana Manavalan, Senior Product Manager; Roopesh Thokala, Senior Product Manager, August 2025
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, August 2025
