# Implement Invoice Approval Requests Using Approvals Component




## Task 1: Create Task Definition

1. Navigate to **Shared Components**.

   ![Task Definition in Shared Components](images/task-definition-sc.png " ")

2. Under Workflows and Automations, Select **Task Definitions**.

   ![Select Task Definition](images/task-definition.png " ")

3. Click **Create**.

   ![Create Task Definition](images/task-definition-create.png " ")

4. Specify the task definition attributes and Click **Create**.

    - For Name: Enter **Invoice Approval Request**

    - For Type: Select **Approval Task**

    - For Subject: Enter **&EXPENSE\_TYPE. Expense request for &EMP\_NAME.**

    - For Priority: Select **2-High**

    ![Click Create on Task Definition page](images/task-definition-details.png " ")

7. Under **Settings** Section:

    - For Task details Page Number - Click on **Create Task Details Page** button and Click **OK**

    ![Click Task Definition](images/click-task-definition.png " ")

    ![Click Task Definition](images/click-task-definition1.png " ")

8. Click on the task definition - **Expense Request** to continue editing.

     ![Click on Expense Request](images/select-expense-request.png " ")

    Under Settings, Specify the following:

    - For Actions Source: Select **SQL Query**.

    - For Actions SQL query: Copy the code below and paste it into  the code editor:

    ```
    <copy>
    select e.empno, e.emp_name, m.emp_name as mgr_name from EMPLOYEE_DETAILS e, EMPLOYEE_DETAILS m
    where m.empno(+)=e.mgr and e.empno= :APEX$TASK_PK
    </copy>
    ```

    ![Task Definition Settings](images/task-definition-settings.png " ")

9. Under **Deadline** Section, Enter the following:

    - For Due On Type: Select **Interval**

    - For Due On Interval: Enter **PT30M**

    - For Expiration Policy: Select **Expire**

    ![deadline](images/deadline1.png " ")

10. **Under Participants** Section - Select Participants to assign additional people to the Task Definition.

    - Click Add Row.

    - For Participant Type: Select **Potential Owner**

    - For Value Type: Select **SQL Query**

    - For Value: Copy the code below and paste it into  the code editor

    ```
    <copy>
    select EMP_NAME from employee_details where EMPNO =(select MGR from employee_details where EMPNO=(select EMPNO from employee_details where EMP_NAME=:APP_USER))
    </copy>
    ```

    - Click **Apply Changes** to save all existing changes.

    ![Task Definition Participants](images/task-definition-participants0.png " ")

11. Click on the task definition - **Expense Request** to continue editing.

    ![Click on Expense Request](images/task-definition-created.png " ")

12. **Under Parameters** Section - Select Add Row and fill in the four parameter fields listed below:

     | Static ID |  Label  | Data Type
     | --- |  --- | --- |
     | ESTIMATED\_COST | Estimated Cost | String |
     | EXPENSE\_STATUS | Expense Status | String |
     | EXPENSE\_TYPE | Expense Type | String |
     | REQ\_ID | Req Id | String |

     - Click **Apply Changes**.

     ![Task Definition Parameters](images/task-definition-parameters.png " ")

13. Click on the task definition - **Expense Request** to continue editing.

     ![Click on Expense Request](images/select-expense-request1.png " ")

14. Under **Actions** Section, Click **Add Action**.

    Specify the following:

     - For Name: Enter **CREATE\_EXPENSE\_REPORT\_ENTRY**

     - For Type: Select Execute Code

     - On Event: Select Create

     - For Code: Copy the code below and paste it into  the code editor:

    ```
        <copy>
