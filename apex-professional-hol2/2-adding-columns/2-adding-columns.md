# Add columns to the products table

The **PRODUCTS** table includes columns such as image, price, and details. But there are other characteristics that customers would appreciate knowing about a  product, such as color, type of clothing, and department. In this lab, you will add these columns to the Products table.

Since many products will share the same colors, clothing type, and department, to avoid data redundancy, it is best practice to create three additional tables to store the unique values of color, type, and department data. Instead of creating these three tables by yourself, you'll use the **Create Lookup Table** feature.

Estimated Time: 10 minutes

<!--
Watch the video below for a quick walkthrough of the lab.
test comment
[](youtube:klrFD971TtI)-->

### Objectives
In this lab, you will:
- Add new columns to the existing Products table
- Populate the new columns
- Create lookup tables

## Task 1: Add Columns to the Products Table

1. Click **SQL Workshop** from the top navigation menu.

2. Select **Object Browser**.

    ![Oject Browser](images/navigate-to-object-browser1.png " ")

3. Navigate to **PRODUCTS** Table. Click **Add Column**.

    ![Add Column](images/products-add-column1.png " ")

4. To create the Color column, enter the following:

    * Column: **COLOR**

    * Data Type: **VARCHAR2**

    * Length: **200**

    Click **Apply**.

    ![Add Column - Colors](images/add-color-column.png " ")

5. Click **Add Column** button.

6. To create the Department column, enter the following:

    * Column: **DEPARTMENT**

    * Data Type: **VARCHAR2**

    * Length: **200**

    Click **Apply**.

    ![Add Column Department2](images/add-department-column2.png " ")

7. Click **Add Column** button.

8. To create the Clothing column, enter the following:

    * Column: **CLOTHING**

    * Data Type: **VARCHAR2**

    * Length: **200**

    Click **Apply**.

    ![Add column Clothing2](images/add-clothing-column2.png " ")

## Task 2: Populate the new columns

1. Click **SQL Workshop** from the top navigation menu.

2. Select **SQL Scripts**.

    ![SQL Scripts](images/navigate-to-sql-scripts1.png " ")

3. Click **Create**.

    ![Create SQL Scripts](images/click-create-sql-scripts1.png " ")

4. For Script Name, enter **Populating new columns**.

5. Copy the following script and paste it into the editor.
    ```
    <copy>
    UPDATE
        (
                SELECT p.product_id,
                        p.product_name,
                        p.clothing,
                        p.color,
                        p.department,
                        p.product_details
                FROM   products p ) p
     SET    p.clothing = Substr(product_name, Instr(product_name, ' ',1,1)+1, Instr(product_name, ' ',1, 2)+1 - Instr(product_name, ' ',1,1)- 2),
        p.color =
        (
                SELECT c.color
                FROM   json_table (p.product_details, '$' COLUMNS ( color VARCHAR2(4000) path '$.colour') ) c),
        p.department =
        (
                SELECT g.department
                FROM   json_table (p.product_details, '$' COLUMNS ( department VARCHAR2(4000) path '$.gender') ) g)
     </copy>
     ```

    This script inserts the unique product type values (e.g. Shirt, Jacket, Skirt, etc.) into the CLOTHING column in the **Products** table. Similarly, it inserts the unique department names (e.g. Boy's, Girl's, Men's, Women's) and color names into the DEPARTMENT and COLOR columns, respectively, based on information found in the JSON product details column in the **Products** table.

6. Click **Run**.

    ![Run SQL Scripts](images/populate-column-data1.png " ")

7. Click **Run Now**.

    ![Run Script](images/run-script1.png " ")

8. The Script Results page lists the count of statements processed, successful, and with errors.

    ![Script Results](images/sql-scripts-results1.png " ")

9. To check the values in the Products table, click **SQL Workshop** and select **SQL Commands**.

    ![SQL Commands](images/open-sql-commands.png " ")

10. Copy and paste the following SQL Query in the editor:
    ```
    <copy>
    SELECT p.product_name,
           p.unit_price,
           p.color,
           p.department,
           p.clothing
    FROM   products p;
    </copy>
    ```

11. Click **Run**.

    ![Run SQL query](images/run-sql-query1.png " ")

## Task 3: Create Lookup Tables
Since multiple products may have the same values for Color, Department, and Clothing, you can create a lookup table for each column to avoid repetition and make updates easier. A lookup table stores the value of the available colors, departments, or clothing in a single place, and then each product can reference the value from the lookup table.

You create lookup tables in this lab based on the three new columns. After you create a lookup table, the PRODUCTS table can reference the new color, clothing type, and department lookup value by its new numeric primary key value in the lookup table.

1. From the APEX main menu, click **SQL Workshop**.

2. Click **Object Browser**.

    ![Object Browser](./images/navigate-to-object-browser2.png " ")

3. Navigate to **PRODUCTS** Table.

4. Click **More** and select **Create Lookup Table** button.

    ![Create lookup table1](./images/create-lookup-tables1.png " ")

5. For Text Column, select **COLOR** and click **Create Lookup Table**.

    ![Create Color lookup](./images/create-color-lookup.png " ")

    *Note: Click the **Create Lookup Table** button only once. Then, you will find the new table listed in the Object Browser.*

6. To create **Department** lookup table, navigate back to the **Products** table and click **More**. Select **Create Lookup Table** button.

    ![Create Lookup Table2](./images/create-lookup-tables1.png " ")

7. For Text Column, select **DEPARTMENT** and click **Create Lookup Table**.

    ![Create Department Lookup1](./images/create-department-lookup1.png " ")

    *Note: Click the **Create Lookup Table** button only once. Then, you will find the new table listed in the Object Browser.*

8. To create **Clothing** lookup table, navigate back to the **Products** table and click **More**. Select **Create Lookup Table** button.

    ![Create Lookup Table3](./images/create-lookup-tables3.png " ")

9. For Text Column, select **CLOTHING** and click **Create Lookup Table**.

    ![Create Clothing Lookup](./images/create-clothing-lookup1.png " ")

    *Note: Click the **Create Lookup Table** button only once. Then, you will find the new table listed in the Object Browser.*

16. The columns COLOR, DEPARTMENT, and CLOTHING in the **Products** table are renamed to COLOR\_ID, DEPARTMENT\_ID, and CLOTHING\_ID, respectively, and their data type is changed to NUMBER. Also, there are new tables containing the values of the products:
    - COLOR_LOOKUP
    - DEPARTMENT_LOOKUP
    - CLOTHING_LOOKUP

    The numeric value of the COLOR\_ID column will now store a reference to the system-assigned unique id of a particular color, whose name is stored in the new COLOR\_LOOKUP table. Similarly, the DEPARTMENT\_ID column references the id of a row in the DEPARTMENT\_LOOKUP table, and CLOTHING\_ID references the id of a row in the CLOTHING\_LOOKUP table.    


    ![Lookup table results](./images/lookup-table-results.png " ")

## Summary
You now know how to add new columns to your existing tables, create lookup tables for reference information, and create and run a SQL script to populate your tables. You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Roopesh Thokala, Senior Product Manager
- **Contributor** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, January 2024
