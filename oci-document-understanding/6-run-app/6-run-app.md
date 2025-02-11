# Run the Application

## Introduction

In this lab, you will run the Automatic Invoice Handling application and perform OCI Document Understanding on uploaded invoices.

Estimated Time: 2 Minutes

### Objectives

In this lab, you:

- Run the Application

## Task 1: Run the Application

1. From your Application home page, click **Run Application**.

    ![Task Definition in Shared Components](images/run-application.png " ")

2. Log in as one of the users you created in lab 2: **Clara, John, Jane, or Matt**. For example, I have log in as JOHN.

    ![Task Definition in Shared Components](images/login-as-john.png " ")

3. Upload invoices by selecting **Select an Invoice or Receipt** and clicking **Process Document**. OCI Document Understanding will extract invoice fields from the uploaded image or PDF file.

    Download the following sample invoices to upload:

    - [Sample Invoice 1](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FInvoice%201.pdf)

    - [Sample Invoice 2](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FInvoice%202.pdf)

    ![Task Definition in Shared Components](images/process-doc.png " ")

4. After uploading, you will be redirected to the **Invoice Tracker** page, where you can view all your invoices as well as those uploaded by others.

    ![Task Definition in Shared Components](images/invoice-tracker.png " ")

5. Click on an invoice card to open the **Invoice Analysis** dialog page, where you can compare your uploaded PDF with the output from OCI Document Understanding.

    ![Task Definition in Shared Components](images/invoice-analysis.png " ")

6. Navigate to **Initiated by Me** to view all invoices uploaded by JOHN.

    ![Task Definition in Shared Components](images/initiated-by-me1.png " ")

7. Now, log in as CLARA to approve invoice requests by JOHN. Navigate to **My Approvals** page, where you can view all invoices that require your approval.

    ![Task Definition in Shared Components](images/my-approvals1.png " ")

## Summary

You now know how to run the Automatic Invoice Handling application and obtain results using Oracle APEX and OCI Document Understanding for uploaded invoices.

## Acknowledgements

- **Author(s)** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, January 2025
