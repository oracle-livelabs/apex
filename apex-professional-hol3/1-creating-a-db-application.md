# Create a Database application based on Existing Tables.


## Introduction

In this lab, you will create a database application based on existing tables.

Estimated Time: 15 minutes

<!--Watch the video below for a quick walk through of the lab.

[](youtube:ssUKy-bZGUw)-->

### Objectives
In this lab, you will:
- Create an application using the tables and data that you already have installed.
- Create a Database application from a file.

## Task 1: Create an Application based on Existing Tables.

1. In the App Builder menu, click **App Builder**.

2. Click **Create**.

    ![Create an Application](images/create-app.png " ")

3.  Click **New Application**.

    ![New Application](./images/click-new-application.png " ")

## Task 2: Name the Application

1. In the Create Application wizard, for Name enter **Online Shopping Application**. Note that, in the create applicati�on wizard the icon and color of the icon will be a random selecti�on so most likely will not be the same color or icon that they see in the screenshot.

    ![Name the application](./images/name-the-application1.png " ")

## Task 3: Add the Dashboard Page

A dashboard page is a great way to show important information using various charts. When you installed the Sample Dataset, it also created a number of views, which join data from various tables. These views are ideal as the basis for the dashboard charts.

1. In the Create Application wizard, click **Add Page**.

2. Click **Dashboard**.

    ![Add Dashboard](./images/add-dashboard-page1.png " ")

3. For Chart 1, enter the following:

    * Chart Type – select **Bar**
    * Chart Name – enter **Top 10 Products**
    * Table or View – select **PRODUCT_ORDERS**
    * Label Column – select **PRODUCT_NAME**
    * Type – select **Sum**
    * Value Column – select **TOTAL_SALES**.

    ![Add Chart1](./images/chart1.png " ")

4. Click Chart 2, and enter the following:

    * Chart Type – select **Pie**
    * Chart Name – enter **Top 5 Stores**
    * Table or View – select **STORE_ORDERS**
    * Label Column – select **STORE_NAME**
    * Type – select **Sum**
    * Value Column – select **TOTAL_SALES**.

    ![Add Chart2](./images/chart2.png " ")

5. Click Chart 3, and enter the following:

    * Chart Type – select **Pie**
    * Chart Name – enter **Order Status**
    * Table or View – select **CUSTOMER\_ORDER\_PRODUCTS**
    * Label Column – select **ORDER_STATUS**
    * Type – select **Count**
    * Value Column – select **ORDER_ID**.

    ![Add Chart3](./images/chart3.png " ")    

6. Click Chart 4, and enter the following:

    * Chart Type – select **Bar**
    * Chart Name – enter **Product Reviews**
    * Table or View – select **PRODUCT_REVIEWS**
    * Label Column – select **PRODUCT_NAME**
    * Type – select **Column Value**
    * Value Column – select **AVG_RATING**.

    ![Add Chart4](./images/chart4.png " ")  

7. Click Advanced and check **Set as Administration Page**.

  ![Set as Administration Page](./images/set-as-admin-page.png " ")

  Setting a page as Administration Page will make that only certain users can run the page. In this case, only users with Administration Rights will be able to run the Dashboard page, which means that this page will require authentication.

8. Click **Add Page**.

## Task 4: Add Multiple Reports

1. In the Create Application wizard, click **Add Page**.
2. Click the arrow to the left of **Additional Pages** to see additional page types.
3. Click **Multiple Reports**.

    ![Add Multiple reports1](./images/add-multiple-reports.png " ")

3. On the Create Multiple Reports Page, select the following tables:
    - CLOTHING_LOOKUP
    - COLOR_LOOKUP
    - CUSTOMERS
    - DEPARTMENT_LOOKUP
    - PRODUCT_REVIEWS
    - STORES

4. Click **Add Pages**.

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

  ![](./images/edit-multiple-reports.png " ")

2. For each page you edit, click **Advanced** and check **Set as Administration Page**.
3. Click **Save Changes**.

    ![](./images/set-as-admin-page2.png " ")

## Task 8: Add Manage Products Page

1. In the Create Application wizard, click **Add Page**.
2. Click **Interactive Report**.

    ![Select interactive report](./images/select-ir-report.png " ")

3. On the Report Page, enter the following:
    - Page Name - enter **Manage Products**
    - Table - select **PRODUCTS**

    ![Add report page](./images/add-report-page.png " ")


4. Expand Lookup columns, and enter the following:

    - Lookup Key 1 - select **CLOTHING_ID**
    - Display Column 1 - select **CLOTHING_LOOKUP.CLOTHING**
    - Lookup Key 2 - select **DEPARTMENT_ID**
    - Display Column 2 - select **DEPARTMENT\_LOOKUP.DEPARTMENT**
    - Lookup Key 3 - select **COLOR_ID**
    - Display Column 3 - select **COLOR_LOOKUP.COLOR**

5. Click **Advanced** and check **Set as Administration Page**.

6. Click **Add Page**.

  ![Add page](./images/add-report-page1.png " ")

## Task 9: Set Features

Features are a set of optional application capabilities in Oracle APEX that you can include in your new application. Access Control enables role-based user authorization with a single click.

1. Under **Features** section, check **Install Progressive Web App** and **Access Control**.

  ![Check Install Progressive Web App](./images/set-features.png " ")

## Task 10: Finish Creating the Application

Now that you have added all the pages, it is time to generate the app and review it.

1. Scroll to the bottom of the page, and click **Create Application**.

    ![Click create application](./images/click-create-application.png " ")

2. Once the application is created, you will find the new app on the application home page.
Click **Run Application**.

    ![Run application](./images/run-application.png " ")

## Task 11: Run the Application

1. Enter your user credentials. Click **Sign In**.

    ![Online shopping application Sign In](./images/sign-in2.png " ")

    The new application will be displayed. Explore the pages that you just created by clicking on the navigation menu.


You now know how to create an application with a number of different page types based on existing database objects. You may now **proceed to the next lab**.

## **Acknowledgments**

- **Author** - Roopesh Thokala, Product Manager
- **Last Updated By/Date** - Roopesh Thokala, Product Manager, March 2022
