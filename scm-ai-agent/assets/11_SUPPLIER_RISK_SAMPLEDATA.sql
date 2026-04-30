-- Supplier Risk Agent — Sample Data
-- Covers all 8 tools in the supplier risk conversation flow
-- Inserts: 1 warehouse, 2 areas, 4 locations, 3 roles, 5 users,
--          5 items, 5 policies, 5 balances, 3 alerts,
--          3 suppliers, 3 sites, 7 receipts, 10 receipt lines

set define off

------------------------------------------------------------------------------
-- 1. Warehouse
------------------------------------------------------------------------------

insert into scm_warehouses (
   warehouse_code, warehouse_name, warehouse_type_code,
   warehouse_status_code,
   address_line_1, city_name, country_code
) values (
   'CENTRAL-DC', 'Central Distribution Warehouse', 'DISTRIBUTION',
   'ACTIVE',
   '1 Logistics Park, Sector 12', 'Milton Keynes', 'GB'
);

------------------------------------------------------------------------------
-- 2. Warehouse Areas
------------------------------------------------------------------------------

insert into scm_warehouse_areas (
   warehouse_id, area_code, area_name, area_type_code,
   area_status_code, sequence_number, allows_mixed_items
)
select warehouse_id, 'BULK-A', 'Bulk Storage Area A', 'STORAGE',
       'ACTIVE', 1, true
  from scm_warehouses where warehouse_code = 'CENTRAL-DC';

insert into scm_warehouse_areas (
   warehouse_id, area_code, area_name, area_type_code,
   area_status_code, sequence_number, allows_mixed_items
)
select warehouse_id, 'PICK-ZONE', 'Pick Face Zone', 'PICKING',
       'ACTIVE', 2, false
  from scm_warehouses where warehouse_code = 'CENTRAL-DC';

------------------------------------------------------------------------------
-- 3. Storage Locations
------------------------------------------------------------------------------

-- Reserve locations (BULK)
insert into scm_storage_locations (
   warehouse_id, warehouse_area_id, location_code, location_name,
   location_type_code, location_status_code, is_pickable, allows_mixed_items
)
select w.warehouse_id, wa.warehouse_area_id,
       'A-01-B', 'Bulk Aisle A Bay 01 Level B',
       'BULK', 'ACTIVE', false, false
  from scm_warehouses w
  join scm_warehouse_areas wa on wa.warehouse_id = w.warehouse_id
 where w.warehouse_code = 'CENTRAL-DC'
   and wa.area_code     = 'BULK-A';

insert into scm_storage_locations (
   warehouse_id, warehouse_area_id, location_code, location_name,
   location_type_code, location_status_code, is_pickable, allows_mixed_items
)
select w.warehouse_id, wa.warehouse_area_id,
       'A-02-C', 'Bulk Aisle A Bay 02 Level C',
       'BULK', 'ACTIVE', false, false
  from scm_warehouses w
  join scm_warehouse_areas wa on wa.warehouse_id = w.warehouse_id
 where w.warehouse_code = 'CENTRAL-DC'
   and wa.area_code     = 'BULK-A';

-- Pick face locations
insert into scm_storage_locations (
   warehouse_id, warehouse_area_id, location_code, location_name,
   location_type_code, location_status_code, is_pickable, allows_mixed_items
)
select w.warehouse_id, wa.warehouse_area_id,
       'P-12', 'Pick Face 12',
       'PICK_FACE', 'ACTIVE', true, false
  from scm_warehouses w
  join scm_warehouse_areas wa on wa.warehouse_id = w.warehouse_id
 where w.warehouse_code = 'CENTRAL-DC'
   and wa.area_code     = 'PICK-ZONE';

insert into scm_storage_locations (
   warehouse_id, warehouse_area_id, location_code, location_name,
   location_type_code, location_status_code, is_pickable, allows_mixed_items
)
select w.warehouse_id, wa.warehouse_area_id,
       'P-15', 'Pick Face 15',
       'PICK_FACE', 'ACTIVE', true, false
  from scm_warehouses w
  join scm_warehouse_areas wa on wa.warehouse_id = w.warehouse_id
 where w.warehouse_code = 'CENTRAL-DC'
   and wa.area_code     = 'PICK-ZONE';

------------------------------------------------------------------------------
-- 4. User Roles
------------------------------------------------------------------------------

insert into scm_user_roles (
   role_code, role_name, role_scope_code, approval_authority_level, is_active
) values (
   'HEAD_OF_SUPPLY_CHAIN', 'Head of Supply Chain', 'ENTERPRISE', 5, true
);

insert into scm_user_roles (
   role_code, role_name, role_scope_code, approval_authority_level, is_active
) values (
   'WAREHOUSE_MANAGER', 'Warehouse Manager', 'WAREHOUSE', 4, true
);

insert into scm_user_roles (
   role_code, role_name, role_scope_code, approval_authority_level, is_active
) values (
   'WAREHOUSE_OPERATIVE', 'Warehouse Operative', 'WAREHOUSE', 1, true
);

------------------------------------------------------------------------------
-- 5. Application Users (insert without manager first)
------------------------------------------------------------------------------

insert into scm_application_users (
   user_name, full_name, email_address, user_status_code,
   default_warehouse_id, approval_authority_level, can_receive_alerts
)
select 'JOHN.CARTER', 'John Carter', 'john.carter@central-dc.com', 'ACTIVE',
       warehouse_id, 5, true
  from scm_warehouses where warehouse_code = 'CENTRAL-DC';

insert into scm_application_users (
   user_name, full_name, email_address, user_status_code,
   default_warehouse_id, approval_authority_level, can_receive_alerts
)
select 'JANE.SMITH', 'Jane Smith', 'jane.smith@central-dc.com', 'ACTIVE',
       warehouse_id, 4, true
  from scm_warehouses where warehouse_code = 'CENTRAL-DC';

insert into scm_application_users (
   user_name, full_name, email_address, user_status_code,
   default_warehouse_id, approval_authority_level, can_receive_alerts
)
select 'SAHAANA', 'Sahaana', 'sahaana@central-dc.com', 'ACTIVE',
       warehouse_id, 3, true
  from scm_warehouses where warehouse_code = 'CENTRAL-DC';

insert into scm_application_users (
   user_name, full_name, email_address, user_status_code,
   default_warehouse_id, approval_authority_level, can_receive_alerts
)
select 'SAMANAVA', 'Samanava', 'samanava@central-dc.com', 'ACTIVE',
       warehouse_id, 4, true
  from scm_warehouses where warehouse_code = 'CENTRAL-DC';

insert into scm_application_users (
   user_name, full_name, email_address, user_status_code,
   default_warehouse_id, approval_authority_level, can_receive_alerts
)
select 'TOM.WILSON', 'Tom Wilson', 'tom.wilson@central-dc.com', 'ACTIVE',
       warehouse_id, 1, false
  from scm_warehouses where warehouse_code = 'CENTRAL-DC';

-- Set manager: Warehouse Managers and Operative report to John Carter
update scm_application_users
   set manager_user_id = ( select application_user_id
                             from scm_application_users
                            where user_name = 'JOHN.CARTER' )
 where user_name in ('JANE.SMITH', 'SAHAANA', 'SAMANAVA', 'TOM.WILSON');

------------------------------------------------------------------------------
-- 6. User Role Assignments
------------------------------------------------------------------------------

insert into scm_user_role_assignments (
   application_user_id, user_role_id, assignment_status_code, is_primary_role
)
select u.application_user_id, r.user_role_id, 'ACTIVE', true
  from scm_application_users u, scm_user_roles r
 where u.user_name  = 'JOHN.CARTER'
   and r.role_code  = 'HEAD_OF_SUPPLY_CHAIN';

insert into scm_user_role_assignments (
   application_user_id, user_role_id, assignment_status_code, is_primary_role
)
select u.application_user_id, r.user_role_id, 'ACTIVE', true
  from scm_application_users u, scm_user_roles r
 where u.user_name = 'JANE.SMITH'
   and r.role_code = 'WAREHOUSE_MANAGER';

insert into scm_user_role_assignments (
   application_user_id, user_role_id, assignment_status_code, is_primary_role
)
select u.application_user_id, r.user_role_id, 'ACTIVE', true
  from scm_application_users u, scm_user_roles r
 where u.user_name = 'SAHAANA'
   and r.role_code = 'WAREHOUSE_MANAGER';

insert into scm_user_role_assignments (
   application_user_id, user_role_id, assignment_status_code, is_primary_role
)
select u.application_user_id, r.user_role_id, 'ACTIVE', true
  from scm_application_users u, scm_user_roles r
 where u.user_name = 'SAMANAVA'
   and r.role_code = 'WAREHOUSE_MANAGER';

insert into scm_user_role_assignments (
   application_user_id, user_role_id, assignment_status_code, is_primary_role
)
select u.application_user_id, r.user_role_id, 'ACTIVE', true
  from scm_application_users u, scm_user_roles r
 where u.user_name = 'TOM.WILSON'
   and r.role_code = 'WAREHOUSE_OPERATIVE';

------------------------------------------------------------------------------
-- 7. Items
------------------------------------------------------------------------------

insert into scm_items (
   item_code, item_name, item_description, item_category_code,
   base_uom_code, item_status_code,
   lot_control_flag, serial_control_flag, expiry_control_flag,
   high_value_flag, hazardous_flag
) values (
   'SKU-4821', 'Industrial Bearings',
   'Heavy-duty ball bearings for conveyor and drive systems.',
   'MECHANICAL', 'EACH', 'ACTIVE',
   false, false, false, false, false
);

insert into scm_items (
   item_code, item_name, item_description, item_category_code,
   base_uom_code, item_status_code,
   lot_control_flag, serial_control_flag, expiry_control_flag
) values (
   'SKU-2201', 'Hydraulic Filter',
   'Standard hydraulic line filter for heavy plant equipment.',
   'MECHANICAL', 'EACH', 'ACTIVE',
   false, false, false
);

insert into scm_items (
   item_code, item_name, item_description, item_category_code,
   base_uom_code, item_status_code,
   lot_control_flag, serial_control_flag, expiry_control_flag
) values (
   'SKU-3390', 'Drive Belt',
   'Heavy-duty reinforced drive belt, 1200mm.',
   'MECHANICAL', 'EACH', 'ACTIVE',
   false, false, false
);

insert into scm_items (
   item_code, item_name, item_description, item_category_code,
   base_uom_code, item_status_code,
   lot_control_flag, serial_control_flag, expiry_control_flag
) values (
   'SKU-1105', 'Safety Gloves Box',
   'Cut-resistant safety gloves, box of 12 pairs.',
   'SAFETY', 'BOX', 'ACTIVE',
   false, false, false
);

insert into scm_items (
   item_code, item_name, item_description, item_category_code,
   base_uom_code, item_status_code,
   lot_control_flag, serial_control_flag, expiry_control_flag
) values (
   'SKU-5502', 'Lubricant Spray',
   'Multi-purpose industrial lubricant spray, 500ml.',
   'CONSUMABLES', 'UNIT', 'ACTIVE',
   false, false, true
);

------------------------------------------------------------------------------
-- 8. Item Warehouse Policies
-- All 5 items set below their reorder points so Tool 3 returns results
------------------------------------------------------------------------------

-- SKU-4821: available 50, reorder 200 → CRITICAL gap
insert into scm_item_warehouse_policies (
   item_id, warehouse_id, rotation_method_code,
   minimum_stock_quantity, reorder_point_quantity,
   reorder_target_quantity, maximum_stock_quantity, safety_stock_quantity,
   replenishment_lead_time_days,
   low_stock_alert_enabled_flag, is_active
)
select i.item_id, w.warehouse_id, 'FIFO',
       50, 200, 500, 800, 50,
       7,
       true, true
  from scm_items i, scm_warehouses w
 where i.item_code      = 'SKU-4821'
   and w.warehouse_code = 'CENTRAL-DC';

-- SKU-2201: available 80, reorder 100 → HIGH gap
insert into scm_item_warehouse_policies (
   item_id, warehouse_id, rotation_method_code,
   minimum_stock_quantity, reorder_point_quantity,
   reorder_target_quantity, maximum_stock_quantity, safety_stock_quantity,
   replenishment_lead_time_days,
   low_stock_alert_enabled_flag, is_active
)
select i.item_id, w.warehouse_id, 'FIFO',
       20, 100, 300, 500, 20,
       5,
       true, true
  from scm_items i, scm_warehouses w
 where i.item_code      = 'SKU-2201'
   and w.warehouse_code = 'CENTRAL-DC';

-- SKU-3390: available 40, reorder 50 → MEDIUM gap
insert into scm_item_warehouse_policies (
   item_id, warehouse_id, rotation_method_code,
   minimum_stock_quantity, reorder_point_quantity,
   reorder_target_quantity, maximum_stock_quantity, safety_stock_quantity,
   replenishment_lead_time_days,
   low_stock_alert_enabled_flag, is_active
)
select i.item_id, w.warehouse_id, 'FIFO',
       10, 50, 150, 250, 10,
       10,
       true, true
  from scm_items i, scm_warehouses w
 where i.item_code      = 'SKU-3390'
   and w.warehouse_code = 'CENTRAL-DC';

-- SKU-1105: available 25, reorder 30 → LOW gap
insert into scm_item_warehouse_policies (
   item_id, warehouse_id, rotation_method_code,
   minimum_stock_quantity, reorder_point_quantity,
   reorder_target_quantity, maximum_stock_quantity, safety_stock_quantity,
   replenishment_lead_time_days,
   low_stock_alert_enabled_flag, is_active
)
select i.item_id, w.warehouse_id, 'FIFO',
       5, 30, 100, 150, 5,
       3,
       true, true
  from scm_items i, scm_warehouses w
 where i.item_code      = 'SKU-1105'
   and w.warehouse_code = 'CENTRAL-DC';

-- SKU-5502: available 18, reorder 20 → LOW gap
insert into scm_item_warehouse_policies (
   item_id, warehouse_id, rotation_method_code,
   minimum_stock_quantity, reorder_point_quantity,
   reorder_target_quantity, maximum_stock_quantity, safety_stock_quantity,
   replenishment_lead_time_days,
   low_stock_alert_enabled_flag, is_active
)
select i.item_id, w.warehouse_id, 'FIFO',
       5, 20, 60, 100, 5,
       4,
       true, true
  from scm_items i, scm_warehouses w
 where i.item_code      = 'SKU-5502'
   and w.warehouse_code = 'CENTRAL-DC';

------------------------------------------------------------------------------
-- 9. Inventory Balances (all below reorder point)
------------------------------------------------------------------------------

-- SKU-4821 in reserve A-01-B: 50 available (reorder = 200)
insert into scm_inventory_balances (
   storage_location_id, item_id, stock_status_code,
   quantity_on_hand, quantity_reserved
)
select sl.storage_location_id, i.item_id, 'AVAILABLE',
       50, 0
  from scm_storage_locations sl, scm_items i
 where sl.location_code = 'A-01-B'
   and i.item_code      = 'SKU-4821';

-- SKU-2201 in reserve A-02-C: 80 available (reorder = 100)
insert into scm_inventory_balances (
   storage_location_id, item_id, stock_status_code,
   quantity_on_hand, quantity_reserved
)
select sl.storage_location_id, i.item_id, 'AVAILABLE',
       80, 0
  from scm_storage_locations sl, scm_items i
 where sl.location_code = 'A-02-C'
   and i.item_code      = 'SKU-2201';

-- SKU-3390 in reserve A-01-B: 40 available (reorder = 50)
insert into scm_inventory_balances (
   storage_location_id, item_id, stock_status_code,
   quantity_on_hand, quantity_reserved
)
select sl.storage_location_id, i.item_id, 'AVAILABLE',
       40, 0
  from scm_storage_locations sl, scm_items i
 where sl.location_code = 'A-01-B'
   and i.item_code      = 'SKU-3390';

-- SKU-1105 in pick face P-12: 25 available (reorder = 30)
insert into scm_inventory_balances (
   storage_location_id, item_id, stock_status_code,
   quantity_on_hand, quantity_reserved
)
select sl.storage_location_id, i.item_id, 'AVAILABLE',
       25, 0
  from scm_storage_locations sl, scm_items i
 where sl.location_code = 'P-12'
   and i.item_code      = 'SKU-1105';

-- SKU-5502 in pick face P-15: 18 available (reorder = 20)
insert into scm_inventory_balances (
   storage_location_id, item_id, stock_status_code,
   quantity_on_hand, quantity_reserved
)
select sl.storage_location_id, i.item_id, 'AVAILABLE',
       18, 0
  from scm_storage_locations sl, scm_items i
 where sl.location_code = 'P-15'
   and i.item_code      = 'SKU-5502';

------------------------------------------------------------------------------
-- 10. Replenishment Alerts
------------------------------------------------------------------------------

insert into scm_replenishment_alerts (
   alert_number, warehouse_id, item_id,
   pick_location_id, reserve_location_id,
   alert_type_code, alert_status_code, priority_code,
   available_quantity, trigger_quantity,
   target_quantity, recommended_replenishment_quantity,
   raised_at
)
select 'RPAL-0001',
       w.warehouse_id, i.item_id,
       pf.storage_location_id, rv.storage_location_id,
       'PICK_FACE_REPLENISHMENT', 'OPEN', 'CRITICAL',
       50, 200, 500, 450,
       systimestamp - numtodsinterval(18, 'HOUR')
  from scm_warehouses       w
  join scm_items             i  on i.item_code  = 'SKU-4821'
  join scm_storage_locations pf on pf.location_code = 'P-12'
  join scm_storage_locations rv on rv.location_code = 'A-01-B'
 where w.warehouse_code = 'CENTRAL-DC';

insert into scm_replenishment_alerts (
   alert_number, warehouse_id, item_id,
   pick_location_id, reserve_location_id,
   alert_type_code, alert_status_code, priority_code,
   available_quantity, trigger_quantity,
   target_quantity, recommended_replenishment_quantity,
   raised_at
)
select 'RPAL-0002',
       w.warehouse_id, i.item_id,
       pf.storage_location_id, rv.storage_location_id,
       'LOW_STOCK', 'OPEN', 'HIGH',
       80, 100, 300, 220,
       systimestamp - numtodsinterval(6, 'HOUR')
  from scm_warehouses       w
  join scm_items             i  on i.item_code  = 'SKU-2201'
  join scm_storage_locations pf on pf.location_code = 'P-15'
  join scm_storage_locations rv on rv.location_code = 'A-02-C'
 where w.warehouse_code = 'CENTRAL-DC';

insert into scm_replenishment_alerts (
   alert_number, warehouse_id, item_id,
   pick_location_id, reserve_location_id,
   alert_type_code, alert_status_code, priority_code,
   available_quantity, trigger_quantity,
   target_quantity, recommended_replenishment_quantity,
   raised_at
)
select 'RPAL-0003',
       w.warehouse_id, i.item_id,
       pf.storage_location_id, rv.storage_location_id,
       'LOW_STOCK', 'IN_REVIEW', 'MEDIUM',
       40, 50, 150, 110,
       systimestamp - numtodsinterval(2, 'HOUR')
  from scm_warehouses       w
  join scm_items             i  on i.item_code  = 'SKU-3390'
  join scm_storage_locations pf on pf.location_code = 'P-12'
  join scm_storage_locations rv on rv.location_code = 'A-01-B'
 where w.warehouse_code = 'CENTRAL-DC';

------------------------------------------------------------------------------
-- 11. Business Partners (Suppliers)
------------------------------------------------------------------------------

insert into scm_business_partners (
   partner_number, partner_type_code, partner_name, partner_status_code
) values (
   'SUP-0001', 'SUPPLIER', 'Apex Industrial Supplies', 'ACTIVE'
);

insert into scm_business_partners (
   partner_number, partner_type_code, partner_name, partner_status_code
) values (
   'SUP-0002', 'SUPPLIER', 'Global Parts Co.', 'ACTIVE'
);

insert into scm_business_partners (
   partner_number, partner_type_code, partner_name, partner_status_code
) values (
   'SUP-0003', 'SUPPLIER', 'FastTrack Components', 'ACTIVE'
);

------------------------------------------------------------------------------
-- 12. Partner Sites
------------------------------------------------------------------------------

insert into scm_partner_sites (
   business_partner_id, site_code, site_name, site_role_code,
   address_line_1, city_name, country_code, is_primary_site, is_active
)
select business_partner_id,
       'APEX-PRIMARY', 'Apex Industrial — Main Despatch', 'SHIP_FROM',
       '14 Industrial Estate, Zone B', 'Coventry', 'GB', true, true
  from scm_business_partners where partner_number = 'SUP-0001';

insert into scm_partner_sites (
   business_partner_id, site_code, site_name, site_role_code,
   address_line_1, city_name, country_code, is_primary_site, is_active
)
select business_partner_id,
       'GP-PRIMARY', 'Global Parts — Distribution Hub', 'SHIP_FROM',
       '88 Commerce Drive', 'Birmingham', 'GB', true, true
  from scm_business_partners where partner_number = 'SUP-0002';

insert into scm_partner_sites (
   business_partner_id, site_code, site_name, site_role_code,
   address_line_1, city_name, country_code, is_primary_site, is_active
)
select business_partner_id,
       'FT-PRIMARY', 'FastTrack — Despatch Depot', 'SHIP_FROM',
       '3 Rapid Park, Southway', 'Leicester', 'GB', true, true
  from scm_business_partners where partner_number = 'SUP-0003';

------------------------------------------------------------------------------
-- 13. Inbound Receipts (historical — last quarter Jan–Mar 2026)
--     Apex Industrial: 3 receipts — strong performer
--     Global Parts:    2 receipts — average performer
--     FastTrack:       2 receipts — poor performer
------------------------------------------------------------------------------

-- Apex Receipt 1: SKU-4821, on time
insert into scm_inbound_receipts (
   receipt_number, receipt_source_code, warehouse_id, source_partner_id,
   receipt_status_code,
   expected_arrival_at, actual_arrival_at, receiving_completed_at,
   received_by
)
select 'RCP-2026-001', 'SUPPLIER', w.warehouse_id, bp.business_partner_id,
       'RECEIVED',
       timestamp '2026-01-10 09:00:00 +00:00',
       timestamp '2026-01-10 08:45:00 +00:00',
       timestamp '2026-01-10 11:00:00 +00:00',
       'JANE.SMITH'
  from scm_warehouses w, scm_business_partners bp
 where w.warehouse_code   = 'CENTRAL-DC'
   and bp.partner_number  = 'SUP-0001';

-- Apex Receipt 2: SKU-4821, on time, minor damage
insert into scm_inbound_receipts (
   receipt_number, receipt_source_code, warehouse_id, source_partner_id,
   receipt_status_code,
   expected_arrival_at, actual_arrival_at, receiving_completed_at,
   received_by
)
select 'RCP-2026-002', 'SUPPLIER', w.warehouse_id, bp.business_partner_id,
       'RECEIVED',
       timestamp '2026-02-15 10:00:00 +00:00',
       timestamp '2026-02-15 09:50:00 +00:00',
       timestamp '2026-02-15 12:00:00 +00:00',
       'SAHAANA'
  from scm_warehouses w, scm_business_partners bp
 where w.warehouse_code  = 'CENTRAL-DC'
   and bp.partner_number = 'SUP-0001';

-- Apex Receipt 3: SKU-2201, on time
insert into scm_inbound_receipts (
   receipt_number, receipt_source_code, warehouse_id, source_partner_id,
   receipt_status_code,
   expected_arrival_at, actual_arrival_at, receiving_completed_at,
   received_by
)
select 'RCP-2026-003', 'SUPPLIER', w.warehouse_id, bp.business_partner_id,
       'RECEIVED',
       timestamp '2026-03-20 09:00:00 +00:00',
       timestamp '2026-03-20 09:00:00 +00:00',
       timestamp '2026-03-20 11:00:00 +00:00',
       'SAMANAVA'
  from scm_warehouses w, scm_business_partners bp
 where w.warehouse_code  = 'CENTRAL-DC'
   and bp.partner_number = 'SUP-0001';

-- Global Parts Receipt 1: SKU-4821, late by 5 days, damaged units
insert into scm_inbound_receipts (
   receipt_number, receipt_source_code, warehouse_id, source_partner_id,
   receipt_status_code,
   expected_arrival_at, actual_arrival_at, receiving_completed_at,
   received_by
)
select 'RCP-2026-004', 'SUPPLIER', w.warehouse_id, bp.business_partner_id,
       'RECEIVED',
       timestamp '2026-01-20 09:00:00 +00:00',
       timestamp '2026-01-25 14:00:00 +00:00',
       timestamp '2026-01-25 17:00:00 +00:00',
       'JANE.SMITH'
  from scm_warehouses w, scm_business_partners bp
 where w.warehouse_code  = 'CENTRAL-DC'
   and bp.partner_number = 'SUP-0002';

-- Global Parts Receipt 2: SKU-4821, late by 4 days
insert into scm_inbound_receipts (
   receipt_number, receipt_source_code, warehouse_id, source_partner_id,
   receipt_status_code,
   expected_arrival_at, actual_arrival_at, receiving_completed_at,
   received_by
)
select 'RCP-2026-005', 'SUPPLIER', w.warehouse_id, bp.business_partner_id,
       'RECEIVED',
       timestamp '2026-03-01 09:00:00 +00:00',
       timestamp '2026-03-05 11:00:00 +00:00',
       timestamp '2026-03-05 14:30:00 +00:00',
       'SAHAANA'
  from scm_warehouses w, scm_business_partners bp
 where w.warehouse_code  = 'CENTRAL-DC'
   and bp.partner_number = 'SUP-0002';

-- FastTrack Receipt 1: SKU-3390, late by 9 days, high damage
insert into scm_inbound_receipts (
   receipt_number, receipt_source_code, warehouse_id, source_partner_id,
   receipt_status_code,
   expected_arrival_at, actual_arrival_at, receiving_completed_at,
   received_by
)
select 'RCP-2026-006', 'SUPPLIER', w.warehouse_id, bp.business_partner_id,
       'RECEIVED',
       timestamp '2026-02-01 09:00:00 +00:00',
       timestamp '2026-02-10 15:00:00 +00:00',
       timestamp '2026-02-10 18:00:00 +00:00',
       'SAMANAVA'
  from scm_warehouses w, scm_business_partners bp
 where w.warehouse_code  = 'CENTRAL-DC'
   and bp.partner_number = 'SUP-0003';

-- FastTrack Receipt 2: SKU-4821, late by 3 days (shows FastTrack can supply SKU-4821 too)
insert into scm_inbound_receipts (
   receipt_number, receipt_source_code, warehouse_id, source_partner_id,
   receipt_status_code,
   expected_arrival_at, actual_arrival_at, receiving_completed_at,
   received_by
)
select 'RCP-2026-007', 'SUPPLIER', w.warehouse_id, bp.business_partner_id,
       'RECEIVED',
       timestamp '2026-03-10 09:00:00 +00:00',
       timestamp '2026-03-13 10:00:00 +00:00',
       timestamp '2026-03-13 13:00:00 +00:00',
       'JANE.SMITH'
  from scm_warehouses w, scm_business_partners bp
 where w.warehouse_code  = 'CENTRAL-DC'
   and bp.partner_number = 'SUP-0003';

------------------------------------------------------------------------------
-- 14. Inbound Receipt Lines
------------------------------------------------------------------------------

-- Apex RCP-2026-001: 500 x SKU-4821, clean receipt
insert into scm_inbound_receipt_lines (
   inbound_receipt_id, line_number, item_id,
   expected_quantity, received_quantity, accepted_quantity,
   quarantine_quantity, damaged_quantity, shortage_quantity,
   overage_quantity, rejected_quantity, line_status_code
)
select ir.inbound_receipt_id, 1, i.item_id,
       500, 500, 500,
       0, 0, 0, 0, 0, 'PUTAWAY_COMPLETE'
  from scm_inbound_receipts ir, scm_items i
 where ir.receipt_number = 'RCP-2026-001'
   and i.item_code       = 'SKU-4821';

-- Apex RCP-2026-002: 500 x SKU-4821, 5 damaged
insert into scm_inbound_receipt_lines (
   inbound_receipt_id, line_number, item_id,
   expected_quantity, received_quantity, accepted_quantity,
   quarantine_quantity, damaged_quantity, shortage_quantity,
   overage_quantity, rejected_quantity, line_status_code
)
select ir.inbound_receipt_id, 1, i.item_id,
       500, 500, 495,
       0, 5, 0, 0, 0, 'PUTAWAY_COMPLETE'
  from scm_inbound_receipts ir, scm_items i
 where ir.receipt_number = 'RCP-2026-002'
   and i.item_code       = 'SKU-4821';

-- Apex RCP-2026-003: 300 x SKU-2201, clean receipt
insert into scm_inbound_receipt_lines (
   inbound_receipt_id, line_number, item_id,
   expected_quantity, received_quantity, accepted_quantity,
   quarantine_quantity, damaged_quantity, shortage_quantity,
   overage_quantity, rejected_quantity, line_status_code
)
select ir.inbound_receipt_id, 1, i.item_id,
       300, 300, 300,
       0, 0, 0, 0, 0, 'PUTAWAY_COMPLETE'
  from scm_inbound_receipts ir, scm_items i
 where ir.receipt_number = 'RCP-2026-003'
   and i.item_code       = 'SKU-2201';

-- Global RCP-2026-004: 200 x SKU-4821, 10 damaged
insert into scm_inbound_receipt_lines (
   inbound_receipt_id, line_number, item_id,
   expected_quantity, received_quantity, accepted_quantity,
   quarantine_quantity, damaged_quantity, shortage_quantity,
   overage_quantity, rejected_quantity, line_status_code
)
select ir.inbound_receipt_id, 1, i.item_id,
       200, 200, 190,
       0, 10, 0, 0, 0, 'PUTAWAY_COMPLETE'
  from scm_inbound_receipts ir, scm_items i
 where ir.receipt_number = 'RCP-2026-004'
   and i.item_code       = 'SKU-4821';

-- Global RCP-2026-005: 300 x SKU-4821, 15 shortage
insert into scm_inbound_receipt_lines (
   inbound_receipt_id, line_number, item_id,
   expected_quantity, received_quantity, accepted_quantity,
   quarantine_quantity, damaged_quantity, shortage_quantity,
   overage_quantity, rejected_quantity, line_status_code
)
select ir.inbound_receipt_id, 1, i.item_id,
       300, 285, 285,
       0, 0, 15, 0, 0, 'PUTAWAY_COMPLETE'
  from scm_inbound_receipts ir, scm_items i
 where ir.receipt_number = 'RCP-2026-005'
   and i.item_code       = 'SKU-4821';

-- FastTrack RCP-2026-006: 100 x SKU-3390, 15 damaged
insert into scm_inbound_receipt_lines (
   inbound_receipt_id, line_number, item_id,
   expected_quantity, received_quantity, accepted_quantity,
   quarantine_quantity, damaged_quantity, shortage_quantity,
   overage_quantity, rejected_quantity, line_status_code
)
select ir.inbound_receipt_id, 1, i.item_id,
       100, 100, 85,
       0, 15, 0, 0, 0, 'PUTAWAY_COMPLETE'
  from scm_inbound_receipts ir, scm_items i
 where ir.receipt_number = 'RCP-2026-006'
   and i.item_code       = 'SKU-3390';

-- FastTrack RCP-2026-007: 250 x SKU-4821, 8 damaged
insert into scm_inbound_receipt_lines (
   inbound_receipt_id, line_number, item_id,
   expected_quantity, received_quantity, accepted_quantity,
   quarantine_quantity, damaged_quantity, shortage_quantity,
   overage_quantity, rejected_quantity, line_status_code
)
select ir.inbound_receipt_id, 1, i.item_id,
       250, 250, 242,
       0, 8, 0, 0, 0, 'PUTAWAY_COMPLETE'
  from scm_inbound_receipts ir, scm_items i
 where ir.receipt_number = 'RCP-2026-007'
   and i.item_code       = 'SKU-4821';

------------------------------------------------------------------------------
-- Done
------------------------------------------------------------------------------

commit;
