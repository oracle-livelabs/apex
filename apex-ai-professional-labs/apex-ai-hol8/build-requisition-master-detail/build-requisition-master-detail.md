# Lab 5: Build the Requisition Master-Detail Page

## Introduction

Create a Requisition Detail page that displays requisition information above an editable interactive grid of its candidates. Then update the Job Openings card action to open this page.

Estimated Time: 15 minutes

### Objectives

In this lab, you will:

- Create the Requisition Detail page and request ID item.
- Add a read-only requisition report and editable candidate grid.
- Link Job Openings cards to the new master-detail page.

## Task 1: Create the page and master region

1. From your application homepage, click **Create Page**. 
    ![App home page](images/create-page.png ' ')

2. Select **Blank Page**.
    ![App home page](images/blank-page.png ' ')

3. In the Create Blank Page wizard, enter/select the following:         
    - Page Number: **14**
    - Name: **Requisition Detail**.
    Click **Create Page**.

    ![Create Page wizard with Requisition Detail entered as the page name.](images/create-requisition-detail-page.png ' ')

4. Right-click **Body** and select **Create Page Item**.
    ![Page Designer](images/create-page-item1.png ' ')

5. In the Property Editor, enter/select the following:
    - Name: **P14\_REQ\_ID**
    - Type: **Hidden**
    ![Requisition Detail Page Designer showing the P14_REQ_ID page item.](images/create-p14-req-id.png ' ')

6. Right-click **Body** and select **Create Region**.
    ![Page Designer](images/create-region1.png ' ')

7. In the Property Editor, enter/select the following:
    - Name: **Requisition info**
    - Type: **Classic Report**
    - Source:
        - Type: **SQL Query**
        - SQL Query:
        ```sql
        <copy>
        SELECT r.req_id, j.title, d.name as department, r.headcount,
       r.status, TO_CHAR(r.open_date,'DD-Mon-YYYY') as open_since
        FROM TMS_job_requisitions r
        JOIN TMS_jobs j ON r.job_id = j.job_id
        JOIN TMS_departments d ON r.dept_id = d.dept_id
        WHERE r.req_id = :P14_REQ_ID
        </copy>
        ```

    ![Requisition Detail Page Designer showing P14_REQ_ID and the Requisition Info classic report.](images/requisition-detail-master-region.png ' ')

## Task 2: Add the editable Interactive Grid

1. Right-click **Body** and select **Create Region**.
    ![Page Designer](images/create-region2.png ' ')

2. In the Property Editor, enter/select the following:
    - Name: **Candidates**
    - Type: **Interactive Grid**
    - Source:
        - Type: SQL Query
        - SQL Query:
        ```sql
        <copy>
        SELECT candidate_id, first_name || ' ' || last_name as name,
       current_stage, applied_date
        FROM TMS_candidates
        WHERE req_id = :P14_REQ_ID
        </copy>
        ```

    ![Page Designer with the Editable Candidates interactive grid region below Requisition Info.](images/add-editable-candidates-region.png ' ')

3. In the Property Editor, switch to Attributes tab, and toggle the **Edit** > **Enabled** button to **ON**.

    ![Editable Candidates interactive grid attributes with editing enabled.](images/enable-grid-editing.png ' ')

5. In the left pane, under Candidates > Columns, select **CANDIDATE_ID**. In the Property Editor, under Source, toggle the **Primary Key** button to **ON**.

    ![CANDIDATE_ID column attributes with Primary Key set to Yes.](images/set-candidate-id-primary-key.png ' ')

6. In the left pane, under Candidates region, select the `CANDIDATE_ID`, `NAME`, and `APPLIED_DATE` columns and change the Type to **Display Only**.

    ![Editable Candidates interactive grid attributes with editing enabled and Candidate ID configured as the primary key.](images/editable-candidates-grid.png ' ')

7. **Save** the changes.
    ![Page designer](images/save.png ' ')

## Task 3: Update the Job Openings link

1. Click the Page Finder and navigate to the **Job Openings (12)** page.

    ![Page Designer search showing the Job Openings Cards page result.](images/search-job-openings-page.png ' ')

2. In the left pane, under Job Openings regions, right-click **Actions** and select **Create Action**.
    ![Page Designer search showing the Job Openings Cards page result.](images/create-action.png ' ')


3. In the Property Editor, enter/select the following:
    - Type: **Button**
    - Label: **View Applicants**
    ![View Applicants card action targeting Requisition Detail Page 14.](images/target-requisition-detail1.png ' ')

    - Target:
        - Page: **14**
        - Set Items:
            - Name: **P14\_REQ\_ID**
            - Value: **&REQ_ID.**

    ![View Applicants card action targeting Requisition Detail Page 14.](images/target-requisition-detail2.png ' ')

4. **Save and Run** the page.
    ![Page Designer](images/save-and-run.png ' ')

4. Select **View Applicants** for a Job Card. Confirm that the requisition information appears above candidates in an editable grid.

    ![Job Openings page](images/job-card-select.png ' ')

    ![Requisition Detail page displaying requisition information above editable candidate rows.](images/requisition-detail-runtime.png ' ')

## Acknowledgements

* **Author** - Apoorva Srinivas, Principal Product Manager; Roopesh Thokala, Principal Product Manager
* **Last Updated By/Date** - Apoorva Srinivas, Principal Product Manager, July 2026
