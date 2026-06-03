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

- [01\_SCM\_INV\_WMS\_DATAMODEL.sql](files/01_SCM_INV_WMS_DATAMODEL.sql)
- [02\_SCM\_INV\_WMS\_SAMPLE\_DATALOAD.sql](files/02_SCM_INV_WMS_SAMPLE_DATALOAD.sql)
- [03\_SCM\_INV\_WMS\_OPERATIONAL\_DATALOAD.sql](files/03_SCM_INV_WMS_OPERATIONAL_DATALOAD.sql)

Run the files in the order listed above.

## Task 1: Install the SCM Data Model and Sample Dataset

This task prepares the workshop schema. You will upload and run the provided SQL scripts in SQL Workshop so the SCM tables, views, and sample replenishment data are ready for the later labs.

1. Download the following files from the **Downloads** section of this lab:

    - `01_SCM_INV_WMS_DATAMODEL.sql`
    - `02_SCM_INV_WMS_SAMPLE_DATALOAD.sql`
    - `03_SCM_INV_WMS_OPERATIONAL_DATALOAD.sql`

2. Sign in to your Oracle APEX workspace and open **SQL Workshop**.

    ![Open SQL Workshop](images/open-sql-workshop.png)

3. On the **SQL Workshop** page, click **SQL Scripts**.

    ![Navigate to SQL Scripts](images/navigate-to-sql-scripts.png)

4. Click **Upload**.

    ![Upload the data model script](images/click-upload.png)

5. Select file `01_SCM_INV_WMS_DATAMODEL.sql` and click **Upload**.

    ![Upload the data model script](images/data-model-file.png)

6. Click **Run** icon.

    ![Upload the data model script](images/play.png)

7. Click **Run** to execute the data model script.

    ![Run the data model script](images/run-model.png)

8. Review the results and confirm the script status is **Complete** with **0** errors.

    ![Confirm the data model script results](images/run-sample-dataload-script1.png)

9. Return to **SQL Scripts**.

    ![Return to SQL Scripts](images/back-scripts.png)

10. Click **Upload**.

    ![Click Upload](images/click-upload-dataload.png)

11. Select file `02_SCM_INV_WMS_SAMPLE_DATALOAD.sql` and click **Upload** to load the SCM sample data.

    ![Upload the sample data load script](images/upload-dataload.png)

12. Click **Run** icon.

    ![Run the sample data load script](images/run-icon-dataload.png)

13. Click **Run** to execute the sample data load script.

    ![Execute the sample data load script](images/run-dataload-blurred.png)

14. Review the results and confirm the script status is **Complete** with **0** errors.

    ![Confirm the sample data load results](images/success-dataload.png)

15. Return to **SQL Scripts** and click **Upload** again.

16. Select file `03_SCM_INV_WMS_OPERATIONAL_DATALOAD.sql` and click **Upload** to load the operational data.

17. Click **Run** icon, then click **Run** to execute the operational data load script.

18. Verify that all three scripts complete without errors before you continue.

## Task 2: Create a Supply Chain Management Application

This task creates the application shell that you will enhance throughout the workshop. The goal is to create a new Supply Chain Management application in App Builder so later labs can focus on the AI-enabled reporting experience.

1. From the workspace home page, click **App Builder**.

    ![Navigate to App Builder](images/app-builder-icon.png)

2. On the **App Builder** page, click **Create** and start a new application.

    ![Create a new application](images/create-a-new-application.png)

3. In the **Name** field, enter **Supply Chain Management**.

    ![Name the application](images/name-the-application.png)

4. Click **Create Application**.

    ![Click Create Application](images/click-create-application.png)

5. Confirm that the new application appears in **App Builder**.

    ![Click Create Application](images/get-image.png)

## Task 3: Review the Database Objects

This task gives you context for the rest of the workshop. You will review the application home page created in Task 2 and confirm that the SCM objects needed for replenishment reporting were installed successfully.

1. Navigate to **SQL Workshop** icon , and then click **Object Browser**.

    ![Navigate to Object Browser](images/navigate-to-object-browser.png)

2. Review the installed SCM objects that support replenishment reporting, by searching with SCM_ in your Object Browser to list the core tables and views created by the setup scripts.

    ![Identify SCM objects in Object Browser](images/identify-scm-objects.png)

## Task 4: Refresh Data Dictionary

When we generate a data model, the database updates instantly but APEX’s schema metadata doesn’t. Refreshing the Data Dictionary ensures APEX reads the latest tables and makes them available in wizards and builders.In this task, we will refresh the Data Dictionary to synchronize APEX with the updated schema.

1. To refresh database objects, click APEX **Administration** icon from the left menu above your user profile. Then select **Manage Service > Manage Service**.

    ![Identify SCM objects in Object Browser](images/nav-admin-callouts.png)

2. On the right-hand side, under **Manage Meta Data**, select **Data Dictionary Cache**.

    ![Identify SCM objects in Object Browser](images/data-dic.png)

3. To refresh the cache manually click **Refresh Cache Only**.

    ![Identify SCM objects in Object Browser](images/refresh-cache-only.png)

4. Now you will view refreshed cache for tables.

    ![Identify SCM objects in Object Browser](images/cache-results.png)

## Summary

You loaded the SCM setup scripts, created the Supply Chain Management application, and verified that the required SCM objects are available. The application and sample data are now ready for AI service configuration and report enhancement.

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, April 2026

