# Customize Interactive Grid as an End-user

### Objectives
In this lab, you customize:
  - **Project Tasks** page we Created in Workshop 5 (**Developing Reports**).
  - **Interactive Grid** Page as an end user.

<!--
Customers will be able to:
- Review the items in the shopping cart
- Edit the quantity of the items
- Remove an item
- Clear the shopping cart
- Proceed to checkout

Estimated Time: 20 minutes

Watch the video below for a quick walkthrough of the lab.

[](youtube:Cvl9xMAqnm8)
-->

Estimated Time: 20 minutes

## Task 1: Customize Interactive Grid as an end-user.
In this lab, you customize the display of your interactive grid. You also edit an editable interactive grid.

1. Notice that the interactive grid is editable now. You see the Edit, Save, and Add Row buttons. Also, the pagination type that you have set is displayed now. Perform a non-case-sensitive search for '**server**' on the interactive grid.  
To do this, enter **server** in the search bar text area and click **Go**.

    ![Customize Interactive Grid](./images/search1.png " ")

2. Remove the filter by clicking the **X** icon.  
In the search bar, click the **magnifying glass** and select the **Task Name** column.

    ![Customize Interactive Grid](./images/search2.png " ")

3. Enter **server** in the text area and click **Go**. The search is now restricted to the **Task Name** column.

    ![Customize Interactive Grid](./images/search3.png " ")

4. Remove the filter by clicking the **X** icon. You want to update the **Budget** for the Project with ID 1. Click the corresponding field and replace the existing value with **500**.

    ![Customize Interactive Grid](./images/search4.png " ")

5. The changes have yet to be saved. Click the **Save** button.

    ![Customize Interactive Grid](./images/search5.png " ")

6. You want to update another row. This time, click the Row Actions (Hamburger) menu icon at the edge of the row for the project with Id **2** and select **Single Row View**.

    ![Customize Interactive Grid](./images/single-row-view.png " ")

7. You are now in the single-row View for the project with ID **2**. Replace the existing value for Budget with **9000** and click **Save**. 

    Then, click **Report View**.  

    ![Customize Interactive Grid](./images/single-row1.png " ")  

    The row now displays **9000** for Budget.

8. You want to create a control break on the Project column. 

    Click **Actions > Format > Control Break**.

    ![Customize Interactive Grid](./images/set-control-break.png " ")

9. In the Control Break dialog, for Column enter **Project** and click **Save**.

    ![Customize Interactive Grid](./images/control-break1.png " ")

10. The control break is now applied. You want to highlight rows that meet a condition. 

    Select **Actions > Format > Highlight**.

    ![Customize Interactive Grid](./images/highlight1.png " ")

11. In the Highlight dialog, enter/select the following:

    - Name: **Project Costing greater than 800**
    - Background Color: Click Colors and select **Yellow**.
    - Text Color: Click Colors and select **Red**.
    - Column: **Cost**
    - Operator: **greater than or equals**
    - Value: **800**  

    Click **Save**.
    ![Customize Interactive Grid](./images/highlight2.png " ")

12. Notice the rows with a cost greater than 800 are highlighted.

    ![Customize Interactive Grid](./images/highlight3.png " ")

13. You want to save the changes made to the interactive grid. 

    Select **Actions** > **Report** > **Save As**.

    ![Customize Interactive Grid](./images/save-grid1.png " ")

14. In the Report – Save As dialog, enter/select the following:
    - Type: **Private** 
    - Name: **My Private Report** 
    
    Click **Save**.

    ![Customize Interactive Grid](./images/save-report.png " ")

15. Notice that the primary interactive grid and the interactive grid you saved are now available in the Reports drop-down list.  
You want to return to the Primary interactive grid. Click **Primary Report** (Default) in the Reports drop-down list.

    ![Customize Interactive Grid](./images/select-primary-report.png " ")

16. You want to customize more and save the interactive grid as another Private report. You do not want the **Start Date**, **End Date**, and **Assigned To** columns to be displayed in the report.

    Click the **Start Date** column header and then select **Hide** from the context menu.

    ![Customize Interactive Grid](./images/hide-column1.png " ")

    Similarly, perform the same step to hide the **End Date** and **Assigned To** columns.

17. You want to add a chart to the interactive grid. 

    Select **Actions** > **Chart**.

    ![Customize Interactive Grid](./images/chart1.png " ")

18. In the Chart dialog, select the following:

    - Type: **Bar**
    - Label: **Project**
    - Value: **Cost**
    - Aggregation: **Sum**  
    
    Click **Save**.
    ![Customize Interactive Grid](./images/chart2.png " ")

19. The chart is displayed. You want to save the customization made to the interactive grid. 

    Select **Actions** > **Report** > **Save As**.

    ![Customize Interactive Grid](./images/save-report1.png " ")

20. In the Report – Save As dialog, enter/select the following:
    - Type: **Private** 
    - Name: **My Custom Report** 
    
    Click **Save**.

    ![Customize Interactive Grid](./images/save-report2.png " ")

21. The report is now saved under Private in the Reports drop-down list. Click the **Grid** icon.

    ![Customize Interactive Grid](./images/select-grid-icon.png " ")

22. You want to download the report. Select **Actions > Download**.

    ![Customize Interactive Grid](./images/download-report.png " ")

23. the **HTML** download option is no longer available. Select **Excel** and click **Download**.

    ![Customize Interactive Grid](./images/download-report1.png " ")

24. The report is now downloaded as **Excel** to your local system.

    ![Customize Interactive Grid](./images/downloaded-report.png " ")

## Summary
You now know how to Manage and Customize the Interactive report as an End User. You may now **proceed to the next workshop**.

## What's Next?
In the next workshop, you will learn how to create page items and page buttons.

## Acknowledgements
- **Author** - Roopesh Thokala, Senior Product Manager
- **Contributor** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, January 2024
