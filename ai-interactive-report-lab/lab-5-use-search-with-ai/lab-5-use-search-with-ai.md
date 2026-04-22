# Use Search with AI

## Introduction

This lab exercises the new AI Interactive Report search experience on the replenishment report. You will test simple filters, sorting, combined conditions, row search behavior, and chip adjustments to confirm that the report converts business language into Interactive Report actions.

Estimated Lab Time: 10 minutes

### Objectives

In this lab, you will:
* Run AI-generated filter and sort requests.
* Compare AI search behavior with row search behavior.
* Review and refine the generated report chips.

## Task 1: Run AI Search Scenarios on the Replenishment Report

This task validates that the report can interpret common SCM questions and translate them into useful report actions. The focus is on how business-friendly prompts become filters, sorts, and combinations of report chips.

1. Run the replenishment report page if it is not already open.

    ![Open the replenishment report](images/open-replenishment-report.png)

2. In the report search bar, enter `Show only open replenishment alerts` and submit the prompt.

    ![Enter the open alerts prompt](images/enter-open-alerts-prompt.png)

3. Confirm that the report applies an `ALERT_STATUS_CODE = OPEN` filter chip.

    ![Confirm the open alert chip](images/confirm-open-alert-chip.png)

4. In the same search bar, enter `Sort by highest quantity to target` and submit the prompt.

    ![Enter the sort prompt](images/enter-sort-prompt.png)

5. Confirm that the report applies a descending sort on `QTY_TO_TARGET`.

    ![Confirm the quantity sort](images/confirm-qty-sort.png)

6. Enter `Show HIGH priority open alerts raised this week` and submit the prompt.

    ![Enter the priority and date prompt](images/enter-priority-date-prompt.png)

7. Confirm that the report applies the `OPEN` and `HIGH` filters and narrows the results using the `Raised At` date values.

    ![Confirm the applied status, priority, and raised-date results](images/confirm-priority-status-date-filters.png)

## Task 2: Review Search Modes and Applied Chips

This task helps you distinguish AI search from standard row search and shows how users can refine the generated result set after the AI has interpreted a prompt.

1. In the search bar, enter the single word `NL2IRWH036` and submit it.

    ![Enter the warehouse row search](images/enter-warehouse-row-search.png)

2. Observe whether the report uses standard row search instead of AI interpretation.

    ![Confirm the row search behavior](images/confirm-row-search-behavior.png)

3. Enter another AI-style prompt such as `Show open alerts for warehouse NL2IRWH036` and submit it.

    ![Enter the warehouse AI prompt](images/enter-warehouse-ai-prompt.png)

4. Confirm that the gradient AI processing indicator appears while the request is being interpreted.

    ![Show the AI processing indicator](images/show-ai-processing.png)

5. Review the applied chips created by AI.

    ![Review the AI chips](images/review-ai-chips.png)

6. Adjust or remove one of the chips.

    ![Remove the warehouse chip](images/remove-warehouse-chip.png)

7. Confirm that the result set refreshes and remains editable after the AI response.

    ![Confirm the updated results](images/confirm-updated-results.png)

## Summary

You tested Search with AI on the SCM replenishment report, compared it with row search, and reviewed the generated chips. The search experience is now validated for common SCM filter and sort requests.

## Acknowledgements

* **Author** - Ankita Beri, Senior Product Manager
* **Last Updated By/Date** - Ankita Beri, April 21, 2026
