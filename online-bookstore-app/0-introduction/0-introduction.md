# Introduction

## About this Workshop

Welcome to LiveLab: Online Bookstore Application, an immersive, hands-on lab series designed to equip you with the skills to build a feature-rich, AI-powered online bookstore using Oracle APEX. Through 18 structured labs, you'll gain practical experience in developing a modern e-commerce platform—covering everything from app creation and UI customization to AI-driven search, payment integration, and advanced user engagement features. Whether you're a beginner or an experienced developer, this LiveLab will guide you step by step in crafting a dynamic and intelligent online bookstore.

Estimated Time: 4 hours 40 minutes

### Objectives

In this workshop, you will:

- Develop an APEX Application
- Load Data using Data Workshop
- Integrate REST Data Sources
- Customize Themes and UI
- Configure Authentication & Security
- Implement E-commerce Features (Cart, Wishlist, Orders, Profile, My Books etc)
- Leverage AI Capabilities (RAG, AI Vision, AI Assistant)
- Implement User Authentication Features (Login/Signup with Google, Forgot Password, Signup Here)
- Set Up Push Notifications
- Integrate Payment Processing with Razorpay
- Design and Manage Email Templates
- Create Vector Providers, Search Configurations and Oracle Vector Search Page

### Prerequisites for Building this App:

- A paid Oracle Cloud Infrastructure (OCI) account or a FREE Oracle Cloud account with $300 credits for 30 days to use on other services. Read more about it at: [oracle.com/cloud/free/](https://www.oracle.com/cloud/free/).

- An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments - The tenancy (root compartment) and ManagedCompartmentForPaaS (created by Oracle for Oracle Platform services).

- The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges via an OCI IAM Policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.

*Note: This workshop assumes you are using Oracle APEX 24.2. Some of the features might not be available in prior releases and the instructions, flow, and screenshots might differ if you use an older version of Oracle APEX.*

## Labs

| Lab |  Module | Est. Time |
| --- | --- | --- |
| 1 | [Create the application](?lab=create-app) | 4 minutes |
| 2 | [Load Data Using Data Workshop](?lab=2-load-data-using-data-workshop) | 5 minutes |
| 3 | [Enhance the Home Page](?lab=enhance-home-page) | 15 minutes |
| 4 | [Customize Application Theme](?lab=application-theme) | 1 minute |
| 5 | [Custom Authentication](?lab=authentication) | 5 minutes |
| 6 | [Set Up Add to Cart Functionality](?lab=add-to-cart) | 15 minutes |
| 7 | [Create and Manage a Shopping Cart](?lab=7-create-shop-cart) | 30 minutes |
| 8 | [Build an AI-Assistant Chat Widget](?lab=8-build-an-ai-assistant-chat-widget) | 15 minutes |
| 9 | [Create and Manage Wishlist Functionality](?lab=9-wishlist) | 15 minutes |
| 10 | [Create and Manage User Profile Pages](?lab=10-add-user) | 30 minutes |
| 11 | [Create and Manage Administration](?lab=11-admin-page) | 30 minutes |
| 12 | [Improve User Onboarding](?lab=12-onboarding) | 35 minutes |
| 13 | [Push Notification](?lab=13-push-notification) | 5 minutes |
| 14 | [AI Vision](?lab=14-ai-vision) | 10 minutes |
| 15 | [Razorpay Payment Integration](?lab=15-razorpay-payement-integration) | 20 minutes |
| 16 | [UI Enhancements](?lab=16-additional-ui-enhancements) | 30 minutes |
| 17 | [Enhance AI-Assistant Chat Widget](?lab=17-enhance-ai-assistant) | 5 minutes |
| 18 | [Create Search Configurations with Oracle Vector Search](?lab=18-vector-search-configurations) | 10 minutes |

Total estimated time: 4 hours 40 minutes

### **Let's Get Started!**

If the menu is not displayed, you can open by clicking the menu button (![Menu icon](./images/menu-button.png)) at the upper-left corner of the page.

## Downloads: Download and Install the Complete Application

If you are stuck or the app is not working as expected, you can download and install the completed app as follows:

1. Click [here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/apex%2Fobs-lab17.zip) to download the completed application zip file.

2. Import the **downloaded zip** file into your workspace. To import the app, go to **App Builder > Import**.

3. Follow the steps in the Install Application wizard to install the app along with the Supporting Objects.

4. Update the hashed password for user01:

    - Go to **SQL Workshop > Object Browser > Tables > OBS\_USERS > Data**.

    - Click the **edit icon** for user01 and update the password to **secretPassword**.

5. Update the Web Credential and Generative AI:

    - To create an OCI API Key, Refer to [Task 1: Generate API Keys using OCI Console](?lab=8-build-an-ai-assistant-chat-widget#Task1:GenerateAPIKeysusingOCIConsole) of [Lab 8: Build an AI-Assistant Chat Widget](?lab=8-build-an-ai-assistant-chat-widget)

    - Edit the apex\_ai\_cred details to match with your OCI API Key,  Refer to [Task 2: Create Web Credentials](?lab=8-build-an-ai-assistant-chat-widget#Task2:CreateWebCredentials) of [Lab 8: Build an AI-Assistant Chat Widget](?lab=8-build-an-ai-assistant-chat-widget)

    - To edit the generative ai, Refer to [Task 3: Configure Generative AI Service](?lab=8-build-an-ai-assistant-chat-widget#Task3:ConfigureGenerativeAIService) of [Lab 8: Build an AI-Assistant Chat Widget](?lab=8-build-an-ai-assistant-chat-widget)

6. Update the Picture URL:

    - Go to **SQL Workshop > RESTful Services > Modules > User Images > profile_pic/:id > GET** and copy Full URL.

    - Go to **App Builder > Online Bookstore > Shared Components > Application Computations > PICTURE\_URL > Computation >**, and replace **<****picture\_url****>** with the copied FULL URL up to ..profile_pic/.

7. Update the Google Auth Credential:

    - To create an Google API Key, Refer to [Task 5: Login with Google](?lab=12-onboarding#Task5:LoginwithGoogle) of [Lab 12: Improve User Onboarding](?lab=12-onboarding), following steps 1 to 10.

    - Edit the Google Authentication details to match with your Google API Key, Refer to [Task 5: Login with Google](?lab=12-onboarding#Task5:LoginwithGoogle) of [Lab 12: Improve User Onboarding](?lab=12-onboarding), following steps 12 to 16.

8. Generate Push Notification Credentials and enable Push Notifications on the device:

    - To generate Push Notification Credentials, go to **App Builder > Online Bookstore > Shared Components > Progressive Web App > Push Notifications**, click **+ Generate Credentials** for Credentials.

    - To enable push notifications, run the application and click on your username in the top-right corner. Then, select **Settings**. By default, push notifications are disabled. Click Off and check the box labeled **Enable push notifications on this device**.

9. Setup Compartment ID to run the Automation for AI Vision Service:

    - Go to **App Builder > Online Bookstore > Shared Components > Automations > Index Book Cover With OCI Vision > Actions**, click the **edit icon** for **Invoke REST Data Source** and replace **#COMPARTMENT\_ID#** with your **COMPARTMENT\_ID** at two places in the query.

10. Update the Razorpay Auth Credential:

    - To create an Razorpay API Key, Refer to [Task 1: Create Web Credential](?lab=15-razorpay-payement-integration#Task1:CreateWebCredential) of [Lab 15: Razorpay Payment Gateway Integration](?lab=15-razorpay-payement-integration), following steps 1 to 4.

    - Edit the Razorpay API details to match with your Razorpay API Key, Refer to [Task 1: Create Web Credential](?lab=15-razorpay-payement-integration#Task1:CreateWebCredential) of [Lab 15: Razorpay Payment Gateway Integration](?lab=15-razorpay-payement-integration), following steps 5 to 9.

11. Update ICON_URL for the application icon in the emails:

    - Go to **App Builder > Online Bookstore > Page 100001 - Email Verification for User SignUp > Processing > Send Verification Email > Send Email Process**, under Settings, select **Placeholder Values** and update **ICON_URL**.

        - In **ICON_URL**, replace **online\_bookstore\_app** with your **workspace\_name**, and update the domain apex.oracle.com if your environment differs.

    - Go to **App Builder > Online Bookstore > Page 100002 - Email Verification for Forgot Password > Processing > Send Verification Email > Send Email Process**, under Settings, select **Placeholder Values** and update **ICON_URL**.

        - In **ICON_URL**, replace **online\_bookstore\_app** with your **workspace\_name**, and update the domain apex.oracle.com if your environment differs.

12. All set. Now, run the application and see it in action!

## Learn More - *Useful Links*

- [OCI Generative AI](https://www.oracle.com/artificial-intelligence/generative-ai/large-language-models/)
- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX Collateral](https://www.oracle.com/database/technologies/appdev/apex/collateral.html)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](http://apex.world)

## Acknowledgements

- **Author**: Pankaj Goyal, Member Technical Staff; Ankita Beri, Product Manager
- **Last Updated By/Date**: Pankaj Goyal, Member Technical Staff, March 2025