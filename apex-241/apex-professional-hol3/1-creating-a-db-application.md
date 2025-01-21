# Create a Database application based on Existing Tables.

In this lab, you will create a database application based on existing tables.

Estimated Time: 15 minutes

<!--Watch the video below for a quick lab walkthrough.

[](youtube:ssUKy-bZGUw)-->

### Objectives
In this lab, you will:
- Create an application using the tables and data you have installed.
- Create a Database application from a file.


## Task 1: Create an Application based on Existing Tables

1. In the App Builder menu, click **App Builder**.

2. Click **Create**.

    ![Create an Application](images/create-app.png " ")

3.  Select **Use Create App Wizard**.

    ![New Application](./images/click-new-application.png " ")

## Task 2: Name the Application

1. In the Create Application wizard, for Name, enter **Online Shopping Application**.

   *Note that the icon and colour in the create application wizard will be randomly selected, and hence they might be different for you.*

    ![Name the application](./images/name-the-application1.png " ")

## Task 3: Add the Dashboard Page

A dashboard page is a great way to show critical information using various charts. Installing the Sample Dataset created several views that join data from multiple tables. These views are ideal as the basis for the dashboard charts.

1. In the Create Application wizard, click **Add Page**.

2. Select **Dashboard**.

    ![Add Dashboard](./images/add-dashboard-page1.png " ")

3. For **Chart 1**, enter/select the following:

    * Chart Type: **Bar**
    * Chart Name: **Top 10 Products**
    * Table or View: **PRODUCT_ORDERS**
    * Label Column: **PRODUCT_NAME**
    * Type: **Sum**
    * Value Column: **TOTAL_SALES**

    ![Add Chart1](./images/chart11.png " ")

4. Click **Chart 2**. Enter/select the following:

    *  Chart Type: **Pie**
    *  Chart Name: **Top 5 Stores**
    *  Table or View: **STORE_ORDERS**
    *  Label Column: **STORE_NAME**
    *  Type: **Sum**
    *  Value Column: **TOTAL_SALES**

    ![Add Chart2](./images/chart22.png " ")

5. Click **Chart 3**. Enter/select the following:

    * Chart Type: **Pie**
    * Chart Name: **Order Status**
    * Table or View: **CUSTOMER\_ORDER\_PRODUCTS**
    * Label Column: **ORDER_STATUS**
    * Type: **Count**
    * Value Column: **ORDER_ID**.

    ![Add Chart3](./images/chart33.png " ")    

6. Click **Chart 4**, and enter/select the following:

    * Chart Type: **Bar**
    * Chart Name: **Product Reviews**
    * Table or View: **PRODUCT_REVIEWS**
    * Label Column: **PRODUCT_NAME**
    * Type: **Column Value**
    * Value Column: **AVG_RATING**.

    ![Add Chart4](./images/chart44.png " ")  

7. Click **Advanced** and check **Set as Administration Page**.

  ![Set as Administration Page](./images/set-as-admin-page.png " ")

   *Note - Setting a page as an Administration Page will ensure that only certain users can run the page. In this case, only users with Administration Rights can run the Dashboard page, which means this page will require authentication.*

8. Click **Add Page**.

## Task 4: Add Multiple Reports

1. In the Create Application wizard, click **Add Page**.
2. Click the arrow to the left of **Additional Pages** to see additional page types.
3. Select **Multiple Reports**.

    ![Add Multiple reports1](./images/add-multiple-reports.png " ")

4. On the Create Multiple Reports Page, select the following tables:
    - CLOTHING_LOOKUP
    - COLOR_LOOKUP
    - CUSTOMERS
    - DEPARTMENT_LOOKUP
    - PRODUCT_REVIEWS
    - STORES

5. Click **Add Pages**.

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

2. For each page you edit, click **Advanced** and check **Set as Administration Page**.

3. Click **Save Changes**.

    ![Administration Pages](./images/set-as-admin-page2.png " ")

## Task 6: Add Manage Products Page

1. In the Create Application wizard, click **Add Page**.
2. Select **Interactive Report**.

    ![Select interactive report](./images/select-ir-report.png " ")

3. On the Report Page, enter the following:
    - Page Name: **Manage Products**
    - Table: **PRODUCTS**

<!--
4. Expand Lookup columns, and enter the following:

    - Lookup Key 1 - select **CLOTHING_ID**
    - Display Column 1 - select **CLOTHING_LOOKUP.CLOTHING**
    - Lookup Key 2 - select **DEPARTMENT_ID**
    - Display Column 2 - select **DEPARTMENT\_LOOKUP.DEPARTMENT**
    - Lookup Key 3 - select **COLOR_ID**
    - Display Column 3 - select **COLOR_LOOKUP.COLOR**
-->
4. Click **Advanced** and check **Set as Administration Page**.

5. Click **Add Page**.

  ![Add page](./images/add-report-page.png " ")

## Task 7: Enable Features

Features are a set of optional application capabilities in Oracle APEX that you can include in your new Application.

1. Under **Features** section, check **Install Progressive Web App** and **Access Control**.
    Progressive Web Apps (PWAs) can be easily installed on any desktop or mobile device, offering users a more native app experience. Access Control enables role-based user authorization with a single click.

  ![Check Install Progressive Web App](./images/set-features.png " ")

## Task 8: Finish Creating the Application

Now that you have added all the pages, it is time to create and review the app.

1. Scroll to the bottom of the page and click **Create Application**.

    ![Click create application](./images/click-create-application.png " ")

2. Once the Application is created, you will find the new app on the application home page.
Click **Run Application**.

    ![Run application](./images/run-application11.png " ")

## Task 9: Explore the Application

1. Enter your Credentials. Click **Sign In**.

    ![Online shopping application Sign In](./images/sign-in2.png " ")

2. The new Application will be displayed. Explore the pages that you just created by clicking on the navigation menu.

    ![Online shopping application Sign In](./images/sign-in31.png " ")

## Summary
You can now create an application with several page types based on existing database objects. You may now **proceed to the next lab**.

## Acknowledgements
- **Author** - Roopesh Thokala, Senior Product Manager
- **Contributor** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, January 2024
