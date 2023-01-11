# Implement Security in your Application

## Introduction

Application security is very important for the majority of applications. You must ensure that users enter valid credentials. Generally, username and password (Authentication) and the logged-in user has appropriate rights within the application (Authorization).


Estimated Time: 20 minutes

### Downloads

- Did you miss out on trying the previous labs? Don’t worry! You can download the application from **[here](files/online-shopping-cart-9.sql)** and import it into your workspace. To run the app, please run the steps described in **[Get Started with Oracle APEX](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.

## Task 1: Implement Social Sign In(Facebook) Authentication in Online Shopping Cart Application.

 In this hands-on lab, you create a Social Sign-in authentication scheme to enable Facebook Authentication. You test the authentication scheme.

 1. Log in to Facebook’s developer [console](https://developers.facebook.com/). Login to the Meta for Developers using your **Facebook Credentials** and then select **My Apps**.

    ![Click My Apps](images/click-myapps.png " ")

    *Note: If you are logging in to the Facebook developer console for the first time, you must follow the below process before navigating to My Apps*

    - *A new user must first click the Get Started link to Create a Facebook for Developers account.*
    - *This then brings you to a welcome screen that gives you the option to Continue. Click Continue.*
    - *Review your email and agree or not to the marketing-related communication from Facebook.*
    - *Choose an option for who you are. Example, developer, product manager, etc.*

2. Click **Create App**.

    ![Click Create App](images/create-app.png " ")

3. Under **Select an app type**, Select **Business** and then click **Next**.

    ![Select type as Business](images/create-app1.png " ")

4. Now, Under **Provide Basic Information**, enter the following and click **Create App**.
    - For **Display Name**, enter **APEX Authentication**
    - For **App contact email**, enter **Your email address**.

    ![Click Create App](images/create-app3.png " ")

5. You will now verify your Facebook account by **Re-entering** your password.

    ![Verify your account](images/verify-your-account1.png " ")

6. Navigate to **Settings** and then select **Basic**. There, you can see the App ID and App Secret. Copy the **App ID** and **App secret** and paste them into your Notepad. It will be used to create the **web credential** in your **APEX application** later.

    ![Copy credentials](images/copy-credentials.png " ")

7. In the **Left Navigation Menu**, click on **Add Product**.

    ![Add Product](images/add_product.png " ")

8. Under **Add products to your app**, select **Set up** in **Facebook Login** card.

    ![Select Facebook](images/select-facebook.png " ")

9. Navigate to **Settings** under **Facebook Login** in the navigation menu. You have to enable Client OAuth Login and add https://apex.oracle.com/pls/apex/apex_authentication.callback (If you are using apex.oracle.com) Valid OAuth Redirect URIs. Then click on **Save Changes**.

    ![Click on Save changes](images/apex-callback.png " ")

10. Login to your APEX workspace and click **Workspace Utilities**.

    ![Select Workspace utilities](images/select-workspace-utilities.png " ")

11. Under **Workspace Utilities**, Select **Web Credentials**.

    ![Select Web Credentials](images/select-web-credentials.png " ")

12. Click **Create**.

    ![Click Create](images/click-create.png " ")

13. In the **Web Credentials** enter the following and click **Create**.
    Under **Attributes**:
    - For **Name**, Enter **FB\_LOGIN\_DEMO**
    - For **Static Identifier**, Enter **FB\_LOGIN\_DEMO**
    - For **Authentication Type**, select **OAuth2 Client Credentials Flow**.
    - For **Client ID or Username**, Enter the **APP ID** you copied in **Step 6**.
    - For **Client Secret or Password** and **Verify Client Secret or Password**, Enter the **App Secret** you copied in **Step 6**.

    ![Define Web Credentials](images/create-web-cred1.png " ")

14. Navigate to **App Builder** and select **Online Shopping Application**.

    ![Navigate to Online shopping application](images/navigate-to-osa.png " ")

15. Click **Shared Components**.

    ![Select Shared Components](images/select-shared-components.png " ")

16. Under **Security**, Select **Authentication Schemes**.

    ![Select Authentication Schemes](images/select-authentication.png " ")

17. In the **Authentication Schemes** page, click **Create**.

    ![Click Create](images/click-create2.png " ")

18. Under **Create Authentication Scheme** Page, leave the settings to default and click **Next**.

    ![Create Authentication Scheme](images/create-auth1.png " ")

19. In the **Authentication Scheme** enter the following and click **Create Authentication Scheme**.
    Under **Name**:
    - For **Name**, Enter **FB Authentication**.
    - For **Scheme Type**, select **Social Sign-In**.  

    Under **Settings**:
    - For **Credential Store**, Enter **FB\_LOGIN\_DEMO**.
    - For **Authentication Provider**, select **Facebook**.
    - For **Scope**, Enter **email**.
    - For **Username**, Enter **name**.

    ![Define Authentication](images/create-auth2.png " ")

20. Notice that a new **Authentication Scheme** you created is displayed as **FB Authentication - Current**.

    ![Authentication scheme displayed](images/create-auth3.png " ")

21. Run the application by navigating to **Online Shopping Application** and click **Run**.

22. In the **User Interface**, click **Administration**.

    ![Click Administration](images/run-app2.png " ")

23. Now, log in to the application using your **Facebook Credentials**.

    ![Login into Facebook](images/fb-login1.png " ")

24. You are now logged in to the **Online Shopping Application**. Check the user name on the top right of the **Navigation Bar**.  

    ![Check username on the top of the Navigation Bar](images/run-app3.png " ")

## Task 2: Creating and Using an Authorization Scheme

In this task, you create an **Authorization Scheme** to ensure only people entered as Team Members can log into the **Online Shopping Application**. You apply the authorization scheme to the application properties.

1. Navigate to App Builder and select **Online Shopping Application**.

    ![Select Online shopping application](images/navigate-to-osp.png " ")

2. In the application home page, click **Shared Components**.

    ![Navigate to Shared components](images/bavigate-to-sc.png " ")

3. Under Shared Components > Security, click **Application Access Control**.

    ![Navigate to Application access control](images/click-access-control.png " ")

4. Under **Roles**, Select **Add Role**.

    ![Select Add role under roles](images/add-role.png " ")

5. In the **Role** Page, enter the following and click **Create Role**.
    - For **Name**, Enter **Administrator**
    - For **Static Identifier**, select **ADMINISTRATOR**

    ![Define name and static identifier](images/add-role1.png " ")

6. In the **User Role Assignments**, Click **Add User Role Assignment**.

    ![Add User Role Assignment](images/assign-user1.png " ")

7. In the **User Assignment** Page, enter the following and click **Create Assignment**.
    - For **User Name**, Enter **AUTHORIZED USER**.
    - For **Application Role**, Check **ADMINISTRATOR** to **Yes**.

    ![Create Assignment](images/assign-user2.png " ")

8. Navigate back to **Shared Components** and then select **Authorization Schemes**.

    ![Select shared components](images/select-sc.png " ")

    ![Select Authorization Schemes](images/select-authorization.png " ")

9. Under **Authorization Scheme**, Click **Create**.

    ![Click Create](images/click-create11.png " ")

10. For **Create Authorization Scheme**, Leave the settings to default and then click **Next**.

    ![Create Authorization Scheme](images/click-create12.png " ")

11. In the **Details** section of Create Authorization Scheme, enter the following and click **Create Authorization Scheme**.
    - For **Name**, Enter **Admin**.
    - For **Scheme Type**, Select **Is In Role or Group**.
    - For **Type**, select **Application Role**
    - For **Name(s)**, Select **Administrator**.
    - For **Identify error message displayed**, enter **You are not Authorized to view this.**

    ![Define Authorization scheme](images/create-authorization1.png " ")

12. Navigate to **Shared Components** and then under **Security**, Select **Security Attributes**.

    ![Navigate to Shared Components](images/navigate-to-sc1.png " ")

    ![Navigate to Security Attributes](images/navigate-to-sa.png " ")

13. In the **Edit Security Attributes** Page, under **Authorization**, select **Admin** for **Authorization Scheme**. Click **Apply Changes**.

    ![Select Admin for authorization scheme](images/select-authorization-scheme.png " ")

14. Navigate to the runtime environment (tab or window). Click Sign Out in the navigation bar (top right).

15. Run the application by navigating to **Online Shopping Application** and click Run. In the User Interface, click **Administration**.

    ![Click Administration](images/login1.png " ")

16. Since your name is not **Authorized User**, verify the access denied message is displayed.

    ![Not Authorised to view](images/login2.png " ")

## Summary
You now know how to create a Social Sign-in authentication scheme to enable Facebook Authentication

You may now **proceed to the next lab**.

## Acknowledgments

- **Author** - Roopesh Thokala, Product Manager
- **Contributor** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Roopesh Thokala, Product Manager, May 2022
