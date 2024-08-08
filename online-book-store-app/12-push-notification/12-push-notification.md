# Push Notification

## Introduction

## Task 1: Push Notification

1. Navigate to **App Builder** and select **Online Bookstore Application**.

2. Click **Shared Components**.

3. Click **Progressive Web App** under **User Interface**.

4. Enter/Select the following:

    - Under General:

        - Enable Progressive Web App: **Toggle On**

        - Installable: **Toggle On**

    - Under Push Notifications:

        - Enable Push Notifications: **Toggle On**

        - Credentials: Click **+ Generate Credentials** and select **Generate Credentials** in the confirm dialog window.

        - Settings Page: Click **+ Settings Page** and click **Create** in the **Create Push Notifications Settings Page** dialog window

        Click **Apply Changes**

5. Navigate to the application homepage by clicking the **Application ID**.

6. Click Page **50 - Edit Book Details**

7. Right-Click on **P50\_AVAILABILITY** under **Edit Book Details** region and Click **Duplicate**

8. In the Property editor, enter/select the following:

    - Under Identification:

        - Name: **P5\_AVAILABILITY\_OLD**

        - Type: **Hidden**

    - Under Source > Form Region: **- Select -**

    - Under Default:

         - Type: **Item**

         - Item: **P50_AVAILABILITY**

9. Navigate to the **Processing** tab, Right-Click **Processing** and Select **Create Process**.

10. In the Property editor, enter/select the following:

    - Under Identification:

        - Name: **Push Notification**

     - Under Source:

        - PL/SQL Code: Copy and Paste the below code:

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
                    p_user_name      => eachuser.username,
                    p_title          => 'Book is available now',
                    p_body           => eachuser.title || ' by ' ||  eachuser.author || ' is now in stock.',
                    p_target_url     =>  apex_util.host_url || apex_page.get_url(p_page => 1,
                    p_plain_url       =>    true )
                    );

        end if;

        end loop;apex_pwa.push_queue;
        </copy>
         ```

11. Drag and Drop **Push Notification** process before **Close Dialog** process.

12. Progressive Web App is updated. Now, **Save and Run** the page.

13. In the Online Bookstore App, click on your username at the top-right corner and select **Settings**.

14. Push Notifications is disabled by Default. Click **Off** and enable the checkbox for **Enable push notifications on this device**.

## Summary

In this lab....

You are now ready to move on to the next lab!

## Acknowledgements

- **Author**: Pankaj Goyal, Member Technical Staff
- **Last Updated By/Date**: Pankaj Goyal, Member Technical Staff, Aug 2024