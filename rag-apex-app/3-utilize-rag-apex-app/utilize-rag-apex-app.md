# Build an Upload and Ingest for AI Agent using Low-Code APEX

## Introduction

This lab walks the user through the process of building an APEX and completing the first half of the application - the Upload & Ingest functionality. Using the OCI REST Data Source of Object Storage, the user can see what is in the Bucket that their knowledge base will be trained on. By executing a process to trigger the Ingest, the AI Agent will be trained on the newest data loaded. 

Estimated time - 45 minutes

### Objectives

* Provision a 23ai ADB and APEX App
* Update the Credentials to Connect to OCI Resources
* Create the Application
* Create REST Data Sources
* Create Object Storage List Page
* Test Upload Functionality
* (Optional) Double check that the Ingestion job has fired

### Prerequisites

* An OCI cloud account
* Subscription to US-Central Chicago Region
* Previous Lab has been completed

## Task 1: Provision a 23ai ADB and APEX App

1. Navitage to the OCI home console and expand the side-menu bar.

	![home menu bar](./images/home-menu.png "")

2. Select the **Oracle Database** and click the **Autonomous Database** Option.

	![Navigate to Autonmous Database](./images/nav-adb.png "")

3. Ensure you are in the correct compartment and select **Create Autonomous Database**. The region in which you provision the ADB doesn't matter as much as the previous GenAI services Lab as the ADB will use the service route to access the model. 

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

5. Select Rest Data Type as **OCI**, then name the Rest Data Source **Object Storage** and paste the URL for the object storage rest url, which has the following format: **https://objectstorage.<region\_>.oraclecloud.com/n/\_<namespace\_>/b/RAG/o/**. Select **Next** to continue.
	* Example region: us-chicago-1
	* Namespace: Object storage namespace

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


9. Observe the object listed in the bucket and select **Create REST Data Source** to complete the discovery. 

	![Complete REST discovery](./images/create-rest-data-source-complete.png)

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

8. Right click the region **Object Storage List** and select **Create Button**. Name it **Upload**, then right click and select **Create Dynamic Action**. Modify the options to the include the following for the **True** option:
	* **Name:** Open Region
	* **Action:** Open Region
	* **Selection Type:** Region
	* **Region:** Upload

	![dynamic action for upload button](./images/dynamic-upload-button.png)

	![true details for dynamic actions](./images/dynamic-action-edit.png)

9. Select the **process button** to create an Upload Process and right click to click **Create Process**. Name it **Upload & Ingest** and select **Execution Chain** for Type.

	![dynamic action for upload button](./images/nav-process.png)

	![naming of process with execution chain](./images/upload-ingest-process.png)

10. Edit the Process by right clicking the process and select **Add Child Process**.

	![add child process button](./images/upload-child.png)

11. Name the child process **Upload to Object Storage** and select **PL/SQL** and paste the following in the box:

	```
	<copy>
	declare
	l_request_url	varchar2(32767);
	l_content_length	number;
	l_response	clob;
	upload_failed_exception	exception;
	l_request_object	blob;
	l_request_filename	varchar2(500);
	begin
	select blob_content,filename into l_request_object,l_request_filename from apex_application_temp_files where name = :P1_FILE;
	l_request_url := ' https://objectstorage.us-chicago-1.oraclecloud.com/n/<namespace>/b/RAG/o/' || utl_url.escape(l_request_filename);
	l_response := apex_web_service.make_rest_request(
	p_url => l_request_url,
	p_http_method => 'PUT',
	p_body_blob => l_request_object,
	p_credential_static_id => 'api_key'
	);
	END; 
	</copy>
	```

* **Note:** Be sure to edit the variable **l\_request\_url** to include the correct namespace for you tenancy. 

	![name the child process and add pl/sql](./images/plsql-process.png)

12. Repeate the last step by right clicking the Process and **add a child process**. Name it the following: **Ingest** and paste the following PL/SQL:

	```
	<copy>
	declare
	 c_agent_endpoint_id constant varchar2(1024) :=
	  'ocid1.genaiagentendpoint.oc1.us-chicago-1.xxxxxxxxxxxxxx';
	 l_response clob;
	begin
	 apex_web_service.set_request_headers(
	  p_name_01 => 'Content-Type'
	  , p_value_01 => 'application/json'
	 );
	l_response := apex_web_service.make_rest_request(
	  p_http_method => 'POST'
	  , p_url =>
		'https://agent.generativeai.us-chicago-1.oci.oraclecloud.com'
		|| '/20240531/dataIngestionJobs'
	  , p_credential_static_id => 'api_key'
	  , p_body => json_object(
		key 'compartmentId' value 'ocid1.compartment.oc1..xxxxxxxxxxxxxx'
		, key 'dataSourceId' value 'ocid1.genaiagentdatasource.oc1.us-chicago-1.xxxxxxxxxxxxxxxxx'
		, key 'displayName' value 'APEX_INGEST'
	  )
	 );
	end;
	</copy>
	```
* **Note:** Be sure to edit the following fields: **compartmentId** and **dataSourceId** to match the correct values. As well as update **c\_agent\_endpoint\_id** from the text copied in Lab 1, Task 4, Step 7. d

	![name the child process and add pl/sql](./images/ingest-plsql-process.png)

13. Save and Run by clicking the **Green button** at the top right of the page.

	![green button to run and save](./images/save-and-run.png)

## Task 6: Test Upload Functionality

1. Navigate to the new tab and provide your credentials to login to the app. Select **Sign in** to proceed.

	![Login screen for app](./images/login.png)

* **Note:** if prompted to change the password proceed to do so.

	![green button to run and save](./images/change-password.png)

2. Select the button **Upload** to begin testing.

	![upload button for popup](./images/upload-test.png)

3. Select the **File button** and select the file downloaded here. Click Upload & Ingest to ingest the file to the knowledge.

	![file loading and ingest button](./images/upload-and-ingest-new-file.png)

5. Verify that the file is updated in the classic report on page 1 by navigating back to the console

## (Optional) Task 7: Double check that the Ingestion job has fired
1. Navigate to the OCI Cloud Console

2. Click on the Hamburger Menu button at the top right and select **Analytics & AI**, then **GenAI Agents**.
3. Click **Knowledge Base** at the bottom of the page.

4. Click **Data Source** and Check for the Name **“APEX_INGEST”** and confirm that it is there, and check lifecycle State **Accepted/Processing/Succeeded**

	![verify the ingest job in the OCI console](./images/ingest-job.png)

Thank you for completing this lab.

## Acknowledgements

* **Authors:**
	* Kevin Xie - Cloud Architect
	* Nicholas Cusato - Cloud Architect
	* Olivia Maxwell - Cloud Architect
	* Graham Shroyer - Cloud Architect
	* Rachel Ogle - Cloud Architect
* **Last Updated by/Date** - Nicholas Cusato, May 2025
