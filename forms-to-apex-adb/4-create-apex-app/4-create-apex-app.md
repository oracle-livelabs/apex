# Create the APEX Application

This Lab focuses on the creation of the APEX Application. To do this you use the Create Application Wizard.

Prior to creating the APEX Application, a quick recap about what we’ve already have:

- An Always-Free Autonomous Database
-	An APEX Workspace with database objects already loaded.

## Task 1: Create an Application

1. First, login into your APEX workspace.

2. Click **App Builder**.

    ![App Builder](images/app-builder.png " ")

3. On App Builder page, click **Create a New App**.

    ![Create a New App](images/create-new-app.png " ")

4. Click **Use Create App Wizard**.

    ![Use Create App Wizard](images/use-create-app-wizard.png " ")

5. Since you will create a new application, Enter name: **Modernization** and leave App Icon and Appearance with default values. Click **Add Page**.

    ![Add Page](images/add-page1.png " ")

 *Note: Default App Icon could be different in your environment: for simplicity just accept the default.*

6. Select **Faceted Search**.

    ![faceted search](images/faceted-search1.png " ")

7. For add Faceted Search Page enter/ select the following:

    - Page Name: **Customer Faceted Search**

    - Table: **S_CUSTOMER**

    - **Check** the **Include Form** checkbox

     Click **Add Page**.

  ![faceted search](images/add-faceted-search-page.png " ")

8. On Create Application page, click **Add Page** to add another page for Customers table (S_CUSTOMER) and select **Interactive Report**.

    ![interactive report](images/interactive-report.png " ")

9. For the Add Report Page, enter/select the following:

    - Page Name: **Customer – Interactive Report**

    - Table or View: **S_CUSTOMER**

    - **Check** the **Include Form** checkbox

    Click **Add Page**.

  ![interactive report](images/add-report-page.png " ")

10.	On Create Application wizard, add another page for ORDERS table, by clicking **Add Page** as done previously and select **Master Detail**.

    ![master detail](images/master-detail.png " ")

11.	For Add Master Detail Page, enter/select the following:
    - Page Name: **Orders – Stacked**

    - Select **Stacked** as Master Detail layout page.

    - Table: **S_ORD**

    - Detail Table: **S_ITEM**

    Click **Add Page**.

    ![master detail](images/add-master-detail-page.png " ")

12.	The Create Application page has three Pages added: two for Customers table and one, as Master-Detail, for Orders and Items.

    Let’s add another Page for Orders, again click **Add Page** and select **Faceted Search**.

    ![Faceted Search](images/faceted-search2.png " ")

13.	On Add Faceted Search Page, enter/select the following:

    - Page Name: **Orders Faceted Search**

    - Table: **S_ORD**

    Click **Add Page**.

    ![Faceted Search](images/add-faceted-search-page2.png " ")

16.	Under Features, Check **Install Progressive Web App**, **Feedback** and **About Page** and Click **Create Application**.

    ![create application](images/create-application.png " ")

## Task 2: Run the Application
1. Now let’s run the application from the current page as a developer. Click **Run Application** icon.

    ![Run application](images/run-application.png " ")

2. Enter the credentials.

3.	The home page includes a link to the pages created previously. You can edit this page as you need. Click on the hamburger menu on the top to explore all the pages.

    ![application](images/application.png " ")

    ![application](images/app-form.png " ")

## Task 3: Create Side-by-Side Master Detail Page

1. Go back to the Application Builder to create a new page for Orders. Click **Create Page**.

    ![application](images/create-page1.png " ")

2. On Create a Page dialog, select **Master Detail**.

    ![application](images/master-detail5.png " ")

3. Previously you created a master detail page in stacked style for Orders and Items, now you will create another type of Master Detail page in Side-by-Side style. For that, click **Side-by-Side** and click **Next**.

    ![application](images/create-master-detail1.png " ")

4. On Create Master Detail dialog, enter/select the following:

    - Page Definition > Master Detail Page Name: **Orders – Side by Side**

    - Navigation > Breadcrumb Parent Entry: **Home (Page 1)**

    Click Next:

  ![application](images/create-master-detail2.png " ")

5. Next, on the **Create Master Detail** dialog, enter the following:

    - Master Table: **S_ORD**

    - Primary Display Column: **DATE_ORDERED (Date)**

    - Secondary Display Column: **PAYMENT_TYPE (Varchar2)**

    - Detail Table: **S_ITEM**

    Click **Create Page**

  ![application](images/create-master-detail3.png " ")

6. Page Designer is shown. You can use Page Designer to maintain and enhance pages within an APEX app. Page Designer is a full featured Integrated Development Environment (IDE) that includes a toolbar and multiple panes:

    - **Left Pane**: Includes four tabs that display as a tree: Rendering, Dynamic Actions, Processing, and Shared Components.

    - **Central Pane**: Includes five tabs: Layout, Component View, Messages, Page Search, and Help.

    - **Right Pane**: Displays the Property Editor. Use the Property Editor to update attributes for the selected component.

  ![application](images/panes.png " ")

7. Now **Run** this page clicking the green play button at the top right of Page Designer.

    And here you see the other Master-Detail layout, other than Stacked one, in which three panel are displayed:

    -	**Left vertical Panel**: here S_ORD Master table primary and secondary display columns (DATE_ORDERED, PAYMENT_TYPE) are displayed.

    - **Upper Horizontal Panel**: here other S_ORD Master table details are displayed, when chosen the primary and secondary columns accordingly.

    - **Lower Horizontal Panel**: here S_ITEM detail table items are displayed and which displayed values are referenced accordingly to the related Order ID.

  ![application](images/orders-side.png " ")

8. If you click on a key element on Left Vertical Panel (example: 9/18/2007 CHECK) you get the details, in a single page, of Orders master table and Order Items detail one.

    ![application](images/orders-side2.png " ")


## Task 3: Create Drill-down Master Detail Page
In this task, you will create another Master-Detail style page for Orders with **Drill Down** layout.

1.	Navigate back to Page Designer, Select Create **(v)** and click **Create Page**.

    ![application](images/create-page2.png " ")

2. Select **Master Detail**.

    ![application](images/master-detail5.png " ")

3. For Master Detail style, select **Drill Down**.

    ![application](images/drill-down.png " ")

4. On Create Master Detail dialogs, enter/select the following:

    - Name: **Orders – Drill Down**

    - Table/View Name: **S_ORD**

    - Navigation > Breadcrumb Parent Entry:  **No parent entry**

    Click **Next**.

  ![application](images/drill-down2.png " ")

    - Form Navigation Order: **ID**

    Click **Next**.

  ![application](images/drill-down3.png " ")

    - Name: **Order Items – Drill Down**

    - Table/View Name: **S_ITEM**

    Click **Next**.

  ![application](images/drill-down4.png " ")

    - Primary Key Column 1: **ITEM_ID**

    - Master Detail Foreign Key: **ID ->ORD_ID**

    Click **Create Page**.

  ![application](images/drill-down5.png " ")

5. Run the page by clicking the green arrow button on right upper side.

    ![application](images/run-drill.png " ")

6. The Master Detail Order Items Drill Down shows up in the Home menu pane and the report with Master Orders records. If you try to click on the edit icon of a specific Orders record you see the Drill-Down display of the Master-Detail report page.

    ![application](images/edit-drill.png " ")

7. If you click on the arrows under the “Form on S_ORD” panel you can navigate through Master Orders table rows and corresponding Order Items Detail rows are displayed accordingly.

    ![application](images/view-drill.png " ")

## Summary
Now you have created the APEX application with multiple report example scenarios for Customer, Orders and Order Items tables.
In the next lab you will undertake Oracle Forms functionalities enhancement steps in APEX.
