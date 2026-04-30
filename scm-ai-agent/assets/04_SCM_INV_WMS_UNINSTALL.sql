-- SCM Inventory and Warehouse Management uninstall
-- Drops all objects created by 01_SCM_INV_WMS_DATAMODEL.sql

set define off

------------------------------------------------------------------------------
-- 0. Drop indexes first
-- B-tree indexes would be dropped with their tables, but explicit cleanup
-- keeps partially installed schemas easy to reset.
------------------------------------------------------------------------------

declare
    procedure safe_exec(p_sql varchar2) is
    begin
        execute immediate p_sql;
    exception
        when others then
            null;
    end;
begin
    -- B-tree indexes
    safe_exec('drop index scm_idx_application_users_01');
    safe_exec('drop index scm_idx_user_role_asgn_01');
    safe_exec('drop index scm_idx_user_role_asgn_02');
    safe_exec('drop index scm_idx_business_list_vals_01');
    safe_exec('drop index scm_idx_approval_policies_01');
    safe_exec('drop index scm_idx_storage_locations_01');
    safe_exec('drop index scm_idx_storage_locations_02');
    safe_exec('drop index scm_idx_item_wh_policies_01');
    safe_exec('drop index scm_idx_replenishment_alerts_01');
    safe_exec('drop index scm_idx_inventory_balances_01');
    safe_exec('drop index scm_idx_inventory_txns_01');
    safe_exec('drop index scm_idx_inventory_txns_02');
    safe_exec('drop index scm_idx_inbound_receipts_01');
    safe_exec('drop index scm_idx_inbound_receipt_lines_01');
    safe_exec('drop index scm_idx_stock_transfers_01');
    safe_exec('drop index scm_idx_stock_transfer_lines_01');
    safe_exec('drop index scm_idx_outbound_orders_01');
    safe_exec('drop index scm_idx_outbound_order_lines_01');
    safe_exec('drop index scm_idx_item_serials_01');
    safe_exec('drop index scm_idx_item_serials_02');
    safe_exec('drop index scm_idx_serial_events_01');
    safe_exec('drop index scm_idx_returns_01');
    safe_exec('drop index scm_idx_return_lines_01');
    safe_exec('drop index scm_idx_quarantine_cases_01');
    safe_exec('drop index scm_idx_stock_adjustments_01');
    safe_exec('drop index scm_idx_stock_adj_lines_01');
    safe_exec('drop index scm_idx_stock_counts_01');
    safe_exec('drop index scm_idx_stock_count_lines_01');
    safe_exec('drop index scm_idx_pick_waves_01');
    safe_exec('drop index scm_idx_operational_tasks_01');
    safe_exec('drop index scm_idx_operational_tasks_02');
    safe_exec('drop index scm_idx_operational_exc_01');
    safe_exec('drop index scm_idx_approval_requests_01');
    safe_exec('drop index scm_idx_approval_requests_02');
    safe_exec('drop index scm_idx_approval_actions_01');
    safe_exec('drop index scm_idx_approval_actions_02');
    safe_exec('drop index scm_idx_alert_rules_01');
    safe_exec('drop index scm_idx_alerts_01');
    safe_exec('drop index scm_idx_alerts_02');
    safe_exec('drop index scm_idx_alert_notifications_01');
    safe_exec('drop index scm_idx_record_notes_01');
    safe_exec('drop index scm_idx_record_attachments_01');
    safe_exec('drop index scm_idx_audit_events_01');
end;
/

------------------------------------------------------------------------------
-- 1. Drop tables (child -> parent)
------------------------------------------------------------------------------

declare
    procedure safe_exec(p_sql varchar2) is
    begin
        execute immediate p_sql;
    exception
        when others then
            null;
    end;
begin
    safe_exec('drop table scm_audit_events purge');
    safe_exec('drop table scm_record_attachments purge');
    safe_exec('drop table scm_record_notes purge');
    safe_exec('drop table scm_alert_notifications purge');
    safe_exec('drop table scm_alerts purge');
    safe_exec('drop table scm_approval_actions purge');
    safe_exec('drop table scm_approval_requests purge');
    safe_exec('drop table scm_serial_events purge');
    safe_exec('drop table scm_operational_tasks purge');
    safe_exec('drop table scm_pick_waves purge');
    safe_exec('drop table scm_stock_count_lines purge');
    safe_exec('drop table scm_stock_counts purge');
    safe_exec('drop table scm_stock_adjustment_lines purge');
    safe_exec('drop table scm_stock_adjustments purge');
    safe_exec('drop table scm_quarantine_cases purge');
    safe_exec('drop table scm_return_lines purge');
    safe_exec('drop table scm_returns purge');
    safe_exec('drop table scm_outbound_order_lines purge');
    safe_exec('drop table scm_outbound_orders purge');
    safe_exec('drop table scm_stock_transfer_lines purge');
    safe_exec('drop table scm_stock_transfers purge');
    safe_exec('drop table scm_item_serials purge');
    safe_exec('drop table scm_inbound_receipt_lines purge');
    safe_exec('drop table scm_inbound_receipts purge');
    safe_exec('drop table scm_replenishment_alerts purge');
    safe_exec('drop table scm_operational_exceptions purge');
    safe_exec('drop table scm_inventory_transactions purge');
    safe_exec('drop table scm_inventory_balances purge');
    safe_exec('drop table scm_inventory_lots purge');
    safe_exec('drop table scm_item_warehouse_policies purge');
    safe_exec('drop table scm_storage_locations purge');
    safe_exec('drop table scm_warehouse_areas purge');
    safe_exec('drop table scm_business_list_values purge');
    safe_exec('drop table scm_business_lists purge');
    safe_exec('drop table scm_role_permissions purge');
    safe_exec('drop table scm_user_role_assignments purge');
    safe_exec('drop table scm_approval_policy_steps purge');
    safe_exec('drop table scm_approval_policies purge');
    safe_exec('drop table scm_alert_rules purge');
    safe_exec('drop table scm_application_users purge');
    safe_exec('drop table scm_user_roles purge');
    safe_exec('drop table scm_partner_sites purge');
    safe_exec('drop table scm_items purge');
    safe_exec('drop table scm_warehouses purge');
    safe_exec('drop table scm_business_partners purge');
end;
/

-- End
