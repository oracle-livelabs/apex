# Create and Use Page-Level Items and Buttons

## Introduction

In this lab, you create new Page Items and Buttons in the Shopping Cart and Add to Cart pages we created in  the **Lab 2** of **Developing Reports** Workshop.

Customers will be able to:
- Review the items in the shopping cart
- Edit the quantity of the items
- Remove an item
- Clear the shopping cart
- Proceed to checkout

Estimated Time: 20 minutes

### Objectives
In this lab, you will:
* Create new Page Items and Buttons in the Shopping Cart and Add to Cart pages.

### Downloads

- Did you miss out trying the previous labs? Don’t worry! You can download the application from **[here](files/online-shopping-cart-3.sql)** and import it into your workspace. To run the app, please run the steps described in **[Get Started with Oracle APEX](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.


## Task 1: Add Items and Buttons to the Page

1. Navigate to the **App Builder**. Then Click on **Online Shopping Application**.

    ![](./images/click-app-builder.png " ")

    ![](./images/navigate-to-osa.png " ")


2. Now you select **Shopping Cart** under **Page Icons**.

    ![](./images/select-shopping-cart-page.png " ")

3. Drag a **Static Content** region and drop it to the right of the Shopping Cart region to create a second region of content.

    ![](./images/drag-drop-static-content.png " ")

4. In the Property Editor, enter the following:
    - For Title - enter **Order Information**
5. Navigate to the **Order Information** (left pane) region.

6. Right-click the **Order Information** region and click **Create Page Item**.

    ![](./images/create-page-item1.png " ")

7. In the **Property Editor**, Enter the following.
   - For Name, Enter **P16\_CUSTOMER\_EMAIL**
   - For Type, Select **Text Field**.
   - For Label, Enter **Email Address**.
   - Under Validation, for Value Required, Set it to **Off**.

   ![](./images/create-page-item2.png " ")

7. Create four items as follows:

    | Name |  Type  | Label  | Template | Value Required |
    | --- |  --- | --- | --- | --- |
    | P16\_CUSTOMER\_FULLNAME | Text Field | Full Name | Optional - Floating | Off |  
    | P16\_ORDER\_ID | Hidden |  | | |
    | P16\_CUSTOMER\_ID | Hidden |  | | |
    | P16_STORE | Select List | Store | Optional - Floating | Off |

    For **P16_STORE** item, in the list of values section, configure the type as follows:

    - For Type - select **SQL Query**
    - For SQL Query - enter the following SQL Query:

        ```
        <copy>
        select STORES.STORE_NAME as STORE_NAME,
            STORES.STORE_ID as STORE_ID
        from STORES
        </copy>
        ```
    - Set Display Extra Values - to **Off**
    - For Null Display Value - enter **- Select a Store -**

  ![](./images/create-store-item.png " ")

7. Navigate to the **Order Information** (left pane) region.
8. Right-click the **Order Information** region  and click **Create Button**.

     ![](./images/right-click-button.png " ")  

9. Create two buttons as follows:

    | Button Name | Label  | Button Position | Button Template | Hot | Icon |
    | --- |  --- | --- | --- | --- | --- |
    | Proceed | Proceed to Checkout | Create | Text | On | |
    | Clear | Clear Shopping Cart | Change | Text with Icon | Off | fa-cart-empty |

    ![](./images/create-button1.png " ")

     Under Server-side Condition:
    | Button Name | Type  | Item |
    | --- |  --- | --- |
    | Proceed | Item is NOT NULL | SHOPPING\_CART\_ITEMS |
    | Clear | Item is NOT NULL | SHOPPING\_CART\_ITEMS |

     ![](./images/create-button2.png " ")


## Task 2: Add Items and Buttons
In this task, you will create four-page items:
- PRODUCT_ID: To get the product ID
- ACTION: To identify the action (Add / Edit / Delete) made for the customer
- QUANTITY: To permit customers to select the number of items to add or edit in the shopping cart
- SHOPPING\_CART\_ITEMS: To get the number of items (total) in the shopping cart after an action is made

1. Navigate to **Page Finder** and click on **File**. Then in the popup **Page Finder**, Select **Page 17**.

      ![](./images/select-page-17.png " ")

2. Drag a **Static Content** region and drop it to the **Dialog Footer**.

     ![](./images/create-static-content1.png " ")  

3. In the Property Editor, enter the following:
    - For Title - enter **Buttons Bar**
    - For Template - select **Buttons Container**

  ![](./images/create-button.png " ")

4. In the Rendering tree (left pane), navigate to **Buttons Bar** region.
5. Right-click the **Buttons Bar** region and click  **Create Page Item**.

     ![](./images/create-page-item3.png " ")

6. Create four items as follows. In the Property Editor, do the following:

    | Name |  Type  | Label  | Template |
    | ---  |  ---   | ---    | --- |
    | P17_ACTION | Hidden |
    | P17\_PRODUCT\_ID | Hidden |
    | P17_SHOPPING\_CART\_ITEMS | Hidden |
    | P17_QUANTITY | Select List | Quantity | Required |

    For **P17_QUANTITY** item, do the following:
    - Under List of Values section:
        - For Type - select **Static Values**
        - For Static Values - click **Display1, Display2** and enter the following:

            | Display Value |  Return Value  |
            | --- |  --- |
            | 1 | 1 |
            | 2 | 2 |
            | 3 | 3 |
            | 4 | 4 |
            | 5 | 5 |

    - Click **Ok**
    - Set Display Extra Values to **Off**
    - Set Display Null Value to **Off**

  ![](./images/create-quantity-column1.png " ")

7. Navigate to **Buttons Bar** region (left side).
8. Right-click the region and click **Create Button**.
     ![](./images/create-button3.png " ")
9. Create three buttons as follows:

    | Name | Label | Button Position |Button Template | Hot |
    | ---  | ---   | ---             | --- | ---             |
    | Add          | Add to Cart | Next |Text  |  On  |  On |
    | Edit         | Update Quantity| Create   |Text  |  On | |
    | Delete       | Remove from Cart | Edit   |Text  |  Off |

    ![](./images/create-button4.png " ")

     Under Server-side Condition section:
    | Name | Type | Item |
    | ---  | ---   | ---             |
    | Add  | Item is zero | P17_QUANTITY |
    | Edit         | Item is NOT zero | P17_QUANTITY |
    | Delete       | Item is NOT zero | P17_QUANTITY |

      ![](./images/enable-server-side.png " ")    

10. For **Delete** button, apply the following changes:
    - Under Appearance section, click Template Options:
        - For Type - select **Danger**
        - For Style -select **Display as Link**
        - For Spacing Right, select **Large**
    - Click **Ok**.
    - Click **Save**.

    ![](./images/create-danger-button.png " ")

## **Acknowledgments**

- **Author** - Roopesh Thokala, Product Manager
- **Contributors** -
- **Last Updated By/Date** - Roopesh Thokala, Product Manager, April 2022
