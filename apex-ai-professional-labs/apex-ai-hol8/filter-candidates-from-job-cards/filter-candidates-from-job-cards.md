# Lab 4: Link Job Cards to a Filtered Candidate List

## Introduction

Pass a requisition ID from each Job Openings card to Candidate Pipeline. The report query reads the page item and displays applicants only for the selected requisition.

Estimated Time: 5 minutes

### Objectives

In this lab, you will:

- Add a requisition ID page item to Candidate Pipeline.
- Filter the interactive report with a bind variable.
- Link Job Openings cards to the filtered report.

## Task 1: Filter Candidate Pipeline by requisition

1. Click the Edit page button from the Candidate Pipeline Page in the app.
    ![Candidate Pipeline Page Designer with the P4_REQ_ID page item added.](images/edit-page.png ' ')


2. Right-click **Body** and select **Create Page Item**. 
    ![Candidate Pipeline Page Designer with the P4_REQ_ID page item added.](images/create-page-item.png ' ')


3. Enter/select the following details:
    - Name: **P4\_REQ\_ID**
    - Type: **Hidden**

    ![Candidate Pipeline Page Designer with the P4_REQ_ID page item added.](images/create-p4-req-id.png ' ')

4. Select **Candidates** region in the left pane. Expand the SQL Query code editor. Replace the SQL query with the following: 
    ```sql
    <copy>
    select c.candidate_id,
       c.req_id,
       c.first_name || ' ' || c.last_name as candidate_name,
       d.name as department_name,
       c.email,
       c.phone,
       c.resume_blob,
       c.source,
       c.current_stage as stage,
       c.applied_date,
       trunc(sysdate - c.applied_date) as days_since_applied,
       c.diversity_flag,
       c.ai_score,
       c.created_by,
       c.created_at,
       c.updated_by,
       c.updated_at
  from tms_candidates c
  left join tms_job_requisitions r
    on c.req_id = r.req_id
  left join tms_departments d
    on r.dept_id = d.dept_id
 where :P4_REQ_ID is null
    or c.req_id = :P4_REQ_ID;

    </copy>
    ```
    ![SQL source editor showing the P4_REQ_ID bind-variable filter.](images/open-code-editor.png ' ')
    ![SQL source editor showing the P4_REQ_ID bind-variable filter.](images/add-requisition-filter-query.png ' ')

3. Save and run the page. Confirm that the report returns candidates filtered by the Job Opening.

    ![Candidate Pipeline Page Designer showing the P4_REQ_ID item and filtered report SQL.](images/candidate-pipeline-req-filter.png ' ')

## Task 2: Link the Job Openings card

1. Open the **Job Openings** Cards page in Page Designer.

    ![Page Designer with the Job Openings Cards page selected.](images/open-job-openings-cards.png ' ')

2. Navigate to **Job Openings** in the left pane. Right-click **Actions** and select **Create Action**.
    ![Page Designer with the Job Openings Cards page selected.](images/create-action.png ' ')

3. Enter/select the following in the Property Editor:
    - Type: **Button**
    - Label: **View Applicants**

    ![Cards region link settings with View Applicants entered as the link label.](images/add-button.png ' ')
    - Behaviour > Target:
        - Page: **4** (*Candidate Pipeline Page*)
        - Set Items:
            - Name: **P4\_REQ\_ID**
            - Value: **&REQ_ID.**
        
        Click **OK**.
    
    ![Cards region link settings with View Applicants entered as the link label.](images/add-view-applicants-link.png ' ')

4. Save and Run the page. Select **View Applicants**, and confirm that Candidate Pipeline lists candidates for that requisition only.
    ![Job Openings card with View Applicants action](images/view-applications.png ' ')

    ![Job Openings card with View Applicants action and the resulting filtered Candidate Pipeline report.](images/job-card-filtered-candidates.png ' ')

## Acknowledgements

* **Author** - Apoorva Srinivas, Principal Product Manager; Roopesh Thokala, Principal Product Manager
* **Last Updated By/Date** - Apoorva Srinivas, Principal Product Manager, July 2026
