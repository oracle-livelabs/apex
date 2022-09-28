# Add columns to the products table

## Introduction

The **PRODUCTS** table includes some columns such as image, price, and details. But there are other characteristics that customers would appreciate knowing about a  product, such as color, type of clothing, and department. In this lab, you will add these columns to the Products table.

Since many products will share the same colors, clothing type, and department, to avoid data redundancy it is best practise to create three addi�tional tables to store the unique values of color, type, and department data. Instead of creating these three tables for yourself, you'll use the **Create Lookup Table** feature.

In this lab, you learn how to add these three new columns to the **PRODUCTS** table and then create lookup tables for those new columns.

Estimated Time: 10 minutes

<!--
Watch the video below for a quick walk through of the lab.
test comment
[](youtube:klrFD971TtI)-->

### Objectives
In this lab, you will:
- Add new columns to the existing Products table
- Populate the new columns
- Create lookup tables

## Task 1: Add Columns to the Products Table

1. From the APEX Main Menu, click **SQL Workshop**.

2. Click **Object Browser**.

    ![Oject Browser](images2/navigate-to-object-browser1.png " ")

3. Navigate to **PRODUCTS** Table. Click **Add Column** button.

    ![Add Column](images2/products-add-column1.png " ")

4. For Color column, enter the following:

    * Add Column - enter **COLOR**
    * Type - select **VARCHAR2**
    * Length - enter **200**.  

    Click **Next**.

    ![Add Column - Colors](images2/add-color-column.png " ")

6. Click **Finish**.

    ![Confirm your request](images2/add-color-column2.png " ")

7. Click **Add Column** button.

    ![Add column Department](images2/add-department-column1.png " ")

8.  For Department column, enter the following:

    * Add Column - enter **DEPARTMENT**
    * Type - select **VARCHAR2**
    * Length - enter **200**.

    Click **Next**.

    ![Add Column Department2](images2/add-department-column2.png " ")

10. Click **Finish**.

    ![Confirm your request - Department](images2/add-department-column3.png " ")

11. Click **Add Column** button.

    ![Add column Clothing](images2/add-clothing-column1.png " ")

12. For Clothing column, enter the following:

    * Add Column - enter **CLOTHING**
    * Type - select **VARCHAR2**
    * Length - enter **200**.

    Click **Next**.

    ![Add column Clothing2](images2/add-clothing-column2.png " ")

14. Click **Finish**.

    ![Confirm your request - Clothing](images2/add-clothing-column3.png " ")

## Task 2: Populate the new columns

1. From the APEX main menu, click **SQL Workshop**.

2. Click **SQL Scripts**.

    ![SQL Scripts](images2/navigate-to-sql-scripts1.png " ")

3. Click **Create**.

    ![Create SQL Scripts](images2/click-create-sql-scripts1.png " ")

4. For Script Name, enter **Populating new columns**.

5. Copy the following script and paste into the editor.

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

    This script inserts the unique product type values (e.g. Shirt, Jacket, Skirt, etc.) into the CLOTHING column in the **Products** table. Similary, it inserts the unique department names (e.g. Boy's, Girl's, Men's, Women's) and color names into the DEPARTMENT and COLOR columns respectively based on information found in the JSON product details column in the **Products** table.

5. Click **Run**.

    ![Run SQL Scripts](images2/populate-column-data1.png " ")

6. Click **Run Now**.

    ![Run Script](images2/run-script1.png " ")

7. The Script Results page is displayed listing the statements processed, successful, and with errors.

    ![Script Results](images2/sql-scripts-results1.png " ")

8. To check the values in the Products table, click **SQL Workshop** and click **SQL Commands**.

    ![SQL Commands](images2/open-sql-commands.png " ")

9. Copy the following SQL Query.
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

10. Click **Run**.

    ![Run SQL query](images2/run-sql-query1.png " ")

## Task 3: Create Lookup Tables
Since multiple products may have the same values for Color, Department, and Clothing, to avoid repetition and make updates easy, you can create a lookup table for each. A lookup table stores the value of the available colors, departments, or clothing in a single place, and then each product can reference the value from the lookup table.

In this lab, you create lookup tables based on the new three columns. After you create a lookup table, this allows the PRODUCTS table to reference the new color, clothing type, and department lookup value by its new numeric primary key value in the lookup table.

1. From the APEX main menu, click **SQL Workshop**.

2. Click **Object Browser**.

    ![Object Browser](./images2/navigate-to-object-browser2.png " ")

3. Navigate to **PRODUCTS** Table.

4. Click **Create Lookup Table** button.

    ![Create lookup table1](./images2/create-lookup-tables1.png " ")

5. For Column, select **COLOR - varchar2**.
   Click **Next**.

    ![Create Color lookup](./images2/create-color-lookup.png " ")

6. Leave the default table and sequence names:

    * New Table Name: **COLOR_LOOKUP**
    * New Sequence: **COLOR\_LOOKUP\_SEQ**

    Click **Next**.

    ![Create Color lookup1](./images2/create-color-lookup1.png " ")

7. Click **Create Lookup Table**.

    ![Create Color lookup2](./images2/create-color-lookup2.png " ")

    *Note: Click the **Create Lookup Table** button only once. Then you will find the new table listed in the Object Browser.*

8. To create **Department** lookup table, navigate back to the **Products** table and Click **Create Lookup Table** button.

    ![Create Lookup Table2](./images2/create-lookup-tables2.png " ")

9. For Column, select **DEPARTMENT - varchar2**.

    Click **Next**.

    ![Create Department Lookup](./images2/create-department-lookup.png " ")

10. Leave the default table and sequence names:

    * New Table Name: **DEPARTMENT_LOOKUP**
    * New Sequence: **DEPARTMENT\_LOOKUP\_SEQ**

    Click **Next**.

    ![Create Department Lookup1](./images2/create-department-lookup1.png " ")

11. Click **Create Lookup Table**.

    ![Create Department Lookup2](./images2/create-department-lookup2.png " ")
    *Note: Click the **Create Lookup Table** button only once. Then you will find the new table listed in the Object Browser.*

12. To create **Clothing** lookup table, navigate back to the **Products** table and Click **Create Lookup Table** button.

    ![Create Lookup Table3](./images2/create-lookup-tables3.png " ")

13. For Column, select **CLOTHING - varchar2**.

    Click **Next**.

    ![Create Clothing Lookup](./images2/create-clothing-lookup.png " ")

14. Leave the default table and sequence names:

    * New Table Name: **CLOTHING_LOOKUP**
    * New Sequence: **CLOTHING\_LOOKUP\_SEQ**

    Click **Next**.

    ![Create Clothing Lookup1](./images2/create-clothing-lookup1.png " ")

15. Click **Create Lookup Table**.

    ![Create Clothing Lookup2](./images2/create-clothing-lookup2.png " ")
    *Note: Click the **Create Lookup Table** button only once. Then you will find the new table listed in the Object Browser.*

16. The columns COLOR, DEPARTMENT, and CLOTHING in the **Products** table are renamed to COLOR\_ID, DEPARTMENT\_ID, and CLOTHING\_ID respectively, and their data type changed to NUMBER. Also, there are new tables containing the values of the products:
    - COLOR_LOOKUP
    - DEPARTMENT_LOOKUP
    - CLOTHING_LOOKUP

The numeric value of the COLOR\_ID column will now store a reference to the system-assigned unique id of a particular color, whose name is stored in the new COLOR\_LOOKUP table. Similarly, the DEPARTMENT\_ID column references the id of a row in the DEPARTMENT\_LOOKUP table and CLOTHING\_ID references the id of a row in the CLOTHING\_LOOKUP table.    


![Lookup table results](./images2/lookup-table-results.png " ")

You now know how to add new columns to your existing tables, how to create lookup tables for reference information, and how to create and run a SQL script to populate your tables. You may now **proceed to the next lab**.

## **Acknowledgments**

- **Author** - Roopesh Thokala, Product Manager
- **Last Updated By/Date** - Roopesh Thokala, Product Manager, March 2022
