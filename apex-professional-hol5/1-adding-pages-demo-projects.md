# Add Pages to the Demo Projects application

## Introduction

In this lab,
  - You navigate to **Demo Projects Application** and create an **Interactive Grid** and **Smart Filters** Pages.

<!--
Customers will be able to:
- Review the items in the shopping cart
- Edit the quantity of the items
- Remove an item
- Clear the shopping cart
- Proceed to checkout

Estimated Time: 20 minutes

Watch the video below for a quick walk through of the lab.

[](youtube:Cvl9xMAqnm8)

-->
Estimated Time: 20 minutes


### Objectives
In this lab, you will:
- Create Pages to Search and Edit the Projects and Tasks in **Demo Projects** Application.

### Downloads

- Did you miss out trying the previous labs? Don’t worry! You can download the application from **[here](files/demo-projects-1.sql)** and import it into your workspace. To run the app, please run the steps described in **[Get Started with Oracle APEX](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.

## Task 1: Add Interactive Grid to Demo Projects Application.
In this lab, you create an interactive grid on the **DEMO_PROJECTS** table. You already created the **Demo Projects** application in HOL-3. Now, you create an **Interactive Grid** in the **Demo Projects** application.

1. On the Workspace home page, click the App Builder icon. Select **Demo Projects** Application.

    ![](./images/select-demo-projects-app1.png " ")

2. Click **Create Page**.

    ![](./images/create-page11.png " ")

3. For Create a Page:
   Select Page Type - Select **Component** and then select **Interactive Grid**.

    ![](./images/create-ig-1.png " ")

4. For Page Attributes, enter the following:

   Under **Page Definition**:

        - For Page Number : Enter **4**.

        - For Page Name : Enter **Project Tasks**  

   Under **Data Source**:

        - For **Table/View Name** : Select **DEMO_PROJECTS**.

   Under **Navigation**

        - For **Breadcrumb** : Set it to **No**.

    Click **Create Page**.

    ![](./images/create-ig-2.png " ")

5. Now that you have created an **Interactive Grid** Page, you can view the page by clicking **Save** and **Run Page** on the top Right.

    ![](./images/view-interactive-grid11.png " ")

## Task 2: Add Smart Filters to Demo Projects Application.
In this lab, you create a Smart Filters report on the DEMO_PROJECTS table. You already created the **Demo Projects** application in HOL-3. Now, you will create a Smart Filters in the Demo Projects application.

1. Navigate to Create button and click **Page**.

    ![](./images/create-sf-page11.png " ")

2. For Create a Page:
   Select Page Type - Under **Component** tab, select **Smart Filters**.

    ![](./images/create-sf-page12.png " ")

3. For **Create Smart Filters**, Enter the following:

   Under **Page Definition**:

      - For **Page Number**: Enter **8**

      - For **Name**: Enter **Project Tasks Search**  

   Under **Data Source**:

      - For **Table/View Name** : Select **DEMO_PROJECTS**  

   Under **Navigation**:

      - For **Breadcrumb**: Set it to **No**.

   Click **Next**.

  ![](./images/create-sf-page13.png " ")

4. For **Select the Filters** page:
    - Leave the remaining details to defaults.
    - Click **Create Page**.

    ![](./images/create-sf-page14.png " ")

5. Now that you have created a **Smart Filters** Page, You can view the Page by Clicking **Save and Run Page**

    ![](./images/create-sf-page16.png " ")

## Task 3: Add Content Row to Demo Projects Application.  

1. Navigate to Create button and click Page.

    ![](./images/cr-page-8.png " ")

2. For Create a Page, Select **Blank Page**.

    ![](./images/cr-blank-page.png " ")

3. For **Create a Blank Page**:

    - For Name: Enter **Project Task Status**
    - Leave the remaining details to defaults.
    - Click **Create Page**.

   ![](./images/cr-create-page.png " ")

4. Under Page Rendering, Right Click Body and Select **Create Region**.

    ![](./images/cr-create-region.png " ")

5. In the Property Editor, Enter the following:  
    Under **Identification**:

      - For Title : Enter **Project Task Status**

      - For Page : Select **Content Row**

    Under **Source**:

      - For Table Source : Select **DEMO_/PROJECTS**

      ![](./images/cr-region-details.png " ")

6. Click on Attributes and Enter the following:

   Under **Settings**:

   - For Overline : Select **PROJECT**

   - For Title : Select **TASK_/NAME**

   - For Description : Enter **Task Assigned To: &ASSIGNED_/TO.**

   - For Miscellaneous: Enter **Cost: &cost.**

    ![](./images/cr-attributes.png " ")

    ![](./images/cr-attributes1.png " ")

   - Enable **Display Avatar** and **Display Badge**

   Under **Avatar**:

    - For Icon : Enter **fa-tasks**

  Under **Badge**:

   - For Label : Select **PROJECT**

   - For Value : Select **STATUS**

   - For State : Select **ASSIGNED_/TO**

   - For Icon : Enter **fa-square**

  ![](./images/cr-attributes2.png " ")

7. Click **Save**

8. Click **Shared Components** Tab, Select **Navigation Menu** then **Edit Component**.

   ![](./images/cr-navigation.png " ")

9. Click Edit for **Project Task Status** and for **Image/Class**, enter **fa-layout-list-left** and Click Apply Changes.

   ![](./images/cr-navigation-edit.png " ")

   ![](./images/cr-report-icon.png " ")

10. Click **Run Application**.

    ![](./images/cr-run-page.png " ")



## Summary

You now know how to create interactive grid ,smart filters and Content row report. You may now **proceed to the next lab**.

## Acknowledgments

- **Author** - Roopesh Thokala, Product Manager
- **Contributor** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, October 2023
