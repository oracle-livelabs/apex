# Lab 2: Demonstrate User Report Customization

## Introduction

Use a separate end-user account to personalize Candidate Pipeline. This illustrates that user-saved reports remain private, while developer-saved reports can be shared.

Estimated Time: 5 minutes

### Objectives

In this lab, you will:

- Update the Candidate Pipeline query to include department information.
- Create a private report as the end user.
- Compare the primary report with the private report.

## Task 1: Prepare the report query

1. In Page Designer, open the Candidate Pipeline interactive report region. Click **Edit Page** from Runtime Developer Toolbar.

    ![Page Designer with the Candidate Pipeline interactive report region selected.](images/edit-page.png ' ')

3. In the left pane, select **Candidates**, and click SQL Query **Code Editor**.
    ![Page Designer with the Candidate Pipeline interactive report region selected.](images/code-editor.png ' ')

2. Replace the region SQL query with the following:

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
    on r.dept_id = d.dept_id;
    </copy>
    ```

    ![SQL source editor containing the Candidate Pipeline query with Department Name.](images/replace-candidate-pipeline-query.png ' ')

3. Save and run the page.

    ![Page Designer showing the Candidate Pipeline interactive report SQL source.](images/save-run.png ' ')


## Task 2: Create an End User

1. From your APEX Workspace, navigate to **Administration** > **Manage Users and Groups**.

    ![APEX workspace](images/manage-users.png ' ')


2. Click **Create User**.
    ![APEX workspace](images/create-user.png ' ')

3. Enter the following details:
    - Username: **APEXAI**
    - Email Address: **apexai@email.com**
    - Password: `Enter a password of your choice`
    - Confirm Password: `Enter the password again`
    
    Click **Create User**.

    ![APEX workspace](images/create-user-details.png ' ')


## Task 3: Create a private user report


1. Run the application and log in as end user **APEXAI**.
    ![log in page](images/login.png ' ')

2. On Candidate Pipeline page, navigate to **Actions** > **Columns**. Move the `Department Name` column to Diaplay section.

    ![Columns dialog with Department Name moved to the displayed columns list.](images/display-department-name.png ' ')

3. Navigate to **Actions** > **Filter**. Add a filter that limits department results to Sales and Engineering. Enter/select the following:
    - Column: **Department Name**
    - Operator: **in**
    - Expression: **Sales,Engineering**

    ![Filter dialog limiting Department Name to Sales and Engineering.](images/filter-sales-engineering.png ' ')

4. Navigate to **Actions** > **Group By**. Enter/select the following:
    - Group By: **Stage**
    - Functions: **Count**
    - Column: **Candidate Name**
    - Format Mask: **5,234**
    
    Click **Apply**.

    ![Interactive report grouped by Stage with a Candidate Name count aggregate.](images/group-stage-count-candidates.png ' ')

5. Navigate to **Actions** > **Report** > **Save Report**. Save the result as a private report named **My Dashboard**.

    ![Candidate Pipeline customized by an end user with Department Name, stage grouping, and My Dashboard selected.](images/my-dashboard-private-report.png ' ')

6. Switch to Primary Report. Navigate to **Actions** > **Report** > **Reset**. 
    Reset the primary report and compare it with **My Dashboard**. Confirm that **My Dashboard** is private to the signed-in user.

    ![Report selector showing the primary report and the private My Dashboard report.](images/compare-primary-private-report.png ' ')

## Acknowledgements

* **Author** - Apoorva Srinivas, Principal Product Manager; Roopesh Thokala, Principal Product Manager
* **Last Updated By/Date** - Apoorva Srinivas, Principal Product Manager, July 2026