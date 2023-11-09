# Manage Task Definitions

## Introduction

In this lab, you add a new column (HR Manager) in the *EMPLOYEE\_DETAILS* table and insert two new employees (Sophie and Robin) as HR managers. Next, you update the task definition and add further actions for requesting more information and delegating the request to the potential owner.

Estimated Time: 10 minutes

### Objectives

In this lab, you will:
- Update the table definition and insert new data
- Update Task Definition
- Add multiple events for an Expense Request
- Run and Explore an application

## Task 1: Update the EMPLOYEE_DETAILS table

1. Navigate to SQL Workshop and click **SQL Commands**.

   ![SQL Commands](./images/sql-commands1.png " ")

2. Copy and Paste the below commands into the Script Editor and run it one by one to update the **EMPLOYEE\_DETAILS** table

   **Note: The steps to create and populate the table EMPLOYEE\_DETAILS are shared in Lab 1: TASK 2. Ensure that you have the table created and populated before running the commands below.**

   Add a new column HR\_MGR (HR Manager) to the existing EMPLOYEE\_DETAILS table and update the existing Employee records as shown below:
    ```
    <copy>
    insert into EMPLOYEE_DETAILS(empno, emp_name) values (50, 'SOPHIE');

    insert into EMPLOYEE_DETAILS(empno, emp_name) values (60, 'ROBIN');

    Alter table "EMPLOYEE_DETAILS" add "HR_MGR" VARCHAR2(10);

    Update EMPLOYEE_DETAILS set HR_MGR = 'SOPHIE' where EMPNO in  (10,20);

    Update EMPLOYEE_DETAILS set HR_MGR = 'ROBIN' where EMPNO in  (30,40);
    </copy>
    ```

    ![SQL Commands](./images/sql-commands2.png " ")

    *NOTE: Don't forget to create two new Users, SOPHIE (SOPHIE@email.com) and ROBIN (ROBIN@email.com), using the Manage Users And Groups menu option under Workspace Administration as done in Lab 1: Task 3.*

    ![Create Users](./images/create-users1.png " ")

## Task 2: Update Task Definition
We will further extend the Expense Tracker Application to see how tasks could be assigned to multiple potential owners and then explore possible actions(Request Information / Delegate / Release) that these potential owners perform on the task.

1. Navigate to App Builder.

    ![App Builder](./images/app-builder11.png " ")

2. Select **Expense Tracker application**.

    ![Expense Tracker](./images/expense-tracker2.png " ")

3. Select Shared Components.

    [Shared Component](./images/sc2.png " ")

4. Under Workflows and Automations, Select **Task Definitions**.

    ![Edit Expense Request](./images/edit-td.png " ")

5. Select the **Expense Request** Task Definition.

    ![Click Task definition - Expense request](./images/edit-td-name.png " ")

6. Under **Actions** - Edit **NEXT\_APPROVER\_OR\_UPDATE\_STATUS**.

    ![Actions - Expense request](./images/edit-actions.png " ")

    Copy the code below and paste it into the code editor:

    ```
    <copy>
    declare
    l_mgr number;
    l_task_id number;
    l_request_id number;
    l_req_status varchar2(10) :='PENDING';
    begin
       select mgr into l_mgr from employee_details where emp_name=:APP_USER;
    if :APP_USER = :MGR_NAME then --this is the first approver
       -- set the request id to be the id of the task created when the request was submitted
       l_request_id := :APEX$TASK_ID;
    else
       -- this is an intermediate approver, set the request id from the corresponding task parameter value
       l_request_id := :REQ_ID;
    end if;
    if l_mgr is null or :ESTIMATED_COST < 50000 then -- the approval is complete

        update EMP_EXPENSE_REQUEST set status = 'APPROVED', updated_by=updated_by||'->'||:APP_USER
         where req_id = l_request_id and emp_no=:APEX$TASK_PK;
         l_req_status := 'APPROVED';
    else -- the request needs to go through another level of approval
        -- updated the request record with details of the current approver in the chain of approvers
        update EMP_EXPENSE_REQUEST set updated_by = updated_by||'->'||:APEX$TASK_OWNER
         where req_id = l_request_id
           and emp_no=:APEX$TASK_PK;
        -- create a new task assigned to the manager of the current approver
        l_task_id := apex_approval.create_task(
            p_application_id => :APP_ID,
            p_task_def_static_id => 'EXPENSE_REQUEST',
            p_initiator => :EMP_NAME, -- ensure initiator is the original requestor and not the current task owner
            p_parameters => apex_approval.t_task_parameters(
                1 => apex_approval.t_task_parameter(static_id => 'EXPENSE_TYPE', string_value => :EXPENSE_TYPE),
                2 => apex_approval.t_task_parameter(static_id => 'ESTIMATED_COST', string_value => :ESTIMATED_COST),
                3 => apex_approval.t_task_parameter(static_id => 'REQ_ID',      string_value => l_request_id),
                4 => apex_approval.t_task_parameter(static_id => 'STATUS',      string_value => l_req_status)
        ),
        p_detail_pk => :APEX$TASK_PK
    );
    end if;
    end;
    </copy>
    ```
    Click **Apply Changes**

    ![Code - Expense request](./images/edit-code.png " ")

7. **Under Participants** section, click **Add Row**.

    - For Participant Type: Select **Potential Owner**

    - For Value Type: Select **SQL Query**

    - For Value: Copy the code below and  paste it into the code editor:

    ```
    <copy>
    select HR_MGR from EMPLOYEE_DETAILS where EMPNO = :APEX$TASK_PK
    </copy>
    ```

    Click **Apply Changes**.

    ![Add participant](./images/td-participants-add-row.png " ")

    **Note :Adding the new Participant entry implies that for each employee, the approver of the Expense is either the manager he/she reports to or his/her HR Manager. In this example, if Clara was applying for an expense, the task could be approved by either her manager Jane or her HR Manager Sophie.**

## Task 3: Add Delegate, Request Info and Expire Events for an Expense Request
 We now essentially have a scenario where there can be more than one potential owner of an expense request task. This will help us to add operations like Claim, Release, and Delegate that can be performed on tasks with more than 1(>1) potential owner(s).

1. Under **Actions** Section: Click **Add Action**

    - For Name: Enter **DELEGATE\_EXPENSE\_REQUEST**

    - For Type: Select Execute Code

    - On Event: Select **Delegate**

    - For Success Message: Enter **Request Delegated Successfully**

    - For Code: Copy the code below and paste it into  the code editor:

    ```
    <copy>
    begin
    apex_approval.add_to_history ('Request Delegated by '|| :APEX$TASK_OWNER);
    end;
    </copy>
    ```
    - Click **Create** to add action.

    ![Add action - delegate](./images/td-4-action.png " ")

    ![Add action - delegate details](./images/td-delegate.png " ")

2. Again click **Add Action** to request information.

    - For Name: Enter **REQUEST\_MORE\_INFO**

    - For Type: Select Execute Code

    - On Event: Select **Request Information**

    - For Success Message: Enter **Information Requested Successfully**

    - For Code: Copy the code below and paste it into  the code editor:
    ```
    <copy>
    begin
    apex_approval.add_to_history ('Information Requested From '|| :APEX$TASK_OWNER);
    end;
    </copy>
    ```
    - Click **Create** to add action.

  ![Add Action - Request Info](./images/td-5-action.png " ")

  ![Add Request Info details and click Create](./images/td-request-info.png " ")

3. Under the **Actions** Section - click **Add Action**
   Specify the following attributes:

    - For Name: Enter **BEFORE\_EXPIRY**

    - For Type: Select **Send Email**

    - On Event: Select **Before Expire**

    - For Before Expire Interval: Enter **PT25M**

    - For Success Message: Enter **Task will expire in 5 minutes**

   Under **Send Email Settings** Section:

    - For From: Enter the Email address of your wish

    - For To: Enter the Email address of your wish

    - For Email Template: Select **BEFORE EXPENSE EXPIRY EMAIL**

    ![Add Action - Before Expire](./images/td-6-action.png " ")

4. Click the **Set Placeholder Values** button beside the email template.

   Add a Column or Value for mentioned Placeholders and click **Save** to add placeholders.

   | Placeholder|  Column or Value  |
   | --- |  --- |
   | APEX\_TASK\_SUBJECT | &APEX$TASK\_SUBJECT. |
   | APEX\_TASK\_OWNER | &APEX$TASK\_OWNER. |
   | EMP\_NAME | &EMP_NAME. |
   | APPROVAL\_URL | Paste the Login URL of your Expense Tracker Application |

5. Click **Create** to save an action.

   ![Create action before expiry](./images/td-before-email.png " ")

6. To add Expire event, click on **Add Actions** and specify the following attributes:

    - For Name: Enter **TASK_EXPIRED**

    - For Type: Select Execute Code

    - For Execution Sequence: 70

    - On Event: Select **Expire**

    - For Success Message: Enter **Task Expired Successfully**

    - For Code: Copy the code below and paste it into the code editor:

    ```
    <copy>
    begin
    apex_approval.add_to_history( 'Task ' || :APEX$TASK_SUBJECT || ' Expired');
    end;
    </copy>
    ```
    - Click **Create** to add action.

    ![Add Action - Task expired](./images/task_expired-action.png " ")

## Task 4: Running and exploring the new app
In this task, you run and explore the Expense Tracker application. You submit a use case of a multi-level approval with an expense cost of more than 50000; an approved expense request will progress through a sequence of managers, starting with JOHN, then CLARA, then JANE, and finally MATT.

1. Click Run. This will open the runtime application in a new browser tab, allowing you to see how end users will view the app.

     ![Run App](./images/run-app-td.png " ")

2. Login with username - JOHN

     ![Login with JOHN](./images/login-john.png " ")

3. Navigate to **Apply for Expense** and submit the request.

     ![Submit Request](./images/john-submit-req.png " ")

4. Now, Navigate to **My Expense Requests** to see John's expense request.

     ![My Expense Requests](./images/my-expense-requests.png " ")

5. Now, Login with username - CLARA. Then, Navigate to **My Approvals** to Approve John's request.

     ![My Expense Requests](./images/clara-approve.png " ")

6. Login with username - JANE. Then, Navigate to **My Approvals** to Approve John's request.

     ![My Expense Requests](./images/jane-approve.png " ")

7. Login with username - MATT. Then, Navigate to **My Approvals** to Approve John's request.

     ![My Expense Requests](./images/matt-approve.png " ")

8. Again, Login with username - JOHN to see completed request.

     ![My Expense Requests](./images/john-completed-req.png " ")

## **Summary**
You now know how to update a table, add potential owners to delegate and request more information while applying for a request.

## Acknowledgments
- **Author** - Ankita Beri, Product Manager
- **Contributor** - Roopesh Thokala, Senior Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, November 2023   
