# Introduction

## About this Workshop

From precisely summarizing intricate data to crafting context-aware responses, Generative AI stands at the forefront of a technological shift, promising to redefine how we navigate and leverage knowledge in our day-to-day interactions. With the introduction of AI assisted development in Oracle APEX, enabling your applications with generative AI capabilities has never been easier.

In this workshop, you learn to bring Generative AI capabilities based on large language models (LLMs) to your applications built using Oracle APEX, your favourite low-code platform. The Generative AI service can be accessed through REST APIs, and by using the powerful REST Data Source capabilities of APEX, you can effortlessly incorporate this advanced technology into your applications with a low-code approach.

<!-- ## What is OCI Generative AI service?

[Oracle Cloud Infrastructure Generative AI](https://www.oracle.com/artificial-intelligence/generative-ai/large-language-models/) is a fully managed service that provides a set of state-of-the-art, customizable large language models (LLMs) that cover a wide range of use cases for text generation. Generative AI currently supports the following pre-trained foundational models available from Meta and Cohere:

- Llama 2
- Command
- Summarize
- Embed

You can read more about these models from the [documentation](https://docs.oracle.com/en-us/iaas/Content/generative-ai/pretrained-models.htm). -->

This workshop will guide you through the process of utilizing the generation models within the Generative AI Service to develop a "Ask Questions" feature for the New York High Schools APEX application. This functionality empowers parents to inquire about school facilities, policies, and more, aiding them to make an informed decision about whether a specific school is the ideal fit for their child.

Estimated Time: 60 minutes

### **Objectives**

* Implement Faceted Search for Cards and Map Regions to filter and search for the best school.
* Build a conversational chatbot using Generative AI to ask questions about a school.
* Generate Email using Generative AI to apply to a school.

*Note: This workshop assumes you are using Oracle APEX 24.2.*

## Prerequisites

- An APEX workspace.

- API key for the AI Provider of your choice. (OCI Gen AI, Open AI, Cohere)

- If you choose OCI Gen AI as your AI provider, the prerequisites are as follows:
    - A paid Oracle Cloud Infrastructure (OCI) account or a FREE Oracle Cloud account with $300 credits for 30 days to use on other services. Read more about it at: [oracle.com/cloud/free/](https://www.oracle.com/cloud/free/). The OCI account must be created in or subscribed to one of the regions that supports OCI Generative AI Service. Currently, OCI Generative AI Service is supported in the following regions:

        - US Midwest (Chicago)
        - Germany Central (Frankfurt)
        - UK South (London)
        - Brazil East (Sao Paulo)
        - Japan Central (Osaka)

    - OCI Generative AI service is available in limited regions. To see if your cloud region supports OCI Generative AI service, visit the [documentation](https://docs.oracle.com/en-us/iaas/Content/generative-ai/overview.htm#regions).

    - An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments - The tenancy (root compartment) and ManagedCompartmentForPaaS (created by Oracle for Oracle Platform services).

    - The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges via an OCI IAM Policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.


*Note*: 
- This workshop assumes you are using Oracle APEX 24.2. Some of the features might not be available in prior releases and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.
- The application ID in the screenshots may vary. Please ignore the application ID.

## Labs

| Module | Est. Time |
| --- | --- |
| [Creating an APEX application](?lab=1-create-app) | 5 minutes |
| [Visualize Schools on a Map](?lab=2-schools-on-map) | 10 minutes |
| [Configure the OCI API Keys](?lab=3-configure-oci) | 10 minutes |
| [Build a Conversational Inquiry using Generative AI](?lab=4-using-genai) | 20 minutes |
| [Generate Email to Apply to a School](?lab=5-apply-to-school) | 15 minutes |
| [Run the Application](?lab=7-run-app) | 5 minutes |

Total estimated time: 60 minutes

### **Let's Get Started!**

If the menu is not displayed, you can open by clicking the menu button (![Menu icon](./images/menu-button.png)) at the upper-left corner of the page.

## Downloads

If you are stuck or the app is not working as expected, you can download and install one of the the completed app as follows:

- [Click here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2Fnyc-gen-ai-app.zip) to download the completed application zip file until Lab 6. Note: This application export does not include the vector search covered in **Optional Lab 7**. To run the app, follow the steps described in the [Appendix Lab: Download Instructions](?lab=8-appendix) from Task 1 and Task 2.

- [Click here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2Fnyc-gen-ai-vector-search.zip) to download the completed application zip file until Lab 7. Note: This application export includes the vector search covered in **Optional Lab 7**. To run this app, follow the steps described in the [Appendix Lab: Download Instructions](?lab=8-appendix) from Task 1 till Task 3. Note: This app requires Oracle Database 23ai and Oracle APEX 24.2.


## Learn More - *Useful Links*

- [OCI Generative AI](https://www.oracle.com/artificial-intelligence/generative-ai/large-language-models/)
- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX Collateral](https://www.oracle.com/database/technologies/appdev/apex/collateral.html)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](http://apex.world)

## Acknowledgements

 - **Authors** - Toufiq Mohammed, Senior Product Manager; Apoorva Srinivas, Senior Product Manager
 - **Last Updated By/Date** - Apoorva Srinivas, Senior Product Manager, July 2024
