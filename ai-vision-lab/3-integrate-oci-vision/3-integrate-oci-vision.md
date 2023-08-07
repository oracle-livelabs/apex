# Integrate OCI Vision with Oracle APEX

## Introduction

OCI Vision can classify images into thousands of categories to simplify common digital asset management scenarios or identify items that need attention, such as overgrowth near a power line. Developers can also identify and localize objects in images to automate counting of common items, such as packages and vehicles.

In this lab, you will use the Image Classification Module of Oracle AI Vision services.

## Task 1: Prepare Request for calling AI Vision Services using APEX Web Service:

Using Vision, you can upload images to detect and classify objects in them. If you have lots of images, you can process them in batch using asynchronous API endpoints. Vision's features are thematically split between Document AI for document-centric images, and Image Analysis for object and scene-based images. Pretrained models and custom models are supported.

In order to perform ImageAnalysis, you have to prepare the API Endpoint with appropriate Oracle Cloud Infrastructure APIs. In this blogpost, We are using OCI hosted in Ashburn region. So, the API endpoint will be as below.


https://vision.aiservice.us-ashburn-1.oci.oraclecloud.com/20220125/actions/analyzeImage

Please refer to the documentation for more details on how to prepare API Endpoints for various AI Services.

For Analysing Image, we have to send the Request Parameters in the JSON format mentioned below.

{
  "compartmentId": "your compartment OCID",
   "image": {
    "source": "INLINE",
    "data": "'Your Data'"
  },
  "features": [
    {
      "featureType": "IMAGE_CLASSIFICATION",
      "maxResults": 5
    }
  ]
}


Where CompartmentId is the OCID of your Compartment and data contains the information of the Image that we are going to analyze.


## Task 2: Call AI Vision Services from Oracle APEX:


1. On the Workspace home page, click the App Builder icon. Select APEX Social Media application. On the Application home page, click Page 1 - Timeline.

   ![Click Timeline](images/timeline.png " ")

2. Navigate to Dynamic Actions Tab (left pane) and then Right click on Processing Tab or Processes and click Create Process.

   ![Click Timeline](images/processing.png " ")

3. In the Property Editor, enter the following:
   Under Identification section:
    - For Name - enter Calling AI Vision Service
    - Type - Select Execution Chain
   Under Settings:
    - Set Execute in Background to Yes

   ![Click Timeline](images/processing.png " ")

4. Right click on the Process you just created and select Add Child Process.


5. In the Property Editor,
   Under Identification section:
    - For Name - enter Appropriate Name
    - For Action - select Execute Code
    - For Execution Chain - Make sure the name is proper.
   Under Settings section:
    - For Code - enter the Code

6. Copy the below code and paste it in the PL/SQL Code editor.

   ```
   <copy>
   declare
     l_clob clob;
     l_buffer         varchar2(32767);
     l_amount         number;
     l_offset         number;
     v_stack_name varchar2(100);
     PAR clob;
     l_data varchar2(200);
     l_id number;
     l_data_clob clob;
     l_blob blob;
     l_errm clob;
  begin
    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := 'application/json';

    select ID , file_blob into l_id, l_blob from SM_posts where Id=(:P1_ID);
    l_data_clob := apex_web_service.blob2clobbase64(l_blob);
    l_data_clob := replace(l_data_clob, chr(10),'');
    l_data_clob := replace(l_data_clob, chr(13),'');


    PAR := '{
  "compartmentId": "ocid1.compartment.oc1..aaaaaaaal6p4vtvg6ykzv426wxb4cwvgfrw6ztfpti2elpkali6wj3v23yla",
   "image": {
    "source": "INLINE",
    "data": "'|| l_data_clob || '"
  },
  "features": [
    {
      "featureType": "IMAGE_CLASSIFICATION",
      "maxResults": 5
    }
  ]
}';

    l_clob := apex_web_service.make_rest_request(
          p_url                     => 'https://vision.aiservice.us-ashburn-1.oci.oraclecloud.com/20220125/actions/analyzeImage',
          p_http_method             => 'POST',
          p_credential_static_id    => 'apex_ai_cred',
          p_body                    => PAR);

   with json_tab(jsndat) as (
   select l_clob
   from   dual )
   SELECT  LISTAGG(jsnname, ',')
   WITHIN GROUP (ORDER BY jsnname)
   into l_data
   FROM   json_tab, json_table(

    jsndat,'$.labels[*]'

    columns

        jsnname    varchar2(100) path '$.name[*]',

        jsnvalue   varchar2(100) path '$.confidence[*]'
);
dbms_output.put_line(l_data);

Update SM_POSTS set AI_output=l_data where ID=l_id;

end;
<copy>
```



7. Now in the Rendering Pane, Right click on Body and then click Create Page Item.



8. For the newly created item, In the Property Editor, do the following:
   Under Settings:
    - For Submit when Enter Pressed: Set it to Yes
   Under Identification:
    - For Name - enter PX_AI_SEARCH, where PX is your Page Number(Eg: P1_AI_SEARCH)
    - For Type - select Text Field
   Under Layout:
    - For Position - Select After Logo



9. Now, we need are going to change the query and add Where clause.
Please select Timeline in the rendering Tab and the copy the below code and replace the SQL query in the property editor.
    ```
    <copy>
    select
    p.id,
    p.created_by AS user_name,
    p.post_comment AS comment_text,
    p.file_blob,
    p.file_mime,
    apex_util.get_since(p.created) post_date,
    (
        select count(*) from SM_REACTIONS smr
        where smr.post_id=p.id
    ) as REACTIONS,
    (
        select 'user-has-liked' from SM_REACTIONS smr
        where smr.post_id=p.id and created_by=:APP_USER
    ) USER_REACTION_CSS
   from SM_POSTS p
   where upper(ai_output) like upper(NVL('%'||:P1_AI_SEARCH||'%',ai_output))
   order by p.created desc;
   <copy>
   ```
