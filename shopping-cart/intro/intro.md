# Introduction
## About this Workshop

[](youtube:6pKNt_FXP7g)

In this workshop, you'll create a Shopping Cart application that allows managing products, customers, and  stores. The application will have two application roles:

* Administrators
    * To manage the products, customers and stores
    * To access a dashboard to identify the top products
* Customers
    * To review, add, delete, or edit the number of products in the shopping cart
    * To submit orders

Estimated Workshop Time: 2 hours

<if type="odbw">If you would like to watch us do the workshop, click [here](https://youtu.be/ioduhe7gHvc).</if>

### Objectives
In this lab, you will:
* Obtain a free development environment
* Install a sample dataset
* Learn how to create lookup tables
* Learn how to create a page to list all the products
* Learn how to manage the products 

*{Note: This lab assumes you are using Oracle APEX 21.1.}*

### Labs

| # | Module | Est. Time |
| --- | --- | --- |
| 1 | [Install a Sample Dataset](?lab=1-installing-sample-tables) | 5 min |
| 2 | [Add Columns to the Products Table](?lab=2-adding-columns) | 10 min |
| 3 | [Create Database Objects](?lab=3-creating-db-objects) | 5 min |
| 4 | [Create the Application](?lab=4-create-app) | 15 min |
| 5 | [Create the Order Page](?lab=5-creating-orders-page) | 15 min |
| 6 | [Create the Shopping Cart Page](?lab=6-creating-shopping-cart) | 20 min |
| 7 | [Create the Add to Cart Page](?lab=7-creating-add-to-cart-page) | 20 min |
| 8 | [Improve the Products Page](?lab=8-improving-products) | 20 min |
| 9 | [Improve the Application](?lab=9-improving-app) | 10 min |<if type="odbw">
| 10 | [Terminate Oracle Autonomous Database Instance](?lab=terminate-adb) | 5 min |</if>

### **Let's Get Started!**

- If the menu is not displayed, you can open by clicking the menu button (![Menu icon](./images/menu-button.png)) at the top-left of the page.

### Downloads

- [Download the application](https://objectstorage.us-ashburn-1.oraclecloud.com/p/LNAcA6wNFvhkvHGPcWIbKlyGkicSOVCIgWLIu6t7W2BQfwq2NSLCsXpTL9wVzjuP/n/c4u04/b/livelabsfiles/o/developer-library/shopping-cart-app.sql). To run the app, please run the steps described in Lab 1, 2, and 3.
- [Download images for your application](https://objectstorage.us-ashburn-1.oraclecloud.com/p/LNAcA6wNFvhkvHGPcWIbKlyGkicSOVCIgWLIu6t7W2BQfwq2NSLCsXpTL9wVzjuP/n/c4u04/b/livelabsfiles/o/developer-library/products-images.zip). 

## Learn More - *Useful Links*

- Introduction to APEX
    - [App Builder Concepts](https://docs.oracle.com/en/database/oracle/application-express/21.1/htmdb/application-builder-concepts.html#GUID-6D22E307-6D48-49BC-9FDC-A7D8B037E46A)
    - [Page Designer](https://docs.oracle.com/en/database/oracle/application-express/21.1/htmdb/about-page-designer.html#GUID-F4A825A2-6BD5-4A11-8D68-B24B2B6ED18B)
    - [Shared Components](https://docs.oracle.com/en/database/oracle/application-express/21.1/htmdb/shared-components-page.html#GUID-2CDE44A1-E219-44BC-B983-B6780266F315)
    - [Cards](https://docs.oracle.com/en/database/oracle/application-express/21.1/htmdb/managing-cards.html#GUID-4B524AC4-9507-45EB-B4EA-A4D33F469B2D)
    - [APEX_COLLECTION API](https://docs.oracle.com/en/database/oracle/application-express/21.1/aeapi/APEX_COLLECTION.html#GUID-859B488C-2628-44D7-969F-50872C685B76)
- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX Service](https://apex.oracle.com/en/platform/apex-service/)
- [APEX Collateral](https://apex.oracle.com)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](http://apex.world)

## Acknowledgments

- **Author** - Mónica Godoy, Principal Product Manager
- **Last Updated By/Date** - Arabella Yao, Database Product Manager, October 2021