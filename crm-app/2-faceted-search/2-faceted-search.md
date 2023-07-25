# Create Faceted Search Page

In this lab, you learn to create a Faceted Search Page. A faceted search page will display and filter Opportunity data using an intuitive experience.

Estimated Time: 10 minutes

### Objectives

In this lab, you will:
- Create Faceted Search page using DM_oppty table.

## Task 1: Create Faceted Search Page

1. Click on App Builder and Select CRM APP. Click Create Page.

   ![Create Page](images/faceted-create-page.png " ")

2. In Create a Page Wizard screen select Faceted Search and Click Next.

    ![Faceted Search Wizard](images/faceted-search-wizard1.png " ")

3. In Create Faceted Search wizard:
    - For Name - Type Faceted Search
    - For Table / View Name - Select **DM_OPPTY**  
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

  ## **Summary**

  You now know how to create and edit Faceted Search page.

  You may now **proceed to the next lab**.   

  ## Acknowledgments
     - **Author** - Ankita Beri, Product Manager
     - **Last Updated By/Date** - Ankita Beri, Product Manager, June 2023
