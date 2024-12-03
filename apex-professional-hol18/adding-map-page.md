# Add additional pages to your Application

## Introduction

In this Lab, You create a Map Page with Store Details and custom Background, and then you make an entry for the Store Details Map in the navigation Menu Entry.

Estimated Time: 5 minutes

### Downloads

- Did you miss out on trying the previous labs? Don't worry! You can download the Application from **[here](files/online-shopping-cart-12.sql)** and import it into your workspace. To run the app, please run the steps described in **[Get Started with Oracle APEX](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://livelabs.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.

## Task 1: Create a Store Details Map page with a Background and add it to the Desktop Navigation Bar

1. Navigate to **App Builder**, click **Online Shopping Application**.

    ![Navigate to App Builder](images/create-map1.png " ")

    ![Select Online shopping application](images/create-map2.png " ")

2. On the application home page, click **Create Page**.

    ![Click Create page](images/create-map3.png " ")

3. Select **Map**.

    ![Select Map](images/create-map4.png " ")

4. In the **Create Map**, enter/select the following:

    - Under Page Definition:

        - Page Number: **20**

        - Name: **Store Locations Map**.

    - Data Source > Table/View Name: **STORES**.

    - Navigation > Breadcrumb: **Toggle Off**

    Click **Next**.

    ![Create Map](images/create-map5.png " ")

5. For **Create Map**, enter/select the following:

    - Map Style: **Points**

    - Under Map Attributes:

        - Geometry column Type: **Two Numeric Columns**

        - Longitude Column: **LONGITUDE**

        - Latitude Column: **LATITUDE**

        - Tooltip Column: **STORE_NAME**

    Click **Create Page**.

    ![Click Create Page](images/create-map6.png " ")

6. The Store Locations Map should be visible to the Public. Select **Page 20: Store Locations Map** in the Rendering tree to set the page as Public. In the Property Editor, navigate to **Security**, and for **Authentication**, select **Page is Public**.

    ![Edit Authentication as Public](images/make-page-public.png)

7. Then, click **Save** and **Run Page**.

    ![Click Save and Run](images/save-runn.png " ")

8. The **Store Details Map** Page is now displayed. Now, select **App < n >**in the developer toolbar.

   ![Click on Application ID](images/run-map1.png " ")

9. Navigate to **Shared Components**

   ![Navigate to Shared components](images/customise-map1.png " ")

10. In the **Shared Components** page, Under **Other Components**, select **Map Backgrounds**.

    ![Navigate to navigation bar list](images/map-back.png " ")

11. Select **Create**.

    ![Navigate to navigation bar list](images/map-back-create.png " ")

12. Under Create Map Background, enter/select the following:

      - Name: **WMS**

      - Type: **OGC WMS**

      - WMS URL : https://basemap.nationalmap.gov/arcgis/services/USGSTopo/MapServer/WMSServer?service=WMS&version=1.1.1&layers=0&styles=default

      Click **Create Map Background**

     ![Navigate to navigation bar list](images/map-back-create1.png " ")

13. Select **Edit Page 20** in the top right corner.

    ![Navigate to navigation bar list](images/map-back-create2.png " ")

14. Select **Store Locations Map** region, and under **Attributes**, enter/select the following:

     - Background: **Shared Component**

     - Standard: **WMS**

    Click **Save and Run**.

    ![Navigate to navigation bar list](images/map-back-create3.png " ")

15. In the Developer Toolbar, navigate to **Application Id**.

    ![Navigate to navigation bar list](images/wms-map.png " ")

16. Navigate to **Shared Components**.

    ![Navigate to navigation bar list](images/map-sc.png " ")

17. Under **Navigation and Search**, select **Navigation Bar List**.

    ![Navigate to navigation bar list](images/map-nav.png " ")

18. Select **Navigation Bar**.

    ![Select Navigation Bar](images/customise-map3.png " ")

19. Click **Create Entry**.

    ![Click Create entry](images/customise-map4.png " ")

20. For **List Entry**, enter/select the following:

    - Entry > List Entry Label: **Store Locations Map**.

    - Under Target > Page: **20**

    Click **Create List Entry**.

    ![Click Create List Entry](images/customise-map5.png " ")

21. Click **Save** and **Run**.

    ![Click Run](images/customise-map6.png " ")

22. You can now see that **Store Locations Map** is now displayed in **Navigation Bar**.

  ![Map navigation displayed](images/run-map2.png " ")

## Summary

You now know how to manage Map pages. You may now **proceed to the next lab**.

## What's Next

In the upcoming hands-on lab, you will learn to Implement the 'Share' button, Enable Push Notifications, and Add Shortcuts to the PWA app. Also, you will learn to Include screenshots to be displayed while installing the PWA app and Enable Push Notifications. Additionally you learn how to configure Push Notifications.

## Acknowledgements

- **Author** - Roopesh Thokala, Senior Product Manager; Ankita Beri, Product Manager
- **Last Updated By/Date** - Ankita Beri, Product Manager, November 2024
