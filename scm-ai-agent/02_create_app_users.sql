  CREATE TABLE "SCM_WAREHOUSES" 
   (	"WAREHOUSE_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the warehouse.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Warehouse ID', "SEMANTIC_TYPE" 'identifier'), 
	"WAREHOUSE_CODE" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business code used to identify the warehouse.', "DISPLAY_LABEL" 'Warehouse Code', "SEMANTIC_TYPE" 'code', "VALUE_REQUIRED" 'true'), 
	"WAREHOUSE_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business name of the warehouse.', "DISPLAY_LABEL" 'Warehouse Name', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'name', "VALUE_REQUIRED" 'true'), 
	"WAREHOUSE_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'ACTIVE' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include ACTIVE, INACTIVE, BLOCKED.', "DESCRIPTION" 'Current operating status of the warehouse.', "DISPLAY_LABEL" 'Warehouse Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"ADDRESS_LINE_1" VARCHAR2(200 CHAR) ANNOTATIONS("DESCRIPTION" 'First address line of the warehouse.', "DISPLAY_LABEL" 'Address Line 1', "SEMANTIC_TYPE" 'street_address', "VALUE_REQUIRED" 'true'), 
	"ADDRESS_LINE_2" VARCHAR2(200 CHAR) ANNOTATIONS("DESCRIPTION" 'Second address line of the warehouse.', "DISPLAY_LABEL" 'Address Line 2', "SEMANTIC_TYPE" 'street_address'), 
	"CITY_NAME" VARCHAR2(100 CHAR) ANNOTATIONS("DESCRIPTION" 'City or town of the warehouse.', "DISPLAY_LABEL" 'City Name', "SEMANTIC_TYPE" 'city', "VALUE_REQUIRED" 'true'), 
	"STATE_REGION_NAME" VARCHAR2(100 CHAR) ANNOTATIONS("DESCRIPTION" 'State, province, or region of the warehouse.', "DISPLAY_LABEL" 'State or Region Name', "SEMANTIC_TYPE" 'region'), 
	"POSTAL_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Postal or zip code of the warehouse.', "DISPLAY_LABEL" 'Postal Code', "SEMANTIC_TYPE" 'postal_code'), 
	"COUNTRY_CODE" VARCHAR2(2 CHAR) ANNOTATIONS("DESCRIPTION" 'Two-character country code of the warehouse address.', "DISPLAY_LABEL" 'Country Code', "SEMANTIC_TYPE" 'country_code', "VALUE_REQUIRED" 'true'), 
	"WAREHOUSE_GEOMETRY" "MDSYS"."SDO_GEOMETRY"  ANNOTATIONS("DESCRIPTION" 'Point geometry for the warehouse using WGS 84 longitude and latitude.', "DISPLAY_LABEL" 'Warehouse Geometry', "SEMANTIC_TYPE" 'geometry'), 
	"CREATED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT systimestamp NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Date and time when the warehouse record was created.', "DISPLAY_IN_FORM" 'false', "DISPLAY_LABEL" 'Created At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"CREATED_BY" VARCHAR2(128 CHAR) DEFAULT sys_context('USERENV','SESSION_USER') NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Database user that created the warehouse record.', "DISPLAY_IN_FORM" 'false', "DISPLAY_LABEL" 'Created By', "SEMANTIC_TYPE" 'user_name'), 
	 CONSTRAINT "CK_SCM_WAREHOUSES_01" CHECK (warehouse_status_code in ('ACTIVE', 'INACTIVE', 'BLOCKED')) ENABLE, 
	 CONSTRAINT "PK_SCM_WAREHOUSES" PRIMARY KEY ("WAREHOUSE_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_WAREHOUSES_01" UNIQUE ("WAREHOUSE_CODE")
  USING INDEX  ENABLE
   ) 
 VARRAY "WAREHOUSE_GEOMETRY"."SDO_ELEM_INFO" STORE AS SECUREFILE LOB 
 VARRAY "WAREHOUSE_GEOMETRY"."SDO_ORDINATES" STORE AS SECUREFILE LOB 
  ANNOTATIONS("DESCRIPTION" 'Stores records for warehouses.', "DISPLAY_LABEL" 'Warehouses') ;

  CREATE TABLE "SCM_APPLICATION_USERS" 
   (	"APPLICATION_USER_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the application user.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Application User ID', "SEMANTIC_TYPE" 'identifier'), 
	"USER_NAME" VARCHAR2(128 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business user name used to sign in and record work.', "DISPLAY_LABEL" 'User Name', "SEMANTIC_TYPE" 'user_name', "VALUE_REQUIRED" 'true'), 
	"FULL_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Full business name of the user.', "DISPLAY_LABEL" 'Full Name', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'name', "VALUE_REQUIRED" 'true'), 
	"EMAIL_ADDRESS" VARCHAR2(320 CHAR) ANNOTATIONS("DESCRIPTION" 'Business email address used for alerts and workflow notices.', "DISPLAY_LABEL" 'Email Address', "SEMANTIC_TYPE" 'email_address'), 
	"USER_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'ACTIVE' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include ACTIVE, INACTIVE, LOCKED.', "DESCRIPTION" 'Current business status of the user.', "DISPLAY_LABEL" 'User Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"DEFAULT_WAREHOUSE_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Default warehouse used for the user where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Default Warehouse ID', "SEMANTIC_TYPE" 'identifier'), 
	"MANAGER_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'User that supervises this user where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Manager User ID', "SEMANTIC_TYPE" 'identifier'), 
	"USER_NOTES" VARCHAR2(500 CHAR) ANNOTATIONS("DESCRIPTION" 'Business notes for the user.', "DISPLAY_LABEL" 'User Notes', "SEMANTIC_TYPE" 'comment'), 
	 CONSTRAINT "CK_SCM_APPLICATION_USERS_01" CHECK (user_status_code in ('ACTIVE', 'INACTIVE', 'LOCKED')) ENABLE, 
	 CONSTRAINT "PK_SCM_APPLICATION_USERS" PRIMARY KEY ("APPLICATION_USER_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_APPLICATION_USERS_01" UNIQUE ("USER_NAME")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for application users.', "DISPLAY_LABEL" 'Application Users') ;

  CREATE TABLE "SCM_BUSINESS_LISTS" 
   (	"BUSINESS_LIST_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the business list.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Business List ID', "SEMANTIC_TYPE" 'identifier'), 
	"LIST_CODE" VARCHAR2(50 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business code used to identify the list.', "DISPLAY_LABEL" 'List Code', "SEMANTIC_TYPE" 'code', "VALUE_REQUIRED" 'true'), 
	"LIST_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business name of the list.', "DISPLAY_LABEL" 'List Name', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'name', "VALUE_REQUIRED" 'true'), 
	"LIST_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'ACTIVE' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include ACTIVE, INACTIVE.', "DESCRIPTION" 'Current business status of the list.', "DISPLAY_LABEL" 'List Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	 CONSTRAINT "CK_SCM_BUSINESS_LISTS_01" CHECK (list_status_code in ('ACTIVE', 'INACTIVE')) ENABLE, 
	 CONSTRAINT "PK_SCM_BUSINESS_LISTS" PRIMARY KEY ("BUSINESS_LIST_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_BUSINESS_LISTS_01" UNIQUE ("LIST_CODE")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for business lists.', "DISPLAY_LABEL" 'Business Lists') ;

  CREATE TABLE "SCM_BUSINESS_LIST_VALUES" 
   (	"BUSINESS_LIST_VALUE_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the business list value.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Business List Value ID', "SEMANTIC_TYPE" 'identifier'), 
	"BUSINESS_LIST_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business list that the value belongs to.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Business List ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"VALUE_CODE" VARCHAR2(50 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business code used to identify the value.', "DISPLAY_LABEL" 'Value Code', "SEMANTIC_TYPE" 'code', "VALUE_REQUIRED" 'true'), 
	"VALUE_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business name of the list value.', "DISPLAY_LABEL" 'Value Name', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'name', "VALUE_REQUIRED" 'true'), 
	"DISPLAY_SEQUENCE" NUMBER(10,0) DEFAULT 10 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Display order of the list value.', "DISPLAY_LABEL" 'Display Sequence', "SEMANTIC_TYPE" 'sequence'), 
	"IS_ACTIVE" BOOLEAN DEFAULT true NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the list value is active.', "DISPLAY_LABEL" 'Is Active', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'flag'), 
	 CONSTRAINT "PK_SCM_BUSINESS_LIST_VALUES" PRIMARY KEY ("BUSINESS_LIST_VALUE_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_BUSINESS_LIST_VALUES_01" UNIQUE ("BUSINESS_LIST_ID", "VALUE_CODE")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for business list values.', "DISPLAY_LABEL" 'Business List Values') ;

  CREATE TABLE "SCM_BUSINESS_PARTNERS" 
   (	"BUSINESS_PARTNER_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the business partner.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Business Partner ID', "SEMANTIC_TYPE" 'identifier'), 
	"PARTNER_NUMBER" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reference used to identify the supplier, customer, carrier, or internal partner.', "DISPLAY_LABEL" 'Partner Number', "SEMANTIC_TYPE" 'reference_number', "VALUE_REQUIRED" 'true'), 
	"PARTNER_TYPE_CODE" VARCHAR2(20 CHAR) NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include SUPPLIER, CUSTOMER, CARRIER, INTERNAL.', "DESCRIPTION" 'Business role of the partner within the inventory and warehouse process.', "DISPLAY_LABEL" 'Partner Type', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'type', "VALUE_REQUIRED" 'true'), 
	"PARTNER_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Full business name of the partner.', "DISPLAY_LABEL" 'Partner Name', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'name', "VALUE_REQUIRED" 'true'), 
	"PARTNER_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'ACTIVE' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include ACTIVE, INACTIVE, ON_HOLD.', "DESCRIPTION" 'Current business status of the partner record.', "DISPLAY_LABEL" 'Partner Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"CREATED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT systimestamp NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Date and time when the partner record was created.', "DISPLAY_IN_FORM" 'false', "DISPLAY_LABEL" 'Created At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"CREATED_BY" VARCHAR2(128 CHAR) DEFAULT sys_context('USERENV','SESSION_USER') NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Database user that created the partner record.', "DISPLAY_IN_FORM" 'false', "DISPLAY_LABEL" 'Created By', "SEMANTIC_TYPE" 'user_name'), 
	 CONSTRAINT "CK_SCM_BUSINESS_PARTNERS_01" CHECK (partner_type_code in ('SUPPLIER', 'CUSTOMER', 'CARRIER', 'INTERNAL')) ENABLE, 
	 CONSTRAINT "CK_SCM_BUSINESS_PARTNERS_02" CHECK (partner_status_code in ('ACTIVE', 'INACTIVE', 'ON_HOLD')) ENABLE, 
	 CONSTRAINT "PK_SCM_BUSINESS_PARTNERS" PRIMARY KEY ("BUSINESS_PARTNER_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_BUSINESS_PARTNERS_01" UNIQUE ("PARTNER_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for business partners.', "DISPLAY_LABEL" 'Business Partners') ;

  CREATE TABLE "SCM_INBOUND_RECEIPTS" 
   (	"INBOUND_RECEIPT_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the inbound receipt.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Inbound Receipt ID', "SEMANTIC_TYPE" 'identifier'), 
	"RECEIPT_NUMBER" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reference used to identify the inbound receipt.', "DISPLAY_LABEL" 'Receipt Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'reference_number', "VALUE_REQUIRED" 'true'), 
	"RECEIPT_SOURCE_CODE" VARCHAR2(20 CHAR) NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include SUPPLIER, TRANSFER, CUSTOMER_RETURN, INTERNAL_RETURN, OTHER.', "DESCRIPTION" 'Business source of the inbound receipt.', "DISPLAY_LABEL" 'Receipt Source', "SEMANTIC_TYPE" 'source', "VALUE_REQUIRED" 'true'), 
	"WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Warehouse receiving the goods.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"SOURCE_PARTNER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Partner that sent the goods where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Source Partner ID', "SEMANTIC_TYPE" 'identifier'), 
	"SOURCE_SITE_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Site that sent the goods where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Source Site ID', "SEMANTIC_TYPE" 'identifier'), 
	"ASSIGNED_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user assigned to work on the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Assigned User ID', "SEMANTIC_TYPE" 'identifier'), 
	"RECEIPT_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'PLANNED' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include PLANNED, ARRIVED, PART_RECEIVED, RECEIVED, REVIEW_REQUIRED, CANCELLED, CLOSED.', "DESCRIPTION" 'Current business status of the inbound receipt.', "DISPLAY_LABEL" 'Receipt Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"REVIEW_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'OPEN' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include OPEN, REVIEW_REQUIRED, APPROVED, REJECTED, RESOLVED.', "DESCRIPTION" 'Current review status of the record.', "DISPLAY_LABEL" 'Review Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"SOURCE_DOCUMENT_NUMBER" VARCHAR2(50 CHAR) ANNOTATIONS("DESCRIPTION" 'Business reference number from the source document such as purchase order or transfer.', "DISPLAY_LABEL" 'Source Document Number', "SEMANTIC_TYPE" 'reference_number'), 
	"EXPECTED_ARRIVAL_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Expected arrival date and time for the receipt.', "DISPLAY_LABEL" 'Expected Arrival At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"ACTUAL_ARRIVAL_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Actual arrival date and time for the receipt.', "DISPLAY_LABEL" 'Actual Arrival At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"RECEIVING_COMPLETED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when receiving was completed.', "DISPLAY_LABEL" 'Receiving Completed At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"RECEIVED_BY" VARCHAR2(128 CHAR) ANNOTATIONS("DESCRIPTION" 'User who completed receipt of the goods.', "DISPLAY_LABEL" 'Received By', "SEMANTIC_TYPE" 'user_name'), 
	"RECEIVED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who received the goods for the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Received By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"REVIEWED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who reviewed the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Reviewed By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"REVIEWED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the record was reviewed.', "DISPLAY_LABEL" 'Reviewed At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"REVIEW_REASON_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Reason code that explains the review outcome or exception handling decision.', "DISPLAY_LABEL" 'Review Reason Code', "SEMANTIC_TYPE" 'reason'), 
	"NOTES" VARCHAR2(1000 CHAR) ANNOTATIONS("DESCRIPTION" 'Business notes for the inbound receipt.', "DISPLAY_LABEL" 'Notes', "SEMANTIC_TYPE" 'comment'), 
	 CONSTRAINT "CK_SCM_INBOUND_RECEIPTS_01" CHECK (receipt_source_code in ('SUPPLIER', 'TRANSFER', 'CUSTOMER_RETURN', 'INTERNAL_RETURN', 'OTHER')) ENABLE, 
	 CONSTRAINT "CK_SCM_INBOUND_RECEIPTS_02" CHECK (receipt_status_code in ('PLANNED', 'ARRIVED', 'PART_RECEIVED', 'RECEIVED', 'REVIEW_REQUIRED', 'CANCELLED', 'CLOSED')) ENABLE, 
	 CONSTRAINT "CK_SCM_INBOUND_RECEIPTS_03" CHECK (review_status_code in ('OPEN', 'REVIEW_REQUIRED', 'APPROVED', 'REJECTED', 'RESOLVED')) ENABLE, 
	 CONSTRAINT "PK_SCM_INBOUND_RECEIPTS" PRIMARY KEY ("INBOUND_RECEIPT_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_INBOUND_RECEIPTS_01" UNIQUE ("RECEIPT_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for inbound receipts.', "DISPLAY_LABEL" 'Inbound Receipts') ;

  CREATE TABLE "SCM_INBOUND_RECEIPT_LINES" 
   (	"INBOUND_RECEIPT_LINE_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the inbound receipt line.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Inbound Receipt Line ID', "SEMANTIC_TYPE" 'identifier'), 
	"INBOUND_RECEIPT_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Inbound receipt that the line belongs to.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Inbound Receipt ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"LINE_NUMBER" NUMBER(10,0) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Line number within the inbound receipt.', "DISPLAY_LABEL" 'Line Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'sequence', "VALUE_REQUIRED" 'true'), 
	"ITEM_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Item expected or received on the line.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"INVENTORY_LOT_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Lot associated with the receipt line where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Inventory Lot ID', "SEMANTIC_TYPE" 'identifier'), 
	"RECEIVING_LOCATION_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Initial location where goods were placed on arrival.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Receiving Location ID', "SEMANTIC_TYPE" 'identifier'), 
	"FINAL_PUTAWAY_LOCATION_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Final storage location used after putaway.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Final Putaway Location ID', "SEMANTIC_TYPE" 'identifier'), 
	"EXPECTED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity expected to arrive on the line.', "DISPLAY_LABEL" 'Expected Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"RECEIVED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity physically received on the line.', "DISPLAY_LABEL" 'Received Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"ACCEPTED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity accepted into warehouse control.', "DISPLAY_LABEL" 'Accepted Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"QUARANTINE_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity sent to quarantine from the receipt line.', "DISPLAY_LABEL" 'Quarantine Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"DAMAGED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity identified as damaged on the receipt line.', "DISPLAY_LABEL" 'Damaged Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"SHORTAGE_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity short against the expected quantity.', "DISPLAY_LABEL" 'Shortage Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"OVERAGE_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity received above the expected quantity.', "DISPLAY_LABEL" 'Overage Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"REJECTED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity rejected back to the source or refused at the receipt point.', "DISPLAY_LABEL" 'Rejected Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"RECEIVED_CONDITION_CODE" VARCHAR2(20 CHAR) DEFAULT 'GOOD' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include GOOD, DAMAGED, SUSPECT, MISMATCH, SHORT, OVER.', "DESCRIPTION" 'Condition of the goods received on the line.', "DISPLAY_LABEL" 'Received Condition', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'condition'), 
	"LINE_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'OPEN' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include OPEN, PART_RECEIVED, RECEIVED, REVIEW_REQUIRED, CLOSED.', "DESCRIPTION" 'Current business status of the receipt line.', "DISPLAY_LABEL" 'Line Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"DISCREPANCY_REASON_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Reason code for a receipt discrepancy where relevant.', "DISPLAY_LABEL" 'Discrepancy Reason Code', "SEMANTIC_TYPE" 'reason_code'), 
	 CONSTRAINT "CK_SCM_INBOUND_RECEIPT_LINES_01" CHECK (received_condition_code in ('GOOD', 'DAMAGED', 'SUSPECT', 'MISMATCH', 'SHORT', 'OVER')) ENABLE, 
	 CONSTRAINT "CK_SCM_INBOUND_RECEIPT_LINES_02" CHECK (line_status_code in ('OPEN', 'PART_RECEIVED', 'RECEIVED', 'REVIEW_REQUIRED', 'CLOSED')) ENABLE, 
	 CONSTRAINT "CK_SCM_INBOUND_RECEIPT_LINES_03" CHECK ( 
        expected_quantity >= 0 
        and received_quantity >= 0 
        and accepted_quantity >= 0 
        and quarantine_quantity >= 0 
        and damaged_quantity >= 0 
        and shortage_quantity >= 0 
        and overage_quantity >= 0 
        and rejected_quantity >= 0 
    ) ENABLE, 
	 CONSTRAINT "PK_SCM_INBOUND_RECEIPT_LINES" PRIMARY KEY ("INBOUND_RECEIPT_LINE_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_INBOUND_RECEIPT_LINES_01" UNIQUE ("INBOUND_RECEIPT_ID", "LINE_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for inbound receipt lines.', "DISPLAY_LABEL" 'Inbound Receipt Lines') ;

  CREATE TABLE "SCM_INVENTORY_BALANCES" 
   (	"INVENTORY_BALANCE_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the inventory balance row.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Inventory Balance ID', "SEMANTIC_TYPE" 'identifier'), 
	"WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Reference to the warehouse.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"STORAGE_LOCATION_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Location where the stock is currently held.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Storage Location ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"ITEM_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Item held in the location.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"INVENTORY_LOT_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Lot associated with the stock where lot control applies.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Inventory Lot ID', "SEMANTIC_TYPE" 'identifier'), 
	"STOCK_STATUS_CODE" VARCHAR2(20 CHAR) NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include AVAILABLE, RESERVED, PICKED, PACKED, IN_TRANSIT, QUARANTINE, DAMAGED, BLOCKED.', "DESCRIPTION" 'Business status of the stock held in the location.', "DISPLAY_LABEL" 'Stock Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status', "VALUE_REQUIRED" 'true'), 
	"QUANTITY_ON_HAND" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Physical quantity currently held in the location.', "DISPLAY_LABEL" 'Quantity On Hand', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"QUANTITY_RESERVED" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity already reserved for outbound demand.', "DISPLAY_LABEL" 'Quantity Reserved', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"QUANTITY_AVAILABLE" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Usable quantity remaining after reservation for available stock.', "DISPLAY_IN_FORM" 'false', "DISPLAY_LABEL" 'Quantity Available', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"LAST_COUNTED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when this stock balance was last physically counted.', "DISPLAY_LABEL" 'Last Counted At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"LAST_MOVED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when this stock balance last changed location or quantity.', "DISPLAY_LABEL" 'Last Moved At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	 CONSTRAINT "CK_SCM_INVENTORY_BALANCES_01" CHECK (stock_status_code in ('AVAILABLE', 'RESERVED', 'PICKED', 'PACKED', 'IN_TRANSIT', 'QUARANTINE', 'DAMAGED', 'BLOCKED')) ENABLE, 
	 CONSTRAINT "CK_SCM_INVENTORY_BALANCES_02" CHECK (quantity_on_hand >= 0 and quantity_reserved >= 0 and quantity_available >= 0) ENABLE, 
	 CONSTRAINT "PK_SCM_INVENTORY_BALANCES" PRIMARY KEY ("INVENTORY_BALANCE_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_INVENTORY_BALANCES_01" UNIQUE ("WAREHOUSE_ID", "STORAGE_LOCATION_ID", "ITEM_ID", "INVENTORY_LOT_ID", "STOCK_STATUS_CODE")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for inventory balances.', "DISPLAY_LABEL" 'Inventory Balances') ;

  CREATE TABLE "SCM_INVENTORY_LOTS" 
   (	"INVENTORY_LOT_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the inventory lot or batch.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Inventory Lot ID', "SEMANTIC_TYPE" 'identifier'), 
	"ITEM_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Item that the lot belongs to.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"LOT_NUMBER" VARCHAR2(80 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business lot or batch number used to track the item group.', "DISPLAY_LABEL" 'Lot Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'reference_number', "VALUE_REQUIRED" 'true'), 
	"SUPPLIER_LOT_NUMBER" VARCHAR2(80 CHAR) ANNOTATIONS("DESCRIPTION" 'Supplier-provided lot or batch number where this differs from the internal lot number.', "DISPLAY_LABEL" 'Supplier Lot Number', "SEMANTIC_TYPE" 'reference_number'), 
	"RECEIVED_ON_DATE" DATE ANNOTATIONS("DESCRIPTION" 'Date when the lot was first received into warehouse control.', "DISPLAY_LABEL" 'Received On Date', "FORMAT_MASK" 'DD-MON-YYYY', "SEMANTIC_TYPE" 'date'), 
	"BEST_BEFORE_DATE" DATE ANNOTATIONS("DESCRIPTION" 'Best-before date for the lot where relevant.', "DISPLAY_LABEL" 'Best Before Date', "FORMAT_MASK" 'DD-MON-YYYY', "SEMANTIC_TYPE" 'date'), 
	"EXPIRY_ON_DATE" DATE ANNOTATIONS("DESCRIPTION" 'Expiry date for the lot where relevant.', "DISPLAY_LABEL" 'Expiry On Date', "FORMAT_MASK" 'DD-MON-YYYY', "SEMANTIC_TYPE" 'date'), 
	"LOT_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'ACTIVE' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include ACTIVE, HOLD, EXPIRED, CLOSED.', "DESCRIPTION" 'Current business status of the lot.', "DISPLAY_LABEL" 'Lot Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	 CONSTRAINT "CK_SCM_INVENTORY_LOTS_01" CHECK (lot_status_code in ('ACTIVE', 'HOLD', 'EXPIRED', 'CLOSED')) ENABLE, 
	 CONSTRAINT "PK_SCM_INVENTORY_LOTS" PRIMARY KEY ("INVENTORY_LOT_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_INVENTORY_LOTS_01" UNIQUE ("ITEM_ID", "LOT_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for inventory lots.', "DISPLAY_LABEL" 'Inventory Lots') ;

  CREATE TABLE "SCM_ITEMS" 
   (	"ITEM_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the inventory item.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Item ID', "SEMANTIC_TYPE" 'identifier'), 
	"ITEM_CODE" VARCHAR2(50 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business code used to identify the inventory item.', "DISPLAY_LABEL" 'Item Code', "SEMANTIC_TYPE" 'code', "VALUE_REQUIRED" 'true'), 
	"ITEM_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business name of the inventory item.', "DISPLAY_LABEL" 'Item Name', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'name', "VALUE_REQUIRED" 'true'), 
	"ITEM_DESCRIPTION" VARCHAR2(1000 CHAR) ANNOTATIONS("DESCRIPTION" 'Business description of the inventory item.', "DISPLAY_LABEL" 'Item Description', "SEMANTIC_TYPE" 'description'), 
	"ITEM_CATEGORY_CODE" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business category of the item.', "DISPLAY_LABEL" 'Item Category', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'category', "VALUE_REQUIRED" 'true'), 
	"BASE_UOM_CODE" VARCHAR2(10 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Default unit of measure used for inventory quantities.', "DISPLAY_LABEL" 'Base Unit of Measure', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'unit_of_measure', "VALUE_REQUIRED" 'true'), 
	"ITEM_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'ACTIVE' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include ACTIVE, INACTIVE, BLOCKED.', "DESCRIPTION" 'Current business status of the item.', "DISPLAY_LABEL" 'Item Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"LOT_CONTROL_FLAG" BOOLEAN DEFAULT false NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the item must be tracked by lot or batch.', "DISPLAY_LABEL" 'Lot Control Flag', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'flag'), 
	"SERIAL_CONTROL_FLAG" BOOLEAN DEFAULT false NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the item must be tracked by serial number.', "DISPLAY_LABEL" 'Serial Control Flag', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'flag'), 
	"EXPIRY_CONTROL_FLAG" BOOLEAN DEFAULT false NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the item requires expiry or best-before tracking.', "DISPLAY_LABEL" 'Expiry Control Flag', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'flag'), 
	"FRAGILE_FLAG" BOOLEAN DEFAULT false NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the item needs fragile handling.', "DISPLAY_LABEL" 'Fragile Flag', "SEMANTIC_TYPE" 'flag'), 
	"HIGH_VALUE_FLAG" BOOLEAN DEFAULT false NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the item should be treated as high value inventory.', "DISPLAY_LABEL" 'High Value Flag', "SEMANTIC_TYPE" 'flag'), 
	"HAZARDOUS_FLAG" BOOLEAN DEFAULT false NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the item needs hazardous handling controls.', "DISPLAY_LABEL" 'Hazardous Flag', "SEMANTIC_TYPE" 'flag'), 
	"TEMPERATURE_CONTROL_FLAG" BOOLEAN DEFAULT false NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the item needs temperature-controlled handling.', "DISPLAY_LABEL" 'Temperature Control Flag', "SEMANTIC_TYPE" 'flag'), 
	"RESTRICTED_ITEM_FLAG" BOOLEAN DEFAULT false NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the item requires restricted storage or controlled release.', "DISPLAY_LABEL" 'Restricted Item Flag', "SEMANTIC_TYPE" 'flag'), 
	"OWNER_CUSTOMER_PARTNER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Customer that owns the item where the stock is customer-owned or consigned.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Owner Customer Partner ID', "SEMANTIC_TYPE" 'identifier'), 
	"CREATED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT systimestamp NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Date and time when the item record was created.', "DISPLAY_IN_FORM" 'false', "DISPLAY_LABEL" 'Created At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"CREATED_BY" VARCHAR2(128 CHAR) DEFAULT sys_context('USERENV','SESSION_USER') NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Database user that created the item record.', "DISPLAY_IN_FORM" 'false', "DISPLAY_LABEL" 'Created By', "SEMANTIC_TYPE" 'user_name'), 
	 CONSTRAINT "CK_SCM_ITEMS_01" CHECK (item_status_code in ('ACTIVE', 'INACTIVE', 'BLOCKED')) ENABLE, 
	 CONSTRAINT "PK_SCM_ITEMS" PRIMARY KEY ("ITEM_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_ITEMS_01" UNIQUE ("ITEM_CODE")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for items.', "DISPLAY_LABEL" 'Items') ;

  CREATE TABLE "SCM_ITEM_SERIALS" 
   (	"ITEM_SERIAL_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the tracked serial number.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Item Serial ID', "SEMANTIC_TYPE" 'identifier'), 
	"ITEM_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Item that the serial number belongs to.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"SERIAL_NUMBER" VARCHAR2(100 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business serial number used to track one individual item.', "DISPLAY_LABEL" 'Serial Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'reference_number', "VALUE_REQUIRED" 'true'), 
	"INVENTORY_LOT_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Lot linked to the serial number where both controls apply.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Inventory Lot ID', "SEMANTIC_TYPE" 'identifier'), 
	"CURRENT_WAREHOUSE_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Warehouse currently responsible for the serial number where it remains under warehouse control.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Current Warehouse ID', "SEMANTIC_TYPE" 'identifier'), 
	"CURRENT_STORAGE_LOCATION_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Current location of the serial number where it remains in warehouse stock.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Current Storage Location ID', "SEMANTIC_TYPE" 'identifier'), 
	"CURRENT_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'AVAILABLE' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include AVAILABLE, RESERVED, PICKED, PACKED, IN_TRANSIT, QUARANTINE, DAMAGED, BLOCKED, SHIPPED, WRITTEN_OFF.', "DESCRIPTION" 'Current business status of the serial number.', "DISPLAY_LABEL" 'Current Status Code', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"SERIAL_CONDITION_CODE" VARCHAR2(20 CHAR) DEFAULT 'GOOD' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include GOOD, DAMAGED, SUSPECT, EXPIRED.', "DESCRIPTION" 'Current condition of the serial controlled item.', "DISPLAY_LABEL" 'Serial Condition Code', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'condition'), 
	"LAST_DOCUMENT_TYPE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Business document type linked to the most recent serial movement.', "DISPLAY_LABEL" 'Last Document Type', "SEMANTIC_TYPE" 'type'), 
	"LAST_DOCUMENT_NUMBER" VARCHAR2(50 CHAR) ANNOTATIONS("DESCRIPTION" 'Business document number linked to the most recent serial movement.', "DISPLAY_LABEL" 'Last Document Number', "SEMANTIC_TYPE" 'reference_number'), 
	"RECEIVED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the serial number was first received.', "DISPLAY_LABEL" 'Received At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"LAST_MOVED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the serial number last changed status or location.', "DISPLAY_LABEL" 'Last Moved At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"IS_ACTIVE" BOOLEAN DEFAULT true NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the serial number remains active for warehouse tracking.', "DISPLAY_LABEL" 'Is Active', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'flag'), 
	 CONSTRAINT "CK_SCM_ITEM_SERIALS_01" CHECK (current_status_code in ('AVAILABLE', 'RESERVED', 'PICKED', 'PACKED', 'IN_TRANSIT', 'QUARANTINE', 'DAMAGED', 'BLOCKED', 'SHIPPED', 'WRITTEN_OFF')) ENABLE, 
	 CONSTRAINT "CK_SCM_ITEM_SERIALS_02" CHECK (serial_condition_code in ('GOOD', 'DAMAGED', 'SUSPECT', 'EXPIRED')) ENABLE, 
	 CONSTRAINT "PK_SCM_ITEM_SERIALS" PRIMARY KEY ("ITEM_SERIAL_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_ITEM_SERIALS_01" UNIQUE ("ITEM_ID", "SERIAL_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for item serials.', "DISPLAY_LABEL" 'Item Serials') ;

  CREATE TABLE "SCM_ITEM_WAREHOUSE_POLICIES" 
   (	"ITEM_WAREHOUSE_POLICY_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the item and warehouse policy.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Item Warehouse Policy ID', "SEMANTIC_TYPE" 'identifier'), 
	"ITEM_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Item covered by the policy.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Warehouse where the policy applies.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"MINIMUM_STOCK_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Minimum stock level that should be maintained in the warehouse.', "DISPLAY_LABEL" 'Minimum Stock Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"REORDER_POINT_QUANTITY" NUMBER(18,4) ANNOTATIONS("DESCRIPTION" 'Quantity level that triggers replenishment review.', "DISPLAY_LABEL" 'Reorder Point Quantity', "FORMAT_MASK" 'FM999G999G999G990D0000', "SEMANTIC_TYPE" 'quantity'), 
	"REORDER_TARGET_QUANTITY" NUMBER(18,4) ANNOTATIONS("DESCRIPTION" 'Target stock quantity after replenishment.', "DISPLAY_LABEL" 'Reorder Target Quantity', "FORMAT_MASK" 'FM999G999G999G990D0000', "SEMANTIC_TYPE" 'quantity'), 
	"SAFETY_STOCK_QUANTITY" NUMBER(18,4) ANNOTATIONS("DESCRIPTION" 'Safety stock quantity that should remain protected before replenishment risk is escalated.', "DISPLAY_LABEL" 'Safety Stock Quantity', "FORMAT_MASK" 'FM999G999G999G990D0000', "SEMANTIC_TYPE" 'quantity'), 
	"REPLENISHMENT_LEAD_TIME_DAYS" NUMBER(6,0) ANNOTATIONS("DESCRIPTION" 'Lead time in days used when evaluating replenishment urgency and alert timing.', "DISPLAY_LABEL" 'Replenishment Lead Time Days', "SEMANTIC_TYPE" 'duration_days'), 
	"LOW_STOCK_ALERT_ENABLED_FLAG" BOOLEAN DEFAULT true NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether low stock alerts should be raised for the item in the warehouse.', "DISPLAY_LABEL" 'Low Stock Alert Enabled Flag', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'flag'), 
	"IS_ACTIVE" BOOLEAN DEFAULT true NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the policy is active.', "DISPLAY_LABEL" 'Is Active', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'flag'), 
	 CONSTRAINT "CK_SCM_ITEM_WAREHOUSE_POLICIES_01" CHECK (minimum_stock_quantity >= 0) ENABLE, 
	 CONSTRAINT "CK_SCM_ITEM_WAREHOUSE_POLICIES_02" CHECK (reorder_point_quantity is null or reorder_point_quantity >= 0) ENABLE, 
	 CONSTRAINT "CK_SCM_ITEM_WAREHOUSE_POLICIES_03" CHECK (reorder_target_quantity is null or reorder_target_quantity >= 0) ENABLE, 
	 CONSTRAINT "CK_SCM_ITEM_WAREHOUSE_POLICIES_04" CHECK (safety_stock_quantity is null or safety_stock_quantity >= 0) ENABLE, 
	 CONSTRAINT "CK_SCM_ITEM_WAREHOUSE_POLICIES_05" CHECK (replenishment_lead_time_days is null or replenishment_lead_time_days >= 0) ENABLE, 
	 CONSTRAINT "CK_SCM_ITEM_WAREHOUSE_POLICIES_06" CHECK ( 
        reorder_point_quantity is null 
        or reorder_target_quantity is null 
        or reorder_point_quantity <= reorder_target_quantity 
    ) ENABLE, 
	 CONSTRAINT "CK_SCM_ITEM_WAREHOUSE_POLICIES_07" CHECK ( 
        safety_stock_quantity is null 
        or reorder_point_quantity is null 
        or safety_stock_quantity <= reorder_point_quantity 
    ) ENABLE, 
	 CONSTRAINT "PK_SCM_ITEM_WAREHOUSE_POLICIES" PRIMARY KEY ("ITEM_WAREHOUSE_POLICY_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_ITEM_WAREHOUSE_POLICIES_01" UNIQUE ("ITEM_ID", "WAREHOUSE_ID")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for item warehouse policies.', "DISPLAY_LABEL" 'Item Warehouse Policies') ;

  CREATE TABLE "SCM_OPERATIONAL_EXCEPTIONS" 
   (	"OPERATIONAL_EXCEPTION_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the operational exception.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Operational Exception ID', "SEMANTIC_TYPE" 'identifier'), 
	"EXCEPTION_NUMBER" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reference used to identify the exception.', "DISPLAY_LABEL" 'Exception Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'reference_number', "VALUE_REQUIRED" 'true'), 
	"EXCEPTION_TYPE_CODE" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include RECEIPT_DISCREPANCY, TRANSFER_DISCREPANCY, PICK_SHORTAGE, ITEM_NOT_FOUND, RETURN_REVIEW, COUNT_VARIANCE, STATUS_PROBLEM, OTHER.', "DESCRIPTION" 'Business type of exception.', "DISPLAY_LABEL" 'Exception Type Code', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'classification', "VALUE_REQUIRED" 'true'), 
	"RELATED_RECORD_TYPE_CODE" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include RECEIPT, TRANSFER, OUTBOUND_ORDER, RETURN, COUNT, ADJUSTMENT, INVENTORY.', "DESCRIPTION" 'Type of business record linked to the exception.', "DISPLAY_LABEL" 'Related Record Type', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'type', "VALUE_REQUIRED" 'true'), 
	"RELATED_RECORD_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Identifier of the business record linked to the exception.', "DISPLAY_LABEL" 'Related Record ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"RELATED_LINE_NUMBER" NUMBER ANNOTATIONS("DESCRIPTION" 'Line number of the related business record, when applicable.', "DISPLAY_LABEL" 'Related Line Number', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'sequence_number'), 
	"WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Warehouse responsible for the exception.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"STORAGE_LOCATION_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Location linked to the exception where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Storage Location ID', "SEMANTIC_TYPE" 'identifier'), 
	"ITEM_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Item linked to the exception where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "SEMANTIC_TYPE" 'identifier'), 
	"INVENTORY_LOT_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Lot linked to the exception where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Inventory Lot ID', "SEMANTIC_TYPE" 'identifier'), 
	"ITEM_SERIAL_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Reference to the item serial.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item Serial ID', "SEMANTIC_TYPE" 'identifier'), 
	"AFFECTED_QUANTITY" NUMBER(14,4) ANNOTATIONS("DESCRIPTION" 'Quantity affected by the exception where relevant.', "DISPLAY_LABEL" 'Affected Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"REVIEW_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'OPEN' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include OPEN, REVIEW_REQUIRED, APPROVED, REJECTED, RESOLVED.', "DESCRIPTION" 'Current review status of the record.', "DISPLAY_LABEL" 'Review Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"SEVERITY_CODE" VARCHAR2(20 CHAR) DEFAULT 'MEDIUM' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include LOW, MEDIUM, HIGH, CRITICAL.', "DESCRIPTION" 'Business severity of the exception.', "DISPLAY_LABEL" 'Severity Code', "SEMANTIC_TYPE" 'priority'), 
	"ASSIGNED_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'User responsible for reviewing the exception where assigned to a person.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Assigned User ID', "SEMANTIC_TYPE" 'identifier'), 
	"REPORTED_BY_USER_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'User who reported the exception.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Reported By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"REPORTED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT systimestamp NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Date and time when the exception was reported.', "DISPLAY_LABEL" 'Reported At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"REVIEWED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who reviewed the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Reviewed By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"REVIEWED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the record was reviewed.', "DISPLAY_LABEL" 'Reviewed At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"RESOLUTION_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Business resolution applied to the exception.', "DISPLAY_LABEL" 'Resolution Code', "SEMANTIC_TYPE" 'resolution'), 
	"EXCEPTION_NOTES" VARCHAR2(1000 CHAR) ANNOTATIONS("DESCRIPTION" 'Business notes for the exception.', "DISPLAY_LABEL" 'Exception Notes', "SEMANTIC_TYPE" 'comment'), 
	 CONSTRAINT "CK_SCM_OPERATIONAL_EXCEPTIONS_01" CHECK ( 
        exception_type_code in ( 
            'RECEIPT_DISCREPANCY', 
            'TRANSFER_DISCREPANCY', 
            'PICK_SHORTAGE', 
            'ITEM_NOT_FOUND', 
            'RETURN_REVIEW', 
            'COUNT_VARIANCE', 
            'STATUS_PROBLEM', 
            'OTHER' 
        ) 
    ) ENABLE, 
	 CONSTRAINT "CK_SCM_OPERATIONAL_EXCEPTIONS_02" CHECK ( 
        related_record_type_code in ( 
            'RECEIPT', 
            'TRANSFER', 
            'OUTBOUND_ORDER', 
            'RETURN', 
            'COUNT', 
            'ADJUSTMENT', 
            'INVENTORY' 
        ) 
    ) ENABLE, 
	 CONSTRAINT "CK_SCM_OPERATIONAL_EXCEPTIONS_03" CHECK (review_status_code in ('OPEN', 'REVIEW_REQUIRED', 'APPROVED', 'REJECTED', 'RESOLVED')) ENABLE, 
	 CONSTRAINT "CK_SCM_OPERATIONAL_EXCEPTIONS_04" CHECK (severity_code in ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL')) ENABLE, 
	 CONSTRAINT "PK_SCM_OPERATIONAL_EXCEPTIONS" PRIMARY KEY ("OPERATIONAL_EXCEPTION_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_OPERATIONAL_EXCEPTIONS_01" UNIQUE ("EXCEPTION_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for operational exceptions.', "DISPLAY_LABEL" 'Operational Exceptions') ;

  CREATE TABLE "SCM_OUTBOUND_ORDERS" 
   (	"OUTBOUND_ORDER_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the outbound order.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Outbound Order ID', "SEMANTIC_TYPE" 'identifier'), 
	"OUTBOUND_ORDER_NUMBER" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reference used to identify the outbound order.', "DISPLAY_LABEL" 'Outbound Order Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'reference_number', "VALUE_REQUIRED" 'true'), 
	"ORDER_TYPE_CODE" VARCHAR2(20 CHAR) NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include CUSTOMER_ORDER, INTERNAL_REQUEST.', "DESCRIPTION" 'Type of outbound demand such as customer order or internal request.', "DISPLAY_LABEL" 'Order Type', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'type', "VALUE_REQUIRED" 'true'), 
	"SHIP_FROM_WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Warehouse fulfilling the outbound order.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Ship From Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"CUSTOMER_PARTNER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Customer or requesting partner associated with the outbound order.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Customer Partner ID', "SEMANTIC_TYPE" 'identifier'), 
	"SHIP_TO_SITE_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Destination site for the outbound order.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Ship To Site ID', "SEMANTIC_TYPE" 'identifier'), 
	"CARRIER_PARTNER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Carrier used for the outbound order where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Carrier Partner ID', "SEMANTIC_TYPE" 'identifier'), 
	"ASSIGNED_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user assigned to work on the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Assigned User ID', "SEMANTIC_TYPE" 'identifier'), 
	"OUTBOUND_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'NEW' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include NEW, RELEASED, ALLOCATED, PICKING, PICKED, PACKED, DISPATCHED, REVIEW_REQUIRED, CANCELLED, CLOSED.', "DESCRIPTION" 'Current business status of the outbound order.', "DISPLAY_LABEL" 'Outbound Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"PRIORITY_CODE" VARCHAR2(20 CHAR) DEFAULT 'MEDIUM' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include LOW, MEDIUM, HIGH, CRITICAL.', "DESCRIPTION" 'Business priority assigned to the outbound order.', "DISPLAY_LABEL" 'Priority Code', "SEMANTIC_TYPE" 'priority'), 
	"ORDER_DATE" DATE DEFAULT trunc(sysdate) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business order date used to capture when the demand was created.', "DISPLAY_LABEL" 'Order Date', "FORMAT_MASK" 'DD-MON-YYYY', "SEMANTIC_TYPE" 'date'), 
	"REQUESTED_SHIP_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Requested shipment date and time.', "DISPLAY_LABEL" 'Requested Ship At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"PICKED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who completed picking for the outbound order.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Picked By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"PACKED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who completed packing for the outbound order.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Packed By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"DISPATCHED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the goods left the warehouse.', "DISPLAY_LABEL" 'Dispatched At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"DISPATCHED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who confirmed dispatch of the outbound order.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Dispatched By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"SOURCE_DOCUMENT_NUMBER" VARCHAR2(50 CHAR) ANNOTATIONS("DESCRIPTION" 'Business reference number from the source order or request.', "DISPLAY_LABEL" 'Source Document Number', "SEMANTIC_TYPE" 'reference_number'), 
	"DISPATCH_REFERENCE" VARCHAR2(50 CHAR) ANNOTATIONS("DESCRIPTION" 'Business dispatch reference used when the shipment leaves the warehouse.', "DISPLAY_LABEL" 'Dispatch Reference', "SEMANTIC_TYPE" 'reference_number'), 
	"NOTES" VARCHAR2(1000 CHAR) ANNOTATIONS("DESCRIPTION" 'Business notes for the outbound order.', "DISPLAY_LABEL" 'Notes', "SEMANTIC_TYPE" 'comment'), 
	 CONSTRAINT "CK_SCM_OUTBOUND_ORDERS_01" CHECK (order_type_code in ('CUSTOMER_ORDER', 'INTERNAL_REQUEST')) ENABLE, 
	 CONSTRAINT "CK_SCM_OUTBOUND_ORDERS_02" CHECK (outbound_status_code in ('NEW', 'RELEASED', 'ALLOCATED', 'PICKING', 'PICKED', 'PACKED', 'DISPATCHED', 'REVIEW_REQUIRED', 'CANCELLED', 'CLOSED')) ENABLE, 
	 CONSTRAINT "CK_SCM_OUTBOUND_ORDERS_03" CHECK (priority_code in ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL')) ENABLE, 
	 CONSTRAINT "PK_SCM_OUTBOUND_ORDERS" PRIMARY KEY ("OUTBOUND_ORDER_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_OUTBOUND_ORDERS_01" UNIQUE ("OUTBOUND_ORDER_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for outbound orders.', "DISPLAY_LABEL" 'Outbound Orders') ;

  CREATE TABLE "SCM_OUTBOUND_ORDER_LINES" 
   (	"OUTBOUND_ORDER_LINE_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the outbound order line.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Outbound Order Line ID', "SEMANTIC_TYPE" 'identifier'), 
	"OUTBOUND_ORDER_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Outbound order that the line belongs to.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Outbound Order ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"LINE_NUMBER" NUMBER(10,0) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Line number within the outbound order.', "DISPLAY_LABEL" 'Line Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'sequence', "VALUE_REQUIRED" 'true'), 
	"ITEM_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Item requested on the outbound order line.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"PREFERRED_LOT_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Preferred lot for allocation where the business requires a specific lot.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Preferred Lot ID', "SEMANTIC_TYPE" 'identifier'), 
	"REQUESTED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity requested on the line.', "DISPLAY_LABEL" 'Requested Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity', "VALUE_REQUIRED" 'true'), 
	"RESERVED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity reserved against available stock.', "DISPLAY_LABEL" 'Reserved Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"PICKED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity physically picked.', "DISPLAY_LABEL" 'Picked Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"PACKED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity packed and ready for dispatch.', "DISPLAY_LABEL" 'Packed Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"DISPATCHED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity that has left the warehouse.', "DISPLAY_LABEL" 'Dispatched Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"SHORT_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity that could not be fulfilled.', "DISPLAY_LABEL" 'Short Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"ALLOCATION_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'OPEN' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include OPEN, ALLOCATED, PART_PICKED, PICKED, PACKED, PART_DISPATCHED, DISPATCHED, SHORT, CANCELLED.', "DESCRIPTION" 'Current business status of the outbound order line.', "DISPLAY_LABEL" 'Allocation Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	 CONSTRAINT "CK_SCM_OUTBOUND_ORDER_LINES_01" CHECK (allocation_status_code in ('OPEN', 'ALLOCATED', 'PART_PICKED', 'PICKED', 'PACKED', 'PART_DISPATCHED', 'DISPATCHED', 'SHORT', 'CANCELLED')) ENABLE, 
	 CONSTRAINT "CK_SCM_OUTBOUND_ORDER_LINES_02" CHECK ( 
        requested_quantity >= 0 
        and reserved_quantity >= 0 
        and picked_quantity >= 0 
        and packed_quantity >= 0 
        and dispatched_quantity >= 0 
        and short_quantity >= 0 
    ) ENABLE, 
	 CONSTRAINT "PK_SCM_OUTBOUND_ORDER_LINES" PRIMARY KEY ("OUTBOUND_ORDER_LINE_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_OUTBOUND_ORDER_LINES_01" UNIQUE ("OUTBOUND_ORDER_ID", "LINE_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for outbound order lines.', "DISPLAY_LABEL" 'Outbound Order Lines') ;

  CREATE TABLE "SCM_PARTNER_SITES" 
   (	"PARTNER_SITE_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the business partner site.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Partner Site ID', "SEMANTIC_TYPE" 'identifier'), 
	"BUSINESS_PARTNER_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Partner that owns or uses this site.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Business Partner ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"SITE_CODE" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business code used to identify the partner site.', "DISPLAY_LABEL" 'Site Code', "SEMANTIC_TYPE" 'code', "VALUE_REQUIRED" 'true'), 
	"SITE_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business name for the partner site.', "DISPLAY_LABEL" 'Site Name', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'name', "VALUE_REQUIRED" 'true'), 
	"SITE_ROLE_CODE" VARCHAR2(20 CHAR) NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include PRIMARY, SHIP_FROM, SHIP_TO, PICKUP, DELIVERY, RETURN.', "DESCRIPTION" 'Business role of the site such as ship to, delivery, return, or pickup.', "DISPLAY_LABEL" 'Site Role', "SEMANTIC_TYPE" 'role', "VALUE_REQUIRED" 'true'), 
	"ADDRESS_LINE_1" VARCHAR2(200 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'First address line for the site.', "DISPLAY_LABEL" 'Address Line 1', "SEMANTIC_TYPE" 'street_address', "VALUE_REQUIRED" 'true'), 
	"ADDRESS_LINE_2" VARCHAR2(200 CHAR) ANNOTATIONS("DESCRIPTION" 'Second address line for the site.', "DISPLAY_LABEL" 'Address Line 2', "SEMANTIC_TYPE" 'street_address'), 
	"CITY_NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'City or town for the site address.', "DISPLAY_LABEL" 'City Name', "SEMANTIC_TYPE" 'city', "VALUE_REQUIRED" 'true'), 
	"STATE_REGION_NAME" VARCHAR2(100 CHAR) ANNOTATIONS("DESCRIPTION" 'State, province, or region for the site address.', "DISPLAY_LABEL" 'State or Region Name', "SEMANTIC_TYPE" 'region'), 
	"POSTAL_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Postal or zip code for the site address.', "DISPLAY_LABEL" 'Postal Code', "SEMANTIC_TYPE" 'postal_code'), 
	"COUNTRY_CODE" VARCHAR2(2 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Two-character country code for the site address.', "DISPLAY_LABEL" 'Country Code', "SEMANTIC_TYPE" 'country_code', "VALUE_REQUIRED" 'true'), 
	"IS_PRIMARY_SITE" BOOLEAN DEFAULT false NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether this is the main site for the partner.', "DISPLAY_LABEL" 'Is Primary Site', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'flag'), 
	"IS_ACTIVE" BOOLEAN DEFAULT true NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether this site can still be used in business transactions.', "DISPLAY_LABEL" 'Is Active', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'flag'), 
	"CREATED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT systimestamp NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Date and time when the site record was created.', "DISPLAY_IN_FORM" 'false', "DISPLAY_LABEL" 'Created At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"CREATED_BY" VARCHAR2(128 CHAR) DEFAULT sys_context('USERENV','SESSION_USER') NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Database user that created the site record.', "DISPLAY_IN_FORM" 'false', "DISPLAY_LABEL" 'Created By', "SEMANTIC_TYPE" 'user_name'), 
	 CONSTRAINT "CK_SCM_PARTNER_SITES_01" CHECK (site_role_code in ('PRIMARY', 'SHIP_FROM', 'SHIP_TO', 'PICKUP', 'DELIVERY', 'RETURN')) ENABLE, 
	 CONSTRAINT "PK_SCM_PARTNER_SITES" PRIMARY KEY ("PARTNER_SITE_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_PARTNER_SITES_01" UNIQUE ("BUSINESS_PARTNER_ID", "SITE_CODE")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for partner sites.', "DISPLAY_LABEL" 'Partner Sites') ;

  CREATE TABLE "SCM_REPLENISHMENT_ALERTS" 
   (	"REPLENISHMENT_ALERT_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the replenishment alert.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Replenishment Alert ID', "SEMANTIC_TYPE" 'identifier'), 
	"ALERT_NUMBER" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reference used to identify the replenishment alert.', "DISPLAY_LABEL" 'Alert Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'reference_number', "VALUE_REQUIRED" 'true'), 
	"WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Warehouse where the replenishment need was identified.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"ITEM_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Item that requires replenishment review.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"ITEM_WAREHOUSE_POLICY_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Warehouse policy that triggered the alert where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item Warehouse Policy ID', "SEMANTIC_TYPE" 'identifier'), 
	"PICK_LOCATION_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Pick location that needs replenishment where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Pick Location ID', "SEMANTIC_TYPE" 'identifier'), 
	"RESERVE_LOCATION_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Reserve location expected to supply the replenishment where known.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Reserve Location ID', "SEMANTIC_TYPE" 'identifier'), 
	"ALERT_TYPE_CODE" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include LOW_STOCK, OUT_OF_STOCK, PICK_FACE_REPLENISHMENT, AGING_REVIEW, SHORT_DATED_REVIEW.', "DESCRIPTION" 'Business type of replenishment alert.', "DISPLAY_LABEL" 'Alert Type Code', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'classification', "VALUE_REQUIRED" 'true'), 
	"ALERT_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'OPEN' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include OPEN, IN_REVIEW, ACTIONED, CLOSED, SUPPRESSED.', "DESCRIPTION" 'Current business status of the replenishment alert.', "DISPLAY_LABEL" 'Alert Status Code', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"PRIORITY_CODE" VARCHAR2(20 CHAR) DEFAULT 'MEDIUM' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include LOW, MEDIUM, HIGH, CRITICAL.', "DESCRIPTION" 'Business priority of the replenishment alert.', "DISPLAY_LABEL" 'Priority Code', "SEMANTIC_TYPE" 'priority'), 
	"AVAILABLE_QUANTITY" NUMBER(18,4) ANNOTATIONS("DESCRIPTION" 'Available quantity seen when the alert was raised.', "DISPLAY_LABEL" 'Available Quantity', "FORMAT_MASK" 'FM999G999G999G990D0000', "SEMANTIC_TYPE" 'quantity'), 
	"TRIGGER_QUANTITY" NUMBER(18,4) ANNOTATIONS("DESCRIPTION" 'Quantity threshold that triggered the alert.', "DISPLAY_LABEL" 'Trigger Quantity', "FORMAT_MASK" 'FM999G999G999G990D0000', "SEMANTIC_TYPE" 'quantity'), 
	"TARGET_QUANTITY" NUMBER(18,4) ANNOTATIONS("DESCRIPTION" 'Target quantity the business wants to recover to.', "DISPLAY_LABEL" 'Target Quantity', "FORMAT_MASK" 'FM999G999G999G990D0000', "SEMANTIC_TYPE" 'quantity'), 
	"RECOMMENDED_REPLENISHMENT_QUANTITY" NUMBER(18,4) ANNOTATIONS("DESCRIPTION" 'Suggested quantity to move or review as the replenishment action.', "DISPLAY_LABEL" 'Recommended Replenishment Quantity', "FORMAT_MASK" 'FM999G999G999G990D0000', "SEMANTIC_TYPE" 'quantity'), 
	"RAISED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT systimestamp NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Date and time when the replenishment alert was raised.', "DISPLAY_LABEL" 'Raised At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"REVIEWED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the alert was reviewed.', "DISPLAY_LABEL" 'Reviewed At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"REVIEWED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'User who reviewed the replenishment alert.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Reviewed By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"ALERT_NOTES" VARCHAR2(1000 CHAR) ANNOTATIONS("DESCRIPTION" 'Business notes for the replenishment alert.', "DISPLAY_LABEL" 'Alert Notes', "SEMANTIC_TYPE" 'comment'), 
	 CONSTRAINT "CK_SCM_REPLENISHMENT_ALERTS_01" CHECK ( 
        alert_type_code in ( 
            'LOW_STOCK', 
            'OUT_OF_STOCK', 
            'PICK_FACE_REPLENISHMENT', 
            'AGING_REVIEW', 
            'SHORT_DATED_REVIEW' 
        ) 
    ) ENABLE, 
	 CONSTRAINT "CK_SCM_REPLENISHMENT_ALERTS_02" CHECK ( 
        alert_status_code in ( 
            'OPEN', 
            'IN_REVIEW', 
            'ACTIONED', 
            'CLOSED', 
            'SUPPRESSED' 
        ) 
    ) ENABLE, 
	 CONSTRAINT "CK_SCM_REPLENISHMENT_ALERTS_03" CHECK ( 
        priority_code in ( 
            'LOW', 
            'MEDIUM', 
            'HIGH', 
            'CRITICAL' 
        ) 
    ) ENABLE, 
	 CONSTRAINT "CK_SCM_REPLENISHMENT_ALERTS_04" CHECK (available_quantity is null or available_quantity >= 0) ENABLE, 
	 CONSTRAINT "CK_SCM_REPLENISHMENT_ALERTS_05" CHECK (trigger_quantity is null or trigger_quantity >= 0) ENABLE, 
	 CONSTRAINT "CK_SCM_REPLENISHMENT_ALERTS_06" CHECK (target_quantity is null or target_quantity >= 0) ENABLE, 
	 CONSTRAINT "CK_SCM_REPLENISHMENT_ALERTS_07" CHECK ( 
        recommended_replenishment_quantity is null 
        or recommended_replenishment_quantity >= 0 
    ) ENABLE, 
	 CONSTRAINT "PK_SCM_REPLENISHMENT_ALERTS" PRIMARY KEY ("REPLENISHMENT_ALERT_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_REPLENISHMENT_ALERTS_01" UNIQUE ("ALERT_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for replenishment alerts.', "DISPLAY_LABEL" 'Replenishment Alerts') ;

  CREATE TABLE "SCM_RETURNS" 
   (	"RETURN_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the return.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Return ID', "SEMANTIC_TYPE" 'identifier'), 
	"RETURN_NUMBER" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reference used to identify the return.', "DISPLAY_LABEL" 'Return Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'reference_number', "VALUE_REQUIRED" 'true'), 
	"RETURN_TYPE_CODE" VARCHAR2(20 CHAR) NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include CUSTOMER_RETURN, DELIVERY_RETURN, INTERNAL_RETURN, SUPPLIER_RETURN.', "DESCRIPTION" 'Business type of the return.', "DISPLAY_LABEL" 'Return Type', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'type', "VALUE_REQUIRED" 'true'), 
	"WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Warehouse that receives or manages the return.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"SOURCE_PARTNER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Partner sending or associated with the return.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Source Partner ID', "SEMANTIC_TYPE" 'identifier'), 
	"SOURCE_SITE_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Site sending or associated with the return.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Source Site ID', "SEMANTIC_TYPE" 'identifier'), 
	"RELATED_OUTBOUND_ORDER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Outbound order linked to the return where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Related Outbound Order ID', "SEMANTIC_TYPE" 'identifier'), 
	"ASSIGNED_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user assigned to work on the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Assigned User ID', "SEMANTIC_TYPE" 'identifier'), 
	"RETURN_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'NEW' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include NEW, RECEIVED, UNDER_REVIEW, REVIEW_REQUIRED, DISPOSITIONED, CLOSED, CANCELLED.', "DESCRIPTION" 'Current business status of the return.', "DISPLAY_LABEL" 'Return Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"REVIEW_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'OPEN' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include OPEN, REVIEW_REQUIRED, APPROVED, REJECTED, RESOLVED.', "DESCRIPTION" 'Current review status of the record.', "DISPLAY_LABEL" 'Review Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"RETURN_REASON_CODE" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reason for the return.', "DISPLAY_LABEL" 'Return Reason Code', "SEMANTIC_TYPE" 'reason_code', "VALUE_REQUIRED" 'true'), 
	"EXPECTED_ARRIVAL_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Expected arrival date and time of the return.', "DISPLAY_LABEL" 'Expected Arrival At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"RECEIVED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Actual date and time when the return arrived.', "DISPLAY_LABEL" 'Received At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"RECEIVED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who received the goods for the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Received By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"ASSESSED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the returned goods were assessed.', "DISPLAY_LABEL" 'Assessed At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"ASSESSED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who assessed the returned goods.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Assessed By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"REVIEWED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who reviewed the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Reviewed By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"REVIEWED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the record was reviewed.', "DISPLAY_LABEL" 'Reviewed At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"REVIEW_REASON_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Reason code that explains the review outcome or exception handling decision.', "DISPLAY_LABEL" 'Review Reason Code', "SEMANTIC_TYPE" 'reason'), 
	"NOTES" VARCHAR2(1000 CHAR) ANNOTATIONS("DESCRIPTION" 'Business notes for the return.', "DISPLAY_LABEL" 'Notes', "SEMANTIC_TYPE" 'comment'), 
	 CONSTRAINT "CK_SCM_RETURNS_01" CHECK (return_type_code in ('CUSTOMER_RETURN', 'DELIVERY_RETURN', 'INTERNAL_RETURN', 'SUPPLIER_RETURN')) ENABLE, 
	 CONSTRAINT "CK_SCM_RETURNS_02" CHECK (return_status_code in ('NEW', 'RECEIVED', 'UNDER_REVIEW', 'REVIEW_REQUIRED', 'DISPOSITIONED', 'CLOSED', 'CANCELLED')) ENABLE, 
	 CONSTRAINT "CK_SCM_RETURNS_03" CHECK (review_status_code in ('OPEN', 'REVIEW_REQUIRED', 'APPROVED', 'REJECTED', 'RESOLVED')) ENABLE, 
	 CONSTRAINT "PK_SCM_RETURNS" PRIMARY KEY ("RETURN_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_RETURNS_01" UNIQUE ("RETURN_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for returns.', "DISPLAY_LABEL" 'Returns') ;

  CREATE TABLE "SCM_RETURN_LINES" 
   (	"RETURN_LINE_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the return line.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Return Line ID', "SEMANTIC_TYPE" 'identifier'), 
	"RETURN_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Return that the line belongs to.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Return ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"LINE_NUMBER" NUMBER(10,0) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Line number within the return.', "DISPLAY_LABEL" 'Line Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'sequence', "VALUE_REQUIRED" 'true'), 
	"ITEM_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Item being returned.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"INVENTORY_LOT_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Lot associated with the returned stock where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Inventory Lot ID', "SEMANTIC_TYPE" 'identifier'), 
	"EXPECTED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Expected quantity on the return line.', "DISPLAY_LABEL" 'Expected Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"RECEIVED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity actually received on the return line.', "DISPLAY_LABEL" 'Received Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"RETURNED_CONDITION_CODE" VARCHAR2(20 CHAR) DEFAULT 'GOOD' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include GOOD, DAMAGED, INCOMPLETE, EXPIRED, SUSPECT.', "DESCRIPTION" 'Condition of the goods received on the return line.', "DISPLAY_LABEL" 'Returned Condition', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'condition'), 
	"REUSABLE_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity approved to return to available stock.', "DISPLAY_LABEL" 'Reusable Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"QUARANTINE_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity moved to quarantine after assessment.', "DISPLAY_LABEL" 'Quarantine Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"DAMAGED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity found damaged on return.', "DISPLAY_LABEL" 'Damaged Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"WRITEOFF_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity approved for write-off.', "DISPLAY_LABEL" 'Write-Off Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"DISPOSITION_CODE" VARCHAR2(20 CHAR) DEFAULT 'QUARANTINE' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include RETURN_TO_STOCK, QUARANTINE, WRITE_OFF.', "DESCRIPTION" 'Outcome applied to the return line after assessment.', "DISPLAY_LABEL" 'Disposition Code', "SEMANTIC_TYPE" 'disposition'), 
	 CONSTRAINT "CK_SCM_RETURN_LINES_01" CHECK (returned_condition_code in ('GOOD', 'DAMAGED', 'SUSPECT', 'EXPIRED', 'INCOMPLETE')) ENABLE, 
	 CONSTRAINT "CK_SCM_RETURN_LINES_02" CHECK (disposition_code in ('RETURN_TO_STOCK', 'QUARANTINE', 'WRITE_OFF')) ENABLE, 
	 CONSTRAINT "CK_SCM_RETURN_LINES_03" CHECK ( 
        expected_quantity >= 0 
        and received_quantity >= 0 
        and reusable_quantity >= 0 
        and quarantine_quantity >= 0 
        and damaged_quantity >= 0 
        and writeoff_quantity >= 0 
    ) ENABLE, 
	 CONSTRAINT "PK_SCM_RETURN_LINES" PRIMARY KEY ("RETURN_LINE_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_RETURN_LINES_01" UNIQUE ("RETURN_ID", "LINE_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for return lines.', "DISPLAY_LABEL" 'Return Lines') ;

  CREATE TABLE "SCM_STOCK_ADJUSTMENTS" 
   (	"STOCK_ADJUSTMENT_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the stock adjustment.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Stock Adjustment ID', "SEMANTIC_TYPE" 'identifier'), 
	"ADJUSTMENT_NUMBER" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reference used to identify the stock adjustment.', "DISPLAY_LABEL" 'Adjustment Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'reference_number', "VALUE_REQUIRED" 'true'), 
	"WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Warehouse where the stock adjustment applies.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"ASSIGNED_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user assigned to work on the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Assigned User ID', "SEMANTIC_TYPE" 'identifier'), 
	"ADJUSTMENT_TYPE_CODE" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include MANUAL_ADJUSTMENT, STATUS_CORRECTION, WRITE_OFF, COUNT_VARIANCE.', "DESCRIPTION" 'Business type of the stock adjustment.', "DISPLAY_LABEL" 'Adjustment Type', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'type', "VALUE_REQUIRED" 'true'), 
	"ADJUSTMENT_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'OPEN' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include OPEN, REVIEW_REQUIRED, APPROVED, APPLIED, REJECTED, CANCELLED.', "DESCRIPTION" 'Current business status of the stock adjustment.', "DISPLAY_LABEL" 'Adjustment Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"REASON_CODE" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reason for the stock adjustment.', "DISPLAY_LABEL" 'Reason Code', "SEMANTIC_TYPE" 'reason_code', "VALUE_REQUIRED" 'true'), 
	"REQUESTED_BY_USER_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Application user who requested the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Requested By User ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"REQUESTED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT systimestamp NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Date and time when the stock adjustment was requested.', "DISPLAY_LABEL" 'Requested At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"REVIEWED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who reviewed the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Reviewed By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"REVIEWED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the record was reviewed.', "DISPLAY_LABEL" 'Reviewed At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"APPLIED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who applied the stock adjustment.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Applied By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"APPLIED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the stock adjustment was applied to inventory.', "DISPLAY_LABEL" 'Applied At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"NOTES" VARCHAR2(1000 CHAR) ANNOTATIONS("DESCRIPTION" 'Business notes for the stock adjustment.', "DISPLAY_LABEL" 'Notes', "SEMANTIC_TYPE" 'comment'), 
	 CONSTRAINT "CK_SCM_STOCK_ADJUSTMENTS_01" CHECK (adjustment_type_code in ('MANUAL_ADJUSTMENT', 'STATUS_CORRECTION', 'WRITE_OFF', 'COUNT_VARIANCE')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_ADJUSTMENTS_02" CHECK (adjustment_status_code in ('OPEN', 'REVIEW_REQUIRED', 'APPROVED', 'APPLIED', 'REJECTED', 'CANCELLED')) ENABLE, 
	 CONSTRAINT "PK_SCM_STOCK_ADJUSTMENTS" PRIMARY KEY ("STOCK_ADJUSTMENT_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_STOCK_ADJUSTMENTS_01" UNIQUE ("ADJUSTMENT_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for stock adjustments.', "DISPLAY_LABEL" 'Stock Adjustments') ;

  CREATE TABLE "SCM_STOCK_ADJUSTMENT_LINES" 
   (	"STOCK_ADJUSTMENT_LINE_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the stock adjustment line.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Stock Adjustment Line ID', "SEMANTIC_TYPE" 'identifier'), 
	"STOCK_ADJUSTMENT_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Stock adjustment that the line belongs to.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Stock Adjustment ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"LINE_NUMBER" NUMBER(10,0) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Line number within the stock adjustment.', "DISPLAY_LABEL" 'Line Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'sequence', "VALUE_REQUIRED" 'true'), 
	"ITEM_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Item affected by the adjustment line.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"INVENTORY_LOT_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Lot affected by the adjustment line where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Inventory Lot ID', "SEMANTIC_TYPE" 'identifier'), 
	"ITEM_SERIAL_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Reference to the item serial.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item Serial ID', "SEMANTIC_TYPE" 'identifier'), 
	"STORAGE_LOCATION_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Location where the stock adjustment applies.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Storage Location ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"FROM_STATUS_CODE" VARCHAR2(20 CHAR) ANNOTATIONS("AI_CONTEXT" 'Valid values include AVAILABLE, RESERVED, PICKED, PACKED, IN_TRANSIT, QUARANTINE, DAMAGED, BLOCKED.', "DESCRIPTION" 'Stock status before the adjustment where relevant.', "DISPLAY_LABEL" 'From Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"TO_STATUS_CODE" VARCHAR2(20 CHAR) ANNOTATIONS("AI_CONTEXT" 'Valid values include AVAILABLE, RESERVED, PICKED, PACKED, IN_TRANSIT, QUARANTINE, DAMAGED, BLOCKED.', "DESCRIPTION" 'Stock status after the adjustment where relevant.', "DISPLAY_LABEL" 'To Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"ADJUSTMENT_DIRECTION_CODE" VARCHAR2(20 CHAR) NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include INCREASE, DECREASE, STATUS_CHANGE.', "DESCRIPTION" 'Direction of the quantity change.', "DISPLAY_LABEL" 'Adjustment Direction', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'direction', "VALUE_REQUIRED" 'true'), 
	"ADJUSTMENT_QUANTITY" NUMBER(14,4) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity affected by the adjustment line.', "DISPLAY_LABEL" 'Adjustment Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity', "VALUE_REQUIRED" 'true'), 
	"REASON_DESCRIPTION" VARCHAR2(500 CHAR) ANNOTATIONS("DESCRIPTION" 'Business explanation specific to the adjustment line.', "DISPLAY_LABEL" 'Reason Description', "SEMANTIC_TYPE" 'description'), 
	 CONSTRAINT "CK_SCM_STOCK_ADJUSTMENT_LINES_01" CHECK (adjustment_direction_code in ('INCREASE', 'DECREASE', 'STATUS_CHANGE')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_ADJUSTMENT_LINES_02" CHECK (adjustment_quantity > 0) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_ADJUSTMENT_LINES_03" CHECK (from_status_code is null or from_status_code in ('AVAILABLE', 'RESERVED', 'PICKED', 'PACKED', 'IN_TRANSIT', 'QUARANTINE', 'DAMAGED', 'BLOCKED')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_ADJUSTMENT_LINES_04" CHECK (to_status_code is null or to_status_code in ('AVAILABLE', 'RESERVED', 'PICKED', 'PACKED', 'IN_TRANSIT', 'QUARANTINE', 'DAMAGED', 'BLOCKED')) ENABLE, 
	 CONSTRAINT "PK_SCM_STOCK_ADJUSTMENT_LINES" PRIMARY KEY ("STOCK_ADJUSTMENT_LINE_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_STOCK_ADJUSTMENT_LINES_01" UNIQUE ("STOCK_ADJUSTMENT_ID", "LINE_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for stock adjustment lines.', "DISPLAY_LABEL" 'Stock Adjustment Lines') ;

  CREATE TABLE "SCM_STOCK_ALLOCATIONS" 
   (	"STOCK_ALLOCATION_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the stock allocation.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Stock Allocation ID', "SEMANTIC_TYPE" 'identifier'), 
	"ALLOCATION_NUMBER" VARCHAR2(40 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reference used to identify the stock allocation.', "DISPLAY_LABEL" 'Allocation Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'reference_number', "VALUE_REQUIRED" 'true'), 
	"OUTBOUND_ORDER_LINE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Outbound order line fulfilled by the allocation.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Outbound Order Line ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"INVENTORY_BALANCE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Inventory balance row selected for allocation.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Inventory Balance ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Warehouse from which stock is allocated.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"SOURCE_LOCATION_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Location from which allocated stock is picked.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Source Location ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"ITEM_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Item allocated to the outbound line.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"INVENTORY_LOT_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Lot allocated where lot control applies.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Inventory Lot ID', "SEMANTIC_TYPE" 'identifier'), 
	"ITEM_SERIAL_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Serial number allocated where serial control applies.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item Serial ID', "SEMANTIC_TYPE" 'identifier'), 
	"ALLOCATION_SEQUENCE" NUMBER(10,0) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'FIFO allocation sequence within the outbound order line.', "DISPLAY_LABEL" 'Allocation Sequence', "SEMANTIC_TYPE" 'sequence', "VALUE_REQUIRED" 'true'), 
	"ALLOCATION_METHOD_CODE" VARCHAR2(20 CHAR) DEFAULT 'FIFO' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include FIFO, MANUAL, SPECIFIC_LOT.', "DESCRIPTION" 'Method used to allocate stock.', "DISPLAY_LABEL" 'Allocation Method', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'method'), 
	"ALLOCATION_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'OPEN' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include OPEN, ALLOCATED, PART_PICKED, PICKED, PACKED, PART_DISPATCHED, DISPATCHED, SHORT, CANCELLED.', "DESCRIPTION" 'Current lifecycle status of the allocation.', "DISPLAY_LABEL" 'Allocation Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"ALLOCATED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity allocated from this balance.', "DISPLAY_LABEL" 'Allocated Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"RESERVED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity reserved from this allocation.', "DISPLAY_LABEL" 'Reserved Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"PICKED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity picked from this allocation.', "DISPLAY_LABEL" 'Picked Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"PACKED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity packed from this allocation.', "DISPLAY_LABEL" 'Packed Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"DISPATCHED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity dispatched from this allocation.', "DISPLAY_LABEL" 'Dispatched Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"SHORT_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity short against this allocation.', "DISPLAY_LABEL" 'Short Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"FIFO_BASIS_DATE" DATE ANNOTATIONS("DESCRIPTION" 'Date used to order FIFO allocation candidates.', "DISPLAY_LABEL" 'FIFO Basis Date', "FORMAT_MASK" 'DD-MON-YYYY', "SEMANTIC_TYPE" 'date'), 
	"ALLOCATED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who allocated the stock.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Allocated By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"ALLOCATED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the stock was allocated.', "DISPLAY_LABEL" 'Allocated At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"PICKED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who picked the allocation.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Picked By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"PICKED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the allocation was picked.', "DISPLAY_LABEL" 'Picked At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"PACKED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who packed the allocation.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Packed By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"PACKED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the allocation was packed.', "DISPLAY_LABEL" 'Packed At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"DISPATCHED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who dispatched the allocation.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Dispatched By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"DISPATCHED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the allocation was dispatched.', "DISPLAY_LABEL" 'Dispatched At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	 CONSTRAINT "CK_SCM_STOCK_ALLOCATIONS_01" CHECK (allocation_sequence > 0) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_ALLOCATIONS_02" CHECK (allocation_method_code in ('FIFO', 'MANUAL', 'SPECIFIC_LOT')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_ALLOCATIONS_03" CHECK (allocation_status_code in ('OPEN', 'ALLOCATED', 'PART_PICKED', 'PICKED', 'PACKED', 'PART_DISPATCHED', 'DISPATCHED', 'SHORT', 'CANCELLED')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_ALLOCATIONS_04" CHECK ( 
        allocated_quantity >= 0 
        and reserved_quantity >= 0 
        and picked_quantity >= 0 
        and packed_quantity >= 0 
        and dispatched_quantity >= 0 
        and short_quantity >= 0 
        and reserved_quantity <= allocated_quantity 
        and picked_quantity <= reserved_quantity 
        and packed_quantity <= picked_quantity 
        and dispatched_quantity <= packed_quantity 
    ) ENABLE, 
	 CONSTRAINT "PK_SCM_STOCK_ALLOCATIONS" PRIMARY KEY ("STOCK_ALLOCATION_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_STOCK_ALLOCATIONS_01" UNIQUE ("ALLOCATION_NUMBER")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_STOCK_ALLOCATIONS_02" UNIQUE ("OUTBOUND_ORDER_LINE_ID", "ALLOCATION_SEQUENCE")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores FIFO stock allocation and outbound execution detail.', "DISPLAY_LABEL" 'Stock Allocations') ;

  CREATE TABLE "SCM_STOCK_COUNTS" 
   (	"STOCK_COUNT_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the stock count event.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Stock Count ID', "SEMANTIC_TYPE" 'identifier'), 
	"COUNT_NUMBER" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reference used to identify the stock count.', "DISPLAY_LABEL" 'Count Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'reference_number', "VALUE_REQUIRED" 'true'), 
	"WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Warehouse where the stock count takes place.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"WAREHOUSE_AREA_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Area counted when the count scope is area.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse Area ID', "SEMANTIC_TYPE" 'identifier'), 
	"STORAGE_LOCATION_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Storage location counted when the count scope is location.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Storage Location ID', "SEMANTIC_TYPE" 'identifier'), 
	"ITEM_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Item counted when the count scope is item.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "SEMANTIC_TYPE" 'identifier'), 
	"ASSIGNED_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user assigned to work on the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Assigned User ID', "SEMANTIC_TYPE" 'identifier'), 
	"COUNT_SCOPE_CODE" VARCHAR2(20 CHAR) NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include WAREHOUSE, AREA, LOCATION, ITEM.', "DESCRIPTION" 'Business scope of the stock count.', "DISPLAY_LABEL" 'Count Scope', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'scope', "VALUE_REQUIRED" 'true'), 
	"COUNT_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'PLANNED' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include PLANNED, IN_PROGRESS, REVIEW_REQUIRED, COMPLETED, CANCELLED.', "DESCRIPTION" 'Current business status of the stock count.', "DISPLAY_LABEL" 'Count Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"REVIEW_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'OPEN' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include OPEN, REVIEW_REQUIRED, APPROVED, REJECTED, RESOLVED.', "DESCRIPTION" 'Current review status of the record.', "DISPLAY_LABEL" 'Review Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"PLANNED_START_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Planned start date and time for the count.', "DISPLAY_LABEL" 'Planned Start At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"PLANNED_END_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Planned end date and time for the count.', "DISPLAY_LABEL" 'Planned End At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"STARTED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Actual start date and time for the count.', "DISPLAY_LABEL" 'Started At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"COMPLETED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Actual completion date and time for the count.', "DISPLAY_LABEL" 'Completed At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"REQUESTED_BY_USER_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Application user who requested the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Requested By User ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"REVIEWED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who reviewed the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Reviewed By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"REVIEWED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the record was reviewed.', "DISPLAY_LABEL" 'Reviewed At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"REVIEW_REASON_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Reason code that explains the review outcome or exception handling decision.', "DISPLAY_LABEL" 'Review Reason Code', "SEMANTIC_TYPE" 'reason'), 
	"NOTES" VARCHAR2(1000 CHAR) ANNOTATIONS("DESCRIPTION" 'Business notes for the stock count.', "DISPLAY_LABEL" 'Notes', "SEMANTIC_TYPE" 'comment'), 
	 CONSTRAINT "CK_SCM_STOCK_COUNTS_01" CHECK (count_scope_code in ('WAREHOUSE', 'AREA', 'LOCATION', 'ITEM')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_COUNTS_02" CHECK (count_status_code in ('PLANNED', 'IN_PROGRESS', 'REVIEW_REQUIRED', 'COMPLETED', 'CANCELLED')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_COUNTS_03" CHECK (review_status_code in ('OPEN', 'REVIEW_REQUIRED', 'APPROVED', 'REJECTED', 'RESOLVED')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_COUNTS_04" CHECK ( 
        (count_scope_code = 'WAREHOUSE' and warehouse_area_id is null and storage_location_id is null and item_id is null) 
        or (count_scope_code = 'AREA' and warehouse_area_id is not null and storage_location_id is null and item_id is null) 
        or (count_scope_code = 'LOCATION' and warehouse_area_id is null and storage_location_id is not null and item_id is null) 
        or (count_scope_code = 'ITEM' and warehouse_area_id is null and storage_location_id is null and item_id is not null) 
    ) ENABLE, 
	 CONSTRAINT "PK_SCM_STOCK_COUNTS" PRIMARY KEY ("STOCK_COUNT_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_STOCK_COUNTS_01" UNIQUE ("COUNT_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for stock counts.', "DISPLAY_LABEL" 'Stock Counts') ;

  CREATE TABLE "SCM_STOCK_COUNT_LINES" 
   (	"STOCK_COUNT_LINE_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the stock count line.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Stock Count Line ID', "SEMANTIC_TYPE" 'identifier'), 
	"STOCK_COUNT_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Stock count that the line belongs to.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Stock Count ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"LINE_NUMBER" NUMBER(10,0) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Line number within the stock count.', "DISPLAY_LABEL" 'Line Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'sequence', "VALUE_REQUIRED" 'true'), 
	"ITEM_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Item counted on the line.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"STORAGE_LOCATION_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Location counted on the line.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Storage Location ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"INVENTORY_LOT_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Lot counted on the line where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Inventory Lot ID', "SEMANTIC_TYPE" 'identifier'), 
	"EXPECTED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Recorded quantity before the physical count.', "DISPLAY_LABEL" 'Expected Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"COUNTED_QUANTITY" NUMBER(14,4) ANNOTATIONS("DESCRIPTION" 'Physical quantity counted.', "DISPLAY_LABEL" 'Counted Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"VARIANCE_QUANTITY" NUMBER(14,4) ANNOTATIONS("DESCRIPTION" 'Difference between counted quantity and recorded quantity.', "DISPLAY_IN_FORM" 'false', "DISPLAY_LABEL" 'Variance Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"VARIANCE_REASON_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Business reason for the variance where the cause is known.', "DISPLAY_LABEL" 'Variance Reason Code', "SEMANTIC_TYPE" 'reason_code'), 
	"FIRST_COUNTED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who recorded the first physical count.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'First Counted By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"FIRST_COUNTED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the first count was completed.', "DISPLAY_LABEL" 'First Counted At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"REVIEWED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who reviewed the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Reviewed By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"REVIEWED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the count line was reviewed or resolved.', "DISPLAY_LABEL" 'Reviewed At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"RESOLUTION_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Business resolution applied to the count line.', "DISPLAY_LABEL" 'Resolution Code', "SEMANTIC_TYPE" 'resolution'), 
	"LINE_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'OPEN' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include OPEN, COUNTED, REVIEW_REQUIRED, RESOLVED.', "DESCRIPTION" 'Current business status of the count line.', "DISPLAY_LABEL" 'Line Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	 CONSTRAINT "CK_SCM_STOCK_COUNT_LINES_01" CHECK (resolution_code is null or resolution_code in ('ACCEPTED', 'ADJUSTMENT_REQUIRED', 'RECOUNT_REQUIRED', 'WRITEOFF_REQUIRED')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_COUNT_LINES_02" CHECK (line_status_code in ('OPEN', 'COUNTED', 'REVIEW_REQUIRED', 'RESOLVED')) ENABLE, 
	 CONSTRAINT "PK_SCM_STOCK_COUNT_LINES" PRIMARY KEY ("STOCK_COUNT_LINE_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_STOCK_COUNT_LINES_01" UNIQUE ("STOCK_COUNT_ID", "LINE_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for stock count lines.', "DISPLAY_LABEL" 'Stock Count Lines') ;

  CREATE TABLE "SCM_STOCK_MOVEMENTS" 
   (	"STOCK_MOVEMENT_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the stock movement.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Stock Movement ID', "SEMANTIC_TYPE" 'identifier'), 
	"MOVEMENT_NUMBER" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reference used to identify the stock movement.', "DISPLAY_LABEL" 'Movement Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'reference_number', "VALUE_REQUIRED" 'true'), 
	"MOVEMENT_TYPE_CODE" VARCHAR2(30 CHAR) DEFAULT 'MOVE' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include PUTAWAY, MOVE, REPLENISHMENT, STATUS_CHANGE.', "DESCRIPTION" 'Type of operational stock movement.', "DISPLAY_LABEL" 'Movement Type', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'type', "VALUE_REQUIRED" 'true'), 
	"WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Warehouse where the movement is performed.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"SOURCE_LOCATION_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Location that stock moves from where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Source Location ID', "SEMANTIC_TYPE" 'identifier'), 
	"DESTINATION_LOCATION_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Location that stock moves to where relevant.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Destination Location ID', "SEMANTIC_TYPE" 'identifier'), 
	"ITEM_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Item moved by the stock movement.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"INVENTORY_LOT_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Lot moved where lot control applies.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Inventory Lot ID', "SEMANTIC_TYPE" 'identifier'), 
	"ITEM_SERIAL_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Serial number moved where serial control applies.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item Serial ID', "SEMANTIC_TYPE" 'identifier'), 
	"FROM_STATUS_CODE" VARCHAR2(20 CHAR) ANNOTATIONS("AI_CONTEXT" 'Valid values include AVAILABLE, RESERVED, PICKED, PACKED, IN_TRANSIT, QUARANTINE, DAMAGED, BLOCKED.', "DESCRIPTION" 'Stock status before the movement where relevant.', "DISPLAY_LABEL" 'From Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"TO_STATUS_CODE" VARCHAR2(20 CHAR) ANNOTATIONS("AI_CONTEXT" 'Valid values include AVAILABLE, RESERVED, PICKED, PACKED, IN_TRANSIT, QUARANTINE, DAMAGED, BLOCKED.', "DESCRIPTION" 'Stock status after the movement where relevant.', "DISPLAY_LABEL" 'To Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"REQUESTED_QUANTITY" NUMBER(14,4) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity requested for movement.', "DISPLAY_LABEL" 'Requested Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity', "VALUE_REQUIRED" 'true'), 
	"MOVED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity actually moved.', "DISPLAY_LABEL" 'Moved Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"MOVEMENT_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'OPEN' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include OPEN, RELEASED, IN_PROGRESS, COMPLETED, REVIEW_REQUIRED, CANCELLED.', "DESCRIPTION" 'Current business status of the stock movement.', "DISPLAY_LABEL" 'Movement Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"REVIEW_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'OPEN' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include OPEN, REVIEW_REQUIRED, APPROVED, REJECTED, RESOLVED.', "DESCRIPTION" 'Current review status of the movement.', "DISPLAY_LABEL" 'Review Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"REASON_CODE" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reason for the movement.', "DISPLAY_LABEL" 'Reason Code', "SEMANTIC_TYPE" 'reason_code', "VALUE_REQUIRED" 'true'), 
	"ASSIGNED_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user assigned to work on the movement.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Assigned User ID', "SEMANTIC_TYPE" 'identifier'), 
	"REQUESTED_BY_USER_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Application user who requested the movement.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Requested By User ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"REQUESTED_AT" TIMESTAMP (6) WITH TIME ZONE DEFAULT systimestamp NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Date and time when the movement was requested.', "DISPLAY_LABEL" 'Requested At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"CONFIRMED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who confirmed the movement.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Confirmed By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"CONFIRMED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the movement was confirmed.', "DISPLAY_LABEL" 'Confirmed At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"REVIEWED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who reviewed the movement.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Reviewed By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"REVIEWED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the movement was reviewed.', "DISPLAY_LABEL" 'Reviewed At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"REVIEW_REASON_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Reason code that explains the review outcome.', "DISPLAY_LABEL" 'Review Reason Code', "SEMANTIC_TYPE" 'reason'), 
	"SOURCE_DOCUMENT_TYPE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Type of source document that created the movement.', "DISPLAY_LABEL" 'Source Document Type', "SEMANTIC_TYPE" 'type'), 
	"SOURCE_DOCUMENT_NUMBER" VARCHAR2(50 CHAR) ANNOTATIONS("DESCRIPTION" 'Business source document reference for the movement.', "DISPLAY_LABEL" 'Source Document Number', "SEMANTIC_TYPE" 'reference_number'), 
	"NOTES" VARCHAR2(1000 CHAR) ANNOTATIONS("DESCRIPTION" 'Business notes for the stock movement.', "DISPLAY_LABEL" 'Notes', "SEMANTIC_TYPE" 'comment'), 
	 CONSTRAINT "CK_SCM_STOCK_MOVEMENTS_01" CHECK (movement_type_code in ('PUTAWAY', 'MOVE', 'REPLENISHMENT', 'STATUS_CHANGE')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_MOVEMENTS_02" CHECK (movement_status_code in ('OPEN', 'RELEASED', 'IN_PROGRESS', 'COMPLETED', 'REVIEW_REQUIRED', 'CANCELLED')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_MOVEMENTS_03" CHECK (review_status_code in ('OPEN', 'REVIEW_REQUIRED', 'APPROVED', 'REJECTED', 'RESOLVED')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_MOVEMENTS_04" CHECK (from_status_code is null or from_status_code in ('AVAILABLE', 'RESERVED', 'PICKED', 'PACKED', 'IN_TRANSIT', 'QUARANTINE', 'DAMAGED', 'BLOCKED')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_MOVEMENTS_05" CHECK (to_status_code is null or to_status_code in ('AVAILABLE', 'RESERVED', 'PICKED', 'PACKED', 'IN_TRANSIT', 'QUARANTINE', 'DAMAGED', 'BLOCKED')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_MOVEMENTS_06" CHECK (requested_quantity > 0 and moved_quantity >= 0 and moved_quantity <= requested_quantity) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_MOVEMENTS_07" CHECK (source_location_id is null or destination_location_id is null or source_location_id <> destination_location_id) ENABLE, 
	 CONSTRAINT "PK_SCM_STOCK_MOVEMENTS" PRIMARY KEY ("STOCK_MOVEMENT_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_STOCK_MOVEMENTS_01" UNIQUE ("MOVEMENT_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores executable putaway, internal movement, and replenishment records.', "DISPLAY_LABEL" 'Stock Movements') ;

  CREATE TABLE "SCM_STOCK_TRANSFERS" 
   (	"STOCK_TRANSFER_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the stock transfer.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Stock Transfer ID', "SEMANTIC_TYPE" 'identifier'), 
	"TRANSFER_NUMBER" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reference used to identify the stock transfer.', "DISPLAY_LABEL" 'Transfer Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'reference_number', "VALUE_REQUIRED" 'true'), 
	"FROM_WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Warehouse sending the stock.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'From Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"TO_WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Warehouse receiving the stock.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'To Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"ASSIGNED_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user assigned to work on the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Assigned User ID', "SEMANTIC_TYPE" 'identifier'), 
	"TRANSFER_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'DRAFT' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include DRAFT, RELEASED, IN_TRANSIT, PART_RECEIVED, REVIEW_REQUIRED, COMPLETED, CANCELLED.', "DESCRIPTION" 'Current business status of the stock transfer.', "DISPLAY_LABEL" 'Transfer Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"REVIEW_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'OPEN' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include OPEN, REVIEW_REQUIRED, APPROVED, REJECTED, RESOLVED.', "DESCRIPTION" 'Current review status of the record.', "DISPLAY_LABEL" 'Review Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"REQUESTED_SHIP_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Requested shipment date and time for the transfer.', "DISPLAY_LABEL" 'Requested Ship At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"ACTUAL_SHIPPED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Actual shipment date and time for the transfer.', "DISPLAY_LABEL" 'Actual Shipped At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"EXPECTED_RECEIPT_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Expected receipt date and time at the destination warehouse.', "DISPLAY_LABEL" 'Expected Receipt At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"ACTUAL_RECEIVED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Actual receipt date and time at the destination warehouse.', "DISPLAY_LABEL" 'Actual Received At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"REQUESTED_BY_USER_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Application user who requested the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Requested By User ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"REVIEWED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Application user who reviewed the record.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Reviewed By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"REVIEWED_AT" TIMESTAMP (6) WITH TIME ZONE ANNOTATIONS("DESCRIPTION" 'Date and time when the record was reviewed.', "DISPLAY_LABEL" 'Reviewed At', "FORMAT_MASK" 'DD-MON-YYYY HH24:MI TZH:TZM', "SEMANTIC_TYPE" 'datetime'), 
	"REVIEW_REASON_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Reason code that explains the review outcome or exception handling decision.', "DISPLAY_LABEL" 'Review Reason Code', "SEMANTIC_TYPE" 'reason'), 
	"REASON_CODE" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business reason for the transfer.', "DISPLAY_LABEL" 'Reason Code', "SEMANTIC_TYPE" 'reason_code', "VALUE_REQUIRED" 'true'), 
	"NOTES" VARCHAR2(1000 CHAR) ANNOTATIONS("DESCRIPTION" 'Business notes for the stock transfer.', "DISPLAY_LABEL" 'Notes', "SEMANTIC_TYPE" 'comment'), 
	 CONSTRAINT "CK_SCM_STOCK_TRANSFERS_01" CHECK (from_warehouse_id <> to_warehouse_id) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_TRANSFERS_02" CHECK (transfer_status_code in ('DRAFT', 'RELEASED', 'IN_TRANSIT', 'PART_RECEIVED', 'REVIEW_REQUIRED', 'COMPLETED', 'CANCELLED')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_TRANSFERS_03" CHECK (review_status_code in ('OPEN', 'REVIEW_REQUIRED', 'APPROVED', 'REJECTED', 'RESOLVED')) ENABLE, 
	 CONSTRAINT "PK_SCM_STOCK_TRANSFERS" PRIMARY KEY ("STOCK_TRANSFER_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_STOCK_TRANSFERS_01" UNIQUE ("TRANSFER_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for stock transfers.', "DISPLAY_LABEL" 'Stock Transfers') ;

  CREATE TABLE "SCM_STOCK_TRANSFER_LINES" 
   (	"STOCK_TRANSFER_LINE_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the stock transfer line.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Stock Transfer Line ID', "SEMANTIC_TYPE" 'identifier'), 
	"STOCK_TRANSFER_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Stock transfer that the line belongs to.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Stock Transfer ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"LINE_NUMBER" NUMBER(10,0) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Line number within the stock transfer.', "DISPLAY_LABEL" 'Line Number', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'sequence', "VALUE_REQUIRED" 'true'), 
	"ITEM_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Item being transferred.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Item ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"INVENTORY_LOT_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Lot being transferred where lot control applies.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Inventory Lot ID', "SEMANTIC_TYPE" 'identifier'), 
	"SOURCE_LOCATION_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Location the stock is transferred from where known.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Source Location ID', "SEMANTIC_TYPE" 'identifier'), 
	"DESTINATION_LOCATION_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Target location in the receiving warehouse where known.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Destination Location ID', "SEMANTIC_TYPE" 'identifier'), 
	"REQUESTED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity requested for transfer.', "DISPLAY_LABEL" 'Requested Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity', "VALUE_REQUIRED" 'true'), 
	"SHIPPED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity actually shipped.', "DISPLAY_LABEL" 'Shipped Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"RECEIVED_QUANTITY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Quantity actually received by the destination warehouse.', "DISPLAY_LABEL" 'Received Quantity', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"QUANTITY_DISCREPANCY" NUMBER(14,4) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Difference between shipped quantity and received quantity.', "DISPLAY_IN_FORM" 'false', "DISPLAY_LABEL" 'Quantity Discrepancy', "FORMAT_MASK" 'FM999G999G999G990', "SEMANTIC_TYPE" 'quantity'), 
	"LINE_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'OPEN' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include OPEN, SHIPPED, PART_RECEIVED, REVIEW_REQUIRED, COMPLETED, CANCELLED.', "DESCRIPTION" 'Current business status of the transfer line.', "DISPLAY_LABEL" 'Line Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"DISCREPANCY_REASON_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Reason code that explains the discrepancy on the line.', "DISPLAY_LABEL" 'Discrepancy Reason Code', "SEMANTIC_TYPE" 'reason'), 
	 CONSTRAINT "CK_SCM_STOCK_TRANSFER_LINES_01" CHECK (line_status_code in ('OPEN', 'SHIPPED', 'PART_RECEIVED', 'REVIEW_REQUIRED', 'COMPLETED', 'CANCELLED')) ENABLE, 
	 CONSTRAINT "CK_SCM_STOCK_TRANSFER_LINES_02" CHECK (requested_quantity >= 0 and shipped_quantity >= 0 and received_quantity >= 0) ENABLE, 
	 CONSTRAINT "PK_SCM_STOCK_TRANSFER_LINES" PRIMARY KEY ("STOCK_TRANSFER_LINE_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_STOCK_TRANSFER_LINES_01" UNIQUE ("STOCK_TRANSFER_ID", "LINE_NUMBER")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for stock transfer lines.', "DISPLAY_LABEL" 'Stock Transfer Lines') ;

  CREATE TABLE "SCM_STORAGE_LOCATIONS" 
   (	"STORAGE_LOCATION_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the storage location.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Storage Location ID', "SEMANTIC_TYPE" 'identifier'), 
	"WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Warehouse that contains the storage location.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"WAREHOUSE_AREA_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Area that contains the storage location.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse Area ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"PARENT_LOCATION_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Parent location when the location is part of a hierarchy.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Parent Location ID', "SEMANTIC_TYPE" 'identifier'), 
	"LOCATION_CODE" VARCHAR2(50 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business code used to identify the storage location.', "DISPLAY_LABEL" 'Location Code', "SEMANTIC_TYPE" 'code', "VALUE_REQUIRED" 'true'), 
	"LOCATION_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business name of the storage location.', "DISPLAY_LABEL" 'Location Name', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'name'), 
	"LOCATION_TYPE_CODE" VARCHAR2(20 CHAR) NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include RECEIVING, STORAGE, PICKING, QUARANTINE, RETURNS, DISPATCH, STAGING, BIN.', "DESCRIPTION" 'Business purpose of the storage location.', "DISPLAY_LABEL" 'Location Type', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'type', "VALUE_REQUIRED" 'true'), 
	"LOCATION_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'ACTIVE' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include ACTIVE, INACTIVE, BLOCKED.', "DESCRIPTION" 'Current operating status of the location.', "DISPLAY_LABEL" 'Location Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"AISLE_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Aisle identifier used for warehouse navigation.', "DISPLAY_LABEL" 'Aisle Code', "SEMANTIC_TYPE" 'code'), 
	"BAY_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Bay identifier used for warehouse navigation.', "DISPLAY_LABEL" 'Bay Code', "SEMANTIC_TYPE" 'code'), 
	"LEVEL_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Level or shelf identifier used for warehouse navigation.', "DISPLAY_LABEL" 'Level Code', "SEMANTIC_TYPE" 'code'), 
	"POSITION_CODE" VARCHAR2(30 CHAR) ANNOTATIONS("DESCRIPTION" 'Position identifier within the location.', "DISPLAY_LABEL" 'Position Code', "SEMANTIC_TYPE" 'code'), 
	"IS_PICKABLE" BOOLEAN DEFAULT false NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether stock can be picked directly from this location.', "DISPLAY_LABEL" 'Is Pickable', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'flag'), 
	"IS_ACTIVE" BOOLEAN DEFAULT true NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the location is active for operations.', "DISPLAY_LABEL" 'Is Active', "SEMANTIC_TYPE" 'flag'), 
	 CONSTRAINT "CK_SCM_STORAGE_LOCATIONS_01" CHECK (location_type_code in ('RECEIVING', 'STORAGE', 'PICKING', 'QUARANTINE', 'RETURNS', 'DISPATCH', 'STAGING', 'BIN')) ENABLE, 
	 CONSTRAINT "CK_SCM_STORAGE_LOCATIONS_02" CHECK (location_status_code in ('ACTIVE', 'INACTIVE', 'BLOCKED')) ENABLE, 
	 CONSTRAINT "PK_SCM_STORAGE_LOCATIONS" PRIMARY KEY ("STORAGE_LOCATION_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_STORAGE_LOCATIONS_01" UNIQUE ("WAREHOUSE_ID", "LOCATION_CODE")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for storage locations.', "DISPLAY_LABEL" 'Storage Locations') ;

  CREATE TABLE "SCM_USER_ROLES" 
   (	"USER_ROLE_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the application role.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'User Role ID', "SEMANTIC_TYPE" 'identifier'), 
	"ROLE_CODE" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business code used to identify the role.', "DISPLAY_LABEL" 'Role Code', "SEMANTIC_TYPE" 'code', "VALUE_REQUIRED" 'true'), 
	"ROLE_NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business name of the role.', "DISPLAY_LABEL" 'Role Name', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'name', "VALUE_REQUIRED" 'true'), 
	"ROLE_SCOPE_CODE" VARCHAR2(20 CHAR) DEFAULT 'WAREHOUSE' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include ENTERPRISE, WAREHOUSE, QUALITY, FINANCE, ADMIN.', "DESCRIPTION" 'Business scope covered by the role.', "DISPLAY_LABEL" 'Role Scope', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'scope'), 
	"APPROVAL_AUTHORITY_LEVEL" NUMBER(4,0) DEFAULT 0 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Standard approval authority level attached to the role.', "DISPLAY_LABEL" 'Approval Authority Level', "SEARCH_FACET" 'range', "SEMANTIC_TYPE" 'ranking'), 
	"IS_SYSTEM_ROLE" BOOLEAN DEFAULT true NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the role is delivered as a system-defined role.', "DISPLAY_LABEL" 'Is System Role', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'flag'), 
	"IS_ACTIVE" BOOLEAN DEFAULT true NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the role is active for assignment.', "DISPLAY_LABEL" 'Is Active', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'flag'), 
	"ROLE_NOTES" VARCHAR2(500 CHAR) ANNOTATIONS("DESCRIPTION" 'Business notes for the role.', "DISPLAY_LABEL" 'Role Notes', "SEMANTIC_TYPE" 'comment'), 
	 CONSTRAINT "CK_SCM_USER_ROLES_01" CHECK ( 
        role_code in ( 
            'ADMINISTRATOR', 
            'WAREHOUSE_MANAGER', 
            'INVENTORY_CONTROLLER', 
            'OPERATIONS_USER', 
            'QUALITY_USER', 
            'BUSINESS_VIEWER' 
        ) 
    ) ENABLE, 
	 CONSTRAINT "CK_SCM_USER_ROLES_02" CHECK ( 
        role_scope_code in ( 
            'ENTERPRISE', 
            'WAREHOUSE', 
            'QUALITY', 
            'FINANCE', 
            'ADMIN' 
        ) 
    ) ENABLE, 
	 CONSTRAINT "CK_SCM_USER_ROLES_03" CHECK (approval_authority_level >= 0) ENABLE, 
	 CONSTRAINT "PK_SCM_USER_ROLES" PRIMARY KEY ("USER_ROLE_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_USER_ROLES_01" UNIQUE ("ROLE_CODE")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for user roles.', "DISPLAY_LABEL" 'User Roles') ;

  CREATE TABLE "SCM_USER_ROLE_ASSIGNMENTS" 
   (	"USER_ROLE_ASSIGNMENT_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the user role assignment.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'User Role Assignment ID', "SEMANTIC_TYPE" 'identifier'), 
	"APPLICATION_USER_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'User receiving the role assignment.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Application User ID', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"USER_ROLE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Role assigned to the user.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'User Role ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"WAREHOUSE_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'Warehouse where the assignment applies where the role is site specific.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse ID', "SEMANTIC_TYPE" 'identifier'), 
	"ASSIGNMENT_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'ACTIVE' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include ACTIVE, INACTIVE.', "DESCRIPTION" 'Current business status of the role assignment.', "DISPLAY_LABEL" 'Assignment Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"AUTHORITY_LEVEL_OVERRIDE" NUMBER(4,0) ANNOTATIONS("DESCRIPTION" 'Role authority level override for this specific assignment where needed.', "DISPLAY_LABEL" 'Authority Level Override', "SEMANTIC_TYPE" 'ranking'), 
	"EFFECTIVE_FROM_DATE" DATE DEFAULT trunc(sysdate) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Date when the role assignment starts.', "DISPLAY_LABEL" 'Effective From Date', "FORMAT_MASK" 'DD-MON-YYYY', "SEMANTIC_TYPE" 'date'), 
	"EFFECTIVE_TO_DATE" DATE ANNOTATIONS("DESCRIPTION" 'Date when the role assignment ends where known.', "DISPLAY_LABEL" 'Effective To Date', "FORMAT_MASK" 'DD-MON-YYYY', "SEMANTIC_TYPE" 'date'), 
	"ASSIGNED_BY_USER_ID" NUMBER ANNOTATIONS("DESCRIPTION" 'User who assigned the role.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Assigned By User ID', "SEMANTIC_TYPE" 'identifier'), 
	"IS_PRIMARY_ROLE" BOOLEAN DEFAULT false NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Indicates whether the role is the user''s primary working role.', "DISPLAY_LABEL" 'Is Primary Role', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'flag'), 
	"ASSIGNMENT_NOTES" VARCHAR2(500 CHAR) ANNOTATIONS("DESCRIPTION" 'Business notes for the role assignment.', "DISPLAY_LABEL" 'Assignment Notes', "SEMANTIC_TYPE" 'comment'), 
	 CONSTRAINT "CK_SCM_USER_ROLE_ASSIGNMENTS_01" CHECK (assignment_status_code in ('ACTIVE', 'INACTIVE')) ENABLE, 
	 CONSTRAINT "CK_SCM_USER_ROLE_ASSIGNMENTS_02" CHECK (effective_to_date is null or effective_to_date >= effective_from_date) ENABLE, 
	 CONSTRAINT "CK_SCM_USER_ROLE_ASSIGNMENTS_03" CHECK (authority_level_override is null or authority_level_override >= 0) ENABLE, 
	 CONSTRAINT "PK_SCM_USER_ROLE_ASSIGNMENTS" PRIMARY KEY ("USER_ROLE_ASSIGNMENT_ID")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for user role assignments.', "DISPLAY_LABEL" 'User Role Assignments') ;

  CREATE TABLE "SCM_WAREHOUSE_AREAS" 
   (	"WAREHOUSE_AREA_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 100 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Surrogate key for the warehouse area.', "DISPLAY_IN_FORM" 'false', "DISPLAY_IN_REPORT" 'false', "DISPLAY_LABEL" 'Warehouse Area ID', "SEMANTIC_TYPE" 'identifier'), 
	"WAREHOUSE_ID" NUMBER NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Warehouse that contains the area.', "DISPLAY_AS_LOV" 'select-list', "DISPLAY_LABEL" 'Warehouse ID', "SEMANTIC_TYPE" 'identifier', "VALUE_REQUIRED" 'true'), 
	"AREA_CODE" VARCHAR2(30 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business code used to identify the area within the warehouse.', "DISPLAY_LABEL" 'Area Code', "SEMANTIC_TYPE" 'code', "VALUE_REQUIRED" 'true'), 
	"AREA_NAME" VARCHAR2(200 CHAR) NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Business name of the warehouse area.', "DISPLAY_LABEL" 'Area Name', "PRIMARY_DISPLAY_COLUMN" 'true', "SEMANTIC_TYPE" 'name', "VALUE_REQUIRED" 'true'), 
	"AREA_TYPE_CODE" VARCHAR2(20 CHAR) NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include RECEIVING, STORAGE, PICKING, QUARANTINE, RETURNS, DISPATCH, STAGING.', "DESCRIPTION" 'Business purpose of the area such as receiving, storage, picking, quarantine, or dispatch.', "DISPLAY_LABEL" 'Area Type', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'type', "VALUE_REQUIRED" 'true'), 
	"AREA_STATUS_CODE" VARCHAR2(20 CHAR) DEFAULT 'ACTIVE' NOT NULL ENABLE ANNOTATIONS("AI_CONTEXT" 'Valid values include ACTIVE, INACTIVE, BLOCKED.', "DESCRIPTION" 'Current operating status of the area.', "DISPLAY_LABEL" 'Area Status', "SEARCH_FACET" 'distinct-list', "SEMANTIC_TYPE" 'status'), 
	"SEQUENCE_NUMBER" NUMBER(10,0) DEFAULT 10 NOT NULL ENABLE ANNOTATIONS("DESCRIPTION" 'Display or operational sequence of the area within the warehouse.', "DISPLAY_LABEL" 'Sequence Number', "SEMANTIC_TYPE" 'sequence'), 
	"NOTES" VARCHAR2(500 CHAR) ANNOTATIONS("DESCRIPTION" 'Business notes for the warehouse area.', "DISPLAY_LABEL" 'Notes', "SEMANTIC_TYPE" 'comment'), 
	 CONSTRAINT "CK_SCM_WAREHOUSE_AREAS_01" CHECK (area_type_code in ('RECEIVING', 'STORAGE', 'PICKING', 'QUARANTINE', 'RETURNS', 'DISPATCH', 'STAGING')) ENABLE, 
	 CONSTRAINT "CK_SCM_WAREHOUSE_AREAS_02" CHECK (area_status_code in ('ACTIVE', 'INACTIVE', 'BLOCKED')) ENABLE, 
	 CONSTRAINT "PK_SCM_WAREHOUSE_AREAS" PRIMARY KEY ("WAREHOUSE_AREA_ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_SCM_WAREHOUSE_AREAS_01" UNIQUE ("WAREHOUSE_ID", "AREA_CODE")
  USING INDEX  ENABLE
   ) 
  ANNOTATIONS("DESCRIPTION" 'Stores records for warehouse areas.', "DISPLAY_LABEL" 'Warehouse Areas') ;

  ALTER TABLE "SCM_APPLICATION_USERS" ADD CONSTRAINT "FK_SCM_APPLICATION_USERS_01" FOREIGN KEY ("DEFAULT_WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_APPLICATION_USERS" ADD CONSTRAINT "FK_SCM_APPLICATION_USERS_02" FOREIGN KEY ("MANAGER_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;

  ALTER TABLE "SCM_BUSINESS_LIST_VALUES" ADD CONSTRAINT "FK_SCM_BUSINESS_LIST_VALUES_01" FOREIGN KEY ("BUSINESS_LIST_ID")
	  REFERENCES "SCM_BUSINESS_LISTS" ("BUSINESS_LIST_ID") ENABLE;

  ALTER TABLE "SCM_INBOUND_RECEIPTS" ADD CONSTRAINT "FK_SCM_INBOUND_RECEIPTS_01" FOREIGN KEY ("WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_INBOUND_RECEIPTS" ADD CONSTRAINT "FK_SCM_INBOUND_RECEIPTS_02" FOREIGN KEY ("SOURCE_PARTNER_ID")
	  REFERENCES "SCM_BUSINESS_PARTNERS" ("BUSINESS_PARTNER_ID") ENABLE;
  ALTER TABLE "SCM_INBOUND_RECEIPTS" ADD CONSTRAINT "FK_SCM_INBOUND_RECEIPTS_03" FOREIGN KEY ("SOURCE_SITE_ID")
	  REFERENCES "SCM_PARTNER_SITES" ("PARTNER_SITE_ID") ENABLE;
  ALTER TABLE "SCM_INBOUND_RECEIPTS" ADD CONSTRAINT "FK_SCM_INBOUND_RECEIPTS_04" FOREIGN KEY ("ASSIGNED_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_INBOUND_RECEIPTS" ADD CONSTRAINT "FK_SCM_INBOUND_RECEIPTS_05" FOREIGN KEY ("RECEIVED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_INBOUND_RECEIPTS" ADD CONSTRAINT "FK_SCM_INBOUND_RECEIPTS_06" FOREIGN KEY ("REVIEWED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;

  CREATE INDEX "IDX_SCM_INBOUND_RECEIPTS_01" ON "SCM_INBOUND_RECEIPTS" ("WAREHOUSE_ID", "RECEIPT_STATUS_CODE", "REVIEW_STATUS_CODE") 
  ;

  ALTER TABLE "SCM_INBOUND_RECEIPT_LINES" ADD CONSTRAINT "FK_SCM_INBOUND_RECEIPT_LINES_01" FOREIGN KEY ("INBOUND_RECEIPT_ID")
	  REFERENCES "SCM_INBOUND_RECEIPTS" ("INBOUND_RECEIPT_ID") ENABLE;
  ALTER TABLE "SCM_INBOUND_RECEIPT_LINES" ADD CONSTRAINT "FK_SCM_INBOUND_RECEIPT_LINES_02" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;
  ALTER TABLE "SCM_INBOUND_RECEIPT_LINES" ADD CONSTRAINT "FK_SCM_INBOUND_RECEIPT_LINES_03" FOREIGN KEY ("INVENTORY_LOT_ID")
	  REFERENCES "SCM_INVENTORY_LOTS" ("INVENTORY_LOT_ID") ENABLE;
  ALTER TABLE "SCM_INBOUND_RECEIPT_LINES" ADD CONSTRAINT "FK_SCM_INBOUND_RECEIPT_LINES_04" FOREIGN KEY ("RECEIVING_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;
  ALTER TABLE "SCM_INBOUND_RECEIPT_LINES" ADD CONSTRAINT "FK_SCM_INBOUND_RECEIPT_LINES_05" FOREIGN KEY ("FINAL_PUTAWAY_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;

  ALTER TABLE "SCM_INVENTORY_BALANCES" ADD CONSTRAINT "FK_SCM_INVENTORY_BALANCES_01" FOREIGN KEY ("WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_INVENTORY_BALANCES" ADD CONSTRAINT "FK_SCM_INVENTORY_BALANCES_02" FOREIGN KEY ("STORAGE_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;
  ALTER TABLE "SCM_INVENTORY_BALANCES" ADD CONSTRAINT "FK_SCM_INVENTORY_BALANCES_03" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;
  ALTER TABLE "SCM_INVENTORY_BALANCES" ADD CONSTRAINT "FK_SCM_INVENTORY_BALANCES_04" FOREIGN KEY ("INVENTORY_LOT_ID")
	  REFERENCES "SCM_INVENTORY_LOTS" ("INVENTORY_LOT_ID") ENABLE;

  CREATE INDEX "IDX_SCM_INVENTORY_BALANCES_01" ON "SCM_INVENTORY_BALANCES" ("ITEM_ID", "WAREHOUSE_ID", "STOCK_STATUS_CODE") 
  ;

  CREATE INDEX "IDX_SCM_INVENTORY_BALANCES_02" ON "SCM_INVENTORY_BALANCES" ("STORAGE_LOCATION_ID", "ITEM_ID") 
  ;

  ALTER TABLE "SCM_INVENTORY_LOTS" ADD CONSTRAINT "FK_SCM_INVENTORY_LOTS_01" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;

  ALTER TABLE "SCM_ITEMS" ADD CONSTRAINT "FK_SCM_ITEMS_01" FOREIGN KEY ("OWNER_CUSTOMER_PARTNER_ID")
	  REFERENCES "SCM_BUSINESS_PARTNERS" ("BUSINESS_PARTNER_ID") ENABLE;

  ALTER TABLE "SCM_ITEM_SERIALS" ADD CONSTRAINT "FK_SCM_ITEM_SERIALS_01" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;
  ALTER TABLE "SCM_ITEM_SERIALS" ADD CONSTRAINT "FK_SCM_ITEM_SERIALS_02" FOREIGN KEY ("INVENTORY_LOT_ID")
	  REFERENCES "SCM_INVENTORY_LOTS" ("INVENTORY_LOT_ID") ENABLE;
  ALTER TABLE "SCM_ITEM_SERIALS" ADD CONSTRAINT "FK_SCM_ITEM_SERIALS_03" FOREIGN KEY ("CURRENT_WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_ITEM_SERIALS" ADD CONSTRAINT "FK_SCM_ITEM_SERIALS_04" FOREIGN KEY ("CURRENT_STORAGE_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;

  ALTER TABLE "SCM_ITEM_WAREHOUSE_POLICIES" ADD CONSTRAINT "FK_SCM_ITEM_WAREHOUSE_POLICIES_01" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;
  ALTER TABLE "SCM_ITEM_WAREHOUSE_POLICIES" ADD CONSTRAINT "FK_SCM_ITEM_WAREHOUSE_POLICIES_02" FOREIGN KEY ("WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;

  ALTER TABLE "SCM_OPERATIONAL_EXCEPTIONS" ADD CONSTRAINT "FK_SCM_OPERATIONAL_EXCEPTIONS_01" FOREIGN KEY ("WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_OPERATIONAL_EXCEPTIONS" ADD CONSTRAINT "FK_SCM_OPERATIONAL_EXCEPTIONS_02" FOREIGN KEY ("STORAGE_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;
  ALTER TABLE "SCM_OPERATIONAL_EXCEPTIONS" ADD CONSTRAINT "FK_SCM_OPERATIONAL_EXCEPTIONS_03" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;
  ALTER TABLE "SCM_OPERATIONAL_EXCEPTIONS" ADD CONSTRAINT "FK_SCM_OPERATIONAL_EXCEPTIONS_04" FOREIGN KEY ("INVENTORY_LOT_ID")
	  REFERENCES "SCM_INVENTORY_LOTS" ("INVENTORY_LOT_ID") ENABLE;
  ALTER TABLE "SCM_OPERATIONAL_EXCEPTIONS" ADD CONSTRAINT "FK_SCM_OPERATIONAL_EXCEPTIONS_05" FOREIGN KEY ("ITEM_SERIAL_ID")
	  REFERENCES "SCM_ITEM_SERIALS" ("ITEM_SERIAL_ID") ENABLE;
  ALTER TABLE "SCM_OPERATIONAL_EXCEPTIONS" ADD CONSTRAINT "FK_SCM_OPERATIONAL_EXCEPTIONS_06" FOREIGN KEY ("ASSIGNED_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_OPERATIONAL_EXCEPTIONS" ADD CONSTRAINT "FK_SCM_OPERATIONAL_EXCEPTIONS_07" FOREIGN KEY ("REPORTED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_OPERATIONAL_EXCEPTIONS" ADD CONSTRAINT "FK_SCM_OPERATIONAL_EXCEPTIONS_08" FOREIGN KEY ("REVIEWED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;

  CREATE INDEX "IDX_SCM_OPERATIONAL_EXCEPTIONS_01" ON "SCM_OPERATIONAL_EXCEPTIONS" ("WAREHOUSE_ID", "REVIEW_STATUS_CODE", "SEVERITY_CODE") 
  ;

  ALTER TABLE "SCM_OUTBOUND_ORDERS" ADD CONSTRAINT "FK_SCM_OUTBOUND_ORDERS_01" FOREIGN KEY ("SHIP_FROM_WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_OUTBOUND_ORDERS" ADD CONSTRAINT "FK_SCM_OUTBOUND_ORDERS_02" FOREIGN KEY ("CUSTOMER_PARTNER_ID")
	  REFERENCES "SCM_BUSINESS_PARTNERS" ("BUSINESS_PARTNER_ID") ENABLE;
  ALTER TABLE "SCM_OUTBOUND_ORDERS" ADD CONSTRAINT "FK_SCM_OUTBOUND_ORDERS_03" FOREIGN KEY ("SHIP_TO_SITE_ID")
	  REFERENCES "SCM_PARTNER_SITES" ("PARTNER_SITE_ID") ENABLE;
  ALTER TABLE "SCM_OUTBOUND_ORDERS" ADD CONSTRAINT "FK_SCM_OUTBOUND_ORDERS_04" FOREIGN KEY ("CARRIER_PARTNER_ID")
	  REFERENCES "SCM_BUSINESS_PARTNERS" ("BUSINESS_PARTNER_ID") ENABLE;
  ALTER TABLE "SCM_OUTBOUND_ORDERS" ADD CONSTRAINT "FK_SCM_OUTBOUND_ORDERS_05" FOREIGN KEY ("ASSIGNED_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_OUTBOUND_ORDERS" ADD CONSTRAINT "FK_SCM_OUTBOUND_ORDERS_06" FOREIGN KEY ("PICKED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_OUTBOUND_ORDERS" ADD CONSTRAINT "FK_SCM_OUTBOUND_ORDERS_07" FOREIGN KEY ("PACKED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_OUTBOUND_ORDERS" ADD CONSTRAINT "FK_SCM_OUTBOUND_ORDERS_08" FOREIGN KEY ("DISPATCHED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;

  CREATE INDEX "IDX_SCM_OUTBOUND_ORDERS_01" ON "SCM_OUTBOUND_ORDERS" ("SHIP_FROM_WAREHOUSE_ID", "OUTBOUND_STATUS_CODE") 
  ;

  ALTER TABLE "SCM_OUTBOUND_ORDER_LINES" ADD CONSTRAINT "FK_SCM_OUTBOUND_ORDER_LINES_01" FOREIGN KEY ("OUTBOUND_ORDER_ID")
	  REFERENCES "SCM_OUTBOUND_ORDERS" ("OUTBOUND_ORDER_ID") ENABLE;
  ALTER TABLE "SCM_OUTBOUND_ORDER_LINES" ADD CONSTRAINT "FK_SCM_OUTBOUND_ORDER_LINES_02" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;
  ALTER TABLE "SCM_OUTBOUND_ORDER_LINES" ADD CONSTRAINT "FK_SCM_OUTBOUND_ORDER_LINES_03" FOREIGN KEY ("PREFERRED_LOT_ID")
	  REFERENCES "SCM_INVENTORY_LOTS" ("INVENTORY_LOT_ID") ENABLE;

  ALTER TABLE "SCM_PARTNER_SITES" ADD CONSTRAINT "FK_SCM_PARTNER_SITES_01" FOREIGN KEY ("BUSINESS_PARTNER_ID")
	  REFERENCES "SCM_BUSINESS_PARTNERS" ("BUSINESS_PARTNER_ID") ENABLE;

  ALTER TABLE "SCM_REPLENISHMENT_ALERTS" ADD CONSTRAINT "FK_SCM_REPLENISHMENT_ALERTS_01" FOREIGN KEY ("WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_REPLENISHMENT_ALERTS" ADD CONSTRAINT "FK_SCM_REPLENISHMENT_ALERTS_02" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;
  ALTER TABLE "SCM_REPLENISHMENT_ALERTS" ADD CONSTRAINT "FK_SCM_REPLENISHMENT_ALERTS_03" FOREIGN KEY ("ITEM_WAREHOUSE_POLICY_ID")
	  REFERENCES "SCM_ITEM_WAREHOUSE_POLICIES" ("ITEM_WAREHOUSE_POLICY_ID") ENABLE;
  ALTER TABLE "SCM_REPLENISHMENT_ALERTS" ADD CONSTRAINT "FK_SCM_REPLENISHMENT_ALERTS_04" FOREIGN KEY ("PICK_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;
  ALTER TABLE "SCM_REPLENISHMENT_ALERTS" ADD CONSTRAINT "FK_SCM_REPLENISHMENT_ALERTS_05" FOREIGN KEY ("RESERVE_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;
  ALTER TABLE "SCM_REPLENISHMENT_ALERTS" ADD CONSTRAINT "FK_SCM_REPLENISHMENT_ALERTS_06" FOREIGN KEY ("REVIEWED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;

  ALTER TABLE "SCM_RETURNS" ADD CONSTRAINT "FK_SCM_RETURNS_01" FOREIGN KEY ("WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_RETURNS" ADD CONSTRAINT "FK_SCM_RETURNS_02" FOREIGN KEY ("SOURCE_PARTNER_ID")
	  REFERENCES "SCM_BUSINESS_PARTNERS" ("BUSINESS_PARTNER_ID") ENABLE;
  ALTER TABLE "SCM_RETURNS" ADD CONSTRAINT "FK_SCM_RETURNS_03" FOREIGN KEY ("SOURCE_SITE_ID")
	  REFERENCES "SCM_PARTNER_SITES" ("PARTNER_SITE_ID") ENABLE;
  ALTER TABLE "SCM_RETURNS" ADD CONSTRAINT "FK_SCM_RETURNS_04" FOREIGN KEY ("RELATED_OUTBOUND_ORDER_ID")
	  REFERENCES "SCM_OUTBOUND_ORDERS" ("OUTBOUND_ORDER_ID") ENABLE;
  ALTER TABLE "SCM_RETURNS" ADD CONSTRAINT "FK_SCM_RETURNS_05" FOREIGN KEY ("ASSIGNED_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_RETURNS" ADD CONSTRAINT "FK_SCM_RETURNS_06" FOREIGN KEY ("RECEIVED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_RETURNS" ADD CONSTRAINT "FK_SCM_RETURNS_07" FOREIGN KEY ("ASSESSED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_RETURNS" ADD CONSTRAINT "FK_SCM_RETURNS_08" FOREIGN KEY ("REVIEWED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;

  CREATE INDEX "IDX_SCM_RETURNS_01" ON "SCM_RETURNS" ("WAREHOUSE_ID", "RETURN_STATUS_CODE", "REVIEW_STATUS_CODE") 
  ;

  ALTER TABLE "SCM_RETURN_LINES" ADD CONSTRAINT "FK_SCM_RETURN_LINES_01" FOREIGN KEY ("RETURN_ID")
	  REFERENCES "SCM_RETURNS" ("RETURN_ID") ENABLE;
  ALTER TABLE "SCM_RETURN_LINES" ADD CONSTRAINT "FK_SCM_RETURN_LINES_02" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;
  ALTER TABLE "SCM_RETURN_LINES" ADD CONSTRAINT "FK_SCM_RETURN_LINES_03" FOREIGN KEY ("INVENTORY_LOT_ID")
	  REFERENCES "SCM_INVENTORY_LOTS" ("INVENTORY_LOT_ID") ENABLE;

  ALTER TABLE "SCM_STOCK_ADJUSTMENTS" ADD CONSTRAINT "FK_SCM_STOCK_ADJUSTMENTS_01" FOREIGN KEY ("WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ADJUSTMENTS" ADD CONSTRAINT "FK_SCM_STOCK_ADJUSTMENTS_02" FOREIGN KEY ("ASSIGNED_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ADJUSTMENTS" ADD CONSTRAINT "FK_SCM_STOCK_ADJUSTMENTS_03" FOREIGN KEY ("REQUESTED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ADJUSTMENTS" ADD CONSTRAINT "FK_SCM_STOCK_ADJUSTMENTS_04" FOREIGN KEY ("REVIEWED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ADJUSTMENTS" ADD CONSTRAINT "FK_SCM_STOCK_ADJUSTMENTS_05" FOREIGN KEY ("APPLIED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;

  CREATE INDEX "IDX_SCM_STOCK_ADJUSTMENTS_01" ON "SCM_STOCK_ADJUSTMENTS" ("WAREHOUSE_ID", "ADJUSTMENT_STATUS_CODE") 
  ;

  ALTER TABLE "SCM_STOCK_ADJUSTMENT_LINES" ADD CONSTRAINT "FK_SCM_STOCK_ADJUSTMENT_LINES_01" FOREIGN KEY ("STOCK_ADJUSTMENT_ID")
	  REFERENCES "SCM_STOCK_ADJUSTMENTS" ("STOCK_ADJUSTMENT_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ADJUSTMENT_LINES" ADD CONSTRAINT "FK_SCM_STOCK_ADJUSTMENT_LINES_02" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ADJUSTMENT_LINES" ADD CONSTRAINT "FK_SCM_STOCK_ADJUSTMENT_LINES_03" FOREIGN KEY ("INVENTORY_LOT_ID")
	  REFERENCES "SCM_INVENTORY_LOTS" ("INVENTORY_LOT_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ADJUSTMENT_LINES" ADD CONSTRAINT "FK_SCM_STOCK_ADJUSTMENT_LINES_04" FOREIGN KEY ("ITEM_SERIAL_ID")
	  REFERENCES "SCM_ITEM_SERIALS" ("ITEM_SERIAL_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ADJUSTMENT_LINES" ADD CONSTRAINT "FK_SCM_STOCK_ADJUSTMENT_LINES_05" FOREIGN KEY ("STORAGE_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;

  ALTER TABLE "SCM_STOCK_ALLOCATIONS" ADD CONSTRAINT "FK_SCM_STOCK_ALLOCATIONS_01" FOREIGN KEY ("OUTBOUND_ORDER_LINE_ID")
	  REFERENCES "SCM_OUTBOUND_ORDER_LINES" ("OUTBOUND_ORDER_LINE_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ALLOCATIONS" ADD CONSTRAINT "FK_SCM_STOCK_ALLOCATIONS_02" FOREIGN KEY ("INVENTORY_BALANCE_ID")
	  REFERENCES "SCM_INVENTORY_BALANCES" ("INVENTORY_BALANCE_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ALLOCATIONS" ADD CONSTRAINT "FK_SCM_STOCK_ALLOCATIONS_03" FOREIGN KEY ("WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ALLOCATIONS" ADD CONSTRAINT "FK_SCM_STOCK_ALLOCATIONS_04" FOREIGN KEY ("SOURCE_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ALLOCATIONS" ADD CONSTRAINT "FK_SCM_STOCK_ALLOCATIONS_05" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ALLOCATIONS" ADD CONSTRAINT "FK_SCM_STOCK_ALLOCATIONS_06" FOREIGN KEY ("INVENTORY_LOT_ID")
	  REFERENCES "SCM_INVENTORY_LOTS" ("INVENTORY_LOT_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ALLOCATIONS" ADD CONSTRAINT "FK_SCM_STOCK_ALLOCATIONS_07" FOREIGN KEY ("ITEM_SERIAL_ID")
	  REFERENCES "SCM_ITEM_SERIALS" ("ITEM_SERIAL_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ALLOCATIONS" ADD CONSTRAINT "FK_SCM_STOCK_ALLOCATIONS_08" FOREIGN KEY ("ALLOCATED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ALLOCATIONS" ADD CONSTRAINT "FK_SCM_STOCK_ALLOCATIONS_09" FOREIGN KEY ("PICKED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ALLOCATIONS" ADD CONSTRAINT "FK_SCM_STOCK_ALLOCATIONS_10" FOREIGN KEY ("PACKED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_ALLOCATIONS" ADD CONSTRAINT "FK_SCM_STOCK_ALLOCATIONS_11" FOREIGN KEY ("DISPATCHED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;

  CREATE INDEX "IDX_SCM_STOCK_ALLOCATIONS_01" ON "SCM_STOCK_ALLOCATIONS" ("OUTBOUND_ORDER_LINE_ID") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_ALLOCATIONS_02" ON "SCM_STOCK_ALLOCATIONS" ("INVENTORY_BALANCE_ID") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_ALLOCATIONS_03" ON "SCM_STOCK_ALLOCATIONS" ("WAREHOUSE_ID", "ITEM_ID", "ALLOCATION_STATUS_CODE") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_ALLOCATIONS_04" ON "SCM_STOCK_ALLOCATIONS" ("FIFO_BASIS_DATE", "ITEM_ID", "WAREHOUSE_ID") 
  ;

  ALTER TABLE "SCM_STOCK_COUNTS" ADD CONSTRAINT "FK_SCM_STOCK_COUNTS_01" FOREIGN KEY ("WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_COUNTS" ADD CONSTRAINT "FK_SCM_STOCK_COUNTS_02" FOREIGN KEY ("ASSIGNED_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_COUNTS" ADD CONSTRAINT "FK_SCM_STOCK_COUNTS_03" FOREIGN KEY ("REQUESTED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_COUNTS" ADD CONSTRAINT "FK_SCM_STOCK_COUNTS_04" FOREIGN KEY ("REVIEWED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_COUNTS" ADD CONSTRAINT "FK_SCM_STOCK_COUNTS_05" FOREIGN KEY ("WAREHOUSE_AREA_ID")
	  REFERENCES "SCM_WAREHOUSE_AREAS" ("WAREHOUSE_AREA_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_COUNTS" ADD CONSTRAINT "FK_SCM_STOCK_COUNTS_06" FOREIGN KEY ("STORAGE_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_COUNTS" ADD CONSTRAINT "FK_SCM_STOCK_COUNTS_07" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;

  CREATE INDEX "IDX_SCM_STOCK_COUNTS_01" ON "SCM_STOCK_COUNTS" ("WAREHOUSE_ID", "COUNT_STATUS_CODE", "REVIEW_STATUS_CODE") 
  ;

  ALTER TABLE "SCM_STOCK_COUNT_LINES" ADD CONSTRAINT "FK_SCM_STOCK_COUNT_LINES_01" FOREIGN KEY ("STOCK_COUNT_ID")
	  REFERENCES "SCM_STOCK_COUNTS" ("STOCK_COUNT_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_COUNT_LINES" ADD CONSTRAINT "FK_SCM_STOCK_COUNT_LINES_02" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_COUNT_LINES" ADD CONSTRAINT "FK_SCM_STOCK_COUNT_LINES_03" FOREIGN KEY ("STORAGE_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_COUNT_LINES" ADD CONSTRAINT "FK_SCM_STOCK_COUNT_LINES_04" FOREIGN KEY ("INVENTORY_LOT_ID")
	  REFERENCES "SCM_INVENTORY_LOTS" ("INVENTORY_LOT_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_COUNT_LINES" ADD CONSTRAINT "FK_SCM_STOCK_COUNT_LINES_05" FOREIGN KEY ("FIRST_COUNTED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_COUNT_LINES" ADD CONSTRAINT "FK_SCM_STOCK_COUNT_LINES_06" FOREIGN KEY ("REVIEWED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;

  ALTER TABLE "SCM_STOCK_MOVEMENTS" ADD CONSTRAINT "FK_SCM_STOCK_MOVEMENTS_01" FOREIGN KEY ("WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_MOVEMENTS" ADD CONSTRAINT "FK_SCM_STOCK_MOVEMENTS_02" FOREIGN KEY ("SOURCE_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_MOVEMENTS" ADD CONSTRAINT "FK_SCM_STOCK_MOVEMENTS_03" FOREIGN KEY ("DESTINATION_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_MOVEMENTS" ADD CONSTRAINT "FK_SCM_STOCK_MOVEMENTS_04" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_MOVEMENTS" ADD CONSTRAINT "FK_SCM_STOCK_MOVEMENTS_05" FOREIGN KEY ("INVENTORY_LOT_ID")
	  REFERENCES "SCM_INVENTORY_LOTS" ("INVENTORY_LOT_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_MOVEMENTS" ADD CONSTRAINT "FK_SCM_STOCK_MOVEMENTS_06" FOREIGN KEY ("ITEM_SERIAL_ID")
	  REFERENCES "SCM_ITEM_SERIALS" ("ITEM_SERIAL_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_MOVEMENTS" ADD CONSTRAINT "FK_SCM_STOCK_MOVEMENTS_07" FOREIGN KEY ("ASSIGNED_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_MOVEMENTS" ADD CONSTRAINT "FK_SCM_STOCK_MOVEMENTS_08" FOREIGN KEY ("REQUESTED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_MOVEMENTS" ADD CONSTRAINT "FK_SCM_STOCK_MOVEMENTS_09" FOREIGN KEY ("CONFIRMED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_MOVEMENTS" ADD CONSTRAINT "FK_SCM_STOCK_MOVEMENTS_10" FOREIGN KEY ("REVIEWED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;

  CREATE INDEX "IDX_SCM_STOCK_MOVEMENTS_02" ON "SCM_STOCK_MOVEMENTS" ("ITEM_ID", "SOURCE_LOCATION_ID", "DESTINATION_LOCATION_ID") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_MOVEMENTS_03" ON "SCM_STOCK_MOVEMENTS" ("SOURCE_DOCUMENT_TYPE", "SOURCE_DOCUMENT_NUMBER") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_MOVEMENTS_01" ON "SCM_STOCK_MOVEMENTS" ("WAREHOUSE_ID", "MOVEMENT_STATUS_CODE", "ASSIGNED_USER_ID") 
  ;

  ALTER TABLE "SCM_STOCK_TRANSFERS" ADD CONSTRAINT "FK_SCM_STOCK_TRANSFERS_01" FOREIGN KEY ("FROM_WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_TRANSFERS" ADD CONSTRAINT "FK_SCM_STOCK_TRANSFERS_02" FOREIGN KEY ("TO_WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_TRANSFERS" ADD CONSTRAINT "FK_SCM_STOCK_TRANSFERS_03" FOREIGN KEY ("ASSIGNED_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_TRANSFERS" ADD CONSTRAINT "FK_SCM_STOCK_TRANSFERS_04" FOREIGN KEY ("REQUESTED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_TRANSFERS" ADD CONSTRAINT "FK_SCM_STOCK_TRANSFERS_05" FOREIGN KEY ("REVIEWED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;

  CREATE INDEX "IDX_SCM_STOCK_TRANSFERS_01" ON "SCM_STOCK_TRANSFERS" ("FROM_WAREHOUSE_ID", "TO_WAREHOUSE_ID", "TRANSFER_STATUS_CODE") 
  ;

  ALTER TABLE "SCM_STOCK_TRANSFER_LINES" ADD CONSTRAINT "FK_SCM_STOCK_TRANSFER_LINES_01" FOREIGN KEY ("STOCK_TRANSFER_ID")
	  REFERENCES "SCM_STOCK_TRANSFERS" ("STOCK_TRANSFER_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_TRANSFER_LINES" ADD CONSTRAINT "FK_SCM_STOCK_TRANSFER_LINES_02" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "SCM_ITEMS" ("ITEM_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_TRANSFER_LINES" ADD CONSTRAINT "FK_SCM_STOCK_TRANSFER_LINES_03" FOREIGN KEY ("INVENTORY_LOT_ID")
	  REFERENCES "SCM_INVENTORY_LOTS" ("INVENTORY_LOT_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_TRANSFER_LINES" ADD CONSTRAINT "FK_SCM_STOCK_TRANSFER_LINES_04" FOREIGN KEY ("SOURCE_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;
  ALTER TABLE "SCM_STOCK_TRANSFER_LINES" ADD CONSTRAINT "FK_SCM_STOCK_TRANSFER_LINES_05" FOREIGN KEY ("DESTINATION_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;

  ALTER TABLE "SCM_STORAGE_LOCATIONS" ADD CONSTRAINT "FK_SCM_STORAGE_LOCATIONS_01" FOREIGN KEY ("WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_STORAGE_LOCATIONS" ADD CONSTRAINT "FK_SCM_STORAGE_LOCATIONS_02" FOREIGN KEY ("WAREHOUSE_AREA_ID")
	  REFERENCES "SCM_WAREHOUSE_AREAS" ("WAREHOUSE_AREA_ID") ENABLE;
  ALTER TABLE "SCM_STORAGE_LOCATIONS" ADD CONSTRAINT "FK_SCM_STORAGE_LOCATIONS_03" FOREIGN KEY ("PARENT_LOCATION_ID")
	  REFERENCES "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") ENABLE;

  ALTER TABLE "SCM_USER_ROLE_ASSIGNMENTS" ADD CONSTRAINT "FK_SCM_USER_ROLE_ASSIGNMENTS_01" FOREIGN KEY ("APPLICATION_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;
  ALTER TABLE "SCM_USER_ROLE_ASSIGNMENTS" ADD CONSTRAINT "FK_SCM_USER_ROLE_ASSIGNMENTS_02" FOREIGN KEY ("USER_ROLE_ID")
	  REFERENCES "SCM_USER_ROLES" ("USER_ROLE_ID") ENABLE;
  ALTER TABLE "SCM_USER_ROLE_ASSIGNMENTS" ADD CONSTRAINT "FK_SCM_USER_ROLE_ASSIGNMENTS_03" FOREIGN KEY ("WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;
  ALTER TABLE "SCM_USER_ROLE_ASSIGNMENTS" ADD CONSTRAINT "FK_SCM_USER_ROLE_ASSIGNMENTS_04" FOREIGN KEY ("ASSIGNED_BY_USER_ID")
	  REFERENCES "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") ENABLE;

  CREATE INDEX "IDX_SCM_USER_ROLE_ASSIGNMENTS_01" ON "SCM_USER_ROLE_ASSIGNMENTS" ("APPLICATION_USER_ID", "WAREHOUSE_ID", "ASSIGNMENT_STATUS_CODE") 
  ;

  ALTER TABLE "SCM_WAREHOUSE_AREAS" ADD CONSTRAINT "FK_SCM_WAREHOUSE_AREAS_01" FOREIGN KEY ("WAREHOUSE_ID")
	  REFERENCES "SCM_WAREHOUSES" ("WAREHOUSE_ID") ENABLE;

  CREATE INDEX "IDX_SCM_INVENTORY_BALANCES_01" ON "SCM_INVENTORY_BALANCES" ("ITEM_ID", "WAREHOUSE_ID", "STOCK_STATUS_CODE") 
  ;

  CREATE INDEX "IDX_SCM_INVENTORY_BALANCES_02" ON "SCM_INVENTORY_BALANCES" ("STORAGE_LOCATION_ID", "ITEM_ID") 
  ;

  CREATE INDEX "IDX_SCM_USER_ROLE_ASSIGNMENTS_01" ON "SCM_USER_ROLE_ASSIGNMENTS" ("APPLICATION_USER_ID", "WAREHOUSE_ID", "ASSIGNMENT_STATUS_CODE") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_ITEMS" ON "SCM_ITEMS" ("ITEM_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_STOCK_ALLOCATIONS" ON "SCM_STOCK_ALLOCATIONS" ("STOCK_ALLOCATION_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_STOCK_COUNT_LINES" ON "SCM_STOCK_COUNT_LINES" ("STOCK_COUNT_LINE_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_RETURN_LINES" ON "SCM_RETURN_LINES" ("RETURN_LINE_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_APPLICATION_USERS_01" ON "SCM_APPLICATION_USERS" ("USER_NAME") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_BUSINESS_PARTNERS" ON "SCM_BUSINESS_PARTNERS" ("BUSINESS_PARTNER_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_REPLENISHMENT_ALERTS" ON "SCM_REPLENISHMENT_ALERTS" ("REPLENISHMENT_ALERT_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_WAREHOUSES" ON "SCM_WAREHOUSES" ("WAREHOUSE_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_WAREHOUSE_AREAS_01" ON "SCM_WAREHOUSE_AREAS" ("WAREHOUSE_ID", "AREA_CODE") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_APPLICATION_USERS" ON "SCM_APPLICATION_USERS" ("APPLICATION_USER_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_ITEM_WAREHOUSE_POLICIES_01" ON "SCM_ITEM_WAREHOUSE_POLICIES" ("ITEM_ID", "WAREHOUSE_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_OPERATIONAL_EXCEPTIONS_01" ON "SCM_OPERATIONAL_EXCEPTIONS" ("EXCEPTION_NUMBER") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_ADJUSTMENTS_01" ON "SCM_STOCK_ADJUSTMENTS" ("WAREHOUSE_ID", "ADJUSTMENT_STATUS_CODE") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_WAREHOUSE_AREAS" ON "SCM_WAREHOUSE_AREAS" ("WAREHOUSE_AREA_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_BUSINESS_PARTNERS_01" ON "SCM_BUSINESS_PARTNERS" ("PARTNER_NUMBER") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_ALLOCATIONS_01" ON "SCM_STOCK_ALLOCATIONS" ("OUTBOUND_ORDER_LINE_ID") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_COUNTS_01" ON "SCM_STOCK_COUNTS" ("WAREHOUSE_ID", "COUNT_STATUS_CODE", "REVIEW_STATUS_CODE") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_OPERATIONAL_EXCEPTIONS" ON "SCM_OPERATIONAL_EXCEPTIONS" ("OPERATIONAL_EXCEPTION_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_STOCK_ALLOCATIONS_01" ON "SCM_STOCK_ALLOCATIONS" ("ALLOCATION_NUMBER") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_STOCK_ALLOCATIONS_02" ON "SCM_STOCK_ALLOCATIONS" ("OUTBOUND_ORDER_LINE_ID", "ALLOCATION_SEQUENCE") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_STOCK_TRANSFER_LINES_01" ON "SCM_STOCK_TRANSFER_LINES" ("STOCK_TRANSFER_ID", "LINE_NUMBER") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_BUSINESS_LIST_VALUES" ON "SCM_BUSINESS_LIST_VALUES" ("BUSINESS_LIST_VALUE_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_USER_ROLES" ON "SCM_USER_ROLES" ("USER_ROLE_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_STOCK_COUNTS_01" ON "SCM_STOCK_COUNTS" ("COUNT_NUMBER") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_INBOUND_RECEIPT_LINES_01" ON "SCM_INBOUND_RECEIPT_LINES" ("INBOUND_RECEIPT_ID", "LINE_NUMBER") 
  ;

  CREATE INDEX "IDX_SCM_OPERATIONAL_EXCEPTIONS_01" ON "SCM_OPERATIONAL_EXCEPTIONS" ("WAREHOUSE_ID", "REVIEW_STATUS_CODE", "SEVERITY_CODE") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_USER_ROLE_ASSIGNMENTS" ON "SCM_USER_ROLE_ASSIGNMENTS" ("USER_ROLE_ASSIGNMENT_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_RETURN_LINES_01" ON "SCM_RETURN_LINES" ("RETURN_ID", "LINE_NUMBER") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_STORAGE_LOCATIONS_01" ON "SCM_STORAGE_LOCATIONS" ("WAREHOUSE_ID", "LOCATION_CODE") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_ALLOCATIONS_02" ON "SCM_STOCK_ALLOCATIONS" ("INVENTORY_BALANCE_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_STOCK_COUNTS" ON "SCM_STOCK_COUNTS" ("STOCK_COUNT_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_INVENTORY_BALANCES" ON "SCM_INVENTORY_BALANCES" ("INVENTORY_BALANCE_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_INVENTORY_BALANCES_01" ON "SCM_INVENTORY_BALANCES" ("WAREHOUSE_ID", "STORAGE_LOCATION_ID", "ITEM_ID", "INVENTORY_LOT_ID", "STOCK_STATUS_CODE") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_RETURNS_01" ON "SCM_RETURNS" ("RETURN_NUMBER") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_WAREHOUSES_01" ON "SCM_WAREHOUSES" ("WAREHOUSE_CODE") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_INBOUND_RECEIPTS" ON "SCM_INBOUND_RECEIPTS" ("INBOUND_RECEIPT_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_INBOUND_RECEIPT_LINES" ON "SCM_INBOUND_RECEIPT_LINES" ("INBOUND_RECEIPT_LINE_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_RETURNS" ON "SCM_RETURNS" ("RETURN_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_PARTNER_SITES" ON "SCM_PARTNER_SITES" ("PARTNER_SITE_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_STOCK_ADJUSTMENT_LINES" ON "SCM_STOCK_ADJUSTMENT_LINES" ("STOCK_ADJUSTMENT_LINE_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_STOCK_TRANSFERS_01" ON "SCM_STOCK_TRANSFERS" ("TRANSFER_NUMBER") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_MOVEMENTS_02" ON "SCM_STOCK_MOVEMENTS" ("ITEM_ID", "SOURCE_LOCATION_ID", "DESTINATION_LOCATION_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_REPLENISHMENT_ALERTS_01" ON "SCM_REPLENISHMENT_ALERTS" ("ALERT_NUMBER") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_STOCK_ADJUSTMENTS_01" ON "SCM_STOCK_ADJUSTMENTS" ("ADJUSTMENT_NUMBER") 
  ;

  CREATE INDEX "IDX_SCM_INBOUND_RECEIPTS_01" ON "SCM_INBOUND_RECEIPTS" ("WAREHOUSE_ID", "RECEIPT_STATUS_CODE", "REVIEW_STATUS_CODE") 
  ;

  CREATE INDEX "IDX_SCM_RETURNS_01" ON "SCM_RETURNS" ("WAREHOUSE_ID", "RETURN_STATUS_CODE", "REVIEW_STATUS_CODE") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_TRANSFERS_01" ON "SCM_STOCK_TRANSFERS" ("FROM_WAREHOUSE_ID", "TO_WAREHOUSE_ID", "TRANSFER_STATUS_CODE") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_STOCK_ADJUSTMENTS" ON "SCM_STOCK_ADJUSTMENTS" ("STOCK_ADJUSTMENT_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_STOCK_MOVEMENTS_01" ON "SCM_STOCK_MOVEMENTS" ("MOVEMENT_NUMBER") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_USER_ROLES_01" ON "SCM_USER_ROLES" ("ROLE_CODE") 
  ;

  CREATE INDEX "IDX_SCM_OUTBOUND_ORDERS_01" ON "SCM_OUTBOUND_ORDERS" ("SHIP_FROM_WAREHOUSE_ID", "OUTBOUND_STATUS_CODE") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_ALLOCATIONS_03" ON "SCM_STOCK_ALLOCATIONS" ("WAREHOUSE_ID", "ITEM_ID", "ALLOCATION_STATUS_CODE") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_INVENTORY_LOTS_01" ON "SCM_INVENTORY_LOTS" ("ITEM_ID", "LOT_NUMBER") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_OUTBOUND_ORDER_LINES_01" ON "SCM_OUTBOUND_ORDER_LINES" ("OUTBOUND_ORDER_ID", "LINE_NUMBER") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_ALLOCATIONS_04" ON "SCM_STOCK_ALLOCATIONS" ("FIFO_BASIS_DATE", "ITEM_ID", "WAREHOUSE_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_ITEM_SERIALS" ON "SCM_ITEM_SERIALS" ("ITEM_SERIAL_ID") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_MOVEMENTS_03" ON "SCM_STOCK_MOVEMENTS" ("SOURCE_DOCUMENT_TYPE", "SOURCE_DOCUMENT_NUMBER") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_BUSINESS_LISTS_01" ON "SCM_BUSINESS_LISTS" ("LIST_CODE") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_STOCK_ADJUSTMENT_LINES_01" ON "SCM_STOCK_ADJUSTMENT_LINES" ("STOCK_ADJUSTMENT_ID", "LINE_NUMBER") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_BUSINESS_LISTS" ON "SCM_BUSINESS_LISTS" ("BUSINESS_LIST_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_STORAGE_LOCATIONS" ON "SCM_STORAGE_LOCATIONS" ("STORAGE_LOCATION_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_OUTBOUND_ORDERS_01" ON "SCM_OUTBOUND_ORDERS" ("OUTBOUND_ORDER_NUMBER") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_INVENTORY_LOTS" ON "SCM_INVENTORY_LOTS" ("INVENTORY_LOT_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_STOCK_TRANSFERS" ON "SCM_STOCK_TRANSFERS" ("STOCK_TRANSFER_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_OUTBOUND_ORDER_LINES" ON "SCM_OUTBOUND_ORDER_LINES" ("OUTBOUND_ORDER_LINE_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_STOCK_MOVEMENTS" ON "SCM_STOCK_MOVEMENTS" ("STOCK_MOVEMENT_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_ITEM_SERIALS_01" ON "SCM_ITEM_SERIALS" ("ITEM_ID", "SERIAL_NUMBER") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_PARTNER_SITES_01" ON "SCM_PARTNER_SITES" ("BUSINESS_PARTNER_ID", "SITE_CODE") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_STOCK_COUNT_LINES_01" ON "SCM_STOCK_COUNT_LINES" ("STOCK_COUNT_ID", "LINE_NUMBER") 
  ;

  CREATE INDEX "IDX_SCM_STOCK_MOVEMENTS_01" ON "SCM_STOCK_MOVEMENTS" ("WAREHOUSE_ID", "MOVEMENT_STATUS_CODE", "ASSIGNED_USER_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_ITEM_WAREHOUSE_POLICIES" ON "SCM_ITEM_WAREHOUSE_POLICIES" ("ITEM_WAREHOUSE_POLICY_ID") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_OUTBOUND_ORDERS" ON "SCM_OUTBOUND_ORDERS" ("OUTBOUND_ORDER_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_INBOUND_RECEIPTS_01" ON "SCM_INBOUND_RECEIPTS" ("RECEIPT_NUMBER") 
  ;

  CREATE UNIQUE INDEX "PK_SCM_STOCK_TRANSFER_LINES" ON "SCM_STOCK_TRANSFER_LINES" ("STOCK_TRANSFER_LINE_ID") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_ITEMS_01" ON "SCM_ITEMS" ("ITEM_CODE") 
  ;

  CREATE UNIQUE INDEX "UQ_SCM_BUSINESS_LIST_VALUES_01" ON "SCM_BUSINESS_LIST_VALUES" ("BUSINESS_LIST_ID", "VALUE_CODE") 
  ;















































































create or replace procedure scm_post_auth_register_user 
as 
    l_apex_user      varchar2(255); 
    l_user_exists    pls_integer; 
    l_user_id        number; 
    l_warehouse_id   number; 
    l_role_id        number; 
    l_workspace_id   apex_workspaces.workspace_id%type; 
    l_workspace_name apex_workspaces.workspace%type; 
    l_acl_role_id    apex_appl_acl_roles.role_id%type; 
    c_app_id         constant number       := apex_application.g_flow_id; 
    c_acl_role       constant varchar2(50) := 'warehouse-manager'; 
    c_warehouse_code constant varchar2(20) := 'PHX-WEST'; 
    c_scm_role_name  constant varchar2(50) := 'WAREHOUSE MANAGER'; 
begin 
    l_apex_user := upper(apex_application.g_user); 
 
    if l_apex_user is null 
       or l_apex_user in ('NOBODY', 'APEX_PUBLIC_USER', 'ANONYMOUS', 'GUEST') 
    then 
        return; 
    end if; 
 
    select count(*) 
      into l_user_exists 
      from scm_application_users 
     where upper(user_name) = l_apex_user; 
 
    if l_user_exists = 0 then 
 
        select warehouse_id 
          into l_warehouse_id 
          from scm_warehouses 
         where warehouse_code = c_warehouse_code; 
 
        select user_role_id 
          into l_role_id 
          from scm_user_roles 
         where upper(role_name) = c_scm_role_name; 
 
        insert into scm_application_users ( 
            user_name, 
            full_name, 
            email_address, 
            user_status_code, 
            default_warehouse_id 
        ) values ( 
            l_apex_user, 
            l_apex_user, 
            lower(l_apex_user) || '@example.com', 
            'ACTIVE', 
            l_warehouse_id 
        ) returning application_user_id into l_user_id; 
 
        insert into scm_user_role_assignments ( 
            application_user_id, 
            user_role_id, 
            assignment_status_code, 
            is_primary_role 
        ) values ( 
            l_user_id, 
            l_role_id, 
            'ACTIVE', 
            'true' 
        ); 
 
    end if; 
 
    select workspace 
      into l_workspace_name 
      from apex_applications 
     where application_id = c_app_id; 
 
    select workspace_id 
      into l_workspace_id 
      from apex_workspaces 
     where workspace = l_workspace_name; 
 
    apex_util.set_security_group_id(p_security_group_id => l_workspace_id); 
 
    select role_id 
      into l_acl_role_id 
      from apex_appl_acl_roles 
     where workspace      = l_workspace_name 
       and application_id = c_app_id 
       and role_static_id = c_acl_role; 
 
    apex_acl.add_user_role( 
        p_application_id => c_app_id, 
        p_user_name      => l_apex_user, 
        p_role_id        => l_acl_role_id 
    ); 
 
    commit; 
 
exception 
    when others then 
        rollback; 
end scm_post_auth_register_user;
/



































  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SCM_INVENTORY_TRANSACTIONS" ("INVENTORY_TRANSACTION_ID", "WAREHOUSE_ID", "TRANSACTION_TYPE_CODE", "FROM_LOCATION_ID", "TO_LOCATION_ID", "ITEM_ID", "INVENTORY_LOT_ID", "ITEM_SERIAL_ID", "FROM_STATUS_CODE", "TO_STATUS_CODE", "QUANTITY", "REFERENCE_DOCUMENT_TYPE", "REFERENCE_DOCUMENT_NUMBER", "REASON_CODE", "TRANSACTION_AT", "PERFORMED_BY_USER_ID") AS 
  select 
    100000000 + row_number() over (order by irl.inbound_receipt_line_id) as inventory_transaction_id, 
    ir.warehouse_id, 
    'RECEIPT' as transaction_type_code, 
    cast(null as number) as from_location_id, 
    irl.receiving_location_id as to_location_id, 
    irl.item_id, 
    irl.inventory_lot_id, 
    cast(null as number) as item_serial_id, 
    cast(null as varchar2(20)) as from_status_code, 
    case 
        when irl.damaged_quantity > 0 then 'DAMAGED' 
        when irl.quarantine_quantity > 0 then 'QUARANTINE' 
        else 'AVAILABLE' 
    end as to_status_code, 
    irl.received_quantity as quantity, 
    'INBOUND_RECEIPT' as reference_document_type, 
    ir.receipt_number as reference_document_number, 
    nvl(irl.discrepancy_reason_code, 'RECEIPT') as reason_code, 
    coalesce(ir.actual_arrival_at, ir.expected_arrival_at, systimestamp) + numtodsinterval(irl.line_number, 'MINUTE') as transaction_at, 
    nvl(ir.received_by_user_id, nvl(ir.assigned_user_id, ir.reviewed_by_user_id)) as performed_by_user_id 
from scm_inbound_receipts ir 
join scm_inbound_receipt_lines irl 
  on irl.inbound_receipt_id = ir.inbound_receipt_id 
where irl.received_quantity > 0 
union all 
select 
    200000000 + row_number() over (order by sm.stock_movement_id), 
    sm.warehouse_id, 
    case 
        when sm.movement_type_code = 'PUTAWAY' then 'PUTAWAY' 
        when sm.movement_type_code = 'STATUS_CHANGE' then 'STATUS_CHANGE' 
        else 'MOVE' 
    end, 
    sm.source_location_id, 
    sm.destination_location_id, 
    sm.item_id, 
    sm.inventory_lot_id, 
    sm.item_serial_id, 
    sm.from_status_code, 
    sm.to_status_code, 
    sm.moved_quantity, 
    nvl(sm.source_document_type, 'STOCK_MOVEMENT'), 
    nvl(sm.source_document_number, sm.movement_number), 
    sm.reason_code, 
    coalesce(sm.confirmed_at, sm.requested_at, systimestamp), 
    nvl(sm.confirmed_by_user_id, nvl(sm.assigned_user_id, sm.requested_by_user_id)) 
from scm_stock_movements sm 
where sm.moved_quantity > 0 
  and sm.movement_status_code <> 'CANCELLED' 
union all 
select 
    300000000 + row_number() over (order by sa.stock_allocation_id), 
    sa.warehouse_id, 
    'ALLOCATE', 
    sa.source_location_id, 
    sa.source_location_id, 
    sa.item_id, 
    sa.inventory_lot_id, 
    sa.item_serial_id, 
    'AVAILABLE', 
    'RESERVED', 
    sa.reserved_quantity, 
    'OUTBOUND_ORDER', 
    oo.outbound_order_number, 
    'ALLOCATION', 
    sa.allocated_at, 
    nvl(sa.allocated_by_user_id, nvl(oo.assigned_user_id, nvl(oo.picked_by_user_id, nvl(oo.packed_by_user_id, oo.dispatched_by_user_id)))) 
from scm_stock_allocations sa 
join scm_outbound_order_lines ol 
  on ol.outbound_order_line_id = sa.outbound_order_line_id 
join scm_outbound_orders oo 
  on ol.outbound_order_id = oo.outbound_order_id 
where sa.reserved_quantity > 0 
union all 
select 
    400000000 + row_number() over (order by sa.stock_allocation_id), 
    sa.warehouse_id, 
    'PICK', 
    sa.source_location_id, 
    sa.source_location_id, 
    sa.item_id, 
    sa.inventory_lot_id, 
    sa.item_serial_id, 
    'RESERVED', 
    'PICKED', 
    sa.picked_quantity, 
    'OUTBOUND_ORDER', 
    oo.outbound_order_number, 
    'PICK', 
    sa.picked_at, 
    nvl(sa.picked_by_user_id, nvl(oo.picked_by_user_id, nvl(oo.assigned_user_id, oo.packed_by_user_id))) 
from scm_stock_allocations sa 
join scm_outbound_order_lines ol 
  on ol.outbound_order_line_id = sa.outbound_order_line_id 
join scm_outbound_orders oo 
  on ol.outbound_order_id = oo.outbound_order_id 
where sa.picked_quantity > 0 
union all 
select 
    500000000 + row_number() over (order by sa.stock_allocation_id), 
    sa.warehouse_id, 
    'PACK', 
    sa.source_location_id, 
    sa.source_location_id, 
    sa.item_id, 
    sa.inventory_lot_id, 
    sa.item_serial_id, 
    'PICKED', 
    'PACKED', 
    sa.packed_quantity, 
    'OUTBOUND_ORDER', 
    oo.outbound_order_number, 
    'PACK', 
    sa.packed_at, 
    nvl(sa.packed_by_user_id, nvl(oo.packed_by_user_id, nvl(oo.picked_by_user_id, oo.assigned_user_id))) 
from scm_stock_allocations sa 
join scm_outbound_order_lines ol 
  on ol.outbound_order_line_id = sa.outbound_order_line_id 
join scm_outbound_orders oo 
  on ol.outbound_order_id = oo.outbound_order_id 
where sa.packed_quantity > 0 
union all 
select 
    600000000 + row_number() over (order by sa.stock_allocation_id), 
    sa.warehouse_id, 
    'DISPATCH', 
    sa.source_location_id, 
    cast(null as number), 
    sa.item_id, 
    sa.inventory_lot_id, 
    sa.item_serial_id, 
    'PACKED', 
    'IN_TRANSIT', 
    sa.dispatched_quantity, 
    'OUTBOUND_ORDER', 
    oo.outbound_order_number, 
    'DISPATCH', 
    sa.dispatched_at, 
    nvl(sa.dispatched_by_user_id, nvl(oo.dispatched_by_user_id, nvl(oo.packed_by_user_id, oo.assigned_user_id))) 
from scm_stock_allocations sa 
join scm_outbound_order_lines ol 
  on ol.outbound_order_line_id = sa.outbound_order_line_id 
join scm_outbound_orders oo 
  on ol.outbound_order_id = oo.outbound_order_id 
where sa.dispatched_quantity > 0 
union all 
select 
    700000000 + row_number() over (order by stl.stock_transfer_line_id), 
    st.from_warehouse_id, 
    'TRANSFER_SHIP', 
    stl.source_location_id, 
    cast(null as number), 
    stl.item_id, 
    stl.inventory_lot_id, 
    cast(null as number), 
    'AVAILABLE', 
    'IN_TRANSIT', 
    stl.shipped_quantity, 
    'STOCK_TRANSFER', 
    st.transfer_number, 
    st.reason_code, 
    coalesce(st.actual_shipped_at, st.requested_ship_at, systimestamp) + numtodsinterval(stl.line_number, 'MINUTE'), 
    nvl(st.assigned_user_id, nvl(st.requested_by_user_id, st.reviewed_by_user_id)) 
from scm_stock_transfers st 
join scm_stock_transfer_lines stl 
  on stl.stock_transfer_id = st.stock_transfer_id 
where stl.shipped_quantity > 0 
union all 
select 
    800000000 + row_number() over (order by stl.stock_transfer_line_id), 
    st.to_warehouse_id, 
    'TRANSFER_RECEIVE', 
    cast(null as number), 
    stl.destination_location_id, 
    stl.item_id, 
    stl.inventory_lot_id, 
    cast(null as number), 
    'IN_TRANSIT', 
    'AVAILABLE', 
    stl.received_quantity, 
    'STOCK_TRANSFER', 
    st.transfer_number, 
    st.reason_code, 
    coalesce(st.actual_received_at, st.expected_receipt_at, systimestamp) + numtodsinterval(stl.line_number * 2, 'MINUTE'), 
    nvl(st.reviewed_by_user_id, nvl(st.assigned_user_id, st.requested_by_user_id)) 
from scm_stock_transfers st 
join scm_stock_transfer_lines stl 
  on stl.stock_transfer_id = st.stock_transfer_id 
where stl.received_quantity > 0 
union all 
select 
    900000000 + row_number() over (order by rl.return_line_id), 
    r.warehouse_id, 
    'RETURN_RECEIPT', 
    cast(null as number), 
    rp.storage_location_id, 
    rl.item_id, 
    rl.inventory_lot_id, 
    cast(null as number), 
    cast(null as varchar2(20)), 
    'QUARANTINE', 
    rl.received_quantity, 
    'RETURN', 
    r.return_number, 
    r.return_reason_code, 
    coalesce(r.received_at, r.expected_arrival_at, systimestamp) + numtodsinterval(rl.line_number, 'MINUTE'), 
    nvl(r.received_by_user_id, nvl(r.assigned_user_id, r.assessed_by_user_id)) 
from scm_returns r 
join scm_return_lines rl 
  on rl.return_id = r.return_id 
join ( 
    select 
        warehouse_id, 
        storage_location_id, 
        row_number() over (partition by warehouse_id order by storage_location_id) loc_rn, 
        count(*) over (partition by warehouse_id) loc_count 
    from scm_storage_locations 
    where location_status_code = 'ACTIVE' 
      and location_type_code in ('RETURNS', 'QUARANTINE') 
) rp 
  on rp.warehouse_id = r.warehouse_id 
 and rp.loc_rn = mod(r.return_id + rl.line_number, rp.loc_count) + 1 
where rl.received_quantity > 0 
union all 
select 
    1000000000 + row_number() over (order by rl.return_line_id), 
    r.warehouse_id, 
    'RETURN_RELEASE', 
    rp.storage_location_id, 
    sp.storage_location_id, 
    rl.item_id, 
    rl.inventory_lot_id, 
    cast(null as number), 
    'QUARANTINE', 
    'AVAILABLE', 
    rl.reusable_quantity, 
    'RETURN', 
    r.return_number, 
    'RETURN_TO_STOCK', 
    coalesce(r.assessed_at, r.reviewed_at, r.received_at, systimestamp) + numtodsinterval(rl.line_number * 2, 'MINUTE'), 
    nvl(r.assessed_by_user_id, nvl(r.reviewed_by_user_id, r.assigned_user_id)) 
from scm_returns r 
join scm_return_lines rl 
  on rl.return_id = r.return_id 
join ( 
    select 
        warehouse_id, 
        storage_location_id, 
        row_number() over (partition by warehouse_id order by storage_location_id) loc_rn, 
        count(*) over (partition by warehouse_id) loc_count 
    from scm_storage_locations 
    where location_status_code = 'ACTIVE' 
      and location_type_code in ('RETURNS', 'QUARANTINE') 
) rp 
  on rp.warehouse_id = r.warehouse_id 
 and rp.loc_rn = mod(r.return_id + rl.line_number, rp.loc_count) + 1 
join ( 
    select 
        warehouse_id, 
        storage_location_id, 
        row_number() over (partition by warehouse_id order by storage_location_id) loc_rn, 
        count(*) over (partition by warehouse_id) loc_count 
    from scm_storage_locations 
    where location_status_code = 'ACTIVE' 
      and location_type_code in ('STORAGE', 'BIN') 
) sp 
  on sp.warehouse_id = r.warehouse_id 
 and sp.loc_rn = mod(r.return_id * 3 + rl.line_number, sp.loc_count) + 1 
where rl.reusable_quantity > 0 
  and r.return_status_code in ('DISPOSITIONED', 'CLOSED') 
  and r.review_status_code in ('APPROVED', 'RESOLVED') 
union all 
select 
    1100000000 + row_number() over (order by scl.stock_count_line_id), 
    sc.warehouse_id, 
    'COUNT_ADJUST', 
    scl.storage_location_id, 
    scl.storage_location_id, 
    scl.item_id, 
    scl.inventory_lot_id, 
    cast(null as number), 
    case when scl.variance_quantity < 0 then bs.stock_status_code end, 
    case when scl.variance_quantity > 0 then bs.stock_status_code end, 
    abs(scl.variance_quantity), 
    'STOCK_COUNT', 
    sc.count_number, 
    nvl(scl.variance_reason_code, 'COUNT_VARIANCE'), 
    coalesce(scl.reviewed_at, scl.first_counted_at, sc.completed_at, sc.started_at, systimestamp) + numtodsinterval(scl.line_number, 'MINUTE'), 
    nvl(scl.reviewed_by_user_id, nvl(scl.first_counted_by_user_id, sc.assigned_user_id)) 
from scm_stock_counts sc 
join scm_stock_count_lines scl 
  on scl.stock_count_id = sc.stock_count_id 
left join ( 
    select 
        warehouse_id, 
        storage_location_id, 
        item_id, 
        inventory_lot_id, 
        max(stock_status_code) keep ( 
            dense_rank first 
            order by case stock_status_code 
                when 'AVAILABLE' then 1 
                when 'RESERVED' then 2 
                when 'PICKED' then 3 
                when 'PACKED' then 4 
                when 'QUARANTINE' then 5 
                when 'DAMAGED' then 6 
                when 'BLOCKED' then 7 
                else 8 
            end 
        ) as stock_status_code 
    from scm_inventory_balances 
    group by warehouse_id, storage_location_id, item_id, inventory_lot_id 
) bs 
  on bs.warehouse_id = sc.warehouse_id 
 and bs.storage_location_id = scl.storage_location_id 
 and bs.item_id = scl.item_id 
 and nvl(bs.inventory_lot_id, -1) = nvl(scl.inventory_lot_id, -1) 
where scl.variance_quantity is not null 
  and scl.variance_quantity <> 0 
union all 
select 
    1200000000 + row_number() over (order by sal.stock_adjustment_line_id), 
    sa.warehouse_id, 
    case 
        when sa.adjustment_type_code = 'WRITE_OFF' then 'WRITE_OFF' 
        when sal.adjustment_direction_code = 'STATUS_CHANGE' then 'STATUS_CHANGE' 
        else 'ADJUSTMENT' 
    end, 
    sal.storage_location_id, 
    sal.storage_location_id, 
    sal.item_id, 
    sal.inventory_lot_id, 
    sal.item_serial_id, 
    sal.from_status_code, 
    sal.to_status_code, 
    sal.adjustment_quantity, 
    'STOCK_ADJUSTMENT', 
    sa.adjustment_number, 
    sa.reason_code, 
    coalesce(sa.applied_at, sa.reviewed_at, sa.requested_at, systimestamp) + numtodsinterval(sal.line_number, 'MINUTE'), 
    nvl(sa.applied_by_user_id, nvl(sa.reviewed_by_user_id, nvl(sa.assigned_user_id, sa.requested_by_user_id))) 
from scm_stock_adjustments sa 
join scm_stock_adjustment_lines sal 
  on sal.stock_adjustment_id = sa.stock_adjustment_id 
where sal.adjustment_quantity > 0 
with read only;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SCM_SERIAL_EVENTS" ("SERIAL_EVENT_ID", "ITEM_SERIAL_ID", "WAREHOUSE_ID", "FROM_LOCATION_ID", "TO_LOCATION_ID", "EVENT_TYPE_CODE", "FROM_STATUS_CODE", "TO_STATUS_CODE", "REFERENCE_DOCUMENT_TYPE", "REFERENCE_DOCUMENT_NUMBER", "EVENT_AT", "PERFORMED_BY_USER_ID", "EVENT_NOTES") AS 
  select 
    100000000 + row_number() over (order by s.item_serial_id) as serial_event_id, 
    s.item_serial_id, 
    s.current_warehouse_id as warehouse_id, 
    cast(null as number) as from_location_id, 
    s.current_storage_location_id as to_location_id, 
    'RECEIPT' as event_type_code, 
    cast(null as varchar2(20)) as from_status_code, 
    'AVAILABLE' as to_status_code, 
    'INBOUND_RECEIPT' as reference_document_type, 
    'SER-IB-' || lpad(s.item_serial_id, 7, '0') as reference_document_number, 
    s.received_at as event_at, 
    up.application_user_id as performed_by_user_id, 
    'Initial receipt event for serial-controlled inventory.' as event_notes 
from scm_item_serials s 
join ( 
    select 
        warehouse_id, 
        application_user_id, 
        row_number() over (partition by warehouse_id order by application_user_id) user_rn, 
        count(*) over (partition by warehouse_id) user_count 
    from scm_user_role_assignments 
    where assignment_status_code = 'ACTIVE' 
      and warehouse_id is not null 
) up 
  on up.warehouse_id = s.current_warehouse_id 
 and up.user_rn = mod(s.item_serial_id * 3, up.user_count) + 1 
where s.received_at is not null 
union all 
select 
    200000000 + row_number() over (order by it.inventory_transaction_id), 
    it.item_serial_id, 
    it.warehouse_id, 
    it.from_location_id, 
    it.to_location_id, 
    case 
        when it.transaction_type_code in ('RETURN_RECEIPT', 'RETURN_RELEASE') then 'RETURN' 
        when it.transaction_type_code = 'COUNT_ADJUST' then 'ADJUSTMENT' 
        else it.transaction_type_code 
    end, 
    it.from_status_code, 
    it.to_status_code, 
    it.reference_document_type, 
    it.reference_document_number, 
    it.transaction_at, 
    it.performed_by_user_id, 
    'Serial lifecycle event derived from inventory transaction history.' 
from scm_inventory_transactions it 
where it.item_serial_id is not null 
with read only; 