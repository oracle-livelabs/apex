# Customize the App Homepage

## Introduction

In this lab, you will leverage low-code development to customize the Social Media App declaratively. You will learn how to navigate and modify application and page properties.

Estimated Time: 5 minutes

Watch the video below for a quick walk-through of the lab.
[Create an APEX App](videohub:1_bgxyfanv)

### Objectives

In this lab, you will:

- Customize the Application Homepage
- Learn to remove the Navigation Menu and Breadcrumb Region

### Prerequisites

- Completion of workshop through Lab 3

## Task 1: Remove the Navigation Menu

1. First, remove the navigation menu from the page by selecting **Page 1: Timeline** in the Rendering Tree.

    ![Page designer is seen](images/property-editor-nav.png "")

2. In the Property Editor, select the following:

    - Under Navigation Menu:

        - Override User Interface Level: Toggle **ON**

        - List: **Do not show the Navigation Menu List**

    ![The Navigation Menu group in the Property Editor](images/nav-menu-group.png "")

## Task 2: Remove the Breadcrumb Region

Since our app is a Single Page Application, we do not need a breadcrumb bar at the top of the page. Let's proceed with deleting the default breadcrumb.

1. In the Rendering Tree, navigate to **Components** > **Breadcrumb Bar**. Right click on **APEX Social Media**, and select **Delete**.

    ![Rendering Tree in Page Designer](images/breadcrumb-delete.png "")

    Observe how the tree reflects after the breadcrumb was deleted.

    ![Rendering Tree in Page Designer](images/after-breadcrumb-delete.png "")

2. Click **Save and Run** to see how they have affected our app so far.

    ![Save and Run button](images/save-and-run.png "")

    **Once you are signed in, your app should look like this:**

    ![The update app after the changes](images/updated-app.png "")

    **Note:** We will repeat this process of iterating over the app development: Make changes, Save and Run and review the effects of our changes.

    Switch back to your browser tab with **Page Designer**.

## [OPTIONAL] Alternate Time Saver

In this task, you will learn how to download and import a starter app. If you follow this lab, you can skip Lab 1, Lab 2, Lab 3, and Lab 4. Once you complete this task, proceed to Lab 5.

1. Download the [Starter App](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/data-management-library-files/APEX_Social_Media_HOL_LAB1-4_completed.zip) for Social Media workshop. This app has all the functionality performed in Lab 1,2,3 and 4.

2. To import an application, from your app builder, click **Import**.

    ![App builder homepage](images/import.png)

3. Drag and drop the Starter app zip file downloaded in **Point 1**. Click Next.

    ![Import dialog](images/drag-and-drop.png)

4. Accept the defaults and click **Install Application**.

    ![Install app screen](images/install-app.png)

5. Click **Install Supporting Objects**.

    ![Install app screen](images/install-support.png)

6. Click **Run Application**.

    ![Install app screen](images/run-app2.png)

    You may now **proceed to the next lab**

## Acknowledgements

- **Author** - Jayson Hanes, Principal Product Manager; Apoorva Srinivas, Senior Product Manager
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, February 2025
