# Improve UI & Navigation

## Introduction

In this lab, you will enhance the Employee Onboarding application by improving its User Interface (UI) and navigation menu. Earlier labs focused on building workflows and functional pages. This exercise focuses on creating a more intuitive and user-friendly experience for end users.

You will organize pages into meaningful navigation categories, configure the navigation menu for easier access, and apply a modern look and feel using the Theme Roller. These improvements will help HR, IT teams, and new hires quickly find the right tasks and workflows, resulting in a more streamlined onboarding solution.

### Objectives

In this lab, you will learn how to:

- Improve the navigation menu by grouping related pages under categories.

- Create a navigation region on the Home page for quick access to tasks and workflows.

- Enhance the application’s visual theme using the Theme Roller.

Estimated Time: 10 minutes

### Prerequisites

- All the previous Labs have been completed.

## Task 1: Improve Navigation Menu

1. On the top right, select the **Shared Components icon**.

    ![shared components](./images/shared-comps.png " ")

2. Under **Navigation and Search**, select **Navigation Menu**.

    ![Navigation Menu](./images/doc-nav-menu.png " ")

3. Select **Navigation Menu**.

    ![Select Navigation Menu](./images/docnav-menu1.png " ")

4. Under **List Entries**, select **Create List Entry**.

    ![List entries](./images/doc-create-list.png " ")

5. Enter/select the following:

    - Under Entry:

        - Image/Class: **fa-tasks-alt**
        - List Entry Label: **Task Pages**

    - Target > Page: **9**

    *Note: Link it to your **My Tasks** Page.*

    Click **Create List Entry**.

    ![Create List entry](./images/my-tasks.png " ")

6. Similarly, create another entry with the following properties:

    - Under Entry:

        - Image/Class: **fa-workflow**
        - List Entry Label: **Workflow Pages**

    - Target > Page: **16**

    *Note: Link it to your **Workflow Dashboard** Page.*

    Click **Create List Entry**.

    ![Create List entry](./images/my-wf.png " ")

7. Now, select **Tasks Initiated by Me**, **My Tasks** and update Parent List Entry to **Tasks Pages**. Click **Apply Changes**.

    ![Set Parent Entry](./images/doc-pat.png " ")

    ![Set Parent Entry](./images/doc-parents.png " ")

8. Similarly, select  **Workflows Initiated by Me**, **Workflow Dashboard**, **My Workflows** and update Parent List Entry to **Workflow Pages**. Click **Apply Changes**.

    ![Set Parent Entry](./images/doc-pat1.png " ")

    ![Set Parent Entry](./images/doc-parent1.png " ")

9. Now, select **Administration** list entry and enter/select the following:

    - Entry > Sequence: **150**

    - Under Target:

        - Target type: **Page in this Application**
        - Page: **2**

    Click **Apply Changes**.

    ![Set Admin Entry](./images/admin2.png " ")

10. Similarly, select **Archived Tasks and Workflows** list entry and set the Sequence: **145** and select **Apply Changes**.

    ![Set Admin Entry](./images/archived-tasks.png " ")

## Task 2: Improve UI

1. Navigate to the **Application Home page**.

2. Select **Home**.

    ![Select Home page](./images/home-page.png " ")

3. In the rendering tree, right click on **Body** and select **Create Region**.

    ![Create New Region](./images/create-nav-region.png " ")

4. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **Navigation Menu List**

        - Type: **List**

    - Source > List: **Navigation Menu**

    - Appearance > Template: **Blank with Attributes (No Grid)**

    ![Navigation Menu](./images/nav-props.png " ")

5. Under **Attributes**, select the following:

    - Under Apperance:

        - List Template: **Cards**

        - Template Options: select the following in the pop-up box:

            - General: Apply Theme Colors **Check**
            - Style: **Block**
            - Icons: **Display Icons**
            - Body Text: **Hidden**

            Click **OK**.

    ![Navigation Menu attributes](./images/nav-props2.png " ")

6. Click **Save and Run**.

    ![Save & Run Page](./images/run-page.png " ")

7. Login to the application

    ![Login to app](./images/login-app.png =50%x*)

8. In the **Developer Tool Bar**, select **Customize** and click **Theme Roller**.

    ![Theme roller](./images/theme-roller.png " ")

9. In the Theme Roller, select the following:

    - Theme > Select Theme: **Redwood Light**

    - Under Redwood Options:
        - Pillar: **Ocean**
        - Layout: **Floating**

    - Under Appearance:
        - Header: **Pillar**
        - Navigation: **Pillar**
        - Body Header: **Dark**
        - Body Background: **Dark**

        Click **Save**.

    ![Theme roller](./images/theme-roller2.png =35%x*)

10. Click **Save**.

    ![Theme roller](./images/theme-roller3.png " ")

## Summary

You have improved the Employee Onboarding application by updating the navigation menu, adding a navigation region on the Home page, and applying a new theme. These changes make the application easier to use and give it a more polished look.

## Acknowledgements

- **Author** - Sahaana Manavalan, Senior Product Manager; Roopesh Thokala, Senior Product Manager, August 2025
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, August 2025
