# Introduction
## About this Workshop
In this workshop, you will create an application that allows you and your friends to search for movies and create personal watchlists. You will use [The Movie Database (TMDB)](https://www.themoviedb.org/), which is a database that contains a large amount of data about a vast number of movies and TV shows. TMDB has an extensive API that you will access in this workshop to get lists of popular movies, search for movies, and get details and cast lists for movies.

When individual users log into the app, the home page will display their own unique watchlist. They can add movies to their watchlist from either a list of current popular movies or by searching for a specific movie of their choice. After adding movies to their list, users can use filters to browse through their list based on release decade, runtime, and rating. When a user watches a movie on their list, they can mark that movie as "Watched" so that they can filter their movies by those they have watched and those they still want to watch.

While the end result is a simple version of a movies watchlist application, you can continue to build it out far past what this workshop takes you through, using many of the same concepts you will learn. The Movie Database API has a lot of options that you can add to your application, such as streaming providers for individual movies, videos related to movies, upcoming movies, and more. There are also a lot of features in Oracle APEX that you can use to allow users to rate movies they have watched, make comments on movies, and more.

Estimated Workshop Time: 2 hours

*Note: This lab assumes you are using Oracle APEX 21.2.*

### Objectives
In this lab, you will:  
- Obtain a free development environment.  
- Learn how to create REST data sources.  
- Learn how to create local tables.  
- Learn how to use application items and processes.  
- Learn how to create a page to view data from a REST source.  
- Learn how to create a page to view data from a local table.  
- Learn how to search for movies.  
- Learn how to manage a list of movies.

### Labs

| # | Module | Est. Time |
| --- | --- | --- |
| - | [Getting Started](?lab=signing-up) | 5 min |
| 1 | [Create the Application](?lab=create-app) | 5 min |
| 2 | [Create REST Data Sources](?lab=creating-rest-sources) | 15 min |
| 3 | [Create the Movie Search Page](?lab=creating-movie-search-page) | 20 min |
| 4 | [Create the Movie Details Page](?lab=creating-movie-details-page) | 10 min |
| 5 | [Create Local Tables](?lab=creating-tables) | 10 min |
| 6 | [Implement Buttons and Badges](?lab=creating-buttons-badges) | 15 min |
| 7 | [Implement the Watchlist Page](?lab=implementing-watchlist-page) | 20 min |
| 8 | [Improve the Movie Details Page](?lab=improving-details-page) | 10 min |
| 9 | [Add Cast List (Optional)](?lab=adding-cast-list) | 10 min |
| 10 | [Improve the Watchlist Page (Optional)](?lab=improving-watchlist-page) | 5 min |

### **Let's Get Started!**

- [Click here](?lab=signing-up) or select **Getting Started** from the menu on the left to start the workshop and set up an Oracle APEX workspace.
- If the menu is not displayed, you can open by clicking the menu button (![Menu icon](./images/menu-button.png)) at the top of the page.

### Downloads

- [Click here](./files/movies-watchlist.sql) to download the completed application.

## Learn More - *Useful Links*

- [The Movie Database](https://www.themoviedb.org/)
- [The Movie Database API](https://developers.themoviedb.org/3/)
- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX Service](https://apex.oracle.com/en/platform/apex-service/)
- [APEX Collateral](https://apex.oracle.com)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](http://apex.world)

## Acknowledgments

- **Author** - Paige Hanssen
- **Additional Contributors** - Kay Jasanya, Shakeeb Rahman, Steve Muench, Monica Godoy, Eli Feuerstein, Carlos Maciel, Dalia Vazquez
- **Last Updated By/Date** - Paige Hanssen, March 2022