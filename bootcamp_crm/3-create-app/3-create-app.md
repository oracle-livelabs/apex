# Build Enterprise AI Apps Faster - Part 1

## Introduction

In this lab, you will build an interactive CRM Management application using the Create Application Using Generative AI feature in Oracle APEX.

Instead of manually creating pages, you will use natural language prompts to generate an application blueprint. The application will be based on the custom data model created in the previous lab, providing a practical foundation for a CRM solution.

You will then enhance the AI-generated application by:

- Customizing the dashboard

- Improving report layouts

- Refining form usability

- Adding visual insights using charts

This lab demonstrates how Generative AI accelerates application development while still allowing full customization using APEX.

Estimated Time: 20 minutes

### Objectives

- Refresh the Data Dictionary to synchronize schema changes

- Create an application using the Generative AI wizard

- Use natural language prompts to modify an application blueprint

- Customize dashboards with charts and reports

- Enhance faceted search pages using Content Row layout

- Improve form usability with LOVs and select lists

### Prerequisites

- All previous labs are completed.

## Task 1: Refresh Data Dictionary

When we generate a data model, the database updates instantly but APEX’s schema metadata doesn’t. Refreshing the Data Dictionary ensures APEX reads the latest tables and makes them available in wizards and builders.In this task, we will refresh the Data Dictionary to synchronize APEX with the updated schema.

1. To refresh database objects, navigate to APEX Administration beside your user profile. Select **Manage Service**.

    !["Click App Builder"](images/admin.png "")

2. Click **Manage Service**.

    !["Click App Builder"](images/manage-services.png "")

3. On the right-hand side task list, under **Manage Meta Data**, select **Data Dictionary Cache**.

    !["Click App Builder"](images/data-dictionary.png "")

3. Click **Refresh Cache Only** to manually refresh the cache.

    !["Click App Builder"](images/refresh-cache.png "")

4. Verify that the cache has been refreshed and the tables are visible.

    !["Click App Builder"](images/cache-tables.png "")

## Task 2: Create the Application using Generative AI

In this task, you will create a CRM application using the Create Application Using Generative AI feature. Instead of manually selecting tables and pages, you will describe your application requirements in natural language, and APEX Assistant will generate the application blueprint.

1. From your APEX workspace top navigation bar, click **App Builder**.

    !["Click App Builder"](images/app-builder-create.png "")

2. Click **Create a New App**.

    !["Click create App"](images/new-app.png "")

3. Select **Create App Using Generative AI**.

    !["Click create app using Gen AI"](images/create-app-gen-ai.png "")

4. To create a CRM application, you will use the APEX Assistant wizard. Enter the prompts mentioned below and hit **Enter**.

    **Prompt 1:**

    ```
    <copy>
    Create a CRM application. Include pages to manage leads, Opportunities. Make leads searchable.
    </copy>
    ```

    !["first prompt"](images/prompt1.png "")

    *Important Note:* The prompt may not always generate all pages or include every table. This behavior can vary depending on the AI service provider. If some pages are missing, you can ask the AI service to update your blueprint by specifying the additional pages you need.

5. Now, you need a Form page to edit leads. Enter the prompt mentioned below and hit **Enter**.

    **Prompt 2:**
    ```
    <copy>
    Add a Leads Edit form.
    </copy>
    ```

    !["second prompt"](images/prompt2.png "")

6. Additionally, you want to add a dashboard as home page and enable the **Feedback** feature.

    **Prompt 3:**
    ```
    <copy>
    Add a dashboard page and make it the home page. Also enable Feedback feature.
    </copy>
    ```

    !["third prompt"](images/prompt3.png "")

7. After reviewing the generated blueprint, click **Create Application**.

    !["sixth prompt"](images/create-app.png "")

    *Important Note:The pages might differ based on the prompt. Make sure that you have **Dashboard page**, a form page to edit leads and **Lead page created as Faceted Search page** by giving appropriate prompts.*

8. Click the application icon to upload a custom icon.

    !["sixth prompt"](images/edit-icon.png "")

9. In the Choose Application Icon wizard, upload your own icon by selecting or dragging and dropping an image. Download the icon from **[here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2Fcrm-logo.png)**.

    !["sixth prompt"](images/upload-icon.png "")

10. Once you select an image, the wizard allows you to crop or resize the image. Click **Save Icon**.

    !["sixth prompt"](images/icon-save.png "")

11. Update the application name to **Customer Hub**.

    !["sixth prompt"](images/click-create-app.png "")

12. Click **Create Application**.

    ![click create application](images/click-create-app.png " ")

## Task 3: Run the Application

Now that the application has been created, you will run it to review the AI-generated pages and explore the default functionality.

1. Click **Run Application**.

    ![run the application](images/run-ap.png " ")

2. The login page will be displayed.

    Enter your **Username** and **Password**. Click **Sign In**.

    The new application will be displayed.

    ![input login credentials](images/login-page.png " ")

3. Play around with the application and explore the different pages.

    - Dashboard page

    - Leads faceted search page

    - Opportunities page

    - Leads form page

    ![display project dashboard page](images/dash.png " ")

    ![display project dashboard page](images/faceted.png " ")

## Task 4: Create New Chart Regions in Dashboard Page.

In this task, you will enhance the dashboard by adding visual insights.

You will create:

- A Pie Chart showing Sales Pipeline by Stage

- A Classic Report showing Top 10 Accounts by Revenue

1. Navigate to **CRM Dashboard** page.

2. Navigate to developer toolbar. Click **Page 1**

    ![display project dashboard page](images/page1.png " ")

3. Right-click **Body** and select **Create Region**.

    ![display project dashboard page](images/create-region.png " ")

4. In the right pane, enter/select the following:

    - Under Identification:

        - Name: **Sales Pipeline By Stage**

        - Type: **Chart**

    ![display project dashboard page](images/sales-chart.png " ")

5. Navigate to **Attributes** tab, update Chart > Type to **Pie**.

    ![display project dashboard page](images/chart-attribute.png " ")

6. In the left pane, under **Series**, select **New**. In the right pane,  enter/select the following:

    - Under Source:

        - Type: **SQL Query**

        - SQL Query: Open Code Editor

    ![display project dashboard page](images/chart-sql.png " ")

7. In the Code Editor, select **APEX Assistant**.

    ![display project dashboard page](images/apex-assistant.png " ")

8. In the APEX Assistant dialog, enter the following prompt and press enter:

    **Prompt 1:**
    ```
    <copy>
    Give me a breakdown of the sales pipeline by stage
    </copy>
    ```

    ![display project dashboard page](images/chart-prompt.png " ")

9. Once it generates the SQL Query, click **Insert**.

    ![display project dashboard page](images/chart-insert.png " ")

10. Let's replace the SQL Query from the **Code Editor** with the below SQL Query:

    > Note: We are replacing the code to ensure the lab can be completed as intended. The replacement is only for consistency with the lab steps and expected results.

    ```
    <copy>
    select co.stage,
       count(co.id)   as opportunity_count
    from crm_opportunities co
    group by co.stage
    order by co.stage
    </copy>
    ```

11. Once you replace the code, validate the SQL query and click **OK**.

    ![display project dashboard page](images/replace-code.png " ")

12. In the right pane, enter/select the following:

    - Under Column Mapping:

        - Label : **STAGE**

        - Value: **OPPORTUNITY_COUNT**

    ![display project dashboard page](images/column-mapping.png " ")

13. Click **Save and Run**.

    ![display project dashboard page](images/save-run.png " ")

14. Now, take a moment to admire.

    ![display project dashboard page](images/pie-chart.png " ")

15. Let's create another region. In the runtime environment, navigate to developer toolbar and select **Page 1**.

    ![display project dashboard page](images/nav-page1.png " ")

16. Right-click **Body** and select **Create Region**.

    ![display project dashboard page](images/create-region-report.png " ")

17. In the right pane, enter/select the following:

    - Under Identification:

        - Name : **Top 10 Accounts by Revenue**

        - Type : **Classic Report**

    - Layout > Start New Row: **Toggle Off**

    - Under Source:

        - Type: **SQL Query**

        - SQL Query: Open the Code Editor

    ![display project dashboard page](images/classic-report.png " ")

    ![display project dashboard page](images/report-code-editor.png " ")

18. In the Code Editor dialog, select **APEX Assitant**.

     ![display project dashboard page](images/apex-assistant.png " ")

19. In the APEX Assistant dialog, enter the following prompt and press enter:

    **Prompt 1:**
    ```
    <copy>
    Display Top 10 Accounts by Revenue
    </copy>
    ```

    ![display project dashboard page](images/report-prompt.png " ")

20. Once it generates the SQL Query, click **Insert**.

    ![display project dashboard page](images/report-insert.png " ")

21. Let's replace the SQL Query from the **Code Editor** with the below SQL Query:

    > Note: We are replacing the code to ensure the lab can be completed as intended. The replacement is only for consistency with the lab steps and expected results.

    ```
    <copy>
    select ca.id,
       ca.name,
       sum(co.amount) as total_revenue
    from crm_accounts       ca
    join crm_opportunities  co
        on ca.id = co.account_id
    group by ca.id,
          ca.name
    order by total_revenue desc
    fetch first 10 rows only
    </copy>
    ```

22. Once you replace the code, validate the SQL query and click **OK**.

    ![display project dashboard page](images/report-validate.png " ")

23. Under **Top 10 Accounts by Revenue** region, expand the columns. Select **ID** and update type to **Hidden**.

    ![display project dashboard page](images/id-hidden.png " ")


24. Select **Total Revenue** Column and update Format Mask to **FML999G999G999G999G990D00**.

    ![display project dashboard page](images/format-mask.png " ")

25. Click **Save and Run**.

    ![display project dashboard page](images/save-run1.png " ")

26. Take a moment to admire the classic report.

    ![display project dashboard page](images/view-report.png " ")

## Task 5: Enhance Leads screen UI

In this task, you will improve the Leads faceted search page by converting it to a modern Content Row layout and enhancing the visual presentation.

1. In the runtime environment, navigate to faceted search page (in my case it's Discover Potential Clients). Navigate to developer toolbar, **Quick Edit** on Report.

    ![display project dashboard page](images/quick-edit-faceted.png " ")

    ![display project dashboard page](images/select-report.png " ")

2. In the right pane, change the Report type to **Content Row**.

    ![display project dashboard page](images/change-type.png " ")

3. Expand the columns, select **ACCOUNT_ID**. In the right pane, enter/select the following:

    - Under List of Values:

        - Type: **SQL Query**

        - SQL Query: Copy and paste the below SQL Query

            ```
            <copy>
            SELECT name as d, id as r from CRM_ACCOUNTS;
            </copy>
            ```

    ![display project dashboard page](images/account-id.png " ")

4. Select **Leads** region, navigate to **Attributes** tab and enter/select the following:

    - Under Settings:

        - Overline: **&SOURCE.**

        - Title : **&FIRST\_NAME. &LAST\_NAME.**

        - Description: **&ACCOUNT_ID. <br> &EMAIL.**

        - Display Avatar: **Toggle On**

        - Display Badge: **Toggle On**

    ![display project dashboard page](images/report-attributes.png " ")

    ![display project dashboard page](images/report-attributes1.png " ")

    - Under Badge:

        - Label: **Status**

        - Value: **STATUS**

        - Position : **End**

        - Alignment: **Center**

    ![display project dashboard page](images/badge.png " ")

5. Under **Leads** region, right-click **Actions** and select **Create Action**.

    ![display project dashboard page](images/create-action.png " ")

6. In the right pane, select Identification > Position: select **Title Link**.

7. Under Link > Target, click **No Link Defined**.

    ![display project dashboard page](images/title-link.png " ")

8. In the Link Builder dialog, enter/select the following:

    - Target : Leads Form Page (in my case it's Page 6)

    - Set Items:

        | Name | Value |
        | ----- | ---- |
        | P6_ID | &ID.|
        {: title="Set Items"}

        - Clear Cache: **6**

        Click **OK**.

    >Note: Page number may vary depending on your application.

    ![display project dashboard page](images/link-builder.png " ")

9. Click **Save and Run**.

    ![display project dashboard page](images/save-run2.png " ")

10. View the enhanced content row page.

    ![display project dashboard page](images/view-content-row.png " ")

11. Click on Name, it will open the leads form page.

    ![display project dashboard page](images/view-link.png " ")


## Task 6: Enhance the Leads Edit Form

In this final task, you will improve the usability of the Leads Edit Form by converting fields into interactive LOV components.

1. On Leads form page, navigate to developer toolbar and **Quick Edit** on **Account** Page item.

    ![display project dashboard page](images/quick-account-name.png " ")

2. In the right pane, update the following:

    - Identification > Type: **Popup LOV**

    - Settings >Fetch on Search: Toggle **ON**

    ![display project dashboard page](images/popup-lov.png " ")

3. Navigate to **P4_STATUS** page item. In the right pane, enter/select the following:

    - Identification > Type: **Select List**

    - Under List of Values:

        - Type: **Static Values**

        - Display Extra Value: Toggle **Off**

        - Display Null Value: Toggle **Off**

        ![display project dashboard page](images/status-list.png " ")

        - Static Values: Click **Display1, Display2**

            | Display | Return |
            | ----- | ---- |
            | New | New|
            | Working | Working |
            | Converted | Converted |
            | Closed | Closed |
            {: title="Static Values"}

            - Sort > Sort at Runtime: Toggle **Off**

            - Click **OK**.

        ![display project dashboard page](images/static-values.png " ")

4. Click **Save**.

    ![display project dashboard page](images/save.png " ")

5. Refresh the runtime environment application. Open the leads form page and view the changes.

    ![display project dashboard page](images/view-account.png " ")

    ![display project dashboard page](images/view-status.png " ")


## Summary

In this lab, you successfully:

- Used Generative AI to create a CRM application

- Modified the application blueprint using natural language prompts

- Created a dashboard with a Pie Chart and Classic Report

- Enhanced a faceted search page using Content Row layout

- Improved form usability using Popup LOVs and Select Lists

This lab demonstrated how Generative AI accelerates application development while still allowing full customization using Oracle APEX’s powerful low-code capabilities.

## Acknowledgments

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, February 2026
