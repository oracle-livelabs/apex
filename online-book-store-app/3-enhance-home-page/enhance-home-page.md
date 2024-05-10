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
1. Go to the Application Home Page and then click on Page 10 - Search Books.

2. Select **P10_AUTHOR** facet under Search Region.
    - Under Layout Section: For Sequence: Enter **10**

    ![App builder home page](images/fs-author.png " ")

3. Now, Select **P10_PRICE** facet under Search Region.
    - Under Layout Section → For Sequence: Enter **20**
    - Under Settings Section → For Select Multiple: **Toggle Off**
    - Under List of Value Section → Type : Enter **- Select -**

    ![App builder home page](images/fs-price.png " ")

4. Select **P10_DISCOUNT** facet under Search Region.
    - Under Layout Section: For Sequence: Enter **30**
    - Under List of Values: For Type: Select **Static Values**
       - Click on Static Values: Enter the following

       | Display Value |  Return Value  |
       | --- |  --- |
       | <20  | 20|
       | 20 - 50 | 20|50 |
       | 50 - 80 | 50|80 |
       | >80 | 80 |
       {: title="Static Values"}

       - Under Actions section: Disable Chart   

    ![App builder home page](images/fs-discount.png " ")

5. Select **P10_CATEGORY** facet under Search Region.
    - Under Layout Section: For Sequence: Enter **40**
    - Under Actions Menu

    ![App builder home page](images/fs-cateogory.png " ")

6. Click Save and Run.

   ![App builder home page](images/fs-review.png " ")

## Task 2: Integrate Global Search

1. Under Rendering tab, Right-click on Body and Select **Page Item**. Enter the following:

     ![App builder home page](images/fs-page-item.png " ")

   - For Name: Enter **P10_SEARCH_PAGE_ITEM**
   - For Label: Enter **Search**
   - For Type: Select **Text field with Autocomplete**



  Under List of Values Section:
   - For Type: Select **SQL Query**

   - Copy and paste the code in **SQL Query**:

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

2. Select **P10_SEARCH** page item under Search region.
    Under Settings Section:
    - For Input Field: Select **External Page Item**
    - For External Page Item: Select **P10_SEARCH_PAGE_ITEM**

    Under Source Section:
    - For Database Columns:  Enter **TITLE,AUTHOR,PUBLISHER,CONTRIBUTOR**

  ![App builder home page](images/fs-search-attributes.png " ")


3. Drag and drop **P10_SEARCH_PAGE_ITEM** page item just above the Button Bar.

    ![App builder home page](images/fs-drag.png " ")

4. Click on save and run.

## Task 3: Enhance the Cards region

1. Select **Search Results** Region and Enter the following:
    Under Source Section:
    - For Type: Select **SQL Query**
    - For SQL Query: Copy and paste the below code

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

2. Under Appearance Section:  
   Select **Template Options** and enter the following:
    - For Style :Select  Style C and Click **OK**

    ![App builder home page](images/template-options.png " ")

3. Select Attributes (For the Search Results Region) and enter the following:

    Under Appearance Section:
    - For Grid Columns: Select **4 columns**

    Under Card Section:
    - For Primary Key: Enter **BOOK_ID**

    Under Title Section:
    - For CSS Classes: Enter **book-title**

    Under Body Section:
    - **Enable** Advanced Formatting
    - For HTML expression: Enter the following

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

      ![App builder home page](images/search-results-attributes.png " ")

    Under Media Section:
    - For Source: Select **Image URL**
    - For URL: Enter **&BOOK_IMAGE.**
    - For Image Description: Enter **&DESCRIPTION.**

    ![App builder home page](images/image-atrributes.png " ")

4. Select **Page 10: Search Books** and enter the following:
    Under CSS Section:
    - For Inline: Enter the following

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

5. Click **Save**.

## Task 4: Activate Sorting options

1. Select **Search Results** region and enter the following:

    Under Order By Section:
    - For Type: Select **Item**
    - Click **Order by item** and enter the following:

    | Clause |  Key | Display |
    | --- |  --- | --- |
    | "TITLE"asc  | TITLE| Title |
    | "PRICE"asc | PRICE | Price|
    | "DISCOUNT"desc| DISCOUNT | Discount |

2. Click OK

    ![App builder home page](images/order-by-item.png " ")

3. Select P10_ORDER_BY under Results Region and enter the following:

    Under Default Section:
    - For Type: Select **Static**
    - For Static Value: TITLE

5. Click on Save and run.

    ![App builder home page](images/review-fs.png " ")

## Task 5: Include a link for purchasing Books

1. Select **Application ID**.

    ![App builder home page](images/app-id.png " ")

2. Click **Create Page**.

    ![App builder home page](images/create-page.png " ")

3. Select **Blank Page**.

    ![App builder home page](images/review-fs.png " ")

4. Fill in the below details
    Page No: 18
    Name: Book Details
    Page Mode: Modal Dialog
    Click Create Page

    ![App builder home page](images/review-fs.png " ")

    On Page 18 Page Designer, Click on Page 18: Book Details in the Rendering Pane
     Under security in the right pane → Authentication: Page is Public
    Right-click on the Dialog Footer in the left pane and create a region.

    Under Identification → Name: Buttons Bar

    Under Appearance → Template: Buttons Container

    Right-click on the Buttons Bar and create a page item

    Under Identification -> Name: P18_BOOK_ID and  Type: Hidden

    Right-click on P18_BOOK_ID and create a duplicate

    Change the name to P18_BOOK_IMAGE.
    Click on P18_BOOK_IMAGE and create a computation.

    Under Execution → Point: Before Header

    Under Computation → Type  SQL Query (return single value)

    SQL Query = select book_image from obs_books where book_id= :P18_BOOK_ID

    Right-click on P18_BOOK_ID and create a duplicate

    Change the name to P18_BUY_LINKS.
    Click on P18_BUY_LINKS and create a computation.

    Under Execution → Point: Before Header

    Under Computation → Type  SQL Query (return single value)

    SQL Query = select BUY_LINKS from obs_books where book_id= :P18_BOOK_ID

    Click on Content Body and create a region
    Under Identification →  Title:  IMAGE DISPLAY and Type: Static Content
    Under Appearance → Template: Image
    Under Image → File URL: &P18_BOOK_IMAGE.

     Click on Content Body and create another region
    Under Identification →  Title: Book Information and Type: Classic Report
    Under Source → Type: SQL Query

    SQL Query:
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

    Under Appearance → Template: Blank with Attributes

    Under Layout → Disable Start New Row button.
    Click on Attributes
    Under Appearance → Template: Value Attribute Pairs - Column
    Under Pagination:
    Type : No Pagination (Show All Rows)
    Open columns below Book Information →
    Arrange the order → BOOK_ID,TITLE,DESCRIPTION,AUTHOR,CONTRIBUTOR,PUBLISHER,PRICE,DISCOUNT,NEW_PRICE
    Change the Type of BOOK_ID and NEW_PRICE to Hidden Column.
    Click on the PRICE
    Under Column Formatting
    HTML Expression:
    <strike>₹#PRICE#</strike> ₹#NEW_PRICE#
    Click on the DISCOUNT
    Under Column Formatting
    HTML Expression:
    <span style="color: green;">#DISCOUNT#% Off</span>
    Click on Book Information and create a button
    Name: Buy_Link
    Position: next
    Appearance: Text with icon
    Style: Display as link
    icon:fa-box-arrow-in-ne
    Under Behavior
    Action: Redirect to URL
    Target: javascript:window.open('&P18_BUY_LINKS.','_blank');
    Click on Save.
    Go to Page 10: Search Books
    Under Search Results in the rendering tab, right-click on Action and click Create Action.
    Under Identification→ Type: Full Card
    Under Link→ Type: Redirect to a page in this Application
    Click on Target
    Page: 18
    Name

    Value

    P18_BOOK_ID

    &BOOK_ID.

    Clear Cache: 18
    click ok
    Click on Save and Run.
