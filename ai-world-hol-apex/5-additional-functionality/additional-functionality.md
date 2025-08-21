# Lab 5: Build a Mood-Based Movie Recommender with GenAI 🎬

##  Introduction
In this lab, you’ll create a **fun APEX application** that uses **GenAI** to recommend movies based on the user’s **mood**.  
You’ll upload a movie dataset, configure a GenAI assistant, and integrate it into your application so users can interact with it naturally.

###  Objectives
By the end of this lab, you will:
- Upload and manage a **movie dataset** in your database  
- Configure and integrate a **GenAI assistant** into your application  
- Build a **Mood-Based Movie Recommender** that suggests movies based on user input 

###  Prerequisites
This lab assumes you have:
- Access to Oracle Cloud Infrastructure (OCI) (paid account or free tier) in a region with Generative AI available.  
- Basic experience** with the OCI Console and APEX components.  

### Dataset

[Click here](datasets/movies_sample.csv) to access the full movies_sample.csv dataset. Here’s a preview of the sample movie dataset you’ll upload:

| Title                   | Genre     | Rating | Keywords                        |
|--------------------------|----------|--------|---------------------------------|
| The Shawshank Redemption| Drama    | 9.3    | inspiring, hopeful, friendship  |
| Inception                | Sci-Fi   | 8.8    | mind-bending, thrilling, adventurous |
| The Lion King            | Animation| 8.5    | nostalgic, heartwarming, family |
| Interstellar             | Sci-Fi   | 8.6    | adventurous, emotional, epic    |
| Forrest Gump             | Drama    | 8.8    | nostalgic, emotional, inspiring |


---

## Step 1: Import a Movie Dataset 

1. In your APEX workspace, go to:
   - **App Builder → Create → From a File**
   - ![Step1-AppBuilder](images/step1-appbuilder.png)

2. Click **Select File**, and upload a CSV containing sample movie data.  

   Example fields:
   ```
   Title, Genre, Summary, Rating, Keywords
   ```

3. Name the table **MOVIE_RECOMMENDER** and click **Load Data**.  
   - ![Step1-LoadData](images/step1-loaddata.png)

4. Create the application:
   - **Click Create Application**  
   - Give it a name (e.g., *Movie Mood Recommender*)  
   - Enable Access Control if desired  
   - **Finish the wizard and run your application**  
   - ![Step1-AppWizard](images/step1-appwizard.png)

---

## Step 2: Configure GenAI Assistant

1. Go to:
   - **Shared Components → AI Configurations → Create**  
   - ![Step2-AIConfig](images/step2-aiconfig.png)

2. Select your **existing GenAI Credential**.

3. Name your config: **MovieMoodAssistant**.

4. In **System Prompt**, enter:
   ```
   You are a helpful movie expert. Based on the user's mood, suggest 3 movies from the MOVIE_RECOMMENDER table that best match how they feel.
   ```

5. Add a **Welcome Message**:
   ```
   Hi there! Tell me how you’re feeling and I’ll recommend a movie just for you.
   ```

---

## Step 3: Add a RAG Source 

1. From the AI Configuration page → **Create RAG Source**  
   - ![Step3-RAGSource](images/step3-ragsource.png)

2. Name it: **MovieMoodData**.

3. Enter SQL:
   ```sql
   SELECT * FROM MOVIE_RECOMMENDER;
   ```

4. Click **Create**.

---

## Step 4: Add Assistant to the App Home Page 

1. Go to:
   - **App Builder → Page 1 – Home**  
   - ![Step4-AppHome](images/step4-apphome.png)

2. In the **Rendering Tree**, right-click your **Welcome Region → Create Button**.

3. Configure the button:
   - **Name**: `Launch_Mood_Assistant`
   - **Template**: Text with Icon
   - **Icon**: `fa-face-smile`

4. Scroll to **Behavior**, set **Action** to: *Defined by Dynamic Action*.  

---

## Step 5: Configure the Dynamic Action

1. Right-click the new button → **Create Dynamic Action**.  
   - ![Step5-DynamicAction](images/step5-dynamicaction.png)

2. Name it: `Launch_Mood_Assistant`.

3. Under **True Action**:
   - Set **Action** → *Show AI Assistant*
   - Select your config → **MovieMoodAssistant**.

---

## Step 6: Run and Test 

1. Click **Run Application**.
2. Log in, and click the **Launch Mood Assistant** button.
3. Try prompts like:
   - *I’m in a nostalgic mood and want something heartwarming.*  
   - *I’m feeling adventurous and need something thrilling!*  

Your assistant will now respond with **smart movie suggestions** from the dataset. You’ve successfully built a **Mood-Based Movie Recommender** with **APEX + GenAI**!

---


## Acknowledgments

* **Authors:**

* Karol Stuart, Master Principal Cloud Architect 
* Graham Anderson, Senior Cloud Architect 

* **Last Updated by/Date** - Karol Stuart, August 2025