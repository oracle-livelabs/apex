# Implement Human Workflow

## Introduction

In this lab, you create a workflow that tracks interactions and assigns tasks to team members by utilizing the approvals component.

To begin with, you design a task definition, where you can configure various task parameters, assign participants, specify actions, and set due dates for activity requests. Additionally, you create a form page to allow users to submit activity requests. Finally, you add a Unified Task list page that displays the submitted activity requests by requestors, along with an Approval list that indicates completed or expired status tags. This enables an efficient management of the CRM workflow within the application.

Estimated Time: 15 minutes

## Task 1: Create a Task Definition

1. In the **App Builder**, navigate to **CRM APP** application  and select **shared components**.

   ![Task Definition in Shared Components](images/shared-comp.png " ")

2. Under Workflows and Automations, select **Task Definitions**.

   ![Select Task Definition](images/shared-comp-td.png " ")

3. Click **Create**.

   ![Create Task Definition](images/td-create.png " ")

4. Specify the task definition name and define the metadata.

    - For Name - Enter **Activity Request**

    - For Subject - Enter **Request for &ACTIVITY. with &CUSTOMERNAME.**

    - For Potential Owner - Enter **&ASSIGNED\_TO.**


5. Click **Create**.

   ![Click Create on Task Definition page](images/create-td-dialog.png " ")


6. Under **Settings** Section:

    - For Task details Page Number - Click on **Create Task Details Page** button then click **OK**

    ![Click Task Definition](images/create-task-detail.png " ")

    - Click on the task definition - **Activity Request** to continue editing.

    ![Click on Expense Request](images/request-created.png " ")

    - For Actions Source - Select SQL Query.

    - For Actions SQL query - Copy the code below and paste it into  the code editor:

    ```
    <copy>
    select ID , SALESREP, SALESREP_EMAIL
     from DM_SALESREP
    where  ID= :APEX$TASK_PK
    </copy>
    ```
    ![Task Definition Settings](images/td-settings.png " ")

7. **Under Parameters** Section - Select Add Row and fill in the 4 parameter fields listed below:

     | Static ID |  Label  | Data Type
     | --- |  --- | --- |
     | Activity | Activity | String |
     | ASSIGNED\_TO | Assigned To | String |
     | CUSTOMERNAME | Customer Name | String |
     | STATUS | Status | String |
     | UPDATED\_BY | Updated By| String |

     ![Task Definition Parameters](images/td-parameters.png " ")

     - Click **Apply Changes**.

8. Click on the task definition - **Activity Request** to continue editing.

  ![Click on Expense Request](images/request-created.png " ")


9. Under **Actions** Section, Click **Add Action** button

     ![Task Definition Actions Create](images/td-actions.png " ")

    Specify the following:

    - For Name - Enter **CREATE\_ACTIVITY\_REQUEST**

    - For Type - Select Execute Code

    - On Event - Select Create

    - For Code: Copy the code below and paste it into  the code editor:

    ```
        <copy>
        declare
          l_req_id number;
          begin
          l_req_id := :APEX$TASK_ID;
       -- create a new record in the Activity Request table ACTIVITY_REQUEST
       insert into ACTIVITY_REQUEST values
       (to_number(l_req_id),
       :CUSTOMERNAME,
       :ACTIVITY,
       :UPDATED_BY,
       'PENDING',
       :ASSIGNED_TO,
       :PRIORITY,
       sysdate);
       end;
    </copy>
    ```
    - Click **Create** to save Create Event Action.

      ![Task Definition Action - create1](images/create-activity-request-action.png " ")

10. To Add the next action, Click **Add Action** button.

    Specify the following:

    - For Name - Enter **SEND\_EMAIL\_ON\_CREATION**

    - For Type - Select Send E-Mail

    - On Event - Select **Create**

    Under Send Email Settings:

    - To : &UPDATED_BY.

    - Subject : Activity Assigned - &CUSTOMERNAME.

    - Body Plain Text : Copy the text below and paste it into  the code editor:

    ```
    <copy>
    Hi,

    This is to inform you that an activity has been assigned to you.

    Please login into the portal to see more details.

    Regards,

    Support Team

    </copy>
    ```

     Click **Create** to add action.

       ![Task Definition - Approved](images/send-email-on-req.png " ")


11. Again, Click  **Add Actions** button.

    Specify the following:

    - For Name - Enter **UPDATE\_STATUS**

    - For Type - Select Execute Code

    - On Event - Select **Complete**

    - For Outcome  - Select **Approved**

    - For Code: Copy the code below and paste it into  the code editor:

    ```
    <copy>
    declare
      l_mgr number;
      l_task_id number;
      l_request_id number;
      l_req_status varchar2(10) :='PENDING';
    begin
     l_request_id := :APEX$TASK_ID;
      update ACTIVITY_REQUEST set status = 'COMPLETED'
       where req_id =:APEX$TASK_ID;
    end;
    </copy>
    ```

     Click **Create**

     ![Task Definition - Update Status](images/update-status.png " ")

12. To Add the next action, Click **Add Action** button.

    Specify the following:

    - For Name - Enter **SEND\_EMAIL\_BEFORE\_EXPIRY**

    - For Type - Select Send E-Mail

    - On Event - Select **Before Expire**

    - Before Expire Interval - PT1M

    Under Send Email Settings:

    - To : &ASSIGNED\_TO.

    - Subject : Attention - Task Expiring

    - Body Plain Text : Copy the text below and paste it into  the code editor:

    ```
    <copy>
    Hi User,

    This is to inform you that your activity is due. Please take active action.

    Customer - &CUSTOMERNAME.
    Activity - &ACTIVITY.

     Regards,
     Support Team

    </copy>
    ```

     Click **Create** to add action.

     ![Task Definition - Approved](images/send-email-before-expiry.png " ")  

13. Again, Click  **Add Actions** button.

    Specify the following:

    - For Name - Enter **ON\_EXPIRY**

    - For Type - Select Execute Code

    - On Event - Select **Expire**

    - For Code: Copy the code below and paste it into  the code editor:

    ```
    <copy>
    begin
      apex_approval.add_to_history( 'Task ' || :APEX$TASK_SUBJECT || ' Expired');
    end;
    </copy>
    ```

     Click **Create**

     ![Task Definition - Update Status](images/on-expiry.png " ")        


## Task 2: Create a Page to Submit an Activity
Add a page to Submit an Expense request.

1. Click **Application ID**, Application home page appears.

   ![Application Home Page](images/td-app-id.png " ")

2. Click **Create**, create page wizard appears.

    ![Click create on Application home page](images/td-create-page.png " ")

3. Select **Blank page** under component and click **Next**

    ![Select blank page](images/utl-blank-page.png " ")

4. Specify Blank Page Attributes.

   Under **Page Definition** Section:

    - For Name - Enter **Request for Activity**

  Click **Create Page**.

   ![Blank page definition](images/create-blank-page.png " ")

5. In the left pane, select the Rendering tab. Right-click **Body** , select **Create Region**.

   ![Create create to apply an expense](images/create-region.png " ")

6. In the Property Editor, edit the appropriate attributes:

   Under **Identification** section:

    - For Title: Enter **Request for Activity**

    - For Type: Select **Form**

   Under **Source** section:

    - For Type: Select **SQL Query**

    - For SQL query: Copy the code below and paste it into  the code editor:

    ```
     <copy>
     Select ID , SALESREP\_email as Updated_by
       from DM_SALESREP
     where id = :P35\_ID;
    </copy>
    ```
    - For Page Item to Submit : P35\_id

    ![New Expense request region source](images/region-details.png " ")

7. Now, right-click the region (**Request for Activity**) and select Create Page Item.

     ![Create Page Item - P35_CUSTOMER](images/page-item.png " ")

   Under Identification Section:

    - For Name - Enter **P35\_CUSTOMER**

    - For Type - Select, **Select List**

  Under **List of Values** section:

    - For Type - Select **SQL Query**

    - For SQL Query - Copy the code below and paste it into  the code editor:

    ```
     <copy>
     select distinct CUSTOMERNAME as d , CUSTOMERNAME as r from DM_CUSTOMER;
    </copy>
    ```

    - For Null Display Value - Enter **--Select Customer--**

    ![Update Page Item - P35_CUSTOMER](images/cust-pi.png " ")

8. Right-click the region (**Request for Activity**) and select Create Page Item.

   Under Identification Section:

    - For Name - Enter **P35\_ACTIVITY**

    - For Type - Select, **Select List**

  Under **List of Values** section:

    - For Type - Select **SQL Query**

    - For SQL Query - Copy the code below and paste it into  the code editor:

    ```
     <copy>
     SELECT DISTINCT ACTIVITY AS D, ACTIVITY AS R FROM DM_ACTIVITY_LOOKUP;
     </copy>
    ```

    - For Null Display Value - Enter **--Select Activity--**

   ![Update Page Item - P3_EXPENSE_TYPE](images/activity-pi.png " ")

9. Right-click the region (**Request for Activity**) and select Create Page Item.

   Under Identification Section:

    - For Name - Enter **P35\_ASSIGNED\_TO**

    - For Type - Select, **Select List**

  Under **List of Values** section:

    - For Type - Select **SQL Query**

    - For SQL Query - Copy the code below and paste it into  the code editor:

    ```
     <copy>
     Select DISTINCT SALESREP , SALESREP_EMAIL from DM_SALESREP
     </copy>
    ```

    - For Null Display Value - Enter **--Select Sales Representative--**

   ![Update Page Item - P3_EXPENSE_TYPE](images/assigned-to-pi.png " ")   


10. Right-click region (**Request for Activity**) and select Create Page Item.

     Under Identification Section:

      - For Name - Enter **P3\_PRIORITY**

      - For Type - Select Select list

  Under **List of Values** section:

      - For Type - Select **Shared Component**

      - For list of values - Select UNIFIED\_TASK\_LIST.LOV.PRIORITY

      - For Null Display Value - Enter **--Select Priority--**

      ![Update Page Item - P3_EXPENSE_TYPE](images/priority-pi.png " ")  

11. Select **P35\_ID** page item ,

     - Change type to **hidden**  

     - Disable Value Protected uner Settings Section.

     - Enable the primary key under **Source** section.

    ![Update Page Item - P35_ID](images/id-pi.png " ")

12. Select **P35\_UPDATED\_BY** page item, Change type to **Display** and Enter **Request initiator** as label.

    ![Update Page Item - P3_UPDATED_BY](images/updated-by-pi.png " ")  

13. Click **Save** to apply changes.

14. On the Rendering tab (left pane). Under Pre-Rendering, Right-click **Before Header** and click **Create Process**.

    ![Create rendering process1](images/td-process.png " ")

    In the Property Editor, enter the following:

    - For Name - Type **Fetch salesrep details**

    - For Type - Select Execute code

    - For Sequence - Enter 9

    - For PL/SQL Code - Enter the following PL/SQL code:

        ```
        <copy>
        Select id , salesrep_email INTO
               :P35_ID , :P35_UPDATED_BY
        from dm_salesrep where UPPER(SALESREP_EMAIL) = UPPER(:APP_USER);
        </copy>
        ```
    ![Create rendering process1 - details](images/td-process1.png " ")

15. Click **Save**.

16. Now add a process on the **Processing tab** to submit a request. Right-click Processing and click **Create Process**.

    ![Create processing tab process1](images/td-render.png " ")

    In the Property Editor, enter the following:

     - For Name - Type **Apply for Activity**

     - For Type - Select **Human Task - Create**

    Under **Settings** Section:

     - For Definition - Select **Activity request**

     - For Priority : Enter **P35\_PRIORITY**

     - For Details Primary key Element: Select **P35\_ID**

     - For Success Message: Type **Request submitted successfully**

    ![Create processing tab process1- details](images/td-render1.png " ")

17. Under Parameters for Submit Expense request process:

    a) For  Activity, enter the following:

       - For Type - Select ITEM

       - For Value - Select **P35\_ACTIVITY**

    b) For Assigned To, enter the following:

       - For Type - Select ITEM

       - For Value - Select  **P35\_ASSIGNED_TO**

    c) For Customer Name, enter the following:

       - For Type - Select ITEM

       - For Value - Select **P35\_CUSTOMER**

    d) For  Status, enter the following:

       - For Type - Select Static Value

       - For Static Value - Enter **PENDING**

18. Click **Save**

19. On Rendering tab, Right-click Body and select **Create Button**.

    ![Create Button](images/create-button.png " ")

    In the Property Editor, enter the following:

      - For Button Name - Enter **Create**

      - For Label - Enter **Submit Request**

      - For position - Select **Create**

      - For Hot - Select On

    ![Button details](images/button-detail.png " ")

20. Navigate to Processing tab, Select Process **Apply for Activity**.

    Under **Server-Side Condition** Section:

      - For When Button Pressed : Select **Create**


21. Click **Save**.

## Task 3: Create Unified Task Lists
Add a Unified Task list page to see the submitted activity request list by a requestor and the Completed list by the sale Representative.

1. Select Create (+) on the toolbar in the Page Designer and then Click **Page** to create a Unified Task List page.

     ![Click Application ID](./images/utl-create.png " ")

2. Under Components, Select Unified Task List and click **Next**

     ![Select Unified Task List](./images/utl-page.png " ")

3. Specify the following page attributes:

    - For Name - Type **My Activity Approvals**

    - For Report Context - Select **My Tasks**

    Click **Create Page**.

    ![Click Create Page](./images/utl-page-2.png " ")

4. To create another Unified Task list page, Again, Select Create (+) on the toolbar in the Page Designer and then Click **Page**.

    ![Crete Unified Task List2](./images/utl-create-2.png " ")

5. Under Components, Select Unified Task List and click **Next**

    ![Select Unified Task List](./images/utl-page.png " ")

6. Specify the following page attributes:

    - For Name - Type **My Activity Requests**

    - For Report Context - Select **Initiated by Me**

    Click **Create Page**.

    ![Click create page ](./images/utl-intiated-by-me.png " ")


## Summary
You now know how to create a task definition, Create Page to apply for Activity
and Create Unified Task Lists.

You may now **proceed to the next lab**.

## Acknowledgments
- **Author** - Ankita Beri, Product Manager
- **Contributor** -
- **Last Updated By/Date** - Ankita Beri, Product Manager, July 2023
