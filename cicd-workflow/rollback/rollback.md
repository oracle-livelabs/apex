# Roll back changes

## Introduction

We will rollback changes we made to production.

Estimated Completion Time: 5 minutes.

### Objectives

We will revert changes made to the production environment.

## Task 1: Rollback

Rolling back consists in going back to a previous state. Using our release branches it's easy to rollback to a given version

1. Check out the release branch to roll back to.

    ```bash
    <copy>
    git checkout release/v1.0.0
    </copy>
    ```

2. Apply the rollback.

    ```bash
    <copy>
    make rollback ENV=prd ID=100
    </copy>
    ```

    *`rollback` is not the same as `update` as the schema change history is also reverted. Applying an `update` from an older version to the latest production environment would in fact cause issues with history tracking.*

## Task 2: Verify the Changes were Rolled Back

1. Log in to Oracle Autonomous Transaction Processing database for `prd` and sign in to the workspace with the `WS_ADMIN` user as before.

2. Check that the changes made previously were indeed reversed:

    - The table **EBA\_SALES\_ACCESS\_LEVELS** should not longer contain the **BOGUS** additional column.

    - The application **Opportunities** page name should have reverted to its original name.



## Acknowledgements

 - **Author** - Emmanuel Leroy, Vanitha Subramanyam, March 2021
 - **Last Updated By/Date** - Emmanuel Leroy, Vanitha Subramanyam, March 2021
