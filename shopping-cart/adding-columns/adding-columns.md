# Add columns to the products table

## Introduction

The **PRODUCTS** table includes some columns such as image, price, and details. But there are other characteristics that customers would appreciate knowing about the product, like color, type of clothing, and department. For that reason, you will add these columns to the Products table.
To avoid data redundancy, you will need to create three additional tables to normalize the data. Instead of creating these three tables for yourself, you'll use the **Create Lookup Table** feature.

In this lab, you will learn how to add these three new columns to the **PRODUCTS** table and then create lookup tables for those new columns.

Estimated Time: 10 minutes

<!--
Watch the video below for a quick walk through of the lab.

[](youtube:klrFD971TtI)
-->
Watch the video below for a quick walk-through of the lab.
[Add Columns to the Products Table](videohub:1_ozrqd1x1)

### Objectives
In this lab, you will:
- Add new columns to the existing Products table
- Populate the new columns
- Create lookup tables

## Task 1: Add Columns to the Products Table

1. From your APEX workspace home page, click **SQL Workshop**.

2. Click **Object Browser**.

3. Navigate to **PRODUCTS** table and click **Add Column** button.

    ![Table view in the Object Browser](./images/products.png " ")

4. For **Color** column, enter the following:

    * Column - enter **COLOR**
    * Data Type - select **VARCHAR2**
    * Length - enter **200**.

    Click **Apply**.

    ![Add Column wizard](./images/color-column.png " ")

5. Click **Add Column** button again.

6.  For Department column, enter the following:

    * Column - enter **DEPARTMENT**
    * Data Type - select **VARCHAR2**
    * Length - enter **200**.

    Click **Apply**.

    ![Add Column wizard](./images/department-column.png " ")

7. Click **Add Column** button again.

8. For Clothing column, enter the following:

    * Column - enter **CLOTHING**
    * Data Type - select **VARCHAR2**
    * Length - enter **200**.

    Click **Apply**.

    ![Add Column wizard](./images/clothing-column.png " ")

## Task 2: Populate the new columns

1. From the Oracle APEX Home, click **SQL Workshop** and select **SQL Scripts**.

    ![SQL Scripts page in SQL Workshop](./images/sql-scripts.png " ")

3. Click **Create**.

  ![SQL Scripts page in SQL Workshop](./images/create-sql-script.png " ")

4. For Script Name, enter **Populating new columns**.
   Copy the following script and paste into the editor.
    ```
    <copy>
    UPDATE
    products
    SET    clothing = Substr(product_name, Instr(product_name, ' ',1,1)+1, Instr(product_name, ' ',1, 2)+1 - Instr(product_name, ' ',1,1)- 2),
    color = json_value(product_details,'$.colour'),
    department = json_value(product_details,'$.gender')
    ```

    This script inserts the unique product type values (e.g. Shirt, Jacket, Skirt, etc.) into the CLOTHING column in the **Products** table. Similary, it inserts the unique department names (e.g. Boy's, Girl's, Men's, Women's) and color names into the DEPARTMENT and COLOR columns respectively based on information found in the JSON product details column in the **Products** table.

    Click **Run**.

    ![SQL Scripts page with Run and Save buttons](./images/insert-code.png " ")

6. Click **Run Now**.

    ![SQL Script with Run Now button](./images/create-script.png " ")

7. The Script Results page is displayed listing the number of statements processed, successful, and with errors.

    ![Script Results page is displayed](./images/script-results.png " ")

8. To check the values in the Products table, click **SQL Workshop** and click **SQL Commands**.

    ![SQL Commands page under SQL Workshop](./images/sql-commands.png " ")

9. Copy the following SQL Query and click **Run**.
    ```
    <copy>
    SELECT p.product_name,
           p.unit_price,
           p.color,
           p.department,
           p.clothing
    FROM   products p;
    ```

    ![SQL Code Editor](./images/sql-query-results.png " ")

## Task 3: Create Lookup Tables
Multiple products may have the same values for Color, Department, and Clothing. Hence, to avoid repetition and make updates easy, you can create a lookup table for each. A lookup table stores the value of the available colors, departments, or clothing in a single place, and then each product can reference the value from the lookup table.

You will create lookup tables based on the new three columns, after you will have created a lookup table, you will notice that a new table was created and the column in the PRODUCTS table has been renamed and the data type was changed to NUMBER.

1. From your APEX workspace home page, click **SQL Workshop**.

2. Click **Object Browser**.

3. Navigate to **PRODUCTS** Table.

4. Click **More** and Select **Create Lookup Table** button.

    ![Table view in the Object Browser](./images/lookup-table.png " ")

5. For Text Column, select **COLOR**. Click **Create Lookup Table**.

    ![Create Lookup Column wizard](./images/lt-color.png " ")

    *Note: Click the **Create Lookup Table** button only once. Then you will find the new table listed in the Object Browser.*

6. To create **Department** lookup table, navigate back to the **Products** table and Click **More** , Select **Create Lookup Table** button.

    ![Create Lookup Column wizard](./images/lookup-table2.png " ")

7. For Text Column, select **DEPARTMENT**. Click **Create Lookup Table**.

    ![Create Lookup Column wizard](./images/lt-department.png " ")

    *Note: Click the **Create Lookup Table** button only once. Then you will find the new table listed in the Object Browser.*

8. To create **Clothing** lookup table, navigate back to the **Products** table and Click **More**, Select **Create Lookup Table** button.

    ![Create Lookup Column wizard](./images/lookup-table3.png " ")

    *Note: Click the **Create Lookup Table** button only once. Then you will find the new table listed in the Object Browser.*

9. For Text Column, select **CLOTHING**. Click **Create Lookup Table**.

    ![Create Lookup Column wizard](./images/lt-clothing.png " ")


10. The columns COLOR, DEPARTMENT, and CLOTHING in the **Products** table are renamed to COLOR\_ID, DEPARTMENT\_ID, and CLOTHING\_ID respectively, and their data type changed to NUMBER. Also, there are new tables containing the values of the products:
    - COLOR_LOOKUP
    - DEPARTMENT_LOOKUP
    - CLOTHING_LOOKUP

The numeric value of the COLOR\_ID column will now store a reference to the system-assigned unique id of a particular color, whose name is stored in the new COLOR\_LOOKUP table. Similarly, the DEPARTMENT\_ID column references the id of a row in the DEPARTMENT\_LOOKUP table and CLOTHING\_ID references the id of a row in the CLOTHING\_LOOKUP table.    


![PRODUCTS table view in the Object Browser](./images/lookup-table4.png " ")

You now know how to add new columns to your existing tables, how to create lookup tables for reference information, and how to create and run a SQL script to populate your tables. You may now **proceed to the next lab**.

## Acknowledgments

- **Author** - Apoorva Srinivas, Senior Product Manager; Mónica Godoy, Principal Product Manager;
- **Last Updated By/Date** - Ankita Beri, Product Manager, May 2023
