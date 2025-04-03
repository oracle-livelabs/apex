# Enhance the App with Mobile Features

## Introduction

In this lab, you improve the user experience of the Demo Projects App. You also implement a 'Share' button where a user can share the pages with other users via email or 3rd party apps. Finally, you will also learn to add shortcuts, screenshots, and meta tags to the PWA app.

Estimated Time: 15 minutes

### Objectives

In this lab, you:

- Implement the 'Share' button
- Enable Push Notifications
- Add Shortcuts to the PWA app
- Include screenshots to be displayed while installing the PWA app

## Task 1: Configure Progressive Web Application

1. Navigate to the **Demo Projects** App.

  ![select the application](images/select-demo-projects.png " ")

2. In the App Builder, select **shared components**.

   ![Select Shared Components](images/navigate-to-shared-components.png " ")

2. In the Shared Components, under User Interface, Select **Progressive Web App**.

   ![Select Progressive Web App](images/navigate-to-pwa.png " ")

3. Now, Navigate to **Progressive Web App** and Then Set **Installable** to **Yes**.

   ![Set Installable to Yes](images/set-installable-yes.png " ")

## Task 2: Enhance the PWA install experience with Screenshots

The Oracle APEX Progressive Web App screenshots are used for promotional purposes when users are prompted to install the Progressive Web App.

1. Navigate to the **Demo Projects** application and select Shared Components. Select **Progressive Web under User Interface on the Shared Components page.

     ![PWA page](images/navigate-to-pwa1.png " ")

2. In the Progressive Web App page, under Screenshots, click **Add Screenshot**.

     ![click add screenshot](images/click-add-screenshot.png " ")

3. Click **Upload a Screenshot** in the PWA screenshot wizard.

     ![click upload Screenshot](images/upload-screenshot.png " ")

  > **Note:** You can download the images by clicking on the links below
  [**app-screenshot-1.png**](images/app-screenshot-1.png)
  [**app-screenshot-2.csv**](images/app-screenshot-2.png)

4. From your local system, select the Screenshot that you wish to upload. In this case, select **app-screenshot-1** from your local system. And then, Click **Create**.

    ![select app screenshot one](images/select-app-screenshot1.png " ")

    ![click create screenshot](images/click-create-screenshot.png " ")


5. Repeat steps 2-4 to add as many screenshots as possible. In this case, add **app-screenshot-2**, which you downloaded earlier.

     ![add app screenshot two](images/add-screenshot-2.png " ")

4. Click **Apply Changes**.

     ![click apply changes](images/click-apply-changes.png " ")


**Note:**
  - View the compatibility matrix for the **Screenshots** [here](https://apex.oracle.com/pls/apex/r/apex_pm/apex-pwa-reference/installation)
  - View the compatibility matrix for the **Shortcuts** [here](https://apex.oracle.com/pls/apex/r/apex_pm/apex-pwa-reference/app-icon)

## Task 3: Add Shortcuts for the PWA app

Oracle APEX Progressive Web App shortcuts provide a convenient way for users to access specific pages within the application.

Users can long-press on the home screen app icon on touch-enabled devices to access the shortcuts. Users can right-click the taskbar app icon for non-touch devices, such as computers, to access the same feature.

By providing these shortcuts, Oracle APEX enhances the user experience and makes it easier for users to access the pages they need within the PWA quickly.

> **Note:** _An APEX application can only use PWA Shortcuts if Rejoin Sessions is enabled. Before configuring shortcuts, click either Enable for Public Sessions or Enable for All Sessions._

1. Scroll down to **Shortcuts** and click **Enable for All Sessions**. Confirm by clicking **Enable for All Sessions ** in the popup window.

    > **Note:** _This option does not work in *apex.oracle.com* instance._

    ![enable for all sessions](images/enable-for-all-sessions.png " ")

    ![confirm dialog](images/confirm-dialog.png " ")

2. Click **Add Shortcut**.

    ![click add shortcut](images/add-shortcut.png " ")  

3. In the Add Shortcut dialog:

    - For Name: Enter **Dashboard**

    - For Target URL: Click **Item Picker** and select **Dashboard** Page.

      ![select dashboard page](images/select-dashboard-page.png " ")

    - For Upload an Icon: click the **Upload an Icon** button and select the icon from your local system.

      ![select dashboard page](images/upload-an-icon.png " ")

      ![select dashboard page](images/upload-an-icon1.png " ")

4. Click **Create**.

    Similarly, you can add multiple shortcuts, each pointing to a different page in your app.

## Task 4: Add the Share Button

In this task, you add a Share button that allows a user to share the post via email or other apps.
    Note:
    - On macOS, Share will NOT work on Chrome and Firefox browsers. Use Edge or Safari browsers.
    - On Windows, Share will NOT work on the Edge browser. Use Chrome, Edge or Safari browsers.

1. Navigate to the Application ID and Select the **2-Dashboard** page in your Demo Projects App.

2. Right-click **Body** and select **Create Button**.

    ![create button](images/create-button.png " ")

2. In the Property Editor, update the following properties:

   Under Identification:

      - For Label: Enter **Share**

   Under Appearance:

      - Set Hot to **Yes**

      - For Icon: Enter **fa-share-alt**

      ![configure Share](images/configure-share.png " ")

3. In the **Rendering Tree**, right click on **Share** button and click **Create Dynamic Action**.

      ![Create Dynamic Action](images/create-da.png " ")

4. Select the Newly created Dynamic action, and then, under-identification, set **Name** to **Share Page**in the Property Editor.

      ![configure Dynamic Action](images/configure-da.png " ")

5. Under **True Action**, select **show** and then in the Property editor configure the following:

  Under Identification:

      - Set Action to **Share**.

  Under Settings:

      - For Title: **Share Dashboard Page**

      - For Text: **Sharing the Dashboard Page to the World!**.

  Click **Save**.

      ![configure Dynamic Action](images/configure-da1.png " ")

## Task 5: Configure Meta Tags

Meta tags are information about a web page that allows other systems to read a summary of the page content. Sharing APEX pages is more convenient when the content of that page can be previewed on other social media platforms. APEX allows the definition of meta tags for **public-facing** APEX pages directly from Page Designer.


1. In Page Designer, Select **Page 2 : Dashboard** and then in the Property Editor, Under **Security**, Set Authentication as **Page is Public**.

    ![page is public](images/page-is-public.png " ")

2. In the Page Attributes, under **Advanced**, Set **Enable Meta Tags** to **Yes**.

     ![page is public](images/enable-meta-tags.png " ")

3. A new section will appear in the Page Designer under **Rendering Tree**. Select **description** and enter the following:

   Under Identification:

     - For Value: Enter **Web share - Demo Projects App, Dashboard**

     ![page is public](images/configure-meta-tags.png " ")

4. Click **Save**.

## Summary
In this lab, you learned to enhance the **Demo Projects** app with mobile features like Sharing Pages and add the latest PWA features like Shortcuts and Screenshots.

## Acknowledgements
- **Author** - Roopesh Thokala, Senior Product Manager
- **Last Updated By/Date** - Roopesh Thokala, Senior Product Manager, January 2024
