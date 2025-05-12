# Run the Application

## Introduction

In the previous labs, you went through detailed steps to configure and use Generative AI in a Highschool Application that will enable parents to choose the best highschool for their child. Now, it is finally time to see the completed app in action.

**Note:** The screenshots in this workshop are taken using Dark Mode in APEX 24.1.2

Estimated Time: 5 minutes

<!-- Watch the video below for a quick walk-through of the lab.
[Create an APEX App](videohub:1_a6bi2e62) -->

### Objectives

In this lab, you will:

- Run the application
- Explore the various features of the app

## Task 1: Run the Application

1. From the Page Designer, click **Save and Run** to run the application. Or, you can also navigate to the application homepage and click **Run Application**.
    ![Page Designer](images/save-and-run.png ' ')

2. Login to your application using your APEX account.
    ![App login screen](images/login.png ' ')

## Task 2: Explore the App Features

1. You can see the Faceted Search page where the schools are listed as cards. Apply facets to filter the schools. Select the following facets under Interest:
    - **Science & Math**
    - **Computer Science & Technology**

    ![Search and Apply page in the running app](images/apply-facet.png ' ')

2. Switch to the Maps tab to display the schools on a map.
    - Apply facet for Distance: **Less than 5 Miles**
    - Apply another facet for Borough: **Manhattan**
    The search narrows down to 15 schools.
    ![Maps tab in the running app](images/map.png ' ')

3. Switch to the Cards tab again. For the **Manhattan Center for Science and Mathematics** school, click **Learn More (i)icon**. An AI Assistant Chat Interface dialog is displayed.

    ![search schools tab](images/learn-more.png ' ')

4. In the chat dialog, select the suggestion chip **Provide an overview of the school**. You can ask questions about the school in natural language and get appropriate responses. Some example prompts are provided below:

    - What language courses are taught here?
    - What advanced placement courses are taught at this school?

    Review the responses and close the dialog.

    ![AI chat bot](images/chat.png ' ')

5. Let's say, as a parent, I am happy with the school and would like to apply. Click **Apply** for *Manhattan Center for Science and Mathematics* school.
    ![cards page](images/apply.png ' ')

6. An Apply to School drawer opens up for editing. For Student Name, enter **Joe**. And click **Generate Letter**. This invokes the Gen AI service to generate an email for you.
    ![apply to school drawer](images/student-name.png ' ')

7. Review the generated email and make modifications if needed. Finally click **Send Application**.
    ![apply to school drawer](images/generate-letter.png ' ')

8. The application was successfully submitted.
    ![app homepage](images/apply-sent.png ' ')

9. You can explore more about NYC Highschools by asking generic questions about any school using the **Ask a Question** button.

    Click **Ask a Question**. An AI chat dialog opens with a welcome message. Type the following question:

    ```
    <copy>
        What are the top 3 reasons to choose a highschool in New York city?
    </copy>
    ```
    ![app homepage](images/ask-a-q.png ' ')

    Be thrilled to learn more about NYC Highschools by asking questions and receiving a response from Generative AI!

## Summary

You now know how to run the app and explore the Gen AI features of the app.

## Acknowledgments

 - **Authors** - Toufiq Mohammed, Senior Product Manager; Apoorva Srinivas, Senior Product Manager
 - **Contributing Author** - Pankaj Goyal, Member Technical Staff
 - **Last Updated By/Date** - Apoorva Srinivas, Senior Product Manager, June 2024




