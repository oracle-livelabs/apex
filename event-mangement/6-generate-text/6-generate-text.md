# Generate Event Description with AI

## Introduction

In this lab, you will enhance your Oracle APEX application by integrating AI-powered text generation. Specifically, you will create a feature that automatically generates event descriptions based on event details stored in the database. By leveraging a Retrieval-Augmented Generation (RAG) source and dynamic actions, you will see how APEX makes it easy to combine low-code development with AI services to deliver smarter, user-friendly applications.

Estimated Time: 5 minutes

### Objectives

- Create a Generate Description button within the form page.

- Configure a RAG Source to fetch event details for AI input.

- Implement a Generate Text with AI dynamic action to produce event descriptions automatically.

## Task 1: Add Generate Description Button

1. In the app, click any event name to open a dialog box. Then, from the developer toolbar, navigate to **Page 5**.

    >Note: Page number may vary depending on your application. Open the forms page from your workspace.

    !["Click App Builder"](images/navigate-to-page1.png "")

2. In the left pane, right-click **Region Body** and click **Create Button**.

    !["Click App Builder"](images/create-button-ai.png "")

3. In the Property Editor, enter/select the following:

    - Under Identification:

        - Button Name: **GENERATE_DESCRIPTION**

        - Label: **Generate Description**

    - Under Appearance:

        - Button Template: **Text with Icon**

        - Hot: Toggle **On**

        - Icon: **fa-file-text**

    !["Click App Builder"](images/generate-desc.png "")

4. Drag and drop **GENERATE\_DESCRIPTION** button under **P5\_DESCRIPTION** page item.

    >Note: Page Item number may vary depending on your application.

    !["Click App Builder"](images/generate-desc1.png "")

5. Click **Save**.

    !["Click App Builder"](images/click-save.png "")

## Task 2: Define a Tool to Generate description

1. Navigate to **Shared Components**.

    !["Click App Builder"](images/nav-sc.png "")

2. Under Generative AI, click **AI Agents**.

    !["Click App Builder"](images/ai-conf3.png "")

3. Select **Event AI Configuration**.

    !["Click App Builder"](images/event-ai-cong2.png "")

4. Under Tools, click **Add Tool**.

    !["Click App Builder"](images/create-rag2.png "")

5. In the Generative AI Tool page, enter/select the following:

    - Under Identification:

        - Name: **generate_description**

        - Type: **Retrieve Data**

        - Execution Point: **Augment System Prompt**

    - Under Setting:

        - Data Description: **Retrieve the event details for a given event**

        - Type > SQL Query

        - SQL Query: Copy and paste the following SQL into the code editor.

        ```
        <copy>
        select distinct ev.ID,
            ev.venue_id,
            ev.EVENT_TYPE_ID,
            ev.NAME,
            ev.START_DATE,
            evt.name event_type,
            ev.name venue
        from EV_EVENTS ev
            join EV_EVENT_TYPES evt
        on evt.id = ev.event_type_id
            join ev_venues eve
        on eve.id = ev.venue_id
            where ev.id = :P5_ID
        </copy>
        ```
    >Note: Page Item number may vary depending on your application. Do not miss to replace page number in the SQL Query.

    !["Click App Builder"](images/gen-desc.png "")

    - Under Server-side Condition:

        - Type: Function Body

        - Expression:

            ```
            <copy>
            return :APP_PAGE_ID = 5;
            </copy>
            ```
        >Note: Page number may vary depending on your application. You need replace with your forms page number.

6. Click **Create**.

    !["Click App Builder"](images/desc-server.png "")

## Task 3: Create Trigger Action to Generate description

1. On the top right corner, click **Edit Page 5**. This page is navigating you to forms page.

    >Note: Page number may vary depending on your application.

    !["Click App Builder"](images/edit-page11.png "")

2. In the left pane, right-click **GENERATE_DESCRIPTION** and select **Create Trigger Action**.

    !["Click App Builder"](images/create-desc-dy.png "")

3. In the Property Editor, enter the following:

    - Under Identification:

        - Name : **Generate Description**

        - Action: **Generate Text with AI**

    - Generative AI > Agent: **Event AI Configuration**

    - Under Input Value:

        - Type: **Item**

        - Item: **P5_ID**

    - Under Use Response:

        - Type: **Item**

        - Item: **P5_DESCRIPTION**

    >Note: Page Item number may vary depending on your application.

    !["Click App Builder"](images/create-desc-ta.png "")

4. Navigate to left pane, select **P5_ID** and update the following and click **Save**.

    - Session State > Storage: **Per Session (Persistent)**

    *Note: This is to maintain for each session by storing the value in the database, to access it across requests.*

    !["Click App Builder"](images/per-session.png "")

5. Refresh the application and open the form page. Click **Generate Description** to create an event description in the Description item. Click **Apply Changes** to save it to the table.

    !["Click App Builder"](images/view-desc-btn.png "")

## Summary

In this lab, you built an AI-powered feature to generate event descriptions in Oracle APEX. You added a button, configured a RAG Source, and created a dynamic action to display and save the generated description.

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, May 2026
