# Create and Prepare APEX Workspace

## Introduction

In this lab, you will create a new APEX workspace and import an APEX application as a starting point for learning how to leverage the APEX Native Map Region against geospatial data.

Estimated Time: 10 minutes.

<!-- Watch the video below for a quick walk through of the lab. -->

<!-- update video link. Previous iteration: [](youtube:XnE1yw2k5IU) -->

### Objectives
Learn how to:
- Configure a new APEX workspace for application development
- Import an existing APEX application as a starting point for exploration of Native Map Region features

### Prerequisites
This lab assumes:
- You have finished all prior labs
- You have ORDS running so you can open APEX

    > Note: If you have closed ORDS, repeat the steps in Lab 2 to reopen it.

## Task 1: Login and create APEX workspace

1. Open Activities -> Google Chrome

    ![Open Google Chrome](images/activities-chrome.png)


2. Go to this URL and wait for the screen to load.
    ```
    <copy>
    http://localhost:8080/ords/apex_admin
    </copy>
    ```

    ![URL login screen](images/admin-services.png)

3. Login as ADMIN with the password you created in Lab 2 and reset it to whatever you please.

    *Be sure to retain the password for later access!*

    ![Login using credentials](images/login-details.png)

4. You can see the welcome screen for APEX now. Click the Create Workspace button.

    ![Welcome screen after login](images/welcome-screen-apex2.png)

5. Name the workspace 'WTFC' and click Next. Workspace ID and Description are optional.

    ![enter WTFC for the workspace name](images/create-wtfc-workspace-0.png)

7. Set *Re-use existing schema?* to Yes. Click the menu icon next to schema name and select HOL23C from the drop-down list of schemas. Leave the default for space quota and password. Click Next.

    ![Schema information input changes](images/schema-info.png)

8. For username, supply **admin**; for password, we will use **Welcome123#**, and for email, supply your desired email address. Click Next.

    ![admin password email input](images/admin-password-email.png)

9. Review the summary information returned and if it's correct, then click Create Workspace.

    ![Create workspace](images/create-workspace.png)

10. Success! Now click Done.

    ![completion screen](images/done.png)

## Task 2: Import APEX application to visualize queries

1. In the upper right corner, click the admin icon then click sign out.
    ![sign out from admin](images/apex-admin-logout.png)


2.  Log back in as the **admin** user  you just created, supplying **WTFC** as the workspace name.
    ![log back in](images/apex-wtfc-login-0.png)

3. Since this is the first time you'll be using the APEX workspace, you will be prompted to change the password.

    *Be sure to retain it somewhere safe!*

    ![password change](images/apex-change-admin-password.png)

4. Click on App Builder -> Import.

    ![Import from app builder](images/apex-app-builder-import.png)

5. Click to add a file to open for import. Go to Home -> examples -> f106.sql and open that file. Leave the defaults and click Next.

    ![open f106 sql file](images/apex-f106-open.png)

    ![Import f106 sql file](images/apex-f106-import.png)

6. Click Next.
    ![Import f106 sql file](images/apex-f106-import-2.png)

7.  Select **Change Application ID** and supply **301** (or other application ID of your choice). Leave all other options and click **Install Application**.
    ![Install the application](images/apex-import-wtfc-application-0.png)


You may now proceed to the next lab.

## Learn More
* [Oracle APEX 23.1: Workspace and Application Administration](https://docs.oracle.com/en/database/oracle/apex/23.1/aeadm/workspace-and-application-administration.html#GUID-853F40E1-F360-4CE9-8DC1-FC111A825D14)
* [Oracle APEX 23.1: Importing Export Files](https://docs.oracle.com/en/database/oracle/apex/23.1/htmdb/importing-export-files.html#GUID-16650312-4E36-489E-8012-940924ADF2E9)

## Acknowledgements
* **Author** - Jim Czuprynski, LiveLabs Contributor, Zero Defect Computing, Inc.
* **Contributors** - Hope Fisher, Program Manager, Database Product Management
* **Last Updated By/Date** - Hope Fisher, June 2023