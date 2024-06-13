# Introduction

From precisely summarizing intricate data to crafting context-aware responses, Generative AI stands at the forefront of a technological shift, promising to redefine how we navigate and leverage knowledge in our day-to-day interactions. With the introduction of AI assisted development in Oracle APEX, enabling your applications with generative AI capabilities has never been easier.

In this workshop, you learn to bring generative AI capabilities based on large language models (LLMs) to your applications built using Oracle APEX, your favourite low-code Platform. The Generative AI service can be accessed through REST APIs, and by using the powerful REST Data Source capabilities of APEX, you can effortlessly incorporate this advanced technology into your applications with a low-code approach.

<!-- ## What is OCI Generative AI service?

[Oracle Cloud Infrastructure Generative AI](https://www.oracle.com/artificial-intelligence/generative-ai/large-language-models/) is a fully managed service that provides a set of state-of-the-art, customizable large language models (LLMs) that cover a wide range of use cases for text generation. Generative AI currently supports the following pre-trained foundational models available from Meta and Cohere:

- Llama 2
- Command
- Summarize
- Embed

You can read more about these models from the [documentation](https://docs.oracle.com/en-us/iaas/Content/generative-ai/pretrained-models.htm). -->

This workshop will guide you through the process of utilizing the generation models within the Generative AI Service to develop an "Ask Questions" feature for the New York High Schools APEX application. This functionality empowers parents to inquire about school facilities, policies, and more, aiding them in making an informed decision about whether a specific school is the ideal fit for their child.

Estimated Time: 60 minutes

### **Objectives**

* Implement Faceted Search for Cards and Map Regions to filter and search for the best school.
* Build a conversational chatbot using Generative AI to ask questions about a school.
* Generate Email using Generative AI to apply to a school.

*Note: This workshop assumes you are using Oracle APEX 24.1.*

### **Labs**

| Module | Est. Time |
| --- | --- |
| [Creating an APEX application](?lab=1-create-app) | 10 minutes |
| [Visualize Schools on a Map](?lab=2-schools-on-map) | 10 minutes |
| [Build conversation Inquiry using Generative AI](?lab=3-using-genai) | 20 minutes |
| [Generate Email to Apply to a School](?lab=4-apply-to-school) | 15 minutes |
| [Run the Application](?lab=5-run-app) | 5 minutes |

Total estimated time: 60 minutes

### **Let's Get Started!**

If the menu is not displayed, you can open by clicking the menu button (![Menu icon](./images/menu-button.png)) at the upper-left corner of the page.

### **Downloads**

If you are stuck or the App is not working as expected, you can download and install the completed App as follows:
1. [Click here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2Fnyc-genai-app.sql.zip) to download the completed application zip file and unzip it.
2. Import the **nyc-genai-app.sql** file into your workspace. Follow the steps in the Install Application wizard to install the app along with the Supporting Objects.
3. Once the application is installed, navigate to **App Builder > Workspace Utilities > Generative AI**.   
4. Edit the **Open AI** service. For Credential, select **Create New** and for API Key, enter your Open AI API key. 
5. All set. Now, run the application and see it in action!


## Learn More - *Useful Links*

- [OCI Generative AI](https://www.oracle.com/artificial-intelligence/generative-ai/large-language-models/)
- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX Collateral](https://www.oracle.com/database/technologies/appdev/apex/collateral.html)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](http://apex.world)

## **Acknowledgements**

 - **Authors** - Toufiq Mohammed, Senior Product Manager; Apoorva Srinivas, Senior Product Manager
 - **Last Updated By/Date** - Apoorva Srinivas, Senior Product Manager, June 2024
