# Downloads

## Download Instructions

In this lab, you will learn how to download and import an export file of the app. This process is essential to run the app successfully and complete the tasks that depend on the exported file. By the end of this lab, you will have a fully functional app environment for further exploration and development.

## Task 1: Download the App Export

1. Download a lab export zip file from any lab. The export file is available after the introduction in all labs. The export file in any lab contains everything completed up to before that lab. The export files in the introduction and Lab 1 are the complete app exports.

## Task 2: Import the App into an APEX Workspace

1. Click **App Builder** and then click **Import**.

    !["Page Designer"](images/19-2-1.png "")

2. Drag and drop your downloaded zip file, then click **Next**.

    !["Page Designer"](images/19-2-2.png "")

3. Click **Install Application**.

    !["Page Designer"](images/19-2-3.png "")

4. Click **Next**.

    *Note: This screen will appear only if the imported app contains workspace utilities created in the previous labs.*

    !["Page Designer"](images/19-2-4.png "")

5. Click **Install Supporting Objects**.

    !["Page Designer"](images/19-2-5.png "")

## Task 3: Update the hashed password for user01

1. Expand **SQL Workshop**, click **Object Browser**.

    !["Page Designer"](images/19-3-1.png "")

2. Expand **Tables**, select **OBS\_USERS**, then click **Data**.

    !["Page Designer"](images/19-3-2.png "")

3. Click **Edit Icon** for user01, update the password to **secretPassword**, and click **Save**.

    !["Page Designer"](images/19-3-3.png "")

## Task 4: Update the Web Credential and Generative AI

Note: If you already have an OCI key pair, you may skip the step 1.

To Generate the API Keys using OCI Console:

1. To create an OCI API Key, refer to [Task 1: Generate API Keys using OCI Console](?lab=8-build-an-ai-assistant-chat-widget#Task1:GenerateAPIKeysusingOCIConsole) of [Lab 8: Build an AI-Assistant Chat Widget](?lab=8-build-an-ai-assistant-chat-widget)

To Configure Web Credentials in Oracle APEX:

2. Expand **App Builder**, then **All Workspace Utilities** and click **Workspace Utilities**.

    !["Page Designer"](images/19-4-2.png "")

3. Click **Web Credentials**.

    !["Page Designer"](images/19-4-3.png "")

4. Click **apex\_ai\_cred**.

    !["Page Designer"](images/19-4-4.png "")

5. Enter the following details using the configuration file you copied in the step 7 and click **Apply Changes**.

    - **OCI User ID**: Enter the OCID of the Oracle Cloud user Account. You can find the OCID in the Configuration File Preview generated during the API Key creation.
    Your OCI User ID looks similar to **ocid1.user.oc1..aaaaaaaa\*\*\*\*\*\*wj3v23yla**

    - **OCI Private Key**: Open the private key (.pem file) downloaded in the previous task. Copy and paste the API Key.

    - **OCI Tenancy ID**: Enter the OCID for Tenancy. Your Tenancy ID looks similar to **ocid1.tenancy.oc1..aaaaaaaaf7ush\*\*\*\*cxx3qka**

    - **OCI Public Key Fingerprint**: Enter the Fingerprint ID. Your Fingerprint ID looks similar to **a8:8e:c2:8b:fe:\*\*\*\*:ff:4d:40**

    !["Page Designer"](images/19-4-5.png "")

To Enable Generative AI in Oracle APEX:

6. Click **Workspace Utilities**.

    !["Page Designer"](images/19-4-6.png "")

7. Click **Generative AI**.

    !["Page Designer"](images/19-4-7.png "")

8. Click **OCI Gen AI**.

    !["Page Designer"](images/19-4-8.png "")

9. In the **Compartment ID** field, enter your **Compartment ID** and click **Apply Changes**. (Refer to the [Documentation](https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/contactingsupport_topic-Locating_Oracle_Cloud_Infrastructure_IDs.htm#:~:text=Finding%20the%20OCID%20of%20a,displayed%20next%20to%20each%20compartment.) to fetch your Compartment ID.)

    !["Page Designer"](images/19-4-9.png "")

## Task 5: Update the Picture URL

1. Navigate to **SQL Workshop** and select **RESTful Services**.

    !["Page Designer"](images/19-5-1.png "")

2. Expand **Modules**, then **User Images**, then **profile_pic/:id**, select **GET**, and copy and save the **Full URL**. You will use this information in the following steps.

    !["Page Designer"](images/19-5-2.png "")

3. Click **App Builder**.

    !["Page Designer"](images/19-5-3.png "")

4. Click **Online Bookstore**.

    !["Page Designer"](images/19-5-4.png "")

5. Click **Shared Components**.

    !["Page Designer"](images/19-5-5.png "")

6. Click **Application Computations**.

    !["Page Designer"](images/19-5-6.png "")

7. Click **Picture\_URL**.

    !["Page Designer"](images/19-5-7.png "")

8. In the else statement of the code, replace **<****picture\_url****>** with the URL you copied in step 2, up to **..profile_pic/**, and click **Apply Changes**.

    !["Page Designer"](images/19-5-8.png "")

## Task 6: Update the Google Auth Credential

1. To create an Google API Key, Refer to [Task 5: Login with Google](?lab=12-onboarding#Task5:LoginwithGoogle) of [Lab 12: Improve User Onboarding](?lab=12-onboarding), following steps 1 to 10.

2. Expand **App Builder**, then **All Workspace Utilities** and click **Workspace Utilities**.

    !["Page Designer"](images/19-6-2.png "")

3. Click **Web Credentials**.

    !["Page Designer"](images/19-6-3.png "")

4. Click **Google Authentication**.

    !["Page Designer"](images/19-6-4.png "")

5. Enter the following and click **Apply Changes**.

    - Under **Attributes**:

        - Client ID or Username: Enter the **Client ID** you copied above.
        - Client Secret or Password: Enter the **Client secret** you copied above.
        - Verify Client Secret or Password: Enter the **Client secret** you copied above.

    !["Page Designer"](images/19-6-5.png "")

## Task 7: Generate Push Notification Credentials and enable Push Notifications on the device

1. Click **App Builder**.

    !["Page Designer"](images/19-7-1.png "")

2. Click **Online Bookstore**.

    !["Page Designer"](images/19-7-2.png "")

3. Click **Shared Components**.

    !["Page Designer"](images/19-7-3.png "")

4. Click **Progressive Web App**.

    !["Page Designer"](images/19-7-4.png "")

5. Click **Push Notifications**.

    !["Page Designer"](images/19-7-5.png "")

6. Click **+ Generate Credentials** and click **Generate Credentials** in the confirm dialog window.

    !["Page Designer"](images/19-7-6.1.png "")

    !["Page Designer"](images/19-7-6.2.png "")

7. Click **Application ID**.

    !["Page Designer"](images/19-7-7.png "")

8. Click **Run Application**.

    !["Page Designer"](images/19-7-8.png "")

9. Click **Login** and enter the credentials of user01. (Username: user01, Password: secretPassword) and click **Sign In**

    !["Page Designer"](images/19-7-9.1.png "")
    !["Page Designer"](images/19-7-9.2.png "")

10. In the Online Bookstore App, click on your username at the top-right corner and select **Settings**.

    !["Page Designer"](images/19-7-10.png "")

11. Push Notifications is disabled by default. Click **Off** and enable the checkbox for **Enable push notifications on this device**.

    !["Page Designer"](images/19-7-11.png "")
    !["Page Designer"](images/19-7-11.2.png "")

## Task 8: Setup Compartment ID to run the Automation for AI Vision Service

1. Click **App Builder** and select **Online Bookstore**.

    !["Page Designer"](images/19-8-1.png "")

2. Click **Shared Components**.

    !["Page Designer"](images/19-8-2.png "")

3. Click **Automations**.

    !["Page Designer"](images/19-8-3.png "")

4. Click **Index Book Cover With OCI Vision**.

    !["Page Designer"](images/19-8-4.png "")

5. Under **Action** > Click **edit icon**.

    !["Page Designer"](images/19-8-5.png "")

6. Replace **#COMPARTMENT\_ID#** with your **COMPARTMENT\_ID** at two places in the following query and click **Apply Changes**.

    !["Page Designer"](images/19-8-6.png "")

## Task 9: Update the Razorpay Auth Credential

1. To create an Razorpay API Key, Refer to [Task 1: Create Web Credential](?lab=15-razorpay-payement-integration#Task1:CreateWebCredential) of [Lab 15: Razorpay Payment Gateway Integration](?lab=15-razorpay-payement-integration), following steps 1 to 4.

2. Expand **App Builder**, then **All Workspace Utilities** and click **Workspace Utilities**.

    !["Page Designer"](images/19-9-2.png "")

3. Click **Web Credentials**.

    !["Page Designer"](images/19-9-3.png "")

4. Click **Razorpay API**.

    !["Page Designer"](images/19-9-4.png "")

5. Enter the following and click **Apply Changes**.

    - Under **Attributes**:

        - Client ID or Username: Enter the **Key Id** you copied above.
        - Client Secret or Password: Enter the **Key Secret** you copied above.
        - Verify Client Secret or Password: Enter the **Key Secret** you copied above.

    !["Page Designer"](images/19-9-5.png "")

## Task 10: Update ICON_URL for the application icon in the emails

1. Click **App Builder**.

    !["Page Designer"](images/19-10-1.png "")

2. Click **Online Bookstore**.

    !["Page Designer"](images/19-10-2.png "")

3. Select Page **100001 - Email Verification for User SignUp**.

    !["Page Designer"](images/19-10-3.png "")

4. Navigate to **Processing**, expand **Send Verification Email** and select **Send Email Process**. Under Settings, click **Placeholder Values**, update **ICON_URL**, click OK and then click **Save**.

    - In **ICON\_URL**, replace **online\_bookstore\_app** with your **workspace\_name**, and update the domain apex.oracle.com if your environment differs.

    !["Page Designer"](images/19-10-4.png "")

5. Click **Page Finder** and select **Page 100002 - Email Verification for Forgot Password**.

    !["Page Designer"](images/19-10-5.png "")

6. Repeat step 4.

    !["Page Designer"](images/19-10-6.png "")

## Summary

In this lab, you will follow the download instructions to import an export file of the app. This will allow you to successfully run the app and complete the lab that relies on the exported file.

## Acknowledgements

- **Author**: Pankaj Goyal, Member Technical Staff
- **Last Updated By/Date**: Pankaj Goyal, Member Technical Staff, March 2025
<!-- | 19 | [Downloads](?lab=downloads#Task1:DownloadtheApp) | 1 minutes | -->