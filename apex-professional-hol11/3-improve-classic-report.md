# Improve Classic Report

## Introduction

This lab focuses on enhancing a Classic Report in an Oracle APEX application. Classic Reports are a highly flexible way to present structured data, and customizing them allows you to provide a more intuitive and engaging user experience. In this lab, you’ll modify a Classic Report on the Manage Products page within the Online Shopping Application. You will improve the report's functionality by incorporating features like links, dynamic buttons, and displaying images directly in the report. Additionally, you’ll learn to create a form page for managing products and implement a Download BLOB feature for seamless file downloads.

Estimated Time: 15 minutes

### Objectives

In this lab, you will:

- Customize the Classic Report for enhanced data presentation and usability.

- Configure links and buttons for navigation and interactivity.

- Add a Download BLOB feature to enable file downloads directly from the report.

- Display product images directly in the report for better visualization.

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

    - Under Link:
    
        - Target: Click **No Link Defined**

            - Page: **15** *{This page will be created in the next lab}*

            - Set Items:
        
            | Name | Value |
            | ---- | ---- |
            | P15\_PRODUCT\_ID | #PRODUCT\_ID# |

        - Clear Cache: **15**

        - Click **OK**.

    - Link > Link Text: **fa-edit**

    ![Navigate to Manage Products](./images/product-id-link.png " ")

    ![Navigate to Manage Products](./images/product-id-icon.png " ")

4.  Select **PRODUCT\_DETAILS** column and enter/select the following:

    - Identification > Type: **DOWNLOAD BLOB**

    - Under BLOB Attributes:

        - Table Name: **PRODUCTS**

        - BLOB Column: **PRODUCT_DETAILS**

        - Primary Key Column 1: **PRODUCT_ID**

     ![Navigate to Manage Products](./images/product-details.png " ")

5. Select **PRODUCT_IMAGE** column and enter/select the following:

    - Identification > Type: **Display Image**

    - Under BLOB Attributes:

        - Table Name: **PRODUCTS**

        - BLOB Column: **PRODUCT_IMAGE**

        - Primary Key Column 1: **PRODUCT_ID**

    ![Navigate to Manage Products](./images/product-image.png " ")

6. Navigate to **RESET_REPORT** button and update the following:

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

            | Name | Value |
            | ---- | ---- |
            | P15\_PRODUCT\_ID | #PRODUCT\_ID# |

            - Clear Cache: **15**

            Click **OK**.

    ![Navigate to Manage Products](./images/create-btn.png " ")

    ![Navigate to Manage Products](./images/create-redirect.png " ")

7. Click **Save**.

## Summary

In this lab, you’ve learned how to:

- Enhance a Classic Report by modifying its attributes and customizing its design.

- Implement a Download BLOB feature and display product images directly in the report.

These improvements ensure a more seamless and user-friendly experience in the Manage Products page of your Online Shopping Application. You’re now ready to move on to the next lab.

## What's next

In the next Lab, you learn how to create and customize a Form and then link the form to an Interactive Report. This process involves designing a user-friendly data entry form and connecting it to a dynamic, interactive report that displays data from a database table.

## Acknowledgements

- **Author** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, October 2024
