# Enhance the Home Page

## Introduction

During this lab, you'll refine the faceted search page and its card section. Additionally, you'll discover how to integrate a Global search page item into the faceted search page for book searches. You'll also gain expertise in enabling sorting functionality on the search page. Lastly, you'll explore creating a hyperlink that redirects users to an Amazon page.

Estimated Time: 25 minutes

### Objectives

In this lab, you will:

- Improve Faceted Search
- Integrate Global Search
- Enhance the Cards region
- Activate Sorting options
- Include a link for purchasing Books

## Task 1: Improve Faceted Search

1. Go to the Application Home Page and click on **Page 10 - Search Books**.

2. Under **Search** region, select **P10\_AUTHOR** facet and update the following:

    - Layout > Sequence: **10**

    ![App builder home page](images/fs-author.png " ")

3. Now, select **P10\_PRICE** facet and update the following:

    - Layout > Sequence: **20**

    - Settings > Select Multiple: **Toggle Off**

    - List of Value > Type :**- Select -**

    ![App builder home page](images/fs-price.png " ")

4. Select **P10\_DISCOUNT** facet, enter/select the following:

    - Layout > Sequence: **30**

    - List of Values> Type: **Static Values**

        - Click on Static Values: Enter the following

       | Display Value |  Return Value  |
       | --- |  --- |
       | <20  | \|20 |
       | 20 - 50 | 20\|50 |
       | 50 - 80 | 50\|80 |
       | >80 | 80\| |
       {: title="Static Values"}

       - Actions Menu > Chart: **Toggle Off**

    ![App builder home page](images/fs-discount.png " ")

5. Select **P10\_CATEGORY** facet, enter/select the following:

    - Layout > Sequence: **40**

    - Actions Menu > Chart: **Toggle Off**

    ![App builder home page](images/fs-cateogory.png " ")

6. Click **Save and Run**.

   ![App builder home page](images/fs-review.png " ")

## Task 2: Integrate Global Search

1. In the left pane, right-click **Body** and select **Create Page Item**.

     ![App builder home page](images/fs-page-item.png " ")

2. In the Property Editor, enter/select the following:

    - Under Identification:

        - Name: **P10\_SEARCH\_PAGE\_ITEM**

        - Type: **Text field with Autocomplete**

    - Under Label > Label: **Search**

    - Under List of Values:

        - Type: **SQL Query**

        - SQL Query: Copy and paste the below code:

     ```
    <copy>
    SELECT title FROM obs_books
    Union
    SELECT author FROM obs_books
    Union
    SELECT category FROM obs_books
    Union
    SELECT contributor FROM obs_books
    Union
    SELECT publisher FROM obs_books
    </copy>
    ```

    ![App builder home page](images/fs-search-item.png " ")

3. Select **P10\_SEARCH** page item, enter/select the following:

    - Under Settings:

        - Input Field: **External Page Item**

        - External Page Item: **P10\_SEARCH\_PAGE\_ITEM**

    - Under Source:

        - Database Columns: **TITLE,AUTHOR,PUBLISHER,CONTRIBUTOR**

    ![App builder home page](images/fs-search-attributes.png " ")


4. Drag and drop **P10\_SEARCH\_PAGE\_ITEM** page item just above the Button Bar.

    ![App builder home page](images/fs-drag.png " ")

5. Click **Save and Run**.

    ![App builder home page](images/save-and-run.png " ")

## Task 3: Enhance the Cards region

1. Select **Search Results** region and enter/select the following:

    - Under Source:

        - Type: **SQL Query**

        - SQL Query: Copy and paste the below code

        ```
    <copy>
       select BOOK_ID,
       ROUND(PRICE,2) as PRICE,
       TITLE,
       AUTHOR,
       PUBLISHER,
       DISCOUNT,
       CATEGORY,
       BUY_LINKS,
       BOOK_IMAGE,
       DESCRIPTION,
       ROUND(Price*((100- Discount)/100),2) as new_price,
       CONTRIBUTOR,
       OBJECT_DET,
       TEXT_DET
       from OBS_BOOKS
       </copy>
       ```

    ![App builder home page](images/search-results.png " ")

2. Under Appearance:

   Select **Template Options** and enter/select the following:

    - Style: **Style C** and Click **OK**

    ![App builder home page](images/template-options.png " ")

3. In the Property Editor, under **Attributes** (for the Search Results region) and enter/select the following:

    - Appearance > Grid Columns: **4 columns**

    - Under Card > Primary Key: **BOOK_ID**

    - Under Title:

        - Column: **TITLE**

        - CSS Classes: **book-title**

    ![App builder home page](images/search-results-attributes.png " ")

    - Under Body:

        - Advanced Formatting: **Toggle On**

        - HTML Expression: copy and paste the below HTML code:

        ```
        <copy>
        <div>
        <b>Author:</b> &AUTHOR.
        </div>
        <div >
        <b>Price:</b> <strike>₹&PRICE.</strike> ₹&NEW_PRICE.
        </div>
        <div >
        <b>Discount:</b> <span style="color: green;">&DISCOUNT.% Off</span>
        </div>
        </div>
        </copy>
        ```

    - Under Media:

        - Source: **Image URL**

        - URL: **&BOOK_IMAGE.**

        - Image Description: **&DESCRIPTION.**

    ![App builder home page](images/image-atrributes.png " ")

4. Select **Page 10: Search Books** region and enter the following into the property editor:

    - CSS > Inline: Copy and Paste the below HTML Code:

        ```
        <copy>
        .book-title {
            font-size: 14px;
            margin: auto;
            text-align: center;
            font-weight: bold;
            }
            </copy>
            ```

    ![App builder home page](images/search-books-inline.png " ")

5. Click **Save** and **Run**.

    ![Save and Run](images/save-run.png " ")

## Task 4: Activate Sorting options

1. Select **Search Results** region and enter/select the following:

    - Under Sources:

        - Order By Item: Click **No Order by item** and enter the following and click **OK**:

        | Clause |  Key | Display |
        | --- |  --- | --- |
        | "TITLE"asc  | TITLE| Title |
        | "NEW\_PRICE"asc | NEW\_PRICE | Price|
        | "DISCOUNT"desc| DISCOUNT | Discount |

    ![App builder home page](images/order-by-item.png " ")

2. Select **P10\_ORDER\_BY** and enter the following:

    - Under Default:

        - Type: **Static**

        - Static Value: **TITLE**

    ![App builder home page](images/default-value.png " ")

3. Click **Save and Run**.

    ![App builder home page](images/review-fs.png " ")

## Task 5: Include a link for purchasing Books

1. Select **Application ID**.

    ![App builder home page](images/app-id.png " ")

2. Click **Create Page**.

    ![App builder home page](images/create-page.png " ")

3. Select **Blank Page**.

    ![App builder home page](images/blank-page.png " ")

4. On **Create Blank Page** dialog, enter/select the following details:

     - Page No: **18**

     - Name: **Book Details**

     - Page Mode: **Modal Dialog**

    Click **Create Page**

    ![App builder home page](images/blank-page-details.png " ")

5. Under Rendering Pane, select **Page 18: Book Details** and update the following:

    - Security > Authentication: **Page is Public**

    ![App builder home page](images/authentication-bp.png " ")

6. In the left pane, right-click **Dialog Footer** and click **Create Region**.

     ![App builder home page](images/region-bp.png " ")

7. In the Property Editor, enter/select the following properties:

    - Under Identification > Name: **Buttons Bar**

    - Under Appearance > Template: **Buttons Container**

    ![App builder home page](images/region-details-bp.png " ")

8. Right-click **Buttons Bar** and click **Create Page Item**.

    ![App builder home page](images/page-item-bp.png " ")

9. In the Property Editor, enter/select the following properties:

    - Under Identification:

        - Name: **P18\_BOOK\_ID**

        - Type: **Hidden**

    ![App builder home page](images/page-item.png " ")

10. Right-click **P18\_BOOK\_ID** and click **Duplicate**.

    ![App builder home page](images/duplicate-bp.png " ")

11. Update Name to **P18\_BOOK\_IMAGE**.

    ![App builder home page](images/duplicate-details-bp.png " ")

12. Right-click **P18\_BOOK\_IMAGE** and click **Create Computation**.

    ![App builder home page](images/computation-bp.png " ")

13. In the Property Editor, enter/select the following properties:

    - Under Execution > Point: **Before Header**

    - Under Computation:

        - Type: **SQL Query (return single value)**

        - SQL Query: Copy and paste below code into the code editor

            ```
       <copy>
        select book_image from obs_books where book_id= :P18_BOOK_ID
        </copy>
         ```

    ![App builder home page](images/book-image-computation.png " ")

14. Right-click **P18\_BOOK\_ID** and click **Duplicate**.

    ![App builder home page](images/create-dup.png " ")

15. Update Name to **P18\_BUY\_LINKS**.

    ![App builder home page](images/page-item-buy-links.png " ")

16. Right-click **P18\_BUY\_LINKS** and click **Create Computation**.

    ![App builder home page](images/create-comp.png " ")

17. In the Property Editor, update the following properties:

    - Under Execution > Point: **Before Header**

    - Under Computation:

        - Type: **SQL Query (return single value)**

        - SQL Query: Copy and paste below code into the code editor

            ```
            <copy>
            select BUY_LINKS from obs_books where book_id= :P18_BOOK_ID
            </copy>
            ```

    ![App builder home page](images/buy-links-computation.png " ")

18. In the left pane, right-click **Content Body** and click **Create Region**.

      ![App builder home page](images/create-region1.png " ")

19. In the Property Editor, enter/select the following properties:

    - Identification > Name: **IMAGE\_DISPLAY**

    - Appearance > Template: **Image**

    - Image > File URL: **&P18\_BOOK\_IMAGE.**

    ![App builder home page](images/region-details1.png " ")

20. Right-click **Content Body** and click **Create Region**. In the Property Editor, enter/select the following properties:

     - Under Identification:

         - Title: **Book Information**

         - Type: **Classic Report**

    - Under Source:

        - Type: **SQL Query**

        - SQL Query: Copy and paste below code into the code Editor

        ```
        <copy>
        select BOOK_ID,
           Round(PRICE,2) as price,
           TITLE,
           AUTHOR,
           DISCOUNT,
           PUBLISHER,
           CONTRIBUTOR,
           DESCRIPTION,
           ROUND(Price*((100- Discount)/100),2) as new_price
        from OBS_BOOKS
        where BOOK_ID=:P18_BOOK_ID
       </copy>
       ```

    ![App builder home page](images/book-info.png " ")

    - Under Layout > Disable **Start New Row**

    - Under Appearance > Template: **Blank with Attributes**

    ![App builder home page](images/book-info-details.png " ")

21. In the right pane, click **Attributes**. In the Property Editor, update the following properties:

    - Appearance > Template: **Value Attribute Pairs-Column**

    - Pagination > Type: **No Pagination (Show All Rows)**

    ![App builder home page](images/book-info-save.png " ")

22. Under **Book Information** region, expand columns, select **BOOK\_ID**, **NEW\_PRICE** and change **Type** to **Hidden** under Identification.

       ![App builder home page](images/bookid-hidden.png " ")

23. Select **PRICE** and update the following:

     - Column Formatting > HTML Expression:
     ```
     <copy>
     <strike>₹#PRICE#</strike> ₹#NEW_PRICE#
     </copy>
      ```

    ![App builder home page](images/price-html.png " ")

24. Select **DISCOUNT** and update the following:

     - Column Formatting > HTML Expression:
     ```
     <copy>
     <span style="color:green;">#DISCOUNT#% Off</span>
     </copy>
      ```

    ![App builder home page](images/discount-html.png " ")

25. Click **Save**.

    ![App builder home page](images/click-save-2.png " ")

26. In the page designer toolbar, select **Page Selector** and click **10**.

    ![App builder home page](images/navigate-to-10.png " ")

27. In the left pane, under **Search Results** region, right-click **Actions** and click **Create Action**.

    ![App builder home page](images/create-action.png " ")

28. In the Property Editor, enter/select the following properties:

    - Identification > Type: **Full Card**

    - Under Link:

        - Type: **Redirect to a page in this Application**

        - Click **Target**

            - Page: **18**

            - Name: **P18\_BOOK\_ID** and Value: **&BOOK_ID.**

            - Clear Cache: **18**

            Click **OK**

    ![App builder home page](images/action-details.png " ")

29. Click **Save and Run**.

    ![App builder home page](images/action-review.png " ")

    ![App builder home page](images/buy-link-review.png " ")

## Summary

You've learned how to enhance the faceted search page, integrate Global Search using a page item, improve the Cards region, activate sorting options, and include a link for purchasing books. Ready to move on to the next lab!

## Acknowledgements

- **Author**: Pankaj Goyal, Member Technical Staff; Ankita Beri, Product Manager
- **Last Updated By/Date**: Pankaj Goyal, Member Technical Staff, Aug 2024

<!-- 
25. Right-click **Book Information** and click **Create Button**.

      ![App builder home page](images/book-info-button.png " ")

26. In the Property Editor, enter/select the following properties and click OK

     - Under Identification:

        - Button Name: **BUY\_LINK**

        - Label: **Buy Link**

     - Under Layout > Slot: **Next**

     - Under Appearance:

          - Button Template: **Text with icon**

          - Template Options > Style: **Display as link**

          - Icon: **fa-box-arrow-in-ne**

    ![App builder home page](images/buy-link-button.png " ")

    - Under Behavior:

         - Action: Redirect to URL

         - Target > URL:
         ```
         <copy>
          javascript:window.open('&P18_BUY_LINKS.','_blank');
          </copy>
           ```
       Click **Save**.

      ![App builder home page](images/buy-link-builder.png " ") -->