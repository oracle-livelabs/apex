# Improve Report and Form

## Introduction

In this lab, you will gain an insight into the abilities of Interactive Reports, and learn how to enhance a form page.

Estimated Time: 20 minutes

Watch the video below for a quick walk-through of the lab.
[Improve the Report and Form](videohub:1_8a2fxcml)

### Objectives

In this lab, you will:

- Enhance Interactive Report.

- Improve  the Form.

- Enhance UX of the Form.

### Prerequisites

- Completion of workshop through Lab 2

## Task 1: Enhance the Interactive Report

The **NYC Highschools Report** page utilizes an Interactive Report to display the records. Interactive Reports are exceedingly powerful, as they allow _*end users*_ to modify what data is displayed, and various display characteristics. For this report, you will add a column break, a computational column, an aggregate, a chart, then order the data and save the report for everyone to see.

>**Note - All of the steps below, except for saving Alternative Reports, can be performed by end users. There are many additional capabilities available to end users which are not covered below.**

1. In the runtime environment, select **NYC Highschools Report**.

2. The report displays all the columns in the table. Customize the report by choosing only selected columns in a report. Click **Actions** and select **Columns**.

    ![Interactive Report Columns](images/select-columns.png " ")

3. In the Select Columns dialog, select the columns that you want to hide from the report by selecting a column and clicking on the left-chevron (<) in order to move it to the **Do Not Display** section. Or, double-click on a column in order to move it to the **Do Not Display** section. Hide the following columns:
    - Dbn
    - Latitude
    - Longitude
    - Language Classes
    - Advanced Placement Courses
    - School Sports

    Click **Apply**.

    ![Interactive Report Select Columns](images/do-not-display-columns.png " ")

4. The interactive report is displayed by hiding the selected columns from the previous step. Click the **Neighborhood** column heading, and then select **Control Break**.

    ![Interactive Report Control Break](images/col-break.png " ")

5. You can add a computational column, where a new column is defined based on a computation against one more existing columns in the report. Columns are selected within the computation using a letter associated with each column.

    At the top of the report, click **Actions**, select **Data**, and then select **Compute**.

    ![Interactive Report Compute](images/go-compute.png " ")

6. On Compute, enter the following and click **Apply**.

    | Property | Value |
    | --- | --- |
    | Column Label | **Application to Seat Ratio** |
    | Format Mask | **5,234.10** |
    | Computation Expression | **M / L** |

    ![Interactive Report Computation](images/set-compute.png " ")

    This adds a new column **Application to Seat Ratio** to your interactive report.

7. To calculate the average Application to Seat Ratio in each Neighborhood, click **Actions**, select **Data**, and then select **Aggregate**.

    ![Interactive Report Aggregate](images/go-aggregate.png " ")

8. On Aggregate, for Column select **Application to Seat Ratio**, for Function select **Average**, then click **Apply**.

    ![Interactive Report Aggregate](images/set-aggregate.png " ")

9. Even though you can see the average Application to Seat Ratio for each Neighborhood, it would be much easier to view the average on a chart to get an overall picture of the neighborhoods which have the best High Schools.

    In the report click **Actions**, select **Chart**.

10. In the Chart dialog, select / enter the following and click **Apply**.

    | Property | Value |
    | --- | --- |
    | Label | **Borough** |
    | Value | ****Application to Seat Ratio** |
    | Function | **Average** |
    | Orientation | **Horizontal** |

    ![Interactive Report Chart settings](images/set-chart.png " ")

    After you click **Apply**, the chart will be displayed. Hover over individual bars to view the neighborhood and the average. Toggle between the report view and chart view using the icons at the top of the report.

    ![Interactive Report Chart](images/view-chart.png " ")

11. You want to ensure that all of the records are ordered in the ascending order of School Name and descending order of seats, within each neighborhood.

    At the top of the report, click the **View Report** icon. Click **Actions**, select **Data**, and then select **Sort**.

    ![Interactive Report Sort](images/go-sort.png " ")

12. In the Sort dialog, select the following and click **Apply**.

    | Column | Direction | Null Sorting |
    | --- | --- | --- |
    | School Name | Ascending | Default |
    | Seats | Descending | Nulls Always Last |
    | Graduation Rate | Descending | Default |

    ![Interactive Report Sorting](images/set-sort.png " ")

13. Now that you have made all of these modifications to the Interactive Report, it is important to save the report layout. End users have the ability to save either *Private Reports*, only they can view, or *Public Reports*, that other end users can also view.

    >*{Note - As a developer you can remove the ability for _end users_ to save Public Reports by going to the report attributes in Page Designer.}*

    As a developer you also have the ability to save the report as the Primary (default) Report, or an Alternative Report. For this exercise you will save the report as a named Alternative Report.

    In the report, click **Actions**, select **Report**, and then select **Save Report**.

14. In the Save Report dialog, for Save(Only displayed for developers) select **As Default Report Settings**.

    >*Note - End users can save Private and Public reports, however, only developers (who have run the app from the App Builder) can save the Primary and Alternative reports.*

    ![Interactive Report Save report](images/save-report.png " ")

    On Save Default Report, select **Alternative**, for Name enter **Best Schools**, and click **Apply**.

   ![Interactive Report Save report](images/save-alternative.png " ")

    A new select list will be displayed at the top of the report which lists all of the saved reports available to the user.

15. To go back to how the end user will see the report when they first access the report, at the top of the report, select **1. Primary Report**. Click **Actions**, select **Report** and then select **Reset**.

    ![Interactive Report Reset](images/reset-primary.png " ")

16. Click **Apply** to confirm reset. The changes you have made to the report will be reset and the original report will be displayed.
    ![Confirm reset report](images/apply-reset.png " ")

## Task 2: Enhance the Form

Form pages allow end users to readily update a single record of information. It is very common for these pages to be modal pages, whereby they display over the top of the original page, and the original page is greyed out and not accessible without first closing the modal page. Advantages of modal pages include that the same page can be called from numerous other pages, they include all of the processing, validations, and so forth within the page definition, and they are user friendly and make for a very straight forward user experience.

By default, the form pages generated by the Create Application Wizard are modal pages. The modal page for maintaining NYC Highschools takes up significant real estate. This could easily be improved by placing the Graduation Rate, Attendance Rate and College Career Rate on the same line. Lastly, the **Borough** allows any values to be entered, so you should restrict data entry by adding a select list of Borough Names.

1. In the Runtime environment, on the **NYC Highschools Report** page, click the **edit icon** for any record.

    ![Edit NYC Highschool report](images/view-form.png " ")

    The modal form page for the selected record will be displayed.

2. In the Developer Toolbar, at the bottom of the screen, click **Edit Page 5**.

    >*Note - If you have difficulties navigating using the Developer Toolbar, manually navigate to the browser tab for the APEX App Builder. If you are on the application home page, navigate to the page by clicking _5 - Nyc Highschool_. If already on another page in Page Designer, use the page selector in the toolbar to navigate to page 5.*

3. Items can readily be moved using drag-and-drop within Layout. If required you can also drag _new_ components (regions, items, and buttons) from the Gallery, below Layout, into the Layout.

    In Page Designer, with Page 5 loaded, within Layout (middle pane), click **P5\_ATTENDANCE\_RATE** and continue to hold the mouse down. Drag the item up and to the right, until it is directly after **P5\_GRADUATION\_RATE**, and a dark yellow box is displayed. Release the mouse to drop the item in the new location.

    ![drag and drop page items](images/drag-attendance-rate.png " ")

4. As an alternative to using drag-and-drop you can also reposition items using attributes in the Property Editor.

    In Page Designer, within Layout (or the Rendering tree in the left pane), select **P5\_COLLEGE\_CAREER\_RATE**. In the Property Editor (right pane), deselect Layout > Start New Row.

    ![move career rate](images/move-career-rate.png " ")

    >*Note - As soon as you deselect Start New Row, the item will move to be on the same line as the item above, within Layout.*

5. To limit the data entry for an item, one of the simplest techniques is to convert a text item (which allows any data to be entered) into a select list.

    In Page Designer, within the Rendering tree (left pane), select **P5\_BOROUGH**. In the Property Editor (right pane), enter the following.

    | Group | Attribute | Value |
    | --- | --- | --- |
    | Identification | Type | **Select List** |
    | List of Values | Type | **SQL Query** |
    | | Display Extra Values | Uncheck |
    | | Null Display Value | Type in **- Select Borough -** |

    For List of Values > SQL Query enter the following code

    ```
    <copy> Select distinct borough d, borough r from nyc_highschools order by 1
    </copy>
    ```

    ![Update Borough attributes](images/set-status1.png " ")

6. It is important to save your changes before testing.

    In Page Designer, within the toolbar (at the top), click **Save**.

    ![Save changes](images/pd-save.png " ")

    >*Note - If you press Save and Run in the toolbar a message will be displayed, rather than the page being run. This is expected behavior, as modal pages can not be run directly from Page Designer.*

    ![save error](images/save-error.png " ")

7. Navigate back to the runtime environment and refresh the browser, or click **Cancel** on the modal page to return to the **NYC Highschools Report** page.

8. On the Project Tasks Report page, click the edit icon for any record.

    Review the improved layout and click on **Borough** to see the list of available values.

    ![Updated form](images/updated-form.png " ")

## Task 3: (OPTIONAL) Enhance the UX of the Form

In the previous task, you explored a few options to enhance the form. In this task, we further enhance the user experience of the form by splitting the form fields into multiple tabs. Currently, observe that the form contains a number of fields and the user needs to scroll through the form to view all the fields.

1. In the Runtime environment, on the **NYC Highschools Report** page, click the **edit icon** for any record.

    ![Edit record](images/edit-record.png " ")

    The modal form page for the selected record will be displayed.

2. In the Developer Toolbar, at the bottom of the screen, click **Edit Page 5**.

    ![Edit page 5](images/edit-page-5.png " ")

    >*Note - If you have difficulties navigating using the Developer Toolbar, manually navigate to the browser tab for the APEX App Builder. If you are on the application home page, navigate to the page by clicking _5 - Nyc Highschool_. If already on another page in Page Designer, use the page selector in the toolbar to navigate to page 5.*

3. Click **Nyc Highschool** in the rendering tree. In the Property Editor, navigate to **Appearance** and for Template select **Tabs Container**.

    ![Tab Container](images/tab-container.png " ")

4. To create a tab, right-click on **Nyc Highschool** and select **Create Sub Region**. Create 4 Sub Regions with the following values for **Name**:
    - General Information
    - Metrics
    - Location
    - Other Course Details

    ![Create sub region](images/create-sub-region.png " ")

5. In the Property Editor for each Sub Region, perform the following step:
    - Navigate to **Appearance**
    - Select **Template Options**
    - For **Header**, select **Hidden but accessible**

    ![Template option](images/template-option.png " ")

6. The Sub Regions created represents the different tabs. Drag and drop the form fields into their respective Sub Region as mentioned in the table.

    | Sub Region Name | Form Fields |
    |----------|----------|
    | **General Information** | P5\_BOROUGH <br> P5\_SCHOOL\_NAME <br> P5\_NEIGHBORHOOD <br> P5\_INTEREST <br> P5\_METHOD |
    | **Metrics** | P5\_TOTAL\_STUDENTS <br> P5\_GRADUATION\_RATE <br> P5\_ATTENDANCE\_RATE <br> P5\_COLLEGE\_CAREER\_RATE <br> P5\_SAFE<br> P5\_SEATS <br> P5\_APPLICANTS |
    | **Location** | P5\_LATITUDE <br> P5\_LONGITUDE |
    | **Other Course Details** | P5\_DBN <br> P5\_LANGUAGE\_CLASSES <br> P5\_ADVANCED\_PLACEMENT\_COURSES <br> P5\_SCHOOL\_SPORTS |

    ![drag and drop fields](images/drag-and-drop-fields.png " ")

7. Click **Save** to save your changes. Go to the runtime application and refresh the application. On the **NYC Highschools Report** page, click the **edit icon** for any record.
  Click on various tabs to view the form fields.

    ![Enhanced form](images/enhanced-form.png " ")

## Summary

You now know how _end-users_ can define custom reports using Interactive Reports, and you can easily improve form pages.

## Acknowledgements

- **Author/Contributors** -  Apoorva Srinivas, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, January 2025
