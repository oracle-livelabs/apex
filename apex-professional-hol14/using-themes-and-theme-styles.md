# Use Themes and Theme Styles

## Introduction

In this lab, you use the Theme Roller to save a new Theme Style. Then, you enable end users to apply this style while running the application.

Estimated Time: 10 minutes

<!--
Watch the video below for a quick walkthrough of the lab.

[](youtube:lwQ3lvul9iE)

### Objectives
In this lab, you will:
- Set the following pages as public pages:
    - Products
    - Shopping Cart
    - Order Information

- Disable the Navigation Menu

- Enhance the Navigation Bar -->

### Downloads

- Did you miss out on trying the previous labs? Don't worry! You can download the application from **[here](files/hol14.sql)** and import it into your workspace. To run the app, please run the steps described in **[Get Started with Oracle APEX](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.  


## Task 1: Use Themes and Theme Styles

In this hands-on lab, you save a Theme Style by using the Theme Roller. Then, you enable end users to apply this style while running the application.

1. Navigate to **App Builder** and then run the **Online Shopping Application**. In the Developer Toolbar, click **Customize** and then select **Theme Roller**.

  ![Click Customize in Developer Toolbar](images/navigate-to-theme-roller.png " ")

2. The current Theme Style is **Vita**. Under **Global Colors**, click the color swatch to select new colors.
To edit a specific component, expand a group and select new colors or styling of the component you wish to edit.

  Modify the look by specifying colors of your choice and preview the changes. Once you are done, click **Save As** and **Save**

    ![Change Color](images/change-color.png " ")

3. Under **Theme**, change the **Select Theme** to **Redwood Light**

    ![Select Theme to Redwood Light](images/change-theme.png " ")

4. For Theme Attributes, enter the following:  
    Under **Redwood Options**:
      - For Layout: Select **Floating**.  

    Under **Appearance**:
      - For Header: Select **Dark**.
      - For Body Header: Select **Dark**.
      - For Body Background: Select **Dark**.

    Click **Save As**.

  ![Edit Redwood theme](images/change-redwood-theme-options1.png " ")

5. In the Save As dialog, enter **Redwood Light (Copy_1)** for Style Name and click **Save**.

    ![Save Theme](images/click-save1.png " ")

6. Close the **Theme Roller** by clicking **X**. Click **App < n >** in the Developer Toolbar.

    ![Select Application ID](images/select-application.png " ")

7. On the application home page, click **Shared Components**. Under User Interface, click **User Interface Attributes**.

    ![Navigate to shared Components](images/select-shared-comp.png " ")

    ![Click User Interface Attributes](images/click-usa.png " ")

8. Under **Attributes**, click **Enable End Users to Choose Theme Style**. Make sure this attribute is set to **On**.
Notice that the new Theme Style you saved is displayed under the Theme Style list. Click **Apply Changes**.

    ![Change Theme2](images/change-usa.png " ")

9. Now, run the application. At the bottom of the page, click the **Customize** link.

    ![Click Customize Link](images/select-customize1.png " ")

10. Users can specify their Theme Style while running the application using the Customize dialogue. Select the Theme Style **Vita** and click Apply Changes.

    ![Customize](images/customize1.png " ")

11. The Theme Style is applied, and you see a message that says Preferences changed for user < username >.

    ![Preferences Changed](images/preferences-changed.png " ")

## Task 2: Import and Export Theme Styles
The Theme Roller dialog appears, displaying the styles for your application. You can export and import style changes directly from Theme Roller by selecting the following options from the Additional Options menu: Import, Export, and Reset.

1. To import theme styles:
     - Select **Customize** from the Developer toolbar and then click **Theme Roller**.
     - From the Additional Options menu, select Import. A File Browser appears.

     You can download the theme-style JSON file from [**here**](files/vita-new.json) and import it into your application.

     ![Preferences Changed](images/theme-import.png " ")

     - Navigate to the downloaded file to set the custom CSS code, variable style changes, add classes, and LESS compilation configuration to be applied to the current theme style.

     ![Preferences Changed](images/file-import.png " ")

     ![Preferences Changed](images/file-imported.png " ")

2. To export theme styles:
   From the Additional Options menu, select Export. This option exports the current style configuration into a JSON file.

     ![Preferences Changed](images/export-file.png " ")

3. To reset theme styles:
   From the Additional Options menu, select Reset.
   This option reverts any unsaved theme style changes.

     ![Preferences Changed](images/reset-file.png " ")

## Summary
You now know how to save a new Theme Style using the Theme Roller. You may now **proceed to the next lab**.

## What's Next
In the upcoming practical session, you will build a new application called Expense Tracker. Throughout this workshop, you will gain proficiency in establishing a multi-level approval management system. Specifically, you will learn to create task definitions and a Unified Task List page. Additionally, you will incorporate various events into your task definitions, such as delegating the request, requesting information, and managing expiration. Furthermore, you will learn to create email templates, set up Oracle APEX account users, and utilize SQL scripts.

## Acknowledgements
- **Author** - Roopesh Thokala, Senior Product Manager
- **Contributor** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, January 2024
