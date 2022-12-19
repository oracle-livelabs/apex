# Migrating Application Development Between Environments

## Introduction

In this lab, You will create Installation scripts and Data Packages to export Database objects along with Data. Then you will export the **DEMO PROJECTS** Application along with supporting objects and import it into another workspace.

In the second part of the lab, You will be using Remote Deployment to deploy your Application from Development to UAT. The ORDS feature, **REST Enabled SQL** is not available for **apex.oracle.com** users. Therefore, you will not be able to perform this lab in the hosted instance apex.oracle.com. You should be using **APEX Service** or **APEX on Autonomous Database** options for this lab

Estimated Time: 20 minutes


### Objectives

In this lab, you will:
- Create Installation Scripts
- Create Data Packages
- Export application with supporting Objects.
- Use Remote Deployment to deploy your Application.

### Downloads

- Did you miss out trying the previous labs? Don’t worry! You can download the application from **[here](files/demo-projects5.sql)** and import it into your workspace. To run the app, please run the steps described in **[Get Started with Oracle APEX](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.

## Task 1: Create Installation Scripts, Data packages and Export Application.

1. On the Workspace home page, click the App Builder icon.

  ![Navigate to App Builder](images/click-app-builder.png " ")

2. Select the **Demo Projects** application.

  ![Navigate to Demo Projects](images/select-demo-projects.png " ")

3. Click **Supporting Objects**. The Supporting Objects page appears.

  ![Click Supporting Objects](images/click-supporting-objects.png " ")

4. Under **Installation**, Select **Installation Scripts**.

  ![Click Installation Scripts](images/select-installation-scripts.png " ")

5. Click **Create**.

  ![Cliack Create](images/click-create.png " ")

6. Select **Create from Database Object** under **Create Script**.

  ![Click Create from database object](images/create-script1.png " ")

7. Under **Script Attributes**, select the below options and click **Next**.
  - For **Name**, Select **Database Objects**.
  - For **Object Type**, select Table**

  ![Define Script Attributes](images/create-script2.png " ")

8. Now set the following attributes and then click **Next**.
  - For **Table Options**, Select the **Checkbox**.
  - For **Object**, Select and Move the tables **DEMO_PROJECTS** and **EBA_DEMO_IR_EMP** to the right side.

  ![Set Attributes and click next](images/create-script3.png " ")

  *Note that it might take 5 to 10 seconds or more, please wait.*
9. You will now see the **Scripts** created. Click **Create**.

  ![Click Create](images/create-script4.png " ")

10. Now, you will see that the Scripts got created and Saved. You will need to include **Data** in your **Supporting Objects**. Select **Create Data Package** under **Tasks** in the Right side of your page.

  ![Click Create Data Package](images/select-data-packages.png " ")

11. Under **Script Attributes**, Select the following and click **Next**.
  - For **Name**, select **data.sql**
  - For **Tables**, ensure **DEMO_PROJECTS** and **EBA_DEMO_IR_EMP** are listed on the right side, and if not, select and shuttle these two tables over there.

  ![Define Security Attributes](images/create-data-packages.png " ")

12. For **Create Script**, accept the defaults and click **Finish**.

  ![Create Script](images/create-data-packages1.png " ")

13. The Scripts are now Created. Navigate back to the application and Select **Export/Import**.

  ![Script Created](images/navigate-to-app1.png " ")

  ![Navigate to Export/Import](images/navigate-to-export.png " ")

14. Select **Export** and click **Next**.

  ![Select Export and click Next](images/export-app1.png " ")

15. In the **Export Application** page, Under **Export Preferences**, select **Yes and Install on Import Automatically**.  

  Then Click **Export**.

  ![Select Yes and Install on Import Automatically](images/export-app2.png " ")

16. You will now notice that the applciation is downloaded as **fNNN.sql**

  ![File downloaded](images/exported-app.png " ")


## Task 2: Importing Application into the Target Workspace and Verify Database Objects.

In this Lab, You will login into a new workspace or the Workspace you created in previous labs and the import the application along with Supporting objects.

1. Login to the Target **Workspace**.

  ![Login to the Target Workspace](images/login-towksp1.png " ")

2. Click **App Builder** and then select **Import**.

  ![Navigate to App Builder](images/select-app-builder.png " ")

  ![Select Import](images/Select-Import.png " ")


3. Under **Import**, click **Drag and Drop**.

  ![Select Drag and Drop](images/select-drag-and-drop.png " ")

4. Choose the file we exported in the previous lab from your **Local System** and then click **Next**.

  ![Select File from computer](images/select-file.png " ")


5. Click **Next**.

  ![](images/click-next.png " ")


6. Under **Install**, Set **Build Status** to **Run and Build Application**. Leave the remaining settings to default and Click **Install Application**.

  ![Click Install Application](images/install-app1.png " ")


7. For **Supporting Objects**, Set **Install Supporting Objects** to **yes** and then click **Next**.

  ![Click Next](images/install-so1.png " ")

8. Click **Install**.

  ![Click Install](images/install-app2.png " ")

9. You will now see that **Your application's supporting objects have been installed**. Click **Edit Application** to review the **Database Objects**.

  ![Application installed , Click Edit Application](images/install-app3.png " ")

10. Click on the Arrow mark next to **SQL Workshop** and then click **Object Browser**.

  ![Navigate to Object Browser](images/object-browser1.png " ")

11. Select **DEMO_PROJECTS** table and then click **Data**. Verify the Data in the table **DEMO_PROJECTS**.

  ![Navigate to DEMP_PROJECTS to view data](images/object-browser2.png " ")


## Task 3: Importing Sample application.

The ORDS feature, **REST Enabled SQL** is not available for **apex.oracle.com** users. Therefore, you will not be able to perform this lab in the hosted instance apex.oracle.com. You should be using **APEX Service** or **APEX on Autonomous Database** options for this lab.

In this Lab, You will install a **Sample Application** in a new workspace you created either on **APEX Service** or **APEX on Autonomous Database**. Please follow the steps in **Hands-on Lab 01** to provision an instance or to create workspace on **APEX Service** or **APEX on Autonomous Database**.

1. Login to the new Workspace you created.

  ![Login to new workspace you created](images/login-to-dev.png " ")

2. Click **Gallery**.

  ![Navigate to Gallery](images/navigate-to-gallery.png " ")

3. Select **Samples** under **Gallery**.

  ![Select Samples](images/click-samples.png " ")

4. Navigate to **Sample Reporting** and click **Download App**.

  ![Download Sample Reporting](images/download-app.png " ")

5. Navigate back to your applciation and click the Arrow button next to **APP Builder** in the top navigation menu and select **Import**.

  ![Navigate to Import](images/import-app1.png " ")

6.  Under **Import**, click **Drag and Drop**.

    ![Click Drag and Drop](images/import-app2.png " ")

4. Choose the file we **Downloaded** in the **Step 4** from your **Local System** and then click **Next**.

  ![Select file](images/import-app3.png " ")

  ![Click Next](images/import-app4.png " ")

5. Click **Next**.

  ![Click Next](images/import-app5.png " ")


6. Under **Install**, Set **Build Status** to **Run and Build Application**. Leave the remaining settings to default and Click **Install Application**.

  ![Click Install Application](images/import-app6.png " ")


7. For **Supporting Objects**, Set **Install Supporting Objects** to **yes** and then click **Next**.

  ![Click Next](images/import-app7.png " ")

8. Click **Install**.

  ![Click Install](images/import-app8.png " ")

9.  You will now see that **Your application's supporting objects have been installed**. Click **Edit Application**

  ![Application Installed](images/import-app9.png " ")

10. Click **Sign Out**.

  ![Click Sign In](images/sign-out1.png " ")



## Task 4: Configuring the Target System.

In this Lab, You will enable the **Target System** to **ORDS** and then you will copy the URL and paste it in your notepad.

**Note**: You need to provision a new **APEX Service** or **APEX on Autonomous Database** and create a new workspace in order to perform this lab.

1. Login in to your **Target System**.

  ![Login into Target system](images/sign-out1.png " ")

2. Navigate to **SQL Workshop > RESTful Services**.

  ![Navigate to RESTful Services](images/enable-ords1.png " ")

3. Click **Register Schema with ORDS**.

  ![Click Register Schema with ORDS](images/enable-ords2.png " ")

4. Review the **ORDS Schema Attributes** and click **Save Schema Attributes**. Now, you see a message that the schema has been successfully registered.​

  ![Click Save Schema Attributes](images/enable-ords3.png " ")

5. Navigate to **SQL Workshop > Restful Services**. Expand **RESTful Data Services > Modules > oracle.example.hr > empinfo/ GET**. Copy the **Full URL** and paste it in your **Clipboard** or **Notepad**.

  ![Copy Full URL](images/copy-url.png " ")

6. Click **Sign Out**.

  ![Click Sign Out](images/sign-out2.png " ")


## Task 5: Remote Deployment.

Your application is now ready for deployment. Perform the following steps:

1. Login to your development environment (WS_APEXDEV in this example)

  ![Login into your Development environment](images/login-to-dev.png " ")

2. Navigate to your application home page. select **App Builder** and then click **Sample Reporting**.

  ![Navigate to Sample Reporting](images/select-sample-reporting.png " ")

3. Click **Export / Import**.

  ![Click Export/Import](images/select-export.png " ")  

4. Select **Remote Deployment** and click **Next**.

  ![Select Remote Deployment](images/select-rd.png " ")    

5. Choose an existing **REST Enabled SQL Service** or create a new one. In this example, click the **Add Deployment Server** ( **+** ) icon next to the Deployment Server select list.

  ![Add Deployment Server](images/perform-rd1.png " ")

6. Enter the base URL for the **REST Enabled SQL Service** defined for your deployment server (WS_APEXUAT in this example). The schema in your deployment server has already been enabled for use with ORDS RESTful Data Services in prerequisites.  
For **Endpoint URL**, paste the base URL copied from the deployment instance in the previous step(**Task 4**). The base URL should include the ORDS context root and schema URL prefix. For example, https://host:8096/ords/apexstage  Then, click Next.

  ![Paste the file URL which you Copied](images/perform-rd2.png " ")

7. Enter **UAT Cred** for Credential Name, select **Basic Authentication** for Authentication Type, and turn off the **Store Credentials switch**. Click **Create**.

  ![Select Basic Authentication and click next](images/perform-rd3.png " ")

8. Now you see a message that REST Enabled SQL Service has been created. From the Deployment Server select list, choose the one that you just created. Enter the values for **Client ID** and **Client Secret** and click **Next**. In this example, you use **Basic Authentication**. Therefore, enter the **Database user name** (deployment schema) for Client ID and the corresponding password for Client Secret. Then, Click **Next**.

  ![Define Remote Deployment attributes and click next](images/perform-rd4.png " ")

9. The Remote Deployment Options page appears.
  - Under **Deploy Application**: Set **Build Status Override** to **Run and Build Application**.
  - Under **Export Preferences**: For **Export Supporting Object Definitions**, select **Yes and Install on Import Automatically**.
  - Under **Deployment Overrides**: In this example, even though the application does not yet exist on the target system, turn the **Overwrite Existing Application option** **On** so that you can preserve the application ID, and enable this application for future overwrites.


After making the above selections, click **Deploy**.

![Enable Overwrite Existing Application](images/perform-rd5.png " ")

10. You see the Remote Deployment Successful message. Your application has been successfully deployed to remote server.

  ![Application Deployed Successfully](images/perform-rd6.png " ")

11. Log in to your remote APEX instance. Make sure that the application is available and with the same application id as in the source system.

  ![Login into your remote APEX Instance](images/perform-rd7.png " ")

## **Acknowledgments**

- **Author** - Roopesh Thokala, Product Manager
- **Last Updated By/Date** - Roopesh Thokala, Product Manager, June 2022
