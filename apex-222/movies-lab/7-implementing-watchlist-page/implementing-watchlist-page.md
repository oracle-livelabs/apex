# Implement the Watchlist Page

## Introduction
Now that you have implemented functionality to find movies and add them to a table, you will set up the My Watchlist page to display each movie in that table, filter it, and modify it, which is the final piece of base functionality you will need to complete this app.

Estimated Lab Time: 25 minutes

Watch the video below for a quick walk-through of the lab.
[Implement the Watchlist Page](videohub:1_2xjo60jy)

### Objectives
In this lab, you will:  
- Create cards to display watchlist movies.  
- Connect the Movie Details page to open details directly from the Watchlist.  
- Add facets to filter through movies.  

### Prerequisites
- Completion of workshop through Lab 6

## Task 1: Create the Watchlist Cards
So far, you have only added a button in the Breadcrumb Bar region of page 1. You will start to build out the page by first adding a Cards region so that users can view their personal list of movies. It will be similar to the Cards regions on the Movie Search page, but these cards will be formatted a little differently and the source will not be a REST data source.

1. Navigate to **page 1** of your Movies Watchlist application.

2. Right click on the Body position in the rendering tree and select **Create Region**.

3. Set the following properties for the new region:

    * Title: **Watchlist**

    * Type: **Cards**

    * Source → Type: **SQL Query**

    * Copy the code below and paste it into the SQL Query code box:

        ```
        <copy>
        select id,
               movie_id,
               user_id,
               watched_yn,
               watched,
               case when watched_yn = 'Y' then 'Watched' end as WATCHED_LABEL,
               case when watched_yn = 'Y'
                    then 'Marked as watched ' || apex_util.get_since(watched)
                    else 'Added to watchlist ' || apex_util.get_since(created)
                    end as movie_status,
               title,
               poster_url,
               release_date,
               to_char(release_date, 'YYYY') as release_year,
               floor( to_char(release_date, 'YYYY') / 10) * 10 as decade,
               runtime,
               vote_average,
               created,
               to_char(created, 'MM/YYYY') as created_on,
               created_by,
               updated,
               updated_by
          from watchlist
         where user_id = :USER_ID
        ```

    ![Page 1 open in Page Designer with the Watchlist region open in Property Editor](images/watchlist.png " ")

4. Go to the Attributes tab of your new Watchlist region to customize your Watchlist cards.

    * Appearance → Layout: **Horizontal (Row)**

    * Card → Primary Key Column 1: **ID**

    * Title → Column: **TITLE**

    ![Page 1 open in Page Designer with the Watchlist region attributes open in Property Editor](images/watchlist-attributes-1.png " ")

    * Body → Advanced Formatting: **on**

    * Body → HTML Expression:

        ```
        <copy>
        Release Year: &RELEASE_YEAR.
        &lt;br>
        Rating: &VOTE_AVERAGE.
        ```

    * Secondary Body → Column: **MOVIE\_STATUS**

    * Icon and Badge → Badge Column: **WATCHED\_LABEL**

    * Media → Source: **URL Column**

    * Media → URL: **POSTER\_URL**

    ![Page 1 open in Page Designer with the Watchlist region attributes open in Property Editor](images/watchlist-attributes-2.png " ")

## Task 2: Connect the Watchlist to the Movie Details Page
In this step, you are going to connect the My Watchlist page to the Movie Details page to allow a user to view details for any movie on the list, as well as remove a movie from their list or mark a movie as "Watched."

1. In the rendering pane, right click on the Actions section underneath the Watchlist region and select **Create Action**.

2. Set the following properties:

    * Identification → Type: **Full Card**

    * Click on the Link → Target field to open the link builder.

        - Page: **3**

        - Set Items:

            + Name: **P3\_ID** | Value: **&MOVIE\_ID.**

            + Name: **P3\_PREVIOUS\_PAGE\_ID** | Value: **1**

        - Click **Ok**.

        ![Link Builder Target dialog for Watchlist Full Card action open over Page 1 in Page Designer](images/watchlist-action.png " ")
    
3. Save and run the page.

    ![Watchlist Cards region on the My Watchlist page in the runtime application](images/watchlist-runtime.png " ")

4. On the tab where the app is running, click on a movie in your watchlist. The Movie Details dialog will pop up with information about that specific movie. Note that you are able to remove a movie or mark it as watched, but you cannot add the movie because it is already in your list. Additionally, there is no back button because you are going to the Movie Details page from the Watchlist page (page 1) instead of the Movie Search page (page 2).  
*Note: If you have not added any movies to your watch list, the page will say "No data found." Make sure to add movies to your watch list so that you can view them on the Watchlist page!*

## Task 3: Add the Faceted Search
The next step is allowing a user to filter through movies in their watchlist to make it easier to explore and find movies they could watch based on specific criteria. You'll do this by using a Faceted Search to create facets for columns we can filter the movie list with.

1. In the Page Designer tab in your browser, right click on the Body region and select **Create Region**.

2. Set the following properties:

    * Identification → Title: **Filter**

    * Identification → Type: **Faceted Search**

    * Source → Filtered Region: **Watchlist**

    * Appearance → Template: **Blank with Attributes**

    ![Page 1 open in Page Designer with the new Filter region open in Property Editor](images/faceted-search.png " ")

3. If you look at the layout pane in the middle of Page Designer, the faceted search Filter region is underneath the Watchlist region and that is how it will appear in the runtime app. That is not a very convenient place and it would be better if the faceted search was sitting on the left side of the Watchlist region so users have easy access. You can change the page template to open up new positions on the page that the Filter region can go in, one of which is the Left Column.

4. At the top of the the Rendering Pane, click on **Page 1: My Watchlist**.

5. In the **Appearance** property group, set Page Template to **Left Side Column**. 

    ![Page 1 open in Page Designer with Page open in Property Editor](images/page-template.png " ")

6. Click on the Filter region and set:

    * Layout → Position: **Left Column**

    ![Page 1 open in Page Designer with the Filter region open in Property Editor](images/filter-position.png " ")

7. Notice that the facet **P1_SEARCH** was automatically created with the Faceted Search region.

    * Click on P1_SEARCH and set Source → Database Column(s) to **TITLE**

    ![Page 1 open in Page Designer with the P1_SEARCH facet open in Property Editor](images/search-facet.png " ")

8. Right click on the Facets section under the Filter region and select **Create Facet**.

    * Identification → Name: **P1\_WATCHED\_YN**

    * Label: **Watched**

    * List of Values → Type: **Static Values**

    * Click on the box next to List of Values → Static Values to manually set up the display values that you will use for this facet. 

        - Under Values:

            + Display Value: **Yes**, Return Value: **Y**

            + Display Value: **No**, Return Value: **N**

        - Sort → Sort at Runtime: **off** 

        - Click **Ok**.

    ![P1_WATCHED_YN Static Values dialog open over Page 1 in Page Designer](images/watched-facet.png " ")

    * Actions Menu → Filter: **off**
    
    * Actions Menu → Chart: **off**

    * Oracle APEX auto-fills the Source based on the facet name.

9. You are going to add two more facets to allow a user to filter by release decade and runtime using the DECADE and RUNTIME columns. The DECADE column was created within the Watchlist Source SQL select statement as a simpler date column to filter movies by instead of RELEASE\_DATE.

10. Create a new facet within the Filter region and set the following properties:

    * Identification → Name: **P1\_DECADE**

    * List of Values → Type: **Distinct Values**

    * List Entries → Sort By Top Counts: **off**

    * Actions Menu → Filter: **off**
    
    * Actions Menu → Chart: **off**

    * Source → Data Type: **Number**  
	   *Note: Again, Source auto-filled based on the Name of the facet. However, the data type did not change, so you have to manually change it to match the type of data in the DECADE column.*

    ![Page 1 open in Page Designer with the P1_DECADE facet region open in Property Editor](images/decade-facet.png " ")

11. Create another new facet within the Filter region and set the following properties:

    * Identification → Name: **P1\_RUNTIME**

    * Identification → Type: **Range**

    * Settings → Select Multiple: **on**

    * List of Values → Type: **Static Values**

    * Click on the box next to Static Values to manually set up the display values that you will use for this facet.

        - Under Values:

            + Display Value: **Over 2 hours**, Return Value: **120|**

            + Display Value: **90 minutes to 2 hours**, Return Value: **90|120**

            + Display Value: **Less than 90 minutes**, Return Value: **|90**  
            *Note: The | syntax is used to define a range of return values. To learn more, see the Resources section at the end of this lab.*

        - Sort → Sort at Runtime: **off** 

        - Click **Ok**.

    ![P1_RUNTIME Static Values dialog open over Page 1 in Page Designer](images/runtime-facet.png " ")

    * Actions Menu → Filter: **off**

    * Actions Menu → Chart: **off**
    
    * Source → Data Type: **Number**

12. Click **Save**.

## Task 4: Add a Sort By Item
In addition to the Faceted Search, it would be helpful for there to be a "Sort By" feature that allows users to reorder their list of movies a few different ways.

1. Right click on the Watchlist region in the rendering pane and select **Create Page Item**.

2. Set the following properties:

    * Name: **P1\_SORT\_BY**

    * Type: **Select List**

    ![Page 1 open in Page Designer with the P1_SORT_BY item open in Property Editor](images/sort-by.png " ")

    * List of Values → Type: **Static Values**

    * Within the List of Values → Static Values dialog:

        + Display Value: **Title**, Return Value: **TITLE**

        + Display Value: **Rating**, Return Value: **RATING**

        + Display Value: **Date Added**, Return Value: **RECENT**

        + Sort → Sort at Runtime: **off**

        + Click **Ok**.

    * List of Values → Display Null Value: **off**

    * Advanced → Warn on Unsaved Changes: **Ignore**

    ![P1_SORT_BY Static Values dialog open on Page 1 in Page Designer](images/sort-values.png " ")

3. At this point, the sort item has been created but is not connected to anything else on the page.

4. You want the value of the Sort By page item to define what the Watchlist Cards region `order by` is, so you will use the Cards Order By properties to link the P1\_SORT\_BY item and use its value to order by the associated column.

5. Click on the **Watchlist** region.

    * Source → Order By Item:

        - Item → Name: **P1\_SORT\_BY**

        - The Key and Display values auto-fill with the values set in the P1\_SORT\_BY item, but you will need to add the Order By clause for each.

        - Title Clause: **"TITLE" asc**

        - Rating Clause: **"VOTE_AVERAGE" desc**

        - Recent Clause: **"CREATED" desc**

        - Click **Ok**.

    ![Watchlist region Order By Item dialog open on Page 1 in Page Designer](images/watchlist-order-by.png " ")

6. Save and run the page to test out your app.

    ![My Watchlist page in the runtime application showing the Cards region, Faceted Search, and Sort By](images/watchlist-page-runtime.png " ")

You now know how to filter data using a Faceted Search and sort data with a select list. You may now **proceed to the next lab**.

## Resources

- [Intro to Faceted Search](https://www.youtube.com/watch?v=xsA9SCFHDDI)  

- **Range Facet Syntax:** When implementing the static list of values for the Range facet in the Faceted Search region in this lab, you use the | symbol to help define the return value for each item in the static list. The | character represents a range of values that the movies in the Watchlist will be filtered on.

    For example, when setting up the P1_RUNTIME facet, the first value in the list is "Over 3 hours" and has a return value of 180|. Because you are defining a facet that represents a range, the return value 180| means that you are searching for all movies that have a runtime in the range of 180 or higher.
    
    The second value in the P1_RUNTIME list is "2 to 3 hours," which has the return value 120|180. Here, the | symbol represents all the values between 120 and 180, meaning that when this option is selected, you will get all movies with a runtime of anything between 120 and 180.

## Stuck? Download the Application Here
Stuck on a step or struggling with the lab? You can download a copy of the Movies Watchlist application through Lab 7 and follow the instructions below to import it into your Oracle APEX workspace.

- [Click here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/oci-library/build-movies-watchlist-app-using-apex/lab-7.sql) to download a copy of the app at the end of Lab 7.

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
- **Last Updated By/Date** - Paige Hanssen, August 2022