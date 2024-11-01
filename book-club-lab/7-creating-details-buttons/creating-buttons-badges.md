# Implement Movie Details Buttons and Movie Search Badges

## Introduction
In the previous lab, you did the backend work to set up tables and application items. In this lab, you will be creating Add, Remove, Watched, and Back buttons that will control the flow between the Movie Search and Movie Details page, as well as the data stored in the watchlist table. You will also add a badge to the Cards on the Movie Search page to have a visual cue for movies that a user has already marked as added or watched.

Estimated Lab Time: 25 minutes

Watch the video below for a quick walk-through of the lab.
[Implement Buttons and Badges](videohub:1_72lhu5y9)

### Objectives
In this lab, you will:  
- Implement an Add button that inserts a movie into the watchlist table.  
- Implement a Remove button that deletes a movie from the watchlist table.  
- Implement a Watched button that marks a movie as watched in your watchlist table.  
- Implement a Back button that takes you back to the Movie Search page.  
- Use badges on the Movie Search page to display what movies have been marked as added or watched.

### Prerequisites
- Completion of workshop through Lab 5

## Task 1: Create the Movie Details Buttons

1. Click on **App Builder** in the APEX navigation bar.

2. Click on your **Movies Watchlist** app.

3. Click on the **Movie Details** page.

4. When you set up the Movie Details page, a Buttons region was automatically created in the Dialog Footer position of the page with a Cancel button. You are going to move this region to the Dialog Header position and add some buttons that will allow you to add, remove, and update your watchlist.

5. In the rendering pane, click on the **Buttons** region and set the following properties:

    * Layout → Position: **Dialog Header**.

    * Appearance → Template Options:

        - Style: **Remove UI Decoration**

        - Click **Ok**.

    ![Template Options Dialog open for the Buttons region on Page 3 in Page Designer](images/buttons-region.png " ")

6. Click on the CANCEL button under the Buttons region.

    * Identification → Button Name: **BACK**

    * Layout → Position: **Previous**

    * Appearance → Button Template: **Text with Icon**

    * Appearance → Template Options:

        - Style: **Remove UI Decoration**

        - Click **Ok** to close the dialog.

    * Appearance → Icon: **fa-chevron-left**

    ![Page 3 open in Page Designer with the BACK button properties open in the Property Editor](images/back-properties.png " ")

7. Click the right arrow next to the BACK button and then the right arrow next to Dynamic Actions to see the Dynamic Action events connected to the button.

8. Delete the Dynamic Action by right clicking on the **Cancel Dialog** event under Dynamic Actions and selecting **Delete**.

    ![Page 3 open in Page Designer with the context menu open for the Cancel Dialog event](images/delete-cancel.png " ")

7. Right click the Buttons region and select **Create Button**.

    * Identification → Button Name: **ADD\_TO\_WATCHLIST**

    * Layout → Position: **Next**

    * Appearance → Hot: **on**

    ![Page 3 open in Page Designer with the ADD_TO_WATCHLIST button properties open in the Property Editor](images/add-button.png " ")

8. Right click the Buttons region and select **Create Button**.

    * Identification → Button Name: **REMOVE\_FROM\_WATCHLIST**

    * Layout → Position: **Next**

    ![Page 3 open in Page Designer with the REMOVE_FROM_WATCHLIST button properties open in the Property Editor](images/remove-button.png " ")

9. Right click the Buttons region and select **Create Button**.

    * Identification → Button Name: **MARK\_WATCHED**

    * Identification → Label: **I've Watched This**

    * Layout → Position: **Next**

    * Appearance → Hot: **on**

    ![Page 3 open in Page Designer with the MARK_WATCHED button properties open in the Property Editor](images/watched-button.png " ")

10. Click **Save**.

## Task 2: Implement Button Actions
Now that you have the four buttons, it's time to connect actions to them. You first will connect each button to a database action. Then, you will implement those actions using a page process for each button. You will also use a branch to redirect the user back to the previous page once the process is complete.

1. In the rendering pane, click on the **BACK** button and scroll down to the Behavior section.

    * Action: **Redirect to Page in this Application**

    * Click the button next to Target to open the Link Builder → Target dialog.

        - Page: **2**

        - Click **Ok**.

    ![BACK button Link Builder Target dialog open on Page 3 in Page Designer](images/back-behavior.png " ")

2. Click on **ADD\_TO\_WATCHLIST**.

    * Scroll down to Behavior and set Database Action to **SQL INSERT action**.

    ![Page 3 open in Page Designer with the ADD_TO_WATCHLIST button Behavior properties open in the Property Editor](images/add-behavior.png " ")

3. Click on **REMOVE\_FROM\_WATCHLIST**.

    * Set Database Action to **SQL DELETE action**.

4. Click on **MARK\_WATCHED**.

    * Set Database Action to **SQL UPDATE action**.

5. At the top of the rendering pane, click the **Processing** tab (the two looping arrows).

    ![Close-up of tabs at the top of the rendering pane in Page Designer with the third tab highlighted](images/processing-tab.png " ")

6. Under the Processing section, click on the existing **Close Dialog** process and make the following changes:

    * Identification → Name: **Add movie**

    * Identification → Type: **Execute Code**

    * Copy the following code and paste it into the PL/SQL code box in the Source property group:

		```
	    <copy>
	    insert into watchlist
			(
				movie_id,
				user_id,
				watched_yn,
				title,
				poster_url,
				release_date,
				runtime,
				vote_average
			)
		values
			(
				:P3_ID,
				:USER_ID,
				'N',
				:P3_TITLE,
				'https://image.tmdb.org/t/p/w500'||:P3_POSTER_PATH,
				:P3_RELEASE_DATE,
				:P3_RUNTIME,
				:P3_VOTE_AVERAGE
			);
	    ```

    * Server-side Condition → When Button Pressed: **ADD\_TO\_WATCHLIST**

    * Server-side Condition → Type: **- Select -**

    ![Close-up of the Add movie process properties set in step 6](images/add-process.png " ")

7. Right click on Processing and select **Create Process**.

    * Identification → Name: **Remove movie**

    * Copy the following code and paste it into the PL/SQL code box in the Source property group:

		```
	    <copy>
	    delete from watchlist 
		 where movie_id = :P3_ID 
		   and user_id = :USER_ID;
	    ```

    * Server-side Condition → When Button Pressed: **REMOVE\_FROM\_WATCHLIST**

8. Right click on Processing and select **Create Process**.

    * Identification → Name: **Update movie**

    * Copy the following code and paste it into the PL/SQL code box in the Source property group:

		```
	    <copy>
	    update watchlist
		   set watched_yn = 'Y',
			   watched = SYSDATE
		 where movie_id = :P3_ID
		   and user_id = :USER_ID;
	    ```

    * Server-side Condition → When Button Pressed: **MARK\_WATCHED**

9. Finally, you will add a branch that runs after the processing action to redirect the user to the previous page.

10. In the processing pane on the left, right click on After Processing and select **Create Branch**.

    * Identification → Name: **Redirect to previous page**

    * Click on **Target** to open the Link Builder

        - Page: **&P3\_PREVIOUS\_PAGE\_ID.**

        - The item P3\_PREVIOUS\_PAGE\_ID contains the page number of the page you were on before the Movie Details page. This is to return to whichever page the user was previously on when any of the buttons on the Details page get clicked. However, you still need to set up the Previous Page ID item, so you will do that now.

        - Click **Ok**.

11. Click the **Rendering** tab at the top of the left pane. 

    ![Redirect to previous page branch Link Builder Target dialog open on Page 3 in Page Designer](images/redirect-branch.png " ")

12. Right click on the **Movie Details** region and select **Create Page Item**.

    * Name: **P3\_PREVIOUS\_PAGE\_ID**

    * Type: **Hidden**

13. Click **Save**.

## Task 3: Add Server-Side Conditions to Buttons
At this point, all of the buttons on the Movie Details page display at all times, regardless of whether or not you've already added a movie to your list or marked something as watched. You should really only show the Remove or Watched buttons if a movie exists in the watchlist table, meaning the user has added it. Similarly, you should only display the Added button if a user has not yet added a movie to the the watchlist table.

To accomplish this, you are going to use Server-Side Conditions, like you did for the Popular Movies and Searched Movies regions on page 2. You will also add a condition for the Back button, so that it only displays if the previous page is the Movie Search page.

1. Click on the **ADD\_TO\_WATCHLIST** button.

2. In the **Server-side Condition** property group, set the following properties:

    * Type: **No Rows returned**

    * SQL Query:

	    ```
	    <copy>
	    select null
	      from watchlist
	     where movie_id = :P3_ID
	       and user_id = :USER_ID
	    ```

        ![Close-up of the ADD_TO_WATCHLIST button Server-side condition properties](images/add-ssc.png " ")

3. Click on the **REMOVE\_FROM\_WATCHLIST** button.

4. Set the following Server-side Condition properties:

    * Type: **Rows returned**

    * SQL Query:

	    ```
	    <copy>
	    select null
	      from watchlist
	     where movie_id = :P3_ID
	       and user_id = :USER_ID
	    ```

        ![Close-up of the REMOVE_FROM_WATCHLIST button Server-side condition properties](images/remove-ssc.png " ")

5. Click on the **MARK\_WATCHED** button.

6. Set the following Server-side Condition properties:

    * Type: **Rows returned**

    * SQL Query:

	    ```
	    <copy>
	    select null
	      from watchlist
	     where movie_id =:P3_ID
	       and user_id = :USER_ID
	       and watched_yn = 'N'
	    ```

        ![Close-up of the MARK_WATCHED button Server-side condition properties](images/watched-ssc.png " ")

7. Click on the **BACK** button.

8. Set the following Server-side Condition properties.

    * Type: **Item = Value**

    * Item: **P3\_PREVIOUS\_PAGE\_ID**

    * Value: **2**

    ![Close-up of the BACK button Server-side condition properties](images/back-ssc.png " ")
    
9. Click **Save**.

10. Before you test the buttons, you will add badges to the Movie Search page and update the Cards region actions to give P3\_PREVIOUS\_PAGE_ID a value.

## Task 4: Add Badges to Movie Search Cards
Before you test the buttons you just implemented, you will add badges to the Movie Search page so that you have a visual cue of what has been added and marked as watched. You can extend the Popular and Search Movies data that gets returned from the REST data source by checking the watchlist table to find movies with a matching ID to the displayed movies on the search page. You also need to update the Full Card action for both the Popular Movies and Searched Movies regions to give the P3\_PREVIOUS\_PAGE\_ID page item a value so that the Movie Details redirect branch you created in Task 2 will go back to the correct page.

1. Navigate to page 2 in your Movies Watchlist application and click on the **Popular Movies** region.

    * Scroll down to the **Local Post Processing** property group and set Type: **SQL Query**

    * Replace the existing SQL Query with the query below:

        ```
        <copy>
        select ads.id,
               ads.adult,
               ads.title,
               ads.video,
               ads.overview,
               ads.popularity,
               ads.vote_count,
               ads.poster_path,
               ads.release_date,
               ads.vote_average,
               ads.backdrop_path,
               ads.original_title,
               ads.original_language,
               case when w.watched_yn = 'Y' then 'Watched'
                    when w.watched_yn = 'N' then 'Added'
                    end as badge_label,
               case when w.watched_yn = 'N' then 'u-success'
                    end as badge_color
          from #APEX$SOURCE_DATA# ads
        LEFT OUTER JOIN
            -- doing inline select to limit rows to current user
            (select * from watchlist where user_id = :USER_ID) w
            ON w.movie_id = ads.ID
        ```

        - The above code extends the Popular Movies data that gets returned from the REST data source by joining the REST data source with the watchlist table to add two columns: BADGE\_LABEL and BADGE\_COLOR. For the BADGE\_LABEL column, each movie in the Popular Movies list has the value 'Watched' (movies in the WATCHLIST table that are marked as Watched), 'Added' (movies in the WATCHLIST table that are not marked as Watched), or NULL (movies that are not in the WATCHLIST table). Similarly, the BADGE\_COLOR list contains values 'u-success' or NULL, based on whether or not a movie is in the WATCHLIST table and not marked as Watched.

        ![Page 2 open in Page Designer with the Local Post Processing properties open in Property Editor](images/popular-lpp.png " ")

    * Click on the **Attributes** tab.

    * Icon and Badge → Badge Column: **BADGE\_LABEL**

    * Icon and Badge → Badge CSS Classes: **&BADGE\_COLOR.**

    ![Page 2 open in Page Designer with the Icon and Badge attributes open in Property Editor](images/popular-badge.png " ")

2. To pass in the value for P3\_PREVIOUS\_PAGE\_ID, click on the **Full Card** action under the Popular Movies region.

    * In the Link properties group, click on **Target**. 

    * Under Set Items, add an item: 

        - Name: **P3\_PREVIOUS\_PAGE\_ID**

        - Value: **2**

        - Click **Ok**.

    ![Full Card action Link Builder Target open on Page 2 in Page Designer](images/popular-card-action.png " ")

3. Now that you have set up badges on the Popular Movies region, return to the beginning of step 1 of this task and follow the same steps for Searched Movies.

4. Save your changes and refresh the tab where your app is running. Now you can play around with the Movie Search and Movie Details page and test out adding, removing, and marking items as watched.

    * From the Movie Search page, select a movie and you will see the Back and Add to Watchlist buttons.

    ![Movie Details page with the Back and Add to Watchlist buttons at the top](images/add-runtime.png " ")

    * Click the Add to Watchlist button and you will be redirected back to the Movie Search page where you will see the Added label on the movie you added.

    ![Movie Search page in the runtime application with the Added label on the second popular movie Card](images/added.png " ")

    * Click on the movie you just added to your watchlist, and you will see the Back, Remove From Watchlist, and I've Watched This buttons.

    ![Movie Details page with the Back, Remove from Watchlist, and I've Watched This buttons at the top](images/remove-watched-runtime.png " ")

    * Click the I've Watched This button and you will be redirected back to the Movie Search page where you will see the Watched label on the movie you just marked as watched.

    ![Movie Search page in the runtime application with the Watched label on the second popular movie Card](images/watched.png " ")
    
You now know how to use SQL commands in Page Designer regions and processes to get, store, update, and delete data from your tables. You may now **proceed to the next lab**.

## Learn More

- [Buttons Documentation](https://docs.oracle.com/en/database/oracle/apex/23.2/htmdb/creating-buttons.html) 

- [Understanding Page Processes](https://docs.oracle.com/en/database/oracle/apex/23.2/htmdb/understanding-page-processes.html)  

- [Controlling Navigation Using Branches](https://docs.oracle.com/en/database/oracle/apex/23.2/htmdb/controlling-navigation-using-branches.html)  

## Stuck? Download the Application Here
Stuck on a step or struggling with the lab? You can download a copy of the Movies Watchlist application through Lab 6 and follow the instructions below to import it into your Oracle APEX workspace.

- [Click here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/lab-6-241.sql) to download a copy of the app at the end of Lab 6.

- You can import the app to your APEX workspace by clicking **Import** in the App Builder home page and following the wizard steps.

- You will be prompted for the Credentials for Movies web credential that was set up in lab 2. You can see in the screenshot below that Credentials for Movies does not already exist in the workspace.  
*Note: If you completed Lab 2, Credentials for Movies will already exist in your workspace and this will be pre-filled*

    ![APEX Install Application page with Web Credentials table without any Client ID and Client Secret for Credentials for Movies](images/blank-credentials.png " ")  

- If Credentials for Movies does not already within your workspace, set the following for the Credentials for Movies row:

    - In the Client ID or Username column, enter **api\_key**.

    - In the Client Secret or Password column, paste your unique API key that you got from The Movie Database.

    - In the Verify Client Secret/Password column, past your API key again.

        ![APEX Install Application page with Web Credentials table containing Client ID and Client Secret for Credentials for Movies](images/complete-credentials.png " ")

- Click **Next**.

- Make sure Install Supporting Objects is **on** and click **Next** again.

- Click **Install** to install the supporting objects and finish importing the application.

## Acknowledgements

- **Author** - Paige Hanssen
- **Last Updated By/Date** - Paige Hanssen, June 2024