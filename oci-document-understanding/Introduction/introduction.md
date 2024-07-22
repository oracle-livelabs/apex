# Introduction

## About this Workshop

In the digital transformation era, businesses constantly seek innovative solutions to enhance their processes and maximize efficiency. Oracle APEX and Oracle Cloud Infrastructure (OCI) Document Understanding have emerged as powerful tools to streamline data extraction and processing.

In this workshop, you learn to integrate Oracle APEX with OCI Document Understanding, highlighting  steps to incorporate these technologies seamlessly into your workflow.

Within this user-friendly app built with the Oracle APEX low-code platform, users effortlessly upload invoices by selecting the "Select an Invoice or Receipt" option. OCI Document Understanding then extracts form fields from the uploaded image or PDF file. With this functionality, users can streamline their expense management process with ease.

Once your document is processed, you will easily transition to a user-friendly page featuring the Cards Region, which displays critical information in an organized manner. Clicking on a card brings up a Pop-up Dialog page where you will find a clear comparison between your uploaded PDF and the output from OCI Document Understanding.

Estimated Time: 1 hour

### Objectives

In this workshop, you:

- Add API Keys in OCI Console
- Create Web Credentials in Oracle APEX
- Create REST Data Source in your APEX App based on OCI Document Understanding REST APIs
- Upload Invoice to OCI Object Storage using Invoke API
- Configure the Automatic Row Processing to Insert a New Record into the Table
- Invoke the REST Data Source through a page process
- Parse the response and store the information in the database
- Develop an Invoice Tracking and Invoice Analysis page
- Implement Invoice Approval Requests Using Approvals Component

<!---
- Enhance Social Media App with AI-Powered Search.
- Integrate APEX with OCI using API keys.
- Seamlessly link APEX with OCI Vision Service through REST Data Sources.
--->

### Prerequisites for Building this App:

- A paid Oracle Cloud Infrastructure (OCI) account or a FREE Oracle Cloud account with $300 credits for 30 days to use on other services. Read more about it at: [oracle.com/cloud/free/](https://www.oracle.com/cloud/free/).

- An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments - The tenancy (root compartment) and ManagedCompartmentForPaaS (created by Oracle for Oracle Platform services).

- The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges via an OCI IAM Policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.


*Note: This workshop assumes you are using Oracle APEX 24.1. Some of the features might not be available in prior releases and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.*

### Downloads

[Click here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/oic-library%2Foci-doc-understanding.sql) to download the completed application. **Note** : Once you've imported the application, remember to generate web credentials and input your own OCI account information when utilizing the OCI Document Understanding.

## Acknowledgments

- **Author** - Roopesh Thokala, Senior Product Manager ; Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, June 2024
