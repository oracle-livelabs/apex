# Introduction

## About this Workshop

Welcome to the APEX Workflows LiveLab!

In this workshop, you will learn how to design, build, and manage business processes using the Workflow capabilities available in Oracle APEX. Workflows bring process automation directly into your low-code applications, helping you model, orchestrate, and monitor complex business logic with ease.

**What Are Workflows?**

Workflows automate business processes by defining how documents, information, or tasks move between participants according to a predefined set of rules. These rules include sequence flows, transition conditions, routing logic, and human or automated steps.

With the initial release of APEX Workflows, you can take advantage of the following capabilities:

- **Visual Workflow Designer**: Craft and author workflow models with ease.
- **Workflow Console**: Monitor and administer workflows efficiently.
- **Workflow Runtime (Engine)**: Execute workflows seamlessly.
- **Workflow APIs**: Public API (APEX_WORKFLOW package) and SQL Views.
- **Approval Component**: Feature-rich component with Human Task dynamic participant assignment, task deadlines with expiration policies, vacation rules, task actions, full task history, out-of-the-box Unified Task List and Task Detail pages.
- **Workflow Dashboard**: Provides an overview of in-flight workflow instances.
- **Visual Workflow Diagram**: Depicts workflow progress at runtime.
- **Workflow Variables**: Store and manage data values throughout the execution of a workflow, used for conditions, routing, and automation logic.
- **Workflow Versioning**: Maintain multiple workflow model versions and activate new ones without affecting running instances.

These capabilities enable APEX developers to embed process automation directly into applications without writing large amounts of custom code.

### **Simplify Business Process Management with Workflows**

The primary objective of Workflows is to simplify and automate the management of complex business logic by breaking it into simple, repeatable steps. In this workshop, we demonstrate the utility of APEX Workflows through a real-world use case.

We will focus on a healthcare scheduling scenario—a common challenge in diagnostic clinics and hospital outpatient departments (OPDs). Coordinating consultations, managing appointment requests, and routing approvals often requires multiple manual steps. Using APEX Workflows, you will build an efficient, low-code application that automates key parts of this process and provides a guided, reliable flow for users.

By the end of the workshop, you will have a fully functioning workflow-driven application that streamlines appointment handling and demonstrates the power of APEX Workflows in real business environments.

Estimated Time: 3 hours 50 minutes

### Objectives

In this workshop, you will:

- Identify the manual and automated steps of your business process.
- Create the APEX application.
- Create the Doctor Appointment Workflow.
- Add Invoke Workflow.
- Add Human Tasks to the Workflow.
- Add Activities and Connections to the Workflow.
- Create pages for the APEX application.

## Prerequisites

- An APEX workspace.

>*Note: This workshop assumes you are using Oracle APEX 24.2.*

- *Some of the features might not be available in prior releases and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.*

- *The screenshots in this workshop are taken using Dark Mode in APEX 24.2*

- *The application ID and application icon in the screenshots may vary. Please ignore the application ID and icon.*

## Labs

| Lab |  Module | Est. Time |
| --- | --- | --- |
| 1 | [Identify Business Steps](?lab=1-identify-business-steps) | 10 minutes |
| 2 | [Design the Application](?lab=2-design-the-application) | 20 minutes |
| 3 | [Create Calculate Fees Workflow](?lab=3-calculate-fees-workflow) | 20 minutes |
| 4 | [Create Doctor Appointment Workflow](?lab=4-doc-appointment-workflow) | 20 minutes |
| 5 | [Add Human Tasks to the Workflow](?lab=5-add-human-tasks) | 20 minutes |
| 6 | [Add Calculate fees workflow Activities and Connections](?lab=6-calculate-fees-activities) | 45 minutes |
| 7 | [Add Doctor Appointment workflow Activities and Connections](?lab=7-doc-aapt-activities) | 45 minutes |
| 8 | [Create Workflow Pages](?lab=8-creating-pages) | 20 minutes |
| 9 | [Run the Application](?lab=9-running-the-app) | 20 minutes |
| 10 | [Activate the Workflow](?lab=10-activate-workflow) | 5 minutes |
| 11 | [Enhance Workflow Management](?lab=11-resume-workflow.md) | 5 minutes |

Total Estimated Time: 3 hours 50 minutes

### **Let's Get Started!**

If the menu is not displayed, you can open by clicking the menu button (![Menu icon](./images/menu-button.png)) at the upper-left corner of the page.

## Downloads: Download and Install the Complete Application

If you are stuck or the app is not working as expected, don't worry! You can download and install the completed app as follows:

1. [Click here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2Fapex-workflow-export.sql) to download the completed application.

2. Import the **labfiles_apex-workflow-export.sql** file into your workspace. To run the app, please run the steps described in the following lab:

3. Follow  Lab 2: Design the Application > Task 1: Create Application Users.

## Learn More - *Useful Links*

- [APEX Workflows](https://docs.oracle.com/en/database/oracle/apex/23.2/htmdb/managing-workflows-and-tasks.html#GUID-C2149600-4A1C-4CC5-A149-DB5C6963A599)
- [APEX Collateral](https://www.oracle.com/database/technologies/appdev/apex/collateral.html)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](http://apex.world)

## Acknowledgements

- **Author(s)** - Roopesh Thokala, Senior Product Manager & Ananya Chatterjee, Consulting Member of Technical Staff.
- **Contributing Author** - Pankaj Goyal, Member Technical Staff
- **Last Updated By/Date** - Pankaj Goyal, Member Technical Staff, December 2025
