# Enhance the App With Mobile Features

## Introduction

In this lab, you improve the user experience of the Social Media app by including an Image Upload item that allows users to crop images before uploading. You also implement a **Share** button so users can share uploaded images by email or other applications. Finally, you add mobile capabilities to the application by enabling Push Notifications, shortcuts, and screenshots for the Progressive Web App.

Estimated Time: 30 minutes

### Objectives

In this lab, you learn how to:

- Configure the Image Upload item to crop images before upload.
- Add a **Share** button to share posts using other applications.
- Enable Push Notifications.
- Add shortcuts to the Progressive Web App.
- Add screenshots to the Progressive Web App install experience.

## Task 1: Add the Image Upload Item

In this task, configure the Image Upload item on the Timeline page. This enables users to crop images before they submit a new post to the Social Media application.

1. In App Builder, open the **APEX Social Media** application and open the Timeline page in Page Designer.

    Navigate to the **P1\_FILE\_BLOB** item in the Rendering Tree. In the Property Editor, enter/select the following:

    - Under **Identification**:

        - Type: **Image Upload**.

    - Under Display:

        - Display As: **Block Dropzone**

    - Under Cropping:

        - Allow Cropping: **Toggle On**

    ![Set Display As to Block Dropzone and toggle Allow Cropping on](images/create-act-crop.png " ")

2. Click **Save and Run** to test the changes.

    ![Click Save and Run in Page Designer](images/save-and-run.png " ")

3. Click **Add Post**.

    An Image Upload dialog opens.

    Choose an image or drag and drop the image.

    Crop the image and click **Apply Changes**.

    Click **Post** to post the image to your Timeline.

    ![Click Add Post to open Image Upload dialog](images/add-post.png " ")

    ![Crop the uploaded image and click Apply Changes](images/crop-image.png " ")

4. The new image now appears on your Social Media Timeline.

    ![New image post displayed on the Social Media Timeline](images/sm-timeline.png " ")

## Task 2: Add the Share Button

In this task, add a Share button to each Timeline post. This enables users to share uploaded images through email or other applications that support the browser share capability.

> **Note:**
>
> - On macOS, Share does **not** work on Chrome and Firefox browsers. Use Edge or Safari browsers.
> - On Windows, Share does **not** work on Edge browser. Use Chrome or Safari browsers.

1. Return to Page Designer for the Timeline page. Under the **Timeline** region, right-click **Actions** and select **Create Action**.

    ![Right-click Actions and select Create Action](images/create-share.png " ")

2. In the Property Editor, update the following properties:

    - Under Identification:

        - Type: **Button**

        - Label: **Share**

    - Under Behavior:

        - Type: **Redirect to URL**

        - Target URL: **#action$share?id=&ID.**

    - Under **Appearance**

        - Display Type: **Icon**

        - Icon: **fa-share-alt**

    ![Set Display Type to Icon and Icon to fa-share-alt](images/share-button.png " ")

3. In the Rendering Tree on the left pane, select **Page 1: Timeline**.

    In the Property Editor, under **JavaScript > Execute When Page Loads**, replace the code with the following code snippet:

    ```javascript
    <copy>
    apex.actions.add([{
        name: "like",
        action: (event, element, args) => {
            apex.items.P1_ACTION_ID.value = args.id;
            apex.event.trigger(document, "action-like");
        }
    }, {
        name: "delete",
        action: (event, element, args) => {
            apex.items.P1_ACTION_ID.value = args.id;
            apex.event.trigger(document, "action-delete");
        }
    }, {
        name: "open-map",
        action: () => {
            apex.event.trigger(document, "action-open-map");
        }
    }, {
        name: "open-about",
        action: () => {
            apex.event.trigger(document, "action-open-about");
        }
    }, {
        name: "share",
        action: (event, element, args) => {
            apex.items.P1_ACTION_ID.value = args.id;
            apex.event.trigger(document, "action-share");
        }
    }]);
    </copy>
    ```

    ![Replace the Execute When Page Loads JavaScript code](images/exec-js2.png " ")

4. In the Rendering Tree, click the **Dynamic Actions** tab. Right-click **Custom** and select **Create Dynamic Action**.

    ![Right-click Custom and select Create Dynamic Action](images/custom-da.png " ")

5. In the Property Editor, enter/select the following properties:

    - Identification > Name: **action-share**

    - Under When:

        - Custom Event: **action-share**

        - Selection Type: **JavaScript Expression**

        - JavaScript Expression: **document**

    ![Configure action-share dynamic action with Custom event](images/action-share.png " ")

6. In the left pane, under **action-share**, click the **Show** action. In the Property Editor, update the following properties:

    - Under Identification:

        - Action: **Share**

    - Under Settings:

        - Title: **Image Shared on Social Media App**

        - Text: **&APP_USER. is sharing a file.**

        - Share Type: **File(s)**

        - File(s) Source: **SQL Query**

        - SQL Query:

            ```sql
            <copy>
            SELECT file_blob, file_name, file_mime
            FROM sm_posts
            WHERE id = :P1_ACTION_ID;
            </copy>
            ```

        - Items to Submit: **P1\_ACTION\_ID**

    ![Configure the Share action with file source settings](images/true-action-share.png " ")

7. Click **Save and Run**.

    ![Click Save and Run to apply the share button changes](images/run-app-share.png " ")

8. The Share button is displayed for each post.

    Click **Share** to open a context menu and choose the application you want to share with.

    In this example, choose **Mail**. The post is attached as an image in an email draft with associated text.

    ![Click Share button on a post to open the share context menu](images/share-app-pic.png " ")

    ![Select Mail from the share options](images/share-app-pic1.png " ")

    ![Post shared as image attachment via Mail](images/share-app-pic2.png " ")

## Task 3: Enable Push Notifications

In this task, configure push notifications for the Social Media application. The application notifies a post owner when another user likes one of their posts.

1. Return to your APEX workspace.

    Add a new column to the **SM\_REACTIONS** table to track notifications.

    In the left navigation, hover over the **SQL Workshop** icon and select **Object Browser**.

    ![Navigate to Object Browser from SQL Workshop](images/nav-sql.png " ")

2. In the **Object Browser**, under Tables, select **SM\_REACTIONS**.

    On the right pane, click **Add Column**.

    ![Select SM_REACTIONS table and click Add Column](images/add-column.png " ")

3. In the Add Column wizard, enter the following:

    - Column: **NOTIFIED**

    - Data Type: **VARCHAR2**

    - Length: **1**

    - Default: **'N'** (By default, all rows in **SM\_REACTIONS** have the default value **'N'** to indicate that the user has not yet been notified.)

    Click **Apply**.

    ![Enter NOTIFIED column details and click Apply](images/new-column.png " ")

4. Create an automation. This automation frequently checks for new rows in the **SM\_REACTIONS** table and triggers the push notification accordingly.

    To create an automation, navigate to **App Builder** by clicking the icon in the left navigation bar.

    ![Navigate to App Builder](images/nav-app1.png " ")

5. From the App Builder Home page, click the application tile **APEX Social Media**.

    ![Click the APEX Social Media application tile](images/apphome.png " ")

6. From the Application home page, select **Shared Components**.

    ![Select Shared Components on the Application home page](images/shared.png " ")

7. Under Workflows and Automations, click **Automations**.

    ![Click Automations under Workflows and Automations](images/auto.png " ")

8. Click **Create**.

    ![Click Create to start a new Automation](images/automations-create.png " ")

9. In the Create Automation wizard, enter/select the following:

    - Name: **Notification**

    - Execution Schedule: **Custom**

    - Frequency: **Minutely**

    - Interval: **2**

    Click **Next**.

    ![Enter Notification automation details with Minutely schedule](images/notification-automation-details.png " ")

10. In the Create Automation wizard, under **Source Type**, select **SQL Query** and copy and paste the following SQL statement in the code box:

    ```sql
    <copy>
    SELECT r.id, p.created_by AS post_owner, r.created_by AS liked_by
    FROM sm_posts p
    JOIN sm_reactions r
        ON p.id = r.post_id
    WHERE r.notified = 'N';
    </copy>
    ```

    Click **Create**.

    ![Select SQL Query source type and enter the notification query](images/notification-sql-query.png " ")

11. The automation has been created and is in the *Disabled* state. Under Settings, change the **Schedule Status** to **Active**.

    ![Change Schedule Status to Active](images/notification-schedule-active.png " ")

12. Create two actions to execute when the automation runs.

    Click the **Actions** tab.

    Click the **Edit** icon for New Action.

    ![Click Edit icon for New Action under Actions](images/notification-action-edit.png " ")

13. In the Edit Action page, update the following information:

    - Name: **Send Push Notification**

    - Type: **Send Push Notification**

    - To: **&POST\_OWNER.**

    - Title: **&LIKED\_BY. liked your post.**

    Click **Apply Changes**.

    ![Configure Send Push Notification action with recipient and title](images/send-notification.png " ")

14. Click **Add Action** to add a second action.

    ![Click Add Action to create a second action](images/add-action.png " ")

15. In the Edit Action page, update the following:

    - Name: **Update Reactions Table**

    - Type: **Execute Code**

    - Code: Copy and paste the following code:

    ```sql
    <copy>
    UPDATE sm_reactions
    SET notified = 'Y'
    WHERE id = :ID;
    </copy>
    ```

    Click **Create**.

    The **Update Reactions Table** action updates the Notified column value in the **SM\_REACTIONS** table to **'Y'** to indicate that the user has been notified about the reaction.

    ![Configure Update Reactions Table action with Execute Code](images/update-reactions.png " ")

16. Enable Push Notifications for the application.

    Navigate to **Shared Components**.

    ![Navigate to Shared Components](images/shared-comp.png " ")

17. Under User Interface, select **Progressive Web App**.

    ![Select Progressive Web App under User Interface](images/progressive-web-app.png " ")

18. On the Progressive Web App page, click the **Push Notifications** tab. Toggle **Enable Push Notifications** to **On**, then click **+ Generate Credentials**.

    ![Toggle Enable Push Notifications on and click Generate Credentials](images/push-notifications-generate-credentials.png " ")

19. In the confirmation dialog, click **Generate Credentials**.

    ![Confirm Generate Credentials in the dialog](images/generate-push-credentials-confirm.png " ")

20. Click **+ Add Settings Page**.

    ![Click Add Settings Page](images/push-notifications-add-settings-page.png " ")

21. **Create Push Notifications Settings Page** dialog window appears. Click **Create**.

    ![Click Create in the Push Notifications Settings Page dialog](images/create-push-notifications-settings-page.png " ")

22. Click **Apply Changes**.

    ![Click Apply Changes after creating the Push Notifications settings page](images/push-notifications-apply-changes.png " ")

23. Progressive Web App is updated.

    Click **Save and Run**.

    ![Click Save and Run after PWA update](images/push-notifications-save-and-run.png " ")

24. In the Social Media app, click your username at the top right and select **Settings**.

    ![Click username and select Settings](images/user-menu-settings.png " ")

25. Push Notifications is disabled by default. Click **Off**.

    ![Click Off to open Push Notifications toggle](images/push-notifications-off.png " ")

26. Enable the checkbox for **Enable push notifications on this device**.

    ![Enable the push notifications on this device checkbox](images/enable-push-notifications-device.png " ")

27. If a user likes one of your posts, you receive a push notification on your device.

    ![Push notification received when a user likes your post](images/show-push-notify.png " ")

    > **Note:**
    >
    > - If you are unable to see Push Notifications, ensure that Do Not Disturb is disabled in your system and your browser has the necessary permissions to send notifications.
    > - View the [Push Notifications compatibility matrix](https://apex.oracle.com/pls/apex/r/apex_pm/apex-pwa-reference/push-notifications)

## Task 4: Add Shortcuts for the PWA App

In this task, configure a shortcut for the Progressive Web App. The shortcut allows users to open the Timeline page directly from the installed application menu.

1. Return to App Builder > **Progressive Web App** page, navigate to the **Installability** tab, and scroll down to **Shortcuts**.

    Click **Enable for All Sessions**.

    ![Click Enable for All Sessions under Shortcuts](images/enable-for-all.png " ")

2. In the pop-up window, confirm by clicking **Enable for All Sessions**.

    > **Note:** This option does not work in *apex.oracle.com* instance.

    ![Confirm Enable for All Sessions in the pop-up](images/confirm-enable.png " ")

3. Click **Add Shortcut**.

    ![Click Add Shortcut](images/add-shortcut-button.png " ")

4. In the Add Shortcut dialog, enter/select the following:

    - Name: **Timeline**

    - Target URL: *Select the Timeline page*

    - Upload an icon: *Upload an icon for the shortcut*

    Click **Create**.

    ![Enter Timeline shortcut details and click Create](images/add-shortcut-images.png " ")

    The shortcut is displayed after you complete Task 5. Similarly, you can add multiple shortcuts, each pointing to a different page in your application.

## Task 5: Enhance the PWA Install Experience with Screenshots

In this task, add screenshots to the Progressive Web App install experience. These screenshots are displayed when users install the application and help present the application experience before installation.

1. In the Progressive Web App page, under Screenshots, click **Add Screenshot**.

    ![Click Add Screenshot under Screenshots section](images/add-screenshot.png " ")

2. In the PWA Screenshot wizard, enter a description and upload a screenshot.

    Click **Create**.

    ![Enter description, upload screenshot, and click Create](images/add-screenshot-image.png " ")

3. Repeat steps 1-2 to add additional screenshots.

    Click **Apply Changes**.

    ![Click Apply Changes after adding screenshots](images/apply-changes2.png " ")

4. Click **Save and Run**.

    ![Click Save and Run to preview the PWA app](images/save-and-run-pwa.png " ")

5. Click **Install App** to install as a PWA.

    A pop-up window displays the screenshots and a message to confirm the installation of the application.

    Follow the on-screen instructions to install the application.

    ![Click Install App to install as PWA](images/install-app.png " ")

    ![Confirm install with screenshots displayed in the pop-up](images/install-app-ss.png " ")

6. After the PWA is installed, right-click the application icon in your taskbar or dock and view the shortcut called **Timeline**.

    Click the shortcut to open the corresponding page in the application.

    ![Right-click app icon to view the Timeline shortcut](images/view-shortcut.png " ")

    > **Note:**
    >
    > - View the [Screenshots compatibility matrix](https://apex.oracle.com/pls/apex/r/apex_pm/apex-pwa-reference/installation).
    > - View the [Shortcuts compatibility matrix](https://apex.oracle.com/pls/apex/r/apex_pm/apex-pwa-reference/app-icon).

## Summary

You now know how to enhance the Social Media app with mobile features such as cropping and sharing images, Push Notifications, shortcuts, and screenshots.

## Acknowledgements

- **Author** - Toufiq Mohammed, Principal Product Manager; Apoorva Srinivas, Principal Product Manager
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, May 2026
