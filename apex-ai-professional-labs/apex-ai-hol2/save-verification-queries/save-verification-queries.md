# Lab 6: Save Verification Queries as Scripts

## Introduction

Run basic verification queries against the TMS data, then save them as a reusable SQL script for later labs.

Estimated Time: 5 minutes

### Objectives

In this lab, you will:

- Count candidates by stage.
- Identify requisitions with candidates.
- Save the statements as `TMS_VERIFY`.

## Task 1: Run verification queries

1. Open **SQL Commands** and **Run** the following statements:

    ```sql
    <copy>
    -- How many candidates are in each stage?
    select current_stage, count(*) as cnt
      from tms_candidates
     group by current_stage
     order by cnt desc;
    </copy>
     ```

     ```sql
     <copy>

    -- Which requisitions have the most candidates?
    select r.req_id, j.title, count(c.candidate_id) as candidates
      from tms_job_requisitions r
      join tms_jobs j
        on r.job_id = j.job_id
      left join tms_candidates c
        on c.req_id = r.req_id
     group by r.req_id, j.title
     order by candidates desc, r.req_id;
     </copy>
    ```
    ![SQL Commands](images/run-sql1.png ' ')

    ![SQL Commands](images/run-sql2.png ' ')

  `Note`: Confirm that both statements return rows. 

## Task 2: Save the script

1. Navigate to **SQL Scripts** and click **Create**. 

    ![SQL Scripts](images/nav-sql-script.png ' ')

1. Enter the SQL statements in **SQL Editor** with the Script Name `TMS_VERIFY`. Click **Create**.

    ```sql
      <copy>
      -- How many candidates are in each stage?
      select current_stage, count(*) as cnt
        from tms_candidates
      group by current_stage
      order by cnt desc;

      -- Which requisitions have the most candidates?
      select r.req_id, j.title, count(c.candidate_id) as candidates
        from tms_job_requisitions r
        join tms_jobs j
          on r.job_id = j.job_id
        left join tms_candidates c
          on c.req_id = r.req_id
      group by r.req_id, j.title
      order by candidates desc, r.req_id;
      </copy>
      ```

    ![SQL Scripts](images/save-script.png ' ')

2. Run the saved script once to confirm it is reusable in later modules. 

    ![SQL Scripts page with the TMS_VERIFY script saved.](images/run-tms-verify.png ' ')

3. Select view as **Detail** and click **Go** to view the results.

    ![SQL Scripts page with the TMS_VERIFY script saved.](images/sql-scripts-tms-verify.png ' ')

## Acknowledgements

* **Author** - Apoorva Srinivas, Principal Product Manager; Roopesh Thokala, Principal Product Manager
* **Last Updated By/Date** - Apoorva Srinivas, Principal Product Manager, July 2026