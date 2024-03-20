# Create Faceted Search Page

## Introduction

In this lab, you create a faceted search page that provides an intuitive and user-friendly experience to display and filter Opportunity data. This functionality allows users to easily explore and refine the data by applying various filters, making it convenient to access the specific information they need.

Estimated Time: 10 minutes

### Objectives

In this lab, you will:
- Create Faceted Search page using **DM_OPPTY** table.
- Create a Mini Dashboard at the top of the page using Charts.

## Task 1: Create Faceted Search Page

1. Click on App Builder and Select CRM APP. Click Create Page.

   ![Create Page](images/faceted-create-page.png " ")

2. In Create a Page Wizard screen select Faceted Search and Click Next.

    ![Faceted Search Wizard](images/faceted-search-wizard1.png " ")

3. In Create Faceted Search wizard:
    - For Name - Type Faceted Search
    - For Table / View Name - Select **DM\_OPPTY**  
  Click Next.

    ![Create Page](images/faceted-search-wizard2.png " ")

4. Select Facets. If Face selection is not shown, Click Refresh
   Make sure to have these seven (7) selections: PRODUCT, VALUE, PROBABILITY, STATUS, TYPE ,TERM, STAGE.

   Click **Create Page**

    ![Create Page](images/faceted-wizard3.png " ")

5. Click green Save & Run button to view the faceted search page report.

    ![Create Page](images/facet-search-run.png " ")

    ![Create Page](images/faceted-search-page.png " ")

## Task 2: Improve Faceted Search Page  

1. From developer toolbar, Edit Page 24.

    ![Create Page](images/faceted-search-page.png " ")

2. In left render pane:

     - Click P24_VALUE

     - Drag and drop to underneath P24_SEARCH

  ![Create Page](images/drag-value.png " ")

3. In the right pane under List of Values:
   Change Type to -Select-

   ![Create Page](images/select-value.png " ")   

4. Click Save & Run button
   In the first Value range, enter 45000 and Click Go.

  ![Create Page](images/select-range.png " ")

## Task 3: Add Mini-Dashboard

1. From developer toolbar, Select Edit Page 24.
In bottom middle in Layout pane, Click Region button and  Drag </> Static Content to top of page directly under Breadcrumb REGION BODY and release mouse.

    ![Create Page](images/drag-drop.png " ")

2. In right details pane, under Identification, For Title : Type **Dashboard** and scroll down to Advanced section, For Static ID, Type **Dash**

    ![Create Page](images/dashboard.png " ")

3. In left render pane, Select Search.
In right details pane at the top to the right of Region, Click Attributes.

 In Settings section ,For Show Charts : Select **Selector** and
For Charts Selector : Type **#Dash**

    ![Create Page](images/search.png " ")

4. In left render pane, Select Facets.
Hold Control key on keyboard & Select P24\_PRODUCT, P24\_PROBABILITY, P24\_STAGE

 In right details pane, scroll down to Advanced section:
Enable **Show Chart Initially**

   ![Create Page](images/page-items.png " ")

5. Click Save & Run to view mini dashboard.

   ![Create Page](images/run-time.png " ")

## Task 4: Add Actionable Link

1. Click Edit page 24
In left render pane, under Search Results, Click to expand Columns
and Select PRODUCT.

 In right details pane, in Identification section, Change Type to Link

 ![Create Page](images/search-results.png " ")

2. Under Link section, Click button No Link Defined.
   In Link Builder – Target dialog
   - For Page : Select 5
   - For Clear Cache : Select 5
   - For Set Items : For Name : Select P5_ID and For Value : Select ID

 Click Ok

    ![Create Page](images/link-builder.png " ")

3. Click Save & Run button and Select any link from the Product column in the runtime environment.

    ![Actionable Link](images/link-runtime.png " ")

## Summary

You now know how to create and edit Faceted Search page.

You may now **proceed to the next lab**.   

## Acknowledgments
- **Author** - Tom Edwards - Director of Application Development Business Development, Ankita Beri - Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, June 2023
