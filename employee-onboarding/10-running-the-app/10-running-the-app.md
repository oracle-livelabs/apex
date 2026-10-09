# Explore the Employee Onboarding Application

## Introduction

In this lab, you will run and explore the Employee Onboarding application to understand how the workflows and automations function in a real scenario. Through hands on activities, you will simulate the process of hiring and onboarding a new employee and observe how the system handles different roles and tasks.

### Objectives

- Demonstrate the behavior of the Employee Onboarding application through hands-on activities.

Estimated Time: 15 minutes

Watch the video below for a quick walk-through of the lab.
[Create an APEX App](videohub:1_fny0oxa1)

### Prerequisites

- All the previous Labs have been completed.

## Task 1: Enter Employees in Application

In this task, you will recreate the previously created employees in the Application.

1. From the **Application Home page**, click **Run Application**.

   ![Run application](./images/run-app.png " ")

2. Log in as an **Administrator** and Navigate to **Administration** > **Employees** page.

   ![login to the application](./images/login-to-app.png =30%x*)

3. Click **Create**.

   ![Create  Users - details](./images/create-emp1.png " ")

4. Create the users : STEVE, AMY and ALEX with appropiate details.

   ![Create Steve](./images/create-steve.png " ")

   ![Create Amy](./images/create-amy.png =40%x*)

   ![Create ALEX](./images/create-alex.png =40%x*)

## Task 2: Onboard a New Hire

1. Log in as STEVE (HR) to onboard a new employee

   ![login to the application](./images/login-steve.png =40%x*)

2. Click **New Employee - Onboarding** to onboard a new employee.

   ![create appointment](./images/create-employee-onboard.png " ")

3. Enter the following details:

    - First Name: **MONICA**
    - Personal Email: **MONICA@example.com**
    - Employee Type: **Full-Time**
    - Department: **Sales**
    - Role: **Senior Sales Engineer**
    - Manager: **ALEX**
    - Joining Date: **- Enter a Date -**

   Click **Create**.

   ![Create Monica](./images/create-monica.png " ")

4. Verify the success message.

   ![appointment created](./images/success-msg.png " ")

5. Check the inbox of the New Hire's personal email for the onboarding email.

   ![Congralutions email](./images/email-onboarding.png " ")

## Task 3: Monitor the Workflow

1. From the left navigation menu, click on **Workflow Pages** and select **Workflows Initiated By Me**.

   ![navigate to Workflow Initiated by me](./images/work-init-me.png " ")

2. Click on the **Employee Onboarding** entry and observe the Workflow Details Popup.

    - Workflow is waiting at **Onboarding Tasks** Activity.

    - Observe Workflow Parameters.

    ![navigate to workflow](./images/monitor-appts.png " ")

## Task 4: Complete the IT Setup tasks

1. Log in as **AMY**, who is an IT staff in this workflow.

    ![login as AMY](./images/login-amy.png " ")

2. Select **Task Pages** and click **My Tasks** from the left navigation menu.

    ![navigate to my tasks](./images/my-tasks.png " ")

3. Click on the **IT Setup Tasks for Monica** to complete the IT setup for the new hire.

    ![navigate to my tasks](./images/current-tasks.png " ")

4. Observe that there are two pending tasks: **Task Name: Create Email** and **Task Name: Allocate Laptop** activity for the new hire (MONICA), to create an official email ID and to allocate a laptop.

    ![Pending my tasks](./images/pending-tasks.png " ")

5. Observe that there is a **Create Email** button which navigate you to the **IT Setup** page. Click **Create Email**.

    ![create email](./images/create-email.png " ")

6. Enter an **email** for the new hire and click **Create Email**.

    ![create email](./images/create-email2.png " ")

7. Similarly, click on **Allocate Laptop** to allocate a laptop for the new hire. (Notice that the Create Email task is marked as Completed.)

    ![Allocate laptop](./images/allocate-laptop.png " ")

8. Enter **Laptop allocation informations** and click **Allocate Laptop**.

    ![Allocate laptop](./images/allocate-laptop2.png " ")

9. Click on the **IT Setup Tasks for Monica** to complete the task.

    ![navigate to my tasks](./images/click-tasks.png " ")

10. Observe that both the tasks are **Completed**. Click on **Complete** to finish the IT Setup Tasks.

    ![Complete Tasks](./images/complete-task.png " ")

11. Notice the success message for task completion.

    ![Completed Task sucess messages](./images/task-sucess.png " ")

## Task 5: Observe the Workflow

1. Log out and log in as **STEVE** (HR).

   ![login to the application](./images/login-steve.png =40%x*)

2. Click on **Workflow Pages** and select **Workflows Initiated By Me** from the left navigation menu.

   ![navigate to wf initiated by me](./images/observe-wf.png " ")

3. Observe that there are two workflows: **Employement Type Workflow** and **Employee Onboarding** in **Faulted** state.

   ![wf initiated by me](./images/observe-wf1.png " ")

4. Select **Employement Type Workflow** and notice that the workflow is Faulted in the **Tasks bases on Employement Type** step since there are no Trainings.

   ![wf initiated by me](./images/observe-wf4.png " ")

5. Click **Close**.

## Task 6: Create Training Catalogues

1. Navigate to Administration, and click **Training Catalogues**.

   ![Training Catalogues](./images/create-training.png " ")

2. Click **Create Training**.

   ![Create Training Catalogues](./images/create-training2.png " ")

3. Create the following Trainings:

    |   Training Name      |  Description | Training Type | Estimated Hours | Target Audience |
    | -------------- | --------- | --------- | --------- | --------- |
    |    Corporate Orientation | Introduction to the company’s mission, values, organizational structure, and policies. Covers workplace culture, diversity, and code of conduct. | Virtual | 2 | Full-Time |
    |   HR Policies & Benefits | Overview of HR processes, leave policies, performance management, payroll, and employee benefits (healthcare, retirement, allowances, etc.).   | Virtual | 3 | Full-Time |
    |   Role-Specific Training | Training modules tailored to the employee’s department (e.g., Sales CRM usage, Developer tools, Finance ERP systems).  | Virtual | 7 | Full-Time |
    | Basic IT & Tools Training | Training on how to access company email, collaboration platforms (Slack, Teams), and productivity tools (Google Workspace, MS Office, etc.). | Virtual | 8 | Intern |
    {: title="List of Trainings to Create in the Application"}

   ![Create Training Catalogue](./images/create-training3.png " ")

   ![Create Training Catalogue](./images/create-training4.png " ")

## Task 7: Retry Workflow

1. Navigate to **Workflows Intiated By Me** page.

   ![Navigate Workflow](./images/observe-wf7.png " ")

2. Click on **Employee onboarding** workflow.

   ![Navigate Workflow](./images/observe-wf6.png " ")

3. Click **Retry** to retry the workflow after adding training catalogues.

   ![Retry Workflow](./images/observe-wf8.png " ")

4. Observe the success message.

   ![Success Workflow](./images/observe-wf9.png " ")

   Now the workflow is waiting at the **Tasks based on Employment Type** step.

## Task 8: Complete the Workflow

1. Log out and log in as **MONICA** (New Hire).

2. Navigate to **My Tasks** and click on the entry **Allocate Trainings for Monica** to complete the request after completing the Trainings.

   ![Navigate to my tasks](./images/check-wf.png " ")

3. Click **Mark Complete** for all the trainings and finally **Complete** to complete the trainings assigned to the New Hire.

   ![Complete task](./images/complete-tasks-monica.png " ")

   ![Complete task](./images/mark-completes3.png " ")

4. Notice the success message.

   ![Complete task](./images/check-wf3.png " ")

## Task 9: Observe the Workflow

1. Log out and log back in as **STEVE** to monitor the workflow.

2. Observe that the both the Workflows are now completed.

   ![Check onboarding workflow](./images/check-emp-workflow.png " ")

   ![Check onboarding workflow](./images/check-emp-workflow2.png " ")

## Task 10: Verify Email Confirmation

1. Check the inbox of the New Hire's corporate email for two emails.

   ![Congralutions email](./images/email2.png " ")

   ![Congralutions email](./images/email1.png " ")

## Summary

In this hands-on lab, you learned how to:

- Automate business processes using APEX Workflows.
- Monitor the progress of initiated workflows.
- Retry Faulted workflow.
- Complete Workflow processes.

## Acknowledgements

- **Author** - Sahaana Manavalan, Senior Product Manager; Roopesh Thokala, Senior Product Manager, August 2025
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, August 2025
