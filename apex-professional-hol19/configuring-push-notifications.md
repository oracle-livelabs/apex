# Enhance the App with Mobile Features

## Introduction

In this lab, you improve the user experience of the Social Media App by including an APEX 23.2 new item called Image Upload that allows the user to crop images before uploading. You also implement a 'Share' button where a user can share the uploaded images to other users via email or 3rd party apps. Finally, you add mobile capabilities to the app by enabling Push Notifications for the Social Media App where a user receives a notification on their device whenever a user likes the image. You also learn to add Shortcuts and Screenshots to the pwa app.

Estimated Time: 20 minutes

### Objectives

In this lab, you:

- Enable Push Notifications
- Learn how to configure Push Notifications


## Task 1: Enable Push Notifications

1. 1. Navigate to the **Demo\_Projects** App.

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

9. Push Notifications is disabled by Default. Click **Off** and enable the checkbox for **Enable push notifications on this device**.

    ![Settings page](images/click-off.png " ")  

    ![Settings page](images/enable-push-notifications1.png " ")

10. Push Notifications is now enabled for the username.

Note:
- If you are unable to see the Push Notifications, ensure that the DND option is disabled in your system and your browser has necessary permissions to send notifications.
- View the compatibility matrix of Push Notifications [here](https://apex.oracle.com/pls/apex/r/apex_pm/apex-pwa-reference/push-notifications)

## Task 2: Creating a Page with reports for Push Notifications Views

No matter the approach you opt for in sending push notifications, it is crucial (especially for the APEX engine) to possess the ability to recognize users who have subscribed to this feature. This recognition is essential for the meaningful utilization of page processes or the API. APEX provides two distinct views to assist in analyzing records, revealing the subscribers to push notifications within your application, as well as the notifications currently in the queue.

1. Navigate to the Demo Projects Applciation by clicking **Application nnn** in the top left of the application.

    ![Navigate to Demo Projects app](./images/navigate-to-dp.png " ")

2. Click **Create Page**.

    ![click create page](./images/click-create-page.png " ")

3. For Create a Page:
   Select Page Type - Select **Component** and then select **Blank Page**.

    ![create a blank page](./images/create-blank-page.png " ")

4. For Page Attributes, enter the following:

    - Under **Page Definition**:

        - For Name, enter **Push Notifications Views**.

    - Under **Navigation**

        - For **Breadcrumb**, Set it to **No**.

    Click **Create Page**.

    ![configure blank page](./images/configure-blank-page.png " ")

5. Now that you have created a **Blank Page** Page, you can view the page by clicking **Save** and **Run Page** on the top Right.

6. In the Rendering Tree, select the Rendering tab. Right-click **Body** , select **Create Region**.

   ![Create create region](images/click-create-region.png " ")

6. In the Property Editor, edit the appropriate attributes:
    - Under **Identification** section:
      - For Title, Enter **PWA Views**
      - For Type, Select **Static Content**
    - Under **Appearance**:
      - For **Template**, Select **Tabs Container**.

    ![Configure pwa views region](images/configure-pwa-views.png " ")

7. In the Rendering Tree, Right-click **PWA Views** and click **Create Sub Region**.

    ![create sub region](images/create-sub-region1.png " ")

8. In the Property Editor, edit the appropriate attributes:
    - Under **Identification** section:
      - For Title, Enter **Push Notifications Subscriptions**
      - For Type, Select **Interactive Report**
    - Under **Source**:
      - For **Table Name**, Enter **APEX_APPL_PUSH_SUBSCRIPTIONS**.

    ![configure subscriptions](images/configure-subscriptions.png " ")

9. In the Rendering Tree, Right-click **PWA Views** and click **Create Sub Region**.

    ![create sub region 2](images/create-sub-region2.png " ")

10. In the Property Editor, edit the appropriate attributes:
    - Under **Identification** section:
      - For Title, Enter **Push Notifications Queue**
      - For Type, Select **Interactive Report**
    - Under **Source**:
      - For **Table Name**, Enter **APEX_PUSH_NOTIFICATIONS_QUEUE**.

    ![configure subscriptions](images/configure-push-queue.png " ")

11. You can view the page by clicking **Save** and **Run Page** on the top Right.

    ![configure subscriptions](images/run-views-page.png " ")


## Task 3: Create Page Processes to send Push notifications

APEX offers two methods for sending push notifications from an app. Each offers its own benefits and levels of control. Understanding these methods can help you choose the best approach for your specific needs.

**Send using Page Process**
The built-in 'Send Push Notification' page process lets you send a notification declaratively. This option is ideal for users who prefer a straightforward process without the need for extensive customization. This process sends a notification to a single user, although this user might have multiple devices expecting the same notification. To use this process, simply fill in the required fields, including the username, title, and description of the push notification. The process ensures your message is delivered to the intended recipient on any of their devices on which they've opted-in to receive notifications.

**Send using API**
For users seeking more control over the appearance and content of their push notifications, the apex_pwa API offers more flexibility. By using this API, you can manage additional parameters such as the icon and a different destination application. This approach is useful for looping through multiple users and sending multiple notifications at once.

1. In the **Demo Projects** app, navigate to **Page 4**.

2. In the **Rendering Tree**, navigate to **Processing** tab. Right click on **Process** and then click **Create Process**.

    ![configure subscriptions](images/click-create-process.png " ")

3. In the Property Editor, edit the appropriate attributes:
    - Under **Identification** section:
      - For Title, Enter **Send Push Notification**
      - For Type, Select **Send Push Notification**
    - Under **Settings**:
      - For **To**, Enter a username for whom you have Subscribed Push Notifications.
      - For **Title**, Enter a Title of your wish, in this example enter **Hey There!**.
      - For **Subject**, Enter **Welcome to PWA Push Notifications**.

    ![configure subscriptions](images/create-push-process.png " ")

4. In the **Rendering Tree**, navigate to **Processing** tab. Right click on **Process** and then click **Create Process**.

    ![configure subscriptions](images/create-process2.png " ")

3. In the Property Editor, edit the appropriate attributes:
    - Under **Identification** section:
      - For Title, Enter **APEX PWA API**
      - For Type, Select **Invoke API**
    - Under **Settings**:
      - For **Package**, Enter **APEX_PWA**.
      - For **Procedure or Function**, Enter **SEND_PUSH_NOTIFICATION**.

    ![configure subscriptions](images/configure-apex-pwa.png " ")

4. In the Rendering Tree, under **APEX PWA API**, select **p_user_name**. And then in the Property Editor, perform the following changes.
    - Under Value,
      - Set **Type** as **Static Value**.
      - For **Static Value**, Enter a username for whom you have Subscribed Push Notifications.
        ![configure subscriptions](images/configure-parameter.png " ")

5. In the Rendering Tree, under **APEX PWA API**, select **p_title**. And then in the Property Editor, perform the following changes.
    - Under Value,
      - Set **Type** as **Static Value**.
      - For **Static Value**, Enter **Welcome to Push Notifications**.
      ![configure subscriptions](images/config-apex-pwa-param.png " ")      

6. Click **Save**

## Summary
In this lab, you learnt to enhance the **Demo Projects** app with Push Notifications.

## Acknowledgments
- **Author** - Roopesh Thokala, Senior Product Manager
- **Last Updated By/Date** - Roopesh Thokala, Senior Product Manager, January 2024
