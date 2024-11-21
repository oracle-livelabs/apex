# Create the Book Details Page

## Introduction
In this lab, you will set up a new page that displays the details of a single book. When you click on a specific book from the Book Search page and, eventually, the My Library page, the details for that book will be retrieved from the Google Books API and shown in the Book Details page.

Estimated Lab Time: 20 minutes


### Objectives
In this lab, you will:
- Create a new page, Book Details.
- Use the Google Books REST source to display data on the Book Details page.
- Connect the Book Details page to the Book Search page.

### Prerequisites
- Completion of workshop through Lab 3

## Task 1: Create the Book Details Page
You will start by creating a new page, Book Details, which contains a Form. While this form will not display in the final Book Details page, it will hold the Book Details data needed to display content in other regions on the page.

1. In the toolbar at the top of the Page Designer, click the **Create** button (3 buttons left of the Save button) and select **Page**.

    * Click **Form**.

    ![Create a Page wizard overlaying Page 2 in Page Designer](images/create-page.png " ")

    * Page Number: **3**

    * Name: **Book Details**

    * Data Source: **REST Data Source**

    * REST Data Source: **Google Books API**

    * Use Navigation: **off**

    * Click **Next**.

    ![Create Page wizard on the Create a Form step to set the page and data source attributes](images/create-form.png " ")

    * Select **ID (Varchar2)** as the Primary Key Column 1 value.

    * Click **Create Page**.

    ![Create Page wizard on the Create a Form step to set the form primary key](images/create-form-pk.png " ")

    * You should now be on page 3, the **Book Details** page.

2. Make sure **Page 3: Book Details** is selected in the rendering pane on the left.

3. In the **CSS** property group, paste the code below and into the **Inline** CSS code editor:

    ```
    <copy>
    /* Customize Book Header Card */
    .book-header-card.a-CardView {
        /* Increase the font sizes for book name and tag line */
        --a-cv-title-font-size: 24px;
        --a-cv-subtitle-font-size: 16px;

        /* Add additional spacing around the header content */
        --ut-cv-subtitle-margin: 16px 0 0 0;
        display: flex;
        padding: 0;
        background: none;
        border: none;
        box-shadow: none;
    }

    /* position badge next to Book Title */
    .a-CardView-badge {
        margin-inline-start: var(--a-cv-header-item-spacing-x, 8px);
        position: absolute;
        top: 20px;
    }

    .a-CardView-header {
        align-items:flex-start;
    }

    /* make Book Cover image larger */
    .thumbnail {
        border-radius: var(--a-cv-border-radius);
        box-shadow: var(--a-cv-state-shadow, var(--a-cv-type-shadow, var(--a-cv-shadow, none)));
        margin-right: 16px;
        height: 250px;
        width: 175px;
    }

    .subtitle {
        font-size: 20px;
        line-height: 1.5;
    }

    .fa-star, .fa {
        vertical-align: middle;
    }

    .categories {
        font-size: 18px;
    }

    .ratings-count {
        font-size: 12px;
        color: gray;
        margin-left: 4px;
    }

    .ratings-count[data-count=""] {
    display: none;
    }

    .published, .pages {
        color: #4e4e4e;
    }

    .preview-link {
        font-size: 14px;
        padding-top: 12px;
    }

    /* rating stars */

    .u-hot-text {
        color: var(--rw-dark-body-title-background-color);
    }

    .report-star-rating {
    white-space: nowrap;
    }

    .report-star-rating[data-rating*="0"]::before {
    content: "\f006\f006\f006\f006\f006";
    }

    .report-star-rating[data-rating*="1"]::before {
    content: "\f005\f006\f006\f006\f006";
    }

    .report-star-rating[data-rating*="2"]::before {
    content: "\f005\f005\f006\f006\f006";
    }

    .report-star-rating[data-rating*="3"]::before {
    content: "\f005\f005\f005\f006\f006";
    }

    .report-star-rating[data-rating*="4"]::before {
    content: "\f005\f005\f005\f005\f006";
    }

    .report-star-rating[data-rating="5"]::before {
    content: "\f005\f005\f005\f005\f005";
    }

    .report-star-rating[data-rating=""]::before {
    content: "\f006\f006\f006\f006\f006";
    }

    .report-star-rating[data-rating=""]::after {
    font-size: 12px;
    color: gray;
    font-family: inherit !important;
    font-style: italic;
    content: "Not rated yet";
    vertical-align: middle;
    margin-left: 8px;
    }
    ```

    * The CSS above will style the page header you are going to create. While the original layout and format of the Cards region type can get you pretty far, a little CSS goes a long way in rounding out the entire look of a component or page.

    ![Page 3 open in Page Designer with the CSS property group visible in the Page property editor](images/details-page-css.png " ")

## Task 2: Create the Header and Overview
You can use the value stored in the P3\_ID page item in the Book Details form to specify which book to get the details for. Then you can utilize a few columns from the Google Books REST source to create a nice header that includes the book cover, title, authors, categories, rating, number of ratings, number of pages, publisher and published year. In addition to the header, you will add a region to display the overview of the book formatted in a way that is easy to read.

1. You will first need to hide all the Book page items so that you can still access the values stored in them but create your own content for the page. To do this, you can set the Type of a column to Hidden, which will not display an item on the frontend.

    * To select all items, click on the first item under the Book Details region, **P3\_ID**, and then hold shift and click on the last item, **P3\_VOLUMEINFO\_PANELIZATIONSUMMARY\_CONTAINSIMAGEBUBBLES**.

    * In the Page Items editing pane, set Type: **Hidden**

    ![Page 3 open in Page Designer with all Book Details form items selected and their type set to Hidden in the Property Editor](images/hide-items.png " ")

2. Since the user won't be entering details into the form, you don't need the Cancel button that was added by default. Under Close, right click on **CANCEL** button and click **Delete**.

    * You'll add a button to navigate back to the previous page later.

    ![Page 3 open in Page Designer with Cancel button menu open and Delete selected](images/delete-cancel-button.png " ")

3. To start creating the header for the Book Details page, right click on Content Body and select **Create Region**.

    * Set the following:

        - Title: **Header**

        - Type: **Cards**

        - Source → Location: **REST Source**

        - Source → REST Source: **Google Books API**

        - Local Post Processing → Type: **SQL Query**

        - Local Post Processing → replace the existing SQL query with the following:

            ```
            <copy>
            select ID,
                ETAG,
                KIND,
                VOLUMEINFO_TITLE,
                REPLACE(REPLACE(REPLACE(VOLUMEINFO_AUTHORS, '["', ''), '"]', ''), '"', ' ') as VOLUMEINFO_AUTHORS_CLEAN,
                VOLUMEINFO_INFOLINK,
                VOLUMEINFO_LANGUAGE,
                VOLUMEINFO_SUBTITLE,
                VOLUMEINFO_PAGECOUNT,
                VOLUMEINFO_PRINTTYPE,
                VOLUMEINFO_PUBLISHER,
                REPLACE(REPLACE(VOLUMEINFO_CATEGORIES, '["', ''), '"]', '') as VOLUMEINFO_CATEGORIES_CLEAN,
                VOLUMEINFO_IMAGELINKS_THUMBNAIL,
                VOLUMEINFO_IMAGELINKS_SMALLTHUMBNAIL,
                VOLUMEINFO_DESCRIPTION,
                VOLUMEINFO_PREVIEWLINK,
                VOLUMEINFO_RATINGSCOUNT,
                VOLUMEINFO_READINGMODES_TEXT,
                VOLUMEINFO_READINGMODES_IMAGE,
                VOLUMEINFO_AVERAGERATING,
                SUBSTR(VOLUMEINFO_PUBLISHEDDATE, 1, 4) AS PUBLISHED_YEAR,
                VOLUMEINFO_CONTENTVERSION,
                VOLUMEINFO_MATURITYRATING,
                VOLUMEINFO_INDUSTRYIDENTIFIERS
            from #APEX$SOURCE_DATA#
            where ID = :P3_ID
            ```

        - The above query is a simplified version of the original query because you only need a few columns for the header. It also converts PUBLISHEDDATE into year format and removes the punctuation from the array columns (AUHORS, CATEGORIES).

        - Appearance → Template: **Blank with Attributes**

        ![Page 3 open in Page Designer with Property Editor open on editing the Header region properties](images/header-region-attributes.png " ")

4. Click on the **Attributes** tab at the top of the Header region Property Editor.

    * Set the following:

        - Appearance → Layout: **Horizontal (Row)**

        - Card → CSS Classes: **book-header-card**

        - Card → Primary Key Column 1: **ID**

        - Title → Advanced Formatting: **on**

        - Title → HTML Expression:

            ```
            <copy>
            &lt;span class="a-CardView-title">&VOLUMEINFO_TITLE.&lt;/span>
            &lt;span class="a-CardView-badge &BADGE_COLOR.">&BADGE_LABEL.&lt;/span>
            &lt;br>
            &lt;span class="subtitle"> &VOLUMEINFO_AUTHORS_CLEAN. &lt;/span>
            &lt;br>&lt;br>
            &lt;span class="fa fa-lg u-hot-text report-star-rating" data-rating="&VOLUMEINFO_AVERAGERATING." title="&VOLUMEINFO_AVERAGERATING." aria-hidden-"true">&lt;/span><span class="u-VisuallyHidden">&VOLUMEINFO_AVERAGERATING.&lt;/span>&lt;span class="ratings-count" data-count="&VOLUMEINFO_RATINGSCOUNT."> &VOLUMEINFO_RATINGSCOUNT. ratings&lt;/span>&lt;/span>
            &lt;br>&lt;br>
            &lt;span class="categories">&VOLUMEINFO_CATEGORIES_CLEAN.&lt;/span> 
            &lt;br>&lt;br>
            &lt;span class="published">Published &PUBLISHED_YEAR.  &middot;  &VOLUMEINFO_PUBLISHER.&lt;/span>
            &lt;br>
            &lt;span class="pages">&VOLUMEINFO_PAGECOUNT. pages&lt;/span>
            &lt;br>
            &lt;div class="preview-link">&lt;a href="&VOLUMEINFO_PREVIEWLINK." target="_blank">Preview Book&lt;/a>&lt;/div>
            ```

        - Subtitle → Advanced Formatting: **on**

        - Subtitle → HTML Expression:

            ```
            <copy>
            &lt;div class="preview-link">Preview Book&lt;/div>
            ```

            *Note: We are only putting the Preview Book link in the Subtitle section because later we will create a card action type of Subtitle that will open a modal containing the book preview when the subtitle content is clicked.*

        - Icon and Badge → Icon Source: **Image URL**

        - Icon and Badge → Image URL: **&VOLUMEINFO\_IMAGELINKS\_THUMBNAIL.**

        - Icon and Badge → Icon CSS Classes: **thumbnail**

        ![Page 3 open in Page Designer with Property Editor open on editing the Header region attributes](images/header-attributes.png " ")


5. In order to get the details for a specific book selected from the Search page, you have to update the **q** parameter that is part of the call to the Google Books API. When you look at the Details and Header regions in the rendering pane, you can see that under each is a Parameters section, just like there was for Placeholder and Searched Books on the Book Search page.

6. Expand the **Parameters** section under the **Book Details** region.

7. Click on the **q** parameter.

    * Change the Type from REST Source Default to **Item**.

    * In the Item field, enter **P3\_ID**.

    ![Page 3 open in Page Designer with Property Editor open on editing the q parameter](images/book-id-parameter.png " ")

8. Follow steps 6 and 7 to update the q parameter for the **Header** region.

9. Finally, you will add a region to display the book Overview to go along with the nice header containing the book details.

10. In the rendering pane on the left, right-click on Content Body and select **Create Region**.

11. Set the following properties:

    * Identification → Title: **Overview**

    * Source → HTML Code: **&P3\_VOLUMEINFO\_DESCRIPTION.**

    * Appearance → Template: **Content Block**

    * Appearance → Template Options:

        - Region Title: **Small**

        - Top Margin: **Medium**

        - Click **Ok**.

        ![Page 3 open in Page Designer with Property Editor open on editing the Overview region](images/overview.png " ")

12. Since Book Details is a common page (can be navigated from both the Book Search page and the My Library page), you will need to create a page item to hold the previous page value so the Back button we create later on knows where to redirect the user.

13. Right-click on the **Book Details** region in the rendering pane and select **Create Page Item**.

    ![Close up of rendering pane with Book Details region context menu open on Page 2 in Page Designer ](images/create-page-item.png " ")

14. Set the following properties:

    * Identification → Name: **P3\_PREVIOUS\_PAGE\_ID**

    * Identification → Type: **Hidden**

    ![Page 3 open in Page Designer with Property Editor open on editing the new page item](images/page-item-properties.png " ")

15. Click **Save**.

## Task 3: Connect the Details Page to the Search Page
To be able to view the details of any book you click on on the Book Search page, you can link the Details page to the Search page. However, in order to get the details for the specific book you clicked on, you have to pass some data from the Search page to the Details page.

1. Navigate to page **2: Book Search** by clicking the down arrow in the page navigation on the Page Designer toolbar.

2. On the Book Search page, you can see in the rendering pane that both Placeholder Books and Searched Books have an **Actions** section underneath them.

3. Right-click on **Actions** underneath Placeholder Movies and select **Create Action**.

    ![Close up of rendering pane with Cards Action context menu open on Page 2 in Page Designer ](images/create-action.png " ")

    * Identification → Type: **Full Card**

    * The Link section is where you can connect page 3 to page 2 by redirecting the user to a new page.

    * Click on **No Link Defined** next to Target to open the Link Builder dialog.

        - Page: **3**

        - You also need to set the value of the ID item on page 3 (P3\_ID) so that the Book Details page has the ID of the book that was clicked on.

        - Set Items:

            - Name: **P3\_ID**  |  Value: **&ID.**

            - Name: **P3\_PREVIOUS\_PAGE\_ID**  |  Value: **2**

            *Note: You can also use the buttons next to the name and value fields to browse items that you can pass values to. Notice that the options for Name all come from the Book Details page (P3), because that is the item you want to set. The options for Value are the columns from the Book Search data source because this is the what you are getting from page 2 and passing to page 3.*

            *Note: P3\_PREVIOUS\_PAGE\_ID doesn't appear when browsing items because you haven't created it yet so you'll need to type it in manually. You will create that page item in the next lab.*

        - Click **Ok**.

        ![Link Builder Target dialog for Placeholder Books Full Card action open over Page 2 in Page Designer](images/card-action.png " ")

4. Follow step 3 for the **Searched Books** region to create a Full Card action that redirects to page 3.

5. Click **Save**.

6. Refresh the page where your application is running.

7. Test the Book Details page by opening the Book Search page then clicking on a book of choice to see the details.

    ![Book Details dialog page open in runtime application](images/details-page-live.png " ")

You have now set up the Book Details page and set it up to open for any card that is selected from the Book Search page. You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Maddie Thompson
- **Last Updated By/Date** - Maddie Thompson, November 2024