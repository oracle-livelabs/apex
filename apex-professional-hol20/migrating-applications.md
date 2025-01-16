# Migrate Application Development Between Environments

## Introduction

In this lab, you will create Installation Scripts and Data Packages to export Database objects along with Data. Then you will export the **DEMO PROJECTS** Application along with supporting objects and import it into another workspace.

Estimated Time: 10 minutes

### Objectives

In this lab, you will:

- Create Installation Scripts

- Create Data Packages

- Export application with Supporting Objects.

## Task 1: Create Installation Scripts, Data Packages, and Export Applications

1. On the Workspace home page, click **App Builder**.

    ![Navigate to App Builder](images/click-app-builder.png " ")

2. Select the **Demo Projects** application.

    ![Navigate to Demo Projects](images/select-demo-project.png " ")

3. Click **Supporting Objects**.

    ![Click Supporting Objects](images/click-supporting-objects.png " ")

4. Under **Installation**, select **Installation Scripts**.

    ![Click Installation Scripts](images/select-installation-scripts.png " ")

5. Click **Create**.

    ![Click Create](images/click-create.png " ")

6. Select **Create from Database Object**.

    ![Click Create from database object](images/create-script1.png " ")

7. Under **Script Attributes**, enter/select the following:

    - Name: **Database Objects**

    - Object Type: **Table**

    Click **Next**.

    ![Define Script Attributes](images/create-script2.png " ")

8. For **Object**, select and move the tables **DEMO\_PROJECTS** and **EBA\_DEMO\_IR\_EMP** to the right side.

    ![Set Attributes and click next](images/create-script3.png " ")

9. Click **Create**.

    ![Click Create](images/click-create-scripts.png " ")

10. To include data in your Supporting Objects, select **Create Data Package** under **Tasks** on the right side of your page.

    ![Click Create Data Package](images/select-data-packages.png " ")

11. Under **Script Attributes**, enter/select the following:

    - Name: **data.sql** (Script Name should be Unique)

    - Tables: ensure **DEMO\_PROJECTS** and **EBA\_DEMO\_IR\_EMP** are listed on the right side, and if not, select and shuttle these two tables over there.

    Click **Next**.

    ![Define Security Attributes](images/create-data-packages.png " ")

12. For **Create Script**, accept the defaults and click **Finish**.

    ![Create Script](images/create-data-packages1.png " ")

13. The Scripts are now created. Navigate to the Application ID and select **Export/Import**.

    ![Script Created](images/navigate-to-app1.png " ")

    ![Navigate to Export/Import](images/navigate-to-export.png " ")

14. Select **Export** and click **Next**.

    ![Select Export and click Next](images/export-app1.png " ")

15. For Supporting Object Definitions, select **Yes and Install on Import Automatically** and click **Export**.

    ![Select Yes and Install on Import Automatically](images/export-app2.png " ")

16. You will now notice that the application is downloaded as **fNNN.sql**

    ![File downloaded](images/exported-app.png " ")

## Task 2: Import Application into the Target Workspace and Verify Database Objects

In this lab, you will login into a new workspace or the workspace you created in previous labs and import the application along with Supporting objects.

> **Note:**In this task, Please use different environments for creating the target and the main workspace.

1. Log in to the target **Workspace**.

    ![Login to the Target Workspace](images/login-towksp1.png " ")

2. Click **App Builder** and select **Import**.

    ![Navigate to App Builder](images/select-app-builder.png " ")

    ![Select Import](images/select-import.png " ")

3. Under **Import**, click **Drag and Drop**.

    ![Select Drag and Drop](images/select-drag-and-drop.png " ")

4. Choose the file we exported in the previous lab from your **Local System** and then click **Next**.

    ![Select File from computer](images/select-file.png " ")

    ![Click Next](images/click-next.png " ")

5. Click **Install Application**.

    ![Click Install Application](images/install-app1.png " ")

6. In the **Application Installed** wizard, click **Install Supporting Objects**.

    ![Click Next](images/install-so1.png " ")

7. You will now see that **Your application's supporting objects have been installed**. Click **Edit Application** to review the **Database Objects**.

    ![Application installed , Click Edit Application](images/install-app3.png " ")

8. Navigate to **SQL Workshop** and click **Object Browser**.

    ![Navigate to Object Browser](images/object-browser1.png " ")

9. Select **DEMO\_PROJECTS** table and click **Data**. Verify the data in the table **DEMO\_PROJECTS**.

    ![Navigate to DEMP_PROJECTS to view data](images/object-browser2.png " ")

## Summary

You now know how to create Installation Scripts and Data Packages to export Database objects along with Data. You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Roopesh Thokala, Senior Product Manager; Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, December 2024
