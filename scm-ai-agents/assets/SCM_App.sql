prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>9001097023874075
,p_default_application_id=>107
,p_default_id_offset=>11600203185424134
,p_default_owner=>'SAMANAVA'
);
end;
/
 
prompt APPLICATION 107 - APEX SCM Warehouse Management
--
-- Application Export:
--   Application:     107
--   Name:            APEX SCM Warehouse Management
--   Date and Time:   05:49 Tuesday April 21, 2026
--   Exported By:     SAMANAVA
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     40
--       Items:                  305
--       Processes:               67
--       Regions:                126
--       Buttons:                107
--       Dynamic Actions:         61
--     Shared Components:
--       Logic:
--         Build Options:          1
--         AI Agents:              1
--       Navigation:
--         Lists:                  2
--         Breadcrumbs:            1
--           Entries:             18
--       Security:
--         Authentication:         1
--         Authorization:         14
--         ACL Roles:             11
--       User Interface:
--         Themes:                 1
--         Templates:
--         LOVs:                  17
--       PWA:
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--   Version:         26.1.0
--   Instance ID:     746063144239604
--

prompt --application/delete_application
begin
wwv_flow_imp.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'SAMANAVA')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'APEX SCM Warehouse Management')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'APEX-SCM-WAREHOUSE-MANAGEMENT')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset_dt=>to_date('20260416093801','YYYYMMDDHH24MISS')
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'24.2'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_flow_image_prefix=>nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(35046732483105911)
,p_application_tab_set=>0
,p_logo_type=>'T'
,p_logo_text=>'APEX SCM Warehouse Management'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_authorize_batch_job=>'N'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'APEX SCM Warehouse Management'
,p_last_updated_on=>wwv_flow_imp.dz('20260416093801Z')
,p_last_updated_by=>'SAMANAVA'
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>2461145065526
,p_version_scn=>'15432031'
,p_print_server_type=>'NATIVE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'N'
,p_pwa_is_push_enabled=>'N'
,p_ai_remote_server_id=>13606709702054457
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_navigation_list_id=>wwv_flow_imp.id(35046829004105911)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>2469215554099805162
,p_nav_list_template_options=>'#DEFAULT#:t-TreeNav--styleA:js-navCollapsed--hidden'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(35046988824105911)
,p_nav_bar_list_template_id=>2849019392706229583
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --workspace/credentials/oci_credentials
begin
wwv_imp_workspace.create_credential(
 p_id=>13606657185054456
,p_name=>'oci-credentials'
,p_static_id=>'oci-credentials'
,p_authentication_type=>'OCI'
,p_namespace=>'ocid1.tenancy.oc1..aaaaaaaansast2ca2dhk2jyp7ygazbb2l5nt6f6ocw3qfxzmgufyxmpndo3a'
,p_valid_for_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://inference.generativeai.us-chicago-1.oci.oraclecloud.com',
''))
,p_prompt_on_install=>true
,p_created_on=>wwv_flow_imp.dz('20260324104216Z')
,p_updated_on=>wwv_flow_imp.dz('20260415120453Z')
,p_created_by=>'STEFAN'
,p_updated_by=>'SAMANAVA'
);
end;
/
prompt --workspace/remote_servers/my_ai_service
begin
wwv_imp_workspace.create_remote_server(
 p_id=>13606709702054457
,p_name=>'my-ai-service'
,p_static_id=>'my-ai-service'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('my-ai-service'),'https://inference.generativeai.us-chicago-1.oci.oraclecloud.com')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('my-ai-service'),'')
,p_server_type=>'GENERATIVE_AI'
,p_credential_id=>13606657185054456
,p_ai_provider_type=>'OCI_GENAI'
,p_ai_is_builder_service=>true
,p_ai_is_default_for_new_apps=>false
,p_ai_model_name=>nvl(wwv_flow_application_install.get_remote_server_ai_model('my-ai-service'),'')
,p_ai_http_headers=>nvl(wwv_flow_application_install.get_remote_server_ai_headers('my-ai-service'),'')
,p_ai_attributes=>nvl(wwv_flow_application_install.get_remote_server_ai_attrs('my-ai-service'),'{'||wwv_flow.LF||
'  "compartmentId" : "ocid1.compartment.oc1..aaaaaaaal6p4vtvg6ykzv426wxb4cwvgfrw6ztfpti2elpkali6wj3v23yla",'||wwv_flow.LF||
'  "servingMode" :'||wwv_flow.LF||
'  {'||wwv_flow.LF||
'    "servingType" : "ON_DEMAND",'||wwv_flow.LF||
'    "modelId" : "xai.grok-4-1-fast-non-reasoning"'||wwv_flow.LF||
'  }'||wwv_flow.LF||
'}')
,p_ai_max_tokens=>nvl(wwv_flow_application_install.get_remote_server_ai_maxtokens('my-ai-service'),'')
,p_prompt_on_install=>true
,p_updated_on=>wwv_flow_imp.dz('20260416060755Z')
,p_updated_by=>'SAMANAVA'
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35047196388105912)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35048176064105913)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35047205620105912)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'show_on', 'FOCUS',
  'time_increment', '15')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35047395963105912)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'background', 'default',
  'display_as', 'LIST',
  'map_preview', 'POPUP:ITEM',
  'match_mode', 'RELAX_HOUSE_NUMBER')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35048044262105913)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35047860588105912)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35048285235105913)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35048326720105913)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35047741165105912)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'match_mode', 'RELAX_HOUSE_NUMBER')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35047083829105912)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'Y')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35047993975105913)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35047477722105912)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35047611234105912)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35047585609105912)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
);
end;
/
prompt --application/shared_components/ai_agent/scm_agent
begin
wwv_flow_imp_shared.create_ai_agent(
 p_id=>wwv_flow_imp.id(12000270967456428)
,p_name=>'SCM Agent'
,p_static_id=>'scm-agent'
,p_remote_server_id=>13606709702054457
,p_system_prompt=>wwv_flow_string.join(wwv_flow_t_varchar2(
'You are a supply chain AI assistant.',
'',
'You help users:',
'- Monitor inventory',
'- Identify stock issues',
'- Take replenishment actions',
'',
'Always:',
'- Use tools for data',
'- Provide actionable responses'))
,p_welcome_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Hi! I can help you manage inventory, detect issues, and take actions. Try asking:',
'- What items are low in stock?',
'- Show critical alerts',
'- Replenish items'))
,p_version_scn=>'SH256:Jfa3CAE5OYD3R83ReuQPkHDVsAFkMkyke4gQWcp1xHs'
,p_created_on=>wwv_flow_imp.dz('20260415071925Z')
,p_updated_on=>wwv_flow_imp.dz('20260416093801Z')
,p_created_by=>'SAMANAVA'
,p_updated_by=>'SAMANAVA'
);
wwv_flow_imp_shared.create_ai_agent_tool(
 p_id=>wwv_flow_imp.id(15201713574394562)
,p_tool_name=>'get_browser_timezone'
,p_static_id=>'get-browser-timezone'
,p_tool_type=>'NATIVE_EXECUTE_CLIENT_SIDE_CODE'
,p_execution_point=>'AUGMENT_SYSTEM_PROMPT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'return Intl.DateTimeFormat().resolvedOptions().timeZone')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260416091818Z')
,p_updated_on=>wwv_flow_imp.dz('20260416091818Z')
,p_created_by=>'SAMANAVA'
,p_updated_by=>'SAMANAVA'
);
wwv_flow_imp_shared.create_ai_agent_tool(
 p_id=>wwv_flow_imp.id(15202901332406231)
,p_tool_name=>'get_critical_exceptions'
,p_static_id=>'get-critical-exceptions'
,p_tool_type=>'NATIVE_RETRIEVE_DATA'
,p_execution_point=>'ON_DEMAND'
,p_description=>'Returns open and under-review operational exceptions for the user''s warehouse, ordered by severity and date. Use this to get details on specific warehouse exceptions that need investigation.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select e.exception_number,',
    '       e.exception_type_code,',
    '       e.severity_code,',
    '       e.exception_status_code,',
    '       i.item_code,',
    '       i.item_name,',
    '       sl.location_code,',
    '       e.affected_quantity,',
    '       e.source_document_type,',
    '       e.source_document_number,',
    '       e.reported_at,',
    '       u.full_name as reported_by,',
    '       e.exception_notes',
    '  from scm_operational_exceptions e',
    '  left join scm_items             i  on i.item_id             = e.item_id',
    '  left join scm_storage_locations sl on sl.storage_location_id = e.storage_location_id',
    '  left join scm_application_users u  on u.application_user_id  = e.reported_by_user_id',
    ' where e.warehouse_id = (select au.default_warehouse_id',
    '                           from scm_application_users au',
    '                          where au.application_user_id = :APP_USER_ID)',
    '   and e.exception_status_code in (''OPEN'',''UNDER_REVIEW'')',
    ' order by decode(e.severity_code,''CRITICAL'',1,''HIGH'',2,''MEDIUM'',3,''LOW'',4),',
    '          e.reported_at',
    ' fetch first 20 rows only')),
  'type', 'SQL_QUERY')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260416092014Z')
,p_updated_on=>wwv_flow_imp.dz('20260416092014Z')
,p_created_by=>'SAMANAVA'
,p_updated_by=>'SAMANAVA'
);
wwv_flow_imp_shared.create_ai_agent_tool(
 p_id=>wwv_flow_imp.id(15203285118409111)
,p_tool_name=>'get_replenishment_alerts'
,p_static_id=>'get-replenishment-alerts'
,p_tool_type=>'NATIVE_RETRIEVE_DATA'
,p_execution_point=>'ON_DEMAND'
,p_description=>'Returns open replenishment and stock alerts for the user''s warehouse, including item details and quantities. Use this when the user asks about low stock, out-of-stock items, or replenishment needs.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ra.alert_number,',
    '       ra.alert_type_code,',
    '       ra.alert_status_code,',
    '       ra.priority_code,',
    '       i.item_code,',
    '       i.item_name,',
    '       i.item_category_code,',
    '       ra.available_quantity,',
    '       ra.trigger_quantity,',
    '       ra.target_quantity,',
    '       ra.recommended_replenishment_quantity,',
    '       pl.location_code   as pick_location,',
    '       rl.location_code   as reserve_location,',
    '       ra.raised_at,',
    '       ra.alert_notes',
    '  from scm_replenishment_alerts ra',
    '  join scm_items                i  on i.item_id             = ra.item_id',
    '  left join scm_storage_locations pl on pl.storage_location_id = ra.pick_location_id',
    '  left join scm_storage_locations rl on rl.storage_location_id = ra.reserve_location_id',
    ' where ra.warehouse_id = (select au.default_warehouse_id',
    '                            from scm_application_users au',
    '                           where au.application_user_id = :APP_USER_ID)',
    '   and ra.alert_status_code in (''OPEN'',''IN_REVIEW'')',
    ' order by decode(ra.priority_code,''CRITICAL'',1,''HIGH'',2,''MEDIUM'',3,''LOW'',4),',
    '          ra.raised_at',
    ' fetch first 20 rows only')),
  'type', 'SQL_QUERY')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260416092043Z')
,p_updated_on=>wwv_flow_imp.dz('20260416092043Z')
,p_created_by=>'SAMANAVA'
,p_updated_by=>'SAMANAVA'
);
wwv_flow_imp_shared.create_ai_agent_tool(
 p_id=>wwv_flow_imp.id(15201407828391493)
,p_tool_name=>'get_user_context'
,p_static_id=>'get-user-context'
,p_tool_type=>'NATIVE_RETRIEVE_DATA'
,p_execution_point=>'AUGMENT_SYSTEM_PROMPT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'data_description', unistr('Tells the model who the user is \2014 name, role, warehouse, manager \2014 on every message.'),
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select u.user_name,',
    '       u.full_name,',
    '       u.email_address,',
    '       r.role_name,',
    '       r.role_scope_code,',
    '       w.warehouse_code,',
    '       w.warehouse_name,',
    '       u.application_user_id,',
    '       mgr.full_name          as manager_name,',
    '       u.approval_authority_level',
    '  from scm_application_users     u',
    '  left join scm_user_role_assignments ra',
    '    on ra.application_user_id = u.application_user_id',
    '   and ra.is_primary_role     = true',
    '   and ra.assignment_status_code = ''ACTIVE''',
    '  left join scm_user_roles       r  on r.user_role_id    = ra.user_role_id',
    '  left join scm_warehouses       w  on w.warehouse_id    = u.default_warehouse_id',
    '  left join scm_application_users mgr on mgr.application_user_id = u.manager_user_id',
    ' where lower(u.full_name) = lower(:APP_USER_ID)')),
  'type', 'SQL_QUERY')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260416091747Z')
,p_updated_on=>wwv_flow_imp.dz('20260416093758Z')
,p_created_by=>'SAMANAVA'
,p_updated_by=>'SAMANAVA'
);
wwv_flow_imp_shared.create_ai_agent_tool(
 p_id=>wwv_flow_imp.id(15202691270403128)
,p_tool_name=>'get_warehouse_health_summary'
,p_static_id=>'get-warehouse-health-summary'
,p_tool_type=>'NATIVE_RETRIEVE_DATA'
,p_execution_point=>'ON_DEMAND'
,p_description=>'Returns a consolidated operational health summary for the user''s default warehouse including open alerts, overdue tasks, pending receipts, delayed shipments, quarantine cases, pending approvals, and open exceptions. Call this when the user asks what '
||'needs attention or wants a status overview.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select w.warehouse_code,',
    '       w.warehouse_name,',
    '       -- Inbound',
    '       (select count(*)',
    '          from scm_inbound_receipts r',
    '         where r.warehouse_id = w.warehouse_id',
    '           and r.receipt_status_code in (''PLANNED'',''ARRIVED'')',
    '           and trunc(r.expected_arrival_at) <= trunc(sysdate)) as receipts_expected_today,',
    '       (select count(*)',
    '          from scm_inbound_receipts r',
    '         where r.warehouse_id = w.warehouse_id',
    '           and r.receipt_status_code = ''PLANNED''',
    '           and r.expected_arrival_at < systimestamp) as late_receipts,',
    '       -- Putaway backlog',
    '       (select count(*)',
    '          from scm_inbound_receipt_lines rl',
    '          join scm_inbound_receipts      r on r.inbound_receipt_id = rl.inbound_receipt_id',
    '         where r.warehouse_id = w.warehouse_id',
    '           and rl.line_status_code = ''PUTAWAY_PENDING'') as putaway_backlog_lines,',
    '       -- Outbound',
    '       (select count(*)',
    '          from scm_outbound_orders o',
    '         where o.ship_from_warehouse_id = w.warehouse_id',
    '           and o.outbound_status_code in (''NEW'',''RELEASED'',''ALLOCATED'',''PICKING'',''PICKED'',''PACKED'')',
    '           and o.requested_ship_at < systimestamp) as delayed_shipments,',
    '       (select count(*)',
    '          from scm_outbound_orders o',
    '         where o.ship_from_warehouse_id = w.warehouse_id',
    '           and o.outbound_status_code in (''NEW'',''RELEASED'',''ALLOCATED'',''PICKING'')',
    '           and trunc(o.requested_ship_at) = trunc(sysdate)) as orders_due_today,',
    '       -- Alerts',
    '       (select count(*)',
    '          from scm_replenishment_alerts a',
    '         where a.warehouse_id = w.warehouse_id',
    '           and a.alert_status_code = ''OPEN'') as open_replenishment_alerts,',
    '       (select count(*)',
    '          from scm_replenishment_alerts a',
    '         where a.warehouse_id = w.warehouse_id',
    '           and a.alert_status_code = ''OPEN''',
    '           and a.priority_code in (''HIGH'',''CRITICAL'')) as critical_alerts,',
    '       -- Tasks',
    '       (select count(*)',
    '          from scm_operational_tasks t',
    '         where t.warehouse_id = w.warehouse_id',
    '           and t.task_status_code in (''OPEN'',''ASSIGNED'',''IN_PROGRESS'')',
    '           and t.due_at < systimestamp) as overdue_tasks,',
    '       (select count(*)',
    '          from scm_operational_tasks t',
    '         where t.warehouse_id = w.warehouse_id',
    '           and t.task_status_code in (''OPEN'',''ASSIGNED'',''IN_PROGRESS'')) as open_tasks_total,',
    '       -- Quarantine',
    '       (select count(*)',
    '          from scm_quarantine_cases q',
    '         where q.warehouse_id = w.warehouse_id',
    '           and q.quarantine_status_code in (''OPEN'',''UNDER_REVIEW'')) as open_quarantine_cases,',
    '       -- Exceptions',
    '       (select count(*)',
    '          from scm_operational_exceptions e',
    '         where e.warehouse_id = w.warehouse_id',
    '           and e.exception_status_code in (''OPEN'',''UNDER_REVIEW'')',
    '           and e.severity_code in (''HIGH'',''CRITICAL'')) as critical_exceptions,',
    '       (select count(*)',
    '          from scm_operational_exceptions e',
    '         where e.warehouse_id = w.warehouse_id',
    '           and e.exception_status_code in (''OPEN'',''UNDER_REVIEW'')) as open_exceptions_total,',
    '       -- Approvals',
    '       (select count(*)',
    '          from scm_approval_requests ar',
    '         where ar.approval_status_code = ''OPEN'') as pending_approvals,',
    '       -- Stock counts in progress',
    '       (select count(*)',
    '          from scm_stock_counts sc',
    '         where sc.warehouse_id = w.warehouse_id',
    '           and sc.count_status_code = ''IN_PROGRESS'') as counts_in_progress',
    '  from scm_warehouses w',
    ' where w.warehouse_id = (select u.default_warehouse_id',
    '                           from scm_application_users u',
    '                          where u.application_user_id = :APP_USER_ID)')),
  'type', 'SQL_QUERY')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260416091943Z')
,p_updated_on=>wwv_flow_imp.dz('20260416091943Z')
,p_created_by=>'SAMANAVA'
,p_updated_by=>'SAMANAVA'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_bar
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(35046988824105911)
,p_name=>'Navigation Bar'
,p_static_id=>'navigation-bar'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35053567828105935)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_static_id=>'---'
,p_list_item_link_target=>'separator'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(35053684031105935)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35053684031105935)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_static_id=>'app-user'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_01=>'&APP_USER_INITIALS.'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35053771690105935)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_static_id=>'sign-out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(35053684031105935)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_menu
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(35046829004105911)
,p_name=>'Navigation Menu'
,p_static_id=>'navigation-menu'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35053841586105935)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Approvals'
,p_static_id=>'approvals'
,p_list_item_link_target=>'f?p=&APP_ID.:14:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-clipboard-check-alt'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35053903344105935)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Counts'
,p_static_id=>'counts'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-check-square-o'
,p_security_scheme=>wwv_flow_imp.id(35049260646105914)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35054073738105935)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Dashboard'
,p_static_id=>'dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-bar-chart'
,p_security_scheme=>wwv_flow_imp.id(35048666245105913)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35054189932105936)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>'History'
,p_static_id=>'history'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-history'
,p_security_scheme=>wwv_flow_imp.id(35049260646105914)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35054274344105936)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Inventory'
,p_static_id=>'inventory'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-cubes'
,p_security_scheme=>wwv_flow_imp.id(35048666245105913)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35054357940105936)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Items'
,p_static_id=>'items'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-cubes'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35054428220105936)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Lists'
,p_static_id=>'lists'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-list'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35054508524105936)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Outbound'
,p_static_id=>'outbound'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-shopping-cart'
,p_security_scheme=>wwv_flow_imp.id(35049064416105914)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35054663718105936)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Partners'
,p_static_id=>'partners'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-building-o'
,p_security_scheme=>wwv_flow_imp.id(35048939963105913)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35054703432105936)
,p_list_item_display_sequence=>180
,p_list_item_link_text=>'Performance'
,p_static_id=>'performance'
,p_list_item_link_target=>'f?p=&APP_ID.:18:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-line-chart'
,p_security_scheme=>wwv_flow_imp.id(35049188188105914)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35054803876105936)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Receipts'
,p_static_id=>'receipts'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-receipt'
,p_security_scheme=>wwv_flow_imp.id(35049553730105914)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35054940605105936)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Replenishment'
,p_static_id=>'replenishment'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-bolt'
,p_security_scheme=>wwv_flow_imp.id(35049737050105914)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35055062761105936)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Returns'
,p_static_id=>'returns'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-recycle'
,p_security_scheme=>wwv_flow_imp.id(35048790831105913)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35055180437105936)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Security'
,p_static_id=>'security'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-users'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35055233597105936)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Tasks'
,p_static_id=>'tasks'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-clipboard-check-alt'
,p_security_scheme=>wwv_flow_imp.id(35049936342105914)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35055355431105936)
,p_list_item_display_sequence=>170
,p_list_item_link_text=>'Traceability'
,p_static_id=>'traceability'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-qrcode'
,p_security_scheme=>wwv_flow_imp.id(35048827808105913)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35055407345105936)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Transfers'
,p_static_id=>'transfers'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-exchange'
,p_security_scheme=>wwv_flow_imp.id(35049260646105914)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35055551660105936)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Warehouses'
,p_static_id=>'warehouses'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-map-marker'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/listentry
begin
null;
end;
/
prompt --application/shared_components/files/icons_app_icon_144_rounded_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000090000000900806000000E746E2B800001000494441547801EC5C0B6C1CC779FE67EFC92379C7BB23454AB249532229897294C6941F92484A965DDB405B17688BD44580CA6863146E83202D5AB87014F3A8';
wwv_flow_imp.g_varchar2_table(2) := 'C42DD020861D20465A278D9C04410207701227766CC98E4CEA4547B49C489428CB7A5A12258AEFE73D77F3FF7347996478C7BBDDBDD7EE1CEE9F9D9D99FF9F7FBEFFBB997DDD4A203E02010D08080269004FA802080209166842401048137C4259104870';
wwv_flow_imp.g_varchar2_table(3) := '40130282409AE013CA824082039A10504D204DBD0A65C3202008649850E667208240F9C1DD30BD0A02192694F9198820507E70374CAF82408609657E062208941FDC0DD36BEE09940674CA371B1C4A6047D978608B6F2AB0A366A4635BEDD857B7AE9DF8';
wwv_flow_imp.g_varchar2_table(4) := 'EAB67566101A2B8D99C64E18101684491AD0E5BC495E09A428C086025BD60F75B6EF1AEA6C7B11E5D870675B786474557084C99351661B0E317940912C9762B2F5A3886CE93783D05869CC3476C280B0204C081BC26828D0FEAD21C20CB1230C73CE9A79';
wwv_flow_imp.g_varchar2_table(5) := '1DE6944093FFD556351A687F7424D0F6EC70A06DDFC89EF651C66CA719C05E06EC499416006603F1498200B311468CC13F33C20CB1230C39969DED5F1BE96CFD0B9AB1922867A5386704A25F4A34025B65509E52187B1A187B1047E441115F6D0878084B';
wwv_flow_imp.g_varchar2_table(6) := '05E0CB0AB0A76260D94A586B3399BE76D609A4FC6F8B6DB8B3ED09947E19D8CF70B05BD3774FB4CC0C01B64D61D26BC37BDA4E0F77B6FF23619F997EE6ADB34AA0A1AF6D593D7CDD750480FD1F63AC09C42727083060EBB0A3EF0C0F941EA6C306CC67ED';
wwv_flow_imp.g_varchar2_table(7) := '9B3502E1BADCCC62B61E1C0C1ED764CD7F613805028CC1E650048E0CEFD9B63145334D555921109E82B6E25275183D5B8DA2D35798518300FE80D782623934BAA76DBB1AFDE574742710CD3C3293DEC48E3D28E25B1808786232BC9E8D99485702298116';
wwv_flow_imp.g_varchar2_table(8) := '17E2F50A638CB69815DF424180C744917E9288916E6EE94AA011E67A1197AE66DDBC13867446806DE431D2D1AA6E041A0AB43D0EC07681F81438026C573C56FAB8A90B8194E7B6943006CFE9E392B0926D0418C037F45ACA7421D0E88415671EE6CDF6C0';
wwv_flow_imp.g_varchar2_table(9) := '857D9D1060CC370AAEBFD7C39A6602D1657399C197A0703FC2B325105018FB22C56E89AA8C8A3413086FE03DCCE2573E33EA5834CE3B021B28765ABDD04C203CEB12B38FD628E44B9F31CDB1D3442025B0C3090AFC69BEC62FFAD58800C68E4E80B458D1';
wwv_flow_imp.g_varchar2_table(10) := '44A03188DE873390261B5A9C17BA1A11604C1A9BB0DCABC58AA6E02B8A749F96CE856EFE11D01A434D049225451028FF1CD0E481D618AA26109D023260AD9ABC2F706573B8C7344D02AA0934D2796F3902EC4711DF22468001542B5FDF54AA7608AA0924';
wwv_flow_imp.g_varchar2_table(11) := '83B54C6DA742AFB010189A2E57FDE88D6A025921662F2C1884376A11B05A15D5FF84514D20C96257DDA9DA810ABDEC20202956D593816A024515310365279CB9B71A89452C6A7B554D208B2C39D4762AF40A0B012649B927505452BF6E16167C59F0A6C8';
wwv_flow_imp.g_varchar2_table(12) := '4C4A60C9FD12C664F5AC2D167C07264240522CFEAAF5330672EE09041093D53A5C0C7A97468370632ACC85F2C5E0733E7C547D0C940F6773D5E7859159189D8D80B7AA860BE52F6259AEFA2FA67E04811645EBDCF02C8C07A3E0AEF041C35DAD5CDC5E3F';
wwv_flow_imp.g_varchar2_table(13) := '8C61D979AC03F159808020D03C382EE3B235198A4269B91B9AEEB91F98C5CAA569F3762CF3C004D6519B792AA6CF0A0225283088C73B23B86C95B8CA61FDBD3B41B27E729D54B2D9B1EC7E70B9CA80DADCC4B60935D36F0481900213B83C5DC3332E87B3';
wwv_flow_imp.g_varchar2_table(14) := '04366CD90916BB134B177EA96CFD7DF783C3510257B1ED24EA2C6CA1C75EF1D9303D81A23105E6CEB2D6DFDD0E562448B2305A9DA5B06E732BAFBE3416C4F35085E7CD9C989E409C088A02B58D1BC151BEFC5FDB9C1E3FD4366C80A8ACC065249199C943';
wwv_flow_imp.g_varchar2_table(15) := '633735814666223077D05CD3F829C2232DA96EDA04AE32373F5B1BC3E3A6B4940CDAC8B404A2A5EBCA788887B5E14FB6F06DBA0903068D9FD9CA9B930D196723BE63C2C4B404BA3E19021997AEBAA63BD35ABA1673C3515E01B4ECD152767D32BCB8DA34';
wwv_flow_imp.g_varchar2_table(16) := 'FBA624503022C3102E5F36BB03CA7C5530333AA84ACA51D78AA7F883D36108470D7D6727E90FC29404A253764224120E41DFD1DFC0C923EFA892BE9E03108DC4679F81FCCE42349CBC88E90844B30F5D51F6DDB616363EFA842EE25DBD86DF3B8B18FBFE';
wwv_flow_imp.g_varchar2_table(17) := 'F29204351D818670B92124EA1F780C563CB84B17A9DFF9B7641286A6237C6BA6C45404A2B3A591D9289E430194DFB943B738BB37E17D33B44697057063AAAFA908348AE4A133AFDACD3B81A5B8E29C290398C305B7B7EC80089ECE8F631F99EA17737B53';
wwv_flow_imp.g_varchar2_table(18) := '11881ED3A060D5DCFD306D928A129C82C17DDF83732FEFE632B87F2F50595205ACA8D9FC10A6C02F2EF28C4912D31048C16B3E74D5D98177DB5D1BB6250D6FE4FA39E879F673D0F7DA77E172EF012E7DBFF80E2F8BDCB89054AF74633BD84ACAF8231F49';
wwv_flow_imp.g_varchar2_table(19) := '1B19B0C234049A08C6806E7DD6DEFD40CA309EDC1B80E0F830AC6B7D04EEF9DCBF7159B7F5215E766A6F474ADDBACDF7F37B64D3E158CA768554A9D517D310682A1CE55855B5C4971ABEB328993DFB5B18BB7601EA5BB6836FDDDD60C1BBEF24BE0DF742';
wwv_flow_imp.g_varchar2_table(20) := 'DDA7B7C0C8D5F3103C7F7C91D627BB55773DC877A64282401C082325B378F599C6E3B863136D9694D9EBF125AAB4B2E68FEA5DBE6A5E36D786EF2C4A9CB577F292A089AE4A9B6606220239CB52BF43C05656C109100DC56FB2F29D44A2C8F119CCEA7227';
wwv_flow_imp.g_varchar2_table(21) := '4A96D8D81C60C7E3A06044CC404BA053BC4574E73D8607D1AE8A4A48F571D5C56790EB67DE07391ABF4541ED293F70AA975F3F2AAD4F3E83515B97C707620622240C24A1C42D06E73204B2F85641F39F3D0EA30397E18357BE05578FBE015750283F7673';
wwv_flow_imp.g_varchar2_table(22) := '0036FEE513207956A44486FAA08375B3DC5C9552A261904A192FF0D1509C6E3F6D524AF5C39F874D7FFD2F109E9982CB7DC7E06314CA6FFA9B2F40D503BB52EA526589273ECBD1631EB46F7431058168F9A240D2E3A8B45D4EFCDBFF0E767CF320B43EBD';
wwv_flow_imp.g_varchar2_table(23) := '175A77FF00763CF70EF8DB1F5B4E8DD73B12248D2548CB0B8D9824C6640A02CDC5D29E086E62ECCB6E6C350D605B510F60B52FDB76AE81DD139FE5C40C34878801B678FCCC47A12832DF6633614CE2E6E93888670C9EC4476BF441B2F800C37885399ECB';
wwv_flow_imp.g_varchar2_table(24) := '5E1A1A1FE2C6A5449F7CC7C08929086449443338319CF55086127D58983918640A0259E7089483196876EC2627A9D52208C481304242FF7BA77104C7E2CB0BE5B325737D0C4E99E3E944C3CF40F45E1F7A350B116636B1BC503E1D097ED40BC173BDE934';
wwv_flow_imp.g_varchar2_table(25) := 'BDD5662641527AA7D0DC5FA66F551A309339818A08047A511491A76AE56DE0AF5E05C1A90990C707D31EC1891F3E0B277EF8DF69B78F8D0E403838837DAD06EA934844044EDB401136342C81E86550F404622512A7FE33ADE05DB1928767F2EC31BE4D27';
wwv_flow_imp.g_varchar2_table(26) := '9163319063F19BA8E9B49FFAF0B7BC99AF7A35509FD437119888CC2B0C981892401430FED79DAA1A58D3D2CEC3E65EB19A6F474EBFC7B7D94886FAE3B6CB57ACE2E6A96F6F65357FCC957CE285064B0C47A01B93611E308FBF0AD6B6B4DE0A97D5E182B2';
wwv_flow_imp.g_varchar2_table(27) := '720F0CF4F5DC2AD33B73ED640F94B92BF0C2F527EF176A686903B7B792FB44BEE9DD67BEED198A40B391185C9F0C81C3E184469C7998645D80AF0F97B3D0CC2484AFF42F28D7632774F9244443B3E0C3E56BBE3D66B142D3E676B03B4AB86FF4C7C6F9F5';
wwv_flow_imp.g_varchar2_table(28) := 'C59E370C8114BC5F41673D0A46A4E9AE6D0B5E518745FCEBA95AC5B7E31FC6971ABEA353327E267EFC539158BEE69BA557E4357DFA1EFE4CF6A5D1D9F955459F370C81A6C231FE2097DBE383126FD59281A172ABD5061F1FF9F592F55A0A2F1D7E1DC876';
wwv_flow_imp.g_varchar2_table(29) := 'B23BFEAECA957C099D8DCA60A487EE7348202DE1595E371CA5B907C0ED8F3F8F934C63655D038CDFB80C931FEC4BD624E3F289DE37606A780056D737A6D4F5F857F0FA109288670C9018874089A70EDD8987DF93C5A67ACD7AB0E071C9D95F7D2F59938C';
wwv_flow_imp.g_varchar2_table(30) := 'CB3FFCE5FFF3D9A7AA7E434A5DB720504A7CF25A39F7FC8DB5C495D20FC9E680DB1A36F05968EAF7EFA46C9B4EE5E4F1B76012679FDB1B9A973CEE9A6FC3E62AE3BB467AD8CC3033108F4C9A49555D13D8EC76F8E88DBD696A246FF621CE64763CEBABBC';
wwv_flow_imp.g_varchar2_table(31) := '23F5F2C52DE0813E6DE38B2DE58A5F4C49207A89786DE34618BD7A1EA64FBEAB3A8A53BF7B1B26063F86DAA68DC0A485970C541B2D324553128862E4C35988AE17F5BDF23C283313549491900EE9D2CBC9BDB73764A46BA4C6A62590128D02057F7AF426';
wwv_flow_imp.g_varchar2_table(32) := '9C79F9998C637A66EF6E98991805BBB304C8565A0658FC19A1789A9646C1372A0602E90E225D31EE3FB21F26C647C182411D387D0C6EBEFD72DAFDDC78F3BB30D0FF3ED79D1C1B01B2453697359038065AB65D1135301D81C2D313D077E82D989A1C075F';
wwv_flow_imp.g_varchar2_table(33) := '890D9AAB4BC16E91E0E4CF5F82E0850F960D1D3D1F748A0E9C518774C906D9229BE134974265D95E8AA781A908348BCBD5C983FB20149C8595E50EA8F53AC12231B803B714B2E32F3D0DB1B11B945D526223D7E0FD9776F33AD2215DB241B6C826D99E4D';
wwv_flow_imp.g_varchar2_table(34) := '3C54CF1B2549C412960498422E9EC0ABCF278EBC0DD1588413A6BADC7ECB5D97DD0235B84F0F9CBDF73FFF0003BF7C1106F7BF0C11BC391A09CEF03C95F57CFDF34037638930A43367806CD55538211A8DC08943B834625F737546DF9A62061ABAD80FFD';
wwv_flow_imp.g_varchar2_table(35) := 'BD87F9314B83DF0515B8742D0E6C0DCE48D56576084E8D43FF5B3F82BE5FBC04441E12CA535908973F6A438459ACEF75D9806CD33115F53574E9CCE226B7F6C512760B8AC2CF5C39D50BE74F7DC08F731A2B5D50E6B024757AA5DB019FAA29036AB7D65F';
wwv_flow_imp.g_varchar2_table(36) := '02565CDE48284F6554476D921920DBD4CE867AE7FB8EC3D5D3BD4B36154BD892B01456612C1C8273C7DE856B17CF82CB668126248FD3262DEB241DD794E29256EEB002059A84F2544675CB19A03ED65595F23EAF5E380BE77ABB408E24DE3784677CCBE9';
wwv_flow_imp.g_varchar2_table(37) := '175BFDF28816D9887EDFFD26BCF7FA8FA177FFAB303C38007496D45889B38985A8909BC158B1AF069CC1BC253618BE710D8EED7B95FB44BEE5C683DCF562180295E1AC41B304891B678F4A970D68E9A1B324C6D491C7E3B402899A7048B88CD5E1D91DF9';
wwv_flow_imp.g_varchar2_table(38) := '40BECCCD62E41F891A9B85A8A39A401690C28534203A88A5E30F9235FE12B80DCF8A28685A7C241B245A6C900F64838844BE9190AF5A6CEAADAB2596925A6762929C58D8D55A107A8582800C31D593816A0259994575A785029CF0238E809658AA26901C';
wwv_flow_imp.g_varchar2_table(39) := '0B47E2DD8BB4D81190D9BC378A663818D5048A82988132C4BA609B47A34CF564A09A404EBBA4BAD3824572CE31936D1D60537D38A29A40E1305EA93319D0461D6E0466734F205F73CFB4A240D0A8A09A655C14438AA5DAF1AA9E81D86721064CC9DE1FCD';
wwv_flow_imp.g_varchar2_table(40) := 'D58E48E8658600C690C73233AD5BAD5513882C306007682BA47811601A63A8894092220B02152F77B8E75A63A8894015603D4A6B28F74424458700C58E62A8C5714D0462810341C6949F6B71C058BAC5351A8A1DC5508BD79A08C43B56E4E7F95624C587';
wwv_flow_imp.g_varchar2_table(41) := '800EB1D34C207FE0D0510071365684ECE989C74E9BE79A0944DD3305C42C04C5F5D12B66BA10C80B969F8202578A0B42537B7B95C74C07087421101E884525A67C41077F84891C20C0407E9262A64757BA10881CF17674D3D9D80B941752D008BCE0EB38';
wwv_flow_imp.g_varchar2_table(42) := 'F89A5E1EEA462072C85733FD1F0A40FC6D935420245D0472D24E51940314233D3BD39540EC1DD5F6BE00000255494441549F7A231625FC593C1E1AD3D349614B3B02F8C3BEE1B4851FA31869B7F689055D094466BD81A31725097622892ED2BE90424040';
wwv_flow_imp.g_varchar2_table(43) := 'B96461F2C3655FEE49FEC77F956EEA4E20F2C3FB4CD7719B3DB81914653FED0BC91F0278BBE21D9B2DD4E27DE6E0EFB2E1455608448EBA9F7E6FD8D7DCFD08AEBBDFA67D217941E01BFEE6AE872816D9EA3D6B042287E93993CA40F7934C519EC4D948F5';
wwv_flow_imp.g_varchar2_table(44) := '536F644B48FA0828A0D0EBF01FF37774FD3BC5207DCDCC5B66954073EEF802DDDF56ACD13548A20E00E5E3B972B1D51981F8C5DC0058A28D489E9FE86C7D4973392110F55CB9FBC8557FA07B8F6F4377BD02F25F2191DE44C19303AA15A21601D48B2188';
wwv_flow_imp.g_varchar2_table(45) := 'AF3150FEDCD7DC750712A793B0C6F29C7C7346A0B9D1D0945AD971F0557F47F723CC31E39514D88E755F4232D14B0A4F800251DC17DFA510886373020F8CBF8FB3F9BFE2D5FF1DB233E6ADECE87AD4D7D1FD2BC27629B56C96E59C40F307E3FBCFDE716F';
wwv_flow_imp.g_varchar2_table(46) := 'A0ABCBDFD1F582BFA3FB717F47D7267FA0CBE6F35E73FA14A9DCAA44FC0E455AC9E4589D458A36D8A4D87A33088D95C64C63270C080BC284B0218C2A035DBBFC81EEE7BDCF74BF5BF5D4A1C9F998E63A9F5702251B2CFBE24721BC5733E5091C19290B1C';
wwv_flow_imp.g_varchar2_table(47) := 'B8EEEB3C74B9E22B87CFB9BF72E88C1984C64A63A6B17B1003C282304986573ECB0B9240F90444F49D1902824099E1255A2F42401068112062373304048132C3CB38AD751A8920904E409AD58C20905923AFD3B805817402D2AC660481CC1A799DC62D08';
wwv_flow_imp.g_varchar2_table(48) := 'A413906635230864D6C8EB346E41209D80348F99852315045A8887D8CB100141A00C0113CD1722F007000000FFFF2F80DDE700000006494441540300EF8AF98A1CCF949C0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(35051129361105915)
,p_file_name=>'icons/app-icon-144-rounded.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_192_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000C0000000C0080600000052DC6C0700001000494441547801EC5D7B8C1BC779FF48DEF148DE8B773A9DEEFDD2C377B625D94A654B8A93D64E81166950A32E8AA228D0B4C83F4D83FE13B44DEBFE11070D5A';
wwv_flow_imp.g_varchar2_table(2) := '14059AA66E8C022EEAC40512BFEA3676D5D6762C3BB0245B8E5DCBBE5325EB61E9A493649DEEA17BDF914732F31B7267F7A8DBE32E6F492EB91FC1D9FD66E69B6FBEF9CDFC766767974BFFE4B73E9FE2C01878750CF8893F8C808711600278B8F3B9E944';
wwv_flow_imp.g_varchar2_table(3) := '4C001E059E468009E0E9EEE7C67B9800DCF98C004F81780C781C013E03787C0078BDF94C00AF8F008FB79F09E0F101E0F5E63301BC3802B8CD0A0126808282052F22C004F062AF739B15024C0005050B5E448009E0C55EE7362B0498000A0A16BC804076';
wwv_flow_imp.g_varchar2_table(4) := '1B9900D98870DC530830013CD5DDDCD86C049800D98870DC530830013CD5DDDCD86C049800D98870DC53087888009EEA576EAC45049800168162B5CA4480095099FDCAADB2880013C02250AC56990830012AB35FB955161160025804AAACD5D879530498';
wwv_flow_imp.g_varchar2_table(5) := '00A6D070861710600278A197B98DA60830014CA1E10C2F20C004F0422F731B4D1160029842C319958040AE3630017221C4F9158D0013A0A2BB971B970B0126402E8438BFA21160025474F772E37221C004C88510E7573402154C808AEE376E9C43083001';
wwv_flow_imp.g_varchar2_table(6) := '1C0292CD9427024C80F2EC37F6DA210498000E01C966CA1301264079F61B7BED10024C00878074951976C632024C00CB50B1622522C004A8C45EE5365946800960192A56AC4404980095D8ABDC26CB0830012C43C58AE580805D1F9900761173483FB69A';
wwv_flow_imp.g_varchar2_table(7) := 'A473138B745E04C80E99653336116002D804CC09F595CCE09F5F49D09C082002D29CB0CD36EC21C004B087D7A6B597E3493A7B7391628994B2051924409E4A64A1280830018A0273BA92C558424E7B5693E9C11F89D4120272E3821020017410E7501C04';
wwv_flow_imp.g_varchar2_table(8) := '9800C5C19930DD393FB9446AF0D7D6D1D0A15F96212264B8813CE82C08A220CEA1F0085410010A0F56BE3560F0E3E89EC81CF96BC5801F3AF805AAAA09CB001969B00F1D5C18A30CE21C0A8B0013A0B0F8122E6E3F995A52B5D4D637C8A33E06BF960819';
wwv_flow_imp.g_varchar2_table(9) := '6703ED4C009E5C146578754843A8707B2640E1B0A5A418C917C4B407477554130E8769E8C043140886105D13908633414D289D87E910CAC2C61A458E388A0013C05138D71ABB208EE2380320B5AABADA74F0231F419E09EE7F90A08BF8B2582E359E3D90';
wwv_flow_imp.g_varchar2_table(10) := 'C6C159049800CEE2A9AC5D9E5E9617BE48F0F97D3474DF2F5275A41ED10D434D5DA3D4F58B3250C47D82AB33CB103914000126400140BD391FA3C9C5B8B23CB8EF1045A22D64F51311BA77883294F98CCFC7697241B79749D6772CE58D0013206FE8D62F';
wwv_flow_imp.g_varchar2_table(11) := '8875FCABB32B2A7360682F356CEB5671AB02CAF40DED56EA57C45960299E5071169C418009E00C8ED24A2A95A25131F5113B196F69EBA4AD034352CE67B36DE02EDADADE258BC266DA76FA269A4CE4CDA61160026C1A42DDC03571E4C7852B52B09AD3B7';
wwv_flow_imp.g_varchar2_table(12) := 'F77E889B0A7D7BEEA390583D8291A578923E9D8B41E4E010024C0087809C5B5925CCD561CEE723DAF59907285015447453C12F6CECBCF710C1260CDD10D717986641E6B0790498009BC750AEF763D54733D5B3F32E5B17BD5A39B37DA4692BF56C4F4FA5';
wwv_flow_imp.g_varchar2_table(13) := '782AB416A5CDC698009B4550941F9B59514F77E24E6FDB8EBB44AAB3DFB65DBB497B5C02D3ACABA24E676BF0A63526C026FB1DD311E392E776CCFB7D058055D8ECDF7B9FF276422CB3F2AA9082236FA1003D95B72F655910477FCDF1F6EE7E0A376ED1A2';
wwv_flow_imp.g_varchar2_table(14) := '8EEF6B9B5A695B678FB48BA9D0F559BE2096606C62C304D80478334BABA43DBA8CC7173A07EFD984356B45BBEFDCA71E9598595E55779BAD9566AD6C049800D988D8885F13CB9E9A7ABFB8E11508D668D182EDF1D05CDFE01E65DFE8834A64C13202654C';
wwv_flow_imp.g_varchar2_table(15) := '00CB6D2C88E2C4428C7031AA193FF7D17B74E2F0334509E787DFD7AA9567A05B4BFC988402C4A6C004B00918D471C7D74D37A4AEF1B500BA25AFC004C80336ACFAE037BC79142D48113C72CD6781FCA06502E4819B76C71745F77FE5317AE8F1A32509FB';
wwv_flow_imp.g_varchar2_table(16) := 'BFF24DB82083D12799C01B4B0830012CC1A42BCD8995171C719112AA6BA4BADD0F422C49A8DBFD1085EBA3B26EAC46F17D010985AD0D13C0165C44370DCFE5EF78F011F20502362D38A09E3181BA073EFF7026267C9BE78B610586458109601128A8E147';
wwv_flow_imp.g_varchar2_table(17) := 'EAB32BAB10C91FF053CBA147A45CCA4DCBC187A52FF0615AAC0669BF3F469C436E049800B931521A13E2E88F3BB048E8D9F74BE4AF6B8258D210686CA5EE7B3E277D48A688E0A38CF0C612024C004B30A59570844D4B441D9F2BFDD15FF3A5F301DD175E';
wwv_flow_imp.g_varchar2_table(18) := '0DD250B1B6670258C3897081897778423DD2D442A1FE7B20DA0EC9D99B74EDE5C7E9CC3F7F9DDEFECB2FC900F9FACBDF23E4D936280A84767C86C20D5121112DC693B49A48499937B9116002E4C6486AE0B91B29884DE7DECF8AADFDEFC2E963F4F65FFF';
wwv_flow_imp.g_varchar2_table(19) := '1E9D79F559BA76EA5D5A9ABD2503E4D3AFFE48E641C7BE65A2CE3DBA4F465FF3B1E5E6324EFBC604B088E8ECB2FE83F4E6A103164BE96A53479FA3134F7C835616E6F4C42C0979D0993EF642564EEE68F3D0FD4A8909A0A0C8293001724244849595C5CC';
wwv_flow_imp.g_varchar2_table(20) := '1B19FC81004576E8CFE55B284EF11B9FD0F0BF7F4FA936B777D1BD0FFF011DF8F29FCA00B9A9BD5BE543377EF3B28A5B116A77DD4FFECCBB84E66309C2E31A56CA795D8709606104E088AAADFEB40DEE239F8DA73E538904FDFF53DFA4C46A42DC33A8A2';
wwv_flow_imp.g_varchar2_table(21) := 'BEFD5FA0C12FFE3E85B77691BF3A2403E4A12F7E997AF73F44E4F3D36A3C4EA77FF018A12C59FCF842B5D4BA732FE103C2F2CB758144EEC004C88DD19A67EE5BEF3E68A184AEB272798426AF5E9409C16090DA86F611F97C74DB47A4B58BBC604DFA91EA';
wwv_flow_imp.g_varchar2_table(22) := '89D1B314BB76E636B58D125AEF3EA4B271165011164C1160029842A367181F7BAEEBBD5BCFB020C5A6AF2BADE6EEEDE45FE7C5B89A823F18A6A6B6F47B8090169BD4CB229E2BD4F7E9BE197DCE55CECBF9654480D275D35266FE0F0FAA5BFBB1B31CE273';
wwv_flow_imp.g_varchar2_table(23) := 'D34AB7B6799B92CD04A34E7C6ECA4C6DDDF4606B9F4AE7BF5B52506C283001368487E4FBFD7187156A75CD5BC95713866839845B7B95EEC2D40D259B09469D506BB799DABAE9BE4803451A9B641ECE007C212CA1D870C304D8101E22E391B4B1737B0EED';
wwv_flow_imp.g_varchar2_table(24) := 'DBB36BDA77A8C4A9B10B948CE97F96A132324222B64C53D7AF646244A1F69D4AB62A443B0794EA92B829A6222CAC8B0013605D58F4C425B17AA3C51ADAF5298696966B1F88B65257E6C6D9CAE2225D7EE715D32297DFF95F8AAFA45F85DEBDE720F91B5A';
wwv_flow_imp.g_varchar2_table(25) := '4C75CD32EADBF5291ACE02667A9C9E46800990C6C174BBB29A527991367D70A9440BC2F6DFFA13AACA2C9D5E3B3B4CA70F7F9F966E8E5132BE2CC3E2F8153A73F829BA2EF260AEBA264403BFFD67106D875A2301F80C90133F26400E88F057459A4AB071';
wwv_flow_imp.g_varchar2_table(26) := 'AB26DADA0744B9DDBFF93555665A4C733EF8F153F4CE0FFE4E86932F7D5F4C7DC6543E74030D86BA544E6EC1E8A3D1F7DC25BDA9C104C8D1EFB8A9A4A9F8C5CD264DB6BB6F3AF408DDFF477F4B35B5F5A64591079DE8C1DF30D5C995E1AF8928958476F7';
wwv_flow_imp.g_varchar2_table(27) := '4EA5B0908D0013201B91AC78D230888C832B4BCD52B476E8B374F0D1A769E8577E873AEEDA4FA13AACDA344BF9CE5FFD5D99071D4BC64C948C3EF219C00424433213C000C67AA2B6048A3CE3E0423C9FE017539BF62F7D8D06FFF03B74E86FFE9B0E7CFB';
wwv_flow_imp.g_varchar2_table(28) := '2529B7FDDA57C5456F7ED31EA31F819A5A154D1A9D57A92C1811600218D158475E3305324C2FD6517545129E09D21CE133808684F99E09608E8DCC59338F361C5D65A60B37C6B35425FC2EA6D01033016C20EC4B256C68974AD5A72A365EBFA84416D620';
wwv_flow_imp.g_varchar2_table(29) := 'C0045803C7ED11BF4F1F50A995C5DB155C969234F868F4DD656EBAC61D26408EAEF0EBE39F8C832B47B19265A7561654DD46DF55220B6B106002AC81E3F648C07006481A8EAEB76BBA23C5E86315332067A73001724014300CA2E48AF9836C39CC142D3B';
wwv_flow_imp.g_varchar2_table(30) := 'B13CAFEA32FAAE12595883808B09B0C6CF9245AA03FA1C68757EB2647E58AD78D5F01B826A0379AD96F79A1E1320478F1BEF252D4F5CCBA15DFAECE549DD475E06CDDD1F4C800D30BA726B996697D3EF0285DAD2C455EC5C1D166FEA3EC277B4C1D50E97';
wwv_flow_imp.g_varchar2_table(31) := 'D839268049075C9E5EBEED3D9BF386C16552ACE4C90B5924C5BB429904E6DDC20458071B0C18FC0B4C76D6FCB87E74CDCEB31B4FCE4ED0C877BF2A0364BBE5CDF4E76EE8BF28D3744082317136D3E2BCD7116002E8584809831F034646C4A6B553FF5DEE';
wwv_flow_imp.g_varchar2_table(32) := 'EC4D7D7E2DB236F5BDF5D1111A3F3F2C03E435C63611999FBAA94A6FEBEC5132FED78049A0E0500213404141943DED69EBEAA5FEBD8728BA457F4A3376EDACA144FEE2EAB2BEA46A94F3B748141BD3DF23D4D4D24A7D7B0F12DAA0D90409D0462DCE7B22';
wwv_flow_imp.g_varchar2_table(33) := '26406614606018A73DED3D03D4BBF700E12556D166FDB7B9F39F7C486EFDCC7D7252B9D6D02C482B6EE2A10D688B968136A2AD5ADCEB7B26801801181018184294DFCEFE1DD4B37BBF907D2210E1752852109BA9731F88AD3BBF536775DFEA4100E9A64F';
wwv_flow_imp.g_varchar2_table(34) := 'B6854920C1B86DE3790260CE6F1CFCDDDB7751D79DBF20804A0F7E2150382A8EA61044B8715AFF936A1175CD37954CD20D03012251FDAC45942641972036653E68335F1390B7A740E3F3B1354B9DBD3B87A863705F6688E83B7F5535353434CA8495A505';
wwv_flow_imp.g_varchar2_table(35) := '8A7F7A41CA6EDAC0A7D852FA69D5C6A666F205AAB2DCF351A7203608AE65E09A0018687137EC8BED83BFD815BAA53EDC24BA3AB3A2DCE91183BF6D57FAEDCA2AD120346FEB50B199D3EF28D92DC2CCE9E3CA9568ABEEAB4ACC0820B89104C060CE70B32F';
wwv_flow_imp.g_varchar2_table(36) := 'A3E6999D2709904CA66854DCE8D27AB9ADA79FDA3718FCD08BB6EB4B8A633F7B1549AE0AA36FFF8FF2A7A573E3F71781046DDDFA4BBE46C53D02AFBE46D19304185F8891F67BD93A31B5E9DDADFFBB8A1A4559424D7D13D5D537C8D4A92B176875CAB97B';
wwv_flow_imp.g_varchar2_table(37) := '02D2E8263698FECCDE48BF570853B5AAB0FEC37833B3BD7B0E506D5DBA3DF1448AC63DFA1FC39E2480F14657CFA0F9B4277BF0B474F6AAA4A9F7F423AE4A2C913075F288AAB9A5533FB2AB4413A167507F9DFA84382898A85574B2E708B0104B108E78E8';
wwv_flow_imp.g_varchar2_table(38) := 'D59A5088EAB79ACF97A1630C4DED3A012EBEF51261E5C5985F0A19FF2273E9D87FA9AA9B0C2455892642C3B66E0A85C33217FF80B928B091110F6D5C4480E2A03EB3A43FDDD96A63B0C0BB60A48E1AA2E9D78F2FDC9AA485533F457249C3FCF01B045FE0';
wwv_flow_imp.g_varchar2_table(39) := '4463F316AAB2F5EA161FB518FE90037F05053B5E0A9E23C082E1CF2EA2E20868B7B3DB7AF557A45F3AF29CDDE28EEB5F7CFD47CA665BEF0E255B15A20602E0EC68B55CA5E8798E00ABE2824FEBBC507D7A6D5F8B5BD9473BFA095327E8E261B6F8F5F310';
wwv_flow_imp.g_varchar2_table(40) := '4B1256AE9CA2894B1FCBBAC3622A13EDB03EFF9785C4265C1F15DBF4575B1848C7BCB1F51C01561249D5B3B8C1A52216059F3F401D03834AFBEA1BCF28B9D8C2B5379F5755766C874F3E15B72AF80201A5AA5D1BA9040F089E2380E15DB779776F4BD700';
wwv_flow_imp.g_varchar2_table(41) := '5589BBC33070F1C46BB43A995E8244BC58213E3E4A977EF6BAACAE3A18A466C33FC3C8448B1B9F5FBF63CC67008BA0795DCD5F1D243C30071C52C9045DFC8FC721E61FF22879FE85BF27EDE65567DF4ECAE76C9647B51557C4736700A77AB0756088AA83';
wwv_flow_imp.g_varchar2_table(42) := '4169EECA87C768F9A2FE28B24C2CE066E9DCBB743DF3505E50F8B0B51FD39F025658C1A6997980F07E000006E849444154007976AEBF2A487D837B54E98F9FFF072ACA7D013187FBF8C57F52F5F60FDD437CF45770D8169800B621D30B34776F57F70526';
wwv_flow_imp.g_varchar2_table(43) := 'AF9CA7B90F5ED1330B24CDBC7798A6C63E91D61B1AA314EDDAF8B91FA9C81B53049800A6D058C9F0519FFCE14C5A77E485C729B930938E14609B989BA2532F3EA12CF7EFB94FC8F6577E4421FE661060026480C877176E68A6B6EEF45178797E96CEFFF0';
wwv_flow_imp.g_varchar2_table(44) := 'DBF99ACA59EEECBF7D8B5007143B7A062824EA865CCEA1D4BE33011CE881604D485919FBE86DBAF5EECB2AEE94307DFC4575E10B9BD5C11AEC386C120126C026004CA59234FAE1DB74F9FCE935563E7AF63B9470F07169DC671816D32B6325A3A24ED40D';
wwv_flow_imp.g_varchar2_table(45) := '1F8CE92CDB438009600F2FA59D5C8DD1B977DFA04FC746555A55E665B4ABB1189DFA97472915D77F71A6946C0AA9D8128D3CF9E7B41A8FCB925A1D88A0EE73C207F8823807FB083001EC6346AB4B0B74EAE8AB343DA1BF84AAA5B69AEEDC564BC1CCDBA4';
wwv_flow_imp.g_varchar2_table(46) := '27C4AAD0C51FFE551ED60D45C492E7B9A71FA3A9AB9764226CA30ED42513C4063EC017F824A2FCB5890013C026608BB726E8A3A3AFD0E242FA3DFC3EB108D3D55843DDD11005C419A0BF394C6227AD5E7AEF4DBA79E46929E7B3197FED291A1337D95016';
wwv_flow_imp.g_varchar2_table(47) := 'F5C036EA405DA81369C8832FF06969760A510E36102821016C78E912D5994F2FD3F0F1D7292EA6387009037D400CF8AD75414465880403D4D1A05FA08EFCE793B478F65D996767B370FA188DBCFCAFAA086CC2B696803A51377C401A7C1A3EFA13828F88';
wwv_flow_imp.g_varchar2_table(48) := '73B0860013C0124E29BA716E98CEBC7F9C484C4B502428A63ABBB646A821A43F4C8674040CCE68389D9E12FAEF3CFE759A3AFA3C25E7731FA193739334F5D67374E2896FC0940CB0D56A20994C141BD40D1FE08B880AD792D2C74F2F9C42948305049800';
wwv_flow_imp.g_varchar2_table(49) := '3940920FBB9D3C4E97CEEA832A52EDA73BB6D652B85A7F9438DB4CAF981269031379279FFD2EBDF917BF4E47FEF80119467EFC24926580ACA5BFF9E8C374F2B97F94E9D8D454F909B620AF17E00348009FB4FCD133C372750ABE6B69BC5F1F0126C0FAB8';
wwv_flow_imp.g_varchar2_table(50) := 'C8D4446C853E3EF1068D5FD55F39DE288EF83B5B225425CE0052C964E31773130CCCDAA039494C8AAAE4BA9A00ED6C09136CA9C47584EA805FE845D69C8DB04204DF7985681DC00C494C0003184631B63847A78EBD423353132A799B98860C6CC93D20B5';
wwv_flow_imp.g_varchar2_table(51) := '0218982041A7B8480671AA739006E5A0035D9401D16003E9B90248B25DF8D65A57AD54E13B5688D01695C8C21A0498006BE0484716A6C769E4E86BB4B4987ED520565B7AC494A6430CE4B486BD2DE6EF20CEDD6D75746F673DDD2B425BBD7EE10C594B87';
wwv_flow_imp.g_varchar2_table(52) := '0E7451C65E2D69EDCEC610C157F88C14AC10A12D8B62F50A710E6B116002ACC583262E9DA191E347281E8FC99C8098CAE0C8BAA5563FB2CA0C176FE0EBF6E6B05C96859B68CBF0B19FD0C468FAF7C348E3904680092070589E9D1683E32C0DBFF1325D38';
wwv_flow_imp.g_varchar2_table(53) := 'A5FFB00517A0BBC47CBFBE26BDA22354CBE65B2FAE55E07BD030EDBA30F2010DFFF4304D5E3E476873D934A6808E7A9A00270E3F43081FBEF50A5D18F93F5A5C5C5050E3E215032824567C54629909F01DAB55688BE6FAE2FC1C9D1F7E9FD066B41D41CB';
wwv_flow_imp.g_varchar2_table(54) := 'F3E2DE730410339A0DFB1947FDBEA610E1E2B5CA70F4DCB0501E997E6D922ECA1A651175F48B36A02DB8A8F68BBBD61B19CF95BF51D972CDF31C01B6446E9FCB47C4511EAB27B8B38A676D9AD6D171BA831B4201F9DC10A62858F5A1027F70513DD45A4B';
wwv_flow_imp.g_varchar2_table(55) := 'DBC44A166EA081E894F5590F9B2C954D47DD66C07304E812AB39DA8A8BB6BF430C0CAC9E3466EEDE16A3937003EB2EB12A8480A94A31EA0C8A9B6A58C9C2453D88AEB55FDB039B62F8E1A63A3C47003781CFBE941E012640E9FB803D2821024C801282CF';
wwv_flow_imp.g_varchar2_table(56) := '55971E012640E9FB803D282102452440095BC9553302260830014C80E1646F20C004F0463F732B4D1060029800C3C9DE408009E08D7EE6569A20C0043001C6D16436E65A049800AEED1A76AC180830018A8132D7E15A049800AEED1A76AC180830018A81';
wwv_flow_imp.g_varchar2_table(57) := '32D7E15A049800AEED9ACA70CCEDAD6002B8BD87D8BF8222C0042828BC6CDCED083001DCDE43EC5F4111600214145E36EE760498006EEF21F6AFA00814900005F59B8D33028E20C0047004463652AE083001CAB5E7D86F471060023802231B2957049800';
wwv_flow_imp.g_varchar2_table(58) := 'E5DA73ECB7230830011C8131CB0847CB06012640D974153B5A080498008540956D960D024C80B2E92A76B4100830010A812ADB2C1B04980065D355E5E168B979C90428B71E637F1D458009E0289C6CACDC106002945B8FB1BF8E22C00470144E36566E08';
wwv_flow_imp.g_varchar2_table(59) := '3001CAADC7D85F47117090008EFAC5C61881A220C004280ACC5C895B116002B8B567D8AFA220C004280ACC5C895B116002B8B567D8AFA220C004700266B651B6083001CAB6EBD87127106002388122DB285B04980065DB75ECB8130830019C40916D942D';
wwv_flow_imp.g_varchar2_table(60) := '024C80B2ED3A77385EEE5EFC1C0000FFFF586E653100000006494441540300FBA3783984D862070000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(35051269425105915)
,p_file_name=>'icons/app-icon-192.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_256_rounded_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000001000000010008060000005C72A86600001000494441547801EC7D0B745BC799DE3F78107C8B04A81749BD255B922547892C2B9645DA8993749DD3E3F5A69BB47B8EED64F7344DBB3DDBEC69EC66D7894550';
wwv_flow_imp.g_varchar2_table(2) := 'B213B7DDB6EBED6EDA6C9A2889375D9F938D133B711E96B2D192926CCBB1255BB26CCB12F5B25E2400BE093E00CCCE7FC9FB0008922008CC9D8BFBE36030CFFBCFFF7FFF9D0F73672E2E3C402F428010702D024400AE753D194E08001001D0594008B818';
wwv_flow_imp.g_varchar2_table(3) := '012200173B9F4C773702683D1100A240811070290244002E753C994D082002440088020542C0A5081001B8D4F164B6BB11D0AD2702D091A0981070210244002E743A994C08E8081001E848504C08B810012200173A9D4C76370256EB8900AC68509A1070';
wwv_flow_imp.g_varchar2_table(4) := '190244002E7338994B0858112002B0A2416942C065081001B8CCE164AEBB11C8B49E08201311CA13022E428008C045CE265309814C0488003211A13C21E0220488005CE46C32D5DD0864B39E08201B2A544608B80401220097389ACC2404B2214004900D';
wwv_flow_imp.g_varchar2_table(5) := '152A23045C820011804B1C4D66BA1B8199AC27029809192A27045C80001140869379F86E9F08E52254C79EDCBEA8EFEBBBEB07BE767B68F06B2D8B879ED8B974F88996E53DE13B1B29A88701FA067D84BE429FA1EFD087E84B11D0A7BE0C77BB3EEB4A02';
wwv_flow_imp.g_varchar2_table(6) := 'E8DBB76B5D24DCFAA968B8A53DD2DEF29368B8F57824DC7225DADECA632C3521425C84413E56D5971CF7C42626CA23E313AC7B2C11B83E9A60573DCC7B85827A18A06FD047E82BF419FA0E7D88BE14017D3A813ED67C8D3ED77C2FCE01712EF48577AF75';
wwv_flow_imp.g_varchar2_table(7) := '231BB882007AC3BBB645DB5B1E1303FE9F22EDAD43C994EF2C63F023606C0F03F6BBC0601B63AC11E8E50A04345FA3CF35DF8B73409C0B49E63987E746A4BDE55024DCFAD5DEBDBB3F502A60CC66474912000F6F2E8B855B3F299CF98D687BCBA514F31D';
wwv_flow_imp.g_varchar2_table(8) := '07607B81B156065005F42204B22080E70603761763B02FC53D27A2EDAD5D22FC65A4BDE51E3CA7B21CE2F8A2922280FEF01DEB85B3BE16630D5D9CC10BC299FF0180AD007A1102F921B0461CF645711E1DC4732A166E7902CF315156326FC7138058DCA9';
wwv_flow_imp.g_varchar2_table(9) := '8E8677FF5134DCD29960FEF784B3FE5C78A749047A13028544A08933F6289E63D1F6D68E48B8E57378EE15B2033B64399A0022EDBB7F2FC6922F03F37C5B4CEF77DB0120F5E94A045A1863FBA32C79485C62FE0B9511984B374712406F78F7DDD170EB4B';
wwv_flow_imp.g_varchar2_table(10) := '0C3CCF02B05B805E84800D0888D9E67600F64B3C17F19C0407BE1C450038E51253FDBF4F31CF6F80C1871D8837A95C8A08887311CFC948B8E5693C479D64A26308201A6EDD1583E41BC0D8BF7112C0A4AB7B101097050F88CB82137D7B778B998133EC76';
wwv_flow_imp.g_varchar2_table(11) := '040144C2AD0F0170F1ADCF5C79B386334E25D21211109705EB92297674F29CC512FB422E3D2B4D009C03C3AD17C6E07BC058592E06511B42C07604C4B98AE76C34BC7B9FEDBACCA180B20480375EC4DA5BFF818BAD97396CA06A42404D0498E7AB9170EB';
wwv_flow_imp.g_varchar2_table(12) := 'F7F05C565341002509402CA4F8A210FA1130F894AAC0915E84402E088899C0435168F8219ED3B9B497DD464902107BFBDF678CFD4BD960507F84403110600CEE8B42727F3164CF2433D772E50820D2DEFA2400FB03A0172150420830C61E983CB7D5324A';
wwv_flow_imp.g_varchar2_table(13) := '290288865BFE94017C592D88481B42A03008E0B98DE77861A415468A320410DBDB72A730E97F88406F42A0741160EC2F626D772A73DBBA120480ABA4290EB8D5A7843EA57BF691650A20E04D31EF7E3CE78BA5CB7CE42A31E0A2AC612F03B66E3E8A535B';
wwv_flow_imp.g_varchar2_table(14) := '42C0A9083006EBF19C57417FDB092016DEB585013CAC0218A40321200B013CE7637B5BB7CAEA6FA67E6C2700311D7A5C28E71581DE84809B10F0A638B7FD4E415B09007FE0C380FDAE9BBC4EB612023A0278EE177A4150979D6B6C2B0100F0FF9EABA2D4';
wwv_flow_imp.g_varchar2_table(15) := '8E10284504521E0FCE806D33CD360288845BEE07C676D96639754C082880809805DC150DEFFE1DBB54B18D0080C19F02BD0801420038637F66170CB61040EFE3BB56318056BB8CA67E09019510C0B1D0B7AF159F40BC20B5F239D8160248257D7F082076';
wwv_flow_imp.g_varchar2_table(16) := '43815E84002100622C2453F059B0E1259D00F0211F62F1EF7336D84A5D12022A23F0D0E4D890ABA2740288B5DFB91380AD027A110284801581359363C35A54FCB47402E0CC7B7FF1CDA21E08010722C0BC79EF06E46BAD740260C0A51B992F38741C2120';
wwv_flow_imp.g_varchar2_table(17) := '1701F963432A01F484EF6C1480DE2A02BD090142603A02B7C79EDCBE687A71F14AA4120003CF2740AC7802BD080142200B0262676CB4F2DE2C15452B924B008CD1BFF914CD9524B81410E08CDD3D5F3B16D25E2A0188EDBF6D0B51968E25044A1F012E75';
wwv_flow_imp.g_varchar2_table(18) := '8C4823001E060F07A0EBFFD23F83C9C20520C0396CE562AC2C40C4BC0E9546007DB0EB5606AC625EDA516342C0650830C62AA370C74DB2CC9646001CBC74FD2FCBABD48FA311F0802FE7CB0058E04B1E013026CDA8056242871302B62290923856A41180';
wwv_flow_imp.g_varchar2_table(19) := '58005C6D2BAAD43921E01804F84659AA4A24005826CB28EA87107032020C40DA97A53402E0C08800805E84C0DC08E43A56E69634770B290420B63618E3109A5B1D6A410810020C7810C78C0C24A41000FCED761F30F0C93088FA20049C8F00F343FBDD5E';
wwv_flow_imp.g_varchar2_table(20) := '1976C821806B71715923C31CEA8310281504BAA58C4D299D40ED22296C562AAE273B0881B9C64CA11092430003E334032894C7488E3B10903466E41000D448EAC71DE70659E90604E48C192903335231413300379CB36463C110903566A41080279E2002';
wwv_flow_imp.g_varchar2_table(21) := '28D8A94182DC80C06C63A690F64B21006FC04F8B8085F45A816425531C3014481C89292002AC5CCE97A6140228202E24AA4008F4C527E0AD1BC35AE88F270A2495C4140A01365A2365D64C0450288F39480E0EFE0BBDA390E25C0BE77BE34024E0200716';
wwv_flow_imp.g_varchar2_table(22) := '505522800282E90451FAE0CFD4154900EB32CB29AF160285D68608A0D0882A2C2F363201F8CDAFAB5851510518F43CD6F58A367A9EE2D2478008A0F47DAC59181D9E804B7DA35A1A3FCA2BAB60D3AE7BB46025818BA20D1205B6A150FA08100194BE8F21';
wwv_flow_imp.g_varchar2_table(23) := '323C0E97FBCDC15F59590D9BEFB8077C814A2D20115456D518482051206118059428590488004AD6B593860D8C26E0FDFEB1C98CF8ACAAAE15DFFA1FD706BEC86A6F24824D1FBE07AC24808481C76A0DE84309048AA104114031505544E6C87832ED9A1F';
wwv_flow_imp.g_varchar2_table(24) := '07FF4631D0BD6581691A7A03E580245055536BD4E19A407C2269E429517A081001949E4F358B269229E88AC5B56D3E2C089457C0C69D1F856C831FEB3120096CBCFDA31010648079DC26EC8AC62191E498A5508208100194A05353290EE770E08A18CDF3';
wwv_flow_imp.g_varchar2_table(25) := '7A7DB0F1F68F000E70CCCF16B0CDC69D7783C73379F3E68490712E3A029C1309CC869B53EB88009CEAB959F43EDF3B0AA38994D162E38E1608886B7FA3608E44A0BA0E36DD76A7D12A2E649D8F998B88460525A42150AC8E88008A85AC4D72AF88D5FEC1';
wwv_flow_imp.g_varchar2_table(26) := '31F3D6DEF55BB7435570E9BCB5A96A688475B77CD0386E40C8BC36602E261A159470340244008E765FBAF28362C5BF47ECF7EBA5CB57AC85E08A0D7A76DE7168D5CDB0B4699571DC8DA171B0928B514109C7224004E058D7A52B8E0B7578138F5E8A5B7A';
wwv_flow_imp.g_varchar2_table(27) := 'CD9B3FA467F38E576ED99176B7E0257179816B0C790BA40395428008402977E4AF0C0EFE8458B04309F833B20DDB5B8089C53FCC2F24A08C9BC41A02CA4439B82888370A619A821C048AD90B114031D195241BEFF4B34ECDD78AEBFEF92CFACDA5262E0A';
wwv_flow_imp.g_varchar2_table(28) := 'AEB5AC07F4894B0DFACDC05CA839A39E08C0197E9A51CB71B1427FC572A75F70C972082DE0BA7FA68E703DA06169A3518D771762DF4601251C8900118023DD662A8D77EBE93BF45EAF1FD6DCFA61B3B2C0A9555B778257F48162939C035E76609A827311';
wwv_flow_imp.g_varchar2_table(29) := '200270AEEF00A7E123965B75576FBE1566BBD36FA1A6A2ECD51BB7186286C79340BF1730E0284AA2D84289008A8D7091E4E39D79D706C70DE935358B8A32F5373A984AE0A580F5F70257E9DE8029649C19110138D36F1011FBFDE349F36EBF351FD829CD';
wwv_flow_imp.g_varchar2_table(30) := '92B55B6F37FAC23B0EE9F901061C8E4B100138CE6500B80F7FDDF2ED8F37FC94D706A5595251D7004B9B571BFDE11D823823310A28E1180488001CE32A53D1EEE171C04538BD64B03F06678EFDA3D43032D0A7770F786F00CE488C024A14040119428800';
wwv_flow_imp.g_varchar2_table(31) := '64A05CC03EF039FEDD4313691287C460EC8B7483CC3028FAB42A8133129C9958CB28AD3E024400EAFB284DC3EEA171C0DFE9A7152A90C11949841E28AA8027E6A70211C0FCF0B2BD75D432C89A6EDD05B7DCF7795B43D3D63B0C4CE832C080C231092200';
wwv_flow_imp.g_varchar2_table(32) := 'C7B80A0057DBF5FBFD51EDF59F7904967CECB3B686759F7E0455D102EE4AD07D011A140BFE902580084016D205E8A7474CFF7531CDDB5AC053BB58CFDA167BEB9640B39889E80A587F8EAC9751AC2E021E755523CDAC08E05D77F8641EBDACB9E5537AD2';
wwv_flow_imp.g_varchar2_table(33) := 'F6B8B9F5F70D1DF047496309F3FE04A382124A224004A0A45BA62B65BDBEAE5DD20C151B764C6F645349C54DB7437568B9D17B446C531A194A288D001180D2EE99540EB7FE7AE3E6D6DFDA8F7E66B242A1CF75F77CDAD02636623E92CC28A444CE08C86C';
wwv_flow_imp.g_varchar2_table(34) := '48042013ED3CFBB22EACF9021550B7FDDE3C25A51F96E8BE0018D24BF3CBD5DFF649F0FA27FF6F00B704F1F164F949A2A3642240042013ED3CFB1A1833FF9C638558FC638204F21405BD479F85D7BFFE00FCE63FED86CEC71FD002A68F3FF9A05697AF5C';
wwv_flow_imp.g_varchar2_table(35) := '565E9DB618383046B3807CB194799C476667D4577E08586700C1CDF9FDDE9F8FC7A1EBE93638F1CCFF84FE6B17A629D277F5BC5677FEEFC20013F93DFD37748B794FC0C0A8495AD33AA3026510200250C615D9151912DFFE38A5D66BAB6FCAEF577FA7FE';
wwv_flow_imp.g_varchar2_table(36) := 'E68B70F1D55FEB62668C2F1C3B08A7FEFA4F66AC9FADA2E666939CC69229A0DD80D9D0CA5E27BB94084036E2F3EC0FB7D5F4431AD66C064FD5223D9B737CE357DF86C8F9D346FBFA652BE083F7FF11EC7CE8112D60BA6EE90AD05F3DA26DF7C1FD7A36E7';
wwv_flow_imp.g_varchar2_table(37) := 'D8531384E08AF546FB8151BA0C30C050344104A0A86374B5AC8368E92DE637AC5E3F573C7EF50C9C7EC11CCC4D9BB6C3C67B1F84F2501378FCE55AC0F4A64F3E088D1BCDC788BFF5FCB761E2FAB9B9C44FAB5FB67597513620662F4686124A224004A0A4';
wwv_flow_imp.g_varchar2_table(38) := '5B2695C267FD5B6FFE59B469FED3FFEB9D3F9A14263E2B6BEBA1F9F68F0378BC2297F116652B767E02AA1699CF15B87EF8D98C467367EB369A24659DBDCC7D24B5B0030122003B50CFB1CFCCBFE60EACB825C723CD66FD57BA8C4CF3E6DBC0E3F31BF9CC';
wwv_flow_imp.g_varchar2_table(39) := '04D6358A19825EDE7F65FE3380C0EA5BF5C3B5787482EE0AD480C8E1C38E26440076A09E639FD66FFF60F3BA1C8F4A6F86ABFB7A49C5E2463D39635C195A6AD4F55FBD60A4E793A85BBECA689E4962460525944080084009376457C2FAED59DBB8367BA3';
wwv_flow_imp.g_varchar2_table(40) := '394A2BEBCC1F0C25E2C330D72B31366A3429AFA937D2F3492C6A32C96A947E17301FE8A4B72502900E79EE1D5ABF3DAB1BD7E47EA0A565FD4AF3CF4107C55EBFA52A6B72C0D226B8EAE6AC6DE62AACB110409C2E01E682CBD67A22005BE19FBD73EBB767';
wwv_flow_imp.g_varchar2_table(41) := 'E5B2FC08A0B6D924804B6FBF0EE303D1193B9D188CC165D1466F50BB323F02B0EA6AB541974BF17404EC2A2102B00BF939FAC5E9BFFE8F3FD834B0343F0208EEF824F82BAA510400E7D075F417607DA8C864056865EF75BEA0B5C1B240552DD4DF96DF6F';
wwv_flow_imp.g_varchar2_table(42) := '0EACBAE24342E8598188A89A8108404DBF000E1CAB6ABE50B3359B73DA5313820FFCC1C34690B71CB70000100049444154FBDE2BE7E1D5FD8FC3B983CFC0B5DF1ED002A6B1CC7A8BF0B687BE0A9EAA3AE3B8F9247C8BCC75073C0EEF0AC498827A081001';
wwv_flow_imp.g_varchar2_table(43) := 'A8E7134D23EB833F7D65E55A59BE1F35DB3E06377FEC5FA71DDE7DF13DB8F0C6CB5AC0B4B572D3BD0F42E526F3861E6B5D4E697FBABE49DA09CC09363B1A1101D8817A0E7D5A074DA0B2268723666FD278DF9FC01D5F7C0A2A6ACD1B7D328FA8123B06D8';
wwv_flow_imp.g_varchar2_table(44) := '66D9BD5FC8AC9A77BED2D28F95CCE62DC80507D8692211809DE8CFD2B775D004AA164E00D855F9BAEDB0F32B3F801D9FDF07B7DCF76F61E56D1F81D5B77F5CA43F0F3BFEDDE3B0E3D1A701DB60DB8586B2CAA975072128DB9A8328A6B70208100128E084';
wwv_flow_imp.g_varchar2_table(45) := '6C2A587F01E8170B72D9DAE453C62A6AA07AEB4760C9C73E07EB1EDA076B1E6813E9CF42F596BB017FD39F8FCC6CC7F82D3F5AC2271A656B4365F623400460BF0FB26A2016EC8DF2B202CD000C811212D6598B95CC24744D5DCC03012280798025B3A9F5';
wwv_flow_imp.g_varchar2_table(46) := '5BB3ACB25666D705E9CB6FD139458B8033626A77051180DD1EC8A97F96532B951A318F796A59D73354D291740130BD44682885808731439FC4D8DCF7F01B8D154924464D9DADB628A21EA931850011C01410AA4596F10F13A323AAA937A73E13961F1E59';
wwv_flow_imp.g_varchar2_table(47) := '6D99F3406A2015012200A970E7DE99F55BD33A987297606F4B2B69793DE66CC65EADD4EA5D056D880054F042161DFC5E73D0249C3803181932ACF213011858A896200250CD2353FAF82C83C6913380B84900565BA6CCA34811048800147144A61AD669F3';
wwv_flow_imp.g_varchar2_table(48) := '50EC4666B5F2F9918198A1A3CF329B310A29A1040244004AB861BA12D6BF02C7DA64EC1A468E0889C8E5343D6F0C8EA7E52903A00A064400AA78C2A2C7F9581CFA329EA93F1E7DDFD242ED64A6AE680BDAA4B6D6EED48E084031BF5F1083BF3F63F0A38A';
wwv_flow_imp.g_varchar2_table(49) := '6391C21340FCCC2B8001E517328CF64CD7156D42DB0AD90FC95A380244000BC7B060127080E0B7A52ED0E3319FDF3FD2933EADD6DBE41B0F1E7F115EFEEB2F6961E88DB9FF326C3EFD8C749BBA5A6D40DBD0C6F9C8A2B6C5458008A0B8F8E62C1DA7C838';
wwv_flow_imp.g_varchar2_table(50) := '40F4039636AD82359BB7E959E8BB74C6481722D17FFE9421A6BFEB4D235D8844DFA5770D316B6FD906688B5E8036BA9D04742C5488890014F04257340E3845D65559BCAC09567DE00EA8AA6FD08BA0FBCC09235D9004377FA1C32DE905CB4E8C434FD75B';
wwv_flow_imp.g_varchar2_table(51) := '8698AABA06CD16B4492F4412409BF53CC5F6214004601FF65ACF381006C6CC3FD1C481B2E6432D5A1D3E97DFEB9DFC271F7C40E8D8257360690D14FC18BDFCB6A115EA1E98FA6F01B429B864B9518736A3ED4601256C418008C016D80138E78003000782';
wwv_flow_imp.g_varchar2_table(52) := 'AE020E101C287A1EE3BA90390B18BA50D8A93ACA2F74183A6FEA58D790FE70D075B7B502DAA8F789B623067A9E62F9081001C8C75CEBF142EF28E000D032E223B47819ACBFED2E914A7FD704971805BD67CDC165142A96E83D67EAB82864EA8E6A32609A';
wwv_flow_imp.g_varchar2_table(53) := '8D41612BE6312006B8FE81693704D56C2402B0C12357FA47D3AEF9EB1B96C2DAEDBBB36A521D34BF457BCE9DCCDA46A5C21BEF99045065D1DDAAE33A616B9DA50ED73FAEF68F599B505A120244009280D6BB890E4F408F087ABE2EB418D6DFD602CCE3D3';
wwv_flow_imp.g_varchar2_table(54) := '8BD2E24AB188E6F34DAE038C0EF6C1F8FBE6353628F61ABB781226A69E03E02F0B40456D28AB8668EB861D7701DAAE37E81E1E87D8C8849EA558120244009280C66E269229785F7CFB631A43456535ACDFDE3AE3E0C736189634ADC4480B91D70F6AB18A';
wwv_flow_imp.g_varchar2_table(55) := '1F91E3E6FD044B1A4D9DB3E9CABC3E58FFA1DD502930D0EB2FF78D422289CB9D7A09C5C5468008A0D8085BE45F1B1807FDF4C615F28D3BEF02CFD4B7BBA5D9B4647DA3F977DB978F1D9856AF4AC1A5632F1AAA049B4C9D8DC28C84C71F800D6261D02BC8';
wwv_flow_imp.g_varchar2_table(56) := '00AB109B6B83A57B298036AA1688002479642C918258DC9CE2AEDCB009FC15B93DEFBFAA7E09940526FF6D077F6537DA755C92D6B977337AEE35181D1AD00E28C3E9FF2273F7422B9CE123505D0BCDEB3781FE8A8ACB00C44ACF535C5C0488008A8BAF21';
wwv_flow_imp.g_varchar2_table(57) := '3D22AE71F54C2050010D6BCD935E2F9F2D5ED2B8C2A8B64EB58D429B133DC7FFD1D060E98AB5463A97C4E25537019286DE16D749F434C5C5458008A0B8F81AD207C792467AD9CAB5805B6246410E09EB65C085570E001F53E73981A8CBC563E6DA44FD72';
wwv_flow_imp.g_varchar2_table(58) := '93AC72304DBB0C5A2E30D1DB0E5A6E8CD2CB282E0E024400C5C1354D2A2E6C8D8A4B00BDB076B179479C5E36575C21A6D435B593FFD68B2BEDBDAFFE6CAE43A4D5C78EFDD458FDAFAE5904E596FF05CC55899AC58D46D3B8C0CAFABF0846858313AAAA4E';
wwv_flow_imp.g_varchar2_table(59) := '0420C133F184F9ED8FDD5588AD3D8CE71B1AD799970D670F3C33DFC38BD6FEDC415397E69BB6E4D54F79CD24B9E907C727CCDF2AE86514171E012280C2633A4DA2F5DBCCE72F9B569F6BC1A2E5AB2010985C0C1CEEED86A137CDEBEE5C6514BADDE08983';
wwv_flow_imp.g_varchar2_table(60) := '30DCDBA389ADA8A882DAA5F39BFE6B078A0FDC0DD177034416AC98619E4271102002280EAE695253B8BF3555525E5E3195CA2F6A5EBFD938F0FC811F1869BB12E70FFE7FA3EB26CB6ABE51388F447945A5D19AFE4FD080A2A8092280A2C23B299C5B08C0';
wwv_flow_imp.g_varchar2_table(61) := 'E3F54E16E6F919142BECFA2C2272F15D1879F7E53C252DFCB0E1D39D109D7A4E01EA54BF62DD82847A2DD858315B9050050E565905220095BD934537BC8DB669F506A3E6ED1F3E65A465274EFFF0AF8C2E9BD7DE3CEF9D0DE3604AD8860011806DD0E7DF';
wwv_flow_imp.g_varchar2_table(62) := 'F1E2351B01BF7151C240F765E87BE9C798941A62877F0843D1C92715E37DFF0D622F5FAA02D4594110200228088C7285E082D9EA8D5B8D4E4F3FFF2DE0533FC2310A8B98E0F14138FDFCFF337A58BDF1566D2FDF28A08463102002708CABD2150DAED800';
wwv_flow_imp.g_varchar2_table(63) := '9555355AE1D8F000BCFFC237B4B48C8FCBCFFF8DB1EF5F595D0BF5CD0BBBF697A1B35D7DA8DE2F1180EA1E9A45BF355BB61BB567FFE93990F11B81F87BAFC2B923E64D486BB7EE3074A084F3102002709ECF0C8DAB42CBA0C1F29CBD37BFBBB7A8970238';
wwv_flow_imp.g_varchar2_table(64) := 'F53F21FAD015C0E71756D62FD6B3143B10012200C94EB3EC0816A4E750D36A43CE705F0F5CFAC95346BED0898BCFFE2F181DEC35C436E4F0935FA331259444800840B25B5801FB1BBCF13E9C39FE529AC4AEA33F87F89963696585C88CBC7D14CEBF62FE';
wwv_flow_imp.g_varchar2_table(65) := 'DE1F65BEF3FACB803A609AC274049C504204E0042F65D1B1A7EB34BCFDDA61E30123D626C7F78721D9D76D2D5A503A19BB06C7BFBB6F9A0CCE539A0EDD5DEA3EA66C9AD25490860011401A1CCEC85C7CE32538FF8EF9F04DBF87C1FA5025608C16E0AEC0';
wwv_flow_imp.g_varchar2_table(66) := 'A96FFD1780F151CC2E28F0B138BCF9CD87615C6CFDA1205F465F5876E19D37E0F2C9C2CF3A503685E2224004505C7C0B2A3D35310E675EFE35DCB872D1905BEEF3C0CD8BABA03AE08555F5154679ECF25938F7CC13463EDFC4D9A7DBA0EF9AD9DF9A6085';
wwv_flow_imp.g_varchar2_table(67) := 'D617F6897DEB72AF5DEED2744B25CCA71EE97514AB8B001180BABE49D36C3C3E04A78FBC087DB1C95FDE61654DC00737355482CF3BB9B28024B0B4BA0CABB470E9B7BF81C8AFBFAFA5F3F9E87EF13BF0FE9B478D4397D59441559957CB639FD837EAA015';
wwv_flow_imp.g_varchar2_table(68) := '880FD4EDF49103302174155957BF9D623C1180033C35D21B8153875F8491912143DB60851FD6852AC023A6E446A1482CAF0D8075509E7CEE6F61E0B55F889A8C37631905E9D9BE633F85B77EF61DA310652EAB0918794C60DFA803EA82790C23C3037052';
wwv_flow_imp.g_varchar2_table(69) := 'E81AEF8F629682E208100128EEA081EB97E0D44B072121A6FFBAAACBC5405C595FAE67A7C5AB455DC06BBAF6B5EF3D016FFDD51FC3F55F7C13BA0F7E4F0BBD17DE318EC3B45E7EFDE7DF84534FFD7B38FE77FFD5A8475928D328C848A02EA8935E8CBA9E';
wwv_flow_imp.g_varchar2_table(70) := '143301D45D2FA3584D04CCB3444DFD5CADD5F5B3A7E09DD78FA661B0AAAE1C968AA9785A6146C62B660578ADEE13B15ED57DF64D78FB174FC35BCF7F4B0B910BE6CA3DA6F5F2B77FF934F49C3BA51F06280365A14CA3304B027542DDAC55A8FB8D73EAFF';
wwv_flow_imp.g_varchar2_table(71) := 'A1A95567B7A5890014F438179B7B5DC78FC0A533E640F48A293BAEF4D7574EFE4BD05C6A97FB7171B0122AFDDEB99ACE588FC7DEBCB81250D68C8D2C15A81BEA88BAEAC517DF3D09B86B8136E965A51E3BC93E2200C5BC959A1883778F1E84C8B5CB8666';
wwv_flow_imp.g_varchar2_table(72) := '655E0F6C108B7DD581F90D66BF38EE263180D788DD015C1CAC158B86B88887C16F991D601ACB30601B6C8BC7E0B128C350248704EA88BA9689BEF5E6B86B8136E12E865E46B11A081001A8E1074D8B09B1D77E4AACF40FF4990B68153E0FE06A7BAEDFC2';
wwv_flow_imp.g_varchar2_table(73) := '9AA08C8F45153EC0C5C1B562D110072786DA72F3BF08318D6518B00DB6C56332C4E49C455D51E70AA1BB7E10DA745AD8463B043A226AC4440092FD30D36F01867BAEC2C9CE17617464D8D008BF8D7150FABCB3AFD81B07E499288674D41975C7DD035D2D';
wwv_flow_imp.g_varchar2_table(74) := 'DCC5C01D82E1C855BD88629B112002B0D10189B138C407A270E1C41178EBD50E48586EA269A8F4037E1BE3569B8D2A2EA86BD41DB70943C2165D10EE10BC75AC43B3196D4FA4DDAD580C2AD27B96133BAD172200C91E1BEC8BC1B19F3FA385D77FFD9CD8';
wwv_flow_imp.g_varchar2_table(75) := '333F00DD57CDEB7D54A751ECE5378BD57E4CCB0833CD4A0AD5F70A618B759B10E5A2CD270F1F80D70FFE44C3023119E88F611505890810014800DBB2DE366B6F78CD8CD3E62596BBF9663D600195569DBC62876101A2723A14B7097187A0DCB22E30DB81';
wwv_flow_imp.g_varchar2_table(76) := '56FD666B47750B4380086061F8E574345E07CF36C870BBAD7951006E5E5265DC6A9B93E00534C2853FFD706B5A2F2B468C3B041B858D4D6286836437531F3E31FA65E934930E6E29270290E0695C10DBB2AC0AF01B10AF8931607AB3180CDB1A6B00B7DB';
wwv_flow_imp.g_varchar2_table(77) := '1AAACC7BF825A8A4DD2EBC6569356C5D56ADFDB847469F7A1F8BC50C07C90E6D470C100BC40403A6B7089DBC8204F4F64E899DA8A71402E063BE625F662A8F3D634C1B6835622F1E037E1B96F9A4C03F2336484C760F34C400B1404C30607A46855D5491';
wwv_flow_imp.g_varchar2_table(78) := '82784A86B952CE4059C6C8008CFA2004642090AA90F3A5298700241923C331D4072120038186B85FCAAC590A01C832468663A80F42201B02852F1B2C9D4B000039C614DE09249110B00981DAB2D2990100C41336C148DD1202CE4460A03F294371299700';
wwv_flow_imp.g_varchar2_table(79) := '00A78900647893FA282104E48C192904C0C290E2006325E41D3285103010287402C70A8E9942CBCD264F0A0160C70CF8758C29100284C0EC08C81C2BD20840984C042040A0372130170262067061AE3685AA974600C228228042798DE49434020C40DA58';
wwv_flow_imp.g_varchar2_table(80) := '91460000EC1DA0172150620814C31C0EACF466001ECE4F14032C924908941A0232C78AB419400A124400A576A6923D454140E6589146002178E90C702EE5F6C6A278858412021210E09C8F686345425FD88534026061487106EF61A71408815240A01836';
wwv_flow_imp.g_varchar2_table(81) := '30062771AC1443763699D208003B6700741900F42204664380491D23720980C321A017214008CC880093BC582E950038787F0662216046EBA982107035029C2721F5BC4C08A41240287CE87D61DC9B22D09B107034024552FECDC5E12352FF35452A0120';
wwv_flow_imp.g_varchar2_table(82) := '681CD82F31A640081002E908D83136A4138097A78800D2FD4E3942404380F1E44FB484C40FE90450B73C7E44AC035C946823754508A88F00E79782E0FFAD6C45A51300FBC26B1300ECBB402F42C0A10814456DC6F6B3F0A1445164CF22543A01A02E1E6F';
wwv_flow_imp.g_varchar2_table(83) := '62BF9805704C5320045C8F0087044B25BF63070EB61040FD578FE225C08B76184C7D1202AA21C0197F21D87EE45C9FC9DE0000055449444154921D7AD9420068A887F32731A64008B81D012FE77F691706B611407DF8F0217119F02BBB0CA77E09817C10';
wwv_flow_imp.g_varchar2_table(84) := '28FC31FC579363A1F0927391681B01A0721EC6BF8C310542C0AD0830C61EB1D3765B09A07ECFE13738F0E7EC0480FA2604EC4200CFFDE09E8E9376F58FFDDA4A00A8809F271EE61C86304D8110700B021C60D8E7497EC96E7B6D278045E197CE32E08FD9';
wwv_flow_imp.g_varchar2_table(85) := '0D04F54F08CC854021EBC522F8C3758F1D3D574899F9C8B29D0050E9E0E6CEFF0D9C1FC6340542A0F411E04782E1CEFFAB829D4A1000FB0C247D90F843BA1450E194201D8A89004EFDBD9EE4678BD9C77C642B4100A8B07629C0F8E7C44C2085790A8440';
wwv_flow_imp.g_varchar2_table(86) := 'C921C0F19998A9075598FAEBD82A4300A850A8ADF3478CB3AF609A0221A0120205D2E54B0D6D877F5C20590511A31401A045C1F68E2701F87E4C5320044A0881A742E14EDBEEF89B0947E50800150D2E1BF982880F88406F42A01410F8719077FC67150D';
wwv_flow_imp.g_varchar2_table(87) := '519200F027C3413E7C3F70785645D0482742205704B49B7DF8F0032C0C4AAE6D294900082E0BBF36126CEBF87DE0A9C7314F8110B00B817CFB1583FFEBA13D9DBF87E772BE328A7D9CB204808633063C143EFC18E780DB26492CA34008288F00E7E30CE0';
wwv_flow_imp.g_varchar2_table(88) := '8186B6CE47F11C56595FA5094007AE21DCF17DCE52770A467D572FA39810501481935E48DD2966AF3F5054BF34B51C4100A871C39EC3AF84B8779B48B78B5D820911D39B105008012ECE49BE2FB86C787B5DF888F467FBE50B846308000D64E143A3A1B6';
wwv_flow_imp.g_varchar2_table(89) := '8EB09FF32D1CE0A75846811028260273CB1617A89CFF838F273687DA3AF7E002F6DCC7A8D3C25104A0C3561B3E7CA6A1ADE33EC6F86E311B38A297534C08C84480737EC8C3D8F650B8F3D38BC22F9D95D977A1FA722401E8C607F7741E11ACBB1B78F20E';
wwv_flow_imp.g_varchar2_table(90) := 'B13EF0B498158CE975141302C54000CF3171AEFD00BF7C1AC29D1FA9DFD371BC18FDC892E96802D0410A858FBCDCD0D6F95019F73403874784836CFF99A5AE1BC5258200E75D2CC5BF8CE758435BE703F8E5530A96950401E88EA80D1F8A84C21D7F211C';
wwv_flow_imp.g_varchar2_table(91) := 'B45E5C1AFC8EB83AFB86882FEBF5141302F34100CF1DF165F27F00929F08853BD705DB3BFF1B9E63F393A176EB9222002BD4E2D2E0570DE18EFF28E2951E96DA26C8E031E0BC434CE186ADED284D08E80868E7863847C4C0DFE3E1890FE2B923BE4CFE38';
wwv_flow_imp.g_varchar2_table(92) := 'D476A4646F4BF7E8C697725CBFE7F01B820C1E172C7E57435B47B597A7D60942F8578210F60A867F4E5C369C100B3A52FF95B594F156DD36CDD71C4E4CFA9EEFC573C1EB49ACC77303CF1131F0F7D5878F9E50DD8E42E8E70A02C804AA2E7CB84B10C2B3';
wwv_flow_imp.g_varchar2_table(93) := 'A170675B435BE7FDA170C7071BC29D4DA1B60E16E41EBF081522D4B0C0709DB72C15F4FB471BCAFC7C49C037B6ACDCC71B533CD944413D0CD037E823F4955FF80C7D873E445F8A803EF5A38F355FA3CF35DF8B7320DCF1AC4ABFD1CF3C5F8B99772501CC';
wwv_flow_imp.g_varchar2_table(94) := '06280B1F4A88302AC250F0CF5EEBAFFBF3C3BDB58F1E8BD63CDAD953FD95576E547DA5F3DAE2F091AB14D4C3007D833E425FA1CFD077E843F4A508E8D3C46CBEB7D6B9254D04E0164F939D844016048800B280424584805B102002708BA7C94E42200B02';
wwv_flow_imp.g_varchar2_table(95) := '44005940A1227723E026EB8900DCE46DB29510C8408008200310CA12026E428008C04DDE265B09810C0488003200A1ACBB11709BF544006EF338D94B0858102002B080414942C06D081001B8CDE3642F2160418008C0020625DD8D801BAD270270A3D7C9';
wwv_flow_imp.g_varchar2_table(96) := '6642600A0122802920282204DC880011801BBD4E361302530810014C014191BB1170ABF544006EF53CD94D08080488000408F42604DC8A0011805B3D4F761302020122000102BDDD8D809BAD270270B3F7C976D7234004E0FA53800070330244006EF63E';
wwv_flow_imp.g_varchar2_table(97) := 'D9EE7A0488005C7F0AB81B00B75BFFCF000000FFFFCD3FC9ED0000000649444154030031ECDDC4F69260950000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(35051314526105916)
,p_file_name=>'icons/app-icon-256-rounded.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_32_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF400000238494441547801EC53DD6BD35014FF254DDB34699B8CD5CE32673B7482F8D50AFA385FC47F45C427FD0F7CD67751045FF4419F457D6A457C515450108BDBF073';
wwv_flow_imp.g_varchar2_table(2) := 'BAACEDEA4C6D92B6694C6E49365FECBD196E3012381FF7DC73CFF9F1CB397CEBCABCB393C26387BF0840C440C4C09618D04C1E9E6C6593430368F4622854CEA0509E47C30A5D06A15EEAD600EAC10A84A4044194A1CE9D44C7B24311110A80D605F47613';
wwv_flow_imp.g_varchar2_table(3) := '2B4BEF8878BE6638DB0360DD18E0D8856B3870F1FA5F72F4FC5578CCB0A26066C0145588A513707A063EDCB884859B97892F968EC3882BACFDD967402E1E214DEC5F4DA4277290D41C6CBD05703CA4FD87C1FA31331057A7480F213783CCDC29640F9D86';
wwv_flow_imp.g_varchar2_table(4) := '30B98FC4E2CA1E6259143300DB3283FA99CA3964CA6783B33D18043EADC30460ADDBC7FAB785A0F6B0D386277EE0E7D745B4DD1CFF4C63A90178132ECD56C0DB5650B7D7F88C5EF3CBE8EC0C21F4BB1067CB4CDB400DC092F2C8168A50940974DE56474D';
wwv_flow_imp.g_varchar2_table(5) := '3769FD4D154A2E0FA55082294E6EBAF9B74B0D8097B2A452666A068B0F6E01833E3913D533B1F4E836D2F9D130C664958469143500BF18C7C7904E25B15ABBE387A0D5EE22934A8073579104398E181AC504C019DAF8F1FE15A4CE329A4FEF61F5C56368';
wwv_flow_imp.g_varchar2_table(6) := 'CF1F62EDD97DA4F465ACD45F03EE2CD034F673A801E82D0D9F5E3E41FAF777A4E23114640E5CBD0ABE5EC35E992731D905F6D1CDF172FD06E32C358062C2C074C24452D878924EBABFC315BF8977371D37E0E5FAB17176A3DAB8CCFF741F018818D8FD0C';
wwv_flow_imp.g_varchar2_table(7) := '8C5B9E3F000000FFFF1A2BEF82000000064944415403007E4603B0A9D9ADFC0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(35051416620105916)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_512_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000200000002000806000000F478D4FA00001000494441547801ECDD07B424D779D8F9AFBB5FCE69E6CDCC9B1C80098824124182044149262969BD6777452B78D7F67ABDF6DA47F6EE7A25CA5E4B32B9F6D9B3';
wwv_flow_imp.g_varchar2_table(2) := '5AD9B24D512225591221C94C62802490024122114426C26006184CCE79DECCCBB15FBBBE1EBCE14B756F7577757555DDFF9CE979DD75E3F7BB3DAFBFAEAAAECE5EF9D4070BDC30E039C07380E700CF019E036E3D07B2C21F04104000010410704C408404';
wwv_flow_imp.g_varchar2_table(3) := 'C0B92527600410400001044800780E208000020820E09C8006CC1E0055E086000208208080630224008E2D38E12280000208B82E703D7E1280EB0EFC8B000208208080530224004E2D37C12280000208B82E301F3F09C0BC043F11400001041070488004';
wwv_flow_imp.g_varchar2_table(4) := 'C0A1C526540410400001D7057E143F09C08F2CB88700020820808033022400CE2C35812280000208B82EB0307E1280851ADC470001041040C01101120047169A3011400001045C17581C3F09C0620F1E218000020820E08400098013CB4C900820800002';
wwv_flow_imp.g_varchar2_table(5) := 'AE0B2C8D9F0460A9088F11400001041070408004C0814526440410400001D70596C74F02B0DC842D082080000208A45E800420F54B4C800820800002AE0BAC143F09C04A2A6C43000104104020E5022400295F60C24300010410705D60E5F84900567661';
wwv_flow_imp.g_varchar2_table(6) := '2B020820800002A916200148F5F2121C0208208080EB027EF19300F8C9B01D010410400081140B9000A47871090D01041040C07501FFF84900FC6D2841000104104020B5022400A95D5A024300010410705DC0143F0980498732041040000104522A4002';
wwv_flow_imp.g_varchar2_table(7) := '90D285252C0410400001D705CCF19300987D284500010410402095022400A95C56824200010410705DC0163F09804D88720410400001045228400290C24525240410400001D705ECF19300D88DA881000208208040EA04480052B7A4048400020820E0BA';
wwv_flow_imp.g_varchar2_table(8) := '4090F849008228510701041040008194099000A46C41090701041040C0758160F193000473A216020820800002A912200148D572120C0208208080EB0241E32701082A453D0410400001045224400290A2C524140410400001D70582C74F0210DC8A9A08';
wwv_flow_imp.g_varchar2_table(9) := '2080000208A446800420354B49200820800002AE0B94123F0940295AD44500010410402025022400295948C24000010410705DA0B4F849004AF3A236020820800002A910200148C53212040208208080EB02A5C64F0250AA18F511400001041048810009';
wwv_flow_imp.g_varchar2_table(10) := '400A16911010400001045C17283D7E1280D2CD6881000208208040E205480012BF84048000020820E0BA4039F1930094A3461B041040000104122E400290F00564FA0820800002AE0B94173F0940796EB442000104104020D1022400895E3E268F000208';
wwv_flow_imp.g_varchar2_table(11) := '20E0BA40B9F19300942B473B041040000104122C400290E0C563EA0820800002AE0B941F3F0940F976B444000104104020B1022400895D3A268E00020820E0BA4025F1930054A2475B041040000104122A400290D08563DA0820800002AE0B54163F0940';
wwv_flow_imp.g_varchar2_table(12) := '657EB44600010410402091022400895C36268D00020820E0BA40A5F19300542A487B0410400001041228400290C04563CA0820800002AE0B541E3F0940E586F480000208208040E204480012B7644C1801041040C0758130E227010843913E1040000104';
wwv_flow_imp.g_varchar2_table(13) := '104898000940C2168CE92280000208B82E104EFC2400E138D20B0208208000028912200148D47231590410400001D705C28A9F04202C49FA4100010410402041022400095A2CA68A00020820E0BA4078F193008467494F0820800002082446800420314B';
wwv_flow_imp.g_varchar2_table(14) := 'C54411400001045C1708337E12803035E90B010410400081840890002464A198260208208080EB02E1C64F0210AE27BD2180000208209008011280442C13934400010410705D20ECF84900C216A53F04104000010412204002908045628A0820800002AE';
wwv_flow_imp.g_varchar2_table(15) := '0B841F3F0940F8A6F488000208208040EC05480062BF444C1001041040C075816AC44F02500D55FA44000104104020E6022400315F20A68700020820E0BA4075E22701A88E2BBD228000020820106B011280582F0F934300010410705DA05AF19300544B';
wwv_flow_imp.g_varchar2_table(16) := '967E11400001041088B10009408C1787A92180000208B82E50BDF84900AA674BCF082080000208C456800420B64BC3C410400001045C17A866FC2400D5D4A56F041040000104622A400210D385615A0820800002AE0B54377E1280EAFAD23B0208208000';
wwv_flow_imp.g_varchar2_table(17) := '02B114200188E5B230290410400001D705AA1D3F0940B585E91F010410400081180A9000C4705198120208208080EB02D58F9F04A0FAC68C80000208208040EC04480062B7244C0801041040C0758128E22701884299311040000104108899000940CC16';
wwv_flow_imp.g_varchar2_table(18) := '84E92080000208B82E104DFC2400D138330A020820800002B112200188D57230190410400001D705A28A9F04202A69C64100010410402046022400315A0CA68200020820E0BA4074F193004467CD48082080000208C446800420364BC14410400001045C';
wwv_flow_imp.g_varchar2_table(19) := '1788327E128028B5190B01041040008198089000C4642198060208208080EB02D1C64F0210AD37A3218000020820100B011280582C03934000010410705D20EAF84900A216673C04104000010462204002108345600A0820800002AE0B441F3F0940F4E6';
wwv_flow_imp.g_varchar2_table(20) := '8C88000208208040CD0548006ABE044C0001041040C075815AC44F02500B75C6440001041040A0C6022400355E00864700010410705DA036F19300D4C69D51114000010410A8A90009404DF9191C01041040C075815AC54F02502B79C6450001041040A0';
wwv_flow_imp.g_varchar2_table(21) := '8602240035C467680410400001D7056A173F0940EDEC19190104104000819A099000D48C9E8111400001045C17A865FC2400B5D4676C0410400001046A244002502378864500010410705DA0B6F19300D4D69FD1114000010410A8890009404DD8191481';
wwv_flow_imp.g_varchar2_table(22) := 'DA0B4CCECC89DE6A3F136680809B02B58E9A04A0D62BC0F808442CA02FFA072E8EC9DBEFDEDEF17E4ECDCE453C0B864300815A0B9000D47A05181F81080546A7F272F0F2B84C78EFFEE7871DF7EEBF73695CB46C7E1B3F1140A0DA02B5EF9F04A0F66BC0';
wwv_flow_imp.g_varchar2_table(23) := '0C108844606472568E5C1997FC5C61D978BA4DCBB4CEB242362080402A05480052B9AC0485C06281A109EFC57F70425678EDBF5151CB8E7875AE4DCCDCD8C61D0410A88E401C7A250188C32A300704AA2830383E23C7AE4E4861F91BFF65A36A9DE35727';
wwv_flow_imp.g_varchar2_table(24) := '45DB2C2B64030208A44A80042055CB4930082C16B830322D27BC17747D615F5CE2FF48EB6A9B4BA3D3FE95284100810A04E2D19404201EEBC02C10085DE0CCD0A49C1D9E2ABBDFD3435372AE82F6650F4C430410884480042012660641205A8153D726E5';
wwv_flow_imp.g_varchar2_table(25) := 'E268E5C7F2CF7B7B104E7B7D453B7B464320DD0271898E04202E2BC13C100849E0F8E0845C1EABFCC57F7E3A97BCBE4E7A8711E61FF3130104D2214002908E75240A048A027AECFEEAC46CF1BEED9F969656D19BAD9E965F199F11DDABA0F7B921804025';
wwv_flow_imp.g_varchar2_table(26) := '02F1694B02109FB56026085424A0EFFC839EBDDFD2DA26BBEEFFB1E24DEF071958F72AB0272088147510488600094032D68959226014D017FFC0EFFCF5C5FF7D1F91BAC6E6E26D97773F6812A07B0248028C4B412102468138159200C46935980B026508';
wwv_flow_imp.g_varchar2_table(27) := '94F2E2DFDADE21BBBD77FEFAE23F3F94DED76DA524017AA861BE3D3F11402099022400C95C37668D4051E0D8E084047DE7AF2FFEBBEEFB88E41A9A8A6D17FEA3DB3409D03A0BB7FBDDD7430D24017E3A6C47C04F205EDB4900E2B51ECC0681C002FACEFF';
wwv_flow_imp.g_varchar2_table(28) := '5AC013FE3A3A3BE5FA8B7FA36FFF9A04689D76AFAE6FA505059A04703860010877114898000940C2168CE922A0026787A602BFF3EFE8EA969B8BEFFCFD5FFCB54FBDE51A1A65A757376812A0E70470B12095E386805D206E35B2719B10F3410001B3C095';
wwv_flow_imp.g_varchar2_table(29) := 'B119B910F032BDFAE2BFF3DE87245BD760EE7441A9D6D524A0C34B1C166CF6BDAB170BD2BD01BE1528400081580A9000C472599814022B0BE8D7F59E1A9A5CB970C9D6CE9E5ED117FF4C5DFD9212FBC36212E0250E41938093D72665642AD8F507ECA353';
wwv_flow_imp.g_varchar2_table(30) := '0381340AC42F261280F8AD0933426045818999BC1C1D0CF6AD7EFAE27FF33D1F96725EFCE707D7B69A40685FF3DBFC7EEA17081D1B9C149DA35F1DB6238040BC044800E2B51ECC06811505A667E7E4F0E509990BF095BE5DBDABA4F8E29FAB5BB1AF5236';
wwv_flow_imp.g_varchar2_table(31) := '66BCBD07DA57902420EF4DEEC8950999C9CF95320475117042208E419200C471559813020B04E65F5867BD17D8059B57BCDBD1D9253BEEFE90647295BFF8CF0FA07DDD7CF783D2DED139BFC9F7E74CBE209A04CC0598AB6F27142080402402D948466110';
wwv_flow_imp.g_varchar2_table(32) := '0410284BA0E0ED5BD717D4496F0F80AD83A6A626D971CF83920DF1C57F7ECC8CB727E0A67B3E248DDE18F3DBFC7E4ECCCC150F55F895B31D01F704E2193109403CD78559215014D08BED8C4DE78BF74DFFD4D5D7C9CE7B3F2C750DCB2FF2636A574A595D';
wwv_flow_imp.g_varchar2_table(33) := '638BECBA57138C9CB5D9C8549E2F0FB22A510181DA0A9000D4D69FD111F015B830321DE8B3FE998CC8CEBB1E90C636FB2E7ADFC1021634B675C9AEBB3E203AA6AD897E79D0E5B1695B35CA1148BD405C03240188EBCA302FA705F4E37EE746A60219ECB8';
wwv_flow_imp.g_varchar2_table(34) := 'FD1E69EDE90F54378C4A6D7D6B65FB6D7705EAEAF4D0948C7A7B030255A6120208442A40021029378321601798F28EF71FBB3A29DEE17F6BE58DDB764AF7C0566BBDB02BF4ACDF2EEBB7DD64ED5663D0EF2B98E19301562B2AA45520BE719100C4776D98';
wwv_flow_imp.g_varchar2_table(35) := '9983027AF6BC9EF4A767FEDBC2EF5B33206B77DE6EAB56B5F2819D77CAAAB503D6FEF5D30B1A939ED068AD4C050410884C800420326A0642C02EA017FAD13D00B69A9DDD3DB2EDCEFBBD6A19EF56ABBF19D97AC7FDA21F3DB4CD403F1970DCDBAB61AB47';
wwv_flow_imp.g_varchar2_table(36) := '3902691388733C2400715E1DE6E694C09921BD9CAEFD8CFFA6E666D971D78744B2B9DAFB7873B8E99E07A5B9B9C53A17FDE6C2F301CF6BB07646050410A8588004A062423A40A07281A18959B9383A63EDA8AEBE5E76DDFB90E41A1AAD75A3AA906B6892';
wwv_flow_imp.g_varchar2_table(37) := '9BEF7D50746EB631F58B8346F8CE001B13E5A9118877202400F15E1F66E780809E2077E29AFD0B7EB2D98CECBAE743D2D0DA1E3B95C6D60ED975F70725E3CDD134393D2950AF6D309B0F704D63534794218040C50224001513D201029509E897E80439E9';
wwv_flow_imp.g_varchar2_table(38) := '6FCBEE3BA5A5AB4FE2FAA7A57B956CDD653F2971C67BF13F7E7522AE61302F044213887B472400715F21E6976A8173C35312E44A7F7AC67FDF26FBC7EE6A8DD5B779A7F4AE5E23B63F235379EF90071709B239518E4035054800AAA94BDF081804F40239';
wwv_flow_imp.g_varchar2_table(39) := '1746ED2F828D4D4DB2F9F67B0D3DC5AB68CBEDEF93C646FB390A67BDE487AF0F8ED7DA319B3005E2DF170940FCD78819A650408F81EB6E703D266E0A2F9311B9E9BD1F905C5D83A95AACCAF404C51DEFB95F74EEA68969EC7AF843AF7D60AA4719020854';
wwv_flow_imp.g_varchar2_table(40) := '478004A03AAEF48A8051405FFCF558B8B19257B869C79E581FF7F7A6B8E25FBD34F1C61DBB572C5BB851AF79706A28D8258F17B6E33E02711748C2FC480092B04ACC31550297BCDDFE7A0CDC1654576F9FF4EFB8C5562DB6E56B76DC2A9D3DF6931607C7';
wwv_flow_imp.g_varchar2_table(41) := '67E4AA778B6D204C0C81940A9000A47461092B9E02D3B373A2C7BE6DB36B686888C195FE6CB3B4956764BB772820C8F501F44B83F4B088AD47CA1148864032664902908C7562962911D0CFFBCF05F808FC4DEF799FD435DAAFAE1777168DE1A63BEC2730';
wwv_flow_imp.g_varchar2_table(42) := 'EAF7059C1EB25F0B21EEF1323F049224400290A4D562AE8916B83C361DE8AB71D76FD921AD1E9668140000100049444154BD6B131DEBC2C9B7AF5E2FEB366F5FB869C5FB57276665787276C5323622902481A4CC950420292BC53C132D3093D75DFFF68F';
wwv_flow_imp.g_varchar2_table(43) := 'FCB57776CABA9D77243AD69526BF7ED79DD2DADEB152D1A26D27AF4D4A908B222D6AC4030410284B205B562B1A21804049027AF95BDB0B5B2E97951DEF7D4032D9187CC94F49D1D92B6B4CC58F337A319A6ACFE40B72864F059888288BBD407226480290';
wwv_flow_imp.g_varchar2_table(44) := '9CB562A60915D033DC839CF5BFFDB6BBA5BEB92DA151DAA7DDD0DA21DB6E798FB5E295F19940874AAC1D510101048C022400461E0A11A84C40DFF59F0EF08EB66FCD3AE95AB7A5B2C112D0BA7BFD76E959D56F9DA91E0A28E89582AC35A98040BC049234';
wwv_flow_imp.g_varchar2_table(45) := '1B128024AD16734D9C80BEF8EB19EEC68967B2B271CF5DC62A692ADC72EB3DE21DE710D31FBD40D0B961FB3913A63E28430001B3000980D9875204CA16D06BFDEB456E6C1D6CDD79ABD43725FF237FB638E7CBEB9A5B65F3CE3DF30F7D7F5E1C9B164D04';
wwv_flow_imp.g_varchar2_table(46) := '7C2B508040EC04923521128064AD17B34D90C0E9009F6BD733E3576DDD99A0A8C299EAEA2DBBAC9F0AD02300A7031C3E096746F482807B022400EEAD39114720A097FB9D9899B38EB4ADF82D7F196BBDB455C864B2723D7673647A5D80A109AE0D6056A2';
wwv_flow_imp.g_varchar2_table(47) := '342E02499B070940D2568CF9C65E402F697B6EC47EFC7ADDC6ADD2DCD91BFB78AA35418D5D0D6CFD9F199E124E08B429518E40E9022400A59BD10201A3C0B99129EBC56CF45AFFEB76A5EF823F4698150AD7DD7CBBA8C50A453736E97900E7032454371A';
wwv_flow_imp.g_varchar2_table(48) := '7007819A08246F501280E4AD19338EB1C0F8745E2E8FCD5867B875CF9D92AB6BB0D64B7B855C43A36C0990085D1C9D16FD22A5B47B101F02510A900044A9CD58A9173875CDFE85365D3D7DD2E9C067FE832E76D7FAADD2D5BBCA585DBF40490F05182B51';
wwv_flow_imp.g_varchar2_table(49) := '88400D05923834094012578D39C75240AFF8376E39F12F93CDC8D6E2897FB10CA16693DA7ADB3DA236A6095C9B9895316F0F8BA90E650820105C800420B8153511300A0439F16FE3F6DD52DFD26EECC7C54235D9B86DA735F4B3C353D63A5440207A8164';
wwv_flow_imp.g_varchar2_table(50) := '8E480290CC7563D63113B8E21DF7D793D54CD36A696D93FE6DBB4D559C2E5BB3FD16696A365F10492FAE3432C5C7029D7EA2107C68022400A151D291AB02FA11B5F323F677A6DB6ED7DDDCE9FBA6BFD0D63D9B13FD42245B7FE7B844B08D88F28805923A';
wwv_flow_imp.g_varchar2_table(51) := '1C094052578E79C74640CFFA9FCE17ACF379F3B927E4C547BFC4CD60B0EFC5A7AD8E7A1E805E20C85A910A08206014200130F25088805940DFFD5F18B55FF4C7DC0BA5A50A9CE35C8052C9A85F3581E4764C0290DCB563E63110B8E41DFB9F09F0EE3F06';
wwv_flow_imp.g_varchar2_table(52) := '534DD514F4D316D726ECD75B4855D0048340C80224002183D29D3B02737305B9C015EA6AB6E05C1DB066F40CBC4020C977490092BC7ACCBDA60297C76764D64B026A3A098707D72F5BE28B821C7E02107AC50224001513D281AB02FA8D7FAEC61E97B839';
wwv_flow_imp.g_varchar2_table(53) := 'FF222E2BE1EA3C921D370940B2D78FD9D748408F3F0739F3BF46D3736658FD44C0C44CDE997809148130054800C2D4A42F670438F61F9FA5662DE2B316AECD24E9F19200247D05997FE4027A35BA71CB35FFB7BDFFE3F2D0679EE51682C1D6FB3F6A5CE3';
wwv_flow_imp.g_varchar2_table(54) := '6B93B332939F33D6A1100104960B90002C37610B0246814B63F6CFFDAF7BE8E78D7D50185C60E0C33F67AC5C28885C1AE5238146240AAB2090FC2E490092BF864410A1C0F4EC9C0C79EF384D43AEBFED7D52BF7AB3A90A652508D4AFD926EBF6DC636CA1';
wwv_flow_imp.g_varchar2_table(55) := '9FC8D08F651A2B518800028B0448001671F00001B380BEFBD7779CA65A1B3FFCB3A662CACA10D8F411B3697EAE2057C6D90B50062D4DCA14484333128034AC22314422A0EF30AF8C9BBF89AE6FC37669DAFEDE48E6E3D220CD3BEE919EF55B8C21EB7732';
wwv_flow_imp.g_varchar2_table(56) := '182B508800028B0448001671F000017F81AB13B3A2EF34FD6B886CF989BF6D2AA6AC0281AD3F6EB69DF40ECFE8099A150C415304020AA4A31A09403AD691282210B0ED626EEB59256DB77E388299B83944FBED3F26AD5DBDC6E007390C60F4A110818502';
wwv_flow_imp.g_varchar2_table(57) := 'D9850FB88F00022B0B4C79EF2EF5A2332B975EDFBAFDC77F4E32B9DCF507FC1BBA80DA6EFF31F3B900572766440FD5843E381D22B040202D774900D2B292C45155812B63E613CCEAEA1BA4FBAE9FACEA1CE85CA4E7DE9F965C5D9D2FC55C4164D04B027C';
wwv_flow_imp.g_varchar2_table(58) := '2B50800002370448006E5070078195050A05FB19E61BEF7E48324DAD2B77C0D6D004324D6DB2E13D1F32F637683951D3D8984204AC02E9A9904D4F284482407504F473FFB66FFD5B73EFC7AB3338BD2E13587B9F794F8B1EAA99B45CA97159A76C40C041';
wwv_flow_imp.g_varchar2_table(59) := '01120007179D904B13B8627947D9B16A9D346DB9B3B44EA95DB640F3F6BB454FB834757065DC7EB546537BCA10F01348D376128034AD26B1842EA0D7981FB65CF96FD3FBBD77A4994CE863D3A18F8067BDF9FD3FED53787DF3A02569BB5E8B7F11705B80';
wwv_flow_imp.g_varchar2_table(60) := '04C0EDF5277A8BC0B509F3857FB2D98CF4DC637E31B20C41711902BD779B0FB9E8219B114BE256C6B034715E205D002400E95A4FA20959402FFE63EA72DD2DF749AEBDC75485B22A08E4BAD7C8BADDEF35F6ACDF1268AC4021028E0B900038FE04207C7F';
wwv_flow_imp.g_varchar2_table(61) := '81D97C41F48432FF1A226BEEFA715331655514587BF7DF30F66EDB7B636C4C21022B08A46D130940DA5694784213D08BCA983AF30E454BFBCEFB4D55625356181F96D17D4FC9F9477F578E3CFCABB2F7DFFD2FF2DCAF7CAC78D3FB471FFEB562D9D8BEA7';
wwv_flow_imp.g_varchar2_table(62) := '45EBC666E2868974ECFE80E81AF855291E0698321FC2F16BCB76045C10200170619589B12C01DB2EE4815BDF2799E6B6B2FA8EA2D1DCE8A05C78EC0F8A2FF64F7EF2E3F2D2E7FF95BCF5D77F26275E7E522E1F3F20936323C59BDE3FFEF213C5B2173FFF';
wwv_flow_imp.g_varchar2_table(63) := '7F8BD67DF3DFFF83625BED238AB9963346A6A543D6EE367F4DF090E51C8E72C6A58DAB02E98B3B9BBE90880881CA0582ECFEEFBFF3C3950F54851EE646AEC8D9BFF88C7CFFD7FE7BD9FF577F5C7CB12F75984BC7DE2EB6D53ECEFEE56724AE89C09AF73C';
wwv_flow_imp.g_varchar2_table(64) := '680CCD760E87B1318508A45C800420E50B4C78E509E8EEFF42C1BFADEE7AEED8FD7EFF0A352A197CF6ABF2D4BFFC9B72E0F12F4B7EC67CF9E22053D43E0E7CE7CBF2ECAFFF8C5CFDC1D7823489B44EC79E0F721820527177074B63E42400695C5562AA58';
wwv_flow_imp.g_varchar2_table(65) := 'C0B6FB7FEDAEBB24D3D259F138617550C8E7E5F817FFADBCFEE5FF1856978BFA999D9E92D7BEF45B72F22BBF213AD6A2C21A3EC8B676C99A9DEF31CEC0761D0763630A1148B10009408A1797D0CA13D06F93B39EFD7FA779D773792397D7AA3031226F7D';
wwv_flow_imp.g_varchar2_table(66) := 'F617E5E873DF2EAF83125A1DFEFE5FC8DB9FFBDFA530315A42ABEA565D7387792D8626F3D59D00BD3B2090CE10B3E90C8BA810285F60743A2FA6DDFF7AF19F8E5B3E58FE0021B62CCCCDC95BBFFF49B970686F88BD9ABB3A7FE03539F087FF42746C73CD';
wwv_flow_imp.g_varchar2_table(67) := '684A3B6E7D50744DFC469B9A9D9369EFE657CE76045C1520017075E589DB5760C4F2D1B1BECDBB24DB168F8BFF9CFAF3DF8CF4C55FDEFD73CE4B02CEFDE57F7AF7516D7FE885987A37ED344E62648ABD0046200A8D02692D240148EBCA1257D902B6178B';
wwv_flow_imp.g_varchar2_table(68) := '55BBEE2EBBEF301B5E7BFE1BA2BBE483F659DFD8241B77DF21B77FEC67E5AE4FFC13B9EFEF7EB278BBEB13FF586EFBE8CFCAFA9D7788D609DADF81EFFEB90CBDFC68D0EA55ADB76AE75DC6FE472C499DB1318508A454800420A50B4B58E509E8C7FF262C';
wwv_flow_imp.g_varchar2_table(69) := '5F25DBB9E33DE5751E62ABFCD025D9FBD560EFC09B5BDB64E7031F95BB7EE1FF90F5F7FFB4B40EEC90868E1EC9D635146F0D1DBDD2B67E876CFCC04F17EBDCFC818F4A93D726C874DFF8E26F4A7E643048D5AAD6E9BCC97C59E011F60054D53FDD9DA737';
wwv_flow_imp.g_varchar2_table(70) := '3A1280F4AE2D919521306279A75857DF208D9B6E2BA3E7709B9CFBEE176436C0C7FCFAB7DC2CB7FF0FFF587A6EBE5B32D93AEB24B44EEFCEBBE50EAF4DFFD69DD6FA3A870B4F3C6CAD57ED0A4DDE9A64EB72BEC3E855012766380CE00B4481930224004E';
wwv_flow_imp.g_varchar2_table(71) := '2E3B41FB098C58DE29AEBEE90EC9D4D5FB358F64BBBEFB3FF4CC5F5AC7DA76F783B2ED239F906C7DA3B5EED20ADA66DB433F235BEFB29FEC78F0A947243F74716917913ECE788959FF8EDB8D63DAD6D6D898426705D21C3809409A5797D84A1618B6EC01';
wwv_flow_imp.g_varchar2_table(72) := 'E8B31C6B2E79C0321A5C7CE62B529833BF9B5D7FF3EDD27FFB0365F4BEB8C99A3B3E24EB77DDB978E3924773B3337229061709EABBD97C1860D492DC2D098B8708A45E800420F54B4C804105F4A3623379C3E5FFBC8E3A76985F64BC2A55FF7BE6F5678C';
wwv_flow_imp.g_varchar2_table(73) := '63740F6CF18EE7FF94B14E29851BEFFFB8F4ACDF6A6C72E6874F19CBA328ECBCE96EE330FAF14E63050A11582690EE0D2400E95E5FA22B4160DC728CB8A9B55D1AD6DD54428FE1579DBD785C862F9E3176BCE1D67BC53BE02FA1FDC96465FD2DE617D721';
wwv_flow_imp.g_varchar2_table(74) := '6F4EB3974E863664391DD50FEC9486E616DFA6F9B982E835017C2B508080630224008E2D38E1FA0B8C4FCFF9177A25ABB6DF26C60BCF4BF5FF5CDDFFAC7190A6D6B6E219FDC64A6514B6ADBF491A5BDA8D2D87DEFA81B1BCDA85996C568A6B6418687CDA';
wwv_flow_imp.g_varchar2_table(75) := '7CE8C4D094220705D21E320940DA5798F8020BD8F600746EDE1DB8AF6A551C3E79C0D8F59A0067EE1B3B3014AED97AB3A15464F8D441637914855D960B024D583EE219C51C190381B8089000C465259847CD056CD7FF6FDB607E018C2280896B578CC374';
wwv_flow_imp.g_varchar2_table(76) := '6DB9C5585E4961F766F3C7022786CC73AB64ECA06D6D6B346639CC13741CEAB92090FE184900D2BFC6441840408F0D7B87888D359B37EC3296475138396C7E916DEA5E5DB56934F5AE33F63D3974D9581E4561F3803949630F4014ABC0184911200148CA';
wwv_flow_imp.g_varchar2_table(77) := '4A31CFAA0AD88E0DB7F5AC8AC5D7FF8E0D5E343A6472F68BFD183B30146672FE17DAD166E343B5BF2260B673B5B474F97F4F032702EA4A710B22E0421D120017569918AD02B67786BD5B6A7FFC5F83C8D537E80FFF9BE96B0CFD5B052A29E42D27D015CC';
wwv_flow_imp.g_varchar2_table(78) := '2751061A24844ABD9BCC7B6A6CC95E0853A00B04122140029088656292D516B01D1BEED8683EFE5DEDF9CDF7DFD2D9377F77C59FB393632B6E0F6363DED2774B97796E12D19FCECDE604C096EC45344D8689B5801B93230170639D89D222607B5168DB10';
wwv_flow_imp.g_varchar2_table(79) := '8F04A0A9ABD718C9D455F3210263634BE194E5187F4BF72A4B0FD114DB4E049C988DC79E8A68341805017F0112007F1B4A1C11D06F00D463C3A6701BFBB7988A232B6BB6EC01183E77BC6A73B976FA88B1EFA6CE7824008DABCD6BA5277C1A03A1D07901';
wwv_flow_imp.g_varchar2_table(80) := '570048005C5969E2F41598B4BC23D46F00CC76C463F776C746F359EE574E995FA47D1102145C3E79D858CB363763E3100B73DD6B249BCBF9F64802E04B4381630224008E2D38E12E1798CE9B770977ADDBBCBC518DB674EE7A9F71E491C14B327EFE98B1';
wwv_flow_imp.g_varchar2_table(81) := '4E3985A3A70FC9F8F03563D3CE5BECDF1C68EC20C4C2AEB59B8CBD4D724120A38FDB85EE444F02E0CE5A13A98F80ED1D615BFF069F96D16FAE5BB5493A560F18073EFCDC6352989B35D629A5B0303B2D877FF0A8B149F7BA2D92EBEA37D689B2B0DDB266';
wwv_flow_imp.g_varchar2_table(82) := 'B6358F72AE8C8540AD0448006A25CFB8B111B01D02685DBD313673D5890CDC617EA73DEAED0538FDFC5F6BD5506E275F784CC647468C7DADBDA3F2AF1E360E506261EBAAF5C6165396BD3EC6C614A65AC0A5E048005C5A6D625D51C0F66EB0D9F262B262';
wwv_flow_imp.g_varchar2_table(83) := 'A755DCB8FA439FF08E71D7194738F5F66B72E18DEF1BEB04293CFFC63372E6C0EBC6AAD9FA0659FDC0278C75A237EC0D4300001000494441542E6CB6246DB6358F7ABE8C87402D0448006AA1CE98B112B0BD1834F699DF4D461D4CAE6395ECFC899FB50E';
wwv_flow_imp.g_varchar2_table(84) := '7BE4E5A7E4E8135F95B999296BDDA515B4CDE1EF7D458EBEFCF4D2A2658F77FD8D9F976C5BD7B2EDB5DCD0D8673E4C62DBEB53CBB933762D05DC1A9B04C0ADF526DA250233DEAE60DB7700D4F7C62B01D010FA1FFA1FA5B1B55DEF1A6FE78F1E90BD5FFF';
wwv_flow_imp.g_varchar2_table(85) := '9C8C9F359FC1BFB093B13387E5CDAF7F5E2E1E7B67E1E615EF37B4B4C9EA077F7EC5B25A6E6CB0ACD9B4E5931FB59C3B6323109500094054D28C134B81E97CC138AF5C5D9D645B3B8D756A5198696A953BFEA77F1968E8F1916179FD5B5F94837FFDB05C';
wwv_flow_imp.g_varchar2_table(86) := 'F40E0B8C9D3D2AD3C38332373B5DBC4D8F0C8A6EBBB8F7FBC53A6F7CFB8B32363214A8EF3BFFEEAF4AA6B12550DD282B65DB7B259BCDF80E3963CBFA7C5B52906601D7622301706DC589779180ED02402D5DF1B8B88DACF0A775F703B2FBA3BFB042C9CA';
wwv_flow_imp.g_varchar2_table(87) := '9B2E9F3E2187BDC3026F7CEBCFE495AF7C565EF8E3FFAF787BE5CB9F15DD76F8A5A744EBACDC7AF9D63D3FF5F7A475D7FB9717C4614B2623CD9DBDBE33D1AF4CB0ADBD6F630A1048890009404A169230CA1398B1EC0168EEEC29AFE3885AF57FEC1FCADA';
wwv_flow_imp.g_varchar2_table(88) := '5DEF8968B41F0D3370CB3DD2FF13FFF38F36C4F05E738779ED6C6B1FC39098525505DCEB9C04C0BD3527E20502B3965DC18D313BB96DC1D48B7733D9ACECFC7BFF56D6ECBCB3F8388A7F34E1B8E9EF7C5AC47B972D31FED364D803A0D3B6ADBDD6E18640';
wwv_flow_imp.g_varchar2_table(89) := '9A054800D2BCBAC46615989D335F05B0D172ED7DEB001154C834B7CBAE7FF41F64FB03FF4DD547DBF1919FF1C6FA2DC934B5557DAC4A07686CEF3676615B7B63630A5327E0624024002EAE3A31DF10B09D0CDED8617E11B9D1518DEF647239D9F8895F96';
wwv_flow_imp.g_varchar2_table(90) := '3B7FEEFF14DD2B10F674B27539B9EBEFFFBA6CF86FFF9948D6FF3AFB618F5B497F8D964300B396BD3F958C4D5B0492204002908455628E551398C99BF70034B49B8F23576D626576DC7DFF7F270FFCEA9FC9F60FFC94E4BCA4A0CC6E6E34CBE5EA64FB07';
wwv_flow_imp.g_varchar2_table(91) := 'FFA63CF0AFFE8B74DCF1E337B627E18E6DED662CE77F242146E61896809BFD9000B8B9EE44FDAE80ED5D607D5BBC2E70F3EEB48D3FEAFA36C8C6BFF52BF2C0A7BF26BB3FF6B7A5ADBBF44F32B4F5AC963D3FF977E4817FF375D9F833BF24B95EF385758C';
wwv_flow_imp.g_varchar2_table(92) := '13AA51A16DEDF814408D16866163234002109BA56022B510B0BD08D42530019877D4AF305EF3F17F24F77CFA1BF2FE5FFEBCECFEE82F48FF8EDB44BFB8A7A5FBFAD71B67EB1B45EFF7ACDF5A2CD384E1039FFC03B9E7535F97FE8FFE03C9B6F5CC7797B8';
wwv_flow_imp.g_varchar2_table(93) := '9FB6B5B3257F890B9809972DE06AC3ACAB811337022A60BE0C9077B8BBA94DAB25FED6B8618FACF9C9FF4DF6FCD3DF913BFFC59FC87D9FFEA63CF49967E5C17FFFBDE2FD3B3EF970B14C138686F53B131FAF06906B365F2991530054899BCB0224002EAF';
wwv_flow_imp.g_varchar2_table(94) := '3EB18B5E10C6C490AD6B3015531663814C5DBD717673B6C537B6A6303D02EE464202E0EEDA137900814CCEFC2212A00BAAD448209333276FEC01A8D1C2306C6C04480062B3144CA41602B643004202508B6509654CDB1E80027B0042714E7A272ECF9F04';
wwv_flow_imp.g_varchar2_table(95) := 'C0E5D52776EF10803905B0BD8840185F818CE5F00D7B00E2BB76CC2C1A011280689C1925A1021C0248E8C279D3B6AD1DE7007848CEFF751B8004C0EDF5773E7ADBBB40F60024F829623D0930C1B1317504421020010801912E522C50DF98E2E0D21D5AA6';
wwv_flow_imp.g_varchar2_table(96) := 'CEBC76EC0148F7FA0789CEF53A2400AE3F031C8F3F93B100CCCE582A501C5B81B9BC716AE6B33F8C4D29442015022400A95846822857206BC900E6A6C6CBED9A763516989B1A33CEC0B6F6C6C614A64080104800780E382D90B5EC0128585E449CC68B79';
wwv_flow_imp.g_varchar2_table(97) := 'F085495B0210F300981E0255162001A83230DDC75B206BD90390B7BC88C43B3AB76797B7246FB6B5775B2FFDD113A1080900CF02A7053296E86DBB912DCD29AEA1C09C2579CBDA16BF8673676804A210200188429931622B607B11989BE41C80D82E9E65';
wwv_flow_imp.g_varchar2_table(98) := '627396F337B296BD3F96EE294EB400935701120055E0E6AC4026637E1B68DB8DEC2C5C02029FB5EC01B02C7D0222648A085426400250991FAD132E9035BFFE0BE700247781F313A3C6C967C9008C3E692E24B6EB022400D71DF8D75101DB8BC0EC84F94C';
wwv_flow_imp.g_varchar2_table(99) := '7247D91211B6750F4022A2609208544F8004A07AB6F49C00815CD6BC0B8043000958449F29DAF6DED459D6DEA75B36275E8000E6054800E625F8E9A440BDE545803D00C97D5ACC5A0E01D4E7CCC95F722367E6080413200108E644AD940AD4595E04662C';
wwv_flow_imp.g_varchar2_table(100) := '2792A594251561D9D68E3D00A958E69283A0C18F0448007E64C13D07056C7B0066380720B1CF0ADBDAB10720B14BCBC4431220010809926E922960DD0360D98D9CCCA8DD98F5CCB8F9530075597EFDB9F14C581825F7170AF03F60A106F79D13A8B7BC08';
wwv_flow_imp.g_varchar2_table(101) := '4C5CBDEC9C495A029EB8665E3BF600A465A589A35C01128072E568970A01DB8BC0C8E5B352989B4B45AC2E0551989D91E14B678D21D75B4E003536A63091024C7AB10009C0620F1E3926A01F0334BD0ECCE5F3921F3CE3984AF2C3B5AD995E03286B5AF8';
wwv_flow_imp.g_varchar2_table(102) := 'E413100102560112002B1115D22C303E9D97B98239C2E92BA7CD15288D9DC0D465F39A15BC35D7B58FDDC499501505E87AA90009C052111E3B23A02F0047AE4C58E39DBC74CA5A870AF11208B26687BDB5D7E740BC66CE6C10884E8004203A6B468A9180';
wwv_flow_imp.g_varchar2_table(103) := 'FEE2D717FF59DBDB7F6FCEE31749003C8644FD1D0BB066796FED490212B5AC154D96C6CB054800969BB025E502A5BCF82BC5E88593FA835B820482AE194940821695A9862E4002103A291DC659A0D4177F8D65F83C09803A24E9367CFE44E0E9920404A6';
wwv_flow_imp.g_varchar2_table(104) := '4A7045A6BE920009C04A2A6C4BA540392FFE0A313A7849F463657A9F5BFC050AD313323E74B5A489920494C445E594089000A4642109C32C30319397A0C7FC57EA69F672F077942BB5675B74023397CADB63339F048C4DE7A39B2C234522C0202B0B9000';
wwv_flow_imp.g_varchar2_table(105) := 'ACECC2D61409E88BFFE1CB1312E4843FBFB0A752F44980F103CFC9FECFFC1379EE573E56BCE9FD89832FFA859EB8ED95AC9526019A288E4E9104246EE19970C90224002593D120490261BCF86BBC1397CC9F2BD73A49B88DBFF382BCF0D95F960B07DF90';
wwv_flow_imp.g_varchar2_table(106) := 'C9B191E24DEF3FFF997F2E13075F4A4208D6394E5CAEECC24DD7938071614F80953A211598A69F40D6AF80ED08245D20AC177F7548CB47018FFEF517349C156F47BEFD472B6E4FDAC630D66AAE20C54346EC0948DAEA33DF520448004AD1A26E62044A7D';
wwv_flow_imp.g_varchar2_table(107) := 'F15FB56E8331B6910BE9B816C0D09923BE719672E6BC6F273128B07D04B0DFB2D6F321E89E80A383134212302F92CC9FCCDA5F8004C0DF8692840A94F2E29FCD66E5D6FB1F92B55B771AA31D3CF98E14F2C93F2E3C3531EE1BE7E4E8B06F59520A748D06';
wwv_flow_imp.g_varchar2_table(108) := '4F1F364E77CDB65DC535D7B53756F40A35093872655C46A666BD47FC45205D022400E95A4FE7A3999C9993A027FC657339D973DF83D2D2BD5A9A3B7B2497F3FFEF303B3D2D33E70E3AEF1B7780E9D36F8BAE95DF3C758D9B3ABA8B6BAE6B9FF51240BFBA';
wwv_flow_imp.g_varchar2_table(109) := 'F3DBF570C0D12B132401F32089FAC9644D02FEBFF14CAD2843208602C5177FEFDD5A90B3FDB3B99CDCF2BE878A2F04D743C94867CFAAEB777DFE1D39F2BA4F099BE322307CD4BC465D7DFDDE5433DE4D8A6B4F1250A4E01F470548001C5DF8B4853DFFE2';
wwv_flow_imp.g_varchar2_table(110) := '3F932F5843CBE672C517FFE6CEDE4575DB7B572F7ABCF4C1E021F38BCBD2FA3C8E5EE0EAE1378C83B6F7F42D2AD7BD3FC524C07B4E2C2A58E1017B02564089F926A66716200130FB509A0081305EFC35CCF6EEC52F0EBA6DE1EDC2C1D7A53037B77013F7';
wwv_flow_imp.g_varchar2_table(111) := '6324A06B73FEC00F8D336AEB5EB5AC5C9300DD1B94CDE596952DDD4012B05484C74916200148F2EA317729E5C5BFAEBE7EC577FEF38C2D5D7D92C95EDF3D2C2BFC999E189399F347562861531C0466CE1E341EFFD7B56D59B2D7677EDEBA37A8E4246092';
wwv_flow_imp.g_varchar2_table(112) := '1303E7FDE2F99359D90448006C4294C756A0D417FF3DF77D58F417BD5F40996C4E3ABA7AFC8A8BDB478F997731172BF14F4D04462C6BD3D1D5EB2578FEEFF2F5B951521230382123240135596B060D478004201C477A8958606A764E0E5F199720C7FCF5';
wwv_flow_imp.g_varchar2_table(113) := '9DBFBEF83775985FDC3584CE1EF37900570FBDA6D5B8C55060F0A0796DBA7A97EFFE5F1A0649C05291E43E66E676011200BB11356226A02FFE872E87FFE2AF61B6593E0970F1207B00D4296E373DFE7FE19D578DD36AB7ACED7CE3F9244013C7F96D7E3F';
wwv_flow_imp.g_varchar2_table(114) := '8BE704B027C08F87ED3117200188F90231BDC502D57CF1D7915ABBFAF487EF6D62E49ACC5C38E65B4E416D04662F1C9569C3458E74562DDDE6BD3B5A67FEA64980EE352209981749DA4FE61B44800420881275622150CA8B7F7D7DBDEC79DF4724C86EFF';
wwv_flow_imp.g_varchar2_table(115) := '85C165EB1BA4B5BD63E1A665F7C72CC79A97356043D505468F9AF7CC7474744A265757D23CF4B9B3FBBE0F4BD024E0B05E2C8873024A32A6726D0548006AEBCFE80105E6BC7DAD7A35B6C0C7FCEFF75EFCDBBB02F6BEB85AB7E57A0057B91EC062B0183C';
wwv_flow_imp.g_varchar2_table(116) := '1A3C6CBE464387654DFD4268EEE891A07B02B48F6357278B9F4CD1FBDC6A27C0C8C1044800823951ABC60247BCE3AC93B3F6CFE0EBBBB55BBC17FFC6B6F25EFC354CDBB1E2F36FBFA2D5B8C548E0C201F3F1FF8E002700FA85A37B02822601F3DF1DA03F';
wwv_flow_imp.g_varchar2_table(117) := 'FDFA633B027111200188CB4A300F5F8193DEBBAA20DFC816C68BBF4EA2C5F249003D0F60FAEC41ADCA2D0602D3A70FC8E4E89071262D251CFF5FA9A3529280E97C41F45B040B05FB5529571A8B6D950AD03EA80009405029EAD544E0D2E8B45C199FB18E';
wwv_flow_imp.g_varchar2_table(118) := '5DDFD02095BEF39F1FA4AEB1599A5B5BE71FAEF8F3EA1B4FAEB89D8DD10B5C79FD09E3A02DAD6D926B6832D60952A849803EC734D1B4D5D784F5E4B5295B35CA11A8A90009404DF919DC24A0175939336CFF255ADFA02FFE3F2695ECF65F3A8F9ED5EB96';
wwv_flow_imp.g_varchar2_table(119) := '6E5AF4F8D4CBDF5DF49807B51338F9E263C6C17BFBD71ACB4B29D4E758D02460D04B5C2F7A096C29FD53B772017A082E400210DC8A9A110A4CCECC899E5065DB8B9ACD6645CFD46E68359FB95FEAD47BD66E343619BE744EA6CF1C30D6A1B0FA02D3A7DE';
wwv_flow_imp.g_varchar2_table(120) := '92B16B578C0375AFDD642C2FB5B09804DCF7E140CDCE0C4DC9309F0C086445A5E8054800A23767C40002C7AF4E88ED44AA4C4664D7DD0F48537B77801E4BABD2D2DD278D4DE6DDC6836F3C555AA7D40E5DC0B6FBBFB9B9459A2DD7762867528D1D3DB2EB';
wwv_flow_imp.g_varchar2_table(121) := 'AEF7076A7AE2EAA4E8A7580255A6528502342F458004A0142DEA4622706D624626BC3D00B6C136EFBC55DAFAC2DBBDBB78BC8CF4AFDFB278D39247A75FF9DE922D3C8C54C0DB3D74F2A5C78D43F6AF0FF7DDFFC2C13AFA37C826EF39B870DB4AF767E70A';
wwv_flow_imp.g_varchar2_table(122) := '728143012BD1B0ADC6022400355E00865F2E7076787AF9C6255B560F6C90D55BF72CD91AEEC3EE75010E039CE63040B8EAC17B9B0AB0FBBFCB722827F8682BD75CB36D8FF40F989F27DAF2D2D88C758F96D6E3569900AD4B13200128CD8BDA5516B83C36';
wwv_flow_imp.g_varchar2_table(123) := '2D5396CFFB7776F7CAE6DBEEABF24CA47868A1B5ADDD388E6D17B4B131851509D8ECF5ECFFC62A1C1E5A3AE94DB7DD2B1D5DE6C3507A38EBC2883DB15DDA378F11A8A60009403575E9BB2401FDDCF479CB2FC96C3623DBEEBC5FF4AB7B4BEABCCCCA7D03';
wwv_flow_imp.g_varchar2_table(124) := 'E65DC8275FFA4E993DD3AC22016FF7BFED9318FD1BCC87702A1A7F41637D2E5E7F4E66166C5D7EF79297DCCEE6B936C07299B0B6D091A6DB6300001000494441544FA9022400A58A51BF6A02174767C476A9DF812D374B7DB3F933FA614EB067DD666377';
wwv_flow_imp.g_varchar2_table(125) := '63572F8B9E896EAC4461E8025327F759CFFEB7AD5D98936A686997814DDBC5F467CE7BED3F3762FF58ABA90FCA1008538004204C4DFA2A5BA0B88BD472A2945E8065CDF6DD658F514EC3869636E9E8EC3236B5ED8A3636A6B02C81CBAF992FFED3D9DD23';
wwv_flow_imp.g_varchar2_table(126) := '7511268A1AC4DA1DB74A5D7D9DDEF5BDE9B501F844802F4F4505342E5D8004A074335A5441407F316A1260EA7AD34D7B245BD760AA5295B2DE01F35E80937A51206F97745506A7D3E5029EF5E91F9A13805ECBA19BE59D56BE45BF4972C3F65DC68E742F';
wwv_flow_imp.g_varchar2_table(127) := 'C0F0D4ACB10E850844254002109534E3180586A7F2C6F2E6E666E9DD7493D4E24F8FE5D3007A1840CF48AFC5DC5C1C73F2F81BC6DDFF19EF507CCF5A73D2562DB7559B774A93F75C35F53F34697EAE9BDA52E627C0F672044800CA51A34DE802A3967745';
wwv_flow_imp.g_varchar2_table(128) := '9BF7DC29994C6D9EAE758D2DD2D9D3678CF9E24BDF329653189EC0A557CC275E76F5AE965C4363780396D0939E10B879E76DC6165C19D0C843618402B5F98D1A61800C157F01BDE6BFEE1AF59B697D7D83E84557FCCAA3D8BECAB24BF9D873DF96C2C448';
wwv_flow_imp.g_varchar2_table(129) := '1453717A8CC2C4A81C7BFEDB4683BE751B8CE5D52EEC5CB7D9782E805E1868C492F0567B8E69EB9F78CA13200128CF8D56210A0C5B7E19F6ACEEF746CB78B7DAFDED5AB34174D7B2DF0C6667A6E5CA0B7FE157CCF690042E3FFF0D999DF1FF76C84C3623';
wwv_flow_imp.g_varchar2_table(130) := '5D215FFBBFF4A967A467D51A6333F6021879288C48800420226886F117B01D13EDB27C339F7FCFE195E8D7C976F76922E2DFE79127BE22853CC777FD852A2B51DB234F7ED5D889BEF0D6E244D1A593EAB43C576CCFF9A5FDF1D8244059B9022400E5CAD1';
wwv_flow_imp.g_varchar2_table(131) := '2E1401BDEA9FDE4C9DB5F7AD33154756D6BF699B712CFD56BAD1379F34D6A1B07C81D1BDDF93F16B83C60EFA379A3F8B6F6C1C6261FBAA01636FFA9C9F9821593422515875011280AA13338049C0F64BB0ADA3B36627742D9DB79E87A097975DBA7DE1E3';
wwv_flow_imp.g_varchar2_table(132) := '63DFFBE2C287DC0F51C066DBDADE21ED31D85BA421D737B588ED32D241BEF04AFBE26616A0B47C011280F2ED68198280EDCA7FED9DE66BAC87308512BAC8C8C0B69B8DF52F1F7F47A64EEC33D6A1B07481A9E37BE5F28943C68603DBF433F8B53D5764E1';
wwv_flow_imp.g_varchar2_table(133) := '04DB2CCF5D3D1970617DEE2310B5000940D4E28CB748C0F64BB0A1B17951FD5A3FE81ED82A8D4D4DC6699C7EFACBC6720A4B1738FD94D954D7A4ABCADFFC57EAACEB2DCF13BE17A054D195EAB3AD120112804AF4685BB1802D01A8B3FC12AD78022576A0';
wwv_flow_imp.g_varchar2_table(134) := '9FF35EB76587B1D5A9579F96FCF025631D0A830BE4AF9E9753AF3D636C30B075A7E8DA182B455CD8D0D8621C71D6F4D957634B0A1108478004201C477A2953C07608A0C13B965A66D7556BD6B77187647339DFFEE7F27372F119F3D9EABE8D29582670E1';
wwv_flow_imp.g_varchar2_table(135) := 'FB5F11D3F5F3EBEAEBA57783F904CD659D46B0A1A1C9BCF78A04A0F245A087CA0448002AF3A3758502B65F8275313B04A0E1EAC7CC06366FD7BBBEB723CF3C228569BEF9CD17286041616A5C0E3FFD88B1F6C0A6ED92ADAB37D6A945611D09402DD819B3';
wwv_flow_imp.g_varchar2_table(136) := '0401128012B0A81ABE803501A8D1255D6D91AEDEA2BB9CFD4F389B9E18936BAF3C6AEB86728BC0D597FF4A660D8954269B9155DE5A58BAA949717DA3F95C11DB73BF26934ED4A04CB6520112804A05695F91C08CB7BBDCD441434B9BA9B86665BA67A27F';
wwv_flow_imp.g_varchar2_table(137) := 'C0FC85337A612029146A36C7A40F5C989B93C38F7FC918C69AF55B2417D324B1AEA1D938771200230F85110890004480CC10FE02F6F3A0FCDF65FBF71A4DC9DAE2C7CEFCC71ABE705A465E7FDCBF0225468191D71E93D1C18BC63AFD317DF7AF93B61D96';
wwv_flow_imp.g_varchar2_table(138) := 'B07DFDB5F6C1CD5F8092CA0548002A37A40747051A5A3BA4AF7FAD31FAB7BFF93929CC4C1BEB50B85CA0303B236F7DE37796172CD8D2B766401ADB3A166CE12E020894224002508A1675115822B0C6B21740DFC10E3EF7B525AD786813B8FCCC17657CE8';
wwv_flow_imp.g_varchar2_table(139) := 'AAB1DADAAD7AE11F63150A532B40606108900084A1481FCE0AB476AF96CE9E5E63FC6F7FEB0B52981831D6A1F0470273634372E0DB7FF2A30D2BDCEBECEE9596EEBE154AD884000241054800824A510F011F81F596BD00D3E3A372EEF13FF269CDE6A502';
wwv_flow_imp.g_varchar2_table(140) := 'E7BEF387323339B174F3A2C7033BF62C7ACC03B70488361C011280701CE9C56181B6D503D2D1D56D1438F8C4D7247FED82B10E8522F9C1B372E8E96F1A29748F4BFBAA787C43A471A214221073011280982F10D34B82404636DF7AB771A273F9BC9CF88B';
wwv_flow_imp.g_varchar2_table(141) := 'CF1AEB502872EC91DF16B5F2B3C86444B658ACFDDAB23D2D02C411960009405892F4E3B44073478FACDBB8C56870FCE52764FAD45BC63A2E174E9F7E5B4EBE6ABEE6FFDA4DDBA4B1ADCB652662472034011280D028E9C875817537DF217A5D7A93C33B5F';
wwv_flow_imp.g_varchar2_table(142) := 'FD2D53B1D36507BEFC9BC6F8D576DD8EDB8C75284CBF001186274002109E253D392E906B68944D37DF6254B874EC6D19DBFF7D631D170B47F73E21978FBF630C7DF3CEDB627BD53FE3C4294420A6022400315D18A6954C81BE8D37495B47A771F26F7FFD';
wwv_flow_imp.g_varchar2_table(143) := 'B7452F736BACE45061213F2B07BEF93963C46D1D1DD2BBC1FC054CC60E284C8900618429400210A6267D2190C9584F521BBE7846AEBD603ED3DD25C8ABCF7F5D862F9D3586BCF5D67B443C5BE10F020884264002101A251D21705DA0A5AB4F56ADDB20A6';
wwv_flow_imp.g_varchar2_table(144) := '3FFB1FF93DC98F5C315571A22C3F32286F3DF207C658FB073648B3676AAC44A113020419AE000940B89EF486405160C3AE3B259BF5FFEFA517073AF467FFA658D7E57F0EFDE9A7657A72DC97A0AEAE4ED6EF7A8F6F3905082050BE80FF6FA8F2FBA42502';
wwv_flow_imp.g_varchar2_table(145) := 'CE0BD437B5C8C69BCC57AB3BBBFF65197AF95167ADAEBDF8889C7DEB1563FC1B76EC12FDEA6563250A1D1120CCB0054800C216A53F04DE1558BD65A7B4B4B6BEFB68E51F6F7EE53F3A7985C0FCD045D9F7E7E60B233535B7C8AACD3B853F0820501D0112';
wwv_flow_imp.g_varchar2_table(146) := '80EAB8D22B0292C9E664CB6EF3EE6BDDFD7DF04FFF1FB7B40A0579E7E14F1977FD2BC8B65BDF5B34D4FBDC1040207C011280F04DE911811B02FA3D01BDFD6B6F3C5EE9CEB9775E77EA5301579FFF869C3FF8C64A1437B6F5AC5E236DAB066E3CE60E0208';
wwv_flow_imp.g_varchar2_table(147) := '842F400210BE293D22B04860E36E7D279B59B46DE983BD5FFD4F4E1C0AD02FFB79F36BBFBD34FC458FB3D98C6CB9C5FCDD0A8B1AF0C0010142AC860009403554E91381050223FA19776FB7F7824DCBEECE4E4FCB3B7A28C0526F59C3246DF0627BFB0BFF';
wwv_flow_imp.g_varchar2_table(148) := '5A3456D3B40B5EBD21353355A20C01042A162001A898900E10F01328C8E9B75E91C3FB5E15EF35CDAFD28DEDE7BD4301833FF8F31B8FD376E7CAB35F918B47ED5F86A45687DFFC61D14EA4903606E229438026D5112001A88E2BBD3A2EA097B73DF2C3EF';
wwv_flow_imp.g_varchar2_table(149) := 'CB9963874B92D8F7F5DF11DD4D5E52A304549EBD7C4AF67FC37CB9DFA561A89D1AAAE5D2321E238040E5022400951BD203028B04F2D39372E0F9EFCAE5F3E6CBDB2E6AF4EE83D9991979FBE14F499ABE2B406379FB8F7F5D34B677C30CFC430DD5524D03';
wwv_flow_imp.g_varchar2_table(150) := '37A262CA0408A75A022400D592A55F2705A6C78665DFB38FC9F0D0B5B2E3BF7864BF5C79E64B65B78F5BC32B4F7F512E9D3858F6B4D4524DD5B6EC4E68880002CB0448009691B00181F204C6AE9C97377FF0B84C4E4C94D7C18256FBBFF979993CB16FC1';
wwv_flow_imp.g_varchar2_table(151) := '9664DE9D3AB95FF63FF27B154F5E4DD576ECEAC58AFBA283640930DBEA09900054CF969E1D12183C7D44F6BDF054E0DDDC75D98C51279FCFCB6B9FFFA4E4872E19EBC5B9307FF5BCFCF0777F493416D33C6D16F36DF510C2BEE79F94ABA78FCE6FE22702';
wwv_flow_imp.g_varchar2_table(152) := '085420400250011E4D11D0B3D4CF1D785D0EBDF172608CCEA63AD9DDDF2ACDF5E6FF7E132343B2EFF3BF2485E9CAF728049E5C481575CE7B3FF7CF657274D8D8638B67A0166A62AC385F5828C8C1375E92F3EFE88584F884C03C4B7A7F12593505CCBF81';
wwv_flow_imp.g_varchar2_table(153) := 'AA39327D23907081C25C5E8EBEFAAC9C3C72207024ABDBEA656B6FB3E4BC3D005B7AAEFF3435BE72EAB01CF9937FEDE519097AB1F35EA40F7DE1D7E4EAD913A6D01619A889DA181B2C283C71F8EDA2BDAEC182CDDC450081120448004AC0A22A02F302F9';
wwv_flow_imp.g_varchar2_table(154) := 'E92979E78527E4D2B933F39B8C3F33DE1EFF8D5D4D32D0D974A35E635D56D67736DE78EC77E7E4EB3F900BDFF9CF7EC5B1DB7EE1B1DF97D37B9FB7CE6B6357A3347806F315073C1B3552ABF96DA69F6AAF6BA06B61AA47597205987975054800AAEB4BEF';
wwv_flow_imp.g_varchar2_table(155) := '2914D0B3D1DF7AEE3B3274F54AA0E8F4DDFE36EFDD7E6F6BFDB2FA3D2DF5D2D55CB76CFBD20DFBFFEA8F65F4CDA7966E8EDDE3D17D4FCBFE471FB6CEABB718F7720F35522B35B376E255D035D0B5981E1FF11EF11701044A11200128458BBACE0BE859E8';
wwv_flow_imp.g_varchar2_table(156) := '7A36FAF8D858208B865C4676F4354BBB77DCDFAFC1266FCF80D6F32B9FDFFEEA1F7D5A66CE957661A1F9B651FC9C3EF38EBCFA879FB20ED5E4BDEB5F6FD8F3A1566A16C44407D3B5D8F7ECE3327EEDB23EE4961A0102A9B6000940B585E93F350243E74E';
wwv_flow_imp.g_varchar2_table(157) := 'C8FE179E0C7CA67F4B7D566E5ED52ACDF539A3817EF9CDE69E66B1EDFA9E9D9996D77EF7FF92FCC8A0B1BF5A14EA9C5EF5E6A673348D9FF50E85E8B90F1AB3A99E9AA99D1A9AEACD97CD7836FB9FFF9EE81ACD6FE327020898054800CC3E9422E00914E4';
wwv_flow_imp.g_varchar2_table(158) := 'FCA1BD72E0D5E7A53057F01EDBFFEA59ED3BFA5AA4CEDB0360AF2DD2DA9093B5EDF6F30146AF5E96B77EFF97A5303B13A4DB48EA1466A664FFEFFD928C0F5DB58E37E0BDF36FF212236B45AF82DAA9A15A7A0FAD7FE7BCB5D1353A7FE84DAF6EB075F22A';
wwv_flow_imp.g_varchar2_table(159) := 'F237A6024CABFA022400D5376684040B14E6F272ECF5E7E4C441FB97D8CC87A967B3EB59EDB677B9F3F5E77FF6B737485773DDFC43DF9F978E1D90E35FFE7F7DCBA32E38FAA79F96CBC7DFB10EDBEDC5D6D7DA60ADB7B0821AAAA59A2EDC6EBA7FE2E0FE';
wwv_flow_imp.g_varchar2_table(160) := 'E29AE9DA99EA518680EB022400AE3F0388DF5740CF2E7FE7C527E5E29953BE7596166CE86A5C74A6FFD272DB633D1FA039C03BE4632F7C474E7FED376DDD55BDFCD4D7FE7F39F1EAD3D671740FC7A6EE266B3DBF0A039D4DA2B67EE54BB7EB9AE9DACDCD';
wwv_flow_imp.g_varchar2_table(161) := '4E2F2DE271220498641402240051283346E204F4AC723DBB7C6830D889657AD6FAF6DE6629F51DEE52187DC7BBCDEBA74E0F962F2D5CF2F8E053DF94BDFFEEEF4B7E28FACBE3EA55FE74EC434F3DB26456CB1FD67B8741B6F434492693595E58C216B555';
wwv_flow_imp.g_varchar2_table(162) := '63B50ED24CD76EFFB3DF91D98960276C06E9933A08A4498004204DAB492CA1088C5FBB2CC5B3CA433CD3BF9489D5E7B2B2A5A7D97BC1B4B7BAECED7A7FF6D73F216F7DF69FCAA5271E96E953DEA10AEFB085BD658935BC3EA74EED974BDFFB8237D62FCA';
wwv_flow_imp.g_varchar2_table(163) := 'B39FFA5B8176FB6B1EA3B1684C258EB862F5F6A6BAE2A72A34A958B1C2928DE363A3B2F7D9C76462387E274E2E992A0F170870371A011280689C19252102C3174E8A9E4DAE67950799B29EA5AE67AB37D7E782540F5CA7AD3127031DF69302B5C37C7E56';
wwv_flow_imp.g_varchar2_table(164) := 'CE1F7855DEFCC6EFC9B3BFF1BFCA13FFEC43F2C42F7E60C59BD637DDFCDA699F3FF88D7F286F7EF3F7BDB15EB35EDF7F7E0C3DE94F77FFCF3F0EE3A75ADFBCAA45D43E487F33D3D3B2FF07DF155DDB20F5A983802B022400AEAC34715A052E1CDE276FBF';
wwv_flow_imp.g_varchar2_table(165) := 'F29CCCCD053B83BCA3F86EB425F099FED6092CA9B0AAAD41F482394B3627E6A1CE5D77DB5763C2BA47413F21A06B10A4FFFCDC5C716DF5AB9683D4A74EF697367B00000E1C494441542D05183B2A011280A8A41927BE02853939B1F70539FECEBEC073D4';
wwv_flow_imp.g_varchar2_table(166) := 'B3D2F558BD1EB30FDCA88C8A1BBB9B44F70694D1B4A64D74CE3AF76A4E42ED750D56B5D6071EE6D881378B6B2DDE9A076E444504522A400290D28525AC600273B3D372F0A527E5FCA9E3811AE8796C7ABD7A3D2B3D5083102AE9896FEDDE218110BA8AA4';
wwv_flow_imp.g_varchar2_table(167) := '0B7D57AE738E64306F90F55D4DC5EF54D0B5F11E5AFFEA5AEB9ACFC5E85A0AD6493B548150A313200188CE9A916226A06787EB59E2572F5F0A34B35C36237A9D7ABD5E7DA0062155CA64BC717B9BA5ABB92EA41EABD78DCE51DF95673299EA0DB242CF7A';
wwv_flow_imp.g_varchar2_table(168) := 'B844D746D76885E2659B74CDDF7AEE7199991C5F56C606045C1120017065A5897391809E15AE6787EB59E28B0A7C1E34E4ECD7F4F7691ACAE64C2653FC64C0FACEC6E2D7E886D269889DE80BAF7E4E5FCFF80FB1DB92BA2AF513026323C3B29F4F089464';
wwv_flow_imp.g_varchar2_table(169) := '5CFDCA8C10A500094094DA8C150B81918BA7E5CD67BF2B7A76789009B5D467E5A6552DD66BFA07E9ABD23AFA4E77D7EA16E98ED1DE009DCBEED5AD155F03A1521B6D3FFF0981666FCDF4B1ED363535557C2EE873C256977204D226904D5B40C4838049E0';
wwv_flow_imp.g_varchar2_table(170) := 'E2D1FDF2D6CBCF4A21E049607A1D7A3DDB5CCF3A37F51B6599CE45BF3CE8F6B56DDE5E81A66232A0494A635DB6AA7B07F45DBE8ED1DA902B8EB9A5A749740E3A973A6F0F89C4E44F7DCE4BD8FA5A44CF450832257D2EE873422FB11CA43E75AA2740CFD1';
wwv_flow_imp.g_varchar2_table(171) := '0A900044EBCD683512D05FF227DF7C498EBDAD5F14136C127AA6BF5E875ECF360FD622DA5A3AAFAEE67AD117E09BBD77E0BBFB5BE5362F29B873A05DFC6EB619FAB5D3EDDAB78EA17B43744C1D5BE760EBB316E53A2F3D17A1AF35F827048EBEF5BAE873';
wwv_flow_imp.g_varchar2_table(172) := 'C4CB0E6B3165C6442072011280C8C919306A013DDBFBD04B4FCAB99347030DED1D6E97A8CFF40F34312A952CB0A1C44F08E873E4D0CB4F49213F5BF25834A85480F6510B9000442DCE78910AE859DE7AB6B79EF51D64E05C8DCEF40F3237EA9427A0E74D';
wwv_flow_imp.g_varchar2_table(173) := '6CED690E7C7864F0D205D1E7CCECD4447903D20A81840890002464A19866E90293C3578B6779EBD9DE415A3778C7B177F4358B9E4D1EA43E759223A0E703E8DAD67B6B1C64D6A3C343B2EFD9C7449F4341EA53A772017A885E8004207A73468C4060E8DC';
wwv_flow_imp.g_varchar2_table(174) := '0979E3D9C745CFF20E325C4B7D56F4D876737D2E4875EA245040D7B694EF10989A9C2C7E2FC4B0F75C4A60B84C1901AB00098095880A491228CCCDCAA9375F9403AF3E2F12F04CFFEBEF0E5B44CF1E4F52ACCCB574015D63FD5487AE7990D6B3B3B3F2B6';
wwv_flow_imp.g_varchar2_table(175) := 'F75C3AB5FF65EFE9C4790141CCCAAB43AB5A089000D4429D31431728CCE5E5CAA9C3B2F7C947E5ECC96381FBD733FDF56C713D6B3C70232A265A40D75AD7BC944F089C3D7E44DE7CE6DB3278EA909708E4131D3F9347605E8004605E829F8911C84F4FC9';
wwv_flow_imp.g_varchar2_table(176) := 'D4E8B08C0F5E90CB270ECA09EF1DFFDE27FF4A0EEF7D452627839FB8A557AE1BE86C4A4CDC4C345C01FD84807E5D71D05E27C6C6E4D0DE1F7A49E65F163F2E78C57BEEE973707A6C58F43919B41FEA2D17604B6D0448006AE3CEA801055E7CF44BB2F4F6';
wwv_flow_imp.g_varchar2_table(177) := 'CAE3DF90D79FFE96BCF9FC937264DFAB72DE7BC75FCA0BBF9EE9AF5F56D3D7DA107016544BABC0EAB606D1BD01D94CF0082727278B1F293DEC3DF7F439F8DA53DF127D4E2E7D9EEAE3E0BD521381E8054800A23767C41A0A70A67F0DF1633AB49E0FA0E7';
wwv_flow_imp.g_varchar2_table(178) := '05D407FC84404CC348F0B4987AAD0448006A25CFB8910BB435E638D33F72F5640CD8D29013FD84803E47923163668940E5022400951BD243CC05F4CA7EEB3A1AE5FABB3C9EF2315FAE9A4D6FFE13026B3B1A449F33359B886303136EED04F86D583B7B46';
wwv_flow_imp.g_varchar2_table(179) := 'F604EA4A39F8EAD52FF5AF7E798DBEB3EB6F6F28B5692AEB9BBC4D65A9C4F0096A4DFBF564519F3B3E5542D98C77288C745281000940057834AD5CA0A9BE3A4F41BDB0CFA6EE26D12FAFD10BC0543ED374F460F23695A523FAE051B47A8704F4B9A3DF09';
wwv_flow_imp.g_varchar2_table(180) := 'D15CA5E728DEBA1EDC6A29509DDFBEB58C88B11325D0DF16DE3B733DBBBFB7A55EB6F7358B7E3B5E8F773F5118114CD6E4BD26C4B58820944886E86DAD979DAB5B8BCF297D6EE9732CAC81F10E4B927ECA15200128578E76A108E819D8FA312C7DC715F4';
wwv_flow_imp.g_varchar2_table(181) := '97ABD66BC86544DF99B535E66475DBF5177DFDBADA8DDEBBFEF6C6BA50E696C64E967AEB6E6835D435686FC2CD6FCDF539A5CF2D7D8E6982A9CF3975D3E7A03E17F539E9D776E176BC176A88F0A8B6022400B5F567744F405F94F43AFCFACBF5CE8176B1';
wwv_flow_imp.g_varchar2_table(182) := 'DDB4DE9E356DC577663BFA5A442FE6A3BFA0BDAEF81B4060A1F7AD6BDB440D755B80A654F104F4B9A6CF3975D3BD03FA5CD4E7A4ED79ABE5787B80FC8D8D0009406C968289208000022E09106BAD0548006ABD028C8F0002082080400D0448006A80CE90';
wwv_flow_imp.g_varchar2_table(183) := '08208080EB02C45F7B011280DAAF01334000010410402072011280C8C91910010410705D80F8E3204002108755600E082080000208442C4002103138C321800002AE0B107F3C044800E2B10ECC020104104000814805480022E56630041040C07501E28F';
wwv_flow_imp.g_varchar2_table(184) := '8B0009405C56827920800002082010A100094084D80C85000208B82E40FCF111200188CF5A301304104000010422132001888C9A8110400001D705883F4E022400715A0DE682000208208040440224001141330C020820E0BA00F1C74B8004205EEBC16C';
wwv_flow_imp.g_varchar2_table(185) := '1040000104108844800420126606410001045C1720FEB8099000C46D45980F020820800002110890004480CC1008208080EB02C41F3F011280F8AD0933420001041040A0EA02240055276600041040C07501E28FA30009401C5785392180000208205065';
wwv_flow_imp.g_varchar2_table(186) := '0112802A03D33D020820E0BA00F1C7538004209EEBC2AC104000010410A8AA0009405579E91C010410705D80F8E32A400210D795615E08208000020854518004A08AB8748D000208B82E40FCF115200188EFDA3033041040000104AA26400250355A3A46';
wwv_flow_imp.g_varchar2_table(187) := '0001045C1720FE380B9000C47975981B02082080000255122001A8122CDD22800002AE0B107FBC054800E2BD3ECC0E010410400081AA0890005485954E11400001D705883FEE022400715F21E68700020820804015044800AA804A9708208080EB02C41F';
wwv_flow_imp.g_varchar2_table(188) := '7F011280F8AF11334400010410402074011280D049E910010410705D80F893204002908455628E082080000208842C4002103228DD21800002AE0B107F3204480092B14ECC120104104000815005480042E5A433041040C07501E24F8A00094052568A79';
wwv_flow_imp.g_varchar2_table(189) := '22800002082010A200094088987485000208B82E40FCC911200148CE5A315304104000010442132001088D928E10400001D705883F49022400495A2DE68A000208208040480224002141D20D020820E0BA00F1274B80042059EBC56C1140000104100845';
wwv_flow_imp.g_varchar2_table(190) := '80042014463A410001045C1720FEA4099000246DC5982F020820800002210890008480481708208080EB02C49F3C011280E4AD1933460001041040A0620112808A09E900010410705D80F89328400290C45563CE08208000020854284002502120CD1140';
wwv_flow_imp.g_varchar2_table(191) := '0001D705883F99022400C95C37668D0002082080404502240015F1D118010410705D80F8932A400290D49563DE0820800002085420400250011E4D11400001D705883FB9022400C95D3B668E000208208040D902240065D3D110010410705D80F8932C40';
wwv_flow_imp.g_varchar2_table(192) := '0290E4D563EE0820800002089429400250261CCD10400001D705883FD9022400C95E3F668F0002082080405902240065B1D108010410705D80F8932E400290F41564FE0820800002089421400250061A4D10400001D705883FF9022400C95F4322400001';
wwv_flow_imp.g_varchar2_table(193) := '041040A06401128092C96880000208B82E40FC6910200148C32A1203020820800002250A900094084675041040C07501E24F870009403AD6912810400001041028498004A0242E2A23800002AE0B107F5A044800D2B292C4810002082080400902240025';
wwv_flow_imp.g_varchar2_table(194) := '605115010410705D80F8D3234002909EB52412041040000104020B900004A6A222020820E0BA00F1A7498004204DAB492C0820800002080414200108084535041040C07501E24F97000940BAD69368104000010410082440021088894A08208080EB02C4';
wwv_flow_imp.g_varchar2_table(195) := '9F36011280B4AD28F1208000020820104080042000125510400001D705883F7D022400E95B5322420001041040C02A40026025A202020820E0BA00F1A7518004208DAB4A4C082080000208580448002C401423800002AE0B107F3A054800D2B9AE448500';
wwv_flow_imp.g_varchar2_table(196) := '0208208080518004C0C84321020820E0BA00F1A755800420AD2B4B5C082080000208180448000C381421800002AE0B107F7A054800D2BBB64486000208208080AF0009802F0D0508208080EB02C49F6601128034AF2EB1218000020820E0234002E003C3';
wwv_flow_imp.g_varchar2_table(197) := '66041040C07501E24FB7000940BAD797E8104000010410585180046045163622800002AE0B107FDA054800D2BEC2C4870002082080C00A0224002BA0B009010410705D80F8D32F400290FE352642041040000104960990002C236103020820E0BA00F1BB';
wwv_flow_imp.g_varchar2_table(198) := '204002E0C22A13230208208000024B0448009680F010010410705D80F8DD10200170639D8912010410400081450224008B387880000208B82E40FCAE089000B8B2D2C4890002082080C0020112800518DC450001045C17207E77044800DC596B22450001';
wwv_flow_imp.g_varchar2_table(199) := '041040E0860009C00D0AEE20800002AE0B10BF4B0224002EAD36B1228000020820F0AE0009C0BB10FC400001045C17207EB7044800DC5A6FA2450001041040A02840025064E01F041040C07501E2774D8004C0B515275E0410400001043C0112000F81BF';
wwv_flow_imp.g_varchar2_table(200) := '08208080EB02C4EF9E0009807B6B4EC40820800002080809004F02041040C07901005C1420017071D5891901041040C079011200E79F0200208080EB02C4EFA60009809BEB4ED408208000028E0B900038FE04207C0410705D80F85D1520017075E5891B';
wwv_flow_imp.g_varchar2_table(201) := '01041040C069011200A7979FE01140C07501E277578004C0DDB527720410400001870548001C5E7C42470001D70588DF6501120097579FD811400001049C1520017076E9091C01045C17207EB705FE2B000000FFFF581CAAA10000000649444154030055';
wwv_flow_imp.g_varchar2_table(202) := '2C085A388119980000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(35051579468105934)
,p_file_name=>'icons/app-icon-512.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/security/authorizations/administrator_or_customer_service_team_or_finance_reviewer_or_head_of_supply_chain_or_inventory_controller_or_procurement_team_or_quality_reviewer_or_transport_coordinator_or_warehouse_manager_or_warehouse_operative_or_warehouse_supervisor
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35048666245105913)
,p_name=>'Administrator or Customer Service Team or Finance Reviewer or Head of Supply Chain or Inventory Controller or Procurement Team or Quality Reviewer or Transport Coordinator or Warehouse Manager or Warehouse Operative or Warehouse Supervisor'
,p_static_id=>'administrator-or-customer-service-team-or-finance-reviewer-or-head-of-supply-chain-or-inventory-controller-or-procurement-team-or-quality-reviewer-or-transport-coordinator-or-warehouse-manager-or-warehouse-operative-or-warehouse-supervisor'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'name', 'Administrator,Customer Service Team,Finance Reviewer,Head of Supply Chain,Inventory Controller,Procurement Team,Quality Reviewer,Transport Coordinator,Warehouse Manager,Warehouse Operative,Warehouse Supervisor',
  'type', 'A')).to_clob
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/administrator_or_customer_service_team_or_head_of_supply_chain_or_inventory_controller_or_quality_reviewer_or_warehouse_manager_or_warehouse_operative_or_warehouse_supervisor
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35048790831105913)
,p_name=>'Administrator or Customer Service Team or Head of Supply Chain or Inventory Controller or Quality Reviewer or Warehouse Manager or Warehouse Operative or Warehouse Supervisor'
,p_static_id=>'administrator-or-customer-service-team-or-head-of-supply-chain-or-inventory-controller-or-quality-reviewer-or-warehouse-manager-or-warehouse-operative-or-warehouse-supervisor'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'name', 'Administrator,Customer Service Team,Head of Supply Chain,Inventory Controller,Quality Reviewer,Warehouse Manager,Warehouse Operative,Warehouse Supervisor',
  'type', 'A')).to_clob
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/administrator_or_customer_service_team_or_head_of_supply_chain_or_inventory_controller_or_quality_reviewer_or_warehouse_manager_or_warehouse_supervisor
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35048827808105913)
,p_name=>'Administrator or Customer Service Team or Head of Supply Chain or Inventory Controller or Quality Reviewer or Warehouse Manager or Warehouse Supervisor'
,p_static_id=>'administrator-or-customer-service-team-or-head-of-supply-chain-or-inventory-controller-or-quality-reviewer-or-warehouse-manager-or-warehouse-supervisor'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'name', 'Administrator,Customer Service Team,Head of Supply Chain,Inventory Controller,Quality Reviewer,Warehouse Manager,Warehouse Supervisor',
  'type', 'A')).to_clob
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/administrator_or_customer_service_team_or_head_of_supply_chain_or_procurement_team_or_warehouse_manager
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35048939963105913)
,p_name=>'Administrator or Customer Service Team or Head of Supply Chain or Procurement Team or Warehouse Manager'
,p_static_id=>'administrator-or-customer-service-team-or-head-of-supply-chain-or-procurement-team-or-warehouse-manager'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'name', 'Administrator,Customer Service Team,Head of Supply Chain,Procurement Team,Warehouse Manager',
  'type', 'A')).to_clob
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/administrator_or_customer_service_team_or_head_of_supply_chain_or_transport_coordinator_or_warehouse_manager_or_warehouse_operative_or_warehouse_supervisor
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35049064416105914)
,p_name=>'Administrator or Customer Service Team or Head of Supply Chain or Transport Coordinator or Warehouse Manager or Warehouse Operative or Warehouse Supervisor'
,p_static_id=>'administrator-or-customer-service-team-or-head-of-supply-chain-or-transport-coordinator-or-warehouse-manager-or-warehouse-operative-or-warehouse-supervisor'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'name', 'Administrator,Customer Service Team,Head of Supply Chain,Transport Coordinator,Warehouse Manager,Warehouse Operative,Warehouse Supervisor',
  'type', 'A')).to_clob
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/administrator_or_finance_reviewer_or_head_of_supply_chain_or_inventory_controller_or_procurement_team_or_quality_reviewer_or_transport_coordinator_or_warehouse_manager
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35049188188105914)
,p_name=>'Administrator or Finance Reviewer or Head of Supply Chain or Inventory Controller or Procurement Team or Quality Reviewer or Transport Coordinator or Warehouse Manager'
,p_static_id=>'administrator-or-finance-reviewer-or-head-of-supply-chain-or-inventory-controller-or-procurement-team-or-quality-reviewer-or-transport-coordinator-or-warehouse-manager'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'name', 'Administrator,Finance Reviewer,Head of Supply Chain,Inventory Controller,Procurement Team,Quality Reviewer,Transport Coordinator,Warehouse Manager',
  'type', 'A')).to_clob
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/administrator_or_finance_reviewer_or_head_of_supply_chain_or_inventory_controller_or_quality_reviewer_or_warehouse_manager
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35049260646105914)
,p_name=>'Administrator or Finance Reviewer or Head of Supply Chain or Inventory Controller or Quality Reviewer or Warehouse Manager'
,p_static_id=>'administrator-or-finance-reviewer-or-head-of-supply-chain-or-inventory-controller-or-quality-reviewer-or-warehouse-manager'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'name', 'Administrator,Finance Reviewer,Head of Supply Chain,Inventory Controller,Quality Reviewer,Warehouse Manager',
  'type', 'A')).to_clob
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/administrator_or_finance_reviewer_or_head_of_supply_chain_or_inventory_controller_or_quality_reviewer_or_warehouse_manager_or_warehouse_supervisor
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35049306859105914)
,p_name=>'Administrator or Finance Reviewer or Head of Supply Chain or Inventory Controller or Quality Reviewer or Warehouse Manager or Warehouse Supervisor'
,p_static_id=>'administrator-or-finance-reviewer-or-head-of-supply-chain-or-inventory-controller-or-quality-reviewer-or-warehouse-manager-or-warehouse-supervisor'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'name', 'Administrator,Finance Reviewer,Head of Supply Chain,Inventory Controller,Quality Reviewer,Warehouse Manager,Warehouse Supervisor',
  'type', 'A')).to_clob
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/administrator_or_head_of_supply_chain
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35049422323105914)
,p_name=>'Administrator or Head of Supply Chain'
,p_static_id=>'administrator-or-head-of-supply-chain'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'name', 'Administrator,Head of Supply Chain',
  'type', 'A')).to_clob
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/administrator_or_head_of_supply_chain_or_inventory_controller_or_procurement_team_or_quality_reviewer_or_warehouse_manager_or_warehouse_operative_or_warehouse_supervisor
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35049553730105914)
,p_name=>'Administrator or Head of Supply Chain or Inventory Controller or Procurement Team or Quality Reviewer or Warehouse Manager or Warehouse Operative or Warehouse Supervisor'
,p_static_id=>'administrator-or-head-of-supply-chain-or-inventory-controller-or-procurement-team-or-quality-reviewer-or-warehouse-manager-or-warehouse-operative-or-warehouse-supervisor'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'name', 'Administrator,Head of Supply Chain,Inventory Controller,Procurement Team,Quality Reviewer,Warehouse Manager,Warehouse Operative,Warehouse Supervisor',
  'type', 'A')).to_clob
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/administrator_or_head_of_supply_chain_or_inventory_controller_or_procurement_team_or_warehouse_manager
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35049639390105914)
,p_name=>'Administrator or Head of Supply Chain or Inventory Controller or Procurement Team or Warehouse Manager'
,p_static_id=>'administrator-or-head-of-supply-chain-or-inventory-controller-or-procurement-team-or-warehouse-manager'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'name', 'Administrator,Head of Supply Chain,Inventory Controller,Procurement Team,Warehouse Manager',
  'type', 'A')).to_clob
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/administrator_or_head_of_supply_chain_or_inventory_controller_or_procurement_team_or_warehouse_manager_or_warehouse_supervisor
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35049737050105914)
,p_name=>'Administrator or Head of Supply Chain or Inventory Controller or Procurement Team or Warehouse Manager or Warehouse Supervisor'
,p_static_id=>'administrator-or-head-of-supply-chain-or-inventory-controller-or-procurement-team-or-warehouse-manager-or-warehouse-supervisor'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'name', 'Administrator,Head of Supply Chain,Inventory Controller,Procurement Team,Warehouse Manager,Warehouse Supervisor',
  'type', 'A')).to_clob
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/administrator_or_head_of_supply_chain_or_inventory_controller_or_quality_reviewer_or_warehouse_manager
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35049893362105914)
,p_name=>'Administrator or Head of Supply Chain or Inventory Controller or Quality Reviewer or Warehouse Manager'
,p_static_id=>'administrator-or-head-of-supply-chain-or-inventory-controller-or-quality-reviewer-or-warehouse-manager'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'name', 'Administrator,Head of Supply Chain,Inventory Controller,Quality Reviewer,Warehouse Manager',
  'type', 'A')).to_clob
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/administrator_or_head_of_supply_chain_or_inventory_controller_or_warehouse_manager_or_warehouse_operative_or_warehouse_supervisor
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35049936342105914)
,p_name=>'Administrator or Head of Supply Chain or Inventory Controller or Warehouse Manager or Warehouse Operative or Warehouse Supervisor'
,p_static_id=>'administrator-or-head-of-supply-chain-or-inventory-controller-or-warehouse-manager-or-warehouse-operative-or-warehouse-supervisor'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'name', 'Administrator,Head of Supply Chain,Inventory Controller,Warehouse Manager,Warehouse Operative,Warehouse Supervisor',
  'type', 'A')).to_clob
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/app_access_control/administrator
begin
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(35050075668105914)
,p_static_id=>'administrator'
,p_name=>'Administrator'
,p_description=>'Maintains controlled lists, master data, access rules, and configuration settings.'
);
end;
/
prompt --application/shared_components/security/app_access_control/customer_service_team
begin
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(35050148440105914)
,p_static_id=>'customer-service-team'
,p_name=>'Customer Service Team'
,p_description=>'Reviews availability, fulfilment status, dispatch timing, and return outcomes.'
);
end;
/
prompt --application/shared_components/security/app_access_control/finance_reviewer
begin
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(35050245283105914)
,p_static_id=>'finance-reviewer'
,p_name=>'Finance Reviewer'
,p_description=>'Reviews write-offs, major stock adjustments, and financially material losses.'
);
end;
/
prompt --application/shared_components/security/app_access_control/head_of_supply_chain
begin
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(35050398818105914)
,p_static_id=>'head-of-supply-chain'
,p_name=>'Head of Supply Chain'
,p_description=>'Reviews company-wide stock position, warehouse performance, service risk, and exception trends.'
);
end;
/
prompt --application/shared_components/security/app_access_control/inventory_controller
begin
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(35050482576105914)
,p_static_id=>'inventory-controller'
,p_name=>'Inventory Controller'
,p_description=>'Manages stock accuracy, variances, counts, transfers, and approved stock corrections.'
);
end;
/
prompt --application/shared_components/security/app_access_control/procurement_team
begin
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(35050518206105914)
,p_static_id=>'procurement-team'
,p_name=>'Procurement Team'
,p_description=>'Monitors expected receipts, supplier issues, and replenishment signals.'
);
end;
/
prompt --application/shared_components/security/app_access_control/quality_reviewer
begin
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(35050629501105914)
,p_static_id=>'quality-reviewer'
,p_name=>'Quality Reviewer'
,p_description=>'Reviews damaged, returned, suspect, and quarantined goods and records disposition outcomes.'
);
end;
/
prompt --application/shared_components/security/app_access_control/transport_coordinator
begin
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(35050784484105915)
,p_static_id=>'transport-coordinator'
,p_name=>'Transport Coordinator'
,p_description=>'Tracks shipment readiness, dispatch timing, and outbound volume.'
);
end;
/
prompt --application/shared_components/security/app_access_control/warehouse_manager
begin
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(35050831834105915)
,p_static_id=>'warehouse-manager'
,p_name=>'Warehouse Manager'
,p_description=>'Oversees inbound, storage, outbound, and approval-controlled warehouse work.'
);
end;
/
prompt --application/shared_components/security/app_access_control/warehouse_operative
begin
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(35050944408105915)
,p_static_id=>'warehouse-operative'
,p_name=>'Warehouse Operative'
,p_description=>'Executes receiving, putaway, replenishment, picking, packing, and count work.'
);
end;
/
prompt --application/shared_components/security/app_access_control/warehouse_supervisor
begin
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(35051040366105915)
,p_static_id=>'warehouse-supervisor'
,p_name=>'Warehouse Supervisor'
,p_description=>'Coordinates warehouse tasks, receiving, dispatch progress, and routine operational issues.'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs/application_user_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35055610033105936)
,p_lov_name=>'APPLICATION_USER_LOV'
,p_static_id=>'application-user-lov'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SCM_APPLICATION_USERS'
,p_return_column_name=>'APPLICATION_USER_ID'
,p_display_column_name=>'FULL_NAME'
);
end;
/
prompt --application/shared_components/user_interface/lovs/approval_policy_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35055731652105936)
,p_lov_name=>'APPROVAL_POLICY_LOV'
,p_static_id=>'approval-policy-lov'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SCM_APPROVAL_POLICIES'
,p_return_column_name=>'APPROVAL_POLICY_ID'
,p_display_column_name=>'POLICY_NAME'
);
end;
/
prompt --application/shared_components/user_interface/lovs/business_list_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35055853417105936)
,p_lov_name=>'BUSINESS_LIST_LOV'
,p_static_id=>'business-list-lov'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SCM_BUSINESS_LISTS'
,p_return_column_name=>'BUSINESS_LIST_ID'
,p_display_column_name=>'LIST_NAME'
);
end;
/
prompt --application/shared_components/user_interface/lovs/inbound_receipt_line_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35055944998105936)
,p_lov_name=>'INBOUND_RECEIPT_LINE_LOV'
,p_static_id=>'inbound-receipt-line-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ir.receipt_number || '' / Line '' || to_char(irl.line_number) as display_value',
'     , irl.inbound_receipt_line_id as return_value',
'from scm_inbound_receipt_lines irl',
'join scm_inbound_receipts ir',
'    on ir.inbound_receipt_id = irl.inbound_receipt_id',
'order by ir.receipt_number, irl.line_number'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
);
end;
/
prompt --application/shared_components/user_interface/lovs/inventory_lot_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35056072878105936)
,p_lov_name=>'INVENTORY_LOT_LOV'
,p_static_id=>'inventory-lot-lov'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SCM_INVENTORY_LOTS'
,p_return_column_name=>'INVENTORY_LOT_ID'
,p_display_column_name=>'LOT_NUMBER'
);
end;
/
prompt --application/shared_components/user_interface/lovs/item_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35056137093105936)
,p_lov_name=>'ITEM_LOV'
,p_static_id=>'item-lov'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SCM_ITEMS'
,p_return_column_name=>'ITEM_ID'
,p_display_column_name=>'ITEM_NAME'
);
end;
/
prompt --application/shared_components/user_interface/lovs/outbound_order_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35056253322105936)
,p_lov_name=>'OUTBOUND_ORDER_LOV'
,p_static_id=>'outbound-order-lov'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SCM_OUTBOUND_ORDERS'
,p_return_column_name=>'OUTBOUND_ORDER_ID'
,p_display_column_name=>'OUTBOUND_ORDER_NUMBER'
);
end;
/
prompt --application/shared_components/user_interface/lovs/partner_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35056358596105936)
,p_lov_name=>'PARTNER_LOV'
,p_static_id=>'partner-lov'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SCM_BUSINESS_PARTNERS'
,p_return_column_name=>'BUSINESS_PARTNER_ID'
,p_display_column_name=>'PARTNER_NAME'
);
end;
/
prompt --application/shared_components/user_interface/lovs/partner_site_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35056460459105936)
,p_lov_name=>'PARTNER_SITE_LOV'
,p_static_id=>'partner-site-lov'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SCM_PARTNER_SITES'
,p_return_column_name=>'PARTNER_SITE_ID'
,p_display_column_name=>'SITE_NAME'
);
end;
/
prompt --application/shared_components/user_interface/lovs/stock_status_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35056506988105936)
,p_lov_name=>'STOCK_STATUS_LOV'
,p_static_id=>'stock-status-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct ib.stock_status_code as display_value',
'     , ib.stock_status_code as return_value',
'from scm_inventory_balances ib',
'order by 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
);
end;
/
prompt --application/shared_components/user_interface/lovs/storage_location_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35056617134105936)
,p_lov_name=>'STORAGE_LOCATION_LOV'
,p_static_id=>'storage-location-lov'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SCM_STORAGE_LOCATIONS'
,p_return_column_name=>'STORAGE_LOCATION_ID'
,p_display_column_name=>'LOCATION_CODE'
);
end;
/
prompt --application/shared_components/user_interface/lovs/task_priority_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35056715530105936)
,p_lov_name=>'TASK_PRIORITY_LOV'
,p_static_id=>'task-priority-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct ot.priority_code as display_value',
'     , ot.priority_code as return_value',
'from scm_operational_tasks ot',
'order by 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
);
end;
/
prompt --application/shared_components/user_interface/lovs/task_status_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35056858066105936)
,p_lov_name=>'TASK_STATUS_LOV'
,p_static_id=>'task-status-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct ot.task_status_code as display_value',
'     , ot.task_status_code as return_value',
'from scm_operational_tasks ot',
'order by 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
);
end;
/
prompt --application/shared_components/user_interface/lovs/transaction_type_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35056908184105936)
,p_lov_name=>'TRANSACTION_TYPE_LOV'
,p_static_id=>'transaction-type-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct itx.transaction_type_code as display_value',
'     , itx.transaction_type_code as return_value',
'from scm_inventory_transactions itx',
'order by 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
);
end;
/
prompt --application/shared_components/user_interface/lovs/user_role_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35057044722105936)
,p_lov_name=>'USER_ROLE_LOV'
,p_static_id=>'user-role-lov'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SCM_USER_ROLES'
,p_return_column_name=>'USER_ROLE_ID'
,p_display_column_name=>'ROLE_NAME'
);
end;
/
prompt --application/shared_components/user_interface/lovs/warehouse_area_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35057198167105936)
,p_lov_name=>'WAREHOUSE_AREA_LOV'
,p_static_id=>'warehouse-area-lov'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SCM_WAREHOUSE_AREAS'
,p_return_column_name=>'WAREHOUSE_AREA_ID'
,p_display_column_name=>'AREA_NAME'
);
end;
/
prompt --application/shared_components/user_interface/lovs/warehouse_lov
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(35057243526105936)
,p_lov_name=>'WAREHOUSE_LOV'
,p_static_id=>'warehouse-lov'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SCM_WAREHOUSES'
,p_return_column_name=>'WAREHOUSE_ID'
,p_display_column_name=>'WAREHOUSE_NAME'
);
end;
/
prompt --application/pages/page_groups
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/scm_breadcrumb
begin
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(35051607112105935)
,p_name=>'SCM Breadcrumb'
,p_static_id=>'scm-breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35051770387105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>140
,p_short_name=>'Approval and Exception Control'
,p_static_id=>'approval-and-exception-control'
,p_link=>'f?p=&APP_ID.:14:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>14
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35051942817105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>120
,p_short_name=>'Business Partners'
,p_static_id=>'business-partners'
,p_link=>'f?p=&APP_ID.:12:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>12
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35052027891105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>150
,p_short_name=>'Controlled Lists'
,p_static_id=>'controlled-lists'
,p_link=>'f?p=&APP_ID.:15:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>15
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35052139328105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>80
,p_short_name=>'Count and Adjustment Control'
,p_static_id=>'count-and-adjustment-control'
,p_link=>'f?p=&APP_ID.:8:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>8
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35052268509105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>160
,p_short_name=>'Inventory History'
,p_static_id=>'inventory-history'
,p_link=>'f?p=&APP_ID.:16:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>16
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35052372406105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>20
,p_short_name=>'Inventory Visibility'
,p_static_id=>'inventory-visibility'
,p_link=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35052405562105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>110
,p_short_name=>'Item Master'
,p_static_id=>'item-master'
,p_link=>'f?p=&APP_ID.:11:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35052521674105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>170
,p_short_name=>'Lot and Serial Traceability'
,p_static_id=>'lot-and-serial-traceability'
,p_link=>'f?p=&APP_ID.:17:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>17
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35051850926105935)
,p_short_name=>'Operational Dashboard'
,p_static_id=>'operational-dashboard'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35052693082105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>60
,p_short_name=>'Outbound Fulfilment'
,p_static_id=>'outbound-fulfilment'
,p_link=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35052798955105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>180
,p_short_name=>'Performance and Trends'
,p_static_id=>'performance-and-trends'
,p_link=>'f?p=&APP_ID.:18:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35052874656105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>30
,p_short_name=>'Receipt Workspace'
,p_static_id=>'receipt-workspace'
,p_link=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35052957866105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>90
,p_short_name=>'Replenishment Control'
,p_static_id=>'replenishment-control'
,p_link=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35053102464105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>70
,p_short_name=>'Returns Workspace'
,p_static_id=>'returns-workspace'
,p_link=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35053136744105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>130
,p_short_name=>'Security and Access'
,p_static_id=>'security-and-access'
,p_link=>'f?p=&APP_ID.:13:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>13
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35053253782105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>40
,p_short_name=>'Task Queue'
,p_static_id=>'task-queue'
,p_link=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>4
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35053334943105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>50
,p_short_name=>'Transfer Workspace'
,p_static_id=>'transfer-workspace'
,p_link=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35053449651105935)
,p_parent_id=>wwv_flow_imp.id(35051850926105935)
,p_option_sequence=>100
,p_short_name=>'Warehouse Structure'
,p_static_id=>'warehouse-structure'
,p_link=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>10
);
end;
/
prompt --application/shared_components/navigation/breadcrumbentry
begin
null;
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(35048410152105913)
,p_theme_id=>42
,p_static_id=>'universal-theme'
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'26.1'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_current_theme_style_id=>2243014446517417
,p_default_page_template=>4073832297226169690
,p_default_dialog_template=>2101883943284197310
,p_error_template=>2102634289808461002
,p_printer_friendly_template=>4073832297226169690
,p_login_template=>2102634289808461002
,p_default_button_template=>4073839297780169708
,p_default_region_template=>4073835273271169698
,p_default_chart_template=>4073835273271169698
,p_default_form_template=>4073835273271169698
,p_default_reportr_template=>4073835273271169698
,p_default_wizard_template=>4073835273271169698
,p_default_menur_template=>2532939663579242476
,p_default_listr_template=>4073835273271169698
,p_default_irr_template=>2102002977963900996
,p_default_report_template=>2540130677583398057
,p_default_label_template=>1610598304472262251
,p_default_menu_template=>4073839682315169711
,p_default_list_template=>4073837480889169704
,p_default_top_nav_list_temp=>2528231041045349458
,p_default_side_nav_list_temp=>2469215554099805162
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>2127905476394690047
,p_default_dialogr_template=>4502917002193490937
,p_default_option_label=>1610598304472262251
,p_default_required_label=>1610598484065263269
,p_default_navbar_list_template=>2849019392706229583
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/26.1/')
,p_files_version=>2461145065526
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
,p_reference_id=>wwv_imp_util.get_subscription_id(4073840274158169736,2000,'universal-theme',8842.261)
,p_version_scn_master=>'SH256:WOPVC8vP1TPWUxczh2dJ4mCZcNGSTzA1cn8DjR2oQjY'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/translations
begin
null;
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(35048507174105913)
,p_build_option_name=>'Commented Out'
,p_static_id=>'commented-out'
,p_build_option_status=>'EXCLUDE'
);
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/security/authentications/oracle_apex_accounts
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(35046732483105911)
,p_name=>'Oracle APEX Accounts'
,p_static_id=>'oracle-apex-accounts'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_created_on=>wwv_flow_imp.dz('20260414065526Z')
,p_updated_on=>wwv_flow_imp.dz('20260414065526Z')
,p_created_by=>'SCM'
,p_updated_by=>'SCM'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Operational Dashboard'
,p_alias=>'OPERATIONAL-DASHBOARD'
,p_step_title=>'Operational Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35048666245105913)
,p_protection_level=>'C'
,p_page_comment=>'Warehouse leaders and cross-functional reviewers use this landing page to understand current stock volume, pending receipts, and dispatch workload before moving into operational workspaces.'
,p_page_component_map=>'13'
,p_last_updated_on=>wwv_flow_imp.dz('20260415100603Z')
,p_last_updated_by=>'SAMANAVA'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35087707872106104)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35087817813106104)
,p_plug_name=>'Inventory by Status'
,p_static_id=>'inventory-by-status'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_comment=>'Visualizes how total stock is distributed across stock statuses so blocked, quarantined, and available volume stays visible.'
,p_updated_on=>wwv_flow_imp.dz('20260415100603Z')
,p_updated_by=>'SAMANAVA'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(35087943406106104)
,p_region_id=>wwv_flow_imp.id(35087817813106104)
,p_chart_type=>'bar'
,p_title=>'Inventory by Status'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(35088063145106105)
,p_chart_id=>wwv_flow_imp.id(35087943406106104)
,p_static_id=>'inventory-by-status'
,p_seq=>10
,p_name=>'Inventory by Status'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ib.stock_status_code as stock_status_code',
'     , sum(ib.quantity_on_hand) as total_quantity',
'from scm_inventory_balances ib',
'group by ib.stock_status_code',
'order by ib.stock_status_code'))
,p_series_type=>'bar'
,p_items_value_column_name=>'TOTAL_QUANTITY'
,p_items_label_column_name=>'STOCK_STATUS_CODE'
,p_line_type=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35088127912106105)
,p_chart_id=>wwv_flow_imp.id(35087943406106104)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35088267120106105)
,p_chart_id=>wwv_flow_imp.id(35087943406106104)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35088370401106105)
,p_plug_name=>'name: Orders Awaiting Dispatch'
,p_static_id=>'orders-awaiting-dispatch'
,p_region_template_options=>'#DEFAULT#:margin-top-md:margin-bottom-md'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) as open_order_count',
'from scm_outbound_orders oo',
'where oo.dispatched_at is null'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$METRIC_CARD'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'AVATAR_ALIGNMENT', 't-MetricCard-body--avatarAlignmentStart',
  'AVATAR_ICON', 'fa-shopping-cart',
  'AVATAR_POSITION', 't-MetricCard-body--avatarPositionInline',
  'AVATAR_SHAPE', 't-Avatar--rounded',
  'AVATAR_SIZE', 't-Avatar--md',
  'AVATAR_STYLE', 't-MetricCard-avatar--subtle',
  'AVATAR_TYPE', 'icon',
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'N',
  'LAYOUT', 'stacked',
  'META', 'Dispatch not confirmed',
  'METRIC', '&OPEN_ORDER_COUNT.',
  'METRIC_CSS_CLASSES', 'u-text-subheading-md',
  'TITLE', 'Orders Awaiting Dispatch')).to_clob
,p_plug_comment=>'Counts outbound orders without a dispatch confirmation so transport and warehouse teams can see current outbound pressure.'
,p_updated_on=>wwv_flow_imp.dz('20260415100603Z')
,p_updated_by=>'SAMANAVA'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35088449856106105)
,p_name=>'OPEN_ORDER_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPEN_ORDER_COUNT'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_format_mask=>'999G999G999G999G990'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35088569854106105)
,p_plug_name=>'Outbound Status Mix'
,p_static_id=>'outbound-status-mix'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_comment=>'Shows how outbound orders are distributed across outbound statuses so the team can see where fulfilment is slowing down.'
,p_updated_on=>wwv_flow_imp.dz('20260415100603Z')
,p_updated_by=>'SAMANAVA'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(35088691625106105)
,p_region_id=>wwv_flow_imp.id(35088569854106105)
,p_chart_type=>'donut'
,p_title=>'Outbound Status Mix'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(35088771160106105)
,p_chart_id=>wwv_flow_imp.id(35088691625106105)
,p_static_id=>'outbound-status-mix'
,p_seq=>10
,p_name=>'Outbound Status Mix'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select oo.outbound_status_code as outbound_status_code',
'     , count(*) as order_count',
'from scm_outbound_orders oo',
'group by oo.outbound_status_code',
'order by oo.outbound_status_code'))
,p_series_type=>'donut'
,p_items_value_column_name=>'ORDER_COUNT'
,p_items_label_column_name=>'OUTBOUND_STATUS_CODE'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35088873101106105)
,p_plug_name=>'name: Receipts Awaiting Completion'
,p_static_id=>'receipts-awaiting-completion'
,p_region_template_options=>'#DEFAULT#:margin-top-md:margin-bottom-md'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) as open_receipt_count',
'from scm_inbound_receipts ir',
'where ir.receiving_completed_at is null'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$METRIC_CARD'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'AVATAR_ALIGNMENT', 't-MetricCard-body--avatarAlignmentStart',
  'AVATAR_ICON', 'fa-receipt',
  'AVATAR_POSITION', 't-MetricCard-body--avatarPositionInline',
  'AVATAR_SHAPE', 't-Avatar--rounded',
  'AVATAR_SIZE', 't-Avatar--md',
  'AVATAR_STYLE', 't-MetricCard-avatar--subtle',
  'AVATAR_TYPE', 'icon',
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'N',
  'LAYOUT', 'stacked',
  'META', 'Receiving not complete',
  'METRIC', '&OPEN_RECEIPT_COUNT.',
  'METRIC_CSS_CLASSES', 'u-text-subheading-md',
  'TITLE', 'Receipts Awaiting Completion')).to_clob
,p_plug_comment=>'Highlights inbound receipts that have not yet reached receiving completion so supervisors can focus on open inbound work.'
,p_updated_on=>wwv_flow_imp.dz('20260415100603Z')
,p_updated_by=>'SAMANAVA'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35089003134106105)
,p_name=>'OPEN_RECEIPT_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPEN_RECEIPT_COUNT'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_format_mask=>'999G999G999G999G990'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35089099243106105)
,p_plug_name=>'name: Reserved Stock'
,p_static_id=>'reserved-stock'
,p_region_template_options=>'#DEFAULT#:margin-top-md:margin-bottom-md'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(sum(ib.quantity_reserved), 0) as reserved_quantity',
'from scm_inventory_balances ib'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$METRIC_CARD'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'AVATAR_ALIGNMENT', 't-MetricCard-body--avatarAlignmentStart',
  'AVATAR_ICON', 'fa-lock',
  'AVATAR_POSITION', 't-MetricCard-body--avatarPositionInline',
  'AVATAR_SHAPE', 't-Avatar--rounded',
  'AVATAR_SIZE', 't-Avatar--md',
  'AVATAR_STYLE', 't-MetricCard-avatar--subtle',
  'AVATAR_TYPE', 'icon',
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'N',
  'LAYOUT', 'stacked',
  'META', 'Reserved against demand',
  'METRIC', '&RESERVED_QUANTITY.',
  'METRIC_CSS_CLASSES', 'u-text-subheading-md',
  'TITLE', 'Reserved Stock')).to_clob
,p_plug_comment=>'Shows how much stock is already committed to demand so warehouse planners can separate free stock from reserved stock.'
,p_updated_on=>wwv_flow_imp.dz('20260415100603Z')
,p_updated_by=>'SAMANAVA'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35089111709106105)
,p_name=>'RESERVED_QUANTITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RESERVED_QUANTITY'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_format_mask=>'FM999G999G999G990D0000'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35089300555106105)
,p_plug_name=>'name: Total Stock On Hand'
,p_static_id=>'total-stock-on-hand'
,p_region_template_options=>'#DEFAULT#:margin-top-md:margin-bottom-md'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(sum(ib.quantity_on_hand), 0) as total_quantity',
'from scm_inventory_balances ib'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$METRIC_CARD'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'AVATAR_ALIGNMENT', 't-MetricCard-body--avatarAlignmentStart',
  'AVATAR_ICON', 'fa-cubes',
  'AVATAR_POSITION', 't-MetricCard-body--avatarPositionInline',
  'AVATAR_SHAPE', 't-Avatar--rounded',
  'AVATAR_SIZE', 't-Avatar--md',
  'AVATAR_STYLE', 't-MetricCard-avatar--subtle',
  'AVATAR_TYPE', 'icon',
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'N',
  'LAYOUT', 'stacked',
  'META', 'Across all warehouses',
  'METRIC', '&TOTAL_QUANTITY.',
  'METRIC_CSS_CLASSES', 'u-text-subheading-md',
  'TITLE', 'Total Stock On Hand')).to_clob
,p_plug_comment=>'Summarizes the total quantity physically held across all recorded inventory balances for fast stock-position review.'
,p_updated_on=>wwv_flow_imp.dz('20260415100603Z')
,p_updated_by=>'SAMANAVA'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35089375546106106)
,p_name=>'TOTAL_QUANTITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL_QUANTITY'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_format_mask=>'FM999G999G999G990D0000'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12800176361337201)
,p_button_sequence=>10
,p_button_name=>'Ask_AI'
,p_static_id=>'ask-ai_1'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Ask Ai'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_created_on=>wwv_flow_imp.dz('20260415100603Z')
,p_updated_on=>wwv_flow_imp.dz('20260415100603Z')
,p_created_by=>'SAMANAVA'
,p_updated_by=>'SAMANAVA'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(12800224413337202)
,p_button_id=>wwv_flow_imp.id(12800176361337201)
,p_action_sequence=>10
,p_action=>'NATIVE_OPEN_AI_ASSISTANT'
,p_static_id=>'native-open-ai-assistant'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'DIALOG')).to_clob
,p_ai_agent_id=>wwv_flow_imp.id(12000270967456428)
,p_created_on=>wwv_flow_imp.dz('20260415100603Z')
,p_updated_on=>wwv_flow_imp.dz('20260415100603Z')
,p_created_by=>'SAMANAVA'
,p_updated_by=>'SAMANAVA'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_imp_page.create_page(
 p_id=>2
,p_name=>'Inventory Visibility'
,p_alias=>'INVENTORY-VISIBILITY'
,p_step_title=>'Inventory Visibility'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2528119710305719084
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35048666245105913)
,p_protection_level=>'C'
,p_page_comment=>'Warehouse leaders, controllers, and service teams use this page to inspect live stock holdings without leaving the shared inventory workspace.'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35154579921106413)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35154642564106413)
,p_plug_name=>'Button Bar'
,p_static_id=>'button-bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div id="active_facets"></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35154792901106413)
,p_name=>'Inventory Balance Report'
,p_static_id=>'inventory-balance-report'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ib.inventory_balance_id as inventory_balance_id',
'     , wh.warehouse_id as warehouse_id',
'     , wh.warehouse_name as warehouse_name',
'     , sl.location_code as location_code',
'     , it.item_code as item_code',
'     , it.item_name as item_name',
'     , il.lot_number as lot_number',
'     , bp.partner_name as owner_partner_name',
'     , ib.stock_status_code as stock_status_code',
'     , ib.quantity_on_hand as quantity_on_hand',
'     , ib.quantity_reserved as quantity_reserved',
'     , ib.quantity_on_hand - ib.quantity_reserved as quantity_available',
'     , ib.last_counted_at as last_counted_at',
'     , ib.last_moved_at as last_moved_at',
'from scm_inventory_balances ib',
'join scm_storage_locations sl',
'    on sl.storage_location_id = ib.storage_location_id',
'join scm_warehouses wh',
'    on wh.warehouse_id = sl.warehouse_id',
'join scm_items it',
'    on it.item_id = ib.item_id',
'left join scm_inventory_lots il',
'    on il.inventory_lot_id = ib.inventory_lot_id',
'left join scm_business_partners bp',
'    on bp.business_partner_id = ib.owner_partner_id',
'order by wh.warehouse_name, sl.location_code, it.item_code'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays current stock by warehouse, location, lot, and owner context so users can review quantity, availability, reservation, and recent movement timing together, with reserved quantity kept within on-hand quantity for valid balance states.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35154840076106413)
,p_query_column_id=>1
,p_column_alias=>'INVENTORY_BALANCE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35154965715106413)
,p_query_column_id=>5
,p_column_alias=>'ITEM_CODE'
,p_column_display_sequence=>50
,p_column_heading=>'Item Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35155065462106413)
,p_query_column_id=>6
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>60
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35155186154106413)
,p_query_column_id=>13
,p_column_alias=>'LAST_COUNTED_AT'
,p_column_display_sequence=>130
,p_column_heading=>'Last Counted At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35155278457106413)
,p_query_column_id=>14
,p_column_alias=>'LAST_MOVED_AT'
,p_column_display_sequence=>140
,p_column_heading=>'Last Moved At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35155304436106413)
,p_query_column_id=>4
,p_column_alias=>'LOCATION_CODE'
,p_column_display_sequence=>40
,p_column_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35155493683106413)
,p_query_column_id=>7
,p_column_alias=>'LOT_NUMBER'
,p_column_display_sequence=>70
,p_column_heading=>'Lot Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35155561014106413)
,p_query_column_id=>8
,p_column_alias=>'OWNER_PARTNER_NAME'
,p_column_display_sequence=>80
,p_column_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35155639147106413)
,p_query_column_id=>12
,p_column_alias=>'QUANTITY_AVAILABLE'
,p_column_display_sequence=>120
,p_column_heading=>'Quantity Available'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35155778870106414)
,p_query_column_id=>10
,p_column_alias=>'QUANTITY_ON_HAND'
,p_column_display_sequence=>100
,p_column_heading=>'Quantity On Hand'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35155882201106414)
,p_query_column_id=>11
,p_column_alias=>'QUANTITY_RESERVED'
,p_column_display_sequence=>110
,p_column_heading=>'Quantity Reserved'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35155992511106414)
,p_query_column_id=>9
,p_column_alias=>'STOCK_STATUS_CODE'
,p_column_display_sequence=>90
,p_column_heading=>'Stock Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35156010032106414)
,p_query_column_id=>2
,p_column_alias=>'WAREHOUSE_ID'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35156129560106414)
,p_query_column_id=>3
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35156221115106414)
,p_plug_name=>'Inventory Filters'
,p_static_id=>'inventory-filters'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody:t-Region--noBorder'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(35154792901106413)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'current_facets_selector', '#active_facets',
  'show_charts', 'Y',
  'show_current_facets', 'E',
  'show_total_row_count', 'Y')).to_clob
,p_plug_comment=>'Provides sidebar filters so users can narrow stock visibility by warehouse, stock status, and latest movement timing.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35156389554106414)
,p_name=>'P2_F_LAST_MOVED_AT'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35156221115106414)
,p_prompt=>'Last Moved'
,p_source=>'LAST_MOVED_AT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RANGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'manual_entry', 'N',
  'select_multiple', 'N')).to_clob
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_chart=>false
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35156580821106414)
,p_name=>'P2_F_STOCK_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35156221115106414)
,p_prompt=>'Stock Status'
,p_source=>'STOCK_STATUS_CODE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'STOCK_STATUS_LOV'
,p_lov_display_extra=>'YES'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>6
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35156641793106414)
,p_name=>'P2_F_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35156221115106414)
,p_prompt=>'Warehouse'
,p_source=>'WAREHOUSE_ID'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_extra=>'YES'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>6
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35156485291106414)
,p_name=>'P2_SEARCH'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(35156221115106414)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35156725382106414)
,p_name=>'Refresh on dialog close Inventory Balance Report'
,p_static_id=>'dialog-refresh-inventory-balance-report'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35154792901106413)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35156870616106414)
,p_event_id=>wwv_flow_imp.id(35156725382106414)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35154792901106413)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_imp_page.create_page(
 p_id=>3
,p_name=>'Receipt Workspace'
,p_alias=>'RECEIPT-WORKSPACE'
,p_step_title=>'Receipt Workspace'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35049553730105914)
,p_protection_level=>'C'
,p_page_comment=>'Receiving teams use this page to move from a receipt header into the detailed line outcomes needed for putaway, discrepancy review, and follow-up.'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35126573458106288)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35126633477106288)
,p_plug_name=>'Receipt Headers'
,p_static_id=>'filter-receipt-headers'
,p_region_name=>'filter-receipt-headers'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(35126796797106288)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maximum_suggestion_chips', '0',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
,p_plug_comment=>'Added by generator'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35126891786106288)
,p_name=>'P3_SEARCH'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(35126633477106288)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35126796797106288)
,p_plug_name=>'Receipt Headers'
,p_static_id=>'receipt-headers'
,p_parent_plug_id=>wwv_flow_imp.id(35126633477106288)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noUI:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ir.inbound_receipt_id as inbound_receipt_id',
'     , ir.receipt_status_code as receipt_status_code',
'     , ir.receipt_number as receipt_number',
'     , wh.warehouse_name as warehouse_name',
'     , nvl(bp.partner_name, ir.receipt_source_code) as source_name',
'     , ir.source_document_number as source_document_number',
'     , ir.expected_arrival_at as expected_arrival_at',
'     , ir.actual_arrival_at as actual_arrival_at',
'     , ir.receiving_completed_at as receiving_completed_at',
'from scm_inbound_receipts ir',
'join scm_warehouses wh',
'    on wh.warehouse_id = ir.warehouse_id',
'left join scm_business_partners bp',
'    on bp.business_partner_id = ir.source_partner_id'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'DESCRIPTION', 'Warehouse: &WAREHOUSE_NAME.',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'N',
  'HIDE_BORDERS', 'N',
  'MISC', 'Source: &SOURCE_NAME.<br/>Source Document: &SOURCE_DOCUMENT_NUMBER.<br/>Expected Arrival At: &EXPECTED_ARRIVAL_AT.<br/>Actual Arrival At: &ACTUAL_ARRIVAL_AT.<br/>Receiving Completed At: &RECEIVING_COMPLETED_AT.',
  'OVERLINE', '&RECEIPT_STATUS_CODE.',
  'REMOVE_PADDING', 'N',
  'STACK_MOBILE', 'N',
  'TITLE', '&RECEIPT_NUMBER.')).to_clob
,p_plug_comment=>'Presents inbound receipts as selectable work items so users can focus the line-detail panel on one receipt at a time.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35126904715106288)
,p_name=>'ACTUAL_ARRIVAL_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTUAL_ARRIVAL_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>80
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35127039896106288)
,p_name=>'EXPECTED_ARRIVAL_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPECTED_ARRIVAL_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>70
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35127113155106288)
,p_name=>'INBOUND_RECEIPT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INBOUND_RECEIPT_ID'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35127244656106288)
,p_name=>'RECEIPT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIPT_NUMBER'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35127363888106288)
,p_name=>'RECEIPT_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIPT_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35127408996106289)
,p_name=>'RECEIVING_COMPLETED_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIVING_COMPLETED_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>90
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35127595259106289)
,p_name=>'SOURCE_DOCUMENT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SOURCE_DOCUMENT_NUMBER'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>60
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35127646350106289)
,p_name=>'SOURCE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SOURCE_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35127761812106289)
,p_name=>'WAREHOUSE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAREHOUSE_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35127840257106289)
,p_region_id=>wwv_flow_imp.id(35126796797106288)
,p_position_id=>350878614853473162
,p_display_sequence=>5
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35127962338106289)
,p_region_id=>wwv_flow_imp.id(35126796797106288)
,p_position_id=>350878614853473162
,p_display_sequence=>10
,p_static_id=>'action-fullrowlink-1'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.::P3_INBOUND_RECEIPT_ID:\&INBOUND_RECEIPT_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35049553730105914)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35128051417106289)
,p_region_id=>wwv_flow_imp.id(35126796797106288)
,p_position_id=>363792341120765662
,p_display_sequence=>20
,p_template_id=>363794202317800939
,p_label=>'Show actions'
,p_static_id=>'action-menu'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_action_css_classes=>'t-Button--noUI'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(35128141712106289)
,p_component_action_id=>wwv_flow_imp.id(35128051417106289)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit'
,p_static_id=>'menu-entry-edit'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:30:&APP_SESSION.::&DEBUG.::P30_INBOUND_RECEIPT_ID:\&INBOUND_RECEIPT_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35049553730105914)
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35128289653106289)
,p_name=>'Receipt Lines'
,p_static_id=>'receipt-lines'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_new_grid_row=>false
,p_display_column=>5
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rl.inbound_receipt_line_id as inbound_receipt_line_id',
'     , rl.line_number as line_number',
'     , it.item_name as item_name',
'     , il.lot_number as lot_number',
'     , rlx.location_code as receiving_location_code',
'     , sl.location_code as suggested_location_code',
'     , fl.location_code as final_location_code',
'     , rl.expected_quantity as expected_quantity',
'     , rl.received_quantity as received_quantity',
'     , rl.received_condition_code as received_condition_code',
'     , rl.accepted_quantity as accepted_quantity',
'     , rl.quarantine_quantity as quarantine_quantity',
'     , rl.damaged_quantity as damaged_quantity',
'     , rl.shortage_quantity as shortage_quantity',
'     , rl.overage_quantity as overage_quantity',
'     , rl.rejected_quantity as rejected_quantity',
'     , rl.rejected_disposition_code as rejected_disposition_code',
'     , rl.line_status_code as line_status_code',
'     , rl.discrepancy_reason_code as discrepancy_reason_code',
'     , rl.line_notes as line_notes',
'from scm_inbound_receipt_lines rl',
'join scm_items it',
'    on it.item_id = rl.item_id',
'left join scm_inventory_lots il',
'    on il.inventory_lot_id = rl.inventory_lot_id',
'left join scm_storage_locations rlx',
'    on rlx.storage_location_id = rl.receiving_location_id',
'left join scm_storage_locations sl',
'    on sl.storage_location_id = rl.suggested_putaway_location_id',
'left join scm_storage_locations fl',
'    on fl.storage_location_id = rl.final_putaway_location_id',
'where rl.inbound_receipt_id = cast(:P3_INBOUND_RECEIPT_ID as number)',
'order by rl.line_number'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P3_INBOUND_RECEIPT_ID'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Shows the selected receipt lines so receiving teams can inspect receiving location, putaway direction, condition outcomes, and discrepancy handling for each line, including outcome quantities that must reconcile to the received quantity before the li'
||'ne can close.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35128313210106289)
,p_query_column_id=>10
,p_column_alias=>'ACCEPTED_QUANTITY'
,p_column_display_sequence=>100
,p_column_heading=>'Accepted Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35128447920106289)
,p_query_column_id=>12
,p_column_alias=>'DAMAGED_QUANTITY'
,p_column_display_sequence=>120
,p_column_heading=>'Damaged Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35128542171106289)
,p_query_column_id=>18
,p_column_alias=>'DISCREPANCY_REASON_CODE'
,p_column_display_sequence=>180
,p_column_heading=>'Discrepancy Reason'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35128627251106289)
,p_query_column_id=>7
,p_column_alias=>'EXPECTED_QUANTITY'
,p_column_display_sequence=>70
,p_column_heading=>'Expected Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35128794469106289)
,p_query_column_id=>19
,p_column_alias=>'FINAL_LOCATION_CODE'
,p_column_display_sequence=>190
,p_column_heading=>'Final Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35128889842106289)
,p_query_column_id=>1
,p_column_alias=>'INBOUND_RECEIPT_LINE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35128913425106289)
,p_query_column_id=>3
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35129026678106289)
,p_query_column_id=>20
,p_column_alias=>'LINE_NOTES'
,p_column_display_sequence=>200
,p_column_heading=>'Line Notes'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35129150532106289)
,p_query_column_id=>2
,p_column_alias=>'LINE_NUMBER'
,p_column_display_sequence=>20
,p_column_heading=>'Line Number'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35129222605106289)
,p_query_column_id=>17
,p_column_alias=>'LINE_STATUS_CODE'
,p_column_display_sequence=>170
,p_column_heading=>'Line Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35129366293106289)
,p_query_column_id=>4
,p_column_alias=>'LOT_NUMBER'
,p_column_display_sequence=>40
,p_column_heading=>'Lot Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35129450630106289)
,p_query_column_id=>14
,p_column_alias=>'OVERAGE_QUANTITY'
,p_column_display_sequence=>140
,p_column_heading=>'Overage Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35129587182106289)
,p_query_column_id=>11
,p_column_alias=>'QUARANTINE_QUANTITY'
,p_column_display_sequence=>110
,p_column_heading=>'Quarantine Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35129661324106289)
,p_query_column_id=>9
,p_column_alias=>'RECEIVED_CONDITION_CODE'
,p_column_display_sequence=>90
,p_column_heading=>'Received Condition'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35129800864106289)
,p_query_column_id=>8
,p_column_alias=>'RECEIVED_QUANTITY'
,p_column_display_sequence=>80
,p_column_heading=>'Received Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35129874937106289)
,p_query_column_id=>5
,p_column_alias=>'RECEIVING_LOCATION_CODE'
,p_column_display_sequence=>50
,p_column_heading=>'Receiving Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35129981036106289)
,p_query_column_id=>16
,p_column_alias=>'REJECTED_DISPOSITION_CODE'
,p_column_display_sequence=>160
,p_column_heading=>'Rejected Disposition'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35130010928106289)
,p_query_column_id=>15
,p_column_alias=>'REJECTED_QUANTITY'
,p_column_display_sequence=>150
,p_column_heading=>'Rejected Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35130176818106289)
,p_query_column_id=>13
,p_column_alias=>'SHORTAGE_QUANTITY'
,p_column_display_sequence=>130
,p_column_heading=>'Shortage Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35130204439106289)
,p_query_column_id=>6
,p_column_alias=>'SUGGESTED_LOCATION_CODE'
,p_column_display_sequence=>60
,p_column_heading=>'Suggested Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35130420138106289)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35126796797106288)
,p_button_name=>'CREATE-RECEIPT'
,p_static_id=>'create-receipt'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Receipt'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:30:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049553730105914)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35130340548106289)
,p_name=>'P3_INBOUND_RECEIPT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35126796797106288)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35130564334106290)
,p_name=>'After Create Dialog Closed'
,p_static_id=>'dialog-closed-create-parent'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35130420138106289)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35130685415106290)
,p_event_id=>wwv_flow_imp.id(35130564334106290)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_INBOUND_RECEIPT_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P30_INBOUND_RECEIPT_ID',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35130723324106329)
,p_event_id=>wwv_flow_imp.id(35130564334106290)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh ParentRegion'
,p_static_id=>'refresh-parent-region'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35126796797106288)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35130826455106329)
,p_event_id=>wwv_flow_imp.id(35130564334106290)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Select parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P3_INBOUND_RECEIPT_ID'') + '']'').click();',
    '                }, 2000);',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35130975132106329)
,p_name=>'Parent Action Dialog Closed'
,p_static_id=>'dialog-closed-parent-action'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35126796797106288)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35131073283106329)
,p_event_id=>wwv_flow_imp.id(35130975132106329)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Receipt Lines'
,p_static_id=>'refresh-2-dialog-closed-parent-action-receipt-lines'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35128289653106289)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35131197527106329)
,p_event_id=>wwv_flow_imp.id(35130975132106329)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Parent Region'
,p_static_id=>'refresh-parent-region-action'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35126796797106288)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35131236506106329)
,p_event_id=>wwv_flow_imp.id(35130975132106329)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'N'
,p_name=>'Select Parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                if ($v(''P3_INBOUND_RECEIPT_ID'') !== '''') {',
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P3_INBOUND_RECEIPT_ID'') + '']'').click();',
    '                }, 2000);',
    '                }',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35131364374106329)
,p_name=>'Refresh on dialog close Receipt Lines'
,p_static_id=>'dialog-refresh-receipt-lines'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35128289653106289)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35131424522106329)
,p_event_id=>wwv_flow_imp.id(35131364374106329)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35128289653106289)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35131579749106329)
,p_name=>'Parent Row Selected'
,p_static_id=>'parent-row-selected'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.t-ContentRow-item'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#filter-receipt-headers'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35131664740106329)
,p_event_id=>wwv_flow_imp.id(35131579749106329)
,p_event_result=>'TRUE'
,p_action_sequence=>7
,p_execute_on_page_init=>'N'
,p_static_id=>'native-add-class'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35131773115106329)
,p_event_id=>wwv_flow_imp.id(35131579749106329)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-remove-class'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'JAVASCRIPT_EXPRESSION'
,p_affected_elements=>'$(''.t-ContentRow-item'')'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35131871668106329)
,p_event_id=>wwv_flow_imp.id(35131579749106329)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Receipt Lines'
,p_static_id=>'refresh-2-parent-row-selected-receipt-lines'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35128289653106289)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35131931963106330)
,p_event_id=>wwv_flow_imp.id(35131579749106329)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'set-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_INBOUND_RECEIPT_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_expression', 'this.triggeringElement.getAttribute(''data-id'')',
  'suppress_change_event', 'N',
  'type', 'JAVASCRIPT_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35132090073106330)
,p_name=>'Smart Filter Change'
,p_static_id=>'smart-filter-change'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35126633477106288)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_SMART_FILTERS|REGION TYPE|facetschange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35132162125106330)
,p_event_id=>wwv_flow_imp.id(35132090073106330)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Clear Page Items'
,p_static_id=>'clear-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_INBOUND_RECEIPT_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35132278052106330)
,p_event_id=>wwv_flow_imp.id(35132090073106330)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'Refresh Receipt Lines'
,p_static_id=>'refresh-2-smart-filter-change-receipt-lines'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35128289653106289)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_imp_page.create_page(
 p_id=>4
,p_name=>'Task Queue'
,p_alias=>'TASK-QUEUE'
,p_step_title=>'Task Queue'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35049936342105914)
,p_protection_level=>'C'
,p_page_comment=>'Supervisors and warehouse teams use this page to focus on task status, priority, and due timing without losing queue context.'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35089553639106106)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35089627666106106)
,p_name=>'Operational Task Report'
,p_static_id=>'operational-task-report'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ot.operational_task_id as operational_task_id',
'     , wh.warehouse_id as warehouse_id',
'     , ot.task_status_code as task_status_code',
'     , ot.priority_code as priority_code',
'     , ot.task_number as task_number',
'     , ot.task_type_code as task_type_code',
'     , wh.warehouse_name as warehouse_name',
'     , fl.location_code as from_location_code',
'     , tl.location_code as to_location_code',
'     , it.item_name as item_name',
'     , il.lot_number as lot_number',
'     , ot.task_quantity as task_quantity',
'     , ur.role_name as assigned_role_name',
'     , ot.requested_at as requested_at',
'     , ot.due_at as due_at',
'     , ot.started_at as started_at',
'     , ot.completed_at as completed_at',
'     , ot.completion_code as completion_code',
'     , au.full_name as assigned_user_name',
'     , abu.full_name as assigned_by_user_name',
'     , ot.source_document_type as source_document_type',
'     , ot.source_document_number as source_document_number',
'     , ot.source_line_number as source_line_number',
'from scm_operational_tasks ot',
'join scm_warehouses wh',
'    on wh.warehouse_id = ot.warehouse_id',
'left join scm_storage_locations fl',
'    on fl.storage_location_id = ot.from_location_id',
'left join scm_storage_locations tl',
'    on tl.storage_location_id = ot.to_location_id',
'left join scm_items it',
'    on it.item_id = ot.item_id',
'left join scm_inventory_lots il',
'    on il.inventory_lot_id = ot.inventory_lot_id',
'left join scm_user_roles ur',
'    on ur.user_role_id = ot.assigned_role_id',
'left join scm_application_users au',
'    on au.application_user_id = ot.assigned_user_id',
'left join scm_application_users abu',
'    on abu.application_user_id = ot.assigned_by_user_id',
'order by ot.requested_at desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays warehouse tasks with source, location, lot, assignee, and completion information for day-to-day task control, using only active operating locations as normal sources or destinations.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35089788580106106)
,p_query_column_id=>20
,p_column_alias=>'ASSIGNED_BY_USER_NAME'
,p_column_display_sequence=>200
,p_column_heading=>'Assigned By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35089823454106106)
,p_query_column_id=>13
,p_column_alias=>'ASSIGNED_ROLE_NAME'
,p_column_display_sequence=>130
,p_column_heading=>'Assigned Role'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35089935857106106)
,p_query_column_id=>19
,p_column_alias=>'ASSIGNED_USER_NAME'
,p_column_display_sequence=>190
,p_column_heading=>'Assigned User'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35090055907106106)
,p_query_column_id=>17
,p_column_alias=>'COMPLETED_AT'
,p_column_display_sequence=>170
,p_column_heading=>'Completed At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35090159813106106)
,p_query_column_id=>18
,p_column_alias=>'COMPLETION_CODE'
,p_column_display_sequence=>180
,p_column_heading=>'Completion Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35090235282106106)
,p_query_column_id=>15
,p_column_alias=>'DUE_AT'
,p_column_display_sequence=>150
,p_column_heading=>'Due At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35090394154106106)
,p_query_column_id=>8
,p_column_alias=>'FROM_LOCATION_CODE'
,p_column_display_sequence=>80
,p_column_heading=>'From Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35090423402106106)
,p_query_column_id=>10
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>100
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35090526036106106)
,p_query_column_id=>11
,p_column_alias=>'LOT_NUMBER'
,p_column_display_sequence=>110
,p_column_heading=>'Lot Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35090659549106106)
,p_query_column_id=>1
,p_column_alias=>'OPERATIONAL_TASK_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35090755747106106)
,p_query_column_id=>4
,p_column_alias=>'PRIORITY_CODE'
,p_column_display_sequence=>40
,p_column_heading=>'Priority'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35090819671106106)
,p_query_column_id=>14
,p_column_alias=>'REQUESTED_AT'
,p_column_display_sequence=>140
,p_column_heading=>'Requested At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35090948335106106)
,p_query_column_id=>22
,p_column_alias=>'SOURCE_DOCUMENT_NUMBER'
,p_column_display_sequence=>220
,p_column_heading=>'Source Document Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35091017060106106)
,p_query_column_id=>21
,p_column_alias=>'SOURCE_DOCUMENT_TYPE'
,p_column_display_sequence=>210
,p_column_heading=>'Source Document Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35091199303106106)
,p_query_column_id=>23
,p_column_alias=>'SOURCE_LINE_NUMBER'
,p_column_display_sequence=>230
,p_column_heading=>'Source Line Number'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35091291834106106)
,p_query_column_id=>16
,p_column_alias=>'STARTED_AT'
,p_column_display_sequence=>160
,p_column_heading=>'Started At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35091309066106106)
,p_query_column_id=>5
,p_column_alias=>'TASK_NUMBER'
,p_column_display_sequence=>50
,p_column_heading=>'Task Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35091420958106106)
,p_query_column_id=>12
,p_column_alias=>'TASK_QUANTITY'
,p_column_display_sequence=>120
,p_column_heading=>'Task Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35091515917106106)
,p_query_column_id=>3
,p_column_alias=>'TASK_STATUS_CODE'
,p_column_display_sequence=>30
,p_column_heading=>'Task Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35091641997106106)
,p_query_column_id=>6
,p_column_alias=>'TASK_TYPE_CODE'
,p_column_display_sequence=>60
,p_column_heading=>'Task Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35091783135106106)
,p_query_column_id=>9
,p_column_alias=>'TO_LOCATION_CODE'
,p_column_display_sequence=>90
,p_column_heading=>'To Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35091863426106106)
,p_query_column_id=>2
,p_column_alias=>'WAREHOUSE_ID'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35091981507106106)
,p_query_column_id=>7
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35092046773106106)
,p_plug_name=>'Operational Task Report'
,p_static_id=>'task-filters'
,p_region_name=>'task-filters'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(35089627666106106)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
,p_plug_comment=>'Provides smart filters that narrow the operational task queue by warehouse, task status, priority, and due timing.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35092202527106107)
,p_name=>'P4_F_DUE_AT'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35092046773106106)
,p_prompt=>'Due At'
,p_source=>'DUE_AT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RANGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'manual_entry', 'N',
  'select_multiple', 'N')).to_clob
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'L'
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35092265082106107)
,p_name=>'P4_F_PRIORITY_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35092046773106106)
,p_prompt=>'Priority'
,p_source=>'PRIORITY_CODE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'TASK_PRIORITY_LOV'
,p_lov_display_extra=>'YES'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'L'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35092448978106107)
,p_name=>'P4_F_TASK_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35092046773106106)
,p_prompt=>'Task Status'
,p_source=>'TASK_STATUS_CODE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'TASK_STATUS_LOV'
,p_lov_display_extra=>'YES'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'L'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35092537865106107)
,p_name=>'P4_F_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35092046773106106)
,p_prompt=>'Warehouse'
,p_source=>'WAREHOUSE_ID'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_extra=>'YES'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'L'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35092314970106107)
,p_name=>'P4_SEARCH'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(35092046773106106)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35092685800106107)
,p_name=>'Refresh on dialog close Operational Task Report'
,p_static_id=>'dialog-refresh-operational-task-report'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35089627666106106)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35092766760106107)
,p_event_id=>wwv_flow_imp.id(35092685800106107)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35089627666106106)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_imp_page.create_page(
 p_id=>5
,p_name=>'Transfer Workspace'
,p_alias=>'TRANSFER-WORKSPACE'
,p_step_title=>'Transfer Workspace'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35049306859105914)
,p_protection_level=>'C'
,p_page_comment=>'Transfer planners use this page to compare transfer header status with line-level shipped and received quantities before confirming completion.'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35059239733105976)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35059366662105976)
,p_plug_name=>'Transfer Headers'
,p_static_id=>'filter-transfer-headers'
,p_region_name=>'filter-transfer-headers'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(35059466298105976)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maximum_suggestion_chips', '0',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
,p_plug_comment=>'Added by generator'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35059531292105976)
,p_name=>'P5_SEARCH'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(35059366662105976)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35059466298105976)
,p_plug_name=>'Transfer Headers'
,p_static_id=>'transfer-headers'
,p_parent_plug_id=>wwv_flow_imp.id(35059366662105976)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noUI:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select st.stock_transfer_id as stock_transfer_id',
'     , st.transfer_status_code as transfer_status_code',
'     , st.transfer_number as transfer_number',
'     , fwh.warehouse_name as from_warehouse_name',
'     , twh.warehouse_name as to_warehouse_name',
'     , st.requested_ship_at as requested_ship_at',
'     , st.actual_shipped_at as actual_shipped_at',
'     , st.actual_received_at as actual_received_at',
'     , st.requested_by as requested_by',
'     , st.approved_by as approved_by',
'     , ap.policy_name as approval_policy_name',
'     , st.reason_code as reason_code',
'from scm_stock_transfers st',
'join scm_warehouses fwh',
'    on fwh.warehouse_id = st.from_warehouse_id',
'join scm_warehouses twh',
'    on twh.warehouse_id = st.to_warehouse_id',
'left join scm_approval_policies ap',
'    on ap.approval_policy_id = st.approval_policy_id'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'DESCRIPTION', 'From Warehouse: &FROM_WAREHOUSE_NAME.',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'N',
  'HIDE_BORDERS', 'N',
  'MISC', 'To Warehouse: &TO_WAREHOUSE_NAME.<br/>Requested Ship At: &REQUESTED_SHIP_AT.<br/>Actual Shipped At: &ACTUAL_SHIPPED_AT.<br/>Actual Received At: &ACTUAL_RECEIVED_AT.<br/>Requested By: &REQUESTED_BY.<br/>Approved By: &APPROVED_BY.<br/>Approval Policy: '
||'&APPROVAL_POLICY_NAME.<br/>Reason Code: &REASON_CODE.',
  'OVERLINE', '&TRANSFER_STATUS_CODE.',
  'REMOVE_PADDING', 'N',
  'STACK_MOBILE', 'N',
  'TITLE', '&TRANSFER_NUMBER.')).to_clob
,p_plug_comment=>'Presents stock transfer headers as selectable work items so users can move between transfer requests and the matching line detail.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35059640488105976)
,p_name=>'ACTUAL_RECEIVED_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTUAL_RECEIVED_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>80
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35059730617105977)
,p_name=>'ACTUAL_SHIPPED_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTUAL_SHIPPED_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>70
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35059828039105977)
,p_name=>'APPROVAL_POLICY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPROVAL_POLICY_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>110
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35059959886105977)
,p_name=>'APPROVED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPROVED_BY'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>100
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35060080816105977)
,p_name=>'FROM_WAREHOUSE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FROM_WAREHOUSE_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35060171436105977)
,p_name=>'REASON_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REASON_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>120
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35060286999105977)
,p_name=>'REQUESTED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REQUESTED_BY'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>90
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35060401235105977)
,p_name=>'REQUESTED_SHIP_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REQUESTED_SHIP_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>60
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35060418139105977)
,p_name=>'STOCK_TRANSFER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STOCK_TRANSFER_ID'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35060581492105977)
,p_name=>'TO_WAREHOUSE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TO_WAREHOUSE_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35060656434105978)
,p_name=>'TRANSFER_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANSFER_NUMBER'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35060717643105978)
,p_name=>'TRANSFER_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANSFER_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35060866625105978)
,p_region_id=>wwv_flow_imp.id(35059466298105976)
,p_position_id=>350878614853473162
,p_display_sequence=>5
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35060990149105978)
,p_region_id=>wwv_flow_imp.id(35059466298105976)
,p_position_id=>350878614853473162
,p_display_sequence=>10
,p_static_id=>'action-fullrowlink-1'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.::P5_STOCK_TRANSFER_ID:\&STOCK_TRANSFER_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35049306859105914)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35061052533105978)
,p_region_id=>wwv_flow_imp.id(35059466298105976)
,p_position_id=>363792341120765662
,p_display_sequence=>20
,p_template_id=>363794202317800939
,p_label=>'Show actions'
,p_static_id=>'action-menu'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_action_css_classes=>'t-Button--noUI'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(35061188079105978)
,p_component_action_id=>wwv_flow_imp.id(35061052533105978)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit'
,p_static_id=>'menu-entry-edit'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:31:&APP_SESSION.::&DEBUG.::P31_STOCK_TRANSFER_ID:\&STOCK_TRANSFER_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35049306859105914)
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35061250751105978)
,p_name=>'Transfer Lines'
,p_static_id=>'transfer-lines'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_new_grid_row=>false
,p_display_column=>5
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tl.stock_transfer_line_id as stock_transfer_line_id',
'     , tl.line_number as line_number',
'     , it.item_name as item_name',
'     , il.lot_number as lot_number',
'     , tl.requested_quantity as requested_quantity',
'     , tl.shipped_quantity as shipped_quantity',
'     , tl.received_quantity as received_quantity',
'     , sl.location_code as source_location_code',
'     , dl.location_code as destination_location_code',
'     , tl.source_stock_status_code as source_stock_status_code',
'     , tl.source_lot_status_code as source_lot_status_code',
'     , tl.line_status_code as line_status_code',
'from scm_stock_transfer_lines tl',
'join scm_items it',
'    on it.item_id = tl.item_id',
'left join scm_inventory_lots il',
'    on il.inventory_lot_id = tl.inventory_lot_id',
'left join scm_storage_locations sl',
'    on sl.storage_location_id = tl.source_location_id',
'left join scm_storage_locations dl',
'    on dl.storage_location_id = tl.destination_location_id',
'where tl.stock_transfer_id = cast(:P5_STOCK_TRANSFER_ID as number)',
'order by tl.line_number'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P5_STOCK_TRANSFER_ID'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Shows the selected transfer lines so users can compare requested, shipped, and received quantities together with lot and source-supply status for the active transfer, using only available stock and active lots for normal transfer supply.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35061386006105978)
,p_query_column_id=>9
,p_column_alias=>'DESTINATION_LOCATION_CODE'
,p_column_display_sequence=>90
,p_column_heading=>'Destination Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35061467083105978)
,p_query_column_id=>3
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35061561500105978)
,p_query_column_id=>2
,p_column_alias=>'LINE_NUMBER'
,p_column_display_sequence=>20
,p_column_heading=>'Line Number'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35061695780105978)
,p_query_column_id=>12
,p_column_alias=>'LINE_STATUS_CODE'
,p_column_display_sequence=>120
,p_column_heading=>'Line Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35061705077105978)
,p_query_column_id=>4
,p_column_alias=>'LOT_NUMBER'
,p_column_display_sequence=>40
,p_column_heading=>'Lot Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35061814057105978)
,p_query_column_id=>7
,p_column_alias=>'RECEIVED_QUANTITY'
,p_column_display_sequence=>70
,p_column_heading=>'Received Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35061954022105978)
,p_query_column_id=>5
,p_column_alias=>'REQUESTED_QUANTITY'
,p_column_display_sequence=>50
,p_column_heading=>'Requested Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35062030557105978)
,p_query_column_id=>6
,p_column_alias=>'SHIPPED_QUANTITY'
,p_column_display_sequence=>60
,p_column_heading=>'Shipped Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35062197014105978)
,p_query_column_id=>8
,p_column_alias=>'SOURCE_LOCATION_CODE'
,p_column_display_sequence=>80
,p_column_heading=>'Source Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35062282445105978)
,p_query_column_id=>11
,p_column_alias=>'SOURCE_LOT_STATUS_CODE'
,p_column_display_sequence=>110
,p_column_heading=>'Source Lot Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35062349649105978)
,p_query_column_id=>10
,p_column_alias=>'SOURCE_STOCK_STATUS_CODE'
,p_column_display_sequence=>100
,p_column_heading=>'Source Stock Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35062473519105978)
,p_query_column_id=>1
,p_column_alias=>'STOCK_TRANSFER_LINE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35062609758105978)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35059466298105976)
,p_button_name=>'CREATE-TRANSFER'
,p_static_id=>'create-transfer'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Transfer'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:31:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35062503595105978)
,p_name=>'P5_STOCK_TRANSFER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35059466298105976)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35062741032105978)
,p_name=>'After Create Dialog Closed'
,p_static_id=>'dialog-closed-create-parent'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35062609758105978)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35062838324105979)
,p_event_id=>wwv_flow_imp.id(35062741032105978)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_STOCK_TRANSFER_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P31_STOCK_TRANSFER_ID',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35062976985105979)
,p_event_id=>wwv_flow_imp.id(35062741032105978)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh ParentRegion'
,p_static_id=>'refresh-parent-region'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35059466298105976)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35063053197105979)
,p_event_id=>wwv_flow_imp.id(35062741032105978)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Select parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P5_STOCK_TRANSFER_ID'') + '']'').click();',
    '                }, 2000);',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35063182880105979)
,p_name=>'Parent Action Dialog Closed'
,p_static_id=>'dialog-closed-parent-action'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35059466298105976)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35063262231105979)
,p_event_id=>wwv_flow_imp.id(35063182880105979)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Transfer Lines'
,p_static_id=>'refresh-2-dialog-closed-parent-action-transfer-lines'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35061250751105978)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35063356673105979)
,p_event_id=>wwv_flow_imp.id(35063182880105979)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Parent Region'
,p_static_id=>'refresh-parent-region-action'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35059466298105976)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35063458553105979)
,p_event_id=>wwv_flow_imp.id(35063182880105979)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'N'
,p_name=>'Select Parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                if ($v(''P5_STOCK_TRANSFER_ID'') !== '''') {',
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P5_STOCK_TRANSFER_ID'') + '']'').click();',
    '                }, 2000);',
    '                }',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35063565972105979)
,p_name=>'Refresh on dialog close Transfer Lines'
,p_static_id=>'dialog-refresh-transfer-lines'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35061250751105978)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35063687643105979)
,p_event_id=>wwv_flow_imp.id(35063565972105979)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35061250751105978)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35063737302105979)
,p_name=>'Parent Row Selected'
,p_static_id=>'parent-row-selected'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.t-ContentRow-item'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#filter-transfer-headers'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35063805596105979)
,p_event_id=>wwv_flow_imp.id(35063737302105979)
,p_event_result=>'TRUE'
,p_action_sequence=>7
,p_execute_on_page_init=>'N'
,p_static_id=>'native-add-class'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35063932743105979)
,p_event_id=>wwv_flow_imp.id(35063737302105979)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-remove-class'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'JAVASCRIPT_EXPRESSION'
,p_affected_elements=>'$(''.t-ContentRow-item'')'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35064084886105979)
,p_event_id=>wwv_flow_imp.id(35063737302105979)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Transfer Lines'
,p_static_id=>'refresh-2-parent-row-selected-transfer-lines'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35061250751105978)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35064109059105979)
,p_event_id=>wwv_flow_imp.id(35063737302105979)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'set-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_STOCK_TRANSFER_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_expression', 'this.triggeringElement.getAttribute(''data-id'')',
  'suppress_change_event', 'N',
  'type', 'JAVASCRIPT_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35064300868105979)
,p_name=>'Smart Filter Change'
,p_static_id=>'smart-filter-change'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35059366662105976)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_SMART_FILTERS|REGION TYPE|facetschange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35064395429105979)
,p_event_id=>wwv_flow_imp.id(35064300868105979)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Clear Page Items'
,p_static_id=>'clear-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_STOCK_TRANSFER_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35064467324105980)
,p_event_id=>wwv_flow_imp.id(35064300868105979)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'Refresh Transfer Lines'
,p_static_id=>'refresh-2-smart-filter-change-transfer-lines'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35061250751105978)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_imp_page.create_page(
 p_id=>6
,p_name=>'Outbound Fulfilment'
,p_alias=>'OUTBOUND-FULFILMENT'
,p_step_title=>'Outbound Fulfilment'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35049064416105914)
,p_protection_level=>'C'
,p_page_comment=>'Warehouse, customer service, and transport teams use this page to compare outbound order progress with line-level fulfilment quantities before dispatch.'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35132448158106330)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35132599633106330)
,p_plug_name=>'Outbound Orders'
,p_static_id=>'filter-outbound-orders'
,p_region_name=>'filter-outbound-orders'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(35132604535106330)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maximum_suggestion_chips', '0',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
,p_plug_comment=>'Added by generator'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35132782357106330)
,p_name=>'P6_SEARCH'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(35132599633106330)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35132885622106330)
,p_name=>'Outbound Lines'
,p_static_id=>'outbound-lines'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_new_grid_row=>false
,p_display_column=>5
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ol.outbound_order_line_id as outbound_order_line_id',
'     , ol.line_number as line_number',
'     , it.item_name as item_name',
'     , il.lot_number as preferred_lot_number',
'     , ol.requested_quantity as requested_quantity',
'     , ol.reserved_quantity as reserved_quantity',
'     , ol.picked_quantity as picked_quantity',
'     , ol.packed_quantity as packed_quantity',
'     , ol.dispatched_quantity as dispatched_quantity',
'     , ol.short_quantity as short_quantity',
'     , ol.source_stock_status_code as source_stock_status_code',
'     , ol.source_lot_status_code as source_lot_status_code',
'     , ol.rotation_exception_flag as rotation_exception_flag',
'     , ol.rotation_exception_reason_code as rotation_exception_reason_code',
'     , ap.policy_name as rotation_policy_name',
'     , ol.rotation_approved_by as rotation_approved_by',
'     , ol.rotation_approved_at as rotation_approved_at',
'     , ol.allocation_status_code as allocation_status_code',
'from scm_outbound_order_lines ol',
'join scm_items it',
'    on it.item_id = ol.item_id',
'left join scm_inventory_lots il',
'    on il.inventory_lot_id = ol.preferred_lot_id',
'left join scm_approval_policies ap',
'    on ap.approval_policy_id = ol.rotation_approval_policy_id',
'where ol.outbound_order_id = cast(:P6_OUTBOUND_ORDER_ID as number)',
'order by ol.line_number'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P6_OUTBOUND_ORDER_ID'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Shows the selected outbound order lines so users can compare fulfilment quantities together with preferred lot, source stock status, and rotation-exception detail, where normal allocation uses available stock, active lots, FEFO for expiry-controlled '
||'items, and FIFO otherwise unless an approved rotation exception applies, and fulfilment quantities cannot exceed the preceding lifecycle quantity.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35132914332106330)
,p_query_column_id=>18
,p_column_alias=>'ALLOCATION_STATUS_CODE'
,p_column_display_sequence=>180
,p_column_heading=>'Allocation Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35133056810106330)
,p_query_column_id=>9
,p_column_alias=>'DISPATCHED_QUANTITY'
,p_column_display_sequence=>90
,p_column_heading=>'Dispatched Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35133137968106330)
,p_query_column_id=>3
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35133268549106330)
,p_query_column_id=>2
,p_column_alias=>'LINE_NUMBER'
,p_column_display_sequence=>20
,p_column_heading=>'Line Number'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35133309373106330)
,p_query_column_id=>1
,p_column_alias=>'OUTBOUND_ORDER_LINE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35133474656106330)
,p_query_column_id=>8
,p_column_alias=>'PACKED_QUANTITY'
,p_column_display_sequence=>80
,p_column_heading=>'Packed Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35133524080106330)
,p_query_column_id=>7
,p_column_alias=>'PICKED_QUANTITY'
,p_column_display_sequence=>70
,p_column_heading=>'Picked Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35133615336106330)
,p_query_column_id=>4
,p_column_alias=>'PREFERRED_LOT_NUMBER'
,p_column_display_sequence=>40
,p_column_heading=>'Preferred Lot'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35133795261106330)
,p_query_column_id=>5
,p_column_alias=>'REQUESTED_QUANTITY'
,p_column_display_sequence=>50
,p_column_heading=>'Requested Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35133821606106331)
,p_query_column_id=>6
,p_column_alias=>'RESERVED_QUANTITY'
,p_column_display_sequence=>60
,p_column_heading=>'Reserved Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35133946451106331)
,p_query_column_id=>17
,p_column_alias=>'ROTATION_APPROVED_AT'
,p_column_display_sequence=>170
,p_column_heading=>'Rotation Approved At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35134005911106331)
,p_query_column_id=>16
,p_column_alias=>'ROTATION_APPROVED_BY'
,p_column_display_sequence=>160
,p_column_heading=>'Rotation Approved By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35134123622106331)
,p_query_column_id=>13
,p_column_alias=>'ROTATION_EXCEPTION_FLAG'
,p_column_display_sequence=>130
,p_column_heading=>'Rotation Exception'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35134257276106331)
,p_query_column_id=>14
,p_column_alias=>'ROTATION_EXCEPTION_REASON_CODE'
,p_column_display_sequence=>140
,p_column_heading=>'Rotation Exception Reason'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35134357201106331)
,p_query_column_id=>15
,p_column_alias=>'ROTATION_POLICY_NAME'
,p_column_display_sequence=>150
,p_column_heading=>'Rotation Approval Policy'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35134475466106331)
,p_query_column_id=>10
,p_column_alias=>'SHORT_QUANTITY'
,p_column_display_sequence=>100
,p_column_heading=>'Short Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35134602673106331)
,p_query_column_id=>12
,p_column_alias=>'SOURCE_LOT_STATUS_CODE'
,p_column_display_sequence=>120
,p_column_heading=>'Source Lot Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35134623367106331)
,p_query_column_id=>11
,p_column_alias=>'SOURCE_STOCK_STATUS_CODE'
,p_column_display_sequence=>110
,p_column_heading=>'Source Stock Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35132604535106330)
,p_plug_name=>'Outbound Orders'
,p_static_id=>'outbound-orders'
,p_parent_plug_id=>wwv_flow_imp.id(35132599633106330)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noUI:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select oo.outbound_order_id as outbound_order_id',
'     , oo.outbound_status_code as outbound_status_code',
'     , oo.outbound_order_number as outbound_order_number',
'     , nvl(bp.partner_name, oo.order_type_code) as customer_name',
'     , wh.warehouse_name as warehouse_name',
'     , oo.requested_ship_at as requested_ship_at',
'     , oo.promised_ship_at as promised_ship_at',
'     , oo.partial_fulfilment_allowed_flag as partial_fulfilment_allowed_flag',
'     , oo.picked_at as picked_at',
'     , oo.packed_at as packed_at',
'     , oo.dispatched_at as dispatched_at',
'from scm_outbound_orders oo',
'join scm_warehouses wh',
'    on wh.warehouse_id = oo.ship_from_warehouse_id',
'left join scm_business_partners bp',
'    on bp.business_partner_id = oo.customer_partner_id'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'DESCRIPTION', 'Customer: &CUSTOMER_NAME.',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'N',
  'HIDE_BORDERS', 'N',
  'MISC', 'Shipping Warehouse: &WAREHOUSE_NAME.<br/>Requested Ship At: &REQUESTED_SHIP_AT.<br/>Promised Ship At: &PROMISED_SHIP_AT.<br/>Partial Fulfilment Allowed: &PARTIAL_FULFILMENT_ALLOWED_FLAG.<br/>Picked At: &PICKED_AT.<br/>Packed At: &PACKED_AT.<br/>Dispa'
||'tched At: &DISPATCHED_AT.',
  'OVERLINE', '&OUTBOUND_STATUS_CODE.',
  'REMOVE_PADDING', 'N',
  'STACK_MOBILE', 'N',
  'TITLE', '&OUTBOUND_ORDER_NUMBER.')).to_clob
,p_plug_comment=>'Presents outbound order headers as selectable work items so users can inspect the matching line-level fulfilment detail.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35134721463106331)
,p_name=>'CUSTOMER_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CUSTOMER_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35134828077106331)
,p_name=>'DISPATCHED_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISPATCHED_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>110
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35134958787106331)
,p_name=>'OUTBOUND_ORDER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OUTBOUND_ORDER_ID'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35135081086106331)
,p_name=>'OUTBOUND_ORDER_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OUTBOUND_ORDER_NUMBER'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35135115035106331)
,p_name=>'OUTBOUND_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OUTBOUND_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35135258118106331)
,p_name=>'PACKED_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PACKED_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>100
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35135307197106331)
,p_name=>'PARTIAL_FULFILMENT_ALLOWED_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTIAL_FULFILMENT_ALLOWED_FLAG'
,p_data_type=>'BOOLEAN'
,p_display_sequence=>80
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35135410825106331)
,p_name=>'PICKED_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PICKED_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>90
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35135547405106331)
,p_name=>'PROMISED_SHIP_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROMISED_SHIP_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>70
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35135676700106331)
,p_name=>'REQUESTED_SHIP_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REQUESTED_SHIP_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>60
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35135791963106331)
,p_name=>'WAREHOUSE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAREHOUSE_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35135846439106331)
,p_region_id=>wwv_flow_imp.id(35132604535106330)
,p_position_id=>350878614853473162
,p_display_sequence=>5
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35135933239106331)
,p_region_id=>wwv_flow_imp.id(35132604535106330)
,p_position_id=>350878614853473162
,p_display_sequence=>10
,p_static_id=>'action-fullrowlink-1'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.::P6_OUTBOUND_ORDER_ID:\&OUTBOUND_ORDER_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35049064416105914)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35136099590106331)
,p_region_id=>wwv_flow_imp.id(35132604535106330)
,p_position_id=>363792341120765662
,p_display_sequence=>20
,p_template_id=>363794202317800939
,p_label=>'Show actions'
,p_static_id=>'action-menu'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_action_css_classes=>'t-Button--noUI'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(35136118569106331)
,p_component_action_id=>wwv_flow_imp.id(35136099590106331)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit'
,p_static_id=>'menu-entry-edit'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:32:&APP_SESSION.::&DEBUG.::P32_OUTBOUND_ORDER_ID:\&OUTBOUND_ORDER_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35049064416105914)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35136337336106332)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35132604535106330)
,p_button_name=>'CREATE-OUTBOUND-ORDER'
,p_static_id=>'create-outbound-order'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Outbound Order'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049064416105914)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35136270381106331)
,p_name=>'P6_OUTBOUND_ORDER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35132604535106330)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35136500701106332)
,p_name=>'After Create Dialog Closed'
,p_static_id=>'dialog-closed-create-parent'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35136337336106332)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35136599353106332)
,p_event_id=>wwv_flow_imp.id(35136500701106332)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_OUTBOUND_ORDER_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P32_OUTBOUND_ORDER_ID',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35136603624106332)
,p_event_id=>wwv_flow_imp.id(35136500701106332)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh ParentRegion'
,p_static_id=>'refresh-parent-region'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35132604535106330)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35136777119106332)
,p_event_id=>wwv_flow_imp.id(35136500701106332)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Select parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P6_OUTBOUND_ORDER_ID'') + '']'').click();',
    '                }, 2000);',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35136896484106332)
,p_name=>'Parent Action Dialog Closed'
,p_static_id=>'dialog-closed-parent-action'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35132604535106330)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35136982208106332)
,p_event_id=>wwv_flow_imp.id(35136896484106332)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Outbound Lines'
,p_static_id=>'refresh-2-dialog-closed-parent-action-outbound-lines'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35132885622106330)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35137016089106332)
,p_event_id=>wwv_flow_imp.id(35136896484106332)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Parent Region'
,p_static_id=>'refresh-parent-region-action'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35132604535106330)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35137115951106332)
,p_event_id=>wwv_flow_imp.id(35136896484106332)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'N'
,p_name=>'Select Parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                if ($v(''P6_OUTBOUND_ORDER_ID'') !== '''') {',
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P6_OUTBOUND_ORDER_ID'') + '']'').click();',
    '                }, 2000);',
    '                }',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35137267598106332)
,p_name=>'Refresh on dialog close Outbound Lines'
,p_static_id=>'dialog-refresh-outbound-lines'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35132885622106330)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35137393108106332)
,p_event_id=>wwv_flow_imp.id(35137267598106332)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35132885622106330)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35137439883106332)
,p_name=>'Parent Row Selected'
,p_static_id=>'parent-row-selected'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.t-ContentRow-item'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#filter-outbound-orders'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35137506854106332)
,p_event_id=>wwv_flow_imp.id(35137439883106332)
,p_event_result=>'TRUE'
,p_action_sequence=>7
,p_execute_on_page_init=>'N'
,p_static_id=>'native-add-class'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35137611738106332)
,p_event_id=>wwv_flow_imp.id(35137439883106332)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-remove-class'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'JAVASCRIPT_EXPRESSION'
,p_affected_elements=>'$(''.t-ContentRow-item'')'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35137802560106332)
,p_event_id=>wwv_flow_imp.id(35137439883106332)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Outbound Lines'
,p_static_id=>'refresh-2-parent-row-selected-outbound-lines'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35132885622106330)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35137872830106332)
,p_event_id=>wwv_flow_imp.id(35137439883106332)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'set-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_OUTBOUND_ORDER_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_expression', 'this.triggeringElement.getAttribute(''data-id'')',
  'suppress_change_event', 'N',
  'type', 'JAVASCRIPT_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35137920408106332)
,p_name=>'Smart Filter Change'
,p_static_id=>'smart-filter-change'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35132599633106330)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_SMART_FILTERS|REGION TYPE|facetschange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35138047332106332)
,p_event_id=>wwv_flow_imp.id(35137920408106332)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Clear Page Items'
,p_static_id=>'clear-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_OUTBOUND_ORDER_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35138129529106332)
,p_event_id=>wwv_flow_imp.id(35137920408106332)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'Refresh Outbound Lines'
,p_static_id=>'refresh-2-smart-filter-change-outbound-lines'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35132885622106330)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_imp_page.create_page(
 p_id=>7
,p_name=>'Returns Workspace'
,p_alias=>'RETURNS-WORKSPACE'
,p_step_title=>'Returns Workspace'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35048790831105913)
,p_protection_level=>'C'
,p_page_comment=>'Return handling teams use this page to compare return header progress with reusable, quarantine, and write-off line outcomes.'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35164860118106461)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35164990389106461)
,p_plug_name=>'Return Headers'
,p_static_id=>'filter-return-headers'
,p_region_name=>'filter-return-headers'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(35165083841106461)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maximum_suggestion_chips', '0',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
,p_plug_comment=>'Added by generator'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35165187958106461)
,p_name=>'P7_SEARCH'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(35164990389106461)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35165083841106461)
,p_plug_name=>'Return Headers'
,p_static_id=>'return-headers'
,p_parent_plug_id=>wwv_flow_imp.id(35164990389106461)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noUI:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rt.return_id as return_id',
'     , rt.return_status_code as return_status_code',
'     , rt.return_number as return_number',
'     , nvl(bp.partner_name, rt.return_type_code) as source_name',
'     , oo.outbound_order_number as related_outbound_order_number',
'     , rt.expected_arrival_at as expected_arrival_at',
'     , rt.received_at as received_at',
'     , rt.assessed_at as assessed_at',
'     , rt.assessed_by as assessed_by',
'from scm_returns rt',
'left join scm_business_partners bp',
'    on bp.business_partner_id = rt.source_partner_id',
'left join scm_outbound_orders oo',
'    on oo.outbound_order_id = rt.related_outbound_order_id'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'DESCRIPTION', 'Source: &SOURCE_NAME.',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'N',
  'HIDE_BORDERS', 'N',
  'MISC', 'Related Outbound Order: &RELATED_OUTBOUND_ORDER_NUMBER.<br/>Expected Arrival At: &EXPECTED_ARRIVAL_AT.<br/>Received At: &RECEIVED_AT.<br/>Assessed At: &ASSESSED_AT.<br/>Assessed By: &ASSESSED_BY.',
  'OVERLINE', '&RETURN_STATUS_CODE.',
  'REMOVE_PADDING', 'N',
  'STACK_MOBILE', 'N',
  'TITLE', '&RETURN_NUMBER.')).to_clob
,p_plug_comment=>'Presents return headers as selectable work items so teams can focus the line-detail panel on one return at a time.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35165233790106462)
,p_name=>'ASSESSED_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ASSESSED_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>80
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35165309649106462)
,p_name=>'ASSESSED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ASSESSED_BY'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>90
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35165461042106462)
,p_name=>'EXPECTED_ARRIVAL_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPECTED_ARRIVAL_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>60
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35165508594106462)
,p_name=>'RECEIVED_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIVED_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>70
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35165669735106462)
,p_name=>'RELATED_OUTBOUND_ORDER_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RELATED_OUTBOUND_ORDER_NUMBER'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35165799472106462)
,p_name=>'RETURN_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RETURN_ID'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35165847239106462)
,p_name=>'RETURN_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RETURN_NUMBER'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35165989206106462)
,p_name=>'RETURN_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RETURN_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35166074141106462)
,p_name=>'SOURCE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SOURCE_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35166112089106462)
,p_region_id=>wwv_flow_imp.id(35165083841106461)
,p_position_id=>350878614853473162
,p_display_sequence=>5
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35166301690106462)
,p_region_id=>wwv_flow_imp.id(35165083841106461)
,p_position_id=>350878614853473162
,p_display_sequence=>10
,p_static_id=>'action-fullrowlink-1'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.::P7_RETURN_ID:\&RETURN_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35048790831105913)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35166393866106462)
,p_region_id=>wwv_flow_imp.id(35165083841106461)
,p_position_id=>363792341120765662
,p_display_sequence=>20
,p_template_id=>363794202317800939
,p_label=>'Show actions'
,p_static_id=>'action-menu'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_action_css_classes=>'t-Button--noUI'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(35166437252106462)
,p_component_action_id=>wwv_flow_imp.id(35166393866106462)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit'
,p_static_id=>'menu-entry-edit'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:33:&APP_SESSION.::&DEBUG.::P33_RETURN_ID:\&RETURN_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35048790831105913)
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35166503428106462)
,p_name=>'Return Lines'
,p_static_id=>'return-lines'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_new_grid_row=>false
,p_display_column=>5
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rl.return_line_id as return_line_id',
'     , rl.line_number as line_number',
'     , it.item_name as item_name',
'     , il.lot_number as lot_number',
'     , rl.expected_quantity as expected_quantity',
'     , rl.received_quantity as received_quantity',
'     , rl.returned_condition_code as returned_condition_code',
'     , rl.reusable_quantity as reusable_quantity',
'     , rl.quarantine_quantity as quarantine_quantity',
'     , rl.damaged_quantity as damaged_quantity',
'     , rl.writeoff_quantity as writeoff_quantity',
'     , rl.disposition_code as disposition_code',
'from scm_return_lines rl',
'join scm_items it',
'    on it.item_id = rl.item_id',
'left join scm_inventory_lots il',
'    on il.inventory_lot_id = rl.inventory_lot_id',
'where rl.return_id = cast(:P7_RETURN_ID as number)',
'order by rl.line_number'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P7_RETURN_ID'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Shows the selected return lines so the team can compare lot context, returned condition, and reusable, quarantine, damaged, or write-off outcomes, where outcome quantities must reconcile to the received quantity and approved reusable quantity returns'
||' to stock under the recorded disposition.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35166610282106463)
,p_query_column_id=>10
,p_column_alias=>'DAMAGED_QUANTITY'
,p_column_display_sequence=>100
,p_column_heading=>'Damaged Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35166793747106463)
,p_query_column_id=>12
,p_column_alias=>'DISPOSITION_CODE'
,p_column_display_sequence=>120
,p_column_heading=>'Disposition Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35166898801106463)
,p_query_column_id=>5
,p_column_alias=>'EXPECTED_QUANTITY'
,p_column_display_sequence=>50
,p_column_heading=>'Expected Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35166953601106463)
,p_query_column_id=>3
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35167025309106463)
,p_query_column_id=>2
,p_column_alias=>'LINE_NUMBER'
,p_column_display_sequence=>20
,p_column_heading=>'Line Number'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35167168115106463)
,p_query_column_id=>4
,p_column_alias=>'LOT_NUMBER'
,p_column_display_sequence=>40
,p_column_heading=>'Lot Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35167295240106463)
,p_query_column_id=>9
,p_column_alias=>'QUARANTINE_QUANTITY'
,p_column_display_sequence=>90
,p_column_heading=>'Quarantine Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35167366789106463)
,p_query_column_id=>6
,p_column_alias=>'RECEIVED_QUANTITY'
,p_column_display_sequence=>60
,p_column_heading=>'Received Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35167446709106463)
,p_query_column_id=>7
,p_column_alias=>'RETURNED_CONDITION_CODE'
,p_column_display_sequence=>70
,p_column_heading=>'Returned Condition'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35167590618106463)
,p_query_column_id=>1
,p_column_alias=>'RETURN_LINE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35167676071106463)
,p_query_column_id=>8
,p_column_alias=>'REUSABLE_QUANTITY'
,p_column_display_sequence=>80
,p_column_heading=>'Reusable Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35167734871106463)
,p_query_column_id=>11
,p_column_alias=>'WRITEOFF_QUANTITY'
,p_column_display_sequence=>110
,p_column_heading=>'Writeoff Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35167984854106500)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35165083841106461)
,p_button_name=>'CREATE-RETURN'
,p_static_id=>'create-return'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Return'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:33:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048790831105913)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35167890928106463)
,p_name=>'P7_RETURN_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35165083841106461)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35168072644106500)
,p_name=>'After Create Dialog Closed'
,p_static_id=>'dialog-closed-create-parent'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35167984854106500)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35168198042106500)
,p_event_id=>wwv_flow_imp.id(35168072644106500)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_RETURN_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P33_RETURN_ID',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35168286069106500)
,p_event_id=>wwv_flow_imp.id(35168072644106500)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh ParentRegion'
,p_static_id=>'refresh-parent-region'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35165083841106461)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35168327866106500)
,p_event_id=>wwv_flow_imp.id(35168072644106500)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Select parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P7_RETURN_ID'') + '']'').click();',
    '                }, 2000);',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35168465238106500)
,p_name=>'Parent Action Dialog Closed'
,p_static_id=>'dialog-closed-parent-action'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35165083841106461)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35168576697106500)
,p_event_id=>wwv_flow_imp.id(35168465238106500)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Return Lines'
,p_static_id=>'refresh-2-dialog-closed-parent-action-return-lines'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35166503428106462)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35168637324106500)
,p_event_id=>wwv_flow_imp.id(35168465238106500)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Parent Region'
,p_static_id=>'refresh-parent-region-action'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35165083841106461)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35168755315106500)
,p_event_id=>wwv_flow_imp.id(35168465238106500)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'N'
,p_name=>'Select Parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                if ($v(''P7_RETURN_ID'') !== '''') {',
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P7_RETURN_ID'') + '']'').click();',
    '                }, 2000);',
    '                }',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35168834505106500)
,p_name=>'Refresh on dialog close Return Lines'
,p_static_id=>'dialog-refresh-return-lines'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35166503428106462)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35168979202106500)
,p_event_id=>wwv_flow_imp.id(35168834505106500)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35166503428106462)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35169003965106500)
,p_name=>'Parent Row Selected'
,p_static_id=>'parent-row-selected'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.t-ContentRow-item'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#filter-return-headers'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35169159699106500)
,p_event_id=>wwv_flow_imp.id(35169003965106500)
,p_event_result=>'TRUE'
,p_action_sequence=>7
,p_execute_on_page_init=>'N'
,p_static_id=>'native-add-class'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35169235152106500)
,p_event_id=>wwv_flow_imp.id(35169003965106500)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-remove-class'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'JAVASCRIPT_EXPRESSION'
,p_affected_elements=>'$(''.t-ContentRow-item'')'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35169378046106500)
,p_event_id=>wwv_flow_imp.id(35169003965106500)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Return Lines'
,p_static_id=>'refresh-2-parent-row-selected-return-lines'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35166503428106462)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35169493450106500)
,p_event_id=>wwv_flow_imp.id(35169003965106500)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'set-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_RETURN_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_expression', 'this.triggeringElement.getAttribute(''data-id'')',
  'suppress_change_event', 'N',
  'type', 'JAVASCRIPT_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35169507521106500)
,p_name=>'Smart Filter Change'
,p_static_id=>'smart-filter-change'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35164990389106461)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_SMART_FILTERS|REGION TYPE|facetschange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35169683623106500)
,p_event_id=>wwv_flow_imp.id(35169507521106500)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Clear Page Items'
,p_static_id=>'clear-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_RETURN_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35169710584106500)
,p_event_id=>wwv_flow_imp.id(35169507521106500)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'Refresh Return Lines'
,p_static_id=>'refresh-2-smart-filter-change-return-lines'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35166503428106462)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00008
begin
wwv_flow_imp_page.create_page(
 p_id=>8
,p_name=>'Count and Adjustment Control'
,p_alias=>'COUNT-AND-ADJUSTMENT-CONTROL'
,p_step_title=>'Count and Adjustment Control'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35049306859105914)
,p_protection_level=>'C'
,p_page_comment=>'Controllers and reviewers use this page to compare count execution with adjustment activity without switching between separate administration areas.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35107552760106197)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35107643143106197)
,p_name=>'Stock Adjustment Lines'
,p_static_id=>'stock-adjustment-lines'
,p_template=>4073835273271169698
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sal.stock_adjustment_line_id as stock_adjustment_line_id',
'     , sa.adjustment_number as adjustment_number',
'     , sal.line_number as line_number',
'     , it.item_name as item_name',
'     , sl.location_code as location_code',
'     , il.lot_number as lot_number',
'     , sal.from_status_code as from_status_code',
'     , sal.to_status_code as to_status_code',
'     , sal.adjustment_direction_code as adjustment_direction_code',
'     , sal.adjustment_quantity as adjustment_quantity',
'     , sal.reason_description as reason_description',
'from scm_stock_adjustment_lines sal',
'join scm_stock_adjustments sa',
'    on sa.stock_adjustment_id = sal.stock_adjustment_id',
'join scm_items it',
'    on it.item_id = sal.item_id',
'join scm_storage_locations sl',
'    on sl.storage_location_id = sal.storage_location_id',
'left join scm_inventory_lots il',
'    on il.inventory_lot_id = sal.inventory_lot_id',
'order by sa.adjustment_number desc, sal.line_number'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays adjustment lines so reviewers can inspect location, lot, status reclassification, and quantity direction detail for each adjustment.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35107768618106197)
,p_query_column_id=>9
,p_column_alias=>'ADJUSTMENT_DIRECTION_CODE'
,p_column_display_sequence=>90
,p_column_heading=>'Direction'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35107837725106197)
,p_query_column_id=>2
,p_column_alias=>'ADJUSTMENT_NUMBER'
,p_column_display_sequence=>20
,p_column_heading=>'Adjustment Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35107941799106197)
,p_query_column_id=>10
,p_column_alias=>'ADJUSTMENT_QUANTITY'
,p_column_display_sequence=>100
,p_column_heading=>'Adjustment Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35108101685106197)
,p_query_column_id=>7
,p_column_alias=>'FROM_STATUS_CODE'
,p_column_display_sequence=>70
,p_column_heading=>'From Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35108159246106197)
,p_query_column_id=>4
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>40
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35108264838106197)
,p_query_column_id=>3
,p_column_alias=>'LINE_NUMBER'
,p_column_display_sequence=>30
,p_column_heading=>'Line Number'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35108329236106197)
,p_query_column_id=>5
,p_column_alias=>'LOCATION_CODE'
,p_column_display_sequence=>50
,p_column_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35108487842106197)
,p_query_column_id=>6
,p_column_alias=>'LOT_NUMBER'
,p_column_display_sequence=>60
,p_column_heading=>'Lot Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35108511418106197)
,p_query_column_id=>11
,p_column_alias=>'REASON_DESCRIPTION'
,p_column_display_sequence=>110
,p_column_heading=>'Reason Description'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35108660570106197)
,p_query_column_id=>1
,p_column_alias=>'STOCK_ADJUSTMENT_LINE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35108753537106197)
,p_query_column_id=>8
,p_column_alias=>'TO_STATUS_CODE'
,p_column_display_sequence=>80
,p_column_heading=>'To Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35108811746106197)
,p_name=>'Stock Adjustments'
,p_static_id=>'stock-adjustments'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sa.stock_adjustment_id as stock_adjustment_id',
'     , sa.adjustment_number as adjustment_number',
'     , wh.warehouse_name as warehouse_name',
'     , sa.adjustment_type_code as adjustment_type_code',
'     , sa.adjustment_status_code as adjustment_status_code',
'     , sa.reason_code as reason_code',
'     , sa.requested_at as requested_at',
'     , sa.approved_by as approved_by',
'     , sa.approved_at as approved_at',
'     , sa.applied_at as applied_at',
'from scm_stock_adjustments sa',
'join scm_warehouses wh',
'    on wh.warehouse_id = sa.warehouse_id',
'order by sa.requested_at desc, sa.adjustment_number'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays stock adjustment headers so reviewers can open adjustment records and monitor requested, approved, and applied changes, keeping pending or rejected adjustments distinct from applied inventory change.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35108976739106198)
,p_query_column_id=>2
,p_column_alias=>'ADJUSTMENT_NUMBER'
,p_column_display_sequence=>20
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:35:&APP_SESSION.::&DEBUG.::P35_STOCK_ADJUSTMENT_ID:\#STOCK_ADJUSTMENT_ID#\'
,p_column_linktext=>'<span role="img" aria-label="" class="fa fa-edit" title=""></span>'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35109068820106198)
,p_query_column_id=>5
,p_column_alias=>'ADJUSTMENT_STATUS_CODE'
,p_column_display_sequence=>50
,p_column_heading=>'Adjustment Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35109110467106198)
,p_query_column_id=>4
,p_column_alias=>'ADJUSTMENT_TYPE_CODE'
,p_column_display_sequence=>40
,p_column_heading=>'Adjustment Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35109283072106198)
,p_query_column_id=>10
,p_column_alias=>'APPLIED_AT'
,p_column_display_sequence=>100
,p_column_heading=>'Applied At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35109328002106198)
,p_query_column_id=>9
,p_column_alias=>'APPROVED_AT'
,p_column_display_sequence=>90
,p_column_heading=>'Approved At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35109472783106198)
,p_query_column_id=>8
,p_column_alias=>'APPROVED_BY'
,p_column_display_sequence=>80
,p_column_heading=>'Approved By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35109582457106198)
,p_query_column_id=>6
,p_column_alias=>'REASON_CODE'
,p_column_display_sequence=>60
,p_column_heading=>'Reason Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35109676685106198)
,p_query_column_id=>7
,p_column_alias=>'REQUESTED_AT'
,p_column_display_sequence=>70
,p_column_heading=>'Requested At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35109715341106198)
,p_query_column_id=>1
,p_column_alias=>'STOCK_ADJUSTMENT_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35109806138106198)
,p_query_column_id=>3
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35110001299106198)
,p_name=>'Stock Count Lines'
,p_static_id=>'stock-count-lines'
,p_template=>4073835273271169698
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select scl.stock_count_line_id as stock_count_line_id',
'     , sc.count_number as count_number',
'     , scl.line_number as line_number',
'     , it.item_name as item_name',
'     , sl.location_code as location_code',
'     , il.lot_number as lot_number',
'     , scl.expected_quantity as expected_quantity',
'     , scl.counted_quantity as counted_quantity',
'     , scl.variance_reason_code as variance_reason_code',
'     , scl.tolerance_quantity as tolerance_quantity',
'     , scl.tolerance_percent as tolerance_percent',
'     , scl.within_tolerance_flag as within_tolerance_flag',
'     , scl.recount_required as recount_required',
'     , scl.recount_quantity as recount_quantity',
'     , scl.line_status_code as line_status_code',
'     , scl.first_counted_by as first_counted_by',
'     , scl.first_counted_at as first_counted_at',
'     , scl.reviewed_by as reviewed_by',
'     , scl.reviewed_at as reviewed_at',
'     , scl.resolution_code as resolution_code',
'from scm_stock_count_lines scl',
'join scm_stock_counts sc',
'    on sc.stock_count_id = scl.stock_count_id',
'join scm_items it',
'    on it.item_id = scl.item_id',
'join scm_storage_locations sl',
'    on sl.storage_location_id = scl.storage_location_id',
'left join scm_inventory_lots il',
'    on il.inventory_lot_id = scl.inventory_lot_id',
'order by sc.count_number desc, scl.line_number'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays count lines so reviewers can inspect tolerance, recount, and resolution detail for each physical count line.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35110079640106198)
,p_query_column_id=>8
,p_column_alias=>'COUNTED_QUANTITY'
,p_column_display_sequence=>80
,p_column_heading=>'Counted Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35110116078106198)
,p_query_column_id=>2
,p_column_alias=>'COUNT_NUMBER'
,p_column_display_sequence=>20
,p_column_heading=>'Count Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35110238979106198)
,p_query_column_id=>7
,p_column_alias=>'EXPECTED_QUANTITY'
,p_column_display_sequence=>70
,p_column_heading=>'Expected Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35110396304106198)
,p_query_column_id=>17
,p_column_alias=>'FIRST_COUNTED_AT'
,p_column_display_sequence=>170
,p_column_heading=>'First Counted At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35110485397106198)
,p_query_column_id=>16
,p_column_alias=>'FIRST_COUNTED_BY'
,p_column_display_sequence=>160
,p_column_heading=>'First Counted By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35110511518106198)
,p_query_column_id=>4
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>40
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35110692750106198)
,p_query_column_id=>3
,p_column_alias=>'LINE_NUMBER'
,p_column_display_sequence=>30
,p_column_heading=>'Line Number'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35110768769106198)
,p_query_column_id=>15
,p_column_alias=>'LINE_STATUS_CODE'
,p_column_display_sequence=>150
,p_column_heading=>'Line Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35110894092106198)
,p_query_column_id=>5
,p_column_alias=>'LOCATION_CODE'
,p_column_display_sequence=>50
,p_column_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35110987057106198)
,p_query_column_id=>6
,p_column_alias=>'LOT_NUMBER'
,p_column_display_sequence=>60
,p_column_heading=>'Lot Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35111074566106198)
,p_query_column_id=>14
,p_column_alias=>'RECOUNT_QUANTITY'
,p_column_display_sequence=>140
,p_column_heading=>'Recount Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35111203157106198)
,p_query_column_id=>13
,p_column_alias=>'RECOUNT_REQUIRED'
,p_column_display_sequence=>130
,p_column_heading=>'Recount Required'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35111209310106198)
,p_query_column_id=>20
,p_column_alias=>'RESOLUTION_CODE'
,p_column_display_sequence=>200
,p_column_heading=>'Resolution Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35111346611106198)
,p_query_column_id=>19
,p_column_alias=>'REVIEWED_AT'
,p_column_display_sequence=>190
,p_column_heading=>'Reviewed At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35111493442106198)
,p_query_column_id=>18
,p_column_alias=>'REVIEWED_BY'
,p_column_display_sequence=>180
,p_column_heading=>'Reviewed By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35111582611106198)
,p_query_column_id=>1
,p_column_alias=>'STOCK_COUNT_LINE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35111681443106198)
,p_query_column_id=>11
,p_column_alias=>'TOLERANCE_PERCENT'
,p_column_display_sequence=>110
,p_column_heading=>'Tolerance Percent'
,p_column_format=>'FM990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35111722194106198)
,p_query_column_id=>10
,p_column_alias=>'TOLERANCE_QUANTITY'
,p_column_display_sequence=>100
,p_column_heading=>'Tolerance Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35111881243106198)
,p_query_column_id=>9
,p_column_alias=>'VARIANCE_REASON_CODE'
,p_column_display_sequence=>90
,p_column_heading=>'Variance Reason'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35111957758106198)
,p_query_column_id=>12
,p_column_alias=>'WITHIN_TOLERANCE_FLAG'
,p_column_display_sequence=>120
,p_column_heading=>'Within Tolerance'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35112047990106198)
,p_name=>'Stock Counts'
,p_static_id=>'stock-counts'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sc.stock_count_id as stock_count_id',
'     , sc.count_number as count_number',
'     , wh.warehouse_name as warehouse_name',
'     , sc.count_type_code as count_type_code',
'     , sc.count_scope_code as count_scope_code',
'     , sc.count_status_code as count_status_code',
'     , sc.planned_start_at as planned_start_at',
'     , sc.started_at as started_at',
'     , sc.completed_at as completed_at',
'     , sc.requested_by as requested_by',
'     , sc.reviewed_by as reviewed_by',
'from scm_stock_counts sc',
'join scm_warehouses wh',
'    on wh.warehouse_id = sc.warehouse_id',
'order by sc.planned_start_at desc nulls last, sc.count_number'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays stock count headers so controllers can open count records, review schedule timing, and monitor count status.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35112131517106199)
,p_query_column_id=>9
,p_column_alias=>'COMPLETED_AT'
,p_column_display_sequence=>90
,p_column_heading=>'Completed At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35112274132106199)
,p_query_column_id=>2
,p_column_alias=>'COUNT_NUMBER'
,p_column_display_sequence=>20
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:34:&APP_SESSION.::&DEBUG.::P34_STOCK_COUNT_ID:\#STOCK_COUNT_ID#\'
,p_column_linktext=>'<span role="img" aria-label="" class="fa fa-edit" title=""></span>'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35112352188106199)
,p_query_column_id=>5
,p_column_alias=>'COUNT_SCOPE_CODE'
,p_column_display_sequence=>50
,p_column_heading=>'Count Scope'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35112458589106199)
,p_query_column_id=>6
,p_column_alias=>'COUNT_STATUS_CODE'
,p_column_display_sequence=>60
,p_column_heading=>'Count Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35112548254106199)
,p_query_column_id=>4
,p_column_alias=>'COUNT_TYPE_CODE'
,p_column_display_sequence=>40
,p_column_heading=>'Count Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35112679512106199)
,p_query_column_id=>7
,p_column_alias=>'PLANNED_START_AT'
,p_column_display_sequence=>70
,p_column_heading=>'Planned Start At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35112719262106238)
,p_query_column_id=>10
,p_column_alias=>'REQUESTED_BY'
,p_column_display_sequence=>100
,p_column_heading=>'Requested By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35112868127106238)
,p_query_column_id=>11
,p_column_alias=>'REVIEWED_BY'
,p_column_display_sequence=>110
,p_column_heading=>'Reviewed By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35112953380106238)
,p_query_column_id=>8
,p_column_alias=>'STARTED_AT'
,p_column_display_sequence=>80
,p_column_heading=>'Started At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35113009782106238)
,p_query_column_id=>1
,p_column_alias=>'STOCK_COUNT_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35113105509106238)
,p_query_column_id=>3
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35113245897106238)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35108811746106197)
,p_button_name=>'CREATE-ADJUSTMENT'
,p_static_id=>'create-adjustment'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Adjustment'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:35:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35113358833106238)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35112047990106198)
,p_button_name=>'CREATE-COUNT'
,p_static_id=>'create-count'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Count'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:34:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35113476901106238)
,p_name=>'Refresh on dialog close Stock Adjustment Lines'
,p_static_id=>'dialog-refresh-stock-adjustment-lines'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35107643143106197)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35113524187106238)
,p_event_id=>wwv_flow_imp.id(35113476901106238)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35107643143106197)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35113663552106239)
,p_name=>'Refresh on dialog close Stock Adjustments'
,p_static_id=>'dialog-refresh-stock-adjustments'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35108811746106197)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35113779228106239)
,p_event_id=>wwv_flow_imp.id(35113663552106239)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35108811746106197)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35113866585106239)
,p_name=>'Refresh on dialog close Stock Count Lines'
,p_static_id=>'dialog-refresh-stock-count-lines'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35110001299106198)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35113930640106239)
,p_event_id=>wwv_flow_imp.id(35113866585106239)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35110001299106198)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35114101128106239)
,p_name=>'Refresh on dialog close Stock Counts'
,p_static_id=>'dialog-refresh-stock-counts'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35112047990106198)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35114110941106239)
,p_event_id=>wwv_flow_imp.id(35114101128106239)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35112047990106198)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_imp_page.create_page(
 p_id=>9
,p_name=>'Replenishment Control'
,p_alias=>'REPLENISHMENT-CONTROL'
,p_step_title=>'Replenishment Control'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35049737050105914)
,p_protection_level=>'C'
,p_page_comment=>'Inventory controllers, supervisors, and procurement users use this page to compare open alerts with the policy thresholds that drive replenishment decisions.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35143266109106371)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35143389548106371)
,p_name=>'Policy Threshold Review'
,p_static_id=>'policy-threshold-review'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select iwp.item_warehouse_policy_id as item_warehouse_policy_id',
'     , wh.warehouse_name as warehouse_name',
'     , it.item_name as item_name',
'     , iwp.rotation_method_code as rotation_method_code',
'     , iwp.minimum_stock_quantity as minimum_stock_quantity',
'     , iwp.reorder_point_quantity as reorder_point_quantity',
'     , iwp.reorder_target_quantity as reorder_target_quantity',
'     , iwp.maximum_stock_quantity as maximum_stock_quantity',
'     , iwp.count_tolerance_quantity as count_tolerance_quantity',
'     , iwp.cycle_count_class_code as cycle_count_class_code',
'     , wa.area_name as preferred_pick_area_name',
'     , iwp.quarantine_on_receipt_flag as quarantine_on_receipt_flag',
'     , iwp.low_stock_alert_enabled_flag as low_stock_alert_enabled_flag',
'     , iwp.is_active as is_active',
'from scm_item_warehouse_policies iwp',
'join scm_warehouses wh',
'    on wh.warehouse_id = iwp.warehouse_id',
'join scm_items it',
'    on it.item_id = iwp.item_id',
'left join scm_warehouse_areas wa',
'    on wa.warehouse_area_id = iwp.preferred_pick_area_id',
'order by wh.warehouse_name, it.item_name'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Shows item warehouse policies with their reorder thresholds so replenishment reviewers can compare alert behavior to policy settings.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35143457047106371)
,p_query_column_id=>9
,p_column_alias=>'COUNT_TOLERANCE_QUANTITY'
,p_column_display_sequence=>90
,p_column_heading=>'Count Tolerance Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35143518199106371)
,p_query_column_id=>10
,p_column_alias=>'CYCLE_COUNT_CLASS_CODE'
,p_column_display_sequence=>100
,p_column_heading=>'Cycle Count Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35143646246106371)
,p_query_column_id=>14
,p_column_alias=>'IS_ACTIVE'
,p_column_display_sequence=>140
,p_column_heading=>'Is Active'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35143718182106371)
,p_query_column_id=>3
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35143854261106371)
,p_query_column_id=>1
,p_column_alias=>'ITEM_WAREHOUSE_POLICY_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35143948159106371)
,p_query_column_id=>13
,p_column_alias=>'LOW_STOCK_ALERT_ENABLED_FLAG'
,p_column_display_sequence=>130
,p_column_heading=>'Low Stock Alert Enabled'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35144058841106371)
,p_query_column_id=>8
,p_column_alias=>'MAXIMUM_STOCK_QUANTITY'
,p_column_display_sequence=>80
,p_column_heading=>'Maximum Stock Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35144196478106372)
,p_query_column_id=>5
,p_column_alias=>'MINIMUM_STOCK_QUANTITY'
,p_column_display_sequence=>50
,p_column_heading=>'Minimum Stock Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35144210703106372)
,p_query_column_id=>11
,p_column_alias=>'PREFERRED_PICK_AREA_NAME'
,p_column_display_sequence=>110
,p_column_heading=>'Preferred Pick Area'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35144368744106372)
,p_query_column_id=>12
,p_column_alias=>'QUARANTINE_ON_RECEIPT_FLAG'
,p_column_display_sequence=>120
,p_column_heading=>'Quarantine On Receipt'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35144484742106372)
,p_query_column_id=>6
,p_column_alias=>'REORDER_POINT_QUANTITY'
,p_column_display_sequence=>60
,p_column_heading=>'Reorder Point Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35144512339106372)
,p_query_column_id=>7
,p_column_alias=>'REORDER_TARGET_QUANTITY'
,p_column_display_sequence=>70
,p_column_heading=>'Reorder Target Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35144692342106372)
,p_query_column_id=>4
,p_column_alias=>'ROTATION_METHOD_CODE'
,p_column_display_sequence=>40
,p_column_heading=>'Rotation Method'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35144777005106372)
,p_query_column_id=>2
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35144889895106372)
,p_name=>'Replenishment Alerts'
,p_static_id=>'replenishment-alerts'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ra.replenishment_alert_id as replenishment_alert_id',
'     , ra.alert_number as alert_number',
'     , wh.warehouse_name as warehouse_name',
'     , it.item_name as item_name',
'     , iwp.item_warehouse_policy_id as item_warehouse_policy_id',
'     , pl.location_code as pick_location_code',
'     , rl.location_code as reserve_location_code',
'     , ra.alert_type_code as alert_type_code',
'     , ra.alert_status_code as alert_status_code',
'     , ra.priority_code as priority_code',
'     , ra.available_quantity as available_quantity',
'     , ra.trigger_quantity as trigger_quantity',
'     , ra.target_quantity as target_quantity',
'     , ra.recommended_replenishment_quantity as recommended_replenishment_quantity',
'     , ra.raised_at as raised_at',
'     , ra.reviewed_at as reviewed_at',
'     , au.full_name as reviewed_by_name',
'     , ra.alert_notes as alert_notes',
'from scm_replenishment_alerts ra',
'join scm_warehouses wh',
'    on wh.warehouse_id = ra.warehouse_id',
'join scm_items it',
'    on it.item_id = ra.item_id',
'left join scm_item_warehouse_policies iwp',
'    on iwp.item_warehouse_policy_id = ra.item_warehouse_policy_id',
'left join scm_storage_locations pl',
'    on pl.storage_location_id = ra.pick_location_id',
'left join scm_storage_locations rl',
'    on rl.storage_location_id = ra.reserve_location_id',
'left join scm_application_users au',
'    on au.application_user_id = ra.reviewed_by_user_id',
'order by ra.raised_at desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays replenishment alerts with item, warehouse, location, policy, and review context so users can review what needs attention first.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35144917379106372)
,p_query_column_id=>18
,p_column_alias=>'ALERT_NOTES'
,p_column_display_sequence=>180
,p_column_heading=>'Alert Notes'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35145080003106372)
,p_query_column_id=>2
,p_column_alias=>'ALERT_NUMBER'
,p_column_display_sequence=>20
,p_column_heading=>'Alert Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35145125535106372)
,p_query_column_id=>9
,p_column_alias=>'ALERT_STATUS_CODE'
,p_column_display_sequence=>90
,p_column_heading=>'Alert Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35145302744106372)
,p_query_column_id=>8
,p_column_alias=>'ALERT_TYPE_CODE'
,p_column_display_sequence=>80
,p_column_heading=>'Alert Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35145333994106372)
,p_query_column_id=>11
,p_column_alias=>'AVAILABLE_QUANTITY'
,p_column_display_sequence=>110
,p_column_heading=>'Available Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35145452365106372)
,p_query_column_id=>4
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>40
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35145563535106372)
,p_query_column_id=>5
,p_column_alias=>'ITEM_WAREHOUSE_POLICY_ID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35145672904106372)
,p_query_column_id=>6
,p_column_alias=>'PICK_LOCATION_CODE'
,p_column_display_sequence=>60
,p_column_heading=>'Pick Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35145746766106372)
,p_query_column_id=>10
,p_column_alias=>'PRIORITY_CODE'
,p_column_display_sequence=>100
,p_column_heading=>'Priority'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35145878930106372)
,p_query_column_id=>15
,p_column_alias=>'RAISED_AT'
,p_column_display_sequence=>150
,p_column_heading=>'Raised At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35145970305106372)
,p_query_column_id=>14
,p_column_alias=>'RECOMMENDED_REPLENISHMENT_QUANTITY'
,p_column_display_sequence=>140
,p_column_heading=>'Recommended Replenishment Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35146052191106372)
,p_query_column_id=>1
,p_column_alias=>'REPLENISHMENT_ALERT_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35146166499106372)
,p_query_column_id=>7
,p_column_alias=>'RESERVE_LOCATION_CODE'
,p_column_display_sequence=>70
,p_column_heading=>'Reserve Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35146287996106372)
,p_query_column_id=>16
,p_column_alias=>'REVIEWED_AT'
,p_column_display_sequence=>160
,p_column_heading=>'Reviewed At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35146309220106372)
,p_query_column_id=>17
,p_column_alias=>'REVIEWED_BY_NAME'
,p_column_display_sequence=>170
,p_column_heading=>'Reviewed By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35146438713106372)
,p_query_column_id=>13
,p_column_alias=>'TARGET_QUANTITY'
,p_column_display_sequence=>130
,p_column_heading=>'Target Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35146588259106372)
,p_query_column_id=>12
,p_column_alias=>'TRIGGER_QUANTITY'
,p_column_display_sequence=>120
,p_column_heading=>'Trigger Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35146669988106372)
,p_query_column_id=>3
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35146774913106372)
,p_name=>'Refresh on dialog close Policy Threshold Review'
,p_static_id=>'dialog-refresh-policy-threshold-review'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35143389548106371)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35146892873106372)
,p_event_id=>wwv_flow_imp.id(35146774913106372)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35143389548106371)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35146927417106372)
,p_name=>'Refresh on dialog close Replenishment Alerts'
,p_static_id=>'dialog-refresh-replenishment-alerts'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35144889895106372)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35147100311106372)
,p_event_id=>wwv_flow_imp.id(35146927417106372)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35144889895106372)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_imp_page.create_page(
 p_id=>10
,p_name=>'Warehouse Structure'
,p_alias=>'WAREHOUSE-STRUCTURE'
,p_step_title=>'Warehouse Structure'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35049639390105914)
,p_protection_level=>'C'
,p_page_comment=>'Master-data stewards and warehouse leaders use this page to compare warehouse headers with the warehouse areas and active storage geography underneath each warehouse.'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35076682613106062)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35076735231106062)
,p_plug_name=>'Warehouses'
,p_static_id=>'filter-warehouses'
,p_region_name=>'filter-warehouses'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(35076832384106062)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maximum_suggestion_chips', '0',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
,p_plug_comment=>'Added by generator'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35076932399106062)
,p_name=>'P10_SEARCH'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(35076735231106062)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35077044655106062)
,p_name=>'Storage Locations'
,p_static_id=>'storage-locations'
,p_template=>4073835273271169698
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_display_column=>5
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sl.storage_location_id as storage_location_id',
'     , wa.area_name as area_name',
'     , sl.location_code as location_code',
'     , nvl(sl.location_name, sl.location_code) as location_name',
'     , sl.location_type_code as location_type_code',
'     , sl.location_status_code as location_status_code',
'     , pl.location_code as parent_location_code',
'     , sl.aisle_code as aisle_code',
'     , sl.bay_code as bay_code',
'     , sl.level_code as level_code',
'     , sl.position_code as position_code',
'     , sl.max_capacity_units as max_capacity_units',
'     , sl.pick_sequence_number as pick_sequence_number',
'     , sl.putaway_sequence_number as putaway_sequence_number',
'     , sl.map_x_coordinate as map_x_coordinate',
'     , sl.map_y_coordinate as map_y_coordinate',
'     , sl.approved_for_high_value_flag as approved_for_high_value_flag',
'     , sl.approved_for_sensitive_goods_flag as approved_for_sensitive_goods_flag',
'     , sl.approved_for_restricted_goods_flag as approved_for_restricted_goods_flag',
'     , sl.is_pickable as is_pickable',
'     , sl.is_active as is_active',
'from scm_storage_locations sl',
'join scm_warehouse_areas wa',
'    on wa.warehouse_area_id = sl.warehouse_area_id',
'left join scm_storage_locations pl',
'    on pl.storage_location_id = sl.parent_location_id',
'where sl.warehouse_id = cast(:P10_WAREHOUSE_ID as number)',
'order by wa.area_name, sl.location_code'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P10_WAREHOUSE_ID'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Shows the storage locations that belong to the selected warehouse so users can review hierarchy, navigation coordinates, operating status, and capacity, with inactive or blocked locations kept distinct from normal operating capacity and special-handl'
||'ing approvals used to control high-value, sensitive, and restricted stock placement.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35077118873106062)
,p_query_column_id=>8
,p_column_alias=>'AISLE_CODE'
,p_column_display_sequence=>80
,p_column_heading=>'Aisle'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35077212134106062)
,p_query_column_id=>17
,p_column_alias=>'APPROVED_FOR_HIGH_VALUE_FLAG'
,p_column_display_sequence=>170
,p_column_heading=>'High Value Approved'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35077362400106062)
,p_query_column_id=>19
,p_column_alias=>'APPROVED_FOR_RESTRICTED_GOODS_FLAG'
,p_column_display_sequence=>190
,p_column_heading=>'Restricted Goods Approved'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35077496983106062)
,p_query_column_id=>18
,p_column_alias=>'APPROVED_FOR_SENSITIVE_GOODS_FLAG'
,p_column_display_sequence=>180
,p_column_heading=>'Sensitive Goods Approved'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35077532337106062)
,p_query_column_id=>2
,p_column_alias=>'AREA_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Area'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35077661479106063)
,p_query_column_id=>9
,p_column_alias=>'BAY_CODE'
,p_column_display_sequence=>90
,p_column_heading=>'Bay'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35077773000106063)
,p_query_column_id=>21
,p_column_alias=>'IS_ACTIVE'
,p_column_display_sequence=>210
,p_column_heading=>'Is Active'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35077834423106063)
,p_query_column_id=>20
,p_column_alias=>'IS_PICKABLE'
,p_column_display_sequence=>200
,p_column_heading=>'Is Pickable'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35077947181106063)
,p_query_column_id=>10
,p_column_alias=>'LEVEL_CODE'
,p_column_display_sequence=>100
,p_column_heading=>'Level'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35078059652106063)
,p_query_column_id=>3
,p_column_alias=>'LOCATION_CODE'
,p_column_display_sequence=>30
,p_column_heading=>'Location Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35078113361106063)
,p_query_column_id=>4
,p_column_alias=>'LOCATION_NAME'
,p_column_display_sequence=>40
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:46:&APP_SESSION.::&DEBUG.::P46_STORAGE_LOCATION_ID:\#STORAGE_LOCATION_ID#\'
,p_column_linktext=>'<span role="img" aria-label="" class="fa fa-edit" title=""></span>'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35078296582106063)
,p_query_column_id=>6
,p_column_alias=>'LOCATION_STATUS_CODE'
,p_column_display_sequence=>60
,p_column_heading=>'Location Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35078395841106063)
,p_query_column_id=>5
,p_column_alias=>'LOCATION_TYPE_CODE'
,p_column_display_sequence=>50
,p_column_heading=>'Location Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35078428655106063)
,p_query_column_id=>15
,p_column_alias=>'MAP_X_COORDINATE'
,p_column_display_sequence=>150
,p_column_heading=>'Map X'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35078504687106063)
,p_query_column_id=>16
,p_column_alias=>'MAP_Y_COORDINATE'
,p_column_display_sequence=>160
,p_column_heading=>'Map Y'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35078684470106063)
,p_query_column_id=>12
,p_column_alias=>'MAX_CAPACITY_UNITS'
,p_column_display_sequence=>120
,p_column_heading=>'Maximum Capacity Units'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35078778469106063)
,p_query_column_id=>7
,p_column_alias=>'PARENT_LOCATION_CODE'
,p_column_display_sequence=>70
,p_column_heading=>'Parent Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35078837544106063)
,p_query_column_id=>13
,p_column_alias=>'PICK_SEQUENCE_NUMBER'
,p_column_display_sequence=>130
,p_column_heading=>'Pick Sequence'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35078991056106063)
,p_query_column_id=>11
,p_column_alias=>'POSITION_CODE'
,p_column_display_sequence=>110
,p_column_heading=>'Position'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35079056842106063)
,p_query_column_id=>14
,p_column_alias=>'PUTAWAY_SEQUENCE_NUMBER'
,p_column_display_sequence=>140
,p_column_heading=>'Putaway Sequence'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35079181529106063)
,p_query_column_id=>1
,p_column_alias=>'STORAGE_LOCATION_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35079297665106063)
,p_name=>'Warehouse Areas'
,p_static_id=>'warehouse-areas'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_new_grid_row=>false
,p_display_column=>5
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select wa.warehouse_area_id as warehouse_area_id',
'     , wa.area_name as area_name',
'     , wa.area_code as area_code',
'     , wa.area_type_code as area_type_code',
'     , wa.area_status_code as area_status_code',
'     , wa.sequence_number as sequence_number',
'     , wa.allows_mixed_items as allows_mixed_items',
'     , wa.allows_damaged_stock as allows_damaged_stock',
'     , wa.approved_for_high_value_flag as approved_for_high_value_flag',
'     , wa.approved_for_sensitive_goods_flag as approved_for_sensitive_goods_flag',
'     , wa.approved_for_restricted_goods_flag as approved_for_restricted_goods_flag',
'from scm_warehouse_areas wa',
'where wa.warehouse_id = cast(:P10_WAREHOUSE_ID as number)',
'order by wa.sequence_number, wa.area_name'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P10_WAREHOUSE_ID'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Shows the warehouse areas that belong to the selected warehouse so users can review sequence, mixed-item handling, and special-stock approval flags, with inactive areas kept distinct from normal operating capacity.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35079364287106063)
,p_query_column_id=>8
,p_column_alias=>'ALLOWS_DAMAGED_STOCK'
,p_column_display_sequence=>80
,p_column_heading=>'Allows Damaged Stock'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35079425909106063)
,p_query_column_id=>7
,p_column_alias=>'ALLOWS_MIXED_ITEMS'
,p_column_display_sequence=>70
,p_column_heading=>'Allows Mixed Items'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35079530645106063)
,p_query_column_id=>9
,p_column_alias=>'APPROVED_FOR_HIGH_VALUE_FLAG'
,p_column_display_sequence=>90
,p_column_heading=>'High Value Approved'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35079606750106063)
,p_query_column_id=>11
,p_column_alias=>'APPROVED_FOR_RESTRICTED_GOODS_FLAG'
,p_column_display_sequence=>110
,p_column_heading=>'Restricted Goods Approved'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35079714188106063)
,p_query_column_id=>10
,p_column_alias=>'APPROVED_FOR_SENSITIVE_GOODS_FLAG'
,p_column_display_sequence=>100
,p_column_heading=>'Sensitive Goods Approved'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35079846268106063)
,p_query_column_id=>3
,p_column_alias=>'AREA_CODE'
,p_column_display_sequence=>30
,p_column_heading=>'Area Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35079912106106063)
,p_query_column_id=>2
,p_column_alias=>'AREA_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:45:&APP_SESSION.::&DEBUG.::P45_WAREHOUSE_AREA_ID:\#WAREHOUSE_AREA_ID#\'
,p_column_linktext=>'<span role="img" aria-label="" class="fa fa-edit" title=""></span>'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35080084108106063)
,p_query_column_id=>5
,p_column_alias=>'AREA_STATUS_CODE'
,p_column_display_sequence=>50
,p_column_heading=>'Area Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35080174010106063)
,p_query_column_id=>4
,p_column_alias=>'AREA_TYPE_CODE'
,p_column_display_sequence=>40
,p_column_heading=>'Area Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35080276334106063)
,p_query_column_id=>6
,p_column_alias=>'SEQUENCE_NUMBER'
,p_column_display_sequence=>60
,p_column_heading=>'Sequence Number'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35080371694106063)
,p_query_column_id=>1
,p_column_alias=>'WAREHOUSE_AREA_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35076832384106062)
,p_plug_name=>'Warehouses'
,p_static_id=>'warehouses'
,p_parent_plug_id=>wwv_flow_imp.id(35076735231106062)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noUI:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select wh.warehouse_id as warehouse_id',
'     , wh.warehouse_status_code as warehouse_status_code',
'     , wh.warehouse_name as warehouse_name',
'     , wh.warehouse_code as warehouse_code',
'     , wh.city_name as city_name',
'     , wh.warehouse_type_code as warehouse_type_code',
'from scm_warehouses wh'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'DESCRIPTION', 'Warehouse Code: &WAREHOUSE_CODE.',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'N',
  'HIDE_BORDERS', 'N',
  'MISC', 'City: &CITY_NAME.<br/>Warehouse Type: &WAREHOUSE_TYPE_CODE.',
  'OVERLINE', '&WAREHOUSE_STATUS_CODE.',
  'REMOVE_PADDING', 'N',
  'STACK_MOBILE', 'N',
  'TITLE', '&WAREHOUSE_NAME.')).to_clob
,p_plug_comment=>'Presents warehouse headers as selectable work items so users can focus the location panel on one warehouse at a time.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35080405647106063)
,p_name=>'CITY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CITY_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35080564764106063)
,p_name=>'WAREHOUSE_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAREHOUSE_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35080684371106063)
,p_name=>'WAREHOUSE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAREHOUSE_ID'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35080754161106063)
,p_name=>'WAREHOUSE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAREHOUSE_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35080826706106064)
,p_name=>'WAREHOUSE_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAREHOUSE_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35080918526106064)
,p_name=>'WAREHOUSE_TYPE_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAREHOUSE_TYPE_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>60
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35081096388106064)
,p_region_id=>wwv_flow_imp.id(35076832384106062)
,p_position_id=>350878614853473162
,p_display_sequence=>5
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35081196816106064)
,p_region_id=>wwv_flow_imp.id(35076832384106062)
,p_position_id=>350878614853473162
,p_display_sequence=>10
,p_static_id=>'action-fullrowlink-1'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.::P10_WAREHOUSE_ID:\&WAREHOUSE_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35049639390105914)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35081252470106064)
,p_region_id=>wwv_flow_imp.id(35076832384106062)
,p_position_id=>363792341120765662
,p_display_sequence=>20
,p_template_id=>363794202317800939
,p_label=>'Show actions'
,p_static_id=>'action-menu'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_action_css_classes=>'t-Button--noUI'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(35081311686106064)
,p_component_action_id=>wwv_flow_imp.id(35081252470106064)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit'
,p_static_id=>'menu-entry-edit'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:36:&APP_SESSION.::&DEBUG.::P36_WAREHOUSE_ID:\&WAREHOUSE_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35049639390105914)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35081508041106064)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35077044655106062)
,p_button_name=>'CREATE-STORAGE-LOCATION'
,p_static_id=>'create-storage-location'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Storage Location'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:46:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35081609980106064)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35076832384106062)
,p_button_name=>'CREATE-WAREHOUSE'
,p_static_id=>'create-warehouse'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Warehouse'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:36:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35081786106106064)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35079297665106063)
,p_button_name=>'CREATE-WAREHOUSE-AREA'
,p_static_id=>'create-warehouse-area'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Warehouse Area'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:45:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35081409296106064)
,p_name=>'P10_WAREHOUSE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35076832384106062)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35081834173106064)
,p_name=>'After Create Dialog Closed'
,p_static_id=>'dialog-closed-create-parent'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35081609980106064)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35081951811106064)
,p_event_id=>wwv_flow_imp.id(35081834173106064)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P10_WAREHOUSE_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P36_WAREHOUSE_ID',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35082047348106064)
,p_event_id=>wwv_flow_imp.id(35081834173106064)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh ParentRegion'
,p_static_id=>'refresh-parent-region'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35076832384106062)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35082121532106064)
,p_event_id=>wwv_flow_imp.id(35081834173106064)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Select parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P10_WAREHOUSE_ID'') + '']'').click();',
    '                }, 2000);',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35082207718106064)
,p_name=>'Parent Action Dialog Closed'
,p_static_id=>'dialog-closed-parent-action'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35076832384106062)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35082335081106064)
,p_event_id=>wwv_flow_imp.id(35082207718106064)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Warehouse Areas'
,p_static_id=>'refresh-2-dialog-closed-parent-action-warehouse-areas'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35079297665106063)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35082461170106064)
,p_event_id=>wwv_flow_imp.id(35082207718106064)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Storage Locations'
,p_static_id=>'refresh-3-dialog-closed-parent-action-storage-locations'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35077044655106062)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35082505772106064)
,p_event_id=>wwv_flow_imp.id(35082207718106064)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Parent Region'
,p_static_id=>'refresh-parent-region-action'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35076832384106062)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35082655728106064)
,p_event_id=>wwv_flow_imp.id(35082207718106064)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'N'
,p_name=>'Select Parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                if ($v(''P10_WAREHOUSE_ID'') !== '''') {',
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P10_WAREHOUSE_ID'') + '']'').click();',
    '                }, 2000);',
    '                }',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35082755524106064)
,p_name=>'Refresh on dialog close Storage Locations'
,p_static_id=>'dialog-refresh-storage-locations'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35077044655106062)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35082884159106064)
,p_event_id=>wwv_flow_imp.id(35082755524106064)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35077044655106062)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35082913178106064)
,p_name=>'Refresh on dialog close Warehouse Areas'
,p_static_id=>'dialog-refresh-warehouse-areas'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35079297665106063)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35083011503106064)
,p_event_id=>wwv_flow_imp.id(35082913178106064)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35079297665106063)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35083148643106064)
,p_name=>'Parent Row Selected'
,p_static_id=>'parent-row-selected'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.t-ContentRow-item'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#filter-warehouses'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35083224098106064)
,p_event_id=>wwv_flow_imp.id(35083148643106064)
,p_event_result=>'TRUE'
,p_action_sequence=>7
,p_execute_on_page_init=>'N'
,p_static_id=>'native-add-class'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35083316039106064)
,p_event_id=>wwv_flow_imp.id(35083148643106064)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-remove-class'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'JAVASCRIPT_EXPRESSION'
,p_affected_elements=>'$(''.t-ContentRow-item'')'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35083436668106064)
,p_event_id=>wwv_flow_imp.id(35083148643106064)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Warehouse Areas'
,p_static_id=>'refresh-2-parent-row-selected-warehouse-areas'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35079297665106063)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35083572010106065)
,p_event_id=>wwv_flow_imp.id(35083148643106064)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Storage Locations'
,p_static_id=>'refresh-3-parent-row-selected-storage-locations'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35077044655106062)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35083685291106065)
,p_event_id=>wwv_flow_imp.id(35083148643106064)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'set-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P10_WAREHOUSE_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_expression', 'this.triggeringElement.getAttribute(''data-id'')',
  'suppress_change_event', 'N',
  'type', 'JAVASCRIPT_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35083741882106065)
,p_name=>'Smart Filter Change'
,p_static_id=>'smart-filter-change'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35076735231106062)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_SMART_FILTERS|REGION TYPE|facetschange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35083900884106065)
,p_event_id=>wwv_flow_imp.id(35083741882106065)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Clear Page Items'
,p_static_id=>'clear-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P10_WAREHOUSE_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35083957833106065)
,p_event_id=>wwv_flow_imp.id(35083741882106065)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'Refresh Warehouse Areas'
,p_static_id=>'refresh-2-smart-filter-change-warehouse-areas'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35079297665106063)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35084030370106065)
,p_event_id=>wwv_flow_imp.id(35083741882106065)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'Refresh Storage Locations'
,p_static_id=>'refresh-3-smart-filter-change-storage-locations'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35077044655106062)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_imp_page.create_page(
 p_id=>11
,p_name=>'Item Master'
,p_alias=>'ITEM-MASTER'
,p_step_title=>'Item Master'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35049639390105914)
,p_protection_level=>'C'
,p_page_comment=>'Master-data stewards and inventory controllers use this page to compare item header information with warehouse-specific handling and replenishment policy.'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35116460353106241)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35116555136106241)
,p_plug_name=>'Items'
,p_static_id=>'filter-items'
,p_region_name=>'filter-items'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(35116636170106241)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maximum_suggestion_chips', '0',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
,p_plug_comment=>'Added by generator'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35116739085106241)
,p_name=>'P11_SEARCH'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(35116555136106241)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35116817049106241)
,p_name=>'Item Warehouse Policies'
,p_static_id=>'item-warehouse-policies'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_new_grid_row=>false
,p_display_column=>5
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select iwp.item_warehouse_policy_id as item_warehouse_policy_id',
'     , wh.warehouse_name as warehouse_name',
'     , iwp.rotation_method_code as rotation_method_code',
'     , iwp.minimum_stock_quantity as minimum_stock_quantity',
'     , iwp.reorder_point_quantity as reorder_point_quantity',
'     , iwp.reorder_target_quantity as reorder_target_quantity',
'     , iwp.maximum_stock_quantity as maximum_stock_quantity',
'     , iwp.count_tolerance_quantity as count_tolerance_quantity',
'     , iwp.count_tolerance_percent as count_tolerance_percent',
'     , iwp.cycle_count_class_code as cycle_count_class_code',
'     , wa.area_name as preferred_area_name',
'     , iwp.quarantine_on_receipt_flag as quarantine_on_receipt_flag',
'     , iwp.low_stock_alert_enabled_flag as low_stock_alert_enabled_flag',
'     , iwp.is_active as is_active',
'from scm_item_warehouse_policies iwp',
'join scm_warehouses wh',
'    on wh.warehouse_id = iwp.warehouse_id',
'left join scm_warehouse_areas wa',
'    on wa.warehouse_area_id = iwp.preferred_pick_area_id',
'where iwp.item_id = cast(:P11_ITEM_ID as number)',
'order by wh.warehouse_name'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P11_ITEM_ID'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Shows the selected item''s warehouse policies so users can review rotation, replenishment, count, and quarantine settings by warehouse, including FEFO or FIFO rules that drive normal fulfilment unless an approved rotation exception is recorded.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35116990286106241)
,p_query_column_id=>9
,p_column_alias=>'COUNT_TOLERANCE_PERCENT'
,p_column_display_sequence=>90
,p_column_heading=>'Count Tolerance Percent'
,p_column_format=>'FM990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35117090318106241)
,p_query_column_id=>8
,p_column_alias=>'COUNT_TOLERANCE_QUANTITY'
,p_column_display_sequence=>80
,p_column_heading=>'Count Tolerance Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35117176932106241)
,p_query_column_id=>10
,p_column_alias=>'CYCLE_COUNT_CLASS_CODE'
,p_column_display_sequence=>100
,p_column_heading=>'Cycle Count Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35117297942106241)
,p_query_column_id=>14
,p_column_alias=>'IS_ACTIVE'
,p_column_display_sequence=>140
,p_column_heading=>'Is Active'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35117337147106241)
,p_query_column_id=>1
,p_column_alias=>'ITEM_WAREHOUSE_POLICY_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35117491840106242)
,p_query_column_id=>13
,p_column_alias=>'LOW_STOCK_ALERT_ENABLED_FLAG'
,p_column_display_sequence=>130
,p_column_heading=>'Low Stock Alert Enabled'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35117559987106242)
,p_query_column_id=>7
,p_column_alias=>'MAXIMUM_STOCK_QUANTITY'
,p_column_display_sequence=>70
,p_column_heading=>'Maximum Stock Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35117699331106242)
,p_query_column_id=>4
,p_column_alias=>'MINIMUM_STOCK_QUANTITY'
,p_column_display_sequence=>40
,p_column_heading=>'Minimum Stock Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35117709213106242)
,p_query_column_id=>11
,p_column_alias=>'PREFERRED_AREA_NAME'
,p_column_display_sequence=>110
,p_column_heading=>'Preferred Pick Area'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35117900120106242)
,p_query_column_id=>12
,p_column_alias=>'QUARANTINE_ON_RECEIPT_FLAG'
,p_column_display_sequence=>120
,p_column_heading=>'Quarantine On Receipt'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35117979216106242)
,p_query_column_id=>5
,p_column_alias=>'REORDER_POINT_QUANTITY'
,p_column_display_sequence=>50
,p_column_heading=>'Reorder Point Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35118069100106242)
,p_query_column_id=>6
,p_column_alias=>'REORDER_TARGET_QUANTITY'
,p_column_display_sequence=>60
,p_column_heading=>'Reorder Target Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35118198923106242)
,p_query_column_id=>3
,p_column_alias=>'ROTATION_METHOD_CODE'
,p_column_display_sequence=>30
,p_column_heading=>'Rotation Method'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35118225479106242)
,p_query_column_id=>2
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35116636170106241)
,p_plug_name=>'Items'
,p_static_id=>'items'
,p_parent_plug_id=>wwv_flow_imp.id(35116555136106241)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noUI:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select it.item_id as item_id',
'     , it.item_status_code as item_status_code',
'     , it.item_name as item_name',
'     , it.item_code as item_code',
'     , it.item_category_code as item_category_code',
'     , it.base_uom_code as base_uom_code',
'from scm_items it'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'DESCRIPTION', 'Item Code: &ITEM_CODE.',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'N',
  'HIDE_BORDERS', 'N',
  'MISC', 'Item Category: &ITEM_CATEGORY_CODE.<br/>Base UOM: &BASE_UOM_CODE.',
  'OVERLINE', '&ITEM_STATUS_CODE.',
  'REMOVE_PADDING', 'N',
  'STACK_MOBILE', 'N',
  'TITLE', '&ITEM_NAME.')).to_clob
,p_plug_comment=>'Presents items as selectable work items so users can focus the policy panel on one item at a time.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35118400248106242)
,p_name=>'BASE_UOM_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BASE_UOM_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>60
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35118466932106242)
,p_name=>'ITEM_CATEGORY_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEM_CATEGORY_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35118541211106242)
,p_name=>'ITEM_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEM_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35118649032106242)
,p_name=>'ITEM_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEM_ID'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35118796826106242)
,p_name=>'ITEM_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEM_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35118865110106242)
,p_name=>'ITEM_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEM_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35118952858106242)
,p_region_id=>wwv_flow_imp.id(35116636170106241)
,p_position_id=>350878614853473162
,p_display_sequence=>5
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35119015344106242)
,p_region_id=>wwv_flow_imp.id(35116636170106241)
,p_position_id=>350878614853473162
,p_display_sequence=>10
,p_static_id=>'action-fullrowlink-1'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:11:&APP_SESSION.::&DEBUG.::P11_ITEM_ID:\&ITEM_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35049639390105914)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35119120117106242)
,p_region_id=>wwv_flow_imp.id(35116636170106241)
,p_position_id=>363792341120765662
,p_display_sequence=>20
,p_template_id=>363794202317800939
,p_label=>'Show actions'
,p_static_id=>'action-menu'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_action_css_classes=>'t-Button--noUI'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(35119280288106242)
,p_component_action_id=>wwv_flow_imp.id(35119120117106242)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit'
,p_static_id=>'menu-entry-edit'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:37:&APP_SESSION.::&DEBUG.::P37_ITEM_ID:\&ITEM_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35049639390105914)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35119453938106242)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35116636170106241)
,p_button_name=>'CREATE-ITEM'
,p_static_id=>'create-item'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Item'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:37:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35119382294106242)
,p_name=>'P11_ITEM_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35116636170106241)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35119504485106242)
,p_name=>'After Create Dialog Closed'
,p_static_id=>'dialog-closed-create-parent'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35119453938106242)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35119701193106242)
,p_event_id=>wwv_flow_imp.id(35119504485106242)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ITEM_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P37_ITEM_ID',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35119708844106242)
,p_event_id=>wwv_flow_imp.id(35119504485106242)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh ParentRegion'
,p_static_id=>'refresh-parent-region'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35116636170106241)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35119842871106243)
,p_event_id=>wwv_flow_imp.id(35119504485106242)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Select parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P11_ITEM_ID'') + '']'').click();',
    '                }, 2000);',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35119968474106243)
,p_name=>'Parent Action Dialog Closed'
,p_static_id=>'dialog-closed-parent-action'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35116636170106241)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35120034909106243)
,p_event_id=>wwv_flow_imp.id(35119968474106243)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Item Warehouse Policies'
,p_static_id=>'refresh-2-dialog-closed-parent-action-item-warehouse-policies'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35116817049106241)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35120148878106243)
,p_event_id=>wwv_flow_imp.id(35119968474106243)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Parent Region'
,p_static_id=>'refresh-parent-region-action'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35116636170106241)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35120249581106243)
,p_event_id=>wwv_flow_imp.id(35119968474106243)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'N'
,p_name=>'Select Parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                if ($v(''P11_ITEM_ID'') !== '''') {',
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P11_ITEM_ID'') + '']'').click();',
    '                }, 2000);',
    '                }',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35120397763106243)
,p_name=>'Refresh on dialog close Item Warehouse Policies'
,p_static_id=>'dialog-refresh-item-warehouse-policies'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35116817049106241)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35120493724106243)
,p_event_id=>wwv_flow_imp.id(35120397763106243)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35116817049106241)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35120503547106243)
,p_name=>'Parent Row Selected'
,p_static_id=>'parent-row-selected'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.t-ContentRow-item'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#filter-items'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35120635088106243)
,p_event_id=>wwv_flow_imp.id(35120503547106243)
,p_event_result=>'TRUE'
,p_action_sequence=>7
,p_execute_on_page_init=>'N'
,p_static_id=>'native-add-class'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35120780828106243)
,p_event_id=>wwv_flow_imp.id(35120503547106243)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-remove-class'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'JAVASCRIPT_EXPRESSION'
,p_affected_elements=>'$(''.t-ContentRow-item'')'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35120817861106243)
,p_event_id=>wwv_flow_imp.id(35120503547106243)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Item Warehouse Policies'
,p_static_id=>'refresh-2-parent-row-selected-item-warehouse-policies'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35116817049106241)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35120974554106243)
,p_event_id=>wwv_flow_imp.id(35120503547106243)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'set-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ITEM_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_expression', 'this.triggeringElement.getAttribute(''data-id'')',
  'suppress_change_event', 'N',
  'type', 'JAVASCRIPT_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35121091397106243)
,p_name=>'Smart Filter Change'
,p_static_id=>'smart-filter-change'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35116555136106241)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_SMART_FILTERS|REGION TYPE|facetschange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35121164067106243)
,p_event_id=>wwv_flow_imp.id(35121091397106243)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Clear Page Items'
,p_static_id=>'clear-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_ITEM_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35121286390106243)
,p_event_id=>wwv_flow_imp.id(35121091397106243)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'Refresh Item Warehouse Policies'
,p_static_id=>'refresh-2-smart-filter-change-item-warehouse-policies'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35116817049106241)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00012
begin
wwv_flow_imp_page.create_page(
 p_id=>12
,p_name=>'Business Partners'
,p_alias=>'BUSINESS-PARTNERS'
,p_step_title=>'Business Partners'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35048939963105913)
,p_protection_level=>'C'
,p_page_comment=>'Procurement, customer service, and administration teams use this page to compare partner header information with the operational sites used by receipts, shipments, and returns.'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35071556313106025)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35071669067106025)
,p_plug_name=>'Business Partners'
,p_static_id=>'business-partners'
,p_parent_plug_id=>wwv_flow_imp.id(35071783934106025)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noUI:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select bp.business_partner_id as business_partner_id',
'     , bp.partner_status_code as partner_status_code',
'     , bp.partner_name as partner_name',
'     , bp.partner_number as partner_number',
'     , bp.partner_type_code as partner_type_code',
'     , bp.created_at as created_at',
'     , bp.created_by as created_by',
'from scm_business_partners bp'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'DESCRIPTION', 'Partner Number: &PARTNER_NUMBER.',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'N',
  'HIDE_BORDERS', 'N',
  'MISC', 'Partner Type: &PARTNER_TYPE_CODE.<br/>Created At: &CREATED_AT.<br/>Created By: &CREATED_BY.',
  'OVERLINE', '&PARTNER_STATUS_CODE.',
  'REMOVE_PADDING', 'N',
  'STACK_MOBILE', 'N',
  'TITLE', '&PARTNER_NAME.')).to_clob
,p_plug_comment=>'Presents business partners as selectable work items so users can focus the site panel on one partner at a time.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35071819867106025)
,p_name=>'BUSINESS_PARTNER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUSINESS_PARTNER_ID'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35071946974106025)
,p_name=>'CREATED_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_AT'
,p_data_type=>'TIMESTAMP_TZ'
,p_display_sequence=>60
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35072049878106026)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>70
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35072106745106026)
,p_name=>'PARTNER_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTNER_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35072278129106026)
,p_name=>'PARTNER_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTNER_NUMBER'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35072384046106026)
,p_name=>'PARTNER_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTNER_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35072427505106026)
,p_name=>'PARTNER_TYPE_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTNER_TYPE_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35072555047106026)
,p_region_id=>wwv_flow_imp.id(35071669067106025)
,p_position_id=>350878614853473162
,p_display_sequence=>5
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35072629445106026)
,p_region_id=>wwv_flow_imp.id(35071669067106025)
,p_position_id=>350878614853473162
,p_display_sequence=>10
,p_static_id=>'action-fullrowlink-1'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:12:&APP_SESSION.::&DEBUG.::P12_BUSINESS_PARTNER_ID:\&BUSINESS_PARTNER_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35048939963105913)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35072729473106026)
,p_region_id=>wwv_flow_imp.id(35071669067106025)
,p_position_id=>363792341120765662
,p_display_sequence=>20
,p_template_id=>363794202317800939
,p_label=>'Show actions'
,p_static_id=>'action-menu'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_action_css_classes=>'t-Button--noUI'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(35072876697106026)
,p_component_action_id=>wwv_flow_imp.id(35072729473106026)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit'
,p_static_id=>'menu-entry-edit'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:38:&APP_SESSION.::&DEBUG.::P38_BUSINESS_PARTNER_ID:\&BUSINESS_PARTNER_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35048939963105913)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35071783934106025)
,p_plug_name=>'Business Partners'
,p_static_id=>'filter-business-partners'
,p_region_name=>'filter-business-partners'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(35071669067106025)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maximum_suggestion_chips', '0',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
,p_plug_comment=>'Added by generator'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35072940465106026)
,p_name=>'P12_SEARCH'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(35071783934106025)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35073040936106026)
,p_name=>'Partner Sites'
,p_static_id=>'partner-sites'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_new_grid_row=>false
,p_display_column=>5
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ps.partner_site_id as partner_site_id',
'     , ps.site_code as site_code',
'     , ps.site_name as site_name',
'     , ps.site_role_code as site_role_code',
'     , ps.address_line_1 as address_line_1',
'     , ps.city_name as city_name',
'     , ps.state_region_name as state_region_name',
'     , ps.postal_code as postal_code',
'     , ps.country_code as country_code',
'     , ps.latitude as latitude',
'     , ps.longitude as longitude',
'     , ps.is_primary_site as is_primary_site',
'     , ps.is_active as is_active',
'from scm_partner_sites ps',
'where ps.business_partner_id = cast(:P12_BUSINESS_PARTNER_ID as number)',
'order by ps.site_code'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P12_BUSINESS_PARTNER_ID'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Shows the selected partner''s sites so users can review shipping, receiving, service, and map-location detail tied to the partner.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35073150908106026)
,p_query_column_id=>5
,p_column_alias=>'ADDRESS_LINE_1'
,p_column_display_sequence=>50
,p_column_heading=>'Address Line 1'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35073226685106026)
,p_query_column_id=>6
,p_column_alias=>'CITY_NAME'
,p_column_display_sequence=>60
,p_column_heading=>'City'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35073362504106026)
,p_query_column_id=>9
,p_column_alias=>'COUNTRY_CODE'
,p_column_display_sequence=>90
,p_column_heading=>'Country'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35073494363106026)
,p_query_column_id=>13
,p_column_alias=>'IS_ACTIVE'
,p_column_display_sequence=>130
,p_column_heading=>'Is Active'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35073581817106026)
,p_query_column_id=>12
,p_column_alias=>'IS_PRIMARY_SITE'
,p_column_display_sequence=>120
,p_column_heading=>'Is Primary Site'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35073621568106026)
,p_query_column_id=>10
,p_column_alias=>'LATITUDE'
,p_column_display_sequence=>100
,p_column_heading=>'Latitude'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35073750663106026)
,p_query_column_id=>11
,p_column_alias=>'LONGITUDE'
,p_column_display_sequence=>110
,p_column_heading=>'Longitude'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35073815555106026)
,p_query_column_id=>1
,p_column_alias=>'PARTNER_SITE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35073965895106026)
,p_query_column_id=>8
,p_column_alias=>'POSTAL_CODE'
,p_column_display_sequence=>80
,p_column_heading=>'Postal Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35074021322106026)
,p_query_column_id=>2
,p_column_alias=>'SITE_CODE'
,p_column_display_sequence=>20
,p_column_heading=>'Site Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35074193161106026)
,p_query_column_id=>3
,p_column_alias=>'SITE_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:47:&APP_SESSION.::&DEBUG.::P47_PARTNER_SITE_ID:\#PARTNER_SITE_ID#\'
,p_column_linktext=>'<span role="img" aria-label="" class="fa fa-edit" title=""></span>'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35074220386106026)
,p_query_column_id=>4
,p_column_alias=>'SITE_ROLE_CODE'
,p_column_display_sequence=>40
,p_column_heading=>'Site Role'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35074306658106026)
,p_query_column_id=>7
,p_column_alias=>'STATE_REGION_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'State Region'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35074554115106027)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35071669067106025)
,p_button_name=>'CREATE-PARTNER'
,p_static_id=>'create-partner'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Partner'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:38:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048939963105913)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35074637419106027)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35073040936106026)
,p_button_name=>'CREATE-PARTNER-SITE'
,p_static_id=>'create-partner-site'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Partner Site'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:47:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048939963105913)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35074419385106026)
,p_name=>'P12_BUSINESS_PARTNER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35071669067106025)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35074750482106027)
,p_name=>'After Create Dialog Closed'
,p_static_id=>'dialog-closed-create-parent'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35074554115106027)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35074821722106027)
,p_event_id=>wwv_flow_imp.id(35074750482106027)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_BUSINESS_PARTNER_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P38_BUSINESS_PARTNER_ID',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35074989564106027)
,p_event_id=>wwv_flow_imp.id(35074750482106027)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh ParentRegion'
,p_static_id=>'refresh-parent-region'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35071669067106025)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35075068262106027)
,p_event_id=>wwv_flow_imp.id(35074750482106027)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Select parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P12_BUSINESS_PARTNER_ID'') + '']'').click();',
    '                }, 2000);',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35075161820106027)
,p_name=>'Parent Action Dialog Closed'
,p_static_id=>'dialog-closed-parent-action'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35071669067106025)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35075247946106027)
,p_event_id=>wwv_flow_imp.id(35075161820106027)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Partner Sites'
,p_static_id=>'refresh-2-dialog-closed-parent-action-partner-sites'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35073040936106026)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35075381336106027)
,p_event_id=>wwv_flow_imp.id(35075161820106027)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Parent Region'
,p_static_id=>'refresh-parent-region-action'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35071669067106025)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35075486395106027)
,p_event_id=>wwv_flow_imp.id(35075161820106027)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'N'
,p_name=>'Select Parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                if ($v(''P12_BUSINESS_PARTNER_ID'') !== '''') {',
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P12_BUSINESS_PARTNER_ID'') + '']'').click();',
    '                }, 2000);',
    '                }',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35075595870106027)
,p_name=>'Refresh on dialog close Partner Sites'
,p_static_id=>'dialog-refresh-partner-sites'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35073040936106026)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35075606179106061)
,p_event_id=>wwv_flow_imp.id(35075595870106027)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35073040936106026)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35075750657106061)
,p_name=>'Parent Row Selected'
,p_static_id=>'parent-row-selected'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.t-ContentRow-item'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#filter-business-partners'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35075829066106061)
,p_event_id=>wwv_flow_imp.id(35075750657106061)
,p_event_result=>'TRUE'
,p_action_sequence=>7
,p_execute_on_page_init=>'N'
,p_static_id=>'native-add-class'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35075924828106062)
,p_event_id=>wwv_flow_imp.id(35075750657106061)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-remove-class'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'JAVASCRIPT_EXPRESSION'
,p_affected_elements=>'$(''.t-ContentRow-item'')'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35076075781106062)
,p_event_id=>wwv_flow_imp.id(35075750657106061)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Partner Sites'
,p_static_id=>'refresh-2-parent-row-selected-partner-sites'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35073040936106026)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35076140394106062)
,p_event_id=>wwv_flow_imp.id(35075750657106061)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'set-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_BUSINESS_PARTNER_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_expression', 'this.triggeringElement.getAttribute(''data-id'')',
  'suppress_change_event', 'N',
  'type', 'JAVASCRIPT_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35076223488106062)
,p_name=>'Smart Filter Change'
,p_static_id=>'smart-filter-change'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35071783934106025)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_SMART_FILTERS|REGION TYPE|facetschange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35076351310106062)
,p_event_id=>wwv_flow_imp.id(35076223488106062)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Clear Page Items'
,p_static_id=>'clear-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_BUSINESS_PARTNER_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35076408913106062)
,p_event_id=>wwv_flow_imp.id(35076223488106062)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'Refresh Partner Sites'
,p_static_id=>'refresh-2-smart-filter-change-partner-sites'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35073040936106026)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_imp_page.create_page(
 p_id=>13
,p_name=>'Security and Access'
,p_alias=>'SECURITY-AND-ACCESS'
,p_step_title=>'Security and Access'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35049422323105914)
,p_protection_level=>'C'
,p_page_comment=>'Administrators and executive owners use this page to review who can access the application, what roles exist, and how roles are assigned.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35169962206106500)
,p_name=>'Application Users'
,p_static_id=>'application-users'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select au.application_user_id as application_user_id',
'     , au.user_name as user_name',
'     , au.full_name as full_name',
'     , au.email_address as email_address',
'     , au.user_status_code as user_status_code',
'     , wh.warehouse_name as warehouse_name',
'     , mgr.full_name as manager_name',
'     , au.can_receive_alerts as can_receive_alerts',
'     , au.approval_authority_level as approval_authority_level',
'from scm_application_users au',
'left join scm_warehouses wh',
'    on wh.warehouse_id = au.default_warehouse_id',
'left join scm_application_users mgr',
'    on mgr.application_user_id = au.manager_user_id',
'order by au.full_name'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays application user records so administrators can open user maintenance and review default warehouse, manager, and authority information, excluding locked or inactive users from effective operational authority.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35170096327106501)
,p_query_column_id=>1
,p_column_alias=>'APPLICATION_USER_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35170155632106501)
,p_query_column_id=>9
,p_column_alias=>'APPROVAL_AUTHORITY_LEVEL'
,p_column_display_sequence=>90
,p_column_heading=>'Approval Authority Level'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35170217166106501)
,p_query_column_id=>8
,p_column_alias=>'CAN_RECEIVE_ALERTS'
,p_column_display_sequence=>80
,p_column_heading=>'Can Receive Alerts'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35170324944106501)
,p_query_column_id=>4
,p_column_alias=>'EMAIL_ADDRESS'
,p_column_display_sequence=>40
,p_column_heading=>'Email Address'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35170478171106501)
,p_query_column_id=>2
,p_column_alias=>'FULL_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:39:&APP_SESSION.::&DEBUG.::P39_APPLICATION_USER_ID:\#APPLICATION_USER_ID#\'
,p_column_linktext=>'<span role="img" aria-label="" class="fa fa-edit" title=""></span>'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35170596852106501)
,p_query_column_id=>7
,p_column_alias=>'MANAGER_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Manager'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35170650207106501)
,p_query_column_id=>3
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'User Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35170793545106501)
,p_query_column_id=>5
,p_column_alias=>'USER_STATUS_CODE'
,p_column_display_sequence=>50
,p_column_heading=>'User Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35170851453106501)
,p_query_column_id=>6
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>60
,p_column_heading=>'Default Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35170916120106501)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35171076918106501)
,p_name=>'Role Assignments'
,p_static_id=>'role-assignments'
,p_template=>4073835273271169698
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ura.user_role_assignment_id as user_role_assignment_id',
'     , au.full_name as full_name',
'     , ur.role_name as role_name',
'     , wh.warehouse_name as warehouse_name',
'     , ura.assignment_status_code as assignment_status_code',
'     , ura.authority_level_override as authority_level_override',
'     , ura.effective_from_date as effective_from_date',
'     , ura.effective_to_date as effective_to_date',
'     , aby.full_name as assigned_by_name',
'     , ura.is_primary_role as is_primary_role',
'     , ura.assignment_notes as assignment_notes',
'from scm_user_role_assignments ura',
'join scm_application_users au',
'    on au.application_user_id = ura.application_user_id',
'join scm_user_roles ur',
'    on ur.user_role_id = ura.user_role_id',
'left join scm_warehouses wh',
'    on wh.warehouse_id = ura.warehouse_id',
'left join scm_application_users aby',
'    on aby.application_user_id = ura.assigned_by_user_id',
'order by au.full_name, ur.role_name'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays role assignments so administrators can review who holds which role, in which warehouse context, and for what date range, where only active assignments contribute effective authority and any authority override becomes the effective assignment'
||' authority.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35171186452106501)
,p_query_column_id=>9
,p_column_alias=>'ASSIGNED_BY_NAME'
,p_column_display_sequence=>90
,p_column_heading=>'Assigned By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35171295969106501)
,p_query_column_id=>11
,p_column_alias=>'ASSIGNMENT_NOTES'
,p_column_display_sequence=>110
,p_column_heading=>'Assignment Notes'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35171323122106501)
,p_query_column_id=>5
,p_column_alias=>'ASSIGNMENT_STATUS_CODE'
,p_column_display_sequence=>50
,p_column_heading=>'Assignment Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35171440394106501)
,p_query_column_id=>6
,p_column_alias=>'AUTHORITY_LEVEL_OVERRIDE'
,p_column_display_sequence=>60
,p_column_heading=>'Authority Override'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35171524765106501)
,p_query_column_id=>7
,p_column_alias=>'EFFECTIVE_FROM_DATE'
,p_column_display_sequence=>70
,p_column_heading=>'Effective From Date'
,p_column_format=>'DD-MON-YYYY'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35171631012106501)
,p_query_column_id=>8
,p_column_alias=>'EFFECTIVE_TO_DATE'
,p_column_display_sequence=>80
,p_column_heading=>'Effective To Date'
,p_column_format=>'DD-MON-YYYY'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35171801966106501)
,p_query_column_id=>2
,p_column_alias=>'FULL_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:44:&APP_SESSION.::&DEBUG.::P44_USER_ROLE_ASSIGNMENT_ID:\#USER_ROLE_ASSIGNMENT_ID#\'
,p_column_linktext=>'<span role="img" aria-label="" class="fa fa-edit" title=""></span>'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35171901788106502)
,p_query_column_id=>10
,p_column_alias=>'IS_PRIMARY_ROLE'
,p_column_display_sequence=>100
,p_column_heading=>'Is Primary Role'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35171975579106502)
,p_query_column_id=>3
,p_column_alias=>'ROLE_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Role'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35172073275106502)
,p_query_column_id=>1
,p_column_alias=>'USER_ROLE_ASSIGNMENT_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35172110068106502)
,p_query_column_id=>4
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>40
,p_column_heading=>'Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35172284094106502)
,p_name=>'Role Permissions'
,p_static_id=>'role-permissions'
,p_template=>4073835273271169698
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rp.role_permission_id as role_permission_id',
'     , ur.role_name as role_name',
'     , rp.process_area_code as process_area_code',
'     , rp.access_level_code as access_level_code',
'     , rp.warehouse_scope_code as warehouse_scope_code',
'     , rp.is_active as is_active',
'     , rp.permission_notes as permission_notes',
'from scm_role_permissions rp',
'join scm_user_roles ur',
'    on ur.user_role_id = rp.user_role_id',
'order by ur.role_name, rp.process_area_code, rp.access_level_code'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays role permissions so administrators can review process area access, warehouse scope, and activity state for each role, which active assignments inherit by process area, access level, and warehouse scope.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35172349987106502)
,p_query_column_id=>4
,p_column_alias=>'ACCESS_LEVEL_CODE'
,p_column_display_sequence=>40
,p_column_heading=>'Access Level'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35172497266106502)
,p_query_column_id=>6
,p_column_alias=>'IS_ACTIVE'
,p_column_display_sequence=>60
,p_column_heading=>'Is Active'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35172540135106502)
,p_query_column_id=>7
,p_column_alias=>'PERMISSION_NOTES'
,p_column_display_sequence=>70
,p_column_heading=>'Permission Notes'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35172659233106502)
,p_query_column_id=>3
,p_column_alias=>'PROCESS_AREA_CODE'
,p_column_display_sequence=>30
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:48:&APP_SESSION.::&DEBUG.::P48_ROLE_PERMISSION_ID:\#ROLE_PERMISSION_ID#\'
,p_column_linktext=>'<span role="img" aria-label="" class="fa fa-edit" title=""></span>'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35172759505106502)
,p_query_column_id=>2
,p_column_alias=>'ROLE_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Role'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35172829775106502)
,p_query_column_id=>1
,p_column_alias=>'ROLE_PERMISSION_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35172969100106502)
,p_query_column_id=>5
,p_column_alias=>'WAREHOUSE_SCOPE_CODE'
,p_column_display_sequence=>50
,p_column_heading=>'Warehouse Scope'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35173019413106502)
,p_name=>'User Roles'
,p_static_id=>'user-roles'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ur.user_role_id as user_role_id',
'     , ur.role_code as role_code',
'     , ur.role_name as role_name',
'     , ur.role_scope_code as role_scope_code',
'     , ur.approval_authority_level as approval_authority_level',
'     , ur.is_active as is_active',
'from scm_user_roles ur',
'order by ur.role_name'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays application roles so administrators can review role scope, authority level, and active status.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35173111748106502)
,p_query_column_id=>5
,p_column_alias=>'APPROVAL_AUTHORITY_LEVEL'
,p_column_display_sequence=>50
,p_column_heading=>'Approval Authority Level'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35173208417106502)
,p_query_column_id=>6
,p_column_alias=>'IS_ACTIVE'
,p_column_display_sequence=>60
,p_column_heading=>'Is Active'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35173341903106502)
,p_query_column_id=>3
,p_column_alias=>'ROLE_CODE'
,p_column_display_sequence=>30
,p_column_heading=>'Role Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35173477461106502)
,p_query_column_id=>2
,p_column_alias=>'ROLE_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:40:&APP_SESSION.::&DEBUG.::P40_USER_ROLE_ID:\#USER_ROLE_ID#\'
,p_column_linktext=>'<span role="img" aria-label="" class="fa fa-edit" title=""></span>'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35173561384106502)
,p_query_column_id=>4
,p_column_alias=>'ROLE_SCOPE_CODE'
,p_column_display_sequence=>40
,p_column_heading=>'Role Scope'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35173657421106502)
,p_query_column_id=>1
,p_column_alias=>'USER_ROLE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35173755948106502)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35171076918106501)
,p_button_name=>'CREATE-ASSIGNMENT'
,p_static_id=>'create-assignment'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Assignment'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:44:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35173898767106502)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35172284094106502)
,p_button_name=>'CREATE-PERMISSION'
,p_static_id=>'create-permission'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Permission'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:48:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35173914029106502)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35173019413106502)
,p_button_name=>'CREATE-ROLE'
,p_static_id=>'create-role'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Role'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:40:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35174078140106502)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35169962206106500)
,p_button_name=>'CREATE-USER'
,p_static_id=>'create-user'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create User'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:39:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35174183986106502)
,p_name=>'Refresh on dialog close Application Users'
,p_static_id=>'dialog-refresh-application-users'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35169962206106500)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35174213651106502)
,p_event_id=>wwv_flow_imp.id(35174183986106502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35169962206106500)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35174336438106502)
,p_name=>'Refresh on dialog close Role Assignments'
,p_static_id=>'dialog-refresh-role-assignments'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35171076918106501)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35174481694106502)
,p_event_id=>wwv_flow_imp.id(35174336438106502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35171076918106501)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35174539715106502)
,p_name=>'Refresh on dialog close Role Permissions'
,p_static_id=>'dialog-refresh-role-permissions'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35172284094106502)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35174686493106502)
,p_event_id=>wwv_flow_imp.id(35174539715106502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35172284094106502)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35174745851106502)
,p_name=>'Refresh on dialog close User Roles'
,p_static_id=>'dialog-refresh-user-roles'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35173019413106502)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35174815019106502)
,p_event_id=>wwv_flow_imp.id(35174745851106502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35173019413106502)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00014
begin
wwv_flow_imp_page.create_page(
 p_id=>14
,p_name=>'Approval and Exception Control'
,p_alias=>'APPROVAL-AND-EXCEPTION-CONTROL'
,p_step_title=>'Approval and Exception Control'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35049306859105914)
,p_protection_level=>'C'
,p_page_comment=>'Reviewers and management use this page to compare approval configuration with the operational cases that depend on those decisions.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35147229990106372)
,p_name=>'Approval Action History'
,p_static_id=>'approval-action-history'
,p_template=>4073835273271169698
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.approval_action_id as approval_action_id',
'     , aa.approval_subject_code as approval_subject_code',
'     , coalesce(st.transfer_number, sa.adjustment_number, qc.quarantine_number, oe.exception_number) as related_object_number',
'     , ap.policy_name as policy_name',
'     , aa.approval_sequence_number as approval_sequence_number',
'     , aa.approval_step_name as approval_step_name',
'     , aa.decision_code as decision_code',
'     , aa.decision_by as decision_by',
'     , aa.decision_at as decision_at',
'     , aa.decision_comment as decision_comment',
'from scm_approval_actions aa',
'left join scm_stock_transfers st',
'    on st.stock_transfer_id = aa.stock_transfer_id',
'left join scm_stock_adjustments sa',
'    on sa.stock_adjustment_id = aa.stock_adjustment_id',
'left join scm_quarantine_cases qc',
'    on qc.quarantine_case_id = aa.quarantine_case_id',
'left join scm_operational_exceptions oe',
'    on oe.operational_exception_id = aa.operational_exception_id',
'left join scm_approval_policies ap',
'    on ap.approval_policy_id = aa.approval_policy_id',
'order by aa.decision_at desc, aa.approval_sequence_number'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays ordered approval-action history so reviewers can inspect step sequence, decision outcome, and decision timing for approval-controlled objects.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35147332564106373)
,p_query_column_id=>1
,p_column_alias=>'APPROVAL_ACTION_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35147499809106373)
,p_query_column_id=>5
,p_column_alias=>'APPROVAL_SEQUENCE_NUMBER'
,p_column_display_sequence=>50
,p_column_heading=>'Step Sequence'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35147597389106373)
,p_query_column_id=>6
,p_column_alias=>'APPROVAL_STEP_NAME'
,p_column_display_sequence=>60
,p_column_heading=>'Step Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35147656025106373)
,p_query_column_id=>2
,p_column_alias=>'APPROVAL_SUBJECT_CODE'
,p_column_display_sequence=>20
,p_column_heading=>'Approval Subject'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35147776331106373)
,p_query_column_id=>9
,p_column_alias=>'DECISION_AT'
,p_column_display_sequence=>90
,p_column_heading=>'Decision At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35147861256106373)
,p_query_column_id=>8
,p_column_alias=>'DECISION_BY'
,p_column_display_sequence=>80
,p_column_heading=>'Decision By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35147922277106373)
,p_query_column_id=>7
,p_column_alias=>'DECISION_CODE'
,p_column_display_sequence=>70
,p_column_heading=>'Decision Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35148006363106373)
,p_query_column_id=>10
,p_column_alias=>'DECISION_COMMENT'
,p_column_display_sequence=>100
,p_column_heading=>'Decision Comment'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35148175940106373)
,p_query_column_id=>4
,p_column_alias=>'POLICY_NAME'
,p_column_display_sequence=>40
,p_column_heading=>'Approval Policy'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35148254213106373)
,p_query_column_id=>3
,p_column_alias=>'RELATED_OBJECT_NUMBER'
,p_column_display_sequence=>30
,p_column_heading=>'Related Object'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35148382952106373)
,p_name=>'Approval Policies'
,p_static_id=>'approval-policies'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ap.approval_policy_id as approval_policy_id',
'     , ap.policy_name as policy_name',
'     , ap.policy_code as policy_code',
'     , ap.approval_subject_code as approval_subject_code',
'     , wh.warehouse_name as warehouse_name',
'     , ap.threshold_basis_code as threshold_basis_code',
'     , ap.minimum_quantity as minimum_quantity',
'     , ap.maximum_quantity as maximum_quantity',
'     , ap.minimum_value_amount as minimum_value_amount',
'     , ap.maximum_value_amount as maximum_value_amount',
'     , ap.risk_level_code as risk_level_code',
'     , rr.role_name as reviewer_role_name',
'     , er.role_name as escalation_role_name',
'     , ap.approval_authority_level as approval_authority_level',
'     , ap.policy_status_code as policy_status_code',
'from scm_approval_policies ap',
'left join scm_warehouses wh',
'    on wh.warehouse_id = ap.warehouse_id',
'join scm_user_roles rr',
'    on rr.user_role_id = ap.reviewer_role_id',
'left join scm_user_roles er',
'    on er.user_role_id = ap.escalation_role_id',
'order by ap.policy_name'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays approval policies so reviewers can open policy maintenance and compare policy scope with warehouse and reviewer assignments.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35148436923106373)
,p_query_column_id=>14
,p_column_alias=>'APPROVAL_AUTHORITY_LEVEL'
,p_column_display_sequence=>140
,p_column_heading=>'Approval Authority Level'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35148538098106373)
,p_query_column_id=>1
,p_column_alias=>'APPROVAL_POLICY_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35148688144106373)
,p_query_column_id=>4
,p_column_alias=>'APPROVAL_SUBJECT_CODE'
,p_column_display_sequence=>40
,p_column_heading=>'Approval Subject'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35148751927106373)
,p_query_column_id=>13
,p_column_alias=>'ESCALATION_ROLE_NAME'
,p_column_display_sequence=>130
,p_column_heading=>'Escalation Role'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35148902081106373)
,p_query_column_id=>8
,p_column_alias=>'MAXIMUM_QUANTITY'
,p_column_display_sequence=>80
,p_column_heading=>'Maximum Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35148998700106373)
,p_query_column_id=>10
,p_column_alias=>'MAXIMUM_VALUE_AMOUNT'
,p_column_display_sequence=>100
,p_column_heading=>'Maximum Value Amount'
,p_column_format=>'FM999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35149038640106373)
,p_query_column_id=>7
,p_column_alias=>'MINIMUM_QUANTITY'
,p_column_display_sequence=>70
,p_column_heading=>'Minimum Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35149144033106373)
,p_query_column_id=>9
,p_column_alias=>'MINIMUM_VALUE_AMOUNT'
,p_column_display_sequence=>90
,p_column_heading=>'Minimum Value Amount'
,p_column_format=>'FM999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35149259915106373)
,p_query_column_id=>3
,p_column_alias=>'POLICY_CODE'
,p_column_display_sequence=>30
,p_column_heading=>'Policy Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35149312430106373)
,p_query_column_id=>2
,p_column_alias=>'POLICY_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:41:&APP_SESSION.::&DEBUG.::P41_APPROVAL_POLICY_ID:\#APPROVAL_POLICY_ID#\'
,p_column_linktext=>'<span role="img" aria-label="" class="fa fa-edit" title=""></span>'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35149490922106373)
,p_query_column_id=>15
,p_column_alias=>'POLICY_STATUS_CODE'
,p_column_display_sequence=>150
,p_column_heading=>'Policy Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35149585251106411)
,p_query_column_id=>12
,p_column_alias=>'REVIEWER_ROLE_NAME'
,p_column_display_sequence=>120
,p_column_heading=>'Reviewer Role'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35149681012106411)
,p_query_column_id=>11
,p_column_alias=>'RISK_LEVEL_CODE'
,p_column_display_sequence=>110
,p_column_heading=>'Risk Level'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35149777679106411)
,p_query_column_id=>6
,p_column_alias=>'THRESHOLD_BASIS_CODE'
,p_column_display_sequence=>60
,p_column_heading=>'Threshold Basis'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35149883817106411)
,p_query_column_id=>5
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>50
,p_column_heading=>'Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35149975861106411)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35150076603106411)
,p_name=>'Operational Exceptions'
,p_static_id=>'operational-exceptions'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select oe.operational_exception_id as operational_exception_id',
'     , oe.exception_number as exception_number',
'     , oe.exception_type_code as exception_type_code',
'     , wh.warehouse_name as warehouse_name',
'     , sl.location_code as location_code',
'     , it.item_name as item_name',
'     , il.lot_number as lot_number',
'     , oe.source_document_number as source_document_number',
'     , oe.severity_code as severity_code',
'     , oe.exception_status_code as exception_status_code',
'     , oe.affected_quantity as affected_quantity',
'     , oe.requires_approval_flag as requires_approval_flag',
'     , ap.policy_name as approval_policy_name',
'     , ur.role_name as assigned_role_name',
'     , au.full_name as assigned_user_name',
'     , oe.reported_at as reported_at',
'     , oe.resolved_at as resolved_at',
'     , oe.resolution_code as resolution_code',
'from scm_operational_exceptions oe',
'join scm_warehouses wh',
'    on wh.warehouse_id = oe.warehouse_id',
'left join scm_storage_locations sl',
'    on sl.storage_location_id = oe.storage_location_id',
'left join scm_items it',
'    on it.item_id = oe.item_id',
'left join scm_inventory_lots il',
'    on il.inventory_lot_id = oe.inventory_lot_id',
'left join scm_approval_policies ap',
'    on ap.approval_policy_id = oe.approval_policy_id',
'left join scm_user_roles ur',
'    on ur.user_role_id = oe.assigned_role_id',
'left join scm_application_users au',
'    on au.application_user_id = oe.assigned_user_id',
'order by oe.reported_at desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays operational exceptions so reviewers can compare source context, severity, approval requirement, assignment, and resolution timing, including issues raised from receipt, fulfilment, return, rotation, expiry, or quarantine events. Exceptions t'
||'hat require approval remain approval-controlled until a policy decision is recorded, and an approval-required exception must carry a policy.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35150103557106411)
,p_query_column_id=>11
,p_column_alias=>'AFFECTED_QUANTITY'
,p_column_display_sequence=>110
,p_column_heading=>'Affected Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35150284488106411)
,p_query_column_id=>13
,p_column_alias=>'APPROVAL_POLICY_NAME'
,p_column_display_sequence=>130
,p_column_heading=>'Approval Policy'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35150356067106412)
,p_query_column_id=>14
,p_column_alias=>'ASSIGNED_ROLE_NAME'
,p_column_display_sequence=>140
,p_column_heading=>'Assigned Role'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35150459299106412)
,p_query_column_id=>15
,p_column_alias=>'ASSIGNED_USER_NAME'
,p_column_display_sequence=>150
,p_column_heading=>'Assigned User'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35150594292106412)
,p_query_column_id=>2
,p_column_alias=>'EXCEPTION_NUMBER'
,p_column_display_sequence=>20
,p_column_heading=>'Exception Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35150695628106412)
,p_query_column_id=>10
,p_column_alias=>'EXCEPTION_STATUS_CODE'
,p_column_display_sequence=>100
,p_column_heading=>'Exception Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35150795181106412)
,p_query_column_id=>3
,p_column_alias=>'EXCEPTION_TYPE_CODE'
,p_column_display_sequence=>30
,p_column_heading=>'Exception Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35150860917106412)
,p_query_column_id=>6
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>60
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35150933596106412)
,p_query_column_id=>5
,p_column_alias=>'LOCATION_CODE'
,p_column_display_sequence=>50
,p_column_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35151051832106412)
,p_query_column_id=>7
,p_column_alias=>'LOT_NUMBER'
,p_column_display_sequence=>70
,p_column_heading=>'Lot Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35151114020106412)
,p_query_column_id=>1
,p_column_alias=>'OPERATIONAL_EXCEPTION_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35151273940106412)
,p_query_column_id=>16
,p_column_alias=>'REPORTED_AT'
,p_column_display_sequence=>160
,p_column_heading=>'Reported At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35151303835106412)
,p_query_column_id=>12
,p_column_alias=>'REQUIRES_APPROVAL_FLAG'
,p_column_display_sequence=>120
,p_column_heading=>'Requires Approval'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35151478818106412)
,p_query_column_id=>18
,p_column_alias=>'RESOLUTION_CODE'
,p_column_display_sequence=>180
,p_column_heading=>'Resolution Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35151529906106412)
,p_query_column_id=>17
,p_column_alias=>'RESOLVED_AT'
,p_column_display_sequence=>170
,p_column_heading=>'Resolved At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35151613381106412)
,p_query_column_id=>9
,p_column_alias=>'SEVERITY_CODE'
,p_column_display_sequence=>90
,p_column_heading=>'Severity'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35151762600106412)
,p_query_column_id=>8
,p_column_alias=>'SOURCE_DOCUMENT_NUMBER'
,p_column_display_sequence=>80
,p_column_heading=>'Source Document'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35151839737106412)
,p_query_column_id=>4
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>40
,p_column_heading=>'Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35151964673106412)
,p_name=>'Quarantine Cases'
,p_static_id=>'quarantine-cases'
,p_template=>4073835273271169698
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select qc.quarantine_case_id as quarantine_case_id',
'     , qc.quarantine_number as quarantine_number',
'     , wh.warehouse_name as warehouse_name',
'     , sl.location_code as location_code',
'     , it.item_name as item_name',
'     , il.lot_number as lot_number',
'     , qc.source_document_number as source_document_number',
'     , qc.quantity as quantity',
'     , qc.quarantine_reason_code as quarantine_reason_code',
'     , qc.quarantine_status_code as quarantine_status_code',
'     , qc.quarantined_at as quarantined_at',
'     , qc.reviewed_at as reviewed_at',
'     , qc.reviewed_by as reviewed_by',
'     , qc.resolution_code as resolution_code',
'     , qc.resolution_notes as resolution_notes',
'from scm_quarantine_cases qc',
'join scm_warehouses wh',
'    on wh.warehouse_id = qc.warehouse_id',
'join scm_storage_locations sl',
'    on sl.storage_location_id = qc.storage_location_id',
'join scm_items it',
'    on it.item_id = qc.item_id',
'left join scm_inventory_lots il',
'    on il.inventory_lot_id = qc.inventory_lot_id',
'order by qc.quarantined_at desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays quarantine cases so quality reviewers can compare stock quantity, source context, quarantine reason, and review outcome.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35152093399106412)
,p_query_column_id=>5
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>50
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35152156216106412)
,p_query_column_id=>4
,p_column_alias=>'LOCATION_CODE'
,p_column_display_sequence=>40
,p_column_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35152214123106412)
,p_query_column_id=>6
,p_column_alias=>'LOT_NUMBER'
,p_column_display_sequence=>60
,p_column_heading=>'Lot Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35152349906106412)
,p_query_column_id=>8
,p_column_alias=>'QUANTITY'
,p_column_display_sequence=>80
,p_column_heading=>'Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35152451468106412)
,p_query_column_id=>11
,p_column_alias=>'QUARANTINED_AT'
,p_column_display_sequence=>110
,p_column_heading=>'Quarantined At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35152532673106412)
,p_query_column_id=>1
,p_column_alias=>'QUARANTINE_CASE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35152646903106412)
,p_query_column_id=>2
,p_column_alias=>'QUARANTINE_NUMBER'
,p_column_display_sequence=>20
,p_column_heading=>'Quarantine Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35152801956106412)
,p_query_column_id=>9
,p_column_alias=>'QUARANTINE_REASON_CODE'
,p_column_display_sequence=>90
,p_column_heading=>'Quarantine Reason'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35152865614106412)
,p_query_column_id=>10
,p_column_alias=>'QUARANTINE_STATUS_CODE'
,p_column_display_sequence=>100
,p_column_heading=>'Quarantine Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35152922656106412)
,p_query_column_id=>14
,p_column_alias=>'RESOLUTION_CODE'
,p_column_display_sequence=>140
,p_column_heading=>'Resolution Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35153067320106412)
,p_query_column_id=>15
,p_column_alias=>'RESOLUTION_NOTES'
,p_column_display_sequence=>150
,p_column_heading=>'Resolution Notes'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35153195264106412)
,p_query_column_id=>12
,p_column_alias=>'REVIEWED_AT'
,p_column_display_sequence=>120
,p_column_heading=>'Reviewed At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35153214988106412)
,p_query_column_id=>13
,p_column_alias=>'REVIEWED_BY'
,p_column_display_sequence=>130
,p_column_heading=>'Reviewed By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35153388054106412)
,p_query_column_id=>7
,p_column_alias=>'SOURCE_DOCUMENT_NUMBER'
,p_column_display_sequence=>70
,p_column_heading=>'Source Document'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35153439856106413)
,p_query_column_id=>3
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35153517174106413)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35148382952106373)
,p_button_name=>'CREATE-APPROVAL-POLICY'
,p_static_id=>'create-approval-policy'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Approval Policy'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35153684127106413)
,p_name=>'Refresh on dialog close Approval Action History'
,p_static_id=>'dialog-refresh-approval-action-history'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35147229990106372)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35153740765106413)
,p_event_id=>wwv_flow_imp.id(35153684127106413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35147229990106372)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35153823696106413)
,p_name=>'Refresh on dialog close Approval Policies'
,p_static_id=>'dialog-refresh-approval-policies'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35148382952106373)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35153935917106413)
,p_event_id=>wwv_flow_imp.id(35153823696106413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35148382952106373)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35154065825106413)
,p_name=>'Refresh on dialog close Operational Exceptions'
,p_static_id=>'dialog-refresh-operational-exceptions'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35150076603106411)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35154117320106413)
,p_event_id=>wwv_flow_imp.id(35154065825106413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35150076603106411)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35154270419106413)
,p_name=>'Refresh on dialog close Quarantine Cases'
,p_static_id=>'dialog-refresh-quarantine-cases'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35151964673106412)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35154402500106413)
,p_event_id=>wwv_flow_imp.id(35154270419106413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35151964673106412)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00015
begin
wwv_flow_imp_page.create_page(
 p_id=>15
,p_name=>'Controlled Lists'
,p_alias=>'CONTROLLED-LISTS'
,p_step_title=>'Controlled Lists'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35049422323105914)
,p_protection_level=>'C'
,p_page_comment=>'Administrators use this page to compare list-level ownership and status with the values that drive operational codes throughout the application.'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35180440604106550)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35180569189106550)
,p_plug_name=>'Business Lists'
,p_static_id=>'business-lists'
,p_parent_plug_id=>wwv_flow_imp.id(35180646952106550)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noUI:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select bl.business_list_id as business_list_id',
'     , bl.list_status_code as list_status_code',
'     , bl.list_name as list_name',
'     , bl.list_code as list_code',
'     , bl.list_purpose as list_purpose',
'from scm_business_lists bl'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'DESCRIPTION', 'List Code: &LIST_CODE.',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'N',
  'HIDE_BORDERS', 'N',
  'MISC', 'List Purpose: &LIST_PURPOSE.',
  'OVERLINE', '&LIST_STATUS_CODE.',
  'REMOVE_PADDING', 'N',
  'STACK_MOBILE', 'N',
  'TITLE', '&LIST_NAME.')).to_clob
,p_plug_comment=>'Presents business lists as selectable work items so administrators can focus the value panel on one list at a time.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35180803116106550)
,p_name=>'BUSINESS_LIST_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUSINESS_LIST_ID'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35180896782106550)
,p_name=>'LIST_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LIST_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35180950965106550)
,p_name=>'LIST_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LIST_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35181086327106550)
,p_name=>'LIST_PURPOSE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LIST_PURPOSE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35181105843106550)
,p_name=>'LIST_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LIST_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35181253819106550)
,p_region_id=>wwv_flow_imp.id(35180569189106550)
,p_position_id=>350878614853473162
,p_display_sequence=>5
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35181390720106550)
,p_region_id=>wwv_flow_imp.id(35180569189106550)
,p_position_id=>350878614853473162
,p_display_sequence=>10
,p_static_id=>'action-fullrowlink-1'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:15:&APP_SESSION.::&DEBUG.::P15_BUSINESS_LIST_ID:\&BUSINESS_LIST_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35049422323105914)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(35181478297106550)
,p_region_id=>wwv_flow_imp.id(35180569189106550)
,p_position_id=>363792341120765662
,p_display_sequence=>20
,p_template_id=>363794202317800939
,p_label=>'Show actions'
,p_static_id=>'action-menu'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_action_css_classes=>'t-Button--noUI'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(35181514669106550)
,p_component_action_id=>wwv_flow_imp.id(35181478297106550)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit'
,p_static_id=>'menu-entry-edit'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:42:&APP_SESSION.::&DEBUG.::P42_BUSINESS_LIST_ID:\&BUSINESS_LIST_ID.\'
,p_authorization_scheme=>wwv_flow_imp.id(35049422323105914)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35180646952106550)
,p_plug_name=>'Business Lists'
,p_static_id=>'filter-business-lists'
,p_region_name=>'filter-business-lists'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(35180569189106550)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maximum_suggestion_chips', '0',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
,p_plug_comment=>'Added by generator'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35181621888106551)
,p_name=>'P15_SEARCH'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(35180646952106550)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35181801850106551)
,p_name=>'List Values'
,p_static_id=>'list-values'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_new_grid_row=>false
,p_display_column=>5
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select blv.business_list_value_id as business_list_value_id',
'     , blv.value_code as value_code',
'     , blv.value_name as value_name',
'     , blv.value_description as value_description',
'     , blv.display_sequence as display_sequence',
'     , blv.is_default_value as is_default_value',
'     , blv.is_active as is_active',
'from scm_business_list_values blv',
'where blv.business_list_id = cast(:P15_BUSINESS_LIST_ID as number)',
'order by blv.display_sequence, blv.value_name'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P15_BUSINESS_LIST_ID'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Shows the values that belong to the selected business list so administrators can review code, display order, and active status together.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35181808612106551)
,p_query_column_id=>1
,p_column_alias=>'BUSINESS_LIST_VALUE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35181922094106551)
,p_query_column_id=>5
,p_column_alias=>'DISPLAY_SEQUENCE'
,p_column_display_sequence=>50
,p_column_heading=>'Display Sequence'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35182032293106551)
,p_query_column_id=>7
,p_column_alias=>'IS_ACTIVE'
,p_column_display_sequence=>70
,p_column_heading=>'Is Active'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35182147801106551)
,p_query_column_id=>6
,p_column_alias=>'IS_DEFAULT_VALUE'
,p_column_display_sequence=>60
,p_column_heading=>'Is Default Value'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35182229461106551)
,p_query_column_id=>2
,p_column_alias=>'VALUE_CODE'
,p_column_display_sequence=>20
,p_column_heading=>'Value Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35182369257106551)
,p_query_column_id=>4
,p_column_alias=>'VALUE_DESCRIPTION'
,p_column_display_sequence=>40
,p_column_heading=>'Value Description'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35182418885106551)
,p_query_column_id=>3
,p_column_alias=>'VALUE_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:43:&APP_SESSION.::&DEBUG.::P43_BUSINESS_LIST_VALUE_ID:\#BUSINESS_LIST_VALUE_ID#\'
,p_column_linktext=>'<span role="img" aria-label="" class="fa fa-edit" title=""></span>'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35182622289106551)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35180569189106550)
,p_button_name=>'CREATE-BUSINESS-LIST'
,p_static_id=>'create-business-list'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Business List'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:42:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35182771485106551)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35181801850106551)
,p_button_name=>'CREATE-LIST-VALUE'
,p_static_id=>'create-list-value'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create List Value'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:43:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35182530435106551)
,p_name=>'P15_BUSINESS_LIST_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35180569189106550)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35182848140106551)
,p_name=>'After Create Dialog Closed'
,p_static_id=>'dialog-closed-create-parent'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35182622289106551)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35182991120106551)
,p_event_id=>wwv_flow_imp.id(35182848140106551)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P15_BUSINESS_LIST_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P42_BUSINESS_LIST_ID',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35183041603106551)
,p_event_id=>wwv_flow_imp.id(35182848140106551)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh ParentRegion'
,p_static_id=>'refresh-parent-region'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35180569189106550)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35183166138106551)
,p_event_id=>wwv_flow_imp.id(35182848140106551)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Select parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P15_BUSINESS_LIST_ID'') + '']'').click();',
    '                }, 2000);',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35183295384106551)
,p_name=>'Parent Action Dialog Closed'
,p_static_id=>'dialog-closed-parent-action'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35180569189106550)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35183398379106551)
,p_event_id=>wwv_flow_imp.id(35183295384106551)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh List Values'
,p_static_id=>'refresh-2-dialog-closed-parent-action-list-values'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35181801850106551)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35183462844106551)
,p_event_id=>wwv_flow_imp.id(35183295384106551)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Parent Region'
,p_static_id=>'refresh-parent-region-action'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35180569189106550)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35183511503106551)
,p_event_id=>wwv_flow_imp.id(35183295384106551)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'N'
,p_name=>'Select Parent'
,p_static_id=>'select-parent'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '                if ($v(''P15_BUSINESS_LIST_ID'') !== '''') {',
    '                setTimeout(function(){',
    '                    $(''.t-ContentRow-item[data-id='' + $v(''P15_BUSINESS_LIST_ID'') + '']'').click();',
    '                }, 2000);',
    '                }',
    '                ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35183626918106552)
,p_name=>'Refresh on dialog close List Values'
,p_static_id=>'dialog-refresh-list-values'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35181801850106551)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35183759216106552)
,p_event_id=>wwv_flow_imp.id(35183626918106552)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35181801850106551)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35183884402106552)
,p_name=>'Parent Row Selected'
,p_static_id=>'parent-row-selected'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.t-ContentRow-item'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#filter-business-lists'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35183996410106552)
,p_event_id=>wwv_flow_imp.id(35183884402106552)
,p_event_result=>'TRUE'
,p_action_sequence=>7
,p_execute_on_page_init=>'N'
,p_static_id=>'native-add-class'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35184064135106552)
,p_event_id=>wwv_flow_imp.id(35183884402106552)
,p_event_result=>'TRUE'
,p_action_sequence=>6
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-remove-class'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'JAVASCRIPT_EXPRESSION'
,p_affected_elements=>'$(''.t-ContentRow-item'')'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'is-selected')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35184161027106552)
,p_event_id=>wwv_flow_imp.id(35183884402106552)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh List Values'
,p_static_id=>'refresh-2-parent-row-selected-list-values'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35181801850106551)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35184295435106552)
,p_event_id=>wwv_flow_imp.id(35183884402106552)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'set-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P15_BUSINESS_LIST_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_expression', 'this.triggeringElement.getAttribute(''data-id'')',
  'suppress_change_event', 'N',
  'type', 'JAVASCRIPT_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35184397664106552)
,p_name=>'Smart Filter Change'
,p_static_id=>'smart-filter-change'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35180646952106550)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_SMART_FILTERS|REGION TYPE|facetschange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35184437840106552)
,p_event_id=>wwv_flow_imp.id(35184397664106552)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Clear Page Items'
,p_static_id=>'clear-page-items'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P15_BUSINESS_LIST_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35184560654106552)
,p_event_id=>wwv_flow_imp.id(35184397664106552)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'Refresh List Values'
,p_static_id=>'refresh-2-smart-filter-change-list-values'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35181801850106551)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00016
begin
wwv_flow_imp_page.create_page(
 p_id=>16
,p_name=>'Inventory History'
,p_alias=>'INVENTORY-HISTORY'
,p_step_title=>'Inventory History'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35049306859105914)
,p_protection_level=>'C'
,p_page_comment=>'Controllers and reviewers use this page to inspect inventory movement history without losing the ability to filter by warehouse, item, or transaction type.'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35092936889106107)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35093083686106107)
,p_plug_name=>'Inventory Transaction Report'
,p_static_id=>'history-filters'
,p_region_name=>'history-filters'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(35093103727106107)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
,p_plug_comment=>'Provides smart filters that narrow inventory transactions by warehouse, item, transaction type, and transaction timing.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35093292876106107)
,p_name=>'P16_F_ITEM_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35093083686106107)
,p_prompt=>'Item'
,p_source=>'ITEM_ID'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'ITEM_LOV'
,p_lov_display_extra=>'YES'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'L'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35093462916106108)
,p_name=>'P16_F_TRANSACTION_AT'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35093083686106107)
,p_prompt=>'Transaction At'
,p_source=>'TRANSACTION_AT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RANGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'manual_entry', 'N',
  'select_multiple', 'N')).to_clob
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'L'
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35093553071106108)
,p_name=>'P16_F_TRANSACTION_TYPE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35093083686106107)
,p_prompt=>'Transaction Type'
,p_source=>'TRANSACTION_TYPE_CODE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'TRANSACTION_TYPE_LOV'
,p_lov_display_extra=>'YES'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'L'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35093616085106108)
,p_name=>'P16_F_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35093083686106107)
,p_prompt=>'Warehouse'
,p_source=>'WAREHOUSE_ID'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_extra=>'YES'
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'L'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35093378710106107)
,p_name=>'P16_SEARCH'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_imp.id(35093083686106107)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35093103727106107)
,p_name=>'Inventory Transaction Report'
,p_static_id=>'inventory-transaction-report'
,p_parent_plug_id=>wwv_flow_imp.id(35093083686106107)
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noUI:t-Region--hideHeader js-addHiddenHeadingRoleDesc:margin-top-md'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select itx.inventory_transaction_id as inventory_transaction_id',
'     , wh.warehouse_id as warehouse_id',
'     , it.item_id as item_id',
'     , itx.transaction_type_code as transaction_type_code',
'     , itx.transaction_at as transaction_at',
'     , wh.warehouse_name as warehouse_name',
'     , it.item_code as item_code',
'     , it.item_name as item_name',
'     , il.lot_number as lot_number',
'     , bp.partner_name as owner_partner_name',
'     , itx.from_status_code as from_status_code',
'     , itx.to_status_code as to_status_code',
'     , itx.quantity as quantity',
'     , fl.location_code as from_location_code',
'     , tl.location_code as to_location_code',
'     , itx.reference_document_type as reference_document_type',
'     , itx.reference_document_number as reference_document_number',
'     , itx.reason_code as reason_code',
'     , itx.reason_description as reason_description',
'     , itx.performed_by as performed_by',
'from scm_inventory_transactions itx',
'join scm_warehouses wh',
'    on wh.warehouse_id = itx.warehouse_id',
'join scm_items it',
'    on it.item_id = itx.item_id',
'left join scm_inventory_lots il',
'    on il.inventory_lot_id = itx.inventory_lot_id',
'left join scm_business_partners bp',
'    on bp.business_partner_id = itx.owner_partner_id',
'left join scm_storage_locations fl',
'    on fl.storage_location_id = itx.from_location_id',
'left join scm_storage_locations tl',
'    on tl.storage_location_id = itx.to_location_id',
'order by itx.transaction_at desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays inventory transactions with warehouse, item, location, and reference context so users can trace stock movement history.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35093749357106108)
,p_query_column_id=>14
,p_column_alias=>'FROM_LOCATION_CODE'
,p_column_display_sequence=>140
,p_column_heading=>'From Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35093856138106108)
,p_query_column_id=>11
,p_column_alias=>'FROM_STATUS_CODE'
,p_column_display_sequence=>110
,p_column_heading=>'From Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35093978661106108)
,p_query_column_id=>1
,p_column_alias=>'INVENTORY_TRANSACTION_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35094022795106108)
,p_query_column_id=>7
,p_column_alias=>'ITEM_CODE'
,p_column_display_sequence=>70
,p_column_heading=>'Item Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35094184006106108)
,p_query_column_id=>3
,p_column_alias=>'ITEM_ID'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35094207703106108)
,p_query_column_id=>8
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>80
,p_column_heading=>'Item Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35094364144106108)
,p_query_column_id=>9
,p_column_alias=>'LOT_NUMBER'
,p_column_display_sequence=>90
,p_column_heading=>'Lot Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35094448243106108)
,p_query_column_id=>10
,p_column_alias=>'OWNER_PARTNER_NAME'
,p_column_display_sequence=>100
,p_column_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35094584044106108)
,p_query_column_id=>20
,p_column_alias=>'PERFORMED_BY'
,p_column_display_sequence=>200
,p_column_heading=>'Performed By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35094607179106108)
,p_query_column_id=>13
,p_column_alias=>'QUANTITY'
,p_column_display_sequence=>130
,p_column_heading=>'Quantity'
,p_column_format=>'FM999G999G999G990D0000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35094774857106108)
,p_query_column_id=>18
,p_column_alias=>'REASON_CODE'
,p_column_display_sequence=>180
,p_column_heading=>'Reason Code'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35094881506106108)
,p_query_column_id=>19
,p_column_alias=>'REASON_DESCRIPTION'
,p_column_display_sequence=>190
,p_column_heading=>'Reason Description'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35094911243106108)
,p_query_column_id=>17
,p_column_alias=>'REFERENCE_DOCUMENT_NUMBER'
,p_column_display_sequence=>170
,p_column_heading=>'Reference Document Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35095008913106108)
,p_query_column_id=>16
,p_column_alias=>'REFERENCE_DOCUMENT_TYPE'
,p_column_display_sequence=>160
,p_column_heading=>'Reference Document Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35095178637106108)
,p_query_column_id=>15
,p_column_alias=>'TO_LOCATION_CODE'
,p_column_display_sequence=>150
,p_column_heading=>'To Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35095255984106108)
,p_query_column_id=>12
,p_column_alias=>'TO_STATUS_CODE'
,p_column_display_sequence=>120
,p_column_heading=>'To Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35095331769106108)
,p_query_column_id=>5
,p_column_alias=>'TRANSACTION_AT'
,p_column_display_sequence=>50
,p_column_heading=>'Transaction At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35095424159106108)
,p_query_column_id=>4
,p_column_alias=>'TRANSACTION_TYPE_CODE'
,p_column_display_sequence=>40
,p_column_heading=>'Transaction Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35095592472106150)
,p_query_column_id=>2
,p_column_alias=>'WAREHOUSE_ID'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35095695970106150)
,p_query_column_id=>6
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>60
,p_column_heading=>'Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35095787051106150)
,p_name=>'Serial Event Report'
,p_static_id=>'serial-event-report'
,p_template=>4073835273271169698
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select se.serial_event_id as serial_event_id',
'     , it.item_name as item_name',
'     , srl.serial_number as serial_number',
'     , il.lot_number as lot_number',
'     , wh.warehouse_name as warehouse_name',
'     , fl.location_code as from_location_code',
'     , tl.location_code as to_location_code',
'     , se.event_type_code as event_type_code',
'     , se.from_status_code as from_status_code',
'     , se.to_status_code as to_status_code',
'     , se.reference_document_type as reference_document_type',
'     , se.reference_document_number as reference_document_number',
'     , se.event_at as event_at',
'     , se.performed_by as performed_by',
'     , se.event_notes as event_notes',
'from scm_serial_events se',
'join scm_item_serials srl',
'    on srl.item_serial_id = se.item_serial_id',
'join scm_items it',
'    on it.item_id = srl.item_id',
'left join scm_inventory_lots il',
'    on il.inventory_lot_id = srl.inventory_lot_id',
'left join scm_warehouses wh',
'    on wh.warehouse_id = se.warehouse_id',
'left join scm_storage_locations fl',
'    on fl.storage_location_id = se.from_location_id',
'left join scm_storage_locations tl',
'    on tl.storage_location_id = se.to_location_id',
'order by se.event_at desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays serial events with warehouse, location, and document context so users can trace serial-controlled stock movements and status changes.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35095844773106151)
,p_query_column_id=>13
,p_column_alias=>'EVENT_AT'
,p_column_display_sequence=>130
,p_column_heading=>'Event At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35095987343106151)
,p_query_column_id=>15
,p_column_alias=>'EVENT_NOTES'
,p_column_display_sequence=>150
,p_column_heading=>'Event Notes'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35096021683106151)
,p_query_column_id=>8
,p_column_alias=>'EVENT_TYPE_CODE'
,p_column_display_sequence=>80
,p_column_heading=>'Event Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35096201710106151)
,p_query_column_id=>6
,p_column_alias=>'FROM_LOCATION_CODE'
,p_column_display_sequence=>60
,p_column_heading=>'From Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35096270638106151)
,p_query_column_id=>9
,p_column_alias=>'FROM_STATUS_CODE'
,p_column_display_sequence=>90
,p_column_heading=>'From Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35096362177106151)
,p_query_column_id=>2
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35096436263106151)
,p_query_column_id=>4
,p_column_alias=>'LOT_NUMBER'
,p_column_display_sequence=>40
,p_column_heading=>'Lot Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35096572776106151)
,p_query_column_id=>14
,p_column_alias=>'PERFORMED_BY'
,p_column_display_sequence=>140
,p_column_heading=>'Performed By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35096671595106151)
,p_query_column_id=>12
,p_column_alias=>'REFERENCE_DOCUMENT_NUMBER'
,p_column_display_sequence=>120
,p_column_heading=>'Reference Document Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35096710918106151)
,p_query_column_id=>11
,p_column_alias=>'REFERENCE_DOCUMENT_TYPE'
,p_column_display_sequence=>110
,p_column_heading=>'Reference Document Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35096889321106151)
,p_query_column_id=>1
,p_column_alias=>'SERIAL_EVENT_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35096927732106151)
,p_query_column_id=>3
,p_column_alias=>'SERIAL_NUMBER'
,p_column_display_sequence=>30
,p_column_heading=>'Serial Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35097004509106151)
,p_query_column_id=>7
,p_column_alias=>'TO_LOCATION_CODE'
,p_column_display_sequence=>70
,p_column_heading=>'To Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35097105346106151)
,p_query_column_id=>10
,p_column_alias=>'TO_STATUS_CODE'
,p_column_display_sequence=>100
,p_column_heading=>'To Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35097274288106151)
,p_query_column_id=>5
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>50
,p_column_heading=>'Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35097377820106151)
,p_name=>'Refresh on dialog close Inventory Transaction Report'
,p_static_id=>'dialog-refresh-inventory-transaction-report'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35093103727106107)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35097482612106151)
,p_event_id=>wwv_flow_imp.id(35097377820106151)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35093103727106107)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35097569020106151)
,p_name=>'Refresh on dialog close Serial Event Report'
,p_static_id=>'dialog-refresh-serial-event-report'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35095787051106150)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35097684972106151)
,p_event_id=>wwv_flow_imp.id(35097569020106151)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35095787051106150)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00017
begin
wwv_flow_imp_page.create_page(
 p_id=>17
,p_name=>'Lot and Serial Traceability'
,p_alias=>'LOT-AND-SERIAL-TRACEABILITY'
,p_step_title=>'Lot and Serial Traceability'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35048827808105913)
,p_protection_level=>'C'
,p_page_comment=>'Controllers, service teams, and quality reviewers use this page to inspect lot status, serial status, expiry timing, and current storage context without leaving the traceability workspace.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35084287605106065)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35084327928106065)
,p_name=>'Inventory Lots'
,p_static_id=>'inventory-lots'
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select il.inventory_lot_id as inventory_lot_id',
'     , il.lot_number as lot_number',
'     , it.item_name as item_name',
'     , bp.partner_name as owner_partner_name',
'     , il.supplier_lot_number as supplier_lot_number',
'     , il.manufactured_on_date as manufactured_on_date',
'     , il.received_on_date as received_on_date',
'     , il.best_before_date as best_before_date',
'     , il.expiry_on_date as expiry_on_date',
'     , il.lot_status_code as lot_status_code',
'from scm_inventory_lots il',
'join scm_items it',
'    on it.item_id = il.item_id',
'left join scm_business_partners bp',
'    on bp.business_partner_id = il.owner_partner_id',
'order by il.expiry_on_date nulls last, it.item_name, il.lot_number'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays inventory lots with item, owner, supplier-lot, and shelf-life context so users can trace controlled stock across its lifecycle.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35084483556106065)
,p_query_column_id=>8
,p_column_alias=>'BEST_BEFORE_DATE'
,p_column_display_sequence=>80
,p_column_heading=>'Best Before'
,p_column_format=>'DD-MON-YYYY'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35084522967106065)
,p_query_column_id=>9
,p_column_alias=>'EXPIRY_ON_DATE'
,p_column_display_sequence=>90
,p_column_heading=>'Expiry On'
,p_column_format=>'DD-MON-YYYY'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35084641283106065)
,p_query_column_id=>1
,p_column_alias=>'INVENTORY_LOT_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35084773646106065)
,p_query_column_id=>3
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35084877448106065)
,p_query_column_id=>2
,p_column_alias=>'LOT_NUMBER'
,p_column_display_sequence=>20
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:49:&APP_SESSION.::&DEBUG.::P49_INVENTORY_LOT_ID:\#INVENTORY_LOT_ID#\'
,p_column_linktext=>'<span role="img" aria-label="" class="fa fa-edit" title=""></span>'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35084978235106065)
,p_query_column_id=>10
,p_column_alias=>'LOT_STATUS_CODE'
,p_column_display_sequence=>100
,p_column_heading=>'Lot Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35085038545106065)
,p_query_column_id=>6
,p_column_alias=>'MANUFACTURED_ON_DATE'
,p_column_display_sequence=>60
,p_column_heading=>'Manufactured On'
,p_column_format=>'DD-MON-YYYY'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35085202488106065)
,p_query_column_id=>4
,p_column_alias=>'OWNER_PARTNER_NAME'
,p_column_display_sequence=>40
,p_column_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35085224642106065)
,p_query_column_id=>7
,p_column_alias=>'RECEIVED_ON_DATE'
,p_column_display_sequence=>70
,p_column_heading=>'Received On'
,p_column_format=>'DD-MON-YYYY'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35085313161106066)
,p_query_column_id=>5
,p_column_alias=>'SUPPLIER_LOT_NUMBER'
,p_column_display_sequence=>50
,p_column_heading=>'Supplier Lot'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35085463393106066)
,p_name=>'Item Serials'
,p_static_id=>'item-serials'
,p_template=>4073835273271169698
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination:t-Region--noBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select isr.item_serial_id as item_serial_id',
'     , isr.serial_number as serial_number',
'     , it.item_name as item_name',
'     , il.lot_number as lot_number',
'     , bp.partner_name as owner_partner_name',
'     , wh.warehouse_name as warehouse_name',
'     , sl.location_code as location_code',
'     , isr.source_inbound_receipt_line_id as source_inbound_receipt_line_id',
'     , isr.current_status_code as current_status_code',
'     , isr.serial_condition_code as serial_condition_code',
'     , isr.received_at as received_at',
'     , isr.last_moved_at as last_moved_at',
'     , isr.last_document_type as last_document_type',
'     , isr.last_document_number as last_document_number',
'     , isr.is_active as is_active',
'from scm_item_serials isr',
'join scm_items it',
'    on it.item_id = isr.item_id',
'left join scm_inventory_lots il',
'    on il.inventory_lot_id = isr.inventory_lot_id',
'left join scm_business_partners bp',
'    on bp.business_partner_id = isr.owner_partner_id',
'left join scm_warehouses wh',
'    on wh.warehouse_id = isr.current_warehouse_id',
'left join scm_storage_locations sl',
'    on sl.storage_location_id = isr.current_storage_location_id',
'order by isr.last_moved_at desc nulls last, isr.serial_number'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Displays item serials with lot, owner, warehouse, and current-location context so users can trace serial-controlled stock across operational events.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35085517099106066)
,p_query_column_id=>9
,p_column_alias=>'CURRENT_STATUS_CODE'
,p_column_display_sequence=>90
,p_column_heading=>'Current Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35085636392106066)
,p_query_column_id=>15
,p_column_alias=>'IS_ACTIVE'
,p_column_display_sequence=>150
,p_column_heading=>'Is Active'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35085783522106103)
,p_query_column_id=>3
,p_column_alias=>'ITEM_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35085830013106103)
,p_query_column_id=>1
,p_column_alias=>'ITEM_SERIAL_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35085949330106103)
,p_query_column_id=>14
,p_column_alias=>'LAST_DOCUMENT_NUMBER'
,p_column_display_sequence=>140
,p_column_heading=>'Last Document Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35086054087106104)
,p_query_column_id=>13
,p_column_alias=>'LAST_DOCUMENT_TYPE'
,p_column_display_sequence=>130
,p_column_heading=>'Last Document Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35086112714106104)
,p_query_column_id=>12
,p_column_alias=>'LAST_MOVED_AT'
,p_column_display_sequence=>120
,p_column_heading=>'Last Moved At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35086292616106104)
,p_query_column_id=>7
,p_column_alias=>'LOCATION_CODE'
,p_column_display_sequence=>70
,p_column_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35086360007106104)
,p_query_column_id=>4
,p_column_alias=>'LOT_NUMBER'
,p_column_display_sequence=>40
,p_column_heading=>'Lot Number'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35086494619106104)
,p_query_column_id=>5
,p_column_alias=>'OWNER_PARTNER_NAME'
,p_column_display_sequence=>50
,p_column_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35086589687106104)
,p_query_column_id=>11
,p_column_alias=>'RECEIVED_AT'
,p_column_display_sequence=>110
,p_column_heading=>'Received At'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35086678302106104)
,p_query_column_id=>10
,p_column_alias=>'SERIAL_CONDITION_CODE'
,p_column_display_sequence=>100
,p_column_heading=>'Serial Condition'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35086801068106104)
,p_query_column_id=>2
,p_column_alias=>'SERIAL_NUMBER'
,p_column_display_sequence=>20
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:50:&APP_SESSION.::&DEBUG.::P50_ITEM_SERIAL_ID:\#ITEM_SERIAL_ID#\'
,p_column_linktext=>'<span role="img" aria-label="" class="fa fa-edit" title=""></span>'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35086805398106104)
,p_query_column_id=>8
,p_column_alias=>'SOURCE_INBOUND_RECEIPT_LINE_ID'
,p_column_display_sequence=>80
,p_column_heading=>'Source Receipt Line'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35086922800106104)
,p_query_column_id=>6
,p_column_alias=>'WAREHOUSE_NAME'
,p_column_display_sequence=>60
,p_column_heading=>'Warehouse'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35087084491106104)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35084327928106065)
,p_button_name=>'CREATE-LOT'
,p_static_id=>'create-lot'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Lot'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:49:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049893362105914)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35087104505106104)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35085463393106066)
,p_button_name=>'CREATE-SERIAL'
,p_static_id=>'create-serial'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Serial'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:50:&APP_SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049893362105914)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35087210721106104)
,p_name=>'Refresh on dialog close Inventory Lots'
,p_static_id=>'dialog-refresh-inventory-lots'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35084327928106065)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35087321654106104)
,p_event_id=>wwv_flow_imp.id(35087210721106104)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35084327928106065)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35087444286106104)
,p_name=>'Refresh on dialog close Item Serials'
,p_static_id=>'dialog-refresh-item-serials'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(35085463393106066)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35087528195106104)
,p_event_id=>wwv_flow_imp.id(35087444286106104)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35085463393106066)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'Y')).to_clob
);
end;
/
prompt --application/pages/page_00018
begin
wwv_flow_imp_page.create_page(
 p_id=>18
,p_name=>'Performance and Trends'
,p_alias=>'PERFORMANCE-AND-TRENDS'
,p_step_title=>'Performance and Trends'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(35049188188105914)
,p_protection_level=>'C'
,p_page_comment=>'Supply chain leaders and reviewers use this page to inspect service risk, stock health, warehouse pressure, and repeated issue trends across the warehouse network.'
,p_page_component_map=>'27'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35192887748106600)
,p_plug_name=>'Adjustment Activity Trend'
,p_static_id=>'adjustment-activity-trend'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_comment=>'Tracks monthly stock-adjustment activity so controllers and reviewers can see when corrective inventory changes are rising.'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(35192936855106600)
,p_region_id=>wwv_flow_imp.id(35192887748106600)
,p_chart_type=>'line'
,p_title=>'Adjustment Activity Trend'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(35193092297106600)
,p_chart_id=>wwv_flow_imp.id(35192936855106600)
,p_static_id=>'adjustment-activity-trend'
,p_seq=>10
,p_name=>'Adjustment Activity Trend'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(trunc(nvl(sa.applied_at, sa.requested_at), ''MM''), ''MON YYYY'') as period_label',
'     , count(*) as adjustment_count',
'from scm_stock_adjustments sa',
'where nvl(sa.applied_at, sa.requested_at) is not null',
'group by trunc(nvl(sa.applied_at, sa.requested_at), ''MM'')',
'order by trunc(nvl(sa.applied_at, sa.requested_at), ''MM'')'))
,p_series_type=>'line'
,p_items_value_column_name=>'ADJUSTMENT_COUNT'
,p_items_label_column_name=>'PERIOD_LABEL'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35193152833106600)
,p_chart_id=>wwv_flow_imp.id(35192936855106600)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35193289068106600)
,p_chart_id=>wwv_flow_imp.id(35192936855106600)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35193340826106600)
,p_plug_name=>'Aging Stock By Expiry'
,p_static_id=>'aging-stock-by-expiry'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_comment=>'Groups lots by expiry horizon so users can review aging, short-dated, and expired stock exposure.'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(35193489875106614)
,p_region_id=>wwv_flow_imp.id(35193340826106600)
,p_chart_type=>'bar'
,p_title=>'Aging Stock By Expiry'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(35193531412106615)
,p_chart_id=>wwv_flow_imp.id(35193489875106614)
,p_static_id=>'aging-stock-by-expiry'
,p_seq=>10
,p_name=>'Aging Stock By Expiry'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with lot_buckets as (',
'    select case',
'             when il.expiry_on_date is null then ''No Expiry''',
'             when il.expiry_on_date < trunc(sysdate) then ''Expired''',
'             when il.expiry_on_date <= trunc(sysdate) + 30 then ''0-30 Days''',
'             when il.expiry_on_date <= trunc(sysdate) + 90 then ''31-90 Days''',
'             else ''90+ Days''',
'           end as age_bucket',
'         , case',
'             when il.expiry_on_date < trunc(sysdate) then 1',
'             when il.expiry_on_date <= trunc(sysdate) + 30 then 2',
'             when il.expiry_on_date <= trunc(sysdate) + 90 then 3',
'             when il.expiry_on_date is null then 5',
'             else 4',
'           end as sort_order',
'    from scm_inventory_lots il',
')',
'select lb.age_bucket as age_bucket',
'     , count(*) as lot_count',
'from lot_buckets lb',
'group by lb.age_bucket, lb.sort_order',
'order by lb.sort_order'))
,p_series_type=>'bar'
,p_items_value_column_name=>'LOT_COUNT'
,p_items_label_column_name=>'AGE_BUCKET'
,p_line_type=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35193653549106615)
,p_chart_id=>wwv_flow_imp.id(35193489875106614)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35193712899106615)
,p_chart_id=>wwv_flow_imp.id(35193489875106614)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35193889354106615)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(35051607112105935)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35193972750106615)
,p_plug_name=>'Count Accuracy Trend'
,p_static_id=>'count-accuracy-trend'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_comment=>'Tracks count accuracy over time so controllers can review variance trends and repeated stock-count issues.'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(35194006986106615)
,p_region_id=>wwv_flow_imp.id(35193972750106615)
,p_chart_type=>'line'
,p_title=>'Count Accuracy Trend'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(35194199491106615)
,p_chart_id=>wwv_flow_imp.id(35194006986106615)
,p_static_id=>'count-accuracy-trend'
,p_seq=>10
,p_name=>'Count Accuracy Trend'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(trunc(sc.completed_at, ''MM''), ''MON YYYY'') as period_label',
'     , round(',
'         case',
'           when sum(scl.expected_quantity) = 0 then 100',
'           else 100 - ((sum(abs(scl.counted_quantity - scl.expected_quantity)) / sum(scl.expected_quantity)) * 100)',
'         end',
'       , 2) as count_accuracy_percent',
'from scm_stock_counts sc',
'join scm_stock_count_lines scl',
'    on scl.stock_count_id = sc.stock_count_id',
'where sc.completed_at is not null',
'group by trunc(sc.completed_at, ''MM'')',
'order by trunc(sc.completed_at, ''MM'')'))
,p_series_type=>'line'
,p_items_value_column_name=>'COUNT_ACCURACY_PERCENT'
,p_items_label_column_name=>'PERIOD_LABEL'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35194293545106615)
,p_chart_id=>wwv_flow_imp.id(35194006986106615)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35194348943106615)
,p_chart_id=>wwv_flow_imp.id(35194006986106615)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35194416109106615)
,p_plug_name=>'name: Late Receipts'
,p_static_id=>'late-receipts'
,p_region_template_options=>'#DEFAULT#:margin-top-md:margin-bottom-md'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) as late_receipt_count',
'from scm_inbound_receipts ir',
'where ir.expected_arrival_at is not null',
'  and (',
'        (ir.actual_arrival_at is null and ir.expected_arrival_at < systimestamp)',
'     or (ir.actual_arrival_at is not null and ir.actual_arrival_at > ir.expected_arrival_at)',
'      )'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$METRIC_CARD'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'AVATAR_ALIGNMENT', 't-MetricCard-body--avatarAlignmentStart',
  'AVATAR_ICON', 'fa-clock-o',
  'AVATAR_POSITION', 't-MetricCard-body--avatarPositionInline',
  'AVATAR_SHAPE', 't-Avatar--rounded',
  'AVATAR_SIZE', 't-Avatar--md',
  'AVATAR_STYLE', 't-MetricCard-avatar--subtle',
  'AVATAR_TYPE', 'icon',
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'N',
  'LAYOUT', 'stacked',
  'META', 'Open or late inbound work',
  'METRIC', '&LATE_RECEIPT_COUNT.',
  'METRIC_CSS_CLASSES', 'u-text-subheading-md',
  'TITLE', 'Late Receipts')).to_clob
,p_plug_comment=>'Highlights receipts that have not arrived on time or arrived after their expected timestamp so users can see inbound service risk quickly.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35194518641106616)
,p_name=>'LATE_RECEIPT_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LATE_RECEIPT_COUNT'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_format_mask=>'999G999G999G999G990'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35194639241106616)
,p_plug_name=>'On-Time Dispatch Trend'
,p_static_id=>'on-time-dispatch-trend'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>100
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_comment=>'Tracks monthly on-time dispatch performance so transport and service teams can review shipment reliability trends.'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(35194772594106616)
,p_region_id=>wwv_flow_imp.id(35194639241106616)
,p_chart_type=>'line'
,p_title=>'On-Time Dispatch Trend'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(35194853504106616)
,p_chart_id=>wwv_flow_imp.id(35194772594106616)
,p_static_id=>'on-time-dispatch-trend'
,p_seq=>10
,p_name=>'On-Time Dispatch Trend'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(trunc(oo.dispatched_at, ''MM''), ''MON YYYY'') as period_label',
'     , round(',
'         case',
'           when sum(case when oo.promised_ship_at is not null then 1 else 0 end) = 0 then 0',
'           else (',
'               sum(case when oo.promised_ship_at is not null and oo.dispatched_at <= oo.promised_ship_at then 1 else 0 end)',
'               / sum(case when oo.promised_ship_at is not null then 1 else 0 end)',
'             ) * 100',
'         end',
'       , 2) as on_time_percent',
'from scm_outbound_orders oo',
'where oo.dispatched_at is not null',
'group by trunc(oo.dispatched_at, ''MM'')',
'order by trunc(oo.dispatched_at, ''MM'')'))
,p_series_type=>'line'
,p_items_value_column_name=>'ON_TIME_PERCENT'
,p_items_label_column_name=>'PERIOD_LABEL'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35194972733106616)
,p_chart_id=>wwv_flow_imp.id(35194772594106616)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35195089467106616)
,p_chart_id=>wwv_flow_imp.id(35194772594106616)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35195172437106616)
,p_plug_name=>'name: Open Exceptions'
,p_static_id=>'open-exceptions'
,p_region_template_options=>'#DEFAULT#:margin-top-md:margin-bottom-md'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) as open_exception_count',
'from scm_operational_exceptions oe',
'where oe.resolved_at is null'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$METRIC_CARD'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'AVATAR_ALIGNMENT', 't-MetricCard-body--avatarAlignmentStart',
  'AVATAR_ICON', 'fa-exclamation-triangle',
  'AVATAR_POSITION', 't-MetricCard-body--avatarPositionInline',
  'AVATAR_SHAPE', 't-Avatar--rounded',
  'AVATAR_SIZE', 't-Avatar--md',
  'AVATAR_STYLE', 't-MetricCard-avatar--subtle',
  'AVATAR_TYPE', 'icon',
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'N',
  'LAYOUT', 'stacked',
  'META', 'Unresolved issues',
  'METRIC', '&OPEN_EXCEPTION_COUNT.',
  'METRIC_CSS_CLASSES', 'u-text-subheading-md',
  'TITLE', 'Open Exceptions')).to_clob
,p_plug_comment=>'Highlights unresolved operational exceptions so reviewers can see active issue volume without leaving the trend page.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(35195205188106616)
,p_name=>'OPEN_EXCEPTION_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPEN_EXCEPTION_COUNT'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_format_mask=>'999G999G999G999G990'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35195354365106616)
,p_plug_name=>'Operational Exception Trend'
,p_static_id=>'operational-exception-trend'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>90
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_comment=>'Tracks monthly operational-exception volume so management can identify repeated issue patterns across warehouse processes.'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(35195464871106616)
,p_region_id=>wwv_flow_imp.id(35195354365106616)
,p_chart_type=>'line'
,p_title=>'Operational Exception Trend'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(35195580812106616)
,p_chart_id=>wwv_flow_imp.id(35195464871106616)
,p_static_id=>'operational-exception-trend'
,p_seq=>10
,p_name=>'Operational Exception Trend'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(trunc(oe.reported_at, ''MM''), ''MON YYYY'') as period_label',
'     , count(*) as exception_count',
'from scm_operational_exceptions oe',
'where oe.reported_at is not null',
'group by trunc(oe.reported_at, ''MM'')',
'order by trunc(oe.reported_at, ''MM'')'))
,p_series_type=>'line'
,p_items_value_column_name=>'EXCEPTION_COUNT'
,p_items_label_column_name=>'PERIOD_LABEL'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35195618686106616)
,p_chart_id=>wwv_flow_imp.id(35195464871106616)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35195715585106616)
,p_chart_id=>wwv_flow_imp.id(35195464871106616)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35195894885106616)
,p_plug_name=>'Supplier Delivery Accuracy Trend'
,p_static_id=>'supplier-delivery-accuracy-trend'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_comment=>'Tracks how closely received quantity matched expected quantity over time so procurement users can review supplier delivery accuracy trends.'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(35195928781106616)
,p_region_id=>wwv_flow_imp.id(35195894885106616)
,p_chart_type=>'line'
,p_title=>'Supplier Delivery Accuracy Trend'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(35196055753106616)
,p_chart_id=>wwv_flow_imp.id(35195928781106616)
,p_static_id=>'supplier-delivery-accuracy-trend'
,p_seq=>10
,p_name=>'Supplier Delivery Accuracy Trend'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(trunc(nvl(ir.actual_arrival_at, ir.expected_arrival_at), ''MM''), ''MON YYYY'') as period_label',
'     , round(',
'         case',
'           when sum(rl.expected_quantity) = 0 then 100',
'           else (sum(least(rl.received_quantity, rl.expected_quantity)) / sum(rl.expected_quantity)) * 100',
'         end',
'       , 2) as accuracy_percent',
'from scm_inbound_receipts ir',
'join scm_inbound_receipt_lines rl',
'    on rl.inbound_receipt_id = ir.inbound_receipt_id',
'where nvl(ir.actual_arrival_at, ir.expected_arrival_at) is not null',
'group by trunc(nvl(ir.actual_arrival_at, ir.expected_arrival_at), ''MM'')',
'order by trunc(nvl(ir.actual_arrival_at, ir.expected_arrival_at), ''MM'')'))
,p_series_type=>'line'
,p_items_value_column_name=>'ACCURACY_PERCENT'
,p_items_label_column_name=>'PERIOD_LABEL'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35196185272106616)
,p_chart_id=>wwv_flow_imp.id(35195928781106616)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35196237613106616)
,p_chart_id=>wwv_flow_imp.id(35195928781106616)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35196325898106616)
,p_plug_name=>'Warehouse Space Pressure'
,p_static_id=>'warehouse-space-pressure'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_comment=>'Compares total stock held against declared location capacity so users can review warehouse space usage and storage pressure.'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(35196405818106616)
,p_region_id=>wwv_flow_imp.id(35196325898106616)
,p_chart_type=>'bar'
,p_title=>'Warehouse Space Pressure'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(35196511199106616)
,p_chart_id=>wwv_flow_imp.id(35196405818106616)
,p_static_id=>'warehouse-space-pressure'
,p_seq=>10
,p_name=>'Warehouse Space Pressure'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with location_capacity as (',
'    select sl.warehouse_id as warehouse_id',
'         , sum(nvl(sl.max_capacity_units, 0)) as total_capacity_units',
'    from scm_storage_locations sl',
'    group by sl.warehouse_id',
'),',
'warehouse_stock as (',
'    select sl.warehouse_id as warehouse_id',
'         , sum(nvl(ib.quantity_on_hand, 0)) as total_quantity_on_hand',
'    from scm_storage_locations sl',
'    left join scm_inventory_balances ib',
'        on ib.storage_location_id = sl.storage_location_id',
'    group by sl.warehouse_id',
')',
'select wh.warehouse_name as warehouse_name',
'     , round(',
'         case',
'           when nvl(lc.total_capacity_units, 0) = 0 then 0',
'           else (nvl(ws.total_quantity_on_hand, 0) / lc.total_capacity_units) * 100',
'         end',
'       , 2) as capacity_used_percent',
'from scm_warehouses wh',
'left join location_capacity lc',
'    on lc.warehouse_id = wh.warehouse_id',
'left join warehouse_stock ws',
'    on ws.warehouse_id = wh.warehouse_id',
'order by wh.warehouse_name'))
,p_series_type=>'bar'
,p_items_value_column_name=>'CAPACITY_USED_PERCENT'
,p_items_label_column_name=>'WAREHOUSE_NAME'
,p_line_type=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35196673179106617)
,p_chart_id=>wwv_flow_imp.id(35196405818106616)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35196719172106617)
,p_chart_id=>wwv_flow_imp.id(35196405818106616)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35196874209106617)
,p_plug_name=>'Write-Off Activity Trend'
,p_static_id=>'write-off-activity-trend'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_comment=>'Tracks approved write-off quantities over time so finance and quality reviewers can see stock-loss trends clearly.'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(35196959080106617)
,p_region_id=>wwv_flow_imp.id(35196874209106617)
,p_chart_type=>'line'
,p_title=>'Write-Off Activity Trend'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(35197043091106617)
,p_chart_id=>wwv_flow_imp.id(35196959080106617)
,p_static_id=>'write-off-activity-trend'
,p_seq=>10
,p_name=>'Write-Off Activity Trend'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(trunc(nvl(sa.applied_at, sa.requested_at), ''MM''), ''MON YYYY'') as period_label',
'     , sum(nvl(sal.quantity, 0)) as write_off_quantity',
'from scm_stock_adjustments sa',
'join scm_stock_adjustment_lines sal',
'    on sal.stock_adjustment_id = sa.stock_adjustment_id',
'where sa.adjustment_type_code = ''WRITE_OFF''',
'  and nvl(sa.applied_at, sa.requested_at) is not null',
'group by trunc(nvl(sa.applied_at, sa.requested_at), ''MM'')',
'order by trunc(nvl(sa.applied_at, sa.requested_at), ''MM'')'))
,p_series_type=>'line'
,p_items_value_column_name=>'WRITE_OFF_QUANTITY'
,p_items_label_column_name=>'PERIOD_LABEL'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35197130850106617)
,p_chart_id=>wwv_flow_imp.id(35196959080106617)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(35197295525106617)
,p_chart_id=>wwv_flow_imp.id(35196959080106617)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
end;
/
prompt --application/pages/page_00030
begin
wwv_flow_imp_page.create_page(
 p_id=>30
,p_name=>'Receipt'
,p_alias=>'RECEIPT'
,p_page_mode=>'MODAL'
,p_step_title=>'Receipt'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Receiving teams open this modal page from the receipt workspace to create or edit one inbound receipt header without leaving the operational context.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35064645563105980)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35064755848105980)
,p_plug_name=>'Receipt Form'
,p_static_id=>'receipt-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_INBOUND_RECEIPTS'
,p_query_where=>'INBOUND_RECEIPT_ID = :P30_INBOUND_RECEIPT_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P30_INBOUND_RECEIPT_ID'
,p_plug_comment=>'Maintains the header data required to identify, schedule, and track one inbound receipt.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35066258554105982)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35064645563105980)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P30_INBOUND_RECEIPT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049553730105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35066374726105982)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35064645563105980)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049553730105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35066495111105982)
,p_button_id=>wwv_flow_imp.id(35066374726105982)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35066549751105982)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35064645563105980)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P30_INBOUND_RECEIPT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049553730105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35066651314105982)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35064645563105980)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P30_INBOUND_RECEIPT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049553730105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35064857896105980)
,p_name=>'P30_ACTUAL_ARRIVAL_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_item_source_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_prompt=>'Actual Arrival At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'ACTUAL_ARRIVAL_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35064917451105980)
,p_name=>'P30_CARRIER_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_item_source_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_prompt=>'Carrier Reference'
,p_source=>'CARRIER_REFERENCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35065035012105980)
,p_name=>'P30_EXPECTED_ARRIVAL_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_item_source_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_prompt=>'Expected Arrival At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'EXPECTED_ARRIVAL_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35065182276105980)
,p_name=>'P30_INBOUND_RECEIPT_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_item_source_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_source=>'INBOUND_RECEIPT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35065266409105980)
,p_name=>'P30_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_item_source_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35065304657105980)
,p_name=>'P30_RECEIPT_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_item_source_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_prompt=>'Receipt Number'
,p_source=>'RECEIPT_NUMBER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35065492848105981)
,p_name=>'P30_RECEIPT_SOURCE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_item_source_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_prompt=>'Receipt Source Code'
,p_source=>'RECEIPT_SOURCE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35065600872105981)
,p_name=>'P30_RECEIPT_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_item_source_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_prompt=>'Receipt Status Code'
,p_source=>'RECEIPT_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35065621812105981)
,p_name=>'P30_RECEIVED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_item_source_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_prompt=>'Received By'
,p_source=>'RECEIVED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35065731782105981)
,p_name=>'P30_RECEIVING_COMPLETED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_item_source_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_prompt=>'Receiving Completed At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'RECEIVING_COMPLETED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35065849775105981)
,p_name=>'P30_SOURCE_DOCUMENT_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_item_source_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_prompt=>'Source Document Number'
,p_source=>'SOURCE_DOCUMENT_NUMBER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35065922285105981)
,p_name=>'P30_SOURCE_PARTNER_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_item_source_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_prompt=>'Source Partner ID'
,p_source=>'SOURCE_PARTNER_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PARTNER_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35066089057105982)
,p_name=>'P30_SOURCE_SITE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_item_source_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_prompt=>'Source Site ID'
,p_source=>'SOURCE_SITE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PARTNER_SITE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35066131149105982)
,p_name=>'P30_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_item_source_plug_id=>wwv_flow_imp.id(35064755848105980)
,p_prompt=>'Warehouse ID'
,p_source=>'WAREHOUSE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35066756837105982)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P30_INBOUND_RECEIPT_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23466553651681848
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35066863145105982)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35064755848105980)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Receipt Form'
,p_static_id=>'initialize-form-receipt-form'
,p_internal_uid=>23466659959681848
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35066984187106021)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35064755848105980)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Receipt Form'
,p_static_id=>'process-form-receipt-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23466781001681887
);
end;
/
prompt --application/pages/page_00031
begin
wwv_flow_imp_page.create_page(
 p_id=>31
,p_name=>'Transfer'
,p_alias=>'TRANSFER'
,p_page_mode=>'MODAL'
,p_step_title=>'Transfer'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Controllers and managers open this modal page from the transfer workspace to create or edit one stock transfer header while keeping line review on the parent page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35190359119106597)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35190501039106598)
,p_plug_name=>'Transfer Form'
,p_static_id=>'transfer-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_STOCK_TRANSFERS'
,p_query_where=>'STOCK_TRANSFER_ID = :P31_STOCK_TRANSFER_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P31_STOCK_TRANSFER_ID'
,p_plug_comment=>'Maintains the header data required to request, approve, and complete one stock transfer between distinct source and destination warehouses, rejecting same-warehouse transfers at header capture.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35191944147106599)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35190359119106597)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P31_STOCK_TRANSFER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35192079477106599)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35190359119106597)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35192196091106599)
,p_button_id=>wwv_flow_imp.id(35192079477106599)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35192235038106599)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35190359119106597)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P31_STOCK_TRANSFER_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35192330928106599)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35190359119106597)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P31_STOCK_TRANSFER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35190539287106598)
,p_name=>'P31_ACTUAL_RECEIVED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_item_source_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_prompt=>'Actual Received At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'ACTUAL_RECEIVED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35190702865106598)
,p_name=>'P31_ACTUAL_SHIPPED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_item_source_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_prompt=>'Actual Shipped At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'ACTUAL_SHIPPED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35190729207106598)
,p_name=>'P31_APPROVAL_POLICY_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_item_source_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_prompt=>'Approval Policy ID'
,p_source=>'APPROVAL_POLICY_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'APPROVAL_POLICY_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35190819903106598)
,p_name=>'P31_APPROVED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_item_source_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_prompt=>'Approved At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'APPROVED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35190998152106598)
,p_name=>'P31_APPROVED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_item_source_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_prompt=>'Approved By'
,p_source=>'APPROVED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35191052349106598)
,p_name=>'P31_FROM_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_item_source_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_prompt=>'From Warehouse ID'
,p_source=>'FROM_WAREHOUSE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35191144847106598)
,p_name=>'P31_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_item_source_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35191206025106599)
,p_name=>'P31_REASON_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_item_source_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_prompt=>'Reason Code'
,p_source=>'REASON_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35191363970106599)
,p_name=>'P31_REQUESTED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_item_source_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_prompt=>'Requested By'
,p_source=>'REQUESTED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35191416133106599)
,p_name=>'P31_REQUESTED_SHIP_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_item_source_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_prompt=>'Requested Ship At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'REQUESTED_SHIP_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35191542326106599)
,p_name=>'P31_STOCK_TRANSFER_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_item_source_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_source=>'STOCK_TRANSFER_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35191619446106599)
,p_name=>'P31_TO_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_item_source_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_prompt=>'To Warehouse ID'
,p_source=>'TO_WAREHOUSE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35191772520106599)
,p_name=>'P31_TRANSFER_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_item_source_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_prompt=>'Transfer Number'
,p_source=>'TRANSFER_NUMBER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35191897816106599)
,p_name=>'P31_TRANSFER_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_item_source_plug_id=>wwv_flow_imp.id(35190501039106598)
,p_prompt=>'Transfer Status Code'
,p_source=>'TRANSFER_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35192435853106599)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P31_STOCK_TRANSFER_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23592232667682465
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35192507224106600)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35190501039106598)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Transfer Form'
,p_static_id=>'initialize-form-transfer-form'
,p_internal_uid=>23592304038682466
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35192693095106600)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35190501039106598)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Transfer Form'
,p_static_id=>'process-form-transfer-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23592489909682466
);
end;
/
prompt --application/pages/page_00032
begin
wwv_flow_imp_page.create_page(
 p_id=>32
,p_name=>'Outbound Order'
,p_alias=>'OUTBOUND-ORDER'
,p_page_mode=>'MODAL'
,p_step_title=>'Outbound Order'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Outbound teams open this modal page from the fulfilment workspace to create or edit one outbound order header while keeping line execution on the parent page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35187105171106594)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35187212443106595)
,p_plug_name=>'Outbound Order Form'
,p_static_id=>'outbound-order-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_OUTBOUND_ORDERS'
,p_query_where=>'OUTBOUND_ORDER_ID = :P32_OUTBOUND_ORDER_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P32_OUTBOUND_ORDER_ID'
,p_plug_comment=>'Maintains the header data required to allocate, ship, and dispatch one outbound order.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35189435392106597)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35187105171106594)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P32_OUTBOUND_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049064416105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35189564616106597)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35187105171106594)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049064416105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35189625593106597)
,p_button_id=>wwv_flow_imp.id(35189564616106597)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35189720160106597)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35187105171106594)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P32_OUTBOUND_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049064416105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35189807313106597)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35187105171106594)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P32_OUTBOUND_ORDER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049064416105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35187358103106595)
,p_name=>'P32_CARRIER_PARTNER_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Carrier Partner ID'
,p_source=>'CARRIER_PARTNER_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PARTNER_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35187441077106595)
,p_name=>'P32_CUSTOMER_PARTNER_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Customer Partner ID'
,p_source=>'CUSTOMER_PARTNER_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PARTNER_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35187533583106595)
,p_name=>'P32_DISPATCHED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Dispatched At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'DISPATCHED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35187623744106595)
,p_name=>'P32_DISPATCHED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Dispatched By'
,p_source=>'DISPATCHED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35187753393106595)
,p_name=>'P32_DISPATCH_REFERENCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Dispatch Reference'
,p_source=>'DISPATCH_REFERENCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35187815076106595)
,p_name=>'P32_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35187915959106595)
,p_name=>'P32_ORDER_TYPE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Order Type Code'
,p_source=>'ORDER_TYPE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35188057950106595)
,p_name=>'P32_OUTBOUND_ORDER_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_source=>'OUTBOUND_ORDER_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35188119866106596)
,p_name=>'P32_OUTBOUND_ORDER_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Outbound Order Number'
,p_source=>'OUTBOUND_ORDER_NUMBER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35188263881106596)
,p_name=>'P32_OUTBOUND_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Outbound Status Code'
,p_source=>'OUTBOUND_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35188367911106596)
,p_name=>'P32_PACKAGE_COUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Package Count'
,p_source=>'PACKAGE_COUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35188432758106596)
,p_name=>'P32_PACKED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Packed At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'PACKED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35188593549106596)
,p_name=>'P32_PACKED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Packed By'
,p_source=>'PACKED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35188630095106596)
,p_name=>'P32_PARTIAL_FULFILMENT_ALLOWED_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Partial Fulfilment Allowed Flag'
,p_source=>'PARTIAL_FULFILMENT_ALLOWED_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35188792407106596)
,p_name=>'P32_PICKED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Picked At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'PICKED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35188841189106596)
,p_name=>'P32_PICKED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Picked By'
,p_source=>'PICKED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35188932664106596)
,p_name=>'P32_PROMISED_SHIP_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Promised Ship At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'PROMISED_SHIP_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35189090646106597)
,p_name=>'P32_REQUESTED_SHIP_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Requested Ship At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'REQUESTED_SHIP_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35189201151106597)
,p_name=>'P32_SHIP_FROM_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Ship From Warehouse ID'
,p_source=>'SHIP_FROM_WAREHOUSE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35189266840106597)
,p_name=>'P32_SHIP_TO_SITE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Ship To Site ID'
,p_source=>'SHIP_TO_SITE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PARTNER_SITE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35189372196106597)
,p_name=>'P32_SOURCE_DOCUMENT_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_item_source_plug_id=>wwv_flow_imp.id(35187212443106595)
,p_prompt=>'Source Document Number'
,p_source=>'SOURCE_DOCUMENT_NUMBER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35189975136106597)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P32_OUTBOUND_ORDER_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23589771950682463
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35190045113106597)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35187212443106595)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Outbound Order Form'
,p_static_id=>'initialize-form-outbound-order-form'
,p_internal_uid=>23589841927682463
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35190192258106597)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35187212443106595)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Outbound Order Form'
,p_static_id=>'process-form-outbound-order-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23589989072682463
);
end;
/
prompt --application/pages/page_00033
begin
wwv_flow_imp_page.create_page(
 p_id=>33
,p_name=>'Return'
,p_alias=>'RETURN'
,p_page_mode=>'MODAL'
,p_step_title=>'Return'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Return teams open this modal page from the returns workspace to create or edit one return header while keeping line inspection on the parent page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35162233797106458)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35162361056106458)
,p_plug_name=>'Return Form'
,p_static_id=>'return-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_RETURNS'
,p_query_where=>'RETURN_ID = :P33_RETURN_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P33_RETURN_ID'
,p_plug_comment=>'Maintains the header data required to receive, assess, and complete one return.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35163912545106461)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35162233797106458)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P33_RETURN_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048790831105913)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35164072966106461)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35162233797106458)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048790831105913)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35164142178106461)
,p_button_id=>wwv_flow_imp.id(35164072966106461)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35164241283106461)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35162233797106458)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P33_RETURN_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048790831105913)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35164313512106461)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35162233797106458)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P33_RETURN_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048790831105913)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35162417247106459)
,p_name=>'P33_ASSESSED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_prompt=>'Assessed At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'ASSESSED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35162588610106459)
,p_name=>'P33_ASSESSED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_prompt=>'Assessed By'
,p_source=>'ASSESSED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35162697671106459)
,p_name=>'P33_EXPECTED_ARRIVAL_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_prompt=>'Expected Arrival At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'EXPECTED_ARRIVAL_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35162735802106459)
,p_name=>'P33_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35162871752106459)
,p_name=>'P33_RECEIVED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_prompt=>'Received At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'RECEIVED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35162940329106459)
,p_name=>'P33_RECEIVED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_prompt=>'Received By'
,p_source=>'RECEIVED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35163101302106459)
,p_name=>'P33_RELATED_OUTBOUND_ORDER_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_prompt=>'Related Outbound Order ID'
,p_source=>'RELATED_OUTBOUND_ORDER_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'OUTBOUND_ORDER_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35163109479106460)
,p_name=>'P33_RETURN_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_source=>'RETURN_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35163224585106460)
,p_name=>'P33_RETURN_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_prompt=>'Return Number'
,p_source=>'RETURN_NUMBER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35163362536106460)
,p_name=>'P33_RETURN_REASON_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_prompt=>'Return Reason Code'
,p_source=>'RETURN_REASON_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35163498381106460)
,p_name=>'P33_RETURN_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_prompt=>'Return Status Code'
,p_source=>'RETURN_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35163553604106460)
,p_name=>'P33_RETURN_TYPE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_prompt=>'Return Type Code'
,p_source=>'RETURN_TYPE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35163697091106460)
,p_name=>'P33_SOURCE_PARTNER_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_prompt=>'Source Partner ID'
,p_source=>'SOURCE_PARTNER_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PARTNER_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35163791607106460)
,p_name=>'P33_SOURCE_SITE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_prompt=>'Source Site ID'
,p_source=>'SOURCE_SITE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PARTNER_SITE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35163845607106461)
,p_name=>'P33_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_item_source_plug_id=>wwv_flow_imp.id(35162361056106458)
,p_prompt=>'Warehouse ID'
,p_source=>'WAREHOUSE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35164412578106461)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P33_RETURN_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23564209392682327
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35164588123106461)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35162361056106458)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Return Form'
,p_static_id=>'initialize-form-return-form'
,p_internal_uid=>23564384937682327
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35164677477106461)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35162361056106458)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Return Form'
,p_static_id=>'process-form-return-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23564474291682327
);
end;
/
prompt --application/pages/page_00034
begin
wwv_flow_imp_page.create_page(
 p_id=>34
,p_name=>'Stock Count'
,p_alias=>'STOCK-COUNT'
,p_page_mode=>'MODAL'
,p_step_title=>'Stock Count'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Controllers open this modal page from the count workspace to create or edit one stock count header while preserving the review queue on the parent page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35175093384106503)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35175107959106503)
,p_plug_name=>'Stock Count Form'
,p_static_id=>'stock-count-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_STOCK_COUNTS'
,p_query_where=>'STOCK_COUNT_ID = :P34_STOCK_COUNT_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P34_STOCK_COUNT_ID'
,p_plug_comment=>'Maintains the header data required to schedule and review one stock count.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35176532322106504)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35175093384106503)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P34_STOCK_COUNT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35176673428106504)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35175093384106503)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35176748587106504)
,p_button_id=>wwv_flow_imp.id(35176673428106504)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35176866488106504)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35175093384106503)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P34_STOCK_COUNT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35176959648106505)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35175093384106503)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P34_STOCK_COUNT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35175287979106503)
,p_name=>'P34_COMPLETED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_item_source_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_prompt=>'Completed At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'COMPLETED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35175400322106503)
,p_name=>'P34_COUNT_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_item_source_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_prompt=>'Count Number'
,p_source=>'COUNT_NUMBER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35175459888106503)
,p_name=>'P34_COUNT_SCOPE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_item_source_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_prompt=>'Count Scope Code'
,p_source=>'COUNT_SCOPE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35175587216106503)
,p_name=>'P34_COUNT_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_item_source_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_prompt=>'Count Status Code'
,p_source=>'COUNT_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35175690834106503)
,p_name=>'P34_COUNT_TYPE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_item_source_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_prompt=>'Count Type Code'
,p_source=>'COUNT_TYPE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35175738915106503)
,p_name=>'P34_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_item_source_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35175895209106504)
,p_name=>'P34_PLANNED_END_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_item_source_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_prompt=>'Planned End At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'PLANNED_END_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35175963668106504)
,p_name=>'P34_PLANNED_START_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_item_source_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_prompt=>'Planned Start At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'PLANNED_START_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35176038791106504)
,p_name=>'P34_REQUESTED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_item_source_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_prompt=>'Requested By'
,p_source=>'REQUESTED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35176190808106504)
,p_name=>'P34_REVIEWED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_item_source_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_prompt=>'Reviewed By'
,p_source=>'REVIEWED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35176295641106504)
,p_name=>'P34_STARTED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_item_source_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_prompt=>'Started At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'STARTED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35176327065106504)
,p_name=>'P34_STOCK_COUNT_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_item_source_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_source=>'STOCK_COUNT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35176415881106504)
,p_name=>'P34_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_item_source_plug_id=>wwv_flow_imp.id(35175107959106503)
,p_prompt=>'Warehouse ID'
,p_source=>'WAREHOUSE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35177085272106505)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P34_STOCK_COUNT_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23576882086682371
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35177106376106505)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35175107959106503)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Stock Count Form'
,p_static_id=>'initialize-form-stock-count-form'
,p_internal_uid=>23576903190682371
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35177292813106547)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35175107959106503)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Stock Count Form'
,p_static_id=>'process-form-stock-count-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23577089627682413
);
end;
/
prompt --application/pages/page_00035
begin
wwv_flow_imp_page.create_page(
 p_id=>35
,p_name=>'Stock Adjustment'
,p_alias=>'STOCK-ADJUSTMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Stock Adjustment'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Controllers and reviewers open this modal page from the adjustment workspace to create or edit one stock adjustment header while keeping the review queue visible on the parent page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35184766632106552)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35184852538106552)
,p_plug_name=>'Stock Adjustment Form'
,p_static_id=>'stock-adjustment-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_STOCK_ADJUSTMENTS'
,p_query_where=>'STOCK_ADJUSTMENT_ID = :P35_STOCK_ADJUSTMENT_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P35_STOCK_ADJUSTMENT_ID'
,p_plug_comment=>'Maintains the header data required to request, approve, and apply one stock adjustment.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35186232796106594)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35184766632106552)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P35_STOCK_ADJUSTMENT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35186371757106594)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35184766632106552)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35186461387106594)
,p_button_id=>wwv_flow_imp.id(35186371757106594)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35186599571106594)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35184766632106552)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P35_STOCK_ADJUSTMENT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35186632151106594)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35184766632106552)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P35_STOCK_ADJUSTMENT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35184909017106552)
,p_name=>'P35_ADJUSTMENT_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_item_source_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_prompt=>'Adjustment Number'
,p_source=>'ADJUSTMENT_NUMBER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35185013598106552)
,p_name=>'P35_ADJUSTMENT_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_item_source_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_prompt=>'Adjustment Status Code'
,p_source=>'ADJUSTMENT_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35185161938106553)
,p_name=>'P35_ADJUSTMENT_TYPE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_item_source_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_prompt=>'Adjustment Type Code'
,p_source=>'ADJUSTMENT_TYPE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35185274853106553)
,p_name=>'P35_APPLIED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_item_source_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_prompt=>'Applied At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'APPLIED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35185383170106553)
,p_name=>'P35_APPROVAL_POLICY_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_item_source_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_prompt=>'Approval Policy ID'
,p_source=>'APPROVAL_POLICY_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'APPROVAL_POLICY_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35185409763106553)
,p_name=>'P35_APPROVED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_item_source_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_prompt=>'Approved At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'APPROVED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35185567535106553)
,p_name=>'P35_APPROVED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_item_source_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_prompt=>'Approved By'
,p_source=>'APPROVED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35185611262106553)
,p_name=>'P35_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_item_source_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35185709484106553)
,p_name=>'P35_REASON_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_item_source_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_prompt=>'Reason Code'
,p_source=>'REASON_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35185872275106593)
,p_name=>'P35_REQUESTED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_item_source_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_prompt=>'Requested At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'REQUESTED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35185951155106594)
,p_name=>'P35_REQUESTED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_item_source_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_prompt=>'Requested By'
,p_source=>'REQUESTED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35186076600106594)
,p_name=>'P35_STOCK_ADJUSTMENT_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_item_source_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_source=>'STOCK_ADJUSTMENT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35186146395106594)
,p_name=>'P35_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_item_source_plug_id=>wwv_flow_imp.id(35184852538106552)
,p_prompt=>'Warehouse ID'
,p_source=>'WAREHOUSE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35186777052106594)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P35_STOCK_ADJUSTMENT_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23586573866682460
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35186892228106594)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35184852538106552)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Stock Adjustment Form'
,p_static_id=>'initialize-form-stock-adjustment-form'
,p_internal_uid=>23586689042682460
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35186954497106594)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35184852538106552)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Stock Adjustment Form'
,p_static_id=>'process-form-stock-adjustment-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23586751311682460
);
end;
/
prompt --application/pages/page_00036
begin
wwv_flow_imp_page.create_page(
 p_id=>36
,p_name=>'Warehouse'
,p_alias=>'WAREHOUSE'
,p_page_mode=>'MODAL'
,p_step_title=>'Warehouse'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Administrators open this modal page from the warehouse structure workspace to create or edit one warehouse header without leaving the structural context.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35097854364106151)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35097910085106151)
,p_plug_name=>'Warehouse Form'
,p_static_id=>'warehouse-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_WAREHOUSES'
,p_query_where=>'WAREHOUSE_ID = :P36_WAREHOUSE_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P36_WAREHOUSE_ID'
,p_plug_comment=>'Maintains the core identification, unique warehouse code, status, and address attributes for one warehouse.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35099394984106153)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35097854364106151)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P36_WAREHOUSE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35099485784106153)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35097854364106151)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35099524792106153)
,p_button_id=>wwv_flow_imp.id(35099485784106153)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35099681129106153)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35097854364106151)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P36_WAREHOUSE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35099753589106153)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35097854364106151)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P36_WAREHOUSE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35098088566106151)
,p_name=>'P36_ADDRESS_LINE_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_item_source_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_prompt=>'Address Line 1'
,p_source=>'ADDRESS_LINE_1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35098160174106152)
,p_name=>'P36_ADDRESS_LINE_2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_item_source_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_prompt=>'Address Line 2'
,p_source=>'ADDRESS_LINE_2'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35098228073106152)
,p_name=>'P36_CITY_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_item_source_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_prompt=>'City Name'
,p_source=>'CITY_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35098399170106152)
,p_name=>'P36_COUNTRY_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_item_source_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_prompt=>'Country Code'
,p_source=>'COUNTRY_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35098451909106152)
,p_name=>'P36_LATITUDE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_item_source_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_prompt=>'Latitude'
,p_source=>'LATITUDE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35098531722106152)
,p_name=>'P36_LONGITUDE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_item_source_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_prompt=>'Longitude'
,p_source=>'LONGITUDE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35098665746106152)
,p_name=>'P36_POSTAL_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_item_source_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_prompt=>'Postal Code'
,p_source=>'POSTAL_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35098761793106152)
,p_name=>'P36_STATE_REGION_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_item_source_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_prompt=>'State Region Name'
,p_source=>'STATE_REGION_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35098822828106152)
,p_name=>'P36_WAREHOUSE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_item_source_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_prompt=>'Warehouse Code'
,p_source=>'WAREHOUSE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35098961948106152)
,p_name=>'P36_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_item_source_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_source=>'WAREHOUSE_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35099060375106153)
,p_name=>'P36_WAREHOUSE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_item_source_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_prompt=>'Warehouse Name'
,p_source=>'WAREHOUSE_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35099149281106153)
,p_name=>'P36_WAREHOUSE_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_item_source_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_prompt=>'Warehouse Status Code'
,p_source=>'WAREHOUSE_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35099267976106153)
,p_name=>'P36_WAREHOUSE_TYPE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_item_source_plug_id=>wwv_flow_imp.id(35097910085106151)
,p_prompt=>'Warehouse Type Code'
,p_source=>'WAREHOUSE_TYPE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35099855508106153)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P36_WAREHOUSE_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23499652322682019
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35099940918106153)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35097910085106151)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Warehouse Form'
,p_static_id=>'initialize-form-warehouse-form'
,p_internal_uid=>23499737732682019
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35100047149106153)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35097910085106151)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Warehouse Form'
,p_static_id=>'process-form-warehouse-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23499843963682019
);
end;
/
prompt --application/pages/page_00037
begin
wwv_flow_imp_page.create_page(
 p_id=>37
,p_name=>'Item'
,p_alias=>'ITEM'
,p_page_mode=>'MODAL'
,p_step_title=>'Item'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Master-data stewards open this modal page from the item workspace to create or edit one item master record without leaving the policy context.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35177407899106547)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35177543375106547)
,p_plug_name=>'Item Form'
,p_static_id=>'item-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_ITEMS'
,p_query_where=>'ITEM_ID = :P37_ITEM_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P37_ITEM_ID'
,p_plug_comment=>'Maintains the identifying, unique item code, handling, control, and stocking attributes required for one item record.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35179574622106549)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35177407899106547)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P37_ITEM_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35179606170106549)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35177407899106547)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35179708360106549)
,p_button_id=>wwv_flow_imp.id(35179606170106549)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35179811732106550)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35177407899106547)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P37_ITEM_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35179965431106550)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35177407899106547)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P37_ITEM_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35177606520106547)
,p_name=>'P37_BASE_UOM_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Base UOM Code'
,p_source=>'BASE_UOM_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35177780061106547)
,p_name=>'P37_EXPIRY_CONTROL_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Expiry Control Flag'
,p_source=>'EXPIRY_CONTROL_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35177859112106547)
,p_name=>'P37_FRAGILE_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Fragile Flag'
,p_source=>'FRAGILE_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35177985491106547)
,p_name=>'P37_HAZARDOUS_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Hazardous Flag'
,p_source=>'HAZARDOUS_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35178061887106548)
,p_name=>'P37_HIGH_VALUE_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'High Value Flag'
,p_source=>'HIGH_VALUE_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35178114706106548)
,p_name=>'P37_ITEM_CATEGORY_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Item Category Code'
,p_source=>'ITEM_CATEGORY_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35178288394106548)
,p_name=>'P37_ITEM_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Item Code'
,p_source=>'ITEM_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35178386946106548)
,p_name=>'P37_ITEM_DESCRIPTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Item Description'
,p_source=>'ITEM_DESCRIPTION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35178436864106548)
,p_name=>'P37_ITEM_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_source=>'ITEM_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35178552599106548)
,p_name=>'P37_ITEM_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Item Name'
,p_source=>'ITEM_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35178604679106548)
,p_name=>'P37_ITEM_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Item Status Code'
,p_source=>'ITEM_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35178775842106549)
,p_name=>'P37_LOT_CONTROL_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Lot Control Flag'
,p_source=>'LOT_CONTROL_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35178895227106549)
,p_name=>'P37_MINIMUM_REMAINING_SHELF_LIFE_DAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Minimum Remaining Shelf Life Days'
,p_source=>'MINIMUM_REMAINING_SHELF_LIFE_DAYS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35178914062106549)
,p_name=>'P37_RESTRICTED_ITEM_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Restricted Item Flag'
,p_source=>'RESTRICTED_ITEM_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35179089864106549)
,p_name=>'P37_SERIAL_CONTROL_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Serial Control Flag'
,p_source=>'SERIAL_CONTROL_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35179172862106549)
,p_name=>'P37_SHELF_LIFE_DAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Shelf Life Days'
,p_source=>'SHELF_LIFE_DAYS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35179252695106549)
,p_name=>'P37_STANDARD_VOLUME_CBM'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Standard Volume Cbm'
,p_format_mask=>'FM999G999G999G990D000000'
,p_source=>'STANDARD_VOLUME_CBM'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35179372650106549)
,p_name=>'P37_STANDARD_WEIGHT_KG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Standard Weight Kg'
,p_format_mask=>'FM999G999G999G990D000'
,p_source=>'STANDARD_WEIGHT_KG'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35179421555106549)
,p_name=>'P37_TEMPERATURE_CONTROL_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_item_source_plug_id=>wwv_flow_imp.id(35177543375106547)
,p_prompt=>'Temperature Control Flag'
,p_source=>'TEMPERATURE_CONTROL_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35180053404106550)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P37_ITEM_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23579850218682416
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35180168046106550)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35177543375106547)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Item Form'
,p_static_id=>'initialize-form-item-form'
,p_internal_uid=>23579964860682416
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35180273863106550)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35177543375106547)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Item Form'
,p_static_id=>'process-form-item-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23580070677682416
);
end;
/
prompt --application/pages/page_00038
begin
wwv_flow_imp_page.create_page(
 p_id=>38
,p_name=>'Business Partner'
,p_alias=>'BUSINESS-PARTNER'
,p_page_mode=>'MODAL'
,p_step_title=>'Business Partner'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Procurement and service teams open this modal page from the business partner workspace to create or edit one partner header while keeping site review on the parent page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35057501297105936)
,p_plug_name=>'Business Partner Form'
,p_static_id=>'business-partner-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_BUSINESS_PARTNERS'
,p_query_where=>'BUSINESS_PARTNER_ID = :P38_BUSINESS_PARTNER_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P38_BUSINESS_PARTNER_ID'
,p_plug_comment=>'Maintains the identifying, status, and creation-audit attributes for one business partner, including the unique partner number used across warehouse operations.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35057519727105937)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35058361605105975)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35057519727105937)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P38_BUSINESS_PARTNER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048939963105913)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35058475240105975)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35057519727105937)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048939963105913)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35058517595105975)
,p_button_id=>wwv_flow_imp.id(35058475240105975)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35058604878105976)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35057519727105937)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P38_BUSINESS_PARTNER_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048939963105913)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35058799596105976)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35057519727105937)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P38_BUSINESS_PARTNER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048939963105913)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35057673320105937)
,p_name=>'P38_BUSINESS_PARTNER_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35057501297105936)
,p_item_source_plug_id=>wwv_flow_imp.id(35057501297105936)
,p_source=>'BUSINESS_PARTNER_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35057751868105937)
,p_name=>'P38_CREATED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35057501297105936)
,p_item_source_plug_id=>wwv_flow_imp.id(35057501297105936)
,p_prompt=>'Created At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35057841905105937)
,p_name=>'P38_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35057501297105936)
,p_item_source_plug_id=>wwv_flow_imp.id(35057501297105936)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35057956156105975)
,p_name=>'P38_PARTNER_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35057501297105936)
,p_item_source_plug_id=>wwv_flow_imp.id(35057501297105936)
,p_prompt=>'Partner Name'
,p_source=>'PARTNER_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35058066584105975)
,p_name=>'P38_PARTNER_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35057501297105936)
,p_item_source_plug_id=>wwv_flow_imp.id(35057501297105936)
,p_prompt=>'Partner Number'
,p_source=>'PARTNER_NUMBER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35058181558105975)
,p_name=>'P38_PARTNER_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35057501297105936)
,p_item_source_plug_id=>wwv_flow_imp.id(35057501297105936)
,p_prompt=>'Partner Status Code'
,p_source=>'PARTNER_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35058261643105975)
,p_name=>'P38_PARTNER_TYPE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35057501297105936)
,p_item_source_plug_id=>wwv_flow_imp.id(35057501297105936)
,p_prompt=>'Partner Type Code'
,p_source=>'PARTNER_TYPE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35058895075105976)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P38_BUSINESS_PARTNER_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23458691889681842
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35058916143105976)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35057501297105936)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Business Partner Form'
,p_static_id=>'initialize-form-business-partner-form'
,p_internal_uid=>23458712957681842
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35059081680105976)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35057501297105936)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Business Partner Form'
,p_static_id=>'process-form-business-partner-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23458878494681842
);
end;
/
prompt --application/pages/page_00039
begin
wwv_flow_imp_page.create_page(
 p_id=>39
,p_name=>'Application User'
,p_alias=>'APPLICATION-USER'
,p_page_mode=>'MODAL'
,p_step_title=>'Application User'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Administrators open this modal page from the security workspace to create or edit one application user while preserving the wider access overview.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35114322747106239)
,p_plug_name=>'Application User Form'
,p_static_id=>'application-user-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_APPLICATION_USERS'
,p_query_where=>'APPLICATION_USER_ID = :P39_APPLICATION_USER_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P39_APPLICATION_USER_ID'
,p_plug_comment=>'Maintains the identity, status, default warehouse, alert settings, and effective authority attributes for one application user, including the unique user name used for access control.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35114415807106239)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35115506448106241)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35114415807106239)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P39_APPLICATION_USER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35115660520106241)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35114415807106239)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35115710124106241)
,p_button_id=>wwv_flow_imp.id(35115660520106241)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35115867478106241)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35114415807106239)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P39_APPLICATION_USER_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35115935373106241)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35114415807106239)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P39_APPLICATION_USER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35114570758106239)
,p_name=>'P39_APPLICATION_USER_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_item_source_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_source=>'APPLICATION_USER_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35114673907106240)
,p_name=>'P39_APPROVAL_AUTHORITY_LEVEL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_item_source_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_prompt=>'Approval Authority Level'
,p_source=>'APPROVAL_AUTHORITY_LEVEL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35114756547106240)
,p_name=>'P39_CAN_RECEIVE_ALERTS'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_item_source_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_prompt=>'Can Receive Alerts'
,p_source=>'CAN_RECEIVE_ALERTS'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35114857479106240)
,p_name=>'P39_DEFAULT_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_item_source_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_prompt=>'Default Warehouse ID'
,p_source=>'DEFAULT_WAREHOUSE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35114988159106240)
,p_name=>'P39_EMAIL_ADDRESS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_item_source_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_prompt=>'Email Address'
,p_source=>'EMAIL_ADDRESS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35115056669106240)
,p_name=>'P39_FULL_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_item_source_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_prompt=>'Full Name'
,p_source=>'FULL_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35115196896106240)
,p_name=>'P39_MANAGER_USER_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_item_source_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_prompt=>'Manager User ID'
,p_source=>'MANAGER_USER_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'APPLICATION_USER_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35115227138106240)
,p_name=>'P39_USER_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_item_source_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_prompt=>'User Name'
,p_source=>'USER_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35115324531106240)
,p_name=>'P39_USER_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_item_source_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_prompt=>'User Notes'
,p_source=>'USER_NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35115492230106240)
,p_name=>'P39_USER_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_item_source_plug_id=>wwv_flow_imp.id(35114322747106239)
,p_prompt=>'User Status Code'
,p_source=>'USER_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35116059253106241)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P39_APPLICATION_USER_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23515856067682107
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35116135430106241)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35114322747106239)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Application User Form'
,p_static_id=>'initialize-form-application-user-form'
,p_internal_uid=>23515932244682107
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35116254716106241)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35114322747106239)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Application User Form'
,p_static_id=>'process-form-application-user-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23516051530682107
);
end;
/
prompt --application/pages/page_00040
begin
wwv_flow_imp_page.create_page(
 p_id=>40
,p_name=>'User Role'
,p_alias=>'USER-ROLE'
,p_page_mode=>'MODAL'
,p_step_title=>'User Role'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Administrators open this modal page from the security workspace to create or edit one user role without leaving the wider access overview.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35103535805106156)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35103697943106156)
,p_plug_name=>'User Role Form'
,p_static_id=>'user-role-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_USER_ROLES'
,p_query_where=>'USER_ROLE_ID = :P40_USER_ROLE_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P40_USER_ROLE_ID'
,p_plug_comment=>'Maintains the identifying, scope, activity, and authority attributes for one user role, including the unique role code used throughout the access model.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35104451720106195)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35103535805106156)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P40_USER_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35104567845106195)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35103535805106156)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35104689488106195)
,p_button_id=>wwv_flow_imp.id(35104567845106195)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35104775621106195)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35103535805106156)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P40_USER_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35104862420106195)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35103535805106156)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P40_USER_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35103733858106193)
,p_name=>'P40_APPROVAL_AUTHORITY_LEVEL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35103697943106156)
,p_item_source_plug_id=>wwv_flow_imp.id(35103697943106156)
,p_prompt=>'Approval Authority Level'
,p_source=>'APPROVAL_AUTHORITY_LEVEL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35103850062106194)
,p_name=>'P40_IS_ACTIVE'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35103697943106156)
,p_item_source_plug_id=>wwv_flow_imp.id(35103697943106156)
,p_prompt=>'Is Active'
,p_source=>'IS_ACTIVE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35103947050106194)
,p_name=>'P40_ROLE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35103697943106156)
,p_item_source_plug_id=>wwv_flow_imp.id(35103697943106156)
,p_prompt=>'Role Code'
,p_source=>'ROLE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35104029777106194)
,p_name=>'P40_ROLE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35103697943106156)
,p_item_source_plug_id=>wwv_flow_imp.id(35103697943106156)
,p_prompt=>'Role Name'
,p_source=>'ROLE_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35104179191106194)
,p_name=>'P40_ROLE_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35103697943106156)
,p_item_source_plug_id=>wwv_flow_imp.id(35103697943106156)
,p_prompt=>'Role Notes'
,p_source=>'ROLE_NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35104244851106194)
,p_name=>'P40_ROLE_SCOPE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35103697943106156)
,p_item_source_plug_id=>wwv_flow_imp.id(35103697943106156)
,p_prompt=>'Role Scope Code'
,p_source=>'ROLE_SCOPE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35104387632106194)
,p_name=>'P40_USER_ROLE_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35103697943106156)
,p_item_source_plug_id=>wwv_flow_imp.id(35103697943106156)
,p_source=>'USER_ROLE_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35104908698106195)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P40_USER_ROLE_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23504705512682061
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35105036071106195)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35103697943106156)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form User Role Form'
,p_static_id=>'initialize-form-user-role-form'
,p_internal_uid=>23504832885682061
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35105104720106195)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35103697943106156)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form User Role Form'
,p_static_id=>'process-form-user-role-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23504901534682061
);
end;
/
prompt --application/pages/page_00041
begin
wwv_flow_imp_page.create_page(
 p_id=>41
,p_name=>'Approval Policy'
,p_alias=>'APPROVAL-POLICY'
,p_page_mode=>'MODAL'
,p_step_title=>'Approval Policy'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Reviewers and administrators open this modal page from the approval workspace to create or edit one approval policy while retaining the wider review context.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35121476452106243)
,p_plug_name=>'Approval Policy Form'
,p_static_id=>'approval-policy-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_APPROVAL_POLICIES'
,p_query_where=>'APPROVAL_POLICY_ID = :P41_APPROVAL_POLICY_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P41_APPROVAL_POLICY_ID'
,p_plug_comment=>'Maintains the subject, thresholds, reviewer roles, and status attributes for one approval policy, including quantity and value ranges that are rejected when they are not logically valid before the policy can be activated.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35121583389106243)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35123237633106285)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35121583389106243)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P41_APPROVAL_POLICY_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35123380041106285)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35121583389106243)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35123428698106285)
,p_button_id=>wwv_flow_imp.id(35123380041106285)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35123556880106285)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35121583389106243)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P41_APPROVAL_POLICY_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35123662894106285)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35121583389106243)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P41_APPROVAL_POLICY_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049306859105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35121614699106243)
,p_name=>'P41_APPROVAL_AUTHORITY_LEVEL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Approval Authority Level'
,p_source=>'APPROVAL_AUTHORITY_LEVEL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35121717754106244)
,p_name=>'P41_APPROVAL_POLICY_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_source=>'APPROVAL_POLICY_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35121827013106244)
,p_name=>'P41_APPROVAL_SUBJECT_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Approval Subject Code'
,p_source=>'APPROVAL_SUBJECT_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35121960589106244)
,p_name=>'P41_ESCALATION_ROLE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Escalation Role ID'
,p_source=>'ESCALATION_ROLE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'USER_ROLE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35122034631106244)
,p_name=>'P41_MAXIMUM_QUANTITY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Maximum Quantity'
,p_format_mask=>'FM999G999G999G990D0000'
,p_source=>'MAXIMUM_QUANTITY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35122107977106283)
,p_name=>'P41_MAXIMUM_VALUE_AMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Maximum Value Amount'
,p_format_mask=>'FM999G999G999G990D00'
,p_source=>'MAXIMUM_VALUE_AMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35122299494106284)
,p_name=>'P41_MINIMUM_QUANTITY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Minimum Quantity'
,p_format_mask=>'FM999G999G999G990D0000'
,p_source=>'MINIMUM_QUANTITY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35122316490106284)
,p_name=>'P41_MINIMUM_VALUE_AMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Minimum Value Amount'
,p_format_mask=>'FM999G999G999G990D00'
,p_source=>'MINIMUM_VALUE_AMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35122478645106284)
,p_name=>'P41_POLICY_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Policy Code'
,p_source=>'POLICY_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35122523261106284)
,p_name=>'P41_POLICY_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Policy Name'
,p_source=>'POLICY_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35122645988106284)
,p_name=>'P41_POLICY_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Policy Notes'
,p_source=>'POLICY_NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35122789294106284)
,p_name=>'P41_POLICY_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Policy Status Code'
,p_source=>'POLICY_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35122812083106284)
,p_name=>'P41_REVIEWER_ROLE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Reviewer Role ID'
,p_source=>'REVIEWER_ROLE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'USER_ROLE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35122946699106285)
,p_name=>'P41_RISK_LEVEL_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Risk Level Code'
,p_source=>'RISK_LEVEL_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35123063127106285)
,p_name=>'P41_THRESHOLD_BASIS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Threshold Basis Code'
,p_source=>'THRESHOLD_BASIS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35123148896106285)
,p_name=>'P41_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_item_source_plug_id=>wwv_flow_imp.id(35121476452106243)
,p_prompt=>'Warehouse ID'
,p_source=>'WAREHOUSE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35123802639106285)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P41_APPROVAL_POLICY_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23523599453682151
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35123879653106285)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35121476452106243)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Approval Policy Form'
,p_static_id=>'initialize-form-approval-policy-form'
,p_internal_uid=>23523676467682151
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35123990545106285)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35121476452106243)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Approval Policy Form'
,p_static_id=>'process-form-approval-policy-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23523787359682151
);
end;
/
prompt --application/pages/page_00042
begin
wwv_flow_imp_page.create_page(
 p_id=>42
,p_name=>'Business List'
,p_alias=>'BUSINESS-LIST'
,p_page_mode=>'MODAL'
,p_step_title=>'Business List'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Administrators open this modal page from the controlled-lists workspace to create or edit one business list while retaining visibility of its values on the parent page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35069895460106024)
,p_plug_name=>'Business List Form'
,p_static_id=>'business-list-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_BUSINESS_LISTS'
,p_query_where=>'BUSINESS_LIST_ID = :P42_BUSINESS_LIST_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P42_BUSINESS_LIST_ID'
,p_plug_comment=>'Maintains the identifying, ownership, purpose, and status attributes for one business list that drives configurable warehouse codes without changing the core process structure.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35069995391106024)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35070614110106025)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35069995391106024)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P42_BUSINESS_LIST_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35070774481106025)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35069995391106024)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35070836406106025)
,p_button_id=>wwv_flow_imp.id(35070774481106025)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35070969705106025)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35069995391106024)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P42_BUSINESS_LIST_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35071062724106025)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35069995391106024)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P42_BUSINESS_LIST_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35070052602106024)
,p_name=>'P42_BUSINESS_LIST_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35069895460106024)
,p_item_source_plug_id=>wwv_flow_imp.id(35069895460106024)
,p_source=>'BUSINESS_LIST_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35070173545106024)
,p_name=>'P42_LIST_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35069895460106024)
,p_item_source_plug_id=>wwv_flow_imp.id(35069895460106024)
,p_prompt=>'List Code'
,p_source=>'LIST_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35070216940106024)
,p_name=>'P42_LIST_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35069895460106024)
,p_item_source_plug_id=>wwv_flow_imp.id(35069895460106024)
,p_prompt=>'List Name'
,p_source=>'LIST_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35070311936106025)
,p_name=>'P42_LIST_PURPOSE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35069895460106024)
,p_item_source_plug_id=>wwv_flow_imp.id(35069895460106024)
,p_prompt=>'List Purpose'
,p_source=>'LIST_PURPOSE'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35070468257106025)
,p_name=>'P42_LIST_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35069895460106024)
,p_item_source_plug_id=>wwv_flow_imp.id(35069895460106024)
,p_prompt=>'List Status Code'
,p_source=>'LIST_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35070544447106025)
,p_name=>'P42_MAINTAINED_BY_ROLE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35069895460106024)
,p_item_source_plug_id=>wwv_flow_imp.id(35069895460106024)
,p_prompt=>'Maintained By Role ID'
,p_source=>'MAINTAINED_BY_ROLE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'USER_ROLE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35071128686106025)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P42_BUSINESS_LIST_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23470925500681891
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35071252900106025)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35069895460106024)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Business List Form'
,p_static_id=>'initialize-form-business-list-form'
,p_internal_uid=>23471049714681891
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35071384273106025)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35069895460106024)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Business List Form'
,p_static_id=>'process-form-business-list-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23471181087681891
);
end;
/
prompt --application/pages/page_00043
begin
wwv_flow_imp_page.create_page(
 p_id=>43
,p_name=>'Business List Value'
,p_alias=>'BUSINESS-LIST-VALUE'
,p_page_mode=>'MODAL'
,p_step_title=>'Business List Value'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Administrators open this modal page from the controlled-lists workspace to create or edit one list value while keeping parent-list context visible on the parent page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35157094061106414)
,p_plug_name=>'Business List Value Form'
,p_static_id=>'business-list-value-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_BUSINESS_LIST_VALUES'
,p_query_where=>'BUSINESS_LIST_VALUE_ID = :P43_BUSINESS_LIST_VALUE_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P43_BUSINESS_LIST_VALUE_ID'
,p_plug_comment=>'Maintains the parent-list linkage, unique value code within the list, display order, and active or default controls for one business list value.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35157136959106414)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35158048888106415)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35157136959106414)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P43_BUSINESS_LIST_VALUE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35158154916106415)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35157136959106414)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35158285097106415)
,p_button_id=>wwv_flow_imp.id(35158154916106415)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35158343637106416)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35157136959106414)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P43_BUSINESS_LIST_VALUE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35158406906106416)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35157136959106414)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P43_BUSINESS_LIST_VALUE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35157225681106415)
,p_name=>'P43_BUSINESS_LIST_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_item_source_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_prompt=>'Business List ID'
,p_source=>'BUSINESS_LIST_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BUSINESS_LIST_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35157394816106415)
,p_name=>'P43_BUSINESS_LIST_VALUE_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_item_source_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_source=>'BUSINESS_LIST_VALUE_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35157407528106415)
,p_name=>'P43_DISPLAY_SEQUENCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_item_source_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_prompt=>'Display Sequence'
,p_source=>'DISPLAY_SEQUENCE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35157567669106415)
,p_name=>'P43_IS_ACTIVE'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_item_source_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_prompt=>'Is Active'
,p_source=>'IS_ACTIVE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35157702861106415)
,p_name=>'P43_IS_DEFAULT_VALUE'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_item_source_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_prompt=>'Is Default Value'
,p_source=>'IS_DEFAULT_VALUE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35157738090106415)
,p_name=>'P43_VALUE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_item_source_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_prompt=>'Value Code'
,p_source=>'VALUE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35157851387106415)
,p_name=>'P43_VALUE_DESCRIPTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_item_source_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_prompt=>'Value Description'
,p_source=>'VALUE_DESCRIPTION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35157943481106415)
,p_name=>'P43_VALUE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_item_source_plug_id=>wwv_flow_imp.id(35157094061106414)
,p_prompt=>'Value Name'
,p_source=>'VALUE_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35158584669106416)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P43_BUSINESS_LIST_VALUE_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23558381483682282
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35158654322106416)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35157094061106414)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Business List Value Form'
,p_static_id=>'initialize-form-business-list-value-form'
,p_internal_uid=>23558451136682282
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35158708486106416)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35157094061106414)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Business List Value Form'
,p_static_id=>'process-form-business-list-value-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23558505300682282
);
end;
/
prompt --application/pages/page_00044
begin
wwv_flow_imp_page.create_page(
 p_id=>44
,p_name=>'User Role Assignment'
,p_alias=>'USER-ROLE-ASSIGNMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'User Role Assignment'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Administrators open this modal page from the security workspace to create or edit one user-role assignment while retaining the wider access overview.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35105335399106195)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35105465383106195)
,p_plug_name=>'User Role Assignment Form'
,p_static_id=>'user-role-assignment-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_USER_ROLE_ASSIGNMENTS'
,p_query_where=>'USER_ROLE_ASSIGNMENT_ID = :P44_USER_ROLE_ASSIGNMENT_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P44_USER_ROLE_ASSIGNMENT_ID'
,p_plug_comment=>'Maintains the user, role, warehouse scope, status, date range, assigning user, and authority override for one role assignment, including an effective date window where the end date, when provided, cannot precede the start date.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35106701356106197)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35105335399106195)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P44_USER_ROLE_ASSIGNMENT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35106722458106197)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35105335399106195)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35106863366106197)
,p_button_id=>wwv_flow_imp.id(35106722458106197)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35106912772106197)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35105335399106195)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P44_USER_ROLE_ASSIGNMENT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35107028539106197)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35105335399106195)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P44_USER_ROLE_ASSIGNMENT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35105567923106195)
,p_name=>'P44_APPLICATION_USER_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_item_source_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_prompt=>'Application User ID'
,p_source=>'APPLICATION_USER_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'APPLICATION_USER_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35105673220106195)
,p_name=>'P44_ASSIGNED_BY_USER_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_item_source_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_prompt=>'Assigned By User ID'
,p_source=>'ASSIGNED_BY_USER_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'APPLICATION_USER_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35105756576106196)
,p_name=>'P44_ASSIGNMENT_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_item_source_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_prompt=>'Assignment Notes'
,p_source=>'ASSIGNMENT_NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35105886013106196)
,p_name=>'P44_ASSIGNMENT_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_item_source_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_prompt=>'Assignment Status Code'
,p_source=>'ASSIGNMENT_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35105909659106196)
,p_name=>'P44_AUTHORITY_LEVEL_OVERRIDE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_item_source_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_prompt=>'Authority Level Override'
,p_source=>'AUTHORITY_LEVEL_OVERRIDE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35106052241106196)
,p_name=>'P44_EFFECTIVE_FROM_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_item_source_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_prompt=>'Effective From Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'EFFECTIVE_FROM_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35106138823106196)
,p_name=>'P44_EFFECTIVE_TO_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_item_source_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_prompt=>'Effective To Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'EFFECTIVE_TO_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35106268280106196)
,p_name=>'P44_IS_PRIMARY_ROLE'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_item_source_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_prompt=>'Is Primary Role'
,p_source=>'IS_PRIMARY_ROLE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35106326001106196)
,p_name=>'P44_USER_ROLE_ASSIGNMENT_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_item_source_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_source=>'USER_ROLE_ASSIGNMENT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35106475062106196)
,p_name=>'P44_USER_ROLE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_item_source_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_prompt=>'User Role ID'
,p_source=>'USER_ROLE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'USER_ROLE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35106581001106196)
,p_name=>'P44_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_item_source_plug_id=>wwv_flow_imp.id(35105465383106195)
,p_prompt=>'Warehouse ID'
,p_source=>'WAREHOUSE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35107185676106197)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P44_USER_ROLE_ASSIGNMENT_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23506982490682063
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35107236612106197)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35105465383106195)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form User Role Assignment Form'
,p_static_id=>'initialize-form-user-role-assignment-form'
,p_internal_uid=>23507033426682063
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35107383374106197)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35105465383106195)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form User Role Assignment Form'
,p_static_id=>'process-form-user-role-assignment-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23507180188682063
);
end;
/
prompt --application/pages/page_00045
begin
wwv_flow_imp_page.create_page(
 p_id=>45
,p_name=>'Warehouse Area'
,p_alias=>'WAREHOUSE-AREA'
,p_page_mode=>'MODAL'
,p_step_title=>'Warehouse Area'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Administrators open this modal page from the warehouse structure workspace to create or edit one warehouse area while preserving the surrounding warehouse context.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35124116621106285)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35124243022106286)
,p_plug_name=>'Warehouse Area Form'
,p_static_id=>'warehouse-area-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_WAREHOUSE_AREAS'
,p_query_where=>'WAREHOUSE_AREA_ID = :P45_WAREHOUSE_AREA_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P45_WAREHOUSE_AREA_ID'
,p_plug_comment=>'Maintains the warehouse context, unique area code within the warehouse, operational sequence, mixed-item and damaged-stock controls, and special-handling approval flags for one warehouse area.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35125696002106287)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35124116621106285)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P45_WAREHOUSE_AREA_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35125737550106287)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35124116621106285)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35125900894106287)
,p_button_id=>wwv_flow_imp.id(35125737550106287)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35125972307106287)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35124116621106285)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P45_WAREHOUSE_AREA_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35126076203106288)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35124116621106285)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P45_WAREHOUSE_AREA_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35124344276106286)
,p_name=>'P45_ALLOWS_DAMAGED_STOCK'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_item_source_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_prompt=>'Allows Damaged Stock'
,p_source=>'ALLOWS_DAMAGED_STOCK'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35124441053106286)
,p_name=>'P45_ALLOWS_MIXED_ITEMS'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_item_source_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_prompt=>'Allows Mixed Items'
,p_source=>'ALLOWS_MIXED_ITEMS'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35124561087106286)
,p_name=>'P45_APPROVED_FOR_HIGH_VALUE_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_item_source_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_prompt=>'Approved For High Value Flag'
,p_source=>'APPROVED_FOR_HIGH_VALUE_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35124686857106286)
,p_name=>'P45_APPROVED_FOR_RESTRICTED_GOODS_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_item_source_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_prompt=>'Approved For Restricted Goods Flag'
,p_source=>'APPROVED_FOR_RESTRICTED_GOODS_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35124734518106286)
,p_name=>'P45_APPROVED_FOR_SENSITIVE_GOODS_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_item_source_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_prompt=>'Approved For Sensitive Goods Flag'
,p_source=>'APPROVED_FOR_SENSITIVE_GOODS_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35124891411106286)
,p_name=>'P45_AREA_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_item_source_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_prompt=>'Area Code'
,p_source=>'AREA_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35124905105106287)
,p_name=>'P45_AREA_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_item_source_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_prompt=>'Area Name'
,p_source=>'AREA_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35125074065106287)
,p_name=>'P45_AREA_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_item_source_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_prompt=>'Area Status Code'
,p_source=>'AREA_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35125116205106287)
,p_name=>'P45_AREA_TYPE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_item_source_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_prompt=>'Area Type Code'
,p_source=>'AREA_TYPE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35125205474106287)
,p_name=>'P45_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_item_source_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35125399073106287)
,p_name=>'P45_SEQUENCE_NUMBER'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_item_source_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_prompt=>'Sequence Number'
,p_source=>'SEQUENCE_NUMBER'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35125404572106287)
,p_name=>'P45_WAREHOUSE_AREA_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_item_source_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_source=>'WAREHOUSE_AREA_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35125511595106287)
,p_name=>'P45_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_item_source_plug_id=>wwv_flow_imp.id(35124243022106286)
,p_prompt=>'Warehouse ID'
,p_source=>'WAREHOUSE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35126202794106288)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P45_WAREHOUSE_AREA_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23525999608682154
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35126295640106288)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35124243022106286)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Warehouse Area Form'
,p_static_id=>'initialize-form-warehouse-area-form'
,p_internal_uid=>23526092454682154
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35126325278106288)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35124243022106286)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Warehouse Area Form'
,p_static_id=>'process-form-warehouse-area-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23526122092682154
);
end;
/
prompt --application/pages/page_00046
begin
wwv_flow_imp_page.create_page(
 p_id=>46
,p_name=>'Storage Location'
,p_alias=>'STORAGE-LOCATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Storage Location'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Administrators open this modal page from the warehouse structure workspace to create or edit one storage location while preserving the surrounding warehouse geography.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35100279199106153)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35100363724106153)
,p_plug_name=>'Storage Location Form'
,p_static_id=>'storage-location-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_STORAGE_LOCATIONS'
,p_query_where=>'STORAGE_LOCATION_ID = :P46_STORAGE_LOCATION_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P46_STORAGE_LOCATION_ID'
,p_plug_comment=>'Maintains the warehouse and area context, unique location code within the warehouse, hierarchy, navigation coordinates, capacity, sequencing, and special-handling approvals for one storage location.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35102661587106156)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35100279199106153)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P46_STORAGE_LOCATION_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35102787198106156)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35100279199106153)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35102868294106156)
,p_button_id=>wwv_flow_imp.id(35102787198106156)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35102968995106156)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35100279199106153)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P46_STORAGE_LOCATION_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35103014505106156)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35100279199106153)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P46_STORAGE_LOCATION_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049639390105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35100434169106153)
,p_name=>'P46_AISLE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Aisle Code'
,p_source=>'AISLE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35100570148106154)
,p_name=>'P46_APPROVED_FOR_HIGH_VALUE_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Approved For High Value Flag'
,p_source=>'APPROVED_FOR_HIGH_VALUE_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35100644680106154)
,p_name=>'P46_APPROVED_FOR_RESTRICTED_GOODS_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Approved For Restricted Goods Flag'
,p_source=>'APPROVED_FOR_RESTRICTED_GOODS_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35100750031106154)
,p_name=>'P46_APPROVED_FOR_SENSITIVE_GOODS_FLAG'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Approved For Sensitive Goods Flag'
,p_source=>'APPROVED_FOR_SENSITIVE_GOODS_FLAG'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35100861594106154)
,p_name=>'P46_BAY_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Bay Code'
,p_source=>'BAY_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35100957480106154)
,p_name=>'P46_IS_ACTIVE'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Is Active'
,p_source=>'IS_ACTIVE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35101098243106154)
,p_name=>'P46_IS_PICKABLE'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Is Pickable'
,p_source=>'IS_PICKABLE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35101201132106154)
,p_name=>'P46_LEVEL_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Level Code'
,p_source=>'LEVEL_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35101288919106154)
,p_name=>'P46_LOCATION_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Location Code'
,p_source=>'LOCATION_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35101358901106155)
,p_name=>'P46_LOCATION_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Location Name'
,p_source=>'LOCATION_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35101497989106155)
,p_name=>'P46_LOCATION_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Location Status Code'
,p_source=>'LOCATION_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35101554581106155)
,p_name=>'P46_LOCATION_TYPE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Location Type Code'
,p_source=>'LOCATION_TYPE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35101638788106155)
,p_name=>'P46_MAP_X_COORDINATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Map X Coordinate'
,p_source=>'MAP_X_COORDINATE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35101738872106155)
,p_name=>'P46_MAP_Y_COORDINATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Map Y Coordinate'
,p_source=>'MAP_Y_COORDINATE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35101866527106155)
,p_name=>'P46_MAX_CAPACITY_UNITS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Maximum Capacity Units'
,p_format_mask=>'FM999G999G999G990D0000'
,p_source=>'MAX_CAPACITY_UNITS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35101988748106155)
,p_name=>'P46_PARENT_LOCATION_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Parent Location ID'
,p_source=>'PARENT_LOCATION_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STORAGE_LOCATION_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35102074140106155)
,p_name=>'P46_PICK_SEQUENCE_NUMBER'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Pick Sequence Number'
,p_source=>'PICK_SEQUENCE_NUMBER'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35102121970106155)
,p_name=>'P46_POSITION_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Position Code'
,p_source=>'POSITION_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35102244685106156)
,p_name=>'P46_PUTAWAY_SEQUENCE_NUMBER'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Putaway Sequence Number'
,p_source=>'PUTAWAY_SEQUENCE_NUMBER'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35102400434106156)
,p_name=>'P46_STORAGE_LOCATION_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_source=>'STORAGE_LOCATION_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35102438663106156)
,p_name=>'P46_WAREHOUSE_AREA_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Warehouse Area ID'
,p_source=>'WAREHOUSE_AREA_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSE_AREA_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35102576759106156)
,p_name=>'P46_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_item_source_plug_id=>wwv_flow_imp.id(35100363724106153)
,p_prompt=>'Warehouse ID'
,p_source=>'WAREHOUSE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35103193368106156)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P46_STORAGE_LOCATION_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23502990182682022
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35103233630106156)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35100363724106153)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Storage Location Form'
,p_static_id=>'initialize-form-storage-location-form'
,p_internal_uid=>23503030444682022
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35103309660106156)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35100363724106153)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Storage Location Form'
,p_static_id=>'process-form-storage-location-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23503106474682022
);
end;
/
prompt --application/pages/page_00047
begin
wwv_flow_imp_page.create_page(
 p_id=>47
,p_name=>'Partner Site'
,p_alias=>'PARTNER-SITE'
,p_page_mode=>'MODAL'
,p_step_title=>'Partner Site'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Procurement and service teams open this modal page from the business partner workspace to create or edit one site record while retaining the partner-level context on the parent page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35138355189106332)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35138495644106333)
,p_plug_name=>'Partner Site Form'
,p_static_id=>'partner-site-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_PARTNER_SITES'
,p_query_where=>'PARTNER_SITE_ID = :P47_PARTNER_SITE_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P47_PARTNER_SITE_ID'
,p_plug_comment=>'Maintains the partner context, unique site code within the partner, site role, address, map coordinates, primary-site flag, activity state, and creation audit for one partner site.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35140252374106369)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35138355189106332)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P47_PARTNER_SITE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048939963105913)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35140335002106369)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35138355189106332)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048939963105913)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35140467932106369)
,p_button_id=>wwv_flow_imp.id(35140335002106369)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35140538544106369)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35138355189106332)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P47_PARTNER_SITE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048939963105913)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35140640999106369)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35138355189106332)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P47_PARTNER_SITE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35048939963105913)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35138531884106333)
,p_name=>'P47_ADDRESS_LINE_1'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'Address Line 1'
,p_source=>'ADDRESS_LINE_1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35138701838106333)
,p_name=>'P47_ADDRESS_LINE_2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'Address Line 2'
,p_source=>'ADDRESS_LINE_2'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35138734205106333)
,p_name=>'P47_BUSINESS_PARTNER_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'Business Partner ID'
,p_source=>'BUSINESS_PARTNER_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PARTNER_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35138894218106333)
,p_name=>'P47_CITY_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'City Name'
,p_source=>'CITY_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35138924556106333)
,p_name=>'P47_COUNTRY_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'Country Code'
,p_source=>'COUNTRY_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35139060672106333)
,p_name=>'P47_CREATED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'Created At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35139124680106333)
,p_name=>'P47_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35139223255106334)
,p_name=>'P47_IS_ACTIVE'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'Is Active'
,p_source=>'IS_ACTIVE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35139348308106334)
,p_name=>'P47_IS_PRIMARY_SITE'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'Is Primary Site'
,p_source=>'IS_PRIMARY_SITE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35139433925106334)
,p_name=>'P47_LATITUDE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'Latitude'
,p_source=>'LATITUDE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35139526458106334)
,p_name=>'P47_LONGITUDE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'Longitude'
,p_source=>'LONGITUDE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35139684806106334)
,p_name=>'P47_PARTNER_SITE_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_source=>'PARTNER_SITE_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35139724190106334)
,p_name=>'P47_POSTAL_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'Postal Code'
,p_source=>'POSTAL_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35139871615106334)
,p_name=>'P47_SITE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'Site Code'
,p_source=>'SITE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35139983668106334)
,p_name=>'P47_SITE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'Site Name'
,p_source=>'SITE_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35140089923106334)
,p_name=>'P47_SITE_ROLE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'Site Role Code'
,p_source=>'SITE_ROLE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35140123027106335)
,p_name=>'P47_STATE_REGION_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_item_source_plug_id=>wwv_flow_imp.id(35138495644106333)
,p_prompt=>'State Region Name'
,p_source=>'STATE_REGION_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35140770813106369)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P47_PARTNER_SITE_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23540567627682235
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35140843557106369)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35138495644106333)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Partner Site Form'
,p_static_id=>'initialize-form-partner-site-form'
,p_internal_uid=>23540640371682235
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35140983243106369)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35138495644106333)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Partner Site Form'
,p_static_id=>'process-form-partner-site-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23540780057682235
);
end;
/
prompt --application/pages/page_00048
begin
wwv_flow_imp_page.create_page(
 p_id=>48
,p_name=>'Role Permission'
,p_alias=>'ROLE-PERMISSION'
,p_page_mode=>'MODAL'
,p_step_title=>'Role Permission'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Administrators open this modal page from the security workspace to create or edit one role permission while retaining the wider access overview.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35160460345106457)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35160601381106457)
,p_plug_name=>'Role Permission Form'
,p_static_id=>'role-permission-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_ROLE_PERMISSIONS'
,p_query_where=>'ROLE_PERMISSION_ID = :P48_ROLE_PERMISSION_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P48_ROLE_PERMISSION_ID'
,p_plug_comment=>'Maintains the role, process area, access level, warehouse scope, activity state, and notes for one role permission rule.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35161378450106458)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35160460345106457)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P48_ROLE_PERMISSION_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35161406401106458)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35160460345106457)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35161601563106458)
,p_button_id=>wwv_flow_imp.id(35161406401106458)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35161682337106458)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35160460345106457)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P48_ROLE_PERMISSION_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35161724554106458)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35160460345106457)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P48_ROLE_PERMISSION_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049422323105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35160700993106457)
,p_name=>'P48_ACCESS_LEVEL_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35160601381106457)
,p_item_source_plug_id=>wwv_flow_imp.id(35160601381106457)
,p_prompt=>'Access Level Code'
,p_source=>'ACCESS_LEVEL_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35160768576106457)
,p_name=>'P48_IS_ACTIVE'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35160601381106457)
,p_item_source_plug_id=>wwv_flow_imp.id(35160601381106457)
,p_prompt=>'Is Active'
,p_source=>'IS_ACTIVE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35160803762106457)
,p_name=>'P48_PERMISSION_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35160601381106457)
,p_item_source_plug_id=>wwv_flow_imp.id(35160601381106457)
,p_prompt=>'Permission Notes'
,p_source=>'PERMISSION_NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35160975904106458)
,p_name=>'P48_PROCESS_AREA_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35160601381106457)
,p_item_source_plug_id=>wwv_flow_imp.id(35160601381106457)
,p_prompt=>'Process Area Code'
,p_source=>'PROCESS_AREA_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35161011352106458)
,p_name=>'P48_ROLE_PERMISSION_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35160601381106457)
,p_item_source_plug_id=>wwv_flow_imp.id(35160601381106457)
,p_source=>'ROLE_PERMISSION_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35161139815106458)
,p_name=>'P48_USER_ROLE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35160601381106457)
,p_item_source_plug_id=>wwv_flow_imp.id(35160601381106457)
,p_prompt=>'User Role ID'
,p_source=>'USER_ROLE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'USER_ROLE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35161232639106458)
,p_name=>'P48_WAREHOUSE_SCOPE_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35160601381106457)
,p_item_source_plug_id=>wwv_flow_imp.id(35160601381106457)
,p_prompt=>'Warehouse Scope Code'
,p_source=>'WAREHOUSE_SCOPE_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35161903122106458)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P48_ROLE_PERMISSION_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23561699936682324
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35161984525106458)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35160601381106457)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Role Permission Form'
,p_static_id=>'initialize-form-role-permission-form'
,p_internal_uid=>23561781339682324
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35162101779106458)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35160601381106457)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Role Permission Form'
,p_static_id=>'process-form-role-permission-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23561898593682324
);
end;
/
prompt --application/pages/page_00049
begin
wwv_flow_imp_page.create_page(
 p_id=>49
,p_name=>'Inventory Lot'
,p_alias=>'INVENTORY-LOT'
,p_page_mode=>'MODAL'
,p_step_title=>'Inventory Lot'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Controllers and reviewers open this modal page from the traceability workspace to create or edit one lot record while preserving the surrounding lot and serial review context.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35141112438106369)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35141291865106369)
,p_plug_name=>'Inventory Lot Form'
,p_static_id=>'inventory-lot-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_INVENTORY_LOTS'
,p_query_where=>'INVENTORY_LOT_ID = :P49_INVENTORY_LOT_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P49_INVENTORY_LOT_ID'
,p_plug_comment=>'Maintains the item linkage, unique lot number per item, owner context, supplier lot, manufacturing or receipt dates, shelf-life dates, and current status for one inventory lot.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35142319463106371)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35141112438106369)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P49_INVENTORY_LOT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049893362105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35142465803106371)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35141112438106369)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049893362105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35142536062106371)
,p_button_id=>wwv_flow_imp.id(35142465803106371)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35142627549106371)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35141112438106369)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P49_INVENTORY_LOT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049893362105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35142715100106371)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35141112438106369)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P49_INVENTORY_LOT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049893362105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35141333277106369)
,p_name=>'P49_BEST_BEFORE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_item_source_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_prompt=>'Best Before Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'BEST_BEFORE_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35141485218106369)
,p_name=>'P49_EXPIRY_ON_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_item_source_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_prompt=>'Expiry On Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'EXPIRY_ON_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35141594526106370)
,p_name=>'P49_INVENTORY_LOT_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_item_source_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_source=>'INVENTORY_LOT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35141615880106370)
,p_name=>'P49_ITEM_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_item_source_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_prompt=>'Item ID'
,p_source=>'ITEM_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ITEM_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35141776407106370)
,p_name=>'P49_LOT_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_item_source_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_prompt=>'Lot Number'
,p_source=>'LOT_NUMBER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35141902608106370)
,p_name=>'P49_LOT_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_item_source_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_prompt=>'Lot Status Code'
,p_source=>'LOT_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35141927053106370)
,p_name=>'P49_MANUFACTURED_ON_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_item_source_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_prompt=>'Manufactured On Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'MANUFACTURED_ON_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35142099439106370)
,p_name=>'P49_OWNER_PARTNER_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_item_source_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_prompt=>'Owner Partner ID'
,p_source=>'OWNER_PARTNER_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PARTNER_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35142178041106370)
,p_name=>'P49_RECEIVED_ON_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_item_source_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_prompt=>'Received On Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'RECEIVED_ON_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35142217708106371)
,p_name=>'P49_SUPPLIER_LOT_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_item_source_plug_id=>wwv_flow_imp.id(35141291865106369)
,p_prompt=>'Supplier Lot Number'
,p_source=>'SUPPLIER_LOT_NUMBER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35142861091106371)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P49_INVENTORY_LOT_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23542657905682237
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35142957005106371)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35141291865106369)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Inventory Lot Form'
,p_static_id=>'initialize-form-inventory-lot-form'
,p_internal_uid=>23542753819682237
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35143069107106371)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35141291865106369)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Inventory Lot Form'
,p_static_id=>'process-form-inventory-lot-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23542865921682237
);
end;
/
prompt --application/pages/page_00050
begin
wwv_flow_imp_page.create_page(
 p_id=>50
,p_name=>'Item Serial'
,p_alias=>'ITEM-SERIAL'
,p_page_mode=>'MODAL'
,p_step_title=>'Item Serial'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_comment=>'Controllers and reviewers open this modal page from the traceability workspace to create or edit one serial record while preserving the surrounding lot and serial review context.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35067108116106022)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35067230428106022)
,p_plug_name=>'Item Serial Form'
,p_static_id=>'item-serial-form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SCM_ITEM_SERIALS'
,p_query_where=>'ITEM_SERIAL_ID = :P50_ITEM_SERIAL_ID'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P50_ITEM_SERIAL_ID'
,p_plug_comment=>'Maintains the item linkage, unique serial number per item, lot or owner context, current warehouse and location, source receipt reference, status, condition, latest document reference, and active state for one item serial.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35068943997106024)
,p_button_sequence=>2
,p_button_plug_id=>wwv_flow_imp.id(35067108116106022)
,p_button_name=>'APPLY-CHANGES'
,p_static_id=>'apply-changes'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P50_ITEM_SERIAL_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049893362105914)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35069043990106024)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_imp.id(35067108116106022)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049893362105914)
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(35069132637106024)
,p_button_id=>wwv_flow_imp.id(35069043990106024)
,p_action_sequence=>10
,p_name=>'Cancel Dialog'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'cancel-dialog'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35069262078106024)
,p_button_sequence=>1
,p_button_plug_id=>wwv_flow_imp.id(35067108116106022)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P50_ITEM_SERIAL_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049893362105914)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35069344978106024)
,p_button_sequence=>3
,p_button_plug_id=>wwv_flow_imp.id(35067108116106022)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_condition=>'P50_ITEM_SERIAL_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(35049893362105914)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35067345487106022)
,p_name=>'P50_CURRENT_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Current Status Code'
,p_source=>'CURRENT_STATUS_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35067482443106022)
,p_name=>'P50_CURRENT_STORAGE_LOCATION_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Current Storage Location ID'
,p_source=>'CURRENT_STORAGE_LOCATION_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STORAGE_LOCATION_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35067551777106022)
,p_name=>'P50_CURRENT_WAREHOUSE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Current Warehouse ID'
,p_source=>'CURRENT_WAREHOUSE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35067682886106022)
,p_name=>'P50_INVENTORY_LOT_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Inventory Lot ID'
,p_source=>'INVENTORY_LOT_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'INVENTORY_LOT_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35067782014106022)
,p_name=>'P50_IS_ACTIVE'
,p_data_type=>'BOOLEAN'
,p_source_data_type=>'BOOLEAN'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Is Active'
,p_source=>'IS_ACTIVE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35067902888106022)
,p_name=>'P50_ITEM_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Item ID'
,p_source=>'ITEM_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ITEM_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35067936854106023)
,p_name=>'P50_ITEM_SERIAL_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_source=>'ITEM_SERIAL_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35068021564106023)
,p_name=>'P50_LAST_DOCUMENT_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Last Document Number'
,p_source=>'LAST_DOCUMENT_NUMBER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35068174085106023)
,p_name=>'P50_LAST_DOCUMENT_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Last Document Type'
,p_source=>'LAST_DOCUMENT_TYPE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35068289141106023)
,p_name=>'P50_LAST_MOVED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Last Moved At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'LAST_MOVED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35068351340106023)
,p_name=>'P50_OWNER_PARTNER_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Owner Partner ID'
,p_source=>'OWNER_PARTNER_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PARTNER_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35068403781106023)
,p_name=>'P50_RECEIVED_AT'
,p_source_data_type=>'TIMESTAMP_TZ'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Received At'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'RECEIVED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35068584225106023)
,p_name=>'P50_SERIAL_CONDITION_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Serial Condition Code'
,p_source=>'SERIAL_CONDITION_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35068638855106023)
,p_name=>'P50_SERIAL_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Serial Notes'
,p_source=>'SERIAL_NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35068777898106023)
,p_name=>'P50_SERIAL_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Serial Number'
,p_source=>'SERIAL_NUMBER'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35068892817106024)
,p_name=>'P50_SOURCE_INBOUND_RECEIPT_LINE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_item_source_plug_id=>wwv_flow_imp.id(35067230428106022)
,p_prompt=>'Source Inbound Receipt Line ID'
,p_source=>'SOURCE_INBOUND_RECEIPT_LINE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'INBOUND_RECEIPT_LINE_LOV'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35069417752106024)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P50_ITEM_SERIAL_ID',
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23469214566681890
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35069517893106024)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35067230428106022)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Item Serial Form'
,p_static_id=>'initialize-form-item-serial-form'
,p_internal_uid=>23469314707681890
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35069633277106024)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(35067230428106022)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Item Serial Form'
,p_static_id=>'process-form-item-serial-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23469430091681890
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_imp_page.create_page(
 p_id=>9999
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'APEX SCM Warehouse Management - Log In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2102634289808461002
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'12'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35158922064106416)
,p_plug_name=>'APEX SCM Warehouse Management'
,p_static_id=>'login'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2675634334296186762
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35159376523106456)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(35158922064106416)
,p_button_name=>'LOGIN'
,p_static_id=>'login'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'NEXT'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35159003974106416)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35158922064106416)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="current-password"'
,p_label_alignment=>'RIGHT'
,p_field_template=>2042262243893469891
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35159176046106456)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35158922064106416)
,p_prompt=>'Remember username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_display_when=>'apex_authentication.persistent_cookies_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>2042262243893469891
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35159277548106456)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35158922064106416)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="username"'
,p_label_alignment=>'RIGHT'
,p_field_template=>2042262243893469891
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35159482673106457)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_static_id=>'clear-page-s-cache'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23559279487682323
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35159574605106457)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_static_id=>'get-username-cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'                                :P9999_USERNAME := apex_authentication.get_login_username_cookie;',
'                                :P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;',
'                                ',
'                '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>23559371419682323
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35159639881106457)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Login'
,p_static_id=>'login'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'APEX_AUTHENTICATION',
  'package_method', 'LOGIN',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23559436695682323
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(35159711164106457)
,p_page_process_id=>wwv_flow_imp.id(35159639881106457)
,p_page_id=>9999
,p_name=>'p_password'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_PASSWORD'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(35159858005106457)
,p_page_process_id=>wwv_flow_imp.id(35159639881106457)
,p_page_id=>9999
,p_name=>'p_set_persistent_auth'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>3
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(35159930540106457)
,p_page_process_id=>wwv_flow_imp.id(35159639881106457)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'ITEM'
,p_value=>'P9999_USERNAME'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35160022582106457)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Set Username Cookie'
,p_static_id=>'set-username-cookie'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'APEX_AUTHENTICATION',
  'package_method', 'SEND_LOGIN_USERNAME_COOKIE',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23559819396682323
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(35160108430106457)
,p_page_process_id=>wwv_flow_imp.id(35160022582106457)
,p_page_id=>9999
,p_name=>'p_consent'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_REMEMBER'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(35160281042106457)
,p_page_process_id=>wwv_flow_imp.id(35160022582106457)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'lower( :P9999_USERNAME )'
);
end;
/
prompt --application/deployment/definition
begin
null;
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
