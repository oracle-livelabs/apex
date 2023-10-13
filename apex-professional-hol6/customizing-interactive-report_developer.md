# Customize Interactive Report as a Developer

## Introduction

In this Hands-on-lab, you will Manage and Customise the Interactive report in the **Sample Reports** application as a **Developer**.

Estimated Time: 15 minutes

### Objectives

In this lab, you:
- Customise the Interactive Report page you have have in **Sample Reports** Application both as a **Developer**.

### Downloads

- Did you miss out trying the previous labs? Don’t worry! You can download the application from **[here](files/sample-reporting-1.sql)** and import it into your workspace. To run the app, please run the steps described in **[Get Started with Oracle APEX](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.


## Task 1: Customize an Interactive report as a Developer

In this lab, you edit an interactive report in page designer and customize it for end users.
1. First, view the Interactive Report in page designer. In the Developer Toolbar,
   click **Edit Page \<n\>**.

    ![](images/click-page1.png " ")  

2. When the end users click an edit icon for a specified row, they should be directed to a page which shows the column values for that row. The interactive report currently has a link column to a Form Page. Modify your interactive report to have a link to single row view.
    a) Under Rendering, navigate to **Projects** Interactive Report and then on the Property Editor select **Attributes**. Under **Link**, for **Link Column**, select **Link to Single Row View**. Click **Save and Run Page**.

    ![](images/change-srw.png " ")

    b)  In the report, ensure that you've selected the "1. Primary Report" the report toolbar. click the **edit icon** (**pencil**) for any row.

    ![](images/view-srw1.png " ")

    c) The single row view is displayed. Click **Report View** button to return to the report.

    ![](images/view-srw2.png " ")

3. The current pagination type of the interactive report is **Row Ranges X to Y**. Suppose you want to always show your end users the total number of rows in the report as part of the pagination display. In the Developer Toolbar, click **Edit Page \<n\>**.  

    a) Under Rendering, navigate to **Projects** Interactive Report and select **Attributes** in the **Property Editor**.  

    b) In the **Property Editor**, Under **Attributes**, Search for **Pagination**. For Type, **select Row Ranges X to Y of Z**.

    ![](images/change-pagination.png " ")

4. You want to customize the display of the Search Bar. End users should be able to select the display of desired number of rows per page.  
    In the property editor, locate **Search Bar** under **Attributes**. Perform the following:

    - Enable Rows Per Page Selector.
    - Enter **10** for **Maximum Rows Per Page**.

    ![](images/enable-rpp.png " ")

5. You want to disable the Email in the Download option of the Actions menu. In the property editor, navigate to Download. Deselect **Send as Email** download format.

6. You want to enable the **Excel** and **PDF** formats in the Download option of the **Actions** menu. In the property editor, navigate to Download. Select **Excel** and **PDF** download formats.

    ![](images/disable-email1.png " ")

7. Now that you finished the customization for end users, click **Save** and **Run Page**.

8. Notice that the **row selector** and the **New pagination type** are available on the report.

    ![](images/run-ir13.png " ")

9. Select **Actions** > **Report** > **Save Report**.

    ![](images/save-report2.png " ")

10. The Save Report dialog displays. Notice that the **Public** check box is now available. Perform the following:

    - For Save, select **As Named Report**
    - For **Name**, enter **Projects Public Report**
    - Enable the **Public** checkbox

    Click **Apply**.

    ![](images/save-report4.png " ")

11. This report is now saved as a public report for all users and is available in the Reports drop down list.

    ![](images/view-public-report.png " ")

12. Click **Actions** > **Download**.

13. Notice that the **Excel** and **PDF** formats are available. Click **Close** icon.

    ![](images/view-download1.png " ")

    ![](images/save-report5.png " ")

14. From the Reports drop down list, select **Primary Report**.

## Summary

You now know how to Manage and Customise the Interactive report as a developer. You may now **proceed to the next lab**.

## Acknowledgments

- **Author** - Roopesh Thokala, Product Manager
- **Contributor** - Roopesh Thokala, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, October 2023
