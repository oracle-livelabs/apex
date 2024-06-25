# Introduction
## About this Workshop
In this workshop, you will create an application that allows you and your friends to search for movies and create personal watchlists. You will use [The Movie Database (TMDB)](https://www.themoviedb.org/), which is a database that contains a large amount of data about a vast number of movies and TV shows. TMDB has an extensive API that you will access in this workshop to get lists of popular movies, search for movies, and get details and cast lists for movies.

When individual users log into the app, the home page will display their own unique watchlist. They can add movies to their watchlist from either a list of current popular movies or by searching for a specific movie of their choice. After adding movies to their list, users can use filters to browse through their list based on watched status, release decade, and runtime. 

While the end result is a simple version of a movies watchlist application, you can continue to build it out far past what this workshop takes you through, using many of the same concepts you will learn. The Movie Database API has a lot of options that you can use in your application, such as streaming providers for individual movies, videos related to movies, upcoming movies, and more. There are also a lot of features in Oracle APEX that you can use to allow users to rate movies they have watched, make comments on movies, and more.

Estimated Workshop Time: 2 hours

Watch the video below for a quick walk-through of the workshop.
[Walkthrough video of the entire workshop](videohub:1_vdi0shy5)

*Note: This lab assumes you are using Oracle APEX 24.1.*

### Objectives
In this lab, you will:  
- Obtain a free development environment.  
- Learn how to create REST data sources.  
- Learn how to create local tables.  
- Learn how to use application items and processes.  
- Learn how to create a page to view data from a REST source.  
- Learn how to create a page to view data from a local table.  

### Labs

| #   | Module                                                           | Est. Time |
| --- | ---------------------------------------------------------------- | --------- |
| -   | [Getting Started](?lab=1-sign-up-apex)                           | 5 min     |
| 1   | [Create the Application](?lab=create-app)                        | 10 min    |
| 2   | [Create REST Data Sources](?lab=creating-rest-sources)           | 10 min    |
| 3   | [Create the Search Page](?lab=creating-movie-search-page)        | 20 min    |
| 4   | [Create the Details Page](?lab=creating-movie-details-page)      | 20 min    |
| 5   | [Create Local Tables](?lab=creating-tables)                      | 10 min    |
| 6   | [Implement Buttons and Badges](?lab=creating-buttons-badges)     | 25 min    |
| 7   | [Implement the Watchlist Page](?lab=implementing-watchlist-page) | 25 min    |
| -   | [Add Cast List (Optional)](?lab=adding-cast-list)                | 5 min     |
| -   | [Improve the UI (Optional)](?lab=improving-watchlist-page)       | 5 min     |

### **Let's Get Started!**

- [Click here](?lab=1-sign-up-apex) or select **Getting Started** from the menu on the left to start the workshop and set up an Oracle APEX workspace.
- If the menu is not displayed, you can open by clicking the menu button (![Menu icon](./images/menu-button.png)) at the top of the page.

### Downloads

- [Click here](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/movies-watchlist-241.sql) to download the completed application.

## Learn More

- [The Movie Database](https://www.themoviedb.org/)
- [The Movie Database API](https://developers.themoviedb.org/3/)
- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX Service](https://apex.oracle.com/en/platform/apex-service/)
- [APEX Collateral](https://apex.oracle.com)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](http://apex.world)

## Acknowledgements

- **Author** - Paige Hanssen
- **Last Updated By/Date** - Paige Hanssen, June 2024