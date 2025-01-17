# Introduction

## **What is APEX?**

Oracle APEX is a feature of Oracle Database, including the Autonomous Data Warehouse (ADW) and Autonomous Transaction Processing (ATP), Autonomous JSON Database (JSON) and APEX Application Development (APEX) services. Oracle APEX is a low-code development environment with various features and tools where you can create an application fast. In the future, rather than emailing spreadsheets to gather information, you will know how to easily create an app in minutes using APEX and email the URL instead. The result will be a secure, scalable, multi-user app that provides a single source-of-truth for your data!

### Recap

In the last hands-on lab, you practiced creating validations on the Page Items and adding Page processes with types like Invoke API, Clear and a branch to a page.

Estimated Time: 20 minutes

### Objectives

In this lab, you will:

- Create Dynamic Actions to manage the shopping cart.

- Update the badge and icon shown in the navigation bar after the customer has added/edited/removed a product from the shopping cart.

- Refresh the shopping cart region.

- Review the product details.

- Review the items added to the shopping cart.

- Add, edit, or remove the product from the shopping cart.

### Downloads

Stuck or Missed out on completing the previous labs? Don't worry! You can download the application from the following:

- **[Sample Reporting](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FEnhancing-your-application-usingComputationsProcessesValidations-SampleReporting.sql)**

- **[Online Shopping Application](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FEnhancing-your-application-using-ComputationsProcessesValidations-Online ShoppingApplication.sql)**

- **[Demo Projects](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FEnhancing-your-application-using-ComputationsProcessesValidations-DemoProjects.sql)**

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
