# Add Validations and Processes to the Shopping Cart Page

## Introduction


This Hands-on Lab is a collection of six tasks. After completing this lab, your application will enable customers to:

- Create validations on the Page Items.
- Create a Page process to create the Order
- Clear the shopping cart
- Proceed to checkout

Estimated Time: 15 minutes


### Objectives
In this lab, you will:
- Create Validations, Processes and Branches to manage the Shopping Cart

### Downloads

- Did you miss out trying the previous labs? Don’t worry! You can download the application from **[here](files/online-shopping-cart-4.sql)** and import it into your workspace. To run the app, please run the steps described in in **[Get Started with Oracle APEX](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.


## Task 1: Create Validations on the Page

1. Navigate to the **App Builder**.

    ![Click App Builder](./images/click-app-builder.png " ")

2. Then Click on **Online Shopping Application**.

    ![Select Online Shopping Cart App](./images/click-app-builder1.png " ")

2. Now you select **Shopping Cart** under **Page Icons**.

    ![Navigate to Shopping Cart Page](./images/navigate-to-shopping-cart-page.png " ")

3. In the Rendering tree (left pane), click **Processing** tab.

4. Over **Validating**, right-click **Create Validation**.

     ![Create a Validation](./images/create-validation1.png " ")  

5. Create three validations for the following items: Name, Email, and Store

    ![Customise Validation](./images/create-validation2.png " ")

    | Name |  Type (under Validation) | Item |
    | --- |  --- | --- |
    | Validate Name | Item is NOT NULL | P16\_CUSTOMER\_FULLNAME |
    | Validate Email | Item is NOT NULL | P16\_CUSTOMER\_EMAIL |
    | Validate Store | Item is NOT NULL | P16_STORE |

    Under Error:

    | Error Message | Display Location | Associated Item |
    | --- |  --- | --- |
    | Please enter your name | Inline with Field and in Notification | P16\_CUSTOMER\_FULLNAME |
    | Please enter your email address | Inline with Field and in Notification | P16\_CUSTOMER\_EMAIL |
    | Please select a store | Inline with Field and in Notification | P16_STORE |

     ![Customise Validation](./images/create-validation3.png " ")

     As these validations only apply when user proceeds to checkout, let's create that condition.
     Under Server-side Condition, set the following:

    | Name  | When Button Pressed |
    | ---   |  --- |
    | Validate Name  | Proceed |
    | Validate Email | Proceed |
    | Validate Store | Proceed |   

     ![Customise Validation](./images/create-validation4.png " ")       

## Task 2: Add a Process to Create the Order

1. On the **Processing** tab (left pane).
2. Right- click **Processing** and click **Create Process**.

     ![Create Page Process](./images/create-process1.png " ")

3. In the Property Editor, enter the following:
  Under Identification:
    - For Name - enter **Checkout**
    - For Type, Select **Invoke API**

  Under Settings, select what Process Executes:
    - For Type, Select **PL/SQL Package**
    - For Package, Enter the case-sensitive PL/SQL package name, **MANAGE_ORDERS**. You can type in the name or pick from the list.
    - For Procedure or Function, Enter the case-sensitive procedure or function name, **CREATE_ORDER**,  defined in the selected PL/SQL package. You can type in the name or pick from the list.

     ![Create and Configure Invoke API Process](./images/create-process2.png " ")  

    - For Success Message, enter **Order successfully created: &P16\_ORDER\_ID.**
    - Under Server-side condition, for When Button Pressed, select **Proceed**


4. On the **Processing** tab (left pane), Expand the Process **Checkout**. Under **Parameters**, Click **p_customer**.
   Under **Property Editor**, enter the following:
   Under Value :
   - For Type: Select **Item**
   - For Value: Select **P16_CUSRTOMER_FULLNAME**

  ![Configure Invoke API Process](./images/create-invoke-api1.png " ")

5. Repeat the Above steps for the other parameters **p_customer_email**,**p_store**,**p_order_id**,**p_customer_id**. Set the Item Names as follows.
    | Parameter Name  | When Button Pressed |
    | ---   |  --- |
    | p_customer_email | P16_CUSTOMER_EMAIL |
    | p_store | P16_STORE |
    | p_order_id | P16_ORDER_ID |   
    | p_customer_id | P16_CUSTOMER_ID |

    ![Configure Invoke API Process](./images/create-invoke-api2.png " ")


6. Click **Save**.

## Task 3: Add Process to Clear the Shopping Cart

1. On the **Processing** tab (left pane).
2. Right-click **Processing** and click **Create Process**.

    ![Create Page Process](./images/create-process12.png " ")

3. In the property editor,
    Under Identification:
      - For Name - Enter **Clear Shopping Cart**.
      - For Type - Select **Execution Chain**.
      - For Execution Chain - This attribute enables support for nested execution chains. Use this attribute to define another execution chain as the parent for this chain. For this example, select None.

    Under Settings:
      - Set **Run in Background** to **Yes**.

    ![Create and Configure Background Process](./images/create-background-process1.png " ")

4. Now, create a child process. In the Processing tab, select the Execution Chain process, right-click and select Create Child Process. The new child process displays under Processes.

    ![Create a Child Process](./images/create-child-process1.png " ")

5. In the Property Editor, enter the following:
  Under Identification:
    - For Name - enter **Clear shopping Cart - Child**
    - For Type, Select **Invoke API**

  Under Settings, select what Process Executes:
    - For Type, Select **PL/SQL Package**
    - For Package, Enter the case-sensitive PL/SQL package name, **MANAGE_ORDERS**. You can type in the name or pick from the list.
    - For Procedure or Function, Enter the case-sensitive procedure or function name, **CLEAR_CART**,  defined in the selected PL/SQL package. You can type in the name or pick from the list.

     ![Configure Child Process](./images/create-child-process2.png " ")

Click Save.


## Task 4: Add Branches to the Page

1. On the **Processing** tab (left pane).
2. Right-click **After Processing** and click **Create Branch**.

     ![Create a Branch](./images/create-branch1.png " ")  

3. In the Property Editor, enter the following:  

    - For Name - enter **Go to Orders**

    - Navigate to Target attribute and click **No Link Defined**.
        - For Type - select **Page in this application**
        - For Page - enter **16**
        - For Set Items - enter:

          | Name | Value  |
          | --- |  --- |
          | P16\_ORDER\_ID | &P16\_ORDER\_ID. |

        - For Clear Cache - enter **16**.
        - Click **OK**.

    - Under Server-side condition, for When Button Pressed, select **Proceed**.

    ![Configure Branch](./images/create-branch2.png " ")

4. Create a  second branch when the user clears the shopping cart. Right-click on **After Processing** and click **Create Branch**.

5. In the Property Editor, enter the following:
    - For Name - enter **Go to Products**

    - Navigate to Target attribute and click **No Link Defined**
        - For Type - select **Page in this application**
        - For Page - enter **1**
        - For Clear Cache - enter **1**
        - Click **OK**

    - Under Server-side condition, for When Button Pressed, select **Clear**

    ![Configure Branch](./images/create-branch3.png " ")

  Click Save.

## Summary

In this hands-on lab, You learned to create data validations for page items, ensuring data accuracy. You also implemented a dedicated page process to streamline order creation. Additionally, the lab covered clearing the shopping cart and enabling a seamless transition to the checkout process, enhancing the overall user experience.  You may now **proceed to the next lab**.

## Whats Next:

In the next lab, you explore the use of Dynamic Actions to efficiently manage the shopping cart, allowing for real-time updates. Additionally, you learn how to review product details and enabling users to add, edit, or remove items from their cart with the help of Page Process.

## Acknowledgments

- **Author** - Roopesh Thokala, Senior Product Manager
- **Contributor** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Roopesh Thokala, Senior Product Manager, October 2023
