# Implement Navigation in your Application

## Introduction

In this lab, you will learn how to make some pages publicly accessible.

<!--
Watch the video below for a quick walk through of the lab.

[](youtube:lwQ3lvul9iE)
-->

Estimated Time: 15 minutes

### Objectives
In this lab, you will:
- Set the following pages as public pages:
    - Products
    - Shopping Cart
    - Order Information

- Disable the Navigation Menu

- Enhance the Navigation Bar

### Downloads

- Did you miss out trying the previous labs? Don’t worry! You can download the application from **[here](files/online-shopping-cart-7.sql)** and import it into your workspace. To run the app, please run the steps described in **[Get Started with Oracle APEX](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.

## Task 1: Set Products page as the Home Page.

In this Lesson, you will set the products page as Home page and then you will remove the **Home** page under Navigation Menu.

1. Navigate to the **App Builder**. Then Click on **Online Shopping Application**.

    ![App Builder](images/navigate-to-osa1.png " ")

    ![Online Shopping Application](images/navigate-to-osa2.png " ")

2. Now, select **Shared Components**.

    ![Select Shared Components](images/navigate-t-sc1.png " ")

3. Under User Interface, click **User Interface Attributes**.

    ![Select User Interface Attributes](./images/select-uia.png " ")

4. Now, Under **Attributes**, Select **≡** next to **Home URL**. Then, in the popup window, select **19 PRODUCTS** and click **Apply Changes**.

    ![Change Home Page](./images/change-home-page.png " ")

5. Since you have changed the **Home Page** to **Products** page. you now need to remove **Home** Page under Navigation Menu.  
Navigate to **Shared Components**.

    ![Click on Application Id](./images/navigate-to-sc2.png " ")

    ![Navigate to Shared components](./images/navigate-to-sc3.png " ")

6. Under **Navigation**, Select **Navigation Menu**.

    ![Navigate to Navigation Menu](./images/select-navigation-menu.png " ")

7. Select **Navigation Menu**, then select **Pencil Icon** before **Home**.

    ![Click on Navigation Menu](./images/select-navigation-menu1.png " ")

    ![Edit Home](./images/edit-home1.png " ")

8. In the **List Entry** page, Click **Delete** button and then Confirm Delete by clicking **OK**.

  ![Click on Delete](./images/delete-home-entry1.png " ")

## Task 2: Set Pages to Public
Your customers don't need to log in the app to shop the products, so let's set the following pages as public:
- Page 19: Products
- Page 15: Order Information
- Page 16: Shopping Cart
- Page 17: Add to Cart

Follow these steps for the four listed pages:

1. From the runtime application, navigate to the **Products** page.

    In the Developer Toolbar click **Edit Page 19**.

    ![Navigate to Page 19](./images/navigate-to-page19.png " ")

2. Within Page Designer, in the Rendering tree (left pane), navigate to  **Page 19: Products**.

    In the Property Editor (right pane), apply the following change:
    - Under Security section:
        - For Authentication - select **Page Is Public**  

      ![Edit Authentication as Public](./images/edit-page19.png " ")

3. Click **Save**.

4. Navigate to Page Finder and select **Page 15** from Dialog Page. Repeat steps 2-4.

    ![Navigate to Page finder](./images/navigate-to-page-finder.png " ")

5. Similarly, repeat steps 2-4 for **Page 16: Shopping Cart** and **Page 17: Add to Cart**.

## Task 3: Remove the Navigation Menu
Since the home page is the Products page and this is a public access page, we do not need a navigation menu.
In this task, you will turn off displaying the navigation menu.

1. Within Page Designer, click the Shared Components icon at the top right.

    ![Click on Shared Components icon](./images/click-sc-icon.png " ")

   Alternatively, if you are in the App Builder, click Shared Components.

   ![Click on Shared Components](./images/navigate-t-sc1.png " ")

2. Under User Interface, click **User Interface Attributes**.

    ![Select User Interface Attributes](./images/select-uia1.png " ")

3. Click **Navigation Menu**.

4. Set Display Navigation to **Off**.

    ![Disable Display Navigation](./images/nav-menu-disp-off.png " ")

5. Click **Apply Changes**.

## Task 4: Enhance the Navigation Bar List

Add a new navigation bar entry to allow:
- Customers to go directly to the Shopping Cart
- Administrators to login and access to administration page

1. Click the Shared Components icon at the top right.

    ![Click Shared Components icon](./images/click-sc-icon1.png " ")
2. Under Navigation, click **Navigation Bar List**.

    ![Navigation Bar List](./images/navigation-bar.png " ")

3. Click **Navigation Bar**.

    ![Click Navigation Bar](./images/navigation-bar1.png " ")

4. Click **Create Entry**.

    ![Click Create Entry](./images/create-entry1.png " ")

5. In the **List Entry** page, enter the following and click **Create List Entry**.

    ![Create Entry](./images/create-entry2.png " ")

    - For Sequence - enter **1**
    - For Image/Class - **&SHOPPING\_CART\_ICON.**
    - For List Entry Label - **Shopping Cart**
    - For Page - select **16**
    - For Clear cache - enter **16**

6. Scroll under **User Defined Attributes** and enter the following:

    - For 1. Badge Value - enter  **&SHOPPING\_CART\_ITEMS.**
    - For 2. List Item CSS Classes - enter **js-shopping-cart-item**

7. Click **Create List Entry**.

    ![Create List Entry](./images/create-entry3.png " ")

8. Click the **Pencil Icon** before **&APP_USER.**

    ![Edit &APP_USER.](./images/click-app-user.png " ")

9. Under Authorization, for Authorization Scheme, select **Administration Rights**.

10. Click **Apply Changes**.

    ![Set Admin Rights](./images/set-admin-rights.png " ")

11. Click **Create Entry**  and enter the following:

    ![Click Create Entry2](./images/create-entry11.png " ")

    - For Sequence - enter **5**
    - For Image/Class - enter **fa-wrench**
    - For List Entry Label - enter **Administration**
    - For Page - select **10000**

12. Click **Create List Entry**.

    ![Create List Entry2](./images/create-entry12.png " ")
    
<!--
You now know how to enhance and mantain both navigation menu and navigation bar. You may now **proceed to the next lab**.-->

## Summary

You now know how to set page as public and manage Navigation bar and Navigation menu. You may now **proceed to the next lab**.

## Acknowledgments

- **Author** - Roopesh Thokala, Product Manager
- **Contributor** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Toufiq Mohammed, Senior Product Manager, May 2023
