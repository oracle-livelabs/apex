# Create the order page - Working with Pages and Regions

## Introduction

In this lab, you open the home page in page designer, navigate through and review the page designer panes. Then, you create a new page that allow customers to view the details of their recent order.
Customers will find the following details of the order:
- Order number
- Order date
- Status
- Total price
- Quantity and price of the items.

<!--
Once you have finished the workshop and updated all the products as described in the steps, your page will look like the following image:
![](./images/orders-page.png " ")

Estimated Time: 15 minutes

Watch the video below for a quick walk through of the lab.

[](youtube:qskWwkxJmcM)
-->
### Objectives
In this lab, you will:
- Navigate and Review the Page Designer panes.
- Create a page to review the items that customer just bought.

### Downloads

- Did you miss out trying the previous labs? Don’t worry! You can download the application from [here](Online-shopping-cart-1.sql) and import it into your workspace. To run the app, please run the steps described in **Hands-on-lab-01** and **Hands-on-Lab-02**.

## Task 1: Navigate and Review the Page Designer panes
Open the home page in page designer, navigate through and review the page designer panes.

1. In the App Builder, run the Online Shopping Application. You are now in the application runtime environment. Use the application menu to navigate to the Home page.
Use the application menu to navigate to the Home page. In the Developer Toolbar, click  **Page n**.

  Note: If you are not on the Home page then the Developer Toolbar will show the current page number, and clicking on Edit Page xx will navigate to that page, instead of Page n.
    ![Click Page 1](images/click-page-1.png " ")

2. The Page Designer is displayed for Page 1. There are three main panes within Page Designer: Left Pane, Central Pane, and Right Pane.
You can change the size of each pane by selecting the dividers and sliding them left or right. Change the size of Grid Layout and Gallery by sliding the divider between them up and down.

    ![Page Designer for page 1](images/navigate-through-page1.png " ")

3. In the Page Designer, you can invoke help on any attribute by clicking **Help** icon on the toolbar. Select a component and then select an attribute in the Property Editor to display help on that attribute.

  For Example, in this screenshot below, you select **Online Shopping Application** in the Rendering tree on the left, and then select **Sequence > Layout** in the Property Editor on the right. The help text for **Sequence** is displayed.

    ![Page Designer](images/navigate-through-page2.png " ")

4. In the page designer, click Create (the **+** icon) and select **Page**.

    ![Click Page](images/create-page2.png " ")

## Task 2: Create a Normal Page - Order Information
Create a Normal Page to review the Order that customer has made.

1. In the Create a Page dialog, Select **Blank Page** and click **Next**.

    ![Select Blank Page](./images/select-blank-page1.png " ")

2. Enter the following:
    - Page Number - enter **15**
    - Name - enter **Order Information**  

  Now, Click on **Navigation**, Enter the following.
    - Breadcrumb - Set to **No**
    - Navigation - Set to **Yes**
  Click **Create Page**.
  ![Click Create Page](./images/create-blank-page12.png " ")


## Task 3: Add a Region
Add a region to the page to display order details.

1. In the new page created, navigate to the **Gallery Menu** at the bottom of the page showing Regions, Items, and Buttons categories and ensure that **Regions** is selected.
2. Drag a **Static Content** region and drop it to the **Body** section.

    ![Create Static region](images/create-static-region1.png " ")

3. In the Property Editor, enter the following:
    - For Title - enter **Thank you for your order!**
    - For Template - select **Content Block**
    - For Template Options - Click on the rectangular area next to the Template Options label to open the Template Options dialog. In the Dialog page, Check **Show Region Icon** and click **Ok**.

    ![Define Template Options](images/create-static-region13.png " ")
    - For Icon, enter **fa-heart**

        ![Define Icon](images/create-static-region14.png " ")

## Task 4: Add Items to the Page
Add a hidden item used to store the order ID without the user's being able to see it.

1. In the Rendering tree (left pane), click on the **Thank you for your order!** region to select it.
2. Right-click the region and click **Create Page Item**.

    ![Create Page Item](images/create-page-item11.png " ")

3. In the property editor, set the name and type as follows:

    | Name |  Type  |
    | --- |  --- |
    | P15_ORDER | Hidden |

    ![Define Page Item](./images/create-page-item12.png " ")    

## Task 5: Add Static Content Region
Add a region to contain Order details and items.

1. In the Rendering tree (left pane), click on **Thank you for your order!** region.
2. Right click the region and click **Create Sub Region**.

    ![Create Sub Region](./images/create-sub-region11.png " ")

3. In the Property Editor, enter the following:
    - For Title - enter the expression (including the period) **Order: &P15_ORDER.**
    - For Type - select **Static Content**  

  ![Define Sub Region](./images/create-sub-region12.png " ")

## Task 6: Add Order Details Region
Add a region to display Order details.

1. In the Rendering tree (left pane), navigate to the **Order: &P15_ORDER.** region.
2. Right click the region and click **Create Sub Region**.

    ![Create Sub Region2](./images/create-sub-region21.png " ")

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
            WHERE  order_id = :P15_ORDER
            </copy>
            ```
      ![Define Sub Region2](./images/create-sub-region22.png " ")

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
      ![Define Attributes](./images/create-sub-region4.png " ")

## Task 7: Add Items Region
Add a region to display items in the order.

1. In the Rendering tree (left pane), navigate to the **Order: &P15_ORDER.** region.
2. Right-click the region and click **Create Sub Region**.

    ![Add Region Items](./images/create-sub-region31.png " ")
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
            AND  order_id = :P15_ORDER
            </copy>
            ```
    ![Define Region](./images/create-sub-region32.png " ")

4. Click **Attributes** and do the following:

    - Under Title section:
        - For Column - select **PRODUCT**    

    - Under Secondary Body:
        - Set Advanced Formatting to **On**
        - For HTML Expression - enter:

            ```
            <copy>
            <b>Quantity: </b> &QUANTITY. <br>
            <b>Unit Price: </b>&UNIT_PRICE.    
            </copy>
            ```

    ![Define Attributes](./images/create-sub-region33.png " ")

    - Under Media section:
        - For Source - select **BLOB Column**   
        - For BLOB Column - select **PRODUCT_IMAGE**  
        - For Position - select **Body**  
        - For Appearance - select **Auto**  
        - For Sizing - select **Fit**

    - Under Card:
        - For Primary Key Column - Select **ITEM**.

    ![Select Primary Key](./images/create-sub-region34.png " ")


5. Click **Save**.


You now know how to add a new page to your existing APEX Application and add regions to define the page's content using the Page Designer. You may now **proceed to the next lab**.

## **Acknowledgments**

- **Author** - Roopesh Thokala, Product Manager
- **Last Updated By/Date** - Roopesh Thokala, Product Manager, March 2022
