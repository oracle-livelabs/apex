# Lab 2: Load a Sample Dataset

## Introduction

Install the EMP/DEPT sample dataset to confirm that you can load data and run a relational query before creating the TMS schema.

Estimated Time: 5 minutes

### Objectives

In this lab, you will:

- Install the EMP/DEPT sample dataset.
- Run a join in SQL Commands.
- Verify that the dataset returns Department and Employee data.

## Task 1: Install EMP/DEPT

1. In SQL Workshop, select **Utilities**, then select **Sample Datasets**.
    ![select Sample dataset](images/select-sample-datasets.png ' ')

2. Install the **EMP/DEPT** dataset.

    ![Sample Datasets page with the EMP/DEPT dataset selected.](images/sample-datasets-emp-dept.png ' ')

3. Click **Next**.
    ![select Next](images/select-next.png ' ')


4. Click **Install Dataset**.
    ![select Install dataset](images/select-install-dataset.png ' ')


5. Once the sample dataset is installed, select **Exit**.
    ![select Exit](images/select-exit.png ' ')


## Task 2: Query the sample data

1. Open **SQL Commands** and run the following query.

    ```sql
    <copy>
    select e.empno,
           e.ename,
           e.job,
           d.dname,
           e.sal
      from emp e
      join dept d
        on d.deptno = e.deptno
     order by d.dname, e.ename;
    </copy>
    ```

    ![SQL Commands editor](images/sql-query.png ' ')

2. Confirm that the result contains employees with their department names and salaries.

    ![SQL Commands result grid after the EMP and DEPT join runs.](images/emp-dept-query-results.png ' ')

## Acknowledgements

* **Author** - Apoorva Srinivas, Principal Product Manager; Roopesh Thokala, Principal Product Manager
* **Last Updated By/Date** - Apoorva Srinivas, Principal Product Manager, July 2026