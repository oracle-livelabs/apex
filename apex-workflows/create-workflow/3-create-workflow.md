# Create a Doctor Appointment Workflow

## Introduction

In this lab, you learn the process of creating a Doctor Appointment Workflow using Oracle APEX.

### Objectives

In this lab, you learn how to:
  - Create a Workflow
  - Modify the Workflow details
  - Define Workflow Data
  - Add Workflow Variables

Estimated Time: 20 minutes

### Prerequisites
- All the previous Labs have been completed.

## Task 1: Create the Workflow

To create a Workflow:

1. In the App Builder, navigate to **Doctor Appointments Made Easy!** application and then select **Shared Components**.

  ![Navigate to Application](./images/navigate-to-application.png " ")
  ![Click Shared Components](./images/click-shared-components.png " ")

2. Under Workflows and Automations, select **Workflows**.

  ![Navigate to Application](./images/select-workflows.png " ")

3. In the Workflows Page, click **Create**.

  ![Click Create workflow](./images/click-create-workflow.png " ")

4. This will lead you to the Workflow Designer. A new workflow with a Start Activity, Execute Code Activity, and End Activity will be auto-created.

  ![Displaying Workflow Designer](./images/workflow-designer-1.png " ")

## Task 2: Modify Workflow Details

1. With Doctor Appointment selected in the rendering tree, enter/select the following in the Property editor:
    - Identification > Name: **Doctor Appointment**
    - Advanced > Static ID: **DOC_APPT**

    ![Change the Workflow name and Static ID](./images/change-workflow-name.png " ")

2. Now, select **New[Dev]** in the left pane, and in the property editor, for Workflow Version enter **1.0**.

  ![Change the Workflow Version](./images/create-workflow-version.png " ")

> **Note:** _You may have noticed the label [Dev] next to the version in the tree on the left pane. This means that this version of the Workflow is In Development and all parts of it are editable. We will learn about workflow versioning- Active vs. In Development versions in future labs in this workshop._

3. The Workflow cannot be saved yet as the there are validation errors. Click on the **error icon (Yellow exclamation mark)** to see the error.

  ![Check Errors in the Page](./images/check-workflow-errors.png " ")

4. At this point, we will remove this activity since we plan to introduce new specific activities in subsequent sections of this lab. To do this, either right-click on the highlighted RED activity in the Workflow tree and select **Delete**, or click on the three dots at the bottom right corner of the activity in the Diagram. This will open a menu, and you can choose **Delete** from the options provided.

  ![Delete activity using Tree](./images/delete-activity-tree.png " ")
  ![Delete activity using workflow designer](./images/delete-activity-designer.png " ")


5. The Workflow now contains just the Start and the End activities. Connect the Start and End activities and then click the **Save** button at the top right corner.

  ![Changes saved successfully](./images/save-workflow.png " ")

> **Note:** _A workflow model cannot be saved until its validation errors have been fixed.._

6. The changes are saved successfully.

  ![Check Errors in the Page](./images/changes-saved.png " ")

## Task 3: Familiarize with Workflow Elements

1. At this stage, let's explore the fundamental elements and terminology of a workflow. We have introduced the notions of Activities and Connections in the Workflow. Now, let's take a moment to understand the different types of workflow elements and terms such as Activities, Connections, and Connection Types.

2. Refer to the Activity Palette at the bottom in the Designer for a list of activity types.

  ![Check activities palette](./images/activities-palette.png " ")


  | Activity Type         | Description                                                                                                              | Blocks the workflow engine until execution completes? |
  |------------------------|--------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------|
  | Execute Code           | Executes PL/SQL Code                                                                                                     | Yes                                                    |
  | Invoke API             | Invokes a procedure or function inside a PL/SQL package or an API from a REST Data Source.                              | Yes                                                    |
  | Push Notifications    | Sends push notifications using PWA                                                                                      | Yes                                                    |
  | Send E-Mail            | Sends an Email based on the Email settings.                                                                             | Yes                                                    |
  | Human Task - Create    | Creates an Approval or Action Task based on the Task Definition specified. Once the task is created, the activity and workflow go into the Waiting state until the task is completed/approved/rejected by its owner/errors out/expires. | No                                                     |
  | Wait                   | Denotes a deliberate pause in the workflow execution. At runtime, the workflow pauses execution when it encounters a Wait Activity. A Wait Activity can have timeout specifications. When the specified time has elapsed, the workflow resumes execution. A Wait Activity can also be interrupted by calling apex\_workflow.continue\_activity() passing the Static ID of the Wait Activity and the Workflow Instance ID as parameters. | No                                                     |
  | Switch                 | Denotes a fork or conditional branching in a workflow execution. After adding a switch activity, the developer must define branches or connections out of the switch activities with the appropriate conditions specified. | Yes                                                    |
  | Workflow Start         | Denotes the Start of a workflow. A workflow model must have exactly one Start Activity.                                   | Yes                                                    |
  | Workflow End           | Denotes the End of a workflow. Depending on the End State attribute of this activity, the Workflow is either Completed or Terminated. | Yes                                                    |
  {: title="List of Activity Types"}


  
  | Connection Type | Description                                                                                                        |
  |------------------|--------------------------------------------------------------------------------------------------------------------|
  | Normal           | Connects two activities in the workflow. No conditions. Not applicable for Switch Activities                         |
  | Timeout          | If an activity has a due date specified, the timeout connection can be used to move the workflow to an alternate target activity in case the current activity execution times out. Not applicable for Switch and Wait activities.  |
  | Error            | Allows for efficient error management within the workflow without letting it go into a state of exception. Not applicable for Switch activities.                                      |
  | Switch connections | Connections leading out of a Switch Activity. They are conditional in nature.                                      |
  {: title="List of Connection Types"}


## Task 4: Add Inputs to the Doctor Appointments Workflow

In this lab, we explore various aspects of workflow data using the example of a medical appointment application that we are building. We will focus on understanding parameters, variables, activity variables, and additional data.

Referring to the flow chart in Lab 1, illustrating the business logic, the appointment booking process initiates with the Hospital Staff submitting patient details to the system, marking the commencement of the workflow.

The inputs to the workflow will be the patient details. In workflow terminlogy, these are called **Workflow Parameters**.
You will define the following parameters for the Doctor Appointment Workflow: 
   PATIENT\_NAME, PATIENT\_AGE, PATIENT\_EMAIL, PROBLEM, REQUEST\_DATE

1. To create Workflow Parameters, right-click on the **Doctor Appointment** Workflow in the tree and select **Create Parameter**.

  ![Create Parameter](./images/create-parameter.png " ")

2. This adds a Parameter with a label "New" in the Workflow tree. In the Property Editor, enter/select the following:
    - Label: **Patient Name**
    - Static ID: **PATIENT_NAME**
    - Data Type: **VARCHAR2**

  ![Configure Patient Name Parameter](./images/create-param-patient-name.png " ")

3. Similarly, add the Parameters given in the table below.

  |Static ID | Label | Data Type | Application Format Masks > Session State Format Mask |
  |----------|-------|-------------|----------|
  | PATIENT_AGE | Patient Age | Number |    |
  | REQUEST_DATE | Request Date | Timestamp | DD-MON-YYYY HH24:MI:SS |
  | PATIENT_EMAIL | Patient Email | Varchar2 |     |
  | PROBLEM | Problem | Varchar2 |       |
  {: title="List of Parameters to be Created"}

      ![Add and Configure Request Date Parameter](./images/add-param-date.png " ")

## Task 5: Use the parameters in the Workflow Subject

The Workflow has a Title field which is a descriptive title for the Workflow and shows up in the Workflow Console that the Hospital Staff will eventually use to monitor the progress of the appointment process. The Title supports using workflow parameter static IDs as substitution strings.

1. To set the Workflow Title, select **Doctor Appointment** Workflow in the Rendering Tree on the left.

2. In the Property Editor, change the Title to **Doctor Appointment Workflow for patient &PATIENT_NAME**.

    ![Change Workflow Title](./images/change-workflow-title.png " ")

3. Click **Save** to save your changes.

## Task 6: Add Additional Data to the Workflow

In addition to the input parameters, the Workflow also needs information about the available doctors based on the patient's problem. An understanding of the appointment process tells us that all activities of the workflow need the doctor data.

1. To define Additional Data, click on the **Workflow Version 1.0[Dev]** in the rendering tree.

2. In the Property Editor, enter/select the following:
    - Under 'Additional Data':
        - Type: **Table/View**
        - Table Name: **DOCTOR**
    - Column Mapping > Primary Key Column: **DNAME**

    ![Set Table Name](./images/add-additional-data.png " ")

3. Click **Save**.

> **Note:** _Now, all the columns' values of the DOCTOR table will be available as Bind Variables or Substitution Strings at all points and by all activities during the execution of this Workflow._


## Task 7: Add Workflow Variables

**Why Parameters and Additional Data are not enough?!**

The inputs provided to the Appointment Workflow are read-only in nature. This means that, once the workflow is submitted, their values will never be modified. The workflow needs to process and pass data from one activity to the next. 

As an example, consider the following business scenario:

Before an appointment is confirmed, the workflow needs to compute the doctor's availability based on his/her current appointment schedule. So, availability of the doctor is a variable that will be determined based on this computation.

When an appointment is confirmed, the Booking ID for the appointment is carried forward to later activities which calculate and update the appointment fees.

Data such as Availability, Booking ID and Fee need to be updatable by the activities of the workflow as part of the execution. Such data is defined as **Workflow Variables**.

1. Right-click on **1.0 [DEV]** (workflow version) in the Rendering Tree.

2. Select **Create Variable**.
    ![Create Variable](./images/create-variable.png " ")

3. A new variable with Name **New** gets created in the tree. Click on it and enter/select the following in the Property Editor:
    - Identification > Static ID: **BOOKING_ID**
    - Label > Label: **Booking ID**
    - Variable > Data Type: **NUMBER**
    - Value > Type: **Null**. This is because we know that the Booking ID only gets generated later in the workflow after the appointment is confirmed, so it needs to be initialized to null.

        ![Create Booking ID Variable](./images/create-bookingid-variable.png " ")

4. Similarly, create a variable called **AVAILABILITY**. Enter/Select the following in the Property Editor:
    - Data Type: **BOOLEAN**
    - Value > Type: **Null**
    - Under 'Application Format Masks':
        - True Value: **AVAILABLE**
        - False Value: **BUSY** 
    

  ![Create Availability Variable](./images/configure-availability.png " ")

6. Finally, create a variable **FEE**. Enter/Select the following in the Property Editor: 

    - Data Type: **NUMBER**

    - Under 'Value':
      - Type: **Static Value**
      - Static Value: **0**

  ![Create Fee Variable](./images/create-variable-fee.png " ")

7. Click **Save**.

## Summary

In this lab, you learned the process of creating a Doctor Appointment Workflow using Oracle APEX.

### What's Next
Now, you're ready to proceed to the next section where you'll learn how to add Human Tasks to your Workflow. Stay tuned for more hands-on guidance!

You may now **proceed to the next lab**.   


## Acknowledgements
- **Author(s)** - Roopesh Thokala, Senior Product Manager & Ananya Chatterjee, Consulting Member of Technical Staff.
- **Contributor** -
- **Last Updated By/Date** -  Roopesh Thokala, Senior Product Manager, December 2023   
