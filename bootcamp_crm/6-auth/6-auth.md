# Implement Custom Authentication and Role-Based Authorization

## Introduction

In this lab, you will implement a fully custom authentication and role-based authorization framework in your Oracle APEX application.

You will create database tables for users and roles, build a custom authentication scheme, and configure dynamic role-based authorization using APEX authorization schemes.

Estimated Time: 20 minutes

### Objectives

By the end of this lab, you will be able to:

- Create Custom Authentication Scheme.

- Implement Role-based Authorization Schemes.

- Configure Page-level and component-level authorization.

### Downloads

Stuck or Missed out on completing the previous labs? Don't worry! You can download the following application:

**[Click here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles%2FWorking-with-External-Data-Sources.sql)** to download the completed application till Lab 5. Follow the [Appendix lab](?lab=8-appendix) for steps to import and install the downloaded app.

## Task 1: Create a SQL Script

In this task, you will create the database objects required to support authentication and role management. You will then configure a custom authentication scheme that uses a PL/SQL package to validate users.

1. Navigate to **SQL Workshop** and click **(V)**. Select **SQL Scripts**.

    ![display project dashboard page](images/sql-scripts.png " ")

2. Click **Create**.

    ![display project dashboard page](images/create-script.png " ")

3. For **Script Name**: Enter **Users & Roles**. Download the SQL script:[users-and-roles.sql](files/users-and-roles.sql) and copy and paste the code in the Code editor.


4. Click **Run** in the Script Editor.

    !["provide script name"](images/paste-script.png "")

5. Click **Run Now** to submit the script for execution.

    !["run now"](images/run-now.png "")

6. The Manage Script Results page appears listing script results.

    !["data model created"](images/statements.png "")

    *Note: Do NOT click Create App yet, as you will creating an app in the upcoming lab using Generative AI.*

7. Navigate to **App Builder**.

    !["data model created"](images/app-builder.png "")

8. Select **Customer Hub** application.

    !["data model created"](images/customer-hub.png "")

9. Select **Shared Components**.

    !["data model created"](images/sc4.png "")

10. Under Security, select **Authentication Schemes**.

    !["data model created"](images/auth-sch.png "")

11. Click **Create**.

    !["data model created"](images/create-auth-sch.png "")

12. Leave as default and click **Next**.

    !["data model created"](images/next.png "")

13. Enter/select the following details:

    - Under Name:

        - Name: **Custom AuthN**

        - Scheme Type: **Custom**

    - Settings > Authentication Function Name: **CRM\_AUTH.AUTHENTICATE\_USER**

14. From the right-hand side task list, enable **Stay on Page**.

15. Click **Create Authentication Scheme**.

    !["data model created"](images/custom-authn.png "")

16. Click **Make Current Scheme**.

    !["data model created"](images/make-current.png "")

17. Click **OK** to confirm.

    !["data model created"](images/confirm.png "")

## Task 2: Create a User Management Page

In this task, you will create an Interactive Report with an associated form page to manage application users stored in the CRM_USERS table. You will also hide sensitive columns to ensure secure data handling.

1. Navigate to **Application ID**. Your application ID might differ.

    !["data model created"](images/app-id.png "")

2. Click **Create Page**.

    !["data model created"](images/create-page.png "")

3. Select **Interactive Report**.

    !["data model created"](images/ir.png "")

4. Enter/select the following details:

    - Name : **Manage Users**

    - Inculde Form Page: Toggle **On**

    - Form Page Name : **Manage Users**

    - Data Source > Table: **CRM_USERS**

    Click **Next**.

    !["data model created"](images/ir-details.png "")

5. Click **Create Page**.

    !["data model created"](images/create-page1.png "")

6. In the left pane, select the following columns and change the type to **Hidden**.

    - PASSWORD_HASH
    - PASSWORD_SALT
    - PASSWORD_PLAIN
    - ROW_VERSION
    - CREATED_ON
    - CREATED_BY
    - UPDATED_ON
    - UPDATED_BY

    !["data model created"](images/hide-items.png "")

    !["data model created"](images/hide-items2.png "")

7. Click **Save and Run**.

    !["data model created"](images/save-run6.png "")

8. From the developer toolbar, navigate to Manage Users form page and make the below items as **Hidden**:

    >Note: Page Number might differ.

    - P7\_PASSWORD\_HASH
    - P7\_PASSWORD\_SALT
    - P7\_ROW\_VERSION
    - P7\_CREATED\_ON
    - P7\_CREATED\_BY
    - P7\_UPDATED\_ON
    - P7\_UPDATED\_BY

9. Click **Save**.

10. Logout and login again with username: **Admin** and Password: **Welcome123!**

    !["data model created"](images/admin-login.png "")

11. Explore the newly created page: Manage Users and logout from the application.

    !["data model created"](images/manage-users-nav.png "")

## Task 3: Implement Role-Based Authorization (Admin Access)

Now that the authentication is working, you will configure dynamic role-based authorization. You will create an authorization scheme for the Admin role and restrict access to the **Manage Users** page and navigation menu.

1. Navigate back to Page designer and go to **Shared Components**.

    !["data model created"](images/sc5.png "")

2. Under Security, select **Security Attributes**.

    !["data model created"](images/security-att.png "")

3. Under Authorization > Source for Role or Group Schemes: Select **Custom Code**. Click **Apply Changes**.

    !["data model created"](images/custom-code.png "")

4. Under Security, select **Authentication Schemes**.

    !["data model created"](images/auth-sch2.png "")

5. Select **Custom AuthN**.

    !["data model created"](images/custom-authn1.png "")

6. Under Login Processing, for **Post- Authentication Procedure Name**, enter **CRM\_AUTH.POST\_AUTH** and click **Apply Changes**.

    !["data model created"](images/post-auth.png "")

7. Navigate to **Shared Components**.

    !["data model created"](images/sc6.png "")

8. Under Security, select **Authorization Schemes**.

    !["data model created"](images/authz.png "")

9. Click **Create**.

    !["data model created"](images/create-authz.png "")

10. Leave as default and click **Next**.

    !["data model created"](images/authz-next.png "")

11. Enter/select the following:

    - Name : **CRM Admin**

    - Scheme Type : **Is in Role or Group**

    - Type : **Custom**

    - Name(s) : **Admin**

    Click **Create Authorization Scheme**.

    !["data model created"](images/create-authz1.png "")

12. From the top-right corner, click **Edit Page 7**.

    >Note: Page number may vary depending on your application.

    !["Click App Builder"](images/edit-page-7.png "")

13. In the right pane, update the following:

    - Security > Authorization Scheme: **CRM Admin**

    !["Click App Builder"](images/authz-page.png "")

14. Click **Save**.

    !["Click App Builder"](images/save6.png "")

15. Navigate to **Shared Components**.

    !["Click App Builder"](images/sc7.png "")

16. Under Navigation and Search, select **Navigation Menu**.

    !["Click App Builder"](images/nav-menu.png "")

17. Select **Navigation Menu**.

    !["Click App Builder"](images/nav-menu1.png "")

18. Navigate to **Manage Users**.

    !["Click App Builder"](images/manage-users3.png "")

19. Under Authorization > Authorization Scheme: Select **CRM Admin**. Click **Apply Changes**.

    !["Click App Builder"](images/nav-authz.png "")

20. Click **Save and Run**.

    !["Click App Builder"](images/save-run7.png "")

21. Now first login as **Admin/Welcome123!** – you see Manage Users is accessible. Logout and Login as other user:
    **rpatel/Welcome123!**. You wont see Manage Users entry.

## Task 4: Implement Component-Level Authorization (Viewer Restrictions)

In this task, you will create another authorization scheme for the **Viewer** role and restrict specific functionality (such as the Create button) based on role membership.

This demonstrates component-level authorization control.

1. In the Page designer, navigate to **Shared Components**.

    !["data model created"](images/sc8.png "")

2. Under Security, select **Authorization Schemes**.

    !["data model created"](images/authz2.png "")

3. Click **Create**.

    !["data model created"](images/create-authz2.png "")

4. Leave as default and click **Next**.

    !["data model created"](images/authz-next.png "")

5. Enter/select the following:

    - Name : **CRM Viewer**

    - Scheme Type : **Is in Role or Group**

    - Type : **Custom**

    - Name(s) : **Viewer**

    Click **Create Authorization Scheme**.

    !["data model created"](images/crm-viewer.png "")

6. The user with Viewer role should be allowed to create Opportunities.

7. Navigate to **Application ID**.

    !["data model created"](images/app-id1.png "")

8. Go to Opportunities Report page. Page Name might differ in your application. In my case, it is Opportunity Follow Up.

    !["data model created"](images/opportunity.png "")

9. In the left pane, select **Create** button. In the right pane, update the following:

    - Security > Authorization Scheme: Select **{Not CRM Viewer}**

    Click **Save**.

    !["data model created"](images/not-crm-viewer.png "")

10. Now, let's test the Authorization for Viewer. Login as **sgupta** and password **Welcome123!**. Verify that the Create button is not displayed for this user.

    !["data model created"](images/sgupta.png "")

    !["data model created"](images/create-btn-n.png "")

## Summary

In this lab, you:

- Created a custom CRM user and role tables.

- Built a PL/SQL authentication package.

- Configured a Custom Authentication Scheme in Oracle APEX.

- Enabled dynamic role-based authorization.

- Restricted access to pages and navigation entries.

- Applied component-level authorization to buttons.

- Tested authentication and authorization using multiple roles.

Your application now supports a secure, role-driven authentication and authorization model using custom database logic.

## Acknowledgements

- **Author** - Ankita Beri, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Senior Product Manager, February 2026
