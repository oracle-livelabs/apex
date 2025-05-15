# Introduction

## About this Workshop

In today's data-driven world, the ability to extract valuable insights from visual content has become a game-changer for businesses across industries. Artificial Intelligence (AI) has made significant strides in the field of computer vision, enabling machines to understand and interpret visual data with remarkable accuracy.

In this workshop, you learn to enhance the Oracle APEX Social Media app with OCI Vision for the classification and text detection of images. By integrating OCI Vision with Oracle APEX, businesses can tap into the power of visual intelligence, transforming their data analysis capabilities and revolutionizing user experiences.

Estimated Time: 1 hour and 20 minutes

### Objectives

In this workshop, you:

- Create a REST Data Source in APEX based on the OCI Vision REST Endpoint.
- Invoke the OCI Vision REST Data Source for Image Classification and Text Detection using the Invoke API Page Process Type.
- Enhance the App to include the results from OCI Vision and make the images searchable.
- Make the app mobile ready by enabling PWA and other mobile friendly features.

<!---
- Enhance Social Media App with AI-Powered Search.
- Integrate APEX with OCI using API keys.
- Seamlessly link APEX with OCI Vision Service through REST Data Sources.
--->

### Prerequisites for Building this App

- A paid Oracle Cloud Infrastructure (OCI) account or a FREE Oracle Cloud account with $300 credits for 30 days to use on other services. Read more about it at: [oracle.com/cloud/free/](https://www.oracle.com/cloud/free/).

- An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments - The tenancy (root compartment) and ManagedCompartmentForPaaS (created by Oracle for Oracle Platform services).

- The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges via an OCI IAM Policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.

*Note: This workshop assumes you are using Oracle APEX 24.2. Some of the features might not be available in prior releases and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.*

## Downloads

If you are stuck or the App is not working as expected, you can download and install the completed App as follows:

1. Click [here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles/ai-powered-image-search-export.sql) to download the completed application file.

2. Import the **ai-powered-image-search-export.sql** file into your workspace. Follow the steps in the Install Application wizard to install the app along with the Supporting Objects.

3. Once the application is installed,
    - Follow Lab 1 > Task 1 to generate API keys using the OCI Console, and update the existing web credentials with your credentials.

    - Follow Lab 3 > Task 1 and Configure OCI Vision REST API as REST Data Source using your URL endpoint.

    - Follow Lab 3 > Task 2 and Task 3. Update the COMPARTMENT_ID parameter under the Image Classification and Text Detection child process with your Compartment ID from your OCI console.

4. All set. Now, run the application and see it in action!

## Learn More - *Useful Links*

- [OCI Generative AI](https://www.oracle.com/artificial-intelligence/generative-ai/large-language-models/)
- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX Collateral](https://www.oracle.com/database/technologies/appdev/apex/collateral.html)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](http://apex.world)

## Acknowledgments

- **Author** - Roopesh Thokala, Senior Product Manager; Ankita Beri, Product Manager
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, February 2025
