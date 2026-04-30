# Configure Column-Level AI Attributes

## Introduction

This lab configures AI attributes for SCM replenishment columns from `SCM_NL2IR_REPLENISHMENT_V`. You will add clear business context to the quantity, priority, and date columns so AI can interpret warehouse questions more accurately.

Estimated Lab Time: 10 minutes

### Objectives

In this lab, you will:

- Add SCM-specific column context to key report columns.
- Define reference values for status and warehouse-related columns.
- Validate that AI uses the column guidance correctly.

## Task 1: Add SCM Column Context

This task helps the AI understand the meaning of your most important replenishment columns. Strong column context improves the quality of generated filters, sort orders, summaries, and assistant actions.

1. In **App Builder**, open the Supply Chain Management application and open the replenishment report page in **Page Designer**.

    ![Open the replenishment page in Page Designer](images/open-replenishment-page-in-page-designer.png)

2. In the left pane, expand the report columns.

    ![Expand the report columns](images/expand-report-columns.png)

3. Select the column **QTY\_TO\_TARGET**.

    ![Select the QTY_TO_TARGET column](images/select-qty-to-target-column.png)

4. In the right pane, scroll to the **Generative AI** section for the selected column. If the section is collapsed, expand it.

    ![Open the Generative AI section](images/open-generative-ai-section-for-qty-to-target.png)

5. In **Column Context**, enter the following context value:

    ```
    <copy>
    Suggested replenishment quantity to move into the pick face for this alert. Users may refer to this as replenishment quantity, suggested move quantity, restock amount, or quantity to replenish.
    </copy>
    ```

    ![Enter the QTY_TO_TARGET column context](images/enter-qty-to-target-column-context.png)

6. Select the column **PRIORITY_CODE**.

    ![Select the PRIORITY_CODE column](images/select-priority-code-column.png)

7. In the **Generative AI** section, locate **Column Context** and enter the following context value:

    ```
    <copy>
    Business urgency of the replenishment alert. HIGH means immediate attention, MEDIUM means normal attention, and LOW means lower urgency.
    </copy>
    ```

    ![Enter the PRIORITY_CODE column context](images/enter-priority-code-column-context.png)

8. Select the column **RAISED_AT**.

    ![Select the RAISED_AT column](images/select-raised-at-column.png)

9. In the **Generative AI** section, locate **Column Context**, enter the following context value:

    ```
    <copy>
    Timestamp when the replenishment alert was raised. Users may ask for alerts raised today, this week, recently, or in the last few days.
    </copy>
    ```

    ![Enter the RAISED_AT column context](images/enter-raised-at-column-context.png)

10. Click **Save**.

    ![Save the column context updates](images/save-column-context-updates.png)

## Task 2: Configure Reference Data and Validate the Result

This task gives the AI controlled value sets for important categorical fields. Reference data reduces ambiguity when users ask for open alerts, warehouse-specific results, or other structured SCM filters.

1. Select the column **ALERT\_STATUS\_CODE**.

    ![Select the ALERT_STATUS_CODE column](images/select-alert-status-code-column.png)

2. In the right pane, scroll to the **Generative AI** section.

3. Set **Reference Data Type** to **Static Values**.

    ![Set the reference data type to Static Values](images/choose-static-values-reference-data.png)

4. Click **Static Values**. In the dialog, replace the sample rows with the valid alert status values used by the replenishment report. Enter `OPEN`, `ACTIONED`, and `CLOSED`, using the same text for both **Display Value** and **Return Value**, and then click **OK**.

    ![Enter the alert status static values and click OK](images/enter-alert-status-static-values.png)

5. Select the column **WAREHOUSE_CODE**.

    ![Select the WAREHOUSE_CODE column](images/select-warehouse-code-column.png)

6. In the **Generative AI** section, set **Reference Data Type** to **SQL Query**.

    ![Set the reference data type to SQL Query](images/choose-sql-query-reference-data.png)

7. In **SQL Query**, enter the following query so AI can retrieve the valid warehouse codes dynamically:

    ```
    <copy>
    select warehouse_code as d,
           warehouse_code as r
     from scm_nl2ir_replenishment_v
     group by warehouse_code
     order by warehouse_code
     </copy>
    ```

    ![Enter the SQL query for warehouse code reference data](images/enter-warehouse-code-sql-query.png)

8. Click **Save and Run**.

    ![Save and run the page with the column AI settings](images/save-and-run-page-with-column-ai-settings.png)

9. The replenishment report opens again with the saved column-level AI settings. The remaining validation of AI search and assistant behavior is covered in the next two labs.

## Summary

You configured SCM column context and reference data type for the replenishment report. The report is now better prepared to interpret warehouse and inventory questions accurately.

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, April, 2026
