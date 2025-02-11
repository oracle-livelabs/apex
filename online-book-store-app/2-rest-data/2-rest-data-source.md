# Create REST data source

## Introduction

In this lab, you learn to extract data from REST Data Sources while also enabling synchronization. Next, you learn to create  a Faceted Search Page  to serve as the primary landing page in Online Bookstore Application.

REST Data Sources enable developers to access to Representational State Transfer (REST) services or generic JSON data feeds in applications and use the data in Oracle APEX components.

Data Synchronization enables developers to automatically sync the contents of a local table with the data from a REST service.

A faceted search page displays and filters data using an intuitive experience users recognize from e-commerce sites (a left Search region and a Report region). The report region displays search results as cards or a classic report.

Estimated Time: 6 minutes

### Objectives

In this lab, you will:

- Extract data using REST Data Source
- Enable Data Synchronization
- Create a Faceted Search Page

## Task 1: Extract data using REST Data Source

1. Click **App Builder** on top Navigation Bar.

    ![App builder home page](images/click-app-builder.png " ")

2. Click **Online Bookstore** Application.

    ![App builder home page](images/select-obs-app.png " ")

3. Click **Shared Components**.

    ![App builder home page](images/select-sc.png " ")

4. Under **Data Sources**, click **REST Data Sources**.

    ![App builder home page](images/rest-data-source.png " ")

5. Click **Create**.

    ![App builder home page](images/rds-create.png " ")

6. On Create REST Data Source - Method, click **Next**.

    ![App builder home page](images/rds-next1.png " ")

7. On Create REST Data Source, enter/select the following:

     - REST Data Source Type : **Simple HTTP**

     - Name  : **Books API**

     - URL Endpoint: Copy and paste below API

        ```
        <copy>
        https://raw.githubusercontent.com/pankaj-2407/BookStore/main/data.json
        </copy>
        ```


     Click **Next**.

    ![App builder home page](images/rds-name.png " ")

8. On **Create REST Data Source - Remote Server** wizard, leave as default and click **Next**.

    ![App builder home page](images/rds-next2.png " ")

9. On **Create REST Data Source - Settings** wizard, leave as default and click **Next**.

    ![App builder home page](images/rds-next3.png " ")

10. Click **Discover**. APEX invokes the REST service URL and a Preview appears.

    ![App builder home page](images/rds-discover.png " ")

11. Click **Create REST Data Source**. The REST Data Source is created.

    ![App builder home page](images/create-rds.png " ")

## Task 2: Enable Data Synchronization

1. After creating REST Data Source, click **No** to enable Synchronization.

    ![App builder home page](images/click-no.png " ")

2. Under **Details**, enter/select the following:

    - Local Table Owner : **Select your workspace name**

    - Synchronize to : **Existing Table**

    - Table Name: **OBS\_BOOKS**

    Click **Save**.

    ![App builder home page](images/click-save.png " ")

3. Now, under Details for **Synchronization Type**: select **Replace** and click **Save and Run**.

    ![App builder home page](images/click-replace.png " ")

## Task 3: Create a Faceted Search Page

In this task, you create Faceted Search page which will display list of the books with their titles and authors.

1. Go to **Online Bookstore** application. Click **Create Page**.

   ![App builder home page](images/fs-create.png " ")

2. Select **Faceted Search**.

   ![App builder home page](images/fs.png " ")

3. In the Create Faceted Search Page dialog, enter/select the following:

    - Under Page Definition:

        - Page Number: **10**

        - Name: **Search Books**

    - Data Source > Table/View Name: **OBS_BOOKS**

    - Navigation > Use Breadcrumb: Toggle **Off**

    Click **Next**.

   ![App builder home page](images/fs-next.png " ")

4. For Display as, select **Cards** and click **Refresh** to refresh the column statistics to provide better recommendations.

    Select the facets to include in the report **(PRICE, AUTHOR, CATEGORY and DISCOUNT)**, and uncheck others before clicking **Next**.

    ![App builder home page](images/fs-cards.png " ")

5. We will proceed with the default Card Layout **Grid** and default **Card Attributes**. Click **Create Page**.

    ![App builder home page](images/fs-create-page.png " ")

6. Navigate to **Shared Component** and click **User Interface Attributes** under **User Interface**.

    ![Shared Component](images/nav-sc.png " ")

    ![User Interface Attributes](images/select-user-interface.png " ")

7. Under Attributes, select **Home URL**: **10 Search Books**.

    ![Home URL](images/select-home-url.png " ")

8. Click **Apply Changes**.

    ![Apply Changes](images/apply-changes.png " ")

9. Click **Run**.

    ![App builder home page](images/click-run.png " ")

10. Enter your workspace credentials for sign-in.
    ![App builder home page](images/sign-in.png " ")
    ![App builder home page](images/fs-view.png " ")

## Summary

You now know how to Extract data using REST Data Source and Enable Data Synchronization. Also, you know how to Create a Faceted Search Page. You may now **proceed to the next lab**.

## Acknowledgements

- **Author**: Pankaj Goyal, Member Technical Staff
- **Last Updated By/Date**: Pankaj Goyal, Member Technical Staff, Feb 2025
