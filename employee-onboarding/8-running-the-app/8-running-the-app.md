# Run the Employee Onboarding Application

## Introduction

In this lab, you will run and explore the Employee Onboarding application to understand how the workflows and automations function in a real scenario. Through hands-on activities, you will simulate the process of hiring and onboarding a new employee and observe how the system handles different roles and tasks.

### Real-world Scenario

A Sales Manager recruits a new employee. The HR team then completes the onboarding process,just one day before the scheduled onboarding, HR assigns the employee to the Sales Manager, and ensures the reporting structure is correctly established.
When the new employee is entered in the system, it triggers a workflow
 This scenario helps demonstrate how Oracle APEX workflows and automations work together to manage onboarding efficiently, while also maintaining proper assignment and organizational hierarchy.

### Objectives

- Demonstrate the behavior of the Employee Onboarding application through hands-on activities.

Estimated Time: 15 minutes

### Prerequisites

- All the previous Labs have been completed.

## Task 1: Set the APP_EMAIL Substitution String

1. Go to the Application Home Page and click **Edit Application Definition**.

   ![Edit App definition](./images/edit-app-def.png " ")

2. Under Substitutions, add the following entry for APP_EMAIL settings.

    - Substitution: **APP_EMAIL**

    - Value: **no-reply@acmecorp.com**

   ![set application Email](./images/set-app-email.png " ")

3. Click **Apply Changes**.

## Task 2: Create Application Users

In this task, you create multiple users for **Employee Onboarding** application.

1. On the Application home page, click Administration icon and select Manage Users and Groups.

   ![Create Users application](./images/create-users.png " ")

2. Click **Create Multiple User**.

   ![Create Users application](./images/create-users2.png " ")

3. You will create the following users for the application:
You will create the following users for the application:

    |   Employee Name      |  Department |
    | -------------- | --------- |
    |    STEVE          |   HR  |
    |   AMY     |    IT  |
    |   ALEX | Sales |
    {: title="List of Users to Create in the Application"}

4. In the **Create multiple Users** dialog, enter/select the following attributes:

    - List of Email Addresses: Copy and Paste the below email addresses

      ```
      <copy>
      AMY@yourdomain.com
      STEVE@yourdomain.com
      ALEX@yourdomain.com
      </copy>
      ```

    - Usernames: **Exclude @ domain as part of the username**

    - Password and Confirm Password: **Enter a password**

    Click **Next**.

    > *Note:* Replace yourdomain.com with your actual domain.

    ![Create Multiple Users - details](./images/create-multiple-users.png =50%x*)

5. Click **Create Valid Users**.

    ![Create Multiple Users - details](./images/create-multiple-users2.png =50%x*)

## Task 3: Enter Employees in Application

In this task, you will recreate the previously created  employees in the Application.

1. From the Application Home Page, click **Run Application**.

   ![Run application](./images/run-app.png " ")

2. Log in as an Administrator and Navigate to **Administration** > **Employees** page.

   ![login to the application](./images/login-to-app.png =30%x*)

3. Click **Create**.

   ![Create  Users - details](./images/create-emp1.png " ")

4. Create the users : STEVE, AMY and ALEX with appropiate details.

   ![Create Steve](./images/create-steve.png " ")

   ![Create Amy](./images/create-amy.png =40%x*)

   ![Create ALEX](./images/create-alex.png =40%x*)

## Task 4: Onboard a New Hire

1. Log in as STEVE (HR) to onboard a new employee

   ![login to the application](./images/login-steve.png =40%x*)

2. Click **New Employee - Onboarding** to onboard a new employee.

   ![create appointment](./images/create-employee-onboard.png " ")

3. Enter the following details:

   - First Name: **Monica**
   - Personal Email: **Monica@test.com**
   - Employee Type: **Full-Time**
   - Department: **Sales**
   - Role: **Senior Sales Engineer**
   - Manager: **ALEX**
   - Joining Date: **- Enter a Date -**

   Click **Create**.

   ![Create Monica](./images/create-monica.png " ")

4. Verify the success message.

   ![appointment created](./images/success-msg.png " ")

## Task 4: Monitor the Workflow

1. From the left navigation menu, click on **Workflow Pages** and select **Workflows Initiated By Me**.

   ![navigate to Workflow Initiated by me](./images/work-init-me.png " ")

2. Click on the **Employee Onboarding** entry and observe the Workflow Details Popup.

    - Workflow is waiting at "On boarding Tasks" Activity.

    - Observe Workflow Parameters.

    ![navigate to workflow](./images/monitor-appts.png " ")

## Task 5: Do the IT Setup tasks

1. Log in as **AMY**, who is a IT staff in this workflow.

    ![login as AMY](./images/login-amy.png =40%x*)

2. Select **Task Pages** and click **My Tasks** from the left navigation menu.

    ![navigate to my tasks](./images/my-tasks.png " ")

3. Click on the **IT Setup Tasks for Monica** to complete the IT setup for the new hire.

    ![navigate to my tasks](./images/current-tasks.png " ")

4. Observe that there are two pending tasks: **Task Name: Create Email** and **Task Name: Allocate Laptop** activity for the new hire (MONICA), to create an official email ID and to allocate a laptop.

    ![Pending my tasks](./images/pending-tasks.png " ")

5. Observe that there is a **Create Email** button which navigate you to the **IT Setup** page. Click **Create Email**.

    ![create email](./images/create-email.png " ")

6. Enter an **email** for the new hire and click **Create Email**.

    ![create email](./images/create-email4.png " ")

7. Similarly, click on **Allocate Laptop** to allocate a laptop for the new hire. ( Notice that the Create Email task is marked as Completed.)

    ![Allocate laptop](./images/allocate-laptop.png " ")

8. Enter **Laptop allocation informations** and click **Allocate Laptop**.

    ![Allocate laptop](./images/allocate-laptop2.png " ")

9. Click on the **IT Setup Tasks for Monica** to complete the task.

    ![navigate to my tasks](./images/click-tasks.png " ")

10. Observe that both the tasks are **Completed**. Click on **Complete** to finish the IT Setup Tasks.

    ![Complete Tasks](./images/complete-task.png " ")

11. Notice the success message for task completion.

    ![Completed Task sucess messages](./images/task-sucess.png " ")

## Task 6: Observe the Workflow

1. Log out and log in as **STEVE** (HR).

   ![login to the application](./images/login-steve.png =40%x*)

2. Click on **Workflow Pages** and select **Workflows Initiated By Me** from the left navigation menu.

   ![navigate to wf initiated by me](./images/observe-wf.png " ")

3. Observe that there are two active workflows: **Employement Type Workflow** and **Employee Onboarding**.

   ![wf initiated by me](./images//observe-wf1.png " ")

4. Note the correctly set Workflow Variables: Approver, Fee, and TaskOutcome.

## Task 7: Complete the Workflow

1. Log out and log in as **RAJESH**.

2. Navigate to **Patient Tasks** and click on the entry **Invoice for Rajesh for consultation....** to complete the request after confirming the invoice.

   ![navigate to doctors app made easy](./images/rajesh-patient-tasks.png " ")

3. Log out and log back in as **STEVE** to monitor the workflow. Observe that the Calculate fees workflow has been completed. Now, Doctor Appointment workflow is waiting at **Wait Before Requesting Feedback** activity to complete.

   ![check appointment workflow](./images/check-appt-workflow.png " ")

## Task 8: Request Feedback Process

1. As the Doctor Appointment workflow is waiting at **Wait Before Requesting Feedback** activity to complete.

   Recall that the Wait activity has a timeout setting that elapses once the Appointment Time is reached.

   ![wait for appointment](./images/check-appt-workflow2.png " ")

2. At this point, we wait for the appointment time to elapse and check back again once that happens. This is what is observed.

   ![wait for appointment1](./images/wait-for-appt1.png " ")

## Task 9: Provide Patient Feedback

1. Now that the Feedback Request has been raised, log out and log back in as **RAJESH** (the patient).

2. Click on **Patient Tasks** and find the Feedback Request Task (Feedback fro Consultation on ....) waiting for your action.

3. Fill in the Feedback Details and click **Complete**.

  ![wait for feedback](./images/check-feedback-form1.png " ")

## Task 10: Complete the Workflow

1. Log out and log back in as **STEVE** to monitor the workflow.

2. Observe that the both the Workflows are now completed.

   ![wait for feedback](./images/observe-workflow-completed.png " ")

## Task 11: Verify Email Confirmation

1. Check the inbox of the patient's email for a 'Thank You' email.

   ![thank you email](./images/thank-you-email.png " ")

2. Log in as **RAJESH** and verify that the Feedback was entered successfully.

   ![wait for feedback](./images/rajesh-feedback-check.png " ")

## [OPTIONAL] Additional Scenarios to Try

1. **Double Booking:** As a Hospital Staff, try to book 2 appointments for the same time for 2 different patients with the same doctor. Observe the workflow termination for the second patient.

2. **Doctor Rejects Appointment:** As a Doctor, reject an appointment request. Observe the workflow termination for the patient.

3. **Appointment Within 7 Days:** As a Hospital Staff, try to book an appointment for the same patient with the same doctor within 7 days of the last appointment. Observe the calculated consultation fees.

4. **Delay in Invoice Response:** As a patient, after receiving an Invoice Request, do not act on the task. Observe the workflow termination and receive a No Appointment Email after one day.

5. **Delay in Feedback Response:** As a patient, after receiving a Feedback Request, do not act on the task. Observe the workflow completion, and after 12 hours, 'Thank You' email is not received.

## Summary

In this hands-on lab, you learned how to:

- Automate business processes using APEX Workflows.
- Define workflow activities, variables, parameters, additional data, and connections.
- Start a new workflow through a Page Process.
- Monitor the progress of initiated workflows.

## Acknowledgements

- **Author** - Roopesh Thokala, Senior Product Manager; Sahaana Manavalan, Senior Product Manager, August 2025
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, August 2025
