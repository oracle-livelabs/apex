# Introduction

## About this Workshop

![Logo](images/zdc-logo.png)
**Community Contributed Workshop**

- **Author:** _Jim Czuprynski - Oracle ACE Director, Zero Defect Computing, Inc._

This LiveLab session focuses on a real-world business problem: how to strategically place battery-electric vehicle (EV) charging stations to conform to federal government guidelines to ensure that at least 40% of the least-advantaged areas of the U.S. State of Wisconsin are guaranteed their share of public funding for rebuilding the nation's electrical infrastructure.

We will be using publicly-available data to plot which potential and existing EV chargers will satisfy the target of serving the 40% disadvantaged communities (DACs) based on data compiled through the US Department of Transportation (DOT). DACs are individual census tracts which contain between 1000 - 7000 people, so they vary dramatically in size based on population; a large city like Milwaukee, WI will have dozens of DACs, while a smaller community like Stevens Point, WI will have only a handful.

The database tables we will populate contain dozens of variables, including the geospatial boundaries of each DAC as well as the latitude and longitude of actual and potential EV chargers. Once those tables are populated, we will construct an Application Express (APEX) workspace, import a sample APEX application, and then explore and visualize geospatial attributes of our datasets with Native Map Region features. We will also employ Oracle Spatial functions to experiment with satisfying the 40% DAC coverage requirement for EV charging point placement based on the proximity of charging points to DAC boundaries.

### Objectives
In this lab, you will learn how to:
- Connect to a Remote Desktop instance reservation.
- Start Oracle REST Data Services (ORDS).
- Configure an APEX workspace.
- Import an existing APEX application.
- Create and populate Database objects in SQL Developer.
- Visualize and analyze geospatial data with Native Map Region capabilities.

### Labs

| # | Lab | Est. Time |
| --- | --- | --- |
| 1 | [Initialize the LiveLab Environment](?lab=initalize_livelabs_environment) | 10 min |
| 2 | [Change Password and Start ORDS](?lab=change_pw) | 5 min |
| 3 | [Prepare Database Objects](?lab=prepare-database-objects) | 10 min |
| 4 | [Create and Prepare APEX Workspace](?lab=apex-prepare-workspace) | 10 min |
| 5 | [Explore Native Map Region Capabilities](?lab=explore-native-map-regions) | 20 min |
{: title="Labs with Times"}

Estimated Time: 55 minutes

### **Let's Get Started!**

- [Click here](?lab=initalize_livelabs_environment), select **Lab 1** from the menu on the left, or click the arrow below to start the workshop.

## Learn More

- [Oracle SQL Developer 23.1 Concepts and Usage](https://docs.oracle.com/en/database/oracle/sql-developer/23.1/rptug/sql-developer-concepts-usage.html#GUID-464C045C-FBDF-417A-A20B-037D294B3BDA)
- [Oracle Spatial Database](https://www.oracle.com/database/spatial/)
- [Oracle APEX](https://apex.oracle.com/en/)
- [APEX Community](https://apex.oracle.com/community)

## Acknowledgements

* **Author** - Jim Czuprynski, LiveLabs Contributor, Zero Defect Computing, Inc.
* **Contributors** - Hope Fisher, Program Manager, Database Product Management
* **Last Updated By/Date** - Hope Fisher, June 2023