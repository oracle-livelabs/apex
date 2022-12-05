# Improving Smart Filters

## Introduction
In this lab, you will gain an insight into the abilities of Smart Filters, and learn how to add **New Filters** and Edit existing Filters


### Downloads

- Did you miss out trying the previous labs? Don’t worry! You can download the application from **[here](files/demo-projects3.sql)** and import it into your workspace. To run the app, please run the steps described in **[Get Started with Oracle APEX](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3509)** and **[Using SQL Workshop](https://apexapps.oracle.com/pls/apex/r/dbpm/livelabs/run-workshop?p210_wid=3524)** workshops.

## Task 1: Enhancing Smart Filters

In this Lab, you are going to customize the **Smart Filters** page in **Demo Projects** application.
The **Project Tasks Search** page utilizes Smart Filters to display the records.

1. Navigate to the **App Builder**. Then Click on **Demo Projects** application.

    ![Navigate to Demo Projects Application](./images/select-projects-app.png " ")

2. Now, you run the application using **Run Application** icon.

    ![Run Application](images/run-application.png " ")

3. Navigate to **Project Tasks Search** page and click **Page 8** in the **Developer toolbar**.
  **Note** that your page number might be different.

    ![Navigate to Project Tasks Search](images/navigate-to-page8.png " ")

4. Now, Update **P8_PROJECT**, Change type to **Radio Group** and enable the **Client-Side Filtering** attribute.  
In the Rendering tab, select the P8_PROJECT filter (if not already selected).
In the Property Editor, under **Identification** change type to **Radio Group**, then find **List Entries** and enable **Client-Side Filtering**. Enabling this option renders a search field above the list entries.

    ![Edit Filter](images/edit-filter1.png " ")

5. Click **Save and Run Page** in the upper right corner. If prompted, enter your workspace username and password and click Sign In.
The revised page appears.

    ![Show edit Filter](images/show-edit-filter1.png " ")


## Task 2: Adding New Smart Filter

Add new filters in Page Designer by right-clicking filter and selecting Create Filter from the context menu.

Filters map to specific database column. When creating a new filter, you can create the following types: Checkbox Group, Input Field, Radio Group, and Range.

1. View the smart filters page in Page Designer. In the Rendering tab, right-click Filters and select **Create Filter**.

    ![Create Filter](images/create-filter.png " ")

2. Select the new filter and edit the following filter attributes in the Property Editor:
    - Under **Identification**:
      - For Name, Enter **P8\_TASK_NAME**.
      - For Type,  Select **Checkbox Group**.

    - Under **List of Values**:
      - For Type, Select **Distinct Values**.

  ![Create Filter2](images/create-filter1.png " ")

3. Click **Save and Run Page** in the upper right corner. If prompted, enter your workspace username and password and click Sign In.
The revised page appears.



## **Summary**

You now know how to create smart filters and customize them.

## **Acknowledgements**

- **Author** - Roopesh Thokala, Product Manager
- **Last Updated By/Date** - Roopesh Thokala, Product Manager, November 2022
