# Lab 7: Semantic Knowledge-Base Search with AI Vector Search

## Introduction

Keyword search finds articles that share words with the query. Semantic search finds articles that share *meaning*: in this optional lab, "laptop won't connect from hotel wifi" will find your VPN article even though they share almost no words. You'll do it entirely **in-database** — an ONNX embedding model loaded into Oracle AI Database, plain SQL to embed the articles, and a declarative APEX Search Configuration on top. No external AI calls, no extra credentials, and it works identically on the OCI GenAI and OpenAI tracks from Lab 1.

> **Before you start:** if you haven't already, extend your LiveLabs reservation now — one click on your reservation page while it is still active.

> **Glossary — embedding:** a list of numbers (a vector) representing a text's meaning; texts with similar meaning get nearby vectors, which is what makes "hotel wifi" land next to "VPN".

Estimated Time: 15 minutes

### Objectives

In this lab, you will:

* Load a text-embedding ONNX model into your database
* Embed the 30 knowledge-base articles with one SQL statement
* Create a Vector Provider and a declarative Search Configuration
* Build a search page and watch meaning beat keywords

### Prerequisites

This lab assumes you have:

* Completed Lab 2 (the `KB_ARTICLES` table exists; its `embedding` column shipped with the schema)
* **`ADMIN` access to the database** — Task 1's grants cannot be run as your workspace user
* **A way to host a ~127 MB file the database can read** — see the note in Task 2. Oracle now
  publishes its ONNX models only as zip archives, so you need an Object Storage bucket (or another
  URL the database can fetch a bare `.onnx` from)

## Task 1: Grant Model Privileges

1. Open **Database Actions** (SQL) as **ADMIN** — the password you set when creating the database — and run, replacing the schema name with your workspace schema (shown in the APEX SQL Workshop header).

    > **Your schema name is almost certainly `WKSP_` + your workspace name** — for example a workspace
    > called `HELPDESK` uses schema **`WKSP_HELPDESK`**. Autonomous Database adds that prefix when APEX
    > creates a new schema. Use the prefixed name here, exactly as SQL Workshop shows it.

    ```
    <copy>grant execute on dbms_cloud to <your-schema-name>;
    grant create mining model to <your-schema-name>;</copy>
    ```

    > **Run both statements.** In Database Actions the green ▶ button is *Run Statement* and executes only
    > the one under your cursor — use **Run Script** (or press F5) so both grants run. If you miss the
    > `dbms_cloud` grant, Task 3 fails with `PLS-00201: identifier 'DBMS_CLOUD' must be declared`, which
    > gives no hint that a grant is the cause.

    ![Database Actions SQL as ADMIN running the grants](images/admin-grants.png " ")

## Task 2: Host the Embedding Model in Your Own Bucket

You need the model file somewhere your database can fetch it over HTTPS. This takes about five minutes
and is a genuinely useful thing to know how to do.

> **Why you host it yourself.** Earlier versions of this lab loaded the model straight from an
> Oracle public bucket. That link no longer works (verified 2026-08-31): the pre-authenticated
> request expired *and* Oracle moved the models to a bucket where **only `_augmented.zip` archives
> are published**. The database cannot unzip, and `DBMS_VECTOR` has no cloud loader, so it is not
> fixable by swapping the URL — you download the archive, unzip it, and host the bare `.onnx`.

1. **Get the model.** Open
    `https://docs.oracle.com/pls/topic/lookup?ctx=en/database/oracle/oracle-database/26/vecse&id=oml_ai_models_object_storage`
    — a stable Oracle link that always redirects to the current *Machine Learning AI models* page — and
    download **`all_MiniLM_L12_v2_augmented.zip`** (~117 MB).

2. **Unzip it.** You want the bare **`all_MiniLM_L12_v2.onnx`** (~127 MB). The zip also contains a LICENSE
    and README you do not need.

3. **Create a bucket.** OCI Console > **Storage** > **Buckets** > **Create bucket**. Any name will do —
    `workshop-models` is used here. Leave it **Private**; the pre-authenticated request in the next step is
    what grants access.

4. **Upload the `.onnx`** into the bucket with **Upload objects**.

5. **Create a pre-authenticated request.** On the object's **⋯** menu choose
    **Create Pre-Authenticated Request**, and keep the defaults: target **Object**, access
    **Permit object reads**. That is least privilege — it grants read on this one file and nothing else.
    Copy the URL when it appears.

    > **⚠️ Treat that URL as a credential.** A pre-authenticated request is a *bearer* token: anyone who
    > has the link can read the object until it expires, with no sign-in. Do not paste it into chats,
    > tickets, screenshots, or source control. Note the console's own warning that the URL is shown
    > **once** and cannot be retrieved later — if you lose it, delete the request and create a new one.

## Task 3: Load the Embedding Model

1. Back in APEX, in **SQL Workshop > SQL Commands**, load the model into your schema.
    Replace `<your-par-url>` with the pre-authenticated request URL you copied in Task 2:

    ```
    <copy>begin
      dbms_vector.load_onnx_model(
        model_name => 'minilm_l12',
        model_data => dbms_cloud.get_object(
                        credential_name => null,
                        object_uri      => '<your-par-url>'),
        metadata   => json('{"function":"embedding","embeddingOutput":"embedding","input":{"input":["data"]}}')
      );
    end;</copy>
    ```

    Loading takes about twenty seconds.

    > **You will see new `DM$P…MINILM_L12` tables appear in Object Browser.** Loading an ONNX model
    > creates four of them in your schema to hold the model itself. They are Oracle-managed metadata,
    > not clutter from a failed run — leave them alone. They disappear if you drop the model with
    > `dbms_vector.drop_onnx_model(model_name => 'minilm_l12');`.

    ![LOAD_ONNX_MODEL run in SQL Commands](images/load-onnx.png " ")

## Task 4: Embed the Knowledge Base — One SQL Statement

1. Run [embed-kb.sql](files/embed-kb.sql):

    ```
    <copy>update kb_articles
       set embedding = vector_embedding(minilm_l12 using title || ' ' || content as data);

    commit;

    select count(*) as embedded from kb_articles where embedding is not null;</copy>
    ```

    > **Run the three statements one at a time.** SQL Commands executes a single statement per **Run**;
    > pasting all three at once fails with `ORA-03405: End of query reached; no additional text should
    > follow.` Run the `update`, then `commit`, then the `select`. (Or paste all three into a script under
    > **SQL Workshop > SQL Scripts** and run it there — scripts do handle multiple statements.)

    Expected result: **30**. That's the entire embedding pipeline — one SQL function, running next to your data. Nothing left the database.

## Task 5: Create the Vector Provider and Search Configuration

1. Navigate to **App Builder > Workspace Utilities > Vector Providers**, click **Create**, and enter/select:

    * Provider Type: **Database ONNX Model**
    * Name: **KB MiniLM** — Static ID: **kb\_minilm**

        > **⚠️ The Static ID auto-fills from the Name, and it uses a hyphen** — typing `KB MiniLM` gives
        > you `kb-minilm`. Overwrite it with the underscore form before you click Create, exactly as in
        > Lab 1.
    * ONNX Model Owner: **your workspace schema** — for example `WKSP_HELPDESK` — and ONNX Model Name: **MINILM\_L12**

        > **⚠️ Do not leave the owner on "- Current Parsing Schema -".** With that setting, ONNX Model
        > Name stays a popup search box that returns no rows however you search, and you cannot pick the
        > model. Selecting the schema explicitly turns ONNX Model Name into a select list with
        > `MINILM_L12` in it.

    ![Vector Provider configuration](images/vector-provider.png " ")

2. In your app's **Shared Components**, under **Navigation and Search**, select **Search Configurations**, click **Create**, and enter/select:

    * Name: **KB Semantic Search**
    * Search Type: **Oracle AI Vector Search**
    * Vector Provider: **KB MiniLM** (it embeds the user's query at runtime)
    * Source: table **KB\_ARTICLES**, vector column **EMBEDDING**
    * Title Column: **TITLE** — Description Column: **CONTENT**

    ![Search Configuration with Oracle Vector Search type](images/search-config.png " ")

## Task 6: Build the Search Page and Beat Keywords

1. **Create Page**, switch to the **Component** tab (the dialog opens on whichever tab you used last — often *Generative AI*), choose **Search Page**, name it **Ask the Knowledge Base**, and include the **KB Semantic Search** configuration.

2. Run the page and search:

    ```
    <copy>email box is jammed</copy>
    ```

    **`Mailbox is full: fixing email quota issues` comes back first — and not one word of your query
    appears in it.** No keyword search can do that.

    Try the other two and watch the same thing happen:

    ```
    <copy>screen keeps blinking</copy>
    ```

    ```
    <copy>laptop won't connect from hotel wifi</copy>
    ```

    > **Measured on this data set** (cosine distance, lower is closer): `email box is jammed` →
    > *Mailbox is full* at **0.467**; `screen keeps blinking` → *Monitor flickers or goes black
    > intermittently* at **0.420**; `laptop won't connect from hotel wifi` → *Connecting on public or
    > hotel Wi-Fi (captive portals)* at **0.487**. Your numbers should be close to these.

    > **Why not just search for "VPN error 812"?** You can, and it works — but that is keyword overlap
    > doing the job, not meaning. The queries above are the honest demonstration, because the winning
    > article shares no words with what you typed.

    ![Semantic search results for the hotel wifi query](images/semantic-results.png " ")

## Go Further (optional)

* Compare with a plain **Standard** search configuration on the same table — run the hotel-wifi query in both and note the difference.
* Ask the APEX Assistant to write a SQL query using `vector_distance()` to find the 3 nearest articles to a phrase — review it, then run it (the Lab 2 habit, one last time).

## Task 7: Tear Down the Model Hosting

The bucket and its pre-authenticated request exist only to get the model into the database. The model now
lives *inside* your schema, so nothing downstream needs them.

1. Delete the **pre-authenticated request** on the object. This is the important one — it is a bearer
    credential, and leaving it alive means the link keeps working for anyone who has it.
2. Delete the **`all_MiniLM_L12_v2.onnx` object**, and the bucket if you created it only for this lab.

Your embeddings, the `MINILM_L12` model, the Vector Provider, and the search page all keep working —
verify with a search after deleting, if you like.

> **Why this is a habit worth having:** a forgotten read-PAR on a forgotten bucket is one of the more
> common ways cloud data leaks quietly. Clean up the credential the moment it has done its job.

You may now **proceed to the next lab**.

## Learn More

* [AI Vector Search in Oracle APEX](https://www.oracle.com/artificial-intelligence/ai-vector-search-in-apex/)

## Acknowledgements

* **Author** - Rick Houlihan
* **Last Updated By/Date** - Rick Houlihan, August 2026
