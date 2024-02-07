# Add Dynamic Actions

## Introduction

Until now, the Like and Delete buttons are available on the Cards. However, clicking these buttons does not currently have any visible effect. Behind the scenes, the URL Link targets are actually calling the javascript on the page, and are setting the **P1\_ACTION\_ID**, but we need to create a Dynamic Action with a Custom Event for each button. This design pattern greatly simplifies the amount of Javascript required to make the magic happen.

Estimated Time: 5 minutes

Watch the video below for a quick walk-through of the lab.
[Create an APEX App](videohub:1_9eyiszwb)

### Objectives

In this lab, you will:
- Create Dynamic Actions for Like and Delete buttons
- Associate the Like and Delete buttons with custom events


### Prerequisites

- Completion of workshop through Lab 7

## Task 1 : Create a Dynamic Action with a Custom **action-like** Event

1. From the Rendering pane, navigate to the **Dynamic Actions** tab.

    ![Dynamic Actions tab](images/da-tab.png)

    The dynamic Actions tab is displayed:

    ![Dynamic Actions tree](images/da-tree.png)


2.  Right-click the **Events** entry and choose **Create Dynamic Action**.

    ![Right-click options](images/create-da.png)

3.  A **New** Dynamic Action has been created with a **True action** defaulted to **Show**. Change the Name to **action-like**.

    ![Property editor](images/da-name.png)

4.  For When > Event, select **Custom**.

    ![Property Editor](images/when-event.png)

5.  For When > Custom Event, enter **action-like**. This is an important detail because the Javascript on our page  identifies this Dynamic Action by this Custom Event name.

6.  Finally, under **When**:
    - For Selection Type, select **JavaScript Expression**
    - For Javascript Expression, enter **document**

    ![Property Editor](images/js-expression.png)

## Task 2: Creating the True Actions for the Like Button

We need to configure the True actions for the **action-like** Dynamic Action. We need to perform two actions: 
    - Update the UI on the client with either one more or one less Like (JavaScript)
    - Invoke the database work necessary to record the desired state for the user, for the corresponding post (PL/SQL).

1.  Edit the **True** Action Identification > Name to **LIKE - update UI (adjust count + heart color)**

2.  Set **Action** to **Execute JavaScript Code**.

3.  Copy and paste the following JavaScript code into the **Code** box:

    ```
    <copy>
        const button = $('[data-id="'+ apex.items.P1_ACTION_ID.value +'"] .js-heart-button'); // get the card

        const label = button.find('.a-CardView-buttonLabel'); // get the likes count section

        const icon = button.find('.a-CardView-buttonIcon'); // gets the element if its liked already

        let likeCount = label.text(); // get the like count

        if (icon.hasClass('user-has-liked')) {
            // user has liked this already, and they are unliking it now -- decrement
            label.text(--likeCount);

        } else {
            // user is liking the post -- increment
            label.text(++likeCount);
        }

        icon.toggleClass('user-has-liked'); // either add this class or remove it
    </copy>
    ```
    ![Property Editor of Dynamic Action](images/action-like-true.png)

4. Next, we need to add another True Action to do the database work and store the User reaction.

    Right-click on the True title within the action-like Dynamic Action we just created. Choose **Create TRUE action**.

    ![Dynamic Actions tree](images/true-action.png)

5.  Click on the resulting default "Show" action, and set the Name to **LIKE -- do database work**

6.  Set the **Action** to **Execute Server-side Code**, and copy and paste the following into PL/SQL code:

    ```
    <copy>
        begin
        -- try to store this posts' reaction from this user
        insert into SM_REACTIONS (post_id, reaction, lat, lon)
            values (:P1_ACTION_ID, 'LIKED', :P1_LAT, :P1_LON);
        exception when dup_val_on_index then
            -- remove it as it already existed
            delete from SM_REACTIONS where
                post_id=:P1_ACTION_ID and created_by=:APP_USER;
        end;
    </copy>
    ```

    The code will insert the reaction for this user, for this post into the *SM_REACTIONS* table. If it already exists as determined by the constraint we created when we built the table, then the record will be deleted. These 2 actions now efficiently handle a series of otherwise complex processes: both on the Client-side and the Server-side.

    ![Code Editor](images/plsql-code.png)

7. We need to configure one last thing on this action. The code block needs to receive the Page Item values from our form. This is handled by providing a list of the **Page Items to Submit** to the Server.
Paste the below list of Page Items into the **Items to Submit** property.
    
    ```
     <copy>
        P1_ACTION_ID,P1_LAT,P1_LON
     </copy>
    ```
    ![Property Editor](images/item-to-submit.png)

8. We should now be able to Like our own post! **Save and Run** to try it out. Click the Like and see the Heart turn Black (Once you define the css class in the next lab, the heart will turn to Red).

9.  You could also explore the table data manually by navigating to **SQL Workshop > SQL commands**, and running a simple query as follows:
    ```
    <copy>
    select * from sm_reactions
    </copy>
    ```

    ![SQl commands editor](images/sql-with-record.png)

10. Clicking the Like again on your post will delete the record.

    ![SQL commands editor](images/sql-without-record.png)

    As other users use your app (which we haven't configured any yet), each Reaction for each Post by every user will create a distinct record in this table.

## Task 3: Create a Dynamic Action with a custom **action-delete** event

**Note**: Task 3 and Task 4 can be considered optional – they enable the user to delete their own post, and are very similar to the previous 2 tasks.

1. First, we want to be sure that we are looking at the **Dynamic Actions** tab. If not, select it so that we can add a new Dynamic action.

    ![Dynamic Actions tab](images/da-tab.png)

2. Right-click the **Custom** entry and choose **Create Dynamic Action**.

    ![Dynamic Actions tree](images/create-da-2.png)

3. You will now see that a New Dynamic Action has been created with a **True** action defaulted to **Show**.

    ![Page Designer](images/da-overview.png)

4. Update the following attributes in the Property Editor:
    - Name: **action-delete**
    - When > Event: **Custom** 
    - When > Custom Event: **action-delete**. This is once again an important detail because the Javascript on our page identifies this Dynamic Action by the Custom Event name.
    - Finally, set When -> Selection Type to **JavaScript Expression** and for Javascript Expression, enter **document**.

    ![Property Editor](images/true-property-editor.png)


## Task 4: Create the Delete Button True Actions

We need to configure the True actions for the action-delete Dynamic Action. 
There are actually 3 actions desired here: 
    - Confirm deletion
    - Invoke the database work necessary to delete the desired post (PL/SQL) 
    - Update the UI on the client by removing the deleted post

1. Navigate to the **True Action > Show** button and set the following properties:
    - Name: **DELETE – Confirm dialog**
    - Action: **Confirm**
    - Title: **Are you Sure?**
    - Message: **You are about to delete this post. Are you sure?**

    ![Property Editor](images/delete-confirm-dialog.png)

2. Next, we need to add another True Action to do the database work and delete the post record from the table.	Right-click on the **True** title within the action-delete Dynamic Action and select **Create TRUE action**.

    ![Dynamic Actions Tree](images/create-true-action.png)

3. Click on the resulting default **Show** action, and set the **Name** to **DELETE – do database work**.

    ![Page Designer View](images/do-db-work.png)

4. Set the **Action** to **Execute Server-side Code**.

    ![Page Designer View](images/exec-server-side.png)

5. Copy and paste the following PL/SQL (which is a DML statement) into the **PL/SQL Code** field.

    ```
    <copy>
        delete from SM_POSTS where id=:P1_ACTION_ID and created_by=:APP_USER;
    </copy>
    ```

    This code will delete the post from the *SM\_REACTIONS* table based on the logged in user (**:APP\_USER**) and matching the table record with the value in **:P1\_ACTION\_ID** (as identified in the code via Oracle bind variable syntax).
    

6. The code block in the previous step needs to receive the Page Item value for the P1\_ACTION\_ID value as defined by the button in the Cards report for each post that shows the delete button/icon. This is handled by providing the Page Items to Submit to the Server. Enter the following Page Item name into **Items to Submit** field:

    ```
    <copy>
        P1_ACTION_ID
    </copy>
    ```

    ![Property Editor](images/page-item.png)

7. Finally, after the row is deleted, we want to remove the post from the Timeline UI.
    To do this, right-click on the **True** entry under the **action-delete** custom event, and select **Create TRUE Action**.

    ![Dynamic Action Tree](images/create-true-action.png)

8. In the property Editor,
    - Set the **Name** as **DELETE – remove post in UI**
    - Set the **Action** to **Execute JavaScript Code**

    ![Property Editor](images/da-identification.png)

9. Lastly, copy and paste the following code into the **Code** box:

    ```
    <copy>
        $('[data-id='+apex.items.P1_ACTION_ID.value+']').remove();
    </copy>
    ```
    ![Property Editor](images/code.png)

10. We should now be able to delete our own post. **Save and Run** to try it out!

    ![App is dispalyed](images/run-app.png)

11. Besides the post being removed from your screen, you can navigate to **SQL Workshop > Object Browser** and also confirm that there is no data left in the table **SM_POSTS**(assuming that there was only the one post in the app).

    ![SQL Commands page](images/verify-object-browser.png)

    You may now **proceed to the next lab**

## Acknowledgements

 - **Author** - Jayson Hanes, Principal Product Manager; Apoorva Srinivas, Senior Product Manager;
 - **Last Updated By/Date** - Ankita Beri, Product Manager, March 2023
