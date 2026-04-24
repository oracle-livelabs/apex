# Create an Interactive Report Using Natural Language

## Introduction

This lab creates the core replenishment report used throughout the rest of the workshop. With `SCM_NL2IR_REPLENISHMENT_V` already created by the setup script, you will build an Interactive Report page on that view and then enable natural language support directly on the report region.

Estimated Lab Time: 5 minutes

### Objectives

In this lab, you will:
- Create an Interactive Report page on `SCM_NL2IR_REPLENISHMENT_V`.
- Enable natural language support on the report region.

## Task 1: Create the Replenishment Report Page

This task creates the replenishment report page used in the remaining labs. The setup script has already created `SCM_NL2IR_REPLENISHMENT_V`, so you only need to point the new Interactive Report page at that view.

1. In **App Builder**, open the **Supply Chain Management** application and click **Create Page**.

    ![Click Create Page](images/click-create-page.png)

2. In the **Create Interactive Report** dialog, use the following values:

    ```
    Page Number: 2
    Name: Replenishment Overview
    Page Mode: Normal
    Include Form Page: Off
    ```

    ![Review the Create Interactive Report dialog](images/review-generated-report-page-details.png)

3. Under **Data Source**, keep **Local Database** and **Table** selected, then set **Table / View Name** to `SCM_NL2IR_REPLENISHMENT_V`.

    ![Create the report page from the SCM view](images/create-report-page-from-view.png)

4. Click **Create Page**.

5. Confirm that the success message **Interactive Report page created.** appears in **Page Designer**.

    ![Review the generated report page details](images/click-create-page.png)

6. In the left pane, select the **Replenishment Overview** Interactive Report region and verify that the source is `SCM_NL2IR_REPLENISHMENT_V`.

    ![Review the report region source settings](images/select-interactive-report-region.png)

## Task 2: Enable Natural Language on the Interactive Report

This task turns the report into an AI-enabled search surface. You will enable natural language support on the region, choose the default AI search behavior, and provide report context so the model understands replenishment terminology.

1. In **Page Designer**, keep the **Replenishment Overview** region selected and open the **Attributes** tab.

    ![Open the report region attributes](images/enable-natural-language-support.png)

2. In the **Generative AI** section, turn **Natural Language Support** **On**.

3. Set **Default Search Mode** to **Search with AI**.

4. In **Report Context**, enter the following text:

    ```
    <copy>
    Replenishment alerts show where stock should be moved into the pick face. High priority means urgent action. Qty to Target is the suggested replenishment quantity. Warehouse Code identifies the fulfillment location.
    </copy>
    ```

    ![Use the Report Context field](images/enter-report-context.png)

5. Click **Save**.

6. Click **Run** to open the report.

7. Confirm that the report opens with the conversational search bar and AI actions available above the report.

    ![Confirm Search with AI and the processing state](images/search-with-ai-enabled.png)

## Summary

You created an Interactive Report on `SCM_NL2IR_REPLENISHMENT_V`, enabled natural language support, and added SCM-specific report context. The report is now ready for column-level AI tuning.

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, April, 2026
