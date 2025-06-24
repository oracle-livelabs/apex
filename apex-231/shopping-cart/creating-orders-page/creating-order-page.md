# Create the order page

## Introduction

In this lab, you will create a new page that will allow customers to view the details of their recent order.
Customers will find the following details of the order:
- Order number
- Order date
- Status
- Total price
- Quantity and price of the items.

Once you have finished the workshop and updated all the products as described in the steps, your page will look like the following image:
![Order page details in the completed application](./images/orders-page.png " ")

Estimated Time: 15 minutes
<!--
Watch the video below for a quick walk through of the lab.

[](youtube:qskWwkxJmcM)
-->

Watch the video below for a quick walk-through of the lab.
[Create the Order Page](videohub:1_w9hncfg8)

### Objectives
In this lab, you will:
- Create a page to review the items that the customer recently bought.

## Task 1: Create a Normal Page - Order Information
Create a Normal Page to review the Order that customer has made.

1. In the **App Builder**, navigate to the *ACME Shop application* and click **Create Page**.

    ![App Builder home page](./images/create-page.png " ")

2. Select **Blank Page** and click **Next**.

    ![create page wizard](./images/create-blank-page11.png " ")

3. Enter the following and click **Next**.

    - Page Number - enter **16**

    - Name - enter **Order Information**

    - Under Navigation, deselect **Breadcrumb** and **Navigation**.

4. Click **Create Page**.

    ![create page wizard](./images/create-order-info.png " ")

## Task 2: Add a Region

Add a region to the page to display order details.

1. In the newly created page, navigate to the **Gallery Menu** at the bottom of the page showing Regions, Items, and Buttons categories and ensure that **Regions** is selected.

2. Drag a **Static Content** region and drop it to the Body section.

    ![Gallery menu in Page Designer](./images/create-static.png " ")

3. In the Property Editor, enter the following:

    - For Title - enter **Thank you for your order!**

    - For Template - select **Content Block**

    - For Template Options - check **Show Region Icon** and click **Ok**

        ![Property Editor](./images/template-options.png " ")

    - For Icon, enter **fa-heart**

## Task 3: Add Items to the Page
Add a hidden item to store the order ID without the user being able to see it.

1. In the Rendering tree (left pane), navigate to the **Thank you for your order!** region.

2. Right-click the region and click **Create Page Item**.

    ![Rendering Tree](./images/create-item.png " ")

3. In the property editor, set the name and type as follows:

    | Name |  Type  |
    | --- |  --- |
    | P16_ORDER | Hidden |
    {: title="Page Item values"}

    ![Property Editor](./images/order-item.png " ")    

## Task 4: Add Static Content Region
Add a region to contain Order details and items.

1. In the Rendering tree (left pane), navigate to the **Thank you for your order!** region.

2. Right click the region and click **Create Sub Region**.

    ![Rendering Tree](./images/create-sub-region.png " ")

3. In the Property Editor, enter the following:

    - For Title - enter the expression (including the period) **Order: &P16_ORDER.**

    - For Type - select **Static Content**

    ![Property editor](./images/sub-region-fields.png " ")

## Task 5: Add Order Details Region
Add a region to display Order details.

1. In the Rendering tree (left pane), navigate to the **Order: &P16_ORDER.** region.

2. Right click the region and click **Create Sub Region**.
    ![Rendering tree (left pane) of Page designer](./images/create-sub-region2.png " ")

3. In the Property Editor, enter the following:

    - For Title - enter **Order Details**
    - For Type - select **Cards**
    - Under Source section:
        - For Type - select **SQL Query**
        - For SQL Query - enter the following SQL Query:

            ```
            <copy>
            SELECT o.order_id,
                o.order_datetime,
                o.customer_id,
                o.order_status,
                o.store_id,
                (SELECT Sum(unit_price * quantity)
                    FROM   order_items i
                    WHERE  i.order_id = o.order_id) total
            FROM   orders o
            WHERE  order_id = :P16_ORDER
            </copy>
            ```
        ![Property editor](./images/sub-region-fields2.png " ")    

4. Click **Attributes**.

    -  Search for Secondary Body in the filter and do the following:
        - Set Advanced Formatting to **On**
        - For HTML Expression - enter:

            ```
            <copy>
            <b> Order Placed:</b> &ORDER_DATETIME. <br>
            <b> Status: </b>&ORDER_STATUS. <br>
            <b> Total: </b>&TOTAL.    
            </copy>
            ```

          ![Attributes tab of Property editor](./images/attributes.png " ")

## Task 6: Add Items Region
Add a region to display items in the order.

1. In the Rendering tree (left pane), navigate to the **Order: &P16_ORDER.** region.

2. Right-click the region and click **Create Sub Region**.

    ![Rendering Tree](./images/create-sub-region3.png " ")

3. In the Property Editor, enter the following:

    - For Title - enter **Items**

    - For Type - select **Cards**

    - Under Source section:

        - For Type - select **SQL Query**

        - For SQL Query - enter the following SQL Query:

            ```
            <copy>
            SELECT  o.line_item_id                Item,
                    p.product_name                Product,
                    o.unit_price,
                    o.quantity,
                    ( o.unit_price * o.quantity ) Subtotal,
                    p.product_image
            FROM   order_items o,
                products p
            WHERE  p.product_id = o.product_id
            AND  order_id = :P16_ORDER
            </copy>
            ```
          ![Property Editor](./images/sub-region-fields3.png " ")
4. Click **Attributes** and do the following:

    - Under Title section:

        - For Column - select **PRODUCT**    

         ![Attributes tab in the property editor](./images/attributes2.png " ")

    - Under Secondary Body:

        - Set Advanced Formatting to **On**

        - For HTML Expression - enter:

            ```
            <copy>
            <b>Quantity: </b> &QUANTITY. <br>
            <b>Unit Price: </b>&UNIT_PRICE.    
            </copy>
            ```

    - Under Media section:
        - For Source - select **BLOB Column**   
        - For BLOB Column - select **PRODUCT_IMAGE**  
        - For Position - select **Body**  
        - For Appearance - select **Auto**  
        - For Sizing - select **Fit**   

        ![Attributes tab in the property editor](./images/attributes3.png " ")

    - Under Card:
        - For Primary Key Column 1 - select **ITEM**    

        ![Attributes tab in the property editor](./images/attributes4.png " ")

5. Click **Save**.


You now know how to add a new page to your existing APEX Application and add regions to define the page's content using the Page Designer. You may now **proceed to the next lab**.

## Acknowledgments

- **Author** - Apoorva Srinivas, Senior Product Manager; Mónica Godoy, Principal Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, May 2023
