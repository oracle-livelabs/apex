# Introduction

This workshop provides a comprehensive guide on how to set up an Autonomous Transaction Processing Database, create an APEX application, and leverage Object Storage APIs in Oracle Cloud. In the labs, you will learn how to develop a web application that enables users to upload a sample project file to Object Storage and initiate a task for the project lead to complete. Additionally, you will walkthrough how to enable the project lead to download and review the project file and subsequently take action on their assigned task.

Estimated Workshop Time: 75 minutes

*Note: This lab assumes you are using Oracle APEX 23.1.*

[Full lab walkthrough](videohub:1_77gs65t8)

## About Oracle APEX

Oracle APEX is a low-code development platform that enables you to build scalable, secure enterprise apps, with world-class features, that can be deployed anywhere.

Using APEX, developers can quickly develop and deploy compelling apps that solve real problems and provide immediate value. You won't need to be an expert in a vast array of technologies to deliver sophisticated solutions. Focus on solving the problem and let APEX take care of the rest.

### Objectives

In this lab, you will:

- Build a web application
- Create application task & workflow
- Upload/Download from Object Storage

### Labs

| #   | Module                                               | Est. Time |
| --- | ---------------------------------------------------- | --------- |
| -   | [Get Started](?lab=cloud-login)                      | 5 min     |
| 1   | [Create autonomous database](?lab=create-autonomous) | 15 min    |
| 2   | [Create application](?lab=create-application)        | 10 min    |
| 3   | [Create REST data source](?lab=create-rest-source)   | 10 min    |
| 4   | [Create form](?lab=create-form)                      | 5 min     |
| 5   | [Upload file](?lab=upload-file)                      | 10 min    |
| 6   | [Task details](?lab=task-details)                    | 10 min    |
| 7   | [Download file](?lab=download-file)                  | 5 min     |
| 8   | [Clean up](?lab=clean-up)                            | 5 min     |

### **Let's Get Started!**

- [Click here](?lab=1-sign-up-apex) or select **Getting Started** from the menu on the left to start the workshop and set up an Oracle APEX workspace.
If the menu is not displayed, you can open by clicking the menu button (![Menu icon](./images/menu-button.png)) at the top of the page.

### **Sample Files**

- This workshop requires the use of files for testing the upload/download process (any file type will work). You can either use your own files or download a zip folder with a couple [sample files here.](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles/Sample-FIles.zip)

## Learn More

- [Oracle APEX](https://apex.oracle.com/en/)
- [OCI Training](https://cloud.oracle.com/en_US/iaas/training)
- [Familiarity with OCI console](https://docs.us-phoenix-1.oraclecloud.com/Content/GSG/Concepts/console.htm)
- [Familiarity with Compartments](https://docs.us-phoenix-1.oraclecloud.com/Content/GSG/Concepts/concepts.htm)

## Acknowledgements

- **Author** - Shayne Jayawardene, Staff Cloud Engineer
- **Contributors** - Mark Smith, Cloud Engineering
- **Last Updated By/Date** - Shayne Jayawardene, May 2023
