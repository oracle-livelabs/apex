# Use the Interactive Report Chat Assistant

## Introduction

This lab uses the Interactive Report chat assistant to reshape the replenishment report into a warehouse alert summary. Instead of navigating menus and dialogs, you will ask the assistant to aggregate, highlight, chart, and save views using conversational prompts. The assistant uses the column context you configured in Lab 4 to interpret business terms without requiring column names.

Estimated Lab Time: 5 minutes

### Objectives

In this lab, you will:

- Organize the report by warehouse with alert count aggregates and highlight low-stock items.
- Chart alert volume across the network and save the finished view for reuse.

## Task 1: Build a Warehouse Alert Summary Report

An operations director needs a quick summary of replenishment alerts across the network. The team needs to understand which warehouses carry the heaviest alert load and where stock levels are critically low. In this task you will use the chat assistant to build that view step by step.

1. Remove any existing filter chips and click **Assistant** to open the right-side chat panel for the Interactive Report.

    ![Open the assistant panel](images/open-assistant-panel.png " ")

2. Enter the following and send the prompt.

    ```
    <copy>
    Break the report by warehouse and count the alerts for each
    </copy>
    ```

3. Confirm that the report splits into sections with a header for each warehouse and a count of alerts appears under each section. The assistant interpreted this single prompt as two separate actions: a control break on warehouse name to create the sections, and an aggregate to count the alert numbers under each section. The director can now walk through each site and instantly see how many alerts it has.

4. Without resetting, enter the following and send the prompt.

    ```
    <copy>
    Highlight items where current warehouse stock is below 10 units
    </copy>
    ```

5. Confirm that the highlight rule is applied. Within each warehouse section, rows where warehouse-wide stock is critically low now stand out in color, making it easy for each site manager to spot their problem items.

6. Enter *Reset* to return to the default view, then enter the following and send the prompt.

    ```
    <copy>
    Show a bar chart of alerts per warehouse
    </copy>
    ```

7. Confirm that the report switches to a bar chart. Each bar represents a warehouse, making it immediately clear which sites carry the heaviest alert load across the network.

8. Enter the following and send the prompt.

    ```
    <copy>
    Save this report as Warehouse Alert Summary
    </copy>
    ```

9. Confirm that the saved report appears in the available report views. The team can now reopen this view each week without reconfiguring the report.

## Summary

You used the Interactive Report chat assistant to build a Warehouse Alert Summary report. You organized the report by warehouse with a control break and alert count aggregate, highlighted critically low stock items, charted alert volume across the network, and saved the finished view for reuse. The assistant interpreted business terms using the column context configured in Lab 4.

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, June 2026
