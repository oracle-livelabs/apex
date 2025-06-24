# Create and Manage User Profile Pages

## Introduction

This lab focuses on guiding you through creating and managing user profile pages. The tasks will cover various aspects of page creation, customization, and linking, as well as using SQL queries, RESTful services, and form handling. By the end of this lab, you will have developed a fully functional user profile page that includes personal details, book lists, and functionalities for updating profiles and resetting passwords.

Estimated Time: 30 minutes

### Objectives

- Create a User Profile Page
- Add Navigation Bar Entries to include links to the user profile and other pages.
- Create and manage forms to update user details and reset passwords.
- Implement RESTful Services to handle user profile pictures and integrate these services into the application.

### Downloads: Missed Previous Labs? Download and Install the Application

If you're stuck or missed out on completing the previous labs, don't worry! Click [here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/obs-lab9.zip) to download the export file, which contains everything completed in the previous labs. To run the app, follow the steps described in the [Lab Appendix: Download Instructions](?lab=download-instructions) from Task 2 to Task 4.

## Task 1: Creating a Profile Page with a Book List

This task provides step-by-step instructions for creating a profile page displaying a book list. The profile page will be built from scratch, starting with a blank page and adding a series of regions and sub-regions to effectively organize and display the data. By following these steps, you will learn how to configure page properties, create regions for content display, and integrate an SQL query to populate the book list dynamically. This process will culminate in a user-friendly interface where users can view their book details and purchase links directly from their profile page.

1. Navigate to the application homepage by clicking the **Application ID**.

    ![close dialog](images/app-id8.png " ")

2. Click **Create Page**. 

    ![close dialog](images/profile-create-page.png " ")

3. Select **Blank Page**.

    ![close dialog](images/profile-blabk-page.png " ")

4. Enter/select the following:

    - Under Page Definition:

        - Page Number: **15010**

        - Name: **Profile**

    - Under Navigation:

        - Use Breadcrumb: **Toggle Off**

        - Use Navigation: **Toggle Off**

    Click **Create Page**.

    ![close dialog](images/profile-details.png " ")

5. Select **Page 15010: Profile** and in the Property Editor update Cursor Focus: **First item on page** under **Navigation**.

    ![close dialog](images/profile-first-item.png " ")

6. Right-click **Body** and select **Create Region**.

    ![close dialog](images/profile-create-region1.png " ")

7. In the Property Editor, enter/select the following:

    - Identification > Name: **My Details**

    - Appearance > Template: **Blank with Attributes**

    ![close dialog](images/profile-region-details.png " ")

8. Right-click **My Details** and select **Create Sub Region**.

    ![close dialog](images/profile-sub-region.png " ")

9. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **My Books**

        - Type: **Media List**

    - Under Source:

        - Type: **SQL Query**

        - SQL Query: Copy and paste the below code:

            ```
            <copy>
            select  distinct
                oi.book_id as book_id,
                bi.book_image as book_image,
                bi.title as title,
                oi.price as price,
                bi.description as description,
                sum(quantity) OVER (PARTITION BY oi.book_id) AS quantity
            from obs_order_items oi, obs_books bi, obs_orders o
            where o.order_id = oi.order_id and o.user_id = :USER_ID
                and oi.book_id(+) = bi.book_id;
            </copy>
            ```

    - Layout > Start New Row: **Toggle Off**

    ![close dialog](images/profile-my-books.png " ")

    - Under Appearance:

        - Template: **Content Block**  

        - Template Options: Click **Use Template Defaults**

            - Region Title: **Medium**

            Click **OK**.

    ![close dialog](images/profile-template.png " ")

10. Navigate to **Attributes**, enter/select the following:

    - Under Settings:

        - Title: **TITLE**

        - Display Avatar: **Toggle On**

        - Display Badge: **Toggle On**

        - Layout: **2 Column Grid**

        - Size: **Large**

    - Under Avatar:

        - Type: **Image**

        - Image: Click **No Media Defined** and enter/select the following.

            - Source: **URL**

            - URL: **&BOOK_IMAGE.**

          Click **OK**

        - Shape: **Square**

    - Under Badge:

        - Label: **&QUANTITY.**

        - Value: **QUANTITY**

    ![close dialog](images/profile-attributes.png " ")

11. Click **Save**.

<!-- 11. Under **My Books** region, right-click **Actions** and select **Create Action**.

    ![close dialog](images/profile-actions.png " ")

12. In the Property Editor, enter/select the following:

    - Under Identification > Position: **Link**

    - Under Link:

        - Type: **Redirect to URL**

        - Target > URL: **&BUY_LINKS.**

          Click **OK**.

        - Link Attributes: **target="_blank"**

    ![close dialog](images/profile-actions-details.png " ")

13. Click **Save**. -->

## Task 2: Configure Navigation Bar Entries for User Profiles

In this task, you set up entries for authenticated and public users, create a login entry, and link to a profile page.

1. Navigate to **Shared Components**.

    ![close dialog](images/10-2-sc.png " ")

2. Under Navigation and Search, click **Navigation Bar List**.

     ![close dialog](images/10-2-nav-bar-list.png " ")

3. Click **Navigation Bar**.

    ![close dialog](images/10-2-nav-bar.png " ")

4. Edit **&APP_USER.** and update the following:

    ![close dialog](images/10-2-edit-app-user.png " ")

    - Under Entry:

        - Sequence: **20**

        - Image/Class: Remove **fa-user**

        - List Entry Label: **&USERNAME.**

    - Conditions > Condition Type: **User is Authenticated (not public)**

    Click **Apply Changes**.

    ![close dialog](images/10-2-update-username.png " ")

    ![close dialog](images/10-2-condition-type.png " ")

5. Click **Create List Entry**.

    ![close dialog](images/10-2-nav-create-entry1.png " ")

6. Enter/select the following:

    - Under Entry:

        - Sequence: **12**

        - Image/Class: **fa-user**

        - List Entry Label: **Login**

    - Target > Page: **9999**

    - Conditions > Condition Type: **User is the Public User (user has not authenticated)**

    Click **Create and Create Another**.

    ![close dialog](images/10-2-login-nav.png " ")

    ![close dialog](images/10-2-login-condition.png " ")

7. Enter/select the following:

    - Under Entry:

        - Parent List Entry: **&USERNAME.**

        - Sequence: **12**

        - Image/Class: **fa-user**

        - List Entry Label: **My Profile**

    - Under Target:

        - Page: **15010**

        - Clear Cache: **15010**

    - Authorization > Authorization Scheme: **Must Not Be Public User**

    - User Defined Attributes > List Item CSS Classes: **icon-only**

    Click **Create List Entry**.

    ![close dialog](images/10-2-my-profile-nav.png " ")

    ![close dialog](images/10-2-my-profile-create-entry.png " ")

8. Navigate to the application homepage by clicking **Application ID**.

    ![close dialog](images/10-2-nav-to-app-id.png " ")

9. Select **10 - Search Books**

    ![close dialog](images/10-2-10-page.png " ")

10. Under Security > Authentication: **Page is Public**

    ![close dialog](images/10-2-page-is-public.png " ")

11. Click **Save**.

## Task 3: Create and Configure the Update Current User Page

In this task, you will learn how to create and configure a page to update the current user's profile within an application. You will have a functional "Update Current User" page that allows users to update their profile details, including username, email, and profile picture.

1. On page designer toolbar, navigate to **(+)** and select **Page**.

    ![close dialog](images/10-3-user-create-page.png " ")

2. Click **Blank Page**.

    ![close dialog](images/user-blank-page.png " ")

3. Under Page Definition, enter/select the following:

    - Page Number: **26**

    - Name: **Update Current User**

    - Page Mode: **Modal Dialog**

    Click **Create Page**.

    ![close dialog](images/update-current-user.png " ")

4. In the property editor, under **Navigation** > Warn on Unsaved Changes: **Toggle Off**

    ![close dialog](images/10-3-warn-on-change.png " ")

5. Right-click **Content Body** and select **Create Region**.

    ![close dialog](images/10-3-user-create-region1.png " ")

6. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **Update Current User**

        - Type: **Form**

    - Source > Table name: **OBS\_USERS**

    - Appearance > Template: **Blank with Attributes**

   ![close dialog](images/10-3-current-user-form.png " ")

7. Under **Update Current User**, expand **Columns**. Select **P26\_MIME\_TYPE** and **P26\_PICTURE\_URL**, right-click and select **Delete**.

    ![close dialog](images/10-3-delete-col.png " ")

8. Select **P26\_USER\_ID**, under Source > Query Only: **Toggle Off**.

    ![close dialog](images/10-3-user-id.png " ")

9. Select **P26\_EMAIL**, under Identification > Type: **Display Only** 

    ![close dialog](images/10-3-email.png " ")

10. Select **P26\_USERNAME** and **P26\_FULL\_NAME**, under Identification > Type: **Text Field**.

    ![close dialog](images/10-3-username-fullname.png " ")

11. Select **P26\_PASSWORD** and **P26\_IS\_ADMIN**, under Identification > Type: **Hidden**.

    ![close dialog](images/10-3-password-isadmin.png " ")

12. Select **P26\_PROFILE\_PIC** and enter/select the following:

    - Identification > Type: **Image Upload**

    - Storage > Mime Type Column: **MIME_TYPE**

    - Under Cropping:

        - Allow Cropping: **Toggle On**

        - Aspect Ratio: **1:1 (square)**

    ![close dialog](images/10-3-profile-pic.png " ")

13. Right-click **Content Body** and select **Create Region**.

    ![close dialog](images/10-3-create-region-user.png " ")

14. In the property editor, enter/select the following:

    - Identification > Name: **Buttons**

    - Appearance > Template: **Buttons Container**

    ![close dialog](images/10-3-create-region-buttons.png " ")

15. Right-click **Buttons** and select **Create Button**.

    ![close dialog](images/10-3-create-btn-region.png " ")

16. In the property editor, enter/select the following:

    - Under Identification:

        - Button Name: **CANCEL**

        - Label: **Cancel**

    - Layout > Slot: **Close**

    - Behavior > Action: **Defined by Dynamic Action**

    ![close dialog](images/10-3-cancel-btn.png " ")

17. Right-click **CANCEL** and select **Create Dynamic Action**.

    ![close dialog](images/10-3-dynamic-action1.png " ")

18. In the property editor, enter/select the following:

    - Identification > Name: **Cancel Dialog**

    ![close dialog](images/10-3-cancel-dialog.png " ")

19. Select **TRUE** Action, enter/select the following:

    - Identification > Action: **Cancel Dialog**

    ![close dialog](images/10-3-cancel-dialog-true.png " ")

20. Right-click **Buttons** and select **Create Button**.

    ![close dialog](images/10-3-create-btn2.png " ")

21. In the property editor, enter/select the following:

    - Under Identification:

        - Button Name: **SAVE**

        - Label: **Apply Changes**

    - Layout > Slot: **Next**

    - Appearance > Hot: **Toggle On**

    - Behavior > Database Action: **SQL UPDATE action**

    - Under Server-side Conditions:

        - Type: **Item is NOT NULL**

        - Item: **P26\_USER\_ID**

    ![close dialog](images/10-3-save-btn.png " ")

22. Right-click **SAVE** and select **Duplicate**

    ![close dialog](images/10-3-duplicate-btn.png " ")

23. In the property editor, enter/select the following:

    - Under Identification:

        - Button Name: **CREATE**

        - Label: **Create**

    - Behavior > Database Action: **SQL INSERT action**

    - Server-side Condition > Type: **Item is NULL**

    ![close dialog](images/10-3-create-btn-details.png " ")

24. Navigate to **Processing** tab and right-click **Processing** and select **Create Process**.

    ![close dialog](images/10-3-create-process1.png " ")

25. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **Update Current User**

        - Type: **Form - Automatic Row Processing(DML)**

        - Form Region: **Update Current User**

    - Success Message > Success Message: **Profile Details Updated Successfully!**

    ![close dialog](images/10-3-update-current-user-proceess.png " ")

26. Right-click **Processing** and select **Create Process**.

     ![close dialog](images/10-3-create-proceess.png " ")

27. In the property editor, enter/select the following:

    - Identification > Name: **Change Username** 

    - Source > PL/SQL Code: **:USERNAME := :P26_USERNAME;**

    ![close dialog](images/10-3-change-username-process.png " ")

28. Right-click **After Processing** and select **Create Branch**

    ![close dialog](images/10-3-create-branch26.png " ")

29. In the property editor, enter/select the following:

    - Identification > Name: **Go To My Profile**

    - Under Behavior > Target: Click **No Link Defined**

        - Page: **15010**

        - Clear Cache: **10**

        Click **OK**.

    ![close dialog](images/10-3-go-to-my-profile.png " ")

30. Click **Save**.

31. Navigate to page **15010**.

    ![close dialog](images/10-3-navigate-to-15010.png " ")

32. Right-click **My Details** and select **Create Button**.

    ![close dialog](images/10-3-create-btn15.png " ")

33. In the property editor, enter/select the following:

    - Under Identification:

        - Button Name: **EDIT_PROFILE**

        - Label: **Edit Profile**

    - Under Layout:

        - Start New Row: **Toggle Off**

        - New Column: **Toggle Off**

    - Under Appearance:

        - Button template: **Text with Icon**

        - Template Options: Click **Use Template Defaults**

            - Size: **Large**

            - Type: **Warning**

            - Style: **Remove UI Decoration**

            Click **OK**.

        - Icon: **fa-pencil-square-o**

    ![close dialog](images/10-3-edit-profile-btn.png " ")

    - Under Behavior:

        - Action: **Redirect to Page in this Application**

        - Target: **No Link Defined**

            - Target > Page: **26**

            - Set Items:

                | Name             | Value        |
                | ---------------- | ------------ |
                | P26\_USER\_ID | &USER_ID. |
                {: title="List of Items"}

            - Clear / Reset > Clear Cache: **26**

            Click **OK**.

        - Advanced > Custom Attributes: **style="background-color: transparent;"**

    <!-- ![close dialog](images/10-3-edit-profile-redirect.png " ") -->
    ![close dialog](images/10-3-edit-profile-redirect.1.png " ")

34. Click **Save**.

## Task 4: Create and Configure the Reset Password Page

This task provides a comprehensive step-by-step process for creating and configuring an application's "Reset Password" page. The page will be designed as a modal dialog featuring a form allowing users to reset their passwords securely.

1. On page designer toolbar, navigate to **(+)** and select **Page**.

    ![close dialog](images/10-4-create-page.png " ")

2. Click **Blank Page**.

    ![close dialog](images/user-blank-page.png " ")

3. Under **Page Definition**, enter/select the following:

    - Page Number: **27**

    - Name: **Reset Password**

    - Page Mode: **Modal Dialog**

    Click **Create Page**.

    ![close dialog](images/blank-page27.png " ")

4. Right-click **Content Body** and select **Create Region**.

    ![close dialog](images/10-4-create-region1.png " ")

5. In the property editor, enter/select the following:

     - Under Identification:

          - Name: **Reset Password**

          - Type: **Form**

     - Source > Table name: **OBS\_USERS**

     - Appearance > Template: **Blank with Attributes**

    ![close dialog](images/10-4-form-details.png " ")

6. Under **Reset Password** region, expand columns and select all columns except **P27\_USER\_ID** and **P27\_EMAIL**, right-click and select **Delete**

    ![close dialog](images/10-4-delete.png " ")

7. Select **P27_EMAIL** and under Identification > Type: **Display Only**.

    ![close dialog](images/10-4-email.png " ")

8. Select **P27\_USER\_ID** and under Source > Query Only: **Toggle Off**.

    ![close dialog](images/10-4-userid.png " ")

9. Right-click **Reset Password** and select **Create Page Item**.

    ![close dialog](images/10-4-page-item.png " ")

10. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **P27\_NEW\_PASSWORD**

        - Type: **Password**

    ![close dialog](images/10-4-new-pass.png " ")

11. Right-click **P27\_NEW\_PASSWORD** and select **Create  Validation**.

    ![close dialog](images/10-4-new-pass-val.png " ")

12. In the property editor, enter/select the following:

    - Identification > Name: **Password Not Null**

    - Under Validation:

        - Type: **Expression**

        - PL/SQL Function Body: Copy and paste the below expression:

            ```
            <copy>
            :P27_NEW_PASSWORD is not NULL
            </copy>
            ```

     - Error > Error Message: **Password must have some value**.

    ![close dialog](images/10-4-new-password-val1.png " ")

13. Right-click **Reset Password** and select **Create Page Item**.

    ![close dialog](images/10-4-reset-pass.png " ")

14. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **P27\_CONFIRM\_NEW\_PASSWORD**

        - Type: **Password**

    - Under Source

        - Form Region: **Reset Password**

        - Column: **PASSWORD**

    ![close dialog](images/10-4-confirm-pass.png " ")

15. Right-click **P27\_CONFIRM\_NEW\_PASSWORD** and select **Create Validation**.

    ![close dialog](images/10-4-confirm-pass-val1.png " ")

16. In the property editor, enter/select the following:

    - Identification > Name: **Compare Passwords**

    - Under Validation:

        - Type: **Expression**

        - PL/SQL Function Body: Copy and paste the below expression:
        ```
        <copy>
        :P27_NEW_PASSWORD = :P27_CONFIRM_NEW_PASSWORD
        </copy>
        ```

    - Error > Error Message: **Confirm Password and Password must be same.**

    ![close dialog](images/10-4-confirm-password-val.png " ")

17. Right-click **Content Body** and select **Create Region**.

    ![close dialog](images/10-4-create-region271.png " ")

18. In the property editor, enter/select the following:

    - Identification > Name: **Buttons**

    - Appearance > Template: **Buttons Container**

    ![close dialog](images/10-4-button-region.png " ")

19. Right-click **Buttons** and select **Create Button**.

    ![close dialog](images/10-4-create-btn27.png " ")

20. In the property editor, enter/select the following:

    - Identification > Button Name: **CANCEL**

    - Layout > Slot: **Close**

    - Under Behavior:

        - Action: **Redirect to Page in this Application**

        - Target: click **No Link Defined**

            - Target > Page: **15010**

            - Clear / Reset > Clear Cache: **27**

            Click **OK**.

    ![close dialog](images/10-4-btn-link.png " ")

21. Right-click **CANCEL** and select **Create Dynamic Action**.

    ![close dialog](images/10-4-dynamic-action.png " ")

22. In the property editor, enter/select the following:

    - Identification > Name: **Cancel Dialog**

    ![close dialog](images/10-4-dyn-name.png " ")

23. Select **TRUE** Action, enter/select the following:

    - Identification > Action: **Cancel Dialog**

    ![close dialog](images/10-4-true-action27.png " ")

24. Right-click **Buttons** and select **Create Button**.
    ![close dialog](images/10-4-create-button2.png " ")

25. In the property editor, enter/select the following:

    - Under Identification:

        - Button Name: **SAVE**

        - Label: **Apply Changes**

    - Layout > Slot: **Next**

    - Appearance > Hot: **Toggle On**

    - Behavior > Database Action: **SQL UPDATE Action**

    - Under Server-side Condition:

        - Type: **ITEM IS NOT NULL**

        - Item: **P27\_EMAIL**

    ![close dialog](images/10-4-save-btn27.png " ")

26. Navigate to **Processing** tab, right-click **Processing** and select **Create Process**.

    ![close dialog](images/10-4-create-process27.png " ")

27. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **Reset Password**

        - Type: **Form - Automatic Row Processing (DML)**

        - Form Region: **Reset Password**

    - Settings > Prevent Lost Updates: **Toggle Off**

    - Success Message > Success Message: **Password Reset Completed Successfully!**

    ![close dialog](images/10-4-change-password.png " ")

28. Right-click **After Processing** and select **Create Branch**.

    ![close dialog](images/10-4-create-branch27.png " ")

29. In the property editor, enter/select the following:

    - Identification > Name: **Go To My Profile**

    - Under Behavior > Target: Click **No Link Defined**

         - Target > Page: **15010**

         - Clear / Reset > Clear Cache: **10**

         Click **OK**

    ![close dialog](images/10-4-branch-link.png " ")

30. Click **Save**.

31. Navigate to page **15010**.

    ![close dialog](images/10-4-navigate-to-profile1.png " ")

32. Right-click **My Details** and select **Create Button**.

    ![close dialog](images/10-4-create-btn-pro.png " ")

33. In the property editor, enter/select the following:

    - Identification > Name: **CHANGE\_PASSWORD**

    - Layout > Sequence: **2**

    - Under Appearance:

        - Button template: **Text with Icon**

        - Template Options: Click **Use Template Defaults**

            - Size: **Large**

            - Type: **Warning**

            - Style: **Remove UI Decoration**

            Click **OK**.

        - Icon: **fa-pencil-square-o**

    ![close dialog](images/10-4-change-pass-pro.png " ")

    - Under Behavior:

        - Action: **Redirect to Page in this Application**

        - Target: **No Link Defined**

            - Target > Page: **27**

            - Set Items:

                | Name             | Value        |
                | ---------------- | ------------ |
                | P27\_USER\_ID | &USER\_ID. |
                {: title="List of Items"}

            - Clear / Reset > Clear Cache: **27**

            Click **OK**.

        - Advanced > Custom Attributes: **style="background-color: transparent;"**

    <!-- ![close dialog](images/10-4-change-pass-link.png " ") -->
    ![close dialog](images/10-4-change-pass-link.1.png " ")

34. Click **Save**.

## Task 5: Show Profile Pic using RESTful Services

In this task, you will learn how to configure RESTful services to handle user profile images and integrate them into your application. You will start by registering the schema with Oracle REST Data Services (ORDS) and creating the necessary modules, templates, and handlers. Next, you'll create an Application Item and a Computation to manage the profile image URLs. Finally, you will update the navigation bar and profile page to display the user's profile picture.

1. Navigate to **SQL Workshop** and select **RESTful Services**.

    ![close dialog](images/10-5-restful-services.png " ")

2. Click **Register Schema with ORDS**.

    ![close dialog](images/10-5-register-schema.png " ")

3. Click **Save Schema Attributes**.

    ![close dialog](images/10-5-save-schema.png " ")

4. From the left pane, select **Modules** and click **Create Module**.

    ![close dialog](images/10-5-create-module.png " ")

5. Under **Module Definition**, enter/select the following:

    - Module Name: **User Images**

    - Base Path: **images**

    Click **Create Module**.

    ![close dialog](images/10-5-create-module1.png " ")

6. Under **Resource Templates**, click **Create Template**.

    ![close dialog](images/10-5-create-template.png " ")

7. For **URI Template**, enter **profile_pic/:id** and click **Create Template**.

    ![close dialog](images/10-5-create-template1.png " ")

8. Under **Resource Handlers**, click **Create Handler** and enter/select the following:

    - Resource Handler > Source type: **Media Resource**

    - Source > Code: Copy and paste the following code:

        ```
        <copy>
        select mime_type, profile_pic from obs_users where user_id = :id
        </copy>
        ```
   Click **Create Handler**.

   ![close dialog](images/10-5-create-handler.png " ")

   ![close dialog](images/10-5-create-handler1.png " ")

9. Copy the **Full URL** and save it. We will use this information in Step 14.

    ![close dialog](images/10-5-copy-url.png " ")

10. As of now, you have created RESful services. Now, you will create an Application Item. To do so, navigate to shared Components. Click **App Builder > Online Bookstore > Shared Components**.

    ![close dialog](images/10-5-app-builder-rest.png " ")

    ![close dialog](images/10-5-obs-app1.png " ")

    ![close dialog](images/10-5-sc-rest.png " ")

11. Under Application Logic, click **Application Items** and click **Create**.

     ![close dialog](images/10-5-app-items-rest.png " ")

     ![close dialog](images/10-5-app-item-create-rest.png " " )

12. For Name: enter **PICTURE\_URL** and click **Create Application Item**.

    ![close dialog](images/10-5-create-app-item-rest.png " " )

13. Now, you will create an Application Computation. To create an
Application Computation, navigate back to the shared component and under **Application Logic**, click **Application Computations**.

    ![close dialog](images/10-5-sc-rest1.png " " )

    ![close dialog](images/10-5-app-comp-rest.png " " )

14. Click **Create** and enter/select the following:

    - Item > Computation Item: **PICTURE\_URL**

    - Frequency > Computation Point: **Before Header**

    - Under Computation:

        - Computation Type: **SQL Query (return single value):**

        - Computation: Copy and paste the below code:

            ```
            <copy>
            select case when picture_url is not null and profile_pic is null then picture_url
            else 'https://apex.oracle.com/pls/apex/<workspace name>/images/profile_pic/' || user_id
            end case
            from obs_users where user_id = :user_id;
            </copy>
            ```

    *Note: For the else statement in the above code, paste the URL you copied in the above task till **..profile_pic/***

    Click **Create Computation**.

    ![close dialog](images/10-5-create-app-comp-rest.png " " )

    ![close dialog](images/10-5-create-comp-rest.png " " )

15. Now, you will update the navigation bar list to add badge value. Navigate to **Shared Components** and click **Navigation Bar List**.

    ![close dialog](images/10-5-sc-rest2.png " " )

    ![close dialog](images/10-5-nav-bar-list-rest.png " " )

16. Click **Navigation Bar**, then click **&USERNAME.** to edit and update the following:

    - User Defined Attributes > Badge value:

        ```
        <copy>
        <img src="&PICTURE_URL." alt="" style="max-width: 25px; max-height: 25px; height: auto; display: block; margin: 0px; padding: 0px; border-radius:50%">
        </copy>
        ```

    Click **Apply Changes**.
    ![close dialog](images/10-5-nav-bar-rest.png " " )
    ![close dialog](images/10-5-edit-username-rest.png " " )

    ![close dialog](images/10-5-badge-value.png " " )

17. Next, you will update my profile page to display my profile picture on the page. Navigate to page **15010**.

    ![close dialog](images/10-5-edit-page-15010.png " " )

18. Select **My Details** region, right-click **Region Body** and select **Create Region**.

    ![close dialog](images/10-5-create-region-15010.png " " )

19. Enter/select the following:

    - Identification > Name: **Profile Photo**

    - Appearance > Template: **Blank with Attributes**

    ![close dialog](images/10-5-profile-photo.png " " )

20. Right-click **Profile Photo** region and select **Create Page Item**.

    ![close dialog](images/10-5-page-item-pro.png " " )

21. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **PROFILE_DISPLAY**

        - Type: **Display Image**

    - Label > Label: Keep it empty

    - Settings > Based on: **Image URL stored in Page Item Value**

    - Appearance > Template: **Optional-Above**

    - Advanced > Custom Attributes : **style="width: 40vh; height: 50vh; display: block; margin: 0 auto;"**

    - Under Source:

        - Type: **Item**

        - Item: **PICTURE\_URL**

    ![close dialog](images/10-5-display-img.png " " )

    ![close dialog](images/10-5-display-img-source.png " " )

22. Select **My Books** region and enter/select the following:

    - Under Layout:

        - Sequence: **40**

        - Slot: **Region Body**

    ![close dialog](images/10-5-my-books-update.png " " )

23. Click **Save**.

## Task 6: Run the Application

In this task, you will access the My Profile page to view purchased books, update your password, and edit your profile details, including changing your profile picture.

1. Run the application and enter the credentials below:

      - Username: **user01**

      - Password: **secretPassword**

    ![close dialog](images/10-6-1-run-app.png " ")

2. Navigate to the **My Profile** page under your username.

    ![close dialog](images/10-6-2-my-profile.png " ")

3. View all your purchased books along with their quantities under the **My Books** section.

    ![close dialog](images/10-6-3-my-books.png " ")

4. To update your password, click **Change Password**, enter your **New Password** and **Confirm New Password** and click **Apply Changes**.

    ![close dialog](images/10-6-4-update-password.png " ")

5. To update your profile details, click **Edit Profile**, make your changes and click **Apply Changes**.

    For example, to update your profile picture, upload a new picture, adjust the size, click **Apply** and click **Apply Changes**.

    ![close dialog](images/10-6-5.1-add-profile-picture.png " ")

    ![close dialog](images/10-6-5.2-view-updated-profile-picture.png " ")

>*NOTE: You will receive this profile picture by default after completing Task 5 of Lab 16.*

## Summary

In this lab, you have learned to create a robust user profile page in Oracle APEX. You navigated through various tasks, including page creation, SQL query integration, form handling, and RESTful services setup. You also customized the application's Navigation and enhanced the user experience by adding interactive elements. Following these steps, you have developed a comprehensive understanding of managing user profiles in Oracle APEX, a crucial aspect of building modern web applications.

You are now ready to move on to the next lab!

## Acknowledgements

- **Author**: Pankaj Goyal, Member Technical Staff; Ankita Beri, Product Manager
- **Last Updated By/Date**: Pankaj Goyal, Member Technical Staff, March 2025
