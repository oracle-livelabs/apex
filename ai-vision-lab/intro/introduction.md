# Introduction

## About this Workshop

In today's data-driven world, the ability to extract valuable insights from visual content has become a game-changer for businesses across industries. Artificial Intelligence (AI) has made significant strides in the field of computer vision, enabling machines to understand and interpret visual data with remarkable accuracy.

In this workshop, you learn to enhance the Oracle APEX Social Media app with OCI Vision for the classification and text detection of images. By integrating OCI Vision with Oracle APEX, businesses can tap into the power of visual intelligence, transforming their data analysis capabilities and revolutionizing user experiences.

Estimated Time: 1 hour and 20 minutes

### Objectives

In this workshop, you learn how to:

- Configure OCI API keys for Oracle APEX.
- Create Oracle APEX web credentials for OCI authentication.
- Import the Social Media application into an APEX workspace.
- Configure OCI Vision as a REST Data Source.
- Invoke OCI Vision for image classification and text detection.
- Add AI search to the Timeline page.
- Enhance the application with image upload, sharing, push notifications, shortcuts, and PWA screenshots.

### Prerequisites for Building This App

- A paid Oracle Cloud Infrastructure (OCI) account or an Oracle Cloud Free Tier account with $300 credits for 30 days to use on other services. Read more at [oracle.com/cloud/free/](https://www.oracle.com/cloud/free/).

- An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments - The tenancy (root compartment) and ManagedCompartmentForPaaS (created by Oracle for Oracle Platform services).

- The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges via an OCI IAM Policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.

*Note: This workshop assumes that you are using Oracle APEX 26.1. Some features might not be available in prior releases, and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.*

## Labs

| # | Lab | Est. Time |
| --- | --- | --- |
| 1 | Configure OCI API Keys | 10 minutes |
| 2 | Import and Edit the Social Media App | 15 minutes |
| 3 | Integrate OCI Vision with Oracle APEX | 20 minutes |
| 4 | Run the Application | 5 minutes |
| 5 | Enhance the App With Mobile Features | 30 minutes |

## Downloads

If the application is not working as expected, download and install the completed application as follows:

1. Download the [ai-powered-image-search-export.sql](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles/ai-powered-image-search-export.sql) file.

2. Import the **ai-powered-image-search-export.sql** file into your workspace. Follow the steps in the Install Application wizard to install the application with the supporting objects.

3. After the application is installed, complete the following tasks:
    - Follow Lab 1 > Task 1 to generate API keys using the OCI Console, and update the existing web credentials with your credentials.

    - Follow Lab 3 > Task 1 and configure OCI Vision REST API as a REST Data Source using your URL endpoint.

    - Follow Lab 3 > Task 2 and Task 3. Update the **COMPARTMENT_ID** parameter under the Image Classification and Text Detection child processes with your compartment OCID from the OCI Console.

4. Run the application.

## Learn More - *Useful Links*

- [OCI Vision](https://www.oracle.com/artificial-intelligence/vision/)
- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX Collateral](https://www.oracle.com/database/technologies/appdev/apex/collateral.html)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](https://apex.world)

## Acknowledgments

- **Author** - Roopesh Thokala, Principal Product Manager; Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, May 2026
