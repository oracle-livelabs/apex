# Create a Products Vector Search Page using Search Configurations

## Introduction

In this lab, you will learn how to load ONNX models into Oracle Database and create a Vector Provider to generate vector embeddings. You will create Search Configuration based on Oracle Vector Search to build an efficient search system. Finally, you will create a search page that utilizes these search configurations for powerful and accurate search functionality.

>**Note**: This lab assumes you are using Oracle Database 23ai.

Estimated Time: 15 minutes

### Objectives

- Load ONNX Models.

- Create a Vector Provider.

- Generate Vector Embeddings.

- Create Search Configuration based on Oracle Vector Search.

- Create a Search Page.

## Task 1: Load ONNX Model to Oracle Database

In this lab, you will create a Database View for your APEX application, containing all the necessary project-related information. This view will be used when adding RAG Sources to AI Configurations. Next, you will go to the AI Attributes page and set the Generative AI Service name to the one configured in **Lab 1**.

Before uploading the ONNX model to your database schema, you must grant the schema the privilege to create mining models while logged in as SYS/ADMIN.

- Login as SYS/Admin User and execute the below command.

- >**Command**: GRANT create mining model TO **YourSchemaName**;

   !["Grant create mining model"](images/provide-grants.png "")

1. Navigate to **SQL Workshop** and select **SQL Commands**.

    !["select SQL Commands"](images/select-sql-commands.png "")

2. In the SQL Commands Page, copy and paste the below code and click **Run**.

    ```
    <copy>
        DECLARE
        L_PAR_URL       VARCHAR2(1000);
        L_RESPONSE_BLOB BLOB;
        BEGIN
            L_PAR_URL := 'https://adwc4pm.objectstorage.us-ashburn-1.oci.customer-oci.com/p/eLddQappgBJ7jNi6Guz9m9LOtYe2u8LWY19GfgU8flFK4N9YgP4kTlrE9Px3pE12/n/adwc4pm/b/OML-Resources/o/all_MiniLM_L12_v2.onnx'
            ;
            L_RESPONSE_BLOB := APEX_WEB_SERVICE.MAKE_REST_REQUEST_B(
                P_URL         => L_PAR_URL,
                P_HTTP_METHOD => 'GET'
            );
            DBMS_VECTOR.LOAD_ONNX_MODEL(
                MODEL_NAME => 'DOC_MODEL',
                MODEL_DATA => L_RESPONSE_BLOB,
                METADATA   =>
                        JSON(
                            ' {
                        "function" : "embedding",
                        "embeddingOutput" : "embedding" ,
                        "input":{"input": ["DATA"]}
                    }'
                        )
            );

        END;
    </copy>
    ```

    !["create view"](images/load-onnx-model.png "")

## Task 2: Create Vector Provider from Workspace Utilities

In this task, you will create a Vector Provider that will be used later to set up a Search Configuration.

1. From your SQL Commands page, click the Down Arrow next to **App Builder** and select **Workspace Utilities**. Then, select **All Workspace Utilities**.

    !["Click shared components"](images/click-workspace-utilities.png "")

2. In the Workspace Utilities page, select **Vector Providers**.

    !["click workspace utilities"](images/vector-providers.png "")

3. Click **Create**.

    !["click create"](images/click-create.png "")

4. In the Vector Provider Configuration page, enter the following:

    - Under Identification:

        - Provider Type : **Database ONNX Model**

        - Name: **DB ONNX Model**

        - Static ID: **db\_onnx\_model**

    - Under Local Embedding:

        - ONNX Model Owner: **Select your Parsing Schema**

        - ONNX Model Name: **DOC_MODEL**

5. Click **Create**.

    !["configure vector provider"](images/configure-vector-provider.png "")

## Task 3: Add a Vector Column and Generate Vector Embeddings for Product Names

In this task, you will add a vector column in product table and write a PL/SQL code which generates vector embeddings for product names in the products table using the apex\_ai.get\_vector\_embeddings function. It iterates through each product, computes the vector representation of the product name using a specified AI model (db\_onnx\_model), and stores the resulting embedding in the pname\_vector column. .

1. From your Vector Provider page, click the Down Arrow next to **SQL Workshop** and select **SQL Commands**.

    !["Click SQL scripts"](images/click-sql-scripts.png "")

2. Copy and Paste the following SQL queries one after the other and click **Run**.

    ```
    <copy>
    ALTER TABLE PRODUCTS
    ADD PNAME_VECTOR VECTOR;
    </copy>
    ```

    ```
    <copy>
    DECLARE
    l_vector VECTOR;
    BEGIN
        FOR i IN (SELECT product_id,
                     product_name
              FROM   products) LOOP
        SELECT apex_ai.Get_vector_embeddings(p_value => i.product_name,
                                                      p_service_static_id =>
                                                      'db_onnx_model')
        INTO   l_vector
        FROM   products
        WHERE  product_id = i.product_id;

        UPDATE products
        SET    pname_vector = l_vector
        WHERE  product_id = i.product_id;
    END LOOP;
    END;
    </copy>
    ```

    !["Click create"](images/pname_vector.png "")

    !["Click create"](images/vector-update.png "")

## Task 4: Create a Search Configuration

In this task, you will set up a Search Configuration based on Oracle Vector Search.

1. From the Navigation bar in your workspace, click **App Builder**.

    !["Click App Builder"](images/nav-to-app.png "")

2. Select your application and click **Shared Components**.

    !["select project management app"](images/acme-shop.png "")

    !["click shared components"](images/acme-shop-sc.png "")

3. Under **Navigation and Search**, select **Search Configurations**.

    !["click AI Attributes"](images/search-conf.png "")

4. Click **Create**.

    !["click create"](images/serach-conf-create.png "")

5. In the Create Search Configuration Detail Wizard, enter/select the following:

    - Name : **Products Search - Vector**

    - Search Type: **Oracle Vector Search**

    Click **Next**.

    !["vector search config"](images/products-search.png "")

6. In the Create Search Configuration **Source** Wizard, enter/select the following:

    - Vector Provider : **DB ONNX Model**

    - Table/View Name: **PRODUCTS**

    Click **Next**.

    !["vector search config"](images/products-search1.png "")

7. In the Create Search Configuration Column Mapping Wizard, enter/select the following:

    - Primary Key Column Column 2 : **PRODUCT_ID(Number)**

    - Vector Column: **PNAME_VECTOR(Vector)**

    - Title Column: **PRODUCT_NAME(Varchar2)**

    - Description Column: **UNIT_PRICE(Number)**

    Click **Create Search Configuration**.

    !["vector search config"](images/product-search2.png "")

8. Navigate to  **Icon and Display** tab and enter/select the following:

    - Icon Source: **Image BLOB Column**

    - Icon BLOB Column Name: **PRODUCT_IMAGE(Blob)**

    - Icon Mime Type Column Name: **IMAGE\_MIME\_TYPE(Varchar2)**

    - Maximum Rows to Return: **5**

    Click **Apply Changes**.

    !["enter system prompt"](images/search-conf-edit.png "")

## Task 5: Create an Oracle Vector Search Page

In this task, you will create a Vector Search Page to search across your Products.

1. From your Search Configurations Page, click **App xxx**.

    !["Click App Builder"](images/app-id-conf.png "")

2. Click **Create Page**.

    !["click edit application definition"](images/search-create-page.png "")

3. Select **Search Page**.

    ![create page wizard](./images/search-page.png " ")

4. Under Create Search Page wizard, enter/select the following:

    - Page Definition > Name: **Product Search**

    - Search Configurations > Products Search - Vector: Set checkbox to **Yes**

    - Navigation > Use Breadcrumb: Toggle **OFF**

    Click **Create Page**.

    ![create page wizard](./images/search-page1.png " ")

5. Navigate to the root node **Page 19: Product Search**. In the Property Editor, under **Security**, for **Authentication**, select **Page is Public**.

## Task 6: Run the New Vector Search Page

1. In Page Designer of the newly created page, click **Run and Save**.

    ![running the app](images/run-search-page.png " ")

2. Now, play around with the Search Page.

    ![click on chat assistant button](images/vector-page.png " ")

## Summary

In this lab, you loaded ONNX models into Oracle Database, created a Vector Provider, and generated vector embeddings. Then, you configured Oracle Vector Search for enhanced search capabilities and built a search page to leverage these embeddings for efficient and accurate search results.

## Learn More - *Useful Links*

- APEX on Autonomous:   [https://apex.oracle.com/autonomous](https://apex.oracle.com/autonomous)
- APEX Collateral:   [https://apex.oracle.com](https://apex.oracle.com)
- Tutorials:   [https://apex.oracle.com/en/learn/tutorials](https://apex.oracle.com/en/learn/tutorials)
- Community:  [https://apex.oracle.com/community](https://apex.oracle.com/community)
- External Site + Slack:   [http://apex.world](http://apex.world)

## Acknowledgments

- **Author** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, January 2025
