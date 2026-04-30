# Create an Interactive Report Using Natural Language

## Introduction

This lab creates the core replenishment report used throughout the rest of the workshop. With `SCM_REPLENISHMENT_V` already created by the setup script, you will build an Interactive Report page on that view and then enable natural language support directly on the report region.

Estimated Lab Time: 5 minutes

### Objectives

In this lab, you will:

- Create an Interactive Report page using natural language.
- Enable natural language support on the report region.

## Task 1: Build an Interactive Report page from a view

This task creates the replenishment report page used in the remaining labs. The setup script has already created **SCM\_REPLENISHMENT\_V**, so you only need to point the new Interactive Report page at that view.

1. Navigate to **App Builder** icon in the left navigation.

    ![Click Create Page](images/nav-to-app.png)

2. In **App Builder**, open the **Supply Chain Management** application and click **Create Page**.

    ![Click Create Page](images/click-scm.png)

    ![Click Create Page](images/review-pages-and-shared-components.png)

3. When using Generative AI features within the APEX development environment for the first time, you will be asked to provide consent. In the APEX Assistant Wizard, if you see a Dialog regarding consent. Click on Accept.

   ![Click Create Page](images/review-pages-and-shared-components.png)

4. Use natural language to request a new Interactive Report page based on the view **SCM\_REPLENISHMENT\_V**. For example, enter:

    ```
    <copy>
    Create an interactive report page based on the view SCM_REPLENISHMENT_V
    </copy>
    ```

    ![Enter the Interactive Report prompt](images/enter-interactive-report-prompt.png)

5. Once you're okay with the page, click **Create Page**.

    ![Create the report page from the SCM view](images/create-report-page-from-view.png)

6. Review the suggested page details, change Page Name to **SCM Replenishment** and confirm that **Table / View Name** is **SCM\_REPLENISHMENT\_V**, then click **Create Page**.

    ![Review the generated page details and create the page](images/review-generated-report-page-details.png)

7. Click **Run**.

    ![Run the replenishment report](images/run-replenishment-report.png)

    Confirm that the report renders from the view.

    ![View the replenishment report](images/view-replenishment-report.png)

## Task 2: Enable Natural Language on the Interactive Report

This task turns the report into an AI-enabled search surface. You will enable natural language support on the region, choose the default AI search behavior, and provide report context so the model understands replenishment terminology.

1. In **Page Designer**, keep the **SCM Replenishment** region selected and open the **Attributes** tab.

2. In the **Generative AI** section, turn **Natural Language Support** **On**.

    ![Open the report region attributes](images/enable-natural-language-support.png)

3. Confirm **Default Search Mode** is **Search with AI**.

4. In **Report Context**, enter the following text:

    ```
    <copy>
    Replenishment alerts show where stock should be moved into the pick face. High priority means urgent action. Qty to Target is the suggested replenishment quantity. Warehouse Code identifies the fulfillment location.
    </copy>
    ```

    ![Use the Report Context field](images/enter-report-context.png)

5. Click **Save and Run Page**.

6. Confirm that the report opens with the conversational search bar.

    ![Confirm Search with AI and the processing state](images/search-with-ai-enabled.png)

## Summary

You created an Interactive Report, enabled natural language support, and added SCM-specific report context. The report is now ready for column-level AI tuning.

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, April, 2026
