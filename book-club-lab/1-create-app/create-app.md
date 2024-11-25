# Create the Application

## Introduction

You will get started by creating a skeleton application and you will add to it in each lab until you have built a full application that allows you to create and manage a personal list of books you have read or want to read.

You will also need to sign up for an account on Google Books and obtain an API Key. A Google Books API Key is required for this tutorial, as authentication is needed to get data from the Google Books API.

Estimated Lab Time: 5 minutes


### Objectives
In this lab, you will:  
- Create a new application.  
- Edit the appearance and theme of your application.
- Run your application.  

### Prerequisites
- An Oracle APEX workspace

## Task 1: Create the App

1. If you have not already logged into your Oracle APEX workspace, sign in using the workspace name, email, and password you signed up with.

    ![Oracle APEX workspace login page](images/apex-sign-in.png " ")

2. At the top left of your workspace, click **App Builder**.

    ![APEX workspace home page with highlighted App Builder button](images/workspace-home-edit.png " ")

3. On the App Builder page, click the **Create** button.

    ![App Builder page with highlighted Create button](images/app-builder-create.png " ")

4. Select the **Use Create App Wizard** option.

    ![Create an Application page with the Use Create App Wizard list item highlighted](images/new-application-edit.png " ")

5. In the Create an Application wizard, set Name to **Book Club**.

6. On the Create Application page, click the application icon.

7. In the Choose Application Icon wizard, upload your own icon by selecting or dragging and dropping an image. Download a sample icon from [here](images/book-club-logo.png).
  ![Image showing the Choose Application Icon wizard](images/upload-icon.png " ")

8. Once you select an image, the wizard allows you to crop or resize the image. Click **Save Icon**.
    ![Image showing an icon editor in Choose Application Icon wizard](images/crop-and-save-icon.png " ")

9. In the Pages section of the Create Application wizard, click the **Edit** button next to Home.

    ![Close-up of the Pages section of the Create an Application wizard](images/edit-home-page.png " ")

    * In the dialog, set Page Name: **My Library**

    * Click the **Set Icon** button.

        - In the Select Icon dialog, search for **book**.

        - Click the book icon.

    * Click **Save Changes**.

    ![Select icon dialog over top Add Blank Page dialog, with film icon selected](images/home-page-changes.png " ")

10. Click **Create Application** to create your app and go to the application home page.

    ![Highlighted Create Application button on Create an Application page](images/create-app.png " ")

## Task 2: Run the App

1. On your application home page, click **Run Application**.

    ![Book Club app home with Run Application button highlighted](images/run-app.png " ")

2. On the sign in page that opens in a new tab in your browser, enter your username and password that you used to sign in to your workspace.

3. Click **Sign In**.

    ![Book Club runtime application sign-in page](images/app-sign-in.png " ")

## Task 3: Update the Theme of the App

1. In the tab that your app is running in, there will be a grey toolbar at the bottom of the page. This is your development toolbar that allows you to edit regions in your application user interface (UI) directly in the tab it's running in.  
*Note: If you do not see the grey developer toolbar, mouse over the bottom of your browser window to make it display. End users who log directly into the app will not see this toolbar.*

2. In the dev toolbar, click on **Customize** and then click **Theme Roller**.

    ![Close-up of developer toolbar in runtime application with the Customize menu open](images/dev-toolbar.png " ")

3. Within the Theme Roller, you can modify many different aspects of the application UI. 

2. In the Theme Roller dialog, enter/select the following: 
    - Select Theme: **Redwood Light**
    - Under Redwood Options:
        - Pillar: **Lilac**
    - Under Appearance:
        - Header: **Pillar**
        - Navigation: **Pillar**
        - Body Header: **Dark**

    ![Application page in runtime with Theme roller dialog open](images/theme-roller.png =50%x*)

3. Click **Save As**. In the dialog, for Style Name, enter **Redwood Light Custom**. Finally, click **Save**.
    ![Theme Roller Save as](images/theme-save.png =50%x*)

    ![App with redwood light theme](images/redwood-light.png " ")
    
    You have successfully customized the application theme.

You now know how to create, run, and update the theme of an application. You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Maddie Thompson
- **Last Updated By/Date** - Maddie Thompson, November 2024
