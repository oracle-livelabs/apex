# Use the Interactive Report Chat Assistant

## Introduction

This lab uses the AI Interactive Report chat assistant to reshape the replenishment data without manually changing report settings. You will ask the assistant to group, aggregate, pivot, highlight, chart, and save views so the SCM report can support both operational users and executive review.

Estimated Lab Time: 5 minutes

### Objectives

In this lab, you will:

- Use the chat assistant to transform the replenishment report.
- Apply grouping, aggregation, pivoting, and highlighting through prompts.
- Visualize replenishment results as a chart.
- Save a reusable SCM report view.

## Task 1: Open the Assistant and Build Analytical Views

This task shows how the assistant can progressively reshape the report from a flat list into an analytical view. Each prompt builds on the previous result so you can see how conversational report design works for SCM data.

1. Remove the filter chip and click **Assistant** to open the right-side chat panel for the Interactive Report.

    ![Open the assistant panel](images/open-assistant-panel.png)

2. Enter the following and send the prompt.

    ```
    <copy>
    Group by replenishment alerts by warehouse
    </copy>
    ```

    ![Enter the group by prompt](images/enter-group-by-prompt.png)

3. Confirm that a group-by chip is added for `WAREHOUSE_CODE` or `WAREHOUSE_NAME`.

    ![Confirm the group by chip](images/confirm-group-by-chip.png)

4. Enter the following and send the prompt.

    ```
    <copy>
    Show total quantity to target per warehouse
    </copy>
    ```

    ![Enter the total quantity prompt](images/enter-total-qty-prompt.png)

5. Confirm that an aggregate is added for `QTY_TO_TARGET`.

    ![Confirm the aggregate](images/confirm-total-qty-aggregate.png)

6. Enter the following and send the prompt.

    ```
    <copy>
    Create a pivot showing quantity to target by warehouse, with priorities across the top
    </copy>
    ```

    ![Enter the pivot prompt](images/enter-pivot-prompt.png)

7. Review the generated pivot layout.

    ![Review the pivot layout](images/review-pivot-layout.png)

## Task 2: Highlight, Refine, Visualize, and Save the Report

This task demonstrates how the assistant can refine the same report session without starting over. You will highlight important records, narrow the business question, turn the result into a chart, and save the final layout for repeat use.

1. Enter *Reset* to return the report to its initial state so it is ready for new instructions.

    ![Enter the highlight prompt](images/reset.png)

2. Enter the following and send the prompt.

    ```
    <copy>
    Highlight rows where Qty To Target is greater than 25 in green
    </copy>
    ```

    ![Enter the highlight prompt](images/enter-highlight-prompt.png)

3. Confirm that the highlight rule is applied.

    ![Confirm the highlight rule](images/confirm-highlight-rule.png)

4. Remove the chip and enter the following and send the prompt.

    ```
    <copy>
    Filter to only HIGH priority and OPEN alerts
    </copy>
    ```

    ![Enter the filter prompt](images/enter-high-open-filter-prompt.png)

5. Confirm that the assistant adds or updates the relevant chips instead of rebuilding the report from scratch.

    ![Confirm the filter chips](images/confirm-filter-chips.png)

6. Remove the chips and enter the following and send the prompt.

     ```
    <copy>
    Show Qty To Target by Warehouse Code as a bar chart
    </copy>
    ```

    ![Enter the bar chart prompt](images/enter-bar-chart-prompt.png)

7. Confirm that the report switches to a chart-based visualization.

    ![Confirm the bar chart view](images/confirm-bar-chart-view.png)

8. Enter **Reset**.

    ![Enter the save view prompt](images/reset-chart.png)

9. Enter the following and send the prompt.

    ```
    <copy>
    Break down the report based on alter status code
    </copy>
    ```

    ![Enter the save view prompt](images/breakdown-prompt.png)

10. Confirm that the report assistant adds the relevant filter chip of control break.

    ![Enter the save view prompt](images/breakdown-result.png)

11. To save the report, enter the following and send the prompt.

    ```
    <copy>
    Save this report as Alert Status report
    </copy>
    ```

    ![Enter the save view prompt](images/enter-save-view-prompt.png)

12. Confirm that the saved report appears in the available report views.

    ![Enter the save view prompt](images/save-report-result.png)

## Summary

You used the Interactive Report chat assistant to group, aggregate, pivot, highlight, filter, chart, and save an SCM replenishment report view. The report now supports both exploratory analysis and reusable business reporting.

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, April, 2026
