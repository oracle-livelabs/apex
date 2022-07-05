# Setup Oracle APEX in Autonomous Database/Sign up for Workspace in apex.oracle.com

## Introduction

Oracle Application Express (APEX) is a feature of Oracle Database, including the Autonomous Data Warehouse (ADW) and Autonomous Transaction Processing (ATP) services. To start, you will need to decide which Oracle Database you are going to use for the workshop, and then create an APEX workspace in that database.

If you already have an APEX 20.1 Workspace provisioned, you can skip this lab.

Estimated Lab Time: 15 minutes

### Objectives

* Setup Oracle APEX Workspace with wizard

### Prerequisites

- An Oracle Cloud Infrastructure account with IAM privileges to provision Autonomous database
- Alternatively , an user account with apex.oracle.com can also be used for Oracle APEX


## About Oracle APEX

### What is an APEX Workspace?
An APEX Workspace is a logical domain where you define APEX applications. Each workspace is associated with one or more database schemas (database users) which are used to store the database objects, such as tables, views, packages, and more. APEX applications are built on top of these database objects.

### How Do I Find My APEX Release Version?
To determine which release of Oracle Application Express you are currently running, do one of the following:
* View the release number on the Workspace home page:
    - Sign in to Oracle Application Express. The Workspace home page appears. The current release version displays in bottom right corner.

    ![Release number on workspace home page.](images/release-number.png " ")
    ![Release number detail.](images/release-number2.png " ")

* View the About Application Express page:
    - Sign in to Oracle Application Express. The Workspace home page appears.
    - Click the Help menu at the top of the page and select About. The About Application Express page appears.


    ![Release number from help menu.](images/version.png)

### Where to Run the Lab
You can run this lab in any Oracle Database with APEX 20.2 installed. This includes the APEX Application Development Service , "Always Free" Oracle Autonomous Database, the free, "Development Only" apex.oracle.com service, your on-premises Oracle Database (providing APEX 20.2 is installed), on a third party cloud provider where APEX 20.2 is installed, or even on your laptop by installing Oracle XE or Oracle VirtualBox App Dev VM and installing APEX 20.2.

Below are steps on how to sign up for *APEX Application Development Service* or *Oracle Autonomous Database* cloud service or *apex.oracle.com* service. The APEX Application Development Service provides APEX with free Oracle Autonomous Database or Always Free Oracle Autonomous Database is ideal for learning about the Oracle Database and APEX, and provides 1 OCPU and 20 GB of compressed storage. This service can also be utilized for production applications, and can readily be upgraded to a paid service as necessary. On the other hand, apex.oracle.com is also a free service; however, it is only designated for development purposes, and running production apps is not allowed. For conducting labs in this workshop, any of the  service can be utilized.

Click one of the options below to proceed.

## **Option 1**: APEX Application Development Service
In this part, you will create an Oracle Cloud trial account. Once you have signed up for the service, you will create an *Autonomous Transaction Processing* database. The final step in the process is to provision Oracle APEX.

1.  Please [click this link to create your free account](https://myservices.us.oraclecloud.com/mycloud/signup?language=en). When you complete the registration process, you'll receive an account with a $300 credit and several "forever free" services that will enable you to complete the workshop for free. You can then use any remaining credit to continue to explore the Oracle Cloud. The forever free services will continue to work after the trial expires.

2.  Soon after requesting your trial, you will receive a  **Get Started Now with Oracle Cloud** email.   
    Make note of your **Username**, **Password**, and **Cloud Account Name**.

    ![Automated email with account information.](images/get-started-email.png " ")

3. Now that you have a service, you will log into your Oracle Cloud account, so that you can start working with various services.        
    From any browser go to [https://cloud.oracle.com/en_US/sign-in](https://cloud.oracle.com/en_US/sign-in).

    Enter your **Cloud Account Name** in the input field and click the **Next** button.

    ![Enter Oracle Cloud account name.](images/enter-oracle-cloud-account-name.png " ")

4. Enter your **User Name** and **Password** in the input fields, and click **Sign In**.

    ![Sign in to Oracle cloud environment.](images/enter-user-name-and-password.png " ")

5. From within your Oracle Cloud environment, you will create *APEX Instance* from *APEX application development* service under *Database Related Service* section.

  From the Cloud Dashboard, select the navigation menu icon in the upper left-hand corner and then select **APEX application development**.


6. Click **Create APEX Instances** ,  Click on **Create APEX Service** to create the APEX instance.

7. Enter **Display Name** and **Database Name** if you choose to change from the default to user friendly name


7. Select the **Always Free** option, enter **```SecretPassw0rd```** for the ADMIN password, then click **Create APEX Service**.

    ![Basic info for APEX service.](images/apex-service1.png " ")
    ![Configure APEX service.](images/apex-service2.png " ")
    ![Create administrator credentials.](images/apex-service3.png " ")
    ![Create APEX service.](images/apex-service4.png " ")

8. Click *Create Apex Service* to finish the setup.
you will be redirected to the Autonomous Database Details page for the new instance.

    Continue when the status changes from:

    ![APEX service provisioning.](images/apx-provisioning.png " ")

    to:

    ![APEX service available.](images/apex-available.png " ")

9. Within your new service, APEX workspace is not yet configured. Therefore, when you first access APEX, you will need to log in as an APEX Instance Administrator to create a workspace.

    Click the **Launch APEX** tab.

    ![Launch APEX.](images/launch-apex.png " ")

    ![Login with administrator credentials.](images/admin-apex.png " ")

10. Enter the password for the Administration Services and click **Sign In to Administration**.     
The password is the same as the one entered for the ADMIN user when creating the apexcicd instance: **```SecretPassw0rd```**

    ![Enter administrator password.](images/admin-apex.png " ")

11. Click **Create Workspace**.

    ![Click create workspace.](images/welcome-create-workspace.png " ")

12. In the Create Workspace dialog, enter the following:

        | Property | Value |
        | --- | --- |
        | Database User | DEMO |
        | Password | **`SecretPassw0rd`** |
        | Workspace Name | DEMO |

        Click **Create Workspace**.

    ![Enter the credentials to create workspace.](images/create-workspace.png " ")

13. In the APEX Instance Administration page, click the **DEMO** link in the success message.         
  *Note: This will log you out of APEX Administration so that you can log into your new workspace.*

  ![Click demo in the success message.](images/log-out-from-admin.png " ")

14. On the APEX Workspace log in page, enter **``SecretPassw0rd``** for the password, check the **Remember workspace and username** checkbox, and then click **Sign In**.

  ![Enter the established password in APEX workspace.](images/log-in-to-workspace.png " ")

## **Option 2**: Oracle Autonomous Database

In this part, you will create an Oracle Cloud trial account. Once you have signed up for the service, you will create an *Autonomous Transaction Processing* database. The final step in the process is to provision Oracle APEX.

1.  Please [click this link to create your free account](https://myservices.us.oraclecloud.com/mycloud/signup?language=en). When you complete the registration process, you'll receive an account with a $300 credit and several "forever free" services that will enable you to complete the workshop for free. You can then use any remaining credit to continue to explore the Oracle Cloud. The forever free services will continue to work after the trial expires.

2.  Soon after requesting your trial, you will receive a  **Get Started Now with Oracle Cloud** email.   
    Make note of your **Username**, **Password**, and **Cloud Account Name**.

    ![Automated email with account credentials.](images/get-started-email.png " ")

3. Now that you have a service, you will log into your Oracle Cloud account, so that you can start working with various services.        
    From any browser go to [https://cloud.oracle.com/en_US/sign-in](https://cloud.oracle.com/en_US/sign-in).

    Enter your **Cloud Account Name** in the input field and click the **Next** button.

    ![Enter account name for Oracle Cloud.](images/enter-oracle-cloud-account-name.png " ")

4. Enter your **User Name** and **Password** in the input fields, and click **Sign In**.

    ![Sign in to Oracle Cloud account.](images/enter-user-name-and-password.png " ")

5. From within your Oracle Cloud environment, you will create an instance of the Autonomous Transaction Processing database service.

    From the Cloud Dashboard, select the navigation menu icon in the upper left-hand corner and then select **Autonomous Transaction Processing**.

    ![Select Autonomous Transaction Processing from menu.](https://oracle-livelabs.github.io/common/images/console/database-atp.png " ")

6. Click **Create Autonomous Database**.

    ![Create Autonomous Database.](images/click-create-autonomous-database.png " ")

7. Select the **Always Free** option, enter **```SecretPassw0rd```** for the ADMIN password, then click **Create Autonomous Database**.

    ![Enter database name.](images/atp-settings-1.png " ")
    ![Enter established password for admin credentials.](images/atp-settings-2.png " ")
    ![Click create autonomous database.](images/atp-settings-3.png " ")

8. After clicking **Create Autonomous Database**, you will be redirected to the Autonomous Database Details page for the new instance.

    Continue when the status changes from:

    ![Provisioning.](images/status-provisioning.png " ")

    to:

    ![Available.](images/status-available.png " ")

9. Within your new database, APEX is not yet configured. Therefore, when you first access APEX, you will need to log in as an APEX Instance Administrator to create a workspace.

    Click the **Tools** tab.
    Click **Open APEX**.

    ![Select APEX from database tools.](images/click-apex.png " ")

    *Note: Always Free Autonomous Database will be stopped after being inactive for 7 days. If that happens, you need to click **More Actions** and then **Start** to start your Autonomous Database, and then **Open APEX**.*

10. Enter the password for the Administration Services and click **Sign In to Administration**.     
    The password is the same as the one entered for the ADMIN user when creating the ATP instance: **```SecretPassw0rd```**

    ![Sign in to APEX administration.](images/log-in-as-admin.png " ")

11. Click **Create Workspace**.

    ![Create APEX workspace.](images/welcome-create-workspace.png " ")

12. In the Create Workspace dialog, enter the following:

    | Property | Value |
    | --- | --- |
    | Database User | DEMO |
    | Password | **`SecretPassw0rd`** |
    | Workspace Name | DEMO |

    Click **Create Workspace**.

    ![Enter information and create workspace.](images/create-workspace.png " ")

13. In the APEX Instance Administration page, click the **DEMO** link in the success message.         
    *Note: This will log you out of APEX Administration so that you can log into your new workspace.*

    ![Click demo in the success message.](images/log-out-from-admin.png " ")

14. On the APEX Workspace log in page, enter **``SecretPassw0rd``** for the password, check the **Remember workspace and username** checkbox, and then click **Sign In**.

    ![Log in to APEX workspace with established credentials.](images/log-in-to-workspace.png " ")

## **Option 3**: apex.oracle.com
Signing up for apex.oracle.com is simply a matter of providing details on the workspace you wish to create and then waiting for the approval email.

1. Go to [https://apex.oracle.com](https://apex.oracle.com.).
2. Click **Get Started for Free**.

    ![Click get started for free.](images/get-started.png " ")

3. Scroll down until you see details for apex.oracle.com.  Click **Request a Free Workspace**.

    ![Click request a free workspace.](images/request-workspace.png " ")

4. On the Request a Workspace dialog, enter your Identification details – First Name, Last Name, Email, Workspace.
   *Note: For workspace, enter a unique name, such as first initial and last name.*

    Click **Next**.

    ![Enter identification information to create workspace.](images/request-a-workspace.png " ")

5. Complete the remaining wizard steps.

6. Check your email. You should get an email from `oracle-application-express_ww@oracle.com` within a few minutes.  
   *Note: If you don’t get an email go back to Step 3 and make sure to enter your email correctly.*

    Within the email body, click **Create Workspace**.

    ![Click create workspace in body of automated email.](images/create-aoc-workspace.png " ")

7. Click **Continue to Sign In Screen**.
8. Enter your password, and click **Apply Changes**.
9. You should now be in the APEX Builder.

    ![You should now be in APEX builder.](images/apex-builder.png " ")

## Summary

 At this point, you know how to create an APEX Workspace and you are now ready to start migrating forms Application.

You may now *proceed to the next lab*.

## Acknowledgements

- **Author** -  Vanitha Subramanyam, Senior Solution Architect
- **Contributors** - Abhinav Jain, Staff Cloud Engineer, Sakthikumar Periyasamy Senior Cloud Engineer, Nayan Karumuri Staff Cloud Engineer
- **Last Updated By/Date** - Andres Quintana, March 2022



