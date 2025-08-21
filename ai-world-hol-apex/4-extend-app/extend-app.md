# Extend your APEX App with Grok Models.

##  Introduction
In this lab, we’ll enhance the GenAI assistant experience by exploring how to switch between different OCI Generative AI models.  
Different models may perform better depending on your application’s domain — testing them helps you deliver the best user experience.

###  Objectives
By the end of this lab, you will:
- Learn how to utilize additional LLMs (like Grok) within your APEX App.

###  Prerequisites
This lab assumes you have:
- Access to Oracle Cloud Infrastructure (OCI) (paid account or free tier) in a region with Generative AI available.  
- Basic experience** with the OCI Console and APEX components.  

---

## Task 1: Try out Grok Models or other LLMs in your APEX Application 

### Step 1: Explore Available Models
1. Open the documentation for pretrained models:  
   [OCI Generative AI Pretrained Models](https://docs.oracle.com/en-us/iaas/Content/generative-ai/pretrained-models.htm)  
   - ![Step1-Models](images/step1-models.png)

2. Browse through the list of available models and note the **Model ID** you want to test.  
   Example:  xai.grok-4


---

### Step 2: Update Your APEX Application
1. Return to your **APEX Workspace**, go to **App Builder**, and open your existing application.  
- ![Step2-AppBuilder](images/step2-appbuilder.png)

2. On the top menu, select:  
- **Shared Components → AI Configurations**  
- ![Step2-AIConfig](images/step2-aiconfig.png)

3. Select your **existing AI configuration**.

4. In the **Model ID** field, replace the current value with the one you copied (e.g., `xai.grok-4`).  
- ![Step2-ModelID](images/step2-modelid.png)

5. Click **Apply Changes** to save.  

---

### Step 3: Run and Compare
1. Return to your application in **App Builder**.  
2. Click **Run Application**.  
- ![Step3-RunApp](images/step3-runapp.png)

3. Interact with the assistant and observe how it responds.  

Try switching between two models — note differences in:
- **Tone** (formal vs casual)  
- **Detail level** (short vs comprehensive)  
- **Response speed**  

You’ve successfully **extended your APEX app** by experimenting with **different LLMs (like Grok)**.  
This approach allows you to **fine-tune the assistant experience** based on different model selection.

---


## Acknowledgments

* **Authors:**

* Karol Stuart, Master Principal Cloud Architect 
* Graham Anderson, Senior Cloud Architect 

* **Last Updated by/Date** - Karol Stuart, August 2025
