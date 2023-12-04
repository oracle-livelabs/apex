# Introduction

## **What is APEX?**
Oracle APEX is a feature of Oracle Database, including the Autonomous Data Warehouse (ADW) and Autonomous Transaction Processing (ATP), Autonomous JSON Database (JSON) and APEX Application Development (APEX) services. Oracle APEX is a low-code development environment with various features and tools, where you can create an application fast. In the future, rather than emailing spreadsheets around to gather information, you will know how to easily create an app in minutes using APEX and email the URL instead. The result will be a secure, scalable, multi-user app that provides a single source-of-truth for your data!


In this workshop, you will create an application that allows you to manage expenses using the approvals component. To explain the concepts and terms associated with Approval Management in APEX, we take the example of the Expense Tracker Application.

To apply for an expense, an employee logs into the application and submits an expense request filling in the Type (Accommodation/Conference/Internet/ Miscellaneous Expenses) and total Expenses. The task could be assigned to multiple potential owners, and then they can perform possible actions (Request information/Delegate/Release/Change Priority).

If the expense cost is more than 50000, then the Expense request, once approved by the immediate manager, will go to the next manager and so on, depending on the Expense amount. This is a typical use case for a multi-level approval.

Also, Deadlines and Expiration are set for a task. The potential owner will get an Email before 5 mins of task expiration. If the task is not approved or rejected before the expiry, then the task could be tagged as Expired.

Estimated Time: 1 hour

### Objectives
In this lab, you will:
- Obtain a free development environment
- Learn how to create a SQL Script
- Learn how to create a Task definition
- Learn how to create a Page to submit Expense
- Learn how to create a Unified Task List
- Learn how to create Users
- Learn how to create an Email Template
- Learn how to Request Information/ Delegate/ Release
- Learn how to set deadlines and expiration


*Note: This workshop assumes you are using Oracle APEX 23.2.*

## Learn More - *Useful Links*

- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX Collateral](https://www.oracle.com/database/technologies/appdev/apex/collateral.html)
- [Tutorials](https://apex.oracle.com/en/learn/tutorials)
- [Community](https://apex.oracle.com/community)
- [External Site + Slack](http://apex.world)
