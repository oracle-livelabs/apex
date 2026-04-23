# Lab 5: Enhance the Application using APEXlang Skills

## Introduction
APEXlang is an Open Application Specification Language introduced in Oracle APEX 26.1. In this lab, you use APEXlang skills to vibe code and perform bulk updates, add business validations, create new pages and add a chatbot to the CRM application.

### Objectives
- Configure the APEXlang skills repository in Visual Studio Code.
- Update CRM application components including reports, buttons, validations, and dynamic actions.
- Extend the application experience with visualizations and an assistant built through APEXlang.

Estimated Time: 15 minutes

## Task 1: Set up the APEXlang Skills repo in VSCode
1. Configure Visual Studio Code to work with the APEXlang Skills repository and ensure the skills content is available locally. 

Download the skills from [here](https://orahub.oci.oraclecorp.com/dbtools-apex-dev/apex-app-gen/-/tree/apexlang-skill?ref_type=heads). Unzip the folder.

    ![Visual Studio Code workspace with APEXlang skills repository cloned](images/vscode-apexlang-repo-setup.png)

## Task 2: Export the app in APEXlang format into the Applications folder
1. Export the CRM application in APEXlang format and place the output inside the `Applications` folder of the APEXlang skills that you downloaded in Task 1.
    ![APEXlang command output showing exported application files](images/apexlang-export-app.png)

## Task 3: Import the App into your APEX workspace from VS Code
1. Expand the Applications folder and navigate to vision-crm > pages. Select any one of the page to open in the editor.

2. At the top right, you will be able to see a green arrow button for Import Application. (If you do not see this button, ensure that you have successfully connected to your APEX schema from SQL Developer extension.)

3. Click **Import Application**. View the status at the bar below. Once the application is successfully imported, run the application from the App Builder in your browser.

## Task 3: Change the leads report type to Content Row
1. Use APEXlang to adjust the leads report so it renders as a content report.

Prompt: Convert the lead management report to a content row. Show Lead Name and Lead Type Code. Display the lead value as a badge on the right with a proper avatar.
    ![APEXlang configuration panel changing leads report to content report](images/apexlang-leads-content-report.png)

2. Import Application into the workspace and view the Leads Management page to see the changes. Refer **Task 2** for steps to import the application from VS Code.
    ![Application running in the browser](images/view-leads-content-report.png)   

## Task 4: Bulk Edit pages
1. Update the placement of the New Leads and New Opportunity create buttons.

Prompt: Move all create buttons across the app - New Lead, New Opportunity, etc. - to the right side of the breadcrumb bar. Make them visually prominent.
    ![APEX builder interface repositioning create buttons](images/apexlang-bulk-edit-buttons.png)

2. Import Application into the workspace and view the Leads Management page to see the changes. Refer **Task 2** for steps to import the application from VS Code. 
Observe that 9 pages are updated and the buttons are now visually prominent.
    ![Application running in the browser](images/view-bulk-edit-buttons.png)

## Task 5: Enforce Business Rules using Validations
1. Ensure that both Budget Value and Estimated Value remain non-negative within the application.
Prompt: In the lead form ensure budget amount and Expected Value are non-negative.
    ![APEX validation rule enforcing non-negative budget values](images/apexlang-budget-validation.png)

2. Import Application into the workspace and view the Leads Management page to see the changes. Refer **Task 2** for steps to import the application from VS Code.  
Click on the three dots to **Edit** a lead record.
    ![Edit record in the app](images/edit-lead.png)

3. Enter a negative amount value for **Budget Amount** and click **Apply Changes**. Observe how a validation error is produced.
    ![APEX validation rule enforcing non-negative budget values](images/view-budget-validation.png)

## Task 6: Get Instant Feedback using Dynamic Action
1. Implement a dynamic action that immediately displays an intuitive message when the Budget value is modified to a negative number.

Prompt: Add inline validation to the Budget Amount field. Show an error message immediately when the value is modified, in addition to the existing submit validation.
    ![Dynamic action configuration showing negative budget warning message](images/apex-dynamic-action-negative-budget.png)

## Task 7: Visualize leads on a map, convert to heat map
1. Visualize the leads data on a map presentation.
    ![Leads data rendered on an interactive map region](images/apex-map-visualize-leads.png)

2. Import Application into the workspace and view the Leads Management page to see the changes. Refer **Task 2** for steps to import the application from VS Code. 
    ![Leads data rendered on an interactive map region](images/view-map-visualize-leads.png)

3. Convert the map into a heat map view using APEXlang capabilities.
    ![Heat map representation of leads density](images/apex-heatmap-view.png)

4. Import Application into the workspace and view the Leads Management page to see the changes. Refer **Task 2** for steps to import the application from VS Code. 
    ![Heat map representation of leads density](images/view-heatmap-view.png)

## Task 8: Build a CRM chat assistant
1. Build a CRM chat assistant experience powered by APEXlang.
    ![APEXlang-generated CRM chat assistant interface](images/apexlang-crm-chat-assistant.png)

2. Import Application into the workspace and view the Leads Management page to see the changes. Refer **Task 2** for steps to import the application from VS Code. 
    ![APEXlang-generated CRM chat assistant interface](images/view-chat-assistant.png)

## Acknowledgements
- **Author** - Apoorva Srinivas, Prinicpal Product Manager
- **Last Updated By/Date** - Apoorva Srinivas, Principal Product Manager, April 2026
