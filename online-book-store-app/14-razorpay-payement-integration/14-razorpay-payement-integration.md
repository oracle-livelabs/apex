# Razorpay Payment Integration

## Introduction

## Task 1: Create Web Credential

1. Log in to Razorpay [console](https://dashboard.razorpay.com/app/website-app-settings/api-keys).

     *Note: ---*

2. You will get the Key ID and Key secret. Save these IDs. We will use them later.

3. Login into your Oracle APEX workspace.

4. On the Workspace home page, click **App Builder**.

5. Click **Workspace Utilities**.

6. Select **Web Credentials**.

7. Click **Create**.

8. In the **Web Credentials** enter the following and click **Create**.

    - Under **Attributes**:

        - Name: Enter **Razorpay API**
        - Authentication Type: Select **Basic Authentication**.
        - Client ID or Username: Enter the **Client ID** you copied in **Step 10**.
        - Client Secret or Password and Verify Client Secret or Password: Enter the **App Secret** you copied in **Step 2**.

    Click Create

## Task 2: Create Rest Data Source

1. Navigate to the application home page and click **Shared Components**.

2. Under Data Sources, click **REST Data Sources**.

3. Click **Create**.

4. Select **From scratch** and click **Next**.

5. Under Create REST Data Source, enter the following attributes and click **Next**.

    - Name: **Razorpay API**

    - URL Endpoint: https://api.razorpay.com/v1/orders

6. Under Create REST Data Source - Remote Server, click **Next**.

7. Under Create REST Data Source - Settings, click **Next**.

8. Under Authentication,

    - **Authentication Required**: **Toggle On**

    - **Credentials**: **Razorpay API**

9. Click **Create REST Source Manually**.

   The REST data source is created successfully. The next step is to configure the POST operation parameters for this REST Data Source.

10. On the REST Data Sources page, click **Razorpay API**.

11. Select the Operations tab, click **Edit icon** for the POST operation and enter the following:

    - **Database Operation**: -Not Mapped-

    - **Request Body Template**: Copy and paste the JSON given below.

     ```
    <copy>
    {
    "amount": #AMOUNT#,
    "currency": "INR"
    }
    </copy>
    ```

12. Under Operation Parameters, click **Synchronize with body** and click **OK**.

13. Under Operation Parameters, Click **Add Parameter**.

14. In the **Edit REST Data Source Parameter** dialog, add the following two parameters one after the other:

   |   | Type | Name | Direction | Default Value | Static |
   |---|-------|------|----------| --------------| ------ |
   | 1 | Request or Response Body| RESPONSE | Out |
   | 2 | HTTP Header| Content-Type | In | application/json | ON
   {: title="POST Operation Parameters"}

15. Click **Apply Changes**.

## Task 3: Update OBS\_MANAGE\_ORDERS Package Codes

1. Click **SQL Workshop** and navigate to **Object Browser**.

2. In the object tree, expand **Packages** and select **OBS\_MANAGE\_ORDERS** package.

3. Under **Specification**, Replace copy of procedure **create\_order** with the below code:

     ```
     <copy>
    PROCEDURE create_order (
        p_user_id  IN VARCHAR2,
        P_PAYMENT_ID in varchar2,
        p_razorpay_id IN VARCHAR2,
        p_order_id  OUT obs_orders.order_id%TYPE
    );
     </copy>
      ```

   Click **Save and Compile**.

5. Under **Body**, Copy and paste below code:

    ```
    <copy>
    PROCEDURE create_order (
        p_user_id  IN VARCHAR2,
        P_PAYMENT_ID in varchar2,
        p_razorpay_id IN VARCHAR2,
        p_order_id  OUT obs_orders.order_id%TYPE
    )
    IS
    BEGIN
        INSERT INTO obs_orders
            (order_datetime,
            user_id,
            PAYMENT_ID,
            razorpay_id)
    VALUES   (SYSDATE,
                p_user_id,
                P_PAYMENT_ID,
                p_razorpay_id)
    returning order_id INTO p_order_id;
    IF apex_collection.collection_exists (p_collection_name => 'BOOKS')
    THEN
        INSERT INTO obs_order_items
            (order_id,
            seq_no,
            book_id,
            price,
            quantity,
            discount,
            added_date,
            added_time)
        SELECT p_order_id,
        seq_id,
        b.book_id,
        b.price,
        n002,
        b.discount,
        Sysdate,
        SYSTIMESTAMP AT TIME ZONE 'Asia/Kolkata' AS added_time
        FROM  apex_collections a,
        obs_books b
        WHERE collection_name = 'BOOKS'
        AND b.book_id = a.n001;
    END IF;
    apex_collection.delete_collection(p_collection_name => 'BOOKS');
    END create_order;
    </copy>
    ```

   Click **Save and Compile**.

## Task 4: Integrate Payment Gateway in Shopping Cart Page

1. Navigate to **App Builder** and select **Online Bookstore Application**.

2. Click Page **17 - Shopping Cart**

3. Right-Click **Order Information** and Create the following three page items, one after the other:

      | Name            |  Type   |
      | --------------- |  ------ |
      | P17\_RAZORPAY\_ORDER\_ID | Hidden |
      | P17\_PAYMENT\_ID | Hidden |
      | P17\_RESPONSE | Hidden  |

4. Select **Proceed** button, Under Behavior > Action: **Defined by Dynamic Action**.

5. Right-Click on **Proceed** button and select **Create Dynamic Action**

6. Enter/select the following:

    - Under Identification:

        - Name: **run_pay**

7. Click on true action

8. Enter/select the following:

    - Under Identification:

        - Action: **Submit Page**

    - Under Settings:

        - Request/Button Name: **CREATE\_RAZOR\_PAY\_ORDER**

9. Navigate to the **Dynamic Actions** Tab

10. Right-Click on **Page Load** and select **Create Dynamic Action**

11. Enter/select the following:

    - Under Identification:

        - Name: **Invoke Razorpay**

12. Click on true action

13. Enter/select the following:

    - Under Identification:

        - Action: **Execute Javascript Code**

        - Under Settings:

            - Code: Copy and Paste the below code

            ```
            <copy>
            // Options for the Razorpay checkout
            var razorpayId = "&P17_RAZORPAY_ORDER_ID.";
             var amount = apex.item('P17_TOTAL').getValue();
             var options = {
                 "key": "< Enter they key>", // Your Razorpay test key
                 "amount": amount*100, // Amount in paise (e.g., 50000 paise = Rs 500)
                 "name": "Payment Page", // Name of the payment receiver
                 "description": "Transaction", // Description of the payment
                 "order_id": razorpayId, // Your custom order ID
 
                 // Handler function to be executed after successful payment
                 "handler": function(response) {
                     console.log(response)
                     // Set values in Apex items for the response data
                     apex.item("P17_PAYMENT_ID").setValue(response.razorpay_payment_id);
                     apex.item("P17_RAZORPAY_ORDER_ID").setValue(response.razorpay_order_id);
                     apex.page.submit({
                         request : "Proceed",
                         showWait :true
                     }
                         );                       
                 },
                 // Pre-filled customer information
                 "prefill": {
                     "name": "",
                     "email": "test@example.com",
                     "contact": "9999999999"
                 },
                 // Additional notes for the payment
                 "notes": {
                     "address": "Razorpay Corporate Office"
                 },
                 // Custom theme color for the Razorpay checkout window
                 "theme": {
                     "color": "#3399cc"
                 }
             };
 
             // Create a new Razorpay instance and open the checkout window
             var rzp1 = new Razorpay(options);
             rzp1.on('payment.failed', function(response) {
                 // Handle the case where payment fails
                 // For example, you can show an error message to the user
             });
 
             rzp1.open();
            </copy>
            ```
            **Note: Replace < Enter they key> in the above code with the key ID you saved in Task 1.

        - Under Client-side Condition:

            - Type: **Item is not null**

            - Item: **P17\_RAZORPAY\_ORDER\_ID**

14. Right-Click **true** and select **Create TRUE Action**

15. Enter/select the following:

    - Under Identification:

        - Action: **Execute Server-side Code**

    - Under Settings:

        - PL/SQL Code: Copy and Paste the below code

        ```
        <copy>
        :P17_RAZORPAY_ORDER_ID := null;
        </copy>
        ```

16. Navigate the **Processing** tab, Right-Click **Processing** and select **Create Process**.

17. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **Create Razorpay Order**

        - Type: **Invoke API**

    - Under Settings:

        - Type: **Rest Source**

        - REST Source: **Razorpay API**

        - Operation: **POST**

    - Under Server-side Condition:

        - Type: **Request = Value**

        - Value: **CREATE\_RAZOR\_PAY\_ORDER**

18. Under **Create Razorpay Order** process, expand **Parameters** and update the following:

    - **Amount**:

        - Under Value:

             - Type: **Function Body**

             - PL/SQL Function Body: Copy and Paste the below code

        ```
        <copy>
        return to_char(TO_NUMBER(:P17_TOTAL) * 100);
        </copy>
        ```

    - **RESPONSE**

        - Under Parameter > Ignore Output: **Toggle Off**

        - Under Value > Item: P17\_RESPONSE

19. Right-Click **Processing** and select **Create Process**.

20. In the property editor, enter/select the following:

    - Under Identification:

        - Name: **Parse  Razorpay\_order\_id**

    - Under Source:

        - PL/SQL Code: Copy and Paste the below code

        ```
        <copy>
        apex_json.parse(:P17_RESPONSE);
        :P17_RAZORPAY_ORDER_ID:= apex_json.get_varchar2(p_path => 'id');
        </copy>
        ```

    - Under Server-side Condition:

        - Type: **Request = Value**

        - Value: **CREATE\_RAZOR\_PAY\_ORDER**

21. Under **Create Order** process, expand **Parameters** and update the following:

    - **p\_user\_id**:

        - Under Value:

            - Type: **Item**

            - Item: **USER\_ID**

    - **p\_order\_id**:

        - Under Value:

            - Item: **P17\_ORDER\_ID**

    - **p\_payment\_id**:

        - Under Value:

            - Type: **Item**

            - Item: **P17\_PAYMENT\_ID**

    - **p\_razorpay\_id**:

        - Under Value:

            - Type: **Item**

            - Item: **P17\_RAZORPAY\_ORDER\_ID**

22. Navigate back to the Rendering tab and select **Page 17:Shopping Cart**

23. In the property editor, enter/select the following:

    - Under JavaScript:

        - File URLs: Copy and Paste the below code

        ```
        <copy>
        https://checkout.razorpay.com/v1/checkout.js
        </copy>
        ```

24. Click **Save**.

<!-- ## Task 5: Update the Order Information Page

1. Navigate to Page - 18. -->


## Summary

In this lab....

You are now ready to move on to the next lab!

## Acknowledgements

- **Author**: Pankaj Goyal, Member Technical Staff
- **Last Updated By/Date**: Pankaj Goyal, Member Technical Staff, Aug 2024