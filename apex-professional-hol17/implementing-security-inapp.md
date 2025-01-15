# Implement Security in your Application

## Introduction

In modern web applications, ensuring security is a critical requirement. Oracle APEX provides a robust framework for implementing authentication and authorization mechanisms to safeguard applications from unauthorized access. In this lab, you will learn to implement social sign-in options, specifically using Oracle Identity Access Management (IAM) and Google Authentication, to allow users to securely log in to the Online Shopping Application. Additionally, you will explore how to enable multiple authentication schemes for flexibility and convenience.

This hands-on lab demonstrates how to integrate these features step-by-step, ensuring a secure and user-friendly experience for application users.

Estimated Time: 20 minutes

### Objectives

In this lab, you will:

- Configure Oracle IAM authentication for an application.

- Implement Google Authentication for seamless social sign-in.

- Enable multiple authentication schemes within an Oracle APEX application.

## Task 1: Configure Oracle IAM Authentication in Online Shopping Application

1. Log in to your Oracle cloud console.

2. Navigate to **Identity & Security**.

    ![Define Authentication](images/identity-security.png " ")

3. Under **Identity**, select **Domains**.

    ![Define Authentication](images/select-domains.png " ")

4. Select your **Domain**.

    ![Define Authentication](images/select-domain.png " ")

5. Under **Identity Domain**, navigate to **Integrated applications** and click **Add application**.

    ![Define Authentication](images/add-application.png " ")

6. Select **Confidential Application** and click **Launch Workflow**.

    ![Define Authentication](images/select-confidential.png " ")

7. Enter a **Name** for your application.

    ![Define Authentication](images/click-next.png " ")

8. Under **Authentication and authorization** , enable **Enforce grants as authorization** and click **Next**.

    ![Define Authentication](images/click-next1.png " ")

9. Under **Client configuration**, enter/select the following:

    - Under Authorization:

        - Allowed grant types: Enable **Authorization code** (This will be used later to control access to the Oracle APEX application)

        - Redirect URL: **https://apex.oracle.com/pls/apex/apex_authentication.callback**

        - Post-logout redirect URL: **https://apex.oracle.com/pls/apex/r/<workspace_name>/<application name>/login**

    Click **Next**.

    ![Define Authentication](images/confidential-details.png " ")

10. Under **Configure policy**, leave as default and click **Finish**.

    ![Define Authentication](images/add-confidential.png " ")

11. Click **Activate** and **Activate application**.

    ![Define Authentication](images/click-activate.png " ")

    ![Define Authentication](images/activate-app.png " ")

12. Copy the *Client ID* and *Client secret* which we will use in the configuration on Oracle APEX.

    ![Define Authentication](images/copy-clientid.png " ")

13. Now, log in to your Oracle APEX workspace and navigate to **Workspace Utilities**.

    ![Define Authentication](images/select-web-creds1.png " ")

14. Select **Web Credentials**.

    ![Define Authentication](images/select-web-creds.png " ")

15. Under **Web Credentials**, click **Create**.

    ![Define Authentication](images/create-web-creds.png " ")

16. Enter/select the following information:

    - Name: **OCI IAM Credentials**

    - Authentication Type: **Basic Authentication**

    - Client ID or Username: Enter Client ID copied in **step 12**.

    - Client Secret or Password: Enter Client Secret copied in **step 12**.

    - Verify Client Secret or Password: Enter Client Secret copied in **step 12**.

    Click **Create**.

    ![Define Authentication](images/iam-creds.png " ")

17. Assign a user to this application. Navigate back to your Oracle cloud console, select **Users** and click **Assign users**.

    ![Define Authentication](images/add-users.png " ")

    ![Define Authentication](images/assign-users.png " ")

18. Also, under **Groups**, assign the group to the user you created.

19. Add a user *First name, Last name and Email* and click **Assign**.

    ![Define Authentication](images/assign-groups.png " ")

20. Log in to your Oracle APEX workspace and select **Online Shopping Application**.

    ![Define Authentication](images/select-online.png " ")

21. Click **Shared Components**. Under Security, click **Authentication Schemes**.

    ![Define Authentication](images/shared-comp-auth.png " ")

    ![Define Authentication](images/select-auth-scheme.png " ")

22. Click **Create**.

    ![Define Authentication](images/create-auth.png " ")

23. Enter/select the following information:

    - Name: **IAM**

    - Scheme Type: **Social Sign-In**

    - Credential Store: **OCI IAM Credentials**

    - Discovery URL: Enter the OpenID Connect provider's discovery URL. For example: https://[idcs-service-url]/.well-known/openid-configuration/.

    - Scope: **profile, email, groups**

    - Username: **#sub#**

    - Additional User Attributes: **groups**

    Click **Create Authentication Scheme**.

    ![Define Authentication](images/auth-create.png " ")

## Task 2: Implement Social Sign In(Google) Authentication in Online Shopping Application

 You create a Social Sign-in authentication scheme in this hands-on lab to enable Google Authentication.

1. Log in to Google's developer [console](https://console.developers.google.com).

    **Note**: If you are logging in to the Google developer console for the first time, you must check and click **AGREE AND CONTINUE**.

2. Click **Create Project**.

    ![Click My Apps](images/create-project1.png " ")

3. In the **New Project** Screen, for Project Name: Enter **APEX Social SignIn** and click **Create**.

    ![Click My Apps](images/new-project1.png " ")

4. Click the **OAuth consent screen** (from the left side menu), select **External**, and click **Create**

    ![Click My Apps](images/external.png " ")

5. In the OAuth consent screen, enter/select the following:

    - Under **App Information**:

        - Application name: Enter your **Application Name**

        - User support email: Enter your **Email Address**

    - App Domain  > Application Homepage link: Enter your **Application Homepage link**

    - Authorized domains > Click **+ADD DOMAIN**: Add your Authorized domain. For example, I added oracle.com

    - Developer contact information > Email addresses: Enter your **Email Address**

       Click **Save and Continue**.

    ![Click My Apps](images/oauth-consent-screen.png " ")

    ![Click My Apps](images/oauth-consent-screen1.png " ")

6. Under **Scopes**, leave everything as default and click **Save and Continue**.

    ![Click My Apps](images/scopes.png " ")

7. Under **Test users**, leave everything as default and click **Save and Continue**.

    ![Click My Apps](images/test-users.png " ")

8. Click **Credentials** (from left side menu). Click **+Create Credentials** and select **OAuth client ID**.

    ![Click My Apps](images/create-creds.png " ")

9. Enter/select the following:

    - Application type: **Web Application**

    - Name: **APEX Social Authentication**

    - Under Authorized redirect URLs, click **+Add URl**

        - URls 1: **https://apex.oracle.com/pls/apex/apex_authentication.callback**

    Click **Create**.

    ![Click My Apps](images/create-creds1.png " ")

10. You will get the *Client ID* and *Client secret*. Save these IDs. You will use them later.

    ![Click My Apps](images/creds-created.png " ")

11. Login to your APEX workspace and click **Workspace Utilities**.

    ![Select Workspace utilities](images/select-workspace-utilities.png " ")

12. Under **Workspace Utilities**, select **Web Credentials**.

    ![Select Web Credentials](images/select-web-credentials.png " ")

13. Click **Create**.

    ![Click Create](images/click-create.png " ")

14. In the **Web Credentials** enter/select the following:

    - Under **Attributes**:

        - Name: **Google SignIn**

        - Authentication Type: **OAuth2 Client Credentials**.

        - Client ID or Username: Enter the **Client ID** you copied in **Step 10**.

        - Client Secret or Password and Verify Client Secret or Password: Enter the **App Secret** you copied in **Step 10**.

    ![Define Web Credentials](images/create-web-cred1.png " ")

15. Click **Create**.

16. Navigate to **App Builder** and select **Online Shopping Application**.

    ![Navigate to Online shopping application](images/navigate-to-osa.png " ")

17. Click **Shared Components**.

    ![Select Shared Components](images/select-shared-components.png " ")

18. Under **Security**, select **Authentication Schemes**.

    ![Select Authentication Schemes](images/select-authentication.png " ")

19. In the **Authentication Schemes** page, click **Create**.

    ![Click Create](images/click-create22.png " ")

20. Under **Create Authentication Scheme** page, leave the settings to default and click **Next**.

    ![Create Authentication Scheme](images/create-auth1.png " ")

21. In the **Authentication Scheme**, enter/select the following:

    - Under Name:

        - Name: **Google**

        - Scheme Type: **Social Sign-In**

    - Under Settings:

        - Credential Store: **Google SignIn**

        - Authentication Provider: **Google**

        - Scope: **profile,email**

        - Username: **email,name,roles**

        Click **Create Authentication Scheme**.

    ![Define Authentication](images/create-auth2.png " ")

22. Click **Google** authentication, under **Login Processing**, select **Enabled** for **Switch in Session**. Do the same for **OCI** authentication as well.

    ![Define Authentication](images/create-auth4.png " ")

    ![Define Authentication](images/create-auth3.png " ")

## Task 3: Enable Multiple Authentication in Online Shopping Application

Providing multiple authentication options improves the flexibility and usability of your application. In this task, you will enhance the Online Shopping Application's login page by implementing a multi-authentication approach. Users will be able to choose between IAM authentication and Google sign-in. You will also customize the login page with buttons for each authentication type and apply styling for a polished user experience.

1. In your **Online Shopping Application**, navigate to **9999 - Login Page**.

    ![Define Authentication](images/login-page.png " ")

2. Right-click **Online Shopping Application** region, select **Create Sub-region**.

    ![Define Authentication](images/create-sub-region.png " ")

3. In the Property Editor, enter/select the following:

    - Identification > Name: **Multi Authentication**

    - Appearance > Template Options: Click **Use Template Defaults**

        - Header: **Hidden**

        Click **OK**

    ![Define Authentication](images/create-0btn2.png " ")

4. Right-click **Multi Authentication** sub-region, select **Create Button**.

    ![Define Authentication](images/create-btn1.png " ")

5. In the Property Editor, enter/select the following:

    - Under Identification:

        - Button Name: **IAM_Login**

        - Label: **IAM Authentication**

    - Under Appearance:

        - Button Template: **Text with Icon**

        - Template Options > Use Template Defaults: Width > **Stretch**

        Click **OK**

        - Icon: **fa-oracle-o**

    - Under Behavior:

        - Action: **Redirect to Page in this Application**

        - Target: Click **No Linked Defined**

            - Target > Page: **10000**

            - Advanced > Request: **APEX_AUTHENTICATION=IAM**

            Click **OK**

    ![Define Authentication](images/iam-btn.png " ")

6. Right-click **Multi Authentication** sub-region, select **Create Button**.

    ![Define Authentication](images/iam-btn1.png " ")

7. In the Property Editor, enter/select the following:

    - Under Identification:

        - Button Name: **Google_SignIn**

        - Label: **Google Sign In**

    - Layout > Start New Row: **Toggle Off**

    - Under Appearance:

        - Button Template: **Text with Icon**

        - Template Options > Use Template Defaults: Width > **Stretch**

        Click **OK**

        - Icon: **fa-google**

    - Under Behavior:

        - Action: **Redirect to Page in this Application**

        - Target: Click **No Linked Defined**

            - Target > Page: **10000**

            - Clear/Reset > Clear Cache: **APEX_AUTHENTICATION=Google**

            Click **OK**

    ![Define Authentication](images/google-btn1.png " ")

    ![Define Authentication](images/google-btn2.png " ")

8. Navigate to **Page 9999: Login Page**, update the following:

    - Inline: Copy and paste the below CSS

        ```
        <copy>
        span.t-Icon.t-Icon--left.fa.fa-oracle-o {
        color: red;
        }
        span.t-Icon.t-Icon--left.fa.fa-google {
        color: mediumslateblue;
        }
        </copy>
        ```

    ![Define Authentication](images/inline-css1.png " ")

9. Click **Save and Run**.

    > **Note:** If you get reader rights error while clicking on any authentication button, navigate to **User Interface Attributes** in shared components. Select **Security** tab and update **Authorization Scheme** to **- No application authorization required**.

    ![Define Authentication](images/multi-auth1.png " ")

## Summary

In this lab, you have successfully implemented secure authentication mechanisms for your Oracle APEX application
You now know how to create a Social Sign-in authentication scheme to enable Google and IAM Authentication. You may now **proceed to the next lab**.

## What's Next

In the next hands-on lab, you will learn to create and customize a Calendar page, a Tree page and a Map page with a custom background.

## Acknowledgements

- **Author** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, November 2024
