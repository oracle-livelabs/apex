# Customize Interactive Report as an End-user

## Introduction

In this hands-on lab, you will Manage and Customise the Interactive report in the **Sample Reports** application as an **End-user**.

Estimated Time: 20 minutes

### Objectives

In this lab, you:
- Customise your Interactive Report page in **Sample Reports** Application as an **End-user**.

### Downloads

- Did you miss out on trying the previous labs? Don't worry! You can download the application from **[here](files/sample-reporting-1.sql)** and import it into your workspace. To run the app, please run the steps described in **[Get Started with Oracle APEX](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.

## Task 1: Customize an Interactive report as an end-user.

 In this lab, you customize and use an interactive report as an end user.

1. To start with, run the **Sample Reporting** application. Click **App Builder**.

    ![App Builder](images/navigate-to-app-builder.png " ")

2. Navigate to **Sample Reporting** and then click **Run Application**.

    ![Run Application](images/navigate-to-sr.png " ")

    ![Run Application](images/run-application11.png " ")

3. In the **navigation menu** or in the **Cards Region**, click **Interactive Report**.

    ![Cards Region](images/click-ir.png " ")

4. Suppose you avoid displaying the report's **Start Date** and **End Date** columns. Also, you want the **Status** column to show just after the **Assigned To** column. Perform the following steps:  

    a) Click Actions and select Columns.

    ![select Columns](images/select-columns.png " ")

    b) The **Select Columns** dialog appears. The columns on the right are displayed, and those on the left are hidden. Select **Start Date** and **End Date** in **Display in Report group**, and move the selected columns into the **Do Not Display** list by clicking the left arrow **<**.

    ![Display in Report group](images/select-columns1.png " ")

    c) You can reorder the displayed columns using the arrows on the far right.
    Select **Status** in the Display in Report group and click the Down arrow once. Then, click **Apply**.

    ![reorder the displayed columns](images/select-columns3.png " ")

    d) The interactive report is displayed with the changes made in the above steps.

    ![interactive report](images/run-ir1.png " ")

5. Next, let's say you want to filter the report results. First, you want to filter the report to display rows which meet the criteria **Cost <= 2000**. Within these filtered results, you create another filter to show rows with **Project is Bug Tracker**. Perform the following steps:  

    a) Click Actions and select Filter.

    ![filtered results](images/select-filter1.png " ")

    b) For Filter Type, Select the following:

    - For **Column**: Select **Cost**
    - For **Operator**: Select **<=**
    - For **Expression**: Enter **2000**

    Then, click **Apply**.

    ![Filter Type](images/create-filter1.png " ")

   c) Next, add the second filter to the **Project** column. Click the **Actions** menu and select **Filter**.

    ![Filter](images/select-filter2.png " ")

   d) In the Filter Dialog, select the following:

    - For Column: Select **Project**
    - For Operator: Select **=**
    - From the Expression list: Select **Bug Tracker**

    Click **Apply**.

    ![Filter](images/create-filter2.png " ")

    ![Filter](images/run-ir2.png " ")

   e) Notice that two filters are applied. Fewer rows are displayed because only the rows that meet the filter criteria are displayed. You can remove each filter by clicking the Remove Filter icon next to the filter you want to remove.  
   Click the **Remove Filter** icon next to both filters.

    ![Remove Filter](images/delete-filter1.png " ")

6. Now, imagine you want to sort the report on the **Cost** column.

    a) Select **Actions** > **Data** > **Sort**.

    ![Sort](images/select-sort.png " ")

    b) Remove the existing sort columns under **Column** by using the select list in rows 2 and 3 of the Column column to restore the value to the default **- Select Column -**.

    ![Sort](images/create-sort1.png " ")

    c) Select **Cost** for Column, **Descending** for **Direction** and click **Apply**.

    ![Sort](images/create-sort2.png " ")

    d) The report is now sorted in the **Descending** order of **Cost**.

7. Create an aggregation against the **Available Budget** column. You want to display the sum of the **Available Budget**.  

    a) Select **Actions** > **Data** > **Aggregate**.

    ![Aggregate](images/select-aggregate.png " ")

    b) In the **Aggregate** dialog, select **Sum** for Function, **Available Budget** for Column. Click **Apply** to add the aggregation at the end of the last Column of the report

    ![Aggregate](images/create-aggregate1.png " ")

    c) The aggregate function is applied to the Column. Notice that the sum of **Available Budget** is displayed at the end of the report under the Column. Navigate to the last page to view the sum.

    ![Aggregate](images/run-ir3.png " ")

8. In the report, you want to include **Cost** calculated with tax. The computation you want to make is **Cost * 1.05**. You create a computed column in the interactive report.

    a) Select **Actions** > **Data** > **Compute**.

    ![Compute](images/select-compute1.png " ")

    b) The Compute dialog appears.  
      - For Column Label: Enter **Cost with Tax**.  
      - For Computation Expression: Click **Cost** under Columns alias. Click *1.05 under Keypad.

      Click **Apply**.

    ![Compute](images/create-compute1.png " ")

    c) The new computed Column **Cost with Tax** now appears in the report.

    ![Compute](images/run-ir5.png " ")

9. Create a Control Break on the **Project** column.

    a) Select **Actions** > **Format** > **Control Break**.

    ![Control Break](images/create-control-break.png " ")

    b) In the Control Break dialog, in row number 1, select **Project** for Column, and click **Apply**.

    ![Control Break](images/create-cb1.png " ")  

    c) The control break is now applied. Notice that the aggregation you created in a previous step appears at the end of each control break.

    ![Control Break](images/run-ir6.png " ")  

10. Let's say you want to highlight those rows with **Cost** value less than or equal to **500**. You add the highlighting to rows while continuing with the control break you created in the previous step.

    a) Select **Actions** > **Format** > **Highlight**.

    ![Highlight](images/select-highlight.png " ")

    b) In the Highlight dialog,

       - For **Name**: Enter **Cost less than or equals 500**

       - For **Background Color**: Enter **#d0f1cc**

       - For **Text Color**: Enter **#0000000**

       - For **Column**: Select **Cost**

       - For **Operator**: Select **<=**

       - For **Expression**: Enter **500**

      Click **Apply**.

    ![Highlight](images/create-highlight1.png " ")  

   c) Notice that the rows that meet the condition are highlighted in green.

    ![Highlight](images/run-ir7.png " ")    


11. Now, You want to control the number of rows displayed on your **Interactive Report** page.

    a) Select **Actions** > **Format** > **Rows Per Page** > **5**.

    ![Rows Per Page](images/select-rpp.png " ")

    b) Notice that the **Rows Per Page** in your Interactive Report is now **1-5**.

12. In your interactive report, you want to include a Chart to display the Average **Cost** for each **Project**. Your interactive report should include both the Report and Chart views to toggle.

    a) Select **Actions** > **Chart**.

    ![Chart](images/select-chart1.png " ")

    b) In the Chart dialog, select/enter the following:  
      - For Chart Type: Select **Bar**  
      - For Label: Select **Project**  
      - For Value: Select **Cost**  
      - For Function: Select **Average**  

      Click **Apply**.

    ![Chart](images/create-chart1.png " ")

    c) The chart is created. Toggle between the View Chart and View Report.

    ![Chart](images/run-ir9.png " ")

13. Create a Group By report to display each **Project** with the **Total Budget**.  
    a) Click View Report.  
       Select **Actions** > **Group By**.

    ![Group By](images/select-groupby.png " ")    

    b) In the Group By dialog, enter/select the following:  
      - For Group By Column: Select **Project**  
      - For Function: Select **Sum**  
      - For Column: Select **Budget**  
      - For Label: Enter **Total Budget**  
      - For Format Mask: Select **$5,324.10** from the Format Mask list of example formats.

      Make sure you **Enable Sum** and click **Apply**.

    ![Group By](images/create-groupby.png " ")   

    c) The Group By report is created. You also see the sum of the Budget. Notice that the icon for View Group By has also been added.

    ![Group By](images/run-ir10.png " ")

    d) Click the **X** to the right of **Edit Group By** to remove the filter.

    ![Group By](images/run-ir11.png " ")

14. You want to display the **Sum** of Cost that are available with each **Project** and **Assigned To**. The results should be in a crosstab format. Create a Pivot Report.  

    a) Click **Actions** > **Pivot**.

    ![Pivot](images/select-pivot.png " ")

    b)  In the Pivot dialog, enter/select:  
       - For Pivot Columns: Select **Assigned To**
       - For Row Columns: Select **Project**
       - For Functions: Select **Sum**
       - For Column: Select **Cost** and **Budget**
       - For Label: Select **Total Cost** and **Total Budget**
       - Set **Sum** to **Yes**.

      Click **Apply**.

    ![Pivot](images/create-pivot1.png " ")

    c) The Pivot report is displayed, and a View Pivot icon is created next to the Actions button.

    ![Pivot](images/run-ir12.png " ")

15. You want to save the report with all the customization.

    a) Select **Actions** > **Report** > **Save Report**.

    ![Save Report](images/save-report.png " ")

    b) Enter **My Private Report** for Name and click **Apply**.

    ![Save Report](images/save-report1.png " ")

16. A drop-down list automatically appears with the report you just created being selected. You can view the default primary report.
You want to reset the **Primary Report** back to the default settings and remove any customizations you have made.  

    a) Select **Primary Report** from the Reports drop-down list. The primary report is now displayed. You can make any changes to this report, which will not be reflected in the 'My Private Report' private report you just created.

    ![Primary Report](images/nav-primary-report.png " ")

    b) select **Actions** > **Report** > **Reset**to restore the primary report to its default settings.

    ![Reset](images/reset-report.png " ")

    c) In the Reset dialog, click **Apply**.

    ![Reset](images/apply-reset.png " ")

    d) From the Reports drop-down list, select **My Private Report**.

    ![Reset](images/nav-to-priv.png " ")

17. You want to download the customized report as a CSV.  

    a) Select **Actions** > **Download**.

    ![Download](images/download1.png " ")

    b) In the Download dialog, select **CSV**.

    ![Download](images/download2.png " ")  

    c) The report is now downloaded as a CSV.

    ![Download](images/download3.png " ")   

## Summary

You now know how to Manage and Customise the Interactive report as an End-User. You may now **proceed to the next lab**.

## What's next

In the next hands-on lab, you learn how to customise Interactive Grid as a developer and an end-user.

## Acknowledgements

- **Author** - Roopesh Thokala, Senior Product Manager
- **Contributor** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, January 2024
