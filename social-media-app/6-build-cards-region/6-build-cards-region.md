# Build the Cards Region

## Introduction

In this lab, you learn to create the CARDS region to display the posts and configure the region attributes.

Estimated Time: 10 minutes

Watch the video below for a quick walk-through of the lab.
[Create an APEX App](videohub:1_cmdi0d57)

### Objectives

In this lab, you will:
- Create the Cards region to display the posts
- Configure the attributes of the Cards region to match our design

### Prerequisites

- Completion of workshop through Lab 5

## Task 1: Create a Cards Region

1. Navigate to the Rendering Tree and right-click on **Body**, and
choose **Create Region**.   

    ![Create region option](images/create-region.png)

2. Update the following attributes in the Property Editor:

    - Under Identification:
         - For Title, enter **Timeline**
         - For Type, select **Cards**

    ![Property Editor](images/title-type.png)


3.  Under Source, for Type select **SQL Query**. Enter the following **SQL Query** into the SQL
    Query box:

    ```
    <copy>
        select
        p.id,
        p.created_by AS user_name,
        p.post_comment AS comment_text,
        p.file_blob,
        p.file_mime,
        
        apex_util.get_since(p.created) post_date,

        (
            select count(*) from SM_REACTIONS smr 
            where smr.post_id=p.id
        ) as REACTIONS,

        (
            select 'user-has-liked' from SM_REACTIONS smr 
            where smr.post_id=p.id and created_by=:APP_USER
        ) USER_REACTION_CSS

        from SM_POSTS p 

        order by p.created desc
    </copy>
    ```

    ![SQL expression in editor](images/sql-code.png)

5. Scroll down in the Property Editor to the **Appearance** section:

    - In the Appearance > CSS Classes box, enter **t-Chat**

    - In Advanced > Static ID, enter **timeline**.

    ![Property editor](images/appearance.png)

    We are not done with this region yet! We have to configure
which columns from the query results will be used in which parts of the
CARDS.

## Task 2: Configure the Attributes of the Cards Region

1. In the Property Editor, select the **Attributes** tab, and make
the following changes:

    - Card > Primary Key Column 1: **ID**

    - Title > Column: **USER_NAME**

    - Subtitle > Column: **POST_DATE**

    ![Attributes in Property Editor](images/attributes-1.png)

    - Body > Column: **COMMENT_TEXT**

    - Icon and Badge > Icon Source: **Initials**

    - Icon Column: **USER_NAME**

    ![Attributes in Property Editor](images/attributes-2.png)

    And finally (for this Region), scroll down to the Media section, and set
the following attributes:

    - Source: **BLOB column**

    - BLOB Column: **FILE_BLOB**

    - Position: **First**

    - Appearance: **Widescreen**

    - Sizing: **Cover**

    - CSS Classes: enter **selectDisable**

    - Copy and paste **&COMMENT_TEXT.** (including the period!)
    into the **Image Description** box

    - BLOB Attributes > Mime Type Column: **FILE_MIME**

    ![Attributes in Property Editor](images/attributes-3.png)

2. Now, the region is completely configured. Click **Save and Run**.

    If you made a post earlier, you should now see your image and your
comment text!

    ![Running app](images/run-app.png)

You may now **proceed to the next lab**

## Acknowledgements

 - **Author** - Jayson Hanes, Principal Product Manager; Apoorva Srinivas, Senior Product Manager; 
 - **Last Updated By/Date** - Apoorva Srinivas, Senior Product Manager, March 2023