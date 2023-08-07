# Integrate OCI Vision with Oracle APEX

## Introduction

OCI Vision can classify images into thousands of categories to simplify common digital asset management scenarios or identify items that need attention, such as overgrowth near a power line. Developers can also identify and localise objects in images to automate counting of common items, such as packages and vehicles.

In this lab, you learn how to integrate OCI Vision REST API with Oracle APEX to analyse and index the images uploaded by the user.

## Task 1: Configure OCI Vision REST API as REST Data Source

In this task, you create a REST Data Source with OCI vision REST API as the endpoint.

1. Navigate to the application home page and Click Shared components.

   ![Click Timeline](images/sm-shared-comp.png " ")

2. Click REST Data Sources under Data Sources.

   ![Click Timeline](images/rest-data-sources.png " ")

3. Click Create.

   ![Click Timeline](images/rest-data-source-create.png " ")

4. Select From scratch and Click Next.

   ![Click Timeline](images/rest-method.png " ")

5. Under Create REST Data Source:
   For Rest Data Source Type : Select** Oracle Cloud Infrastructure (OCI)**
   For Name : Enter **OCI Vision**
   For URL Endpoint : Enter https://vision.aiservice.us-ashburn-1.oci.oraclecloud.com/20220125/actions/analyzeImage

   *Note: URL Endpoint may differ based on your OCI tenancy*

   Click **Next**.

   ![Click Timeline](images/create-rest-data.png " ")

6. Under Create REST Data Source - Remote Server, Click **Next**.

   ![Click Timeline](images/remote-server.png " ")

7. Under Authentication, Enable Authentication Required and Select the newly created **apex_ai_cred** web credentials.

8. Click REST Source Manually.
   REST data source is successfully created. The next step to configure the POST operation parameters for this REST Data Source.

9. On the REST Data Sources page, Click OCI Vision.

10. Under Operations, Edit the POST operation:
    For Database Operation: Select **-Not Mapped-**
    For Request Body Template: Copy and paste below JSON

```
<copy>
{
  "compartmentId": "#COMPARTMENT_ID#",
   "image": {
    "source": "INLINE",
    "data": "#FILE_DATA#"
  },
  "features": [
    {
      "featureType": "#FEATURE_TYPE#",
      "maxResults": 5
    }
  ]
}
<copy>
```

11. Under Operations Parameter, Click **Synchronize with Body** to auto-create substitutions strings in the request body template as operation parameters.

12. Click **Apply Changes**. Click **OCI Vision** on REST Data Source page.

12. Scroll down to Operation Parameter and Click **Add Parameter**

13. Under Edit REST Data Source Parameter:
    For Type: Select **Request or Response Body**
    For Name: Enter **RESPONSE**
    For Direction: Select **Out**
    Click **Add and Add Another**

14. Under Edit REST Data Source Parameter:
    For Type: Select **HTTP Header**
    For Name: Enter **Content-Type**
    For Direction: Select **In**
    For Default value: Enter **application/json**
    For Static: Enable Static

    Click **Add Parameter**


## Task 2: Invoke the OCI Vision REST Data Source through a page process

In this task, you create a page process to invoke the OCI Vision REST Data Source implemented in the previous task.


1. Navigate to Application Homepage by clicking on the Application ID.

   ![Click Timeline](images/timeline.png " ")

2. Click **1-Timeline** page.  

3. Right click **Timeline** region under Body and Click **Create Page Item**.

4. Under Identification:
   For Name: Enter **P1\_RESPONSE**
   For Type : Select **Hidden**

3. Navigate to Processing Tab (left pane) and Right click on Processing Tab or Processes and click Create Process.

   ![Click Timeline](images/processing.png " ")

3. In the Property Editor, enter the following:
   Under Identification section:

    - For Name : Enter **Analyze Image**

    - For Type : Select **Execution Chain**

   Under Settings:

    - Enable **Execute in Background**

   ![Click Timeline](images/processing.png " ")

4. Right click on the Analyze Image Process you just created and Select Add Child Process.


5. In the Property Editor,
   Under Identification section:

    - For Name : Enter **Invoke REST Data Source**
    - For Action : Select **Invoke API**
    - For Execution Chain : Select **Analyze Image**.

   Under Settings Section:
    - For Type : Select REST Source
    - For REST Source : Select OCI Vision
    - For Operation : Select **POST**

6. Expand parameters under **Invoke REST Data Source** process.


7. Click **COMPARTMENT_ID**:
   Under Value :
   For Type: Select **Static Value**
   For Value: Enter the Compartment ID.

   *Note: If you are using the root compartment enter the tenancy OCID from the configuration preview file generated during API Key creation.If you are using a different compartment, you can find the corresponding compartment OCID from OCI Console.*

8. Click **FEATURE_TYPE**:
   Under Value :
    For Type: Select **Static Value**
    For Value: Enter **IMAGE_CLASSIFICATION**.

9. Click **FILE_DATA**
   Under Value:
   For Type: Select SQL Query(Return Single Value)
   For SQL Query: Copy and paste it in the SQL Code editor:

   ```
   <copy>
   select replace(replace(apex_web_service.blob2clobbase64(file_blob), chr(10),''),chr(13),'')
  from SM_posts
 where ID = :P1_ID;
  <copy>
```

10. Click **RESPONSE**:
    Under Parameter: Disable **Ignore Output**
    Under Value :
    For Item: Select **P1\_RESPONSE**

11. Right click on the Analyze Image Process and Select Add Child Process.

12. In the Property Editor,
   Under Identification :

    - For Name : Enter **Parse the Response**

  Under Source:

  - For PL/SQL : Copy and paste it in the PL/SQL Code editor:
  ```
  <copy>
  UPDATE SM_POSTS
  SET
    AI_OUTPUT = (
        SELECT
            LISTAGG(obj_name, ',') WITHIN GROUP(
            ORDER BY
                obj_name
            )
        FROM
            JSON_TABLE ( :P1_RESPONSE, '$.labels[*]'
                COLUMNS
                    obj_name VARCHAR2 ( 100 ) PATH '$.name[*]'
            )
    )
   WHERE
    ID = :P1_ID;
 <copy>
  ```

13. Click **Save**


## **Summary**
You now know how to Prepare Request for calling AI Vision Services using APEX Web Service.

You may now **proceed to the next lab**.   

## Acknowledgments
- **Author** - Roopesh Thokala, Senior Product Manager
- **Co-Author** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, August 2023
