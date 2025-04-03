# Enhance the App with Mobile Features

## Introduction

In this lab, you improve the user experience of the Social Media App by including an APEX 23.2 new item called Image Upload that allows the user to crop images before uploading. You also implement a 'Share' button where a user can share the uploaded images with other users via email or 3rd party apps. Finally, you add mobile capabilities to the app by enabling Push Notifications for the Social Media App, where a user receives a notification on their device whenever a user likes the image. You also learn to add Shortcuts and Screenshots to the PWA app.

Estimated Time: 20 minutes

### Objectives

In this lab, you:

- Enable Push Notifications
- Learn how to configure Push Notifications


## Task 1: Enable Push Notifications

1. 1. Navigate to the **Demo Projects** Application.

    ![select the application](images/navigate-to-demo-proj.png " ")

2. In the App Builder, select **shared components**.

    ![Select Shared Components](images/click-shared-components.png " ")

3. In the Shared Components page, under User Interface, Select **Progressive Web App**.

    ![Select Progressive Web App](images/select-pwa.png " ")

4. Click **Push Notifications** tab and toggle the **Enable Push Notifications** button to ON. Click **+ Generate Credentials** and select **Generate Credentials** in the confirm dialog window.

    ![PWA settings page](images/enable-push-notifications.png " ")

    ![PWA settings page](images/click-generate-cred.png " ")

5. Click **+ Add Settings Page**.

    ![PWA settings page](images/click-add-settings.png " ")

6. Create Push Notifications Settings Page dialog window appears. Click **Create**.

    ![Push Notifications settings page](images/create-settings.png " ")

7. Progressive Web App is updated. Now, **Save and Run** the page.

    ![Push Notifications settings page](images/save-and-run.png " ")    

8. In the Demo Projects App, click on your username at the top-right corner and select **Settings**.

    ![App output](images/click-username.png " ")  

9. Push Notifications are turned off by default. Click **Off** and enable the checkbox for **Enable push notifications on this device**.

    ![Settings page](images/click-off.png " ")  

    ![Settings page](images/enable-push-notifications1.png " ")

10. Push Notifications is now enabled for the username.

Note:
- If you cannot see the Push Notifications, ensure that the DND option is turned off in your system and your browser has the necessary permissions to send notifications.
- View the compatibility matrix of Push Notifications [here](https://apex.oracle.com/pls/apex/r/apex_pm/apex-pwa-reference/push-notifications)

## Task 2: Create a Page with reports for Push Notifications Views

No matter the approach you opt for in sending push notifications, it is crucial (especially for the APEX engine) to possess the ability to recognize users who have subscribed to this feature. This recognition is essential for meaningful use of page processes or the API. APEX provides two distinct views to analyse records, revealing the subscribers to push notifications within your application and the notifications currently in the queue.

1. Navigate to the Demo Projects Application by clicking **Application ID** in the top left of the application.

    ![Navigate to Demo Projects app](./images/navigate-to-dp.png " ")

2. Click **Create Page**.

    ![click create page](./images/click-create-page.png " ")

3. For Create a Page: Select **Blank Page**.

    ![create a blank page](./images/create-blank-page.png " ")

4. For Page Attributes, enter the following:

    - Under **Page Definition**:

        - For Name: Enter **Push Notifications Views**.

    - Under **Navigation**

        - For Breadcrumb: Set it to **No**.

    Click **Create Page**.

    ![configure blank page](./images/configure-blank-page.png " ")

5. Now that you have created a **Blank Page** Page, you can view the page by clicking **Save** and **Run Page** on the top Right.

6. In the Rendering Tree, select the Rendering tab. Right-click **Body**and select **Create Region**.

   ![Create create region](images/click-create-region.png " ")

6. In the Property Editor, edit the appropriate attributes:
   Under **Identification**:

      - For Title: Enter **PWA Views**

      - For Type: Select **Static Content**

   Under **Appearance**:

      - For Template: Select **Tabs Container**.

    ![Configure pwa views region](images/configure-pwa-views.png " ")

7. In the Rendering Tree, Right-click **PWA Views** and click **Create Sub Region**.

    ![create sub region](images/create-sub-region1.png " ")

8. In the Property Editor, edit the appropriate attributes:
    Under **Identification**:

      - For Title: Enter **Push Notifications Subscriptions**

      - For Type: Select **Interactive Report**

    Under **Source**:

      - For Table Name: Enter **APEX\_APPL\_PUSH\_SUBSCRIPTIONS**.

    ![configure subscriptions](images/configure-subscriptions.png " ")

9. In the Rendering Tree, Right-click **PWA Views** and click **Create Sub Region**.

    ![create sub region 2](images/create-sub-region2.png " ")

10. In the Property Editor, edit the following:

    Under **Identification**:

      - For Title: Enter **Push Notifications Queue**

      - For Type: Select **Interactive Report**

    Under **Source**:

      - For Table Name: Enter **APEX\_PUSH\_NOTIFICATIONS\_QUEUE**

    ![configure subscriptions](images/configure-push-queue.png " ")

11. You can view the page by clicking **Save** and **Run Page** on the top Right.

## Task 3: Create Page Processes to send Push notifications

APEX offers two methods for sending push notifications from an app. Each offers its benefits and levels of control. Understanding these methods can help you choose the best approach for your needs.

**Send using Page Process**
The built-in 'Send Push Notification' page process lets you send a notification declaratively. This option is ideal for users who prefer a straightforward process without extensive customization. This Process sends a notification to a single user, although this user might have multiple devices expecting the same notification. To use this Process, fill in the required fields, including the username, title, and description of the push notification. The Process ensures your message is delivered to the intended recipient on any device they've opted to receive notifications.

**Send using API**
For users seeking more control over the appearance and content of their push notifications, the apex_pwa API offers more flexibility. This API allows you to manage additional parameters, such as the icon and a different destination application. This approach is practical for looping through multiple users and sending notifications simultaneously.

1. In the **Demo Projects** app, navigate to **Page 4**.

   ![configure subscriptions](images/run-views-page.png " ")

2. In the **Rendering Tree**, navigate to **Processing** tab. Right-click on **Process** and then click **Create Process**.

    ![configure subscriptions](images/click-create-process.png " ")

3. In the Property Editor, edit the appropriate attributes:
     Under **Identification**:

      - For Title: Enter **Send Push Notification**

      - For Type: Select **Send Push Notification**

     Under **Settings**:

      - For **To**: Enter a username for whom you have Subscribed to Push Notifications.

      - For Title: Enter a Title of your wish; in this example, enter **Hey There!**.

      - For **Subject**: Enter **Welcome to PWA Push Notifications**.

    ![configure subscriptions](images/create-push-process.png " ")

4. In the **Rendering Tree**, navigate to **Processing** tab. Right-click on **Process** and click **Create Process**.

    ![configure subscriptions](images/create-process2.png " ")

3. In the Property Editor, edit the appropriate attributes:

    Under **Identification**:

      - For Title, Enter **APEX PWA API**

      - For Type, Select **Invoke API**

    Under **Settings**:

      - For Package: Enter **APEX\_PWA**.

      - For Procedure or Function: Enter **SEND\_PUSH\_NOTIFICATION**.

    ![configure subscriptions](images/configure-apex-pwa.png " ")

4. In the Rendering Tree, under **APEX PWA API**, select **p\_user\_name**. Then, in the Property Editor, perform the following changes.
     Under Value:

      - For Type: Select **Static Value**

      - For Static Value: Enter a username for whom you have Subscribed to Push Notifications.

    ![configure subscriptions](images/configure-parameter.png " ")

5. In the Rendering Tree, under **APEX PWA API**, select **p\_title**. Then, in the Property Editor, perform the following changes.
    Under Value:

      - For Type: Select **Static Value**

      - For Static Value: Enter **Welcome to Push Notifications**.

      ![configure subscriptions](images/config-apex-pwa-param.png " ")      

6. Click **Save**

## Summary
You learned to enhance the **Demo Projects** app with push notifications in this lab.

## What's Next
In the upcoming hands-on lab, you will learn to Create Installation Scripts and Data Packages. Also, you gain insights into how to Export Applications with supporting Objects and use Remote Deployment to deploy your Application.

## Acknowledgements
- **Author** - Roopesh Thokala, Senior Product Manager
- **Last Updated By/Date** - Roopesh Thokala, Senior Product Manager, January 2024
