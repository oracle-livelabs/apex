# Enhance Charts and Database Objects using AI

## Introduction

In this lab, you will learn how to enhance charts in Oracle APEX using AI. Instead of manually writing queries, you will use natural language prompts to ask the APEX Assistant to generate the required SQL. This approach speeds up development and shows how AI-powered assistance can simplify complex tasks such as data visualization.

In addition to enhancing charts, you will also create database objects such as tables and PL/SQL packages—directly from the SQL Commands interface using APEX Assistant.

Estimated Time: 10 minutes

### Objectives

- Enhance charts by using AI-powered APEX Assistant to generate SQL queries through natural language.

- Create PL/SQL packages using AI-powered APEX Assistant in SQL Commands.

## Task 1: Enhance Charts using AI

1. Navigate to **Dashboard** page from the navigation menu.

    !["Click App Builder"](images/dashboard1.png "")

2. From the browser tab where the app is running, navigate to the runtime developer toolbar and click **Page 1**.

    !["Click App Builder"](images/dashboard1.png "")

    !["Click App Builder"](images/event-dashboard12.png "")

3. In the page designer, select the region created under **Body**. In the property editor, update **Identification > Name** to **Event Types**.

    !["Click App Builder"](images/event-types.png "")

4. Under **Event Types**, select **Series 1** and change **Source > Type** to **SQL Query**. **Open** the code editor of the **SQL Query**.

    !["Click App Builder"](images/series-sql-query.png "")

5. Navigate to **APEX Assistant**. Select your query. From the menu, select **Query Builder** (if not already selected). In the APEX Assistant box, enter the following prompt and press enter:

    **Prompt 1:**
    ```
    <copy>
    Provide a breakdown of event types.
    </copy>
    ```

    !["Click App Builder"](images/code-chart.png "")

    >Note: APEX Assistant responds with a query as shown in the above screenshot.

6. Next, let’s adjust the query so that the highest count appears at the top. Enter the following prompt and press Enter.

    **Prompt 2:**
     ```
    <copy>
    Show highest count at the top.
    </copy>
    ```

    !["Click App Builder"](images/code-chart1.png "")

7. Click **Copy** or **Insert** to copy or insert the response into the Code Editor.

    !["Click App Builder"](images/promt2.png "")

8. While **Validating**, if your query throws an error, APEX Assistant can help troubleshoot the problem.

    For example, suppose you run a query and inadvertently leave off the 's'. at the end of the table **ev_events**.

    APEX Assistant switches to General Assistance mode. Click **Help me fix this**.

    APEX Assistant reviews the code and error, and suggests the table name may not be spelled correctly.

    !["Click App Builder"](images/fix-this.png "")

9. You can also use **General Assistance** for general conversation, technical questions such as "Explain this" or "Improve this code."  APEX Assistant provides default options such as **Use Selection, Improve Selection, and Explain Selection**.

    !["Click App Builder"](images/selections.png "")

10. Next, you will map the columns for the Event Types chart. In the Property Editor, enter/select the following:

    - Under Column Mapping:

        - Label: **NAME**

        - Value: **EVENT_COUNT**

        *Note: Columns name might differ.*

    !["Click App Builder"](images/column-mapping-chart1.png "")

11. For the second chart, we’ll display **Total Events By Month/Year**. Navigate to Chart 2 and update the following:

    - Identification > Name: **Total Events By Month/Year**.

    !["Click App Builder"](images/chart2.png "")

12. Under **Total Events By Month/Year** region, click **Series** and open the code editor of **SQL Query**.

    !["Click App Builder"](images/chart2-code.png "")

13. Navigate to **APEX Assistant** and enter the following prompt:

    **Prompt 1:**
    ```
    <copy>
    Top 5 upcoming events by registration count.
    </copy>
    ```

    !["Click App Builder"](images/chart2-code-prompt.png "")

14. Select your query and click **Insert**.

    !["Click App Builder"](images/insert-code2.png "")

15. After validating, click **OK**.

    !["Click App Builder"](images/click-ok.png "")

16. Let's map the columns for the Event Types chart. In the Property Editor, enter/select the following:

    - Under Column Mapping:

        - Label: **EVENT_NAME**

        - Value: **REGISTRATION_COUNT**

    *Note: Columns name might differ.*

    !["Click App Builder"](images/reg-count.png "")

17. Click **Save and Run** and view the updated charts on the Dashboard page.

    !["Click App Builder"](images/view-dashboard.png "")

## Task 2: Create a PL/SQL Package with APEX Assistant

In this task, you will learn how to create a package using APEX Assistant in SQL Commands and explore how it can be leveraged to efficiently generate PL/SQL package code.

1. Navigate to **SQL Workshop** and select **SQL Commands**.

    !["Click App Builder"](images/sql-command.png "")

2. Copy and paste the following *CREATE TABLE* statement in the code editor. You will then use APEX Assistant to generate a package that handles insert, update, and delete operations for the events table.

    *Note: To provide accurate context to the AI Assistant about which table it should reference while generating the package, we enter the following CREATE TABLE statement in the editor.*

    ```
    <copy>
    CREATE TABLE "EV_EVENTS"
    (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE,
	"VENUE_ID" NUMBER NOT NULL ENABLE,
	"EVENT_TYPE_ID" NUMBER NOT NULL ENABLE,
	"NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE,
	"DESCRIPTION" VARCHAR2(4000 CHAR),
	"START_DATE" DATE NOT NULL ENABLE,
	"END_DATE" DATE NOT NULL ENABLE,
	"CREATED" DATE NOT NULL ENABLE,
	"CREATED_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE,
	"UPDATED" DATE NOT NULL ENABLE,
	"UPDATED_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE,
	CONSTRAINT "EV_EVENTS_ID_PK" PRIMARY KEY ("ID")
    USING INDEX  ENABLE
    ) ;
    ```
    </copy>

    !["Click App Builder"](images/paste-statement.png "")

3. Click **APEX Assistant**, select **General Assistance** and enter the following prompt:

    **Prompt 1:**
     ```
    <copy>
    Generate a PL/SQL package to insert, update, and delete events.
    </copy>
    ```

    !["Click App Builder"](images/prompt1-pack.png "")

4. Clear the contents of the code editor. Now, click **Insert** in the APEX Assistant to insert the code into the editor.

    !["Click App Builder"](images/copy-insert.png "")

5. First, insert the Package Specification and click **Run**.

    !["Click App Builder"](images/package-spec.png "")

6. Next, insert the Package Body and click **Run**.

    !["Click App Builder"](images/package-body.png "")

7. Finally, navigate to **SQL Workshop > Object Browser** to view the newly created package.

    !["Click App Builder"](images/objt-storage.png "")

8. Under **Packages**, you can see that the package has been created.

    !["Click App Builder"](images/package-created.png "")

    *Note: This package can be extended further to improve the application. For example, you can add more procedures to handle event validations, fetch event details, or manage related data such as venues and event types. Over time, this package can become the central place for all logic related to inserting, updating, and deleting events in the application.*

## Summary

In this lab, you learned how to use the integrated AI Chat capability (APEX Assistant) in code editors within App Builder and SQL Workshop.

## Acknowledgments

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, November 2025