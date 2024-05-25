# Create and Manage a Shopping Cart

## Introduction
In this lab, you learn to create and manage a shopping cart within an Oracle APEX application. The lab includes adding navigation bar entry, creating a shopping cart page, implementing various interactive components, and integrating backend processes to handle cart operations and checkout procedures. This exercise will demonstrate the comprehensive capabilities of APEX for building dynamic web applications with a strong emphasis on database interaction and user interface design.

Estimated Time: 15 minutes

### Objectives
In this lab, you will:

- Create a Navigation Bar Entry
- Build a Shopping Cart Page
- Create Application processes
- Create Application Computations

## Task 1: Create a Navigation Bar Entry
In this task, you add an entry to the navigation bar that displays the shopping cart icon and item count dynamically.

1. Navigate to **Shared Components**.

    ![close dialog](images/sc-9.png " ")

2. Under **Navigation and Search**, select **Navigation Bar List**.

   ![close dialog](images/nav-bar-list.png " ")

3. Click **Navigation Bar**.

   ![close dialog](images/nav-bar.png " ")

4. Click **Create Entry**.

   ![close dialog](images/nav-create-entry.png " ")

5. Enter the following:

    - Under Entry:

        - Sequence: **4**

        - Image/Class: **&SHOPPING_CART_ICON.**

        - List Entry Label: **Shopping Cart**

    - Under Target:

        - Page: **17**

        - Clear Cache: **17**

    - Under List Entry:

        - Badge Value: **&SHOPPING_CART_ITEMS.**

        - List Item CSS Classes: **js-shopping-cart-item**

    Click **Create List Entry**.

    ![close dialog](images/nav-create-list-entry.png " ")

    ![close dialog](images/nav-create-list-entry1.png " ")

## Task 2: Build a Shopping Cart Page
In this task, you develop a new page in the application to display the shopping cart with book details, quantities, and prices. Additionally, you implement SQL queries to fetch cart data and display it in a user-friendly format.

1. Navigate to **Application ID**.

    ![close dialog](images/app-id9.png " ")

2. Click **Create Page**.

    ![close dialog](images/create-page9.png " ")

3. Select **Blank Page**.

    ![close dialog](images/blank-page9.png " ")

4. In Create Blank Page dialog, enter the following:

    - Under Identification:

       - Name: **Shopping Cart**

       - Page Number: **17**

    - Under Navigation:

       - Use Breadcrumb: **Toggle Off**

       - Use Navigation: **Toggle Off**

     Click **Create Page**.

     ![close dialog](images/create-blank-page9.png " ")

5. In the left pane, Right-click **Body** and select **Create Region**.

     ![close dialog](images/create-region17.png " ")

6. In the Property Editor, enter the following:

    - Under Identification:

        - Title: **Shopping Cart**

        - Type: **Content Row**

    - Under Source:

        - Type: **SQL Query**

        - SQL Query: Copy and Paste the below code into the code editor:

        ```
        <copy>
        SELECT
        b.book_id,
        b.title,
        b.buy_links,
        b.price,
        b.description,
        b.discount,
        b.category,
        b.author,
        b.book_image,
        a.n002 as quantity,
        b.price*((100 - b.discount)/100) as new_price,
        ROUND(b.price*a.n002,2) as total_price,
        ROUND(b.price*((100 - b.discount)/100)*a.n002, 2) as new_total_price
        FROM  apex_collections a, obs_books b
        WHERE collection_name = 'BOOKS'
        AND b.book_id = a.n001
        </copy>
        ```

     ![close dialog](images/create-region-details.png " ")

  7. In the right pane, select **Attributes** and enter the following:

    - Under Settings

          - Title: **&TITLE.**

          - Description: Copy and Paste the below code:
          ```
          <copy>
          &DESCRIPTION.
          </br></br>
          <b>Quantity:</b> &QUANTITY. </br>
          <b>Price:</b> <strike> ₹&TOTAL_PRICE.</strike> ₹&NEW_TOTAL_PRICE.
          <span style="color: green;">&DISCOUNT.% Off</span>
          </copy>
          ```

         - Display Avatar: **Toggle On**

    - Under Avatar:

        - Type: **Image**

        - Image: **&BOOK_IMAGE.**

        - Shape: **No shape**

        - Size: **Extra Extra Large**

    - Messages > When No Data Found: **Your shopping cart is empty!**

    ![close dialog](images/create-region-att.png " ")

    ![close dialog](images/create-region-att1.png " ")

8. In Page Rendering, under **Shopping Cart** region, Right-click **Actions** and select **Create Actions**.

    ![close dialog](images/create-action9.png " ")

9. In the Property Editor, enter the following:

    - Under Identification:

         - Position: **Primary Actions**

         - Template: **Button**

         - Label: **Remove**

    - Under Link:

        - Type: **Redirect to URL**

        - Targe: **#action$remove-cart?id=&BOOK_ID.**

        Click **OK**.

    ![close dialog](images/primary-action.png " ")

10. Right-click **Shopping Cart** region and select **Create Page Item**.

    ![close dialog](images/create-page-item9.png " ")

11. Create the following page item:

    | Name            |  Type   | Value Protected |
    | --------------- |  ------ | --------------- |
    | P17\_BOOK\_ID | Hidden | Toggle Off |


    ![close dialog](images/book-id.png " ")

12. Select **Page 17: Shopping Cart** and enter the following:

    -  Under Execute when Page loads: Copy and Paste the below code:

    ```
    <copy>
    apex.actions.add([{
    name: "remove-cart",
    action: (event, element, args) => {
        apex.page.submit({
            request: "REMOVE_FROM_CART",
            set: {
                "P17_BOOK_ID": args.id
            },
            showWait: true,
        });
      }
    }]);
    </copy>
    ```

    ![close dialog](images/page-load.png " ")

13. Right-click **Body** and Select **Create Region**.

    ![close dialog](images/create-region9.png " ")

14. For Name: **Order Information**

    ![close dialog](images/order-info.png " ")

15. Right-click **Order Information** and select **Create Page Item**.

    ![close dialog](images/order-page-item.png " ")

16. Create the following two page items:

    | Name            |  Type   | Label |
    | --------------- |  ------ | --------------- |
    | P17\_ORDER\_ID | Hidden |  |
    | P17\_NO\_OF\_BOOKS |Display Only | Number of Books |
    | P17\_TOTAL | Display Only | Grand Total|

    ![close dialog](images/order-id.png " ")

    ![close dialog](images/no-of-books.png " ")

## Task 3: Implement Page Interactions
In this task, you create buttons for removing items from the cart and proceeding to checkout. Next, you add computations to dynamically calculate the total number of books and the grand total price. Lastle, you set up processes to handle cart operations, such as removing items and clearing the cart.

1. Right-click **P17\_NO\_OF\_BOOKS** and select **Create Computation**.

    ![close dialog](images/create-comp9.png " ")

2. In the Property Editor, enter the following:

    - Under Computation:

        - Type: **SQL Query ( returning single value)**

        - SQL Query: Copy and Paste the below code:

          ```
          <copy>
          select sum(a.n002)
          from apex_collections a, obs_books b
          where collection_name = 'BOOKS' and b.book_id(+) = a.n001
          </copy>
          ```

        - Settings > Send On Page Submit: **Toggle off**

          ![close dialog](images/comp-no-of-books.png " ")

3.  Right-click **P17\_TOTAL** and select **Create Computation**.

4. In the Property Editor, enter/select the following:

    - Under Computation:

        - Type: **SQL Query ( returning single value)**

        - SQL Query: Copy and Paste the below code:

          ```
          <copy>
          select sum(a.n002)
          from apex_collections a, obs_books b
          where collection_name = 'BOOKS' and b.book_id(+) = a.n001
          </copy>
          ```

          ![close dialog](images/comp-total.png " ")

5. Right-click **Order Information** and select **Create Button**.

    ![close dialog](images/create-btn9.png " ")

6. In the Property Editor, enter/select the following:

     - Under Identification:

          - Button Name: **Clear**

          - Label: **Clear Shopping Cart**

     - Layout > Position: **Change**

     - Under Appearance:

          - Button Template: **Text with Icon**

          - Template Options: Click **Template Options** 

               - Size: **Small**

               - Type: **Danger**

               - Style: **Remove UI Decoration**

                   Click **OK**

          - Icon: **fa-cart-empty**

    ![close dialog](images/clear-btn.png " ")

7. Right-click **Order Information** and select **Create Button**.

8. In the Property Editor, enter/select the following:

     - Under Identification:

          - Button Name: **Proceed**

          - Label: **Proceed to Purchase**

     - Layout > Position: **Create**

     - Under Appearance:

          - Hot: **Toggle On**

          - Template Options: Click **Template Options** 

               - Size: **Small**

               - Type: **Success**

                   Click **OK**

      - Under Sever-side Condition:

           - Type: **Item is NOT NULL**

           - Item: **SHOPPING\_CART\_ITEMS**

      ![close dialog](images/proceed-btn.png " ")  

      ![close dialog](images/proceed-btn1.png " ")  

9. Navigate to **Processing** tab, Right-click **Processing** and select **Create Process**.

    ![close dialog](images/create-process9.png " ")  

10. In the Property Editor, enter the following:

     - Under Identification: 

         - Name: **Remove from Cart**

         - Type: **Invoke API**  

     - Under Settings: 

         - Package Name: **OBS\_MANAGE\_ORDERS**

         - Procedure/Function Name: **REMOVE\_BOOK**

     - Under Server-side Condition:

         - Type: **Request=Value**

         - Value: **REMOVE\_FROM\_CART**

      ![close dialog](images/remove-from-cart-process.png " ")     

11. Under **Remove from Cart** process, expand **Parameters** and select **p\_book**.

     - p\_book > Item: **P17\_BOOK\_ID**

    ![close dialog](images/remove-p-book.png " ")

12. Right-click **Processing** and select **Create Process**.

    ![close dialog](images/create-process9.png " ")  

13. In the Property Editor, enter the following:

     - Under Identification: 

         - Name: **Checkout**

         - Type: **Invoke API**  

     - Under Settings: 

         - Package Name: **OBS\_MANAGE\_ORDERS**

         - Procedure/Function Name: **CREATE\_ORDER**

     - Success Message > Success Message: **Order successfully created: &P17\_ORDER\_ID.**

     - Server-side Condition > When Button Pressed: **Proceed**

    ![close dialog](images/checkout-param.png " ")

14. Under **Checkout** process, expand **Parameters** and update the following:

      | Parameter       |  Type   | Item |
      | --------------- |  ------ | --------------- |
      | p\_user\_id | Item | USER\_ID |
      | p\_order\_id | Item | P17\_ORDER\_ID |

    ![close dialog](images/user-id.png " ")

## Task 4: Integrate Backend Processes  
In this task, you create page processes to invoke PL/SQL procedures to manage cart actions and handle order creation and use server-side conditions and parameters to ensure smooth and secure cart management.

1. Right-click **Processing** and select **Create Process**.

    ![close dialog](images/create-process9.png " ")

2. In the Property Editor, enter the following:

     - Under Identification: 

         - Name: **Clear Shopping Cart**

         - Type: **Invoke API**  

     - Under Settings: 

         - Package Name: **OBS\_MANAGE\_ORDERS**

         - Procedure/Function Name: **CLEAR\_CART**

     - Server-side Condition > When Button Pressed: **Clear**

     ![close dialog](images/clear-sho-cart-process.png " ")

3. Right-click **Processing** and select **Create Branch**.

     ![close dialog](images/create-branch9.png " ")

4. In the Property Editor, enter the following:

     - Identification > Name: **Go To Books**

     - Behavior > Target: Click **No Defined Link**
          - Page: 10

          - Set Items > Name: **P17\_ORDER\_ID** and Value: **&P17\_ORDER\_ID.**

          - Clear Cache: **10**

          Click **OK**.

     - Server-side Condition > When Button Pressed: **Clear**

     ![close dialog](images/go-to-books.png " ")

5. Right-click **Processing** and select **Create Branch**.

     ![close dialog](images/create-branch9.png " ")

6. In the Property Editor, enter the following:

     - Identification > Name: **Go To Orders**

     - Behavior > Target: Click **No Defined Link**
          - Page: 16

          - Set Items > Name: **P17\_ORDER\_ID** and Value: **&P17\_ORDER\_ID.**

          - Clear Cache: **16**

          Click **OK**.

     - Server-side Condition > When Button Pressed: **Proceed**

     ![close dialog](images/go-to-orders.png " ")

7. Click **Save and Run**.

## Task 3: Run an Application

1. Navigate to **Search Books** and Select any book of your choice to buy.

    ![close dialog](images/search-books.png " ")

2. Click **Add to Cart**.

    ![close dialog](images/click-add-to-cart.png " ")

3. On the Navigation bar list, select **Shopping Cart**.

    ![close dialog](images/click-shopping-cart.png " ")

5. Now, you see the shopping cart page.

    ![close dialog](images/view-shopping-cart.png " ")

## Summary
In this lab, you successfully integrated a shopping cart feature into an Oracle APEX application. You created a navigation bar entry for the shopping cart, developed a detailed shopping cart page, and implemented interactive elements for managing cart items. Additionally, you set up backend processes to handle cart operations and order creation, demonstrating how to leverage APEX's capabilities for building dynamic, database-driven web applications. This hands-on experience enhanced your skills in PL/SQL, SQL queries, and APEX page design and process integration.

You are now ready to move on to the next lab!

## Acknowledgements

- **Author**: Ankita Beri, Product Manager
- **Last Updated By/Date**: Ankita Beri, Product Manager, May 2024
