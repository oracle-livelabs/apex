-- SCM Inventory and Warehouse Management - truncate all data
-- Run this to clear all rows before re-running 02 and 03.
-- Tables are truncated child-first to satisfy foreign key constraints.
-- Identity sequences are reset to 1 so FK references in the load scripts match.
-- Missing tables are silently skipped.

declare
    procedure safe_trunc(p_table varchar2) is
    begin
        execute immediate 'truncate table ' || p_table;
    exception
        when others then null;
    end;
    procedure reset_id(p_table varchar2, p_col varchar2) is
    begin
        execute immediate
            'alter table ' || p_table ||
            ' modify ' || p_col ||
            ' generated always as identity (start with 1 increment by 1 cache 100)';
    exception
        when others then null;
    end;
begin
    -- truncate child tables first
    safe_trunc('scm_operational_tasks');
    safe_trunc('scm_serial_events');
    safe_trunc('scm_stock_count_lines');
    safe_trunc('scm_stock_counts');
    safe_trunc('scm_stock_adjustment_lines');
    safe_trunc('scm_stock_adjustments');
    safe_trunc('scm_return_lines');
    safe_trunc('scm_returns');
    safe_trunc('scm_stock_allocations');
    safe_trunc('scm_outbound_order_lines');
    safe_trunc('scm_outbound_orders');
    safe_trunc('scm_stock_transfer_lines');
    safe_trunc('scm_stock_transfers');
    safe_trunc('scm_stock_movements');
    safe_trunc('scm_inbound_receipt_lines');
    safe_trunc('scm_inbound_receipts');
    safe_trunc('scm_replenishment_alerts');
    safe_trunc('scm_operational_exceptions');
    safe_trunc('scm_inventory_balances');
    safe_trunc('scm_item_serials');
    safe_trunc('scm_inventory_lots');
    safe_trunc('scm_item_warehouse_policies');
    safe_trunc('scm_storage_locations');
    safe_trunc('scm_warehouse_areas');
    safe_trunc('scm_user_role_assignments');
    safe_trunc('scm_application_users');
    safe_trunc('scm_user_roles');
    safe_trunc('scm_business_list_values');
    safe_trunc('scm_business_lists');
    safe_trunc('scm_partner_sites');
    safe_trunc('scm_items');
    safe_trunc('scm_warehouses');
    safe_trunc('scm_business_partners');

    -- reset identity sequences so FK references in the load scripts match
    reset_id('scm_business_partners',      'business_partner_id');
    reset_id('scm_partner_sites',          'partner_site_id');
    reset_id('scm_warehouses',             'warehouse_id');
    reset_id('scm_user_roles',             'user_role_id');
    reset_id('scm_application_users',      'application_user_id');
    reset_id('scm_user_role_assignments',  'user_role_assignment_id');
    reset_id('scm_business_lists',         'business_list_id');
    reset_id('scm_business_list_values',   'business_list_value_id');
    reset_id('scm_warehouse_areas',        'warehouse_area_id');
    reset_id('scm_storage_locations',      'storage_location_id');
    reset_id('scm_items',                  'item_id');
    reset_id('scm_item_warehouse_policies','item_warehouse_policy_id');
    reset_id('scm_replenishment_alerts',   'replenishment_alert_id');
    reset_id('scm_inventory_lots',         'inventory_lot_id');
    reset_id('scm_item_serials',           'item_serial_id');
    reset_id('scm_inventory_balances',     'inventory_balance_id');
    reset_id('scm_inbound_receipts',       'inbound_receipt_id');
    reset_id('scm_inbound_receipt_lines',  'inbound_receipt_line_id');
    reset_id('scm_stock_movements',        'stock_movement_id');
    reset_id('scm_stock_transfers',        'stock_transfer_id');
    reset_id('scm_stock_transfer_lines',   'stock_transfer_line_id');
    reset_id('scm_outbound_orders',        'outbound_order_id');
    reset_id('scm_outbound_order_lines',   'outbound_order_line_id');
    reset_id('scm_stock_allocations',      'stock_allocation_id');
    reset_id('scm_returns',                'return_id');
    reset_id('scm_return_lines',           'return_line_id');
    reset_id('scm_stock_counts',           'stock_count_id');
    reset_id('scm_stock_count_lines',      'stock_count_line_id');
    reset_id('scm_stock_adjustments',      'stock_adjustment_id');
    reset_id('scm_stock_adjustment_lines', 'stock_adjustment_line_id');
    reset_id('scm_operational_exceptions', 'operational_exception_id');

    dbms_output.put_line('SCM tables truncated and sequences reset.');
end;
