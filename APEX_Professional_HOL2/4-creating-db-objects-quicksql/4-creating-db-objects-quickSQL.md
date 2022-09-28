# Use QuickSQL and Data Workshop

## Introduction

Memorizing the SQL to create and maintain database objects can be difficult. However, there are tools that can generate the code for you based on a shorthand syntax or a graphical user interface. In this lab, you will create database objects using Quick SQL and then view the objects in Database Actions. Then you will then use Data Workshop page to load data from a file into your workspace.

Estimated Time: 45 minutes

### Objectives

- Create database objects using Quick SQL
- Load data using Data Workshop page.


## Task 1: Create database objects using Quick SQL

1. Return to your APEX Workspace and click **'⌄'** next to **SQL Workshop** tab, then click **Utilities** and then select **Quick SQL**.

   ![Select Quick SQL](images4/navigate-to-quicksql1.png " ")

2. Copy the following SQL shorthand code and paste it into the left pane in Quick SQL.

    ```
    <copy>
    departments /insert 4
      name /nn
      location
      country
      employees /insert 14
        name /nn vc50
        email /lower
        cost center num
        date hired
        job vc255

    view emp_v departments employees
     </copy>
    ```
    *Note that the Indentation from the code you copied should be similar to the one we have in the screenshot below*
3. Review the shorthand code. How many tables will be created and how are they related? What types of columns and constraints will be created for the tables? Note that the **Help** button provides details on the shorthand syntax along with several examples of its usage.

    When ready, in the Quick SQL (left pane) toolbar, click **Generate SQL**.

   ![Generate SQL1](./images4/generate-sql1.png " ")

4. Review the SQL that is generated in the right-hand pane, then click **Settings** to make some changes to the resulting code.

   It is important to save the SQL Shorthand as a script so that it can be run in your database.
   In the SQL (right pane) toolbar, click **Save SQL Script**.  

   ![Generated SQL1](images4/generated-sql1.png " ")

5. In the Save Script dialog, for Script Name enter **Employee Department Details**, and click **Save Script**.

    ![Save SQL Script1](images4/save-sql-scripts1.png " ")

6. Now that you saved the script you can run it to create the specified database objects.

    In the SQL (right pane) toolbar, click **Review and Run**.

    ![Review and Run Quick SQL](images4/review-and-run1.png " ")

7.  In the Script Editor page toolbar, click **Run**.

    ![Run Script1](images4/running-scripts1.png " ")

8. On the Run Script page, click **Run Now**.

    ![Run Now1(images4/run-now1.png " ")

9. The Results page shows the results of running the script. Scroll to the bottom to see a summary. You should not see any errors.

    ![SQL Script Results](images4/results.png " ")

10. To view the database objects that were created, click the arrow  **'⌄'** in the **SQL Workshop** tab and then select **Object Browser**.

    ![Select Object Browser1](images4/navigate-to-object-browser1.png " ")

11. Select the **EMPLOYEES** table and review its columns.

    ![Select Departments table](images4/select-departments-table.png " ")

12. Click the **Data** tab to see the data that was loaded.

    ![View department table](images4/view-departments-table-data1.png " ")

## Task 2: Load data using the Data Workshop Utility

In this step, you will learn how to create a table and Load data using the Data Workshop utility.

1. On the Workspace home page, click the **'⌄'** next to **SQL Workshop** tab, then click **Utilities** and then select **Data Workshop**.

   ![Select Data Workshop](images4/navigate-to-data-workshop1.png " ")

2. Under Get Started, click **Load Data**. The Load Data Wizard appears.

   ![Click Load Data](images4/click-data-load1.png " ")

3. Under Upload a File, Click **Choose File**.

   ![Click choose file](images4/choose-file-to-load1.png " ")

4. Download [projects.csv](projects.csv) and select the file.

   ![Select file](images4/select-appropriate-file1.png " ")

  *Note: If the uploaded XLSX file contains multiple worksheets, Load Data wizard picks the first sheet by default. To load another sheet, pick it from the Select Sheet select list. The First lines contains headers checkbox works similar to CSV files. The same is true for the Configure dialog, the behaviour is the same as it is for CSV files. Uploading XLSX files is limited to 20MB for each file.*

5. Under **Load Data**, Edit the Table Name field and provide an appropriate name. In this lab, you will set the Table Name as **Projects**. Then Click **Load Data**

   ![Load data](images4/load-data1.png " ")

6. Once Data Loading is finished, a success message is displayed. If some rows cannot be loaded to the target table, they will be stored to the error table and error table is displayed. Then click **View Table**.

   ![Data loaded successfully](images4/data-loaded-successfully.png " ")

7. Select the **PROJECTS** table and review its columns.

    ![Select table Projects](images4/navigate-to-table1.png " ")

8. Click the **Data** tab to see the data that was loaded.

    ![View table Projects](images4/view-projects-table-data1.png " ")

## Summary

This completes the Lab. At this point, you know how to use Quick SQL to generate database objects using a SQL shorthand. You also know how to use Data Workshop utility to load data.

## Acknowledgements
* **Author** - Roopesh Thokala, Product Manager
* **Contributors** -
- **Last Updated By/Date** - Roopesh Thokala, Product Manager, March 2022
