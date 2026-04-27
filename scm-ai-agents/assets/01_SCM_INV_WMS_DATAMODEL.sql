-- APEX Logistics
-- Inventory and Warehouse Management bootstrap data model
-- Oracle Database 26ai oriented design
--
-- Design notes
-- 1. Identity columns are used for surrogate keys.
-- 2. SQL BOOLEAN columns are used for simple true/false business flags.
-- 3. Every table and column includes Oracle annotations with a display label and description.
-- 4. The model keeps the warehouse footprint simple and does not depend on map or spatial data.
-- 5. Transactional tables refer back to warehouse master data instead of repeating operational details.
-- 6. The model is intentionally limited to the current WMS functional blueprint scope only.

   set define off

------------------------------------------------------------------------------
-- 1. Core reference data
------------------------------------------------------------------------------

create table scm_business_partners (
   business_partner_id number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Business Partner ID',description 'Surrogate key for the business partner.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   partner_number      varchar2(30 char) not null annotations ( display_label 'Partner Number',description 'Business reference used to identify the supplier, customer, carrier, or internal partner.'
   ,value_required 'true',semantic_type 'reference_number' ),
   partner_type_code   varchar2(20 char) not null annotations ( display_label 'Partner Type',description 'Business role of the partner within the inventory and warehouse process.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'type',ai_context 'Valid values include SUPPLIER, CUSTOMER, CARRIER, INTERNAL.'
   ),
   partner_name        varchar2(200 char) not null annotations ( display_label 'Partner Name',description 'Full business name of the partner.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'name' ),
   partner_status_code varchar2(20 char) default 'ACTIVE' not null annotations ( display_label 'Partner Status',description 'Current business status of the partner record.'
   ,search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include ACTIVE, INACTIVE, ON_HOLD.' ),
   created_at          timestamp with time zone default systimestamp not null annotations ( display_label 'Created At',description
   'Date and time when the partner record was created.',display_in_form 'false',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type
   'datetime' ),
   created_by          varchar2(128 char) default sys_context(
      'USERENV',
      'SESSION_USER'
   ) not null annotations ( display_label 'Created By',description 'Database user that created the partner record.',display_in_form
   'false',semantic_type 'user_name' ),
   constraint pk_scm_business_partners primary key ( business_partner_id ),
   constraint uq_scm_business_partners_01 unique ( partner_number ),
   constraint ck_scm_business_partners_01
      check ( partner_type_code in ( 'SUPPLIER',
                                     'CUSTOMER',
                                     'CARRIER',
                                     'INTERNAL' ) ),
   constraint ck_scm_business_partners_02
      check ( partner_status_code in ( 'ACTIVE',
                                       'INACTIVE',
                                       'ON_HOLD' ) )
) annotations ( display_label 'Business Partners',description 'Stores records for business partners.',application_module 'Inventory and Warehouse Management'
);

create table scm_partner_sites (
   partner_site_id     number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Partner Site ID',description 'Surrogate key for the business partner site.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   business_partner_id number not null annotations ( display_label 'Business Partner ID',description 'Partner that owns or uses this site.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   site_code           varchar2(30 char) not null annotations ( display_label 'Site Code',description 'Business code used to identify the partner site.'
   ,value_required 'true',semantic_type 'code' ),
   site_name           varchar2(200 char) not null annotations ( display_label 'Site Name',description 'Business name for the partner site.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'name' ),
   site_role_code      varchar2(20 char) not null annotations ( display_label 'Site Role',description 'Business role of the site such as ship to, delivery, return, or pickup.'
   ,value_required 'true',semantic_type 'role',ai_context 'Valid values include PRIMARY, SHIP_FROM, SHIP_TO, PICKUP, DELIVERY, RETURN.'
   ),
   address_line_1      varchar2(200 char) not null annotations ( display_label 'Address Line 1',description 'First address line for the site.'
   ,value_required 'true',semantic_type 'street_address' ),
   address_line_2      varchar2(200 char)
      annotations ( display_label 'Address Line 2',description 'Second address line for the site.',semantic_type 'street_address'
      ),
   city_name           varchar2(100 char) not null annotations ( display_label 'City Name',description 'City or town for the site address.'
   ,value_required 'true',semantic_type 'city' ),
   state_region_name   varchar2(100 char)
      annotations ( display_label 'State or Region Name',description 'State, province, or region for the site address.',semantic_type
      'region' ),
   postal_code         varchar2(30 char)
      annotations ( display_label 'Postal Code',description 'Postal or zip code for the site address.',semantic_type 'postal_code'
      ),
   country_code        varchar2(2 char) not null annotations ( display_label 'Country Code',description 'Two-character country code for the site address.'
   ,value_required 'true',semantic_type 'country_code' ),
   is_primary_site     boolean default false not null annotations ( display_label 'Is Primary Site',description 'Indicates whether this is the main site for the partner.'
   ,search_facet 'distinct-list',semantic_type 'flag' ),
   is_active           boolean default true not null annotations ( display_label 'Is Active',description 'Indicates whether this site can still be used in business transactions.'
   ,search_facet 'distinct-list',semantic_type 'flag' ),
   created_at          timestamp with time zone default systimestamp not null annotations ( display_label 'Created At',description
   'Date and time when the site record was created.',display_in_form 'false',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type
   'datetime' ),
   created_by          varchar2(128 char) default sys_context(
      'USERENV',
      'SESSION_USER'
   ) not null annotations ( display_label 'Created By',description 'Database user that created the site record.',display_in_form
   'false',semantic_type 'user_name' ),
   constraint pk_scm_partner_sites primary key ( partner_site_id ),
   constraint uq_scm_partner_sites_01 unique ( business_partner_id,
                                               site_code ),
   constraint fk_scm_partner_sites_01 foreign key ( business_partner_id )
      references scm_business_partners ( business_partner_id ),
   constraint ck_scm_partner_sites_01
      check ( site_role_code in ( 'PRIMARY',
                                  'SHIP_FROM',
                                  'SHIP_TO',
                                  'PICKUP',
                                  'DELIVERY',
                                  'RETURN' ) )
) annotations ( display_label 'Partner Sites',description 'Stores records for partner sites.',application_module 'Inventory and Warehouse Management'
);

create table scm_warehouses (
   warehouse_id          number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Warehouse ID',description 'Surrogate key for the warehouse.',display_in_report 'false',display_in_form 'false',semantic_type
   'identifier' ),
   warehouse_code        varchar2(30 char) not null annotations ( display_label 'Warehouse Code',description 'Business code used to identify the warehouse.'
   ,value_required 'true',semantic_type 'code' ),
   warehouse_name        varchar2(200 char) not null annotations ( display_label 'Warehouse Name',description 'Business name of the warehouse.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'name' ),
   warehouse_type_code   varchar2(20 char) not null annotations ( display_label 'Warehouse Type',description 'Business classification of the warehouse.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'type',ai_context 'Valid values include DISTRIBUTION, FULFILMENT, RETURNS, CROSS_DOCK, SPARES.'
   ),
   warehouse_status_code varchar2(20 char) default 'ACTIVE' not null annotations ( display_label 'Warehouse Status',description
   'Current operating status of the warehouse.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include ACTIVE, INACTIVE, CLOSED.'
   ),
   address_line_1        varchar2(200 char) not null annotations ( display_label 'Address Line 1',description 'First address line of the warehouse.'
   ,value_required 'true',semantic_type 'street_address' ),
   address_line_2        varchar2(200 char)
      annotations ( display_label 'Address Line 2',description 'Second address line of the warehouse.',semantic_type 'street_address'
      ),
   city_name             varchar2(100 char) not null annotations ( display_label 'City Name',description 'City or town of the warehouse.'
   ,value_required 'true',semantic_type 'city' ),
   state_region_name     varchar2(100 char)
      annotations ( display_label 'State or Region Name',description 'State, province, or region of the warehouse.',semantic_type
      'region' ),
   postal_code           varchar2(30 char)
      annotations ( display_label 'Postal Code',description 'Postal or zip code of the warehouse.',semantic_type 'postal_code'
      ),
   country_code          varchar2(2 char) not null annotations ( display_label 'Country Code',description 'Two-character country code of the warehouse address.'
   ,value_required 'true',semantic_type 'country_code' ),
   created_at            timestamp with time zone default systimestamp not null annotations ( display_label 'Created At',description
   'Date and time when the warehouse record was created.',display_in_form 'false',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type
   'datetime' ),
   created_by            varchar2(128 char) default sys_context(
      'USERENV',
      'SESSION_USER'
   ) not null annotations ( display_label 'Created By',description 'Database user that created the warehouse record.',display_in_form
   'false',semantic_type 'user_name' ),
   constraint pk_scm_warehouses primary key ( warehouse_id ),
   constraint uq_scm_warehouses_01 unique ( warehouse_code ),
   constraint ck_scm_warehouses_01
      check ( warehouse_type_code in ( 'DISTRIBUTION',
                                       'FULFILMENT',
                                       'RETURNS',
                                       'CROSS_DOCK',
                                       'SPARES' ) ),
   constraint ck_scm_warehouses_02
      check ( warehouse_status_code in ( 'ACTIVE',
                                         'INACTIVE',
                                         'CLOSED' ) )
) annotations ( display_label 'Warehouses',description 'Stores records for warehouses.',application_module 'Inventory and Warehouse Management'
);

------------------------------------------------------------------------------
-- 1a. Access, governance, and control
------------------------------------------------------------------------------

create table scm_user_roles (
   user_role_id             number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'User Role ID',description 'Surrogate key for the application role.',display_in_report 'false',display_in_form 'false',semantic_type
   'identifier' ),
   role_code                varchar2(30 char) not null annotations ( display_label 'Role Code',description 'Business code used to identify the role.'
   ,value_required 'true',semantic_type 'code' ),
   role_name                varchar2(100 char) not null annotations ( display_label 'Role Name',description 'Business name of the role.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'name' ),
   role_scope_code          varchar2(20 char) default 'WAREHOUSE' not null annotations ( display_label 'Role Scope',description
   'Business scope covered by the role.',search_facet 'distinct-list',semantic_type 'scope',ai_context 'Valid values include ENTERPRISE, WAREHOUSE, QUALITY, FINANCE, ADMIN.'
   ),
   approval_authority_level number(4) default 0 not null annotations ( display_label 'Approval Authority Level',description 'Standard approval authority level attached to the role.'
   ,search_facet 'range',semantic_type 'ranking' ),
   is_active                boolean default true not null annotations ( display_label 'Is Active',description 'Indicates whether the role is active for assignment.'
   ,search_facet 'distinct-list',semantic_type 'flag' ),
   role_notes               varchar2(500 char)
      annotations ( display_label 'Role Notes',description 'Business notes for the role.',semantic_type 'comment' ),
   constraint pk_scm_user_roles primary key ( user_role_id ),
   constraint uq_scm_user_roles_01 unique ( role_code ),
   constraint ck_scm_user_roles_01
      check ( role_scope_code in ( 'ENTERPRISE',
                                   'WAREHOUSE',
                                   'QUALITY',
                                   'FINANCE',
                                   'ADMIN' ) ),
   constraint ck_scm_user_roles_02 check ( approval_authority_level >= 0 )
) annotations ( display_label 'User Roles',description 'Stores records for user roles.',application_module 'Inventory and Warehouse Management'
);

create table scm_application_users (
   application_user_id      number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Application User ID',description 'Surrogate key for the application user.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   user_name                varchar2(128 char) not null annotations ( display_label 'User Name',description 'Business user name used to sign in and record work.'
   ,value_required 'true',semantic_type 'user_name' ),
   full_name                varchar2(200 char) not null annotations ( display_label 'Full Name',description 'Full business name of the user.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'name' ),
   email_address            varchar2(320 char)
      annotations ( display_label 'Email Address',description 'Business email address used for alerts and workflow notices.',
      semantic_type 'email_address' ),
   user_status_code         varchar2(20 char) default 'ACTIVE' not null annotations ( display_label 'User Status',description
   'Current business status of the user.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include ACTIVE, INACTIVE, LOCKED.'
   ),
   default_warehouse_id     number
      annotations ( display_label 'Default Warehouse ID',description 'Default warehouse used for the user where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   manager_user_id          number
      annotations ( display_label 'Manager User ID',description 'User that supervises this user where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   can_receive_alerts       boolean default true not null annotations ( display_label 'Can Receive Alerts',description 'Indicates whether the user should receive replenishment, count, and exception alerts.'
   ,search_facet 'distinct-list',semantic_type 'flag' ),
   approval_authority_level number(4) default 0 not null annotations ( display_label 'Approval Authority Level',description 'Approval authority level granted directly to the user.'
   ,search_facet 'range',semantic_type 'ranking' ),
   user_notes               varchar2(500 char)
      annotations ( display_label 'User Notes',description 'Business notes for the user.',semantic_type 'comment' ),
   constraint pk_scm_application_users primary key ( application_user_id ),
   constraint uq_scm_application_users_01 unique ( user_name ),
   constraint fk_scm_application_users_01 foreign key ( default_warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_application_users_02 foreign key ( manager_user_id )
      references scm_application_users ( application_user_id ),
   constraint ck_scm_application_users_01
      check ( user_status_code in ( 'ACTIVE',
                                    'INACTIVE',
                                    'LOCKED' ) ),
   constraint ck_scm_application_users_02 check ( approval_authority_level >= 0 )
) annotations ( display_label 'Application Users',description 'Stores records for application users.',application_module 'Inventory and Warehouse Management'
);

create table scm_user_role_assignments (
   user_role_assignment_id  number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'User Role Assignment ID',description 'Surrogate key for the user role assignment.',display_in_report 'false',display_in_form
   'false',semantic_type 'identifier' ),
   application_user_id      number not null annotations ( display_label 'Application User ID',description 'User receiving the role assignment.'
   ,value_required 'true',primary_display_column 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   user_role_id             number not null annotations ( display_label 'User Role ID',description 'Role assigned to the user.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   warehouse_id             number
      annotations ( display_label 'Warehouse ID',description 'Warehouse where the assignment applies where the role is site specific.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   assignment_status_code   varchar2(20 char) default 'ACTIVE' not null annotations ( display_label 'Assignment Status',description
   'Current business status of the role assignment.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include ACTIVE, INACTIVE, SUSPENDED.'
   ),
   authority_level_override number(4)
      annotations ( display_label 'Authority Level Override',description 'Role authority level override for this specific assignment where needed.'
      ,semantic_type 'ranking' ),
   effective_from_date      date default trunc(sysdate) not null annotations ( display_label 'Effective From Date',description
   'Date when the role assignment starts.',format_mask 'DD-MON-YYYY',semantic_type 'date' ),
   effective_to_date        date
      annotations ( display_label 'Effective To Date',description 'Date when the role assignment ends where known.',format_mask
      'DD-MON-YYYY',semantic_type 'date' ),
   assigned_by_user_id      number
      annotations ( display_label 'Assigned By User ID',description 'User who assigned the role.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   is_primary_role          boolean default false not null annotations ( display_label 'Is Primary Role',description 'Indicates whether the role is the user''s primary working role.'
   ,search_facet 'distinct-list',semantic_type 'flag' ),
   assignment_notes         varchar2(500 char)
      annotations ( display_label 'Assignment Notes',description 'Business notes for the role assignment.',semantic_type 'comment'
      ),
   constraint pk_scm_user_role_asgn primary key ( user_role_assignment_id ),
   constraint uq_scm_user_role_asgn_01 unique ( application_user_id,
                                                user_role_id,
                                                warehouse_id,
                                                effective_from_date ),
   constraint fk_scm_user_role_asgn_01 foreign key ( application_user_id )
      references scm_application_users ( application_user_id ),
   constraint fk_scm_user_role_asgn_02 foreign key ( user_role_id )
      references scm_user_roles ( user_role_id ),
   constraint fk_scm_user_role_asgn_03 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_user_role_asgn_04 foreign key ( assigned_by_user_id )
      references scm_application_users ( application_user_id ),
   constraint ck_scm_user_role_asgn_01
      check ( assignment_status_code in ( 'ACTIVE',
                                          'INACTIVE',
                                          'SUSPENDED' ) ),
   constraint ck_scm_user_role_asgn_02
      check ( authority_level_override is null
          or authority_level_override >= 0 ),
   constraint ck_scm_user_role_asgn_03
      check ( effective_to_date is null
          or effective_to_date >= effective_from_date )
) annotations ( display_label 'User Role Assignments',description 'Stores records for user role assignments.',application_module
'Inventory and Warehouse Management' );

create table scm_role_permissions (
   role_permission_id   number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Role Permission ID',description 'Surrogate key for the role permission rule.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   user_role_id         number not null annotations ( display_label 'User Role ID',description 'Role that the permission applies to.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   process_area_code    varchar2(30 char) not null annotations ( display_label 'Process Area Code',description 'Warehouse process area covered by the permission.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'classification',ai_context 'Valid values include INBOUND, PUTAWAY, INVENTORY, REPLENISHMENT, OUTBOUND, RETURNS, QUARANTINE, COUNTING, APPROVALS, REPORTING, ADMINISTRATION.'
   ),
   access_level_code    varchar2(20 char) not null annotations ( display_label 'Access Level Code',description 'Business access level granted for the process area.'
   ,value_required 'true',semantic_type 'classification',ai_context 'Valid values include VIEW, WORK, SUPERVISE, APPROVE, ADMINISTER.'
   ),
   warehouse_scope_code varchar2(20 char) default 'ASSIGNED_WAREHOUSE' not null annotations ( display_label 'Warehouse Scope Code'
   ,description 'Warehouse scope that the permission covers.',search_facet 'distinct-list',semantic_type 'scope',ai_context 'Valid values include ASSIGNED_WAREHOUSE, ALL_WAREHOUSES, COMPANY_WIDE.'
   ),
   is_active            boolean default true not null annotations ( display_label 'Is Active',description 'Indicates whether the permission rule is active.'
   ,search_facet 'distinct-list',semantic_type 'flag' ),
   permission_notes     varchar2(500 char)
      annotations ( display_label 'Permission Notes',description 'Business notes for the permission rule.',semantic_type 'comment'
      ),
   constraint pk_scm_role_permissions primary key ( role_permission_id ),
   constraint uq_scm_role_permissions_01 unique ( user_role_id,
                                                  process_area_code,
                                                  access_level_code,
                                                  warehouse_scope_code ),
   constraint fk_scm_role_permissions_01 foreign key ( user_role_id )
      references scm_user_roles ( user_role_id ),
   constraint ck_scm_role_permissions_01
      check ( process_area_code in ( 'INBOUND',
                                     'PUTAWAY',
                                     'INVENTORY',
                                     'REPLENISHMENT',
                                     'OUTBOUND',
                                     'RETURNS',
                                     'QUARANTINE',
                                     'COUNTING',
                                     'APPROVALS',
                                     'REPORTING',
                                     'ADMINISTRATION' ) ),
   constraint ck_scm_role_permissions_02
      check ( access_level_code in ( 'VIEW',
                                     'WORK',
                                     'SUPERVISE',
                                     'APPROVE',
                                     'ADMINISTER' ) ),
   constraint ck_scm_role_permissions_03
      check ( warehouse_scope_code in ( 'ASSIGNED_WAREHOUSE',
                                        'ALL_WAREHOUSES',
                                        'COMPANY_WIDE' ) )
) annotations ( display_label 'Role Permissions',description 'Stores records for role permissions.',application_module 'Inventory and Warehouse Management'
);

create table scm_business_lists (
   business_list_id      number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Business List ID',description 'Surrogate key for the business list.',display_in_report 'false',display_in_form 'false',semantic_type
   'identifier' ),
   list_code             varchar2(30 char) not null annotations ( display_label 'List Code',description 'Business code used to identify the list.'
   ,value_required 'true',semantic_type 'code' ),
   list_name             varchar2(100 char) not null annotations ( display_label 'List Name',description 'Business name of the list.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'name' ),
   list_purpose          varchar2(500 char)
      annotations ( display_label 'List Purpose',description 'Business purpose of the list and where it is used.',semantic_type
      'description' ),
   maintained_by_role_id number
      annotations ( display_label 'Maintained By Role ID',description 'Role allowed to maintain the list.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   list_status_code      varchar2(20 char) default 'ACTIVE' not null annotations ( display_label 'List Status',description 'Current business status of the list.'
   ,search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include ACTIVE, INACTIVE.' ),
   constraint pk_scm_business_lists primary key ( business_list_id ),
   constraint uq_scm_business_lists_01 unique ( list_code ),
   constraint fk_scm_business_lists_01 foreign key ( maintained_by_role_id )
      references scm_user_roles ( user_role_id ),
   constraint ck_scm_business_lists_01 check ( list_status_code in ( 'ACTIVE',
                                                                     'INACTIVE' ) )
) annotations ( display_label 'Business Lists',description 'Stores records for business lists.',application_module 'Inventory and Warehouse Management'
);

create table scm_business_list_values (
   business_list_value_id number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Business List Value ID',description 'Surrogate key for the business list value.',display_in_report 'false',display_in_form
   'false',semantic_type 'identifier' ),
   business_list_id       number not null annotations ( display_label 'Business List ID',description 'Business list that the value belongs to.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   value_code             varchar2(30 char) not null annotations ( display_label 'Value Code',description 'Business code used to identify the value.'
   ,value_required 'true',semantic_type 'code' ),
   value_name             varchar2(100 char) not null annotations ( display_label 'Value Name',description 'Business name of the list value.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'name' ),
   value_description      varchar2(500 char)
      annotations ( display_label 'Value Description',description 'Business meaning of the list value.',semantic_type 'description'
      ),
   display_sequence       number(6)
      annotations ( display_label 'Display Sequence',description 'Display order of the list value.',semantic_type 'sequence' )
      ,
   is_default_value       boolean default false not null annotations ( display_label 'Is Default Value',description 'Indicates whether this is the default value for the list.'
   ,search_facet 'distinct-list',semantic_type 'flag' ),
   is_active              boolean default true not null annotations ( display_label 'Is Active',description 'Indicates whether the list value is active.'
   ,search_facet 'distinct-list',semantic_type 'flag' ),
   constraint pk_scm_business_list_values primary key ( business_list_value_id ),
   constraint uq_scm_business_list_vals_01 unique ( business_list_id,
                                                    value_code ),
   constraint fk_scm_business_list_vals_01 foreign key ( business_list_id )
      references scm_business_lists ( business_list_id ),
   constraint ck_scm_business_list_vals_01 check ( display_sequence is null
       or display_sequence > 0 )
) annotations ( display_label 'Business List Values',description 'Stores records for business list values.',application_module
'Inventory and Warehouse Management' );

create table scm_approval_policies (
   approval_policy_id       number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Approval Policy ID',description 'Surrogate key for the approval policy.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   policy_code              varchar2(30 char) not null annotations ( display_label 'Policy Code',description 'Business code used to identify the approval policy.'
   ,value_required 'true',semantic_type 'code' ),
   policy_name              varchar2(150 char) not null annotations ( display_label 'Policy Name',description 'Business name of the approval policy.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'name' ),
   approval_subject_code    varchar2(30 char) not null annotations ( display_label 'Approval Subject Code',description 'Business subject that the approval policy controls.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'classification',ai_context 'Valid values include STOCK_TRANSFER, STOCK_ADJUSTMENT, QUARANTINE_CASE, RECEIPT_REJECTION, COUNT_VARIANCE, ROTATION_EXCEPTION, OPERATIONAL_EXCEPTION.'
   ),
   warehouse_id             number
      annotations ( display_label 'Warehouse ID',description 'Warehouse where the policy applies where the rule is site specific.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   threshold_basis_code     varchar2(20 char) not null annotations ( display_label 'Threshold Basis Code',description 'Business basis used to decide when approval is required.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'classification',ai_context 'Valid values include ALWAYS, QUANTITY, VALUE, RISK, MIXED.'
   ),
   minimum_quantity         number(18,4)
      annotations ( display_label 'Minimum Quantity',description 'Minimum quantity threshold that triggers the policy where relevant.'
      ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   maximum_quantity         number(18,4)
      annotations ( display_label 'Maximum Quantity',description 'Maximum quantity threshold covered by the policy where relevant.'
      ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   minimum_value_amount     number(18,2)
      annotations ( display_label 'Minimum Value Amount',description 'Minimum stock value that triggers the policy where relevant.'
      ,format_mask 'FM999G999G999G990D00',semantic_type 'amount' ),
   maximum_value_amount     number(18,2)
      annotations ( display_label 'Maximum Value Amount',description 'Maximum stock value covered by the policy where relevant.'
      ,format_mask 'FM999G999G999G990D00',semantic_type 'amount' ),
   risk_level_code          varchar2(20 char)
      annotations ( display_label 'Risk Level Code',description 'Business risk level that triggers the policy where relevant.'
      ,semantic_type 'classification',ai_context 'Valid values include LOW, MEDIUM, HIGH, CRITICAL.' ),
   reviewer_role_id         number not null annotations ( display_label 'Reviewer Role ID',description 'Role that should review the approval request.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   escalation_role_id       number
      annotations ( display_label 'Escalation Role ID',description 'Role that should receive the request when it must be escalated.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   approval_authority_level number(4) default 1 not null annotations ( display_label 'Approval Authority Level',description 'Authority level needed to act on the policy.'
   ,search_facet 'range',semantic_type 'ranking' ),
   policy_status_code       varchar2(20 char) default 'ACTIVE' not null annotations ( display_label 'Policy Status Code',description
   'Current business status of the approval policy.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include ACTIVE, INACTIVE.'
   ),
   policy_notes             varchar2(1000 char)
      annotations ( display_label 'Policy Notes',description 'Business notes for the approval policy.',semantic_type 'comment'
      ),
   constraint pk_scm_approval_policies primary key ( approval_policy_id ),
   constraint uq_scm_approval_policies_01 unique ( policy_code ),
   constraint fk_scm_approval_policies_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_approval_policies_02 foreign key ( reviewer_role_id )
      references scm_user_roles ( user_role_id ),
   constraint fk_scm_approval_policies_03 foreign key ( escalation_role_id )
      references scm_user_roles ( user_role_id ),
   constraint ck_scm_approval_policies_01
      check ( approval_subject_code in ( 'STOCK_TRANSFER',
                                         'STOCK_ADJUSTMENT',
                                         'QUARANTINE_CASE',
                                         'RECEIPT_REJECTION',
                                         'COUNT_VARIANCE',
                                         'ROTATION_EXCEPTION',
                                         'OPERATIONAL_EXCEPTION',
                                         'INBOUND_RECEIPT_LINE',
                                         'STOCK_COUNT_LINE',
                                         'OUTBOUND_ORDER_LINE' ) ),
   constraint ck_scm_approval_policies_02
      check ( threshold_basis_code in ( 'ALWAYS',
                                        'QUANTITY',
                                        'VALUE',
                                        'RISK',
                                        'MIXED' ) ),
   constraint ck_scm_approval_policies_03
      check ( minimum_quantity is null
          or minimum_quantity >= 0 ),
   constraint ck_scm_approval_policies_04
      check ( maximum_quantity is null
          or maximum_quantity >= 0 ),
   constraint ck_scm_approval_policies_05
      check ( minimum_value_amount is null
          or minimum_value_amount >= 0 ),
   constraint ck_scm_approval_policies_06
      check ( maximum_value_amount is null
          or maximum_value_amount >= 0 ),
   constraint ck_scm_approval_policies_07
      check ( risk_level_code in ( 'LOW',
                                   'MEDIUM',
                                   'HIGH',
                                   'CRITICAL' )
          or risk_level_code is null ),
   constraint ck_scm_approval_policies_08 check ( approval_authority_level > 0 ),
   constraint ck_scm_approval_policies_09 check ( policy_status_code in ( 'ACTIVE',
                                                                          'INACTIVE' ) ),
   constraint ck_scm_approval_policies_10
      check ( maximum_quantity is null
          or minimum_quantity is null
          or maximum_quantity >= minimum_quantity ),
   constraint ck_scm_approval_policies_11
      check ( maximum_value_amount is null
          or minimum_value_amount is null
          or maximum_value_amount >= minimum_value_amount )
) annotations ( display_label 'Approval Policies',description 'Stores records for approval policies.',application_module 'Inventory and Warehouse Management'
);

create table scm_warehouse_areas (
   warehouse_area_id                  number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations
   ( display_label 'Warehouse Area ID',description 'Surrogate key for the warehouse area.',display_in_report 'false',display_in_form
   'false',semantic_type 'identifier' ),
   warehouse_id                       number not null annotations ( display_label 'Warehouse ID',description 'Warehouse that contains the area.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   area_code                          varchar2(30 char) not null annotations ( display_label 'Area Code',description 'Business code used to identify the area within the warehouse.'
   ,value_required 'true',semantic_type 'code' ),
   area_name                          varchar2(200 char) not null annotations ( display_label 'Area Name',description 'Business name of the warehouse area.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'name' ),
   area_type_code                     varchar2(20 char) not null annotations ( display_label 'Area Type',description 'Business purpose of the area such as receiving, storage, picking, quarantine, or dispatch.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'type',ai_context 'Valid values include RECEIVING, STORAGE, PICKING, PACKING, QUARANTINE, RETURNS, DISPATCH, STAGING.'
   ),
   area_status_code                   varchar2(20 char) default 'ACTIVE' not null annotations ( display_label 'Area Status',description
   'Current operating status of the area.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include ACTIVE, INACTIVE.'
   ),
   sequence_number                    number(6)
      annotations ( display_label 'Sequence Number',description 'Display or operational sequence of the area within the warehouse.'
      ,semantic_type 'sequence' ),
   allows_mixed_items                 boolean default false not null annotations ( display_label 'Allows Mixed Items',description
   'Indicates whether different items can be stored together in the same area.',search_facet 'distinct-list',semantic_type 'flag'
   ),
   allows_damaged_stock               boolean default false not null annotations ( display_label 'Allows Damaged Stock',description
   'Indicates whether damaged stock can be stored in this area.',search_facet 'distinct-list',semantic_type 'flag' ),
   approved_for_high_value_flag       boolean default false not null annotations ( display_label 'Approved For High Value Flag'
   ,description 'Indicates whether the area is approved for high value stock.',search_facet 'distinct-list',semantic_type 'flag'
   ),
   approved_for_sensitive_goods_flag  boolean default false not null annotations ( display_label 'Approved For Sensitive Goods Flag'
   ,description 'Indicates whether the area is approved for sensitive or controlled goods.',search_facet 'distinct-list',semantic_type
   'flag' ),
   approved_for_restricted_goods_flag boolean default false not null annotations ( display_label 'Approved For Restricted Goods Flag'
   ,description 'Indicates whether the area is approved for restricted stock.',semantic_type 'flag' ),
   notes                              varchar2(500 char)
      annotations ( display_label 'Notes',description 'Business notes for the warehouse area.',semantic_type 'comment' ),
   constraint pk_scm_warehouse_areas primary key ( warehouse_area_id ),
   constraint uq_scm_warehouse_areas_01 unique ( warehouse_id,
                                                 area_code ),
   constraint fk_scm_warehouse_areas_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint ck_scm_warehouse_areas_01
      check ( area_type_code in ( 'RECEIVING',
                                  'STORAGE',
                                  'PICKING',
                                  'PACKING',
                                  'QUARANTINE',
                                  'RETURNS',
                                  'DISPATCH',
                                  'STAGING' ) ),
   constraint ck_scm_warehouse_areas_02 check ( area_status_code in ( 'ACTIVE',
                                                                      'INACTIVE' ) ),
   constraint ck_scm_warehouse_areas_03 check ( sequence_number is null
       or sequence_number > 0 )
) annotations ( display_label 'Warehouse Areas',description 'Stores records for warehouse areas.',application_module 'Inventory and Warehouse Management'
);

create table scm_storage_locations (
   storage_location_id                number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations
   ( display_label 'Storage Location ID',description 'Surrogate key for the storage location.',display_in_report 'false',display_in_form
   'false',semantic_type 'identifier' ),
   warehouse_id                       number not null annotations ( display_label 'Warehouse ID',description 'Warehouse that contains the storage location.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   warehouse_area_id                  number not null annotations ( display_label 'Warehouse Area ID',description 'Area that contains the storage location.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   parent_location_id                 number
      annotations ( display_label 'Parent Location ID',description 'Parent location when the location is part of a hierarchy.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   location_code                      varchar2(50 char) not null annotations ( display_label 'Location Code',description 'Business code used to identify the storage location.'
   ,value_required 'true',semantic_type 'code' ),
   location_name                      varchar2(200 char)
      annotations ( display_label 'Location Name',description 'Business name of the storage location.',primary_display_column
      'true',semantic_type 'name' ),
   location_type_code                 varchar2(20 char) not null annotations ( display_label 'Location Type',description 'Business purpose of the storage location.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'type',ai_context 'Valid values include DOCK, STAGING, BULK, PICK_FACE, BIN, PACK, DISPATCH, QUARANTINE, RETURNS.'
   ),
   location_status_code               varchar2(20 char) default 'ACTIVE' not null annotations ( display_label 'Location Status'
   ,description 'Current operating status of the location.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include ACTIVE, INACTIVE, BLOCKED.'
   ),
   aisle_code                         varchar2(30 char)
      annotations ( display_label 'Aisle Code',description 'Aisle identifier used for warehouse navigation.',semantic_type 'code'
      ),
   bay_code                           varchar2(30 char)
      annotations ( display_label 'Bay Code',description 'Bay identifier used for warehouse navigation.',semantic_type 'code'
      ),
   level_code                         varchar2(30 char)
      annotations ( display_label 'Level Code',description 'Level or shelf identifier used for warehouse navigation.',semantic_type
      'code' ),
   position_code                      varchar2(30 char)
      annotations ( display_label 'Position Code',description 'Position identifier within the location.',semantic_type 'code'
      ),
   preferred_item_id                  number
      annotations ( display_label 'Preferred Item ID',description 'Preferred item normally slotted into the location where item-specific slotting is used.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   preferred_storage_class_code       varchar2(30 char)
      annotations ( display_label 'Preferred Storage Class Code',description 'Preferred storage class normally slotted into the location where class-based slotting is used.'
      ,search_facet 'distinct-list',semantic_type 'classification' ),
   max_capacity_units                 number(18,4)
      annotations ( display_label 'Maximum Capacity Units',description 'Maximum quantity capacity supported by the location in the base handling unit.'
      ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   pick_sequence_number               number(10)
      annotations ( display_label 'Pick Sequence Number',description 'Sequence used to guide efficient picking within the warehouse.'
      ,semantic_type 'sequence' ),
   putaway_sequence_number            number(10)
      annotations ( display_label 'Putaway Sequence Number',description 'Sequence used to guide efficient putaway within the warehouse.'
      ,semantic_type 'sequence' ),
   approved_for_high_value_flag       boolean default false not null annotations ( display_label 'Approved For High Value Flag'
   ,description 'Indicates whether the location is approved for high value stock.',search_facet 'distinct-list',semantic_type
   'flag' ),
   approved_for_sensitive_goods_flag  boolean default false not null annotations ( display_label 'Approved For Sensitive Goods Flag'
   ,description 'Indicates whether the location is approved for sensitive or controlled goods.',search_facet 'distinct-list',
   semantic_type 'flag' ),
   approved_for_restricted_goods_flag boolean default false not null annotations ( display_label 'Approved For Restricted Goods Flag'
   ,description 'Indicates whether the location is approved for restricted stock.',search_facet 'distinct-list',semantic_type
   'flag' ),
   allows_mixed_items                 boolean default false not null annotations ( display_label 'Allows Mixed Items',description
   'Indicates whether multiple items may be stored in the location at the same time.',search_facet 'distinct-list',semantic_type
   'flag' ),
   allows_mixed_lots                  boolean default false not null annotations ( display_label 'Allows Mixed Lots',description
   'Indicates whether multiple lots may be stored in the location at the same time.',search_facet 'distinct-list',semantic_type
   'flag' ),
   is_pickable                        boolean default true not null annotations ( display_label 'Is Pickable',description 'Indicates whether stock can be picked directly from this location.'
   ,search_facet 'distinct-list',semantic_type 'flag' ),
   is_active                          boolean default true not null annotations ( display_label 'Is Active',description 'Indicates whether the location is active for operations.'
   ,semantic_type 'flag' ),
   constraint pk_scm_storage_locations primary key ( storage_location_id ),
   constraint uq_scm_storage_locations_01 unique ( warehouse_id,
                                                   location_code ),
   constraint fk_scm_storage_locations_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_storage_locations_02 foreign key ( warehouse_area_id )
      references scm_warehouse_areas ( warehouse_area_id ),
   constraint fk_scm_storage_locations_03 foreign key ( parent_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint ck_scm_storage_locations_01
      check ( location_type_code in ( 'DOCK',
                                      'STAGING',
                                      'BULK',
                                      'PICK_FACE',
                                      'BIN',
                                      'PACK',
                                      'DISPATCH',
                                      'QUARANTINE',
                                      'RETURNS' ) ),
   constraint ck_scm_storage_locations_02
      check ( location_status_code in ( 'ACTIVE',
                                        'INACTIVE',
                                        'BLOCKED' ) ),
   constraint ck_scm_storage_locations_03 check ( max_capacity_units is null
       or max_capacity_units > 0 ),
   constraint ck_scm_storage_locations_04 check ( pick_sequence_number is null
       or pick_sequence_number > 0 ),
   constraint ck_scm_storage_locations_05 check ( putaway_sequence_number is null
       or putaway_sequence_number > 0 )
) annotations ( display_label 'Storage Locations',description 'Stores records for storage locations.',application_module 'Inventory and Warehouse Management'
);

create table scm_items (
   item_id                           number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations
   ( display_label 'Item ID',description 'Surrogate key for the inventory item.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   item_code                         varchar2(50 char) not null annotations ( display_label 'Item Code',description 'Business code used to identify the inventory item.'
   ,value_required 'true',semantic_type 'code' ),
   item_name                         varchar2(200 char) not null annotations ( display_label 'Item Name',description 'Business name of the inventory item.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'name' ),
   item_description                  varchar2(1000 char)
      annotations ( display_label 'Item Description',description 'Business description of the inventory item.',semantic_type 'description'
      ),
   item_category_code                varchar2(30 char) not null annotations ( display_label 'Item Category',description 'Business category of the item.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'category' ),
   item_subcategory_code             varchar2(30 char)
      annotations ( display_label 'Item Subcategory Code',description 'Business subcategory of the item.',search_facet 'distinct-list'
      ,semantic_type 'category' ),
   item_family_code                  varchar2(30 char)
      annotations ( display_label 'Item Family Code',description 'Business family used to group related items.',search_facet 'distinct-list'
      ,semantic_type 'classification' ),
   base_uom_code                     varchar2(10 char) not null annotations ( display_label 'Base Unit of Measure',description
   'Default unit of measure used for inventory quantities.',value_required 'true',search_facet 'distinct-list',semantic_type 'unit_of_measure'
   ),
   pack_uom_code                     varchar2(10 char)
      annotations ( display_label 'Pack Unit of Measure',description 'Pack unit of measure used for case, carton, or handling quantities where relevant.'
      ,search_facet 'distinct-list',semantic_type 'unit_of_measure' ),
   item_status_code                  varchar2(20 char) default 'ACTIVE' not null annotations ( display_label 'Item Status',description
   'Current business status of the item.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include ACTIVE, INACTIVE, DISCONTINUED.'
   ),
   handling_profile_code             varchar2(30 char)
      annotations ( display_label 'Handling Profile Code',description 'Business handling profile attached to the item.',search_facet
      'distinct-list',semantic_type 'classification' ),
   storage_class_code                varchar2(30 char)
      annotations ( display_label 'Storage Class Code',description 'Business storage class used to guide approved storage areas and locations.'
      ,search_facet 'distinct-list',semantic_type 'classification' ),
   shelf_life_days                   number(6)
      annotations ( display_label 'Shelf Life Days',description 'Expected shelf life of the item in days where relevant.',semantic_type
      'duration_days' ),
   minimum_remaining_shelf_life_days number(6)
      annotations ( display_label 'Minimum Remaining Shelf Life Days',description 'Minimum remaining shelf life required at the point of allocation or dispatch.'
      ,semantic_type 'duration_days' ),
   lot_control_flag                  boolean default false not null annotations ( display_label 'Lot Control Flag',description
   'Indicates whether the item must be tracked by lot or batch.',search_facet 'distinct-list',semantic_type 'flag' ),
   serial_control_flag               boolean default false not null annotations ( display_label 'Serial Control Flag',description
   'Indicates whether the item must be tracked by serial number.',search_facet 'distinct-list',semantic_type 'flag' ),
   expiry_control_flag               boolean default false not null annotations ( display_label 'Expiry Control Flag',description
   'Indicates whether the item requires expiry or best-before tracking.',search_facet 'distinct-list',semantic_type 'flag' ),
   fragile_flag                      boolean default false not null annotations ( display_label 'Fragile Flag',description 'Indicates whether the item needs fragile handling.'
   ,semantic_type 'flag' ),
   hazardous_flag                    boolean default false not null annotations ( display_label 'Hazardous Flag',description 'Indicates whether the item needs hazardous handling controls.'
   ,semantic_type 'flag' ),
   temperature_control_flag          boolean default false not null annotations ( display_label 'Temperature Control Flag',description
   'Indicates whether the item needs temperature-controlled handling.',semantic_type 'flag' ),
   high_value_flag                   boolean default false not null annotations ( display_label 'High Value Flag',description
   'Indicates whether the item should be treated as high value inventory.',semantic_type 'flag' ),
   restricted_item_flag              boolean default false not null annotations ( display_label 'Restricted Item Flag',description
   'Indicates whether the item requires restricted storage or controlled release.',semantic_type 'flag' ),
   standard_weight_kg                number(12,3)
      annotations ( display_label 'Standard Weight KG',description 'Standard weight of one unit of the item in kilograms.',format_mask
      'FM999G999G999G990D000',semantic_type 'quantity' ),
   standard_volume_cbm               number(12,6)
      annotations ( display_label 'Standard Volume CBM',description 'Standard volume of one unit of the item in cubic metres.'
      ,format_mask 'FM999G999G999G990D000000',semantic_type 'quantity' ),
   pack_size_quantity                number(18,4)
      annotations ( display_label 'Pack Size Quantity',description 'Quantity represented by the pack handling unit where pack-based handling is relevant.'
      ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   storage_handling_notes            varchar2(1000 char)
      annotations ( display_label 'Storage Handling Notes',description 'Storage and handling notes used by warehouse operations.'
      ,semantic_type 'comment' ),
   stock_status_rule_code            varchar2(30 char)
      annotations ( display_label 'Stock Status Rule Code',description 'Business rule used to determine the default stock status handling for the item.'
      ,search_facet 'distinct-list',semantic_type 'classification' ),
   owner_customer_partner_id         number
      annotations ( display_label 'Owner Customer Partner ID',description 'Customer that owns the item where the stock is customer-owned or consigned.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   created_at                        timestamp with time zone default systimestamp not null annotations ( display_label 'Created At'
   ,description 'Date and time when the item record was created.',display_in_form 'false',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
   ,semantic_type 'datetime' ),
   created_by                        varchar2(128 char) default sys_context(
      'USERENV',
      'SESSION_USER'
   ) not null annotations ( display_label 'Created By',description 'Database user that created the item record.',display_in_form
   'false',semantic_type 'user_name' ),
   constraint pk_scm_items primary key ( item_id ),
   constraint uq_scm_items_01 unique ( item_code ),
   constraint fk_scm_items_01 foreign key ( owner_customer_partner_id )
      references scm_business_partners ( business_partner_id ),
   constraint ck_scm_items_01
      check ( item_status_code in ( 'ACTIVE',
                                    'INACTIVE',
                                    'DISCONTINUED' ) ),
   constraint ck_scm_items_02
      check ( shelf_life_days is null
          or shelf_life_days >= 0 ),
   constraint ck_scm_items_03
      check ( minimum_remaining_shelf_life_days is null
          or minimum_remaining_shelf_life_days >= 0 ),
   constraint ck_scm_items_04
      check ( shelf_life_days is null
          or minimum_remaining_shelf_life_days is null
          or minimum_remaining_shelf_life_days <= shelf_life_days ),
   constraint ck_scm_items_04a check ( pack_size_quantity is null
       or pack_size_quantity > 0 ),
   constraint ck_scm_items_05
      check ( standard_weight_kg is null
          or standard_weight_kg >= 0 ),
   constraint ck_scm_items_06
      check ( standard_volume_cbm is null
          or standard_volume_cbm >= 0 )
) annotations ( display_label 'Items',description 'Stores records for items.',application_module 'Inventory and Warehouse Management'
);

alter table scm_storage_locations
   add constraint fk_scm_storage_locations_04 foreign key ( preferred_item_id )
      references scm_items ( item_id );

create table scm_item_warehouse_policies (
   item_warehouse_policy_id     number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Item Warehouse Policy ID',description 'Surrogate key for the item and warehouse policy.',display_in_report 'false',display_in_form
   'false',semantic_type 'identifier' ),
   item_id                      number not null annotations ( display_label 'Item ID',description 'Item covered by the policy.'
   ,value_required 'true',primary_display_column 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   warehouse_id                 number not null annotations ( display_label 'Warehouse ID',description 'Warehouse where the policy applies.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   rotation_method_code         varchar2(10 char) not null annotations ( display_label 'Rotation Method',description 'Stock rotation method used for the item in the warehouse.'
   ,value_required 'true',semantic_type 'method',ai_context 'Valid values include FIFO, FEFO.' ),
   minimum_stock_quantity       number(18,4)
      annotations ( display_label 'Minimum Stock Quantity',description 'Minimum stock level that should be maintained in the warehouse.'
      ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   reorder_point_quantity       number(18,4)
      annotations ( display_label 'Reorder Point Quantity',description 'Quantity level that triggers replenishment review.',format_mask
      'FM999G999G999G990D0000',semantic_type 'quantity' ),
   reorder_target_quantity      number(18,4)
      annotations ( display_label 'Reorder Target Quantity',description 'Target stock quantity after replenishment.',format_mask
      'FM999G999G999G990D0000',semantic_type 'quantity' ),
   maximum_stock_quantity       number(18,4)
      annotations ( display_label 'Maximum Stock Quantity',description 'Maximum planned stock quantity for the warehouse.',format_mask
      'FM999G999G999G990D0000',semantic_type 'quantity' ),
   safety_stock_quantity        number(18,4)
      annotations ( display_label 'Safety Stock Quantity',description 'Safety stock quantity that should remain protected before replenishment risk is escalated.'
      ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   replenishment_lead_time_days number(6)
      annotations ( display_label 'Replenishment Lead Time Days',description 'Lead time in days used when evaluating replenishment urgency and alert timing.'
      ,semantic_type 'duration_days' ),
   count_tolerance_quantity     number(18,4)
      annotations ( display_label 'Count Tolerance Quantity',description 'Accepted quantity tolerance before a count difference needs investigation.'
      ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   count_tolerance_percent      number(5,2)
      annotations ( display_label 'Count Tolerance Percent',description 'Accepted percentage tolerance before a count difference needs investigation.'
      ,format_mask 'FM990D00',semantic_type 'percentage' ),
   cycle_count_class_code       varchar2(1 char)
      annotations ( display_label 'Cycle Count Class',description 'Counting priority class used to plan cycle counts.',search_facet
      'distinct-list',semantic_type 'classification',ai_context 'Valid values include A, B, C.' ),
   preferred_pick_area_id       number
      annotations ( display_label 'Preferred Pick Area ID',description 'Preferred warehouse area for picking this item.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   preferred_storage_area_id    number
      annotations ( display_label 'Preferred Storage Area ID',description 'Preferred warehouse area for storing this item.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   quarantine_on_receipt_flag   boolean default false not null annotations ( display_label 'Quarantine On Receipt Flag',description
   'Indicates whether receipts should default to quarantine for this item in the warehouse.',search_facet 'distinct-list',semantic_type
   'flag' ),
   low_stock_alert_enabled_flag boolean default true not null annotations ( display_label 'Low Stock Alert Enabled Flag',description
   'Indicates whether low stock alerts should be raised for the item in the warehouse.',search_facet 'distinct-list',semantic_type
   'flag' ),
   is_active                    boolean default true not null annotations ( display_label 'Is Active',description 'Indicates whether the policy is active.'
   ,search_facet 'distinct-list',semantic_type 'flag' ),
   constraint pk_scm_item_wh_policies primary key ( item_warehouse_policy_id ),
   constraint uq_scm_item_wh_policies_01 unique ( item_id,
                                                  warehouse_id ),
   constraint fk_scm_item_wh_policies_01 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint fk_scm_item_wh_policies_02 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_item_wh_policies_03 foreign key ( preferred_pick_area_id )
      references scm_warehouse_areas ( warehouse_area_id ),
   constraint fk_scm_item_wh_policies_03a foreign key ( preferred_storage_area_id )
      references scm_warehouse_areas ( warehouse_area_id ),
   constraint ck_scm_item_wh_policies_01 check ( rotation_method_code in ( 'FIFO',
                                                                           'FEFO' ) ),
   constraint ck_scm_item_wh_policies_02
      check ( cycle_count_class_code in ( 'A',
                                          'B',
                                          'C' )
          or cycle_count_class_code is null ),
   constraint ck_scm_item_wh_policies_03
      check ( minimum_stock_quantity is null
          or minimum_stock_quantity >= 0 ),
   constraint ck_scm_item_wh_policies_04
      check ( reorder_point_quantity is null
          or reorder_point_quantity >= 0 ),
   constraint ck_scm_item_wh_policies_05
      check ( reorder_target_quantity is null
          or reorder_target_quantity >= 0 ),
   constraint ck_scm_item_wh_policies_06
      check ( maximum_stock_quantity is null
          or maximum_stock_quantity >= 0 ),
   constraint ck_scm_item_wh_policies_06a
      check ( safety_stock_quantity is null
          or safety_stock_quantity >= 0 ),
   constraint ck_scm_item_wh_policies_06b
      check ( replenishment_lead_time_days is null
          or replenishment_lead_time_days >= 0 ),
   constraint ck_scm_item_wh_policies_07
      check ( reorder_point_quantity is null
          or reorder_target_quantity is null
          or reorder_point_quantity <= reorder_target_quantity ),
   constraint ck_scm_item_wh_policies_08
      check ( reorder_target_quantity is null
          or maximum_stock_quantity is null
          or reorder_target_quantity <= maximum_stock_quantity ),
   constraint ck_scm_item_wh_policies_08a
      check ( safety_stock_quantity is null
          or reorder_point_quantity is null
          or safety_stock_quantity <= reorder_point_quantity ),
   constraint ck_scm_item_wh_policies_09
      check ( count_tolerance_quantity is null
          or count_tolerance_quantity >= 0 ),
   constraint ck_scm_item_wh_policies_10
      check ( count_tolerance_percent is null
          or ( count_tolerance_percent >= 0
         and count_tolerance_percent <= 100 ) )
) annotations ( display_label 'Item Warehouse Policies',description 'Stores records for item warehouse policies.',application_module
'Inventory and Warehouse Management' );

create table scm_replenishment_alerts (
   replenishment_alert_id             number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations
   ( display_label 'Replenishment Alert ID',description 'Surrogate key for the replenishment alert.',display_in_report 'false'
   ,display_in_form 'false',semantic_type 'identifier' ),
   alert_number                       varchar2(30 char) not null annotations ( display_label 'Alert Number',description 'Business reference used to identify the replenishment alert.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'reference_number' ),
   warehouse_id                       number not null annotations ( display_label 'Warehouse ID',description 'Warehouse where the replenishment need was identified.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   item_id                            number not null annotations ( display_label 'Item ID',description 'Item that requires replenishment review.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   item_warehouse_policy_id           number
      annotations ( display_label 'Item Warehouse Policy ID',description 'Warehouse policy that triggered the alert where relevant.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   pick_location_id                   number
      annotations ( display_label 'Pick Location ID',description 'Pick location that needs replenishment where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   reserve_location_id                number
      annotations ( display_label 'Reserve Location ID',description 'Reserve location expected to supply the replenishment where known.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   alert_type_code                    varchar2(30 char) not null annotations ( display_label 'Alert Type Code',description 'Business type of replenishment alert.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'classification',ai_context 'Valid values include LOW_STOCK, OUT_OF_STOCK, PICK_FACE_REPLENISHMENT, AGING_REVIEW, SHORT_DATED_REVIEW.'
   ),
   alert_status_code                  varchar2(20 char) default 'OPEN' not null annotations ( display_label 'Alert Status Code'
   ,description 'Current business status of the replenishment alert.',search_facet 'distinct-list',semantic_type 'status',ai_context
   'Valid values include OPEN, IN_REVIEW, ACTIONED, CLOSED, SUPPRESSED.' ),
   priority_code                      varchar2(20 char) default 'MEDIUM' not null annotations ( display_label 'Priority Code'
   ,description 'Business priority of the replenishment alert.',semantic_type 'priority',ai_context 'Valid values include LOW, MEDIUM, HIGH, CRITICAL.'
   ),
   available_quantity                 number(18,4)
      annotations ( display_label 'Available Quantity',description 'Available quantity seen when the alert was raised.',format_mask
      'FM999G999G999G990D0000',semantic_type 'quantity' ),
   trigger_quantity                   number(18,4)
      annotations ( display_label 'Trigger Quantity',description 'Quantity threshold that triggered the alert.',format_mask 'FM999G999G999G990D0000'
      ,semantic_type 'quantity' ),
   target_quantity                    number(18,4)
      annotations ( display_label 'Target Quantity',description 'Target quantity the business wants to recover to.',format_mask
      'FM999G999G999G990D0000',semantic_type 'quantity' ),
   recommended_replenishment_quantity number(18,4)
      annotations ( display_label 'Recommended Replenishment Quantity',description 'Suggested quantity to move or review as the replenishment action.'
      ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   raised_at                          timestamp with time zone default systimestamp not null annotations ( display_label 'Raised At'
   ,description 'Date and time when the replenishment alert was raised.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type
   'datetime' ),
   reviewed_at                        timestamp with time zone
      annotations ( display_label 'Reviewed At',description 'Date and time when the alert was reviewed.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   reviewed_by_user_id                number
      annotations ( display_label 'Reviewed By User ID',description 'User who reviewed the replenishment alert.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   alert_notes                        varchar2(1000 char)
      annotations ( display_label 'Alert Notes',description 'Business notes for the replenishment alert.',semantic_type 'comment'
      ),
   constraint pk_scm_replenishment_alerts primary key ( replenishment_alert_id ),
   constraint uq_scm_replenishment_alerts_01 unique ( alert_number ),
   constraint fk_scm_replenishment_alerts_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_replenishment_alerts_02 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint fk_scm_replenishment_alerts_03 foreign key ( item_warehouse_policy_id )
      references scm_item_warehouse_policies ( item_warehouse_policy_id ),
   constraint fk_scm_replenishment_alerts_04 foreign key ( pick_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_replenishment_alerts_05 foreign key ( reserve_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_replenishment_alerts_06 foreign key ( reviewed_by_user_id )
      references scm_application_users ( application_user_id ),
   constraint ck_scm_replenishment_alerts_01
      check ( alert_type_code in ( 'LOW_STOCK',
                                   'OUT_OF_STOCK',
                                   'PICK_FACE_REPLENISHMENT',
                                   'AGING_REVIEW',
                                   'SHORT_DATED_REVIEW' ) ),
   constraint ck_scm_replenishment_alerts_02
      check ( alert_status_code in ( 'OPEN',
                                     'IN_REVIEW',
                                     'ACTIONED',
                                     'CLOSED',
                                     'SUPPRESSED' ) ),
   constraint ck_scm_replenishment_alerts_03
      check ( priority_code in ( 'LOW',
                                 'MEDIUM',
                                 'HIGH',
                                 'CRITICAL' ) ),
   constraint ck_scm_replenishment_alerts_04
      check ( available_quantity is null
          or available_quantity >= 0 ),
   constraint ck_scm_replenishment_alerts_05
      check ( trigger_quantity is null
          or trigger_quantity >= 0 ),
   constraint ck_scm_replenishment_alerts_06
      check ( target_quantity is null
          or target_quantity >= 0 ),
   constraint ck_scm_replenishment_alerts_07
      check ( recommended_replenishment_quantity is null
          or recommended_replenishment_quantity >= 0 )
) annotations ( display_label 'Replenishment Alerts',description 'Stores records for replenishment alerts.',application_module
'Inventory and Warehouse Management' );

------------------------------------------------------------------------------
-- 2. Inventory control
------------------------------------------------------------------------------

create table scm_inventory_lots (
   inventory_lot_id     number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Inventory Lot ID',description 'Surrogate key for the inventory lot or batch.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   item_id              number not null annotations ( display_label 'Item ID',description 'Item that the lot belongs to.',value_required
   'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   lot_number           varchar2(60 char) not null annotations ( display_label 'Lot Number',description 'Business lot or batch number used to track the item group.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'reference_number' ),
   supplier_lot_number  varchar2(60 char)
      annotations ( display_label 'Supplier Lot Number',description 'Supplier-provided lot or batch number where this differs from the internal lot number.'
      ,semantic_type 'reference_number' ),
   manufactured_on_date date
      annotations ( display_label 'Manufactured On Date',description 'Manufacturing date of the lot where known.',format_mask
      'DD-MON-YYYY',semantic_type 'date' ),
   received_on_date     date
      annotations ( display_label 'Received On Date',description 'Date when the lot was first received into warehouse control.'
      ,format_mask 'DD-MON-YYYY',semantic_type 'date' ),
   best_before_date     date
      annotations ( display_label 'Best Before Date',description 'Best-before date for the lot where relevant.',format_mask 'DD-MON-YYYY'
      ,semantic_type 'date' ),
   expiry_on_date       date
      annotations ( display_label 'Expiry On Date',description 'Expiry date for the lot where relevant.',format_mask 'DD-MON-YYYY'
      ,semantic_type 'date' ),
   lot_status_code      varchar2(20 char) default 'ACTIVE' not null annotations ( display_label 'Lot Status',description 'Current business status of the lot.'
   ,search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include ACTIVE, QUARANTINED, BLOCKED, EXPIRED, CLOSED.'
   ),
   constraint pk_scm_inventory_lots primary key ( inventory_lot_id ),
   constraint uq_scm_inventory_lots_01 unique ( item_id,
                                                lot_number ),
   constraint fk_scm_inventory_lots_01 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint ck_scm_inventory_lots_01
      check ( lot_status_code in ( 'ACTIVE',
                                   'QUARANTINED',
                                   'BLOCKED',
                                   'EXPIRED',
                                   'CLOSED' ) ),
   constraint ck_scm_inventory_lots_02
      check ( best_before_date is null
          or expiry_on_date is null
          or best_before_date <= expiry_on_date )
) annotations ( display_label 'Inventory Lots',description 'Stores records for inventory lots.',application_module 'Inventory and Warehouse Management'
);

create table scm_inventory_balances (
   inventory_balance_id number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Inventory Balance ID',description 'Surrogate key for the inventory balance row.',display_in_report 'false',display_in_form
   'false',semantic_type 'identifier' ),
   storage_location_id  number not null annotations ( display_label 'Storage Location ID',description 'Location where the stock is currently held.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   item_id              number not null annotations ( display_label 'Item ID',description 'Item held in the location.',value_required
   'true',primary_display_column 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   inventory_lot_id     number
      annotations ( display_label 'Inventory Lot ID',description 'Lot associated with the stock where lot control applies.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   stock_status_code    varchar2(20 char) not null annotations ( display_label 'Stock Status',description 'Business status of the stock held in the location.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include AVAILABLE, QUARANTINED, DAMAGED, BLOCKED, RETURN_HOLD.'
   ),
   quantity_on_hand     number(18,4) default 0 not null annotations ( display_label 'Quantity On Hand',description 'Physical quantity currently held in the location.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   quantity_reserved    number(18,4) default 0 not null annotations ( display_label 'Quantity Reserved',description 'Quantity already reserved for outbound demand.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   quantity_available   number(18,4) generated always as (
      case
         when stock_status_code = 'AVAILABLE' then
            quantity_on_hand - quantity_reserved
         else
            0
      end
   ) virtual annotations ( display_label 'Quantity Available',description 'Usable quantity remaining after reservation for available stock.'
   ,display_in_form 'false',format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   last_counted_at      timestamp with time zone
      annotations ( display_label 'Last Counted At',description 'Date and time when this stock balance was last physically counted.'
      ,format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   last_moved_at        timestamp with time zone
      annotations ( display_label 'Last Moved At',description 'Date and time when this stock balance last changed location or quantity.'
      ,format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   lot_key              number generated always as ( coalesce(
      inventory_lot_id,
      0
   ) ) virtual annotations ( display_label 'Lot Key',description 'Derived key used to enforce uniqueness where a lot is optional.'
   ,display_in_report 'false',display_in_form 'false',semantic_type 'identifier' ),
   constraint pk_scm_inventory_balances primary key ( inventory_balance_id ),
   constraint uq_scm_inventory_balances_01 unique ( storage_location_id,
                                                    item_id,
                                                    lot_key,
                                                    stock_status_code ),
   constraint fk_scm_inventory_balances_01 foreign key ( storage_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_inventory_balances_02 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint fk_scm_inventory_balances_03 foreign key ( inventory_lot_id )
      references scm_inventory_lots ( inventory_lot_id ),
   constraint ck_scm_inventory_balances_01
      check ( stock_status_code in ( 'AVAILABLE',
                                     'QUARANTINED',
                                     'DAMAGED',
                                     'BLOCKED',
                                     'RETURN_HOLD' ) ),
   constraint ck_scm_inventory_balances_02 check ( quantity_on_hand >= 0 ),
   constraint ck_scm_inventory_balances_03 check ( quantity_reserved >= 0 ),
   constraint ck_scm_inventory_balances_04 check ( quantity_reserved <= quantity_on_hand )
) annotations ( display_label 'Inventory Balances',description 'Stores records for inventory balances.',application_module 'Inventory and Warehouse Management'
);

create table scm_inventory_transactions (
   inventory_transaction_id  number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Inventory Transaction ID',description 'Surrogate key for the inventory transaction.',display_in_report 'false',display_in_form
   'false',semantic_type 'identifier' ),
   warehouse_id              number not null annotations ( display_label 'Warehouse ID',description 'Warehouse where the transaction was recorded.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   transaction_type_code     varchar2(30 char) not null annotations ( display_label 'Transaction Type',description 'Business event that changed stock or stock status.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'type',ai_context 'Valid values include RECEIPT, PUTAWAY, MOVE, TRANSFER_OUT, TRANSFER_IN, RESERVE, RESERVE_RELEASE, PICK, PACK, DISPATCH, RETURN, ADJUSTMENT, COUNT_VARIANCE, QUARANTINE, QUARANTINE_RELEASE.'
   ),
   from_location_id          number
      annotations ( display_label 'From Location ID',description 'Location that stock moved from where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   to_location_id            number
      annotations ( display_label 'To Location ID',description 'Location that stock moved to where relevant.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   item_id                   number not null annotations ( display_label 'Item ID',description 'Item affected by the transaction.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   inventory_lot_id          number
      annotations ( display_label 'Inventory Lot ID',description 'Lot affected by the transaction where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   from_status_code          varchar2(20 char)
      annotations ( display_label 'From Status',description 'Stock status before the transaction where relevant.',search_facet
      'distinct-list',semantic_type 'status',ai_context 'Valid values include AVAILABLE, QUARANTINED, DAMAGED, BLOCKED, RETURN_HOLD.'
      ),
   to_status_code            varchar2(20 char)
      annotations ( display_label 'To Status',description 'Stock status after the transaction where relevant.',search_facet 'distinct-list'
      ,semantic_type 'status',ai_context 'Valid values include AVAILABLE, QUARANTINED, DAMAGED, BLOCKED, RETURN_HOLD.' ),
   quantity                  number(18,4) not null annotations ( display_label 'Quantity',description 'Quantity moved or changed by the transaction.'
   ,format_mask 'FM999G999G999G990D0000',value_required 'true',semantic_type 'quantity' ),
   reference_document_type   varchar2(30 char)
      annotations ( display_label 'Reference Document Type',description 'Type of business document that caused the transaction.'
      ,semantic_type 'type' ),
   reference_document_number varchar2(50 char)
      annotations ( display_label 'Reference Document Number',description 'Business reference number of the document that caused the transaction.'
      ,primary_display_column 'true',semantic_type 'reference_number' ),
   reason_code               varchar2(30 char)
      annotations ( display_label 'Reason Code',description 'Business reason code for the transaction.',semantic_type 'reason_code'
      ),
   reason_description        varchar2(500 char)
      annotations ( display_label 'Reason Description',description 'Additional business explanation for the transaction.',semantic_type
      'description' ),
   transaction_at            timestamp with time zone default systimestamp not null annotations ( display_label 'Transaction At'
   ,description 'Date and time when the inventory transaction was recorded.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type
   'datetime' ),
   performed_by              varchar2(128 char) not null annotations ( display_label 'Performed By',description 'User or process that recorded the transaction.'
   ,value_required 'true',semantic_type 'user_name' ),
   constraint pk_scm_inventory_txns primary key ( inventory_transaction_id ),
   constraint fk_scm_inventory_txns_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_inventory_txns_02 foreign key ( from_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_inventory_txns_03 foreign key ( to_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_inventory_txns_04 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint fk_scm_inventory_txns_05 foreign key ( inventory_lot_id )
      references scm_inventory_lots ( inventory_lot_id ),
   constraint ck_scm_inventory_txns_01
      check ( transaction_type_code in ( 'RECEIPT',
                                         'PUTAWAY',
                                         'MOVE',
                                         'TRANSFER_OUT',
                                         'TRANSFER_IN',
                                         'RESERVE',
                                         'RESERVE_RELEASE',
                                         'PICK',
                                         'PACK',
                                         'DISPATCH',
                                         'RETURN',
                                         'ADJUSTMENT',
                                         'COUNT_VARIANCE',
                                         'QUARANTINE',
                                         'QUARANTINE_RELEASE' ) ),
   constraint ck_scm_inventory_txns_02 check ( quantity > 0 ),
   constraint ck_scm_inventory_txns_03
      check ( from_status_code in ( 'AVAILABLE',
                                    'QUARANTINED',
                                    'DAMAGED',
                                    'BLOCKED',
                                    'RETURN_HOLD' )
          or from_status_code is null ),
   constraint ck_scm_inventory_txns_04
      check ( to_status_code in ( 'AVAILABLE',
                                  'QUARANTINED',
                                  'DAMAGED',
                                  'BLOCKED',
                                  'RETURN_HOLD' )
          or to_status_code is null ),
   constraint ck_scm_inventory_txns_05
      check ( transaction_type_code not in ( 'RESERVE',
                                             'PICK',
                                             'PACK',
                                             'DISPATCH' )
          or from_status_code = 'AVAILABLE' )
) annotations ( display_label 'Inventory Transactions',description 'Stores records for inventory transactions.',application_module
'Inventory and Warehouse Management' );

------------------------------------------------------------------------------
-- 3. Inbound and putaway
------------------------------------------------------------------------------

create table scm_inbound_receipts (
   inbound_receipt_id     number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Inbound Receipt ID',description 'Surrogate key for the inbound receipt.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   receipt_number         varchar2(30 char) not null annotations ( display_label 'Receipt Number',description 'Business reference used to identify the inbound receipt.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'reference_number' ),
   receipt_source_code    varchar2(20 char) not null annotations ( display_label 'Receipt Source',description 'Business source of the inbound receipt.'
   ,value_required 'true',semantic_type 'source',ai_context 'Valid values include SUPPLIER, TRANSFER, CUSTOMER_RETURN, INTERNAL_RETURN, OTHER.'
   ),
   warehouse_id           number not null annotations ( display_label 'Warehouse ID',description 'Warehouse receiving the goods.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   source_partner_id      number
      annotations ( display_label 'Source Partner ID',description 'Partner that sent the goods where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   source_site_id         number
      annotations ( display_label 'Source Site ID',description 'Site that sent the goods where relevant.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   receipt_status_code    varchar2(20 char) default 'PLANNED' not null annotations ( display_label 'Receipt Status',description
   'Current business status of the inbound receipt.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include PLANNED, ARRIVED, PART_RECEIVED, RECEIVED, CANCELLED, CLOSED.'
   ),
   source_document_number varchar2(50 char)
      annotations ( display_label 'Source Document Number',description 'Business reference number from the source document such as purchase order or transfer.'
      ,semantic_type 'reference_number' ),
   carrier_reference      varchar2(50 char)
      annotations ( display_label 'Carrier Reference',description 'Carrier or transport reference for the inbound delivery.',
      semantic_type 'reference_number' ),
   expected_arrival_at    timestamp with time zone
      annotations ( display_label 'Expected Arrival At',description 'Expected arrival date and time for the receipt.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   actual_arrival_at      timestamp with time zone
      annotations ( display_label 'Actual Arrival At',description 'Actual arrival date and time for the receipt.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   receiving_completed_at timestamp with time zone
      annotations ( display_label 'Receiving Completed At',description 'Date and time when receiving was completed.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   received_by            varchar2(128 char)
      annotations ( display_label 'Received By',description 'User who completed receipt of the goods.',semantic_type 'user_name'
      ),
   notes                  varchar2(1000 char)
      annotations ( display_label 'Notes',description 'Business notes for the inbound receipt.',semantic_type 'comment' ),
   constraint pk_scm_inbound_receipts primary key ( inbound_receipt_id ),
   constraint uq_scm_inbound_receipts_01 unique ( receipt_number ),
   constraint fk_scm_inbound_receipts_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_inbound_receipts_02 foreign key ( source_partner_id )
      references scm_business_partners ( business_partner_id ),
   constraint fk_scm_inbound_receipts_03 foreign key ( source_site_id )
      references scm_partner_sites ( partner_site_id ),
   constraint ck_scm_inbound_receipts_01
      check ( receipt_source_code in ( 'SUPPLIER',
                                       'TRANSFER',
                                       'CUSTOMER_RETURN',
                                       'INTERNAL_RETURN',
                                       'OTHER' ) ),
   constraint ck_scm_inbound_receipts_02
      check ( receipt_status_code in ( 'PLANNED',
                                       'ARRIVED',
                                       'PART_RECEIVED',
                                       'RECEIVED',
                                       'CANCELLED',
                                       'CLOSED' ) )
) annotations ( display_label 'Inbound Receipts',description 'Stores records for inbound receipts.',application_module 'Inventory and Warehouse Management'
);

create table scm_inbound_receipt_lines (
   inbound_receipt_line_id       number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Inbound Receipt Line ID',description 'Surrogate key for the inbound receipt line.',display_in_report 'false',display_in_form
   'false',semantic_type 'identifier' ),
   inbound_receipt_id            number not null annotations ( display_label 'Inbound Receipt ID',description 'Inbound receipt that the line belongs to.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   line_number                   number(6) not null annotations ( display_label 'Line Number',description 'Line number within the inbound receipt.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'sequence' ),
   item_id                       number not null annotations ( display_label 'Item ID',description 'Item expected or received on the line.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   inventory_lot_id              number
      annotations ( display_label 'Inventory Lot ID',description 'Lot associated with the receipt line where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   receiving_location_id         number
      annotations ( display_label 'Receiving Location ID',description 'Initial location where goods were placed on arrival.',
      display_as_lov 'select-list',semantic_type 'identifier' ),
   suggested_putaway_location_id number
      annotations ( display_label 'Suggested Putaway Location ID',description 'Suggested storage location for putaway.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   final_putaway_location_id     number
      annotations ( display_label 'Final Putaway Location ID',description 'Final storage location used after putaway.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   putaway_override_reason_code  varchar2(30 char)
      annotations ( display_label 'Putaway Override Reason Code',description 'Reason code recorded when the final putaway location overrides the suggested location.'
      ,semantic_type 'reason_code' ),
   putaway_override_notes        varchar2(500 char)
      annotations ( display_label 'Putaway Override Notes',description 'Business notes explaining the putaway override.',semantic_type
      'comment' ),
   expected_quantity             number(18,4) default 0 not null annotations ( display_label 'Expected Quantity',description 'Quantity expected to arrive on the line.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   received_quantity             number(18,4) default 0 not null annotations ( display_label 'Received Quantity',description 'Quantity physically received on the line.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   received_condition_code       varchar2(20 char)
      annotations ( display_label 'Received Condition',description 'Condition of the goods received on the line.',search_facet
      'distinct-list',semantic_type 'condition',ai_context 'Valid values include GOOD, DAMAGED, MIXED, SUSPECT.' ),
   accepted_quantity             number(18,4) default 0 not null annotations ( display_label 'Accepted Quantity',description 'Quantity accepted into warehouse control.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   quarantine_quantity           number(18,4) default 0 not null annotations ( display_label 'Quarantine Quantity',description
   'Quantity sent to quarantine from the receipt line.',format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   damaged_quantity              number(18,4) default 0 not null annotations ( display_label 'Damaged Quantity',description 'Quantity identified as damaged on the receipt line.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   shortage_quantity             number(18,4) default 0 not null annotations ( display_label 'Shortage Quantity',description 'Quantity short against the expected quantity.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   overage_quantity              number(18,4) default 0 not null annotations ( display_label 'Overage Quantity',description 'Quantity received above the expected quantity.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   rejected_quantity             number(18,4) default 0 not null annotations ( display_label 'Rejected Quantity',description 'Quantity rejected back to the source or refused at the receipt point.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   rejected_disposition_code     varchar2(30 char)
      annotations ( display_label 'Rejected Disposition Code',description 'Business outcome applied to the rejected quantity.'
      ,semantic_type 'disposition',ai_context 'Valid values include RETURN_TO_SOURCE, REFUSE_ON_DOCK, HOLD_FOR_CREDIT, DISPOSE.'
      ),
   line_status_code              varchar2(20 char) default 'OPEN' not null annotations ( display_label 'Line Status',description
   'Current business status of the receipt line.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include OPEN, RECEIVED, PUTAWAY_PENDING, PUTAWAY_COMPLETE, CANCELLED.'
   ),
   discrepancy_reason_code       varchar2(30 char)
      annotations ( display_label 'Discrepancy Reason Code',description 'Reason code for a receipt discrepancy where relevant.'
      ,semantic_type 'reason_code' ),
   line_notes                    varchar2(500 char)
      annotations ( display_label 'Line Notes',description 'Business notes recorded against the receipt line.',semantic_type 'comment'
      ),
   constraint pk_scm_inbound_receipt_lines primary key ( inbound_receipt_line_id ),
   constraint uq_scm_inbound_receipt_lines_01 unique ( inbound_receipt_id,
                                                       line_number ),
   constraint fk_scm_inbound_receipt_lines_01 foreign key ( inbound_receipt_id )
      references scm_inbound_receipts ( inbound_receipt_id ),
   constraint fk_scm_inbound_receipt_lines_02 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint fk_scm_inbound_receipt_lines_03 foreign key ( inventory_lot_id )
      references scm_inventory_lots ( inventory_lot_id ),
   constraint fk_scm_inbound_receipt_lines_04 foreign key ( receiving_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_inbound_receipt_lines_05 foreign key ( suggested_putaway_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_inbound_receipt_lines_06 foreign key ( final_putaway_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint ck_scm_inbound_receipt_lines_01 check ( line_number > 0 ),
   constraint ck_scm_inbound_receipt_lines_02 check ( expected_quantity >= 0 ),
   constraint ck_scm_inbound_receipt_lines_03 check ( received_quantity >= 0 ),
   constraint ck_scm_inbound_receipt_lines_04 check ( accepted_quantity >= 0 ),
   constraint ck_scm_inbound_receipt_lines_05 check ( quarantine_quantity >= 0 ),
   constraint ck_scm_inbound_receipt_lines_06 check ( damaged_quantity >= 0 ),
   constraint ck_scm_inbound_receipt_lines_07 check ( shortage_quantity >= 0 ),
   constraint ck_scm_inbound_receipt_lines_08 check ( overage_quantity >= 0 ),
   constraint ck_scm_inbound_receipt_lines_09
      check ( accepted_quantity + quarantine_quantity + damaged_quantity + rejected_quantity <= received_quantity ),
   constraint ck_scm_inbound_receipt_lines_10
      check ( line_status_code in ( 'OPEN',
                                    'RECEIVED',
                                    'PUTAWAY_PENDING',
                                    'PUTAWAY_COMPLETE',
                                    'CANCELLED' ) ),
   constraint ck_scm_inbound_receipt_lines_11
      check ( received_condition_code in ( 'GOOD',
                                           'DAMAGED',
                                           'MIXED',
                                           'SUSPECT' )
          or received_condition_code is null ),
   constraint ck_scm_inbound_receipt_lines_12 check ( rejected_quantity >= 0 ),
   constraint ck_scm_inbound_receipt_lines_13
      check ( rejected_disposition_code in ( 'RETURN_TO_SOURCE',
                                             'REFUSE_ON_DOCK',
                                             'HOLD_FOR_CREDIT',
                                             'DISPOSE' )
          or rejected_disposition_code is null ),
   constraint ck_scm_inbound_receipt_lines_14
      check ( suggested_putaway_location_id is null
          or final_putaway_location_id is null
          or suggested_putaway_location_id = final_putaway_location_id
          or putaway_override_reason_code is not null ),
   constraint ck_scm_inbound_receipt_lines_15
      check ( putaway_override_reason_code is not null
          or putaway_override_notes is null )
) annotations ( display_label 'Inbound Receipt Lines',description 'Stores records for inbound receipt lines.',application_module
'Inventory and Warehouse Management' );

------------------------------------------------------------------------------
-- 4. Transfers and outbound fulfilment
------------------------------------------------------------------------------

create table scm_stock_transfers (
   stock_transfer_id    number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Stock Transfer ID',description 'Surrogate key for the stock transfer.',display_in_report 'false',display_in_form 'false',
   semantic_type 'identifier' ),
   transfer_number      varchar2(30 char) not null annotations ( display_label 'Transfer Number',description 'Business reference used to identify the stock transfer.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'reference_number' ),
   from_warehouse_id    number not null annotations ( display_label 'From Warehouse ID',description 'Warehouse sending the stock.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   to_warehouse_id      number not null annotations ( display_label 'To Warehouse ID',description 'Warehouse receiving the stock.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   transfer_status_code varchar2(20 char) default 'DRAFT' not null annotations ( display_label 'Transfer Status',description 'Current business status of the stock transfer.'
   ,search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include DRAFT, PENDING_APPROVAL, RELEASED, IN_TRANSIT, PART_RECEIVED, COMPLETED, CANCELLED.'
   ),
   requested_ship_at    timestamp with time zone
      annotations ( display_label 'Requested Ship At',description 'Requested shipment date and time for the transfer.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   actual_shipped_at    timestamp with time zone
      annotations ( display_label 'Actual Shipped At',description 'Actual shipment date and time for the transfer.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   expected_receipt_at  timestamp with time zone
      annotations ( display_label 'Expected Receipt At',description 'Expected receipt date and time at the destination warehouse.'
      ,format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   confirmation_due_at  timestamp with time zone
      annotations ( display_label 'Confirmation Due At',description 'Date and time when transfer receipt confirmation is due before overdue escalation should be raised.'
      ,format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   actual_received_at   timestamp with time zone
      annotations ( display_label 'Actual Received At',description 'Actual receipt date and time at the destination warehouse.'
      ,format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   requested_by         varchar2(128 char) not null annotations ( display_label 'Requested By',description 'User who requested the stock transfer.'
   ,value_required 'true',semantic_type 'user_name' ),
   approved_by          varchar2(128 char)
      annotations ( display_label 'Approved By',description 'User who approved the stock transfer where approval was needed.'
      ,semantic_type 'user_name' ),
   approved_at          timestamp with time zone
      annotations ( display_label 'Approved At',description 'Date and time when the transfer was approved.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   approval_policy_id   number
      annotations ( display_label 'Approval Policy ID',description 'Approval policy applied to the transfer where approval was required.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   reason_code          varchar2(30 char) not null annotations ( display_label 'Reason Code',description 'Business reason for the transfer.'
   ,value_required 'true',semantic_type 'reason_code' ),
   notes                varchar2(1000 char)
      annotations ( display_label 'Notes',description 'Business notes for the stock transfer.',semantic_type 'comment' ),
   constraint pk_scm_stock_transfers primary key ( stock_transfer_id ),
   constraint uq_scm_stock_transfers_01 unique ( transfer_number ),
   constraint fk_scm_stock_transfers_01 foreign key ( from_warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_stock_transfers_02 foreign key ( to_warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_stock_transfers_03 foreign key ( approval_policy_id )
      references scm_approval_policies ( approval_policy_id ),
   constraint ck_scm_stock_transfers_01 check ( from_warehouse_id <> to_warehouse_id ),
   constraint ck_scm_stock_transfers_02
      check ( transfer_status_code in ( 'DRAFT',
                                        'PENDING_APPROVAL',
                                        'RELEASED',
                                        'IN_TRANSIT',
                                        'PART_RECEIVED',
                                        'COMPLETED',
                                        'CANCELLED' ) ),
   constraint ck_scm_stock_transfers_03
      check ( expected_receipt_at is null
          or actual_shipped_at is null
          or expected_receipt_at >= actual_shipped_at ),
   constraint ck_scm_stock_transfers_04
      check ( confirmation_due_at is null
          or expected_receipt_at is null
          or confirmation_due_at >= expected_receipt_at )
) annotations ( display_label 'Stock Transfers',description 'Stores records for stock transfers.',application_module 'Inventory and Warehouse Management'
);

create table scm_stock_transfer_lines (
   stock_transfer_line_id           number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations
   ( display_label 'Stock Transfer Line ID',description 'Surrogate key for the stock transfer line.',display_in_report 'false'
   ,display_in_form 'false',semantic_type 'identifier' ),
   stock_transfer_id                number not null annotations ( display_label 'Stock Transfer ID',description 'Stock transfer that the line belongs to.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   line_number                      number(6) not null annotations ( display_label 'Line Number',description 'Line number within the stock transfer.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'sequence' ),
   item_id                          number not null annotations ( display_label 'Item ID',description 'Item being transferred.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   inventory_lot_id                 number
      annotations ( display_label 'Inventory Lot ID',description 'Lot being transferred where lot control applies.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   source_location_id               number
      annotations ( display_label 'Source Location ID',description 'Location the stock is transferred from where known.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   destination_location_id          number
      annotations ( display_label 'Destination Location ID',description 'Target location in the receiving warehouse where known.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   requested_quantity               number(18,4) not null annotations ( display_label 'Requested Quantity',description 'Quantity requested for transfer.'
   ,format_mask 'FM999G999G999G990D0000',value_required 'true',semantic_type 'quantity' ),
   shipped_quantity                 number(18,4) default 0 not null annotations ( display_label 'Shipped Quantity',description
   'Quantity actually shipped.',format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   received_quantity                number(18,4) default 0 not null annotations ( display_label 'Received Quantity',description
   'Quantity actually received by the destination warehouse.',format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' )
   ,
   quantity_discrepancy             number(18,4) generated always as ( shipped_quantity - received_quantity ) virtual annotations
   ( display_label 'Quantity Discrepancy',description 'Difference between shipped quantity and received quantity.',display_in_form
   'false',format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   unit_cost_amount                 number(18,2)
      annotations ( display_label 'Unit Cost Amount',description 'Unit cost captured for the transfer line where financial exposure is relevant.'
      ,format_mask 'FM999G999G999G990D00',semantic_type 'amount' ),
   currency_code                    varchar2(3 char) default 'INR' not null annotations ( display_label 'Currency Code',description
   'Currency used for the transfer line cost values.',semantic_type 'currency_code' ),
   shipped_line_value_amount        number(18,2) generated always as ( round(
      shipped_quantity * nvl(
         unit_cost_amount,
         0
      ),
      2
   ) ) virtual annotations ( display_label 'Shipped Line Value Amount',description 'Estimated financial value of the shipped quantity.'
   ,display_in_form 'false',format_mask 'FM999G999G999G990D00',semantic_type 'amount' ),
   received_line_value_amount       number(18,2) generated always as ( round(
      received_quantity * nvl(
         unit_cost_amount,
         0
      ),
      2
   ) ) virtual annotations ( display_label 'Received Line Value Amount',description 'Estimated financial value of the received quantity.'
   ,display_in_form 'false',format_mask 'FM999G999G999G990D00',semantic_type 'amount' ),
   transfer_discrepancy_reason_code varchar2(30 char)
      annotations ( display_label 'Transfer Discrepancy Reason Code',description 'Business reason code used when received quantity differs from shipped quantity.'
      ,semantic_type 'reason_code' ),
   transfer_discrepancy_notes       varchar2(500 char)
      annotations ( display_label 'Transfer Discrepancy Notes',description 'Business notes recorded for a transfer discrepancy.'
      ,semantic_type 'comment' ),
   source_stock_status_code         varchar2(20 char) default 'AVAILABLE' not null annotations ( display_label 'Source Stock Status Code'
   ,description 'Stock status allowed to supply the transfer line in the current release.',search_facet 'distinct-list',semantic_type
   'status',ai_context 'Only AVAILABLE is valid for warehouse-to-warehouse transfer supply.' ),
   source_lot_status_code           varchar2(20 char) default 'ACTIVE' not null annotations ( display_label 'Source Lot Status Code'
   ,description 'Lot status allowed to supply the transfer line where lot control applies in the current release.',search_facet
   'distinct-list',semantic_type 'status',ai_context 'Only ACTIVE is valid for warehouse-to-warehouse transfer supply.' ),
   line_status_code                 varchar2(20 char) default 'OPEN' not null annotations ( display_label 'Line Status',description
   'Current business status of the transfer line.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include OPEN, SHIPPED, PART_RECEIVED, RECEIVED, CANCELLED.'
   ),
   constraint pk_scm_stock_transfer_lines primary key ( stock_transfer_line_id ),
   constraint uq_scm_stock_transfer_lines_01 unique ( stock_transfer_id,
                                                      line_number ),
   constraint fk_scm_stock_transfer_lines_01 foreign key ( stock_transfer_id )
      references scm_stock_transfers ( stock_transfer_id ),
   constraint fk_scm_stock_transfer_lines_02 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint fk_scm_stock_transfer_lines_03 foreign key ( inventory_lot_id )
      references scm_inventory_lots ( inventory_lot_id ),
   constraint fk_scm_stock_transfer_lines_04 foreign key ( source_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_stock_transfer_lines_05 foreign key ( destination_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint ck_scm_stock_transfer_lines_01 check ( line_number > 0 ),
   constraint ck_scm_stock_transfer_lines_02 check ( requested_quantity > 0 ),
   constraint ck_scm_stock_transfer_lines_03 check ( shipped_quantity >= 0 ),
   constraint ck_scm_stock_transfer_lines_04 check ( received_quantity >= 0 ),
   constraint ck_scm_stock_transfer_lines_05 check ( shipped_quantity <= requested_quantity ),
   constraint ck_scm_stock_transfer_lines_06 check ( received_quantity <= shipped_quantity ),
   constraint ck_scm_stock_transfer_lines_07
      check ( line_status_code in ( 'OPEN',
                                    'SHIPPED',
                                    'PART_RECEIVED',
                                    'RECEIVED',
                                    'CANCELLED' ) ),
   constraint ck_scm_stock_transfer_lines_08 check ( source_stock_status_code in ( 'AVAILABLE' ) ),
   constraint ck_scm_stock_transfer_lines_09 check ( source_lot_status_code in ( 'ACTIVE' ) ),
   constraint ck_scm_stock_transfer_lines_10
      check ( unit_cost_amount is null
          or unit_cost_amount >= 0 )
) annotations ( display_label 'Stock Transfer Lines',description 'Stores records for stock transfer lines.',application_module
'Inventory and Warehouse Management' );

create table scm_outbound_orders (
   outbound_order_id               number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations (
   display_label 'Outbound Order ID',description 'Surrogate key for the outbound order.',display_in_report 'false',display_in_form
   'false',semantic_type 'identifier' ),
   outbound_order_number           varchar2(30 char) not null annotations ( display_label 'Outbound Order Number',description
   'Business reference used to identify the outbound order.',value_required 'true',primary_display_column 'true',semantic_type
   'reference_number' ),
   order_type_code                 varchar2(20 char) not null annotations ( display_label 'Order Type',description 'Type of outbound demand such as customer order or internal request.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'type',ai_context 'Valid values include CUSTOMER_ORDER, INTERNAL_REQUEST.'
   ),
   ship_from_warehouse_id          number not null annotations ( display_label 'Ship From Warehouse ID',description 'Warehouse fulfilling the outbound order.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   customer_partner_id             number
      annotations ( display_label 'Customer Partner ID',description 'Customer or requesting partner associated with the outbound order.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   ship_to_site_id                 number
      annotations ( display_label 'Ship To Site ID',description 'Destination site for the outbound order.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   carrier_partner_id              number
      annotations ( display_label 'Carrier Partner ID',description 'Carrier used for the outbound order where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   outbound_status_code            varchar2(20 char) default 'NEW' not null annotations ( display_label 'Outbound Status',description
   'Current business status of the outbound order.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include NEW, RELEASED, ALLOCATED, PICKING, PICKED, PACKED, PART_DISPATCHED, DISPATCHED, CANCELLED, CLOSED.'
   ),
   order_date                      date not null annotations ( display_label 'Order Date',description 'Business order date used to capture when the demand was created.'
   ,format_mask 'DD-MON-YYYY',semantic_type 'date' ),
   source_document_number          varchar2(50 char)
      annotations ( display_label 'Source Document Number',description 'Business reference number from the source order or request.'
      ,semantic_type 'reference_number' ),
   dispatch_reference              varchar2(50 char)
      annotations ( display_label 'Dispatch Reference',description 'Business dispatch reference used when the shipment leaves the warehouse.'
      ,semantic_type 'reference_number' ),
   priority_code                   varchar2(20 char) default 'MEDIUM' not null annotations ( display_label 'Priority Code',description
   'Business priority assigned to the outbound order.',semantic_type 'priority',ai_context 'Valid values include LOW, MEDIUM, HIGH, CRITICAL.'
   ),
   requested_ship_at               timestamp with time zone
      annotations ( display_label 'Requested Ship At',description 'Requested shipment date and time.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   promised_ship_at                timestamp with time zone
      annotations ( display_label 'Promised Ship At',description 'Promised shipment date and time.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   partial_fulfilment_allowed_flag boolean default false not null annotations ( display_label 'Partial Fulfilment Allowed Flag'
   ,description 'Indicates whether the order may be dispatched in part where stock is short.',search_facet 'distinct-list',semantic_type
   'flag' ),
   picked_at                       timestamp with time zone
      annotations ( display_label 'Picked At',description 'Date and time when picking was completed.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   picked_by                       varchar2(128 char)
      annotations ( display_label 'Picked By',description 'User who completed picking for the outbound order.',semantic_type 'user_name'
      ),
   packed_at                       timestamp with time zone
      annotations ( display_label 'Packed At',description 'Date and time when packing was completed.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   packed_by                       varchar2(128 char)
      annotations ( display_label 'Packed By',description 'User who completed packing for the outbound order.',semantic_type 'user_name'
      ),
   dispatched_at                   timestamp with time zone
      annotations ( display_label 'Dispatched At',description 'Date and time when the goods left the warehouse.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   dispatched_by                   varchar2(128 char)
      annotations ( display_label 'Dispatched By',description 'User who confirmed dispatch of the outbound order.',semantic_type
      'user_name' ),
   package_count                   number(10)
      annotations ( display_label 'Package Count',description 'Number of packages prepared for dispatch.',semantic_type 'count'
      ),
   notes                           varchar2(1000 char)
      annotations ( display_label 'Notes',description 'Business notes for the outbound order.',semantic_type 'comment' ),
   constraint pk_scm_outbound_orders primary key ( outbound_order_id ),
   constraint uq_scm_outbound_orders_01 unique ( outbound_order_number ),
   constraint fk_scm_outbound_orders_01 foreign key ( ship_from_warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_outbound_orders_02 foreign key ( customer_partner_id )
      references scm_business_partners ( business_partner_id ),
   constraint fk_scm_outbound_orders_03 foreign key ( ship_to_site_id )
      references scm_partner_sites ( partner_site_id ),
   constraint fk_scm_outbound_orders_04 foreign key ( carrier_partner_id )
      references scm_business_partners ( business_partner_id ),
   constraint ck_scm_outbound_orders_01 check ( order_type_code in ( 'CUSTOMER_ORDER',
                                                                     'INTERNAL_REQUEST' ) ),
   constraint ck_scm_outbound_orders_02
      check ( outbound_status_code in ( 'NEW',
                                        'RELEASED',
                                        'ALLOCATED',
                                        'PICKING',
                                        'PICKED',
                                        'PACKED',
                                        'PART_DISPATCHED',
                                        'DISPATCHED',
                                        'CANCELLED',
                                        'CLOSED' ) ),
   constraint ck_scm_outbound_orders_02a
      check ( priority_code in ( 'LOW',
                                 'MEDIUM',
                                 'HIGH',
                                 'CRITICAL' ) ),
   constraint ck_scm_outbound_orders_03
      check ( package_count is null
          or package_count >= 0 )
) annotations ( display_label 'Outbound Orders',description 'Stores records for outbound orders.',application_module 'Inventory and Warehouse Management'
);

create table scm_outbound_order_lines (
   outbound_order_line_id         number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations (
   display_label 'Outbound Order Line ID',description 'Surrogate key for the outbound order line.',display_in_report 'false',
   display_in_form 'false',semantic_type 'identifier' ),
   outbound_order_id              number not null annotations ( display_label 'Outbound Order ID',description 'Outbound order that the line belongs to.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   line_number                    number(6) not null annotations ( display_label 'Line Number',description 'Line number within the outbound order.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'sequence' ),
   item_id                        number not null annotations ( display_label 'Item ID',description 'Item requested on the outbound order line.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   preferred_lot_id               number
      annotations ( display_label 'Preferred Lot ID',description 'Preferred lot for allocation where the business requires a specific lot.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   requested_quantity             number(18,4) not null annotations ( display_label 'Requested Quantity',description 'Quantity requested on the line.'
   ,format_mask 'FM999G999G999G990D0000',value_required 'true',semantic_type 'quantity' ),
   reserved_quantity              number(18,4) default 0 not null annotations ( display_label 'Reserved Quantity',description
   'Quantity reserved against available stock.',format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   picked_quantity                number(18,4) default 0 not null annotations ( display_label 'Picked Quantity',description 'Quantity physically picked.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   packed_quantity                number(18,4) default 0 not null annotations ( display_label 'Packed Quantity',description 'Quantity packed and ready for dispatch.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   dispatched_quantity            number(18,4) default 0 not null annotations ( display_label 'Dispatched Quantity',description
   'Quantity that has left the warehouse.',format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   short_quantity                 number(18,4) default 0 not null annotations ( display_label 'Short Quantity',description 'Quantity that could not be fulfilled.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   source_stock_status_code       varchar2(20 char) default 'AVAILABLE' not null annotations ( display_label 'Source Stock Status Code'
   ,description 'Stock status allowed to supply reservation, picking, packing, and dispatch in the current release.',search_facet
   'distinct-list',semantic_type 'status',ai_context 'Only AVAILABLE is valid for normal outbound fulfilment.' ),
   source_lot_status_code         varchar2(20 char) default 'ACTIVE' not null annotations ( display_label 'Source Lot Status Code'
   ,description 'Lot status allowed to supply reservation, picking, packing, and dispatch where lot control applies in the current release.'
   ,search_facet 'distinct-list',semantic_type 'status',ai_context 'Only ACTIVE is valid for normal outbound fulfilment.' ),
   rotation_exception_flag        boolean default false not null annotations ( display_label 'Rotation Exception Flag',description
   'Indicates whether the line used a stock rotation exception.',search_facet 'distinct-list',semantic_type 'flag' ),
   rotation_exception_reason_code varchar2(30 char)
      annotations ( display_label 'Rotation Exception Reason Code',description 'Business reason for using a stock rotation exception.'
      ,semantic_type 'reason_code' ),
   rotation_approval_policy_id    number
      annotations ( display_label 'Rotation Approval Policy ID',description 'Approval policy applied to the stock rotation exception where relevant.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   rotation_approved_by           varchar2(128 char)
      annotations ( display_label 'Rotation Approved By',description 'User who approved the stock rotation exception.',semantic_type
      'user_name' ),
   rotation_approved_at           timestamp with time zone
      annotations ( display_label 'Rotation Approved At',description 'Date and time when the stock rotation exception was approved.'
      ,format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   allocation_status_code         varchar2(20 char) default 'OPEN' not null annotations ( display_label 'Allocation Status',description
   'Current business status of the outbound order line.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include OPEN, ALLOCATED, PART_ALLOCATED, PICKED, PACKED, PART_DISPATCHED, DISPATCHED, SHORT, CANCELLED.'
   ),
   constraint pk_scm_outbound_order_lines primary key ( outbound_order_line_id ),
   constraint uq_scm_outbound_order_lines_01 unique ( outbound_order_id,
                                                      line_number ),
   constraint fk_scm_outbound_order_lines_01 foreign key ( outbound_order_id )
      references scm_outbound_orders ( outbound_order_id ),
   constraint fk_scm_outbound_order_lines_02 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint fk_scm_outbound_order_lines_03 foreign key ( preferred_lot_id )
      references scm_inventory_lots ( inventory_lot_id ),
   constraint fk_scm_outbound_order_lines_04 foreign key ( rotation_approval_policy_id )
      references scm_approval_policies ( approval_policy_id ),
   constraint ck_scm_outbound_order_lines_01 check ( line_number > 0 ),
   constraint ck_scm_outbound_order_lines_02 check ( requested_quantity > 0 ),
   constraint ck_scm_outbound_order_lines_03 check ( reserved_quantity >= 0 ),
   constraint ck_scm_outbound_order_lines_04 check ( picked_quantity >= 0 ),
   constraint ck_scm_outbound_order_lines_05 check ( packed_quantity >= 0 ),
   constraint ck_scm_outbound_order_lines_06 check ( dispatched_quantity >= 0 ),
   constraint ck_scm_outbound_order_lines_07 check ( short_quantity >= 0 ),
   constraint ck_scm_outbound_order_lines_08 check ( reserved_quantity <= requested_quantity ),
   constraint ck_scm_outbound_order_lines_09 check ( picked_quantity <= reserved_quantity ),
   constraint ck_scm_outbound_order_lines_10 check ( packed_quantity <= picked_quantity ),
   constraint ck_scm_outbound_order_lines_11 check ( dispatched_quantity <= packed_quantity ),
   constraint ck_scm_outbound_order_lines_12
      check ( allocation_status_code in ( 'OPEN',
                                          'ALLOCATED',
                                          'PART_ALLOCATED',
                                          'PICKED',
                                          'PACKED',
                                          'PART_DISPATCHED',
                                          'DISPATCHED',
                                          'SHORT',
                                          'CANCELLED' ) ),
   constraint ck_scm_outbound_order_lines_13 check ( source_stock_status_code in ( 'AVAILABLE' ) ),
   constraint ck_scm_outbound_order_lines_14 check ( source_lot_status_code in ( 'ACTIVE' ) ),
   constraint ck_scm_outbound_order_lines_15
      check ( rotation_exception_flag = false
          or ( rotation_exception_reason_code is not null
         and rotation_approval_policy_id is not null
         and rotation_approved_by is not null
         and rotation_approved_at is not null ) )
) annotations ( display_label 'Outbound Order Lines',description 'Stores records for outbound order lines.',application_module
'Inventory and Warehouse Management' );

create table scm_item_serials (
   item_serial_id                 number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations (
   display_label 'Item Serial ID',description 'Surrogate key for the tracked serial number.',display_in_report 'false',display_in_form
   'false',semantic_type 'identifier' ),
   item_id                        number not null annotations ( display_label 'Item ID',description 'Item that the serial number belongs to.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   serial_number                  varchar2(100 char) not null annotations ( display_label 'Serial Number',description 'Business serial number used to track one individual item.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'reference_number' ),
   inventory_lot_id               number
      annotations ( display_label 'Inventory Lot ID',description 'Lot linked to the serial number where both controls apply.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   current_warehouse_id           number
      annotations ( display_label 'Current Warehouse ID',description 'Warehouse currently responsible for the serial number where it remains under warehouse control.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   current_storage_location_id    number
      annotations ( display_label 'Current Storage Location ID',description 'Current location of the serial number where it remains in warehouse stock.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   source_inbound_receipt_line_id number
      annotations ( display_label 'Source Inbound Receipt Line ID',description 'Inbound receipt line where the serial number first entered warehouse control.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   current_status_code            varchar2(20 char) default 'AVAILABLE' not null annotations ( display_label 'Current Status Code'
   ,description 'Current business status of the serial number.',search_facet 'distinct-list',semantic_type 'status',ai_context
   'Valid values include AVAILABLE, RESERVED, PICKED, DISPATCHED, QUARANTINED, DAMAGED, BLOCKED, RETURN_HOLD, WRITTEN_OFF.' )
   ,
   serial_condition_code          varchar2(20 char) default 'GOOD' not null annotations ( display_label 'Serial Condition Code'
   ,description 'Current condition of the serial controlled item.',search_facet 'distinct-list',semantic_type 'condition',ai_context
   'Valid values include GOOD, DAMAGED, SUSPECT, EXPIRED, RETURNED.' ),
   received_at                    timestamp with time zone
      annotations ( display_label 'Received At',description 'Date and time when the serial number was first received.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   last_moved_at                  timestamp with time zone
      annotations ( display_label 'Last Moved At',description 'Date and time when the serial number last changed status or location.'
      ,format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   last_document_type             varchar2(30 char)
      annotations ( display_label 'Last Document Type',description 'Business document type linked to the most recent serial movement.'
      ,semantic_type 'type' ),
   last_document_number           varchar2(50 char)
      annotations ( display_label 'Last Document Number',description 'Business document number linked to the most recent serial movement.'
      ,semantic_type 'reference_number' ),
   is_active                      boolean default true not null annotations ( display_label 'Is Active',description 'Indicates whether the serial number remains active for warehouse tracking.'
   ,search_facet 'distinct-list',semantic_type 'flag' ),
   serial_notes                   varchar2(500 char)
      annotations ( display_label 'Serial Notes',description 'Business notes for the serial record.',semantic_type 'comment' )
      ,
   constraint pk_scm_item_serials primary key ( item_serial_id ),
   constraint uq_scm_item_serials_01 unique ( item_id,
                                              serial_number ),
   constraint fk_scm_item_serials_01 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint fk_scm_item_serials_02 foreign key ( inventory_lot_id )
      references scm_inventory_lots ( inventory_lot_id ),
   constraint fk_scm_item_serials_04 foreign key ( current_warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_item_serials_05 foreign key ( current_storage_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_item_serials_06 foreign key ( source_inbound_receipt_line_id )
      references scm_inbound_receipt_lines ( inbound_receipt_line_id ),
   constraint ck_scm_item_serials_01
      check ( current_status_code in ( 'AVAILABLE',
                                       'RESERVED',
                                       'PICKED',
                                       'DISPATCHED',
                                       'QUARANTINED',
                                       'DAMAGED',
                                       'BLOCKED',
                                       'RETURN_HOLD',
                                       'WRITTEN_OFF' ) ),
   constraint ck_scm_item_serials_02
      check ( serial_condition_code in ( 'GOOD',
                                         'DAMAGED',
                                         'SUSPECT',
                                         'EXPIRED',
                                         'RETURNED' ) )
) annotations ( display_label 'Item Serials',description 'Stores records for item serials.',application_module 'Inventory and Warehouse Management'
);

create table scm_serial_events (
   serial_event_id           number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Serial Event ID',description 'Surrogate key for the serial event.',display_in_report 'false',display_in_form 'false',semantic_type
   'identifier' ),
   item_serial_id            number not null annotations ( display_label 'Item Serial ID',description 'Serial number affected by the event.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   warehouse_id              number
      annotations ( display_label 'Warehouse ID',description 'Warehouse recording the serial event where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   from_location_id          number
      annotations ( display_label 'From Location ID',description 'Location the serial number moved from where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   to_location_id            number
      annotations ( display_label 'To Location ID',description 'Location the serial number moved to where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   event_type_code           varchar2(30 char) not null annotations ( display_label 'Event Type Code',description 'Business event recorded for the serial number.'
   ,value_required 'true',primary_display_column 'true',search_facet 'distinct-list',semantic_type 'type',ai_context 'Valid values include RECEIPT, PUTAWAY, MOVE, RESERVE, PICK, PACK, DISPATCH, RETURN, QUARANTINE, QUARANTINE_RELEASE, ADJUSTMENT, COUNT.'
   ),
   from_status_code          varchar2(20 char)
      annotations ( display_label 'From Status Code',description 'Status before the serial event where relevant.',search_facet
      'distinct-list',semantic_type 'status' ),
   to_status_code            varchar2(20 char)
      annotations ( display_label 'To Status Code',description 'Status after the serial event where relevant.',search_facet 'distinct-list'
      ,semantic_type 'status' ),
   reference_document_type   varchar2(30 char)
      annotations ( display_label 'Reference Document Type',description 'Business document type that caused the serial event.'
      ,semantic_type 'type' ),
   reference_document_number varchar2(50 char)
      annotations ( display_label 'Reference Document Number',description 'Business document number that caused the serial event.'
      ,semantic_type 'reference_number' ),
   event_at                  timestamp with time zone default systimestamp not null annotations ( display_label 'Event At',description
   'Date and time when the serial event was recorded.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   performed_by              varchar2(128 char) not null annotations ( display_label 'Performed By',description 'User or process that recorded the serial event.'
   ,value_required 'true',semantic_type 'user_name' ),
   event_notes               varchar2(1000 char)
      annotations ( display_label 'Event Notes',description 'Business notes recorded for the serial event.',semantic_type 'comment'
      ),
   constraint pk_scm_serial_events primary key ( serial_event_id ),
   constraint fk_scm_serial_events_01 foreign key ( item_serial_id )
      references scm_item_serials ( item_serial_id ),
   constraint fk_scm_serial_events_02 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_serial_events_03 foreign key ( from_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_serial_events_04 foreign key ( to_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint ck_scm_serial_events_01
      check ( event_type_code in ( 'RECEIPT',
                                   'PUTAWAY',
                                   'MOVE',
                                   'RESERVE',
                                   'PICK',
                                   'PACK',
                                   'DISPATCH',
                                   'RETURN',
                                   'QUARANTINE',
                                   'QUARANTINE_RELEASE',
                                   'ADJUSTMENT',
                                   'COUNT' ) ),
   constraint ck_scm_serial_events_02
      check ( from_status_code in ( 'AVAILABLE',
                                    'RESERVED',
                                    'PICKED',
                                    'DISPATCHED',
                                    'QUARANTINED',
                                    'DAMAGED',
                                    'BLOCKED',
                                    'RETURN_HOLD',
                                    'WRITTEN_OFF' )
          or from_status_code is null ),
   constraint ck_scm_serial_events_03
      check ( to_status_code in ( 'AVAILABLE',
                                  'RESERVED',
                                  'PICKED',
                                  'DISPATCHED',
                                  'QUARANTINED',
                                  'DAMAGED',
                                  'BLOCKED',
                                  'RETURN_HOLD',
                                  'WRITTEN_OFF' )
          or to_status_code is null )
) annotations ( display_label 'Serial Events',description 'Stores records for serial events.',application_module 'Inventory and Warehouse Management'
);

------------------------------------------------------------------------------
-- 5. Returns, quarantine, and adjustments
------------------------------------------------------------------------------

create table scm_returns (
   return_id                 number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Return ID',description 'Surrogate key for the return.',display_in_report 'false',display_in_form 'false',semantic_type 'identifier'
   ),
   return_number             varchar2(30 char) not null annotations ( display_label 'Return Number',description 'Business reference used to identify the return.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'reference_number' ),
   return_type_code          varchar2(20 char) not null annotations ( display_label 'Return Type',description 'Business type of the return.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'type',ai_context 'Valid values include CUSTOMER_RETURN, DELIVERY_RETURN, INTERNAL_RETURN, SUPPLIER_RETURN.'
   ),
   warehouse_id              number not null annotations ( display_label 'Warehouse ID',description 'Warehouse that receives or manages the return.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   source_partner_id         number
      annotations ( display_label 'Source Partner ID',description 'Partner sending or associated with the return.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   source_site_id            number
      annotations ( display_label 'Source Site ID',description 'Site sending or associated with the return.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   related_outbound_order_id number
      annotations ( display_label 'Related Outbound Order ID',description 'Outbound order linked to the return where relevant.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   return_status_code        varchar2(20 char) default 'EXPECTED' not null annotations ( display_label 'Return Status',description
   'Current business status of the return.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include EXPECTED, RECEIVED, ASSESSED, CLOSED, CANCELLED.'
   ),
   return_reason_code        varchar2(30 char) not null annotations ( display_label 'Return Reason Code',description 'Business reason for the return.'
   ,value_required 'true',semantic_type 'reason_code' ),
   expected_arrival_at       timestamp with time zone
      annotations ( display_label 'Expected Arrival At',description 'Expected arrival date and time of the return.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   received_at               timestamp with time zone
      annotations ( display_label 'Received At',description 'Actual date and time when the return arrived.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   received_by               varchar2(128 char)
      annotations ( display_label 'Received By',description 'User who checked the returned goods on arrival.',semantic_type 'user_name'
      ),
   assessed_at               timestamp with time zone
      annotations ( display_label 'Assessed At',description 'Date and time when the returned goods were assessed.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   assessed_by               varchar2(128 char)
      annotations ( display_label 'Assessed By',description 'User who assessed the return outcome.',semantic_type 'user_name'
      ),
   notes                     varchar2(1000 char)
      annotations ( display_label 'Notes',description 'Business notes for the return.',semantic_type 'comment' ),
   constraint pk_scm_returns primary key ( return_id ),
   constraint uq_scm_returns_01 unique ( return_number ),
   constraint fk_scm_returns_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_returns_02 foreign key ( source_partner_id )
      references scm_business_partners ( business_partner_id ),
   constraint fk_scm_returns_03 foreign key ( source_site_id )
      references scm_partner_sites ( partner_site_id ),
   constraint fk_scm_returns_04 foreign key ( related_outbound_order_id )
      references scm_outbound_orders ( outbound_order_id ),
   constraint ck_scm_returns_01
      check ( return_type_code in ( 'CUSTOMER_RETURN',
                                    'DELIVERY_RETURN',
                                    'INTERNAL_RETURN',
                                    'SUPPLIER_RETURN' ) ),
   constraint ck_scm_returns_02
      check ( return_status_code in ( 'EXPECTED',
                                      'RECEIVED',
                                      'ASSESSED',
                                      'CLOSED',
                                      'CANCELLED' ) )
) annotations ( display_label 'Returns',description 'Stores records for returns.',application_module 'Inventory and Warehouse Management'
);

create table scm_return_lines (
   return_line_id          number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Return Line ID',description 'Surrogate key for the return line.',display_in_report 'false',display_in_form 'false',semantic_type
   'identifier' ),
   return_id               number not null annotations ( display_label 'Return ID',description 'Return that the line belongs to.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   line_number             number(6) not null annotations ( display_label 'Line Number',description 'Line number within the return.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'sequence' ),
   item_id                 number not null annotations ( display_label 'Item ID',description 'Item being returned.',value_required
   'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   inventory_lot_id        number
      annotations ( display_label 'Inventory Lot ID',description 'Lot associated with the returned stock where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   expected_quantity       number(18,4) default 0 not null annotations ( display_label 'Expected Quantity',description 'Expected quantity on the return line.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   received_quantity       number(18,4) default 0 not null annotations ( display_label 'Received Quantity',description 'Quantity actually received on the return line.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   returned_condition_code varchar2(20 char)
      annotations ( display_label 'Returned Condition',description 'Condition of the goods received on the return line.',search_facet
      'distinct-list',semantic_type 'condition',ai_context 'Valid values include GOOD, DAMAGED, INCOMPLETE, EXPIRED, SUSPECT.'
      ),
   reusable_quantity       number(18,4) default 0 not null annotations ( display_label 'Reusable Quantity',description 'Quantity approved to return to available stock.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   quarantine_quantity     number(18,4) default 0 not null annotations ( display_label 'Quarantine Quantity',description 'Quantity moved to quarantine after assessment.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   damaged_quantity        number(18,4) default 0 not null annotations ( display_label 'Damaged Quantity',description 'Quantity found damaged on return.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   writeoff_quantity       number(18,4) default 0 not null annotations ( display_label 'Write-Off Quantity',description 'Quantity approved for write-off.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   disposition_code        varchar2(20 char)
      annotations ( display_label 'Disposition Code',description 'Outcome applied to the return line after assessment.',semantic_type
      'disposition',ai_context 'Valid values include RETURN_TO_STOCK, QUARANTINE, RETURN_TO_SUPPLIER, WRITE_OFF, REWORK.' ),
   constraint pk_scm_return_lines primary key ( return_line_id ),
   constraint uq_scm_return_lines_01 unique ( return_id,
                                              line_number ),
   constraint fk_scm_return_lines_01 foreign key ( return_id )
      references scm_returns ( return_id ),
   constraint fk_scm_return_lines_02 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint fk_scm_return_lines_03 foreign key ( inventory_lot_id )
      references scm_inventory_lots ( inventory_lot_id ),
   constraint ck_scm_return_lines_01 check ( line_number > 0 ),
   constraint ck_scm_return_lines_02 check ( expected_quantity >= 0 ),
   constraint ck_scm_return_lines_03 check ( received_quantity >= 0 ),
   constraint ck_scm_return_lines_04 check ( reusable_quantity >= 0 ),
   constraint ck_scm_return_lines_05 check ( quarantine_quantity >= 0 ),
   constraint ck_scm_return_lines_06 check ( damaged_quantity >= 0 ),
   constraint ck_scm_return_lines_07 check ( writeoff_quantity >= 0 ),
   constraint ck_scm_return_lines_08
      check ( reusable_quantity + quarantine_quantity + damaged_quantity + writeoff_quantity <= received_quantity ),
   constraint ck_scm_return_lines_09
      check ( disposition_code in ( 'RETURN_TO_STOCK',
                                    'QUARANTINE',
                                    'RETURN_TO_SUPPLIER',
                                    'WRITE_OFF',
                                    'REWORK' )
          or disposition_code is null ),
   constraint ck_scm_return_lines_10
      check ( returned_condition_code in ( 'GOOD',
                                           'DAMAGED',
                                           'INCOMPLETE',
                                           'EXPIRED',
                                           'SUSPECT' )
          or returned_condition_code is null )
) annotations ( display_label 'Return Lines',description 'Stores records for return lines.',application_module 'Inventory and Warehouse Management'
);

create table scm_quarantine_cases (
   quarantine_case_id     number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Quarantine Case ID',description 'Surrogate key for the quarantine case.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   quarantine_number      varchar2(30 char) not null annotations ( display_label 'Quarantine Number',description 'Business reference used to identify the quarantine case.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'reference_number' ),
   warehouse_id           number not null annotations ( display_label 'Warehouse ID',description 'Warehouse where the quarantined stock is held.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   storage_location_id    number not null annotations ( display_label 'Storage Location ID',description 'Location where the quarantined stock is held.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   source_document_type   varchar2(30 char) not null annotations ( display_label 'Source Document Type',description 'Type of business document that created the quarantine case.'
   ,value_required 'true',semantic_type 'type' ),
   source_document_number varchar2(50 char)
      annotations ( display_label 'Source Document Number',description 'Business number of the document that created the quarantine case.'
      ,semantic_type 'reference_number' ),
   item_id                number not null annotations ( display_label 'Item ID',description 'Item placed into quarantine.',value_required
   'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   inventory_lot_id       number
      annotations ( display_label 'Inventory Lot ID',description 'Lot placed into quarantine where relevant.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   quantity               number(18,4) not null annotations ( display_label 'Quantity',description 'Quantity currently controlled by the quarantine case.'
   ,format_mask 'FM999G999G999G990D0000',value_required 'true',semantic_type 'quantity' ),
   quarantine_reason_code varchar2(30 char) not null annotations ( display_label 'Quarantine Reason Code',description 'Business reason that stock was quarantined.'
   ,value_required 'true',semantic_type 'reason_code' ),
   quarantine_status_code varchar2(20 char) default 'OPEN' not null annotations ( display_label 'Quarantine Status',description
   'Current business status of the quarantine case.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include OPEN, UNDER_REVIEW, RELEASED, RETURNED, REWORKED, WRITTEN_OFF, CLOSED.'
   ),
   quarantined_at         timestamp with time zone default systimestamp not null annotations ( display_label 'Quarantined At'
   ,description 'Date and time when the stock entered quarantine.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime'
   ),
   reviewed_at            timestamp with time zone
      annotations ( display_label 'Reviewed At',description 'Date and time when the quarantine case was reviewed.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   reviewed_by            varchar2(128 char)
      annotations ( display_label 'Reviewed By',description 'User who reviewed the quarantine case.',semantic_type 'user_name'
      ),
   resolution_code        varchar2(30 char)
      annotations ( display_label 'Resolution Code',description 'Business resolution applied to the quarantine case.',semantic_type
      'resolution' ),
   resolution_notes       varchar2(1000 char)
      annotations ( display_label 'Resolution Notes',description 'Business notes explaining the quarantine outcome.',semantic_type
      'comment' ),
   constraint pk_scm_quarantine_cases primary key ( quarantine_case_id ),
   constraint uq_scm_quarantine_cases_01 unique ( quarantine_number ),
   constraint fk_scm_quarantine_cases_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_quarantine_cases_02 foreign key ( storage_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_quarantine_cases_03 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint fk_scm_quarantine_cases_04 foreign key ( inventory_lot_id )
      references scm_inventory_lots ( inventory_lot_id ),
   constraint ck_scm_quarantine_cases_01 check ( quantity > 0 ),
   constraint ck_scm_quarantine_cases_02
      check ( quarantine_status_code in ( 'OPEN',
                                          'UNDER_REVIEW',
                                          'RELEASED',
                                          'RETURNED',
                                          'REWORKED',
                                          'WRITTEN_OFF',
                                          'CLOSED' ) )
) annotations ( display_label 'Quarantine Cases',description 'Stores records for quarantine cases.',application_module 'Inventory and Warehouse Management'
);

create table scm_stock_adjustments (
   stock_adjustment_id    number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Stock Adjustment ID',description 'Surrogate key for the stock adjustment.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   adjustment_number      varchar2(30 char) not null annotations ( display_label 'Adjustment Number',description 'Business reference used to identify the stock adjustment.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'reference_number' ),
   warehouse_id           number not null annotations ( display_label 'Warehouse ID',description 'Warehouse where the stock adjustment applies.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   adjustment_type_code   varchar2(20 char) not null annotations ( display_label 'Adjustment Type',description 'Business type of the stock adjustment.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'type',ai_context 'Valid values include GAIN, LOSS, STATUS_CHANGE, WRITE_OFF.'
   ),
   adjustment_status_code varchar2(20 char) default 'DRAFT' not null annotations ( display_label 'Adjustment Status',description
   'Current business status of the stock adjustment.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include DRAFT, PENDING_APPROVAL, APPROVED, APPLIED, REJECTED, CANCELLED.'
   ),
   reason_code            varchar2(30 char) not null annotations ( display_label 'Reason Code',description 'Business reason for the stock adjustment.'
   ,value_required 'true',semantic_type 'reason_code' ),
   requested_by           varchar2(128 char) not null annotations ( display_label 'Requested By',description 'User who requested the stock adjustment.'
   ,value_required 'true',semantic_type 'user_name' ),
   requested_at           timestamp with time zone default systimestamp not null annotations ( display_label 'Requested At',description
   'Date and time when the stock adjustment was requested.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime'
   ),
   approved_by            varchar2(128 char)
      annotations ( display_label 'Approved By',description 'User who approved the stock adjustment where approval was needed.'
      ,semantic_type 'user_name' ),
   approved_at            timestamp with time zone
      annotations ( display_label 'Approved At',description 'Date and time when the stock adjustment was approved.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   approval_policy_id     number
      annotations ( display_label 'Approval Policy ID',description 'Approval policy applied to the stock adjustment where approval was required.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   applied_at             timestamp with time zone
      annotations ( display_label 'Applied At',description 'Date and time when the stock adjustment was applied to inventory.'
      ,format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   notes                  varchar2(1000 char)
      annotations ( display_label 'Notes',description 'Business notes for the stock adjustment.',semantic_type 'comment' ),
   constraint pk_scm_stock_adjustments primary key ( stock_adjustment_id ),
   constraint uq_scm_stock_adjustments_01 unique ( adjustment_number ),
   constraint fk_scm_stock_adjustments_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_stock_adjustments_02 foreign key ( approval_policy_id )
      references scm_approval_policies ( approval_policy_id ),
   constraint ck_scm_stock_adjustments_01
      check ( adjustment_type_code in ( 'GAIN',
                                        'LOSS',
                                        'STATUS_CHANGE',
                                        'WRITE_OFF' ) ),
   constraint ck_scm_stock_adjustments_02
      check ( adjustment_status_code in ( 'DRAFT',
                                          'PENDING_APPROVAL',
                                          'APPROVED',
                                          'APPLIED',
                                          'REJECTED',
                                          'CANCELLED' ) )
) annotations ( display_label 'Stock Adjustments',description 'Stores records for stock adjustments.',application_module 'Inventory and Warehouse Management'
);

create table scm_stock_adjustment_lines (
   stock_adjustment_line_id  number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Stock Adjustment Line ID',description 'Surrogate key for the stock adjustment line.',display_in_report 'false',display_in_form
   'false',semantic_type 'identifier' ),
   stock_adjustment_id       number not null annotations ( display_label 'Stock Adjustment ID',description 'Stock adjustment that the line belongs to.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   line_number               number(6) not null annotations ( display_label 'Line Number',description 'Line number within the stock adjustment.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'sequence' ),
   item_id                   number not null annotations ( display_label 'Item ID',description 'Item affected by the adjustment line.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   inventory_lot_id          number
      annotations ( display_label 'Inventory Lot ID',description 'Lot affected by the adjustment line where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   storage_location_id       number not null annotations ( display_label 'Storage Location ID',description 'Location where the stock adjustment applies.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   from_status_code          varchar2(20 char)
      annotations ( display_label 'From Status',description 'Stock status before the adjustment where relevant.',search_facet
      'distinct-list',semantic_type 'status',ai_context 'Valid values include AVAILABLE, QUARANTINED, DAMAGED, BLOCKED, RETURN_HOLD.'
      ),
   to_status_code            varchar2(20 char)
      annotations ( display_label 'To Status',description 'Stock status after the adjustment where relevant.',search_facet 'distinct-list'
      ,semantic_type 'status',ai_context 'Valid values include AVAILABLE, QUARANTINED, DAMAGED, BLOCKED, RETURN_HOLD.' ),
   adjustment_direction_code varchar2(20 char) not null annotations ( display_label 'Adjustment Direction',description 'Direction of the quantity change.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'direction',ai_context 'Valid values include INCREASE, DECREASE, RECLASSIFY.'
   ),
   adjustment_quantity       number(18,4) not null annotations ( display_label 'Adjustment Quantity',description 'Quantity affected by the adjustment line.'
   ,format_mask 'FM999G999G999G990D0000',value_required 'true',semantic_type 'quantity' ),
   unit_cost_amount          number(18,2)
      annotations ( display_label 'Unit Cost Amount',description 'Unit cost captured for the adjustment line where financial review is relevant.'
      ,format_mask 'FM999G999G999G990D00',semantic_type 'amount' ),
   currency_code             varchar2(3 char) default 'INR' not null annotations ( display_label 'Currency Code',description 'Currency used for the adjustment line value.'
   ,semantic_type 'currency_code' ),
   line_value_amount         number(18,2) generated always as ( round(
      adjustment_quantity * nvl(
         unit_cost_amount,
         0
      ),
      2
   ) ) virtual annotations ( display_label 'Line Value Amount',description 'Estimated financial value of the adjustment line.'
   ,display_in_form 'false',format_mask 'FM999G999G999G990D00',semantic_type 'amount' ),
   reason_description        varchar2(500 char)
      annotations ( display_label 'Reason Description',description 'Business explanation specific to the adjustment line.',semantic_type
      'description' ),
   constraint pk_scm_stock_adj_lines primary key ( stock_adjustment_line_id ),
   constraint uq_scm_stock_adj_lines_01 unique ( stock_adjustment_id,
                                                 line_number ),
   constraint fk_scm_stock_adj_lines_01 foreign key ( stock_adjustment_id )
      references scm_stock_adjustments ( stock_adjustment_id ),
   constraint fk_scm_stock_adj_lines_02 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint fk_scm_stock_adj_lines_03 foreign key ( inventory_lot_id )
      references scm_inventory_lots ( inventory_lot_id ),
   constraint fk_scm_stock_adj_lines_04 foreign key ( storage_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint ck_scm_stock_adj_lines_01 check ( line_number > 0 ),
   constraint ck_scm_stock_adj_lines_02
      check ( adjustment_direction_code in ( 'INCREASE',
                                             'DECREASE',
                                             'RECLASSIFY' ) ),
   constraint ck_scm_stock_adj_lines_03 check ( adjustment_quantity > 0 ),
   constraint ck_scm_stock_adj_lines_04
      check ( from_status_code in ( 'AVAILABLE',
                                    'QUARANTINED',
                                    'DAMAGED',
                                    'BLOCKED',
                                    'RETURN_HOLD' )
          or from_status_code is null ),
   constraint ck_scm_stock_adj_lines_05
      check ( to_status_code in ( 'AVAILABLE',
                                  'QUARANTINED',
                                  'DAMAGED',
                                  'BLOCKED',
                                  'RETURN_HOLD' )
          or to_status_code is null ),
   constraint ck_scm_stock_adj_lines_06
      check ( unit_cost_amount is null
          or unit_cost_amount >= 0 )
) annotations ( display_label 'Stock Adjustment Lines',description 'Stores records for stock adjustment lines.',application_module
'Inventory and Warehouse Management' );

------------------------------------------------------------------------------
-- 6. Counting and approvals
------------------------------------------------------------------------------

create table scm_stock_counts (
   stock_count_id    number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Stock Count ID',description 'Surrogate key for the stock count event.',display_in_report 'false',display_in_form 'false',
   semantic_type 'identifier' ),
   count_number      varchar2(30 char) not null annotations ( display_label 'Count Number',description 'Business reference used to identify the stock count.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'reference_number' ),
   warehouse_id      number not null annotations ( display_label 'Warehouse ID',description 'Warehouse where the stock count takes place.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   count_type_code   varchar2(20 char) not null annotations ( display_label 'Count Type',description 'Business type of the stock count.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'type',ai_context 'Valid values include CYCLE, FULL, SPOT.'
   ),
   count_scope_code  varchar2(20 char) not null annotations ( display_label 'Count Scope',description 'Business scope of the stock count.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'scope',ai_context 'Valid values include WAREHOUSE, AREA, LOCATION, ITEM.'
   ),
   count_status_code varchar2(20 char) default 'PLANNED' not null annotations ( display_label 'Count Status',description 'Current business status of the stock count.'
   ,search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include PLANNED, IN_PROGRESS, REVIEW, CLOSED, CANCELLED.'
   ),
   planned_start_at  timestamp with time zone
      annotations ( display_label 'Planned Start At',description 'Planned start date and time for the count.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   planned_end_at    timestamp with time zone
      annotations ( display_label 'Planned End At',description 'Planned end date and time for the count.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   started_at        timestamp with time zone
      annotations ( display_label 'Started At',description 'Actual start date and time for the count.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   completed_at      timestamp with time zone
      annotations ( display_label 'Completed At',description 'Actual completion date and time for the count.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   requested_by      varchar2(128 char) not null annotations ( display_label 'Requested By',description 'User who requested or scheduled the count.'
   ,value_required 'true',semantic_type 'user_name' ),
   reviewed_by       varchar2(128 char)
      annotations ( display_label 'Reviewed By',description 'User who reviewed the count outcome.',semantic_type 'user_name' )
      ,
   notes             varchar2(1000 char)
      annotations ( display_label 'Notes',description 'Business notes for the stock count.',semantic_type 'comment' ),
   constraint pk_scm_stock_counts primary key ( stock_count_id ),
   constraint uq_scm_stock_counts_01 unique ( count_number ),
   constraint fk_scm_stock_counts_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint ck_scm_stock_counts_01
      check ( count_type_code in ( 'CYCLE',
                                   'FULL',
                                   'SPOT' ) ),
   constraint ck_scm_stock_counts_02
      check ( count_scope_code in ( 'WAREHOUSE',
                                    'AREA',
                                    'LOCATION',
                                    'ITEM' ) ),
   constraint ck_scm_stock_counts_03
      check ( count_status_code in ( 'PLANNED',
                                     'IN_PROGRESS',
                                     'REVIEW',
                                     'CLOSED',
                                     'CANCELLED' ) )
) annotations ( display_label 'Stock Counts',description 'Stores records for stock counts.',application_module 'Inventory and Warehouse Management'
);

create table scm_stock_count_lines (
   stock_count_line_id   number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Stock Count Line ID',description 'Surrogate key for the stock count line.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   stock_count_id        number not null annotations ( display_label 'Stock Count ID',description 'Stock count that the line belongs to.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   line_number           number(6) not null annotations ( display_label 'Line Number',description 'Line number within the stock count.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'sequence' ),
   item_id               number not null annotations ( display_label 'Item ID',description 'Item counted on the line.',value_required
   'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   storage_location_id   number not null annotations ( display_label 'Storage Location ID',description 'Location counted on the line.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   inventory_lot_id      number
      annotations ( display_label 'Inventory Lot ID',description 'Lot counted on the line where relevant.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   expected_quantity     number(18,4) default 0 not null annotations ( display_label 'Expected Quantity',description 'Recorded quantity before the physical count.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   counted_quantity      number(18,4) default 0 not null annotations ( display_label 'Counted Quantity',description 'Physical quantity counted.'
   ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   variance_quantity     number(18,4) generated always as ( counted_quantity - expected_quantity ) virtual annotations ( display_label
   'Variance Quantity',description 'Difference between counted quantity and recorded quantity.',display_in_form 'false',format_mask
   'FM999G999G999G990D0000',semantic_type 'quantity' ),
   unit_cost_amount      number(18,2)
      annotations ( display_label 'Unit Cost Amount',description 'Unit cost captured for the counted item where variance value matters for review.'
      ,format_mask 'FM999G999G999G990D00',semantic_type 'amount' ),
   currency_code         varchar2(3 char) default 'INR' not null annotations ( display_label 'Currency Code',description 'Currency used for the count variance value.'
   ,semantic_type 'currency_code' ),
   variance_value_amount number(18,2) generated always as ( round(
      abs(counted_quantity - expected_quantity) * nvl(
         unit_cost_amount,
         0
      ),
      2
   ) ) virtual annotations ( display_label 'Variance Value Amount',description 'Estimated financial value of the count variance.'
   ,display_in_form 'false',format_mask 'FM999G999G999G990D00',semantic_type 'amount' ),
   variance_reason_code  varchar2(30 char)
      annotations ( display_label 'Variance Reason Code',description 'Business reason for the variance where the cause is known.'
      ,semantic_type 'reason_code' ),
   tolerance_quantity    number(18,4)
      annotations ( display_label 'Tolerance Quantity',description 'Quantity tolerance applied to the line when deciding whether the difference needs investigation.'
      ,format_mask 'FM999G999G999G990D0000',semantic_type 'quantity' ),
   tolerance_percent     number(5,2)
      annotations ( display_label 'Tolerance Percent',description 'Percentage tolerance applied to the line when deciding whether the difference needs investigation.'
      ,format_mask 'FM990D00',semantic_type 'percentage' ),
   within_tolerance_flag boolean default false not null annotations ( display_label 'Within Tolerance Flag',description 'Indicates whether the count difference is within the agreed tolerance.'
   ,search_facet 'distinct-list',semantic_type 'flag' ),
   recount_required      boolean default false not null annotations ( display_label 'Recount Required',description 'Indicates whether the line needs a recount.'
   ,search_facet 'distinct-list',semantic_type 'flag' ),
   recount_quantity      number(18,4)
      annotations ( display_label 'Recount Quantity',description 'Quantity found on recount where a recount was performed.',format_mask
      'FM999G999G999G990D0000',semantic_type 'quantity' ),
   line_status_code      varchar2(20 char) default 'PENDING' not null annotations ( display_label 'Line Status',description 'Current business status of the count line.'
   ,search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include PENDING, COUNTED, RECOUNTED, RESOLVED, CANCELLED.'
   ),
   first_counted_by      varchar2(128 char)
      annotations ( display_label 'First Counted By',description 'User who performed the first count.',semantic_type 'user_name'
      ),
   first_counted_at      timestamp with time zone
      annotations ( display_label 'First Counted At',description 'Date and time when the first count was completed.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   reviewed_by           varchar2(128 char)
      annotations ( display_label 'Reviewed By',description 'User who reviewed or resolved the count line.',semantic_type 'user_name'
      ),
   reviewed_at           timestamp with time zone
      annotations ( display_label 'Reviewed At',description 'Date and time when the count line was reviewed or resolved.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   resolution_code       varchar2(30 char)
      annotations ( display_label 'Resolution Code',description 'Business resolution applied to the count line.',semantic_type
      'resolution' ),
   resolution_notes      varchar2(500 char)
      annotations ( display_label 'Resolution Notes',description 'Business notes explaining how the count difference was resolved.'
      ,semantic_type 'comment' ),
   constraint pk_scm_stock_count_lines primary key ( stock_count_line_id ),
   constraint uq_scm_stock_count_lines_01 unique ( stock_count_id,
                                                   line_number ),
   constraint fk_scm_stock_count_lines_01 foreign key ( stock_count_id )
      references scm_stock_counts ( stock_count_id ),
   constraint fk_scm_stock_count_lines_02 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint fk_scm_stock_count_lines_03 foreign key ( storage_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_stock_count_lines_04 foreign key ( inventory_lot_id )
      references scm_inventory_lots ( inventory_lot_id ),
   constraint ck_scm_stock_count_lines_01 check ( line_number > 0 ),
   constraint ck_scm_stock_count_lines_02 check ( expected_quantity >= 0 ),
   constraint ck_scm_stock_count_lines_03 check ( counted_quantity >= 0 ),
   constraint ck_scm_stock_count_lines_04
      check ( recount_quantity is null
          or recount_quantity >= 0 ),
   constraint ck_scm_stock_count_lines_05
      check ( line_status_code in ( 'PENDING',
                                    'COUNTED',
                                    'RECOUNTED',
                                    'RESOLVED',
                                    'CANCELLED' ) ),
   constraint ck_scm_stock_count_lines_06
      check ( tolerance_quantity is null
          or tolerance_quantity >= 0 ),
   constraint ck_scm_stock_count_lines_07
      check ( tolerance_percent is null
          or ( tolerance_percent >= 0
         and tolerance_percent <= 100 ) ),
   constraint ck_scm_stock_count_lines_08
      check ( unit_cost_amount is null
          or unit_cost_amount >= 0 )
) annotations ( display_label 'Stock Count Lines',description 'Stores records for stock count lines.',application_module 'Inventory and Warehouse Management'
);

create table scm_pick_waves (
   pick_wave_id       number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Pick Wave ID',description 'Surrogate key for the pick wave or batch.',display_in_report 'false',display_in_form 'false',semantic_type
   'identifier' ),
   wave_number        varchar2(30 char) not null annotations ( display_label 'Wave Number',description 'Business reference used to identify the pick wave.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'reference_number' ),
   warehouse_id       number not null annotations ( display_label 'Warehouse ID',description 'Warehouse that owns the pick wave.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   wave_type_code     varchar2(20 char) default 'WAVE' not null annotations ( display_label 'Wave Type Code',description 'Business type of the pick grouping.'
   ,semantic_type 'type',ai_context 'Valid values include WAVE, BATCH.' ),
   wave_status_code   varchar2(20 char) default 'PLANNED' not null annotations ( display_label 'Wave Status Code',description
   'Current business status of the pick wave.',semantic_type 'status',ai_context 'Valid values include PLANNED, RELEASED, IN_PROGRESS, COMPLETED, CANCELLED.'
   ),
   priority_code      varchar2(20 char) default 'MEDIUM' not null annotations ( display_label 'Priority Code',description 'Business priority of the wave.'
   ,semantic_type 'priority',ai_context 'Valid values include LOW, MEDIUM, HIGH, CRITICAL.' ),
   release_at         timestamp with time zone
      annotations ( display_label 'Release At',description 'Date and time when the wave was released to the floor.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   started_at         timestamp with time zone
      annotations ( display_label 'Started At',description 'Date and time when the wave started.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   completed_at       timestamp with time zone
      annotations ( display_label 'Completed At',description 'Date and time when the wave completed.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   released_by        varchar2(128 char)
      annotations ( display_label 'Released By',description 'User who released the wave.',semantic_type 'user_name' ),
   carrier_partner_id number
      annotations ( display_label 'Carrier Partner ID',description 'Carrier linked to the wave where picks are grouped by carrier run.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   wave_notes         varchar2(1000 char)
      annotations ( display_label 'Wave Notes',description 'Business notes for the pick wave.',semantic_type 'comment' ),
   constraint pk_scm_pick_waves primary key ( pick_wave_id ),
   constraint uq_scm_pick_waves_01 unique ( wave_number ),
   constraint fk_scm_pick_waves_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_pick_waves_02 foreign key ( carrier_partner_id )
      references scm_business_partners ( business_partner_id ),
   constraint ck_scm_pick_waves_01 check ( wave_type_code in ( 'WAVE',
                                                               'BATCH' ) ),
   constraint ck_scm_pick_waves_02
      check ( wave_status_code in ( 'PLANNED',
                                    'RELEASED',
                                    'IN_PROGRESS',
                                    'COMPLETED',
                                    'CANCELLED' ) ),
   constraint ck_scm_pick_waves_03
      check ( priority_code in ( 'LOW',
                                 'MEDIUM',
                                 'HIGH',
                                 'CRITICAL' ) ),
   constraint ck_scm_pick_waves_04
      check ( completed_at is null
          or started_at is null
          or completed_at >= started_at )
) annotations ( display_label 'Pick Waves',description 'Stores records for pick waves and batches.',application_module 'Inventory and Warehouse Management'
);

create table scm_operational_tasks (
   operational_task_id    number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Operational Task ID',description 'Surrogate key for the operational task.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   task_number            varchar2(30 char) not null annotations ( display_label 'Task Number',description 'Business reference used to identify the task.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'reference_number' ),
   task_type_code         varchar2(30 char) not null annotations ( display_label 'Task Type Code',description 'Business type of warehouse task.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'type',ai_context 'Valid values include PUTAWAY, REPLENISHMENT, PICK, PACK, DISPATCH_CHECK, COUNT, RECEIPT_REVIEW, EXCEPTION_REVIEW, QUARANTINE_REVIEW, TRANSFER_RECEIPT, MOVE, TRANSFER_SHIPMENT.'
   ),
   warehouse_id           number not null annotations ( display_label 'Warehouse ID',description 'Warehouse responsible for the task.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   from_location_id       number
      annotations ( display_label 'From Location ID',description 'Starting location for the task where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   to_location_id         number
      annotations ( display_label 'To Location ID',description 'Destination location for the task where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   item_id                number
      annotations ( display_label 'Item ID',description 'Item linked to the task where relevant.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   inventory_lot_id       number
      annotations ( display_label 'Inventory Lot ID',description 'Lot linked to the task where relevant.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   source_document_type   varchar2(30 char)
      annotations ( display_label 'Source Document Type',description 'Business document type that created the task.',semantic_type
      'type' ),
   source_document_number varchar2(50 char)
      annotations ( display_label 'Source Document Number',description 'Business document number that created the task.',semantic_type
      'reference_number' ),
   source_line_number     number(6)
      annotations ( display_label 'Source Line Number',description 'Source line number linked to the task where relevant.',semantic_type
      'sequence' ),
   task_status_code       varchar2(20 char) default 'OPEN' not null annotations ( display_label 'Task Status Code',description
   'Current business status of the task.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include OPEN, ASSIGNED, IN_PROGRESS, COMPLETED, CANCELLED, ON_HOLD.'
   ),
   priority_code          varchar2(20 char) default 'MEDIUM' not null annotations ( display_label 'Priority Code',description
   'Business priority of the task.',semantic_type 'priority',ai_context 'Valid values include LOW, MEDIUM, HIGH, CRITICAL.' )
   ,
   task_quantity          number(18,4)
      annotations ( display_label 'Task Quantity',description 'Quantity that the task covers where relevant.',format_mask 'FM999G999G999G990D0000'
      ,semantic_type 'quantity' ),
   pick_wave_id           number
      annotations ( display_label 'Pick Wave ID',description 'Pick wave or batch that groups the task where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   assigned_role_id       number
      annotations ( display_label 'Assigned Role ID',description 'Role currently responsible for the task.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   assigned_user_id       number
      annotations ( display_label 'Assigned User ID',description 'User currently responsible for the task where assigned to a person.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   assigned_by_user_id    number
      annotations ( display_label 'Assigned By User ID',description 'User who assigned the task.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   requested_at           timestamp with time zone default systimestamp not null annotations ( display_label 'Requested At',description
   'Date and time when the task was created.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   due_at                 timestamp with time zone
      annotations ( display_label 'Due At',description 'Date and time when the task is due.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   started_at             timestamp with time zone
      annotations ( display_label 'Started At',description 'Date and time when work started.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   completed_at           timestamp with time zone
      annotations ( display_label 'Completed At',description 'Date and time when work completed.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   completion_code        varchar2(30 char)
      annotations ( display_label 'Completion Code',description 'Business outcome recorded when the task completed.',semantic_type
      'resolution' ),
   task_notes             varchar2(1000 char)
      annotations ( display_label 'Task Notes',description 'Business notes for the task.',semantic_type 'comment' ),
   constraint pk_scm_operational_tasks primary key ( operational_task_id ),
   constraint uq_scm_operational_tasks_01 unique ( task_number ),
   constraint fk_scm_operational_tasks_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_operational_tasks_02 foreign key ( from_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_operational_tasks_03 foreign key ( to_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_operational_tasks_04 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint fk_scm_operational_tasks_05 foreign key ( inventory_lot_id )
      references scm_inventory_lots ( inventory_lot_id ),
   constraint fk_scm_operational_tasks_05a foreign key ( pick_wave_id )
      references scm_pick_waves ( pick_wave_id ),
   constraint fk_scm_operational_tasks_06 foreign key ( assigned_role_id )
      references scm_user_roles ( user_role_id ),
   constraint fk_scm_operational_tasks_07 foreign key ( assigned_user_id )
      references scm_application_users ( application_user_id ),
   constraint fk_scm_operational_tasks_08 foreign key ( assigned_by_user_id )
      references scm_application_users ( application_user_id ),
   constraint ck_scm_operational_tasks_01
      check ( task_type_code in ( 'PUTAWAY',
                                  'REPLENISHMENT',
                                  'PICK',
                                  'PACK',
                                  'DISPATCH_CHECK',
                                  'COUNT',
                                  'RECEIPT_REVIEW',
                                  'EXCEPTION_REVIEW',
                                  'QUARANTINE_REVIEW',
                                  'TRANSFER_RECEIPT',
                                  'MOVE',
                                  'TRANSFER_SHIPMENT' ) ),
   constraint ck_scm_operational_tasks_02
      check ( task_status_code in ( 'OPEN',
                                    'ASSIGNED',
                                    'IN_PROGRESS',
                                    'COMPLETED',
                                    'CANCELLED',
                                    'ON_HOLD' ) ),
   constraint ck_scm_operational_tasks_03
      check ( priority_code in ( 'LOW',
                                 'MEDIUM',
                                 'HIGH',
                                 'CRITICAL' ) ),
   constraint ck_scm_operational_tasks_04 check ( task_quantity is null
       or task_quantity > 0 ),
   constraint ck_scm_operational_tasks_05 check ( source_line_number is null
       or source_line_number > 0 )
) annotations ( display_label 'Operational Tasks',description 'Stores records for operational tasks.',application_module 'Inventory and Warehouse Management'
);

create table scm_operational_exceptions (
   operational_exception_id number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Operational Exception ID',description 'Surrogate key for the operational exception.',display_in_report 'false',display_in_form
   'false',semantic_type 'identifier' ),
   exception_number         varchar2(30 char) not null annotations ( display_label 'Exception Number',description 'Business reference used to identify the exception.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'reference_number' ),
   exception_type_code      varchar2(30 char) not null annotations ( display_label 'Exception Type Code',description 'Business type of exception.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'classification',ai_context 'Valid values include RECEIPT_DAMAGE, WRONG_ITEM_RECEIVED, RECEIPT_SHORTAGE, RECEIPT_OVERAGE, WRONG_LOCATION, PICK_NOT_FOUND, PICK_DAMAGE, DISPATCH_DISCREPANCY, POST_DISPATCH_DISCREPANCY, RETURN_NOT_REUSABLE, EXPIRED_STOCK, QUARANTINE_USE_ATTEMPT, ROTATION_EXCEPTION, OTHER.'
   ),
   warehouse_id             number not null annotations ( display_label 'Warehouse ID',description 'Warehouse responsible for the exception.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   storage_location_id      number
      annotations ( display_label 'Storage Location ID',description 'Location linked to the exception where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   item_id                  number
      annotations ( display_label 'Item ID',description 'Item linked to the exception where relevant.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   inventory_lot_id         number
      annotations ( display_label 'Inventory Lot ID',description 'Lot linked to the exception where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   source_document_type     varchar2(30 char)
      annotations ( display_label 'Source Document Type',description 'Business document type that the exception relates to.',
      semantic_type 'type' ),
   source_document_number   varchar2(50 char)
      annotations ( display_label 'Source Document Number',description 'Business document number that the exception relates to.'
      ,semantic_type 'reference_number' ),
   source_line_number       number(6)
      annotations ( display_label 'Source Line Number',description 'Source line number linked to the exception where relevant.'
      ,semantic_type 'sequence' ),
   severity_code            varchar2(20 char) default 'MEDIUM' not null annotations ( display_label 'Severity Code',description
   'Business severity of the exception.',semantic_type 'priority',ai_context 'Valid values include LOW, MEDIUM, HIGH, CRITICAL.'
   ),
   exception_status_code    varchar2(20 char) default 'OPEN' not null annotations ( display_label 'Exception Status Code',description
   'Current business status of the exception.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include OPEN, UNDER_REVIEW, PENDING_APPROVAL, RESOLVED, CLOSED, CANCELLED.'
   ),
   affected_quantity        number(18,4)
      annotations ( display_label 'Affected Quantity',description 'Quantity affected by the exception where relevant.',format_mask
      'FM999G999G999G990D0000',semantic_type 'quantity' ),
   requires_approval_flag   boolean default false not null annotations ( display_label 'Requires Approval Flag',description 'Indicates whether the exception needs formal approval before closure.'
   ,search_facet 'distinct-list',semantic_type 'flag' ),
   approval_policy_id       number
      annotations ( display_label 'Approval Policy ID',description 'Approval policy applied to the exception where approval is required.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   reported_at              timestamp with time zone default systimestamp not null annotations ( display_label 'Reported At',
   description 'Date and time when the exception was reported.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime'
   ),
   reported_by_user_id      number
      annotations ( display_label 'Reported By User ID',description 'User who reported the exception.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   assigned_role_id         number
      annotations ( display_label 'Assigned Role ID',description 'Role responsible for reviewing the exception.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   assigned_user_id         number
      annotations ( display_label 'Assigned User ID',description 'User responsible for reviewing the exception where assigned to a person.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   resolved_at              timestamp with time zone
      annotations ( display_label 'Resolved At',description 'Date and time when the exception was resolved.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   resolved_by_user_id      number
      annotations ( display_label 'Resolved By User ID',description 'User who resolved the exception.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   resolution_code          varchar2(30 char)
      annotations ( display_label 'Resolution Code',description 'Business resolution applied to the exception.',semantic_type
      'resolution' ),
   exception_notes          varchar2(1000 char)
      annotations ( display_label 'Exception Notes',description 'Business notes for the exception.',semantic_type 'comment' )
      ,
   constraint pk_scm_operational_exc primary key ( operational_exception_id ),
   constraint uq_scm_operational_exc_01 unique ( exception_number ),
   constraint fk_scm_operational_exc_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_operational_exc_02 foreign key ( storage_location_id )
      references scm_storage_locations ( storage_location_id ),
   constraint fk_scm_operational_exc_03 foreign key ( item_id )
      references scm_items ( item_id ),
   constraint fk_scm_operational_exc_04 foreign key ( inventory_lot_id )
      references scm_inventory_lots ( inventory_lot_id ),
   constraint fk_scm_operational_exc_05 foreign key ( approval_policy_id )
      references scm_approval_policies ( approval_policy_id ),
   constraint fk_scm_operational_exc_06 foreign key ( reported_by_user_id )
      references scm_application_users ( application_user_id ),
   constraint fk_scm_operational_exc_07 foreign key ( assigned_role_id )
      references scm_user_roles ( user_role_id ),
   constraint fk_scm_operational_exc_08 foreign key ( assigned_user_id )
      references scm_application_users ( application_user_id ),
   constraint fk_scm_operational_exc_09 foreign key ( resolved_by_user_id )
      references scm_application_users ( application_user_id ),
   constraint ck_scm_operational_exc_01
      check ( exception_type_code in ( 'RECEIPT_DAMAGE',
                                       'WRONG_ITEM_RECEIVED',
                                       'RECEIPT_SHORTAGE',
                                       'RECEIPT_OVERAGE',
                                       'WRONG_LOCATION',
                                       'PICK_NOT_FOUND',
                                       'PICK_DAMAGE',
                                       'DISPATCH_DISCREPANCY',
                                       'POST_DISPATCH_DISCREPANCY',
                                       'UNPLANNED_RECEIPT',
                                       'UNPLANNED_RETURN',
                                       'TRANSFER_DISCREPANCY',
                                       'OVERDUE_TRANSFER',
                                       'RETURN_NOT_REUSABLE',
                                       'EXPIRED_STOCK',
                                       'SHORT_DATED_STOCK',
                                       'QUARANTINE_USE_ATTEMPT',
                                       'ROTATION_EXCEPTION',
                                       'OTHER' ) ),
   constraint ck_scm_operational_exc_02
      check ( severity_code in ( 'LOW',
                                 'MEDIUM',
                                 'HIGH',
                                 'CRITICAL' ) ),
   constraint ck_scm_operational_exc_03
      check ( exception_status_code in ( 'OPEN',
                                         'UNDER_REVIEW',
                                         'PENDING_APPROVAL',
                                         'RESOLVED',
                                         'CLOSED',
                                         'CANCELLED' ) ),
   constraint ck_scm_operational_exc_04
      check ( affected_quantity is null
          or affected_quantity >= 0 ),
   constraint ck_scm_operational_exc_05 check ( source_line_number is null
       or source_line_number > 0 ),
   constraint ck_scm_operational_exc_06
      check ( requires_approval_flag = false
          or approval_policy_id is not null )
) annotations ( display_label 'Operational Exceptions',description 'Stores records for operational exceptions.',application_module
'Inventory and Warehouse Management' );

create table scm_approval_policy_steps (
   approval_policy_step_id  number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Approval Policy Step ID',description 'Surrogate key for the approval policy step.',display_in_report 'false',display_in_form
   'false',semantic_type 'identifier' ),
   approval_policy_id       number not null annotations ( display_label 'Approval Policy ID',description 'Approval policy that owns the step.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   step_sequence_number     number(4) not null annotations ( display_label 'Step Sequence Number',description 'Execution sequence of the step within the approval policy.'
   ,value_required 'true',semantic_type 'sequence' ),
   step_name                varchar2(100 char) not null annotations ( display_label 'Step Name',description 'Business name of the approval step.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'name' ),
   reviewer_role_id         number not null annotations ( display_label 'Reviewer Role ID',description 'Role that should normally review the step.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   fallback_role_id         number
      annotations ( display_label 'Fallback Role ID',description 'Fallback role used when the normal reviewer is unavailable.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   escalation_role_id       number
      annotations ( display_label 'Escalation Role ID',description 'Role used when the step must be escalated after the SLA expires.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   due_within_hours         number(6)
      annotations ( display_label 'Due Within Hours',description 'Target SLA in hours for the step.',semantic_type 'duration_hours'
      ),
   escalation_after_hours   number(6)
      annotations ( display_label 'Escalation After Hours',description 'Hours after which the step should escalate if there is no decision.'
      ,semantic_type 'duration_hours' ),
   approval_authority_level number(4)
      annotations ( display_label 'Approval Authority Level',description 'Authority level required to act on the step where this differs from the policy default.'
      ,semantic_type 'ranking' ),
   is_final_step            boolean default false not null annotations ( display_label 'Is Final Step',description 'Indicates whether approval of this step completes the approval chain.'
   ,semantic_type 'flag' ),
   step_status_code         varchar2(20 char) default 'ACTIVE' not null annotations ( display_label 'Step Status Code',description
   'Current business status of the approval policy step.',semantic_type 'status',ai_context 'Valid values include ACTIVE, INACTIVE.'
   ),
   step_notes               varchar2(500 char)
      annotations ( display_label 'Step Notes',description 'Business notes for the approval policy step.',semantic_type 'comment'
      ),
   constraint pk_scm_approval_policy_steps primary key ( approval_policy_step_id ),
   constraint uq_scm_approval_policy_steps_01 unique ( approval_policy_id,
                                                       step_sequence_number ),
   constraint fk_scm_approval_policy_steps_01 foreign key ( approval_policy_id )
      references scm_approval_policies ( approval_policy_id ),
   constraint fk_scm_approval_policy_steps_02 foreign key ( reviewer_role_id )
      references scm_user_roles ( user_role_id ),
   constraint fk_scm_approval_policy_steps_03 foreign key ( fallback_role_id )
      references scm_user_roles ( user_role_id ),
   constraint fk_scm_approval_policy_steps_04 foreign key ( escalation_role_id )
      references scm_user_roles ( user_role_id ),
   constraint ck_scm_approval_policy_steps_01 check ( step_sequence_number > 0 ),
   constraint ck_scm_approval_policy_steps_02 check ( due_within_hours is null
       or due_within_hours > 0 ),
   constraint ck_scm_approval_policy_steps_03 check ( escalation_after_hours is null
       or escalation_after_hours > 0 ),
   constraint ck_scm_approval_policy_steps_04 check ( approval_authority_level is null
       or approval_authority_level > 0 ),
   constraint ck_scm_approval_policy_steps_05 check ( step_status_code in ( 'ACTIVE',
                                                                            'INACTIVE' ) ),
   constraint ck_scm_approval_policy_steps_06
      check ( escalation_after_hours is null
          or due_within_hours is null
          or escalation_after_hours >= due_within_hours )
) annotations ( display_label 'Approval Policy Steps',description 'Stores records for approval policy routing steps.',application_module
'Inventory and Warehouse Management' );

create table scm_approval_requests (
   approval_request_id          number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Approval Request ID',description 'Surrogate key for the approval request.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   approval_request_number      varchar2(30 char) not null annotations ( display_label 'Approval Request Number',description 'Business reference used to identify the approval request.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'reference_number' ),
   approval_subject_code        varchar2(30 char) not null annotations ( display_label 'Approval Subject Code',description 'Business object under approval.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'classification',ai_context 'Valid values include STOCK_TRANSFER, STOCK_ADJUSTMENT, QUARANTINE_CASE, OPERATIONAL_EXCEPTION, INBOUND_RECEIPT_LINE, STOCK_COUNT_LINE, OUTBOUND_ORDER_LINE.'
   ),
   approval_policy_id           number not null annotations ( display_label 'Approval Policy ID',description 'Approval policy governing the request.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   current_step_sequence_number number(4) default 1 not null annotations ( display_label 'Current Step Sequence Number',description
   'Current approval step sequence for the request.',semantic_type 'sequence' ),
   current_reviewer_role_id     number
      annotations ( display_label 'Current Reviewer Role ID',description 'Role currently expected to act on the request.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   fallback_reviewer_role_id    number
      annotations ( display_label 'Fallback Reviewer Role ID',description 'Fallback role configured for the current request step where relevant.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   escalated_reviewer_role_id   number
      annotations ( display_label 'Escalated Reviewer Role ID',description 'Role that owns the request after escalation where relevant.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   approval_status_code         varchar2(20 char) default 'OPEN' not null annotations ( display_label 'Approval Status Code',
   description 'Current business status of the approval request.',search_facet 'distinct-list',semantic_type 'status',ai_context
   'Valid values include OPEN, APPROVED, REJECTED, RETURNED, ESCALATED, CANCELLED, CLOSED.' ),
   requested_by                 varchar2(128 char) not null annotations ( display_label 'Requested By',description 'User who submitted the request.'
   ,value_required 'true',semantic_type 'user_name' ),
   requested_at                 timestamp with time zone default systimestamp not null annotations ( display_label 'Requested At'
   ,description 'Date and time when the approval request was submitted.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type
   'datetime' ),
   due_at                       timestamp with time zone
      annotations ( display_label 'Due At',description 'Date and time when the current approval step is due.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   escalated_at                 timestamp with time zone
      annotations ( display_label 'Escalated At',description 'Date and time when the request was escalated.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   completed_at                 timestamp with time zone
      annotations ( display_label 'Completed At',description 'Date and time when the request reached a terminal outcome.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   stock_transfer_id            number
      annotations ( display_label 'Stock Transfer ID',description 'Stock transfer under approval where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   stock_adjustment_id          number
      annotations ( display_label 'Stock Adjustment ID',description 'Stock adjustment under approval where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   quarantine_case_id           number
      annotations ( display_label 'Quarantine Case ID',description 'Quarantine case under approval where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   operational_exception_id     number
      annotations ( display_label 'Operational Exception ID',description 'Operational exception under approval where relevant.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   inbound_receipt_line_id      number
      annotations ( display_label 'Inbound Receipt Line ID',description 'Inbound receipt line under approval where relevant.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   stock_count_line_id          number
      annotations ( display_label 'Stock Count Line ID',description 'Stock count line under approval where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   outbound_order_line_id       number
      annotations ( display_label 'Outbound Order Line ID',description 'Outbound order line under approval where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   request_reason_code          varchar2(30 char)
      annotations ( display_label 'Request Reason Code',description 'Business reason code recorded when the approval request was submitted.'
      ,semantic_type 'reason_code' ),
   request_notes                varchar2(1000 char)
      annotations ( display_label 'Request Notes',description 'Business notes for the approval request.',semantic_type 'comment'
      ),
   constraint pk_scm_approval_requests primary key ( approval_request_id ),
   constraint uq_scm_approval_requests_01 unique ( approval_request_number ),
   constraint fk_scm_approval_requests_01 foreign key ( approval_policy_id )
      references scm_approval_policies ( approval_policy_id ),
   constraint fk_scm_approval_requests_02 foreign key ( current_reviewer_role_id )
      references scm_user_roles ( user_role_id ),
   constraint fk_scm_approval_requests_03 foreign key ( fallback_reviewer_role_id )
      references scm_user_roles ( user_role_id ),
   constraint fk_scm_approval_requests_04 foreign key ( escalated_reviewer_role_id )
      references scm_user_roles ( user_role_id ),
   constraint fk_scm_approval_requests_05 foreign key ( stock_transfer_id )
      references scm_stock_transfers ( stock_transfer_id ),
   constraint fk_scm_approval_requests_06 foreign key ( stock_adjustment_id )
      references scm_stock_adjustments ( stock_adjustment_id ),
   constraint fk_scm_approval_requests_07 foreign key ( quarantine_case_id )
      references scm_quarantine_cases ( quarantine_case_id ),
   constraint fk_scm_approval_requests_08 foreign key ( operational_exception_id )
      references scm_operational_exceptions ( operational_exception_id ),
   constraint fk_scm_approval_requests_09 foreign key ( inbound_receipt_line_id )
      references scm_inbound_receipt_lines ( inbound_receipt_line_id ),
   constraint fk_scm_approval_requests_10 foreign key ( stock_count_line_id )
      references scm_stock_count_lines ( stock_count_line_id ),
   constraint fk_scm_approval_requests_11 foreign key ( outbound_order_line_id )
      references scm_outbound_order_lines ( outbound_order_line_id ),
   constraint ck_scm_approval_requests_01
      check ( approval_subject_code in ( 'STOCK_TRANSFER',
                                         'STOCK_ADJUSTMENT',
                                         'QUARANTINE_CASE',
                                         'OPERATIONAL_EXCEPTION',
                                         'INBOUND_RECEIPT_LINE',
                                         'STOCK_COUNT_LINE',
                                         'OUTBOUND_ORDER_LINE' ) ),
   constraint ck_scm_approval_requests_02 check ( current_step_sequence_number > 0 ),
   constraint ck_scm_approval_requests_03
      check ( approval_status_code in ( 'OPEN',
                                        'APPROVED',
                                        'REJECTED',
                                        'RETURNED',
                                        'ESCALATED',
                                        'CANCELLED',
                                        'CLOSED' ) ),
   constraint ck_scm_approval_requests_04
      check ( due_at is null
          or due_at >= requested_at ),
   constraint ck_scm_approval_requests_05
      check ( completed_at is null
          or completed_at >= requested_at ),
   constraint ck_scm_approval_requests_06
      check ( (
         case
            when stock_transfer_id is null then
               0
            else
               1
         end
      ) + (
         case
            when stock_adjustment_id is null then
               0
            else
               1
         end
      ) + (
         case
            when quarantine_case_id is null then
               0
            else
               1
         end
      ) + (
         case
            when operational_exception_id is null then
               0
            else
               1
         end
      ) + (
         case
            when inbound_receipt_line_id is null then
               0
            else
               1
         end
      ) + (
         case
            when stock_count_line_id is null then
               0
            else
               1
         end
      ) + (
         case
            when outbound_order_line_id is null then
               0
            else
               1
         end
      ) = 1 ),
   constraint ck_scm_approval_requests_07
      check ( ( approval_subject_code = 'STOCK_TRANSFER'
         and stock_transfer_id is not null
         and stock_adjustment_id is null
         and quarantine_case_id is null
         and operational_exception_id is null
         and inbound_receipt_line_id is null
         and stock_count_line_id is null
         and outbound_order_line_id is null )
          or ( approval_subject_code = 'STOCK_ADJUSTMENT'
         and stock_transfer_id is null
         and stock_adjustment_id is not null
         and quarantine_case_id is null
         and operational_exception_id is null
         and inbound_receipt_line_id is null
         and stock_count_line_id is null
         and outbound_order_line_id is null )
          or ( approval_subject_code = 'QUARANTINE_CASE'
         and stock_transfer_id is null
         and stock_adjustment_id is null
         and quarantine_case_id is not null
         and operational_exception_id is null
         and inbound_receipt_line_id is null
         and stock_count_line_id is null
         and outbound_order_line_id is null )
          or ( approval_subject_code = 'OPERATIONAL_EXCEPTION'
         and stock_transfer_id is null
         and stock_adjustment_id is null
         and quarantine_case_id is null
         and operational_exception_id is not null
         and inbound_receipt_line_id is null
         and stock_count_line_id is null
         and outbound_order_line_id is null )
          or ( approval_subject_code = 'INBOUND_RECEIPT_LINE'
         and stock_transfer_id is null
         and stock_adjustment_id is null
         and quarantine_case_id is null
         and operational_exception_id is null
         and inbound_receipt_line_id is not null
         and stock_count_line_id is null
         and outbound_order_line_id is null )
          or ( approval_subject_code = 'STOCK_COUNT_LINE'
         and stock_transfer_id is null
         and stock_adjustment_id is null
         and quarantine_case_id is null
         and operational_exception_id is null
         and inbound_receipt_line_id is null
         and stock_count_line_id is not null
         and outbound_order_line_id is null )
          or ( approval_subject_code = 'OUTBOUND_ORDER_LINE'
         and stock_transfer_id is null
         and stock_adjustment_id is null
         and quarantine_case_id is null
         and operational_exception_id is null
         and inbound_receipt_line_id is null
         and stock_count_line_id is null
         and outbound_order_line_id is not null ) )
) annotations ( display_label 'Approval Requests',description 'Stores records for active and completed approval requests.',application_module
'Inventory and Warehouse Management' );

create table scm_approval_actions (
   approval_action_id       number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Approval Action ID',description 'Surrogate key for the approval action.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   approval_request_id      number not null annotations ( display_label 'Approval Request ID',description 'Approval request that this action belongs to.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   approval_sequence_number number(4) default 1 not null annotations ( display_label 'Approval Sequence Number',description 'Sequence of the approval step for the approval request.'
   ,semantic_type 'sequence' ),
   approval_step_name       varchar2(100 char) not null annotations ( display_label 'Approval Step Name',description 'Business name of the approval step.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'name' ),
   assigned_role_id         number
      annotations ( display_label 'Assigned Role ID',description 'Role responsible for the step when the action was taken.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   decision_code            varchar2(20 char) not null annotations ( display_label 'Decision Code',description 'Approval decision taken at the step.'
   ,value_required 'true',semantic_type 'decision',ai_context 'Valid values include SUBMITTED, APPROVED, REJECTED, RETURNED, ESCALATED, REASSIGNED.'
   ),
   decision_by              varchar2(128 char) not null annotations ( display_label 'Decision By',description 'User who took the approval decision.'
   ,value_required 'true',semantic_type 'user_name' ),
   decision_at              timestamp with time zone default systimestamp not null annotations ( display_label 'Decision At',
   description 'Date and time when the approval decision was recorded.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type
   'datetime' ),
   decision_comment         varchar2(1000 char)
      annotations ( display_label 'Decision Comment',description 'Business comment recorded with the approval decision.',semantic_type
      'comment' ),
   constraint pk_scm_approval_actions primary key ( approval_action_id ),
   constraint fk_scm_approval_actions_01 foreign key ( approval_request_id )
      references scm_approval_requests ( approval_request_id ),
   constraint fk_scm_approval_actions_02 foreign key ( assigned_role_id )
      references scm_user_roles ( user_role_id ),
   constraint ck_scm_approval_actions_01 check ( approval_sequence_number > 0 ),
   constraint ck_scm_approval_actions_02
      check ( decision_code in ( 'SUBMITTED',
                                 'APPROVED',
                                 'REJECTED',
                                 'RETURNED',
                                 'ESCALATED',
                                 'REASSIGNED' ) )
) annotations ( display_label 'Approval Actions',description 'Stores records for approval actions.',application_module 'Inventory and Warehouse Management'
);

create table scm_alert_rules (
   alert_rule_id          number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Alert Rule ID',description 'Surrogate key for the alert rule.',display_in_report 'false',display_in_form 'false',semantic_type
   'identifier' ),
   rule_code              varchar2(30 char) not null annotations ( display_label 'Rule Code',description 'Business code used to identify the alert rule.'
   ,value_required 'true',semantic_type 'code' ),
   rule_name              varchar2(150 char) not null annotations ( display_label 'Rule Name',description 'Business name of the alert rule.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'name' ),
   warehouse_id           number
      annotations ( display_label 'Warehouse ID',description 'Warehouse where the rule applies where the rule is site specific.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   process_area_code      varchar2(20 char)
      annotations ( display_label 'Process Area Code',description 'Warehouse process area covered by the rule.',semantic_type
      'classification',ai_context 'Valid values include INBOUND, PUTAWAY, INVENTORY, REPLENISHMENT, OUTBOUND, RETURNS, QUARANTINE, COUNTING, APPROVALS, REPORTING, ADMINISTRATION.'
      ),
   alert_type_code        varchar2(30 char) not null annotations ( display_label 'Alert Type Code',description 'Business alert type raised by the rule.'
   ,value_required 'true',semantic_type 'classification' ),
   alert_subject_code     varchar2(30 char) not null annotations ( display_label 'Alert Subject Code',description 'Business subject area that the alert rule watches.'
   ,value_required 'true',semantic_type 'classification',ai_context 'Valid values include REPLENISHMENT_ALERT, STOCK_TRANSFER, INBOUND_RECEIPT, OPERATIONAL_TASK, STOCK_COUNT, APPROVAL_REQUEST, OPERATIONAL_EXCEPTION, QUARANTINE_CASE, OUTBOUND_ORDER.'
   ),
   threshold_quantity     number(18,4)
      annotations ( display_label 'Threshold Quantity',description 'Quantity threshold used by the rule where relevant.',format_mask
      'FM999G999G999G990D0000',semantic_type 'quantity' ),
   threshold_value_amount number(18,2)
      annotations ( display_label 'Threshold Value Amount',description 'Value threshold used by the rule where relevant.',format_mask
      'FM999G999G999G990D00',semantic_type 'amount' ),
   age_threshold_hours    number(6)
      annotations ( display_label 'Age Threshold Hours',description 'Age threshold in hours used by the rule where relevant.'
      ,semantic_type 'duration_hours' ),
   recipient_role_id      number
      annotations ( display_label 'Recipient Role ID',description 'Role that should receive the alert when it is raised.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   escalation_role_id     number
      annotations ( display_label 'Escalation Role ID',description 'Role that should receive the alert when it is escalated.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   delivery_method_code   varchar2(20 char) default 'IN_APP' not null annotations ( display_label 'Delivery Method Code',description
   'Delivery method used by the alert rule.',semantic_type 'classification',ai_context 'Valid values include IN_APP, EMAIL, SMS.'
   ),
   priority_code          varchar2(20 char) default 'MEDIUM' not null annotations ( display_label 'Priority Code',description
   'Priority assigned when the rule raises an alert.',semantic_type 'priority',ai_context 'Valid values include LOW, MEDIUM, HIGH, CRITICAL.'
   ),
   is_active              boolean default true not null annotations ( display_label 'Is Active',description 'Indicates whether the alert rule is active.'
   ,semantic_type 'flag' ),
   rule_notes             varchar2(500 char)
      annotations ( display_label 'Rule Notes',description 'Business notes for the alert rule.',semantic_type 'comment' ),
   constraint pk_scm_alert_rules primary key ( alert_rule_id ),
   constraint uq_scm_alert_rules_01 unique ( rule_code ),
   constraint fk_scm_alert_rules_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_alert_rules_02 foreign key ( recipient_role_id )
      references scm_user_roles ( user_role_id ),
   constraint fk_scm_alert_rules_03 foreign key ( escalation_role_id )
      references scm_user_roles ( user_role_id ),
   constraint ck_scm_alert_rules_01
      check ( process_area_code in ( 'INBOUND',
                                     'PUTAWAY',
                                     'INVENTORY',
                                     'REPLENISHMENT',
                                     'OUTBOUND',
                                     'RETURNS',
                                     'QUARANTINE',
                                     'COUNTING',
                                     'APPROVALS',
                                     'REPORTING',
                                     'ADMINISTRATION' )
          or process_area_code is null ),
   constraint ck_scm_alert_rules_02
      check ( alert_subject_code in ( 'REPLENISHMENT_ALERT',
                                      'STOCK_TRANSFER',
                                      'INBOUND_RECEIPT',
                                      'OPERATIONAL_TASK',
                                      'STOCK_COUNT',
                                      'APPROVAL_REQUEST',
                                      'OPERATIONAL_EXCEPTION',
                                      'QUARANTINE_CASE',
                                      'OUTBOUND_ORDER' ) ),
   constraint ck_scm_alert_rules_03
      check ( threshold_quantity is null
          or threshold_quantity >= 0 ),
   constraint ck_scm_alert_rules_04
      check ( threshold_value_amount is null
          or threshold_value_amount >= 0 ),
   constraint ck_scm_alert_rules_05 check ( age_threshold_hours is null
       or age_threshold_hours > 0 ),
   constraint ck_scm_alert_rules_06
      check ( delivery_method_code in ( 'IN_APP',
                                        'EMAIL',
                                        'SMS' ) ),
   constraint ck_scm_alert_rules_07
      check ( priority_code in ( 'LOW',
                                 'MEDIUM',
                                 'HIGH',
                                 'CRITICAL' ) )
) annotations ( display_label 'Alert Rules',description 'Stores records for configurable alert rules.',application_module 'Inventory and Warehouse Management'
);

create table scm_alerts (
   alert_id                 number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Alert ID',description 'Surrogate key for the alert.',display_in_report 'false',display_in_form 'false',semantic_type 'identifier'
   ),
   alert_number             varchar2(30 char) not null annotations ( display_label 'Alert Number',description 'Business reference used to identify the alert.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'reference_number' ),
   alert_rule_id            number
      annotations ( display_label 'Alert Rule ID',description 'Alert rule that raised the alert where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   warehouse_id             number not null annotations ( display_label 'Warehouse ID',description 'Warehouse responsible for the alert.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   alert_type_code          varchar2(30 char) not null annotations ( display_label 'Alert Type Code',description 'Business alert type for the alert instance.'
   ,value_required 'true',semantic_type 'classification' ),
   alert_subject_code       varchar2(30 char) not null annotations ( display_label 'Alert Subject Code',description 'Business subject area that triggered the alert.'
   ,value_required 'true',semantic_type 'classification',ai_context 'Valid values include REPLENISHMENT_ALERT, STOCK_TRANSFER, INBOUND_RECEIPT, OPERATIONAL_TASK, STOCK_COUNT, APPROVAL_REQUEST, OPERATIONAL_EXCEPTION, QUARANTINE_CASE, OUTBOUND_ORDER.'
   ),
   alert_status_code        varchar2(20 char) default 'OPEN' not null annotations ( display_label 'Alert Status Code',description
   'Current business status of the alert.',search_facet 'distinct-list',semantic_type 'status',ai_context 'Valid values include OPEN, ACKNOWLEDGED, IN_PROGRESS, RESOLVED, CLOSED, SUPPRESSED.'
   ),
   priority_code            varchar2(20 char) default 'MEDIUM' not null annotations ( display_label 'Priority Code',description
   'Priority of the alert instance.',semantic_type 'priority',ai_context 'Valid values include LOW, MEDIUM, HIGH, CRITICAL.' )
   ,
   replenishment_alert_id   number
      annotations ( display_label 'Replenishment Alert ID',description 'Replenishment alert linked to the generic alert where relevant.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   stock_transfer_id        number
      annotations ( display_label 'Stock Transfer ID',description 'Stock transfer linked to the alert where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   inbound_receipt_id       number
      annotations ( display_label 'Inbound Receipt ID',description 'Inbound receipt linked to the alert where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   operational_task_id      number
      annotations ( display_label 'Operational Task ID',description 'Operational task linked to the alert where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   stock_count_id           number
      annotations ( display_label 'Stock Count ID',description 'Stock count linked to the alert where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   approval_request_id      number
      annotations ( display_label 'Approval Request ID',description 'Approval request linked to the alert where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   operational_exception_id number
      annotations ( display_label 'Operational Exception ID',description 'Operational exception linked to the alert where relevant.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   quarantine_case_id       number
      annotations ( display_label 'Quarantine Case ID',description 'Quarantine case linked to the alert where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   outbound_order_id        number
      annotations ( display_label 'Outbound Order ID',description 'Outbound order linked to the alert where relevant.',display_as_lov
      'select-list',semantic_type 'identifier' ),
   raised_at                timestamp with time zone default systimestamp not null annotations ( display_label 'Raised At',description
   'Date and time when the alert was raised.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   due_at                   timestamp with time zone
      annotations ( display_label 'Due At',description 'Date and time when action on the alert is due.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   acknowledged_at          timestamp with time zone
      annotations ( display_label 'Acknowledged At',description 'Date and time when the alert was acknowledged.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   acknowledged_by_user_id  number
      annotations ( display_label 'Acknowledged By User ID',description 'User who acknowledged the alert.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   resolved_at              timestamp with time zone
      annotations ( display_label 'Resolved At',description 'Date and time when the alert was resolved.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   resolved_by_user_id      number
      annotations ( display_label 'Resolved By User ID',description 'User who resolved the alert.',display_as_lov 'select-list'
      ,semantic_type 'identifier' ),
   alert_message            varchar2(500 char) not null annotations ( display_label 'Alert Message',description 'User-facing message shown for the alert.'
   ,value_required 'true',semantic_type 'description' ),
   alert_notes              varchar2(1000 char)
      annotations ( display_label 'Alert Notes',description 'Business notes for the alert.',semantic_type 'comment' ),
   constraint pk_scm_alerts primary key ( alert_id ),
   constraint uq_scm_alerts_01 unique ( alert_number ),
   constraint fk_scm_alerts_01 foreign key ( alert_rule_id )
      references scm_alert_rules ( alert_rule_id ),
   constraint fk_scm_alerts_02 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint fk_scm_alerts_03 foreign key ( replenishment_alert_id )
      references scm_replenishment_alerts ( replenishment_alert_id ),
   constraint fk_scm_alerts_04 foreign key ( stock_transfer_id )
      references scm_stock_transfers ( stock_transfer_id ),
   constraint fk_scm_alerts_05 foreign key ( inbound_receipt_id )
      references scm_inbound_receipts ( inbound_receipt_id ),
   constraint fk_scm_alerts_06 foreign key ( operational_task_id )
      references scm_operational_tasks ( operational_task_id ),
   constraint fk_scm_alerts_07 foreign key ( stock_count_id )
      references scm_stock_counts ( stock_count_id ),
   constraint fk_scm_alerts_08 foreign key ( approval_request_id )
      references scm_approval_requests ( approval_request_id ),
   constraint fk_scm_alerts_09 foreign key ( operational_exception_id )
      references scm_operational_exceptions ( operational_exception_id ),
   constraint fk_scm_alerts_11 foreign key ( quarantine_case_id )
      references scm_quarantine_cases ( quarantine_case_id ),
   constraint fk_scm_alerts_12 foreign key ( outbound_order_id )
      references scm_outbound_orders ( outbound_order_id ),
   constraint fk_scm_alerts_13 foreign key ( acknowledged_by_user_id )
      references scm_application_users ( application_user_id ),
   constraint fk_scm_alerts_14 foreign key ( resolved_by_user_id )
      references scm_application_users ( application_user_id ),
   constraint ck_scm_alerts_01
      check ( alert_subject_code in ( 'REPLENISHMENT_ALERT',
                                      'STOCK_TRANSFER',
                                      'INBOUND_RECEIPT',
                                      'OPERATIONAL_TASK',
                                      'STOCK_COUNT',
                                      'APPROVAL_REQUEST',
                                      'OPERATIONAL_EXCEPTION',
                                      'QUARANTINE_CASE',
                                      'OUTBOUND_ORDER' ) ),
   constraint ck_scm_alerts_02
      check ( alert_status_code in ( 'OPEN',
                                     'ACKNOWLEDGED',
                                     'IN_PROGRESS',
                                     'RESOLVED',
                                     'CLOSED',
                                     'SUPPRESSED' ) ),
   constraint ck_scm_alerts_03
      check ( priority_code in ( 'LOW',
                                 'MEDIUM',
                                 'HIGH',
                                 'CRITICAL' ) ),
   constraint ck_scm_alerts_04
      check ( (
         case
            when replenishment_alert_id is null then
               0
            else
               1
         end
      ) + (
         case
            when stock_transfer_id is null then
               0
            else
               1
         end
      ) + (
         case
            when inbound_receipt_id is null then
               0
            else
               1
         end
      ) + (
         case
            when operational_task_id is null then
               0
            else
               1
         end
      ) + (
         case
            when stock_count_id is null then
               0
            else
               1
         end
      ) + (
         case
            when approval_request_id is null then
               0
            else
               1
         end
      ) + (
         case
            when operational_exception_id is null then
               0
            else
               1
         end
      ) + (
         case
            when quarantine_case_id is null then
               0
            else
               1
         end
      ) + (
         case
            when outbound_order_id is null then
               0
            else
               1
         end
      ) >= 1 )
) annotations ( display_label 'Alerts',description 'Stores records for operational alerts and inbox items.',application_module
'Inventory and Warehouse Management' );

create table scm_alert_notifications (
   alert_notification_id    number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Alert Notification ID',description 'Surrogate key for the alert notification.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   alert_id                 number not null annotations ( display_label 'Alert ID',description 'Alert that the notification belongs to.'
   ,value_required 'true',display_as_lov 'select-list',semantic_type 'identifier' ),
   recipient_role_id        number
      annotations ( display_label 'Recipient Role ID',description 'Role recipient for the alert notification where relevant.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   recipient_user_id        number
      annotations ( display_label 'Recipient User ID',description 'User recipient for the alert notification where relevant.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   delivery_method_code     varchar2(20 char) default 'IN_APP' not null annotations ( display_label 'Delivery Method Code',description
   'Delivery method used for the alert notification.',semantic_type 'classification',ai_context 'Valid values include IN_APP, EMAIL, SMS.'
   ),
   notification_status_code varchar2(20 char) default 'PENDING' not null annotations ( display_label 'Notification Status Code'
   ,description 'Current business status of the alert notification.',semantic_type 'status',ai_context 'Valid values include PENDING, SENT, READ, ACKNOWLEDGED, FAILED.'
   ),
   notification_address     varchar2(200 char)
      annotations ( display_label 'Notification Address',description 'Target notification address used for delivery where relevant.'
      ,semantic_type 'contact_point' ),
   sent_at                  timestamp with time zone
      annotations ( display_label 'Sent At',description 'Date and time when the notification was sent.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   read_at                  timestamp with time zone
      annotations ( display_label 'Read At',description 'Date and time when the notification was read.',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
      ,semantic_type 'datetime' ),
   acknowledged_at          timestamp with time zone
      annotations ( display_label 'Acknowledged At',description 'Date and time when the notification was acknowledged.',format_mask
      'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type 'datetime' ),
   notification_notes       varchar2(500 char)
      annotations ( display_label 'Notification Notes',description 'Business notes for the alert notification.',semantic_type
      'comment' ),
   constraint pk_scm_alert_notifications primary key ( alert_notification_id ),
   constraint fk_scm_alert_notifications_01 foreign key ( alert_id )
      references scm_alerts ( alert_id ),
   constraint fk_scm_alert_notifications_02 foreign key ( recipient_role_id )
      references scm_user_roles ( user_role_id ),
   constraint fk_scm_alert_notifications_03 foreign key ( recipient_user_id )
      references scm_application_users ( application_user_id ),
   constraint ck_scm_alert_notifications_01
      check ( delivery_method_code in ( 'IN_APP',
                                        'EMAIL',
                                        'SMS' ) ),
   constraint ck_scm_alert_notifications_02
      check ( notification_status_code in ( 'PENDING',
                                            'SENT',
                                            'READ',
                                            'ACKNOWLEDGED',
                                            'FAILED' ) ),
   constraint ck_scm_alert_notifications_03
      check ( recipient_role_id is not null
          or recipient_user_id is not null )
) annotations ( display_label 'Alert Notifications',description 'Stores records for alert notification delivery and inbox acknowledgement.'
,application_module 'Inventory and Warehouse Management' );

create table scm_record_notes (
   record_note_id   number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Record Note ID',description 'Surrogate key for the generic record note.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   record_type_code varchar2(30 char) not null annotations ( display_label 'Record Type Code',description 'Business entity type that the note belongs to.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'classification',ai_context 'Valid values include BUSINESS_PARTNER, PARTNER_SITE, WAREHOUSE, WAREHOUSE_AREA, STORAGE_LOCATION, ITEM, ITEM_SERIAL, INVENTORY_LOT, INBOUND_RECEIPT, INBOUND_RECEIPT_LINE, STOCK_TRANSFER, STOCK_TRANSFER_LINE, OUTBOUND_ORDER, OUTBOUND_ORDER_LINE, RETURN, RETURN_LINE, QUARANTINE_CASE, STOCK_ADJUSTMENT, STOCK_ADJUSTMENT_LINE, STOCK_COUNT, STOCK_COUNT_LINE, OPERATIONAL_TASK, OPERATIONAL_EXCEPTION, APPROVAL_REQUEST, ALERT.'
   ),
   record_id        number not null annotations ( display_label 'Record ID',description 'Identifier of the related business record.'
   ,value_required 'true',semantic_type 'identifier' ),
   warehouse_id     number
      annotations ( display_label 'Warehouse ID',description 'Warehouse linked to the note where the record is warehouse specific.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   note_type_code   varchar2(20 char) default 'GENERAL' not null annotations ( display_label 'Note Type Code',description 'Business note type used to group the note.'
   ,search_facet 'distinct-list',semantic_type 'classification',ai_context 'Valid values include GENERAL, RECEIVING, QUALITY, DISPATCH, APPROVAL, COUNT, ADJUSTMENT, CUSTOMER, INTERNAL.'
   ),
   note_title       varchar2(150 char)
      annotations ( display_label 'Note Title',description 'Short heading used to identify the note.',semantic_type 'title' )
      ,
   note_text        varchar2(2000 char) not null annotations ( display_label 'Note Text',description 'Business note text shown on the workspace.'
   ,value_required 'true',semantic_type 'comment' ),
   visibility_code  varchar2(20 char) default 'INTERNAL' not null annotations ( display_label 'Visibility Code',description 'Visibility level for the note.'
   ,search_facet 'distinct-list',semantic_type 'classification',ai_context 'Valid values include INTERNAL, SHARED, CUSTOMER_VISIBLE.'
   ),
   pinned_flag      boolean default false not null annotations ( display_label 'Pinned Flag',description 'Indicates whether the note should stay visible at the top of the workspace.'
   ,semantic_type 'flag' ),
   created_at       timestamp with time zone default systimestamp not null annotations ( display_label 'Created At',description
   'Date and time when the note was created.',display_in_form 'false',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type
   'datetime' ),
   created_by       varchar2(128 char) default sys_context(
      'USERENV',
      'SESSION_USER'
   ) not null annotations ( display_label 'Created By',description 'Database user that created the note.',display_in_form 'false'
   ,semantic_type 'user_name' ),
   constraint pk_scm_record_notes primary key ( record_note_id ),
   constraint fk_scm_record_notes_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint ck_scm_record_notes_01 check ( record_id > 0 ),
   constraint ck_scm_record_notes_02
      check ( record_type_code in ( 'BUSINESS_PARTNER',
                                    'PARTNER_SITE',
                                    'WAREHOUSE',
                                    'WAREHOUSE_AREA',
                                    'STORAGE_LOCATION',
                                    'ITEM',
                                    'ITEM_SERIAL',
                                    'INVENTORY_LOT',
                                    'INBOUND_RECEIPT',
                                    'INBOUND_RECEIPT_LINE',
                                    'STOCK_TRANSFER',
                                    'STOCK_TRANSFER_LINE',
                                    'OUTBOUND_ORDER',
                                    'OUTBOUND_ORDER_LINE',
                                    'RETURN',
                                    'RETURN_LINE',
                                    'QUARANTINE_CASE',
                                    'STOCK_ADJUSTMENT',
                                    'STOCK_ADJUSTMENT_LINE',
                                    'STOCK_COUNT',
                                    'STOCK_COUNT_LINE',
                                    'OPERATIONAL_TASK',
                                    'OPERATIONAL_EXCEPTION',
                                    'APPROVAL_REQUEST',
                                    'ALERT' ) ),
   constraint ck_scm_record_notes_03
      check ( note_type_code in ( 'GENERAL',
                                  'RECEIVING',
                                  'QUALITY',
                                  'DISPATCH',
                                  'APPROVAL',
                                  'COUNT',
                                  'ADJUSTMENT',
                                  'CUSTOMER',
                                  'INTERNAL' ) ),
   constraint ck_scm_record_notes_04
      check ( visibility_code in ( 'INTERNAL',
                                   'SHARED',
                                   'CUSTOMER_VISIBLE' ) )
) annotations ( display_label 'Record Notes',description 'Stores generic notes linked to supported warehouse records.',application_module
'Inventory and Warehouse Management' );

create table scm_record_attachments (
   record_attachment_id     number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Record Attachment ID',description 'Surrogate key for the generic record attachment.',display_in_report 'false',display_in_form
   'false',semantic_type 'identifier' ),
   record_type_code         varchar2(30 char) not null annotations ( display_label 'Record Type Code',description 'Business entity type that the attachment belongs to.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'classification',ai_context 'Valid values include BUSINESS_PARTNER, PARTNER_SITE, WAREHOUSE, WAREHOUSE_AREA, STORAGE_LOCATION, ITEM, ITEM_SERIAL, INVENTORY_LOT, INBOUND_RECEIPT, INBOUND_RECEIPT_LINE, STOCK_TRANSFER, STOCK_TRANSFER_LINE, OUTBOUND_ORDER, OUTBOUND_ORDER_LINE, RETURN, RETURN_LINE, QUARANTINE_CASE, STOCK_ADJUSTMENT, STOCK_ADJUSTMENT_LINE, STOCK_COUNT, STOCK_COUNT_LINE, OPERATIONAL_TASK, OPERATIONAL_EXCEPTION, APPROVAL_REQUEST, ALERT.'
   ),
   record_id                number not null annotations ( display_label 'Record ID',description 'Identifier of the related business record.'
   ,value_required 'true',semantic_type 'identifier' ),
   warehouse_id             number
      annotations ( display_label 'Warehouse ID',description 'Warehouse linked to the attachment where the record is warehouse specific.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   attachment_category_code varchar2(30 char) default 'GENERAL' not null annotations ( display_label 'Attachment Category Code'
   ,description 'Business category of the attachment.',search_facet 'distinct-list',semantic_type 'classification',ai_context
   'Valid values include GENERAL, RECEIPT_PROOF, DAMAGE_PHOTO, QUALITY_DOCUMENT, DISPATCH_DOCUMENT, APPROVAL_SUPPORT, COUNT_EVIDENCE.'
   ),
   file_name                varchar2(255 char) not null annotations ( display_label 'File Name',description 'Display name of the uploaded file.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'file_name' ),
   mime_type                varchar2(100 char) not null annotations ( display_label 'MIME Type',description 'MIME type of the uploaded file.'
   ,value_required 'true',semantic_type 'mime_type' ),
   file_size_bytes          number(12) not null annotations ( display_label 'File Size Bytes',description 'File size in bytes.'
   ,format_mask 'FM999G999G999G990',semantic_type 'size_bytes' ),
   storage_reference        varchar2(500 char) not null annotations ( display_label 'Storage Reference',description 'Document storage reference used by the application to retrieve the file.'
   ,value_required 'true',semantic_type 'file_path' ),
   uploaded_at              timestamp with time zone default systimestamp not null annotations ( display_label 'Uploaded At',
   description 'Date and time when the attachment was uploaded.',display_in_form 'false',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM'
   ,semantic_type 'datetime' ),
   uploaded_by              varchar2(128 char) default sys_context(
      'USERENV',
      'SESSION_USER'
   ) not null annotations ( display_label 'Uploaded By',description 'Database user that uploaded the attachment.',display_in_form
   'false',semantic_type 'user_name' ),
   is_active                boolean default true not null annotations ( display_label 'Is Active',description 'Indicates whether the attachment remains active for the record.'
   ,semantic_type 'flag' ),
   attachment_notes         varchar2(500 char)
      annotations ( display_label 'Attachment Notes',description 'Business notes about the attachment.',semantic_type 'comment'
      ),
   constraint pk_scm_record_attachments primary key ( record_attachment_id ),
   constraint fk_scm_record_attachments_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint ck_scm_record_attachments_01 check ( record_id > 0 ),
   constraint ck_scm_record_attachments_02
      check ( record_type_code in ( 'BUSINESS_PARTNER',
                                    'PARTNER_SITE',
                                    'WAREHOUSE',
                                    'WAREHOUSE_AREA',
                                    'STORAGE_LOCATION',
                                    'ITEM',
                                    'ITEM_SERIAL',
                                    'INVENTORY_LOT',
                                    'INBOUND_RECEIPT',
                                    'INBOUND_RECEIPT_LINE',
                                    'STOCK_TRANSFER',
                                    'STOCK_TRANSFER_LINE',
                                    'OUTBOUND_ORDER',
                                    'OUTBOUND_ORDER_LINE',
                                    'RETURN',
                                    'RETURN_LINE',
                                    'QUARANTINE_CASE',
                                    'STOCK_ADJUSTMENT',
                                    'STOCK_ADJUSTMENT_LINE',
                                    'STOCK_COUNT',
                                    'STOCK_COUNT_LINE',
                                    'OPERATIONAL_TASK',
                                    'OPERATIONAL_EXCEPTION',
                                    'APPROVAL_REQUEST',
                                    'ALERT' ) ),
   constraint ck_scm_record_attachments_03
      check ( attachment_category_code in ( 'GENERAL',
                                            'RECEIPT_PROOF',
                                            'DAMAGE_PHOTO',
                                            'QUALITY_DOCUMENT',
                                            'DISPATCH_DOCUMENT',
                                            'APPROVAL_SUPPORT',
                                            'COUNT_EVIDENCE' ) ),
   constraint ck_scm_record_attachments_04 check ( file_size_bytes > 0 )
) annotations ( display_label 'Record Attachments',description 'Stores generic attachment metadata linked to supported warehouse records.'
,application_module 'Inventory and Warehouse Management' );

create table scm_audit_events (
   audit_event_id         number generated always as identity ( start with 1 increment by 1 cache 100 ) annotations ( display_label
   'Audit Event ID',description 'Surrogate key for the generic audit event.',display_in_report 'false',display_in_form 'false'
   ,semantic_type 'identifier' ),
   record_type_code       varchar2(30 char) not null annotations ( display_label 'Record Type Code',description 'Business entity type that the audit event belongs to.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'classification',ai_context 'Valid values include BUSINESS_PARTNER, PARTNER_SITE, WAREHOUSE, WAREHOUSE_AREA, STORAGE_LOCATION, ITEM, ITEM_SERIAL, INVENTORY_LOT, INBOUND_RECEIPT, INBOUND_RECEIPT_LINE, STOCK_TRANSFER, STOCK_TRANSFER_LINE, OUTBOUND_ORDER, OUTBOUND_ORDER_LINE, RETURN, RETURN_LINE, QUARANTINE_CASE, STOCK_ADJUSTMENT, STOCK_ADJUSTMENT_LINE, STOCK_COUNT, STOCK_COUNT_LINE, OPERATIONAL_TASK, OPERATIONAL_EXCEPTION, APPROVAL_REQUEST, APPLICATION_USER, USER_ROLE, USER_ROLE_ASSIGNMENT, ROLE_PERMISSION, BUSINESS_LIST, BUSINESS_LIST_VALUE, APPROVAL_POLICY, APPROVAL_POLICY_STEP, ALERT_RULE, ALERT.'
   ),
   record_id              number not null annotations ( display_label 'Record ID',description 'Identifier of the related business record.'
   ,value_required 'true',semantic_type 'identifier' ),
   warehouse_id           number
      annotations ( display_label 'Warehouse ID',description 'Warehouse linked to the audit event where the record is warehouse specific.'
      ,display_as_lov 'select-list',semantic_type 'identifier' ),
   event_type_code        varchar2(30 char) not null annotations ( display_label 'Event Type Code',description 'Business event recorded in the audit history.'
   ,value_required 'true',search_facet 'distinct-list',semantic_type 'type',ai_context 'Valid values include CREATED, UPDATED, STATUS_CHANGED, RECEIVED, PUTAWAY, ALLOCATED, PICKED, DISPATCHED, COUNTED, ADJUSTED, APPROVAL_SUBMITTED, APPROVED, REJECTED, ROLE_ASSIGNED, ROLE_UNASSIGNED, PERMISSION_GRANTED, PERMISSION_REVOKED, ALERT_RAISED, NOTE_ADDED, ATTACHMENT_ADDED.'
   ),
   event_summary          varchar2(500 char) not null annotations ( display_label 'Event Summary',description 'Short business summary of the audit event.'
   ,value_required 'true',primary_display_column 'true',semantic_type 'description' ),
   old_value_text         varchar2(1000 char)
      annotations ( display_label 'Old Value Text',description 'Previous value or business state where the audit event reflects a change.'
      ,semantic_type 'description' ),
   new_value_text         varchar2(1000 char)
      annotations ( display_label 'New Value Text',description 'New value or business state where the audit event reflects a change.'
      ,semantic_type 'description' ),
   source_document_type   varchar2(30 char)
      annotations ( display_label 'Source Document Type',description 'Source business document type that caused the audit event where relevant.'
      ,semantic_type 'type' ),
   source_document_number varchar2(50 char)
      annotations ( display_label 'Source Document Number',description 'Source business document number that caused the audit event where relevant.'
      ,semantic_type 'reference_number' ),
   event_at               timestamp with time zone default systimestamp not null annotations ( display_label 'Event At',description
   'Date and time when the audit event was recorded.',display_in_form 'false',format_mask 'DD-MON-YYYY HH24:MI TZH:TZM',semantic_type
   'datetime' ),
   event_by               varchar2(128 char) default sys_context(
      'USERENV',
      'SESSION_USER'
   ) not null annotations ( display_label 'Event By',description 'Database user that recorded the audit event.',display_in_form
   'false',semantic_type 'user_name' ),
   constraint pk_scm_audit_events primary key ( audit_event_id ),
   constraint fk_scm_audit_events_01 foreign key ( warehouse_id )
      references scm_warehouses ( warehouse_id ),
   constraint ck_scm_audit_events_01 check ( record_id > 0 ),
   constraint ck_scm_audit_events_02
      check ( record_type_code in ( 'BUSINESS_PARTNER',
                                    'PARTNER_SITE',
                                    'WAREHOUSE',
                                    'WAREHOUSE_AREA',
                                    'STORAGE_LOCATION',
                                    'ITEM',
                                    'ITEM_SERIAL',
                                    'INVENTORY_LOT',
                                    'INBOUND_RECEIPT',
                                    'INBOUND_RECEIPT_LINE',
                                    'STOCK_TRANSFER',
                                    'STOCK_TRANSFER_LINE',
                                    'OUTBOUND_ORDER',
                                    'OUTBOUND_ORDER_LINE',
                                    'RETURN',
                                    'RETURN_LINE',
                                    'QUARANTINE_CASE',
                                    'STOCK_ADJUSTMENT',
                                    'STOCK_ADJUSTMENT_LINE',
                                    'STOCK_COUNT',
                                    'STOCK_COUNT_LINE',
                                    'OPERATIONAL_TASK',
                                    'OPERATIONAL_EXCEPTION',
                                    'APPROVAL_REQUEST',
                                    'APPLICATION_USER',
                                    'USER_ROLE',
                                    'USER_ROLE_ASSIGNMENT',
                                    'ROLE_PERMISSION',
                                    'BUSINESS_LIST',
                                    'BUSINESS_LIST_VALUE',
                                    'APPROVAL_POLICY',
                                    'APPROVAL_POLICY_STEP',
                                    'ALERT_RULE',
                                    'ALERT' ) ),
   constraint ck_scm_audit_events_03
      check ( event_type_code in ( 'CREATED',
                                   'UPDATED',
                                   'STATUS_CHANGED',
                                   'RECEIVED',
                                   'PUTAWAY',
                                   'ALLOCATED',
                                   'PICKED',
                                   'DISPATCHED',
                                   'COUNTED',
                                   'ADJUSTED',
                                   'APPROVAL_SUBMITTED',
                                   'APPROVED',
                                   'REJECTED',
                                   'ROLE_ASSIGNED',
                                   'ROLE_UNASSIGNED',
                                   'PERMISSION_GRANTED',
                                   'PERMISSION_REVOKED',
                                   'ALERT_RAISED',
                                   'NOTE_ADDED',
                                   'ATTACHMENT_ADDED' ) )
) annotations ( display_label 'Audit Events',description 'Stores generic audit history linked to supported warehouse records.'
,application_module 'Inventory and Warehouse Management' );

------------------------------------------------------------------------------
-- 7. Supporting indexes
------------------------------------------------------------------------------

create index scm_idx_application_users_01 on
   scm_application_users (
      default_warehouse_id
   );

create index scm_idx_user_role_asgn_01 on
   scm_user_role_assignments (
      application_user_id,
      assignment_status_code
   );

create index scm_idx_user_role_asgn_02 on
   scm_user_role_assignments (
      user_role_id,
      warehouse_id
   );

create index scm_idx_business_list_vals_01 on
   scm_business_list_values (
      business_list_id,
      display_sequence
   );

create index scm_idx_approval_policies_01 on
   scm_approval_policies (
      approval_subject_code,
      policy_status_code
   );

create index scm_idx_storage_locations_01 on
   scm_storage_locations (
      warehouse_area_id
   );

create index scm_idx_storage_locations_02 on
   scm_storage_locations (
      parent_location_id
   );

create index scm_idx_item_wh_policies_01 on
   scm_item_warehouse_policies (
      warehouse_id
   );

create index scm_idx_replenishment_alerts_01 on
   scm_replenishment_alerts (
      warehouse_id,
      alert_status_code
   );

create index scm_idx_inventory_balances_01 on
   scm_inventory_balances (
      item_id,
      stock_status_code
   );

create index scm_idx_inventory_txns_01 on
   scm_inventory_transactions (
      warehouse_id,
      transaction_at
   );

create index scm_idx_inventory_txns_02 on
   scm_inventory_transactions (
      item_id,
      transaction_at
   );

create index scm_idx_inbound_receipts_01 on
   scm_inbound_receipts (
      warehouse_id,
      receipt_status_code
   );

create index scm_idx_inbound_receipt_lines_01 on
   scm_inbound_receipt_lines (
      item_id
   );

create index scm_idx_stock_transfers_01 on
   scm_stock_transfers (
      from_warehouse_id,
      to_warehouse_id,
      transfer_status_code
   );

create index scm_idx_stock_transfer_lines_01 on
   scm_stock_transfer_lines (
      item_id
   );

create index scm_idx_outbound_orders_01 on
   scm_outbound_orders (
      ship_from_warehouse_id,
      outbound_status_code
   );

create index scm_idx_outbound_order_lines_01 on
   scm_outbound_order_lines (
      item_id
   );

create index scm_idx_item_serials_01 on
   scm_item_serials (
      item_id,
      current_status_code
   );

create index scm_idx_item_serials_02 on
   scm_item_serials (
      current_storage_location_id
   );

create index scm_idx_serial_events_01 on
   scm_serial_events (
      item_serial_id,
      event_at
   );

create index scm_idx_returns_01 on
   scm_returns (
      warehouse_id,
      return_status_code
   );

create index scm_idx_return_lines_01 on
   scm_return_lines (
      item_id
   );

create index scm_idx_quarantine_cases_01 on
   scm_quarantine_cases (
      warehouse_id,
      quarantine_status_code
   );

create index scm_idx_stock_adjustments_01 on
   scm_stock_adjustments (
      warehouse_id,
      adjustment_status_code
   );

create index scm_idx_stock_adj_lines_01 on
   scm_stock_adjustment_lines (
      item_id
   );

create index scm_idx_stock_counts_01 on
   scm_stock_counts (
      warehouse_id,
      count_status_code
   );

create index scm_idx_stock_count_lines_01 on
   scm_stock_count_lines (
      item_id,
      storage_location_id
   );

create index scm_idx_pick_waves_01 on
   scm_pick_waves (
      warehouse_id,
      wave_status_code
   );

create index scm_idx_operational_tasks_01 on
   scm_operational_tasks (
      warehouse_id,
      task_status_code
   );

create index scm_idx_operational_tasks_02 on
   scm_operational_tasks (
      pick_wave_id
   );

create index scm_idx_operational_exc_01 on
   scm_operational_exceptions (
      warehouse_id,
      exception_status_code
   );

create index scm_idx_approval_requests_01 on
   scm_approval_requests (
      approval_status_code,
      due_at
   );

create index scm_idx_approval_requests_02 on
   scm_approval_requests (
      approval_subject_code,
      current_reviewer_role_id
   );

create index scm_idx_approval_actions_01 on
   scm_approval_actions (
      approval_request_id,
      approval_sequence_number
   );

create index scm_idx_approval_actions_02 on
   scm_approval_actions (
      assigned_role_id,
      decision_code
   );

create index scm_idx_alert_rules_01 on
   scm_alert_rules (
      warehouse_id,
      alert_subject_code
   );

create index scm_idx_alerts_01 on
   scm_alerts (
      warehouse_id,
      alert_status_code
   );

create index scm_idx_alerts_02 on
   scm_alerts (
      approval_request_id,
      priority_code
   );

create index scm_idx_alert_notifications_01 on
   scm_alert_notifications (
      alert_id,
      notification_status_code
   );

create index scm_idx_record_notes_01 on
   scm_record_notes (
      record_type_code,
      record_id,
      created_at
   );

create index scm_idx_record_attachments_01 on
   scm_record_attachments (
      record_type_code,
      record_id
   );

create index scm_idx_audit_events_01 on
   scm_audit_events (
      record_type_code,
      record_id,
      event_at
   );