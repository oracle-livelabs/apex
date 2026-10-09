# Lab 1: Customize the Candidate Pipeline Report

## Introduction

Configure the Candidate Pipeline interactive report so its default view surfaces actionable candidates. Then create a shared developer-saved report for active candidates.

Estimated Time: 15 minutes

### Objectives

In this lab, you will:

- Add row highlighting, default columns, sorting, grouping, and an aggregate.
- Save the configuration as the primary report.
- Create an **Active Candidates** developer-saved report.

## Task 1: Configure the primary report

1. Run the TAP application and open **Candidate Pipeline**. From the **Actions** menu, select **Format** > **Highlight**.

    ![Candidate Pipeline Actions menu with Format and Highlight selected.](images/open-highlight-dialog.png ' ')

2. Add the following row highlighting rule:

    - Background Color: **#ffd6d2**
    - Column: **Stage**
    - Operator: **=**
    - Expression: **Rejected**
    
    Click **Apply**.

    ![Row Highlighting dialog configured for rejected candidates with a red background.](images/rejected-row-highlight.png ' ')

3. Similarly, add the following highlighting rule:

    - Background Color: **#d0f1cc**
    - Column: **Stage**
    - Operator: **=**
    - Expression: **Hired**
    
    Click **Apply**.

    ![Row Highlighting dialog configured for hired candidates with a green background.](images/hired-row-highlight.png ' ')

4. Click **Actions** and select **Columns**. Select the columns `Email`, `Created At`, `Created By`, `Updated At`, and `Updated By` and move them to **Do Not Display** section. Click **Apply**.

    ![Columns dialog showing audit and email columns in the Do Not Display list.](images/hide-default-columns.png ' ')

5. Click **Actions** and select **Data** > **Sort**.

    ![Candidate Pipeline Actions menu with Data and Sort selected.](images/open-sort-dialog.png ' ')

6. In the Sort dialog, enter/select the following:
    - Column: **Applied Date**
    - Direction: **Descending**
    Click **Apply**.

    ![Sort dialog configured to order Applied Date in descending order.](images/applied-date-descending-sort.png ' ')

7. Click **Actions** and select **Format** > **Control Break**. Enter/select the following:
    - Column: Stage
    Click **Apply**.

    ![Candidate Pipeline Actions menu showing the Customize option and report settings.](images/control-break.png ' ')

8. Let us save the configuration as the default report. Click **Actions** > **Report** > **Save Report**. In the dialog, for Save (Only displayed for developers), select **As Default Report Settings** and click **Apply**.

    ![Save Report dialog with As Default Report Settings selected.](images/save-default-report-settings.png ' ')

9. For Default Report Type, select **Primary** and click **Apply**.

    ![Default Report Type dialog with Primary selected.](images/select-primary-report.png ' ')

## Task 2: Create the Active Candidates report

1. In the running application, select **Actions**, then **Filter**.

    ![Actions menu](images/open-filter.png ' ')

2. In the filter dialog, enter/select the following:
    - Column: **Stage**
    - Operator: **Not in**
    - Expression: **Hired,Rejected**

    Click **Apply**.

    ![Filter dialog configured to exclude Hired and Rejected stages.](images/filter-active-candidates.png ' ')


3. Navigate to **Actions** > **Report** > **Save Report**. 

    ![Save Report dialog with Active Candidates entered as the report name.](images/name-active-candidates-report.png ' ')

4. In the Save Report dialog, enter/select the following:
    - Save (Only displayed for developers): **As Named Report**
    - Name: **Active Candidates**
    Click **Apply**.

    ![Candidate Pipeline report filtered to active candidates and the saved-report controls.](images/active-candidates-saved-report.png ' ')

    ![Candidate Pipeline report filtered to active candidates and the saved-report controls.](images/active-candidates-report.png ' ')

    

## Acknowledgements

* **Author** - Apoorva Srinivas, Principal Product Manager; Roopesh Thokala, Principal Product Manager
* **Last Updated By/Date** - Apoorva Srinivas, Principal Product Manager, July 2026
