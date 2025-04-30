# Build a RAG Chatbot using Low-Code APEX

## Introduction

This lab walks the user 

Estimated time - 45 minutes

### Objectives

* Provision a 23ai ADB and APEX App
* Update the Credentials to Connect to OCI Resources
* Create the Application
* Connect Rest Sources
* Build the Question Panel
* Build the Chat Panel
* Test the application

### Prerequisites

* An OCI cloud account
* Subscription to US-Central Chicago Region

## Task 1: Provision a 23ai ADB and APEX App

1. Navitage to the OCI home console and expand the side-menu bar.

	![home menu bar](./images/home-menu.png "")

2. Select the **Oracle Database** and click the **Autonomous Database** Option.

	![Navigate to Autonmous Database](./images/nav-adb.png "")

3. Ensure you are in the correct compartment and select **Create Autonmous Database**. The region in which you provision the ADB doesn't matter as much as the previous GenAI services Lab as the ADB will use the service route to access the model. 

	![Console create ADB button](./images/create-adb-button.png "")

4. Give the ADB a unique name, such as **RAGLL**, select database version **23ai**, and provide a password. Leave everything else as default and click **Create**.

	![Name the ADB](./images/name-adb.png "")

	![Choose database version dropdown](./images/choose-23ai.png "")

5. Navigate to the newly created ADB by selecting the name that you provided, then click the **Tool Configuration** tab and select the Public Access URL **Copy** button for Oracle APEX. Paste that in a new tab.

	![Copy URL for APEX app](./images/open-apex.png "")

6. Enter your password used during the creation of the ADB and click **Sign in to Administration**.

	![Signin to Admin Portal](./images/access-admin.png "")

7. Create a new workspace by clicking **Create Workspace**.

	![Create workspace button](./images/create-workspace.png "")

8. Create a new schema by clicking the **New Schema** button.

	![New Schema button](./images/new-schema.png "")

9. Enter the following credentials and click **Create Workspace**.
	* **Workspace Name:** *RAG*
	* **Workspace Username:** *RAG*
	* **Workspace Password:** *Welcome2Oracle* (or choose a secure password that you will remember)

	![Create Credentials for Workspace](./images/workspace-creds.png "")

10. Sign out of the admin management by selecting the profile button on the top right and click **Sign out**

	![Sign out of admin console](./images/sign-out-admin.png "")

11. Click **Return to Sign in Page** 

	![Return to sign in page button](./images/return-sign-in.png "")

12. Sign in using the new credentials:
	* **Workspace Name:** *RAG*
	* **Workspace Username:** *RAG*
	* **Workspace Password:** *Welcome2Oracle* (or whichever password you chose to remember)

	![Sign in workspace credentials](./images/sign-in-workspace.png "")

## Task 2: Update the Credentials to Connect to OCI Resources

1. Click **App Builder** to access the Web Credentials.

	![App Builder Button](./images/app-builder.png "")

2. Click the **Workspace Utilities** button.

	![Workspace Utilities button](./images/workspace-utilities.png "")

3. Click the **Web Credentials** button.

	![Web Credentials Button](./images/web-credentials.png)

4. Click **Create** to update your web credentials.

	![Web Credentials Create button](./images/create-web-credentials.png "")

5. Paste the information collected in the first lab into the cooresponding fields (be sure to name the credentials and static ID: **api_key**) and select **Create**.

	![api_key credentials for oci access](./images/save-api-key-creds.png "")

## Task 3: Create the Application

1. Navigate back to the App Builder by selecting the menu button **App Builder**.

	![App Builder Button](./images/nav-app-builder.png "")

2. Create an application by selecting the **create** button.

	![create button on console](./images/create-app.png "")

3. Name the App **RAG Chatbot** and click **Create Application**.

	![Naming of the App](./images/name-app.png "") 

## Task 4: Create REST Data Sources

1. Navigate to Shared Components from the App Home Console by selecting the button **Shared Components**.

	![Navigate to Shared Components](./images/nav-shared-components.png "")

2. Select the button **REST Data Sources** under the Data Sources field.

	![Navigate to REST Data Sources](./images/nav-rest-data-sources.png "")

3. Select the button **Create** to create the Data Source.

	![Create button for REST Data Sources](./images/create-rest-data-sources.png "")

4. Select **Next** and leave the option default as **from Scratch**.

	![Default and Next Button](./images/create-from-scratch.png "")

5. Select Rest Data Type as **OCI**, then name the Rest Data Source **Object Storage** and paste the URL for the object storage rest url, which has the following format: **https:_//objectstorage._<region_>.oraclecloud.com/n/_<namespace_>/**. Select **Next** to continue.
	* Example region: us-chicago-1
	* Namespace: tenancy name 

	![Name and URL for Rest OS source](./images/object-rest.png)

6. Select **Next** leaving the url base as default.

	![Next button for base url](./images/next-path.png)

7. Select **api_key** from the drop-down options listed and click **Advanced** to proceed.

	![Api key dropdown button](./images/api-key-os.png)

8. Paste the following into the options and select **Discover** to proceed to view the output and save.
	
	* **Parameter Type:** URL Query String
	* **Parameter Name:** fields
	* **Value:** <copy>name,size,timeCreated,md5,timeModified,storagetier</copy>
	* **Is Static:** Yes

	![Options for advanced Parameters](./images/advanced-parameters.png)


## Task 5: Create Object Storage List Page

1. Naviate to the home page by clicking the **app name** in the breadcrumbs bar and then click the **home page** to begin editing.

	![Navigate using the breadcrumbs bar](./images/nav-home.png)

	![Navigate to begin working on the homepage](./images/nav-home-page.png)

Next we will create our first region to display the objects in the object storage bucket.

2. Right-click on the body of the editor and select **Create Region**.

	![Create new region](./images/create-region.png)

3. Modify the details to match the following:

	* **Name:** Object Storage List
	* **Type:** Classic Report
	* **Source:** **Location:** Rest Source, **Rest Source:** Object Storage

	![edit region for object storage table](./images/object-storage-list.png)

Next we will create the upload functionality to send files to object storage.

4. Create an **Upload Region** by right-clicking to the left side and select **Create Region**.

	![create upload region](./images/upload-region.png)

5. Name the region **Upload** and select the appearance to be **Inline Popup**

	![create and name inline popup](./images/inline-popup.png)

6. Right click the new region **Upload** and select **Create Page Item**. Name the item **P1_FILE** and select from the drop down **File Upload**.

	![create file upload](./images/p1-file.png)

	![select  file upload](./images/file-upload-type.png)

7. Right click the **Upload region** one more time and select **Create Button**. Name the button **UploadIngest** and use the label title **Upload & Ingest**. Enable **Hot** for the appearance.

	![select create button](./images/upload-button.png)

	![name and edit button](./images/edit-upload-button.png)

Next we will create the Open Upload Region Action. 

8. Right click the **Upload Button** and select **Create Dynamic Action**. Modify the options to the include the following for the **True** option:
	* **Name:** Open Region
	* **Action:** Open Region
	* **Selection Type:** Region
	* **Region:** Upload

	![dynamic action for upload button](./images/dynamic-upload-button.png)

	![true details for dynamic actions](./images/dynamic-action-edit.png)

9. Select the **process button** to create an Upload Process and right click to click **Create Process**. Name it **Upload & Ingest** and select **Execution Chain** for Type.

	![dynamic action for upload button](./images/nav-process.png)

10. Edit the Process

	![true details for dynamic actions](./images/dynamic-action-edit.png)


Thank you for completing this lab.

## Acknowledgements

* **Authors:**
	* Kevin Xie - Cloud Architect
	* Nicholas Cusato - Cloud Architect
	* Olivia Maxwell - Cloud Architect
	* Graham Shroyer - Cloud Architect
	* Rachel Ogle - Cloud Architect
* **Last Updated by/Date** - Nicholas Cusato, March 2025
