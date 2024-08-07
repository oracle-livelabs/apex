# Create the APEX Application

## Introduction

In this lab, you will create an Oracle APEX application using the create application wizard. This process will help you transition from Oracle Forms to APEX by creating a modern web application interface for your database objects.

Before we begin, let's recap what we have set up so far:

- An Always-Free Autonomous Database
- An APEX Workspace with the necessary database objects already loaded

The goal of this lab is to guide you through the steps to create an APEX application with various types of pages such as faceted search, interactive reports, and master-detail pages. This will showcase the flexibility and power of APEX in building sophisticated web applications with ease.

By the end of this lab, you will have an APEX application with multiple pages, each demonstrating different features and functionalities, ready to be enhanced further in subsequent labs.

Estimated Time: 15 Minutes

### Objectives

In this lab, you:

- Create an Oracle APEX application using the create application wizard.
- Add multiple types of pages such as faceted search, interactive reports, and master-detail pages to the APEX application.
- Manage and enhance application pages.

## Task 1: Create an Application

1. First, log in into your APEX workspace.

2. Click **App Builder**.

    ![App Builder](images/app-builder.png " ")

3. On app builder page, click **Create a New App**.

    ![Create a New App](images/create-new-app.png " ")

4. Click **Use Create App Wizard**.

    ![Use Create App Wizard](images/use-create-app-wizard.png " ")

5. Since you will create a new application, enter the name **Modernization** and leave the app icon and appearance with default values. Click **Add Page**.

    ![Add Page](images/add-page1.png " ")

 *Note: Default App Icon could be different in your environment, for simplicity just accept the default.*

6. Select **Faceted Search**.

    ![faceted search](images/faceted-search1.png " ")

7. For add faceted search page, enter/ select the following:

    - Page Name: **Customer - Faceted Search**

    - Table: **S\_CUSTOMER**

    - **Check** the **Include Form** checkbox

     Click **Add Page**.

   ![faceted search](images/add-faceted-search-page1.png " ")

8. On create an application page, click **Add Page** to add another page for customers table (S\_CUSTOMER) and select **Interactive Report**.

    ![interactive report](images/interactive-report.png " ")

9. For the add report page, enter/select the following:

    - Page Name: **Customer – Interactive Report**

    - Table or View: **S\_CUSTOMER**

    - **Check** the **Include Form** checkbox

    Click **Add Page**.

    ![interactive report](images/add-report-page1.png " ")

10. On the create an application page, add another page for the ORDERS table by clicking **Add Page** as done previously and selecting **Master Detail**.

    ![master detail](images/master-detail.png " ")

11. For add master detail page, enter/select the following:

    - Page Name: **Orders – Stacked**

    - Select **Stacked** as Master Detail layout page.

    - Table: **S\_ORD**

    - Detail Table: **S\_ITEM**

    Click **Add Page**.

    ![master detail](images/add-master-detail-page.png " ")

12. Add a new form for the S_ORD table. Click **Add Page** and select **Faceted Search**.

    ![Faceted Search](images/faceted-search2.png " ")

13. On Add faceted search page, enter/select the following:

    - Page Name: **Orders - Faceted Search**

    - Table: **S\_ORD**

    Click **Add Page**.

    ![Faceted Search](images/add-faceted-search-page21.png " ")

14. Under features, check **Install Progressive Web App** and click **Create Application**.

    ![create application](images/create-app11.png " ")

## Task 2: Run the Application

1. Now let’s run the application from the current page as a developer. Click **Run Application** icon.

    ![Run application](images/run-application1.png " ")

2. Enter the credentials. The home page includes a link to the pages created previously. You can edit this page as you need. Click on the hamburger menu on the top to explore all the pages.

    ![application](images/application1.png " ")

    ![application](images/app-form1.png " ")

## Summary

You have now created the APEX application with multiple report example scenarios for the Customer, Orders, and Order Items tables.
In the next lab you will undertake Oracle Forms functionalities enhancement steps in APEX.

## Acknowledgements

- **Author** - Monica Godoy, Senior Principal Product Manager ; Ankita Beri, Product Manager; Paolo Paolucci, Data Development Specialist; Victor Mendo, Data Development Specialist
- **Last Updated By/Date** - Ankita Beri, Product Manager, July 2024
