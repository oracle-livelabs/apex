# Create Vector Providers

## Introduction

In this lab, you will create Vector Providers in Oracle APEX for both the CLIP text model and the CLIP image model. These vector providers act as bridges between your APEX application and the underlying ONNX models stored in Oracle Database 23ai. They allow you to generate and use vector embeddings for both text inputs and image inputs as part of a semantic search experience.

Estimated Time: 10 minutes

### Objectives

In this lab, you:

- Create a Database-based Vector Provider using the CLIP text model

- Create a PL/SQL Function

- Create a Custom PL/SQL Vector Provider using the CLIP image model.

## Task 1: Create a Vector Provider for Text Search

 In this task, you configure a vector provider to generate embeddings from text input using the CLIP text model stored in the database.

1. Navigate to **App Builder**.

    ![App Builder Home Page](images/app_builder_homepage.png " ")

2. Select **Workspace Utilities**.

    ![App Builder Home Page](images/app_builder_homepage2.png " ")

3. Select **Vector Providers**.

    ![Workspace Utilities](images/vector.png " ")

4. Click **Create**.

    ![Create Vector Provider](images/create-vectorprovider.png " ")

5. Enter/Select the following in the create window:

    - Under Identification:

        - Provider Type: **Database ONNX Model**
        - Name:**CLIP TEXT MODEL**
        - Static ID: **clip\_text\_model**

    - Under Local Embedding:

        - ONNX Model Owner: **Select your schema**
        - ONNX Model Name: **CLIP\_TXT\_MODEL**

    and click on **Create**.

    ![Create Text Vector Provider](images/create-textmodel.png " ")

    ![Create Text Vector Provider](images/created-model.png " ")

## Task 2: Create a Custom PL/SQL Vector Provider for Image Search

In this task, you will write a PL/SQL function that uses the CLIP image model to generate vector embeddings from image BLOBs. You’ll then create a custom vector provider in APEX that leverages this function to support semantic image search in your app.

1. Navigate to the SQL Workshop > SQL Commands page.

    ![Page Designer](images/sql-commands.png " ")

2. In the Property Editor, enter the following:

    ```
     <copy>
     CREATE OR REPLACE FUNCTION clip_image_model (p_base64_image IN CLOB) RETURN VECTOR IS
     l_blob   BLOB;
     l_vector VECTOR;
     l_params CLOB := '{"provider": "database", "model": "clip_img_model"}';
     BEGIN
        l_blob := apex_web_service.clobbase642blob(p_base64_image);
        select to_vector(VECTOR_EMBEDDING(clip_IMG_model USING l_blob AS data )) into l_vector ;
        RETURN l_vector;
     END;
     </copy>
    ```

    and click **Run**.

    ![Property Editor](images/run-command.png " ")
3. In the Navigation bar, navigate to App Builder > Workspace Utilities > **All Workspace Utilities**.

    ![App Builder Utilities](images/workspace-utils.png)

4. Select **Vector Providers**.

    ![Workspace Utilities](images/vector.png " ")

5. Click **Create**

    ![Create Vector Provider](images/create-vector-provider2.png " ")

6. In the Property Editor, enter/select the following properties:

    - Under Identification:

        - Provider Type: **Custom PL/SQL**
        - Name:**CLIP IMAGE MODEL**
        - Static ID: **clip\_image\_model**

    - Under Local Embedding:

        - Custom Function Name: **clip\_image\_model**

    and click on **Create**.

    ![Property Editor Create Vector Provider](images/create-vector-provider3.png " ")

    ![Vector Providers List](images/create-vector-provider4.png " ")

## Summary

You now know how to create a Database ONNX vector provider for text and a Custom PL/SQL vector provider for images, enabling powerful hybrid semantic search in your APEX application.

## Acknowledgments

- **Author** - Sahaana Manavalan, Senior Product Manager, May 2025
- **Last Updated By/Date** - Sahaana Manavalan Senior Product Manager, May 2025
