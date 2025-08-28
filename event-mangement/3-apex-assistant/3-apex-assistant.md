# Enhance Dashboard using APEX Assistant

## Introduction

In this lab, we will learn how to enhance charts in Oracle APEX by leveraging the APEX Assistant. Instead of manually writing queries, we will use natural language prompts to ask the APEX Assistant to generate the required SQL. This approach not only speeds up development but also demonstrates how AI-powered assistance can simplify complex tasks like data visualization.

### Objectives

- Enhance charts by using APEX Assistant to generate SQL queries through natural language.

## Task 1: Enhance charts using Generative AI

1. From the runtime environment, navigate to developer toolbar and click **Page 1**.

    !["Click App Builder"](images/event-dashboard.png "")

2. In the page designer, select **Chart 1**. In the property editor, update **Identification > Name** to **Event Types**.

    !["Click App Builder"](images/event-types.png "")

3. Under **Event Types**, select **Series 1** and change **Source > Type** to **SQL Query**. **Open** the code editor of the **SQL Query**.

    !["Click App Builder"](images/series-sql-query.png "")

4. Navigate to **APEX Assistant**. Select your query. From the menu, select **Query Builder** (if not already selected). In the APEX Assistant box, enter the following prompt and press enter:

    >Prompt 1:
    >Provide a breakdown of event types.

    !["Click App Builder"](images/code-chart.png "")

    >Note: APEX Assistant responds with a query as shown in the above screenshot.

5. Now, we need the highest count at the top. Enter the below prompt and press enter:

    >Prompt 2:
    >Show highest count at the top.

    !["Click App Builder"](images/code-chart1.png "")

6. Click **Copy** or **Insert** to copy or insert the response into the Code Editor.

    !["Click App Builder"](images/promt2.png "")

7. While **Validating**, if your query throws an error, APEX Assistant can help troubleshoot the problem.

    For example, suppose you have the following query and have inadvertently left off the "s" at the end the table name.

    APEX Assistant switches to General Assistance mode. Click **Help me fix this**.

    APEX Assistant reviews the code and error and suggests the table name may not be spelled correctly.

    !["Click App Builder"](images/fix-this.png "")

8. You can also use **General Assistance** for general conversation, technical questions such as "Explain this" or "Improve this code."  APEX Assistant prompts you with default options such as **Use Selection, Improve Selection, and Explain Selection**.

    !["Click App Builder"](images/selections.png "")

9. Now, let's map the columns for the Event Types chart. In the Property Editor, enter/select the following:

    - Under Column Mapping:

        - Series Name: **EVENT_NAME**

        - Value: **EVENT_COUNT**

    !["Click App Builder"](images/column-mapping-chart1.png "")

10. Let's say, for second chart we want to display **Total Events By Month/Year**. Navigate to Chart 2 and update the following:

    - Identification > Name: **Total Events By Month/Year**.

    !["Click App Builder"](images/chart2.png "")

11. Under **Total Events By Month/Year** region, click **Series** and open the code editor of **SQL Query**.

    !["Click App Builder"](images/chart2-code.png "")

12. Navigate to **APEX Assistant** and enter the following prompt:

    >Prompt 1:
    >Top 5 upcoming events by registration count

    !["Click App Builder"](images/chart2-code-prompt.png "")

13. Select your query and click **Insert**.

    !["Click App Builder"](images/insert-code2.png "")

14. After validating, click **OK**.

    !["Click App Builder"](images/click-ok.png "")

15. Click **Save and Run** and view the updated charts on the Dashboard page.

    !["Click App Builder"](images/view-dash.png "")

## **Summary**

You now know how to use integrated AI Chat capability (called APEX Assistant) in Code Editors within App Builder.

## **Acknowledgments**

- **Author** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, August 2025
