# Run the Doctor Appointments Made Easy! Application

## Introduction

In this lab, you will run and understand the behaviour of the **Doctor Appointments Made Easy!** application through hands-on activities. You also perform various tasks to understand the workflow and automation implemented in the application.

## Objective:

- Demonstrate the behaviour of the "Doctor Appointments Made Easy!" application through hands-on activities.


### Task 1: Setting Automatic Timezone for the Application

To demonstrate the behavior of the application, we will use automatic timezone setup. This will ensure that the appointment dates and times are honored with respect to the End User's timezone.

, Go to the Application Home Page -> Shared Components-> Globalization and turn on the Automatic Time Zone.

1. To do this, Navigate to the Application Home Page and then go to Shared Components -> Globalization.

2. Turn on the Automatic Time Zone setting.

    ![navigate to doctors app made easy](./images/change-global-attr.png " ")

3. Save the changes by clicking on Apply Changes.

### Task 2: Setting the APP_EMAIL Substitution String
1. Go to the Application Home Page.
2. Click on Edit Application Definition.

3. Under Substitutions, add the following entry for APP_EMAIL settings.
   - Substitution: APP_EMAIL
   - Value: no-reply@abchospitals.com

   ![set application Email](./images/set-app-email.png " ")

4. Save the changes by clicking on Apply Changes.

### Task 3: Booking an Appointment
From Application Home Page, click on Run Application.

Log In as STEVE (Hospital Staff). Clck on New Appointment to Book a New Appointment for Rajesh. Select the Problem from the drop down as Psychiatric.

1. From the Application Home Page, click on Run Application.

2. Log in as STEVE (Hospital Staff).

   ![login to the application](./images/login-to-app.png " ")

3. Click on **New Appointment** to book an appointment for **Rajesh**.

   ![create appointment](./images/create-appointment.png " ")

4. Select **Psychiatric** from the problem dropdown.

5. Choose **ANACHATT** as the available doctor.

6. Fill in the **Age** (eg., 45) and click on **Book Appointment**.

  ![create an appointment](./images/create-appointment1.png " ")

7. Verify the success message.

  ![appointment created](./images/appoint-created.png " ")

### Task 4: Monitoring the Workflow

1. Click on **Monitor Appointment Workflows** from the Application Home Page.

  ![navigate to doctors app made easy](./images/monitor-appt.png " ")

2. Click on the entry and observe the Workflow Details Popup.
   - Workflow is waiting at "Activity Raise Appointment Request."
   - Observe Workflow Parameters.

  ![navigate to doctors app made easy](./images/monitor-appts.png " ")


### Task 5: Approving the Appointment Request
1. Log in as ANACHATT, who is a Doctor in this workflow.
2. Click on "Doctor Tasks."

  ![navigate to doctors app made easy](./images/login-as-annchatt.png " ")

3. Click on "Approve" to approve the appointment request.


### Task 6: Progressing the Workflow

Log back in as STEVE (Hospital Staff) and click on Monitor Appointment Workflows to monitor the progress of the workflow.

Observe that the Workflow has progressed further and is now waiting at the Raise Invoice Request activity. This activity is waiting for the patient RAJESH to confirm and pay the invoice. Also observe that the Workflow Variables: Approver, Fee , and TaskOutcome are correctly set.

1. Log in as **STEVE** (Hospital Staff).
2. Click on **Monitor Appointment Workflows**.
3. Observe that the workflow is waiting at **Raise Invoice Request** activity.

  ![navigate to doctors app made easy](./images/steve-monitor-appt.png " ")

4. Note the correctly set Workflow Variables.

### Task 7: Completing the Workflow

1. Log in as **RAJESH**.

2. Click on the entry in **Patient Tasks** to complete the request after confirming the invoice.

  ![navigate to doctors app made easy](./images/rajesh-patient-tasks.png " ")

3. Log out and log back in as STEVE to monitor the workflow.

4. Observe that the workflow has now completed the Raise Invoice Request and Update Appointment Activities.

5. Click on the next page button below the Activities.

  ![check appointment workflow](./images/check-appt-workflow.png " ")

### Task 8: Feedback Process

On the next page, observe that the Workflow is now waiting for the Wait Before Requesting Feedback activity to complete. Recall that the Wait activity has a timeout setting which elapeses once the Appointment Time is reached.


1. On the next page, observe that the workflow is waiting at **Wait Before Requesting Feedback** activity to complete.

2. Recall that the **Wait activity** has a timeout setting which elapses once the Appointment Time is reached.

  ![wait for appointment](./images/wait-for-feedback.png " ")

3. At this point we wait for the appointment time to elapse, and check back again once that happens. This is what is observed.

  ![wait for appointment1](./images/wait-for-appt1.png " ")

### Task 9: Patient Feedback

1. Now that the Feedback Request has been raised,  log out and log back in as RAJESH, the patient.

2. Click on **Patient Tasks** and find the Feedback Request Task waiting for your action.

3. Fill in the **Feedback Form** and click **Complete**.

  ![wait for feedback](./images/check-feedback-form.png " ")

### Task 10: Workflow Completion
Log out and log back in as STEVE to monitor the workflow. Observe that the Workflow is now Completed.


1. Log out and log back in as STEVE to monitor the workflow.

2. Observe that the Workflow is now completed.

   ![wait for feedback](./images/observe-workflow-completed.png " ")

### Task 11: Email Confirmation

Check the inbox of the mail id used for the patient.

You will find a Thank You Email.

1. Check the inbox of the patient's email for a Thank You Email.

  ![thank you email](./images/thank-you-email.png " ")

2. Log in as RAJESH and verify the Feedback entered successfully.

  ![wait for feedback](./images/rajesh-feedback-check.png " ")

## Additional Scenarios to Try:
1. **Double Booking:** As a Hospital Staff, try to book 2 appointments for the same time for 2 different patients with the same doctor. Observe the workflow termination for the second patient.

2. **Doctor Rejects Appointment:** As a Doctor, reject an appointment request. Observe the workflow termination for the patient.

3. **Appointment Within 7 Days:** As a Hospital Staff, try to book an appointment for the same patient with the same doctor within 7 days of the last appointment. Observe the calculated consultation fees.

4. **Delay in Invoice Response:** As a patient, after receiving an Invoice Request, do not act on the task. Observe the workflow termination and receive a No Appointment Email after 1 day.

5. **Delay in Feedback Response:** As a patient, after receiving a Feedback Request, do not act on the task. Observe the workflow completion and no Thank You Note after 12 hours.

## Summary:
In this hands-on lab, you learned how to:
- Automate business processes using APEX Workflow.
- Define workflow activities, variables, parameters, additional data, and connections.
- Start a new workflow through a Page Process.
- Monitor the progress of initiated workflows.

## Acknowledgments
- **Author(s)** - Roopesh Thokala, Senior Product Manager & Ananya Chatterjee, Consulting Member of Technical Staff.
- **Contributor** -
- **Last Updated By/Date** - Roopesh Thokala, Senior Product Manager, November 2023   
