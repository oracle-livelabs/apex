# Create the order page - Working with Pages and Regions

## Introduction

In this lab, you will explore the Oracle APEX Page Designer and create a new page in an online shopping application that displays recent order details. This hands-on exercise will guide you through navigating the Page Designer interface, creating and organizing different regions, and adding content to the new page. By the end of this lab, you will be able to allow customers to view their order details, including the order number, date, status, total price, and item-specific information.

Estimated Time: 15 minutes

### Objectives

In this lab, you will:

- Navigate through and review the Page Designer panes.

- Create a blank page to display order information.

- Add regions for static and dynamic content.

- Display order details such as order date, status, total, and item-specific details.

- Add regions to display additional information like frequently purchased products.

- Lock and unlock pages to manage concurrent editing.

## Task 1: Navigate and Review the Page Designer panes

In this task, you will open your APEX application in the Page Designer and familiarize yourself with its key components, including the left, central, and right panes.

1. In the App Builder, run the **Online Shopping Application**.
    You are now in the application runtime environment. Use the developer toolbar to navigate to the Home page.
    In the Developer Toolbar, click **Page 1**.

    **Note**: If you are NOT on the Home page, then the Developer Toolbar will show the current page number, and clicking *Page xx* will navigate to the page xx instead of Page 1.

    ![Click Page 1](images/click-page-11.png " ")

2. The Page Designer is displayed on Page 1. Page Designer has three main panes: the **Left**, **Central**, and **Right** Panes.
    You can change the size of each pane by selecting the dividers and sliding them left or right. Change the size of the grid layout and gallery by sliding the divider between them up and down.

    ![Page Designer for page 1](images/navigate-through-page1.png " ")

3. On the page designer, you can invoke help on any attribute by clicking **Help** icon on the toolbar. Select a component and then select an attribute in the property editor to display help on that attribute.

    For example, in the screenshot below, select **Online Shopping Application** in the rendering tree on the left and then select **Layout > Sequence** in the property editor on the right. Click **Help** and the help text for **Sequence** is displayed.

    ![Page Designer](images/navigate-through-page2.png " ")

4. Click the **+ V** icon (Create) in the page designer and select **Page**.

    ![Click Page](images/create-page2.png " ")

## Task 2: Create a Blank Page for Order Information

You will create a new blank page titled Order Information where you will display customer order details. This page will later include regions and items to display the necessary data.

1. On the **Create a Page** dialog, select **Blank Page**.

    ![Select Blank Page](./images/select-blank-page1.png " ")

2. On **Create Blank Page** dialog, enter/select the following:
    - Under Page Definition:

        - Page Number: **16**

        - Name: **Order Information**

    - Under Navigation:

        - Use Breadcrumb: Toggle **OFF**

        - Use Navigation: Toggle **OFF**

          Click **Create Page**.

    ![Click Create Page](./images/create-blank-page1.png " ")

## Task 3: Add a Region

After creating the page, you'll add a Static Content region to display a thank you message for the customer's order. You'll also learn how to customize the region's appearance with icons and templates.

1. In the newly created page, navigate to the **Gallery Menu** at the bottom, showing Regions, Items, and Buttons categories and ensure that **Regions** tab is selected.

2. Drag a **Static Content** region and drop it in the **Body** section.

    ![Create Static region](images/create-static-region1.png " ")

3. In the Property Editor, enter/select the following:

    - Identification > Title: **Thank you for your order!**

    - Under Appearance:

        - Template: **Content Block**

        - Template Options:

            - Click **Template Options** label to open the Template Options dialog.

            - Enable **Show Region Icon**

            - Click **OK**

        - Icon: **fa-heart**

    ![Define Icon](images/create-static-region3.png " ")

## Task 4: Lock and Unlock Pages

To prevent conflicts during development, this task will teach you how to lock and unlock pages, ensuring that multiple developers can work on the application without interference.

1. To lock a page in Page Designer, click the **Page Unlocked icon** on the Page Designer toolbar.

    ![Define Icon](images/lock-a-page1.png " ")

2. Enter a comment in the **Comment** field. Click **Lock**. When a page is locked, the Page Lock button displays as a **Locked padlock**.

    ![Define Icon](images/lock-a-page2.png " ")

3. To unlock a page in Page Designer, click the **Page Locked icon** button. If another user has locked the page, the Lock button appears in red. You cannot unlock a page locked by another user.

    ![Define Icon](images/unlock-a-page1.png " ")

4. Click the **Page locked by you** button on the Page Designer toolbar.  Click **Unlock**.

    ![Define Icon](images/unlock-a-page.png " ")

## Task 5: Add Items to the Page

You'll add a hidden item to store the order ID, which will be used to query the relevant order details for display on the page.

1. In the Rendering tree (left pane), right-click on **Thank you for your Order!** and select **Create Page Item**.

    ![Create Page Item](images/create-page-item1.png " ")

2. In the Property editor, enter/select the following:

    - Under Identification:

        - Name: **P16_ORDER**

        - Type: **Hidden**

    ![Define Page Item](./images/create-page-item2.png " ")

## Task 6: Add Dynamic Content Region

In this task, you will add a region to display a list of Mostly Purchased Products, using PL/SQL code to dynamically generate content.

1. In the Rendering tree (left pane), right-click on the **Thank you for your Order!** region and select **Create Sub Region**.

    ![Create Sub Region](./images/create-sub-region1.png " ")

2. In the Property editor, enter/select the following:

    - Under Identification:

        - Name: **Top 5 Products**

        - Title: **Top 5 Products**

        - Type: **Dynamic Content**

    - Under Source:

        - Language: **PL/SQL**

        - PL/SQL Function Body returning a CLOB: Copy and paste below code in the code editor:

        ```
        <copy>
        DECLARE
            L_RESULT CLOB := '<h4>Top 5 Products:</h4>';
        BEGIN
            L_RESULT := L_RESULT || '<ul>';
        FOR L_EMP IN (
            SELECT
                PO.PRODUCT_NAME,
                PO.ORDER_COUNT,
                P.UNIT_PRICE,
                P.PRODUCT_IMAGE
        FROM
                 PRODUCT_ORDERS PO
            JOIN PRODUCTS P ON PO.PRODUCT_NAME = P.PRODUCT_NAME
        WHERE
                PO.ORDER_STATUS = 'COMPLETE'
            AND ROWNUM <= 5
        ORDER BY
            PO.ORDER_COUNT DESC
        ) LOOP
        L_RESULT := L_RESULT
                    || '<li><strong>'
                    || APEX_ESCAPE.HTML(L_EMP.PRODUCT_NAME)
                    || '</strong>'
                    || ' - '
                    || APEX_ESCAPE.HTML(L_EMP.UNIT_PRICE)
                    || '</li>';
            END LOOP;
            L_RESULT := L_RESULT || '</ul>';
            RETURN L_RESULT;
        END;
        ```
        </copy>

    ![Define Sub Region](./images/create-sub-region21.png " ")

## Task 7: Add Static Content Region

In this task, you will create a sub-region to display the order number and other static information based on the order ID.

1. In the Rendering tree (left pane), right-click on the **Thank you for your Order!** region and select **Create Sub Region**.

    ![Create Sub Region](./images/create-sub-region11.png " ")

2. In the Property editor, enter/select the following:

    - Title: **Order: &P16_ORDER.** (including the period)

    - Type: **Static Content**

    ![Define Sub Region](./images/create-sub-region2.png " ")

## Task 8: Add Order Details Region

You will add a Cards Region to display the key details of the customer's order, including the order date, status, and total price.

1. In the Rendering tree (left pane), right-click on the **Order: &P16_ORDER.** region and select **Create Sub Region**.

    ![Create Sub Region2](./images/create-sub-region111.png " ")

2. In the Property Editor, enter/select the following:

    - Under Identification:

        - Title: **Order Details**

        - Type: **Cards**

    - Under Source:

        - Type: **SQL Query**

        - SQL Query: Enter the following SQL Query:

            ```
            <copy>
            SELECT
                O.ORDER_ID,
                O.ORDER_DATETIME,
                O.CUSTOMER_ID,
                O.ORDER_STATUS,
                O.STORE_ID,
          (
            SELECT
                SUM(UNIT_PRICE * QUANTITY)
            FROM
                ORDER_ITEMS I
            WHERE
                I.ORDER_ID = O.ORDER_ID
          ) TOTAL
            FROM
                ORDERS O
            WHERE
                ORDER_ID = :P16_ORDER
            </copy>
            ```

        - Page Items to Submit: **P16_ORDER**

    ![Define Sub Region2](./images/create-sub-region12.png " ")

3. Click **Attributes** and enter/select the following:

    - Under Secondary Body:

        - Advanced Formatting: Toggle **On**

        - HTML Expression: Copy and paste the below HTML expression in the code editor:

            ```
            <copy>
            <b> Order Placed:</b> &ORDER_DATETIME. <br>
            <b> Status: </b>&ORDER_STATUS. <br>
            <b> Total: </b>&TOTAL.
            </copy>
            ```

    ![Define Attributes](./images/create-sub-region23.png " ")

## Task 9: Add Items Region

Lastly, you'll create a region to show the individual items in the order, including their quantity, unit price, and subtotal, using an SQL query to retrieve the data.

1. In the Rendering tree (left pane), right-click on **Order: &P16_ORDER.** region and select **Create Sub Region**.

    ![Add Region Items](./images/create-sub-region211.png " ")

2. In the Property Editor, enter/select the following:

    - Under Identification:

        - Title: **Items**

        - Type: **Cards**

    - Under Source:

        - Type: **SQL Query**

        - SQL Query: Enter the following SQL Query:

            ```
            <copy>
            SELECT
                 O.LINE_ITEM_ID                ITEM,
                 P.PRODUCT_NAME                PRODUCT,
                 O.UNIT_PRICE,
                 O.QUANTITY,
               ( O.UNIT_PRICE * O.QUANTITY ) SUBTOTAL,
                 P.PRODUCT_IMAGE
            FROM
                ORDER_ITEMS O,
                PRODUCTS    P
            WHERE
                P.PRODUCT_ID = O.PRODUCT_ID
                AND ORDER_ID = :P16_ORDER
            </copy>
            ```

        - Page Items to Submit: **P16_ORDER**

    ![Define Region](./images/create-sub-region22.png " ")

3. Click **Attributes** and enter/select the following:

    - Title > Column: **PRODUCT**

    - Under Secondary Body:

        - Advanced Formatting: Toggle **ON**

        - HTML Expression: Copy and paste the below HTML expression in the code editor:

            ```
            <copy>
            <b>Quantity: </b> &QUANTITY. <br>
            <b>Unit Price: </b>&UNIT_PRICE.
            </copy>
            ```

    ![Define Attributes](./images/create-sub-region23.png " ")

    - Under Media:

        - Source: **BLOB Column**

        - BLOB Column: **PRODUCT_IMAGE**

        - Position: **Body**

        - Appearance: **Auto**

        - Sizing: **Fit**

    - Card > Primary Key Column 1: **ITEM**

    ![Select Primary Key](./images/create-sub-region24.png " ")

4. Click **Save and Run**.

    ![Select Primary Key](./images/save-run.png " ")

## Summary

You now know how to add a new page to your existing APEX Application and add regions to define the page's content using the Page Designer. You may now **proceed to the next workshop**.

## What's Next?

In the next workshop, you learn how to create and develop various reports, including Interactive Grids, Smart Filters, Cards, and Faceted Searches.

## Acknowledgements

- **Author** - Roopesh Thokala, Senior Product Manager; Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, September 2024
