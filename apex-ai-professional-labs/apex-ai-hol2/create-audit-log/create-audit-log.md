# Lab 5: Add the Audit Log Table with AI

## Introduction

Use the AI-assisted custom data model experience to create the TMS audit-log table. Keep the provided SQL script as a deterministic fallback.

Estimated Time: 10 minutes

### Objectives

In this lab, you will:

- Ask the AI-assisted data-model feature to create an audit-log table.
- Review and run the generated DDL.
- Use a supplied SQL fallback when the AI feature is unavailable.

## Task 1: Generate the table with AI

1. In SQL Workshop, open **Create Custom Data Model using AI**.
    ![SQL Workshop home](images/create-ai-data-model.png ' ')

    `Note`: This option appears only if you have configured a Generative AI service in your APEX workspace. 

2. Enter the following prompt.

    <copy>
    Create an Oracle APEX-friendly audit log table named TMS_AUDIT_LOG.
    It should record the table name, operation, old values, new values,
    changed by, and changed at. Use LOG_ID as a generated primary key.
    Store old and new values as CLOB JSON payloads.
    </copy>

    ![APEX assistant](images/enter-prompt.png ' ')

3. Review the generated DDLand click **Create SQL Script**.

    ![AI-assisted data model screen showing the audit-log prompt and generated DDL.](images/review-ai-response.png ' ')

## Task 2: Run the SQL script

1. If the AI-assisted feature is unavailable or does not produce suitable DDL script, run [`tms-audit-log.sql`](files/tms-audit-log.sql) from SQL Scripts.

2. For the Script name, enter **tms-audit-log**, and click **Run**.

     ![SQL script editor](images/run-script.png ' ')

3. Click **Run** and verify that the script ran without errors.

    ![SQL script editor](images/run-again.png ' ')

    ![SQL script editor](images/run-result.png ' ')


3. Verify that `TMS_AUDIT_LOG` appears in Object Browser.

    ![Object Browser with TMS_AUDIT_LOG visible.](images/object-browser-audit-log.png ' ')

## Acknowledgements

* **Author** - Apoorva Srinivas, Principal Product Manager; Roopesh Thokala, Principal Product Manager
* **Last Updated By/Date** - Apoorva Srinivas, Principal Product Manager, July 2026
