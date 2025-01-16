# Introduction

## **What is APEX?**

Oracle APEX is a feature of Oracle Database, including the Autonomous Data Warehouse (ADW) and Autonomous Transaction Processing (ATP), Autonomous JSON Database (JSON) and APEX Application Development (APEX) services. Oracle APEX is a low-code development environment with various features and tools where you can create an application fast. In the future, rather than emailing spreadsheets to gather information, you will know how to easily create an app in minutes using APEX and email the URL instead. The result will be a secure, scalable, multi-user app that provides a single source-of-truth for your data!

In modern applications, the ability to configure intuitive navigation and implement effective search functionalities is crucial for enhancing the user experience. Oracle APEX provides developers with the flexibility to create search configurations that enable dynamic data retrieval and to customize navigation settings to streamline user interactions.

This combined lab will walk you through the process of creating search configurations for two specific tables: CUSTOMER\_ORDER\_PRODUCTS and PRODUCT\_REVIEWS, and developing a search page using the Create Page wizard. Additionally, you will learn how to enhance the navigation by making certain pages publicly accessible, removing redundant navigation menus, and adding important links to the navigation bar for both customers and administrators. By the end of this lab, you will be able to build a fully functional search page and configure navigation settings for improved usability.

### Recap

In the last hands-on workshop, you practiced how to create and customize a form and link it to the report.

Estimated Time: 20 minutes

### Objectives

- Implement search configurations based on two different tables: CUSTOMER\_ORDER\_PRODUCTS and PRODUCT\_REVIEWS.

- Create a search page using the Create Page Wizard.

- Set specific pages as public pages for easy access.

- Disable the default navigation menu to streamline the user experience.

- Enhance the navigation bar to include important links, such as direct access to the shopping cart and the administration page.

### Downloads

Stuck or Missed out on completing the previous labs? Don't worry! You can download the application from the following:

- **[Sample Reporting](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FCreatingUsingForms-SampleReporting.sql)**

- **[Online Shopping Application](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FCreatingUsingForms-OnlineShoppingApplication.sql)**

- **[Demo Projects](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FCreatingUsingForms-DemoProjects.sql)**

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
