# Introduction

## About this Workshop

In the digital transformation era, businesses constantly seek innovative solutions to enhance their processes and maximize efficiency. Oracle APEX and Oracle Cloud Infrastructure (OCI) Document Understanding have emerged as powerful tools to streamline data extraction and processing.

In this workshop, you learn to integrate Oracle APEX with OCI Document Understanding, highlighting  steps to incorporate these technologies seamlessly into your workflow.

Within this user-friendly app built with the Oracle APEX low-code platform, users effortlessly upload invoices by selecting the "Select an Invoice or Receipt" option. OCI Document Understanding then extracts form fields from the uploaded image or PDF file. With this functionality, users can streamline their expense management process with ease.

Once your document is processed, you will easily transition to a user-friendly page featuring the Cards Region, which displays critical information in an organized manner. Clicking on a card brings up a Pop-up Dialog page where you will find a clear comparison between your uploaded PDF and the output from OCI Document Understanding.

Estimated Time: 1 hour

### Objectives

In this workshop, you:

- Create an APEX application.

- Upload Invoice to OCI Object Storage using Invoke API.

- Invoke the OCI Document Understanding REST Data Source using the Invoke API page process type.

- Parse the response and display the result.

- Implement Invoice Approval Requests Using Approvals Component.

<!---
- Enhance Social Media App with AI-Powered Search.
- Integrate APEX with OCI using API keys.
- Seamlessly link APEX with OCI Vision Service through REST Data Sources.
--->

### Prerequisites for Building this App:

- A paid Oracle Cloud Infrastructure (OCI) account or a FREE Oracle Cloud account with $300 credits for 30 days to use on other services. Read more about it at: [oracle.com/cloud/free/](https://www.oracle.com/cloud/free/).

- An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments - The tenancy (root compartment) and ManagedCompartmentForPaaS (created by Oracle for Oracle Platform services).

- The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges via an OCI IAM Policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.

*Note: This workshop assumes you are using Oracle APEX 24.2. Some of the features might not be available in prior releases and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.*

## Downloads

If you are stuck or the app is not working as expected, you can download and install the completed App as follows:

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
- **Last Updated By/Date** - Ankita Beri, Product Manager, January 2025
