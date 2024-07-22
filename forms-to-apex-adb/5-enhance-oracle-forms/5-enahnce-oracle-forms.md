# Enhance Oracle Forms functionalities using APEX

## Introduction

After following the guidelines in the previous labs on best practices to modernize Forms in APEX, let’s see how you can further enhance the applications created with APEX’s functionalities.

In this lab, you will build on the business logic analysis performed on the “Customers’ form” in Lab 1. After migrating and enhancing the business logic, it’s time to modernize the application within APEX.

Estimated Time: 15 Minutes

### Objectives

In this lab, you:

- Configure List of Values
- Define and organize facets for the Faceted Search page to filter data effectively.
- Define and personalize the Interactive Report views, allowing end-users to interact with and save their report configurations.
- Create and organize navigation menu entries for Customers and Orders, and assign appropriate parent list entries to make the menu cleaner and more user-friendly.
- Disable authentication to make the application publicly accessible, suitable for a public-facing application.

## Task 1: Configure List of Values

1. The table **S\_CUSTOMER** has a column named **CREDIT\_RATING** with a check constraint. The column can only contain the following values: **EXCELLENT, GOOD, POOR**. Creating a list of values is important to prevent end-users from entering invalid options.

    ![constraint](images/constraint.png " ")

2. To create the list of values, Click **App Builder** and select your application: **Modernization**.

    ![App Builder](images/app-builder1.png " ")

    ![modernization](images/modernization.png " ")

3. Click **Shared Components**.

    ![Shared Components](images/shared-comps.png " ")

4. Under **Other Components**, Click **List of Values**.

    ![List of Values](images/lov1.png " ")

5. Click **Create**.

    ![Create List of Values](images/create-lov.png " ")

6. Create List of Values from Scratch and Click **Next**.

    ![Create List of Values](images/scratch-lov.png " ")

7. Under Name and Type, enter/select the following:

    - Name: **S\_CUSTOMER.CREDIT\_RATING**

    - Type: **Static**.

    Click **Next**.

    ![Create List of Values](images/credit-rate-lov.png " ")

8. Enter the following Display Values and Return Values:

    | Display Value | Return Value |
    |---------------|--------------|
    |Excellent      | EXCELLENT |
    |Good           | GOOD |
    | Poor          | POOR |
    {: title="List of Values"}

   Click **Create List of Values**.

   ![Create List of Values](images/values-lov.png " ")

9. Click **Create** to create another list of values.

10. For Name: Enter **SALES\_REP\_LOV** and Click **Next**.

    ![Create List of Values](images/sales-rep-lov.png " ")

11. Under **List of Values Source**, enter/select the following:

    - Source Type: **SQL Query**

    - Enter a SQL SELECT statement: Copy and Paste the below query into the code editor:

    ```
    <copy>
    select Distinct e.FIRST_NAME ||' '|| e.LAST_NAME AS d,
       e.id as r
    from s_emp e, s_customer c
    where e.id = c.sales_rep_id;
    <copy>
    ```

    Click **Next**.

    ![Create List of Values](images/sql-query.png " ")

## Task 2: Customize the Customer Form

When the wizard creates a form, an item is automatically created for each column in the table. Depending on the column type, it creates a Text Field, Text area, Date Picker, or Number Field item.

Once the page is created, you can make the changes you need. Select a different type of element, edit the label and more. Moreover, you can organize items by dragging and drop them.

To use the list of values previously created:

1. Navigate to **Application ID** and select your application.

    ![App Builder](images/nav-app-id.png " ")

2. Select **3 - Customer**.

    ![App Builder](images/select-cust.png " ")

3. Organize items by dragging and dropping them.

    ![App Builder](images/sequence-items.png " ")

4. In the left pane, select **PX\_CREDIT\_RATING**. In the Property Editor, update the following:

    - Identification > Type: **Radio Group**

    - Settings > Number of Columns: **3**

    - Under List of Values:

        - Type: **Shared Component**

        - List of Values: **S\_CUSTOMER.CREDIT\_RATING**

        - Display Extra Values: **Toggle Off**

        - Display Null Value: **Toggle Off**

  Click **Save**.

   ![App Builder](images/credit-rate-radio.png " ")

## Task 3: Customize the Faceted Search

You can define which facets to filter the data. Some are defined automatically, but you can create or delete them as needed. You can also drag and drop facets to change their display order.

1. From the Page designer, Navigate to the **Customer Faceted Search**.

    ![App Builder](images/nav-to-search.png " ")

2. In the left pane, under **Search**, Right-click **Facets** and click **Create Facet**.

    ![App Builder](images/create-facets.png " ")

3. Create the following three facets one after the other:

    | NAME | TYPE | LABEL | LIST OF VALUES TYPE | LIST OF VALUES |
    |----- | ----- | ----- | -------------------- | -------------- |
    |PX\_CITY | Checkbox Group | City | Distinct Values |   |
    | PX\_NAME | Checkbox Group | Name | Distinct Values |   |
    | PX\_SALES\_REP\_ID | Checkbox Group |Sales Rep | Shared Component| SALES\_REP\_LOV|
    {: title="Facets"}

    ![App Builder](images/sales-rep-lov1.png " ")

4. Now organize the facets in the following order:
    |Facets|
    |------|
   |PX\_CREDIT\_RATING|
   |PX\_REGION\_ID|
    | PX\_COUNTRY |
    | PX\_CITY |
    | PX\_NAME |
    | PX\_SALES\_REP\_ID |
    {: title="Reorder Facets"}

    ![App Builder](images/sequence.png " ")

5. Click Save.

## Task 4: Customize the Interactive Report

In this task, you will define how end-users can interact with and personalize their report views using Oracle APEX Interactive Reports. Interactive Reports offer a powerful way to present data, allowing both developers and end-users to tailor the reports to their needs. Developers can define primary or alternative reports, while end-users can save private reports for their individual use.

1. **Run** the application as a developer.

    ![App Builder](images/run-app2.png " ")

2. Navigate to **Customer Interactive Report**.

    ![App Builder](images/cust-interactive-report.png " ")

3. Click **Actions** and select **Columns**.

    ![App Builder](images/actions.png " ")

4. Move the columns **Comments, Region, Zip Code** from **Display in Report** region to **Do Not Display** region. There are two ways to do it:
    - Go to the column and double click on the column.
    - Click the column and remove it by clicking the icon Remove (<).

    ![App Builder](images/do-not-display.png " ")

5. In **Display in Report** region, select the column **Credit Rating**. Click the icon Up **(↑)** to move it up to the second place and Click **Apply**.

    ![App Builder](images/credit-rating.png " ")

6. Click **Actions** and select Click **Format** > **Control Break**.

    ![App Builder](images/control-break.png " ")

7. For Column, select the column **Name** and Click **Apply**.

    ![App Builder](images/control-break-name.png " ")

8. To save the primary report, Click **Actions** > **Report** > **Save Report**.

    ![App Builder](images/save-report1.png " ")

9. For Save, select **As Named Report**.

    ![App Builder](images/as-named-report.png " ")

10. For Default Report Type, select **Primary** and Click **Apply**.

    ![App Builder](images/primary-apply.png " ")

*Note: Please remember that the value "X" in "PX_ITEM" depends on the APEX page you're working on.*

## Task 5: Enhance Navigation Menu

In this lab, you will learn how to manage the navigation menu in an APEX application. By default, an APEX application includes a Navigation Menu, which can be displayed either on the side or across the top of the application. This menu is customizable, and you also have the option to remove it entirely if desired.

For this task, you will focus on cleaning up the navigation menu by creating two new entries: one for Customers and another for Orders. Follow the steps outlined below to add these new entries to the Navigation Menu.

1. Navigate to **Shared Components**.

    ![App Builder](images/shared-comps2.png " ")

2. Under **Navigation and Search**, Click **Navigation Menu**.

    ![App Builder](images/nav-menu2.png " ")

3. Click **Navigation Menu**.

    ![App Builder](images/nav-menu3.png " ")

4. Click **Create Entry**.

    ![App Builder](images/create-entry.png " ")

5. Enter/select the following:

    - Under Entry:

       - Sequence: **15**

       - Image/Class: **fa-user-circle**

       - List Entry Label: **Customers**

    - Target > Target type: **No Target**

     Click **Create and Create Another**.

     ![App Builder](images/cust-nav.png " ")

6. Enter/select the following:

    - Under Entry:

       - Sequence: **20**

       - Image/Class: **fa-forms**

       - List Entry Label: **Orders**

    - Target > Target type: **No Target**

     Click **Create List Entry**.

     ![App Builder](images/order-nav.png " ")

7. Customers and Orders entries are created and now you need to define the Parent List Entry for the rest of the entries. In the Desktop Navigation Menu, go to the Customer and Order options to select the proper parent entry.

8. Click each Customer entries. For Parent list entry, select **Customers** and click **Apply Changes**.

    ![App Builder](images/parent-list.png " ")

    ![App Builder](images/customers-nav.png " ")

9. Click each Order entries. For Parent List Entry, select **Orders** and click **Apply Changes**.

10. Finally, the Menu looks cleaner and easy to use.

    ![App Builder](images/menu.png " ")

## Task 6: Set Authentication Scheme

In this lab, you will learn how to disable authentication in an APEX application. Authentication is the process of verifying each user's identity before they can access your application. This typically involves entering a username and password, but can also include the use of digital certificates or secure keys.

Since this application is intended to be public, we will disable the authentication feature. Follow these steps to turn off authentication:

1. Navigate to **Shared Components**.

    ![App Builder](images/shared-comp3.png " ")

2. Under **Security**, Click **Authentication Schemes**.

    ![App Builder](images/authentication-scheme.png " ")

3. Click **Create**.

    ![App Builder](images/create-authen.png " ")

4. For Create Scheme, select: **Based on a pre-configured scheme from the gallery** and Click **Next**.

    ![App Builder](images/sratch-next.png " ")

5. Under Name, enter/select the following:

    - Name: **No Authentication**

    - Scheme Type: **No Authentication**

     Click **Create Authentication Scheme**.

    ![App Builder](images/no-authentication.png " ")

6. Click **No Authentication**.

    ![App Builder](images/click-no-authen.png " ")

7. Click **Make Current Scheme** and click **OK**.

    ![App Builder](images/make-current-scheme.png " ")

    ![App Builder](images/ok-current-scheme.png " ")

## Summary

In this lab, you enhanced the functionalities of Oracle Forms using APEX. Building on the business logic analysis from Lab 1, you modernized the application by configuring the Credit Rating with a Static LOV, customizing the Customer Form, Faceted Search, and Interactive Report. Additionally, you improved the Navigation Menu and Authentication Scheme, and make various UI enhancements. These steps demonstrate how to leverage Oracle APEX to create a more user-friendly and functional application.

## Acknowledgements

- **Author** - Monica Godoy, Senior Principal Product Manager ; Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, July 2024
