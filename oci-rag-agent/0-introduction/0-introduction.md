# Introduction

## About this Workshop

This lab demonstrates how to integrate Oracle APEX with OCI **Generative AI Agents**, showcasing how enterprises can enhance their applications with intelligent, context-aware capabilities. You'll explore combine the power of **Large Language Models (LLMs)** combined with Retrieval-Augmented Generation (RAG) to transform raw enterprise documents into actionable insights.

As part of the lab, you'll begin by uploading various documents to OCI Object Storage, which serves as a secure, scalable repository for your enterprise data. These documents are then processed through an **ingestion job**, which parses, indexes, and prepares the data for interaction using the OCI Generative AI service.

You will integrate a **chat interface** within your Oracle APEX application, allowing end users to interact with the Generative AI Agent in real time. The AI agent uses the previously ingested content to provide intelligent, personalized, and context-rich responses, enhancing user experience and driving operational efficiency.

Estimated Time: 90 minutes

### Objectives

In this workshop, you will:

- Creating an Agent in OCI Generative AI Agents.

- Add API Keys in the OCI Console.

- Create Web Credentials in Oracle APEX.

- Create Session and Ingestion Job using OCI Ingestion Job REST APIs.

- Set up an automation to monitor the status of incomplete Ingestion Jobs.

- Create and invoke a REST Data Source in your APEX app using the OCI Generative AI Agents' Create Sessions REST API.

- Design and customize a Classic Report for the chat widget.

- Interact with OCI Generative AI Agents through the Chat REST API.

>*Note: This workshop assumes you are using Oracle APEX 24.2.*

## Prerequisites

- A paid Oracle Cloud Infrastructure (OCI) account or a FREE Oracle Cloud account with $300 credits for 30 days to use on other services. Read more about it at: [oracle.com/cloud/free/](https://www.oracle.com/cloud/free/).

- An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments - The tenancy (root compartment) and ManagedCompartmentForPaaS (created by Oracle for Oracle Platform services).

- The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges via an OCI IAM Policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.

### **Let's Get Started!**

If the menu is not displayed, you can open by clicking the menu button (![Menu icon](./images/menu-button.png)) at the upper-left corner of the page.

## Downloads: Download and Install the Complete Application

If you are stuck or the app is not working as expected, you can download and install the completed App as follows:

1. [Click here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/rag_agents_export.sql) to download the completed application.

2. Import the **rag\_agents\_export.sql** file into your workspace. Follow the steps in the Install Application wizard to install the app along with the Supporting Objects.

3. Once the application is installed,

    - Follow Lab 1 > Task 1 to generate API keys using the OCI Console, and update the existing web credentials with your credentials.

    - Follow Lab 1 > Task 2 to create a bucket in OCI Object Storage.

    - Follow Lab 2 > Task 1 and Task 2 to create a Knowledge BAse and Generative AI Agents in OCI.

    - Follow Lab 3 > Task 2 to create Web Credentials in Oracle APEX.

4. All set. Now, run the application with the users you created and see it in action!

## Learn More - *Useful Links*

- [OCI Generative AI](https://www.oracle.com/artificial-intelligence/generative-ai/large-language-models/)
- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX Collateral](https://www.oracle.com/database/technologies/appdev/apex/collateral.html)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](http://apex.world)

## Acknowledgements

- **Author**: Roopesh Thokala, Senior Product Manager; Shailu Srivastava, Product Manager
- **Last Updated By/Date**: Shailu Srivastava, Product Manager, May 2025
