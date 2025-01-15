# Introduction

## **What is APEX?**

Oracle APEX is a feature of Oracle Database, including the Autonomous Data Warehouse (ADW) and Autonomous Transaction Processing (ATP), Autonomous JSON Database (JSON), and APEX Application Development (APEX) services. Oracle APEX is a low-code development environment with various features and tools where you can create an application fast. In the future, rather than emailing spreadsheets around to gather information, you will know how to easily create an app in minutes using APEX and email the URL instead. The result will be a secure, scalable, multi-user app that provides a single source-of-truth for your data!

In this lab, you will create Installation Scripts and Data Packages to export Database objects along with Data. Then you will export the **DEMO PROJECTS** Application along with supporting objects and import it into another workspace.

In the second part of the lab, you will be using Remote Deployment to deploy your application from Development to UAT. The ORDS feature, **REST Enabled SQL** is not available for **apex.oracle.com** users. Therefore, you will not be able to perform this lab in the hosted instance apex.oracle.com. You should be using **APEX Service** or **APEX on Autonomous Database** options for this lab.

### Recap

In the last workshop, you learned to enable push notifications, add shortcuts to the PWA app, and include screenshots to be displayed while installing the PWA app. Also, you gain insights into Enabling Push Notifications and learn how to configure Push Notifications.

Estimated Time: 30 minutes

### Objectives

- Create a Working Copy of an Application.

- Create Installation Scripts.

- Create Data Packages.

- Export application with supporting Objects.

- Use Remote Deployment to deploy your Application.

### Downloads

Stuck or Missed out on completing the previous labs? Don't worry! You can download the application from the following:

- **[Sample Reporting](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FBuildingMobile-FriendlyApps-SampleReporting.sql)**

- **[Online Shopping Application](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FBuildingMobile-FriendlyApps-OnlineShoppingApplication.sql)**

- **[Demo Projects](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FBuildingMobile-FriendlyApps-DemoProjects.sql)**

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
