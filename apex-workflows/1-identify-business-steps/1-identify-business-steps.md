# Identify Business steps

## Introduction

In this lab, you will learn how to design an efficient system for scheduling and managing doctor consultations by creating an APEX application titled **Doctor Appointments Made Easy!**. The application will leverage APEX Workflow to streamline the appointment process.

To build this system, we will follow a structured approach:

- Break down the business logic into clear, manageable, and executable steps.
- Identify the sequences and conditions that determine how these steps are executed.
- Determine the key organizational participants involved in this business process.

>*Note: In APEX Workflow terminology:*

- *An executable step is called an **Activity**.*

- *A sequence or condition between steps is called a **Connection**.*

### Objectives

In this lab, you will:

- Identify the business steps required to create the **Doctor Appointments Made Easy!** application.

Estimated Time: 10 minutes

### Prerequisites

1. An Oracle APEX workspace.

## Task 1: Breaking down the Business Logic

In this task, we break down the medical appointment process into clear, executable steps and identify the actors or participants involved in each part of the workflow. The following sections outline the full sequence of activities required to manage appointments efficiently using APEX Workflow.

### Steps in the Medical Appointment Business Process

**Calculate Fees Workflow (Invoke Workflow):**

| Step No. | Step Description                                             | Step Type | Actor                  |
|---------|-------------------------------------------------------------|-----------|------------------------|
| 1      | If the doctor approves, enter appointment details in the system with the status 'Confirmed'. | Automatic | Workflow |
| 2     | Check whether the patient had an appointment with the same doctor within the last seven days. | Automatic | Workflow |
| 3      | If a previous appointment exists, mark the visit as a follow-up, apply no charges, and generate an invoice with zero payment for patient confirmation. | Automatic | Workflow |
| 4     | If it is a new visit, generate an invoice including fees and a payment request for patient confirmation. | Automatic | Workflow |
| 5     | Send an email to the patient notifying them of the appointment confirmation and invoice request. | Automatic | Workflow |
| 6      | Log in to the application to confirm the invoice. | Manual    | Patient                |
| 7      | If the patient does not confirm the invoice within a specified timeframe, send a “No-Appointment” email and close the request. | Automatic | Workflow |
| 8      | If the patient confirms the invoice, update the appointment status to “PAID” in the system of record. | Automatic | Workflow |

**Doctor Appointment Workflow:**

| Step No. | Step Description                                             | Step Type | Actor                  |
|---------|-------------------------------------------------------------|-----------|------------------------|
| 1       | Schedule a doctor's appointment.                               | Manual    | Patient                |
| 2       | Log in to the application, enter patient details, and submit an appointment request on the patient’s behalf. | Manual    | Hospital Management Representative/Staff |
| 3       | Check the doctor's availability for the requested appointment date/time. | Automatic | Workflow              |
| 4       | If the doctor is unavailable, send a “No-Appointment” email to the patient and close the request. | Automatic | Workflow              |
| 5       | If the doctor is available, create an Approval Task for the doctor to review the appointment request. | Automatic | Workflow              |
| 6       | Log in to the application to access the appointment request. | Manual    | Doctor                 |
| 7       | Approve the appointment request. | Manual    | Doctor                 |
| 8       | Reject the appointment request. | Manual    | Doctor                 |
| 9       | If rejected, send a “No-Appointment” email to the patient and close the request. | Automatic | Workflow              |
| 10      | Invoke the Calculate Fees Workflow. | Automatic | Invoke Workflow |
| 11      | Wait until the appointment has been completed. | Automatic | Workflow |
| 12      | Generate a feedback request for the patient. | Automatic | Workflow |
| 13      | Log in and provide feedback. | Manual    | Patient                |
| 14      | If feedback is not submitted within a specified period, close the appointment request. | Automatic | Workflow |
| 15      | If feedback is submitted, send a “Thank You” email and close the appointment request. | Automatic | Workflow |

These steps demonstrate how workflow automation simplifies complex business processes, ensuring a seamless experience for both patients and healthcare providers.

- Calculates Fees Workflow

![Flow Chart for Medical Appointments](images/cal-fees-flowchart.png " ")

- Doctor Appointment Workflow

![Flow Chart for Medical Appointments](images/doc-appt-flowchart.png " ")

## Summary

You now have a clear understanding of how workflow plays a crucial role in managing complex business processes, ensuring that the system operates efficiently and remains highly responsive.

## What's Next

In the next lab, you will create a flowchart that visually represents the automated steps of the process. This will help illustrate how the business logic flows from one activity to another, setting the stage for the practical implementation of the doctor appointment management system.

You may now **proceed to the next Lab**.

## Acknowledgements

- **Author(s)** - Roopesh Thokala, Senior Product Manager & Ananya Chatterjee, Consulting Member of Technical Staff.
- **Contributing Author** - Pankaj Goyal, Member Technical Staff
- **Last Updated By/Date** - Pankaj Goyal, Member Technical Staff, December 2025
