-- APEX Logistics
-- SCM Basic App data model
-- Oracle Database 19c compatible design
--
-- Scope notes
-- 1. This schema keeps core warehouse operations, control, and traceability.
-- 2. Multi-site operation and lot/serial traceability are in scope.
-- 3. Review control uses simple status columns.
-- 4. Role access uses six application roles with warehouse assignments.

------------------------------------------------------------------------------
-- 1. Core reference data
------------------------------------------------------------------------------

create table scm_business_partners (
    business_partner_id number generated always as identity (start with 1 increment by 1 cache 100),
    partner_number varchar2(30 char) not null,
    partner_type_code varchar2(20 char) not null,
    partner_name varchar2(200 char) not null,
    partner_status_code varchar2(20 char) default 'ACTIVE' not null,
    created_at timestamp with time zone default systimestamp not null,
    created_by varchar2(128 char) default sys_context('USERENV','SESSION_USER') not null,
    constraint pk_scm_business_partners primary key (business_partner_id),
    constraint uq_scm_business_partners_01 unique (partner_number),
    constraint ck_scm_business_partners_01 check (partner_type_code in ('SUPPLIER', 'CUSTOMER', 'CARRIER', 'INTERNAL')),
    constraint ck_scm_business_partners_02 check (partner_status_code in ('ACTIVE', 'INACTIVE', 'ON_HOLD'))
);

create table scm_partner_sites (
    partner_site_id number generated always as identity (start with 1 increment by 1 cache 100),
    business_partner_id number not null,
    site_code varchar2(30 char) not null,
    site_name varchar2(200 char) not null,
    site_role_code varchar2(20 char) not null,
    address_line_1 varchar2(200 char) not null,
    address_line_2 varchar2(200 char),
    city_name varchar2(100 char) not null,
    state_region_name varchar2(100 char),
    postal_code varchar2(30 char),
    country_code varchar2(2 char) not null,
    is_primary_site number(1) default 0 not null,
    is_active number(1) default 1 not null,
    created_at timestamp with time zone default systimestamp not null,
    created_by varchar2(128 char) default sys_context('USERENV','SESSION_USER') not null,
    constraint pk_scm_partner_sites primary key (partner_site_id),
    constraint uq_scm_partner_sites_01 unique (business_partner_id, site_code),
    constraint fk_scm_partner_sites_01 foreign key (business_partner_id)
        references scm_business_partners (business_partner_id),
    constraint ck_scm_partner_sites_01 check (site_role_code in ('PRIMARY', 'SHIP_FROM', 'SHIP_TO', 'PICKUP', 'DELIVERY', 'RETURN'))
);

create table scm_warehouses (
    warehouse_id number generated always as identity (start with 1 increment by 1 cache 100),
    warehouse_code varchar2(30 char) not null,
    warehouse_name varchar2(200 char) not null,
    warehouse_status_code varchar2(20 char) default 'ACTIVE' not null,
    address_line_1 varchar2(200 char),
    address_line_2 varchar2(200 char),
    city_name varchar2(100 char),
    state_region_name varchar2(100 char),
    postal_code varchar2(30 char),
    country_code varchar2(2 char),
    warehouse_geometry mdsys.sdo_geometry,
    created_at timestamp with time zone default systimestamp not null,
    created_by varchar2(128 char) default sys_context('USERENV','SESSION_USER') not null,
    constraint pk_scm_warehouses primary key (warehouse_id),
    constraint uq_scm_warehouses_01 unique (warehouse_code),
    constraint ck_scm_warehouses_01 check (warehouse_status_code in ('ACTIVE', 'INACTIVE', 'BLOCKED'))
);

create table scm_user_roles (
    user_role_id number generated always as identity (start with 1 increment by 1 cache 100),
    role_code varchar2(30 char) not null,
    role_name varchar2(100 char) not null,
    role_scope_code varchar2(20 char) default 'WAREHOUSE' not null,
    approval_authority_level number(4) default 0 not null,
    is_system_role number(1) default 1 not null,
    is_active number(1) default 1 not null,
    role_notes varchar2(500 char),
    constraint pk_scm_user_roles primary key (user_role_id),
    constraint uq_scm_user_roles_01 unique (role_code),
    constraint ck_scm_user_roles_01 check (
        role_code in (
            'ADMINISTRATOR',
            'WAREHOUSE_MANAGER',
            'INVENTORY_CONTROLLER',
            'OPERATIONS_USER',
            'QUALITY_USER',
            'BUSINESS_VIEWER'
        )
    ),
    constraint ck_scm_user_roles_02 check (
        role_scope_code in (
            'ENTERPRISE',
            'WAREHOUSE',
            'QUALITY',
            'FINANCE',
            'ADMIN'
        )
    ),
    constraint ck_scm_user_roles_03 check (approval_authority_level >= 0)
);

create table scm_application_users (
    application_user_id number generated always as identity (start with 1 increment by 1 cache 100),
    user_name varchar2(128 char) not null,
    full_name varchar2(200 char) not null,
    email_address varchar2(320 char),
    user_status_code varchar2(20 char) default 'ACTIVE' not null,
    default_warehouse_id number,
    manager_user_id number,
    user_notes varchar2(500 char),
    constraint pk_scm_application_users primary key (application_user_id),
    constraint uq_scm_application_users_01 unique (user_name),
    constraint fk_scm_application_users_01 foreign key (default_warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_application_users_02 foreign key (manager_user_id)
        references scm_application_users (application_user_id),
    constraint ck_scm_application_users_01 check (user_status_code in ('ACTIVE', 'INACTIVE', 'LOCKED'))
);

create table scm_user_role_assignments (
    user_role_assignment_id number generated always as identity (start with 1 increment by 1 cache 100),
    application_user_id number not null,
    user_role_id number not null,
    warehouse_id number,
    assignment_status_code varchar2(20 char) default 'ACTIVE' not null,
    authority_level_override number(4),
    effective_from_date date default trunc(sysdate) not null,
    effective_to_date date,
    assigned_by_user_id number,
    is_primary_role number(1) default 0 not null,
    assignment_notes varchar2(500 char),
    constraint pk_scm_user_role_assignments primary key (user_role_assignment_id),
    constraint fk_scm_user_role_assignments_01 foreign key (application_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_user_role_assignments_02 foreign key (user_role_id)
        references scm_user_roles (user_role_id),
    constraint fk_scm_user_role_assignments_03 foreign key (warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_user_role_assignments_04 foreign key (assigned_by_user_id)
        references scm_application_users (application_user_id),
    constraint ck_scm_user_role_assignments_01 check (assignment_status_code in ('ACTIVE', 'INACTIVE')),
    constraint ck_scm_user_role_assignments_02 check (effective_to_date is null or effective_to_date >= effective_from_date),
    constraint ck_scm_user_role_assignments_03 check (authority_level_override is null or authority_level_override >= 0)
);

create table scm_business_lists (
    business_list_id number generated always as identity (start with 1 increment by 1 cache 100),
    list_code varchar2(50 char) not null,
    list_name varchar2(200 char) not null,
    list_status_code varchar2(20 char) default 'ACTIVE' not null,
    constraint pk_scm_business_lists primary key (business_list_id),
    constraint uq_scm_business_lists_01 unique (list_code),
    constraint ck_scm_business_lists_01 check (list_status_code in ('ACTIVE', 'INACTIVE'))
);

create table scm_business_list_values (
    business_list_value_id number generated always as identity (start with 1 increment by 1 cache 100),
    business_list_id number not null,
    value_code varchar2(50 char) not null,
    value_name varchar2(200 char) not null,
    display_sequence number(10) default 10 not null,
    is_active number(1) default 1 not null,
    constraint pk_scm_business_list_values primary key (business_list_value_id),
    constraint uq_scm_business_list_values_01 unique (business_list_id, value_code),
    constraint fk_scm_business_list_values_01 foreign key (business_list_id)
        references scm_business_lists (business_list_id)
);

------------------------------------------------------------------------------
-- 2. Warehouse and item masters
------------------------------------------------------------------------------

create table scm_warehouse_areas (
    warehouse_area_id number generated always as identity (start with 1 increment by 1 cache 100),
    warehouse_id number not null,
    area_code varchar2(30 char) not null,
    area_name varchar2(200 char) not null,
    area_type_code varchar2(20 char) not null,
    area_status_code varchar2(20 char) default 'ACTIVE' not null,
    sequence_number number(10) default 10 not null,
    notes varchar2(500 char),
    constraint pk_scm_warehouse_areas primary key (warehouse_area_id),
    constraint uq_scm_warehouse_areas_01 unique (warehouse_id, area_code),
    constraint fk_scm_warehouse_areas_01 foreign key (warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint ck_scm_warehouse_areas_01 check (area_type_code in ('RECEIVING', 'STORAGE', 'PICKING', 'QUARANTINE', 'RETURNS', 'DISPATCH', 'STAGING')),
    constraint ck_scm_warehouse_areas_02 check (area_status_code in ('ACTIVE', 'INACTIVE', 'BLOCKED'))
);

create table scm_storage_locations (
    storage_location_id number generated always as identity (start with 1 increment by 1 cache 100),
    warehouse_id number not null,
    warehouse_area_id number not null,
    parent_location_id number,
    location_code varchar2(50 char) not null,
    location_name varchar2(200 char) not null,
    location_type_code varchar2(20 char) not null,
    location_status_code varchar2(20 char) default 'ACTIVE' not null,
    aisle_code varchar2(30 char),
    bay_code varchar2(30 char),
    level_code varchar2(30 char),
    position_code varchar2(30 char),
    is_pickable number(1) default 0 not null,
    is_active number(1) default 1 not null,
    constraint pk_scm_storage_locations primary key (storage_location_id),
    constraint uq_scm_storage_locations_01 unique (warehouse_id, location_code),
    constraint fk_scm_storage_locations_01 foreign key (warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_storage_locations_02 foreign key (warehouse_area_id)
        references scm_warehouse_areas (warehouse_area_id),
    constraint fk_scm_storage_locations_03 foreign key (parent_location_id)
        references scm_storage_locations (storage_location_id),
    constraint ck_scm_storage_locations_01 check (location_type_code in ('RECEIVING', 'STORAGE', 'PICKING', 'QUARANTINE', 'RETURNS', 'DISPATCH', 'STAGING', 'BIN')),
    constraint ck_scm_storage_locations_02 check (location_status_code in ('ACTIVE', 'INACTIVE', 'BLOCKED'))
);

create table scm_items (
    item_id number generated always as identity (start with 1 increment by 1 cache 100),
    item_code varchar2(50 char) not null,
    item_name varchar2(200 char) not null,
    item_description varchar2(1000 char),
    item_category_code varchar2(30 char) not null,
    base_uom_code varchar2(10 char) not null,
    item_status_code varchar2(20 char) default 'ACTIVE' not null,
    lot_control_flag number(1) default 0 not null,
    serial_control_flag number(1) default 0 not null,
    expiry_control_flag number(1) default 0 not null,
    fragile_flag number(1) default 0 not null,
    high_value_flag number(1) default 0 not null,
    hazardous_flag number(1) default 0 not null,
    temperature_control_flag number(1) default 0 not null,
    restricted_item_flag number(1) default 0 not null,
    owner_customer_partner_id number,
    created_at timestamp with time zone default systimestamp not null,
    created_by varchar2(128 char) default sys_context('USERENV','SESSION_USER') not null,
    constraint pk_scm_items primary key (item_id),
    constraint uq_scm_items_01 unique (item_code),
    constraint fk_scm_items_01 foreign key (owner_customer_partner_id)
        references scm_business_partners (business_partner_id),
    constraint ck_scm_items_01 check (item_status_code in ('ACTIVE', 'INACTIVE', 'BLOCKED'))
);

create table scm_item_warehouse_policies (
    item_warehouse_policy_id number generated always as identity (start with 1 increment by 1 cache 100),
    item_id number not null,
    warehouse_id number not null,
    minimum_stock_quantity number(14,4) default 0 not null,
    reorder_point_quantity number(18,4),
    reorder_target_quantity number(18,4),
    safety_stock_quantity number(18,4),
    replenishment_lead_time_days number(6),
    low_stock_alert_enabled_flag number(1) default 1 not null,
    is_active number(1) default 1 not null,
    constraint pk_scm_item_warehouse_policies primary key (item_warehouse_policy_id),
    constraint uq_scm_item_warehouse_policies_01 unique (item_id, warehouse_id),
    constraint fk_scm_item_warehouse_policies_01 foreign key (item_id)
        references scm_items (item_id),
    constraint fk_scm_item_warehouse_policies_02 foreign key (warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint ck_scm_item_warehouse_policies_01 check (minimum_stock_quantity >= 0),
    constraint ck_scm_item_warehouse_policies_02 check (reorder_point_quantity is null or reorder_point_quantity >= 0),
    constraint ck_scm_item_warehouse_policies_03 check (reorder_target_quantity is null or reorder_target_quantity >= 0),
    constraint ck_scm_item_warehouse_policies_04 check (safety_stock_quantity is null or safety_stock_quantity >= 0),
    constraint ck_scm_item_warehouse_policies_05 check (replenishment_lead_time_days is null or replenishment_lead_time_days >= 0),
    constraint ck_scm_item_warehouse_policies_06 check (
        reorder_point_quantity is null
        or reorder_target_quantity is null
        or reorder_point_quantity <= reorder_target_quantity
    ),
    constraint ck_scm_item_warehouse_policies_07 check (
        safety_stock_quantity is null
        or reorder_point_quantity is null
        or safety_stock_quantity <= reorder_point_quantity
    )
);

create table scm_replenishment_alerts (
    replenishment_alert_id number generated always as identity (start with 1 increment by 1 cache 100),
    alert_number varchar2(30 char) not null,
    warehouse_id number not null,
    item_id number not null,
    item_warehouse_policy_id number,
    pick_location_id number,
    reserve_location_id number,
    alert_type_code varchar2(30 char) not null,
    alert_status_code varchar2(20 char) default 'OPEN' not null,
    priority_code varchar2(20 char) default 'MEDIUM' not null,
    available_quantity number(18,4),
    trigger_quantity number(18,4),
    target_quantity number(18,4),
    recommended_replenishment_quantity number(18,4),
    raised_at timestamp with time zone default systimestamp not null,
    reviewed_at timestamp with time zone,
    reviewed_by_user_id number,
    alert_notes varchar2(1000 char),
    constraint pk_scm_replenishment_alerts primary key (replenishment_alert_id),
    constraint uq_scm_replenishment_alerts_01 unique (alert_number),
    constraint fk_scm_replenishment_alerts_01 foreign key (warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_replenishment_alerts_02 foreign key (item_id)
        references scm_items (item_id),
    constraint fk_scm_replenishment_alerts_03 foreign key (item_warehouse_policy_id)
        references scm_item_warehouse_policies (item_warehouse_policy_id),
    constraint fk_scm_replenishment_alerts_04 foreign key (pick_location_id)
        references scm_storage_locations (storage_location_id),
    constraint fk_scm_replenishment_alerts_05 foreign key (reserve_location_id)
        references scm_storage_locations (storage_location_id),
    constraint fk_scm_replenishment_alerts_06 foreign key (reviewed_by_user_id)
        references scm_application_users (application_user_id),
    constraint ck_scm_replenishment_alerts_01 check (
        alert_type_code in (
            'LOW_STOCK',
            'OUT_OF_STOCK',
            'PICK_FACE_REPLENISHMENT',
            'AGING_REVIEW',
            'SHORT_DATED_REVIEW'
        )
    ),
    constraint ck_scm_replenishment_alerts_02 check (
        alert_status_code in (
            'OPEN',
            'IN_REVIEW',
            'ACTIONED',
            'CLOSED',
            'SUPPRESSED'
        )
    ),
    constraint ck_scm_replenishment_alerts_03 check (
        priority_code in (
            'LOW',
            'MEDIUM',
            'HIGH',
            'CRITICAL'
        )
    ),
    constraint ck_scm_replenishment_alerts_04 check (available_quantity is null or available_quantity >= 0),
    constraint ck_scm_replenishment_alerts_05 check (trigger_quantity is null or trigger_quantity >= 0),
    constraint ck_scm_replenishment_alerts_06 check (target_quantity is null or target_quantity >= 0),
    constraint ck_scm_replenishment_alerts_07 check (
        recommended_replenishment_quantity is null
        or recommended_replenishment_quantity >= 0
    )
);

------------------------------------------------------------------------------
-- 3. Inventory state and traceability
------------------------------------------------------------------------------

create table scm_inventory_lots (
    inventory_lot_id number generated always as identity (start with 1 increment by 1 cache 100),
    item_id number not null,
    lot_number varchar2(80 char) not null,
    supplier_lot_number varchar2(80 char),
    received_on_date date,
    best_before_date date,
    expiry_on_date date,
    lot_status_code varchar2(20 char) default 'ACTIVE' not null,
    constraint pk_scm_inventory_lots primary key (inventory_lot_id),
    constraint uq_scm_inventory_lots_01 unique (item_id, lot_number),
    constraint fk_scm_inventory_lots_01 foreign key (item_id)
        references scm_items (item_id),
    constraint ck_scm_inventory_lots_01 check (lot_status_code in ('ACTIVE', 'HOLD', 'EXPIRED', 'CLOSED'))
);

create table scm_item_serials (
    item_serial_id number generated always as identity (start with 1 increment by 1 cache 100),
    item_id number not null,
    serial_number varchar2(100 char) not null,
    inventory_lot_id number,
    current_warehouse_id number,
    current_storage_location_id number,
    current_status_code varchar2(20 char) default 'AVAILABLE' not null,
    serial_condition_code varchar2(20 char) default 'GOOD' not null,
    last_document_type varchar2(30 char),
    last_document_number varchar2(50 char),
    received_at timestamp with time zone,
    last_moved_at timestamp with time zone,
    is_active number(1) default 1 not null,
    constraint pk_scm_item_serials primary key (item_serial_id),
    constraint uq_scm_item_serials_01 unique (item_id, serial_number),
    constraint fk_scm_item_serials_01 foreign key (item_id)
        references scm_items (item_id),
    constraint fk_scm_item_serials_02 foreign key (inventory_lot_id)
        references scm_inventory_lots (inventory_lot_id),
    constraint fk_scm_item_serials_03 foreign key (current_warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_item_serials_04 foreign key (current_storage_location_id)
        references scm_storage_locations (storage_location_id),
    constraint ck_scm_item_serials_01 check (current_status_code in ('AVAILABLE', 'RESERVED', 'PICKED', 'PACKED', 'IN_TRANSIT', 'QUARANTINE', 'DAMAGED', 'BLOCKED', 'SHIPPED', 'WRITTEN_OFF')),
    constraint ck_scm_item_serials_02 check (serial_condition_code in ('GOOD', 'DAMAGED', 'SUSPECT', 'EXPIRED'))
);

create table scm_inventory_balances (
    inventory_balance_id number generated always as identity (start with 1 increment by 1 cache 100),
    warehouse_id number not null,
    storage_location_id number not null,
    item_id number not null,
    inventory_lot_id number,
    stock_status_code varchar2(20 char) not null,
    quantity_on_hand number(14,4) default 0 not null,
    quantity_reserved number(14,4) default 0 not null,
    quantity_available number(14,4) default 0 not null,
    last_counted_at timestamp with time zone,
    last_moved_at timestamp with time zone,
    constraint pk_scm_inventory_balances primary key (inventory_balance_id),
    constraint uq_scm_inventory_balances_01 unique (warehouse_id, storage_location_id, item_id, inventory_lot_id, stock_status_code),
    constraint fk_scm_inventory_balances_01 foreign key (warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_inventory_balances_02 foreign key (storage_location_id)
        references scm_storage_locations (storage_location_id),
    constraint fk_scm_inventory_balances_03 foreign key (item_id)
        references scm_items (item_id),
    constraint fk_scm_inventory_balances_04 foreign key (inventory_lot_id)
        references scm_inventory_lots (inventory_lot_id),
    constraint ck_scm_inventory_balances_01 check (stock_status_code in ('AVAILABLE', 'RESERVED', 'PICKED', 'PACKED', 'IN_TRANSIT', 'QUARANTINE', 'DAMAGED', 'BLOCKED')),
    constraint ck_scm_inventory_balances_02 check (quantity_on_hand >= 0 and quantity_reserved >= 0 and quantity_available >= 0)
);

------------------------------------------------------------------------------
-- 4. Operational documents
------------------------------------------------------------------------------

create table scm_inbound_receipts (
    inbound_receipt_id number generated always as identity (start with 1 increment by 1 cache 100),
    receipt_number varchar2(30 char) not null,
    receipt_source_code varchar2(20 char) not null,
    warehouse_id number not null,
    source_partner_id number,
    source_site_id number,
    assigned_user_id number,
    receipt_status_code varchar2(20 char) default 'PLANNED' not null,
    review_status_code varchar2(20 char) default 'OPEN' not null,
    source_document_number varchar2(50 char),
    expected_arrival_at timestamp with time zone,
    actual_arrival_at timestamp with time zone,
    receiving_completed_at timestamp with time zone,
    received_by varchar2(128 char),
    received_by_user_id number,
    reviewed_by_user_id number,
    reviewed_at timestamp with time zone,
    review_reason_code varchar2(30 char),
    notes varchar2(1000 char),
    constraint pk_scm_inbound_receipts primary key (inbound_receipt_id),
    constraint uq_scm_inbound_receipts_01 unique (receipt_number),
    constraint fk_scm_inbound_receipts_01 foreign key (warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_inbound_receipts_02 foreign key (source_partner_id)
        references scm_business_partners (business_partner_id),
    constraint fk_scm_inbound_receipts_03 foreign key (source_site_id)
        references scm_partner_sites (partner_site_id),
    constraint fk_scm_inbound_receipts_04 foreign key (assigned_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_inbound_receipts_05 foreign key (received_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_inbound_receipts_06 foreign key (reviewed_by_user_id)
        references scm_application_users (application_user_id),
    constraint ck_scm_inbound_receipts_01 check (receipt_source_code in ('SUPPLIER', 'TRANSFER', 'CUSTOMER_RETURN', 'INTERNAL_RETURN', 'OTHER')),
    constraint ck_scm_inbound_receipts_02 check (receipt_status_code in ('PLANNED', 'ARRIVED', 'PART_RECEIVED', 'RECEIVED', 'REVIEW_REQUIRED', 'CANCELLED', 'CLOSED')),
    constraint ck_scm_inbound_receipts_03 check (review_status_code in ('OPEN', 'REVIEW_REQUIRED', 'APPROVED', 'REJECTED', 'RESOLVED'))
);

create table scm_inbound_receipt_lines (
    inbound_receipt_line_id number generated always as identity (start with 1 increment by 1 cache 100),
    inbound_receipt_id number not null,
    line_number number(10) not null,
    item_id number not null,
    inventory_lot_id number,
    receiving_location_id number not null,
    final_putaway_location_id number,
    expected_quantity number(14,4) default 0 not null,
    received_quantity number(14,4) default 0 not null,
    accepted_quantity number(14,4) default 0 not null,
    quarantine_quantity number(14,4) default 0 not null,
    damaged_quantity number(14,4) default 0 not null,
    shortage_quantity number(14,4) default 0 not null,
    overage_quantity number(14,4) default 0 not null,
    rejected_quantity number(14,4) default 0 not null,
    received_condition_code varchar2(20 char) default 'GOOD' not null,
    line_status_code varchar2(20 char) default 'OPEN' not null,
    discrepancy_reason_code varchar2(30 char),
    constraint pk_scm_inbound_receipt_lines primary key (inbound_receipt_line_id),
    constraint uq_scm_inbound_receipt_lines_01 unique (inbound_receipt_id, line_number),
    constraint fk_scm_inbound_receipt_lines_01 foreign key (inbound_receipt_id)
        references scm_inbound_receipts (inbound_receipt_id),
    constraint fk_scm_inbound_receipt_lines_02 foreign key (item_id)
        references scm_items (item_id),
    constraint fk_scm_inbound_receipt_lines_03 foreign key (inventory_lot_id)
        references scm_inventory_lots (inventory_lot_id),
    constraint fk_scm_inbound_receipt_lines_04 foreign key (receiving_location_id)
        references scm_storage_locations (storage_location_id),
    constraint fk_scm_inbound_receipt_lines_05 foreign key (final_putaway_location_id)
        references scm_storage_locations (storage_location_id),
    constraint ck_scm_inbound_receipt_lines_01 check (received_condition_code in ('GOOD', 'DAMAGED', 'SUSPECT', 'MISMATCH', 'SHORT', 'OVER')),
    constraint ck_scm_inbound_receipt_lines_02 check (line_status_code in ('OPEN', 'PART_RECEIVED', 'RECEIVED', 'REVIEW_REQUIRED', 'CLOSED')),
    constraint ck_scm_inbound_receipt_lines_03 check (
        expected_quantity >= 0
        and received_quantity >= 0
        and accepted_quantity >= 0
        and quarantine_quantity >= 0
        and damaged_quantity >= 0
        and shortage_quantity >= 0
        and overage_quantity >= 0
        and rejected_quantity >= 0
    )
);

create table scm_stock_movements (
    stock_movement_id number generated always as identity (start with 1 increment by 1 cache 100),
    movement_number varchar2(30 char) not null,
    movement_type_code varchar2(30 char) default 'MOVE' not null,
    warehouse_id number not null,
    source_location_id number,
    destination_location_id number,
    item_id number not null,
    inventory_lot_id number,
    item_serial_id number,
    from_status_code varchar2(20 char),
    to_status_code varchar2(20 char),
    requested_quantity number(14,4) not null,
    moved_quantity number(14,4) default 0 not null,
    movement_status_code varchar2(20 char) default 'OPEN' not null,
    review_status_code varchar2(20 char) default 'OPEN' not null,
    reason_code varchar2(30 char) not null,
    assigned_user_id number,
    requested_by_user_id number not null,
    requested_at timestamp with time zone default systimestamp not null,
    confirmed_by_user_id number,
    confirmed_at timestamp with time zone,
    reviewed_by_user_id number,
    reviewed_at timestamp with time zone,
    review_reason_code varchar2(30 char),
    source_document_type varchar2(30 char),
    source_document_number varchar2(50 char),
    notes varchar2(1000 char),
    constraint pk_scm_stock_movements primary key (stock_movement_id),
    constraint uq_scm_stock_movements_01 unique (movement_number),
    constraint fk_scm_stock_movements_01 foreign key (warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_stock_movements_02 foreign key (source_location_id)
        references scm_storage_locations (storage_location_id),
    constraint fk_scm_stock_movements_03 foreign key (destination_location_id)
        references scm_storage_locations (storage_location_id),
    constraint fk_scm_stock_movements_04 foreign key (item_id)
        references scm_items (item_id),
    constraint fk_scm_stock_movements_05 foreign key (inventory_lot_id)
        references scm_inventory_lots (inventory_lot_id),
    constraint fk_scm_stock_movements_06 foreign key (item_serial_id)
        references scm_item_serials (item_serial_id),
    constraint fk_scm_stock_movements_07 foreign key (assigned_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_movements_08 foreign key (requested_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_movements_09 foreign key (confirmed_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_movements_10 foreign key (reviewed_by_user_id)
        references scm_application_users (application_user_id),
    constraint ck_scm_stock_movements_01 check (movement_type_code in ('PUTAWAY', 'MOVE', 'REPLENISHMENT', 'STATUS_CHANGE')),
    constraint ck_scm_stock_movements_02 check (movement_status_code in ('OPEN', 'RELEASED', 'IN_PROGRESS', 'COMPLETED', 'REVIEW_REQUIRED', 'CANCELLED')),
    constraint ck_scm_stock_movements_03 check (review_status_code in ('OPEN', 'REVIEW_REQUIRED', 'APPROVED', 'REJECTED', 'RESOLVED')),
    constraint ck_scm_stock_movements_04 check (from_status_code is null or from_status_code in ('AVAILABLE', 'RESERVED', 'PICKED', 'PACKED', 'IN_TRANSIT', 'QUARANTINE', 'DAMAGED', 'BLOCKED')),
    constraint ck_scm_stock_movements_05 check (to_status_code is null or to_status_code in ('AVAILABLE', 'RESERVED', 'PICKED', 'PACKED', 'IN_TRANSIT', 'QUARANTINE', 'DAMAGED', 'BLOCKED')),
    constraint ck_scm_stock_movements_06 check (requested_quantity > 0 and moved_quantity >= 0 and moved_quantity <= requested_quantity),
    constraint ck_scm_stock_movements_07 check (source_location_id is null or destination_location_id is null or source_location_id <> destination_location_id)
);

create table scm_stock_transfers (
    stock_transfer_id number generated always as identity (start with 1 increment by 1 cache 100),
    transfer_number varchar2(30 char) not null,
    from_warehouse_id number not null,
    to_warehouse_id number not null,
    assigned_user_id number,
    transfer_status_code varchar2(20 char) default 'DRAFT' not null,
    review_status_code varchar2(20 char) default 'OPEN' not null,
    requested_ship_at timestamp with time zone,
    actual_shipped_at timestamp with time zone,
    expected_receipt_at timestamp with time zone,
    actual_received_at timestamp with time zone,
    requested_by_user_id number not null,
    reviewed_by_user_id number,
    reviewed_at timestamp with time zone,
    review_reason_code varchar2(30 char),
    reason_code varchar2(30 char) not null,
    notes varchar2(1000 char),
    constraint pk_scm_stock_transfers primary key (stock_transfer_id),
    constraint uq_scm_stock_transfers_01 unique (transfer_number),
    constraint fk_scm_stock_transfers_01 foreign key (from_warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_stock_transfers_02 foreign key (to_warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_stock_transfers_03 foreign key (assigned_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_transfers_04 foreign key (requested_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_transfers_05 foreign key (reviewed_by_user_id)
        references scm_application_users (application_user_id),
    constraint ck_scm_stock_transfers_01 check (from_warehouse_id <> to_warehouse_id),
    constraint ck_scm_stock_transfers_02 check (transfer_status_code in ('DRAFT', 'RELEASED', 'IN_TRANSIT', 'PART_RECEIVED', 'REVIEW_REQUIRED', 'COMPLETED', 'CANCELLED')),
    constraint ck_scm_stock_transfers_03 check (review_status_code in ('OPEN', 'REVIEW_REQUIRED', 'APPROVED', 'REJECTED', 'RESOLVED'))
);

create table scm_stock_transfer_lines (
    stock_transfer_line_id number generated always as identity (start with 1 increment by 1 cache 100),
    stock_transfer_id number not null,
    line_number number(10) not null,
    item_id number not null,
    inventory_lot_id number,
    source_location_id number not null,
    destination_location_id number,
    requested_quantity number(14,4) default 0 not null,
    shipped_quantity number(14,4) default 0 not null,
    received_quantity number(14,4) default 0 not null,
    quantity_discrepancy number(14,4) default 0 not null,
    line_status_code varchar2(20 char) default 'OPEN' not null,
    discrepancy_reason_code varchar2(30 char),
    constraint pk_scm_stock_transfer_lines primary key (stock_transfer_line_id),
    constraint uq_scm_stock_transfer_lines_01 unique (stock_transfer_id, line_number),
    constraint fk_scm_stock_transfer_lines_01 foreign key (stock_transfer_id)
        references scm_stock_transfers (stock_transfer_id),
    constraint fk_scm_stock_transfer_lines_02 foreign key (item_id)
        references scm_items (item_id),
    constraint fk_scm_stock_transfer_lines_03 foreign key (inventory_lot_id)
        references scm_inventory_lots (inventory_lot_id),
    constraint fk_scm_stock_transfer_lines_04 foreign key (source_location_id)
        references scm_storage_locations (storage_location_id),
    constraint fk_scm_stock_transfer_lines_05 foreign key (destination_location_id)
        references scm_storage_locations (storage_location_id),
    constraint ck_scm_stock_transfer_lines_01 check (line_status_code in ('OPEN', 'SHIPPED', 'PART_RECEIVED', 'REVIEW_REQUIRED', 'COMPLETED', 'CANCELLED')),
    constraint ck_scm_stock_transfer_lines_02 check (requested_quantity >= 0 and shipped_quantity >= 0 and received_quantity >= 0)
);

create table scm_outbound_orders (
    outbound_order_id number generated always as identity (start with 1 increment by 1 cache 100),
    outbound_order_number varchar2(30 char) not null,
    order_type_code varchar2(20 char) not null,
    ship_from_warehouse_id number not null,
    customer_partner_id number,
    ship_to_site_id number,
    carrier_partner_id number,
    assigned_user_id number,
    outbound_status_code varchar2(20 char) default 'NEW' not null,
    priority_code varchar2(20 char) default 'MEDIUM' not null,
    order_date date default trunc(sysdate) not null,
    requested_ship_at timestamp with time zone,
    picked_by_user_id number,
    packed_by_user_id number,
    dispatched_at timestamp with time zone,
    dispatched_by_user_id number,
    source_document_number varchar2(50 char),
    dispatch_reference varchar2(50 char),
    notes varchar2(1000 char),
    constraint pk_scm_outbound_orders primary key (outbound_order_id),
    constraint uq_scm_outbound_orders_01 unique (outbound_order_number),
    constraint fk_scm_outbound_orders_01 foreign key (ship_from_warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_outbound_orders_02 foreign key (customer_partner_id)
        references scm_business_partners (business_partner_id),
    constraint fk_scm_outbound_orders_03 foreign key (ship_to_site_id)
        references scm_partner_sites (partner_site_id),
    constraint fk_scm_outbound_orders_04 foreign key (carrier_partner_id)
        references scm_business_partners (business_partner_id),
    constraint fk_scm_outbound_orders_05 foreign key (assigned_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_outbound_orders_06 foreign key (picked_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_outbound_orders_07 foreign key (packed_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_outbound_orders_08 foreign key (dispatched_by_user_id)
        references scm_application_users (application_user_id),
    constraint ck_scm_outbound_orders_01 check (order_type_code in ('CUSTOMER_ORDER', 'INTERNAL_REQUEST')),
    constraint ck_scm_outbound_orders_02 check (outbound_status_code in ('NEW', 'RELEASED', 'ALLOCATED', 'PICKING', 'PICKED', 'PACKED', 'DISPATCHED', 'REVIEW_REQUIRED', 'CANCELLED', 'CLOSED')),
    constraint ck_scm_outbound_orders_03 check (priority_code in ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL'))
);

create table scm_outbound_order_lines (
    outbound_order_line_id number generated always as identity (start with 1 increment by 1 cache 100),
    outbound_order_id number not null,
    line_number number(10) not null,
    item_id number not null,
    preferred_lot_id number,
    requested_quantity number(14,4) default 0 not null,
    reserved_quantity number(14,4) default 0 not null,
    picked_quantity number(14,4) default 0 not null,
    packed_quantity number(14,4) default 0 not null,
    dispatched_quantity number(14,4) default 0 not null,
    short_quantity number(14,4) default 0 not null,
    allocation_status_code varchar2(20 char) default 'OPEN' not null,
    constraint pk_scm_outbound_order_lines primary key (outbound_order_line_id),
    constraint uq_scm_outbound_order_lines_01 unique (outbound_order_id, line_number),
    constraint fk_scm_outbound_order_lines_01 foreign key (outbound_order_id)
        references scm_outbound_orders (outbound_order_id),
    constraint fk_scm_outbound_order_lines_02 foreign key (item_id)
        references scm_items (item_id),
    constraint fk_scm_outbound_order_lines_03 foreign key (preferred_lot_id)
        references scm_inventory_lots (inventory_lot_id),
    constraint ck_scm_outbound_order_lines_01 check (allocation_status_code in ('OPEN', 'ALLOCATED', 'PART_PICKED', 'PICKED', 'PACKED', 'PART_DISPATCHED', 'DISPATCHED', 'SHORT', 'CANCELLED')),
    constraint ck_scm_outbound_order_lines_02 check (
        requested_quantity >= 0
        and reserved_quantity >= 0
        and picked_quantity >= 0
        and packed_quantity >= 0
        and dispatched_quantity >= 0
        and short_quantity >= 0
    )
);

create table scm_stock_allocations (
    stock_allocation_id number generated always as identity (start with 1 increment by 1 cache 100),
    allocation_number varchar2(40 char) not null,
    outbound_order_line_id number not null,
    inventory_balance_id number not null,
    warehouse_id number not null,
    source_location_id number not null,
    item_id number not null,
    inventory_lot_id number,
    item_serial_id number,
    allocation_sequence number(10) not null,
    allocation_method_code varchar2(20 char) default 'FIFO' not null,
    allocation_status_code varchar2(20 char) default 'OPEN' not null,
    allocated_quantity number(14,4) default 0 not null,
    reserved_quantity number(14,4) default 0 not null,
    picked_quantity number(14,4) default 0 not null,
    packed_quantity number(14,4) default 0 not null,
    dispatched_quantity number(14,4) default 0 not null,
    short_quantity number(14,4) default 0 not null,
    fifo_basis_date date,
    allocated_by_user_id number,
    allocated_at timestamp with time zone,
    picked_by_user_id number,
    picked_at timestamp with time zone,
    packed_by_user_id number,
    packed_at timestamp with time zone,
    dispatched_by_user_id number,
    dispatched_at timestamp with time zone,
    constraint pk_scm_stock_allocations primary key (stock_allocation_id),
    constraint uq_scm_stock_allocations_01 unique (allocation_number),
    constraint uq_scm_stock_allocations_02 unique (outbound_order_line_id, allocation_sequence),
    constraint fk_scm_stock_allocations_01 foreign key (outbound_order_line_id)
        references scm_outbound_order_lines (outbound_order_line_id),
    constraint fk_scm_stock_allocations_02 foreign key (inventory_balance_id)
        references scm_inventory_balances (inventory_balance_id),
    constraint fk_scm_stock_allocations_03 foreign key (warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_stock_allocations_04 foreign key (source_location_id)
        references scm_storage_locations (storage_location_id),
    constraint fk_scm_stock_allocations_05 foreign key (item_id)
        references scm_items (item_id),
    constraint fk_scm_stock_allocations_06 foreign key (inventory_lot_id)
        references scm_inventory_lots (inventory_lot_id),
    constraint fk_scm_stock_allocations_07 foreign key (item_serial_id)
        references scm_item_serials (item_serial_id),
    constraint fk_scm_stock_allocations_08 foreign key (allocated_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_allocations_09 foreign key (picked_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_allocations_10 foreign key (packed_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_allocations_11 foreign key (dispatched_by_user_id)
        references scm_application_users (application_user_id),
    constraint ck_scm_stock_allocations_01 check (allocation_sequence > 0),
    constraint ck_scm_stock_allocations_02 check (allocation_method_code in ('FIFO', 'MANUAL', 'SPECIFIC_LOT')),
    constraint ck_scm_stock_allocations_03 check (allocation_status_code in ('OPEN', 'ALLOCATED', 'PART_PICKED', 'PICKED', 'PACKED', 'PART_DISPATCHED', 'DISPATCHED', 'SHORT', 'CANCELLED')),
    constraint ck_scm_stock_allocations_04 check (
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
    )
);

create table scm_returns (
    return_id number generated always as identity (start with 1 increment by 1 cache 100),
    return_number varchar2(30 char) not null,
    return_type_code varchar2(20 char) not null,
    warehouse_id number not null,
    source_partner_id number,
    source_site_id number,
    related_outbound_order_id number,
    assigned_user_id number,
    return_status_code varchar2(20 char) default 'NEW' not null,
    review_status_code varchar2(20 char) default 'OPEN' not null,
    return_reason_code varchar2(30 char) not null,
    expected_arrival_at timestamp with time zone,
    received_at timestamp with time zone,
    received_by_user_id number,
    assessed_at timestamp with time zone,
    assessed_by_user_id number,
    reviewed_by_user_id number,
    reviewed_at timestamp with time zone,
    review_reason_code varchar2(30 char),
    notes varchar2(1000 char),
    constraint pk_scm_returns primary key (return_id),
    constraint uq_scm_returns_01 unique (return_number),
    constraint fk_scm_returns_01 foreign key (warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_returns_02 foreign key (source_partner_id)
        references scm_business_partners (business_partner_id),
    constraint fk_scm_returns_03 foreign key (source_site_id)
        references scm_partner_sites (partner_site_id),
    constraint fk_scm_returns_04 foreign key (related_outbound_order_id)
        references scm_outbound_orders (outbound_order_id),
    constraint fk_scm_returns_05 foreign key (assigned_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_returns_06 foreign key (received_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_returns_07 foreign key (assessed_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_returns_08 foreign key (reviewed_by_user_id)
        references scm_application_users (application_user_id),
    constraint ck_scm_returns_01 check (return_type_code in ('CUSTOMER_RETURN', 'DELIVERY_RETURN', 'INTERNAL_RETURN', 'SUPPLIER_RETURN')),
    constraint ck_scm_returns_02 check (return_status_code in ('NEW', 'RECEIVED', 'UNDER_REVIEW', 'REVIEW_REQUIRED', 'DISPOSITIONED', 'CLOSED', 'CANCELLED')),
    constraint ck_scm_returns_03 check (review_status_code in ('OPEN', 'REVIEW_REQUIRED', 'APPROVED', 'REJECTED', 'RESOLVED'))
);

create table scm_return_lines (
    return_line_id number generated always as identity (start with 1 increment by 1 cache 100),
    return_id number not null,
    line_number number(10) not null,
    item_id number not null,
    inventory_lot_id number,
    expected_quantity number(14,4) default 0 not null,
    received_quantity number(14,4) default 0 not null,
    returned_condition_code varchar2(20 char) default 'GOOD' not null,
    reusable_quantity number(14,4) default 0 not null,
    quarantine_quantity number(14,4) default 0 not null,
    damaged_quantity number(14,4) default 0 not null,
    writeoff_quantity number(14,4) default 0 not null,
    disposition_code varchar2(20 char) default 'QUARANTINE' not null,
    constraint pk_scm_return_lines primary key (return_line_id),
    constraint uq_scm_return_lines_01 unique (return_id, line_number),
    constraint fk_scm_return_lines_01 foreign key (return_id)
        references scm_returns (return_id),
    constraint fk_scm_return_lines_02 foreign key (item_id)
        references scm_items (item_id),
    constraint fk_scm_return_lines_03 foreign key (inventory_lot_id)
        references scm_inventory_lots (inventory_lot_id),
    constraint ck_scm_return_lines_01 check (returned_condition_code in ('GOOD', 'DAMAGED', 'SUSPECT', 'EXPIRED', 'INCOMPLETE')),
    constraint ck_scm_return_lines_02 check (disposition_code in ('RETURN_TO_STOCK', 'QUARANTINE', 'WRITE_OFF')),
    constraint ck_scm_return_lines_03 check (
        expected_quantity >= 0
        and received_quantity >= 0
        and reusable_quantity >= 0
        and quarantine_quantity >= 0
        and damaged_quantity >= 0
        and writeoff_quantity >= 0
    )
);

create table scm_stock_counts (
    stock_count_id number generated always as identity (start with 1 increment by 1 cache 100),
    count_number varchar2(30 char) not null,
    warehouse_id number not null,
    warehouse_area_id number,
    storage_location_id number,
    item_id number,
    assigned_user_id number,
    count_scope_code varchar2(20 char) not null,
    count_status_code varchar2(20 char) default 'PLANNED' not null,
    review_status_code varchar2(20 char) default 'OPEN' not null,
    planned_start_at timestamp with time zone,
    planned_end_at timestamp with time zone,
    started_at timestamp with time zone,
    completed_at timestamp with time zone,
    requested_by_user_id number not null,
    reviewed_by_user_id number,
    reviewed_at timestamp with time zone,
    review_reason_code varchar2(30 char),
    notes varchar2(1000 char),
    constraint pk_scm_stock_counts primary key (stock_count_id),
    constraint uq_scm_stock_counts_01 unique (count_number),
    constraint fk_scm_stock_counts_01 foreign key (warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_stock_counts_02 foreign key (assigned_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_counts_03 foreign key (requested_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_counts_04 foreign key (reviewed_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_counts_05 foreign key (warehouse_area_id)
        references scm_warehouse_areas (warehouse_area_id),
    constraint fk_scm_stock_counts_06 foreign key (storage_location_id)
        references scm_storage_locations (storage_location_id),
    constraint fk_scm_stock_counts_07 foreign key (item_id)
        references scm_items (item_id),
    constraint ck_scm_stock_counts_01 check (count_scope_code in ('WAREHOUSE', 'AREA', 'LOCATION', 'ITEM')),
    constraint ck_scm_stock_counts_02 check (count_status_code in ('PLANNED', 'IN_PROGRESS', 'REVIEW_REQUIRED', 'COMPLETED', 'CANCELLED')),
    constraint ck_scm_stock_counts_03 check (review_status_code in ('OPEN', 'REVIEW_REQUIRED', 'APPROVED', 'REJECTED', 'RESOLVED')),
    constraint ck_scm_stock_counts_04 check (
        (count_scope_code = 'WAREHOUSE' and warehouse_area_id is null and storage_location_id is null and item_id is null)
        or (count_scope_code = 'AREA' and warehouse_area_id is not null and storage_location_id is null and item_id is null)
        or (count_scope_code = 'LOCATION' and warehouse_area_id is null and storage_location_id is not null and item_id is null)
        or (count_scope_code = 'ITEM' and warehouse_area_id is null and storage_location_id is null and item_id is not null)
    )
);

create table scm_stock_count_lines (
    stock_count_line_id number generated always as identity (start with 1 increment by 1 cache 100),
    stock_count_id number not null,
    line_number number(10) not null,
    item_id number not null,
    storage_location_id number not null,
    inventory_lot_id number,
    expected_quantity number(14,4) default 0 not null,
    counted_quantity number(14,4),
    variance_quantity number(14,4),
    variance_reason_code varchar2(30 char),
    first_counted_by_user_id number,
    first_counted_at timestamp with time zone,
    reviewed_by_user_id number,
    reviewed_at timestamp with time zone,
    resolution_code varchar2(30 char),
    line_status_code varchar2(20 char) default 'OPEN' not null,
    constraint pk_scm_stock_count_lines primary key (stock_count_line_id),
    constraint uq_scm_stock_count_lines_01 unique (stock_count_id, line_number),
    constraint fk_scm_stock_count_lines_01 foreign key (stock_count_id)
        references scm_stock_counts (stock_count_id),
    constraint fk_scm_stock_count_lines_02 foreign key (item_id)
        references scm_items (item_id),
    constraint fk_scm_stock_count_lines_03 foreign key (storage_location_id)
        references scm_storage_locations (storage_location_id),
    constraint fk_scm_stock_count_lines_04 foreign key (inventory_lot_id)
        references scm_inventory_lots (inventory_lot_id),
    constraint fk_scm_stock_count_lines_05 foreign key (first_counted_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_count_lines_06 foreign key (reviewed_by_user_id)
        references scm_application_users (application_user_id),
    constraint ck_scm_stock_count_lines_01 check (resolution_code is null or resolution_code in ('ACCEPTED', 'ADJUSTMENT_REQUIRED', 'RECOUNT_REQUIRED', 'WRITEOFF_REQUIRED')),
    constraint ck_scm_stock_count_lines_02 check (line_status_code in ('OPEN', 'COUNTED', 'REVIEW_REQUIRED', 'RESOLVED'))
);

create table scm_stock_adjustments (
    stock_adjustment_id number generated always as identity (start with 1 increment by 1 cache 100),
    adjustment_number varchar2(30 char) not null,
    warehouse_id number not null,
    assigned_user_id number,
    adjustment_type_code varchar2(30 char) not null,
    adjustment_status_code varchar2(20 char) default 'OPEN' not null,
    reason_code varchar2(30 char) not null,
    requested_by_user_id number not null,
    requested_at timestamp with time zone default systimestamp not null,
    reviewed_by_user_id number,
    reviewed_at timestamp with time zone,
    applied_by_user_id number,
    applied_at timestamp with time zone,
    notes varchar2(1000 char),
    constraint pk_scm_stock_adjustments primary key (stock_adjustment_id),
    constraint uq_scm_stock_adjustments_01 unique (adjustment_number),
    constraint fk_scm_stock_adjustments_01 foreign key (warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_stock_adjustments_02 foreign key (assigned_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_adjustments_03 foreign key (requested_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_adjustments_04 foreign key (reviewed_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_stock_adjustments_05 foreign key (applied_by_user_id)
        references scm_application_users (application_user_id),
    constraint ck_scm_stock_adjustments_01 check (adjustment_type_code in ('MANUAL_ADJUSTMENT', 'STATUS_CORRECTION', 'WRITE_OFF', 'COUNT_VARIANCE')),
    constraint ck_scm_stock_adjustments_02 check (adjustment_status_code in ('OPEN', 'REVIEW_REQUIRED', 'APPROVED', 'APPLIED', 'REJECTED', 'CANCELLED'))
);

create table scm_stock_adjustment_lines (
    stock_adjustment_line_id number generated always as identity (start with 1 increment by 1 cache 100),
    stock_adjustment_id number not null,
    line_number number(10) not null,
    item_id number not null,
    inventory_lot_id number,
    item_serial_id number,
    storage_location_id number not null,
    from_status_code varchar2(20 char),
    to_status_code varchar2(20 char),
    adjustment_direction_code varchar2(20 char) not null,
    adjustment_quantity number(14,4) not null,
    reason_description varchar2(500 char),
    constraint pk_scm_stock_adjustment_lines primary key (stock_adjustment_line_id),
    constraint uq_scm_stock_adjustment_lines_01 unique (stock_adjustment_id, line_number),
    constraint fk_scm_stock_adjustment_lines_01 foreign key (stock_adjustment_id)
        references scm_stock_adjustments (stock_adjustment_id),
    constraint fk_scm_stock_adjustment_lines_02 foreign key (item_id)
        references scm_items (item_id),
    constraint fk_scm_stock_adjustment_lines_03 foreign key (inventory_lot_id)
        references scm_inventory_lots (inventory_lot_id),
    constraint fk_scm_stock_adjustment_lines_04 foreign key (item_serial_id)
        references scm_item_serials (item_serial_id),
    constraint fk_scm_stock_adjustment_lines_05 foreign key (storage_location_id)
        references scm_storage_locations (storage_location_id),
    constraint ck_scm_stock_adjustment_lines_01 check (adjustment_direction_code in ('INCREASE', 'DECREASE', 'STATUS_CHANGE')),
    constraint ck_scm_stock_adjustment_lines_02 check (adjustment_quantity > 0),
    constraint ck_scm_stock_adjustment_lines_03 check (from_status_code is null or from_status_code in ('AVAILABLE', 'RESERVED', 'PICKED', 'PACKED', 'IN_TRANSIT', 'QUARANTINE', 'DAMAGED', 'BLOCKED')),
    constraint ck_scm_stock_adjustment_lines_04 check (to_status_code is null or to_status_code in ('AVAILABLE', 'RESERVED', 'PICKED', 'PACKED', 'IN_TRANSIT', 'QUARANTINE', 'DAMAGED', 'BLOCKED'))
);

------------------------------------------------------------------------------
-- 5. Review queue
------------------------------------------------------------------------------

create table scm_operational_exceptions (
    operational_exception_id number generated always as identity (start with 1 increment by 1 cache 100),
    exception_number varchar2(30 char) not null,
    exception_type_code varchar2(30 char) not null,
    related_record_type_code varchar2(30 char) not null,
    related_record_id number not null,
    related_line_number number,
    warehouse_id number not null,
    storage_location_id number,
    item_id number,
    inventory_lot_id number,
    item_serial_id number,
    affected_quantity number(14,4),
    review_status_code varchar2(20 char) default 'OPEN' not null,
    severity_code varchar2(20 char) default 'MEDIUM' not null,
    assigned_user_id number,
    reported_by_user_id number not null,
    reported_at timestamp with time zone default systimestamp not null,
    reviewed_by_user_id number,
    reviewed_at timestamp with time zone,
    resolution_code varchar2(30 char),
    exception_notes varchar2(1000 char),
    constraint pk_scm_operational_exceptions primary key (operational_exception_id),
    constraint uq_scm_operational_exceptions_01 unique (exception_number),
    constraint fk_scm_operational_exceptions_01 foreign key (warehouse_id)
        references scm_warehouses (warehouse_id),
    constraint fk_scm_operational_exceptions_02 foreign key (storage_location_id)
        references scm_storage_locations (storage_location_id),
    constraint fk_scm_operational_exceptions_03 foreign key (item_id)
        references scm_items (item_id),
    constraint fk_scm_operational_exceptions_04 foreign key (inventory_lot_id)
        references scm_inventory_lots (inventory_lot_id),
    constraint fk_scm_operational_exceptions_05 foreign key (item_serial_id)
        references scm_item_serials (item_serial_id),
    constraint fk_scm_operational_exceptions_06 foreign key (assigned_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_operational_exceptions_07 foreign key (reported_by_user_id)
        references scm_application_users (application_user_id),
    constraint fk_scm_operational_exceptions_08 foreign key (reviewed_by_user_id)
        references scm_application_users (application_user_id),
    constraint ck_scm_operational_exceptions_01 check (
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
    ),
    constraint ck_scm_operational_exceptions_02 check (
        related_record_type_code in (
            'RECEIPT',
            'TRANSFER',
            'OUTBOUND_ORDER',
            'RETURN',
            'COUNT',
            'ADJUSTMENT',
            'INVENTORY'
        )
    ),
    constraint ck_scm_operational_exceptions_03 check (review_status_code in ('OPEN', 'REVIEW_REQUIRED', 'APPROVED', 'REJECTED', 'RESOLVED')),
    constraint ck_scm_operational_exceptions_04 check (severity_code in ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL'))
);


------------------------------------------------------------------------------
-- 6. Derived history views
------------------------------------------------------------------------------

create or replace view scm_inventory_transactions as
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

create or replace view scm_serial_events as
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

------------------------------------------------------------------------------
-- 6. Supporting indexes
------------------------------------------------------------------------------

create index idx_scm_user_role_assignments_01
    on scm_user_role_assignments (application_user_id, warehouse_id, assignment_status_code);

create index idx_scm_inventory_balances_01
    on scm_inventory_balances (item_id, warehouse_id, stock_status_code);

create index idx_scm_inventory_balances_02
    on scm_inventory_balances (storage_location_id, item_id);

create index idx_scm_inbound_receipts_01
    on scm_inbound_receipts (warehouse_id, receipt_status_code, review_status_code);

create index idx_scm_stock_movements_01
    on scm_stock_movements (warehouse_id, movement_status_code, assigned_user_id);

create index idx_scm_stock_movements_02
    on scm_stock_movements (item_id, source_location_id, destination_location_id);

create index idx_scm_stock_movements_03
    on scm_stock_movements (source_document_type, source_document_number);

create index idx_scm_stock_transfers_01
    on scm_stock_transfers (from_warehouse_id, to_warehouse_id, transfer_status_code);

create index idx_scm_outbound_orders_01
    on scm_outbound_orders (ship_from_warehouse_id, outbound_status_code);

create index idx_scm_stock_allocations_01
    on scm_stock_allocations (outbound_order_line_id);

create index idx_scm_stock_allocations_02
    on scm_stock_allocations (inventory_balance_id);

create index idx_scm_stock_allocations_03
    on scm_stock_allocations (warehouse_id, item_id, allocation_status_code);

create index idx_scm_stock_allocations_04
    on scm_stock_allocations (fifo_basis_date, item_id, warehouse_id);

create index idx_scm_returns_01
    on scm_returns (warehouse_id, return_status_code, review_status_code);

create index idx_scm_stock_counts_01
    on scm_stock_counts (warehouse_id, count_status_code, review_status_code);

create index idx_scm_stock_adjustments_01
    on scm_stock_adjustments (warehouse_id, adjustment_status_code);

create index idx_scm_operational_exceptions_01
    on scm_operational_exceptions (warehouse_id, review_status_code, severity_code);


-- =============================================================================
-- Agent Views and Procedures
-- =============================================================================
-- The following views and procedure are used by the AI Procurement Agent tools
-- built in Labs 3 and 4. They encapsulate query logic in the database so that
-- the tool configurations in APEX remain simple and maintainable.
-- =============================================================================


-- ---------------------------------------------------------------------------
-- View: scm_v_user_context
-- Used by: get_user_context tool (Lab 3, Task 2)
-- ---------------------------------------------------------------------------
create or replace view scm_v_user_context as
select u.user_name,
       u.full_name,
       u.email_address,
       r.role_name,
       r.role_scope_code,
       coalesce(a.authority_level_override,
                r.approval_authority_level)   as approval_authority_level,
       w.warehouse_name,
       w.warehouse_code,
       w.warehouse_id,
       mgr.full_name                          as manager_name,
       mgr.email_address                      as manager_email
  from scm_application_users     u
  join scm_user_role_assignments  a   on a.application_user_id   = u.application_user_id
                                     and a.assignment_status_code = 'ACTIVE'
                                     and a.is_primary_role        = true
  join scm_user_roles             r   on r.user_role_id           = a.user_role_id
  left join scm_warehouses        w   on w.warehouse_id           = u.default_warehouse_id
  left join scm_application_users mgr on mgr.application_user_id  = u.manager_user_id;


-- ---------------------------------------------------------------------------
-- View: scm_v_stocks_at_risk
-- Used by: get_stocks_at_risk tool (Lab 4, Task 1)
-- CTEs pre-compute available balances and highest alert priority per
-- item/warehouse to avoid ORA-01799 (subquery in outer-join ON clause).
-- ---------------------------------------------------------------------------
create or replace view scm_v_stocks_at_risk as
with balances as (
    select sl.warehouse_id,
           ib.item_id,
           sum(ib.quantity_available) as total_available
      from scm_inventory_balances  ib
      join scm_storage_locations   sl on sl.storage_location_id = ib.storage_location_id
     where ib.stock_status_code = 'AVAILABLE'
     group by sl.warehouse_id, ib.item_id
),
highest_alert as (
    select item_id,
           warehouse_id,
           decode(max(decode(priority_code,
                       'CRITICAL',4,'HIGH',3,'MEDIUM',2,'LOW',1)),
                       4,'CRITICAL',3,'HIGH',2,'MEDIUM',1,'LOW') as priority_code
      from scm_replenishment_alerts
     where alert_status_code in ('OPEN', 'IN_REVIEW')
     group by item_id, warehouse_id
)
select u.user_name,
       i.item_id,
       i.item_code,
       i.item_name,
       i.base_uom_code,
       w.warehouse_name,
       nvl(bal.total_available, 0)                                              as available_quantity,
       p.reorder_point_quantity,
       p.safety_stock_quantity,
       p.reorder_target_quantity,
       p.replenishment_lead_time_days,
       ra.priority_code                                                          as alert_priority,
       ra.alert_type_code,
       ra.alert_number,
       round((systimestamp - ra.raised_at) * 24)                                as hours_open,
       decode(ra.priority_code,'CRITICAL',1,'HIGH',2,'MEDIUM',3,'LOW',4,5)      as priority_sort,
       nvl(p.reorder_point_quantity,0) - nvl(bal.total_available,0)             as stock_gap
  from scm_item_warehouse_policies p
  join scm_items             i   on i.item_id              = p.item_id
  join scm_warehouses        w   on w.warehouse_id         = p.warehouse_id
  join scm_application_users u   on u.default_warehouse_id = w.warehouse_id
  left join balances         bal on bal.warehouse_id = p.warehouse_id
                                and bal.item_id      = p.item_id
  left join highest_alert    ha  on ha.item_id       = p.item_id
                                and ha.warehouse_id  = p.warehouse_id
  left join scm_replenishment_alerts ra
         on ra.item_id           = p.item_id
        and ra.warehouse_id      = p.warehouse_id
        and ra.alert_status_code in ('OPEN', 'IN_REVIEW')
        and ra.priority_code     = ha.priority_code
 where p.is_active                    = true
   and p.low_stock_alert_enabled_flag = true
   and ( nvl(bal.total_available, 0) <= nvl(p.reorder_point_quantity, 0)
         or ra.alert_number is not null )
   and not exists (
           select 1
             from scm_inbound_receipts      por
             join scm_inbound_receipt_lines porl on porl.inbound_receipt_id = por.inbound_receipt_id
            where por.receipt_source_code  = 'SUPPLIER'
              and por.receipt_status_code  = 'PLANNED'
              and por.warehouse_id         = p.warehouse_id
              and porl.item_id             = p.item_id
              and por.expected_arrival_at  > systimestamp
       );


-- ---------------------------------------------------------------------------
-- View: scm_v_suppliers_for_item
-- Used by: get_suppliers_for_item tool (Lab 4, Task 2)
-- ---------------------------------------------------------------------------
create or replace view scm_v_suppliers_for_item as
select irl.item_id,
       bp.business_partner_id                          as supplier_id,
       bp.partner_number,
       bp.partner_name                                 as supplier_name,
       ps.partner_site_id,
       ps.site_code,
       ps.site_name,
       count(distinct ir.inbound_receipt_id)           as total_receipts,
       max(ir.actual_arrival_at)                       as last_received_at,
       round(
           100 * avg(
               case
                   when ir.actual_arrival_at   is not null
                    and ir.expected_arrival_at is not null
                    and ir.actual_arrival_at  <= ir.expected_arrival_at
                   then 1 else 0
               end), 1)                                as on_time_rate_pct,
       round(
           100 * sum(nvl(irl.damaged_quantity, 0))
               / nullif(sum(nvl(irl.received_quantity, 0)), 0),
           1)                                          as damage_rate_pct
  from scm_business_partners     bp
  join scm_partner_sites         ps  on ps.business_partner_id = bp.business_partner_id
  join scm_inbound_receipts      ir  on ir.source_partner_id   = bp.business_partner_id
                                    and ir.receipt_source_code  = 'SUPPLIER'
  join scm_inbound_receipt_lines irl on irl.inbound_receipt_id  = ir.inbound_receipt_id
 where bp.partner_type_code   = 'SUPPLIER'
   and bp.partner_status_code = 'ACTIVE'
 group by irl.item_id,
          bp.business_partner_id, bp.partner_number, bp.partner_name,
          ps.partner_site_id,     ps.site_code,       ps.site_name;


-- ---------------------------------------------------------------------------
-- View: scm_v_supplier_delivery_performance
-- Used by: get_supplier_delivery_performance tool (Lab 4, Task 3)
-- Pre-aggregates metrics for QUARTER and YEAR so the tool filters by
-- business_partner_id and time_period only.
-- ---------------------------------------------------------------------------
create or replace view scm_v_supplier_delivery_performance as
select 'QUARTER'                                               as time_period,
       bp.business_partner_id,
       bp.partner_name                                         as supplier_name,
       count(distinct ir.inbound_receipt_id)                   as receipt_count,
       round(100 * avg(
           case
               when ir.actual_arrival_at   is not null
                and ir.expected_arrival_at is not null
                and ir.actual_arrival_at  <= ir.expected_arrival_at
               then 1 else 0
           end), 1)                                            as on_time_rate_pct,
       round(avg(
           case
               when ir.actual_arrival_at   is not null
                and ir.expected_arrival_at is not null
                and ir.actual_arrival_at  > ir.expected_arrival_at
               then (cast(ir.actual_arrival_at   as date)
                   - cast(ir.expected_arrival_at as date)) * 24
           end), 1)                                            as avg_delay_hours,
       round(avg(
           case
               when ir.actual_arrival_at      is not null
                and ir.receiving_completed_at is not null
               then (cast(ir.receiving_completed_at as date)
                   - cast(ir.actual_arrival_at      as date)) * 24
           end), 1)                                            as avg_dock_to_stock_hours,
       sum(nvl(irl.received_quantity, 0))                      as total_received,
       sum(nvl(irl.damaged_quantity,  0))                      as total_damaged,
       sum(nvl(irl.shortage_quantity, 0))                      as total_shortage,
       sum(nvl(irl.rejected_quantity, 0))                      as total_rejected,
       round(100 * sum(nvl(irl.damaged_quantity, 0))
           / nullif(sum(nvl(irl.received_quantity, 0)), 0), 1) as damage_rate_pct
  from scm_business_partners     bp
  join scm_inbound_receipts      ir  on ir.source_partner_id  = bp.business_partner_id
                                    and ir.receipt_source_code = 'SUPPLIER'
  join scm_inbound_receipt_lines irl on irl.inbound_receipt_id = ir.inbound_receipt_id
 where ir.actual_arrival_at >= add_months(trunc(sysdate, 'Q'), -3)
   and ir.actual_arrival_at  < sysdate
 group by bp.business_partner_id, bp.partner_name
union all
select 'YEAR'                                                  as time_period,
       bp.business_partner_id,
       bp.partner_name                                         as supplier_name,
       count(distinct ir.inbound_receipt_id)                   as receipt_count,
       round(100 * avg(
           case
               when ir.actual_arrival_at   is not null
                and ir.expected_arrival_at is not null
                and ir.actual_arrival_at  <= ir.expected_arrival_at
               then 1 else 0
           end), 1)                                            as on_time_rate_pct,
       round(avg(
           case
               when ir.actual_arrival_at   is not null
                and ir.expected_arrival_at is not null
                and ir.actual_arrival_at  > ir.expected_arrival_at
               then (cast(ir.actual_arrival_at   as date)
                   - cast(ir.expected_arrival_at as date)) * 24
           end), 1)                                            as avg_delay_hours,
       round(avg(
           case
               when ir.actual_arrival_at      is not null
                and ir.receiving_completed_at is not null
               then (cast(ir.receiving_completed_at as date)
                   - cast(ir.actual_arrival_at      as date)) * 24
           end), 1)                                            as avg_dock_to_stock_hours,
       sum(nvl(irl.received_quantity, 0))                      as total_received,
       sum(nvl(irl.damaged_quantity,  0))                      as total_damaged,
       sum(nvl(irl.shortage_quantity, 0))                      as total_shortage,
       sum(nvl(irl.rejected_quantity, 0))                      as total_rejected,
       round(100 * sum(nvl(irl.damaged_quantity, 0))
           / nullif(sum(nvl(irl.received_quantity, 0)), 0), 1) as damage_rate_pct
  from scm_business_partners     bp
  join scm_inbound_receipts      ir  on ir.source_partner_id  = bp.business_partner_id
                                    and ir.receipt_source_code = 'SUPPLIER'
  join scm_inbound_receipt_lines irl on irl.inbound_receipt_id = ir.inbound_receipt_id
 where ir.actual_arrival_at >= add_months(trunc(sysdate, 'YYYY'), -12)
   and ir.actual_arrival_at  < sysdate
 group by bp.business_partner_id, bp.partner_name;


-- ---------------------------------------------------------------------------
-- View: scm_v_warehouses_by_supplier
-- Used by: show_warehouses_by_supplier tool (Lab 4, Task 4)
-- ---------------------------------------------------------------------------
create or replace view scm_v_warehouses_by_supplier as
select ir.source_partner_id         as supplier_id,
       w.warehouse_id,
       w.warehouse_code,
       w.warehouse_name,
       count(ir.inbound_receipt_id) as total_deliveries,
       max(ir.actual_arrival_at)    as last_delivered_at
  from scm_warehouses       w
  join scm_inbound_receipts ir on ir.warehouse_id        = w.warehouse_id
                               and ir.receipt_source_code = 'SUPPLIER'
 where w.warehouse_status_code = 'ACTIVE'
 group by ir.source_partner_id, w.warehouse_id, w.warehouse_code, w.warehouse_name;


-- ---------------------------------------------------------------------------
-- View: scm_replenishment_v
-- Annotated replenishment alerts view for AI agent consumption
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FORCE EDITIONABLE VIEW "SCM_REPLENISHMENT_V" ("ALERT_NUMBER", "ALERT_STATUS_CODE", "ALERT_TYPE_CODE", "PRIORITY_CODE", "RAISED_AT", "REVIEW_PENDING_FLAG", "WAREHOUSE_CODE", "WAREHOUSE_NAME", "ITEM_CODE", "ITEM_NAME", "ITEM_CATEGORY_CODE", "BASE_UOM_CODE", "PICK_LOCATION_CODE", "AVAILABLE_QUANTITY", "TRIGGER_QUANTITY", "QTY_TO_TARGET", "CURRENT_WH_QTY_AVAILABLE", "RESERVE_CAN_COVER_TO_TARGET_FLAG") AS
  with loc_bal as (
  select ib.item_id,
         ib.storage_location_id,
         sum(ib.quantity_available) as qty_available
    from scm_inventory_balances ib
   group by ib.item_id, ib.storage_location_id
),
wh_bal as (
  select sl.warehouse_id,
         ib.item_id,
         sum(ib.quantity_available) as qty_available
    from scm_inventory_balances ib
    join scm_storage_locations sl
      on sl.storage_location_id = ib.storage_location_id
   group by sl.warehouse_id, ib.item_id
)
select ra.alert_number as alert_number,
       ra.alert_status_code as alert_status_code,
       ra.alert_type_code as alert_type_code,
       ra.priority_code as priority_code,
       ra.raised_at as raised_at,
       case when ra.reviewed_at is null then 'Y' else 'N' end as review_pending_flag,
       wh.warehouse_code as warehouse_code,
       wh.warehouse_name as warehouse_name,
       i.item_code as item_code,
       i.item_name as item_name,
       i.item_category_code as item_category_code,
       i.base_uom_code as base_uom_code,
       pick_loc.location_code as pick_location_code,
       ra.available_quantity as available_quantity,
       ra.trigger_quantity as trigger_quantity,
       case
         when ra.available_quantity is not null and ra.target_quantity is not null
         then greatest(ra.target_quantity - ra.available_quantity, 0)
       end as qty_to_target,
       nvl(wh_bal.qty_available, 0) as current_wh_qty_available,
       case
         when ra.available_quantity is not null
          and ra.target_quantity is not null
          and greatest(ra.target_quantity - ra.available_quantity, 0) > 0
          and nvl(reserve_bal.qty_available, 0) >= greatest(ra.target_quantity - ra.available_quantity, 0)
         then 'Y'
         else 'N'
       end as reserve_can_cover_to_target_flag
  from scm_replenishment_alerts ra
  join scm_items i
    on i.item_id = ra.item_id
  join scm_warehouses wh
    on wh.warehouse_id = ra.warehouse_id
  left join scm_storage_locations pick_loc
    on pick_loc.storage_location_id = ra.pick_location_id
  left join loc_bal reserve_bal
    on reserve_bal.item_id = ra.item_id
   and reserve_bal.storage_location_id = ra.reserve_location_id
  left join wh_bal
    on wh_bal.warehouse_id = ra.warehouse_id
   and wh_bal.item_id = ra.item_id;


-- ---------------------------------------------------------------------------
-- Procedure: scm_raise_purchase_order
-- Used by: raise_purchase_order tool (Lab 4, Task 5)
-- ---------------------------------------------------------------------------
create or replace procedure scm_raise_purchase_order (
    p_item_id     in number,
    p_supplier_id in number,
    p_wh_id       in number,
    p_quantity    in number,
    p_due_date    in varchar2,
    p_timezone    in varchar2,
    p_app_user    in varchar2
)
as
    v_receipt_number   varchar2(30);
    v_receipt_id       number;
    v_user_id          number;
    v_item_name        varchar2(200);
    v_uom              varchar2(10);
    v_supplier_name    varchar2(200);
    v_warehouse_name   varchar2(200);
    v_seq              number;
    v_due              timestamp with time zone;
    v_receiving_loc_id number;
begin
    select application_user_id
      into v_user_id
      from scm_application_users
     where lower(user_name) = lower(p_app_user);

    select storage_location_id
      into v_receiving_loc_id
      from scm_storage_locations
     where warehouse_id         = p_wh_id
       and location_type_code   = 'RECEIVING'
       and location_status_code = 'ACTIVE'
       and rownum               = 1;

    select item_name, base_uom_code
      into v_item_name, v_uom
      from scm_items
     where item_id = p_item_id;

    select partner_name
      into v_supplier_name
      from scm_business_partners
     where business_partner_id = p_supplier_id;

    select warehouse_name
      into v_warehouse_name
      from scm_warehouses
     where warehouse_id = p_wh_id;

    select nvl(max(to_number(regexp_substr(receipt_number, '\d+$'))), 0) + 1
      into v_seq
      from scm_inbound_receipts
     where receipt_number like 'POR-%';

    v_receipt_number := 'POR-' || lpad(v_seq, 6, '0');

    v_due := to_timestamp_tz(
                 p_due_date || ' 17:00:00 ' || p_timezone,
                 'YYYY-MM-DD HH24:MI:SS TZR'
             );

    insert into scm_inbound_receipts (
        receipt_number, receipt_source_code, warehouse_id,
        source_partner_id, receipt_status_code,
        expected_arrival_at, received_by
    ) values (
        v_receipt_number, 'SUPPLIER', p_wh_id,
        p_supplier_id, 'PLANNED',
        v_due, p_app_user
    ) returning inbound_receipt_id into v_receipt_id;

    insert into scm_inbound_receipt_lines (
        inbound_receipt_id, line_number, item_id,
        receiving_location_id,
        expected_quantity, received_quantity,
        accepted_quantity, quarantine_quantity,
        damaged_quantity, shortage_quantity,
        overage_quantity, rejected_quantity,
        line_status_code
    ) values (
        v_receipt_id, 1, p_item_id,
        v_receiving_loc_id,
        p_quantity, 0,
        0, 0, 0, 0, 0, 0,
        'OPEN'
    );

    update scm_replenishment_alerts
       set alert_status_code   = 'ACTIONED',
           reviewed_at         = systimestamp,
           reviewed_by_user_id = v_user_id
     where item_id            = p_item_id
       and warehouse_id       = p_wh_id
       and alert_status_code in ('OPEN', 'IN_REVIEW');

    apex_ai.set_tool_result(
        p_result               => 'Purchase order ' || v_receipt_number
                                    || ' raised for '   || v_item_name
                                    || ' - '            || p_quantity
                                    || ' '              || v_uom
                                    || ' from '         || v_supplier_name
                                    || ' to '           || v_warehouse_name
                                    || '. Expected delivery '
                                    || to_char(v_due, 'DD-Mon-YYYY') || '.',
        p_notification_message => v_receipt_number || ' raised successfully',
        p_notification_type    => 'success'
    );
end scm_raise_purchase_order;
/


-- ---------------------------------------------------------------------------
-- Procedure: scm_post_auth_register_user
-- Post-Authentication hook: automatically registers any APEX workspace user
-- into scm_application_users and assigns the Warehouse Manager role for
-- PHX-WEST on first sign-in. Also grants the APEX ACL role.
-- Setup: Shared Components > Authentication Schemes > Oracle APEX Accounts
--        Set "Post-Authentication Procedure Name" to: scm_post_auth_register_user
-- ---------------------------------------------------------------------------
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
    c_app_id         constant number        := apex_application.g_flow_id;
    c_acl_role       constant varchar2(50)  := 'warehouse-manager';
    c_warehouse_code constant varchar2(20)  := 'PHX-WEST';
    c_scm_role_name  constant varchar2(50)  := 'WAREHOUSE MANAGER';
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
     where workspace        = l_workspace_name
       and application_id   = c_app_id
       and role_static_id   = c_acl_role;

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
