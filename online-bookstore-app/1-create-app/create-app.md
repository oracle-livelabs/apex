# Create an APEX application

## Introduction

In this lab, you will create a new application named **Online Bookstore**. Next, you rapidly design and prototype data models using a markdown-like shorthand syntax that expands to standards-based Oracle SQL known as Quick SQL in Oracle APEX.

**Quick SQL** is designed to reduce the time and effort required to create SQL tables, triggers, and index structures. This tool is not designed to be a replacement for data modeling. Instead, Quick SQL is simply a quick way to develop a script for simple tables and views.

Estimated Time: 4 minutes

### Objectives

In this lab, you will:

- Create an APEX Application

- Load Quick SQL

## Task 1: Create an Application

In this lab, you create a simple application with one click called **Online Bookstore**. This option creates an application which contains only a Global Page, Home page, and Login page.

1. On the Workspace home page, click the **App Builder**.

   ![App builder home page](./images/go-create-app.png " ")

2. Click **Create** or **Create a New App**.

    ![Create Application options](./images/new-app.png " ")

3. For Name, enter **Online Bookstore** and click **Create application**.

    ![Create Application wizard](./images/create-app1.png " ")

4. To edit application icon, click **Shared Components**.

    ![Create Application wizard](./images/sc-icon.png " ")

5. Under **User Interface**, select **User Interface Attributes**.

    ![Create Application wizard](./images/user-interface.png " ")

6. Click **Change Icon**.

    ![Create Application wizard](./images/change-icon1.png " ")

7. In the Edit Application Icon dialog you can either:
    - **Upload an icon**: Click the plus (+) sign and navigate to the icon, or drag and drop the icon to the Upload your own icon region.

    If you upload a custom icon, it is resized to a number of sizes and will be propagated to the appropriate places at runtime.

    - **Select an icon from the library**: Select the icon color and then the icon.

    In this lab, I uploaded an sample icon from my device. After uploading, it can be adjusted or cropped. Download a sample icon [here](./images/Online_Bookstore_Icon.png).

    After making all changes, click **Save Icon**.

    ![Create Application wizard](./images/upload-icon.png " ")

    ![Create Application wizard](./images/edit-icon.png " ")

8. To view the application, click **Run** and enter your workspace credentials to log in.

     ![Create Application wizard](./images/run-app.png " ")

     ![Create Application wizard](./images/login-app.png " ")

     ![Create Application wizard](./images/home-page.png " ")

## Task 2: Load Quick SQL

1. Navigate to Select **SQL Workshop** and select **Utilities > Quick SQL**.

    ![Create Application wizard](./images/quick-sql.png " ")

2. Copy and paste the given code in the Quick SQL column and click **Review and Run**.

    ```
    <copy>
    Users
      user_id num /pk
      username  /nn /unique
      email  /nn /unique
      password
      full_name
      address
      profile_pic blob
      mime_type
      is_admin
      picture_url

    Books
      book_id num /pk
      price num /nn
      title  /nn
      author /nn
      category
      discount num /nn
      buy_links
      publisher
      book_image
      contributor
      description
      book_quantity num /nn
      object_det
      available_yn  /nn /default Y
      text_det

    Orders
      order_id num /pk
      user_id num /fk Users /cascade
      order_no
      order_datetime timestamp
      payment_id vc
      razorpay_id vc

    Order_Items
      Order_item_id num /pk
      order_id num /fk Orders /cascade
      book_id num /fk Books /cascade
      added_time  timestamp
      added_date date
      price num
      seq_no num
      quantity num
      discount num

    Unverified_Users
      user_id num /pk
      email

    Wishlist
      wishlist_id num /pk
      user_id num /fk Users /cascade
      book_id num /fk Books /cascade
    </copy>
    ```

    ![Create Application wizard](./images/review-run.png " ")

3. Enter Script Name - **OBS Tables** and click **Run**.

    ![Create Application wizard](./images/script-name.png " ")

4. Review the summary and click **Run Now**.

   ![Create Application wizard](./images/run-now.png " ")

5. We can see that 11 statements were run successfully.

   ![Create Application wizard](./images/results.png " ")

6. Navigate to the **Object Browser** via the **SQL Workshop** dropdown to view all tables.

   ![Create Application wizard](./images/1-2-6.png " ")

7. Expand **Tables** and select any table to view its columns and other details.

  ![Create Application wizard](./images/1-2-7.png " ")

## Summary

You now know how to create an application along with editing an icon of the application. Also, you now know how to use a Quick SQL using shorthand syntax. You may now **proceed to the next lab**.

## Acknowledgements

- **Author**: Pankaj Goyal, Member Technical Staff; Ankita Beri, Product Manager
- **Last Updated By/Date**: Pankaj Goyal, Member Technical Staff, Feb 2025