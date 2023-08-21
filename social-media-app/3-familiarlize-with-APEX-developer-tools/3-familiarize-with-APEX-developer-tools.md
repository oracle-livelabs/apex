# Get Familiar with the APEX Developer Tools

## Introduction
In this lab, you acquaint yourself with the developer tools where the APEX developers spend most of their time. You explore the APEX Developer Toolbar and the Page Designer.

Estimated Time: 5 minutes


### Objectives

In this lab, you will:
- Familiarize with the APEX Developer Toolbar
- Acquaint yourself with the Page Designer

### Prerequisites

- Completion of workshop through Lab 2

**NOTE: You can skip to [LAB 4](?lab=4-customize-app-homepage) if you are already familiar with the APEX developer tools**

## Task 1: The APEX Developer Toolbar

1. Switch back to the tab where the app is running, and notice the APEX Developer toolbar at the bottom.

    ![The application with the developer toolbar at the bottom](images/dev-toolbar.png "")

    **Note**: The application end users will not see this bar. The developer tool bar is only visible to you because you are already logged into the APEX builder in another tab. The toolbar consists of quick links to features of APEX that we will continue to use for our development.

2. Click on the **Page 1**. This navigates back to the APEX Page Designer where you can begin making your changes to the page.

    ![Buttons on the developer toolbar](images/edit-page1.png "")

## Task 2: Get acquainted with APEX Page Designer

Welcome to APEX Page Designer! This is the APEX interface by which the
majority of all the APEX developer magic happens!

The APEX Page Designer is organized into 3 vertical column sections,
each of which can have one or more tabs within. The thin bars between each
column area can be dragged to adjust their width, or the middle
button can be clicked to collapse and expand the left or right sections.

1. The left side (#1 in the image below) defaults to the **Rendering
Tree**, but notice that there are a few other tabs within: **Dynamic
Actions**, **Processing** and **Page Shared Components**. We will learn more about these later.

    ![The Page designer is displayed](images/pd-left.png)

    This first section is a tree-view of the components that are on the page
and may contain nested feature-nodes with more parts within each
component. The nodes can be expanded or collapsed which will be useful as
this tree content grows. Most list entries here can be dragged and
dropped within the tree, and/or can be right-clicked to view a context menu with 
available developer options. 

2. The middle section is itself divided into two sections:

    ![The layout and gallery pane is displayed](images/pd-middle.png)

    The top section is the page **Layout** tab, it also has
other tabs within: **Page Search** and **Help**

**Take a moment to click on each tab to see how they look.**

The bottom section has 3 tabs: **Regions, Items** and
**Buttons**. The objects within this section
can be dragged and dropped into the **Layout** section
depending on where you want them placed.

3. The third section on the right is called the Property Editor and displays the 
declarative features of the selected page component. The title
of the first tab within will be the name of the component that you have
selected, be it of type **Page** or **Region** and so forth. In
addition, depending on what is selected, another tab titled
**Attributes** might be available with more component specific
declarative options. In this case, the top-most tree entry, **Page 1:Timeline** is selected,
and the Property Editor displays the **Page** related declarative features:

    ![The property editor is displayed](images/pd-right.png "")

    Further, you will want to be aware that each tab within their respective
sections might have scroll bars shown so that you can navigate down or
across longer sections of options.

    **Before we continue, take a moment to practice adjusting the size of
your sections, but keep them all expanded.**

    ![Page designer is displayed highlighting the collapse icons](images/pd-slider.png "")

    If you are confused, you can easily reset the layout back to the
default with the wrench button at the top right of Page Designer:

    ![Page designer settings](images/pd-reset.png "")

You may now **proceed to the next lab**

## Acknowledgements

 - **Author** - Jayson Hanes, Principal Product Manager; Apoorva Srinivas, Senior Product Manager; 
 - **Last Updated By/Date** - Apoorva Srinivas, Senior Product Manager, March 2023