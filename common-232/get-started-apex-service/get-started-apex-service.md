# Sign up for an APEX Workspace

## Introduction

Oracle APEX is a low-code application platform for Oracle Database. APEX Application Development, Autonomous Data Warehouse (ADW), Autonomous Transaction Processing (ATP), and Autonomous JSON Database are fully managed services, pre-integrated and pre-configured with APEX, for rapidly building and deploying modern data-driven applications in Oracle Cloud. Business users, citizen, and application developers can create enterprise apps 20X faster with 100X less code — without having to learn complex web technologies with just a browser. To start, you will need to decide on the service you are going to use for this workshop, and then create an APEX workspace accordingly. Continue reading further to learn which is the best service for you!

Estimated Time: 5 minutes


### What is an APEX Workspace?
An APEX Workspace is a logical domain where you define APEX applications. Each workspace is associated with one or more database schemas (database users) which are used to store the database objects, such as tables, views, packages, and more. APEX applications are built on top of these database objects.

## Create an APEX Service Instance

Oracle Application Development (APEX Service) is a low cost Oracle Cloud service offering convenient access to the Oracle APEX platform. Visit [https://apex.oracle.com/en/platform/apex-service/](https://apex.oracle.com/en/platform/apex-service/) to learn more about APEX service on Oracle Cloud.

In this part, you will create an Oracle APEX Application Development Service trial account. Once you have signed up for the service, you will create an *APEX Service*. The final step in the process is to provision Oracle APEX workspace.

1.  Please [click this link to create your free account](https://signup.cloud.oracle.com/). When you complete the registration process, you'll receive an account with a $300 credit that you can utilize to create an APEX Service. You can then use any remaining credit to continue to explore the Oracle Cloud.

2. Once the Signup process is complete, you will be logged in automatically to the Oracle Cloud Infrastructure (OCI) Console.
    -  In case you have closed the browser, you can always refer to the **Get Started Now with Oracle Cloud** email that you should have received to login to OCI Console.   
    Make a note of your **Username**, **Password**, and **Cloud Account Name**.

        ![Oracle Cloud login page](images/get-started-email.png " ")

    - Alternatively, you can login to your Oracle Cloud account by accessing the following URL from your browser:       
    [https://cloud.oracle.com](https://cloud.oracle.com)

        Enter your **Cloud Account Name** in the input field and click the **Next** button.

        ![Cloud login](images/enter-oracle-cloud-account-name.png " ")

        Enter your **User Name** and **Password** in the input fields, and click **Sign In**.

        ![Cloud login](images/enter-user-name-and-password.png " ")

3. On the OCI Console home page, under Quickstarts, click **Deploy a low-code app on Autonomous Database using APEX** card to launch the quickstart.

    ![Cloud homepage](images/quickstart-deploy-apex.png " ")

4. A drawer opens with an overview of the steps that the package will execute to deploy the APEX instance. Click **Continue**.

    ![Deploy overview](images/overview-steps.png " ")

5. Provide a password for the ADMIN database user that will be created in the Autonomous Database that gets deployed behind the scenes. This password will also be used to login into the APEX Administrative Services account. Click **Start Deployment**.

    ![Enter Password details](images/enter-password.png " ")

6. The deployment process is triggered. Notice the progress of each step in the deployment process.

    ![Deployment Process Steps](images/deploy-process.png " ")

7. After the completion of the deployment process, click **Launch APEX** to launch APEX Administrative Services.

    ![Deployment Process Complete Screen](images/launch-apex.png " ")


8. The Administration Services Sign In page appears. Enter the password for the Administration Services and click **Sign In to Administration**.
  The password is the same as the one entered for the ADMIN user when creating the APEX service: **```SecretPassw0rd```**
  ![APEX instance admin login page](images/log-in-as-admin.png " ")

9. Click **Create Workspace**.

  ![Create Workspace](images/welcome-create-workspace.png " ")

10. Depending on how you would like to create your workspace, select **New Schema** or **Existing Schema**. If you are getting started, select **New Schema**.

  ![Choose type of schema](images/choose-schema.png " ")

10. In the Create Workspace dialog, enter the following:

    | Property | Value |
    | --- | --- |
    | Workspace Name | DEMO |
    | Workspace Username | DEMO |
    | Workspace Password | **`SecretPassw0rd`** |

  Click **Create Workspace**.

  ![Create Workspace dialog](images/create-workspace.png " ")

11. In the APEX Instance Administration page, click the **DEMO** link in the success message.         
  *Note: This will log you out of APEX Administration so that you can log into your new workspace.*

  ![APEX Instance Administration page](images/log-out-from-admin.png " ")

12. On the APEX Workspace log in page, enter **``SecretPassw0rd``** for the password, check the **Remember workspace and username** checkbox, and then click **Sign In**.

  ![APEX Workspace log in page](images/log-in-to-workspace.png " ")

  ## **Acknowledgements**

   - **Author** -  Apoorva Srinivas, Senior Product Manager
   - **Last Updated By/Date** - Apoorva Srinivas, Senior Product Manager, July 2022
