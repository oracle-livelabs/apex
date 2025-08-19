# Run the Employee Onboarding Application

## Introduction

In this lab, you will run and explore the Employee Onboarding application to understand how the workflows and automations function in a real scenario. Through hands-on activities, you will simulate the process of hiring and onboarding a new employee and observe how the system handles different roles and tasks.

### Real-world Scenario:
A Sales Manager recruits a new employee just one day before the scheduled onboarding. The HR team then completes the onboarding process, assigns the employee to the Sales Manager, and ensures the reporting structure is correctly established. This scenario helps demonstrate how Oracle APEX workflows and automations work together to manage onboarding efficiently, while also maintaining proper assignment and organizational hierarchy.

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

4. Create the users : AMY, STEVE and ALEX with appropiate details.

   ![Create Amy](./images/create-amy.png " ")

   ![Create Steve](./images/create-steve.png =40%x*)

   ![Create ALEX](./images/create-alex.png =40%x*)



## Task 3: Onboard an Employee

1. Log in as STEVE (HR) to onboard a new employee

   ![login to the application](./images/login-steve.png =40%x*)

3. Click **New Employee - Onboarding** to onboard a new employee.

   ![create appointment](./images/create-employee-onboard.png " ")

4. Select **Psychiatric** from the problem dropdown.

5. Choose **ANACHATT** as the available doctor.

6. Fill in the **Age** (example: 45) and click **Submit**.

   ![create an appointment](./images/create-appointment1.png " ")

7. Verify the success message.

   ![appointment created](./images/appoint-created1.png " ")

## Task 4: Monitor the Workflow

1. Click on **Monitor Appointment Workflows** from the left navigation menu.

   ![navigate to doctors app made easy](./images/monitor-appt.png " ")

2. Click on the **Workflow for Patient RAJESH** entry and observe the Workflow Details Popup.

    - Workflow is waiting at "Raise Appointment Request" Activity.

    - Observe Workflow Parameters.

    ![navigate to doctors app made easy](./images/monitor-appts.png " ")

## Task 5: Approve the Appointment Request

1. Log in as **ANACHATT**, who is a Doctor in this workflow.

2. Select **Doctor Tasks** from the left navigation menu.

    ![navigate to doctors app made easy](./images/login-as-annchatt.png " ")

3. Click **Approve** to approve the appointment request.

## Task 6: Observe the Workflow

1. Log out and log in as **STEVE** (Hospital Staff).

2. Click on **Monitor Appointment Workflows** from the left navigation menu.

3. Observe that there are two active workflows: **Calculate Fees** and **Doctor Appointment** and Calculate Fees workflow is waiting at **Raise Invoice Request** activity for the patient (RAJESH), to pay and confirm the invoice. Observe that there is a **To Parent Workflow** button which navigate you to the **Doctor Appointment** workflow.

   ![navigate to doctors app made easy](./images/two-workflows.png " ")

   ![navigate to doctors app made easy](./images/steve-monitor-appt-child.png " ")

   ![navigate to doctors app made easy](./images/steve-monitor-appt-parent.png " ")

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
