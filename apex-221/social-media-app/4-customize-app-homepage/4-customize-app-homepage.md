# Customize the App Homepage

## Introduction
In this lab, you will take advantage of the low code development by customizing the Social Media App declaratively. You will learn to navigate and modify the application and page properties.

Estimated Time: 5 minutes

## **Task 1**: Remove the Navigation Menu

1. The first thing we want to do is configure the page to not show any
navigation menu. We do this by ensuring that the top-level rendering
tree entry is selected on the left section (**Page 1: Timeline**), and
then by looking at the Page details on the right. Look for the **Navigation Menu** section in the list.

    ![Page designer is seen](images/property-editor-nav.png "")

2. We want to click the switch **Override User Interface Level** and leave
the List option at the default of *Do not show the Navigation Menu List*.

    ![The Navigation Menu group in the Property Editor](images/nav-menu-group.png "")

## **Task 2**: Remove the Breadcrumb Region

Since our app is going to be a Single Page Application, we do not need or want a breadcrumb bar at the top of the page. Let us go ahead and delete the one that got created by default.

1. In the Rendering Tree, navigate to Components > Breadcrumb Bar. Right-click on **APEX Social Media**, and select **Delete**.

    ![Rendering Tree in Page Designer](images/breadcrumb-delete.png "")

2. Observe how the tree reflects after the breadcrumb was deleted.

    ![Rendering Tree in Page Designer](images/after-breadcrumb-delete.png "")

3. Click **Save and Run** to see how they have affected our app so far.

    ![Save and Run button](images/save-and-run.png "")

    **Once you are signed in (if you weren't already), your app should look
like this:**

    ![The update app after the changes](images/updated-app.png "")

    **Note:** This will be our process of iterating over the app development: Make
changes, Save and Run and review the effects of our changes.

    With the navigation list and the breadcrumb removed, we have a nice
clean slate to proceed with.

    Switch back to your browser tab with **Page Designer**.

## [OPTIONAL] Alternate Time Saver

In this task, you will learn to download and import a starter app. If you follow this lab, you can skip Lab 1, Lab 2, Lab 3 and Lab 4. Once you complete this task, go to Lab 5.

1. Download the [Starter App](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/data-management-library-files/APEX_Social_Media_HOL_LAB1-4_completed.zip) for Social Media workshop. This app has all the functionality performed in Lab 1,2,3 and 4.

2. To import an application, from your app builder, click **Import**.

    ![App builder homepage](images/import.png)

3. Drag and drop the Starter app zip file downloaded in Task 1. Click **Next**.

    ![Import dialog](images/drag-and-drop.png)

4. Click **Next** to confirm import.

    ![Import dialog](images/import-confirm.png)

5. Accept the defaults and click **Install Application**. Click **Next**.

    ![Install app screen](images/install-app.png)

    ![Install app screen](images/supporting-objects.png)

6. Click **Install**. Once you get a success message, click **Run Application**.

    ![Install app screen](images/run-app.png)

    Now, continue Lab 5.

## **Acknowledgements**

 - **Author** - Jayson Hanes, Principal Product Manager; Apoorva Srinivas, Senior Product Manager; 
 - **Last Updated By/Date** - Apoorva Srinivas, Senior Product Manager, March 2023