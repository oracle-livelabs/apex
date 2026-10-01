# Lab 3: Configure the Global Page

## Introduction

In APEX, Page 0 is the Global Page. The Oracle APEX engine renders all components you add to a Global page on every page within your application.

The **Layout > Position** attribute selects the template position used to display a region. A page template must include the selected position for the region to appear there.

In this lab, you add a **Hiring_Info** Static Content region to the TAP Global Page. You place it in **After Logo** so the same hiring message appears near the top of TAP pages.

Estimated time: 5 minutes

### Objectives

In this lab, you will learn how to:

- Add a Static Content region to Page 0.
- Place the banner in the After Logo region.
- Configure the Hiring_Info region source and template.
- Run a TAP page and confirm that the banner appears globally.


## Task 1: Add the Global Banner

In this task, you will create the **Hiring_Info** Static Content region in **After Logo**. The region uses the **Title Bar** template and HTML source to display a shared hiring banner across TAP pages.

The region position controls where shared content appears. For this banner, you place the region in **After Logo** so the message appears near the top of TAP pages that use that position.

1. From the running **Candidate Pipeline** page, use the **Developer Toolbar** at the bottom of the page and select the **Application ID**.

    Your Application ID may be different from the one shown in the screenshot.

    ![TAP application home page opened from the Developer Toolbar](images/01-open-tap-app-home.png " ")

2. Open **Page 0: Global Page** in **Page Designer**.

    ![Page 0 Global Page selected on the TAP application home page](images/02-open-global-page.png " ")

3. From the Gallery, drag a **Static Content** region and drop it in the **After Logo** region.

    ![Static Content region dropped in the After Logo region](images/03-drag-static-content-after-logo.png " ")

4. In the **Property Editor**, enter/select the following:

    - Under Identification:

        - Name: **Hiring_Info**

    - Under Source:

        - HTML Code: Copy and paste the following:

            ```html
            <copy>
            <strong>Now Hiring:</strong> Open Roles at ACME Corp. [View Jobs ](f?p=&APP_ID.:2:&SESSION.)
            </copy>
            ```

    - Under Appearance:

        - Template: **Title Bar**

    ![Hiring_Info region properties configured](images/04-configure-hiring-info-region.png " ")

5. Select **Save and Run**.

    ![Save and Run selected for the Hiring_Info global banner](images/05-save-and-run-global-banner.png " ")

6. Confirm that the banner appears.

    ![Global banner displayed on a running TAP page](images/06-global-banner-runtime.png " ")

## Summary

You learned that the Oracle APEX engine renders all components you add to a Global page on every page within your application.

You also learned how to use **After Logo** as the position for the **Hiring_Info** region.

At the end of this lab, you are on a running TAP page with the global banner visible. In the next lab, you will open **1 - Home** in Page Designer and add a dynamic region.

You may now proceed to the next lab.

## Learn More

* [Creating a Global Page to Display Components on Every Page](https://docs.oracle.com/en/database/oracle/apex/26.1/htmdb/creating-a-global-page-to-display-components-on-every-page.html)

## Acknowledgements

- **Author** - Sahaana Manavalan, Senior Product Manager
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, July 2026
