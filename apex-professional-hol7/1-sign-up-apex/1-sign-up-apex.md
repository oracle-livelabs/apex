# Provision an APEX Workspace

## Introduction

Oracle APEX is a low-code application platform for Oracle Database. APEX Application Development, Autonomous Data Warehouse (ADW), and Autonomous Transaction Processing (ATP) are fully managed services, pre-integrated and pre-configured with APEX, for rapidly building and deploying modern data-driven applications in Oracle Cloud. Business users, citizen, and application developers can create enterprise apps 20X faster with 100X less code — without having to learn complex web technologies with just a browser. To start, you will need to decide on the service you are going to use for this workshop, and then create an APEX workspace accordingly.

If you already have an APEX 22.x Workspace provisioned, you can skip this lab.

Estimated Time: 5 minutes
<!--
Watch the video below for a quick walk through of the lab.

[](youtube:RcSCnZnDzDE)
-->

### What is an APEX Workspace?
An APEX Workspace is a logical domain where you define APEX applications. Each workspace is associated with one or more database schemas (database users) which are used to store the database objects, such as tables, views, packages, and more. APEX applications are built on top of these database objects.

### How Do I Find My APEX Release Version?
To determine which release of Oracle APEX you are currently running, do one of the following:
* View the release number on the Workspace home page:
    - Sign in to Oracle APEX. The Workspace home page appears. The current release version displays in bottom right corner.

    ![APEX Home Page](./images/release-number.png " ")

    ![APEX Release Number](./images/release-number2.png " ")

* View the About APEX page:
    - Sign in to Oracle APEX. The Workspace home page appears.
    - Click the Help menu at the top of the page and select About. The About APEX page appears.

  ![APEX Details](images/version.png)

### Where to Run the Lab

You can run this lab in any Oracle Database with APEX 22.1 installed. This includes the APEX Application Development Service, the "Always Free" Oracle Autonomous Database, the free, "Development Only" apex.oracle.com service, your on-premises Oracle Database (providing APEX 22.1 is installed), on a third party cloud provider where APEX 22.1 is installed, or even on your laptop by installing Oracle XE or Oracle VirtualBox App Dev VM and installing APEX 22.1.

Below are steps on how to sign up for an *APEX Application Development* Service, or for an *Oracle Autonomous Database* cloud service or *apex.oracle.com* service.
- On the other hand, **apex.oracle.com** is also a free service; however, it is only designated for development purposes, and running production apps is not allowed. For conducting labs in this workshop, any of these options can be utilized.

- The **Always Free Oracle Autonomous Database** option is ideal for learning about the Oracle Database and APEX, and provides 1 OCPU and 20 GB of compressed storage. This service can also be utilized for production applications, and can readily be upgraded to a paid service as necessary.
- The **APEX Application Development Service** is great if you would like to go with a flexible paid option that allows to concentrate your efforts on APEX development without worrying about the database management. It provides 1 OCPU and 1 TB and can be extended as needed.

Click one of the options below to proceed.

## **Option 1**: apex.oracle.com

Signing up for apex.oracle.com is simply a matter of providing details on the workspace you wish to create and then waiting for the approval email.

1. Go to [https://apex.oracle.com](https://apex.oracle.com.).
2. Click **Get Started for Free**.

    ![Get started for free](images/getting-started.png " ")

3. Scroll down until you see details for apex.oracle.com.  Click **Request a Free Workspace**.

    ![Request a free workspace](images/request-workspace.png " ")

4. On the Request a Workspace dialog, enter your Identification details – First Name, Last Name, Email, Workspace.

   *Note: For workspace, enter a unique name, such as first initial and last name.*

    Click **Next**.

    ![Workspace Request](images/request-new-workspace.png " ")

5. Complete the remaining wizard steps.

  Fill the **Survey** and click **Next**

  ![Survey](images/filling-survey.png " ")

  Provide proper Justification under **Why are you requesting this service?**, and click **Next**.

  ![Justification](images/request-justification.png " ")

  Now, Please accept **Terms** of **Oracle APEX Service Agreement** and then **Submit Request**

  ![Agreement](images/accepting-agreement.png " ")

  ![Confirmation](images/submit-request2.png " ")

6. Check your email. You should get an email from `oracle-application-express_ww@oracle.com` within a few minutes.  
   *Note: If you don’t get an email go back to Step 3 and make sure to enter your email correctly.*

    Within the email body, click **Create Workspace**.

    ![Create Workspace](images/create-workspace3.png " ")

7. Click **Continue to Sign In Screen**.

  ![Continue to Sign In screen](images/continue-to-sign-in.png " ")

8. Enter your password, and click **Apply Changes**.

  ![Change password](images/enter-password.png " ")

9. On the APEX Workspace log in page, enter SecretPassw0rd for the password, check the Remember workspace and username checkbox, and then click Sign In.

  ![Sign In](images/login-to-workspace1.png " ")  

9. You should now be in the APEX Builder.

    ![APEX Builder](images/app-builder1.png " ")


## **Option 2**: Oracle Autonomous Database

In this part, you will create an Oracle Cloud trial account. Once you have signed up for the service, you will create an *Autonomous Transaction Processing* database. The final step in the process is to provision Oracle APEX.

1.  Please [click this link to create your free account](https://signup.cloud.oracle.com). When you complete the registration process, you'll receive an account with a $300 credit and several "forever free" services that will enable you to complete the workshop for free. You can then use any remaining credit to continue to explore the Oracle Cloud. The forever free services will continue to work after the trial expires.

2.  Soon after requesting your trial, you will receive a  **Get Started Now with Oracle Cloud** email.   
    Make note of your **Username**, **Password**, and **Cloud Account Name**.

    ![Get Started Now with Oracle Cloud](images/get-started-email.jpeg " ")

3. Now that you have a service, you will log into your Oracle Cloud account, so that you can start working with various services.        
    From any browser go to [https://cloud.oracle.com/en_US/sign-in](https://cloud.oracle.com/en_US/sign-in).

    Enter your **Cloud Account Name** in the input field and click the **Next** button.

    ![Enter your Cloud Account Name](images/enter-oracle-cloud-account-name.png " ")

4. Enter your **User Name** and **Password** in the input fields, and click **Sign In**.

    ![Sign In](images/enter-user-name-and-password.png " ")

5. From within your Oracle Cloud environment, you will create an instance of the Autonomous Transaction Processing database service.

    From the Cloud Dashboard, select the navigation menu icon in the upper left-hand corner and then select **Autonomous Transaction Processing**.

    ![](https://oracle-livelabs.github.io/common/images/console/database-atp.png " ")

    From the Cloud Dashboard, select the **Navigation Menu** in the upper left

    ![Navigation Menu](images/oci-navigation-menu.png " ")

    Select **Autonomous Transaction Processing**.

    ![Autonomous Transaction Processing](images/create-atp.png " ")

6. Click **Create Autonomous Database**.

    ![Create Autonomous Database](images/click-create-autonomous-database.png " ")

7. Select the **Always Free** option, enter **```SecretPassw0rd```** for the ADMIN password, then click **Create Autonomous Database**.

    ![Always Free option](images/atp-setings1.png " ")
    ![Configure the database](images/atp-setings2.png " ")
    ![Create administrator credentials](images/atp-setings3.png " ")

8. After clicking **Create Autonomous Database**, you will be redirected to the Autonomous Database Details page for the new instance.

    Continue when the status changes from:

    ![ATP Provisioning](images/status-provisioning.png " ")

    to:

    ![ATP Available](images/status-available.png " ")

9. Within your new database, APEX is not yet configured. Therefore, when you first access APEX, you will need to log in as an APEX Instance Administrator to create a workspace.

    Click the **Tools** tab.
    Click **Open APEX**.

    ![APEXATP](images/open-apex.png " ")

    *Note: Always Free Autonomous Database will be stopped after being inactive for 7 days. If that happens, you need to click **More Actions** and then **Start** to start your Autonomous Database, and then **Open APEX**.*

10. Enter the password for the Administration Services and click **Sign In to Administration**.     
    The password is the same as the one entered for the ADMIN user when creating the ATP instance: **```SecretPassw0rd```**

    ![Welcome to Oracle APEX ](images/admin-login.png " ")

11. Click **Create Workspace**.

    ![Create Workspace](images/create-workspace.png " ")

12. In the Create Workspace dialog, enter the following:

    | Property | Value |
    | --- | --- |
    | Database User | LOWCODE |
    | Password | **`SecretPassw0rd`** |
    | Workspace Name | LOWCODE |

    Click **Create Workspace**.

    ![Click Create Workspace](images/create-workspace1.png " ")

13. In the APEX Instance Administration page, click the **LOWCODE** link in the success message.         
    *Note: This will log you out of APEX Administration so that you can log into your new workspace.*

    ![Click LOWCODE](images/logout-from-admin.png " ")

14. On the APEX Workspace log in page, enter **``SecretPassw0rd``** for the password, check the **Remember workspace and username** checkbox, and then click **Sign In**.

    ![APEX Sign In](images/login-to-workspace.png " ")

## **Option 3**: Oracle APEX Application Development Service
In this part, you will create an Oracle APEX Application Development Service trial account. Once you have signed up for the service, you will create an *APEX Service*. The final step in the process is to provision Oracle APEX.

1.  Please [click this link to create your free account](https://signup.cloud.oracle.com/). When you complete the registration process, you'll receive an account with a $300 credit that you can utilize to create an APEX Service. You can then use any remaining credit to continue to explore the Oracle Cloud.

2.  Once the Signup process is complete, you will be logged in automatically to the Oracle Cloud Infrastructure (OCI) Console.
    -  In case you have closed the browser, you can always refer to the **Get Started Now with Oracle Cloud** email that you should have received to login to OCI Console.   
    Make a note of your **Username**, **Password**, and **Cloud Account Name**.

        ![Get started now with Oracle Cloud](images/get-started-email.jpeg " ")

    - Alternatively, you can login to your Oracle Cloud account by accessing the following URL from your browser:       
    [https://cloud.oracle.com](https://cloud.oracle.com)

        Enter your **Cloud Account Name** in the input field and click the **Next** button.

        ![Cloud Account Name](images/enter-oracle-cloud-account-name.png " ")

        Enter your **User Name** and **Password** in the input fields, and click **Sign In**.

        ![Oracle Cloud Account Sign In](images/enter-user-name-and-password.png " ")

3. From within your Oracle Cloud environment, you will create an instance of the Oracle APEX Application Development Service.

    Click the **Navigation Menu** in the upper left

    ![Oracle Cloud Navigation Menu](images/navigation.png " ")

    Navigate to **Developer Services**, and select **APEX Instances**.

    ![Oracle Cloud Developer Services](images/navigate-to-dev-services.png " ")

4. Select a Compartment and Click **Create APEX Service**.

    ![Create APEX Service](images/apxs-apex-create-apex-service-btn.png " ")

5. Enable the **Always Free** option.
   Select **19c** for the database version.
   Enter **```SecretPassw0rd```** for the ADMIN password then click **Create APEX Service**.

    ![Create APEX Instances](images/apxs-apex-create-apex-service-btn.png " ")

6. After clicking **Create APEX Service**, you will be redirected to the APEX Application Development Details page for the new instance.

    Continue when the status changes from:

    ![APX Provisioning](images/apxs-status-provisioning.png " ")

    to:

    ![APX available](images/apxs-status-available.png " ")

7.  Within your new APEX Application Development Service, APEX Workspace is not yet configured. Therefore, when you first access APEX, you will need to log in as an APEX Instance Administrator to create a workspace.

    Click **Launch APEX**.

    ![APEXLowcode](images/apxs-launch-apex.png " ")

    *Note: APEX Application Development Service is a paid service. You will be able to use APEX Service trial only if you have a new Free Cloud account or you are within the trial period. To Stop the APEX Service from consuming your trial credit, you need to stop the Autonomous Database behind it.*
<!--
     Click on the Database name under **APEX Instance Information** tab in the **APEX Instance Details** page:*

    ![](images/apxs-apex-db-name.png " ")

    *Click* **Stop***

    ![](images/apxs-apex-stop-start-restart.png " ") -->
8.  Enter the password for the Administration Services and click **Sign In to Administration**.     
    The password is the same as the one entered for the ADMIN user when creating the APEX instance: **```SecretPassw0rd```**

    ![Sign In To Administration](images/admin-login.png " ")

9.  Click **Create Workspace**.

    ![Create Workspace](images/create-workspace.png " ")

10. In the Create Workspace dialog, enter the following:

    | Property | Value |
    | --- | --- |
    | Database User | LOWCODE |
    | Password | **`SecretPassw0rd`** |
    | Workspace Name | LOWCODE |

    Click **Create Workspace**.

    ![Enter Workspace Credentials](images/create-workspace1.png " ")

11. In the APEX Instance Administration page, click the **LOWCODE** link in the success message.         
    *Note: This will log you out of APEX Administration so that you can log into your new workspace.*

    ![APEX Instance Administration page](images/logout-from-admin.png " ")

12. On the APEX Workspace log in page, enter **``SecretPassw0rd``** for the password, check the **Remember workspace and username** checkbox, and then click **Sign In**.

    ![check the Remember workspace and username](images/login-to-workspace.png " ")


## **Summary**

At this point, you know how to create an APEX Workspace and you are ready to start building amazing apps, fast.

You may now **proceed to the next lab**.

## **Acknowledgements**

 - **Author** -  Roopesh Thokala, Product Manager
 - **Contributors** -
 - **Last Updated By/Date** - Roopesh Thokala, Product Manager, March 2022
