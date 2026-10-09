# Lab 3: Build the TMS Schema with Quick SQL

## Introduction

Use Quick SQL shorthand to generate the Talent-Management-System(TMS) tables. 

Estimated Time: 15 minutes

### Objectives

In this lab, you will:

- Create the TMS schema from Quick SQL shorthand.
- Review and run generated DDL.
- Optionally add a vector column to the HR policy table.
- Verify the created tables in Object Browser.

## Task 1: Generate the TMS DDL

1. In SQL Workshop, select **Utilities**, then select **Quick SQL**.
    ![Quick SQL](images/nav-quick-sql.png ' ')

2. Copy the contents of [`tms-schema.qsql`](files/tms-schema.qsql) into Quick SQL and review the generated DDL.

    ![Quick SQL showing generated DDL for the TMS schema.](images/quick-sql-generated-ddl.png ' ')

3. Click the context menu (3 dots) and select **Save SQL Script**. 
    ![Save script dialog](images/save-sql-script.png ' ')

4. Provide a meaningful name such as **TMS SCHEMA**, and select **Save Script**.
    ![Save script dialog](images/name-sql-script.png ' ')

5. Click **Review and Run**.
    ![Review and Run](images/review-and-run.png ' ')

6. Click **Run**.
    ![Review and Run](images/sql-run.png ' ')

7. On the confirmation screen, click Run.
    ![Confirm Run](images/confirm-run.png ' ')

8. If the Quick SQL generated SQL script throws errors or you would like to run the final SQL script directly, download the [TMS_SCHEMA SQL script](files/TMS_SCHEMA.sql). 

## Task 2: Add the optional vector column

1. Navigate to **SQL Commands**.
    ![Navigate to SQL Commands](images/nav-sql-commands.png ' ')

2. If your database supports Oracle AI Database vector data types, run the following statement in SQL Commands.

    ```sql
    <copy>
    alter table tms_hr_policy add embedding_vector vector;
    </copy>
    ```
    ![SQL Commands](images/run-sql-commands.png ' ')

    `Note`: If the database does not support vector data types, skip this step.

## Task 3: Verify the tables

1. Navigate to Object Browser.
    ![Object Browser](images/nav-object-browser.png ' ')


2. Confirm that the `TMS_` tables appear.

    ![Object Browser showing the created TMS tables.](images/object-browser-tms-tables.png ' ')

## Acknowledgements

* **Author** - Apoorva Srinivas, Principal Product Manager; Roopesh Thokala, Principal Product Manager
* **Last Updated By/Date** - Apoorva Srinivas, Principal Product Manager, July 2026
