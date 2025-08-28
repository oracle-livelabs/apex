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

4. Navigate to **APEX Assistant**. Select your query. In the APEX Assistant box, enter the following prompt:

    >Prompt 1:
    >Provide a breakdown of event types.

    !["Click App Builder"](images/code-chart.png "")

5. Now, we need the highest count at the top. Enter the below prompt:

    >Prompt 2:
    >Show highest count at the top.

    !["Click App Builder"](images/code-chart1.png "")

6. Select your query and click **Insert** in APEX Assistant box.

    !["Click App Builder"](images/code-chart1.png "")