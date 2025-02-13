# Push Notification

## Introduction

In this lab, you learn to enable push notifications.

Estimated Time: 10 minutes

### Objectives

In this lab, you will:

- Push Notification

## Task 1: Push Notification

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
            select (select username from obs_users ou where ou.user_id = ow.user_id ) username,
            (select title from obs_books where book_id = :P50_BOOK_ID)  title,
            (select author from obs_books where book_id = :P50_BOOK_ID)  author
            from obs_wishlist ow
            where book_id = :P50_BOOK_ID
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

## Task 3: Enable Push Notification from the UI

1. In the Online Bookstore App, click on your username at the top-right corner and select **Settings**.

    ![close dialog](images/13-2-6-settings.png " ")

2. Push Notifications is disabled by default. Click **Off** and enable the checkbox for **Enable push notifications on this device**.

    ![close dialog](images/13-2-6-settings1.png " ")
    ![close dialog](images/13-2-6-settings2.png " ")

## Summary

You now know how to configure push notifications in Oracle APEX. This allows you to send real-time alerts and updates to users, enhancing communication and engagement.

You are now ready to move on to the next lab!

## Acknowledgements

- **Author**: Pankaj Goyal, Member Technical Staff
- **Last Updated By/Date**: Pankaj Goyal, Member Technical Staff, Feb 2025