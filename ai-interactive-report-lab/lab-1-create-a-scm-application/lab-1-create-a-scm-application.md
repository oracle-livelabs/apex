# Create a Supply Chain Management Application

## Introduction

This lab sets up the application and data foundation for the rest of the workshop. You will load the SCM data model and sample data, create the Supply Chain Management application, and review the baseline Interactive Report before AI features are added.

Estimated Lab Time: 5 minutes

### Objectives

In this lab, you will:

- Download and run the SCM data model and sample data load scripts.
- Create a Supply Chain Management application in your workspace.
- Review the sample SCM dataset and baseline report structure.

### Downloads

Use these files during the hands-on setup:

- [01_SCM_INV_WMS_DATAMODEL.sql](files/01_SCM_INV_WMS_DATAMODEL.sql)
0 [02_SCM_INV_WMS_SAMPLE_DATALOAD.sql](files/02_SCM_INV_WMS_SAMPLE_DATALOAD.sql)

Run the files in the order listed above.

## Task 1: Install the SCM Data Model and Sample Dataset

This task gives learners the exact files needed to prepare the workshop data. By downloading and running the SQL scripts from the lab itself, users can reproduce the SCM schema and sample warehouse dataset before they begin working with the new AI Interactive Report feature.

1. Download the following files from the **Downloads** section of this lab:

    - `01_SCM_INV_WMS_DATAMODEL.sql`
    - `02_SCM_INV_WMS_SAMPLE_DATALOAD.sql`

2. Sign in to your Oracle APEX workspace and open **SQL Workshop**.

    ![Open SQL Workshop](images/open-sql-workshop.png)

3. On the **SQL Workshop** page, click **SQL Scripts**.

    ![Navigate to SQL Scripts](images/navigate-to-sql-scripts.png)

4. Click **Upload**, then select file `01_SCM_INV_WMS_DATAMODEL.sql` to create the SCM tables, constraints, annotations, and supporting objects.

    ![Upload the data model script](images/upload-datamodel-script.png)

5. Click **Run**.

    ![Run the data model script](images/run-datamodel-script.png)

6. After the data model script completes successfully.

    ![Run the sample data load script](images/run-sample-dataload-script.png)

7. Repeat the upload and run process for `02_SCM_INV_WMS_SAMPLE_DATALOAD.sql` to load the SCM sample warehouse and inventory data.

8. Verify that both scripts complete without errors before you continue.

## Task 2: Create a Supply Chain Management Application

This task creates the application shell that you will enhance throughout the workshop. The goal is to create a new Supply Chain Management application that uses the dataset you loaded in Task 1, so later labs can focus on the new AI Interactive Report experience.

1. From the workspace home page, open **App Builder**.

    ![Navigate to App Builder](images/navigate-to-app-builder.png)

2. On the **App Builder** page, click **Create** and start a new application.

    ![Create a new application](images/create-a-new-application.png)

3. Name the application **Supply Chain Management**.

    ![Name the application](images/name-the-application.png)

4. Click **Create Application**.

    ![Click Create Application](images/click-create-application.png)

5. Run the application once to verify that the home page opens and the application is accessible.

## Task 3: Explore the Sample Dataset and Baseline Report

This task gives you business context for the rest of the workshop. You will confirm the application is available, review the sample dataset, and open the baseline report page so you can compare the starting experience with the AI-enhanced experience you build in later labs.

1. Return to workspace home page and open **SQL Workshop**.

    ![Open SQL Workshop](images/open-sql-workshop.png)

2. Navigate to **Object Browser**.

    ![Navigate to Object Browser](images/navigate-to-object-browser.png)

3. Now, identify the SCM objects that support replenishment reporting, including items, warehouses, storage locations, replenishment alerts, and the replenishment reporting view.

    ![Identify SCM objects in Object Browser](images/identify-scm-objects.png)

## Summary

You downloaded and ran the SCM data model and sample data load scripts, created a Supply Chain Management application, explored the sample dataset, and reviewed the initial report experience. The application and data are now ready for AI service configuration and report enhancement.

## Acknowledgements

* **Author** - Ankita Beri, Senior Product Manager
* **Last Updated By/Date** - Ankita Beri, April, 2026
