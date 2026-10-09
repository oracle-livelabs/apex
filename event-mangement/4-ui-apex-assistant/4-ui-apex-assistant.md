# Enhance UI with AI

## Introduction

In this lab, you will learn how to modernize a classic report in Oracle APEX by converting it into a content row layout. You will also explore how to enhance the report presentation with features such as avatars, badges, and title links. Additionally, you will use the AI-powered APEX Assistant to modify SQL queries and generate dynamic HTML to enhance report descriptions. These enhancements demonstrate how APEX makes it easy to combine low-code development with AI-assisted productivity features, resulting in a richer and more engaging user experience.

Estimated Time: 10 minutes

### Objectives

By the end of this lab, you will be able to:

- Convert a classic report into a content row layout to improve readability and design.

- Use the AI-powered APEX Assistant in the code editor to extend SQL queries and generate HTML.

- Enhance the report with avatars, badges, and hyperlinks for better interactivity.

## Task 1: Convert a Classic Report into a Content Row

1. From the browser tab where the app is running, navigate to your faceted search page. In this lab, the page is called Event Search. The name may differ because the application was generated using AI.

    !["Click App Builder"](images/discover-events.png "")

    >Note: Since the page name is AI-generated, it may differ. This is the Faceted Search page created on the *EV_EVENTS* table.

2. From the Developer Toolbar, click **Page 3**.

    !["Click App Builder"](images/edit-page.png "")

    >Note: The page number may vary depending on your application.

3. From the left pane, select **Events** region. In the Property Editor, select the following:

    - Identification > Type: **Content Row**

    !["Click App Builder"](images/content-row.png "")

4. Update **Source > Type** to **SQL Query** and open the SQL Query code editor.

    !["Click App Builder"](images/code-edit.png "")

5. Select your SQL query, click **APEX Assistant** and enter the following prompt:

    **Prompt 1:**
    ```
    <copy>
    Add venue and event type.
    </copy>
    ```

    !["Click App Builder"](images/add-event-promt.png "")

6. Click **Insert**, or replace the existing SQL query with the one provided below to generate the same output for this workshop:

    *Note: Replacing the query with the provided code ensures that your application behaves consistently and matches the expected output.*
    ```
    <copy>
    select ee.id,
       ee.venue_id,
       evv.name           as venue_name,
       ee.event_type_id,
       eet.name           as event_type_name,
       ee.name,
       ee.description,
       ee.start_date,
       ee.end_date,
       ee.created,
       ee.created_by,
       ee.updated,
       ee.updated_by
    from ev_events        ee
    join ev_venues        evv
    on ee.venue_id = evv.id
    join ev_event_types   eet
    on ee.event_type_id = eet.id
    </copy>
    ```

    !["Click App Builder"](images/insert-prompt.png "")

7. Click **OK** to close the dialog.

    !["Click App Builder"](images/close-editor.png "")

8. In the Property Editor, navigate to the **Attributes** tab and enter/select the following:

    - Under Settings:

        - Title: **&NAME.**

        - Description: **&DESCRIPTION.**

        - Display Avatar: Toggle **On**

    - Avatar > Icon: **fa-calendar-month**

    !["Click App Builder"](images/name-attr1.png "")

    !["Click App Builder"](images/desc-attr1.png "")

    !["Click App Builder"](images/desc-attr.png "")

9. Under **Settings**, open the code editor for **Description**.

    !["Click App Builder"](images/attr.png "")

10. Select &DESCRIPTION. and click **APEX Assistant**. Now enter the following prompts:

    **Prompt 1:**
     ```
    <copy>
    Generate some HTML to display start date and end date as labelled information using span tag.
    </copy>
    ```

    !["Click App Builder"](images/gen-html.png "")

    **Prompt 2:**
     ```
    <copy>
    Use APEX substitution strings.
    </copy>
    ```

    !["Click App Builder"](images/substitution-apex.png "")

    **Prompt 3:**
     ```
    <copy>
    Display it below description.
    </copy>
    ```

    !["Click App Builder"](images/below-desc.png "")

11. Click **Insert** and then **OK**, or or replace the existing content with the HTML below to achieve the expected output:

    ```
    <copy>
    <span>&DESCRIPTION.</span><br>
    <span><strong>Start Date:</strong> <span>&START_DATE.</span></span>
    <span style="margin-left: 20px;"><strong>End Date:</strong> <span>&END_DATE.</span></span>
    </copy>
    ```

    !["Click App Builder"](images/insert-html.png "")

12. Click **Save and Run**.

    !["Click App Builder"](images/saverun.png "")

13. View the updated content row report.

    !["Click App Builder"](images/view-content-row3.png "")

14. Next, add a badge to the content row layout. Switch to the Page Designer tab. Navigate to **Attributes** tab and enter/select the following:

    - Settings > Display Badge: Toggle **On**

    - Under Badge:

        - Label: **&EVENT\_TYPE\_ID.**

        - Value: **EVENT\_TYPE\_NAME**

        - Position: **End**

        - Alignment: **Center**

    !["Click App Builder"](images/update-attr.png "")

15. Click **Save and Run** and view the changes.

    !["Click App Builder"](images/save-run2.png "")

    !["Click App Builder"](images/view-results.png "")

16. Next, add a hyperlink to the title that opens a form page. Switch to the Page Designer tab. In the left pane, under **Events** region, right-click **Actions** and select **Create Action**.

    !["Click App Builder"](images/create-action.png "")

17. In the Property Editor, enter/select the following:

    - Identification > Position: **Title Link**

    - Link > Target: Click **No Link Defined**

        - Target > Page: **5**

        - Set Items:

            | Name | Value |
            | ----- | ---- |
            | P5_ID | &ID.|
            {: title="Set Items"}

        - Clear Cache: **5**

        Click **OK** to close the dialog.

    >Note: Page number may vary depending on your application. Select the form page used to edit events.

    !["Click App Builder"](images/title-link.png "")

18. Click **Save and Run** to view the changes.

    !["Click App Builder"](images/save-run3.png "")

    !["Click App Builder"](images/title-link1.png "")

## Summary

In this lab, you transformed a classic report into a content row layout, improving the overall presentation of data. You learned how to enhance the report with avatars, badges, and title links, making it more interactive and visually appealing. You also used APEX Assistant to modify SQL queries and generate custom HTML within the description, demonstrating how AI integration in APEX accelerates development and enhances application design.

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, May 2026
