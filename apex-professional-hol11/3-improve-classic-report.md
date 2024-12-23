# Improve Classic Report

## Introduction

In this task, you will learn how to enhance a Classic Report in an Oracle APEX application by modifying its attributes and incorporating dynamic elements. Classic Reports are a powerful way to display data in a structured format, and by customizing the report, you can create an intuitive and interactive user experience. Specifically, we will enhance the Manage Products page within the Online Shopping Application by updating the SQL query, modifying column attributes, and configuring links and buttons.

Estimated Time: 5 minutes

### Objectives

In this lab, you will:

- Customize the Classic Report to enhance its presentation and functionality.

- Implement a Download BLOB feature for the PRODUCT_DETAILS column.

- Configure the PRODUCT_IMAGE column to display images directly within the report.

- Modify the SQL query to fetch additional product-related data (color, department, clothing).

- Adjust column settings, such as setting PRODUCT_ID as a clickable link.

### Downloads

- Did you miss out on trying the previous labs? Don’t worry! You can download the application from **[here](files/hol10.sql)** and import it into your workspace. To run the app, please run the steps described in **[Get Started with Oracle APEX](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.

## Task 1: Enhance Classic Report

1. On **Online Shopping Application**, navigate to **14 - Manage Products** page.

      ![Navigate to Manage Products](./images/14-manage-products.png " ")

2. In the left pane, navigate to **Products** region and update the following:

    - Identification > Type: **Classic Report**

    - Source > SQL Query: Copy and replace the following SQL Query:

    ```
    <copy>
    SELECT
        "PRODUCT_ID",
        "PRODUCT_NAME",
        "UNIT_PRICE",
         DBMS_LOB.GETLENGTH("PRODUCT_DETAILS") AS PRODUCT_DETAILS,
         DBMS_LOB.GETLENGTH("PRODUCT_IMAGE") AS PRODUCT_IMAGE,
        "IMAGE_MIME_TYPE",
        "IMAGE_FILENAME",
        "IMAGE_CHARSET",
        "IMAGE_LAST_UPDATED",
        (
            SELECT
                L1."COLOR"
            FROM
                "COLOR_LOOKUP" L1
            WHERE
                L1."COLOR_ID" = M."COLOR_ID"
        ) COLOR,
        (
            SELECT
                L2."DEPARTMENT"
            FROM
                "DEPARTMENT_LOOKUP" L2
            WHERE
                L2."DEPARTMENT_ID" = M."DEPARTMENT_ID"
        ) DEPARTMENT,
        (
            SELECT
                L3."CLOTHING"
            FROM
                "CLOTHING_LOOKUP" L3
            WHERE
                L3."CLOTHING_ID" = M."CLOTHING_ID"
        ) CLOTHING
    FROM
        "PRODUCTS" M
    </copy>
    ```

    ![Navigate to Manage Products](./images/update-query.png " ")

3. Under **Products** region, expand columns and select **PRODUCT\_ID** column. In the Property Editor, enter/select the following:

    - Identification > Type: **Link**

    - Link > Target: Click **No Link Defined**

        - Page: **15**

        - Set Items > Name: **P15\_PRODUCT\_ID**, Value: **#PRODUCT\_ID#**

        - Clear Cache: **15**

        - Click **OK**.

    - Link > Link Text: **fa-edit**

    ![Navigate to Manage Products](./images/product-id-link.png " ")

    ![Navigate to Manage Products](./images/product-id-icon.png " ")

4. Click **Save**.

## Task 2: Create Form to Manage Products

1. In the Page Designer toolbar, navigate to **+ V** icon and select **Page**.

    ![Navigate to Manage Products](./images/create-manage-products.png " ")

2. Select **Form**.

    ![Navigate to Manage Products](./images/mp-form.png " ")

3. In **Create Form** dialog, enter/select the following:

    - Under Page Definition:

        - Page Number: **15**

        - Name: **Manage Products**

    - Data Source > Table / View Name: **PRODUCTS**

    - Under Navigation:

        - Use Breadcrumb: Toggle **OFF**

        - Use Navigation:  Toggle **OFF**

    Click **Next**.

    ![Navigate to Manage Products](./images/mp-create-form.png " ")

4. Enter/ select the following:

    - Under Branch Pages:

        - Branch Here on Submit: **14**

        - Cancel and Go To Page: **14**

    Click **Create Page**.

    ![Navigate to Manage Products](./images/mp-create-page.png " ")

5. Navigate to Property Editor (right pane), update the following:

    - Appearance > Page Mode: **Modal Dialog**

    - Under Dialog:

        - Width: **600**

        - Height: **600**

    ![Navigate to Manage Products](./images/modal-dialog.png " ")

6. Now, navigate to **Manage Products** region (left pane). Select **P15\_IMAGE\_MIME\_TYPE** page item and hold until **P15\_IMAGE\_LAST\_UPDATED** and change type to **Hidden**.

    ![Navigate to Manage Products](./images/page-items-hidden.png " ")

7. Remove **Id** from the label of page items: **P15\_COLOR\_ID , P15\_DEPARTMENT\_ID , P15\_CLOTHING\_ID**.

    ![Navigate to Manage Products](./images/label-change.png " ")

8. From the page designer toolbar, navigate to **Page Finder** and select **14**.

    ![Navigate to Manage Products](./images/nav-to-14.png " ")

9. Under **Products** region, select **PRODUCT\_DETAILS** column and enter/select the following:

    - Identification > Type: **DOWNLOAD BLOB**

    - Under BLOB Attributes:

        - Table Name: **PRODUCTS**

        - BLOB Column: **PRODUCT_DETAILS**

        - Primary Key Column 1: **PRODUCT_ID**

     ![Navigate to Manage Products](./images/product-details.png " ")

10. Select **PRODUCT_IMAGE** column and enter/select the following:

    - Identification > Type: **Display Image**

    - Under BLOB Attributes:

        - Table Name: **PRODUCTS**

        - BLOB Column: **PRODUCT_IMAGE**

        - Primary Key Column 1: **PRODUCT_ID**

    ![Navigate to Manage Products](./images/product-image.png " ")

11. Navigate to **RESET_REPORT** button and update the following:

    - Under Identification:

        - Button Name: **Create**

        - Label: **Create**

    - Layout > Slot: **Above Region [Legacy]**

    - Under Appearance:

        - Hot: **Toggle On**

        - Template Options: Click **Use Template Defaults**

            - Advanced > Width: **Stretch**

            Click **OK**.

    - Under Behavior:

        - Action: **Redirect to Page in this Application**

        - Target: Click **No Link Defined**

            - Target > Page: **15**

            - Set Items > Name: **P15\_PRODUCT\_ID** , Value: **#PRODUCT_ID#**

            - Clear Cache: **15**

            Click **OK**.

    ![Navigate to Manage Products](./images/create-btn.png " ")

    ![Navigate to Manage Products](./images/create-redirect.png " ")

12. Click **Save**.

## Summary

You now know how to enhance classic report. You may now **proceed to the next Lab**.

## What's next

In the next Lab, you learn how to Create and Customize a Form and then link the form to an Interactive Report. This process involves designing a user-friendly data entry form and connecting it to a dynamic, interactive report that displays data from a database table.

## Acknowledgements

- **Author** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, October 2024
