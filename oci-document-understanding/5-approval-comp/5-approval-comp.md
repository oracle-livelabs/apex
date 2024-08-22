# Implement Invoice Approval Requests Using Approvals Component

## Introduction

This lab will walk you through creating a Task Definition for Invoice Approval Requests. Additionally, you'll set up two processes to fetch employee details and manage human-task approval. Furthermore, you'll create two unified task list pages—one for initiated tasks and another for tasks assigned to you.

Estimated Time: 15 Minutes

### Objectives

In this lab, you:

- Create a Task Definition
- Develop a Process to Fetch Employee details and manage human-task approval
- Create Unified Task Lists

## Task 1: Create a Task Definition

1. Navigate to **Shared Components**.

   ![Task Definition in Shared Components](images/sc-8.png " ")

2. Under **Workflows and Automations**, select **Task Definitions**.

   ![Select Task Definition](images/task-def.png " ")

3. Click **Create**.

   ![Create Task Definition](images/task-def-create.png " ")

4. Enter/select the task definition attributes and Click **Create**.

    - Name: **Invoice Approval Request**

    - Subject: **Employee Request of &EMP\_NAME.**

    ![Click Create on Task Definition page](images/task-def-details.png " ")

5. Under **Settings**:

    - Task details Page Number - Click **Create Task Details Page** and Click **OK**

    ![Click Task Definition](images/task-create-details.png " ")

    ![Click Task Definition](images/task-create-ok.png " ")

6. Click task definition - **Invoice Approval Request** to continue editing.

     ![Click on Expense Request](images/invoice-req-app.png " ")

    Under Settings:

    - Actions Source: **SQL Query**.

    - Actions SQL Query: Copy the code below and paste it into  the code editor:

    ```
    <copy>
    SELECT
      E.EMPNO,
      E.EMP_NAME,
      M.EMP_NAME AS MGR_NAME
    FROM
    EMPLOYEE_DETAILS E, EMPLOYEE_DETAILS M
    WHERE
        M.EMPNO (+) = E.MGR
        AND E.EMPNO = :APEX$TASK_PK
    </copy>
    ```

    ![Task Definition Settings](images/action-source.png " ")

7. Under **Participants**, click **Add Row** and enter/select the following:

     - Participant Type: **Potential Owner**

     - Value Type: **SQL Query**

     - Value: Copy the code below and paste it into  the code editor

     ```
     <copy>
     SELECT
        UPPER(EMP_NAME)
     FROM
     EMPLOYEE_DETAILS
     WHERE
       EMPNO = (
       SELECT
            MGR
        FROM
            EMPLOYEE_DETAILS
        WHERE
            EMPNO = (
                SELECT
                    EMPNO
                FROM
                    EMPLOYEE_DETAILS
                WHERE
                    UPPER(EMP_NAME) = UPPER(:APP_USER)
                    )
                 )
      </copy>
      ```

    ![Task Definition Participants](images/participants.png " ")

8. Under **Parameters**, click **Add Row** and enter the three parameters one after the other:

      | Static ID |  Label  | Data Type
      | --- |  --- | --- |
      | FILE\_NAME | File Name | String |
      | ID | id | String |
      | OBJECT\_STORAGE\_URL | Object Storage URL | String |
      {: title="Task Definition Parameters"}

     - Click **Apply Changes**.

    ![Task Definition Parameters](images/parameters.png " ")

10. Click **Invoice Approval Request** to continue editing.

     ![Click on Expense Request](images/invoice-req-app1.png " ")

14. Under **Actions**, click **Add Action**.

    ![Click on Expense Request](images/add-action.png " ")

15. Enter/select the following details:

     - Name: **On Approval**

     - On Event: **Complete**

     - Outcome: **Approved**

     - Success Message: **Approved!**

     - Code: Copy the code below and paste it into the code editor:

    ```
    <copy>
    DECLARE
    L_REQ_ID NUMBER;
    BEGIN
    --   if :APP_USER = :EMP_NAME then --this is the original initiator
    L_REQ_ID := :ID;
    UPDATE INV_UPLOAD
    SET
        STATUS = 'Approved'
    WHERE
        ID = L_REQ_ID;

    END;
    </copy>
    ```

    Click **Create**.

     ![Click on Expense Request](images/add-action-create.png " ")

16. Click **Apply Changes**.

## Task 2: Create a Process to Fetch Employee details

1. Navigate to **Application ID**.

    ![Click Application ID](./images/app-id8.png " ")

2. Select **1 - Home** page.

   ![Home - 1](./images/home1.png " ")

3. In the left pane, under **Pre-Rendering**, right-click **Before Header** and click **Create Process**.

   ![Create Process](./images/create-process3.png " ")

4. In the Property Editor, Enter/select the following details:

    - Identification > Name: **Fetch Employee Details**

    - Source > PL/SQL Code: Copy and paste the below code into the code editor:

    ```
    <copy>
    SELECT
    EMPNO
      INTO :P1_EMP_NO
    FROM
      EMPLOYEE_DETAILS
    WHERE
      UPPER(EMP_NAME) = UPPER(:APP_USER);
    </copy>
    ```

    - Execution > Sequence: **1**

    ![Create Process](./images/fetch-emp-details.png " ")

5. Navigate to **Processing** tab, right-click **Processing** and select **Create Process**.

    ![Create Process](./images/create-process4.png " ")

6. In the property editor, enter/select the following details:

    - Under Identification:

        - Name: **Submit Invoice**

        - Type: **Human Task - Create**

    - Under Settings:

        - Definition: **Invoice Approval Request**

        - Details Primary key item: **P1\_EMP\_NO**

    ![Create Process](./images/submit-invoice.png " ")

7. Under the **Submit Invoice** process, update the following parameters:

    | Parameter |  Value > Item | Value > Item
    | --- |  --- | --- |
    | File Name| Item | P1\_FILE\_NAME |
    | id | Item | P1\_ID |
    | Object Storage URL | Item | P1\_OBJECT\_STORAGE\_URL |
    {: title="Human Task-Create Parameters"}

    ![Create Process](./images/file-name.png " ")

    ![Create Process](./images/id-submit-inv.png " ")

8. Click **Save**.

## Task 3: Create Unified Task Lists

1. On Page Designer toolbar, navigate to **Create(+ v)** and select **Page**.

    ![Click Application ID](./images/page3.png " ")

2. Under Components, select **Unified Task List**.

    ![Select Unified Task List](./images/unified-task-list.png " ")

3. Enter/select the following page attributes:

    - Under Page Definition:

        - Page Number: **5**

        - Name: Enter **Initiated By Me**

        - Report Context: **Initiated By Me**

    - Navigation > Use Breadcrumb: **Toggle Off**

         Click **Create Page**.

    ![Click Create Page](./images/initiated-by-me.png " ")

4. In Page Designer toolbar, navigate to **Create(+)** and select **Page**.

    ![Click Create Page](./images/page4.png " ")

5. Under Components, select **Unified Task List**.

    ![Select Unified Task List](./images/unified-task-list.png " ")

6. Enter/select the following page attributes:

    - Under Page Definition:

        - Page Number: **6**

        - Name: **My Approvals**

        - Report Context: **My Tasks**

    - Navigation > Use Breadcrumb: **Toggle Off**

    Click **Create Page**.

    ![Select Unified Task List](./images/my-approvals.png " ")

7. On the Page Designer toolbar, navigate to your **Task Details** Page.

    ![Select Unified Task List](./images/navigate-to-task-details.png " ")

8. Under the **Page Rendering** tab, select **Details** region and update the following:

    - Source > SQL Query: Copy and replace the below code into the code editor:

    ```
    <copy>
    SELECT
      UPPER(PARAM_LABEL)      PARAM_LABEL,
      PARAM_VALUE,
      'Check the Comparision' LINK_TO
    FROM
      APEX_TASK_PARAMETERS
    WHERE
        TASK_ID = :P4_TASK_ID
        AND IS_VISIBLE = 'Y'
        AND UPPER(PARAM_LABEL) = 'ID';
    </copy>
    ```

    ![Select Unified Task List](./images/details.png " ")

9. Under **Details** region, select **LINK_TO** column and update the following:

    - Identification > Type: **LINK**

    - Link > Target: Click **No Defined Link**

        - Target > Page: **3**

        - Set Items > Name: **P3\_ID**, Value: **#PARAM\_VALUE#** and Click **OK**.

    Click **Save**.

    ![Select Unified Task List](./images/link-to.png " ")

## Summary

You now know how to create a Task Definition for Invoice Approval Requests. Additionally, you learned how to set up processes to fetch employee details and manage human-task approval. Furthermore, you created two unified task list pages: one for initiated tasks and another for assigned tasks.

## Acknowledgements

- **Author** - Roopesh Thokala, Senior Product Manager ; Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, June 2024
