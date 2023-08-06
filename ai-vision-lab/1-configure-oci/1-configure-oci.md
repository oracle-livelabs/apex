# Configure OCI API keys

In this lab,



## Task 1: Adding API Keys on OCI

When you use the Console to add the API signing key pair, a configuration file preview snippet is generated with the following information:

- user - the OCID of the user for whom the key pair is being added.
- fingerprint - the fingerprint of the key that was just added.
- tenancy - your tenancy's OCID.
- region - the currently selected region in the Console.
- key_file- the path to your downloaded private key file. You must update this value to the path on your file system where you saved the private key file.

1. To View the user's details:
If you're adding an API key for yourself, Open the Profile menu and click My Profile.

    ![Profile Menu](images/profile.png " ")

2. In the Resources section at the bottom left, click API Keys and then click Add API Key at the top left of the API Keys list.

    ![Add API Key](images/api-keys.png " ")

3. The Add API Key dialog displays. Click Download Private Key and save the key to your .oci directory. In most cases, you do not need to download the public key. Click Add.

    ![Profile Menu](images/add-api-key.png " ")

4. The key is added, and the Configuration File Preview is displayed. The file snippet includes the required parameters and values you'll need to create your configuration file. Copy and paste the configuration file snippet from the text box. We will use these credentials in Oracle APEX Web Credentials.

    ![Profile Menu](images/configuration-preview.png " ")


## Task 2: Creating Web Credentials in Oracle APEX


Web credentials are used to connect to external REST services, or REST Enabled SQL services.

Creating Web Credentials securely stores and encrypts authentication credentials for use by Oracle APEX components and APIs. Credentials cannot be retrieved back in clear text. Credentials are stored at the workspace level and therefore are visible in all applications.


1. Navigate to the Web Credentials page:
   From Workspace Utilities:
   On the Workspace home page, click App Builder.

   ![Click App Builder](images/app-builder.png " ")

2. Click Workspace Utilities.

   ![Click App Builder](images/workspace-utilities.png " ")

3. Click Web Credentials.

   ![Click App Builder](images/sc-web-creds.png " ")

4. Please enter the following details using the configuration file details we have copied before and the API Key.

    - Name: apex_ai_cred
    - Authentication Type: Oracle Cloud Infrastructure (OCI)
    - OCI User ID: OCID for the user
    - OCI Private Key: API Key with the header, footer, and carriage returns removed
    - OCI Tenancy ID: OCID for the Tenancy
    - OCI Public Key Fingerprint: Fingerprint ID

   ![Click App Builder](images/web-creds.png " ")

5. Click Create.
