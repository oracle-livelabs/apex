# Decommission the environments

## Introduction

We will tear down all the environments to clean up.

Estimated Completion Time: 3 minutes

### Objectives

We will clean up the deployment.

## Task 1: Destroy the Databases

1. Use the following command to destroy the environments and databases:

    ```bash
    <copy>
    make tf-destroy
    </copy>
    ```

2. Enter `yes` at the prompt to confirm removing all the provisioned resources.


## Acknowledgements

 - **Author** - Emmanuel Leroy, Vanitha Subramanyam, March 2021
 - **Last Updated By/Date** - Emmanuel Leroy, Vanitha Subramanyam, March 2021
