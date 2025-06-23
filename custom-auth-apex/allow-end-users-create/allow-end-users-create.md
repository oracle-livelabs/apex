# Allow end users to create their own account

## Introduction

This lab walks you through the steps to create the "Create New User" page shown below. This page will be accessible from the Login page so that end users can directly fill out this form to create an account.

![Final "Create New User" page appearance and button on login page](./images/lab2-cover-image.png)

Estimated Time: 20 minutes

### Objectives

In this lab, you will:
* Create a new user page
* Add a button to the Login page to access the "Create New User" page

### Prerequisites

This lab assumes you have:
* All previous labs completed

## Task 1: Create a New User Page

Now that we have the custom authentication Scheme set up, we need to create a page where users can create their accounts. This page will look something like the screenshot in this lab's [introduction](#Introduction). The user is prompted to enter an email, username, and password, and then confirm that password. They then press “Create New User” to create the account, which will automatically return the user to the Login page and will display a success message. In the backend, this page will check that the username and email haven’t already been taken by someone else and that the password meets a minimum set of requirements. These checks will be implemented via Validations in APEX (see the [Learn More](#LearnMore) section).

*Remember to save your work throughout. We recommend doing so in the Page Designer each time you add/edit a Page Item, Button, Validation, etc. The **Save** button can be found in the top-right corner.*

1. From within App Builder, and with your application selected, click **Create Page &gt;**.

	![Create new page](./images/create-page.png)

2. Click **Form**.

3. You can keep the auto-assigned **Page Number** or manually enter one yourself (make sure it’s not already being used). Give the page a **Name** like “Create New User” and select “Modal Dialog” for **Page Mode**. For the **Data Source** part of the wizard, find your users table for the **Table / View Name** and click **Next &gt;**.

	![Provide information for the page](./images/create-form.png)

4. Keep **Primary Key Column 1** as **USER_ID** and click **Create Page**.

	![Select the primary key and click Create](./images/select-pk.png)

5. Change the **ACCOUNT_STATUS** item **Type** to "Hidden". To do so, select the page item in the left-side pane, and change the **Type** field in the right-side pane from the dropdown menu. Change the **PASSWORD** item **Type** to “Password”.

  Change the **EMAIL** page item to **Subtype** “E-Mail” as well so that it will automatically check that the value entered is a properly formatted email address.

	![Change the PASSWORD item TYPE](./images/change-item-type.png)

	![Change the EMAIL item TYPE](./images/change-item-subtype.png)

6. Add another page item (right-click on the **PASSWORD** page item in the left-side pane and click “Create Page Item Below”) and name it something like **CONFIRM_ PASSWORD** so that the user has to re-enter their password to confirm it (keep the **PXX_** prefix where “XX” is your page number). Change the **Type** to “Password”.

	![Create another page item to confirm the password](./images/create-page-item.png)![Make new item of Type "Password"](./images/password-type.png)

7. In the right-hand side, find the "Appearance" section and change the **Template** to "Required Floating" so that the input field on the form matches the formatting of the original "PASSWORD" field.  Scroll down and find the **Validation** section and toggle on "Value Required".

	![Format the "CONFIRM_PASSWORD" field](./images/confirm-pwd-formatting.png)

8.	Next create a **Validation** on the **EMAIL** page item (right-click on the page item in the left-side pane and click “Create Validation”) and call it something like **UNIQUE_ EMAIL**. This Validation will check that this email is not already taken by another user. In the right-side pane, the **Validation Type** should be set as “No Rows returned” and then copy & paste the code snippet below as the associated SQL Query. Change “XX” in **PXX_ EMAIL** to the page number assigned to this page (see top-left of page). Then provide an **Error Message** that will appear if a user enters an email that is taken.

	![Right-click on EMAIL and click "Create Validation"](./images/create-validation.png) ![Create the validation](./images/unique-email-validation.png)

	```
	<copy>
	select * from user_creds where email = :PXX_EMAIL;
	</copy>
	```

9. Similarly, create a **Validation** on the **USERNAME** page item following the same process as in the previous step (step 8), but in the **SQL Query** change **email** to **username** and **PXX_ EMAIL** to **PXX_ USERNAME**.

10. Next create a **Validation** on the **PASSWORD** page item of **Type** “Function Body (returning Error Text)”. This will check that the password entered meets a standard set of minimum requirements. Specifically, the password must be at least 8 characters long, have at least one special character, one upper and lower case letter, and have at least one number. Copy & paste the following code snippet as the **PL/SQL Function Body Returning Error Text**.

	> **Note:** Remember to change the “XX” in **PXX_PASSWORD** to your assigned page number. From here on out, assume that this will always be the case for all code snippets. To make it easier to edit the code block, click on the Popout Icon, ![Popout Icon](./images/popout-icon.png), and click **OK** in the bottom-right of the dialog when you're finished editing.

	```
	<copy>
	BEGIN
	IF 8 <= LENGTH(:PXX_PASSWORD) THEN
  	IF REGEXP_LIKE(:PXX_PASSWORD, '^.*[0-9]') THEN
	IF REGEXP_LIKE(:PXX_PASSWORD, '^.*[a-z]', 'c') THEN
	IF REGEXP_LIKE(:PXX_PASSWORD, '^.*[A-Z]', 'c') THEN
	IF REGEXP_LIKE(:PXX_PASSWORD, '^.*[!@#$%^&*()_]', 'c') THEN
	RETURN '';
	ELSE
  	RETURN 'Password missing a special character';
	END IF;
	ELSE
		RETURN 'Password missing an uppercase';
	END IF;   
	ELSE
		RETURN 'Password missing a lowercase';
	END IF;
	ELSE
		RETURN 'Password missing a numeric value';
	END IF;
	ELSE
		RETURN 'Password must be at least 8 characters long and your password length is currently'||' '||LENGTH(:PXX_PASSWORD);
	END IF;
	END;
	</copy>
	```
11. Create a **Validation** on the **CONFIRM_PASSWORD** page item that you created in step 6 and make it of **Type** “Function Body (returning Boolean)”. In the **PL/SQL Function Body** field, copy & paste the code snippet below, changing the page numbers as applicable. Add an **Error Message** that you want to appear if the user enters two passwords that do not match.

	```
	<copy>
	BEGIN

	IF :PXX_PASSWORD = :PXX_CONFIRM_PASSWORD THEN
		RETURN TRUE;
	ELSE RETURN FALSE;
	END IF;

	END;
	</copy>
	```

12.	Under **Region Buttons** there should be 4 default buttons already created. Feel free to delete the **DELETE** and **SAVE** buttons as you will not be needing them (right-click on them in the left-side pane and click “Delete”).

	![Delete unnecessary buttons](./images/default-buttons.png)

13.	The default **CANCEL** button has a Dynamic Action already associated with it. We are going to add another **TRUE** Action by expanding the **CANCEL** hierarchy in the left-side pane (click on the “&gt;” icon next to **CANCEL**).  Right-click on “Cancel Dialog” in the left-side pane and click “Create TRUE Action”.

	![Right-click on the "Cancel Dialog" Dynamic Action and click "Create TRUE Action"](./images/create-true-action.png)

14.	In the right-side pane change **Action** to “Refresh”, **Selection Type** to “Region” and **Region** to “Create New User” from the dropdown. You can leave the **Name** blank.

	![Edit Dynamic Actions](./images/refresh-dynamic-action.png)

15.	In the **Processing** tab on the left-side pane (denoted by ![Processing tab icon](./images/processing-icon.png)), click on “Process form …” under **Processes**. Scroll down in the right-side pane and add a **Success Message** and **Error Message** notifying the user that their account has/hasn’t been created.

	![Add Success and Error Messages for when a user tries to create an account](./images/create-user-success-error-msgs.png)

16.	There is a default “Close Dialog” process created that we don’t need. To delete this process, right-click on it and click “Delete”.

	![Delete the "Close Dialog" process](./images/delete-close-dialog.png)

17.	Navigate back to the **Rendering** tab on the left-side pane (denoted by ![Rendering tab icon](./images/rendering-icon.png)) and click on “Page XX: Create New User”. In the right-side pane, search for “Security” in the search/filter bar (or scroll down to this section yourself). Change the **Authentication** setting to “Page is Public” from the dropdown.

![Change page's authentication](./images/make-page-public.png)

18.	Click **Save** in the top-right corner.

This concludes this task. You may now **proceed to the next task.**

## Task 2: Add Button to Login Page for "Create New User" Page

Now that we have a Create New User page to go to, we need to add a button to the Login page that directs us here. Follow the steps outlined below to do so.

1. Navigate to the Login page (should be page 9999 by default).

2. In the left-side pane, right-click on the **LOGIN** button and click **Create Button Below**.

	![Create a button below the default Login button to get to the Create New User page](./images/create-button-below.png)

3. In the right-side pane, give it a **Button Name** and **Label** (something like **CREATE_ NEW_ USER** and “Create New User”, respectively).

	![Give the new button a name](./images/create-new-user-button.png)

4. If you want the button to be centered and appear like the default “Sign In” button appears, change the **Button Position** to “Next” from the dropdown menu, and in the **Appearance** section, toggle **Hot** to the on position.

	![Adjust the settings for your new button](./images/new-button-settings.png)

5. In the **Behavior** section, change the **Action** to “Redirect to Page in this Application” and select the page number for your Create New User page.

	![Set the behavior for this new button to redirect to your Create New User page](./images/new-button-behavior.png)

6. Click **Save** in the top-right corner and click the "Save and Run Page" button (![Save and Run Page button in top-right corner](./images/preview-button.png)) to preview your newly updated Login page.

This concludes this lab. You may now **proceed to the next lab**.

## Learn More

* [Adding a New Page to an Application](https://docs.oracle.com/en/database/oracle/apex/24.2/htmdb/adding-new-page-app.html) in Oracle APEX
* [Validations](https://docs.oracle.com/en/database/oracle/apex/24.2/htmdb/understanding-validations.html) in Oracle APEX
* [Managing Buttons](https://docs.oracle.com/en/database/oracle/apex/24.2/htmdb/creating-buttons.html) in Oracle APEX
* [About Dynamic Actions](https://docs.oracle.com/en/database/oracle/apex/24.2/htmdb/managing-dynamic-actions.html) in Oracle APEX

## Acknowledgements
* **Author** - Ana Beyer, Staff Cloud Engineer, Oracle
* **Last Updated By/Date** - Ana Beyer, June 2025
