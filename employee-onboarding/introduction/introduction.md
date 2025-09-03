# Introduction

## About this Workshop

Manual processes in employee onboarding like tracking approvals, assigning tasks, and following up with departments, can quickly become inconsistent and error prone. With Oracle APEX Workflows, you can bring structure, automation, and visibility to these processes, all within your APEX applications.

Workflows in Oracle APEX enable you to model business processes using a visual editor, define roles and actions, and manage task execution declaratively. These workflows are database driven, integrated into the APEX runtime, and require little to no custom code, making them ideal for business critical flows like onboarding, approvals, procurement, or service requests.

In this hands on workshop, you will build an Employee Onboarding application that uses APEX Workflows to automate and streamline onboarding processes resulting in improved efficiency, reduced manual coordination, and a better new hire experience.

Estimated Workshop Time: 2 hours and 20 minutes.

### Objectives

In this workshop, you will learn how to:

- Build a multi step onboarding process using the Oracle APEX

- Define workflow participants and implement role based task routing.

- Build APEX pages to initiate workflows and complete tasks.

- Automate notifications for onboarding steps.

- Monitor and report on onboarding progress using workflow views.

- Archive Tasks and Workflows.

### Prerequisites for Building this App

- An APEX Workspace.

>*Note: This workshop assumes you are using Oracle APEX 24.2. Some of the features might not be available in prior releases and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.*

## Labs

| Lab |  Module | Est. Time |
| --- | --- | --- |
| 1 | [Identify Business Steps](?lab=1-identify-business-steps) | 5 minutes |
| 2 | [Load Database Objects & Create App Users](?lab=2-data-load) | 10 minutes |
| 3 | [Create an Application and Admin pages](?lab=3-create-app) | 15 minutes |
| 4 | [Create Tasks Definitions](?lab=4-create-tasks) | 10 minutes |
| 5 | [Create Employment Type Workflow](?lab=5-create-emp-type-wf) | 15 minutes |
| 6 | [Create Employee Onboarding Workflow](?lab=6-create-empon-wf) | 15 minutes |
| 7 | [Create Workflow pages](?lab=7-create-workflow-pages) | 40 minutes |
| 8 | [Create Archive Tasks and Archive Workflow](?lab=8-archived-tasks) | 5 minutes |
| 9 | [Improve UI & Navigation](?lab=9-improve-ui) | 10 minutes |
| 10 | [Run the Application](?lab=10-running-the-app) | 10 minutes |
| 11 | [Activate Workflow](?lab=11-activate-workflow) | 5 minutes |

## Downloads

If you are stuck or the App is not working as expected, you can download and install the completed App as follows:

1. Click [here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FEmployee_Onboarding_App.sql) to download the completed application file.

2. Import the **labfiles\_Employee\_Onboarding\_App.sql** file into your workspace. Follow the steps in the Install Application wizard to install the app along with the Supporting Objects.

3. Once the application is installed,
    - Follow Lab 2 > Task 1: Create Application Users.

4. All set. Now follow Lab 10 to run the application and see it in action!

*Note: This app export includes sample data for Employees, Departments, and Training Catalog. You can skip Lab 10 > Tasks 1, 6 and 7 since the data is already populated.*

## Learn More - *Useful Links*

- [OCI Generative AI](https://www.oracle.com/artificial-intelligence/generative-ai/large-language-models/)
- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX Collateral](https://www.oracle.com/database/technologies/appdev/apex/collateral.html)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](http://apex.world)

## Acknowledgements

- **Author** - Sahaana Manavalan, Senior Product Manager; Roopesh Thokala, Senior Product Manager, August 2025
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, August 2025
