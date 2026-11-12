# Explore and Configure Interactive Reports with Key Phrases

## Introduction

Oracle APEX 26.2 adds a refreshed Interactive Report experience. You can filter from a column heading, combine and remove filter chips, open the report actions menu for additional controls, and rearrange columns with drag and drop. When Search with AI is enabled, you can also describe report actions in the search bar using short, direct phrases.

In this lab, you will explore the report layout, apply and clear filters, move a column, and try key phrases for filtering and configuring the report. The examples use the **SCM Replenishment** report created in Lab 3.

Estimated Lab Time: 10 minutes

### Objectives

In this lab, you learn how to:

- Apply filters from column headings and the report actions menu.
- Reorder report columns with drag and drop.
- Use key phrases to filter, sort, group, and reset the report.

## Task 1: Explore the Report Layout and Controls

Run the **SCM Replenishment** report you created in Lab 3. The column headings provide direct access to column-specific controls, while the filter chips below the search bar show which conditions are active. The actions menu in the upper-right corner provides report-wide options.

1. Select the **Alert Status Code** column heading to open its menu. Select **OPEN** and **IN_REVIEW**, then select **Apply**.

    ![Select alert status values](images/filter-status-values.png)

2. Confirm that a filter chip appears and the report shows rows with the selected statuses.

    ![Confirm the alert status filter](images/status-filter-applied.png)

3. Select the **Available Quantity** column heading. Enter **0** for **Minimum** and **15** for **Maximum**, then select **Apply**.

    ![Set the available quantity range](images/quantity-filter-range.png)

4. Confirm that the report now includes an **Available Quantity between 0 and 15** filter chip.

    ![Confirm the available quantity filter](images/quantity-filter-applied.png)

5. Select the **Raised At** column heading and choose **Custom** in its menu.

    ![Open the raised date filter options](images/raised-at-date-presets.png)

6. In the calendar, select a date range that includes the replenishment alerts in your report, then select **Apply**. The screenshot shows the example range October 18–20, 2026.

    ![Choose and apply a custom date range](images/raised-at-custom-range.png)

7. Confirm that a **Raised At** filter chip appears with the selected range.

    ![Confirm the raised date filter](images/date-filter-applied.png)

8. Review the filter chips below the search bar. Each chip summarizes an applied condition and includes an **X** to remove that condition.

    ![Review the report filter chips](images/report-with-filter-chips.png)

9. Open the three-dot actions menu and select **Filter**.

    ![Open Filter from the actions menu](images/open-filter-from-actions-menu.png)

10. In the **Filter** dialog, review the **Column** and **Row** filter types and the **Column**, **Operator**, and **Expression** controls. Select **Cancel** to return to the report.

    ![Review the Filter dialog](images/filter-dialog.png)

11. Open the three-dot actions menu again and select **Columns**.

    ![Open Columns from the actions menu](images/open-columns-from-actions-menu.png)

12. In the **Columns** dialog, drag **Warehouse Name** above **Review Pending Flag**. The handles at the left of each row let you change the column order; the checkboxes control which columns are displayed.

    ![Drag Warehouse Name to change the column order](images/drag-warehouse-name-column.png)

13. Select **Apply**.

    ![Apply the new column order](images/apply-column-order.png)

14. Confirm that **Warehouse Name** now appears before **Review Pending Flag** in the report. Select **Reset** to restore the report's default settings.

    ![Review the reordered report and select Reset](images/report-with-reordered-columns.png)

15. In the confirmation dialog, select **Apply** to reset the report.

    ![Confirm the report reset](images/confirm-reset.png)

## Task 2: Use Key Phrases to Filter and Configure the Report

> **Prerequisite:** Search with AI is enabled in **Lab 5 Task 1**. If you are following the labs in order, complete Lab 5 first, then return here to do this task before continuing to Lab 6.

With Search with AI enabled, you can enter a direct phrase in the search bar to ask APEX to change the report. Use the action word, the report column's displayed name, and a value or direction where needed. These examples are shown working with the **SCM Replenishment** report:

| Action | Key phrase | Result |
| --- | --- | --- |
| Filter | `filter Item Category Code by FOOD` | Filters the report to rows where Item Category Code is FOOD. |
| Sort | `sort Available Quantity desc` | Sorts Available Quantity in descending order. |
| Add a control break | `break Alert Status Code` | Groups report rows under Alert Status Code headings. |
| Reset | `reset` | Restores the report to its default settings. |

1. In the search bar, enter the following phrase and press **Enter**:

    ```
    <copy>
    filter Item Category Code by FOOD
    </copy>
    ```

    ![Enter the category filter phrase](images/enter-category-filter-phrase.png)

2. Confirm that APEX applies the filter and adds an **Item Category Code = 'FOOD'** chip.

    ![Confirm the category filter](images/category-filter-applied.png)

3. In the search bar, enter the following phrase and press **Enter**:

    ```
    <copy>
    sort Available Quantity desc
    </copy>
    ```

    ![Enter the sort phrase](images/enter-sort-phrase.png)

4. Confirm that the report sorts **Available Quantity** in descending order.

    ![Confirm the descending sort](images/sort-applied.png)

5. In the search bar, enter the following phrase and press **Enter**:

    ```
    <copy>
    break Alert Status Code
    </copy>
    ```

    ![Enter the control break phrase](images/enter-control-break-phrase.png)

6. Confirm that the report is grouped under **Alert Status Code** headings and that a control break chip appears.

    ![Confirm the control break](images/control-break-applied.png)

7. To restore the default report, enter `reset` in the search bar and press **Enter**.

    ![Enter the reset phrase](images/enter-reset-phrase.png)

8. Confirm that APEX reports the reset and the default report layout returns.

    ![Confirm the report is reset](images/report-reset.png)

## Summary

You used the APEX 26.2 Interactive Report controls to apply filters, inspect the Filter dialog, reorder columns, and restore the default layout. After enabling Search with AI in Lab 5, return here to use key phrases to filter, sort, and group the report before continuing to Lab 6.

You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, October 2026
