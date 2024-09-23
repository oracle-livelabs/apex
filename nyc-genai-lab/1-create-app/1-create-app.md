# Create an APEX Application

## Introduction
In this lab, you learn to create an APEX application by importing data from a spreadsheet. APEX can build an app directly from a table that is created using a spreadsheet. Later, you learn to modify the pages and the theme of the application.

**Note:** The screenshots in this workshop are taken using Dark Mode in APEX 24.1.2

Estimated Time: 5 minutes

<!-- Watch the video below for a quick walk-through of the lab.
[Create an APEX App](videohub:1_a6bi2e62) -->

### Objectives

In this lab, you will:

- Create a new APEX application
- Configure a Cards region
- Customize the application theme using Theme Roller

### Prerequisites

- An Oracle APEX workspace

## Task 1: Load the Highschool Data

1. From your APEX workspace home page, click **App Builder**.

    ![Image showing clicking an App Builder](images/click-app-builder.png " ")

2. Click **Create a New App**.

    ![Image showing Create a New App option](images/new-app.png " ")

3. Click **Create App From a File**.

    ![Image showing the various options to create an application](images/from-a-file.png " ")

    When creating an application from a file, APEX allows you to upload CSV, XLSX, XML, or JSON files and then build apps based on their data. Alternatively, you can also copy and paste CSV data or load sample data.

4. Within the Load Data wizard, click the **Choose File** option or drag and drop the [nyc\_high\_schools.xlsx](files/nyc_high_schools.xlsx) file on to the dialog window.

    ![Image showing a wizard to upload a file](images/drag-and-drop.png " ")

5. Review the parsed data. Set Table Name to **HIGHSCHOOLS** and click **Load Data**. Note: You can configure what columns to load from the spreadsheet by clicking the **Configure** button.

    ![Image showing the Load Data wizard](images/new-table-name.png " ")

    After clicking **Load Data**, you will see a spinner until the wizard finishes loading the data. Continue to Task 2 at that point.

## Task 2: Create an Application

The Data Load wizard has created a new table and populated that table with the records from the sample data. Now you can create an app based on this new table.

1. In the Load Data dialog, verify that 427 rows have been loaded into the **HIGHSCHOOLS** table, then click **Create Application**.

    ![Image showing the success message of Load Data and options to View Table or Create Application](images/create-app-table.png " ")

2. On the Create Application page, click the application icon.
   ![Image showing the Create Application Page](images/app-thumbnail.png " ")

3. In the Choose Application Icon wizard, upload your own icon by selecting or dragging and dropping an image. Download a sample icon from [here](images/ai-highschools.png).
  ![Image showing the Choose Application Icon wizard](images/upload-icon.png " ")

4. Once you select an image, the wizard allows you to crop or resize the image. Click **Save Icon**.
    ![Image showing an icon editor in Choose Application Icon wizard](images/crop-and-save.png " ")

5. In the Create Application page, review the pages listed by default.

   Click the **Edit** button for **Highschools Search** and update the following:
    - Page Name: **Search and Apply**
    - For Page Type, choose **Cards** toggle button.

    ![Edit App page](images/app-edit.png " ")
    ![Edit Page wizard](images/edit-page-name.png " ")

6. For the Cards properties, select the following:
    - Title Column: **SCHOOL_NAME**
    - Body Column: **NEIGHBORHOOD**
    - Expand Advanced section and check the **Set as Home Page** box

    Click **Save Changes**.
    ![Edit Page wizard](images/cards-columns.png " ")

7. Next, we delete the pages that we no longer need. Click **Edit** next to the Home page.
    ![Edit Page wizard](images/edit-home.png " ")

8. Click **Delete**. In the dialog 'Would you like to perform this delete action?', select **OK**.
    ![Delete Page wizard](images/delete-home.png " ")

    ![Confirm Delete dialog](images/confirm-delete.png " ")

9. Repeat Steps 7 and 8 to delete the **Highschools Report** page.
    ![Delete page wizard](images/delete-report.png " ")

10. Repeat Steps 7 and 8 to delete the **Dashboard** page.
    ![Delete page wizard](images/delete-dashboard.png " ")

11. In the Create Application wizard, under Features, check the following checkboxes:
    - **Install Progressive Web App**
    - **Push Notifications**

    Click **Create Application**.

    ![Image showing the Create Application Page](images/create-final-app.png " ")

    When the wizard finishes creating the application, you will be redirected to the application's home page in the App Builder.

## Task 3: Configure the Cards Region

In this task, we configure the Cards region to display the information that we need.

1. Navigate to **Search and Apply** page.
    ![Application Home Page](images/select-page.png " ")

2. In the Rendering Tree, under Body, select **Search Results** region.

   In the Property Editor, enter/select the following:
    - Under Source:
        - Type: **SQL Query**
        - SQL Query: Replace the SQL query with the following
        ```
        <copy>
        select ID,
        BOROUGH,
        NEIGHBORHOOD ||', '|| BOROUGH as LOCATION,
        SCHOOL_NAME,
        NEIGHBORHOOD,
        INTEREST,
        METHOD,
        ATTENDANCE_RATE,
        GRADUATION_RATE,
        SCHOOL_SPORTS,
        TOTAL_STUDENTS,
        to_char(TOTAL_STUDENTS,'999G999G999G999G999') as total_students_disp,
        SAFE
        from HIGHSCHOOLS
        </copy>
        ```

        ![Page Designer](images/update-sql1.png " ")

        ![Page Designer](images/update-sql2.png =60%x*)

    - Advanced > Static ID: **S\_SEARCH\_RESULTS**
        ![Page Designer](images/search-static.png =40%x*)

3. Switch to the **Attributes** tab and select the following:
    - Title > Column: **SCHOOL_NAME**
    - Subtitle > Column: **LOCATION**
    - Body:
        - Advanced Formatting: Enable the Toggle Button to **ON**.
        - HTML Expression:
        ```
        <copy>
        <div class="a-CardView-mainContent">
            <strong>&INTEREST.</strong><br />
            <small>&TOTAL_STUDENTS_DISP. Students · &ATTENDANCE_RATE.% Attendance · &GRADUATION_RATE.% Grad</small>
        </div>
        </copy>
        ```

        ![Page Designer](images/edit-cards.png =40%x*)

4. Click **Save and Run** page.
    ![Page Designer](images/run-app.png " ")

    ![App login screen](images/login.png =40%x*)

    ![App is displayed](images/first-app.png " ")

## Task 4: Improve the UI

1. Click **Edit Page 1** from the Developer Toolbar.
    ![App is displayed](images/edit1.png " ")

2. In the Rendering Tree, select **Search**.

    In the Property Editor, switch to the **Attributes** tab and enter the following:
        - Total Row Count Label: **Schools:**

    ![Page Designer](images/row-count-label.png " ")

3. Under Breadcrumb Bar, select **Highschools**. In the Property Editor, enter the following:
    - Name: **New York City**
    - Title: **New York City**

    ![Page Designer](images/breadcrumb-title.png " ")

4. Under Body > Button Bar, right-click **RESET** and select **Delete**.

    ![Page Designer](images/reset-del.png " ")

5. Locate **P1\_ORDER\_BY** page item and drag and drop it under Button Bar.
    ![Page Designer](images/move-order-by.png " ")

6. In the Property Editor, enter/select the following:
    - Layout > Slot: **Next**
    - Under Appearance:
        - Template: **Hidden**
        - Icon: **fa-sort-amount-desc**

    - Advanced > CSS Classes: **no-item-ui**

    ![Page Designer](images/order-by-properties.png " ")
    - List of Values > Static Values: Enter the following and click **OK**.

        |Display Value | Return Value|
        |---------------|------------|
        |Total Students| TOTAL\_STUDENTS|
        |Attendance Rate| ATTENDANCE\_RATE|
        {: title="List of Values"}

    ![Page Designer](images/lov.png " ")

7. In the Rendering Tree, select **Search Results** region.

    In the Property Editor, under Source, select **Order by Item** and enter the following and then click **OK**.
    | Clause | Key | Display |
    |--------|-----|---------|
    | TOTAL\_STUDENTS desc| TOTAL_STUDENTS | Total Students|
    | SCHOOL\_NAME| SCHOOL\_NAME | School Name|
    | NEIGHBORHOOD| NEIGHBORHOOD| Neighborhood|
    | ATTENDANCE\_RATE desc| ATTENDANCE\_RATE | Attendance Rate|
    {: title="Order By Clauses"}

    ![Page Designer](images/order-by-item.png " ")

    ![Page Designer](images/clauses.png " ")

8. Click **Save and Run** page.

## Task 5: Customize the Application Theme

1. From the Developer Toolbar, click **Customize** and select **Theme Roller**.

    ![Application page in runtime](images/dev-toolbar.png " ")


2. In the Theme Roller dialog, enter/select the following: 
    - Select Theme: **Redwood Light**
    - Under Redwood Options:
        - Pillar: **Rose**
    - Under Appearance:
        - Header: **Dark**
        - Navigation: **Dark**
        - Body Header: **Dark**
    - Custom CSS: 
    ```    
        <copy>
        .a-FS-bodyInner .apex-item-checkbox {
            max-height: 320px;
            overflow: auto;
        }

        .no-item-ui {
            --a-field-input-border-width: 0px;
            --a-field-input-background-color: transparent;
        }

    </copy>
    ```

    
    ![Application page in runtime with Theme roller dialog open](images/theme-roller.png =50%x*)

3. Click **Save As**. In the dialog, for Style Name, enter **Redwood Light Custom**. Finally, click **Save**.
    ![Theme Roller Save as](images/theme-save.png =50%x*)

    ![App with redwood light theme](images/redwood-light.png " ")
    
    You have successfully customized the application theme.


## Summary

You now know how to create an Oracle APEX application from a spreadsheet. You also learnt to customize the pages and the theme of the application.

You may now **proceed to the next lab**.   

## Acknowledgments

 - **Authors** - Toufiq Mohammed, Senior Product Manager; Apoorva Srinivas, Senior Product Manager
 - **Contributing Author** - Pankaj Goyal, Member Technical Staff
 - **Last Updated By/Date** - Apoorva Srinivas, Senior Product Manager, July 2024


