# Create form page and page processing

## Introduction

In this lab, you will create a new APEX form so that our users can select a file, and initiate the approval task.

Estimated Time: 5 minutes

[Lab 4](videohub:1_s49lbxb4)

### Objectives

In this lab, you will:

- Create APEX form page
- Alter page details
- Create link between pages

### Prerequisites

To complete this lab, you need to have the following:

- All previous labs successfully completed

## Task 1: Create Form

1. Return to page 3 and create a new modal form page for our end users.

    ![Create new Modal Page](images/create-new-page.png " ")

2. Select Form and enter the source details.

    ![Select Form](images/select-form.png " ")

    ![Enter Form Details](images/enter-form-details.png " ")

    >**Note: If the page number does not default to 11, change it to 11.**

    ![Form Primary Key](images/form-pk.png " ")

3. Page 11 is now created. Add two-page items to this page. A text field to hold our requestor's username, and a file browser to upload the local file.

    ![Create page item](images/create-new-items.png " ")

    ![Requestor Page Item](images/requestor-item.png " ")

4. Add one more for the file upload.

    ![File Upload Page Item](images/file-upload-item.png " ")

5. Save changes and return to page 3.

    ![Navigate to Page 3](images/save-changes.png " ")

6. On page 3, create action as shown.

    ![Create Page Action](images/create-action.png " ")

    ![Set Button Target](images/set-button-target.png " ")

7. Set the details of the link as shown.

    ![Set Link Details](images/set-link-details.png " ")

    ![Link Details Complete](images/link-set.png " ")

8. To verify if everything is functioning correctly, proceed to the user interface (UI) and click on any of the project upload file buttons. As a result, the form should automatically populate based on the primary key that was passed through the button link. To return to page 11, simply click here.

    ![Project File Upload](images/new-modal-page.png " ")

9. Return to Page 11.

    ![Page 11](images/page-11.png " ")

10. Hide all the page items we do not wish to display to our end users. You can multi-select and set type to hidden.

    ![Hide unwanted page items](images/hide-page-items.png " ")

11. Default the requestor to the current logged in user.

    ![Default Requestor](images/default-requestor.png " ")

    ![Set Default User](images/requestor-app-user.png " ")

12. Save and run from page 3 or refresh the browser and check how the form looks now.

    ![Modal Page Update](images/modal-page-update.png " ")

13. We can also change the text of the "Save" button from Apply Changes to "Submit".

    ![New Submit Button](images/submit-button.png " ")

14. Now, navigate to the **Process** section and create a new process. This process will initiate our task definition and generate a task specifically for the project lead of the selected project.

    ![Create Page Process](images/create-process.png " ")

15. Fill in the details as shown and drag the new process between the two existing ones.

    >**Note: These processes will execute sequentially**

    ![Process Details](images/process-details.png " ")

16. Finally set the parameter that was created earlier to hold the file name of the uploaded file.

    >**Note: Currently, testing is not possible as certain pages and sample users for the three project leads need to be set up in order to view the tasks.**

    ![Set Parameter](images/set-parameter.png " ")

You may now **proceed to the next lab**.

## Acknowledgements

- **Created By/Date** - Shayne Jayawardene, January 2023
- **Last Updated By/Date** - Shayne Jayawardene, May 2023
