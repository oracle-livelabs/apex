# Create a Supply Chain Management Application

## Introduction

This lab sets up the application and data foundation for the rest of the workshop. You will load the SCM data model and sample data, create the Supply Chain Management application, and verify that the seeded SCM objects are available before you begin configuring AI features.

Estimated Lab Time: 5 minutes

### Objectives

In this lab, you will:

- Download and run the SCM data model and sample data load scripts.
- Create a Supply Chain Management application in your workspace.
- Review the sample SCM objects and confirm the application shell is ready.

### Downloads

Use these files during the hands-on setup:

- [01_SCM_INV_WMS_DATAMODEL.sql](files/01_SCM_INV_WMS_DATAMODEL.sql)
- [02_SCM_INV_WMS_SAMPLE_DATALOAD.sql](files/02_SCM_INV_WMS_SAMPLE_DATALOAD.sql)

Run the files in the order listed above.

## Task 1: Install the SCM Data Model and Sample Dataset

This task prepares the workshop schema. You will upload and run the provided SQL scripts in SQL Workshop so the SCM tables, views, and sample replenishment data are ready for the later labs.

1. Download the following files from the **Downloads** section of this lab:

    - `01_SCM_INV_WMS_DATAMODEL.sql`
    - `02_SCM_INV_WMS_SAMPLE_DATALOAD.sql`

2. Sign in to your Oracle APEX workspace and open **SQL Workshop**.

    ![Open SQL Workshop](images/open-sql-workshop.png)

3. On the **SQL Workshop** page, click **SQL Scripts**.

    ![Navigate to SQL Scripts](images/navigate-to-sql-scripts.png)

4. Click **Upload**, then select file `01_SCM_INV_WMS_DATAMODEL.sql`.

    ![Upload the data model script](images/upload-datamodel-script.png)

5. Click **Run** to execute the data model script.

    ![Run the data model script](images/run-datamodel-script.png)

6. Review the results and confirm the script status is **Complete** with **0** errors.

    ![Verify the script results](images/verify-script-results.png)

7. Return to **SQL Scripts**, upload `02_SCM_INV_WMS_SAMPLE_DATALOAD.sql`, and then run it to load the SCM sample data.

    ![Run the sample data load script](images/run-sample-dataload-script1.png)

8. Verify that both scripts complete without errors before you continue.

    ![Run the sample data load script](images/run-sample-dataload-script.png)

## Task 2: Create a Supply Chain Management Application

This task creates the application shell that you will enhance throughout the workshop. The goal is to create a new Supply Chain Management application in App Builder so later labs can focus on the AI-enabled reporting experience.

1. From the workspace home page, open **App Builder**.

    ![Navigate to App Builder](images/navigate-to-app-builder.png)

2. On the **App Builder** page, click **Create** and start a new application.

    ![Create a new application](images/create-a-new-application.png)

3. In the **Name** field, enter **Supply Chain Management**.

    ![Name the application](images/name-the-application.png)

4. Click **Create Application**.

    ![Click Create Application](images/click-create-application.png)

5. Confirm that the new application appears in **App Builder**.

## Task 3: Review the Application Shell and Seeded SCM Objects

This task gives you context for the rest of the workshop. You will review the application home page created in Task 2 and confirm that the SCM objects needed for replenishment reporting were installed successfully.

1. Open the **Supply Chain Management** application and review the initial application home page.

    ![Review the application home page and available pages](images/review-pages-and-shared-components.png)

2. Return to the workspace home page, open **SQL Workshop**, and then click **Object Browser**.

    ![Navigate to Object Browser](images/navigate-to-object-browser.png)

3. Review the installed SCM objects that support replenishment reporting, including the core tables and views created by the setup scripts.

    ![Identify SCM objects in Object Browser](images/identify-scm-objects.png)

## Summary

You loaded the SCM setup scripts, created the Supply Chain Management application, and verified that the required SCM objects are available. The application and sample data are now ready for AI service configuration and report enhancement.

## Acknowledgements

* **Author** - Ankita Beri, Senior Product Manager
* **Last Updated By/Date** - Ankita Beri, April, 2026
