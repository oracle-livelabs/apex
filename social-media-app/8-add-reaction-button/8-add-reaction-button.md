# Add Dynamic Actions

## Introduction

At this stage, the Like and Delete buttons are visible on the Cards, but clicking them does not produce any noticeable effect. Behind the scenes, the URL Link targets are correctly triggering JavaScript on the page and setting the **P1\_ACTION\_ID**. However, we still need to create Dynamic Actions with Custom Events for each button.

This approach helps reduce the amount of JavaScript required while ensuring that the functionality works efficiently.

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

1. In the Rendering tree, select the **Dynamic Actions** tab.

    ![Dynamic Actions tab](images/da-tab.png)

    The dynamic Actions tab is displayed:

    ![Dynamic Actions tree](images/da-tree.png)

2. Right-click the **Events** and select **Create Dynamic Action**.

    ![Right-click options](images/create-da1.png)

3. A **New** Dynamic Action has been created with a **True action** defaulted to **Show**.

    ![Property editor](images/da-name.png)

4. Enter/select the following:

    - Identification > Name: **action-like**

    - Under When:

        - Event : **Custom**

        - Custom Event: **action-like**

        - Selection Type: **JavaScript Expression**

        - Javascript Expression: **document**

        ![Property Editor](images/js-expression.png =50%x*)

## Task 2: Creating the True Actions for the Like Button

To complete the **action-like** Dynamic Action, we need to configure the True Actions to perform two tasks:

- Update the UI: Modify the like count dynamically on the client-side using JavaScript. This ensures immediate feedback to the user without requiring a full page reload.

- Invoke the Database Action: Use a PL/SQL process to update the like status in the database. This ensures that the like/unlike action is correctly recorded for the post.

1. In the True action, enter/select the following:

    - Under Identification:

        - Name: **LIKE - update UI (adjust count + heart color)**

        - Action > **Execute JavaScript Code**

    - Under Settings: Copy and paste the following JavaScript code into the **Code** box:

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

2. Next, we need to add another True Action to handle the database operation and store the user's reaction.

    In the Rendering tree of the action-like Dynamic Action, right click on the True title and select **Create TRUE action**.

    ![Dynamic Actions tree](images/true-action.png)

3. In the Property Editor on the resulting default "Show" action enter/select the following:

    - Under Identification:

        - Name: **LIKE -- do database work**

        - Action: **Execute Server-side Code**

    - Under Settings:

        - PL/SQL Code: Copy and paste the following

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

        This code will insert the reaction for the user and the corresponding post into the *SM_REACTIONS* table. If a reaction already exists (as enforced by the constraint defined when creating the table), the record will be deleted instead.

        These two actions effectively handle both client-side and server-side processes, ensuring a smooth and efficient like/unlike functionality.

    ![Code Editor](images/plsql-code.png)

4. We need to configure one final step for this action. The code block must receive the necessary Page Item values from our form. To achieve this, we will specify the Page Items to Submit to the server.

    - Settings > Items to Submit : **P1\_ACTION_ID,P1\_LAT,P1\_LON**

        ![Property Editor](images/item-to-submit.png =40%x*)

5. Now, we should be able to like our own post!

    **Save and Run** the app to test it. Click the Like button and see the heart turn black. (Once we define the CSS class in the next lab, the heart will turn red.)

6. You could also explore the table data manually by navigating to **SQL Workshop > SQL commands**, and running a simple query as follows:
    ```
    <copy>
    select * from sm_reactions
    </copy>
    ```

    ![SQl commands editor](images/sql-with-record.png)

7. Clicking the Like again on your post will delete the record.

    ![SQL commands editor](images/sql-without-record.png)

    As more users interact with your app (which we haven't configured yet), each reaction on a post will create a separate record in the SM_REACTIONS table.

## Task 3: Create a Dynamic Action with a custom **action-delete** event

 *Note: Task 3 and Task 4 can be considered optional – they enable the user to delete their own post, and are very similar to the previous 2 tasks.*

1. In the Rending treee, select **Dynamic Actions** tab.

    ![Dynamic Actions tab](images/da-tab1.png)

2. Right-click **Custom** entry and select **Create Dynamic Action**.

    ![Dynamic Actions tree](images/create-da-3.png)

3. You will now see that a new Dynamic Action has been created with a **True** action defaulted to **Show**.

    ![Page Designer](images/da-overview.png)

4. Update the following attributes in the Property Editor:

    - Identification > Name: **action-delete**

    - Under When:

        - Event: **Custom**

        - Custom Event: **action-delete**. (This is once again an important detail because the Javascript on our page identifies this Dynamic Action by the Custom Event name.)

        - Selection Type: **JavaScript Expression**

        - Javascript Expression: **document**

    ![Property Editor](images/true-property-editor.png)

## Task 4: Create the Delete Button True Actions

We need to configure the True actions for the action-delete Dynamic Action.

There are actually 3 actions desired here:

- Confirm deletion

- Invoke the database work necessary to delete the desired post (PL/SQL)

- Update the UI on the client by removing the deleted post

1. Navigate to the **True Action > Show** button and set the following properties:

    - Under Identification:
        - Name: **DELETE – Confirm dialog**
        - Action: **Confirm**

    - Under Settings:
        - Title: **Are you Sure?**
        - Message: **You are about to delete this post. Are you sure?**

    ![Property Editor](images/delete-confirm-dialog.png)

2. Next, we need to add another True Action to do the database work and delete the post record from the table. In the Rendering Tree, right click on the **True** title within the action-delete Dynamic Action and select **Create TRUE action**.

    ![Dynamic Actions Tree](images/create-true-action.png)

3. Click on the resulting default **Show** action, and in the property editor, enter/select the following:

    - Under Identification:

        - Name: **DELETE – do database work**

        - Action: **Execute Server-side Code**

    - Settings > PL/SQL Code: Copy and paste the following (which is a DML statement)

        ```
         <copy>
         delete from SM_REACTIONS where POST_ID = :P1_ACTION_ID and created_by=:APP_USER;
         delete from SM_POSTS where id=:P1_ACTION_ID and created_by=:APP_USER;
         </copy>
        ```

        This code will delete the post from the *SM\_REACTIONS* table based on the logged in user (**:APP\_USER**) and matching the table record with the value in **:P1\_ACTION\_ID** (as identified in the code via Oracle bind variable syntax).

4. The code block in the previous step needs to receive the Page Item value for the P1\_ACTION\_ID value as defined by the button in the Cards report for each post that shows the delete button/icon. This is handled by providing the Page Items to Submit to the Server. Select the following:
    - Settings > Items to Submit: **P1\_ACTION\_ID**

    ![Property Editor](images/page-item-s.png)

5. Finally, after the row is deleted, we want to remove the post from the Timeline UI.
    In the **action-delete** custom event, right-click on **True** and select **Create TRUE Action**.

    ![Dynamic Action Tree](images/create-true-action.png)

6. In the Property Editor, enter/select the following:

    - Under Identification:

        - Name: **DELETE – remove post in UI**

        - Action: **Execute JavaScript Code**

    - Settings > Code: Copy and paste the following

        ```
        <copy>
            $('[data-id='+apex.items.P1_ACTION_ID.value+']').remove();
        </copy>
        ```

    ![Property Editor](images/code-s.png)

7. We should now be able to delete our own post. **Save and Run** to try it out!

    ![App is dispalyed](images/run-app-11.png)

8. Besides the post being removed from your screen, you can navigate to **SQL Workshop > Object Browser** and also confirm that there is no data left in the table **SM_POSTS** (assuming that there was only the one post in the app).

    ![SQL Commands page](images/verify-object-browser.png)

    You may now **proceed to the next lab**

## Acknowledgements

- **Author** - Jayson Hanes, Principal Product Manager; Apoorva Srinivas, Senior Product Manager;
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, March 2025
