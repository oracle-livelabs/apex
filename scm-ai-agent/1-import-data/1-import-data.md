# Import the Data Model, Sample Data, and Base Application

## Introduction

Before you can build the AI Agent, the workspace needs a schema, sample data, and a base application to work from.

In this lab, you will load three SQL scripts: covering the warehouse schema, reference data, and operational data including the supplier delivery history the agent uses. You will then import the application and connect a Generative AI Service. Once this lab is complete, the workspace is ready for you to add agent tools in the following labs.

Estimated Time: 10 minutes

### Objectives

In this lab, you will:

- Set up the SCM data model

- Load the reference data and operational data

- Import the application for the workshop

- Add a workspace-level Generative AI Service and assign it to the application

## Task 1: Set Up the Data Model

In this task, you will upload and run the data model script. This creates the warehouse tables that the AI Agent tools will query in the later labs.

1. Sign in to your Oracle APEX workspace using the credentials provided for this workshop.

    ![Sign in to your workspace](./images/login-workspace.png " ")

2. From the Oracle APEX Home page, select **SQL Workshop**.

    ![Select SQL Workshop from the Oracle APEX Home page](./images/workspace-home.png " ")

3. From the **SQL Workshop** page, select **SQL Scripts**.

    ![Select SQL Scripts from SQL Workshop](./images/sql-workshop-home.png " ")

4. Select **Upload**.

    ![SQL Scripts page](./images/sql-scripts-page.png " ")

5. Download the [01\_SCM\_INV\_WMS\_DATAMODEL.sql](./files/01_SCM_INV_WMS_DATAMODEL.sql) file to your local machine.

6. In the **Upload Script** dialog, select the downloaded file, enter **`scm_data_model`** for **Script Name**, and select **Upload**.

    ![Data Model Upload](./images/data-model-upload.png " ")

7. In the row for **`scm_data_model`**, select **Run**.

    ![Select Run for the scm\_data\_model script from the SQL Scripts list](./images/data-model-uploaded.png " ")

8. On the confirmation page, select **Run**.

    ![Confirm the data model script run](./images/data-model-run.png " ")

9. Verify that the script completes successfully and that the following tables are created:

    ![Data Model Results](./images/data-model-results.png " ")

    | Table | Purpose |
    | --- | --- |
    | `scm_warehouses` | Warehouse master data |
    | `scm_user_roles` | Role definitions and authority levels |
    | `scm_application_users` | Application users and manager relationships |
    | `scm_user_role_assignments` | Primary and secondary role assignments |
    | `scm_warehouse_areas` | Warehouse zones such as storage and picking |
    | `scm_storage_locations` | Physical storage and pick locations |
    | `scm_items` | Inventory items |
    | `scm_item_warehouse_policies` | Reorder points, safety stock, and lead times per item per warehouse |
    | `scm_inventory_balances` | Available stock quantities per location |
    | `scm_replenishment_alerts` | Low-stock and out-of-stock alerts |
    | `scm_business_partners` | Supplier master data |
    | `scm_partner_sites` | Supplier site details |
    | `scm_inbound_receipts` | Supplier delivery headers |
    | `scm_inbound_receipt_lines` | Delivery line items and quality data |
    | `scm_operational_tasks` | Replenishment orders raised by the agent |
    {: title="Database Tables"}

## Task 2: Load the Sample Data

In this task, you will load two sample data scripts. The first populates the reference data: warehouses, users, roles, items, suppliers, and inventory balances across the network. The second loads the operational data: inbound receipts, replenishment alerts, and the supplier delivery history that the agent uses for performance comparisons. Both scripts must be run for the workshop to work correctly.

1. Select **SQL Scripts**.

    ![Return to SQL Scripts](./images/return-tosscripts.png " ")

2. Select **Upload**.

    ![Upload to SQL Scripts](./images/upload2.png " ")

3. Download the [02\_SCM\_INV\_WMS\_SAMPLE\_DATALOAD.sql](./files/02_SCM_INV_WMS_SAMPLE_DATALOAD.sql) file to your local machine.

4. In the **Upload Script** dialog, select the downloaded file, enter **`scm_sample_data1`** for **Script Name**, and select **Upload**.

    ![Sample Data Upload](./images/sample-data-upload1.png " ")

5. In the row for **`scm_sample_data1`**, select **Run**.

    ![Select Run for the scm\_sample\_data script from the SQL Scripts list](./images/sample-data-uploaded1.png " ")

6. On the confirmation page, select **Run**.

    ![Confirm the sample data script run](./images/sample-data1-confirm.png " ")

7. Verify that the script completes successfully.

    ![Sample Data Results](./images/sample-data1-results.png " ")

8. Select **SQL Scripts**.

    ![Sample Data Results](./images/sample-data1-return.png " ")

8. Select **Upload** again.

    ![Upload to SQL Scripts](./images/sample-data2-clickupload.png " ")

9. Download the [03\_SCM\_INV\_WMS\_OPERATIONAL\_DATALOAD.sql](./files/03_SCM_INV_WMS_OPERATIONAL_DATALOAD.sql) file to your local machine.

10. In the **Upload Script** dialog, select the downloaded file, enter **`scm_sample_data2`** for **Script Name**, and select **Upload**.

    ![Operational Data Upload](./images/sample-data2-upload.png " ")

11. In the row for **`scm_sample_data2`**, select **Run**.

    ![Select Run for the scm\_operational\_data script from the SQL Scripts list](./images/sample-data2-runn.png " ")

12. On the confirmation page, select **Run**.

    ![Confirm the operational data script run](./images/sample-data2-run.png " ")

13. Verify that the script completes successfully. This script loads the inbound receipts and supplier delivery history that the agent uses for performance comparisons in Lab 3.

    ![Operational Data Results](./images/sample-data2-results.png " ")

The combined sample data now includes the following:

| Data | Details |
| --- | --- |
| Warehouses | 20 active warehouses across the US, including `PHX-WEST` (Cactus Ridge Retail Fulfillment Center) as the primary demo warehouse |
| Roles | Administrator, Warehouse Manager, Inventory Controller, Operations User, Quality User, Business Viewer |
| Users | `ops.director` (Maya Chen), `inventory.lead` (Daniel Brooks), `receiving.lead` (Sofia Martinez), `fulfillment.lead` (Ethan Walker) |
| Suppliers | VoltNest Consumer Electronics, CedarLoft Home Furnishings, TrailPeak Outdoor Goods, PureLeaf Beauty Labs, SafeTrip Automotive Supply, PaperTrail Office Products |
| Items | 200 inventory items across multiple product categories |
| Inventory | Stock balances, reorder policies, and replenishment alerts for the `PHX-WEST` warehouse |
{: title="Sample Data Summary"}

## Task 3: Import the SCM Application

In this task, you will import the base APEX application. It already contains the page layout and shared components, so you can focus entirely on building the AI Agent in the following labs rather than setting up pages from scratch.

1. From the left navigation, select **App Builder**.

    ![Navigate to App Builder from the left navigation](./images/sample-data2-return.png " ")

2. From the **App Builder** page, select **Import**.

    ![App Builder Home](./images/app-builder-home.png " ")

3. Download the [SCM\_INV\_WMS\_APP.sql](./files/SCM_INV_WMS_APP.sql) file to your local machine.

4. In the import wizard, select the downloaded file to upload, then click **Next**.

    ![Import SCM application](./images/import-app.png " ")

5. Review the import details and select **Import Application**.

    ![Install Application](./images/import-app1.png " ")

6. After the import completes, verify that the import finishes successfully.

    ![Imported SCM application available in App Builder](./images/app-builder-page-dark1.png " ")

## Task 4: Configure Generative AI Service

In this task, you will configure OCI Generative AI as a service in your APEX workspace and assign it to the application. This wires up the LLM backend that the AI Agent will use to process natural language queries later in the workshop.

1. From the left navigation, click **App Builder**.

    ![Imported SCM application available in App Builder](./images/app-builder-page-dark2.png " ")

2. From **App Builder**, select **Workspace Utilities**.

    ![App Builder Workspace Utilities](./images/appbuilder-home2.png " ")

3. From **Workspace Utilities**, select **Generative AI**.

    ![Generative AI Services page](./images/genai-nav.png " ")

4. Select **Create**. On the **Create Generative AI Service** page, enter/select the following values for the Workspace level Generative AI configuration:

    > **Note:** This livelabs uses OCI Generative AI Service as the AI provider. However, Oracle APEX supports multiple Generative AI providers, including OpenAI, Azure OpenAI Service, Google Gemini, and Cohere, among others. You are not required to use OCI Generative AI; you may configure any supported provider that is available in your environment.

    - AI Provider: **OCI Generative AI Service**
    - Name: **OCI Gen AI**
    - Static ID: **oci\_gen\_ai**
    - Compartment ID: Enter your OCI Compartment ID. If you saved an OCI configuration file in Task 1 and you only have one compartment, you can reuse the compartment OCID from that file.
    - Region: **us-chicago-1**
    - Model ID: **meta.llama-3.3-70b-instruct**
    - Used by App Builder: **On**
    - Base URL: Leave the auto-generated value unchanged.
    - Credential: Select an existing OCI credential if one is already available in your workspace. Otherwise create a new OCI credential.

    ![Create Generative AI Service](./images/gen-ai-service-create.png " ")

5. Select **Create**.

6. Verify that the new **OCI Gen AI** service appears in the **Generative AI Services** list.

    ![Generative AI Service created](./images/gen-ai-service-created.png " ")

7. From the **Generative AI Services** page, select the **App Builder** icon in the left navigation.

    ![Navigate to App Builder from Generative AI Services](./images/app-builder-from-genai-services.png " ")

8. Select the application from the App Builder applications list.

    ![App Builder applications list](./images/appbuilder-home3.png " ")

9. On the application home page, select **Shared Components**.

    ![Application home page](./images/shared-comp.png " ")

10. From **Shared Components**, select **AI Attributes**.

    ![Shared Components](./images/shared-comp2.png " ")

11. For **Generative AI Service**, select **OCI Gen AI**, then select **Apply Changes**.

    ![AI Attributes configured with the Generative AI Service](./images/gen-ai-setting.png " ")

## Summary

The warehouse schema, sample data, sample application, and Generative AI service are now in place. You are ready to create the AI Agent and start adding tools in the next lab.

You may now **proceed to the next Lab**.

## Acknowledgements

- **Author** - Sahaana Manavalan, Senior Product Manager, April 2026
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, April 2026
