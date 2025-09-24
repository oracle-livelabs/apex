# Configure GenAI in your Tenancy & APEX Workspace

## Introduction

In this Lab we will walk through process of configuring your OCI tenancy and APEX workspace to utilize GenAI. Both the Web Credential and GenAI configuration we create in your APEX Workspace will be available across any APEX application you create in your workspace. 

By the end of this lab, you will understand how to gather OCI tenancy information, configure a Web Credential in APEX and create a Generative AI configuration.

Estimated Time: 20–25 minutes


[Configure GenAI in your Tenancy & APEX Workspace Video Recording](videohub:1_9ikcl1lc)


### Objectives

In this lab, you will:
* Configure Web Credentials in APEX
* Configure Generative AI in APEX

### Prerequisites

This lab assumes you have the following:

Access to Oracle Cloud Infrastructure (OCI), paid account or free tier, in a region that has:
Generative AI
Basic experience with OCI Cloud Console and standard components.

## Task 1: Gather your OCI Tenancy Information

1. Navigate to the OCI Cloud Console. Open the Menu in the top left corner and select Identity & Security. Under Identity, select Compartments. Copy the OCID for the compartment you wish to use. 

2. Now click on the top right user icon and select your user (xxxx.xxxx@xxxx.com)
    ![OCI Profile](./images/oci_profile.png  "OCI Profile page showing user email ")

3. Copy down your user OCID
    ![User OCID](./images/user_ocid.png  "OCI user OCID for API and service configuration")

4. Next, select Tokens and Keys tab along the top bar.
    ![Tokens and Keys](./images/tokens_and_keys.png  "Tokens and API keys tab in OCI console")

5. Select Add API Key and select Generate API key pair, ensure you Download Public and Private Key. Then, the Add button will be enabled and then click 'Add'
    ![Add API Key](./images/add_api_key.png  "Add a new OCI API key pair")
    ![Add API Key](./images/download_api_key.png  "Download the generated OCI public and private keys")

6. You can then copy the Fingerprint
    ![Copy Fingerprint](./images/copy_fingerprint.png "Copy Fingerprint")
    
7. Now click Compartments on the left and select your compartment. 
    ![Compartment Select](./images/select_compartment.png  "Select OCI compartments link from side link")
    ![View Compartment Details](./images/view_compartment_details.png  "View selected OCI compartment details")

8. Copy down your Compartment OCID.
    ![Copy Compartment OCID](./images/copy_compartment_ocid.png  "Copy the OCI Compartment OCID for configuration")

9. Now click on your user in the top right again, this time select your tenancy. 
    ![Tenancy Select](./images/tenancy.png  "Select tenancy in OCI console for configuration")

10. Copy down your Tenancy OCID.
    ![Tenancy OCID](./images/tenancy_ocid.png  "Copy OCI Tenancy OCID for configuration")

## Task 2: Configure Web Credentials & Generative AI in your APEX Workspace

1. Now we have all necessary information from your tenancy, you can return to your APEX workspace, if you don’t already have it open. Return to your Autonomous Database, go to Tool Configuration, and open your APEX URL. 

2. Once back in your APEX workspace. Select App Builder, and click Workspace Utilities
    ![Workspace Utilities](./images/workspace_utilities.png  "Access Workspace Utilities in APEX")

3. Now select Web Credentials and click Create.
    ![Web Credentials](./images/web_credentials.png  "Web Credentials link in Workspace Utilities")
    ![Web Credentials Create](./images/webcredentials_create.png  "Create new Web Credential in APEX")

4. From the drop down for 'Authentication Type' select *OCI Native Authentication*. Give your Credentials a name. Then we will use the data we copied from our tenancy in previous steps. Enter your

    OCI User ID (User OCID),  
    OCI Private Key (downloaded),  
    *Note: Open the downloaded OCI private key file (`vi` on macOS or Notepad on Windows), copy its contents, and paste in below screen*.  
    OCI Tenancy ID (Tenancy OCID) and  
    OCI Public Key Fingerprint.  

    Then click Create
    ![Credential Details](./images/credential_details.png  "Enter all required details to configure Web Credential in APEX")

5. With our Web Credential created, return to Workspace Utilities and select Generative AI. Here we will click Create.
    ![Generative AI](./images/generative_ai.png  "Access Generative AI configurations in APEX Workspace")
    ![Generative AI Create](./images/generative_ai_create.png  "Create a new Generative AI configuration in APEX")

6. Select OCI Generative AI Service as the AI Provider. Then enter a name for your Generative AI Configuration. Next you can copy in the Compartment ID from above and select the appropriate region. There will be a default model, or you can choose another from this list. Ensure the model is available in the region you select.

    [Click here](https://docs.oracle.com/en-us/iaas/Content/generative-ai/pretrained-models.htm) to see pre-trained models available.

    ![AIProvider OCIGenAIService](./images/ai_provider_oci_gen_ai_service.png  "Select OCI Generative AI Service as provider")
    ![AI Credential](./images/ai_credential.png  "Enter name, compartment, region and select Credential to authenticate with OCI GenAI service")

7. Enable the Used by App Builder setting if you would like to add a Generative AI option in the Create Application Wizard and include Generative AI support (APEX Assistant) in all APEX Code Editors. Only one Generative AI Service at a time can be configured with the Used by App Builder setting enabled. 

8. Now click Test Connection to ensure it works. With a success, click Create.

You have successfully created your web credential and utilized it to create your Generative AI configuration. You may now **proceed to the next lab**.

## Acknowledgements

* **Authors:**
* Karol Stuart, Master Principal Cloud Architect 
* Graham Anderson, Senior Cloud Architect 

* **Last Updated by/Date** - Graham Anderson, August 2025
