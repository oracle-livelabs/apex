# Create an App from a Spreadsheet

In this lab, you build a simple application based on a spreadsheet. Remember that APEX is great for various apps, from simple ones to large, sophisticated apps based on local database objects, REST-enabled SQL objects, and even REST APIs.

While APEX developers spend the majority of their time in the App Builder, you should also investigate the SQL Workshop, where you can create and maintain database objects, Team Development, where you can track large APEX development projects, and the App Gallery, which contains numerous productivity and sample apps that can be installed within minutes.

Estimated Time: 10 minutes

### Objectives
In this lab, you will:
- Create an application from a spreadsheet.
- Restore a Deleted Application.
- Configure Progressive Web App.


## Task 1: Load Project data  

1. From your APEX workspace home page, click **App Builder**.

2.  Click **Create**.

    ![Create Application](images/create-app1.png " ")

3.  Select **Create App From a File**.

    ![Create application from a file](images/from-a-file.png " ")

    When creating an application from a file, APEX allows you to upload CSV, XLSX, XML, or JSON files and then build apps based on the data. Alternatively, you can copy and paste CSV data or load sample data.

4. In the Load Data Wizard, click **Choose File**.

    ![Choose file](images/choose-file.png " ")

5. Download and select [**demo_projects.csv**](files/demo_projects.csv) file from your local system.

    ![select demo_projects file](images/select-demo-projects.png " ")

6. Review the parsed data. For Table Name, enter **DEMO_PROJECTS** and click **Load Data**.

    ![Select Demo_projects table](images/new-table-name.png " ")

    After clicking **Load Data**, you will see a spinner until the wizard finishes loading the data.

## Task 2: Create an Application

The Data Load wizard has created a new table and populated that table with the records from the sample data spreadsheet. Now, you can create an app based on this new table.

1. Verify that 70 rows have been loaded into the **DEMO_PROJECTS** table in the Load Data dialogue. Then, click **Create Application**.

    ![Data loaded into Demo_projects](images/data-loaded.png " ")

2. From the Create Application page, we will remove the following pages:  
    - Demo Projects Search  
    - Demo Projects Report  
    - Calendar

   On the Create Application page, click **Edit** next to the **Demo Projects Search**.

    ![Edit Demo Projects Search](images/delete-pages.png " ")

3. Click **Delete** in the Add Faceted Search Page and then Confirm it by Clicking **OK**.

    ![Click Delete](images/delete-page1.png " ")

    ![Perform delete action](images/delete-page2.png " ")

    Repeat the steps for **Demo Projects Report** and **Calendar**.

4. Click **Create Application**.

    ![Create application2](images/create-application2.png " ")

    When the wizard finishes creating the Application, you will be redirected to the Application's home page in the App Builder.

## Task 3: Load Application Blueprint  

In this task, you learn to delete and restore the Demo Projects application Blueprint. 

1. First, you delete the Demo Projects application. Select **Demo Projects** Application on the workspace homepage.

    ![Select Demo demo projects](images/demo-projects.png " ")

2. Click **Edit Application Definition**.

    ![Edit Application Definition](images/edit-app-definition.png " ")

3. Click **Delete** to delete the application.

    ![Edit Application Definition](images/delete-demo-projects.png " ")

4. Click **Permanently Delete Now** in the Confirm Delete dialog window.

   ![Delete Permanently](images/delete-app.png " ")

5. To restore the Application using Blueprint, click **Create** on the Workspace homepage.

    ![Click Create](images/blueprint-create.png " ")

6. Select **Use Create App Wizard**.

    ![Click Use create App wizard](images/blueprint-create-app-wizard.png " ")

7. At the top of the page, click **Load Blueprint**.

    ![Click Load Blueprint](images/load-blueprint.png " ")

8. Select **Load** in the Demo Projects row.

   ![Click Load ](images/load-blueprint-button.png " ")

9. Click **Create Application**.

    ![Click Create Application ](images/create-demo-projects.png " ")

## Task 4: Configure Progressive Web App Attributes

1. Navigate to **Shared Components** from the Application homepage.

    ![Select Shared Components](images/navigate-to-shared-components1.png " ")

2. Under User Interface, select **Progressive Web App**.

    ![Select Progressive Web App](images/navigate-to-pwa1.png " ")


3.Toggle **Installable** to **ON** and click **Apply Changes**.

    ![PWA Definition](images/navigate-to-pwa.png " ")

## Task 5: Run and Explore the New App

1.  Navigate back to **DEMO\_PROJECTS** application and then click **Run Application**. This will open the runtime Application in a new browser tab, allowing you to see how end users will view the app.

    ![Run Application](images/run-application1.png " ")

2. Enter your user credentials and click **Sign In**.

    *Note: Use the same Username and Password you used to sign into the APEX Workspace.*

    ![Sign In](images/sign-in3.png " ")

3. Click on the **Install App** Icon on the Top Right of the page to install the Application to your local System.

    ![Click on Install App](images/install-app1.png " ")

## Summary
You now know how to create a spreadsheet application by dragging and dropping a file or loading sample data for training purposes.

## What's Next?
In the next workshop, you learn to Navigate and Review the Page Designer panes. You know how to create a normal page, add a region, sub-region, and page items, and lock and unlock pages.

## Acknowledgements
 - **Author** -  Roopesh Thokala, Senior Product Manager, Ankita Beri, Product Manager.
 - **Contributors** - Ankita Beri, Product Manager
 - **Last Updated By/Date** - Ankita Beri, Product Manager, January 2024
