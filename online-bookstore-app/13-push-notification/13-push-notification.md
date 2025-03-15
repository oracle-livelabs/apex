# Push Notification

## Introduction

In this lab, you learn to enable push notifications.

Estimated Time: 5 minutes

### Objectives

In this lab, you will:

- Push Notification

## Downloads: Missed Previous Labs? Download and Install the Application

If you're stuck or missed out on completing the previous labs, don't worry! You can download and install the application as follows:

1. Click [here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/apex%2Fobs-lab12.zip) to download the completed application zip file.

2. Import the **downloaded zip** file into your workspace. To import the app, go to **App Builder > Import**.

3. Follow the steps in the Install Application wizard to install the app along with the Supporting Objects.

4. Update the hashed password for user01:

    - Go to **SQL Workshop > Object Browser > Tables > OBS\_USERS > Data**.

    - Click the **edit icon** for user01 and update the password to **secretPassword**.

5. Update the Web Credential and Generative AI:

    - To create an OCI API Key, Refer to [Task 1: Generate API Keys using OCI Console](?lab=8-build-an-ai-assistant-chat-widget#Task1:GenerateAPIKeysusingOCIConsole) of [Lab 8: Build an AI-Assistant Chat Widget](?lab=8-build-an-ai-assistant-chat-widget)

    - Edit the apex\_ai\_cred details to match with your OCI API Key,  Refer to [Task 2: Create Web Credentials](?lab=8-build-an-ai-assistant-chat-widget#Task2:CreateWebCredentials) of [Lab 8: Build an AI-Assistant Chat Widget](?lab=8-build-an-ai-assistant-chat-widget)

    - To edit the generative ai, Refer to [Task 3: Configure Generative AI Service](?lab=8-build-an-ai-assistant-chat-widget#Task3:ConfigureGenerativeAIService) of [Lab 8: Build an AI-Assistant Chat Widget](?lab=8-build-an-ai-assistant-chat-widget)

6. Update the Picture URL:

    - Go to **SQL Workshop > RESTful Services > Modules > User Images > profile_pic/:id > GET** and copy Full URL.

    - Go to **App Builder > Online Bookstore > Shared Components > Application Computations > PICTURE\_URL > Computation >**, and replace **<****picture\_url****>** with the copied FULL URL up to ..profile_pic/.

7. Update the Google Auth Credential:

    - To create an Google API Key, Refer to [Task 5: Login with Google](?lab=12-onboarding#Task5:LoginwithGoogle) of [Lab 12: Improve User Onboarding](?lab=12-onboarding), following steps 1 to 10.

    - Edit the Google Authentication details to match with your Google API Key, Refer to [Task 5: Login with Google](?lab=12-onboarding#Task5:LoginwithGoogle) of [Lab 12: Improve User Onboarding](?lab=12-onboarding), following steps 12 to 16.

8. All set. Now, run the application and see it in action!.

## Task 1: Push Notification

In this task, you will enable Push Notifications for the application and configure them to notify users when a book becomes available. You'll set up Progressive Web App (PWA) settings and implement a process to send notifications.

1. Navigate to **App Builder** and select **Online Bookstore application**.

    ![Click My Apps](images/13-1-1-app.png " ")

2. Click **Shared Components**.

    ![Click My Apps](images/13-1-2-sc.png " ")

3. Select **Progressive Web App** under **User Interface**.

    ![Click My Apps](images/13-1-3-user-interface1.png " ")

4. Enter/Select the following:

    - Under General:

        - Enable Progressive Web App: **Toggle On**

        - Installable: **Toggle On**

    ![Click My Apps](images/13-1-4-1-installable.png " ")

    - Under Push Notifications:

        - Enable Push Notifications: **Toggle On**

        - Credentials: Click **+ Generate Credentials** and click **Generate Credentials** in the confirm dialog window.

        - Settings Page: Click **+ Settings Page** and click **Create** in the **Create Push Notifications Settings Page** dialog window

    ![Click My Apps](images/13-1-4-2-Credentials.png " ")
    ![Click My Apps](images/13-1-4-3-Credentials1.png " ")
    ![Click My Apps](images/13-1-4-4-Settings.png " ")
    ![Click My Apps](images/13-1-4-5-Settings1.png " ")

    Click **Apply Changes**

    ![Click My Apps](images/13-1-4-5-apply-changes.png " ")

5. Navigate to the application homepage by clicking the **Application ID**.

    ![Click My Apps](images/13-1-5-appid.png " ")

6. Select Page **50 - Edit Book Details**

    ![Click My Apps](images/13-1-6-page50.png " ")

7. Select **P50\_AVAILABILITY\_YN** under **Edit Book Details** region and update the following:

    - Under Identification:

        - Name: **P50\_AVAILABILITY**

        - Label: **Availability**

    ![Click My Apps](images/13-1-7-avai-item.png " ")

8. Right-click on **P50\_AVAILABILITY** under **Edit Book Details** region and select **Duplicate**.

    ![Click My Apps](images/13-1-8-avai-item-dup.png " ")

9. In the Property editor, enter/select the following:

    - Under Identification:

        - Name: **P50\_AVAILABILITY\_OLD**

        - Type: **Hidden**

    - Source > Form Region: **- Select -**

    - Under Default:

         - Type: **Item**

         - Item: **P50_AVAILABILITY**

    ![Click My Apps](images/13-1-9-avai-item-dup-details.png " ")

10. Navigate to **Processing** tab, right-click **Processing** and select **Create Process**.

    ![Click My Apps](images/13-1-10-process.png " ")

11. In the Property editor, enter/select the following:

    - Identification > Name: **Push Notification**

    - Source > PL/SQL Code: Copy and paste the below code:

        ```
        <copy>
        for eachuser in (
            SELECT
                ou.username,
                ob.title,
                ob.author
            FROM
                obs_wishlist ow
            JOIN
                obs_users ou ON ow.user_id = ou.user_id
            JOIN
                obs_books ob ON ow.book_id = ob.book_id
            WHERE
                ob.book_id = :P50_BOOK_ID
        ) loop

        if :P50_AVAILABILITY= 'Y' and :P50_AVAILABILITY_OLD= 'N' then
            apex_pwa.send_push_notification (
                    p_application_id => :app_id,
                    p_user_name      => UPPER(eachuser.username),
                    p_title          => 'Book is available now',
                    p_body           => eachuser.title || ' by ' ||  eachuser.author || ' is now in stock.',
                    p_target_url     =>  apex_util.host_url || apex_page.get_url(p_page => 1,
                    p_plain_url       =>    true )
                    );
        end if;
        end loop;
        apex_pwa.push_queue;
        </copy>
         ```

    - Execution > Sequence: **20**

    ![Click My Apps](images/13-1-11-process-details.png " ")

12. Click **Save**.

Progressive Web App is updated.

## Task 2: Configure Navigation Bar Entries for Settings Page of Push Notification

In this task, you will configure the Navigation Bar to include a Settings option for managing push notifications. This ensures users can easily access notification preferences from the app's navigation menu.

1. Navigate to **Shared Components**.

    ![close dialog](images/13-1-sc-admin-2.png " ")

2. Under **Navigation and Search**, click **Navigation Bar List**

    ![close dialog](images/13-2-nav-bar-admin2.png " ")

3. Click **Navigation Bar**.

    ![close dialog](images/13-2-nav-bar-admin1.png " ")

4. Click **Create List Entry**.

    ![close dialog](images/13-2-4-navbar.png " ")

5. Enter/select the following:

    - Under Entry:

        - Parent List Entry: **&USERNAME.**

        - Sequence: **1**

        - Image/Class: **fa-gear**

        - List Entry Label: **Settings**

    - Target > Page: **20000**

    Click **Create List Entry**.

    ![close dialog](images/13-2-create-entry-admin.png " ")

## Task 3: Run the Application

In this task, you will run the application, enable push notifications, and test the feature by updating a book's availability. If the book is on your wishlist, you will receive a push notification when it becomes available.

1. Run the application and enter the credentials below:

      - Username: **user01**

      - Password: **secretPassword**

    ![close dialog](images/13-3-1.png " ")

2. In the Online Bookstore App, click on your username at the top-right corner and select **Settings**.

    <!-- ![close dialog](images/13-2-6-settings.png " ") -->
    ![close dialog](images/13-3-2.png " ")

3. Push Notifications is disabled by default. Click **Off** and enable the checkbox for **Enable push notifications on this device**.

    ![close dialog](images/13-2-6-settings1.png " ")
    ![close dialog](images/13-2-6-settings2.png " ")

4. To receive the push notification, change the availability status from "No" to "Yes" as an admin under Manage Book Information in the Administration section. If the book is in your wishlist, you will receive a push notification.

    ![close dialog](images/13-3-4.1.png " ")
    ![close dialog](images/13-3-4.2.png " ")

## Summary

You now know how to configure push notifications in Oracle APEX. This allows you to send real-time alerts and updates to users, enhancing communication and engagement.

You are now ready to move on to the next lab!

## Acknowledgements

- **Author**: Pankaj Goyal, Member Technical Staff
- **Last Updated By/Date**: Pankaj Goyal, Member Technical Staff, March 2025