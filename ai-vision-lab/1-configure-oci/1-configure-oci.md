# Configure OCI API keys

## Introduction

In this lab, you learn how to configure OCI API keys. In Oracle Cloud Infrastructure (OCI), API keys are used for secure authentication when accessing OCI resources through REST APIs.

OCI API keys consist of two parts: a public key and a private key. You use the Console to generate the private/public key pair. You can upload the public key if you already have a key pair.

## Task 1: Generate API Keys using OCI Console


1. Login into your OCI Account.

2. Open the Profile menu and click Profile hyperlink.

    ![Profile Menu](images/profile.png " ")

3. In the Resources section at the bottom left, click API Keys and then click Add API Key.

    ![Add API Key](images/api-keys.png " ")


4. The Add API Key dialog displays. Select **Generate API Key Pair** to create a new key pair.

5. Click Download Private Key and save it to your local device. You do not need to download the public key.

   *Note: You will use this private key while configuring web credentials in Oracle APEX later in this workshop.*

6. Click Add.

    ![Profile Menu](images/add-api-key.png " ")

7. The key is added, and the Configuration File Preview is displayed. Copy and paste the configuration file snippet from the text box. You will use this information in Oracle APEX Web Credentials.

    ![Profile Menu](images/configuration-preview.png " ")

## Task 2: Create Web Credentials in Oracle APEX

Web credentials are used to authenticate connection to external REST services, or REST Enabled SQL services.

Creating Web Credentials securely stores and encrypts authentication credentials for use by Oracle APEX components and APIs. Credentials cannot be retrieved back in clear text. Credentials are stored at the workspace level and therefore are visible in all applications.
To create web credentials in Oracle APEX:

1. Login into your Oracle APEX workspace.

2. On the Workspace home page, click App Builder.

   ![Click App Builder](images/app-builder.png " ")

3. Click Workspace Utilities.

   ![Click App Builder](images/workspace-utilities.png " ")

4. Click Web Credentials.

   ![Click App Builder](images/sc-web-creds.png " ")

5. Please enter the following details using the configuration file details you copied before and the API Key.

    - Name: apex_ai_cred

    - Authentication Type: Oracle Cloud Infrastructure (OCI)

    - OCI User ID: OCID of the Oracle Cloud user Account. You can find this in the Configuration File Preview generated during API Key creation.
    Your OCI User ID looks similar to **ocid1.user.oc1..aaaaaaaal6p4vtvg6ykzv426wxb4cwvgfrw6ztfpti2elpkali6wj3v23yla**

    - OCI Private Key: API Key with the header, footer, and carriage returns removed

    - OCI Tenancy ID: OCID for the Tenancy

    - OCI Public Key Fingerprint: Fingerprint ID

   ![Click App Builder](images/web-creds.png " ")

5. Click Create.
