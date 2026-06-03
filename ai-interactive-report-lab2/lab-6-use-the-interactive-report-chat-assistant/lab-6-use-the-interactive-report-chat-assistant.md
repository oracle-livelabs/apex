# Use the Interactive Report Chat Assistant

## Introduction

This lab uses the Interactive Report chat assistant to reshape the replenishment report for a weekly network review. Instead of navigating menus and dialogs, you will ask the assistant to group, aggregate, pivot, highlight, chart, and save views using conversational prompts. The assistant uses the column context you configured in Lab 4 to interpret business terms without requiring column names.

Estimated Lab Time: 5 minutes

### Objectives

In this lab, you will:

- Use the chat assistant to group and aggregate the report by product category to triage the morning alert queue.
- Organize the report by warehouse, highlight low stock, and chart alert volume.
- Save a finished report view for repeat use.

## Task 1: Triage the Morning Alert Queue

The operations director has just started the day. Before the weekly review meeting, the team needs to understand which product lines are in trouble and how big the replenishment gap is for each. In this task you will use the chat assistant to triage the alert queue and size the problem by product category.

1. Remove any existing filter chips and click **Assistant** to open the right-side chat panel for the Interactive Report.

    ![Open the assistant panel](images/open-assistant-panel.png " ")

2. Enter the following and send the prompt.

    ```
    <copy>
    Group alerts by item category so I can see which product lines have the most replenishment issues
    </copy>
    ```

3. Confirm that the assistant applies a group by on item category. The report now organizes alerts under each product line — electronics, food, medical, apparel, spares — so the director can immediately see where the problems are concentrated and assign category owners to investigate.

4. Enter *Reset* to clear the report state, then enter the following and send the prompt.

    ```
    <copy>
    Show the total quantity to target for each item category so I can see which product lines need the most units replenished
    </copy>
    ```

5. Confirm that the assistant applies an aggregation summing quantity to target by item category. The director now knows not just which categories have the most alerts, but which ones carry the largest volume gap — a category with fewer alerts but a massive quantity shortfall may need priority over one with many small alerts.

## Task 2: Build a Visual Report for the Review Meeting

The director now wants to prepare a view to present at the meeting: organize by warehouse, flag low-stock items visually, chart alert volume, and save the report so the team can reuse it each week.

1. Enter *Reset* to return the report to its initial state.

2. Enter the following and send the prompt.

    ```
    <copy>
    Add a control break on warehouse name
    </copy>
    ```

3. Confirm that the report splits into sections with a header for each warehouse. This gives the team a site-by-site walkthrough for the review meeting.

4. Enter the following and send the prompt.

    ```
    <copy>
    Highlight items where current warehouse stock is below 10 units
    </copy>
    ```

5. Confirm that the highlight rule is applied. Within each warehouse section, rows where warehouse-wide stock is critically low now stand out in color, making it easy for each site manager to spot their problem items.

6. Enter *Reset* to return to the default view, then enter the following and send the prompt.

    ```
    <copy>
    Chart the count of alerts by warehouse as a bar chart
    </copy>
    ```

7. Confirm that the report switches to a bar chart. Each bar represents a warehouse, making it immediately clear which sites carry the heaviest alert load across the network.

8. Enter the following and send the prompt.

    ```
    <copy>
    Save this report as Weekly Network Review
    </copy>
    ```

9. Confirm that the saved report appears in the available report views. The team can now reopen this view each week without reconfiguring the report.

## Summary

You used the Interactive Report chat assistant to triage the morning alert queue by grouping and aggregating alerts by product category, then built a visual report for the weekly review by organizing the report by warehouse with a control break, highlighting low-stock items, charting alert volume by site, and saving the finished view for reuse. The assistant interpreted business terms using the column context configured in Lab 4.

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, June 2026
