# Build a Conversational Inquiry about Schools using Generative AI

## Introduction
In this lab, you learn to build a conversational inquiry about schools using Generative AI wherein a user can ask questions about a school in chat and the chat widget uses Generative AI to provide context sensitive answers. This lab makes use of the latest feature of APEX 24.1 called the **Open AI Assistant**.

**Note:** The screenshots in this workshop are taken using Dark Mode in APEX 24.1.

Estimated Time: 20 minutes

<!-- Watch the video below for a quick walk-through of the lab.
[Create an APEX App](videohub:1_a6bi2e62) -->

### Objectives

In this lab, you will:
- Configure a Generative AI service in your workspace
- Build a conversational chatbot using Generative AI


## Task 1: Configure Generative AI Service
To use the Generative AI service in APEX, you need to first configure it at the workspace level.

1. From the App Builder, navigate to **Workspace Utilities** > **All Workspace Utilities**.

    ![Workspace homepage](images/ws-utilities.png ' ') 

2. Select **Generative AI**.

    ![Workspace Utilities page](images/select-genai.png ' ') 

3. Click **Create** to configure a Generative AI Service.

     ![Gen AI services page](images/create-genai.png ' ') 

4. In this workshop, you use OCI Generative AI Service as the AI provider. Enter/select the following:

    - AI Provider: **OCI Generative AI Service**
    - Name: **OCI Gen AI**
    - Compartment ID: *Enter your OCI Compartment ID*. Refer to the [Documentation](https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/contactingsupport_topic-Locating_Oracle_Cloud_Infrastructure_IDs.htm#:~:text=Finding%20the%20OCID%20of%20a,displayed%20next%20to%20each%20compartment.) to fetch your Compartment ID. If you have only one compartment, then use the OCID from the configuration file you saved in Lab 3.
    - Region: **us-chicago-1** (Currently, the OCI Generative AI Service is only available in limited regions)
    - Model ID: **meta.llama-3-70b-instruct** (You can also select other models as per your choice. Refer to the [documentation](https://docs.oracle.com/en-us/iaas/Content/generative-ai/use-playground-chat.htm#chat))
    - Used by App Builder: Enable the toggle button to **ON**. Note that the Base URL is auto generated.
    - Credentials: **apex\_ai\_cred**
    
    Click **Create**.

    <!--In this workshop, you use Open AI as the AI provider. Enter/select the following:

    - AI Provider: **Open AI**
    - Name: **Open AI**
    - Used by App Builder: Enable the toggle button to **ON**
    - API Key: Enter your Open AI API key. To signup for an Open AI key, visit [platform.openai.com](https://platform.openai.com/)
    
    Click **Create**. -->


    ![Gen AI services page](images/oci-gen-ai-details.png ' ') 


## Task 2: Create the Chat Page

1. Navigate to your application homepage and click **Create Page**. Select **Blank Page**.

    ![App home page](images/create-blank-page.png ' ') 

2. In the Create Blank page dialog, enter/select the following:
    - Page Number: **3**
    - Name: **Learn More**
    - Page Mode: **Modal Dialog**

    Click **Create Page**.

    ![create page wizard](images/learn-more.png ' ') 

3. In the rendering tree, under Components, right-click **Content Body** and select **Create Region**.

    ![Page Designer](images/create-region.png ' ')

4. In the Property Editor, enter/select the following:

    - Name: **Chat**
    
    ![Page Designer](images/name-chat.png ' ')

    - Appearance > Template: **Blank with Attributes**

    - Advanced > Static ID: **chat**

    ![Page Designer](images/template-options.png ' ')


## Task 3: Configure the Prompt Context

1. Create a Page Item to store the selected School ID. In the Rendering Tree, under Components, right-click **Content Body** and select **Create Page Item**. 

    ![Page Designer](images/create-page-item.png ' ')

2. In the Property Editor, enter/select the following:

    - Name: **P3\_SCHOOL\_ID**
    - Type: **Hidden**

    ![Page Designer](images/school-id.png ' ')

3. Similarly, repeat step 1 to create another Page Item. Then, enter/select the following in the Property Editor:

    - Name: **P3_CONTEXT**
    - Type: **Hidden**

    ![Page Designer](images/context-item.png ' ')


4. In the Rendering Tree, right-click **P3_CONTEXT** and select **Create Computation**.

    ![Page Designer](images/create-computation.png ' ')


5. In the Property Editor, enter/select the following:

    - Execution > Point: **Before Regions**
    - Under Computation:
        - Type: **SQL Query (Single Return Value)**
        - SQL Query: For the SQL Query, we will make use of the APEX Assistant to generate the query. Follow the next steps to generate the SQL query. Click the **Code Editor** icon.

    ![Page Designer](images/compute-sql.png =40%x*)

6. In the Code Editor, click **APEX Assistant** to open a drawer where you can chat with the AI Assistant. Enter the following prompt in the chat box and click **Send**:
    ```
    <copy>
        Help me create a query that returns only one column concatenating the following information for the HIGHSCHOOLS table:

        Please post the description of the column and the value, for example:

        'Overview of the school : '|| OVERVIEW_PARAGRAPH ||chr(10) || chr(13)||


        Overview of the school,
        Language Courses, 
        Advanced Placement Courses,
        Diversity in Admission Policy,
        extra curricular activities ,
        Public Schools Athletic League (PSAL) sports for boys,
        Public Schools Athletic League (PSAL) sports for girls, 
        facilities, 
        Academic opportunities 

        filtering by the id of the school

    </copy>
    ```
    ![Page Designer](images/enter-prompt.png ' ')

7. The AI Assistant suggests a SQL Query. You can provide further prompts to refine the query. Once you are happy with the query, click **Insert**. 

    ![Page Designer](images/insert-query.png ' ')

8. The SQL query is inserted into the Code Editor. Replace *your\_school\_id* with **:P3\_SCHOOL\_ID**. Click **Validate**. The SQL query should look like the following:

    ```
    <copy>
        SELECT
        'Overview of the school : '|| OVERVIEW_PARAGRAPH ||chr(10) || chr(13)||
        'The following Language Courses are taught here : '||LANGUAGE_CLASSES||chr(10) || chr(13)||
        'The following Advanced Placement Courses are taught : '||ADVANCEDPLACEMENT_COURSES||chr(10) || chr(13)||
        'The following is the Diversity in Admimission Policy for this school: '||diadetails||chr(10) || chr(13)||
        'The below extra curricular activities are available : '|| extracurricular_activities|| chr(10) ||chr(13)||
        ' The below are Public Schools Athletic League (PSAL) sports for boys: '||PSAL_SPORTS_BOYS || chr(10) ||chr(13)||
        ' The below are Public Schools Athletic League (PSAL) sports for girls : '||PSAL_SPORTS_GIRLS || chr(10) ||chr(13)||
        ' Other facilities in this school : '||addtl_info1 || chr(10) ||chr(13)||
        ' The following academic opportunities are available : '||academic_opportunities || chr(10)||chr(13)
 
         as prompt_context
 
        FROM HIGHSCHOOLS WHERE id = :P3_SCHOOL_ID;
        
    </copy>
    ```

    ![Page Designer](images/edit-validate.png ' ')

9. If the validation is successful, click **OK**.

    ![Page Designer](images/success-ok.png ' ')

## Task 4: Create a Dynamic Action for Chat Widget

1. From the Rendering Tree, navigate to the Dynamic Actions tab. Right-click **Page Load** and select **Create Dynamic Action**.

    ![Page Designer Dynamic Actions](images/create-da.png ' ')

2. In the Property Editor, for Name, enter **Open AI Assistant - Chat**.

    ![Page Designer Dynamic Actions](images/da-name.png ' ')

3. Under True action, select **Show**. In the Property Editor, enter/select the following:
    - Action: **Open AI Assistant**
    - Under Generative AI:
        - Service: **OCI Gen AI**
        - System Prompt: 
        ```
        <copy>
        Use the below context to answer all questions:
 
        '''
 
        &P3_CONTEXT.
 
        '''
 
        If the question cannot be answered based on the above context, say "Information Not Found!".

        </copy>
        ```
        - Welcome Message: **Welcome! How may I help you?**

    - Under Appearance:
        - Display as: **Inline**
        - Container Selector: **#chat**


     ![Page Designer Dynamic Actions](images/true-action.png ' ')


    Click **Save**.


## Task 5: Create Action to Launch the Chat

1. Navigate to the Search and Apply page. To do so, click the **Page Finder** in the toolbar and select **Page 1**.

    ![Page Designer Dynamic Actions](images/goto-page1.png ' ')

2. In the Rendering Tree, navigate to **Body** > **Tabs-Parent** > **Search Results**. Right-click **Actions** and select **Create Action**.

     ![Page Designer](images/create-action.png ' ')

3. In the Property Editor, enter/select the following:

    - Type: **Button**
    - Label: **Learn More**
    - Layout > Position: **Secondary**
    - Under Link > Target, click Link Builder - Target:
        - Page: **3**
        - Set Items:
        
            |Name | Value|
            |------|------|
            |P3\_SCHOOL\_ID| &ID. |
            {: title="Set Item name and value"}
        
        Click **OK**.

    - Under Appearance:
        - Display Type: **Text with Icon**
        - Icon: **fa-question-square-o**

    
    Finally, click **Save**.

    ![Page Designer](images/learn-more-button.png ' ')


## Summary

You now know how configure Generative AI service in your APEX workspace. You also learnt to build a conversational Chatbot using Generative AI.

You may now **proceed to the next lab**.   

## Acknowledgments

 - **Authors** - Toufiq Mohammed, Senior Product Manager; Apoorva Srinivas, Senior Product Manager
 - **Last Updated By/Date** - Apoorva Srinivas, Senior Product Manager, July 2024