# Create a Database application based on Existing Tables

You learn how to create a database application using existing tables in this lab. Following the guided steps, you will use the App Builder tool to build an Online Shopping Application with various pages, charts, and reports. The lab will also demonstrate how to set up an administration page, enable features like Progressive Web Apps, and implement access control for secure management. You will gain hands-on experience developing a functional, data-driven application through this lab.

Estimated Time: 15 minutes

## Objectives

In this lab, you will:

- Create an application using the tables and data you have installed.

- Create a Database application from a file.

## Task 1: Create an Application based on Existing Tables

1. On your workspace home page, navigate to **App Builder**.

    ![Create an Application](images/create-app1.png " ")

2. Click **Create**.

    ![Create an Application](images/create-app.png " ")

3. Select **Use Create App Wizard**.

    ![New Application](./images/click-new-application.png " ")

## Task 2: Name the Application

1. On the **Create an Application** page, for **Name**, enter **Online Shopping Application**.

    *Note that the icon and color in the create application wizard will be randomly selected, and hence they might be different for you.*

    ![Name the application](./images/name-the-application1.png " ")

## Task 3: Add the Dashboard Page

In this task, you will learn to create a dashboard. A dashboard page is a great way to show critical information using various charts. Installing the sample dataset created several views that join data from multiple tables. These views are ideal as the basis for the dashboard charts.

1. On the **Create an Application** page, click **Add Page**.

    ![Click Add Page](./images/add-page.png " ")

2. Select **Dashboard**.

    ![Add Dashboard](./images/add-dashboard-page1.png " ")

3. Select **Chart 1**, and enter/select the following:

    - Chart Type: **Bar**

    - Chart Name: **Top 10 Products**

    - Table or View: **PRODUCT_ORDERS**

    - Label Column: **PRODUCT_NAME**

    - Type: **Sum**

    - Value Column: **TOTAL_SALES**

    ![Add Chart1](./images/chart11.png " ")

4. Select **Chart 2**, and enter/select the following:

    - Chart Type: **Pie**

    - Chart Name: **Top 5 Stores**

    - Table or View: **STORE_ORDERS**

    - Label Column: **STORE_NAME**

    - Type: **Sum**

    - Value Column: **TOTAL_SALES**

    ![Add Chart2](./images/chart22.png " ")

5. Select **Chart 3**, and enter/select the following:

    - Chart Type: **Pie**

    - Chart Name: **Order Status**

    - Table or View: **CUSTOMER\_ORDER\_PRODUCTS**

    - Label Column: **ORDER_STATUS**

    - Type: **Count**

    - Value Column: **ORDER_ID**.

    ![Add Chart3](./images/chart33.png " ")

6. Select **Chart 4**, and enter/select the following:

    - Chart Type: **Bar**

    - Chart Name: **Product Reviews**

    - Table or View: **PRODUCT_REVIEWS**

    - Label Column: **PRODUCT_NAME**

    - Type: **Column Value**

    - Value Column: **AVG_RATING**.

    ![Add Chart4](./images/chart44.png " ")

7. Under **Advanced**, enable **Set as Administration Page** and click **Add Page**.

    ![Set as Administration Page](./images/set-as-admin-page.png " ")

    *Note - Setting a page as an Administration Page will ensure that only certain users can run the page. In this case, only users with Administration Rights can run the Dashboard page, which means this page will require authentication.*

## Task 4: Add Multiple Reports

1. On the **Create an Application** page, click **Add Page**.

    ![Click Add Page](./images/add-page1.png " ")

2. Under **Additional Pages**, select **Multiple Reports**.

    ![Add Multiple reports1](./images/add-multiple-reports.png " ")

3. On the **Add Multiple Reports** page, select the following tables and click **Add Pages**.

    - CLOTHING_LOOKUP
    - COLOR_LOOKUP
    - CUSTOMERS
    - DEPARTMENT_LOOKUP
    - PRODUCT_REVIEWS
    - STORES

    ![Add Multiple reports2](./images/add-multiple-reports2.png " ")

    ![Add Multiple reports3](./images/add-multiple-reports3.png " ")

## Task 5: Set Multiple Reports as Administration Pages

1. Edit each of the following pages to set it as an Administration Page:

    - CLOTHING_LOOKUP
    - COLOR_LOOKUP
    - CUSTOMERS
    - DEPARTMENT_LOOKUP
    - PRODUCT_REVIEWS
    - STORES

    ![Administration Pages](./images/edit-multiple-reports.png " ")

2. For each page you edit, click **Advanced** and enable **Set as Administration Page**.

3. Click **Save Changes**.

    ![Administration Pages](./images/set-as-admin-page2.png " ")

## Task 6: Add Manage Products Page

1. On the Create an  Application page, click **Add Page**.

    ![Click Add Page](./images/add-page2.png " ")

2. Select **Interactive Report**.

    ![Select interactive report](./images/select-ir-report.png " ")

3. On the **Add Report Page**, enter/select the following:

    - Page Name: **Manage Products**

    - Table: **PRODUCTS**

4. Under **Advanced**, enable **Set as Administration Page** and click **Add Page**.

    ![Add page](./images/add-report-page.png " ")

## Task 7: Enable Features

In this task, you will enable features before creating an application. Features are a set of optional application capabilities in Oracle APEX that you can include in your new application.

1. Under **Features**, check **Install Progressive Web App** and **Access Control**.

    *Note: Progressive Web Apps (PWAs) can be easily installed on any desktop or mobile device, offering users a more native app experience. Access Control enables role-based user authorization with a single click.*

    ![Check Install Progressive Web App](./images/set-features.png " ")

## Task 8: Finish Creating the Application

Now that you have added all the pages, it is time to create and review the application.

1. Scroll to the bottom of the page and click **Create Application**.

    ![Click create application](./images/click-create-application.png " ")

2. Once the application is created, you will find the new app on the app builder home page.
Click **Run Application**.

    ![Run application](./images/run-application11.png " ")

## Task 9: Explore the Application

1. Enter your Credentials and click **Sign In**.

    ![Online shopping application Sign In](./images/sign-in2.png " ")

2. A new application will be displayed. Click on the navigation menu to explore the pages you just created.

    ![Online shopping application Sign In](./images/sign-in31.png " ")

## Summary

You can now create an application with several page types based on existing database objects. You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Roopesh Thokala, Senior Product Manager; Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, September 2024
