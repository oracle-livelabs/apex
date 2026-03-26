# Introduction

## About this Workshop

In the digital transformation era, businesses consistently seek innovative solutions to enhance their processes and maximize efficiency. Oracle APEX and Oracle Cloud Infrastructure (OCI) Document Understanding have emerged as powerful tools that streamline data extraction and document processing.

In this workshop, you will learn how to integrate Oracle APEX with OCI Document Understanding, walking through the essential steps required to incorporate these technologies seamlessly into an intelligent workflow.

Using a user-friendly application built with the Oracle APEX low-code platform, participants will upload invoices by simply selecting the “Select an Invoice or Receipt” option. OCI Document Understanding then automatically extracts key form fields from the uploaded image or PDF. This capability greatly simplifies and accelerates the expense management process.

Once a document is processed, the application transitions to a page that presents the extracted information using the Cards Region, offering a clean and organized view. Clicking on any card opens a Pop-up Dialog where users can visually compare the original PDF with the extracted data from OCI Document Understanding—making review and validation intuitive and efficient.

Estimated Time: 1 hour 2 minutes

### Objectives

In this workshop, you will:

- Create an APEX application.

- Add API Keys in the OCI Console.

- Create a Bucket in OCI Object Storage.

- Create Web Credentials in Oracle APEX.

- Upload Invoices to OCI Object Storage using the Invoke API.

- Invoke OCI Document Understanding using REST Data Source.

- Parse the response and display the extracted results using Interactive Report.

- Implement Invoice Approval Requests Using Approvals Component.

*Note: This workshop assumes you are using Oracle APEX 24.2.*

## Prerequisites

- An APEX workspace.

- A paid Oracle Cloud Infrastructure (OCI) account or a FREE Oracle Cloud account with $300 credits for 30 days to use on other services. Read more about it at: [oracle.com/cloud/free/](https://www.oracle.com/cloud/free/). The OCI account must be created in or subscribed to one of the regions that supports OCI Generative AI Service. Currently, OCI Generative AI Service is supported in the following regions:

    - Brazil East (Sao Paulo)
    - Germany Central (Frankfurt)
    - India South (Hyderabad)
    - Japan Central (Osaka)
    - UAE East (Dubai)
    - UK South (London)
    - US Midwest (Chicago)

- OCI Generative AI service is available in limited regions. To see if your cloud region supports OCI Generative AI service, visit the [documentation](https://docs.oracle.com/en-us/iaas/Content/generative-ai/overview.htm#regions).

- An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments - The tenancy (root compartment) and ManagedCompartmentForPaaS (created by Oracle for Oracle Platform services).

- The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges via an OCI IAM Policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.

>*Note: This workshop assumes you are using Oracle APEX 24.2.*

- *Some of the features might not be available in prior releases and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.*

- *The screenshots in this workshop are taken using Dark Mode in APEX 24.2*

- *The application ID and application icon in the screenshots may vary. Please ignore the application ID and icon.*

## Labs

| Lab |  Module | Est. Time |
| --- | --- | --- |
| 1 | [Configure OCI API Keys and a Bucket](?lab=1-configure-oci-keys) | 10 minutes |
| 2 | [Setup Tasks for Application Development](?lab=2-install-scripts) | 10 minutes |
| 3 | [Integrate OCI Document Understanding with Oracle APEX](?lab=3-create-application) | 10 minutes |
| 4 | [Develop an Invoice Tracker and Invoice Analysis Page](?lab=4-additional-pages) | 15 minutes |
| 5 | [Implement Invoice Approval Requests Using Approvals Component](?lab=5-approval-comp) | 15 minutes |
| 6 | [Run the Application](?lab=6-run-app) | 2 minutes |

Total Estimated Time: 1 hour 2 minutes

### **Let's Get Started!**

If the menu is not displayed, you can open by clicking the menu button (![Menu icon](./images/menu-button.png)) at the upper-left corner of the page.

## Downloads: Download and Install the Complete Application

If you are stuck or the app is not working as expected, don't worry! You can download and install the completed app as follows:

1. [Click here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles/automate-invoice-handling-export.sql) to download the completed application.

2. Import the **automate-invoice-handling-export.sql** file into your workspace. Follow the steps in the Install Application wizard to install the app along with the Supporting Objects.

3. Once the application is installed,
    - Follow Lab 1 > Task 1 to generate API keys using the OCI Console, and update the existing web credentials with your credentials.

    - Follow Lab 1 > Task 2 to create a bucket in OCI Object Storage.

    - Follow Lab 2 > Task 2 to add multiple users.

    - Follow Lab 3 > Task 3 > Step 8 and update the following page item static values one after the other:
        - P1\_COMPARTMENT\_ID
        - P1\_NAMESPACE\_NAME
        - P1\_BUCKET\_NAME
        - P1\_REGION

4. All set. Now, run the application with the users you created and see it in action!

## Learn More - *Useful Links*

- [OCI Generative AI](https://www.oracle.com/artificial-intelligence/generative-ai/large-language-models/)
- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX Collateral](https://www.oracle.com/database/technologies/appdev/apex/collateral.html)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](http://apex.world)

## Acknowledgments

- **Author** - Roopesh Thokala, Senior Product Manager; Ankita Beri, Product Manager
- **Contributing Author** - Pankaj Goyal, Member Technical Staff
- **Last Updated By/Date** - Pankaj Goyal, Member Technical Staff, December 2025
