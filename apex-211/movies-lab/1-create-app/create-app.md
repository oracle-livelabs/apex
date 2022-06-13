# Create the Application

## Introduction

You will get started by creating a skeleton application and you will add to it in each lab until you have built a full application that allows you to create and manage a personal list of movies you have watched or want to watch.

You will also need to sign up for an account on The Movie Database and obtain an API Key. A TMDB API Key is required for this tutorial, as authentication is needed to get data from The Movie Database API.

Estimated Lab Time: 5 minutes

### Objectives
In this lab, you will:  
- Create a new application.  
- Edit the appearance and theme of your application.  
- Run your application.  
- Sign up for a TMDB API key.

### Prerequisites
- An Oracle APEX workspace

## Task 1: Create the App

1. If you have not already logged into your Oracle APEX workspace, sign in using the workspace name, email, and password you signed up with.

    ![Screenshot of Oracle APEX sign-in page.](images/workspace-sign-in.png " ")

2. At the top left of your workspace, click **App Builder**.

    ![Screenshot of Oracle APEX workspace home page with the App Builder button highlighted.](images/workspace-home-edit.png " ")

3. On the App Builder page, click the **Create** button.

    ![Screenshot of App Builder page with the Create button highlighted.](images/app-builder-home-edit.png " ")

4. Click **New Application**.

    ![Screenshot of the Create an Application page with the New Application option highlighted.](images/new-application-edit.png " ")

## Task 2: Name and Enhance the Appearance of the App

1. In the Create Application wizard, set the Name to **Movies Watchlist**.

2. Click the expand button next to Appearance.

    ![Screenshot of the Create an Application page with Movies Watchlist entered as Name (1) and Appearance expand button highlighted (2).](images/create-app-name-edit.png " ")

    * Select the **Vita-Dark theme**.

    * Click **Choose new icon**.

        - Select the red color swatch and the smiley face icon.

        - Click **Set Application Icon**.

    * Click **Save Changes**.
    
    ![Screenshot of the Appearance dialog with Vita-Dark selected (1), Choose New Icon button highlighted (2), and Save Changes button highlighted (3).](images/edit-app-appearance-edit.png " ")

3. In the Pages section of the Create Application wizard, click the **Edit** button next to Home.

    ![Screenshot Create an Application page with the Home page Edit button highlighted.](images/create-app-pre-edit-home-edit.png " ")

    * In the dialog, set Page Name: **My Watchlist**

    * Click the **Set Icon** button.

        - In the Select Icon dialog, search for **film**.

        - Click the film icon that has the play button in the middle.

    * Click **Save Changes**.

    ![Screenshot of the Edit Page dialog and the Select Icon dialog over it with My Watchlist entered as Page Name (1), Set Icon button highlighted (2), film entered in icon search field (3), fa-film icon highlighted (4), and Save Changes button highlighted (5).](images/film-icon-edit.png " ")

4. Click **Create Application** to create your app and go to the application home page.

    ![Screenshot of the Create an Application page with the Create Application button highlighted.](images/create-application-edit.png " ")

## Task 3: Run the App

1. On your application home page, click **Run Application**.

    ![Screenshot of application home page with the Run Application button highlighted.](images/app-home-edit.png " ")

2. On the sign in page that opens in a new tab in your browser, enter your username and password that you used to sign in to your workspace.

3. Click **Sign In**.

    ![Screenshot of the runtime application sign-in page.](images/app-sign-in-edit.png " ")

## Task 4: Update the Theme of the App

1. In the tab that your app is running in, you will see a grey toolbar at the bottom of the page. This is your development toolbar that allows you to edit regions in your application user interface (UI) directly in the tab it's running in.  
*Note: If you do not see the grey developer toolbar, mouse over the bottom of your browser window to make it display. End users who log directly into the app will not see this toolbar.*

2. In the dev toolbar, click on **Customize** and then click **Theme Roller**.

    ![Screenshot of runtime application developer toolbar with Customize expanded (1) and Theme Roller selected (2).](images/theme-roller-dev-bar-edit.png " ")

3. Within the Theme Roller, you can modify many different aspects of the application UI. You will use it right now to update the color scheme.

4. Click on **Global Colors** to expand the dropdown.

    * Copy the HEX color code: **C74634**

    * Click on the color swatch next to **Header Accent** and paste the HEX code in the Hex text box.

    ![Screenshot of runtime application with Theme Roller open, Global Colors expanded (1), Primary Accent color picker open (2), and C74634 entered in the color picker Hex field (3).](images/theme-roller-header-edit.png " ")

    * Click on the color swatch next to **Body Accent** and paste the HEX code **312D2A** in the Hex text box.

    * The other color swatches automatically updated to variations of the Header Accent color.

    * Click **Save As**.

    * Style Name: **Movies - Dark**

    * Click **Save**.

    * Close the Theme Roller window.

    ![Screenshot of runtime application with Theme Roller open and the Save As dialog open (1), with Style Name set as Movies - Dark (2) and the Save button highlighted (3).](images/save-style-edit.png " ")

5. You have now updated the color scheme of your app.

## Task 5: Sign up for a TMDB API Key

1. Go to [The Movie Database (TMDB)](https://www.themoviedb.org/signup) to sign up for a free account.

2. Once registered, follow the [Getting Started](https://developers.themoviedb.org/3/getting-started/introduction) instructions on TMDB Developer site. You will need to enter some of your app and contact information:

    ![Screenshot of The Movie Database API sign up page with Type of Use set to Website (1), Application Name set to Movies Watchlist (2), Application URL set to the URL of the runtime application (3), Application Summary set to a short description of the Movies Watchlist application (4), and the contact information field highlighted.](images/api-key-signup-edit.png " ")

3. After you have received your API Key, copy it and store it somewhere where you will be able to easily access it.

4. Make a sample API request to get the details of a single movie using your new API Key:

    - Go to the [TMDB Movie Details](https://developers.themoviedb.org/3/movies/get-movie-details) page.

    - Click on the **Try it out** tab.

    ![Screenshot of TMDB Movie Details API page with the Try it out tab highlighted.](images/details-api-edit.png " ")

    - Under **Variables**, click the box next to **api_key** and paste your API key.

    - Under **Path Params**, click the box next to **movie_id** and type 505.

    - Click the bright pink **Send Request** button.  
      *Note: If the Send Request button does not work, copy the link next to the button, paste it in a new browser tab and hit enter/return.*

    ![Screenshot of TMDB Movie Details API page Try it out tab with Your TMDb API key and Integer fields and Send Request button highlighted.](images/details-request-edit.png " ")

    - Now you can explore the data that gets returned when requesting the details for a single movie.  

5. You can also go back to the **Definition** tab (next to Try it out) and scroll to the **Responses** section at bottom of the page to further explore the type of data that gets returned. Under Responses, Schema will show you the object fields and data types, while Example will give you example data without having to make a request like you did above.

You now know how to create, run, and update the theme of an application. You may now **proceed to the next lab**.

## Resources

- [App Builder Concepts](https://docs.oracle.com/en/database/oracle/application-express/21.1/htmdb/application-builder-concepts.html#GUID-6D22E307-6D48-49BC-9FDC-A7D8B037E46A)

- [Universal Theme](https://apex.oracle.com/pls/apex/apex_pm/r/ut/getting-started)

- [The Movie Database](https://www.themoviedb.org/)

- [The Movie Database API](https://developers.themoviedb.org/3/getting-started/introduction)

## Stuck? Download the Application Here
Stuck on a step or struggling with the lab? You can download a copy of the Movies Watchlist application through Lab 1 and follow the instructions below to import it into your Oracle APEX workspace.  

- [Click here](./files/lab1.sql) to download a copy of the app at the end of Lab 1.

- You can import Lab 1 to your APEX workspace by clicking **Import** in the App Builder home page and following the wizard steps.

## Acknowledgments

- **Author** - Paige Hanssen
- **Additional Contributors** - Kay Jasanya, Shakeeb Rahman, Steve Muench, Monica Godoy, Eli Feuerstein, Carlos Maciel, Dalia Vazquez
- **Last Updated By/Date** - Paige Hanssen, March 2022