# Oracle AI Vector Search and RAG Basic Example

## Introduction

Estimated Time: 90 minutes.

### Prerequisites

This lab assumes you have the following:
* Access to Oracle Cloud Infrastructure (OCI), paid account or free tier, in a region that has:
    - Autonomous Database with Oracle Database 23ai
    - Generative AI
* Basic experience with OCI Cloud Console and standard components.
* Experience with Oracle Database features, SQL, and PL/SQL.
* Experience with Oracle Application Express (APEX) low-code development.

## Task 1: Prepare the OCI cloud components

1. Check your OCI tenancy name. Write it down in your notes because you must change `YourOCItenancy` in the application code with this Tenancy name. 

    ![cloud tenancy](./images/cloud-tenancy.png " ")

2. Click the tenancy name link and copy your Tenancy OCID in your notes.

    ![tenancy ocid](./images/tenancy-ocid.png " ")

3. Open the user menu in the upper-right corner and click on your username.

    ![user menu](./images/user-menu.png " ")

4. Under User information, copy the User OCID in your notes.

    ![user ocid](./images/user-ocid.png " ")

5. Under Resources, select Customer Secret Keys. Click Generate secret key.

    ![customer secret keys](./images/customer-secret-keys.png " ")

6. Give it a name and generate.

    ![generate secret key](./images/generate-secret-key.png " ")

7. Copy the Generated key.

    ![copy secret key](./images/copy-secret-key.png " ")

8. Copy the Access key.

    ![copy access key](./images/copy-access-key.png " ")

9. Click Auth tokens and Generate token.

    ![auth tokens](./images/auth-tokens.png " ")

10. Give it a name and generate.

    ![generate token](./images/generate-token.png " ")

11. Copy the Auth token into your notes.

    ![copy token](./images/copy-token.png " ")

12. Write down in your notes the Auth token generated. You will need this information for the Object Storage credential:

    - CLOUD_USER='oracleidentitycloudservice/YourOCIusername'
    - CLOUD_TOKEN='6h[H9h)h}hH.23hHha0H'

13. Click API keys and Add API key.

    ![api keys](./images/api-keys.png " ")

14. Download the Private and Public keys and click Add.

    ![add api key](./images/add-api-key.png " ")

15. Click main menu ≡ > Identity & Security > Compartments.

    ![identity security compartments](./images/identity-security-compartments.png " ")

16. Here is another place where you can find your Tenancy OCID.

    ![compartments](./images/compartments.png " ")

17. Create a Compartment for the Autonomous Database. Copy the OCID into your notes.

    ![copy compartment ocid](./images/copy-compartment-ocid.png " ")

18. You should have in your notes all these details you will need for the Native Credential:

    - Tenancy OCID: `ocid1.tenancy.oc1..aaaaaaaa6aea6xvr6thisismytenancyhahahahaahahaa4opc3fib2a`
    - User OCID: `ocid1.user.oc1..aaaaaaaat2x6ry4xsb6m5thisismyuserhahahahahahahaahahahab2bvcjq`
    - Compartment OCID: `ocid1.compartment.oc1..aaaaaaaatthisismycompartmenthahahahahahasbkxvzhmmbv2gncfa`
    - Private Key (from the private key file of the API key):
    ````
    -----BEGIN PRIVATE KEY-----
    MIIEvQIHahaHahahAhaHAhaHaHahaHahahahaHAHAgEAAoIBAQCzI+0Vnd4AUZZ1
    Z35Qp0p58oCCHahaHahahAhaHAhaHaHahaHahahahaHAHhahHGtkDKZYqMD6ThOa
    Whg8rBnyIHahaHahahAhaHAhaHaHahaHahahahaHAHhaha4Uvw1e3qhEWPH8l3vB
    t6VHahaHahahAhaHAhaHaHahaHahahahaHAHhahahahahjjhWrXk+gT/UZbqunwW
    .. 20 lines more ..
    /OAkRHahaHahahAhaHAhaHaHahaHahahahaHAHhahahahahhaLXXr4e1LrX40wbX
    P0uKHahaHahahAhaHAhaHaHahaHahahahaHAHhahahahahHAHJ2v/1mIGy+pOt3S
    ZmkxgWIvS6B0ixYjuSHAvzU=
    -----END PRIVATE KEY-----
    ````
    - Fingerprint: `25:0h:57:07:2h:55:0h:10:6h:h6:ha:06:h1:9h:32:9h`

19. Click main menu ≡ > Storage > Buckets.

    ![storage buckets](./images/storage-buckets.png " ")

20. Click Create Bucket. 

    ![buckets in compartment](./images/buckets-in-compartment.png " ")

21. Name it DBAI-bucket.

    ![create bucket](./images/create-bucket.png " ")

22. Download `all_MiniLM_L12_v2.onnx` ONNX model from [ONNX Pipeline Models](https://docs.oracle.com/en/database/oracle/oracle-database/23/vecse/onnx-pipeline-models-text-embedding.html) and unzip.

    ![onnx models](./images/onnx-models.png " ")

23. Click Upload.

    ![bucket objects](./images/bucket-objects.png " ")

24. Upload the `all_MiniLM_L12_v2.onnx` large language model (LLM) file to the DBAI-bucket.

    ![upload onnx llm](./images/upload-onnx-llm.png " ")

25. The LLM file is an object in your bucket.

    ![onnx llm object](./images/onnx-llm-object.png " ")

## Task 2: Deploy and configure the ADB instance

1. Click main menu ≡ > Oracle Database > Autonomous Database (ADB).

    ![oracle database autonomous](./images/oracle-database-autonomous.png " ")

2. Click Create Autonomous Database.

    ![autonomous databases](./images/autonomous-databases.png " ")

3. Leave the default Display name and Database name. Select Transaction Processing and Serverless.

    ![create autonomous database](./images/create-autonomous-database.png " ")

4. Choose database version 23ai. Use a strong password for your ADB instance admin user, for example, `Your#5tr0ng_PassW0rd`.

    ![administrator credentials](./images/administrator-credentials.png " ")

5. Set Secure access from everywhere.

    ![network access](./images/network-access.png " ")

6. Wait until your ADB instance is Available.

    ![autonomous database information](./images/autonomous-database-information.png " ")

7. Click Database Actions > Database Users

    ![database actions users](./images/database-actions-users.png " ")

8. Click Create User.

    ![all users](./images/all-users.png " ")

9. Create a database user named DBAI. Set unlimited quota on tablespace DATA.

    ![create user](./images/create-user.png " ")

10. Grant these roles to the DBAI user.

    ![granted roles](./images/granted-roles.png " ")

11. On the Oracle Cloud Console, on your ADB instance page, click Database Actions > SQL.

    ![database actions sql](./images/database-actions-sql.png " ")

12. Run the following commands to grant DBAI user execute privileges on the `SYS.UTL_HTTP` and `DBMS_CLOUD` packages.

    ````
    <copy>
    grant execute on SYS.UTL_HTTP to DBAI;
    </copy>
    ````

    ````
    <copy>
    grant execute on DBMS_CLOUD to DBAI;
    </copy>
    ````

    ![grant execute](./images/grant-execute.png " ")

13. Run this code to create a new Access Control List (ACL) so the DBAI user can connect to the `oraclecloud.com` domain. This connection is required to access OCI Object Storage buckets and OCI Generative AI service via REST APIs.

    ````
    <copy>
    BEGIN
      DBMS_NETWORK_ACL_ADMIN.append_host_ace (
        host       => '*.oraclecloud.com',
        ace        => xs$ace_type(privilege_list => xs$name_list('http','connect','resolve'),
                                  principal_name => 'DBAI',
                                  principal_type => xs_acl.ptype_db));
    END;
    /
    </copy>
    ````

    ![create network acl](./images/create-network-acl.png " ")

14. On the Oracle Cloud Console, on your ADB instance page, under the Tool Configuration tab, you will use Oracle APEX for the AI Vector Search and RAG application.

    ![tool configuration](./images/tool-configuration.png " ")

15. Copy the APEX URL in your notes.

    ![copy apex url](./images/copy-apex-url.png " ")

16. Paste your Oracle APEX URL in a new tab of your browser. For example:

    - https://apexinstance-adbinstancename.adb.uk-london-1.oraclecloudapps.com/ords/apex

17. Click the Administration Services link.

    ![administration services](./images/administration-services.png " ")

18. Use the ADB admin user's strong password to log in.

    - Password: `Your#5tr0ng_PassW0rd`

    ![sign in to administration](./images/sign-in-to-administration.png " ")

19. Click Manage Workspaces > Create Workspace.

    ![manage workspaces create](./images/manage-workspaces-create.png " ")

20. Choose Existing Schema.

    ![existing schema](./images/existing-schema.png " ")

21. Use these attributes for the new Workspace. Use the same strong password the ADB admin user has. The existing database user for the new workspace should be `DBAI`.

    ![create workspace](./images/create-workspace.png " ")

## Task 3: Prepare Workspace and import application

1. Click the new Workspace name DBAI.

    ![sign in to dbai](./images/sign-in-to-dbai.png " ")

2. Use the details specified during workspace creation to log in.

    - Workspace: DBAI
    - User: DBAIADMIN
    - Password: `Your#5tr0ng_PassW0rd`

    ![sign in](./images/sign-in.png " ")

3. You are now in the new APEX Workspace.

    ![apex workspace](./images/apex-workspace.png " ")

4. Download the AI Vector Search and RAG demo application: [QandA](https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/cH9HegImtUSFIQzzT9j3dbyFsmu1J1NM8A3Xq0bqp-C3jhPHUC7yr4KpNx7HOkxH/n/oraclepartnersas/b/WS-files/o/AIvectorRAGws/QandA-livelab-f100.sql). This application will be imported in your APEX Workspace.

5. Click App Builder and Import.

    ![app builder](./images/app-builder.png " ")

6. Import App: `QandA-livelab-f100.sql`. Click Next.

    ![import app](./images/import-app.png " ")

7. Review the installation details and click Install Application.

    ![install application](./images/install-application.png " ")

8. Once the application is installed successfully, click Edit Application.

    ![application installed](./images/application-installed.png " ")

9. Check application pages. Click Shared Components.

    ![application pages](./images/application-pages.png " ")

10. Click List of Values.

    ![shared components other](./images/shared-components-other.png " ")

11. This application uses a set of roles to authorize users to perform different tasks.

    ![list of values roles](./images/list-of-values-roles.png " ")

12. Navigate to SQL Workshop > SQL Commands.

    ![sql workshop](./images/sql-workshop.png " ")

13. Use SQL Commands to run the following code to create a Credential for Object Storage. Use the Token for your notes for the `password` attribute.

    ````
    <copy>
    BEGIN
        DBMS_CLOUD.create_credential(
        credential_name => 'OBJS_CREDENTIAL',
        username => 'oracleidentitycloudservice/YourOCIusername',
        password => '6h[H9h)h}hA.23hAha0H');
    END;
    /
    </copy>
    ````

    ![create objs credential](./images/create-objs-credential.png " ")

14. Verify the new Credential. List objects in your Object Storage Bucket.

    ````
    <copy>
    SELECT * FROM table(dbms_cloud.list_objects(
      credential_name => 'OBJS_CREDENTIAL',
      location_uri => 'https://YourOCItenancy.objectstorage.uk-london-1.oci.customer-oci.com/n/YourOCItenancy/b/DBAI-bucket/'));
    </copy>
    ````

    ````
    <copy>
    select * from dbms_cloud.list_objects('OBJS_CREDENTIAL','https://YourOCItenancy.objectstorage.uk-london-1.oci.customer-oci.com/n/YourOCItenancy/b/DBAI-bucket/o/');
    </copy>
    ````

    ![select list objects](./images/select-list-objects.png " ")

15. Create an OCI native credential. This credential will be used to communicate with OCI Generative AI services. Use the values you saved in your notes for the attributes.

    ````
    <copy>
    declare
      jo json_object_t;
    begin
      jo := json_object_t();
      jo.put('user_ocid', 'ocid1.user.oc1..aaaaaaaat2x6ry4xsb6m5thisismyuserhahahahahahahaahahahab2bvcjq');
      jo.put('tenancy_ocid', 'ocid1.tenancy.oc1..aaaaaaaa6aea6xvr6thisismytenancyhahahahaahhahaahaa4opc3fib2a');
      jo.put('compartment_ocid', 'ocid1.compartment.oc1..aaaaaaaatthisismycompartmenthahahahahahasbkxvzhmmbv2gncfa');
      jo.put('private_key', 'MIIEvQIHahaHahahAhaHAhaHaHahaHahahahaHAHAgEAAoIBAQCzI+0Vnd4AUZZ1
      Z35Qp0p58oCCHahaHahahAhaHAhaHaHahaHahahahaHAHhahHGtkDKZYqMD6ThOa
      Whg8rBnyIHahaHahahAhaHAhaHaHahaHahahahaHAHhaha4Uvw1e3qhEWPH8l3vB
      t6VHahaHahahAhaHAhaHaHahaHahahahaHAHhahahahahjjhWrXk+gT/UZbqunwW
      ... 20 lines more ...
      /OAkRHahaHahahAhaHAhaHaHahaHahahahaHAHhahahahahhaLXXr4e1LrX40wbX
      P0uKHahaHahahAhaHAhaHaHahaHahahahaHAHhahahahahHAHJ2v/1mIGy+pOt3S
      ZmkxgWIvS6B0ixYjuSHAvzU=');
      jo.put('fingerprint', '25:0h:57:07:2h:55:0h:10:6h:h6:ha:06:h1:9h:32:9h');
      DBMS_OUTPUT.put_line(jo.to_string);
      DBMS_VECTOR.create_credential(
        credential_name => 'OCI_CREDENTIAL',
        params => json(jo.to_string));
    end;
    /
    </copy>
    ````

    ![create native credential](./images/create-native-credential.png " ")

16. Use the APEX SQL Commands interface to create the database objects required by the sample application.

    ````
    <copy>
    -- Users table
    CREATE TABLE "APPUSER"
        ("ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY (CACHE 5) PRIMARY KEY,
        "EMAIL" VARCHAR2(255 CHAR) NOT NULL ENABLE,
        "ROLE_ID" NUMBER,
        "LOCKED" NUMBER(1),
        "FIRSTNAME" VARCHAR2(255 CHAR),
        "LASTNAME" VARCHAR2(255 CHAR),
        "BIRTHDAY" DATE,
        "DELETE_REQUEST" NUMBER(1),
        "TIME_ZONE" VARCHAR2(40 CHAR),
        "CREATED" DATE NOT NULL ENABLE,
        "UPDATED" DATE NOT NULL ENABLE,
        "UPDATED_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE,
        "LAST_LOGIN" DATE,
        CONSTRAINT "APPUSER_EMAIL_UNQ" UNIQUE ("EMAIL"));
    </copy>
    ````

    ````
    <copy>
    CREATE OR REPLACE EDITIONABLE TRIGGER "APPUSER_BIU"
        before insert or update on APPUSER for each row
    begin
        if inserting then
            :new.ROLE_ID := 1;
            :new.CREATED := SYSDATE;
            :new.LAST_LOGIN := SYSDATE;
            :new.LOCKED := 0;
            :new.DELETE_REQUEST := 0;
        end if;
        :new.UPDATED := SYSDATE;
        :new.UPDATED_BY := NVL(SYS_CONTEXT('APEX$SESSION','APP_USER'),user);
        :new.EMAIL := LOWER(:new.EMAIL);
    end;
    /
    </copy>
    ````

    ````
    <copy>
    -- Post authenticate procedure
    CREATE OR REPLACE EDITIONABLE PROCEDURE post_authenticate (
        p_username in varchar2,
        out_user_id out number,
        out_time_zone out varchar2,
      out_role_id out number,
        out_locked out number
    )
    is
      l_id        number;
      l_role_id   number;
      l_locked    number;
      l_time_zone varchar2(40 char);
    begin
      select id, role_id, time_zone, locked
        into l_id, l_role_id, l_time_zone, l_locked
        from APPUSER
        where upper(email) = upper(NVL(SYS_CONTEXT('APEX$SESSION','APP_USER'),user));
        out_user_id   := l_id;
        out_time_zone := l_time_zone;
        out_role_id   := l_role_id;
        out_locked    := l_locked;
      exception when no_data_found then  
        insert into APPUSER (email) values (NVL(SYS_CONTEXT('APEX$SESSION','APP_USER'),user));
        commit;
    end post_authenticate;
    /
    </copy>
    ````

17. Create application tables to store documents and vectors.

    ````
    <copy>
    CREATE TABLE OBJSDOCS
    ("ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY (CACHE 5) PRIMARY KEY,
    "FILE_NAME" VARCHAR2(250) NOT NULL ENABLE,
    "CREATED" DATE NOT NULL ENABLE,
    "CREATED_BY" NUMBER NOT NULL ENABLE);
    </copy>
    ````

    ````
    <copy>
    CREATE TABLE BLOBDOCS
    ("ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY (CACHE 5) PRIMARY KEY,
    "OBJSDOC_ID" NUMBER NOT NULL ENABLE,
    "DOC_DATA" BLOB NOT NULL ENABLE);
    </copy>
    ````

    ````
    <copy>
    CREATE TABLE VECTORS
    ("ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY (CACHE 5) PRIMARY KEY,
    "BLOBDOC_ID" NUMBER NOT NULL ENABLE,
    "CHUNK_NO" NUMBER NOT NULL ENABLE,
    "CHUNK_CONTENTS" CLOB NOT NULL ENABLE,
    "VECTOR_EMBEDDING" VECTOR NOT NULL ENABLE);
    </copy>
    ````

    ````
    <copy>
    CREATE TABLE CHUNKLINES
    ("ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY (CACHE 5) PRIMARY KEY,
    "BLOBDOC_ID" NUMBER NOT NULL ENABLE,
    "CHUNK_NO" NUMBER NOT NULL ENABLE,
    "LINE_NO" NUMBER NOT NULL ENABLE,
    "LINE_CONTENTS" VARCHAR2(4000) NOT NULL ENABLE,
    "LINE_TYPE" NUMBER);
    </copy>
    ````

    ````
    <copy>
    CREATE TABLE CONVERSATION 
    ("ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY (CACHE 5) PRIMARY KEY,
    "APPUSER_ID" NUMBER NOT NULL ENABLE,
    "QUESTION" CLOB NOT NULL ENABLE,
    "ANSWER" CLOB NOT NULL ENABLE,
    "CREATED" DATE NOT NULL ENABLE);
    </copy>
    ````

18. Import `all_MiniLM_L12_v2.onnx` large language model (LLM) into your ADB instance from the object storage bucket. Make sure you use your `object_uri` attribute value.

    ````
    <copy>
    DECLARE
      model_source BLOB := NULL;
    BEGIN
      model_source := DBMS_CLOUD.get_object(credential_name => 'OBJS_CREDENTIAL',
        object_uri => 'https://YourOCItenancy.objectstorage.uk-london-1.oci.customer-oci.com/n/YourOCItenancy/b/DBAI-bucket/o/all_MiniLM_L12_v2.onnx'); 
      DBMS_VECTOR.load_onnx_model('ALLMINL12V2',
                                  model_source,
                                  JSON('{"function" : "embedding",
                                        "embeddingOutput" : "embedding",
                                        "input": {"input": ["DATA"]}}'));
    END;
    /
    </copy>
    ````

    ![load onnx model](./images/load-onnx-model.png " ")

19. List LLM models in your ADB instance and their attributes.

    ````
    <copy>
    select MODEL_NAME, ATTRIBUTE_NAME, ATTRIBUTE_TYPE, DATA_TYPE, VECTOR_INFO
      from USER_MINING_MODEL_ATTRIBUTES where MODEL_NAME = 'ALLMINL12V2';
    </copy>
    ````

    ````
    <copy>
    select MODEL_NAME, MINING_FUNCTION, ALGORITHM, ALGORITHM_TYPE, MODEL_SIZE
      from USER_MINING_MODELS where MODEL_NAME = 'ALLMINL12V2';
    </copy>
    ````

    ![select mining model](./images/select-mining-model.png " ")

## Task 4: Fix app code with your OCI components

1. Click Run Application.

    ![run application](./images/run-application.png " ")

2. Sign in with the DBAIADMIN user.

    - Username: dbaiadmin
    - Password: `Your#5tr0ng_PassW0rd`

    ![qnada sign in](./images/qnada-sign-in.png " ")

3. **Do not ask any questions at this time.** There are still some details to fix in the application code before it works.

4. Navigate to SQL Workshop > Object Browser.

    ![sql workshop object browser](./images/sql-workshop-object-browser.png " ")

5. Edit the 1st row in table APPUSER and set ROLE_ID = 10.

    ![appuser table edit row](./images/appuser-table-edit-row.png " ")

6. Go back to your application pages under the App Builder. Click Shared Components.

    ![shared components](./images/shared-components.png " ")

7. Click Aplication Definition.

    ![application definition](./images/application-definition.png " ")

8. Under Substitutions, set the correct Compartment OCID, Tenancy name, and Region with the correct values from your notes.

    ![substitutions](./images/substitutions.png " ")

9. Navigate to Workspace Utilities under the App Builder.

    ![app builder workspace utilities](./images/app-builder-workspace-utilities.png " ")

10. Click Web Credentials.

    ![web credentials](./images/web-credentials.png " ")

11. Click Create.

    ![no web credentials](./images/no-web-credentials.png " ")

12. Name it OBJAPI. Use the following details with your values to create the Web Credentials.

    - Name: OBJAPI
    - Static ID: OBJAPI
    - Authentication Type: OCI Native Authentication
    - OCI User ID: `ocid1.user.oc1..aaaaaaaat2x6ry4xsb6m5thisismyuserhahahahahahahaahahahab2bvcjq`
    - OCI Private Key:
    ````
    MIIEvQIHahaHahahAhaHAhaHaHahaHahahahaHAHAgEAAoIBAQCzI+0Vnd4AUZZ1
    Z35Qp0p58oCCHahaHahahAhaHAhaHaHahaHahahahaHAHhahHGtkDKZYqMD6ThOa
    Whg8rBnyIHahaHahahAhaHAhaHaHahaHahahahaHAHhaha4Uvw1e3qhEWPH8l3vB
    t6VHahaHahahAhaHAhaHaHahaHahahahaHAHhahahahahjjhWrXk+gT/UZbqunwW
    .. 20 lines more ..
    /OAkRHahaHahahAhaHAhaHaHahaHahahahaHAHhahahahahhaLXXr4e1LrX40wbX
    P0uKHahaHahahAhaHAhaHaHahaHahahahaHAHhahahahahHAHJ2v/1mIGy+pOt3S
    ZmkxgWIvS6B0ixYjuSHAvzU=
    ````
    - OCI Tenancy ID: `ocid1.tenancy.oc1..aaaaaaaa6aea6xvr6thisismytenancyhahahahaahhahaahaa4opc3fib2a`
    - OCI Public Key Fingerprint: `25:0h:57:07:2h:55:0h:10:6h:h6:ha:06:h1:9h:32:9h`
    - Valid for URLs (replace `YourOCItenancy` with your tenancy name): 
    ````
    https://YourOCItenancy.objectstorage.uk-london-1.oci.customer-oci.com
    https://objectstorage.uk-london-1.oraclecloud.com
    ````

    ![create web credentials](./images/create-web-credentials.png " ")

13. The new Web Credential entry will appear in the list.

    ![action processed](./images/action-processed.png " ")

## Task 5: Run AI Vector Search and RAG app

1. Go to the browser tab where the QandA application is running, if it is still open, and click the DBAIADMIN user link > Sign Out.

    ![dbaiadmin sign out](./images/dbaiadmin-sign-out.png " ")

2. Sign In again with the same user.

    - Username: dbaiadmin
    - Password: `Your#5tr0ng_PassW0rd`

3. Ask the following question on the first page: _What are the new features in Oracle Database 23ai?_

    ![qanda ask question](./images/qanda-ask-question.png " ")

4. This page is called Home in the application menu.

    ![qanda home](./images/qanda-home.png " ")

5. Download the `oracle-database-23ai-new-features-guide.pdf` document from Oracle Database documentation: https://docs.oracle.com/en/database/oracle/oracle-database/23/nfcoa/oracle-database-23ai-new-features-guide.pdf

6. Open the QandA application menu. Click Upload. This application page allows you to upload documents to the Object Storage bucket.

    ![qanda upload](./images/qanda-upload.png " ")

7. Upload the `oracle-database-23ai-new-features-guide.pdf` file using this dialog in the sample application to your Object Storage bucket.

    ![upload pdf](./images/upload-pdf.png " ")

8. You can see the files uploaded in your Bucket via this Upload page in the Object Storage classic report.

    ![pdf object storage](./images/pdf-object-storage.png " ")

9. Click Docs. This application page allows you to import documents from the Object Storage bucket into the database `BLOBDOCS` tables as BLOBs.

    ![docs select document](./images/docs-select-document.png " ")

10. Import the `oracle-database-23ai-new-features-guide.pdf` document as a BLOB object into the database so it can be processed by the PL/SQL code.

    ![import pdf](./images/import-pdf.png " ")

11. Once imported, it is listed in the report that shows all BLOB documents in your `BLOBDOCS` table.

    ![pdf imported](./images/pdf-imported.png " ")

12. Click Vectors. This application page allows you to vectorize entire documents stored into the database as BLOB objects and store the vectors using the new VECTOR datatype in Oracle Database 23ai. Select the `oracle-database-23ai-new-features-guide.pdf` document from the drop-down list and click Embed.

    ![qanda vectors](./images/qanda-vectors.png " ")

13. The embedding process, called vectorization, runs in the background and splits the document into more manageable parts, called chunks. Each chunk is vectorized inside the database using the imported LLM model. You can wait and click the Refresh button for updates.

    ![embedding document](./images/embedding-document.png " ")

14. After the document is vectorized, it is listed in the report that shows all vectorized documents in your `VECTORS` table with the corresponding number of vectors. This document generated 226 vectors during the embedding process. The number of vectors may differ from yours because of updates to the application code. You can click on the vectors number to inspect the chunks.

    ![vectors embedded documents](./images/vectors-embedded-documents.png " ")

15. Or click Chunks in the application menu.

    ![chunks](./images/chunks.png " ")

16. Select one of the vectorized documents from the drop-down list, if not selected already.

    ![select-vectorized-doc](./images/select-vectorized-doc.png " ")

17. This is the content of each chunk. In this sample application, the text of the chunks is used directly in building the prompt as it is extracted from the documents, but ideally, it should be further processed. For example, separate the explanation text paragraphs from the code snippets, remove noise lines like tittles, headers and footers, classify parts of the document by the content, etc. Each chunk can be broken down into the text lines that are read from the document. Click the mignifier glass next to one of the chunks to see these lines.

    ![view-chunk-lines](./images/view-chunk-lines.png " ")

18. These are the chunk lines that can be further processed using Oracle Text and Oracle Machine Learning (OML). Use the left/right navigation buttons to view the previous/next chunk contents of this document.

    ![previous-next-chunk](./images/previous-next-chunk.png " ")

19. Click Test. This application page allows you to see what chunks are used when building the prompt for the OCI Generative AI service based on the proximity of the vectors retrieved by the semantic search operation, called AI Vector Search.

    ![qanda test](./images/qanda-test.png " ")

20. Ask the same question on the Test page: _What are the new features in Oracle Database 23ai?_ As you have new embedded documents, in other words, vectors that can be used to perform a similarity search for your question and build a better context for the prompt sent to the OCI Generative AI services, the answer may differ from the first one. The idea is to improve the answers with the embedded documents available in the database.

    ![test ask question](./images/test-ask-question.png " ")

21. The Test page lists the documents and their corresponding chunks that are closer as vectors to the question based on the similarity search distance.

    ![test proximity vectors](./images/test-proximity-vectors.png " ")

22. Click Users. This application page can be used to manage application users.

    ![qanda users](./images/qanda-users.png " ")

23. Click Dialog. This is a complete report of all questions asked in the application and their answers. Check if the context provided was enough to generate a correct answer. If not, add more documents to the repository.

    ![qanda dialog](./images/qanda-dialog.png " ")

24. On OCI Cloud Console, you can see the uploaded PDF documents in the Object Storage Bucket.

    ![bucket objects pdf](./images/bucket-objects-pdf.png " ")


You may now **proceed to the next lab**.

## **Acknowledgements**

- **Author** - Valentin Leonard Tabacaru, Database Product Management
- **Last Updated By/Date** - Valentin Leonard Tabacaru, Database Product Management, March 2025
