# Optionally implement advanced Features

## Introduction

In all previous labs you implemented the application up to a state where it worked. At the end of lab 4, you were able to upload photos, and the APEX process invoking MLE/JavaScript extracted EXIF data from the photo (if present), stored it in a table, and presented it. In this lab you add extra features: debug output and styling.

This lab requires Oracle AI Database 26ai, Oracle APEX 26.1, and the `MLE_EXIF_ENV` environment plus all the MLE modules created in the previous lab.

Estimated time to complete: 10 minutes

### Prerequisites

Complete [Lab 4](../lab-4/lab-4.md) first before taking this lab on.

### Objectives

In this lab, you will:

- Add calls to `APEX_DEBUG` to the EXIF process
- Enable custom CSS styles for the application

## Task 1: Improve User Experience by enabling CSS in Page 2

The scaffold you started your journey with came with custom CSS classes. You can see them in page designer. Open Page 2, then left click on "Page 2: Photo Metadata Details".

Scroll down to the CSS section, then you'll see the CSS classes listed inline.

![Screenshot showing page 2 in Page Designer with inline CSS classes](./images/page-2-inline-css.png)

To enable these CSS classes in the application, you need to set HTML DOM IDs; you find them in each pag region's _advanced_ section. This screenshot shows you how to set the HTML DOM ID for the first region, _Realness Score_:

![Setting HTML DOM ID for the Realness Score region](./images/page-2-html-dom-id.png)

These are selectors to which the CSS classes attach. You need to edit these for all regions on the page accordingly:

| Region | HTML DOM ID |
| -- | -- |
| Realness Score | `realness-score` |
| Summary | `exif-details` |
| Photo | `exif-photo` |
| Map | `exif-map` |
| Google Gemini AI Analysis | `google-ai-analysis` |
| EXIF Data | `exif-data` |

Save and reload the page, you should see a distinctly different appearance.

## Task 2: Help users debug issues with the EXIF extraction process in Page 1

The EXIF extraction code you added to page 1 does the job well, but it won't help much in case something goes wrong. The original code you added previously is shown here for your convenience:

```javascript
// Load the EXIF library from the MLE environment.
const { default: exifr } = await import('exifr-module');

// get the post ID from the APEX page
const postId = apex.env.P1_ID;

// Fetch the uploaded image as a byte stream, so exifr can read it.
const photo = apex.conn.execute(
    `
    select file_blob
    from mle_data
    where id = :id
    `,
    {
        id: { val: postId }
    },
    {
        fetchInfo: {
            FILE_BLOB: {
                type: oracledb.UINT8ARRAY
            }
        }
    });

if (photo.rows.length !== 1) {
    throw new Error('no photo found on this page');
}

// Parse EXIF metadata with the JavaScript library.
const exifData = await exifr.parse(photo.rows[0].FILE_BLOB.buffer);

if (!exifData) {
    return;
}

// Store the EXIF JSON and GPS coordinates back in the database.
const updateResult = apex.conn.execute(
    `
    update mle_data
    set exif_data = :data,
        lon = :lon,
        lat = :lat
    where id = :id
    `,
    {
        data: {
            type: oracledb.DB_TYPE_JSON,
            val: exifData
        },
        lon: {
            type: oracledb.NUMBER,
            val: exifData.longitude === undefined ? null : exifData.longitude
        },
        lat: {
            type: oracledb.NUMBER,
            val: exifData.latitude === undefined ? null : exifData.latitude
        },
        id: { val: postId }
    }
);
```

If you look closely, you get errors when things go awry, but you may want to have more information available. Thankfully APEX has a facility for this, it's called `APEX_DEBUG` (🔗 [docs](https://docs.oracle.com/en/database/oracle/apex/26.1/aeapi/APEX_DEBUG.html)). It's a very useful package as it allows you to print debug messages into the standard APEX developer UI.

There is a catch though: if you wanted to call `APEX_DEBUG` in JavaScript, you'd have to use anonymous PL/SQL blocks to do that:

```javascript
// ...
apex.conn.execute(`begin apex_debug.info('Important: %s', 'some string'); end;');
// ...
```

This isn't particularly close to a native JavaScript experience. The PL/SQL Foreign Function Interface that ships with MLE since release 23.7 (plsffi) addresses this problem by allowing you to resolve packages, functions, and procedures to JavaScript variables. You can read more about the feature in the JavaScript Developer's Guide, linked in the reference section.

The above example can be rewritten using the PL/SQL Foreign Function Interface as follows:

```javascript
// variable d resolves to APEX_DEBUG. It's an object with members representing
// each function in the package.
const d = plsffi.resolvePackage('APEX_DEBUG');

// ...

d.info('Important: %s', 'some string');

// ...
```

This allows you to add a lot more detail to the process, as shown here:

```javascript
<copy>
// Load the EXIF library with help from the MLE environment.
const { default: exifr } = await import('exifr-module');

// get the post ID from the APEX page
const postId = apex.env.P1_ID;

// resolve a local variable, d, to APEX_DEBUG and all its variables
// and functions/procedures
const d = plsffi.resolvePackage('APEX_DEBUG');

// Fetch the uploaded image as a byte stream, so exifr can read it.
const photo = apex.conn.execute(
    `
    select file_blob
    from mle_data
    where id = :id
    `,
    {
        id: { val: postId }
    },
    {
        fetchInfo: {
            FILE_BLOB: {
                type: oracledb.UINT8ARRAY
            }
        }
    });

if (photo.rows.length !== 1) {
    d.info(`no photo found for id ${postId}`);
    throw new Error('no photo found on this page');
}

// Parse EXIF metadata with the JavaScript library.
const exifData = await exifr.parse(photo.rows[0].FILE_BLOB.buffer);

if (!exifData) {
    d.info(`no EXIF data found for photo id ${postId}`);
    return;
}

// Store the EXIF JSON and GPS coordinates back in the database.
const updateResult = apex.conn.execute(
    `
    update mle_data
    set exif_data = :data,
        lon = :lon,
        lat = :lat
    where id = :id
    `,
    {
        data: {
            type: oracledb.DB_TYPE_JSON,
            val: exifData
        },
        lon: {
            type: oracledb.NUMBER,
            val: exifData.longitude === undefined ? null : exifData.longitude
        },
        lat: {
            type: oracledb.NUMBER,
            val: exifData.latitude === undefined ? null : exifData.latitude
        },
        id: { val: postId }
    }
);
d.info(`${updateResult.rowsAffected} rows have been updated with ${Object.keys(exifData).length} properties`);
</copy>
```

If everything goes to plan, you shouldn't see much output after enabling debugging in your application. In the following example the final line is the only one printed in the debug output window, indicating success:

![Screenshot showing the successful completion of the insert operation](./images/debug-message.png)

Adding instrumentation to the code from the start is always a good idea.

## Review the finished Application

At this point, all the building blocks are available. The first screenshot shows the first page with the file upload dialog open:

![Page 1 as rendered in APEX](./images/page-1-final.png)

Once the photo has been uploaded, click on it to get to page 2, which presents all the EXIF metadata as well as the location where the photo was taken on the map, and the AI service's assessment.

![Page 2 with CSS applied](./images/page-2-final.png)

That's it! Thank you for completing this LiveLab, we hope you had fun doing so. Feel free to reach out with suggestions and feedback!

## Learn More

- [Oracle Database JavaScript Developer's Guide: Multilingual Engine](https://docs.oracle.com/en/database/oracle/oracle-database/26/mlejs/index.html)
- [Oracle Database JSON Developer's Guide: JSON_TABLE](https://docs.oracle.com/en/database/oracle/oracle-database/26/adjsn/json_table-sql-function.html)
- [APEX App Builder User's Guide: Page Designer](https://docs.oracle.com/en/database/oracle/apex/26.1/htmdb/page-designer.html)

## Acknowledgements

- **Author** - Martin Bach, Senior Principal Product Manager
- **Contributors** - Sonja Meyer, Consulting Member of Technical Staff
- **Last Updated By/Date** - Martin Bach, Senior Principal Product Manager, August 2026
