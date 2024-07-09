# Setup the Database objects

## Introduction
In this Lab, we undertake the creation of database objects that will be then used by the APEX environment and especially by the Application.

## Download Sample Scripts
In order to create database objects we need to download the following two files:
-	[Forms_conversion_ddl.sql](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/developer-library/forms_conversion_ddl.sql) as sample DDL script.
-	Forms_conversion_data_insert.sql as sample data insert script.
Download the Sample Forms: [https://apex.oracle.com/go/sample-forms](https://apex.oracle.com/go/sample-forms)

## Task 1: Create Database Objects into APEX Workspace

1. Login into your APEX Workspace.

2. On APEX Workspace, Click **SQL Workshop** and select **SQL Scripts**.

    ![SQL Scripts](images/sql-scripts.png " ")

3. Click **Upload**. Now upload previously downloaded scripts one after the other into file(**forms_conversion_ddl.sql** and **forms_conversion_data_insert.sql**) and Click **Upload**.

    ![Upload SQL Scripts](images/upload-script.png " ")

    ![DDL form Conversion](images/form-conversion-ddl-file.png " ")

    ![Data Insert File](images/data-insert-file.png " ")

4.	The two scripts are now uploaded to SQL Scripts Workspace page. Now you need to run them to create and populate the database objects. At **forms_conversion_ddl.sql** script level, Click the orange arrow under the label **Run** and then **Run Now** to confirm.

    ![Data Insert File](images/run-ddl.png " ")

    ![Data Insert File](images/run-now-ddl.png " ")

5.	Objects creation Script output is visible on the page after the execution. You can see total statements executed and total errors encountered (see “Statements Processed”, “Successful” and “With Errors”.

    ![Data Insert File](images/successful-ddl.png " ")


6.	Now click **SQL Scripts** again and run the second script to populate the tables, **forms_conversion_data_insert.sql** under **Run** label and then **Run Now**.

    ![Data Insert File](images/run-data-insert.png " ")

    ![Data Insert File](images/run-now-data-insert.png " ")

7. You can see the data load results in the execute script output.

    ![Data Insert File](images/successful-data-insert.png " ")

    *Note: Check this population script in advance as probably a proper date format setting (ie: “MM/DD/YYYY” instead of DD/MM/YYYY”) would be needed in order to load data without errors.*

8. Navigate to **SQL Workshop** and select **Object browser** to view the tables and the created objects. On the right tab, under Table, click **S_CUSTOMER**.

    ![Data Insert File](images/object-browser.png " ")

    ![Data Insert File](images/customer-data.png " ")

9. You can see the details of the created table from the table column structure to the populated data, from the triggers to created constraints as in this picture below.

## Summary
Now that the workspace has been populated with database objects and data content, we can proceed to the next step in which an APEX Application can be created using these database objects.
