# Enhance the App with Mobile Features

## Introduction

In this lab, you improve the user experience of the Demo Projects App. You also implement a 'Share' button where a user can share the pages to other users via email or 3rd party apps. Finally, You also learn to add Shortcuts, Screenshots and Meta Tags to the PWA app.

Estimated Time: 15 minutes

### Objectives

In this lab, you:

- Implement the 'Share' button
- Enable Push Notifications
- Add Shortcuts to the pwa app
- Include screenshots to be displayed while installing the pwa app

## Task 1: Configure Progressive Web Application

1. Navigate to the **Demo\_Projects** App.

  ![select the application](images/select-demo-projects.png " ")

2. In the App Builder, select **shared components**.

   ![Select Shared Components](images/navigate-to-shared-components.png " ")

2. In the Shared Components page, under User Interface, Select **Progressive Web App**.

   ![Select Progressive Web App](images/navigate-to-pwa.png " ")

3. Now, Navigate to **Progressive Web App** and Then Set **Installable** to **Yes**.

   ![Set Installable to Yes](images/set-installable-yes.png " ")

## Task 2: Enhance the PWA install experience with Screenshots

The Oracle APEX Progressive Web App screenshots are used for promotional purposes when users are prompted to install the Progressive Web App.

1. Navigate to **Demo Projects** app and select Shared components. In the Shared Components page, under User Interface, Select **Progressive Web App**.
  ![PWA page](images/navigate-to-pwa1.png " ")

2. In the Progressive Web App page, under Screenshots, click **Add Screenshot**.
  ![click add screenshot](images/click-add-screenshot.png " ")

3. In PWA screenshot wizard, click **Upload a Screenshot**.

  ![click upload Screenshot](images/upload-screenshot.png " ")
  > **Note:** _You can download the images by clicking on the links below
  [**app-screenshot-1.png**](images/app-screenshot-1.png)
  [**app-screenshot-2.csv**](images/app-screenshot-2.png)
  _

4. From your local system, select the Screenshot that you wish to upload. In this case, select **app-screenshot-1** from your local system. And then, Click **Create**>
  ![select app screenshot one](images/select-app-screenshot1.png " ")
  ![click create screenshot](images/click-create-screenshot.png " ")


5. Repeat steps 2-4 to add as many screenshots as you like and click **Apply Changes**. In this case, add **app-screenshot-2** which you have downloaded earlier.

  ![add app screenshot two](images/add-screenshot-2.png " ")

4. Click **Apply Changes**.
  ![click apply changes](images/click-apply-changes.png " ")


**Note:**
  - View the compatibility matrix for the **Screenshots** [here](https://apex.oracle.com/pls/apex/r/apex_pm/apex-pwa-reference/installation)
  - View the compatibility matrix for the **Shortcuts** [here](https://apex.oracle.com/pls/apex/r/apex_pm/apex-pwa-reference/app-icon)

## Task 3: Add Shortcuts for the PWA app

Oracle APEX Progressive Web App shortcuts provide a convenient way for users to access specific pages within the application.

On touch-enabled devices, users can simply long-press on the home screen app icon to access the shortcuts. For non-touch devices, such as computers, users can right-click on the taskbar app icon to access the same feature.

By providing these shortcuts, Oracle APEX enhances the user experience and makes it easier for users to quickly access the pages they need within the PWA.

1. Scroll down to **Shortcuts** and click **Enable for All Sessions**. In the popup window, confirm by clicking **Enable for All Sessions**.
> **Note:** _This option does not work in *apex.oracle.com* instance._

  ![enable for all sessions](images/enable-for-all-sessions.png " ")  
  ![confirm dialog](images/confirm-dialog.png " ")

3. Click **Add Shortcut**.
  ![click add shortcut](images/add-shortcut.png " ")  

4. In the Add Shortcut dialog:
    - For Name, Enter **Dashboard**
    - For Target URL, click **Item Picker** and then select **Dashboard** Page.
      ![select dashboard page](images/select-dashboard-page.png " ")
    - For Upload an Icon, click **Upload an Icon** button and then select the icon from your local system.
      ![select dashboard page](images/upload-an-icon.png " ")
      ![select dashboard page](images/upload-an-icon1.png " ")

5. Click **Create**.

Similarly, you can add multiple shortcuts each pointing to a different page in your app.

## Task 4: Add the Share Button

In this task, you add a Share button that allows a user to share the post via email, or other apps.
Note:
- On macOS, Share will NOT work on Chrome and Firefox browsers. Use Edge or Safari browsers.
- On Windows, Share will NOT work on Edge browser. Use Chrome, Edge or Safari browsers.

1. Navigate to the Dashboard page in your Demo Projects App.

2. Right-click **Body** and select **Create Button**.

    ![create button](images/create-button.png " ")

2. In the Property Editor, update the following properties:
    - Under Identification:
        - Label: **Share**
    - Under Layout:
        - Position: **Body**
    - Under Appearance:
        - Set Hot to **Yes**
        - Enter or Select Icon as **fa-share-alt**

    ![configure Share](images/configure-share.png " ")

3. In the **Rendering Tree**, right click on **Share** button and click **Create Dynamic Action**.
    ![Create Dynamic Action](images/create-da.png " ")

4. Select the Newly created Dynamic action and then in the Property Editor, under identification, set **Name** to **Share Page**.
    ![configure Dynamic Action](images/configure-da.png " ")

5. Under **True Action**, select **show** and then in the Property editor configure the following:
    - Under **Identification**,
      - Set Action to **Share**.
    - Under Settings,
      - Set Title as **Share Dashboard Page**
      - Set Text as **Sharing the Dashboard Page to the World!**.
    ![configure Dynamic Action](images/configure-da1.png " ")

## Task 5: Configure Meta Tags

Meta tags are pieces of information about a web page that allows other systems to read a summary of the page content. Sharing APEX pages is more convenient when the content of that page can be previewed on other social media platforms. APEX allows to define meta tags for **public-facing** APEX pages directly from Page Designer.

1. Navigate to the **Dashboard page** in your Demo Projects App.

2. In Page Designer, Select **Page 2 : Dashboard** and then in the Property Editor, Under **Security**, Set Authentication as **Page is Public**.

  ![page is public](images/page-is-public.png " ")

3. In the Page Attributes, under **Advanced**, Set **Enable Meta Tags** to **Yes**.
  ![page is public](images/enable-meta-tags.png " ")

4. A new section will appear in the Page Designer **Rendering Tree**. Select the newly created Meta Tag and then in the Property Editor,
  - Under Identification,
    - set Name to **Desctiption**
    - Set Value to **Web share - Demo Projects App, Dashboard**
  ![page is public](images/configure-meta-tags.png " ")

5. Click **Save**.

## Summary
In this lab, you learnt to enhance the **Demo Projects** app with mobile features such as Sharing Pages, and add the latest pwa features like Shortcuts and Screenshots.

## Acknowledgments
- **Author** - Roopesh Thokala, Senior Product Manager
- **Last Updated By/Date** - Roopesh Thokala, Senior Product Manager, January 2024
