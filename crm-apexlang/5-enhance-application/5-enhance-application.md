# Enhance the Application using APEXlang Skills

## Introduction
APEXlang is an Open Application Specification Language introduced in Oracle APEX 26.1. In this lab, you use APEXlang skills to vibe code and perform bulk updates, add business validations, create new pages and add a chatbot to the CRM application.

### Objectives
- Configure the APEXlang skills repository in Visual Studio Code.
- Update CRM application components including reports, buttons, validations, and dynamic actions.
- Extend the application experience with visualizations and an assistant built through APEXlang.

Estimated Time: 15 minutes

### Downloads
If you are stuck or want to download the completed app till Lab 4, click the following link: 

[CRM Phase 1 App Download](https://c4u02.objectstorage.us-ashburn-1.oci.customer-oci.com/p/9DEArLjsgbKXuJgQtSG95E8hMXRFtxgHR8jiHbqz4HgyVYXVnSo0SC_s-zq5CJA3/n/c4u02/b/hosted-files/o/crm_phase1.sql)

Import the app into your APEX workspace using App Builder.

## Task 1: Set up the APEXlang Skills repo in Visual Studio Code
1. Configure Visual Studio Code to work with the APEXlang Skills repository and ensure the skills content is available locally. 

    Download the APEXlang skills from Github: [APEXlang skills](https://github.com/oracle/skills/tree/main). 
    
    Unzip the folder.

    ![Visual Studio Code workspace with APEXlang skills repository cloned](images/vscode-apexlang-repo-setup.png)

3. Expand the **skills-main** folder and navigate to **apex** folder. Copy the **apexlang** folder and place it under **/.codex/skills**. This ensures that APEXlang skills are loaded to codex and can be used from the codex chat agent.

    ![local machine folder structure](images/codex-skills.png)


2. Create an empty folder called **Applications** on your local machine to manage your APEX apps.

    ![Folder structure](images/app-folder.png)

## Task 2: Export the app in APEXlang format into the Applications folder
Export the CRM application in APEXlang format and place the output inside the `applications` folder.

1. Navigate to SQL Developer extension, expand the connection you created and further expand **APEX**. Under APEX, you will find all the apps that are part of the schema. Right-click **Vision CRM** and select **Export**.
    ![APEXlang command output showing exported application files](images/apexlang-export-app.png)

2. Accept the default values, for Folder, click **Browse** and select the *applications* folder. Then, click **Apply**.
    ![APEXlang command output showing exported application files](images/export-to-apps.png)


## Task 3: Import the App into your APEX workspace from Visual Studio Code
1. Expand the Applications folder and navigate to **vision-crm > pages**. Select any one of the page to open in the editor.

    ![VS code application files](images/select-page.png)

2. At the top right, you will be able to see a green arrow button for Import Application. (If you do not see this button, ensure that you have successfully connected to your APEX schema from SQL Developer extension.)

    Click **Import Application**. View the status at the bar below. Once the application is successfully imported, run the application from the App Builder in your browser.

    ![VS code editor](images/green-button-import.png)

## Task 4: Change the leads report type to Content Row
From this task onwards, we are going to enhance and modify the Vision CRM app by providing prompts using the Codex client in Visual Studio Code.

1. Before you prompt, ensure that you choose **Intelligence** as **Medium** for Codex since we already have the necessary APEXlang skills for Codex to understand and reason faster.

    ![Codex editor](images/codex-intel.png)


1. Use APEXlang skills to convert the Leads Management report that is currently a classic report to a content row report.

    Prompt: 
    ```
    <copy>
    Convert the lead management report to a content row. Show Lead Name and Lead Type Code. Display the lead value as a badge on the right with a proper avatar.
    </copy>
    ```
    
    ![APEXlang configuration panel changing leads report to content report](images/apexlang-leads-content-report.png)

2. Import Application into the workspace and view the Leads Management page to see the changes. Refer **Task 3** for steps to import the application from Visual Studio Code.

    ![Application running in the browser](images/view-leads-content-report.png)   

## Task 5: Bulk Edit pages
1. Update the placement of the New Leads and New Opportunity create buttons.

    Prompt: 
    ```
    <copy>
    Move all create buttons across the app - New Lead, New Opportunity, etc. - to the right side of the breadcrumb bar. Make them visually prominent.
    </copy>
    ```

    ![APEX builder interface repositioning create buttons](images/apexlang-bulk-edit-buttons.png)

2. Import Application into the workspace and view the Leads Management page to see the changes. Refer **Task 3** for steps to import the application from Visual Studio Code. 
Observe that 9 pages are updated and the buttons are now visually prominent.
    ![Application running in the browser](images/view-bulk-edit-buttons.png)

## Task 6: Enforce Business Rules using Validations
1. Ensure that both Budget Value and Estimated Value remain non-negative within the application.

    Prompt: 
    ```
    <copy>
    In the lead form ensure budget amount and Expected Value are non-negative.
    </copy>
    ```

    ![APEX validation rule enforcing non-negative budget values](images/apexlang-budget-validation.png)

2. Import Application into the workspace and view the Leads Management page to see the changes. Refer **Task 3** for steps to import the application from Visual Studio Code.  
  

3. Click on any lead to **Edit** a lead record.

    ![Edit record in the app](images/edit-lead1.png)

    ![Edit record in the app](images/edit-lead2.png)

3. Enter a negative amount value for **Budget Amount** and click **Apply Changes**. Observe how a validation error is produced.
    
    ![APEX validation rule enforcing non-negative budget values](images/view-budget-validation.png)


## Task 7: Visualize leads on a Map
1. Visualize the leads data on a map presentation.

    Prompt:
    ```
    <copy>
        Add a map page to visualize leads by location.
    </copy>
    ```
    ![Leads data rendered on an interactive map region](images/apex-map-visualize-leads.png)

2. Import Application into the workspace and view the Leads Map page to see the changes. Refer **Task 3** for steps to import the application from Visual Studio Code. 
    ![Leads data rendered on an interactive map region](images/view-map-visualize-leads.png)


## Task 8: Build a CRM chat assistant
1. Build a CRM chat assistant experience powered by APEXlang that handles queries about leads and opportunities.

    Prompt: 
    ```
    <copy>
    Add an AI Assistant to the Executive Dashboard page which can handle queries about leads and opportunities.
    </copy>
    ```

    ![APEXlang-generated CRM chat assistant interface](images/apexlang-crm-chat-assistant.png)

3. Let us refine the chat assistant to enhance the search capability using Tools introduced in APEX 26.1. 

    Prompt: 
    ```
    <copy>
    Add a tool to Search leads based on owner, branch, stage.
    </copy>
    ```

    ![APEXlang-generated CRM chat assistant interface](images/add-search-tool.png)

4. Finally, let us try adding tools that perform a task on your behalf.

    Prompt: 
    ```
    <copy>
    Add a tool to convert Lead to Opportunities.
    </copy>
    ```

    ![APEXlang-generated CRM chat assistant interface](images/lead-convert-tool.png)


5. Import Application into the workspace and view the Executive Dashboard page to see the changes. Refer **Task 3** for steps to import the application from Visual Studio Code. 
    ![APEXlang-generated CRM chat assistant interface](images/view-chat-assistant.png)

    *TIP* : If you would like to look at the tools and changes made to the app by APEXlang:

    - Navigate to your App's **Shared Components**. 
    - Under Generative AI, select **AI Agents**.
    - Observe the **CRM Dashboard Assistant** Generative AI Agent created along with various On Demand Tools.

6. Try the following queries in the AI assistant.

- Query 1: 
    ```
    <copy>
    Show me recent leads owned by nyc.sales.1
    </copy>
    ```

    ![APEXlang-generated CRM chat assistant interface](images/query1.png)

- Query 2: 
    ```
    <copy>
    Analyse lead L-331
    </copy>
    ```

    ![APEXlang-generated CRM chat assistant interface](images/query2.png)

- Query 3: 
    ```
    <copy>
    Convert this lead to opportunity
    </copy>
    ```

    ![APEXlang-generated CRM chat assistant interface](images/query3.png)

## Acknowledgements
- **Author** - Apoorva Srinivas, Principal Product Manager
- **Last Updated By/Date** - Apoorva Srinivas, Principal Product Manager, April 2026
