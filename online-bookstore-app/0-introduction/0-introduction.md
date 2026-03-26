# Introduction

## About this Workshop

Welcome to LiveLab: Online Bookstore Application, an immersive, hands-on lab series designed to help you build a feature-rich, AI-powered online bookstore using Oracle APEX. Through 18 structured labs, you will gain practical experience in developing a modern e-commerce platform — covering everything from app creation and UI customization to AI-driven search, payment integration, and advanced user engagement features. Whether you are a beginner or an experienced developer, this LiveLab will guide you step by step in crafting a dynamic and intelligent online bookstore.

Estimated Time: 4 hours 40 minutes

### Objectives

In this workshop, you will:

- Develop an APEX Application.
- Load Data using Data Workshop.
- Integrate REST Data Sources.
- Customize the application theme and UI.
- Configure Authentication & Security.
- Implement e-commerce features including Cart, Wishlist, Orders, Profile, and My Books, etc.
- Add API Keys in the OCI Console.
- Create Web Credentials in Oracle APEX.
- Leverage AI capabilities such as RAG, OCI Vision, and the AI Assistant.
- Implement User Authentication Features (Login/Signup with Google, Forgot Password, Signup Here).
- Set Up Push Notifications to alert users when books in their wishlist become available.
- Integrate Razorpay to support demo payment transactions within the application.
- Create and use email templates for sending emails in the application.
- Create Vector Providers, Search Configurations and Oracle Vector Search Page.

*Note: This workshop assumes you are using Oracle APEX 24.2.*

## Prerequisites

- An APEX workspace.

- We need to use an OCI API key for Lab 14. For this, a paid Oracle Cloud Infrastructure (OCI) account or a FREE Oracle Cloud account with $300 in credits (valid for 30 days) is required. These credits can be used for other services. Read more about it at: [oracle.com/cloud/free/](https://www.oracle.com/cloud/free/).

- We need to use an API key for the AI Provider of your choice (OCI Generative AI, Open AI, Cohere) for Labs 8, and 17.

- In this LiveLab, OCI Generative AI is the chosen AI provider. The prerequisites are as follows:

    - The OCI account must be created in or subscribed to a region that supports the OCI Generative AI Service. Currently, the OCI Generative AI Service is available in the following regions:

        - Brazil East (Sao Paulo)
        - Germany Central (Frankfurt)
        - India South (Hyderabad)
        - Japan Central (Osaka)
        - UAE East (Dubai)
        - UK South (London)
        - US Midwest (Chicago)

    - OCI Generative AI service is available in limited regions. To see if your cloud region supports OCI Generative AI service, visit the [documentation](https://docs.oracle.com/en-us/iaas/Content/generative-ai/overview.htm#regions).

    - An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments - The tenancy (root compartment) and ManagedCompartmentForPaaS (created by Oracle for Oracle Platform services).

    - The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges via an OCI IAM Policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.

>*Note: This workshop assumes you are using Oracle APEX 24.2.*

- *Some of the features might not be available in prior releases and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.*

- *Lab 18 requires Oracle Database 23ai.*

- *The screenshots in this workshop are taken using Dark Mode in APEX 24.2*

- *The application icon in the screenshots may vary. Please ignore the application icon.*

## Labs

| Lab |  Module | Est. Time |
| --- | --- | --- |
| 1 | [Create an APEX application](?lab=create-app) | 4 minutes |
| 2 | [Load Data Using Data Workshop](?lab=2-load-data-using-data-workshop) | 5 minutes |
| 3 | [Enhance the Home Page](?lab=enhance-home-page) | 15 minutes |
| 4 | [Customize Application Theme](?lab=application-theme) | 1 minute |
| 5 | [Create Custom Authentication](?lab=authentication) | 5 minutes |
| 6 | [Set Up Add to Cart Functionality](?lab=add-to-cart) | 15 minutes |
| 7 | [Create and Manage a Shopping Cart](?lab=7-create-shop-cart) | 30 minutes |
| 8 | [Build an AI-Assistant Chat Widget](?lab=8-build-an-ai-assistant-chat-widget) | 15 minutes |
| 9 | [Create and Manage Wishlist Functionality](?lab=9-wishlist) | 15 minutes |
| 10 | [Create and Manage User Profile Pages](?lab=10-add-user) | 30 minutes |
| 11 | [Create and Manage Administration](?lab=11-admin-page) | 30 minutes |
| 12 | [Improve User Onboarding](?lab=12-onboarding) | 35 minutes |
| 13 | [Configure Push Notification](?lab=13-push-notification) | 5 minutes |
| 14 | [Integrate AI Vision to Enhance Book Search](?lab=14-ai-vision) | 10 minutes |
| 15 | [Integrate Razorpay Payment Gateway](?lab=15-razorpay-payement-integration) | 20 minutes |
| 16 | [Enhance the UI](?lab=16-additional-ui-enhancements) | 30 minutes |
| 17 | [Enhance AI-Assistant Chat Widget](?lab=17-enhance-ai-assistant) | 5 minutes |
| 18 | [Implement Vector Search using Search Configurations](?lab=18-vector-search-configurations) | 10 minutes |

Total Estimated Time: 4 hours 40 minutes

### **Let's Get Started!**

If the menu is not displayed, you can open by clicking the menu button (![Menu icon](./images/menu-button.png)) at the upper-left corner of the page.

## Downloads: Download and Install the Complete Application

If you are stuck or the app is not working as expected, don't worry! You can download and install one of the the completed app as follows:

- **OPTION 1:** Click [here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/obs-lab17.zip) to download the complete application zip file, which contains everything completed in all the labs except the **Optional Lab 18**. To run the app, follow the steps described in the [Lab Appendix: Download Instructions](?lab=download-instructions) from Task 1 to Task 10.

- **OPTION 2:** Click [here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/obs-lab18.zip) to download the complete application zip file, which contains everything completed in all the labs, including the **Optional Lab 18**. This app requires Oracle Database 23ai for Lab 18. To run the app, follow the steps described in the [Lab Appendix: Download Instructions](?lab=download-instructions) from Task 1 to Task 11.

## Learn More - *Useful Links*

- [OCI Generative AI](https://www.oracle.com/artificial-intelligence/generative-ai/large-language-models/)
- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX Collateral](https://www.oracle.com/database/technologies/appdev/apex/collateral.html)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](http://apex.world)

## Acknowledgements

- **Author**: Pankaj Goyal, Member Technical Staff; Ankita Beri, Product Manager
- **Last Updated By/Date**: Pankaj Goyal, Member Technical Staff, November 2025