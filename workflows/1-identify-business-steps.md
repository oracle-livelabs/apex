# Doctor Appointments Made Easy - Identify Business steps

## Introduction

In this Lab, you learn how to implement an efficient system to schedule and manage doctor consultations where you design an APEX Application titled **Doctor Appointments Made Easy** that leverages the Workflow component to efficiently schedule and manage doctor consultations. To achieve this, we need to follow a structured approach:

- Break down the business logic into manageable, executable steps.
- Identify the sequences and conditions that govern the execution of these steps.
- Identify the key participants in the organization that are involved in this business process.


*Note: In APEX Workflow terminology - we refer to an executable step as an Activity and a sequence/condition as a Connection.*

Estimated Time: 10 minutes

### Objectives

In this lab, you will:
- Identify Business steps required to create Doctor Appointment made Easy Application.


Welcome to our hands-on lab where we will create an APEX Application called "Doctor Appointments Made Easy"
## Breaking down the Business Logic

We will begin by dissecting the medical appointment business process into distinct steps and identifying the actors or participants associated with each step. Here's an overview:

### Steps in the Medical Appointment Business Process

| Step No. | Step Description                                             | Step Type | Actor                  |
|---------|-------------------------------------------------------------|-----------|------------------------|
| 1       | Schedule a doctor appointment                               | Manual    | Patient                |
| 2       | Login to the application, fill patient details, and submit appointment request on behalf of the patient | Manual    | Hospital Management Representative/Staff |
| 3       | Check doctor's availability for the requested appointment date/time | Automatic | Workflow              |
| 4       | If the doctor is busy, send a "No-Appointment" email to the patient and close the appointment request | Automatic | Workflow              |
| 5       | If the doctor is available, raise an "Approval Task" for the doctor to confirm the appointment request | Automatic | Workflow              |
| 6       | Log in to the application to access the appointment request | Manual    | Doctor                 |
| 7       | Approve the appointment request | Manual    | Doctor                 |
| 8       | Reject the appointment request | Manual    | Doctor                 |
| 9       | If the doctor rejects, send a "No-Appointment" email to the patient and close the appointment request | Automatic | Workflow              |
| 10      | If the doctor approves, enter appointment details in the system with status 'Confirmed' | Automatic | Workflow |
| 11      | Check if the patient had a previous appointment with the same doctor in the last 7 days | Automatic | Workflow |
| 12      | If the patient had a previous appointment, mark this as a follow-up visit, don't charge fees, and raise an invoice with zero payment request for the patient to confirm | Automatic | Workflow |
| 13      | If it's a new visit, raise an invoice with fees and payment request for the patient to confirm | Automatic | Workflow |
| 14      | In both cases, send an email notifying the patient of the appointment confirmation and the invoice request | Automatic | Workflow |
| 15      | Log in to the application to confirm the invoice | Manual    | Patient                |
| 16      | If the patient doesn't confirm the invoice within a specific period, send a "No-Appointment" email and close the appointment request | Automatic | Workflow |
| 17      | If the patient confirms the invoice, update the appointment status to "PAID" in the system of records | Automatic | Workflow |
| 18      | Wait until the appointment is completed | Automatic | Workflow |
| 19      | Raise a feedback request to the patient | Automatic | Workflow |
| 20      | Log in to the application and provide feedback | Manual    | Patient                |
| 21      | If the patient doesn't complete the feedback request within a specified period, close the appointment request | Automatic | Workflow |
| 22      | If the patient provides feedback, send a "Thank You" email to the patient and then close the appointment request | Automatic | Workflow |

This comprehensive breakdown illustrates the significance of workflow in managing complex business processes, making the system efficient and responsive.

In our next steps, we will create a flowchart based on the automated steps, helping us visualize the flow of the business logic and its seamless execution. Stay tuned as we dive into the practical implementation of this intuitive doctor appointment management system!

![Flow Chart for Medical Appointments](images/medflowchart.png " ")

## **Summary**

You now know how to create an application, run a SQL script and add users.

You may now **proceed to the next lab**.   

## Acknowledgments
   - **Author** - Ankita Beri, Product Manager
   - **Contributor** - Roopesh Thokala, Senior Product Manager
   - **Last Updated By/Date** - Ankita Beri, Product Manager, June 2023
