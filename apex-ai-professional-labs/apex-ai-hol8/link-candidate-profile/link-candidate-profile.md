# Lab 3: Link Candidate Pipeline to Candidate Profile

## Introduction

Link each candidate ID in Candidate Pipeline to the Candidate Profile page. The profile page is intentionally blank at this point; a later module builds its content.

Estimated Time: 10 minutes

### Objectives

In this lab, you will:

- Add a hidden candidate ID item to Candidate Profile.
- Configure the Candidate Pipeline candidate ID column as a link.
- Pass the selected candidate ID to Page 11.

## Task 1: Add the target page item

1. Open the **Candidate Profile** page in Page Designer.

    ![Page Designer navigation with the Candidate Profile page selected.](images/open-candidate-profile-page.png ' ')

2. Right-click **Body** and select **Create Page Item**.
    ![Page Designer navigation with the Candidate Profile page selected.](images/create-page-item.png ' ')

2. Add a hidden page item named `P11_CANDIDATE_ID`. Enter/select the following details:
    - Name: **P11\_CANDIDATE\_ID**
    - Type: **Hidden**

    ![Create Page Item dialog configured with P11_CANDIDATE_ID and Hidden item type.](images/create-hidden-candidate-id.png ' ')

3. Save the page.

    ![Candidate Profile Page Designer showing the hidden P11_CANDIDATE_ID item.](images/save-page.png ' ')

## Task 2: Configure the Candidate Pipeline link

1. Run the application and open the Candidate Pipeline page. Use **Quick Edit** to select the interactive report region.

    ![Candidate Pipeline page with Quick Edit controls for the interactive report region.](images/quick-edit-candidate-pipeline.png ' ')

2. Under Columns, select the `CANDIDATE_ID` column and set **Identification> Type** to **Link**.

    ![CANDIDATE_ID column attributes with Identification Type set to Link.](images/set-candidate-id-link.png ' ')

3. Set the target page to **Candidate Profile** (Page 11). In the dialog, select/enter the following:
    - Page: 11
    - Set Items:
        - Name: **P11\_CANDIDATE\_ID**
        - Value: **#CANDIDATE_ID#**
    
    Click **OK**.
    
    ![Link Target dialog targeting Candidate Profile Page 11.](images/target-candidate-profile-page.png ' ')


5. Save and Run the page. Select a candidate ID, and confirm that Candidate Profile opens.
    ![Candidate Pipeline page](images/candidate-pipeline.png ' ')

    ![Candidate Profile page opened after selecting a candidate ID in Candidate Pipeline.](images/candidate-profile-link-result.png ' ')

## Acknowledgements

* **Author** - Apoorva Srinivas, Principal Product Manager; Roopesh Thokala, Principal Product Manager
* **Last Updated By/Date** - Apoorva Srinivas, Principal Product Manager, July 2026
