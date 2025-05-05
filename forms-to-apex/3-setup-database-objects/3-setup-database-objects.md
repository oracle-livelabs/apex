# Setup the Database objects

## Introduction

In this lab, you will create database objects that will be utilized by the APEX environment. The lab involves downloading and running SQL scripts to set up the necessary database schema and populate it with sample data. These steps are foundational for creating an APEX application that leverages these database objects.

Estimated Time: 5 Minutes

### Objectives

- Upload and run the provided SQL scripts in the SQL Workshop to create database schema and insert sample data.

### Download Sample Scripts

To create database objects, you need to download the following three files:

- [labfiles\_forms\_ddl.sql](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2Fforms_ddl.sql) as sample DDL script.

- [labfiles\_forms\_data\_insert.sql](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2Fforms_data_insert.sql) as sample data insert script.

- [labfiles\_pkg\_modernization.sql](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles_pkg_modernization.sql) as a package script.

## Task 1: Create Database Objects in APEX Workspace

1. Log in to your APEX Workspace.

2. On APEX Workspace, click **SQL Workshop** and select **SQL Scripts**.

    ![SQL Scripts](images/sql-scripts.png " ")

3. Click **Upload**. Now upload the previously downloaded scripts one after the other into the file(**forms\_ddl.sql**, **forms\_data\_insert.sql** and **pkg_modernization.sql**) and click **Upload**.

    ![Upload SQL Scripts](images/upload-script.png " ")

    ![DDL form Conversion](images/forms-ddl.png " ")

    ![Data Insert File](images/forms-data-insert.png " ")

    ![Data Insert File](images/pkg.png " ")

4. The three scripts are now uploaded to the SQL Scripts workspace page. You need to run them to create and populate the database objects. At the **forms\_ddl.sql** script level, click the run arrow under the label **Run** and then **Run Now** to confirm.

    ![Data Insert File](images/run-forms-ddl.png " ")

    ![Data Insert File](images/run-now-forms-ddl.png " ")

5. Object creation script output is visible on the page after execution. You can see the total number of statements executed and the total number of errors encountered (see "Statements Processed", "Successful" and "With Errors").

    ![Data Insert File](images/scripts.png " ")

6. Now click **SQL Scripts** and run the second script to populate the tables, **forms\_data\_insert.sql** under **Run** label and then **Run Now**.

     ![Data Insert File](images/sql-script.png " ")

    ![Data Insert File](images/run-data-insertt.png " ")

    ![Data Insert File](images/run-now-data-insertt.png " ")

7. You can see the data load results in the execute script output.

    ![Data Insert File](images/successful-data-insert.png " ")

    *Note: Check this population script in advance as probably a proper date format setting (i.e., “MM/DD/YYYY” instead of DD/MM/YYYY”) would be needed to load data without errors.*

8. Click **SQL Scripts** and run the third script to create a package, **pkg_modernization.sql** under **Run** label and then **Run Now**.

    ![Data Insert File](images/run-pkg.png " ")

    ![Data Insert File](images/run-now-pkg.png " ")

9. Navigate to **SQL Workshop** and select **Object Browser** to view the tables and the created objects. On the right tab, under **Table**, click **S\_CUSTOMER**.

    ![Data Insert File](images/navigate-object.png " ")

10. The screenshot below shows the details of the table created, from the table column structure to the populated data, from the triggers to the created constraints.

    ![Data Insert File](images/customer-data.png " ")

## Summary

Now that the workspace has been populated with database objects and data content, we can proceed to the next lab creating an APEX application using these database objects.

## Acknowledgements

- **Author** - Monica Godoy, Senior Principal Product Manager ; Ankita Beri, Product Manager; Paolo Paolucci, Data Development Specialist; Victor Mendo, Data Development Specialist
- **Last Updated By/Date** - Ankita Beri, Product Manager, January 2025
