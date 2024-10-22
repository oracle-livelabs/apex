# Create and Use Forms

## Introduction

In this lab, you learn how to Create and Customize a Form, and then you link the Form to an Interactive Report.

Estimated Time: 5 minutes

### Downloads

- Did you miss out on trying the previous labs? Don't worry! You can download the Demo application from **[here](files/hol11-lab1.sql)** , Online shopping Application from **[here](files/hol11-lab2.sql)**and import it into your workspace. To run the app, please run the steps described in **[Get Started with Oracle APEX](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.

## Task 1: Create a Product Details Form

1. Navigate to the **App Builder**. Click **Online Shopping Application**.

    ![App Builder](images/navigate-to-osa1.png " ")

    ![Online Shopping Application](images/navigate-to-osa2.png " ")

2. Now, click **Create Page**.

    ![Create Page](images/create-form1.png " ")

3. select **Form**.

    ![Create Form](images/create-form2.png " ")

4. For page attributes, enter/select the following:

    - Under Page Definition:

        - Page Number: **15**.

        - Name: **Product Details**

        - Page Mode: **Modal Dialog**

    - Data Source > Table/View Name: **PRODUCTS**.

    Click **Next.**

    ![Define Form](./images/create-form3.png " ")

5. For **Primary Key Column1**, ensure the **PRODUCT_ID** is selected and click **Create Page**.

    ![Define Primary key](./images/create-form4.png " ")

## Task 2: Link a Report to a Form

1. From **Page Designer** toolbar, navigate to page finder and select **Page 14**

    ![Navigate To Manage Products](./images/navigate-to-mp2.png " ")

2. In the **Rendering** tab (left pane), navigate to **Products**. Click **Attributes** and update the following:

    - Under **Link**:

        - Link Column: **Link to a Custom Target**

        - Click **No Link Defined** and enter/select the following:

            - Page: **15**.

            - Set Items:

            | Name             | Value        |
            | ---------------- | ------------ |
            | P15\_PRODUCT\_ID | #PRODUCT_ID# |

            - Clear Cache: **15**

            - Click **OK**.

    ![Link a column](./images/linking-a-form2.png " ")

3. Click **Save** and run the application. Navigate to **Administration** > **Manage Products** page in the runtime environment.

4. Now, in the **Manage Products** page, click **Pencil Icon** on the first row. Verify the **Product Details** model dialog page.

    ![Click Pencil icon](./images/refresh-manage-products.png " ")

    ![View Product Details](./images/refresh-manage-products1.png " ")

## Task 3: Enhance the Form

1. Navigate to the **Page 15** in the **Page Designer**.

    ![Navigate to Page 15](images/navigate-to-page21.png " ")

2. Items can readily be moved using drag-and-drop within Layout. You can also drag new components like regions, items, and buttons into the Layout pane from the Gallery, located directly below it.

    In Page Designer, with **Page 15** loaded, within Layout (middle pane), click **P15\_UNIT\_PRICE** and continue to hold the mouse down. Drag the item to the right until it is directly after **P15\_PRODUCT\_NAME**, and a dark yellow box is displayed. Release the mouse to drop the item in the new location.

    ![Enhance form1](images/enhance-form1.png " ")

3. As an alternative to drag-and-drop, you can also reposition items using attributes in the Property Editor.

    In Page Designer, within Layout (or the Rendering tab in the left pane), select **P15\_DEPARTMENT\_ID** and **P15\_CLOTHING\_ID** In the Property Editor (right pane), Under Layout, toggle off **Start New Row**.

    ![Enhance form2](images/enhance-form2.png " ")

4. Select **P15\_COLOR\_ID, P15\_DEPARTMENT\_ID and P15\_CLOTHING\_ID** and update **Name** as following:

5. You now need to Focus on **First item on Page**. In **Page Rendering**(Left Pane), Select **Page 15: Product Details**. Then, In the **Property Editor**, Scroll down to the Navigation Menu and for **Cursor Focus**, select **First item on page**. Then, click **Save**.

   ![Enhance form3](images/enhance-form3.png " ")

6. Now that you have customized the Form. You can reload the **Manage Products** page in the runtime environment. Click on **Edit** to view the Form Page.

   ![Enhanced Form](images/enhanced-form.png " ")

## Summary

You now know how to Create and Customize a Form and then link the Form to an Interactive Report. You may now **proceed to the next lab**.

## What's next

In the next lab, you learn how to make some pages publicly accessible, allowing users to access specific pages in your application without requiring them to log in.

## Acknowledgements

- **Author/Contributors** -  Roopesh Thokala, Senior Product Manager; Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, September 2024
