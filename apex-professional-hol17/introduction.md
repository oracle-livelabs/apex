# Introduction

## **What is APEX?**
Oracle APEX is a feature of Oracle Database, including the Autonomous Data Warehouse (ADW) and Autonomous Transaction Processing (ATP), Autonomous JSON Database (JSON), and APEX Application Development (APEX) services. Oracle APEX is a low-code development environment with various features and tools where you can create an application fast. In the future, rather than emailing spreadsheets to gather information, you will know how to easily create an app in minutes using APEX and email the URL instead. The result will be a secure, scalable, multi-user app that provides a single source-of-truth for your data!

In modern web applications, ensuring security is a critical requirement. Oracle APEX provides a robust framework for implementing authentication and authorization mechanisms to safeguard applications from unauthorized access. In this lab, you will learn to implement social sign-in options, specifically using Oracle Identity Access Management (IAM) and Google Authentication, to allow users to securely log in to the Online Shopping Application. Additionally, you will explore how to enable multiple authentication schemes for flexibility and convenience.

This hands-on lab demonstrates how to integrate these features step-by-step, ensuring a secure and user-friendly experience for application users.

### Recap

During the last workshop, you activated the Remote Database Schema. Moreover, you incorporated application data from a REST Data Source and successfully synchronized it with another application utilizing REST Data Sources. Furthermore, you gained expertise in crafting Data Load definitions and creating a Data Loading page.

Estimated Time: 20 minutes

### Objectives

In this lab, you will:

- Configure Oracle IAM authentication for an application.

- Implement Google Authentication for seamless social sign-in.

- Enable multiple authentication schemes within an Oracle APEX application.

### Downloads

Stuck or Missed out on completing the previous labs? Don't worry! You can download the application from the following:

- **[Sample Reporting](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FManagingApplicationData-SampleReporting.sql)**

- **[Online Shopping Application](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FManagingApplicationData-OnlineShoppingApplication.sql)**

- **[Demo Projects](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FManagingApplicationData-DemoProjects.sql)**

Import them into your workspace. To run the app, please run the steps described in the following workshops:

1. **[Get Started with Oracle APEX](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)**

2. **[Using SQL Workshop](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)**

> **Note:** This workshop assumes you are using Oracle APEX 24.2. Some of the features might not be available in prior releases and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.

## Learn More - *Useful Links*

- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX Collateral](https://www.oracle.com/database/technologies/appdev/apex/collateral.html)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](http://apex.world)
