# Enhance the Home Page

## Introduction
During this lab, you'll refine the faceted search page and its card section. Additionally, you'll discover how to integrate a Global search page item into the faceted search page for book searches. You'll also gain expertise in enabling sorting functionality on the search page. Lastly, you'll explore creating a hyperlink that redirects users to an Amazon page.

Estimated Time: 10 minutes

### Objectives
In this lab, you will:
- Improve Faceted Search
- Integrate Global Search
- Enhance the Cards section
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
       | <20  | |20|
       | 20 - 50 | 20|50 |
       | 50 - 80 | 50|80 |
       | >80 | 80| |
       {: title="Static Values"}

       - Under Actions section: Disable Chart   

    ![App builder home page](images/fs-discount.png " ")

5. Select **P10_CATEGORY** facet under Search Region.
    - Under Layout Section: For Sequence: Enter **40**
    - Under Actions Menu

    ![App builder home page](images/fs-category.png " ")

6. Click Save and Run.
