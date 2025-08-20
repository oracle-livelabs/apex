# Extend your APEX App with Grok Models

## Introduction

In this lab, we’ll enhance the GenAI assistant experience by exploring how to switch between different OCI Generative AI models. Different models may perform better depending on your application's domain — and testing them can help you deliver the best user experience. 


### Objectives

In this lab, you will:
* Learn how to utilize additional LLM's within your APEX App


### Prerequisites

This lab assumes you have the following:

Access to Oracle Cloud Infrastructure (OCI), paid account or free tier, in a region that has:
Generative AI
Basic experience with OCI Cloud Console and standard components.

## Task 1: Try out Grok Models or other LLM's in your APEX Application

1. Go to <a href="https://docs.oracle.com/en-us/iaas/Content/generative-ai/pretrained-models.htm" target="_blank">OCI Generative AI Pretrained Models</a>

Browse through the list of available models and take note of the Model ID you want to test — for example: ***xai.grok-4***
 
You’ll use this ID in your APEX app to replace the existing model.

2. Return to your APEX Workspace, go to App Builder and open your existing application.

3. On the top menu, select Shared Components.

4. Under the Generative AI section and click AI Configurations. Select your existing AI configuration. 

5. In the Model ID field, replace the existing value with the one you copied above, such as: **xai.grok-4**

6. Click Apply Changes to save.

7. Test out the new model by returning to your application in App Builder and Click Run Application. Observe the assistant’s response. How does it differ from your previous model? Try switching between two models and noting how responses vary in tone, detail, or speed.