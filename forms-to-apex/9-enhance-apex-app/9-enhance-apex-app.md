# Enhance Your APEX App

## Introduction

After following the guidelines in the previous labs on best practices to modernize Forms in APEX, you will learn how to enhance pages in your app, the navigation menu, and the authentication scheme.

Estimated Time: 10 Minutes

### Objectives

In this lab, you will:

- Define and organize facets for the faceted search page to filter data effectively.
- Define and personalize the interactive report views, allowing end-users to interact with and save their report configurations.
- Create and organize navigation menu entries for customers and orders, and assign appropriate parent list entries to make the menu cleaner and more user-friendly.
- Disable authentication to make the application publicly accessible, suitable for a public-facing application.

## Task 1: Customize the Customer Form

When the wizard creates a form, an item is automatically created for each column in the table. Depending on the column type, it creates a Text Field, Text Area, Date Picker, or Number Field item.

Once the page is created, you can make the changes you need. Select a different type of element, edit the label and more. Moreover, you can organize items by dragging and drop them.

To use the list of values previously created:

1. Navigate to the page finder and select **Customer** Page.

    ![App Builder](images/nav-app-id1.png " ")

2. Organize items by dragging and dropping them as shown in the screenshot below.

    ![App Builder](images/sequence-items.png " ")

3. In the left pane, select **P3\_ADDRESS**. In the property editor, update the following:

    - Identification > Type: **Text Field**

    ![App Builder](images/hidden-address.png " ")

4. Select **P3\_CREDIT\_RATING**. In the property editor, update the following:

    - Identification > Type: **Radio Group**

    - Settings > Number of Columns: **3**

    - Under List of Values:

        - Type: **Shared Component**

        - List of Values: **S\_CUSTOMER.CREDIT\_RATING**

        - Display Extra Values: **Toggle Off**

        - Display Null Value: **Toggle Off**

    ![App Builder](images/credit-rate-radio.png " ")

5. Click **Save**.

## Task 2: Customize the Faceted Search

You can define which facets to filter the data. Some are defined automatically, but you can create or delete them as needed. You can also drag and drop facets to change their display order.

1. Navigate to the page finder and select the **Customer - Faceted Search** Page.

    ![App Builder](images/nav-to-search.png " ")

2. In the left pane, under **Search**, right-click **Facets** and select **Create Facet**.

    ![App Builder](images/create-facets1.png " ")

3. Create the following three facets one after the other:

    | NAME | TYPE | LABEL | LIST OF VALUES TYPE | LIST OF VALUES |
    |----- | ----- | ----- | -------------------- | -------------- |
    |P2\_CITY | Checkbox Group | City | Distinct Values |   |
    | P2\_NAME | Checkbox Group | Name | Distinct Values |   |
    | P2\_SALES\_REP\_ID | Checkbox Group |Sales Rep | Shared Component| SALES\_REP\_LOV|
    {: title="Facets"}

    ![App Builder](images/city-facet.png " ")

    ![App Builder](images/name-facet.png " ")

    ![App Builder](images/sales-rep-lov1.png " ")

4. Now organize the facets in the following order:
    - P2\_CREDIT\_RATING
    - P2\_REGION\_ID
    - P2\_COUNTRY
    - P2\_CITY
    - P2\_NAME
    - P2\_SALES\_REP\_ID

    ![App Builder](images/sequence.png " ")

5. Click **Save**.

## Task 3: Customize the Interactive Report

In this task, you will define how end-users can interact with and personalize their report views using Oracle APEX Interactive Reports. Interactive reports offer a powerful way to present data, allowing both developers and end-users to tailor the reports to their needs. Developers can define primary or alternative reports, while end-users can save private reports for their individual use.

1. Navigate to the page finder and select the **Customer - Interactive Report** Page.

    ![App Builder](images/navigate-to-2.png " ")

2. In the left pane, select **Customer** region and expand the columns.

3. Click the **Name** column and in the property editor, enter/select the following:

    - Identification > Type: **Link**

    - Under Link:

        - Target: click **No Link Defined**

            - Page: **3**

            - Set Item as follows:

            | Name | Value |
            | ---- | ----- |
            | P3\_ID | #ID#  |
            {: title="Set Items"}

           - Clear cache: **3**

           Click **OK**.

    ![App Builder](images/name-link.png " ")

4. **Save and Run** the page.

    ![App Builder](images/run-app2.png " ")

5. Click **Actions** and select **Columns**.

    ![App Builder](images/actions1.png " ")

6. Move the columns **Comments, State, Zip Code** from **Display in Report** region to **Do Not Display** region. There are two ways to do it:

    - Go to the column and double click on the column.

    - Click the column and remove it by clicking the icon Remove (<).

    ![App Builder](images/do-not-display.png " ")

7. In **Display in Report** region, select the column **Credit Rating**. Click the icon Up **(↑)** to move it up to the second place and click **Apply**.

    ![App Builder](images/credit-rating.png " ")

8. Click **Actions** and select **Format** > **Control Break**.

    ![App Builder](images/control-break.png " ")

9. For column, select the column **Region** and click **Apply**.

    ![App Builder](images/control-break-name2.png " ")

10. To save the primary report, click **Actions** > **Report** > **Save Report**.

    ![App Builder](images/save-report.png " ")

11. For save, select **As Default Report Settings**.

    ![App Builder](images/as-named-report1.png " ")

12. For default report type, select **Primary** and click **Apply**.

    ![App Builder](images/primary-apply12.png " ")

## Task 4: Enhance Navigation Menu

In this task, you will learn how to manage the navigation menu in an APEX application. By default, an APEX application includes a navigation menu, which can be displayed either on the side or across the top of the application. This menu is customizable, and you also have the option to remove it entirely if desired.

For this task, you will focus on cleaning up the navigation menu by creating two new entries: one for Customers and another for Orders. Follow the steps outlined below to add these new entries to the navigation menu.

1. Navigate to **Shared Components**.

    ![App Builder](images/shared-comps2.png " ")

2. Under **Navigation and Search**, click **Navigation Menu**.

    ![App Builder](images/nav-menu2.png " ")

3. Click **Navigation Menu**.

    ![App Builder](images/nav-menu3.png " ")

4. Click **Create List Entry**.

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

        - Sequence: **16**

        - Image/Class: **fa-forms**

        - List Entry Label: **Orders**

    - Target > Target type: **No Target**

    Click **Create List Entry**.

     ![App Builder](images/order-nav.png " ")

7. Customers and orders entries are created and now you need to define the parent list entry for the rest of the entries. In the desktop navigation menu, go to the Customer and Order options to select the proper parent entry.

8. Click each customer entries. For **Parent List Entry**, select **Customers** and click **Apply Changes**.

    ![App Builder](images/parent-list.png " ")

    ![App Builder](images/customers-nav.png " ")

9. Click each order entries. For **Parent List Entry**, select **Orders** and click **Apply Changes**.

    ![App Builder](images/orders-nav.png " ")

10. The **Orders Form** entry is unnecessary, click on the entry and delete it.

    ![App Builder](images/edit-cust.png " ")

    ![App Builder](images/del-order.png " ")

    ![App Builder](images/del-order-ok.png " ")

11. Finally, the menu looks cleaner and easy to use.

    ![App Builder](images/menu.png " ")

## Task 5: Set Authentication Scheme

In this lab, you will learn how to disable authentication in an APEX application. Authentication is the process of verifying each user's identity before they can access your application. This typically involves entering a username and password, but can also include the use of digital certificates or secure keys.

Since this application is intended to be public, we will disable the authentication feature. Follow these steps to turn off authentication:

1. Navigate to **Shared Components**.

    ![App Builder](images/shared-comp3.png " ")

2. Under **Security**, click **Authentication Schemes**.

    ![App Builder](images/authentication-scheme.png " ")

3. Click **Create**.

    ![App Builder](images/create-authen.png " ")

4. For **Create Scheme**, select: **Based on a pre-configured scheme from the gallery** and click **Next**.

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

In this lab, you learned how to enhance various aspects of your APEX app. Building on the business logic analysis from Lab 1, you customized the customer form, faceted search, and interactive report. Additionally, you improved the navigation menu and authentication scheme, and make various UI enhancements. These steps demonstrate how to leverage Oracle APEX to create a more user-friendly and functional application.

## Acknowledgements

- **Author** - Monica Godoy, Senior Principal Product Manager ; Ankita Beri, Product Manager; Paolo Paolucci, Data Development Specialist; Victor Mendo, Data Development Specialist
- **Last Updated By/Date** - Ankita Beri, Product Manager, January 2025
