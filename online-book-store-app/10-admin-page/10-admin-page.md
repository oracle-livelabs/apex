# Create and Manage Administration

## Introduction
In this lab, you will create an administration page with specific settings, including a list to manage books and user roles. Next, you will add an entry to the navigation bar, linking to the administration page for quick access. Following this, you will modify authorization schemes to ensure that only authorized users can access the administration page. You will then set up a page for managing book information, including search functionality and detailed views. Additionally, you will create a form for editing book details, allowing for comprehensive updates. The lab also involves developing an interactive report for user roles and a form for updating user information. Lastly, you will enhance the user role update form to hide unnecessary fields and streamline the update process. These tasks collectively enable efficient application data administration and management, improving functionality and security.

Estimated Time: 20 minutes

### Objectives
- Create an Administration Page to manage various administrative tasks.
- Add Navigation Entries to integrate the administration page into the application's navigation bar for easy access.
- Configure Authorization Schemes to implement and apply security measures to control access to the administration page.
- Manage book information for searching, viewing, and updating.
- Develop a form for detailed editing of book records.
- Manage user roles by viewing and updating them using interactive reports and forms.

## Task 1: Create an Administration Page
This task guides you through creating an administration page for managing books and user roles. You will start by navigating to the Application Home Page to create a blank page named "Administration." Next, you will set up a new list in Shared Components, adding entries for managing books and user roles and customizing their icons. Finally, using the Media List template, you'll configure the Administration page to display this list.

1. Navigate to the Application Home Page.

2. Click **Create Page**.

    ![close dialog](images/create-page-admin.png " ")

3. Click **Blank Page**.

    ![close dialog](images/blank-page-admin.png " ")

4. Enter/select the following:

    - Under Identification:

        - Page Number: **15000**

        - Name: **Administration**

    - Under Navigation:

        - Use Breadcrumb: **Toggle Off**

        - Use Navigation: **Toggle Off**

    Click **Create Page**.

   ![close dialog](images/admin-page.png " ")

5. Navigate to **Shared Components**.

   ![close dialog](images/sc-admin.png " ")

6. Under **Navigation and Search**,select **Lists** and
Click **Create**.

    ![close dialog](images/lists-admin.png " ")

    ![close dialog](images/create-list-admin.png " ")

7. For Name: Enter **Administration** and click **Next**.

    ![close dialog](images/create-list-name.png " ")

8. For Query or Static Values, enter/select the following:

    | List Entry Label | Target Page ID or custom URL |
    | ---------- |  ------ |
    | Manage Books Information | 40 |  
    | User Role| 30 |

    Click **Next**.

    ![close dialog](images/create-list-itmes.png " ")

9. Click Create List.

    ![close dialog](images/create-list.png " ")

10. Click **Administration**.

    ![close dialog](images/click-admin-list.png " ")

11. Click **Edit** Icon for **Manage Books Information** and
update Image/Class: **fa-database-file**. Click **Apply Changes**.

    ![close dialog](images/edit-manage-book.png " ")

    ![close dialog](images/enter-icon.png " ")

12. Click **Edit** Icon for **Users Role** and
update Image/Class: **fa-table**. Click **Apply Changes**.

    ![close dialog](images/edit-user.png " ")

    ![close dialog](images/enter-user-icon.png " ")

13. Navigate to Page Number: 15000.

    ![close dialog](images/edit-page-15000.png " ")

14. Right-click **Body** and click **Create Region**.

    ![close dialog](images/create-region-15000.png " ")

15. In the Property editor, enter/select the following:

    - Under Identification:

        - Title: **Administration**

        - Type: **List**

    - Source > List: **Administration**

    ![close dialog](images/add-list.png " ")

16. Navigate to **Attributes** and enter/select the following:

    - Under Appearance:

        - List Template: **Media List**

        - Template Options > Click Use Template Defaults : Check **Apply Theme Colors**

        Click **OK**.

    ![close dialog](images/list-att.png " ")

17. Click **Save**.


## Task 2: Add Navigation Entries
In this task, you will add a navigation bar entry for the administration page. Additionally, apply an authorization scheme to restrict access to users with administration rights.

1. Navigate to Shared Components.

    ![close dialog](images/sc-admin-2.png " ")

2. Under **Navigation and Search**, click **Navigation Bar List**

    ![close dialog](images/nav-bar-admin.png " ")

    ![close dialog](images/nav-bar-admin1.png " ")

3. Click **Navigation Bar** and Click **Create Entry**.

    ![close dialog](images/create-entry-admin.png " ")

4. Enter/select the following:

    - Under Entry:

        - Sequence: **1**

        - Image/Class: **fa-user-wrench**

        - List Entry Label: **Administration**

    - Under Target:

        - Page:15000

        - Clear Cache: 15000.

    - Authorization > Authorization Scheme: Administration Rights

    Click **Create List Entry**.

  ![close dialog](images/create-entry-admin1.png " ")

  ![close dialog](images/authorization-admin.png " ")

## Task 3: Configure Authorization Scheme
In this task, you will update the authorization scheme to ensure that only users with administration rights can access the administration page.

1. Navigate to **Shared Components**.

    ![close dialog](images/sc-admin3.png " ")

2. Under **Security**,Click **Authorization Schemes**.

    ![close dialog](images/autho-schemes.png " ")

3. Click **Administration Rights**.

    ![close dialog](images/click-admin-rights.png " ")

4. Under the Authorization Scheme, update the following:

    - Schema Type: **Exists SQL Query**

    - SQL Query: Copy and Paste the below code:
    ```
    <copy>
    select 1 from   obs_users where user_id = :user_id and    is_admin = 'Y'
    </copy>
     ```
    Click **Apply Changes**.

  ![close dialog](images/admin-rights.png " ")

5. Navigate to **Page 15000: Administration**.

6. In the Property editor, enter/select the following:

    - Under Security:

        - Authorization scheme: **Administration Rights**

        - Deep Linking: **Toggle Off**

  ![close dialog](images/autho-scheme.png " ")    

7. Click **Save**.

## Task 4: Manage Books Information
In this task, you'll create a page to manage book information. Start by navigating to the Application Home Page and creating a new blank page with the identification details set. Then, customize the page layout and Appearance. Next, create regions for updating book information and searching for books. Configure dynamic actions to handle search functionality and refresh actions. Set up buttons for editing, resetting, and creating book entries.

1. Navigate to the Application Home Page.

    ![close dialog](images/app-id-admin.png " ")  

2. Click **Create Page**. 

    ![close dialog](images/create-page-info.png " ")  

3. Click **Blank Page**.

    ![close dialog](images/blank-page-admin.png " ")  

4. Enter/select the following:

    - Under Identification:

        - Page Number: **40**

        - Name: **Manage Books Information**

    - Under Navigation:

        - Use Breadcrumb: **Toggle Off**

        - Use Navigation: **Toggle Off**

    Click **Create Page**.

  ![close dialog](images/create-page-details.png " ")  

5. Navigate to **PAGE 40: Books Information**, in the property editor and enter/select the following:

    - Appearance > Page template: **Left side column**

    -  Navigation > Warn on unsaved changes: **Toggle Off**

  ![close dialog](images/left-side-colum.png " ")  

6. Right-click **Body** and click **Create Region**.

    ![close dialog](images/create-region-info.png " ")

7. In the Property editor, enter/select the following:

    - Under Identification:

        - Title: **Update Book Information**

        - Type: **Static content**

    - Layout > Position: **Breadcrumb Bar**

    - Under Appearance:

        - Template: **Hero**

        - Template Options > Click **Use Template Defaults**:  **Display Icon**: Select **No**

    Click **OK**.

  ![close dialog](images/update-book-info.png " ")

8. Right-click **Body** and click **Create Region**.

    ![close dialog](images/create-region-info1.png " ")

9. In the property editor, enter/select the following:

    - Identification > Title: **Search**

    - Layout > Sequence: **5**

    - Under Appearance:

        - Template: **Blank with Attributes**

        - CSS Classes: **search-region padding-md**

        - Template Options: Click **Use Template Options**

            - Item Width: **Stretch Form Fields**

            Click **OK**.

  ![close dialog](images/search-region-real.png " ")

10. Right-click **Search** and click **Create Page Item**.

    ![close dialog](images/create-page-item-search.png " ")

11. In the property editor, enter/select the following:

    - Identification > Title: **P40\_SEARCH**

    - Under Appearance:

        - Template: **Hidden**

        - Value Placeholder: **Search here**

        - Template Options: Click **Use Template Options**

            - Size: **Large**

            - Item Post Text: **Display as Block**

            Click **OK**.

    ![close dialog](images/search-page-item.png " ")

12. In the property editor, enter/select the following:

    - Under Identification:

        - Title: Master Records

        - Type: Classic Report

    - Layout > Position: Left Column

    - Under Source:

        - Type: SQL Query

        - SQL Query: Copy and Paste the below code:

        ```
        <copy>
        select "BOOK_ID",
            null LINK_CLASS,
            apex_page.get_url(p_items => 'P40_ID', p_values => "BOOK_ID") LINK,
            null ICON_CLASS,
            null LINK_ATTR,
            null ICON_COLOR_CLASS,
            case when coalesce(:P40_ID,'0') = "BOOK_ID"
              then 'is-active'
              else ' '
            end LIST_CLASS,
            (substr("TITLE", 1, 50)||( case when length("TITLE") > 50 then '...' else '' end )) LIST_TITLE,
            (substr("DESCRIPTION", 1, 50)||( case when length("DESCRIPTION") > 50 then '...' else '' end )) LIST_TEXT,
            (substr("AUTHOR", 1, 50)||( case when length("AUTHOR") > 50 then '...' else '' end )) LIST_AUTHOR,
            (substr("CATEGORY", 1, 50)||( case when length("CATEGORY") > 50 then '...' else '' end )) LIST_CATEGORY,
            null LIST_BADGE
        from "OBS_BOOKS" x
        order by "TITLE"

        </copy>
         ```

    - Page items to submit: **P40\_SEARCH**

    - Appearance > Template: **Blank with Attributes (No Grid)**

    ![close dialog](images/master-records.png " ")

13. Navigate to **Attributes** and enter/select the following:

    - Under Appearance:

        - Template: **Media List**

        - Template Options > Click Use Template Defaults: Check **Show Description Only**

        Click **OK**.

     - Messages > When No Data Found: **No Books Found.**

    ![close dialog](images/master-record-details.png " ")

14. Right-click **P40_SEARCH** and click **Create Dynamic Action**.

    ![close dialog](images/search-dynamic-action1.png " ")

15. In the property editor, enter/select the following:

    - Identification > Name: **Perform Search**

    - When > Event: **Key Press**

    - Under Client-side Condition:

        - Type: **JavaScript Expression**

        - JavaScript expression: Copy and Paste the following code:
        ```
        <copy>
        this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER
        </copy>
         ```

  ![close dialog](images/perform-search.png " ")

16. Select **TRUE** Action, enter/select the following:

    - Identification > Action: **Refresh**

    - Under Affected Elements:

        - Selection Type: **Region**

        - Region: **Master Records**

    ![close dialog](images/true-refresh.png " ")

17. Right-click **TRUE** and click **Create TRUE Action**.

    ![close dialog](images/true-action-info.png " ")

18. Enter/select the following:

    - Identification > Action: **Cancel Event**

    ![close dialog](images/cancel-event.png " ")

19. Right-click **Body** and Click **Create Region**.

    ![close dialog](images/create-region-info-4.png " ")

20. In the property editor, enter/select the following:

    - Under Identification:

        - Title: **Book Details**

        - Type: **Classic Report**

    - Under Source:

        - Table Name: **OBS\_BOOKS**

        - Where Clause: **"BOOK\_ID" = :P40\_ID**

    - Under Appearance:

        - Template Options: Check **Remove Body Padding**

        - CSS Classes: **js-master-region**

    - Under Server-side Condition:

        - Type: **ITEM IS NOT NULL**

        - Item: **P40\_ID**

    ![close dialog](images/book-details-report.png " ")

    ![close dialog](images/defaults.png " ")

21. Navigate to **Attributes**, enter/select the following:

    -  Appearance > Template: **Value Attribute Pairs - Column**

    - Pagination > Type: **No pagination(show All Rows)**

    ![close dialog](images/book-details-att.png " ")

22. Under Book Details, expand columns and select **BOOK\_ID**,  update type to **Hidden**.

    ![close dialog](images/book-details-att.png " ")

23. Select PRICE, TITLE AUTHOR, CATEGORY, DISCOUNT, BUY_LINKS, PUBLISHER, BOOK_IMAGE, CONTRIBUTOR, DESCRIPTION, BOOK_QUANTITY and in the property editor, enter/select the following:

    - Under Server-side Condition:

        - Type: Rows returned

        - SQL Query: Copy and paste the below code:

        ```
        <copy>
        select 1 from "OBS_BOOKS"
        where  "BOOK_ID" = :P40_ID
        </copy>
         ```

    ![close dialog](images/rows-returned.png " ")

24. Right-click **object\_det** and **text\_det** and click **Delete**.

    ![close dialog](images/del-object.png " ")  

25. Select **AVAILABLE\_YN** and update the following:

    - Under Identification:

        - Type: **Plain Text (based on List of Values)**

    - Under List of Values:

        - Type: Static Values

        | Display Value | Return ValueL |
        | ---------- |  ------ |
        | Yes | Y |  
        | No | N |

        Click **OK**.

    ![close dialog](images/available-y-n.png " ")  

26. Right-click **Body** and click **Create Page Item**.

    ![close dialog](images/create-page-itme-info.png " ")  

27. In the property editor, enter/select the following:

    - Under Identification:

       - Title: **P40\_ID**

       - Type: **Hidden**

    - layout > Region: **Book Details**

    ![close dialog](images/id-hidden.png " ")  

28. Right-click **Book Details** and click **Create Dynamic Action**.

    ![close dialog](images/create-dyn-act.png " ")  

29. In the property editor, enter/select the following:

    - Identification > Name: **Dialog Closed**

    - When > Event: **Dialog Closed**

    ![close dialog](images/dialog-closed.png " ")  

30. Select **TRUE Action** and enter/select the following:

    - Under Identification:

        - Name: **Refresh Book Details**

        - Type: **Refresh**

    - Under Affected Elements:

        - Selection Type: **Region**

        - Region: **Book Details**

    ![close dialog](images/refresh-book-details.png " ")  

31. Right-click **Body** and Click **Create Button**.

    ![close dialog](images/create-button-info.png " ")  

32. In the property editor, enter/select the following:

    - Identification > Button Name: **EDIT**

    - Layout > Position: **Edit**

    - Under Appearance:

        - Button Template: **Text with Icon**

        - Template options: Click **Use Template Defaults**

            - Style: **Remove UI Decoration**

            Click **OK**.

        - Icon: **fa-pencil-square-o**

    - Under Behaviour:

        - Action: **Redirect to Page in this Application**

        - Target: No Link Defined

            - Page: 50

            - Set items > Name: **P50_BOOK_ID** and Value: **&P40_ID.**

            - Clear Cache: **50**

           Click **OK**.

    ![close dialog](images/edit-btn.png " ")   

    ![close dialog](images/edit-btn-link.png " ")      

33. Right-click **Update Book Information** region and click **Create Button**.

    ![close dialog](images/create-button-info1.png " ")

34. In the property editor, enter/select the following:

    - Identification > Button Name: **RESET**

    - Layout > Position: **Next**

    - Under Appearance:

        - Button Template: **Text with Icon**

        - Template options: Click **Use Template Defaults**

            - Style: **Remove UI Decoration**

            - Spacing Right: **Large**

            Click **OK**.

        - Icon: fa-undo-alt

    - Under Behaviour:

        - Action: **Redirect to Page in this Application**

        - Target: No Link Defined

            - Page: 40

            - Clear Cache: **40**

            - Advanced > Request: **RESET**

            Click **OK**.

    ![close dialog](images/reset-btn.png " ")

    ![close dialog](images/reset-link.png " ")

35. Right-click **Reset** button and click **Duplicate**.

    ![close dialog](images/duplicate-reset.png " ")

36. In the property editor, enter/select the following:

    - Under Identification:

        - Button Name: **CREATE**

        - Label: **Create**

    - Under Appearance:

        - Hot: **Toggle On**

        - Template options: Click **Use Template Defaults**

            - Style: **Default**

            - Spacing Right: **Default**

            Click **OK**.

     - Under Behaviour:

         - Action: **Redirect to Page in this Application**

         - Target: No Link Defined

             - Page: **50**

             - Clear Cache: **50**

             - Advanced > Request: Remove **RESET**

             Click **OK**.

    ![close dialog](images/create-btn1.png " ")

37. Click **Save**.

## Task 5: Edit Book Details
In this task, you will develop a form for detailed editing of book records.

1. On the Page Designer toolbar, Navigate to (+ v) and select **Page**.

    ![close dialog](images/create-books.png " ")

2. Click **Form**.

    ![close dialog](images/book-details-form.png " ")

3. Enter/select the following:

    - Page Number: **50**

    - Name: **Edit Book Details**

    - Page Mode: **Drawer**

    - Table name: **OBS\_BOOKS**

    Click **Next**.

  ![close dialog](images/books-detail-drawer.png " ")

4. Click **Create Page**.

    ![close dialog](images/create-page-book.png " ")

5. Select **Page 50: Book Details** and update the following:

   - Dialog > Chained: **Toggle Off**

   - Navigation > Warn on Unsaved Changes: **Toggle Off**

  ![close dialog](images/chained-off.png " ")

6. In the left pane, under **Book Details** region, Right-click **P50\_OBJECT\_DET** and  **P50\_TEXT\_DET** and click **Delete**.

    ![close dialog](images/delete-obj.png " ")

7. Select **P50\_AUTHOR, P50\_DISCOUNT, P50\_BOOK\_QUANTITY,  P50\_PUBLISHER, P50\_CONTRIBUTOR**. In the property editor, Under Layout > Start New Row off: **Toggle Off**.

    ![close dialog](images/author-new-row.png " ")

8. Select **P50\_AUTHOR, P50\_DISCOUNT, P50\_PRICE**. In the property editor, Under Appearance> Template: **Required - Floating**.



9. Select **P50\_AVAILABILE\_YN** and enter/select the following:

    - Under Identification:

        - Name: **P50\_AVAILABILITY**

        - Type: **SWITCH**

 ![close dialog](images/ava-y-n.png " ")

10. Select **P50\_DESCRIPTION** and select the following:

    - Identification > Type: **Text Area**

    ![close dialog](images/desc-hidden.png " ")

11. Right-click **Book Details** and click **Create Page Item**.

    ![close dialog](images/create-page-item-book.png " ")

12. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **P50\_RESPONSE**

        - Type: **Hidden**

    - Session State > Data Type: **CLOB**

    ![close dialog](images/response-clob.png " ")

13. Rearrange the Page Items in the following order: 
    | Page Items   |
    | ----------   |  
    | P50\_BOOK_ID  |
    | P50\_TITLE    |
    | P50\_AUTHOR   |
    | P50\_PRICE    |
    | P50\_DISCOUNT |
    | P50\_BOOK\_QUANTITY |
    | P50\_CATEGORY |
    | P50\_PUBLISHER |
    | P50\_CONTRIBUTOR |
    | P50\_BUY\_LINKS |
    | P50\_BOOK\_IMAGE |
    | P50\_DESCRIPTION |
    | P50\_AVAILABILITY\_YN |
    | P50\_RESPONSE |

    ![close dialog](images/reaarange1.png " ")

14. Click **Save**.

15. Run the application and select **Adminstration** from the navigation bar.

   ![close dialog](images/administration.png " ")

16. You can view the list which you have created.  

    ![close dialog](images/admin-list.png " ")

17. Click **Manage Books Information**. On this page, you can search for any book.

    ![close dialog](images/update-book-info-page.png " ")

18. Click **Edit** to update the book details.

    ![close dialog](images/book-details-drawer.png " ")

## Task 6: Manage User Roles
In this task, you will create pages for viewing and updating user roles using interactive reports and forms.

1. On the Page Designer toolbar, Navigate to (+ v) and click **Page**.

    ![close dialog](images/create-page-role.png " ")

2. Select **Interactive Report**.

    ![close dialog](images/interactive-report-role.png " ")

3. Enter/select the following:

    - Under Page Definition:

        - Page Number: **30**

        - Name: **Users Role**

        - Include Form Page: **Toggle On**

        - Form Page Number: **29**

        - Form Page Name: **Update Users Role**

    - Data Source > Table/View Name: **OBS\_USERS**

    Click **Next**  

   ![close dialog](images/inter-report-details.png " ")

4. Click **Create Page**.

    ![close dialog](images/create-page-role1.png " ")

5. Click **Save and Run**.

    ![close dialog](images/save-run.png " ")

6. Click **Actions** and select **Columns**.

    ![close dialog](images/columns.png " ")

7. Select **Choose Password, Profile Pic, Mime Type and Picture URL** and move them to the **Do Not Display** section. Click **Apply**.

    ![close dialog](images/don-notdisplay.png " ")

8. Click **Actions > Report > Save Report: Under Save, select **As Default Report Settings**. Click **Apply**.

    ![close dialog](images/save-report.png " ")

    ![close dialog](images/default-report.png " ")

9. Under **Save Default Report**, select **Primary** and click **Apply**.

    ![close dialog](images/primary-apply.png " ")

## Task 7: Customize User Role Update Form
In this task, you modify the user role update form for enhanced usability and functionality.

1. Navigate to Page **29**.

    ![close dialog](images/nav-to-29.png " ")

2. Select **Page 29: Update Users Role**, in the property editor, **Toggle Off**: Warn on Unsaved Changes. 

    ![close dialog](images/warn-off.png " ")

3. In the left pane, Select **P29\_USER\_ID, P29\_PASSWORD, P29\_MIME\_TYPE, P29\_PROFILE\_PIC, P29\_PICTURE\_URL** and
under Identification update Type: **Hidden**.

    ![close dialog](images/pass-hidden.png " ")

4. Select **P29\_USERNAME, P29\_IS\_ADMIN and P29\_FULL\_NAME**
and under Identification update Type: **Text Field**.

    ![close dialog](images/username-text.png " ")

5. Under **Buttons** Region, Select **Delete** and enter/select the following:

    - Under Appearance:

        - Template Options: **Use Template Defaults**

            - Type: **Danger**

            - Style: **Simple**

            Click **OK**.

  ![close dialog](images/delete-button.png " ")

6. Click **Save**.

## Summary
This lab provided comprehensive instructions for setting up and managing an application's administration interface. It included tasks for creating an administration page, adding necessary navigation entries, configuring authorization schemes, and managing book information and user roles. The lab ensured that users could effectively navigate and perform administrative tasks within the application.

You are now ready to move on to the next lab!

## Acknowledgements

- **Author**: Ankita Beri, Product Manager
- **Last Updated By/Date**: Ankita Beri, Product Manager, May 2024
