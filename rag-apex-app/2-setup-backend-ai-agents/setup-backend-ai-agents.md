# Setup Backend for GenAI agents

## Introduction
This lab will walk you through setting up important OCI resources to use in the following labs. You will set up your compartment, object storage bucket, GenAI agent, knowledge base, and generate an API key. 

Compartments are a logical collection of related resources. Compartments allow for organization and isolation of your cloud resources. Object storage is a low-cost storage option to store any type of data. Oracle's GenAI Agent combines LLMs and RAG to provide contextually relevant answers by searching a knowledge base. Your knowledge base is the base for all the data sources that an agent can use to retrieve information for its chat answers.

Estimated time - 20 minutes

### Objectives

In this lab, you will:
* Create Compartment
* Create an Object Storage Bucket for Knowledge Base
* Create a GenAI agent
* Generate API key

### Prerequisites

* An OCI cloud account

## Task 1: 

1. 

## Task 2: Create Bucket for Knowledge Base

1. Navigate to **Object Storage** by selecting the side-menu button, click **Storage** and then, **Buckets**.

	![Navigation menu to object storage buckets](./images/nav-buckets.png  "")

2. Select **Create Bucket**, name the nucket **RAG**, and leave everything else as default. Select Create

	![Create Bucket button](./images/create-bucket.png "")

3. Navigate to the newly created bucket by selecting from the list the name **RAG**. Scroll down on the bucket page and select **Upload**. 

	![Create Bucket button](./images/upload-pdf.png "")

4. Download the sample PDF [here](https://orasenatdpltsecitom03.objectstorage.us-phoenix-1.oci.customer-oci.com/p/ZtYD0BzBps8w3O2sYzLvnync2uSXfZk9SHSHdpaZAMnlxIVpVAEiGY4wmMKSZVEE/n/orasenatdpltsecitom03/b/RAG/o/OCI%20Dedicated%20Region%20At-A-Glance.pdf) and then, drag and drop the sample PDF to the console and select **Upload**.

	![Create Bucket button](./images/drop-pdf-upload.png "")

## Task 3: 

You may now **proceed to the next lab**.

## Acknowledgements

* **Authors:**
	* Kevin Xie - Cloud Architect
	* Nicholas Cusato - Cloud Architect
	* Olivia Maxwell - Cloud Architect
	* Graham Shroyer - Cloud Architect
	* Rachel Ogle - Cloud Architect
* **Last Updated by/Date** - Nicholas Cusato, March 2025
