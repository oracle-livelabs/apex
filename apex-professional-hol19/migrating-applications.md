# Migrate Application Development Between Environments

## Introduction

In this lab, You will create Installation scripts and Data Packages to export Database objects along with Data. Then you will export the **DEMO PROJECTS** Application along with supporting objects and import it into another workspace.

In the second part of the lab, You will be using Remote Deployment to deploy your Application from Development to UAT. The ORDS feature, **REST Enabled SQL** is not available for **apex.oracle.com** users. Therefore, you will not be able to perform this lab in the hosted instance apex.oracle.com. You should be using **APEX Service** or **APEX on Autonomous Database** options for this lab.

Estimated Time: 10 minutes

### Objectives

In this lab, you will:
- Create Installation Scripts
- Create Data Packages
- Export application with supporting Objects.

### Downloads

- Did you miss out on trying the previous labs? Don’t worry! You can download the application from **[here](files/demo-projects5.sql)** and import it into your workspace. To run the app, please run the steps described in **[Get Started with Oracle APEX](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.

## Task 1: Create Installation Scripts, Data packages, and Export Applications.

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

10. Now, you will see that the Scripts got created and Saved. You will need to include **Data** in your **Supporting Objects**. Select **Create Data Package** under **Tasks** on the Right side of your page.

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

16. You will now notice that the application is downloaded as **fNNN.sql**

  ![File downloaded](images/exported-app.png " ")


## Task 2: Importing Application into the Target Workspace and Verify Database Objects.

In this Lab, You will login into a new workspace or the Workspace you created in previous labs and import the application along with Supporting objects.

1. Log in to the Target **Workspace**.

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


## **Acknowledgments**

- **Author** - Roopesh Thokala, Product Manager
- **Contributor** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Roopesh Thokala, Product Manager, Dec 2022
