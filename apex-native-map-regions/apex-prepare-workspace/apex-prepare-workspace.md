# Create APEX Workspace and import APEX Native Map Region Application

## Introduction

In this lab you will create a new APEX workspace and import an APEX application as a starting point for learning how to leverage the APEX Native Map Region against geospatial data.

Estimated Time: 10 minutes

### Objectives
Learn how to:
- Configure a new APEX workspace for application development
- Import an existing APEX application as a starting point for exploration of Native Map Region features

### Prerequisites
This lab assumes:
- You have already finished all prior labs
- You have ORDS running so you can open APEX

Watch the video below for a quick walk through of the lab.

[Prepare APEX workspace](videohub:1_bt8ykjd7)

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

3. Login as ADMIN with the password Welcome123# and reset it to whatever you please. Be sure to retain the password for later access!

    ![Login using credentials](images/login-details.png)

4. You can see the welcome screen for APEX now. Click the Create Workspace button.

    ![Welcome screen after login](images/welcome-screen-apex2.png)

5. Name the workspace 'WTFC' and click Next.

    ![enter WTFC for the workspace name](images/create-wtfc-workspace.png)

6. Set *Re-use existing schema?* to Yes. Click the menu icon next to schema name and select HOL23C from the drop-down list of schemas. Leave the default for space quota and password. Click Next.

    ![Schema information input changes](images/schema-info.png)

7. For username, supply admin; for password, supply Welcome123#, and for email, supply your desired email address. Click Next.

    ![admin password email input](images/admin-password-email.png)

8. Review the summary information returned and if it's correct, then click Create Workspace.

    ![Create workspace](images/confirm-workspace-creation.png)

9. Success! Now click Done.

    ![completion screen](images/done.png)

## Task 2: Import APEX application to visualize queries

1. In the upper right corner, click the ADMIN icon and then click Sign out.
    ![sign out from admin](images/apex-admin-logout.png)


2.  Log back in as the **admin** user  you just created, supplying **WTFC** as the workspace name.
    ![log back in](images/apex-wtfc-login.png)

3. Since this is the first time you'll be using the APEX workspace, you will be prompted to change the password. *Be sure to retain it somewhere safe!*
    ![password change](images/apex-change-admin-password.png)

4. Click on App Builder -> Import

    ![Import from app builder](images/apex-app-builder-import.png)

5. Click to add a file to open for import. Go to Home -> examples -> f301.sql and open that file. Leave the defaults and click Next.

    ![open f301 sql file](images/apex-f301-open.png)

    ![Import f301 sql file](images/apex-f301-import.png)

6. Click Next.

    ![Finish f301 sql file import](images/apex-f301-import-done.png)

7.  Select **Reuse Application ID 301 From Export File.** Leave all other options unchanged and click *Install Application.*

    ![Install the application](images/apex-import-WTFC-application.png)

8. In the upper right corner, click the ADMIN icon and then click Sign out.

    ![sign out from admin](images/apex-dev-logout.png)

9. Just one final thing must be configured for APEX Native Map Regions to work properly: We need to inform APEX where to retrieve the standard Oracle base map images. To do that, we need to add the IP address and host name to our configuration's **/etc/hosts** file. Copy this command to a terminal window prompt and then execute it:
    ```
    <copy>sudo sh -c 'echo "173.223.146.112 elocation.oracle.com" >> /etc/hosts'</copy>
    ```
    You can validate the proper line has been added to /etc/hosts by issuing this command from a terminal window:

    ```
    <copy>cat /etc/hosts</copy>
    ```
    ![Check /etc/hosts configuration](images/post-cat-etc-hosts.png)

10. You have completed this lab.


You may now **proceed to the next lab.**

## Learn More
* [Oracle APEX 23.1: Workspace and Application Administration](https://docs.oracle.com/en/database/oracle/apex/23.1/aeadm/workspace-and-application-administration.html#GUID-853F40E1-F360-4CE9-8DC1-FC111A825D14)
* [Oracle APEX 23.1: Importing Export Files](https://docs.oracle.com/en/database/oracle/apex/23.1/htmdb/importing-export-files.html#GUID-16650312-4E36-489E-8012-940924ADF2E9)

## Acknowledgements
* **Author** - Kaylien Phan, William Masdon, Jim Czuprynski
* **Contributors** - Jim Czuprynski, LiveLabs Contributor, Zero Defect Computing, Inc.
* **Last Updated By/Date** - Jim Czuprynski, July 2023