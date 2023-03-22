# Improving Projects

## Introduction
In this lab, you will learn how to use the *Create Page Wizard* to add additional pages to your app. Then, you will link the new page to the existing Card page. You will then learn how to easily manipulate how items are displayed, and finally to create a *Dynamic Action*.

## Task 1: Changing the Cards Region Style
Looking at the Projects Card region, you should notice the cards' icons are circle, which could be displayed differently. To change the cards region style, you will utilize **Live Template Options** directly in the runtime environment. You could also make changes from the App Builder; however, it is much easier to make changes as you can see the results.

1. In the runtime environment, click **Projects**.
2. In the Developer Toolbar (at the bottom of the runtime environment), click **Quick Edit**.

    Move the mouse until it is inside the Cards region, and a blue box surrounds the region, with a wrench in the top right corner.     
    Click the wrench.

    ![](images/quick-edit.png " ")

3. In the Live Template Options dialog, select the following:
    - Style - select **Style A**

4. Click **Save**

    ![](images/live-template.png " ")

## Task 2: Enhancing Projects Page
You will notice that the Projects page shows the cards columns based on the current available width. Let's fix the number of grid columns to 4. We will also add the project lead in the subtitle of the card.
1. In the Developer Toolbar (at the bottom of the runtime environment), click **Edit Page 4**.
    ![](images/enhance-projects-cards-edit-page.png " ")
2. In the Property Editor (the right pane), under Attributes tab, change the followings:
      - Grid Columns to **4 Columns**
      - Subtitle Column to **PROJECT_LEAD**
      - Click the **Save and Run Page** button
    ![](images/enhance-projects-cards-save-page.png " ")
3. The Cards Region now show only four projects per row. The Project Lead is added in the subtitle of the card.
    ![](images/enhance-projects-cards-run-page.png " ")

## Task 3: Adding a Form Page
Currently there is no way to maintain project records. Therefore, you will use the *Create Page Wizard* to create a form page on the *EBA_PROJECTS* table.

1. Navigate back to the App Builder  by clicking **Application xxxxx** in the Developer Toolbar, or by navigating back to the App Builder browser tab manually.
2. On the application home page, click **Create Page**.

    ![](images/create-page.png " ")

3. In the Create a Page dialog, click **Form**.

    ![](images/select-form.png " ")

4. In the Create Page dialog, click **Form**.

    ![](images/select-form-page.png " ")

5. In the Create Form dialog, for Page Attributes, enter the following:
      - Page Name – enter **Project**
      - Page Mode – click **Modal Dialog**

    Click **Next**

    ![](images/page-attributes.png " ")

6. For Navigation Menu, select **Identify an existing navigation menu entry for this page**.
    For Existing Navigation Menu Entry, select **Projects**.    
    Click **Next**.  

    ![](images/navigation-menu.png " ")

7. For Table/ View Name, select **EBA_PROJECTS (table)**.    
    Click **Next**.

    ![](images/data-source.png " ")  

8. For Primary Key Column, select **ID (Number)**.  
    Click **Create**.

    ![](images/columns.png " ")
    *Note: This will create _Page 10: Project_ if you have followed the previous sections correctly. If not Page 10, please repeat Lab 3, and ensure the Interactive Grids for both Milestones and Statuses are created*

## Task 4: Link to Projects Page
Now to link this new page to the Project Cards page.    
*Note: Defining a link for a Card region requires modifying the SQL statement. However, elsewhere in Oracle APEX, defining links is very easy and declarative as you will learn in Lab 7.*

1. In the Application Toolbar, click the page selector in front of the page number (10).    
    Click **4**, for the Projects page

    ![](images/go-cards.png " ")

    *Note: Alternatively, you can type in a page number or use the up / down arrows in the Application Toolbar to navigate to different pages within Page Designer*

2. In the Rendering tree (left pane), right click **Actions** under **Projects** then click **Create Action**.   
    
    ![](images/enhance-projects-cards-create-action.png " ")

    In the Property Editor (right pane), update the following properties:
    - **Type:** - select Full Card
    - Click **Link > Target**
    - In the Link Builder, **Page** - enter **10**
    - Under **Set Items**, Enter **P10_ID** for **Name** and enter **&ID.** for **Value**

    ![](images/enhance-projects-cards-link-edit-form.png " ")

3. You also need to be able to add new projects, so will need to add a button and link it to the Project form page. The easiest way to add this is to drag and drop a component into the Layout (middle pane) from the Gallery.

      - In the Layout (middle pane), click **Breadcrumb** to highlight the region.  
      - In the Gallery (below Layout), click **Buttons**.   
      - Click and hold **Text [Hot]**.  
      - Drag the button up into the Breadcrumb region, and hover under the **Create** placeholder.

    Once the CREATE selection expands to a large yellow box, release the mouse.

    ![](images/drag-button.png " ")

4. Now to update the button properties.     
    In the Property Editor (right pane), enter the following:

    - Identification > Button Name - enter **CREATE**  
    *Note: The Identification > Label is update to _Create_ once you enter the Button Name*
    - Behavior > Action - select **Redirect to Page in this Application**
    - Behavior > Target - click **No Link Defined**, and enter:
        - Target > Page - enter **10**
        - Clear / Reset > Clear Cache - enter **10**

5. Click **OK**

    ![](images/set-button.png " ")

6. Now to test the page links work!     
    Click **Save and Run Page** button.
    Click on a project card or click **Create**.

    ![](images/view-form.png " ")

## Task 5: Update How Items are Displayed
The way the Status Id, Name, and Project Lead are displayed can be easily improved.
The **Status Id** item is a foreign key to the **EBA\_PROJECT\_STATUS** table. Therefore, rather than requiring end users to enter a number, you will update the item to be a list of values based on the lookup table. The Name and Project Lead fields should be updated to Text Fields. Lastly, the audit columns (Created, Created By, Updated, Updated by) should be hidden.

1. First you need to change the Status item from a number entry to a list of allowable values.   
    From the Runtime environment, from the Project Form page, in the Developer Toolbar, click **Edit Page 10**.  
    Alternatively, navigate back to the App Builder browser tab, and then navigate to Page 10 manually.
2. In Page Designer for Page 10, in the Rendering tree (left pane), click **P10\_STATUS_ID**.  
    In the Property Editor (right pane), enter the following:
    - Identification > Type - select **Select List**    
    *Note: As soon as you choose Select List, P10\_STATUS\_ID item will change to red and a Message indicator will display in the Application Toolbar. This will be remedied once the List of Values attributes are entered*

    - Label > Label - enter **Status**
    - List of Values > Type - select **SQL Query**
    - SQL Query enter:

        ```
        <copy>select code d, id r
        from eba_project_status
        order by display_order</copy
        ```

    *Note: The _code_ column is the value displayed to users, while the _id_ column is the value returned to the table column. The table includes a _display\_order_ column to ensure the statuses are displayed in the correct order*    

    - Display Extra Values - **Uncheck**   
    - Null Display Value - enter **– Select Status -**   
    *Note: This text must be typed*

    ![](images/set-status.png " ")
    ![](images/set-status2.png " ")

3. Now to update the Name and Project Lead items to text fields.    
    In the Rendering Tree (left pane), click **P10\_NAME**  
    Hold down the [Control] key (or [Command] key in Mac) and click **P10\_PROJECT\_LEAD**  

    In the Property Editor (right pane), for Identification > Type, select **Text Field**

    ![](images/set-text.png " ")

4. Last step is to hide the audit columns.  
    In the Rendering Tree (left pane), click **P10\_CREATED**  
    Hold down the [Shift] key and click **P10\_UPDATED\_BY**  

    In the Property Editor (right pane), for Identification > Type, select **Hidden**

    ![](images/set-hidden.png " ")

## Task 6: Improve the Completed Date
Currently a Completed Date can be entered on any project. However, it would greatly improve data quality to allow the completed date to be entered only if the Status is _COMPLETED_. Implementing such functionality requires JavaScript to dynamically enable / disable the Completed Date item based on the value of Status. Thankfully, as an APEX developer, you don't need to write such JavaScript. You can simply define a *Dynamic Action*, which allows you to declaratively define such client-side interactivity, by specifying the trigger, action, and affected element(s).

1. You need to define the Dynamic Action on the triggering element, which is the Status.        
    In the Rendering Tree (left pane), _right-click_ **P10\_STATUS\_ID**.  
    Select **Create Dynamic Action**.

    ![](images/go-da.png " ")

2. Update the Dynamic Action so that it only trigger when the Status is _COMPLETED_.   
    With the Dynamic Actions selected (click **New** under Dynamic Actions), in the Property Editor (right pane), enter the following:
    - Identification > Name - enter **Enable Completed Date**
    - Client-side Condition > Type - select **Item = Value**    
    *Note: The Client-side Condition > Item is automatically set to the current item _P10\_STATUS\_ID_*
    - Client-side Condition > Value - enter **3**   
    *Note: The value _3_ corresponds to a status of COMPLETED*

    ![](images/name-da.png " ")

3. Next you need to specify what happens when the triggering event is true.     
    In the Rendering tree (left pane), click the action under True (currently Show).  
    In the Property Editor (right pane), enter the following:
    - Identification > Action - select **Enable** (under **Component**)
    - Affected Elements > Item(s) - select **P10\_COMPLETED\_DATE**

    ![](images/set-da.png " ")

4. Lastly, it is very important to _disable_ the Completed Date item when the triggering event is false.   
    In the Rendering tree (left pane), under Dynamic Actions, _right-click_ **Enable**.    
    Select **Create Opposite Action**.

    ![](images/set-opposite.png " ")

5. Rather than displaying the Completed Date down the page, it would be far better to display the item directly after the Status item.   
    In the Rendering tree (left pane), click **P10\_COMPLETED\_DATE**.    
    In the Property Editor (right pane), enter the following:
    - Layout > Sequence - enter **50**  
    *Note: This will position P10\_COMPLETED\_DATE between P10\_STATUS\_ID (Sequence 40) and P10\_NAME (Sequence 60)*
    - Layout > Start New Row - _Uncheck_    
    *Note: This will position the item on the same line as the previous item, P10\_STATUS\_ID*

    ![](images/set-date.png " ")

6. Now to review the Project Form page.     
    Click **Save**  
    *Note: If you click the Save and Run Page button, your changes will be saved but the page will not be run. Given the Project Form page is a modal page, it must be run from a calling page, rather than directly from Page Designer*

7. Navigate back to the Runtime environment, refresh the browser, and within the Navigation Menu (left side) click **Projects**.     
    Click a card record to display the corresponding record in the form page.    
    Change the Status and ensure the Completed Date is enabled / disabled correctly.    
    Make changes and click **Apply Changes**, or click **Cancel**.

    ![](images/finished-form.png " ")

## **Summary**

This completes Lab 5. You now know how to add additional pages to your application, link pages together, modify how items are displayed, and define client-side interactivity declaratively. [Click here to navigate to Lab 6](?lab=lab-6-improving-milestones)

## **Acknowledgements**

 - **Author** -  Salim Hlayel, Principle Product Manager
 - **Contributors** - Arabella Yao, Product Manager Intern, DB Product Management
 - **Last Updated By/Date** - Salim Hlayel, Principle Product Manager, November 2020

