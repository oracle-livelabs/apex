# Create My Books Page

## Introduction
In this lab, you will create a package with procedures and functions that collectively manage the process of adding, removing, and processing orders and wishlist items within the database application. Additionally, you will learn to create application items, processes, and computations. Moreover, you will create processes to invoke these procedures and functions.

Estimated Time: 5 minutes

### Objectives
In this lab, you will:

- Create an Order Information Page.

## Task 1: List My Books on Navigation Bar

1. Navigate to **Shared Components**.

    ![Shared Components](images/sc-3.png " ")

2. Under **Navigation and Search**, Click **Navigation Bar List**.

    ![Navigation Bar List](images/nav-bar-list1.png " ")

3. Click **Navigation Bar**.

    ![Navigation Bar List](images/nav-bar1.png " ")

4. Click **Create Entry**.

    ![Navigation Bar List](images/create-entry1.png " ")

5. Enter/select the following:

    - Under Entry:

       - Sequence: **3**

       - Image/Class: **fa-book**

       - List Entry Label: **My Books**

    - Target > Page: **20**

    Click **Create List Entry**.

    ![Navigation Bar List](images/create-list-entry1.png " ")

## Task 2: Createt My Books page

1. On Page Designer toolbar, Navigate to (+ v) and Select **Page**.

    ![close dialog](images/create-page3.png " ")

2. Select **Blank Page**.

    ![close dialog](images/order-info-blank.png " ")

3. In Create Blank Page dialog, enter/select the following:

    - Under Identification:

        - Page Number: **20**

        - Name: **My Books**

    - Under Navigation:

        - Use Breadcrumb: **Toggle Off**

        - Use Navigation: **Toggle Off**

    Click **Create Page**.

   ![close dialog](images/my-books-page.png " ")

4. In the left pane, Right-click **Body** and Select **Create Region**.

    ![close dialog](images/my-books-region.png " ")

5. In the Property Editor, enter/select the following:

    - Under Identification:

        - Title: **My books**

        - Type: **Cards**

    - Under Source:

        - Type: **QL Query**

        - SQL Query: Copy and Paste the below code into the code editor:

        ```
        <copy>
        select  distinct
         oi.book_id as book_id,
         bi.book_image as book_image,
         bi.buy_links as buy_links,
         bi.title as title,
         Round(oi.price,2) as price,
         bi.description as description,
         bi.discount,
         sum(oi.quantity) OVER (PARTITION BY oi.book_id) AS quantity,
         Round((oi.price * SUM(oi.quantity) OVER (PARTITION BY oi.book_id)),2) AS total_price,
         Round((oi.price *((100- oi.discount)/100) * SUM(oi.quantity) OVER (PARTITION BY oi.book_id)),2) AS new_total_price
       from obs_order_items oi, obs_books bi, obs_orders o
       where o.order_id = oi.order_id and o.user_id = :USER_ID
       and oi.book_id(+) = bi.book_id;
       </copy>
       ```

    ![close dialog](images/my-books-details.png " ")

       - **Order By Item**: Enter/select the following:

       | Clause     |  Key   | Display |
       | ---------- |  ------ | ------ |
       | "TITLE"asc | TITLE |  Title |
       | "TOTAL_PRICE"asc |TOTAL_PRICE | Price |
       | "QUANTITY"asc  | QUANTITY | Quantity |

       Click **OK**.

    ![close dialog](images/order-by-item3.png " ")   

6. In the Property Editor, navigate to **Attributes** and enter/ select the following:

    - Appearance > Layout: **Float**

    - Card > Primary Key Column 1: **BOOK_ID**

    - Title > Column: **TITLE**

    - Under Secondary Body:

        - Advanced Formatting: **Toggle On**

        - HTML Expression: Copy and Paste the below HTML code:
        ```
       <copy>
       <b>Purchased total : </b> <strike>&TOTAL_PRICE. Rs </strike> &NEW_TOTAL_PRICE. Rs
       <br>
       <b>Quantity is: </b>&QUANTITY.
       </copy>
       ```
    - Under Media:

        - Advanced Formatting: **Toggle On**

        - HTML Expression: Copy and Paste the below HTML code:
           ```
           <copy>
           <a href="&BUY_LINKS." target="_blank">
           <img src="&BOOK_IMAGE." width="160rem" height="180   rem" alt="Error in the image">
          </copy>
          ```

     ![close dialog](images/my-books-att.png " ")  

     ![close dialog](images/my-books-save.png " ")        

7. **Save and Run** the Application.

    ![close dialog](images/my-books-review.png " ")  
