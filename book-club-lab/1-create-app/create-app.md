# Create the Application

## Introduction

You will get started by creating a skeleton application and you will add to it in each lab until you have built a full application that allows you to create and manage a personal list of books you have read or want to read.

You will also need to sign up for an account on Google Books and obtain an API Key. A Google Books API Key is required for this tutorial, as authentication is needed to get data from the Google Books API.

Estimated Lab Time: 10 minutes


### Objectives
In this lab, you will:  
- Create a new application.  
- Edit the appearance and theme of your application.
- Update the application navigation.
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

## Task 4: Update the App Navigation

1. Since there will only be two pages in the nav menu, we're going to update the app navigation to be a simple top navigation bar instead of the default side drawer menu.

2. Navigate to the application home page and click **Edit Application Definition**.

    ![App home page with Edit Application Definition button highlighted](images/app-definition.png " ")

3. Click the **User Interface** tab and set the following:

    * Logo → Logo: **Image and Text**

    * Logo → Image URL: **#APP_FILES#icons/app-icon-512.png**

    * Logo → Text: **Book Club**

    * Navigation Menu → Display Navigation: **off**

    * Navigation Bar → Navigation Bar List: **Navigation Menu**

    * Navigation Bar → List Template: **Navigation Bar**

    * Click **Apply Changes**

    ![Edit Application Definition page open with User Interface - Logo attributes being edited](images/edit-user-interface-1.png " ")

    ![Edit Application Definition page open with User Interface - Navigation Menu/Bar attributes being edited](images/edit-user-interface-2.png " ")

    *Note: This will remove the top navigation bar containing the user menu and replace it with our Navigation List. We will add the user menu back next.*

4. Now we will add the user menu to the top navigation bar so the user can log out.

5. Navigate back to the application home page and click **Shared Components**.

    ![App home page with Shared Components tab button highlighted](images/shared-components.png " ")

6. Under Navigation and Search, click **Navigation Bar List**.

    ![Shared Components page open with Navigation Bar List link highlighted](images/nav-bar-list.png " ")

7. Click on the **Navigation Menu** entry to edit the list.

    ![Navigation Bar List page open with entry highlighted](images/nav-menu-list.png " ")

8. Click **Create Entry** button.

    ![Navigation Menu List page open with Create Entry button highlighted](images/create-entry.png " ")

9. Set the following properties for the new List Entry:

    * Entry → Image/Class: **fa-user**

    * Entry → List Entry Label: **&APP_USER.**

    * Target → Target Type: **URL**

    * Target → URL Target: **#**

    * User Defined Attributes → List Item CSS Classes: **has-username**

    * Click **Create and Create Another**

    ![List Entry page open with edited properties](images/list-entry-1-1.png " ")

    ![List Entry page open with edited properties](images/list-entry-1-2.png " ")

10. Set the following properties for the new List Entry:

    * Entry → Parent List Entry: **&APP_USER.**

    * Entry → List Entry Label: **---**

    * Target → Target Type: **URL**

    * Target → URL Target: **separator**

    * Conditions → Condition Type: **User is Authenticated (not public)**

    * Click **Create and Create Another**

    ![List Entry page open with edited properties](images/list-entry-2.png " ")

11. Set the following properties for the new List Entry:

    * Entry → Parent List Entry: **&APP_USER.**

    * Entry → Image/Class: **fa-sign-out**

    * Entry → List Entry Label: **Sign Out**

    * Target → Target Type: **URL**

    * Target → URL Target: **&LOGOUT_URL.**

    * Conditions → Condition Type: **User is Authenticated (not public)**

    * Click **Create List Entry**

    ![List Entry page open with edited properties](images/list-entry-3.png " ")

12. Click **Apply Changes**.

    ![List:Navigation Menu page open with Apply Changes button highlighted](images/apply-changes.png " ")

13. Run the application to see the updated navigation bar.

You now know how to create, run, and update the theme/navigation of an application. You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Maddie Thompson
- **Last Updated By/Date** - Maddie Thompson, November 2024
