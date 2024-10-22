# Create and Manage User Profile Pages

## Introduction

This lab focuses on guiding you through creating and managing user profile pages. The tasks will cover various aspects of page creation, customization, and linking, as well as using SQL queries, RESTful services, and form handling. By the end of this lab, you will have developed a fully functional user profile page that includes personal details, book lists, and functionalities for updating profiles and resetting passwords.

Estimated Time: 20 minutes

### Objectives

- Create a User Profile Page
- Add Navigation bar Entries to include links to the user profile and other pages.
- Create and manage forms to update user details and reset passwords.
- Implement RESTful Services to handle user profile pictures and integrate these services into the application.

## Task 1: Creating a Profile Page with a Book List

This task provides step-by-step instructions for creating a profile page displaying a book list. The profile page will be built from scratch, starting with a blank page and adding a series of regions and sub-regions to effectively organize and display the data. By following these steps, you will learn how to configure page properties, create regions for content display, and integrate an SQL query to populate the book list dynamically. This process will culminate in a user-friendly interface where users can view their book details and purchase links directly from their profile page.

1. Navigate to the application homepage by clicking the **Application ID**.

    ![close dialog](images/app-id8.png " ")

2. Click **Create Page**. 

    ![close dialog](images/profile-create-page.png " ")

3. Select **Blank Page**.

    ![close dialog](images/profile-blabk-page.png " ")

4. Enter/select the following:

    - Under Identification:

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

    - Under Identification > Name: **My Details**

    - Under Appearance:

        - Template: **Content Block**

        - Template Options: Click **Use Template Defaults, Large**

            - Add Body Padding: **Check**

            - Body Style: **Light Background**

            Click **OK**.

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
            bi.buy_links as buy_links,
            bi.title as title,
            oi.price as price,
            bi.description as description,
            COUNT(*) OVER (PARTITION BY oi.book_id) AS quantity
        from obs_order_items oi, obs_books bi, obs_orders o
        where o.order_id = oi.order_id and o.user_id = :USER_ID
            and oi.book_id(+) = bi.book_id;
        </copy>
        ```

    - Under Layout > Start New Row: **Toggle Off**

    ![close dialog](images/profile-my-books.png " ")

    - Under Appearance:

        - Template: **Content Block**  

        - Template Options: Click **Use Template Defaults**

            - Heading font: **Alternative**

            Click **OK**.

    ![close dialog](images/profile-template.png " ")

10. Navigate to **Attributes**, enter/select the following:

    - Under Settings:

        - Title: **TITLE**

        - Display Avatar: **Toggle On**

        - Display Badge: **Toggle On**

        - Layout: **2 Column grid**

        - Size: **Large**

    - Under Avatar:

        - Type: **Image**

        - Image:

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

    - Conditions > Condition Type: **User is Authenticated(not public)**

    Click **Apply Changes**.

    ![close dialog](images/10-2-update-username.png " ")

    ![close dialog](images/10-2-condition-type.png " ")

5. Click **Create Entry**.

    ![close dialog](images/10-2-nav-create-entry1.png " ")

6. Enter/select the following:

    - Under Entry:

        - Sequence: **12**

        - Image/Class: **fa-user**

        - List Entry Label: **Login**

    - Target > Page: **9999**

    - Conditions > Condition Type: **User is the Public user (user has not authenticated)**

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

    - Authorization > Authorization Scheme: **Must Not be Public User**

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

1. On page designer toolbar, navigate to **(+ v)** and click **Page**.

    ![close dialog](images/user-create-page.png " ")

2. Click **Blank Page**.

    ![close dialog](images/user-blank-page.png " ")

3. Under Page Definition, enter/select the following:

    - Page Number: **26**

    - Name: **Update Current User**

    - Page Mode: **Modal Dialog**

     Click **Create Page**.

    ![close dialog](images/update-current-user.png " ")

4. In the property editor, under **Navigation** > Warn on Unsaved Changes: **Toggle Off**

    ![close dialog](images/warn-on-change.png " ")

5. Right-click **Content Body** and select **Create Region**.

    ![close dialog](images/user-create-region.png " ")

6. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **Update Current User**

        - Type: **Form**

    - Under Source > Table name: **OBS\_USERS**

    - Under Appearance > Template: **Blank with Attributes**

   ![close dialog](images/current-user-form.png " ")

7. Under **Update Current User**, expand **Columns**. Right-click **P26\_MIME\_TYPE** and **P26\_PICTURE\_URL** and select **Delete**.

    ![close dialog](images/delete-mime.png " ")

8. Select **P26\_USER\_ID**, Under Source > Query Only: **Toggle Off**.

    ![close dialog](images/user-id-query-only.png " ")

9. Select **P26\_EMAIL**, under Identification > Type: **Display Only** 

10. Select **P26\_USERNAME** and **P26\_FULL\_NAME**, under Identification > Type: **Text Field**.

    ![close dialog](images/username-textfield.png " ")

11. Select **P26\_PASSWORD** and **P26\_IS\_ADMIN**, under Identification > Type: **Hidden**.

12. Select **P26\_PROFILE\_PIC** and enter/select the following:

    - Under Identification > Type: **Image Upload**

    - Under Storage > Mime Type Column: **MIME_TYPE**

    - Under Cropping:

        - Allow Cropping: **Toggle On**

        - Aspect Ratio: **1:1**

    ![close dialog](images/profile-pic.png " ")

13. Right-click **Content Body** and select **Create Region**.

    ![close dialog](images/create-region-user.png " ")

14. In the property editor, enter/select the following:

    - Under Identification > Name: **Buttons**

    - Under Appearance > Template: **Buttons Container**

    ![close dialog](images/create-region-buttons.png " ")

15. Right-click **Buttons** and select **Create Button**.

    ![close dialog](images/create-btn-region.png " ")

16. In the property editor, enter/select the following:

    - Under Identification > Button Name: **CANCEL**

    - Under Layout > Slot: **Close**

    - Under Behavior > Action: **Defined by Dynamic Action**

    ![close dialog](images/cancel-btn.png " ")

17. Right-click **CANCEL** and select **Create Dynamic Action**.

    ![close dialog](images/dynamic-action1.png " ")

18. In the property editor, enter/select the following:

    - Under Identification > Name: **Cancel Dialog**

    ![close dialog](images/cancel-dialog.png " ")

19. Select **TRUE** Action, enter/select the following:

    - Under Identification > Action: **Cancel Dialog**

    ![close dialog](images/cancel-dialog-true.png " ")

20. Right-click **Buttons** and select **Create Button**.

    ![close dialog](images/create-btn2.png " ")

21. In the property editor, enter/select the following:

    - Under Identification:

        - Button Name: **SAVE**

        - Label: **Apply Changes**

    - Under Layout > Position: **Next**

    - Under Appearance > Hot: **Toggle On**

    - Under Behavior > Database Action: **SQL UPDATE action**

    - Under Server-side Conditions:

        - Type: **ITEM IS NOT NULL**

        - Item: **P26\_USER\_ID**

    ![close dialog](images/save-btn.png " ")

    ![close dialog](images/save-btn-server.png " ")

22. Right-click **SAVE** and select **Create Duplicate**

    ![close dialog](images/duplicate-btn.png " ")

23. In the property editor, enter/select the following:

    - Under Identification:

        - Button Name: **CREATE**

        - Label: **Create**

    - Under Behavior > Database Action: **SQL INSERT action**

    - Under Server-side Condition > Type: **ITEM IS NULL**

24. Navigate to **Processing** tab and right-click **Processing** and select **Create Process**.

    ![close dialog](images/create-process26.png " ")

25. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **Update Current User**

        - Type: **Form - Automatic Row Processing(DML)**

        - Form Region: **Update Current User**

    - Under Success Message > Success Message: **Profile Details Updated Successfully!**

    ![close dialog](images/update-current-user-proceess.png " ")

26. Right-click **Processing** and select **Create Process**.

27. In the property editor, enter/select the following:

    - Under Identification > Name: **Change Username** 

    - Under Source > PL/SQL Code: **:USERNAME := :P26_USERNAME;**

    ![close dialog](images/change-username-process.png " ")

28. Right-click **After Processing** and select **Create Branch**

    ![close dialog](images/create-branch26.png " ")

29. In the property editor, enter/select the following:

    - Under Identification > Name: **Go To My Profile**

    - Under Behavior > Target: Click **No Link Defined**

        - Page: **15010**

        - Clear Cache: **10**

        Click **OK**.

    ![close dialog](images/go-to-my-profile.png " ")

30. Click **Save**.

31. Navigate to page **15010**.

    ![close dialog](images/navigate-to-15010.png " ")

32. Right-click **My details** and select **Create Button**.

    ![close dialog](images/create-btn15.png " ")

33. In the property editor, enter/select the following:

    - Under Identification > Button Name: **EDIT_PROFILE**

    - Under Layout:

        - Start New Row: **Toggle off**

        - New Column: **Toggle off**

    - Under Appearance:

        - Button template: **Text with Icon**

        - Template Options: Click **Use Template Options**

            - Size: **large**

            - Type: **Warning**

            - Style: **Remove UI Decoration**

            Click **OK**.

        - Icon: **fa-pencil-square-o**

    - Under Behavior:

        - Action: **Redirect to a page in this Application**

        - Target: **No Link Defined**

            - Under Target > Page: **26**

            - Under Set Items:

                - Name:  **P26\_USER\_ID**

                - Value: **&USER_ID.**

            - Under Clear / Reset > Clear Cache: **26**

            Click **OK**.

    ![close dialog](images/edit-profile-btn.png " ")

    ![close dialog](images/edit-profile-redirect.png " ")

34. Click **Save**.

## Task 4: Create and Configure the Reset Password Page

This task provides a comprehensive step-by-step process for creating and configuring an application's "Reset Password" page. The page will be designed as a modal dialog featuring a form allowing users to reset their passwords securely.

1. On page designer toolbar, Navigate to **(+ v)** and select **Page**.

    ![close dialog](images/create-page27.png " ")

2. Click **Blank Page**.

    ![close dialog](images/user-blank-page.png " ")

3. Under **Page Definition**, enter/select the following:

    - Page Number: **27**

    - Name: **Reset Password**

    - Page Mode: **Modal Dialog**

     Click **Create Page**.

    ![close dialog](images/blank-page27.png " ")

4. Right-click **Content Body** and select **Create Region**.

    ![close dialog](images/create-region27.png " ")

5. In the property editor, enter/select the following:

     - Under Identification:

          - Name: **Reset Password**

          - Type: **Form**

     - Under Source > Table name: **OBS\_USERS**

     - Under Appearance > Template: **Blank with Attributes**

    ![close dialog](images/form27.png " ")

6. Under **Reset Password** region, expand columns and
delete all items except **P27\_USER\_ID** and **P27\_EMAIL**

    ![close dialog](images/delete-27.png " ")

7. Select **P27_EMAIL** and under Identification > Type: **Display Only**.

    ![close dialog](images/email27.png " ")

8. Select **P27\_USER\_ID** and under Source > Query Only: **Toggle Off**.

    ![close dialog](images/userid27.png " ")

9. Right-click **Reset Password** and select **Create Page Item**.

    ![close dialog](images/page-item27.png " ")

10. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **P27\_NEW\_PASSWORD**

        - Type: **Password**

    ![close dialog](images/new-pass.png " ")

11. Right-click **P27\_NEW\_PASSWORD** and select **Create  Validation**.

    ![close dialog](images/new-pass-val.png " ")

12. In the property editor, enter/select the following:

    - Under Identification > Name: **Password Not Null**

    - Under Validation:

        - Type: **Function Body (returning Boolean)**

        - PL/SQL Function Body: Copy and paste the below code:

        ```
        <copy>
        if :P27_NEW_PASSWORD is not NULL then
            return true;
        else
            return false;
        end if;
        </copy>
        ```

     - Under Error > Error Message: **Password must have some value**.

    ![close dialog](images/new-pass-val1.png " ")

13. Right-click **Reset Password** and select **Create Page Item**.

14. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **P27\_CONFIRM\_NEW\_PASSWORD**

        - Type: **Password**

    - Under Source

        - Form Region: **Reset Password**

        - Column: **PASSWORD**

    ![close dialog](images/confirm-pass.png " ")

15. Right-click **P27\_CONFIRM\_NEW\_PASSWORD** and select **Create Validation**.

16. In the property editor, enter/select the following:

    - Identification > Name: **Compare Passwords**

    - Under Validation:

        - Type: **Function Body (returning Boolean)**

        - PL/SQL Function Body: Copy and paste the below code:
        ```
        <copy>
        begin
            if :P27_NEW_PASSWORD = :P27_CONFIRM_NEW_PASSWORD then
                return true;
            else
                return false;
            end if;
        end;
        </copy>
        ```

    - Under Error > Error Message: **Confirm Password and Password must be same.**

    ![close dialog](images/confirm-pass-val.png " ")

17. Right-click **Region Body** and select **Create Region**.

    ![close dialog](images/create-region271.png " ")

18. In the property editor, enter/select the following:

    - Under Identification > Name: **Buttons**

    - Under Appearance > Template: **Buttons Container**

    ![close dialog](images/button-region.png " ")

19. Right-click **Buttons** and select **Create Button**.

    ![close dialog](images/create-btn27.png " ")

20. In the property editor, enter/select the following:

    - Under Identification > Button Name: **CANCEL**

    - Under Layout > Slot: **Close**

    - Under Behavior:

        - Action: **Redirect to Page in this Application**

        - Target: click **No Link Defined**

            - Under Target > Page: **15010**

            - Under Clear / Reset > Clear Cache: **27**

            Click **OK**.

    ![close dialog](images/btn-link.png " ")

21. Right-click **CANCEL** and select **Create Dynamic Action**.

    ![close dialog](images/dynamic-action.png " ")

22. In the property editor, enter/select the following:

    - Under Identification > Name: **Cancel Dialog**

    ![close dialog](images/dyn-name.png " ")

23. Select **TRUE** Action, enter/select the following:

    - Under Identification > Action: **Cancel Dialog**

    ![close dialog](images/true-action27.png " ")

24. Right-click **Buttons** and select **Create Button**.

25. In the property editor, enter/select the following:

    - Under Identification:

        - Button Name: **SAVE**

        - Label: **Apply Changes**

    - Under Layout > Slot: **Next**

    - Under Appearance > Hot: **Toggle On**

    - Under Behavior > Database Action: **SQL UPDATE Action**

    - Under Server-side Condition:

        - Type: **ITEM IS NOT NULL**

        - Item: **P27\_EMAIL**

    ![close dialog](images/save-btn27.png " ")

    ![close dialog](images/save-btn271.png " ")

26. Navigate to **Processing** tab, right-click **Processing** and select **Create Process**.

    ![close dialog](images/create-process27.png " ")

27. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **Reset Password**

        - Type: **Form - Automatic Row Processing (DML)**

        - Form Region: **Reset Password**

    - Under Settings > Prevent Lost Updates: **Toggle Off**

    - Under Success Message > Success Message: **Reset Password Successfully!**

    ![close dialog](images/change-pass.png " ")

28. Right-click **After Processing** and select **Create Branch**.

    ![close dialog](images/create-branch27.png " ")

29. In the property editor, enter/select the following:

    - Under Identification > Name: **Go To My Profile**

    - Under Behavior > Target: Click **No Link Defined**

         - Under Target > Page: **15010**

         - Under Clear / Reset > Clear Cache: **10**

         Click **OK**

    ![close dialog](images/branch-link.png " ")

30. Click **Save**.

31. Navigate to page **15010**.

    ![close dialog](images/navigate-to-profile.png " ")

32. Right-click **My details** and select **Create Button**.

    ![close dialog](images/create-btn-pro.png " ")

33. In the property editor, enter/select the following:

    - Under Identification > Name: **CHANGE\_PASSWORD**

    - Under Layout > Sequence: **2**

    - Under Appearance:

        - Button template: **Text with Icon**

        - Template Options: Click **Use Template Defaults**

            - Size: **large**

            - Type: **Warning**

            - Style: **Remove UI Decoration**

            Click **OK**.

        - Icon: **fa-pencil-square-o**

    - Under Behavior:

        - Action: **Redirect to Page in this Application**

        - Target: **No Link Defined**

            - Under Target > Page: **27**

            - Under Set Items:

                - Name: **P27\_USER\_ID**

                - Value: **&USER\_ID.**

            - Under Clear / Reset > Clear Cache: **27**

            Click **OK**.

    ![close dialog](images/change-pass-pro.png " ")

    ![close dialog](images/change-pass-link.png " ")

34. Click **Save**.

    ![close dialog](images/review-change-pass.png " ")

## Task 5: Show Profile Pic using RESTful Services

In this task, you will learn how to configure RESTful services to handle user profile images and integrate them into your application. You will start by registering the schema with Oracle REST Data Services (ORDS) and creating the necessary modules, templates, and handlers. Next, you'll create an application item and Computation to manage the profile image URLs. Finally, you will update the navigation bar and profile page to display the user's profile picture.

1. Navigate to **SQL Workshop** and select **RESTful Services**.

    ![close dialog](images/restful-services.png " ")

2. Click Register Schema with ORDS.

    ![close dialog](images/register-schema.png " ")

3. Click **Save Schema Attributes**.

    ![close dialog](images/save-schema.png " ")

4. From the left pane, select **Modules** and select **Create Module**.

    ![close dialog](images/create-module.png " ")

5. Under **Module Definition**, enter/select the following:

    Module Name: **User Images**

    Base Path: **images**

    Click **Create Module**.

    ![close dialog](images/create-module1.png " ")

6. Under **Resource Templates**, select **Create Template**.

    ![close dialog](images/create-template.png " ")

7. For **Uri template**, enter **profile_pic/:id** and select **Create Template**.

    ![close dialog](images/create-template1.png " ")

8. Under **Resource Handlers**, click **Create Handler** and enter/select the following:

    - Under Resource Handler > Source type: **media resource**

    - Under Source > Code: Copy and paste the following code:

    ```
    <copy>
    select mime_type, profile_pic from obs_users where user_id = :id
    </copy>
    ```
   Click **Create Handler**.

   ![close dialog](images/create-handler.png " ")

   ![close dialog](images/create-handler1.png " ")

9. Copy the **Full URL** and replace the id with user\_id to use in the next lab.

10. As of now, you have created RESful services. Now, you will create an Application Item. To do so, navigate to shared Components. Click **App Builder > Online Bookstore > Shared Components**.

    ![close dialog](images/app-builder-rest.png " ")

    ![close dialog](images/obs-app1.png " ")

    ![close dialog](images/sc-rest.png " ")

11. Under Application Logic, select **Application Items** and click **Create**.

     ![close dialog](images/app-items-rest.png " ")

     ![close dialog](images/app-item-create-rest.png " " )

12. For Name: enter **PICTURE\_URL** and click **Create Application Item**.

    ![close dialog](images/create-app-item-rest.png " " )

13. Now, you will create an Application Computation. To create an
Application Computation, navigate back to the shared component and Under **Application Logic**, click **Application Computations**.

    ![close dialog](images/sc-rest1.png " " )

    ![close dialog](images/app-comp-rest.png " " )

14. Click **Create** and enter/select the following:

    - Under Item > Computation Item: **PICTURE\_URL**

    - Under Frequency > Computation Point: **Before Header**

    - Under Computation:

        - Computation Type: **SQL Query (return single value):**

        - Code: Copy and paste the below code:

        ```
        <copy>
        select case when picture_url is not null and profile_pic is null then picture_url
             else 'https://apex.oracle.com/pls/apex/<workspace name>/images/profile_pic/' || user_id
              end case
            from obs_users where user_id = :user_id;
        </copy>
        ```

    *Note: For the else statement in the above code, paste the URL you copied in the above task*

    Click **Create Computation**.

    ![close dialog](images/create-app-comp-rest.png " " )

    ![close dialog](images/create-comp-rest.png " " )

15. Now, you will update the navigation bar list to add badge value. Navigate to shared components and select **Navigation Bar List**.

    ![close dialog](images/sc-rest2.png " " )

    ![close dialog](images/nav-bar-list-rest.png " " )

16. Click **Navigation Bar** and click edit icon of **&USERNAME.** and update the following:

    - Under User Defined Attributes > Badge value:

    ```
    <copy>
    <img src="&PICTURE_URL." alt="" style="max-width: 25px; max-height: 25px; height: auto; display: block; margin: 0px; padding: 0px; border-radius:50%">
    </copy>
    ```

    Click **Apply Changes**.

    ![close dialog](images/edit-username-rest.png " " )

    ![close dialog](images/badge-value.png " " )

17. Next, you will update my profile page to display my profile picture on the page. Navigate to page **15010**.

    ![close dialog](images/edit-page-15010.png " " )

18. Select **My Details** region, right-click **Region Body** and select **Create Region**.

    ![close dialog](images/create-region-15010.png " " )

19. Enter/select the following:

    - Under Identification > Title: **Profile Photo**

    - Under Appearance > Template: **Blank with Attributes**

    ![close dialog](images/profile-photo.png " " )

20. Right-click **Profile Photo** region and select **Create Page Item**.

    ![close dialog](images/page-item-pro.png " " )

21. In the property editor, enter/select the following:

    - Under Identification > Type: **Display Image**

    - Under Label > Label: Keep it empty

    - Under Settings > Based on: **Image URL stored in Page Item Value**

    - Under Appearance > Template: **Optional-Above**

    - Under Advanced > Custom Attributes : **style="width: 40vh; height: 50vh; display: block; margin: 0 auto;"**

    - Under Source:

        - Type: **Item**

        - Item: **PICTURE\_URL** (under Application).

    ![close dialog](images/display-img.png " " )

    ![close dialog](images/display-img-source.png " " )

22. Select **My Books** region in the property editor, and enter/select the following:

    - Under Layout:

        - Sequence: **21**

        - Slot: **Region Body**

    ![close dialog](images/my-books-update.png " " )

23. Click **Save**.

## Summary

In this lab, you have learned to create a robust user profile page in Oracle APEX. You navigated through various tasks, including page creation, SQL query integration, form handling, and RESTful services setup. You also customized the application's Navigation and enhanced the user experience by adding interactive elements. Following these steps, you have developed a comprehensive understanding of managing user profiles in Oracle APEX, a crucial aspect of building modern web applications.

You are now ready to move on to the next lab!

## Acknowledgements

- **Author**: Pankaj Goyal, Member Technical Staff; Ankita Beri, Product Manager
- **Last Updated By/Date**: Pankaj Goyal, Member Technical Staff, Aug 2024
