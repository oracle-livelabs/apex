# Create the application

## Introduction

In this lab, you build an application based on the data structures you built in previous labs.

Estimated Time: 15 minutes

Watch the video below for a quick walk-through of the lab.
[Create the Application](videohub:1_4qg90epw)

### Objectives

In this lab, you will:

- Create an application using the tables and data that you already have installed.

## Task 1: Create an Application

1. Navigate to **App Builder** and select **Create**.

    ![App builder home page](images/go-create-app.png " ")

2. Click **Use Create App Wizard**.

    ![Create Application options](./images/new-app.png " ")

## Task 2: Add a Name and Icon to the Application

1. In the Create Application wizard, for Name, enter **ACME Shop** and click the application icon.

    ![Create Application wizard](./images/name-app.png " ")

2. Click **Upload your own icon** to select an icon or simply drag and drop the image. Download a sample icon [here](./images/shopping-cart.png).

    ![Upload icon wizard](./images/upload-icon.png " ")

3. Adjust the icon if needed and click **Save Icon**.

    ![Upload icon wizard](./images/save-icon.png " ")

## Task 3: Add the Dashboard Page

A dashboard page is a great way to show important information using various charts. When you installed the Sample Dataset, it also created a number of views, which join data from various tables. These views are ideal as the basis for the dashboard charts.

1. In the Create Application wizard, click **Add Page**.

    ![Add Page](./images/add-page.png " ")

2. Click **Dashboard**.

    ![Add Page wizard](./images/add-dashboard.png " ")

3. Select **Chart 1**, enter/select the following:

    - Chart Type: **Bar**

    - Chart Name: **Top 10 Products**

    - Table or View: **PRODUCT_ORDERS**

    - Label Column: **PRODUCT_NAME**

    - Type: **Sum**

    - Value Column: **TOTAL_SALES**

    ![Chart 1 wizard](./images/chart1.png " ")

4. Select **Chart 2**, enter/select the following:

    - Chart Type: **Pie**

    - Chart Name: **Top 5 Stores**

    - Table or View: **STORE_ORDERS**

    - Label Column: **STORE_NAME**

    - Type: **Sum**

    - Value Column: **TOTAL_SALES**

    ![Chart 2 wizard](./images/chart2.png " ")

5. Select **Chart 3**, enter\select the following:

    - Chart Type: **Pie**

    - Chart Name: **Order Status**

    - Table or View: **CUSTOMER\_ORDER\_PRODUCTS**

    - Label Column: **ORDER_STATUS**

    - Type: **Count**

    - Value Column: **ORDER_ID**

    ![Chart 3 wizard](./images/chart3.png " ")

6. Select **Chart 4**, enter/select the following:

    - Chart Type: **Bar**

    - Chart Name: **Product Reviews**

    - Table or View: **PRODUCT_REVIEWS**

    - Label Column: **PRODUCT_NAME**

    - Type: **Column Value**

    - Value Column: **AVG_RATING**

    ![Chart 4 wizard](./images/chart4.png " ")

7. Navigate to **Advanced**, check **Set as Administration Page** and Click **Add Page**.

    Setting a page as Administration Page will make that only certain users can run the page. In this case, only users with Administration Rights will be able to run the Dashboard page, which means that this page will require authentication.

    ![Advanced section in Create Application wizard](./images/set-admin.png " ")

## Task 4: Add the Products Page

1. In the **Create an Application** wizard, click **Add Page**.

    ![Add Page wizard](./images/add-page-facet.png " ")

2. Click **Faceted Search**.

    ![Add Page wizard](./images/faceted-search.png " ")

3. On the **Add Faceted Search Page**, enter/select the following:

    - Page Name: **Products**

    - Select **Cards**

    - Table: **PRODUCTS**

    - Select **Grid**

    - Title Column: **PRODUCT_NAME**

    - Body Column: **- Select Column -** (to unselect the default column chosen)

    ![Add Page wizard](./images/fs-page.png " ")

4. Navigate to **Advanced**, check **Set as Home Page** and select **Add Page**.

    ![Add Page wizard](./images/fs-page1.png " ")

## Task 5: Delete Original Home Page

Since we designated the product faceted search page as the application's home page, we no longer need the default home page that the wizard included in the list of pages. Therefore, in this task, we will remove the original home page.

1. Navigate to the original page named "Home" and click **Edit**.

    ![Create Application wizard](./images/edit-home.png " ")

2. Click **Delete**.

    ![Edit page wizard](./images/delete-page.png " ")

3. Confirm the deletion by clicking **OK** on the dialog.

    ![Edit page wizard](./images/confirm-ok.png " ")

## Task 6: Add Multiple Reports

1. In the **Create an Application** wizard, click **Add Page**.

2. Navigate **Additional Pages** to see additional page types and select **Multiple Reports**.

    ![Add Page wizard](./images/multiple-reports.png " ")

3. On the **Add Multiple Reports** dialog, select the following tables:

    - CLOTHING_LOOKUP
    - COLOR_LOOKUP
    - CUSTOMERS
    - DEPARTMENT_LOOKUP
    - PRODUCT_REVIEWS
    - STORES

4. Click **Add Pages**.

    ![Add Page wizard](./images/multiple-reports2.png " ")

## Task 7: Set Multiple Reports as Administration Pages

1. Edit each of the following pages to set it as an Administration Page:
    - CLOTHING_LOOKUP
    - COLOR_LOOKUP
    - CUSTOMERS
    - DEPARTMENT_LOOKUP
    - PRODUCT_REVIEWS
    - STORES

    ![Edit Page wizard](./images/edit-multiple-reports.png " ")

2. For each page you edit, navigate to **Advanced** and check **Set as Administration Page**.

3. Click **Save Changes**.

    ![Edit Page wizard](./images/admin-pages.png " ")

## Task 8: Add Manage Products Page

1. In the **Create an Application** wizard, click **Add Page**.

2. Click **Interactive Report**.

    ![Add Page wizard](./images/ir-page.png " ")

3. On the **Add Report Page**, enter/select the following:

    - Page Name: **Manage Products**

    - Table: **PRODUCTS**

    - Check **Include Form**

4. Navigate to **Advanced**, check **Set as Administration Page** and select **Add Page**.

    ![Add Page wizard](./images/ir-page2.png " ")

## Task 9: Set Features

Features are a set of optional application capabilities Oracle APEX can include for your new application. Access Control enables role-based user authorization with a single click.

1. Under **Features** section, check **Access Control**.

    ![Features section in the Create Application wizard](./images/access-control.png " ")

## Task 10: Finish Creating the Application

Now that you have added all the pages, it is time to generate the app and review it.

1. Scroll to the bottom of the page, and click **Create Application**.

    ![Create Application wizard](./images/create-app.png " ")

2. Once the application is created, you will find the new app on the application home page.
Click **Run Application**.

    ![Application home page](./images/run-app12.png " ")

## Task 11: Run the Application

1. Enter your user credentials. Click **Sign In**.

    ![Application login page](./images/sign-in.png " ")

2. The new application will be displayed. Explore the pages that you just created by clicking on the navigation menu.

    ![New application is displayed](./images/view-app.png " ")

## Summary

You now know how to create an application with a number of different page types based on existing database objects. You may now **proceed to the next lab**.

## Acknowledgments

- **Author(s)** - Apoorva Srinivas, Senior Product Manager; Mónica Godoy, Principal Product Manager;
- **Last Updated By/Date** - Ankita Beri, Product Manager, January 2025
