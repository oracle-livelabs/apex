# Create the order page - Working with Pages and Regions

## Introduction

In this lab, you open the home page in Page Designer, navigate through and review the page Designer panes. Then, you create a new page allowing customers to view their recent order details.
Customers will be able to view the following details of the Order:
- Order number
- Order date
- Status
- Total price
- Quantity and price of the items.  

Estimated Time: 15 minutes


### Objectives
In this lab, you will:
- Navigate and Review the Page Designer panes.
- Create a page to review the items that the customer just bought.

### Downloads
Stuck or Missed out on completing the previous labs? Don't worry! You can download the application from **[here](fhttps://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/data-management-library-files/apex-23-2-object-storage-files/hol3-lab1.sql)** and import it into your workspace. To run the app, please run the steps described in the following workshops:
1. **[Get Started with Oracle APEX](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)**
2. **[Using SQL Workshop](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)**

## Task 1: Navigate and Review the Page Designer panes

1. In the App Builder, run the **Online Shopping Application**.
    You are now in the application runtime environment. Use the developer toolbar to navigate to the Home page.
    In the Developer Toolbar, click **Page 1**.

  **Note**: If you are NOT on the Home page, then the Developer Toolbar will show the current page number, and clicking *Page xx* will navigate to the page xx instead of Page 1.
    ![Click Page 1](images/click-page-1.png " ")

2. The Page Designer is displayed on Page 1. Page Designer has three main panes: the **Left**, **Central**, and **Right** Panes.
You can change the size of each pane by selecting the dividers and sliding them left or right. Change the size of the Grid Layout and Gallery by sliding the divider between them up and down.

    ![Page Designer for page 1](images/navigate-through-page1.png " ")

3. In the Page Designer, you can invoke help on any attribute by clicking **Help** Icon on the toolbar. Select a component and then select an attribute in the Property Editor to display help on that attribute.

  For Example, in the screenshot below, select **Online Shopping Application** in the Rendering tree on the left and then select **Sequence > Layout** in the Property Editor on the right. Click **Help** and the help text for **Sequence** is displayed.

    ![Page Designer](images/navigate-through-page2.png " ")

4. Click the **+** icon (Create) in the page designer and select **Page**.

    ![Click Page](images/create-page2.png " ")

## Task 2: Create a Blank Page for Order Information

1. In the Create a Page dialog, select **Blank Page**.

    ![Select Blank Page](./images/select-blank-page1.png " ")

2. Enter the following:
    - Page Number: **15**
    - Name: **Order Information**  

    - Under Navigation:
        - Use Breadcrumb: Toggle the button to **OFF**
        - Use Navigation: Toggle the button to **ON**
  Click **Create Page**.
  ![Click Create Page](./images/create-blank-page1.png " ")


## Task 3: Add a Region
Add a region to the page to display order details.

1. In the newly created page, navigate to the **Gallery Menu** at the bottom, showing Regions, Items, and Buttons categories and ensure that **Regions** tab is selected.
2. Drag a **Static Content** region and drop it in the **Body** section.

    ![Create Static region](images/create-static-region1.png " ")

3. In the Property Editor, enter/select the following:
    - Title: **Thank you for your order!**
    - Template: **Content Block**
    - Template Options:
        - Click **Template Options** label to open the Template Options dialog.
        - Check **Show Region Icon**
        - Click **OK**
        ![Define Template Options](images/create-static-region2.png " ")
    - Icon: **fa-heart**

        ![Define Icon](images/create-static-region3.png " ")

## Task 4: Lock and Unlock Pages
Prevent conflicts during application development by locking pages in your application. By locking a page, you prevent other developers from editing it. You can lock a page on the Application home page, Page Locks page, and in Page Designer.

The Page Lock button on the Page Designer toolbar indicates whether a page is locked. The Page Lock button displays as an unlocked padlock if the page is unlocked.

1. To lock a page in Page Designer, click the **Page Unlocked icon** on the Page Designer toolbar.

  ![Define Icon](images/lock-a-page1.png " ")

2. Enter a comment in the **Comment** field. Click **Lock**. When a page is locked, the Page Lock button displays as a **Locked padlock**.

  ![Define Icon](images/lock-a-page2.png " ")

3. To unlock a page in Page Designer, click the **Page Locked icon** button. If another user has locked the page, the Lock button appears in red. You cannot unlock a page locked by another user.

  ![Define Icon](images/unlock-a-page1.png " ")

4. Click the **Page locked by you** button on the Page Designer toolbar.  Click **Unlock**.

  ![Define Icon](images/unlock-a-page2.png " ")



## Task 5: Add Items to the Page
Add a hidden item used to store the order ID that is not visible to the end user.

1. In the Rendering tree (left pane), right-click on **Thank you for your Order!** and select **Create Page Item**.

    ![Create Page Item](images/create-page-item1.png " ")

2. In the Property Editor, enter/select the following:
    - Name: **P15_ORDER**
    - Type: **Hidden**

    ![Define Page Item](./images/create-page-item2.png " ")    

## Task 6: Add Static Content Region
Add a region to contain Order details and items.

1. In the Rendering tree (left pane), right-click on the **Thank you for your Order!** region and select **Create Sub Region**.

    ![Create Sub Region](./images/create-sub-region1.png " ")

2. In the Property Editor, enter/select the following:
    - Title: **Order: &P15_ORDER.** (including the period)
    - Type: **Static Content**  

  ![Define Sub Region](./images/create-sub-region2.png " ")

## Task 7: Add Order Details Region
Add a region to display Order details.

1. In the Rendering tree (left pane), right-click on the **Order: &P15_ORDER.** region and select **Create Sub Region**.

    ![Create Sub Region2](./images/create-sub-region11.png " ")

2. In the Property Editor, enter/select the following:
    - Title: **Order Details**
    - Type: **Cards**
    - Under Source:
        - Type: **SQL Query**
        - SQL Query: Enter the following SQL Query:

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
            WHERE  order_id = :P15_ORDER
            </copy>
            ```
      ![Define Sub Region2](./images/create-sub-region12.png " ")

3. Click **Attributes**.

    -  Search for the **Secondary Body** in the filter and enter/select the following:
        - Advanced Formatting: Toggle the button to **On**
        - HTML Expression:

            ```
            <copy>
            <b> Order Placed:</b> &ORDER_DATETIME. <br>
            <b> Status: </b>&ORDER_STATUS. <br>
            <b> Total: </b>&TOTAL.    
            </copy>
            ```
      ![Define Attributes](./images/create-sub-region23.png " ")

## Task 8: Add Items Region
Add a region to display items in the Order.

1. In the Rendering tree (left pane), right-click on **Order: &P15_ORDER.** region and select **Create Sub Region**.

    ![Add Region Items](./images/create-sub-region21.png " ")

2. In the Property Editor, enter/select the following:
    - Title: **Items**
    - Type: **Cards**
    - Under Source:
        - Type: **SQL Query**
        - SQL Query: Enter the following SQL Query:

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
            AND  order_id = :P15_ORDER
            </copy>
            ```
    ![Define Region](./images/create-sub-region22.png " ")

3. Click **Attributes** and edit/select the following:

    - Title > Column: **PRODUCT**    

    - Under Secondary Body:
        - Advanced Formatting: Toggle the button to **ON**
        - HTML Expression:

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

4. Click **Save**.

## Summary
You now know how to add a new page to your existing APEX Application and add regions to define the page's content using the Page Designer. You may now **proceed to the next workshop**.

## What's Next?
In the next workshop, you learn how to create and develop various reports, including Interactive Grids, Smart Filters, Cards, and Faceted Searches.

## Acknowledgements
- **Author** - Roopesh Thokala, Senior Product Manager
- **Contributor** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Roopesh Thokala, Senior Product Manager, January 2024
