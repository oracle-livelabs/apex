# Enhance App UI with AI

## Introduction

In this lab, you will learn to modernize a classic report in Oracle APEX by converting it into a content row layout. You will also explore how to enhance the report presentation with features like avatars, badges, and title links. Additionally, you will use the AI-powered APEX Assistant to modify SQL queries and generate dynamic HTML for improved display of ticket description. These enhancements demonstrate how Oracle APEX makes it easy to combine low-code development with AI-assisted productivity tools, resulting in a richer and more engaging user experience.

Estimated Time: 5 minutes

### Objectives

By the end of this lab, you will be able to:

- Convert a Classic Report into a Content Row layout that improves readability and design.

- Use AI-powered APEX Assistant in the code editor to extend SQL queries and generate HTML.

- Enhance the report with avatars, badges, and hyperlinks for better interactivity.

## Task 1: Convert a Classic Report into a Content Row

1. From the browser tab where the app is running, navigate to your Faceted Search page. In this lab, the page is called *Ticket Explorer*. 

    !["Click App Builder"](images/ticket-explorer.png "")

    >Note: Since the page name is AI-generated, it may differ. This is the Faceted Search page created on the *CS_TICKETS* table.

2. From the Runtime Developer Toolbar, click **Page 5**.

    !["Click App Builder"](images/edit-page.png "")

    >Note: Page number may vary depending on your application.

3. From the left pane, select **Tickets** region. In the Property Editor, select the following:

    - Identification > Type: **Content Row**

    !["Click App Builder"](images/content-row.png "")

4. Update **Source > Type** to **SQL Query** and open the code editor of SQL Query.

    !["Click App Builder"](images/code-edit.png "")

5. Select the SQL Query. Click **APEX Assistant** and enter the following prompt:

    **Prompt 1:**
    ```
    <copy>
    Update the query to also fetch Agent Name and Account type.

    </copy>
    ```

    !["Click App Builder"](images/add-prompt.png "")

6. Click **Insert**, or replace the existing SQL query with the one provided below to generate an expected output for this workshop:

    *Note: By replacing it with the provided code, we ensure that your application behaves consistently and matches the expected outcome.*

    ```
    <copy>
        select ct.ticket_id,
        ct.ticket_number,
        ct.customer_id,
        ct.account_id,
        ct.subject,
        ct.description,
        ct.priority,
        ct.status,
        ct.channel,
        ct.assigned_agent_id,
        ag.agent_name,
        ca.account_type,
        ct.created_at,
        ct.created_by,
        ct.updated_at,
        ct.updated_by,
        ct.closed_at
        from cs_tickets       ct
        join cs_agents        ag
        on ct.assigned_agent_id = ag.agent_id
        join cs_accounts      ca
        on ct.account_id = ca.account_id
    </copy>
    ```

    !["Click App Builder"](images/insert-prompt.png "")

7. Click on **Validate**. Once the validation is successful, click **OK** to close the dialog.

    !["Click App Builder"](images/close-editor.png "")

8. In the Property Editor, navigate to **Attributes** tab and enter/select the following:

    - Under Settings:

        - Overline: **&TICKET_NUMBER.**

        - Title: **&SUBJECT.**

        - Description: **&DESCRIPTION.**

        - Miscellaneous: **Agent: &AGENT_NAME.**

        - Display Avatar: Toggle **On**

        - Display Badge: Toggle **On**

    - Avatar > Icon: **fa-user-wrench**

    - Badge:

        - Label: **Status:**

        - Value: **STATUS**

        - Position: **End**

        - Alignment: **Center**

    !["Click App Builder"](images/name-attr.png "")

    !["Click App Builder"](images/desc-attr.png "")

9. Under **Settings**, open the code editor of **Description**.

    !["Click App Builder"](images/desc-code-editor.png "")

10. Click **APEX Assistant**. Now enter the following prompts and hit enter:

    **Prompt 1:**
     ```
    <copy>
    Generate HTML to display Account Type and Channel as separate rows in span tags below description.
    </copy>
    ```

    !["Click App Builder"](images/gen-html.png "")

    **Prompt 2:**
     ```
    <copy>
    Use APEX substitution strings.
    </copy>
    ```

    !["Click App Builder"](images/subs-string-prompt.png "")

    **Prompt 3:**
     ```
    <copy>
    Display it below description.
    </copy>
    ```

    !["Click App Builder"](images/below-desc.png "")

11. Click **Insert** and then **OK**, or replace the existing content with the HTML provided below to achieve the expected output:

    ```
    <copy>
    <span>&DESCRIPTION.</span><br>
    <span><strong>Account Type:</strong> <span>&ACCOUNT_TYPE.</span></span><br>
    <span><strong>Channel:</strong> <span>&CHANNEL.</span></span>
    </copy>
    ```

    !["Click App Builder"](images/insert-html.png "")

12. Click **Save and Run**.

    !["Click App Builder"](images/saverun.png "")

13. View the updated Content Row report.

    !["Click App Builder"](images/view-content-row.png "")

14. Next, let's add a hyperlink to the title to open a form page. Switch to the Page Designer tab. 
    In the left pane, under **Tickets** region, right-click **Actions** and click **Create Action**.

    !["Click App Builder"](images/create-action.png "")

15. In the Property Editor, enter/select the following:

    - Identification > Position: **Title Link**

    - Link > Target: Click **No Link Defined**

        - Target > Page: **12** (The page number may vary in your generated app. Choose the **Ticket Detail**s Form page.)

        - Set Items:

            | Name | Value |
            | ----- | ---- |
            | P12_TICKET_ID | &TICKET_ID.|
            {: title="Set Items"}

        - Clear Cache: **12**

        Click **OK**.

    >Note: Page number may vary depending on your application.

    !["Click App Builder"](images/title-link.png "")

16. Click **Save and Run** and view the changes. Click on any of the tickets to open a drawer with an editable form. 

    !["Click App Builder"](images/save-run3.png "")

    !["Click App Builder"](images/title-link1.png "")

## Task 2: Enhance the Appearance of the App

In this task, you use the Theme Roller to quickly transform the appearance of an application without editing/writing any code.

1. When you run an application from App Builder and view a page, the Runtime Developer toolbar displays at the bottom of any editable running page.

    On the Runtime Developer Toolbar, click **Customize**.

    !["Click App Builder"](images/customize.png "")

2. To access the Theme Roller dialog, click **Theme Roller** from the Customize menu.

    !["Click App Builder"](images/theme-roller1.png "")

3. In the **Theme Roller** dialog box, update **Select Theme** to **Redwood Light**.

    !["Click App Builder"](images/redwood-light.png "")

4. Under **Redwood Options**, select the following:

    - Pillar: **Ocean**

    - Layout: **Floating**

    !["Click App Builder"](images/redwood-options.png "")

5. Under **Appearance**, select the following:

    - Header: **Pillar**

    - Navigation: **Pillar**

    - Body Header: **Dark**

    - Body Background: **Dark**

6. Click **Save As** to save the theme.

    !["Click App Builder"](images/appearnace.png "")

7. In **Save As** dialog box, for **Style Name** enter **Customer Support Theme** and click **Save**.

    !["Click App Builder"](images/style-name.png "")

## Summary

In this lab, you transformed a classic report into a content row layout, improving the overall presentation of data. You learned how to enhance the report with avatars, badges, and title links, making it more interactive and visually appealing. You also used APEX Assistant to modify SQL queries and generate custom HTML within the description, showcasing how AI integration within APEX accelerates development and improves application design.

## Acknowledgements

- **Authors** - Toufiq Mohammed, Principal Product Manager; Apoorva Srinivas, Principal Product Manager
- **Last Updated By/Date** - Apoorva Srinivas, Principal Product Manager, January 2026
