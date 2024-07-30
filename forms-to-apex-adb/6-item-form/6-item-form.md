# Create the Items Form

## Introduction

After following the guidelines in the previous labs on best practices to modernize Forms in APEX, let’s see how you can further enhance the applications created with APEX’s functionalities.

In this lab, you will build on the business logic analysis performed on the “Customers’ form” in Lab 1. After migrating and enhancing the business logic, it’s time to modernize the application within APEX.

Estimated Time: 15 Minutes

### Objectives

In this lab, you:

- Configure List of Values
- Define and organize facets for the Faceted Search page to filter data effectively.
- Define and personalize the Interactive Report views, allowing end-users to interact with and save their report configurations.
- Create and organize navigation menu entries for Customers and Orders, and assign appropriate parent list entries to make the menu cleaner and more user-friendly.
- Disable authentication to make the application publicly accessible, suitable for a public-facing application.

## Task 1: Create the Items Form

1. Click **Application ID** to go to the application home.

2. Click **Create Page**.

3. Select **Form**.

4. On Create page wizard, enter/select the following:

   - Page Number: **11**

   - Name: **Item - Details**

   - Page Mode: **Drawer**

   - Table/View Name: **S_ITEM**

5. Click **Create Page**.

## Task 2: Create Validations

The S_ITEM table requires six columns: ID, ORD_ID, ITEM_ID, PRODUCT_ID, PRICE, and QUANTITY. You must ensure that end-users enter or select a value for these items.

1. In the first pane, find the Items Region and expand the items.
While holding down the Ctrl key, click the items: P8_PRODUCT_ID, P8_PRICE, and P8_QUANTITY. Apply the following changes:

2. Under the Appearance section,
For Template, set to Required - Floating.
Under the Validation section,
For Value Required, set to On.

## Task 3: Create a Dynamic Action

1. Navigate to the product_id item, right-click on it, and select Create Dynamic Action.

Under the Identification section,
For Name, enter Get Product Price

Navigate to the Show action,  and enter/select the following:
Under the Identification section,

For Action, select Set Value

Under the Settings section,
For Set Type, select PL/SQL Function Body

For PL/SQL Function Body, enter:
return PKG_MODERNIZATION.F_GET_PRODUCT_PRICE(p_product_id => :P8_PRODUCT_ID);

For Items to submit, select P8_PRODUCT_ID

Under the Affected Elements section,
For Selection Type, select Item(s)

For Item(s), select P8_PRICE

Create a Process 
Navigate to the Processing pane and right-click on Processes.

Under the Identification section, 

For Name, enter Get Item Id

For Type, select Invoke API

Under the Server-side Condition section,
For Type, select Item is NULL
For Item,  select P8_ITEM_ID

Under the Settings section,
For Package, select PKG_MODERNIZATION

For Procedure or Function, select F_GET_ITEM_ID

In the first pane, navigate to Parameters, and click on Function Result,

Under the Value section,
For Item, select P8_ITEM_ID

In the first pane, navigate to Parameters, and click on p_ord_id,

Under the Value section,

For Type, select Item
For Item, select P8_ORD_ID

This new process should be the first process to be executed, thus make sure that the order of the processes is the following:

Get Item Id
Process form
Close Dialog
If you need to organize them, drag and drop them to the position you need.

Lastly, organize the items in the layout by dragging and dropping the items as you prefer:



6. Click Save.