# Introduction

## What is APEX?

Oracle APEX is a low-code application platform for Oracle Database. APEX Application Development, Autonomous Data Warehouse (ADW), Autonomous Transaction Processing (ATP), and Autonomous JSON Database are fully managed services, pre-integrated and pre-configured with APEX, for rapidly building and deploying modern data-driven applications in Oracle Cloud. Business users, citizen developers, and application developers can create enterprise apps faster with less code, without learning complex web technologies, using only a browser.

A page is the basic building block of an application. A region is an area on a page that serves as a container for content. Use Page Designer to maintain and enhance pages within an Oracle APEX application.

In this workshop, you use Page Designer to create and configure pages and regions in the Talent Acquisition Portal (TAP) and Employee Self-Service Portal (ESS). You work with Static Content, Dynamic Content, and Cards regions; configure region sources and positions; add a region to the Global Page; and inspect page rendering with Debug mode.

You are building a Talent Management System (TMS) for a sample company called Acme Corp. The system covers the complete employee lifecycle:

```text
Job Opens -> Candidate Applies -> Interviews -> Offer Made
     -> Offer Accepted -> Onboarding -> Active Employee
         -> Leave Management -> Self-Service -> Analytics
```

The Talent Management System is split across three APEX applications:

- **Talent Acquisition Portal** - Used by recruiters and hiring managers to post jobs, track candidates, schedule interviews, and manage offers.
- **Employee Self-Service Portal (ESS)** - Used by employees and HR administrators for onboarding tasks, leave requests, payslips, employee profiles, and HR self-service.
- **HR Analytics App (HAA)** - Used by HR administrators and department heads for pipeline, time-to-hire, headcount, and leave analytics.

In this workshop, you update TAP to display the following candidate and hiring information:

- Candidate details
- Application history
- Open requisitions
- Candidate pipeline stage
- Applied date

ESS users will see a personalized home page with onboarding progress placeholder content.

Estimated Workshop Time: 35 minutes

## Objectives

In this workshop, you will learn how to:

- Navigate through and review the Page Designer panes.
- Create a blank page with the Create Page Wizard.
- Create regions from the Gallery and the Rendering Tree context menu.
- Configure region types, sources, positions, and attributes.
- Use a Dynamic Content region to display HTML returned by a PL/SQL function.
- Configure a Cards region based on a SQL Query.
- Add a region to the Global Page so it appears throughout the application.
- Compare APEX debug levels and review page-rendering details.
- Use the `&APP_USER.` substitution string in a Static Content region.

## Prerequisites

- An Oracle APEX 26.1 workspace running on an Oracle Database 19c or later. This workshop requires APEX 26.1. Some features, instructions, and screenshots may differ or not be available in prior releases.

- An API key for the AI provider of your choice: OCI Generative AI, OpenAI, Cohere, Google Gemini, Anthropic Claude, Mistral AI, Ollama, or Generic OpenAI API Compatible.

    If you choose OCI Generative AI as your AI provider, the prerequisites are as follows:

    - A paid Oracle Cloud Infrastructure (OCI) account or a FREE Oracle Cloud account with $300 credits for 30 days to use on other services. Read more about it at [oracle.com/cloud/free/](https://www.oracle.com/cloud/free/).

    - The OCI account must be created in or subscribed to one of the regions that supports OCI Generative AI Service. Currently, OCI Generative AI Service is supported in the following regions:

        - Brazil East (Sao Paulo)
        - Germany Central (Frankfurt)
        - India South (Hyderabad)
        - Japan Central (Osaka)
        - Saudi Arabia Central (Riyadh)
        - UAE East (Dubai)
        - UK South (London)
        - US East (Ashburn)
        - US Midwest (Chicago)
        - US West (Phoenix)

        OCI Generative AI Service is available in limited regions. To see whether your cloud region supports OCI Generative AI Service, visit the OCI documentation.

    - An OCI compartment. An Oracle Cloud account comes with two pre-configured compartments: the tenancy root compartment and ManagedCompartmentForPaaS, which is created by Oracle for Oracle Platform services.

    - The logged-in user should have the necessary privileges to create and manage Autonomous Database instances in this compartment. You can configure these privileges through an OCI IAM policy. If you are using a Free Tier account, it is likely that you already have all the necessary privileges.

> **Note:** The application ID in the screenshots may vary. Please ignore the application ID.

> **Important:** This workshop requires an active account with a supported Generative AI provider. Oracle APEX connects to the provider of your choice using your own credentials. Any charges for API usage are billed directly by your provider. Please review your provider's pricing before proceeding.

## Downloads

If you are stuck or the applications are not working as expected, you can download and install the completed applications as follows:

1. Download the [Talent Acquisition Portal export](files/talent-acquisition-portal-app.sql).

2. Import the **Talent Acquisition Portal** export into your APEX workspace. Follow the steps in the **Import Application** wizard.

3. Download the [Employee Self Service Portal export](files/employee-self-service-portal-app.sql).

4. Import the **Employee Self Service Portal** export into your APEX workspace. Follow the steps in the **Import Application** wizard.

## Learn More - Useful Links

- [Oracle APEX Product Overview](https://www.oracle.com/apex/)
- [Oracle APEX 26.1 Documentation](https://docs.oracle.com/en/database/oracle/apex/26.1/)
- [Managing Pages in an Application](https://docs.oracle.com/en/database/oracle/apex/26.1/htmdb/managing-pages-in-an-application.html)
- [About Page Designer](https://docs.oracle.com/en/database/oracle/apex/26.1/htmdb/about-page-designer.html)
- [About Regions](https://docs.oracle.com/en/database/oracle/apex/26.1/htmdb/about-regions.html)
- [Oracle APEX Tutorials](https://apex.oracle.com/en/learn/tutorials/)
- [Oracle APEX Community](https://apex.oracle.com/community/)
- [Oracle APEX Discussion Forum](https://forums.oracle.com/ords/apexds/domain/dev-community/category/application_express)

You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - Sahaana Manavalan, Senior Product Manager
- **Last Updated By/Date** - Sahaana Manavalan, Senior Product Manager, July 2026
