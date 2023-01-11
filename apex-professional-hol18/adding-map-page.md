# Add additional pages to your Application

## Introduction

In this Lab, You will first create a Map Page with Store Details, and then you will create an entry for the Store Details Map in the navigation Menu Entry.

Estimated Time: 20 minutes

### Downloads

- Did you miss out on trying the previous labs? Don’t worry! You can download the application from **[here](files/online-shopping-cart-10.sql)** and import it into your workspace. To run the app, please run the steps described in **[Get Started with Oracle APEX](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.

## Task 1: Creating a Store Details Map page and adding it to Desktop Navigation Bar.

1. Navigate to **App Builder** and in the **Home Page**, click **Online Shopping Application**.

  ![Navigate to App Builder](images/create-map1.png " ")

  ![Select Online shopping application](images/create-map2.png " ")

2. In the application home page, click **Create Page**.

  ![Click Create page](images/create-map3.png " ")

3. Select **Map** page type.

  ![Select Map](images/create-map4.png " ")

4. In the **Create Map** enter the following and click **Next**.

    Under **Page Definition**:
    - For **Page Number**, Enter **20**.
    - For **Name**, Enter **Store Locations Map**.

    Under **Data Source**:
    - For **Table/View Name**, select **STORES**.

    Under **Navigation**:
    - For **Breadcrumb**, Set it to **No**.

    ![Create Map](images/create-map5.png " ")

5. For **Create Map**, enter the following and click **Create Page**. For **Map Style**, Select **Points**.  
  Under **Map Attributes**:
    - For **Geometry column Type**, Select **Two Numeric Columns**.
    - For **Longitude Column**, Select **LONGITUDE**.
    - For **Latitude Column**, Select **LATITUDE**.
    - For **Tooltip Column**, Select **STORE_NAME**.

  Click **Create Page**.

  ![Click Create Page](images/create-map6.png " ")

6. The Store Locations Map should be visible to the Public. To set the page as Public, select **Page \<n\>: Store Locations Map** in the Rendering tree. In the Property Editor, navigate to **Security**, and for **Authentication**, select **Page is Public**.
    ![Edit Authentication as Public](images/make-page-public.png)

7. Then, click **Save** and **Run Page**.

  ![Click Save and Run](images/create-map7.png " ")

8. The **Store Details Map** Page is now displayed. Now, in the developer toolbar, select **App < n >**.

  ![Click on Application ID](images/run-map1.png " ")

9. Navigate to **Shared Components**

  ![Navigate to Shared components](images/customise-map1.png " ")

10. In the **Shared Components** page, Under **Navigation**, select **Navigation Bar List**.

  ![Navigate to navigation bar list](images/customise-map2.png " ")

11. Select **Navigation Bar**, Under **Lists**.

  ![Select Navigation Bar](images/customise-map3.png " ")

12. Click **Create Entry**.

  ![Click Create entry](images/customise-map4.png " ")

13. For **List Entry**, enter the following and click **Create List Entry**.  

 Under **Entry**:
    - For **List Entry Label**, enter **Store Locations Map**.

  Under **Target**:
    - For **Page**, Select **20**

  ![Click Create List Entry](images/customise-map5.png " ")  

14. Then, click **Save** and **Run Page**.

  ![Click Run](images/customise-map6.png " ")

15. You can now see that **Store Locations Map** is now displayed in **Navigation Bar**.

  ![Map navigation displayed](images/run-map2.png " ")  

## Summary
You now know how to manage Map pages. You may now **proceed to the next lab**.

## Acknowledgments
- **Author** - Roopesh Thokala, Product Manager
- **Contributor** - Ankita Beri, Product Manager
- **Last Updated By/Date** - Roopesh Thokala, Product Manager, May 2022
