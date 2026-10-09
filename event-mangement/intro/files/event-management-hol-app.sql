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
,p_default_workspace_id=>965820314770246301
,p_default_application_id=>34703
,p_default_id_offset=>0
,p_default_owner=>'WKSP_EVENTSMANAGEMENT'
);
end;
/
 
prompt APPLICATION 34703 - Event Management
--
-- Application Export:
--   Application:     34703
--   Name:            Event Management
--   Date and Time:   10:09 Monday May 18, 2026
--   Exported By:     ANKITA.BERI@ORACLE.COM
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     15
--       Items:                   38
--       Validations:              1
--       Processes:               16
--       Regions:                 34
--       Buttons:                 19
--       Dynamic Actions:          3
--     Shared Components:
--       Logic:
--         App Settings:           1
--         Build Options:          4
--         AI Agents:              1
--       Navigation:
--         Lists:                  4
--         Breadcrumbs:            1
--           Entries:              5
--       Security:
--         Authentication:         1
--         Authorization:          1
--       User Interface:
--         Themes:                 1
--         Templates:
--         LOVs:                   5
--       PWA:
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--       Install scripts:          2
--   Version:         26.1.0
--   Instance ID:     63102946836549
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
,p_owner=>nvl(wwv_flow_application_install.get_schema,'WKSP_EVENTSMANAGEMENT')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Event Management')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'EVENT-MANAGEMENT')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'90C65BA052547ABE5E3DDACF9B41C779AD86161E992280EA8178743C960C5702'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'26.1'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_flow_image_prefix=>nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(1609803330828825409)
,p_application_tab_set=>0
,p_logo_type=>'T'
,p_logo_text=>'Event Management'
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
,p_substitution_value_01=>'Event Management'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260518094827Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>2461174190602
,p_version_scn=>'47024636034980'
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'Y'
,p_pwa_manifest_display=>'standalone'
,p_pwa_manifest_orientation=>'any'
,p_pwa_is_push_enabled=>'Y'
,p_pwa_push_credential_id=>1609950897991827089
,p_ai_remote_server_id=>1605612715367242147
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(1609804267998825411)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>2469215554099805162
,p_nav_list_template_options=>'#DEFAULT#:t-TreeNav--styleA:js-navCollapsed--hidden'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(1609805230397825641)
,p_nav_bar_list_template_id=>2849019392706229583
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --workspace/credentials/app_34703_push_notifications_credentials
begin
wwv_imp_workspace.create_credential(
 p_id=>1609950897991827089
,p_name=>'App 34703 Push Notifications Credentials'
,p_static_id=>'app-34703-push-notifications-credentials'
,p_authentication_type=>'KEY_PAIR'
,p_prompt_on_install=>false
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --workspace/credentials/credentials_for_oci_gen_ai
begin
wwv_imp_workspace.create_credential(
 p_id=>1605612314318242139
,p_name=>'Credentials for oci gen ai'
,p_static_id=>'credentials-for-oci-gen-ai'
,p_authentication_type=>'OCI'
,p_namespace=>'ocid1.tenancy.oc1..aaaaaaaa......'
,p_valid_for_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://inference.generativeai.us-chicago-1.oci.oraclecloud.com',
''))
,p_prompt_on_install=>true
,p_created_on=>wwv_flow_imp.dz('20260505084648Z')
,p_updated_on=>wwv_flow_imp.dz('20260518100834Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --workspace/remote_servers/oci_gen_ai
begin
wwv_imp_workspace.create_remote_server(
 p_id=>1605612715367242147
,p_name=>'OCI Gen AI'
,p_static_id=>'oci-gen-ai'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('oci-gen-ai'),'https://inference.generativeai.us-chicago-1.oci.oraclecloud.com')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('oci-gen-ai'),'')
,p_server_type=>'GENERATIVE_AI'
,p_credential_id=>1605612314318242139
,p_ai_provider_type=>'OCI_GENAI'
,p_ai_is_builder_service=>true
,p_ai_is_default_for_new_apps=>true
,p_ai_model_name=>nvl(wwv_flow_application_install.get_remote_server_ai_model('oci-gen-ai'),'')
,p_ai_http_headers=>nvl(wwv_flow_application_install.get_remote_server_ai_headers('oci-gen-ai'),'')
,p_ai_attributes=>nvl(wwv_flow_application_install.get_remote_server_ai_attrs('oci-gen-ai'),'{'||wwv_flow.LF||
'  "compartmentId" : "ocid1.compartment.oc1..aaaaaa",'||wwv_flow.LF||
'  "servingMode" :'||wwv_flow.LF||
'  {'||wwv_flow.LF||
'    "servingType" : "ON_DEMAND",'||wwv_flow.LF||
'    "modelId" : "cohere.command-a-03-2025"'||wwv_flow.LF||
'  }'||wwv_flow.LF||
'}')
,p_ai_max_tokens=>nvl(wwv_flow_application_install.get_remote_server_ai_maxtokens('oci-gen-ai'),'')
,p_prompt_on_install=>false
,p_created_on=>wwv_flow_imp.dz('20260505084648Z')
,p_updated_on=>wwv_flow_imp.dz('20260518100802Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1609798878791825398)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>'SH256:NcagEyRP_F17oe14bnrSYSYienkBgpdRSvH17g_NxoE'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1609799121407825400)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>'SH256:FJR60MFzlfEjx0PvnpYBK4631rNeUHXaF3eGFKxcTgE'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1609799431418825401)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'show_on', 'FOCUS',
  'time_increment', '15')).to_clob
,p_version_scn=>'SH256:dQTHqehcDG0h-d-qmHe5lf-DuViElEHDw9zMkscLr6M'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1609799775652825401)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'background', 'default',
  'display_as', 'LIST',
  'map_preview', 'POPUP:ITEM',
  'match_mode', 'RELAX_HOUSE_NUMBER')).to_clob
,p_version_scn=>'SH256:CU9J9l4sUtY-UffjdBCosfDW6ER-I0swXpw8GekLiYQ'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1609800020614825402)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>'SH256:jJTPfH8wphTXe7ahDytF6PbWlPl1mXrDRYylCDda0k0'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1609800331414825403)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>'SH256:oAqKgc-cSRXHDMjfwwNIgo78WqYXKjQz8MWGBG6Euj0'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1609800708442825404)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>'SH256:uT4QhQbZQY61UFxAGl7ieo2urrCo8jUsFNprrg7lGHo'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1609801027942825404)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>'SH256:wAjuCAsVhoIbbuKGWTMQ__Rd_YS_sY9KgWhpqOO11mc'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1609801393976825405)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'match_mode', 'RELAX_HOUSE_NUMBER')).to_clob
,p_version_scn=>'SH256:GIeRbUJQ8yKfen6-dFvkghmSUZXFoUAXCCTNRhCJgh0'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1609801642205825406)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'Y')).to_clob
,p_version_scn=>'SH256:4M27aN0U-JyQ0prILtI8ITLXOphqUdO-xWNcwkSL1SI'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1609801906488825406)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>'SH256:tNGqNT-VaoKqWOwKbAdEqb6C0QO-GMcYRZJLXjScHMo'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1609802220647825407)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>'SH256:vJP7K77hiNj1R2RE6dHVyRAhlmxDg6KGn4yRE20J9Qw'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1609802593314825407)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>'SH256:fiSZ-OfcUl-d0e0dtJUYffG7q61xKsHlomsv7ZU1BMw'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1609802875263825408)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>'SH256:dRkCWi6vQMhdQUSqb0QlRls9iYcsZ93IPYrbTqFqJFE'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/ai_agent/event_ai_configuration
begin
wwv_flow_imp_shared.create_ai_agent(
 p_id=>wwv_flow_imp.id(1977495326856825505)
,p_name=>'Event AI Configuration'
,p_static_id=>'event-ai-configuration'
,p_remote_server_id=>1605612715367242147
,p_system_prompt=>wwv_flow_string.join(wwv_flow_t_varchar2(
'You are an event assistant. Help answer questions using the data provided about the events.',
'',
'Use the data provided about the events as context.'))
,p_welcome_message=>unistr('Hi! I\2019m your Event Assistant. How can I help you today?')
,p_version_scn=>'SH256:A-qtGfthM1YkEEzzdgtq59FUY2nzbtsLPVYs6mIskDw'
,p_created_on=>wwv_flow_imp.dz('20260508065435Z')
,p_updated_on=>wwv_flow_imp.dz('20260511095516Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_ai_agent_tool(
 p_id=>wwv_flow_imp.id(1980456350057571965)
,p_tool_name=>'event_assistant'
,p_static_id=>'event-assistant'
,p_tool_type=>'NATIVE_RETRIEVE_DATA'
,p_execution_point=>'AUGMENT_SYSTEM_PROMPT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'data_description', 'Event assistant to query about event details',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select e.id,',
    '       e.start_date,',
    '       v.name      as venue,',
    '       e.name,',
    '       et.name     as event_type',
    '    from ev_events        e',
    '    join ev_venues        v',
    '     on e.venue_id = v.id',
    '    join ev_event_types   et',
    '     on e.event_type_id = et.id;')),
  'type', 'SQL_QUERY')).to_clob
,p_condition_type=>'FUNCTION_BODY'
,p_condition_expr1=>'return :APP_PAGE_ID = 3;'
,p_condition_expr2=>'PLSQL'
,p_created_on=>wwv_flow_imp.dz('20260508070827Z')
,p_updated_on=>wwv_flow_imp.dz('20260508070827Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_ai_agent_tool(
 p_id=>wwv_flow_imp.id(2083664479043520788)
,p_tool_name=>'generate_description'
,p_static_id=>'generate-description'
,p_tool_type=>'NATIVE_RETRIEVE_DATA'
,p_execution_point=>'AUGMENT_SYSTEM_PROMPT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'data_description', 'Retrieve the event details for a given event as a paragraph.',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select distinct ev.ID,',
    '    ev.venue_id,',
    '    ev.EVENT_TYPE_ID,',
    '    ev.NAME,',
    '    ev.START_DATE,',
    '    evt.name event_type,',
    '    ev.name venue',
    'from EV_EVENTS ev',
    '    join EV_EVENT_TYPES evt',
    'on evt.id = ev.event_type_id',
    '    join ev_venues eve',
    'on eve.id = ev.venue_id',
    '    where ev.id = :P5_ID')),
  'type', 'SQL_QUERY')).to_clob
,p_condition_type=>'FUNCTION_BODY'
,p_condition_expr1=>'return :APP_PAGE_ID = 5;'
,p_condition_expr2=>'PLSQL'
,p_created_on=>wwv_flow_imp.dz('20260509123708Z')
,p_updated_on=>wwv_flow_imp.dz('20260511095516Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/navigation/lists/feedback
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(1609939176622827037)
,p_name=>'Feedback'
,p_static_id=>'feedback'
,p_required_patch=>wwv_flow_imp.id(1609807965143825660)
,p_version_scn=>'SH256:uLIDUtjkBn146taFt3T43SYu93ZGMTZZiQZ2iU_WDn4'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609939660788827040)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Feedback Settings'
,p_static_id=>'feedback-settings'
,p_list_item_link_target=>'f?p=&APP_ID.:10012:&APP_SESSION.::&DEBUG.:10012::'
,p_list_item_icon=>'fa-envelope-user'
,p_list_text_01=>'Manage if attachments should be allowed.'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609940152427827041)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'User Feedback'
,p_static_id=>'user-feedback'
,p_list_item_link_target=>'f?p=&APP_ID.:10013:&APP_SESSION.::&DEBUG.:10013::'
,p_list_item_icon=>'fa-comment-o'
,p_list_text_01=>'Report of all feedback submitted by application users'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_bar
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(1609805230397825641)
,p_name=>'Navigation Bar'
,p_static_id=>'navigation-bar'
,p_version_scn=>'SH256:ghhW8mPrsl5xJ-KkXSQgrfr8YFfxD_En_oMe32iVP2g'
,p_created_on=>wwv_flow_imp.dz('20260505092756Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609935479315827029)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Install App'
,p_static_id=>'action-a-pwa-install'
,p_list_item_link_target=>'#action$a-pwa-install'
,p_list_item_icon=>'fa-cloud-download'
,p_list_text_02=>'a-pwaInstall'
,p_list_item_current_type=>'NEVER'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609936284652827031)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'&APP_USER.'
,p_static_id=>'app-user'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609935993702827030)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Feedback'
,p_static_id=>'feedback'
,p_list_item_link_target=>'f?p=&APP_ID.:10010:&APP_SESSION.::&DEBUG.:RP,10010:P10010_PAGE_ID:&APP_PAGE_ID.'
,p_list_item_icon=>'fa-comment-o'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'apex_util.feedback_enabled'
,p_list_item_disp_condition2=>'PLSQL'
,p_list_text_02=>'icon-only'
,p_required_patch=>wwv_flow_imp.id(1609807965143825660)
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609936810667827032)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'---'
,p_static_id=>'list_item'
,p_list_item_link_target=>'separator'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(1609936284652827031)
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609950514530827087)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Settings'
,p_static_id=>'settings'
,p_list_item_link_target=>'f?p=&APP_ID.:20000:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-gear'
,p_parent_list_item_id=>wwv_flow_imp.id(1609936284652827031)
,p_required_patch=>wwv_flow_imp.id(1609943921714827070)
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609937365437827033)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Sign Out'
,p_static_id=>'sign-out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(1609936284652827031)
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_menu
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(1609804267998825411)
,p_name=>'Navigation Menu'
,p_static_id=>'navigation-menu'
,p_version_scn=>'SH256:BRF6rFXqXF9beUtqzkBFpp7Zu1Q8r0BvrAi3cWVPmTk'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609937957979827035)
,p_list_item_display_sequence=>10000
,p_list_item_link_text=>'Administration'
,p_static_id=>'administration'
,p_list_item_link_target=>'f?p=&APP_ID.:10000:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-user-wrench'
,p_security_scheme=>wwv_flow_imp.id(1609808901660825665)
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609816624959825688)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Dashboard'
,p_static_id=>'dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-bar-chart'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609840807528825955)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Edit Event'
,p_static_id=>'edit-event'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-forms'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260505092759Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092759Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609827991018825703)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Event Calendar'
,p_static_id=>'event-calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-calendar-o'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609830092406825708)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Event Search'
,p_static_id=>'event-search'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table-search'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/navigation/lists/user_settings
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(1609947599782827079)
,p_name=>'User Settings'
,p_static_id=>'user-settings'
,p_required_patch=>wwv_flow_imp.id(1609943921714827070)
,p_version_scn=>'SH256:OQGnb1n7GAjW62UabHIgG9OuJxcFn8bMLZXt-Fu7xMI'
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609948054782827081)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Push Notifications'
,p_static_id=>'push-notifications'
,p_list_item_link_target=>'f?p=&APP_ID.:20010:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-bell-o'
,p_list_text_01=>'Configure whether you want to receive push notifications on this device.'
,p_list_text_02=>'<span class="a-pwaPush--state"></span>'
,p_required_patch=>wwv_flow_imp.id(1609943600940827069)
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/navigation/listentry
begin
null;
end;
/
prompt --application/shared_components/files/apex_data_pkg_ev_attendees_42041_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B0304140000080800C198AD5C53B848FCC2010000430900001100000045565F415454454E444545532E6A736F6ECDD5516F9B301007F0F77C0A8BE7D6025AD28427D2349ABAB68B9446DAC3344D2E5CE15A6C23DBA46255BFFB6C9609D68D3E5B0281';
wwv_flow_imp.g_varchar2_table(2) := 'FE779CF49331BCCE0234C075907E9BBDDAFB2248A3D949201887200D3ECB4A907B8EA60A6C089C616DD3279B52EDD22C97BC61A2A3F6EA3A9A4A0AF75C9224A75118462ECB153003766E1087F1FC344CECB10F9769B848E3F9A8E1C743677B565F6EAEF7';
wwv_flow_imp.g_varchar2_table(3) := '2B7AB9D95D67DBDD6A7DBBA1EBED9D6B6B9BE2E339C7868FE7BCCD4E8ECC7860AE8460E48A1D508F99CCA6B470696620AF268CB1CFC6B3C17887CF40DC7A6A29C64A6E73FAF43BCFB461CAB4CD04F5CC67EAF940BD974D8540BE62FDCEAAFB027DE90B19';
wwv_flow_imp.g_varchar2_table(4) := '0803AA51A861C27BEEB33719BC6BA66AA9C94E160ACB167E8EC9795FA3EA4FCDEE58A1DBDAA02827D489CFEAF9A0DE70CEC8BEB21FA077AB0CB640CDB190B5020FA0349A8E42D1FEC73BF7D97B3178771D13E416604C5536A33540F6A8006A26F2A957F9';
wwv_flow_imp.g_varchar2_table(5) := 'C267E462406E6B3C2023974ABEFCB5A6B2CFE983CB335682C8A7FE390B9FA5CB417AC504424D6E908F9D459FD267E476A3AA462A66508A09EAD2676A140ED64F8AE540F6ACABA51A6B4B9753D3E79990A251F2110D95AAFC571B853E6ABFDBF317504B03';
wwv_flow_imp.g_varchar2_table(6) := '04140000080800C198AD5C20E4898D6B010000F10500001900000045565F415454454E444545535F70726F66696C652E6A736F6EBD545D6BC230147DF757943C9BA155D8F0CDAD1D0AD6C9D4079943B2345DB3E5A3247122E27F5F9A16DD9885D195151A';
wwv_flow_imp.g_varchar2_table(7) := 'C8B9F75CCE395C7268791E482823D0EC3302BC81D76FE790A6E2D5824AEE722C414C93F6A995082C63DB9097C070D2F3978BFB1BE0EA96003561041BA95C991AC275514B09CA591A520113AAB4F9391EEB8F7C3A939AC48EBE060537910A5B8D8A72B84B';
wwv_flow_imp.g_varchar2_table(8) := 'ED4C9D21ECE41AB52DA9926DB9D016B3B727FB7BDEC19DB6261077CD601CB8710E8C914127D7FE19269872C4204E51E1E0EA020532221CEDCCFBEE3A3E93A8866F5A8A9351871FDB150AA7C328ACD0D8ADD6D1EDF89DCB4ADCE09A5AC268389E34298670';
wwv_flow_imp.g_varchar2_table(9) := '44595D35B3D1C3B4D168B2548ADAD9DC3D86C34558B54EBD6A3DD797C5604590215FD6C66E3C470672A4DF5DC3CA7E308A6010ACC1620D4623BF3F88C683F9FC8F0E36B7AB26432D7D6C5EF675752D6741A3C96EB3F89F932D1D349C6CE9E317C9DAF3D9';
wwv_flow_imp.g_varchar2_table(10) := 'BD891952F621CD9F595DCC6E1D3F01504B01021400140000080800C198AD5C53B848FCC201000043090000110000000000000000002000B6810000000045565F415454454E444545532E6A736F6E504B01021400140000080800C198AD5C20E4898D6B01';
wwv_flow_imp.g_varchar2_table(11) := '0000F1050000190000000000000000002000B681F101000045565F415454454E444545535F70726F66696C652E6A736F6E504B0506000000000200020086000000930300000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(2650351826023077489)
,p_file_name=>'APEX$DATA$PKG/EV_ATTENDEES$42041.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260513190602Z')
,p_updated_on=>wwv_flow_imp.dz('20260513190602Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_ev_events_127472_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B0304140000080800C198AD5CFBCB9EC6050500004E1600000E00000045565F4556454E54532E6A736F6ED5585D73E236147DCFAFD0F0C840163BE1233C9590B44B9B6C32814E76A6ED64847C8335C8922BC961C94EFF7BAF6C820D069C9D3E34CC84';
wwv_flow_imp.g_varchar2_table(2) := '89B1CFBD16E75CDD0F7D3FA9710B91A9F5FF38F98ED741ADEF9D346A2F2013787AFB06F8D53ED9659CDF9234825ABF360116929194EA855AAE24192AF90C1A2403E2B7FC760D910118A679EC1E3B831048EA8E2CB845D32BE2116E88C5DBF57A85B77ABD';
wwv_flow_imp.g_varchar2_table(3) := '410C0B21480404C42A62E91C482C283E4774BDFE6B2296C46B3756E85332B2CE39A316664AF357B4A2865044E69EEB75426580AB11824C8184201064DFBB209212754A2621BE27FB5DEEE25B0CCC666B9C6A2E6778310374A909974162AC5E120134006D';
wwv_flow_imp.g_varchar2_table(4) := '1A782775AFDCB55B8975EF444761623835D6382701372C31194D027F8DB184062F14D71121D26476B8AEC0A0BBD4835442CD96A74E0063A9B64F019A21FF6ED9CD56B7E9B527AD563FFD7318342D21BA1B08A6019F0719A0D36C21A6BD0BF0345D2266F0';
wwv_flow_imp.g_varchar2_table(5) := 'E5B7D164707A79FD30FAE9EE6130BCB93E1DDEDD3A5812075B7E3C6FD2BAE8B7BBFD56AF0038ECE79F93C62A5AFD8D683D2F47EB591EAD43A19200458CE2C43A551E61CA25D5640C9A83D915AC1AA019237D64B1829A144A987A8154D8C1E3B84106AF89';
wwv_flow_imp.g_varchar2_table(6) := '864CBD5F949A0920D99BEE51AB67A5230C2C542CD69459CEB217ED14A5D5AB12650BB15B940B64B2EF77FE93285B7E7E5094B30D51CECAA29CE7A2FC9C08D11C5BCAE6E40A5142C52EA6C9A55296D1282EAB329216A4E12F40DACD802EC97485CC458914';
wwv_flow_imp.g_varchar2_table(7) := '6E2DE9342341C1E57A5FF0031AF87E95067EE7283438DFD0A05BD6A09D6B70A318156FF4635622B70036D9C1FDADC2C48449364A9F130C6E2252DB20B7C57C25C12E949EA73BC2845403994BB5C0AC3D83BDC49FB5AA88DF427C54E2DB1BC477CAC47772';
wwv_flow_imp.g_varchar2_table(8) := 'E207A33F3FDDDE90CF18FDD486487189F1F35E33548926E11B0449C75A80C5052F9146FECC19470138EE0A21F82C2D4E8EF788B2904B7085464BB72B8C128973BA2FF67BDB19BD240122DE5314FE7F093A1B12F86509FC4251584E316A81259ADB257950';
wwv_flow_imp.g_varchar2_table(9) := '3430A15AEC08FD4458DE640EA457A03CE3A073D0B1E606C8DAD5BB927EAFE955241C449C1F05E9DD0DD27B65D2BB39E9BF7FC56C63F84C9247CC13C8E58E5CF319A3D83431CA172B484E37C6BF4EBB2C2CC62EDE83CC170A20198F05AC3A22A5C401DE2F';
wwv_flow_imp.g_varchar2_table(10) := 'AA78F78F23DFF47EA003BAA2964E2946E93D68D799B816924C1259E886CA420CB256336B4D25FF3B417E5DE6570888F8ABB3BDC330C7B62778731FE7EEF70AE057661B7F6787F9E104B8D81C985A074BEDD85181A5F34B56221D79FB8A6D01928D168E74';
wwv_flow_imp.g_varchar2_table(11) := 'FCAF21C65E1F129D85B959792CCC0CFB39AFE8304B888FCA79CAF2C129B59773BE8ACEC1C8651B9CEF768FA6F71A228E796526D4140B2ACB673D97EB1935854047577C3D166632144A003EAD28B65EABE99D1D94C2218EA3D1F4360F0C2EDE25C5FDF557';
wwv_flow_imp.g_varchar2_table(12) := '324EA288DB0A350A32B8F07FB38F63C15936945F7FC3ED80C371A105757AB81AB18F7DAF6AFE7588E36875BCCD01B87DF0B8063BFCBB38A3679058156D9F6A94651816E9C7BED3ED013459395A77370D32C44E7678950DC15C3E6B4C433A6116076342D7';
wwv_flow_imp.g_varchar2_table(13) := 'AFDA2B47C5E4EBE4388E62EC6D8EBE87ABF1AD9A720CE6E2D83BC94E71F6D6620C76A1B223A5FC2C283FFAE177E34C5D1968C583E2F8BB97FB8A89B78CF8B0DC6F8EBC3B6A4261F2BAC4B975CE428AA4150EF80E0C628F0073E4A63088C15A8B69EECCB1';
wwv_flow_imp.g_varchar2_table(14) := 'CFF432B6B85BB4DB38CB779C3B388E0FB7A39EDF6C791F5A85BFF0F32F504B0304140000080800C198AD5C974981E1AB010000610800001600000045565F4556454E54535F70726F66696C652E6A736F6EBD956F6BC23010C6DFFB294A5F9BE13FD8F09D';
wwv_flow_imp.g_varchar2_table(15) := 'B31D0AD389D681CC51B2F49CD9DAB4245111F1BBEF1A8B6ECCC2ECA485067A77CFF17B8E1ED9552CCB5EF01088DE26605B6DAB554D438A8B770CCA7893C6163454503D96826071800569CAEE3C361B53EFE1CE367914100521301D4B93E61A2275C82D81';
wwv_flow_imp.g_varchar2_table(16) := 'A62A45B8200B2E95FEDD9EA975DA3D8C1504463EB70FDA452C19324A1E91CD127BAA843283ABE52A93C6E12A120A63F8F582AF65EDCC89394123536CF71DD3CE0403AAE9D175E31406C6231A12B6A407073767242404616427DD4FD7C149C415F950B138';
wwv_flow_imp.g_varchar2_table(17) := '1A35F17D3587F0D91D4E5DBF2CCE358815F8C5695DC4F57C6F362A0F199059FB69E53FB8879D819B835BCF47AAD71AB5F350A6714116C79D74C7FD91D77F1A5E8ED4AAD5729002504CF2447304294836F13A63CF773A5EDEAC9AF960B7E7A994A652FB58';
wwv_flow_imp.g_varchar2_table(18) := 'FD6D5CB8DB11D524A2EAD3D4CCF0218301719CB9EDCDED5EAFD16A0FFAEDC9A4F05F3A74AEEB024450B687EED84507793B76B90526010D04E53BF0EF67D7DCBCCC87FFB62DCA351D39579DEC2A094A9E6CE6E0CA93CD7CFC61B278BE9A3B38A1122FEEF4';
wwv_flow_imp.g_varchar2_table(19) := '5A57A677ABB2FF02504B01021400140000080800C198AD5CFBCB9EC6050500004E1600000E0000000000000000002000B6810000000045565F4556454E54532E6A736F6E504B01021400140000080800C198AD5C974981E1AB0100006108000016000000';
wwv_flow_imp.g_varchar2_table(20) := '0000000000002000B6813105000045565F4556454E54535F70726F66696C652E6A736F6E504B0506000000000200020080000000100700000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(2650352300097077494)
,p_file_name=>'APEX$DATA$PKG/EV_EVENTS$127472.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260513190602Z')
,p_updated_on=>wwv_flow_imp.dz('20260513190602Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_ev_event_attendees_865333_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B0304140000080800C198AD5CC19A152630010000611500001700000045565F4556454E545F415454454E444545532E6A736F6ED5D73D6BC3301006E0DD3F43731AA4B365499EEA860CA11F8190AD9490D41A3A3494562D94D0FF5E35A42DCE70B7BE';
wwv_flow_imp.g_varchar2_table(2) := '021B2C738867B0EE3D1F2AF594E2F39BEAEEAB437E1E5467AA898A1F719F36BFAB6D4A713FC4F8F7E2F1356E53CC0B459ADA0B6DF3B5D6A1D3BE23A7FE0B36BBCF5CD3DF5D2FD6FDF46ABE5A5C2E57FDEC663E9D2D6F7FCADE5F067E9F5301BFCF573539';
wwv_flow_imp.g_varchar2_table(3) := 'D189A71330BDE6E93530BDE1E90D30DDF2740B4C6FC7745DD23975821DF9A07AC18E7C5283606F81ED472D870FC8F8B3502D2A550D0978E4E36A6A010FFDCD3702DE21E3AD80F7C8F871BCD6257579E3783BF240663C6F876EF281B71F230B154FE378B5';
wwv_flow_imp.g_varchar2_table(4) := '25051419DE8E3CC613F176E478A271B6B625CD05D4F076E46425CBDB918395CEFE5BA9A846E3043CF258405EC043B7C920E0110783877C7F03504B0304140000080800C198AD5CBB3E037166010000AB0500001F00000045565F4556454E545F41545445';
wwv_flow_imp.g_varchar2_table(5) := '4E444545535F70726F66696C652E6A736F6EBD94516BC2301485DFFD1525CF666815B6F9E6D60E8529635641E628597A3BB3A54949A222E27F5F1A453766C750B1D042CFBDE7F29D4B9B55C5F350CA3860B3CC01792DAF592D24CDC4BB15955C145A4AB8';
wwv_flow_imp.g_varchar2_table(6) := '86EAAE150495896D284AA8FDD8F087D1C30D72756BC01A385023952B330399DED4A6400A97C64CE094296D7E8FA77A5E4CE75243E2EC13B4F1A65251CBA8588617533B53E7843A5CA3665BABE4B34C68ABD9B7177B7BDECA3D6D4D90CC35A36EE0C63931';
wwv_flow_imp.g_varchar2_table(7) := '2186EC52FB7B1928CB08C7744A3609AE0E583007E16C7BDFCFD4C9DEC434FED052EC823A7D5D2D210C47613F8A2FC5097310263E9EB61D45613F08C38B0113634024002730DF3F87ED282CE36D94335D1F46A20A88816F38F65BCD88C119D19FAE616C2F';
wwv_flow_imp.g_varchar2_table(8) := 'DCEBE12098A068823A1DBFD9EA755B83C18909E2BB7149887A79887ACDAFFD99237E5B1ECB357C0ACEBAD9599E5C78B3DB0467DEEC36C73F366B9FAFEE34CB89B2476071406AF73BDC56D65F504B01021400140000080800C198AD5CC19A152630010000';
wwv_flow_imp.g_varchar2_table(9) := '61150000170000000000000000002000B6810000000045565F4556454E545F415454454E444545532E6A736F6E504B01021400140000080800C198AD5CBB3E037166010000AB0500001F0000000000000000002000B6816501000045565F4556454E545F';
wwv_flow_imp.g_varchar2_table(10) := '415454454E444545535F70726F66696C652E6A736F6E504B0506000000000200020092000000080300000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(2650352640529077499)
,p_file_name=>'APEX$DATA$PKG/EV_EVENT_ATTENDEES$865333.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260513190602Z')
,p_updated_on=>wwv_flow_imp.dz('20260513190602Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_ev_event_types_247909_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B0304140000080800C198AD5C582119500A020000030800001300000045565F4556454E545F54595045532E6A736F6ECD955F6B1A4114C5DFFD14C33EC7606D63539F6A448834A960027D28A55C67EEEE4E9D7FDC99D584D0EFDE3BAB650525CF0B0A';
wwv_flow_imp.g_varchar2_table(2) := 'E21C66F99D73EFD9B741A113DA584C7F0EDEF8B72AA61F065785038BC5B4987B5722A19358F09F0AA3241D92F68ECF1E802A1C46090645205F628C7C004654906A24EDAA28F63AD5C23626E9C0AA1810B648518053221EF4315F2C0921213FBA188FC693';
wwv_flow_imp.g_varchar2_table(3) := 'E1E8863FCFA32FD3D1ED743C3911FCDEBCB266F6FDDBF279767DB7582FBFAED6B3F9C3E27ABE7ACCB226A8F7EF390ADEBFE7EFE0EAE8C4B87362ED41C5DAEFCF7D7862568CC2970277E85214351A25B4134A97AD7949182F21ABA3483E7B657D6A3D538D';
wwv_flow_imp.g_varchar2_table(4) := '64BD273683765A62AFCDF8D899F10337DA019D7BB172463B0E1A6D3ECF648130B2052DBE90DE656454C2EF90048F09FB94901CA63E937FEAC8EFBC4F126C38475F32888B7A87221168C7E39F13AE08AC60A1AE1C5373FA04412BF32A368DE629895B6D4C';
wwv_flow_imp.g_varchar2_table(5) := 'AF53BFE9D81F11537391BCF4644F173F2F43409F77BE6D805803A13A648D31F51A78D201DF83DC3212439E312FF2AA8B3DE3E2FF986D6E36E98D818D277E628BDB4E04C7CDC31F7D99F670D0FF41D96F173E9F2CBBA72D37DF85E0EFB9C7E390D10C02B5';
wwv_flow_imp.g_varchar2_table(6) := '137F2CF543EA814026CDEF07812F4852C77EF7DB6D87FCD458ABD305605DD543C3356F84E565384E3ABE04A4438FB3112A8F01B73F8800C4F88DE1222C35BF13FA08FF8BBFFF00504B0304140000080800C198AD5C6D2201ED700100006E0500001B0000';
wwv_flow_imp.g_varchar2_table(7) := '0045565F4556454E545F54595045535F70726F66696C652E6A736F6EBD94516BC23010C7DFF7294A9ECDA85598F8E66C8785D589D6079943B2349DD9DAA6247122E277DF2516DD9885CDC90A0DF4EEFEC7EF7F29B7BD721C94F28C61BD291972BA4EBB61';
wwv_flow_imp.g_varchar2_table(8) := '428A172F1094626D6229C9146B1C4A594145020526857AF72D6F1ADF7590CD83002B9631AA85B469AE59AEF6B9252346A5302F70CAA5D2DFDB53F56EBA6742B1C4CAE768AF4D85A4C028798ED74BE8A94A422DAE96AB4A2AB2555E2888C1D723BC8EB3B5';
wwv_flow_imp.g_varchar2_table(9) := '27E40A92DB6214FAB69D0D264493836BEF186694E724C37449F60EAE4F4870C60A2B3BEABEBA4E8E22AEF0AB12C5C1A88DEF1A3584C35E14D43036EB399AAEE79E26B18DCF64F183497F1C8EE2F061F87BA4B6EBD620254C51C94BCD01E44CB2FE38E8C5';
wwv_flow_imp.g_varchar2_table(10) := '41DD65B6EAA96E4E2351C988669F2E0DFEB79C689C13F5660B66F0E028C2BE3F47F11C0D065EBB1B85DDC9E48F0E16B7B34BDE76E563F1BC39976B3AF22F3AD95599FCF3642B07179E6CE5E3079385F3C96EA49248586366C999ADE474AE761F504B0102';
wwv_flow_imp.g_varchar2_table(11) := '1400140000080800C198AD5C582119500A02000003080000130000000000000000002000B6810000000045565F4556454E545F54595045532E6A736F6E504B01021400140000080800C198AD5C6D2201ED700100006E0500001B00000000000000000020';
wwv_flow_imp.g_varchar2_table(12) := '00B6813B02000045565F4556454E545F54595045535F70726F66696C652E6A736F6E504B050600000000020002008A000000E40300000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(2650352923558077503)
,p_file_name=>'APEX$DATA$PKG/EV_EVENT_TYPES$247909.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260513190602Z')
,p_updated_on=>wwv_flow_imp.dz('20260513190602Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_ev_sessions_436787_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B0304140000080800C198AD5CC9E2F0F96A040000E61500001000000045565F53455353494F4E532E6A736F6ED5985D6FEA461086EFF32B565C87C8361FE1705592109536242870AAA35655B4780758C5DE7577D7703847FDEF9D5D1B30E0807B17A4';
wwv_flow_imp.g_varchar2_table(2) := '24C2F1EC04E6F1BCEF4C7E5ED5B88158D7BA7F5DFDC4D7ACD6F5AFAE6BB00461DEDC9587973A01FA0ECAFDA281D782C650EBD65E140D2320BD0119835AF2107497F485019528AE81BC02656B3296516AB814BA860719E850F1C45EDBF34B7B0C5644CEC8';
wwv_flow_imp.g_varchar2_table(3) := '2E97CE73112A18310BE08AC02E294D928887749B5183D6F8FA4D1BAACC1BA3C6BEB1C00B5A75DFABFB8D89F7A5EB79F8558C05C14A227DAFDBD844860AF03ECB02DA75AF855F2E55A71BB40B016FD335C6F49E7F1F4C7A3777FDD7C12F2FAFBDFBA7FECD';
wwv_flow_imp.g_varchar2_table(4) := 'FDCBD086A5093B9D270F389DE7DFABEB9C4D709A4DB063D31BD41F14C750F2400D9D522CDD900A3A87184F1FA3F855AEB6085223858C65AA774723FCA30A0F6B0B682615428A66F5D826E4624E429AD0298FB8E150098AEF5786127C7E288DCA0D33A4E1';
wwv_flow_imp.g_varchar2_table(5) := '820B204F4095B085A3868C438A455F71B3D800B88F64CA8E11DDA53C62EE10F6058324926B7B357C22B1641069926A7B5D4C420662A6A8362A0D4DAAA0129A666534ADCF8FA6791A4D67AF5F4672050A18E9091AAD0D0F3305BAB365C542602D0D44119F';
wwv_flow_imp.g_varchar2_table(6) := '8308E198CE53D6219640DE22942D298632CC52CCC720E4B6AA24A6EF187D9E49B3B286352F42C35AFB4CFC03267E81C9A8FF8D048D9B803CA3493CE2BBC58718550920210FA86DC714EE659C285880D0789BC882BFA0919008DFA6365B9DB3D9679BA416';
wwv_flow_imp.g_varchar2_table(7) := '0D8885256615F29C8CF975BF558D8B8BBC042EED335C0AE6B295A2212A8F12A45730E54CCA6C714B24CC963FC1F21B67F0B64BDC87751E22B1BFE2442AAAD66405D33DA7DFD7B64DF2737C2AD94C16790136737B9A4FE7A06F46A0B0BEB17DA0C90B0288';
wwv_flow_imp.g_varchar2_table(8) := 'F90F57CB632A13081782FF93E64438B6905C1E94BB48832485D4B66F345A58E6FFEB4A58AA584C16790116D3F97F72368630555828E27A61B4E985632A7DAD3129A711CE5AF9116C11CDB1E1F29EB0B03E405441BEDA95E5AB7D11F2F5659FC3C793B19B';
wwv_flow_imp.g_varchar2_table(9) := '8CEACF5827B4889EC289CC801B8FC8881ADC33CA36955CE7B0C24AE20C879D6224996E54307BFE1143E886AEEA1CBCDBAA3692455E020737647D0CE2D434CC0536846438AC96EA54897B948DC138535B2067A6DDBCA0151C228FBC0087F0FD93A5BFDD95';
wwv_flow_imp.g_varchar2_table(10) := '7E82D3D063EA1E7A9C8DBEE2CA4DFADF51D679F9703B5158946C46C2F18AF1301320E4F5F51B32D07C2EDCCD458AA6500F71084BB191F03EFEA45B9A676154F0853CF2027CC1DFDFD51B07309A853EC8C4E537BAA4635774F2A8F0CE4AAAF71229B2232E';
wwv_flow_imp.g_varchar2_table(11) := '55F6917F05ACED35F923856B57FD9E98A71155AE31E22CA79DA318BE8948269BBDFF248520A8AA4618892DE17D7A0AFBCB79EB6335C2ADAD6F16DBAD8F53BB68586728D5A201B3E63C5B6FF6F1981B3ECF06D9A93DCAED7E97C95BB491B74C9FCE30E8D8';
wwv_flow_imp.g_varchar2_table(12) := '0FEC7B15186491FE0574C2FE16DE3E60D0DE31F81394241395A2CE6FE724DB1D5109803889DCA6662BFBC39E33EE1C2D1A3A5228FCEB10C4922B292AAC77585BBF6227B8C8CFECCB7FE3F77F504B0304140000080800C198AD5C99CB1A63B30100007B08';
wwv_flow_imp.g_varchar2_table(13) := '00001800000045565F53455353494F4E535F70726F66696C652E6A736F6EBD95614BC3301086BFFB2B4A3F2F32E740D9B76A230EDD1C6B15C44989E9CD45DBB4E43245C4FFEE351B9BA2059DB385067277EFF1BC17425E773CCF9FAA0C987D29C1F77A5E';
wwv_flow_imp.g_varchar2_table(14) := 'B7558550E97B0A9AE2B98A4D4586D05A958296454A0555CA0FCEF73B97F1C9A1EFF224600819485B18975616725CE466202A1532A5D95419B45FDB4B7CAABA670542EAE4137FA19D164612A351397B9E514F2C8574B8D6CC97D2229BE71A2946BB1BFA3D';
wwv_flow_imp.g_varchar2_table(15) := 'EFD5AD94D32277C57E3F74ED5C301556AC5C77D661902A17199333B170B0FB8D8465A09D6CADFBEC3A5D8B14B2072CF4CAA88BBFB56A08F9151FC649539CF004DA269BD346231E9CF17163BC58827804F307E26130E035AC7BF53C7BED4EFB7B22D77843';
wwv_flow_imp.g_varchar2_table(16) := '969047C7E3FE28EE5F0C7F8FD46DB76B90524069546915816C7AAE3C8A882A89E2601C276110D7CD6CBF1EF0A0E6080191C812B4C2D884541FC647B73C1796E5021F5DED357D6C30606138F1E3897F7ADAE9F606FD5E14FDD5171F86FFE30A74DAB4A7E3';
wwv_flow_imp.g_varchar2_table(17) := '3127277517F0F756A401329036EF2039BADEE6CD5CFA48EE5E36E5BA1C855B9DECBC4C1B9EECD2C19627BBF4F183C9D27AEB5EE752187AD2AB071F5DEFEECEDB3B504B01021400140000080800C198AD5CC9E2F0F96A040000E615000010000000000000';
wwv_flow_imp.g_varchar2_table(18) := '0000002000B6810000000045565F53455353494F4E532E6A736F6E504B01021400140000080800C198AD5C99CB1A63B30100007B080000180000000000000000002000B6819804000045565F53455353494F4E535F70726F66696C652E6A736F6E504B05';
wwv_flow_imp.g_varchar2_table(19) := '06000000000200020084000000810600000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(2650353286415077508)
,p_file_name=>'APEX$DATA$PKG/EV_SESSIONS$436787.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260513190602Z')
,p_updated_on=>wwv_flow_imp.dz('20260513190602Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_ev_speakers_26098_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B0304140000080800C198AD5C326BDFD325030000CC0D00001000000045565F535045414B4552532E6A736F6ECD97514FE24010C7DFF9149BBE9E36050595272B729E0A62808B2697CB65DB0EEDEA76B7D9DDAAD5DC77BFD9D24BDB78D7E73E106018';
wwv_flow_imp.g_varchar2_table(2) := 'FE5B7ECCFC67FA31709881543BD31F830F7C1D39D3E1E0C011340567EA6CA8A209B99189D05238180F98C4F04AD19003F1EFE78F6401342297F0025C66A0C82B3309197A5F48015469026F18642042204C10100654A6980642B38CB3901A2685B6C29052';
wwv_flow_imp.g_varchar2_table(3) := 'C6515ADB13DDA7FD89E765D40D656A53B2440A7B51E3F1F8D01B7A431B0B15500378D1CEC81B4D0E3DFC64BCF5CEA6DEE974346924FC0A0ACCF1EF6EAFB7BE7B315F5F9FAFD6FE6C317767ABA54DCBB3A85BA74AE8D6F93D38A8188E6A864B1626143899';
wwv_flow_imp.g_varchar2_table(4) := '25D04038E3328F88AFC204F187265740E69695215460FC614366F886ED18446423795E82AAF39BC8D2FD016E880774121BF599D8514DEC52B9649E325E90B58C148B7378AFC15D5243C926DCD7D4BD923BD05AAA92DA92221D01B624956022266BD0F812';
wwv_flow_imp.g_varchar2_table(5) := 'B9A8262FB0D2AEFA2BDD89ECA8CFC88E6B6437F8A4C903E3AD3EFD9A737EA80D0D9F1B1D6A49AD32105856B9428633298C62416E648BD29355745F4BC54E44C77D4634AE112D98A6649BC8346B314230AB4C93B988B1742A3CB779004A8041A4FBA66C82';
wwv_flow_imp.g_varchar2_table(6) := 'E1A8E39A4AA793CCB8CF64263599B50CACF1DCB2B4E14F05C63484B962A6209B0C4246F197EFED696E12F46E4EBE6165B57B4B9552EE334B3BC94CFA4CE6A4E1DD54314AAED04318ADD97C7FC476D22C1655B9A00B457968C8C6283C272E6C4BE99C1B2A';
wwv_flow_imp.g_varchar2_table(7) := 'DA3E6DC5DCB814EBA473D2673AA70D9FA62F2C22174ABE7EDE0DAC4D071407BD1FA54C60E1209ACAA6EF41EDA44AA935F06D5E1AF5E72E8BACB61B58ED4E56A77D6675D630681082EDB0601600352C3F66DC3A300EAE12CD2654798A734C9B765B3D55DF';
wwv_flow_imp.g_varchar2_table(8) := '763940278EB33EE3187A350F9FC31BFEFBE8B2AAC671C165F88CCB0CAE8AED7935534566249A91C2B15FFCA35C28CAB9A694EBE233F47ACDA7B179AFB1247069BC52D0DC1A9732B005E367590390AECCF9DD7612A25B034533BAC3DDFA055ADE5C4ABAB1';
wwv_flow_imp.g_varchar2_table(9) := '95EC84D4EBCD7AD858ADB73225BE887050FDEFEEA476E27D1DC93445C7C189666F5BDA3D6664EAD24AAC134F2FD7E89FF8F803504B0304140000080800C198AD5CDA5435037C0100007B0600001800000045565F535045414B4552535F70726F66696C65';
wwv_flow_imp.g_varchar2_table(10) := '2E6A736F6EBD945D6BC2301486EFFD1525D766D42A6C7857D70E0B5665EA85CC21B14DD76CF9284D9C88F8DF97C6A21BB3B0756585067ACE790FCF7B92E6D0B22C90108AA1DA6718587DABD72E4292F0171DCCC5AE8825884ADC3E97621E8958171429E0';
wwv_flow_imp.g_varchar2_table(11) := '8EBACE62FE70074C5E0BA0C414474AE4264D1466F2944B312A5412120E13924BF5BD7D24DF8BEE54481C1BF90A9CB489C823CD98130677A9EE293314195C956F4BA9A05BC6A58EE9AF27FD5AD6C1AC3AC71133C520F04C3B138C914267D7CE258C23C210';
wwv_flow_imp.g_varchar2_table(12) := '85518A4E0E6EAE4820C5DCC82EBAAFAEE38B8848F82A053F1B35F163BB8270EC867E0563A79AA3633BF67512D3B826CB2098FC1EA567DB15281B22EA92F8A11B8C9A1C0B6688D0BA34D3E164DCE82665A9E0B577E9FED177E77ED5C1EE56F3DC5E878972';
wwv_flow_imp.g_varchar2_table(13) := '8C14FE7480F5BFC790820CC93753B0D40F0C43E8792B305F81E1D0E9F5C3A03F9BFDD1C17AB06C72A8A58FF5665F976B31F51A9DEC368BFF79B2A58386275BFAF8C164F5FA6C6EE70CE5FA4A2F2E7C697A3BADE307504B01021400140000080800C198AD';
wwv_flow_imp.g_varchar2_table(14) := '5C326BDFD325030000CC0D0000100000000000000000002000B6810000000045565F535045414B4552532E6A736F6E504B01021400140000080800C198AD5CDA5435037C0100007B060000180000000000000000002000B6815303000045565F53504541';
wwv_flow_imp.g_varchar2_table(15) := '4B4552535F70726F66696C652E6A736F6E504B0506000000000200020084000000050500000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(2650353579687077513)
,p_file_name=>'APEX$DATA$PKG/EV_SPEAKERS$26098.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260513190602Z')
,p_updated_on=>wwv_flow_imp.dz('20260513190602Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_ev_venues_939506_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B0304140000080800C198AD5C73D101793D020000E20900000E00000045565F56454E5545532E6A736F6ECD965D6F9B301486EFF32B8EB8A695F9265C8DD06C8996345593B5ABA66972C16DAD821D193B6954EDBFEF30B5A5D0A8D7485818746CFCBC';
wwv_flow_imp.g_varchar2_table(2) := 'E78BE791C535AB6A2BF9357AC6796125CEC8B604AD9895581B963F4026C58E09CDA5800CEF4C5968408B42B11A97598EEBC15C08B9A3FF4DCE14DF311BD654C0574545CEEB5CDA90A530F61D12344B73BAA539D7072B7103429A178A51CDF0CB964BDCF0';
wwv_flow_imp.g_varchar2_table(3) := '8404786DC8382171E286566BF0E716D758E9F9F7F9263D9D4C2FE75F569769B6989E66AB656366B6C5E7FBBC187CBECFDF91FD2284DB0A7126F742E368C4B8638A899CC18C9665570A3F0861626A2EF01126E5AEB0E19CEDE146AA479CDD80430871BA12';
wwv_flow_imp.g_varchar2_table(4) := 'C48356C06B1578E7E299B9ED7247F118D69A2A6DB678578C691B52536B2E6CD8FC84288EFAD8DEA0B1FD16FB8A23152D61DAA4005C9454DF495575F157A24497770131B2874C18B484DF304B0B9860302B292B9849CD7A61EDB90E2CCC935107489BDCCE';
wwv_flow_imp.g_varchar2_table(5) := '1E784EEF31ABE70B0849D8F7ADE30E1A3DEC95B70BAA1E315A0BAEA5E2A6E7DA30F061CD4B9E63D85FA144EC00D7F460E3A252425AEAD7D2E6F5451876658B5A0D32595546E0998F16F7711CC19272F196D6670C9B8142EA15C4040FD32BE883A68E5BEA';
wwv_flow_imp.g_varchar2_table(6) := '1F02BB94AA1BEC05CBB551C7CAB9E34790D16A6BEAD7AE3691B59658D4962910D7E9FBDC1F34FDB8A55F4A6CCA821DF57884D033B9A7AA78F3F9F15EEE7DA8E843A677C8FB903FD9634BE6E21ED6787CD615C00D62980A44DF629B6746C1828AE687068F';
wwv_flow_imp.g_varchar2_table(7) := 'AD4B9C5C237EFCC1F74E3044FADF38FE01504B0304140000080800C198AD5C8687DE3078010000150600001600000045565F56454E5545535F70726F66696C652E6A736F6EBD545D6BC230147DF757943C9B51ABB0E15B673B14D6215A1F448764693AB3';
wwv_flow_imp.g_varchar2_table(8) := 'F58BDC3811F1BF2F4D8B3A66602B62A1819E7BCFE59C9BDBBB6F59168A79C2B0DC150C597DABD72E21E0D9BB0245BE2DB19824C0DAC75496D13C52096508B9CF5D67163E3D201D57040C2C6154E64287B9642954B13523250B30CF70CC05C8DFE5297C95';
wwv_flow_imp.g_varchar2_table(9) := 'D5931C58A4E94B5471E35C50A551F0146FD7AA2614846AB9526C6A6A9E6CD20C14A6BE16EAB5ACBD3E552C23A94E46234F97D360442439BA764E30A33C2509A66B5239B8BB40C109CB34EDC4FBE93A3A9138E00FC8B3A3518D1FDA06852F6EE01B3476CC';
wwv_flow_imp.g_varchar2_table(10) := '3A3AB6635F56A20B37D4E27ADEC49F4EFF2FA767DB0639248A040368AA68E08EDDC1289CDFE616295153C6E5AEB1DA89EF86BE69E4BA6641F7063D8211C9CE464BFD1529913825F0A913E6EAC141803D6F89C2251A0E9D5E3F18F5CFAFB09183D5A3A9E3';
wwv_flow_imp.g_varchar2_table(11) := '8D66B2F6B17A6BDCD9D9D8BB6A67374574E3CED60EAEDCD9DAC71F3AABCE57BD370B22D4B22D573154B55B876F504B01021400140000080800C198AD5C73D101793D020000E20900000E0000000000000000002000B6810000000045565F56454E554553';
wwv_flow_imp.g_varchar2_table(12) := '2E6A736F6E504B01021400140000080800C198AD5C8687DE307801000015060000160000000000000000002000B6816902000045565F56454E5545535F70726F66696C652E6A736F6E504B0506000000000200020080000000150400000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(2650353852218077518)
,p_file_name=>'APEX$DATA$PKG/EV_VENUES$939506.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260513190602Z')
,p_updated_on=>wwv_flow_imp.dz('20260513190602Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_144_rounded_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000090000000900806000000E746E2B800001000494441547801ECBD69946D477526F87D1177C8971AD084404242CC2A03669E0546F232559E1036830D1460B001437755B597BBBAABD6EA1F7AAA760F6BB5CB';
wwv_flow_imp.g_varchar2_table(2) := 'D08662941093CD60CA36C276AD2A3092059832500C92008941020D6802AC315FE61D4ED4F7C539E7DE736FDE7B33F366BEF76A41C63BFB44C48EBD77ECD8B163479C7332F305ECA77D0BECC202FB0EB40BE3EDB302FB0EB4EF05BBB2C0BE03EDCA7CFBCC';
wwv_flow_imp.g_varchar2_table(3) := 'FB0EB4EF03BBB2C0BE03EDCA7CFBCCFB0EB4EF03BBB2C0D20EB4AB5EF7997F622CB0EF403F3153797406B2EF4047C7EE3F31BDEE3BD04FCC541E9D81EC3BD0D1B1FB4F4CAFFB0EF4133395476720FB0E7474ECFE13D3EB9177A02D4CF7BE57FDCF8F6AC2';
wwv_flow_imp.g_varchar2_table(4) := '45AFFC9F9E3F012FFBDDE75F6430DEB9C1E5BD02CBABE195EA6B9EDC118DF513DD44DDB8BD83A63DB630DF116F3EEA0E74C9AB7FEFDC4B5EFDAF0E5EF2EAFFE5B24B5EFDAF5211E2B54D88B175690D48B8B43FE85F3A2C8697BA3C2806AAF72E2D06C34B';
wwv_flow_imp.g_varchar2_table(5) := '638897D6744BE5E22FFAA5BCFEA097E5F6D72D7B7069E4A46C82970E86A21DF62F4DC3E2D2C186CAE249E4EE74688CB53986A63D2EF9AD7F99DEFDF2371C7CFB6FBCF6E0DB5FFA86738FB8C74C7578541CE803AFFDD7E77EF0B5FFEB6582D46EC5CBDAAD';
wwv_flow_imp.g_varchar2_table(6) := 'F605ED56EBDC76AB8D4540790D043146743A5DB4440FA754C0B845BC5BB5C51051140548228496F2D234453184FB9CE06F77105B2DA11386839E344A88ED36BA2B2B0BF59F9021DD97A9AB33F5D9BF0069780186BDCB2EFAE76F4C1F78EDEF1F944D0FE2';
wwv_flow_imp.g_varchar2_table(7) := '28A4D24A47A8630D323B8E1CE13275B9E3D5331C6A3235C194038510D0D24492D4C40F91DBB07C1A0E07A0ACD13D700C568F39162B07561142449253F5FBBDDC472D3DA8EFB61CD8601D3ADD0358E996F435CDF6F2B43DB20655BFBF81A40513A41B090C';
wwv_flow_imp.g_varchar2_table(8) := 'A4DBA0DFBF8048177841CAC647D49164B2867687A9E84179701AE4528E53ABE5C994CDF2C41A17634BE5960CEA4830C8B9F13B054FA3B64538A21928076929A2B43B2B595421E71A0C06B95CDF4CD75D5955D459CDD130C458376D2B1F4A5E6F63030647';
wwv_flow_imp.g_varchar2_table(9) := 'BEED3099CE7C24D1EE7410347E3BD3404EE436CB908D8FA8231D7607B2F3201517F47B3D1C5ABB0F1BEBEB285774E1F16E1B524A8ADE9E6A20B0549B24622BC2C9936C1A97770C962D6088DABA58B1B39C24E12C7738E82B0A4DEA4C32D393AC78B6970D';
wwv_flow_imp.g_varchar2_table(10) := '246B7D5DB6D83824075A43BFB70EF7B11577E1082C2B98CEBA7A01B96C7C91B75AD74AB02365DB97D5C3762F67E2308897F2F57675C140E7840D196CA0F0DBDB58C3FADABD583F741F3CF0ED765DBA8EA90906BA9021049D45542A14D653D216A7F24EAF';
wwv_flow_imp.g_varchar2_table(11) := '3C7976A0294692F01605B0D45534D865F244F7D60F21696BB403B86F47106FA15B896ED2483544473D150A8DDD91C94BAC2983E5B67699E7A289DFCBF26171203F5949F96ABB4A327E8169DB7B45F736B6B7F2CA015777F90E35A1550D24CBA23A288663';
wwv_flow_imp.g_varchar2_table(12) := '372B91800DEB09B2B37AB26AFC649EA49F782B51CD361F9649AABD80B7B966DB32656F8585A2458C6D74BA2B08DA2EBDFD58C7F9FAF9BC9EB20ECD3EBD85E568ECB117DA623584667B553E57DA1F3627DA73077AFB4B5F7B6EA1A7834A790DDA258F2CE5';
wwv_flow_imp.g_varchar2_table(13) := 'C98E3AF8463D81A8026F65FDDE86089260075763A235B799D1123C313275AEFB36D4D9C55B85A39DC17D79B2DCD6843C719A0472B3393C41D4249BC64ED8E4DB69D932ECD0E6F3192BEA0C63707DA06D2D292AB93C0FCCDF6C23892819502A86DE5E6D05';
wwv_flow_imp.g_varchar2_table(14) := '557499B627DB7A91DA39918AC3E2449B2DA6CE77750D8717D848B326CA8EB3A283A7A195079EE4441B8A125B6F3D41C6CA7E231B69AEC72A1AEF8917B2D016A62CB725157A3AA47AD25DB6336DE433C73A5CCF44D54DA455697366E7B113B9A590434EF3';
wwv_flow_imp.g_varchar2_table(15) := '1ABF7D483A470DC110E1E84112C1AF03944B29383A61419AD69324A2B73130CB2D9D08399511FE103CE6F5436BD8585FD3DA1A5E901BF7F016F65016DEF9F2D71F94BC730B85E8221FF854D3E53D9AA406EBA7A620E3459D2DBA203570AD9CBCFAA6AD83';
wwv_flow_imp.g_varchar2_table(16) := '598919D99C4492598E1B5221EF724160072E34E12AE676060D557D0C751EB333193F86541D4DC798668951BC425866B36FA17674A97BF94981205D0C668EA1058D40F804EBB53DF914AB01085A883281EAC8FCB9A09BB7DB2C4B9D269D911C857AEBEBE7';
wwv_flow_imp.g_varchar2_table(17) := 'EA3C7450CD7B769596D90371564C51A5F470295DC8896AB1A99AD810628D42D4CA2BEB492BCF4F38C351DBBC02C9194D04C98C4FEA3717744B329A81243A7A1C5F593906EEAF902E436F170D5A91EB4A82CD97D82BF9D424173ACF6DADE766292526A94F';
wwv_flow_imp.g_varchar2_table(18) := 'DBA29CF452673BB6C11485CE31A671791190AC7402CC4B0638D9019D5B86410ABB0A8FDB343E320CFBBD0B3C57B9610F6E65CF7B2048E6BD206A355894952F14819C4F4C0BDD5A024939511B4E859C6D287A9717426808A8098D922C57939CA6365A519D';
wwv_flow_imp.g_varchar2_table(19) := '276CBC965EFAF9CC11A21D38C15B6CAADA477C2A9016A6C2C445F89F6E129D50689BAC9B93FAF3A4F4B43566997290BA6D565E689C2411B31EC889A426B89C86249D6C376C9508A9A31B0092B01341C9BC96A12292168A734388117E9A4C8AB33DBF3228';
wwv_flow_imp.g_varchar2_table(20) := 'F66E2B2B35772FBB80DAA33D596429B290B1D20283924488112401D1E5C12BC70E13A17F9621BE24A3E5A3A4E4244DAE9DD7918EA45AA1896BE5BC906E4D874DE2936D2529372FBC256DB929CB4F3A57AC6343AF2336F4347948794FB9B7EB7902DC27B5';
wwv_flow_imp.g_varchar2_table(21) := '08C8D246998E40D096E6B2E50E877D17170241F842959AFCEEDF726CD3B29920831CA88D18A222E820477CCDD98EBF0460466A8C6446EB36518E3E35296520971D01925694CB63E0B8A8528851F7129734A9F224D5B7BEC892A7A624EBBAD65815C952E5';
wwv_flow_imp.g_varchar2_table(22) := '14810164D91E1B1172A8F3910D2D0ED9DAAE2669159D4A732FF3B8D1FC03BDD7CA75399484A0A7A79E0D1D588B4DE3D6C84493D4271146FA4089D03F865CD24D93ABC77117160059F300A4CAC1FC505274CD7DE751A90EB503310404398F0FECD6D75B78';
wwv_flow_imp.g_varchar2_table(23) := 'FE9686DDA7BAE7A525C9930FD6CC24B3A2504A8A00859D428693F984215839972AF9F2D30DC95C4EA2D395CB0B6F22AF583219490446644B01A377359607D3CA7842E72BC4089F3F5CB111338D7C274957480E19DCB42D28B7AC92D493E3CF1A6DBDA218';
wwv_flow_imp.g_varchar2_table(24) := 'F4FBD991D2D46092FA7074A06C404AB192B5BCBB5EA1921CA0B0DDCA96D977D3375ADCBF754FEAB3D0022AB47892E48C48444F122DBD7B82F2428E3C1C0E7DA0DE7514DABEC546DACC2F9044CCABBCB4868DE941193027D9A06E4ADA4316D1651A19A694';
wwv_flow_imp.g_varchar2_table(25) := 'ECDA18428C72A2B2A5760CA93226A84AA48CA8C3BBABEEAB367292DCA8156AFC4C105F29BD6C1DF3CAFB8462088892DBEE743C3F18EADBD45093A4A6D1959F8AF2A4362595CD24E17F652D699B997D50179948083B0CCA0A9C5C0FD2C1E524E74BEA27C9';
wwv_flow_imp.g_varchar2_table(26) := '9EAE03043220EB4895ADBF9D887A538D5DA6B04B7EAB73415346D46452ABCCB8A1F6F342864C9A2011EAA2D15350E2B478842F274485D997563168954B9E9AC893574716F757BE1628D49F283845AB55C82CC3E1BE9CA824B921469093B4E2CE17C19C37';
wwv_flow_imp.g_varchar2_table(27) := '6FE3090242287973AE72A1499C7869A9C125458679A3230918803CED851C40C51997E920528218A720E7891A178475641CCAEE497D42C96243351F24615BB9CDEF9CD4CFD18D40DABE36294045A0185A70B2A23E58DAD821944636BE0964650A0DD8F4CD';
wwv_flow_imp.g_varchar2_table(28) := 'B6665983CDC6252BFA462349F829830C3A8A24F475981D0E4AE72027E9438C0831663A47895A6E88B12171B2488E65782C594FE95B5211D40491CA056D7DC537DE9170A048E4B21D6768A7300F8D9904EB4D560D224E72E864DA49B25C3315E97BAEE61B';
wwv_flow_imp.g_varchar2_table(29) := '49B4BB1D448D218937F75BF3338021663ADF5AAD8E33D8C94DFB81D7FEDEA639CC04DBBC856DD2CD23DBD47920D1CAA1BC146D453D5CFFF803E9D2581449040D104AE5C4142ACDBE529E0080153DA692E5B73B5D901C198721A0965F9387409896149DA2';
wwv_flow_imp.g_varchar2_table(30) := 'A3273A8480D030724D5BE72425B71C8F8D9EA16A54D3441F519F6982E4254D605F8FCC7D1DACDD47A1BECC1219248B2E8E802438AA25E92F2F1AD5CB0249E852C579503E7905E9DF593980A8ADB46C21CC10E55441FAA04A219663B53D878381FA0A9BE6';
wwv_flow_imp.g_varchar2_table(31) := 'B022DD5616B645B543A2566CA1A50325498D21E472AB5A99984A8CB1C4C866C95B5D59DB74F701D4013E046E6A3382243ADD2E3A1D19517DBB7F9719829B1B40E9D346D444BBBF810EBDA60D9BE8C62C24350E66448E585AE5499011BA514EA12C5F2144';
wwv_flow_imp.g_varchar2_table(32) := 'F87B1FC463DA0D7D793714DAC24822C488E964C9937AA61C2137D3D162C13936F0C2E8EA8569479F8BBA72A66EF700FCC1B62927EB5739D9406FE553317C6EB37DA7E5B05386263DE71CC26C8CAEBE34770FAC22830663C59BBC75398620A30455134A27';
wwv_flow_imp.g_varchar2_table(33) := '5171C6951481E463325E143D675040F820837571E0C0315811B43B1DCC4AD6C506EE482F1BB82D879B4557E3484A36CBAA224B215DCA8AEF84C7EB9281243A7AF3EDC974DD8E56E84CE432496D332D4C27F35B2780704AEAC38BC5E5CD4090DC8CAE3051';
wwv_flow_imp.g_varchar2_table(34) := '0EDA5124F6B80CA5DCAA5119C9AC03C97C58EFF7D68F4E04FAF0EB7EFF5158906C9476BB8B76BBA30187B9940C11F5200B85D4598436A89D8B641E3C1625D190549F5C4495FBECC8D0AD3991718259F22430A3ECC48E26798E85A1A24110A838BA4208D9';
wwv_flow_imp.g_varchar2_table(35) := '8157568F453BF7D191531DC0CAEA71A0DA46848D82F5204B9DED70855E58369A73444A3A059201D4BF66DB4ECB8EBE06DB75A073DA5B7FFD550BE77291FCB0A8F148B4914488A51A7ED49D5CDDA8924C9757BD4CC70A7584B320478774D54CC213ECDC2A';
wwv_flow_imp.g_varchar2_table(36) := '643C362B45322F9E156D278E86DD03DA5A6334CB4CB09C10CB764FAC6DD12434CEB6A19D55B29B6D3B2D073971B9783A2065FBCE4E258CE9C53DAE1C8D1249049D99484D8296F5401F3A31956C3C0349909C6A3DFC5592D23182FA07254F64AACE40C18E';
wwv_flow_imp.g_varchar2_table(37) := '25DCDC4BBC24E736D70D2491B73DE5764E4786ECA81541D2023244F5476E2DAF629B9B3902AD54478C0EBA73E9B66A58DA818A229CBD95F0EDB6378D32940325395293D7F5940A90321CB7A772920C4353CE6ECA514E1E622C4548B60B24610722A51776';
wwv_flow_imp.g_varchar2_table(38) := '9FA20EB7A19255E8A92D1FBEE53876587FB475EEC5B6FB9E4A096480FB2C6BCBDDB7371BCBC9DE3657080121C44C5FE869C586CA95EA96F4746667889AC0ED4C95CF4B7D3D3E6FACAF61A0A72CF356A296CE8274F46F698410E1738CBF2BB9BEDB09682A';
wwv_flow_imp.g_varchar2_table(39) := '64D92D9D1B6BDC40E713FFFCB83FD47A3CD0E0DD6FDDBE5779118AA583C1FF100EC440E4892015BD939E0EC61F143DF943BD59558368DA589462BB85EE71C780A4BE47ADC3465FCF5FC90F89DDC7DF45DC5BB7B514215674305ED561F880F28E9E34831C';
wwv_flow_imp.g_varchar2_table(40) := '6B6B4E2076DAD2ED5858C779F424D1D1AB8856A7AB31844C965F762A2A8380CF2D4134B961C1CD0BD0478181168FDFF5D8860BC877D5546AB92B11DB672E145DFC66BADFEB4D4D2811F55E2684287C0187EBFCAABD41EFD01D63C4BCD43DF618FCCC3F3D';
wwv_flow_imp.g_varchar2_table(41) := '174FF9CD17E0EC5F7836564FB81F480D4F861F68257B22E6F16E174F12D621C408BFA024251C33D2146AF584E371F6CF3F5BBA9D8F7FF2BCE7A27BCCEA14C5B86A9DBB7A7FE3D70CF9094E6F8EA3B6CF76BBA327BA9531E19C929DC536F68F99ACAFDF87';
wwv_flow_imp.g_varchar2_table(42) := '7545E1F2971177BF8066751966210F07CEAB62FDD01AFC33BA1B1AD8865EB079B0755F36929B03DB7800001000494441548D46123E07ADAFDD83B5FBEEC99104C2B5DBE35559F334F3873DEB2978F43F3B17673DF509F8D95F7E1ECE7CC263F528BDAA83';
wwv_flow_imp.g_varchar2_table(43) := '690785CE2C5E89F2CE26CBCC7253A799045348D31BA6D0A32A15A14E7BEC3F19E9F6985F3C0F0F79E69351E8DDD03CBE201E3B4F7765558FFEC7E0C031C7C165E34782E71492CE4C03BD20B4BD4D42B0FAB4338EEAC6EF151C31071A2A9C168506A1C9B4';
wwv_flow_imp.g_varchar2_table(44) := 'F28E0AA51315AE6668290AD950762692B0C1DA5A7976ACD682F73521469C74E683D03EB0024FD8CA71C7E2C4D34F474B5B8CF9C880A1A259A1F72898936C703BF77A5EB18E9063BDE6B06427F016B97EE8DE1C356739448801C79D7A0A1C21AD9B75BCDF';
wwv_flow_imp.g_varchar2_table(45) := '831E502E242DA8BEEC92E6E8456AFA1B304F8F263E3FFE5736F6772FBFC805A8B3A0C7B4F751E88838900D3B94F338A726333B89CE1383FE067A1B1B0A0CE38179E579C5AD1E7BFC68E5B5E544249193724F4A881121562059D444E5F6EAD6EA74D0EAB4';
wwv_flow_imp.g_varchar2_table(46) := '051D85FE0EC004B18E796ADE2A2FF49437D059A3D0D34FBFBFAEC8B7211ECCA50F31E69F3D2A1449CCDBD758862A07E91162A5579D57BF3D8B2AD991ACEF300DE578EBD9B98DCB0A5634CB6685164AF61F0D36289219BC20871A976159B9F3F8C2BC86AD';
wwv_flow_imp.g_varchar2_table(47) := 'F08A255B918CDAB3913530231C65DA9DAE0E848A160C32E006F2F6E2C60A48CA9641E09C19DB593D80531EF6609CF594C7E311CF79061EF9DC313CE2E79E9E577926AC6E279F7586E89E8EB3CF7D161EFDBC73F1E85F78AE789E2518F335659C7DDEB3F0';
wwv_flow_imp.g_varchar2_table(48) := '18D3E91CF533A2F599E591E73E732EBD791F75EE3978B4E81FF3BCF3F0689D6D8C7BC47327791EF19CA7E34445C74AAD9CDDEFB407A8AFF3F0D87FF6F3705F8F12CF239EF3B43CB6531EFA60B4575732DDAC9B17A1617E9B23A7168B0828FB924488312F';
wwv_flow_imp.g_varchar2_table(49) := 'D2613507D8C314969535ECAD69F27B59B1AD647855D8894CE7C37299B7D0526449DAB3BD7A932280F1D3401227CBA84F7BD54B70CEEB5E81A7BFE24578E28B7F154F78E1AF8CE0F12FF8454DD2E913ACA73EEA6130DE744FF98D17E0692F7F119EFC92F3';
wwv_flow_imp.g_varchar2_table(50) := '473CC637A1A679FACB5F8C0C2F7B219EF4A2E7CFA537EFD35EFA6B25AD643FFD652FC2535FFAEB7862432FD33C4EBA9DFAC8874EE876F283CFC4535E229D5EFA42F1BF487CBF8627BDE4F9796CE7BC5E63D4583D66B25C3C35B31D20FF7D818D43DA3EED';
wwv_flow_imp.g_varchar2_table(51) := '2875CB38CFD1A7AA92257F19DD909F6E5393A0A2DB4DB6B4036DD4BFE3BE761F860A8F8B94F0F962A47739A64CDED26337490D6C28D86C90D64A170FD581F3DC7FF11A9CF5E4C7E1D8534ED2EA3C8056B7B309B291B2D4F216629CA06977BB13F5D62619';
wwv_flow_imp.g_varchar2_table(52) := '5D98A68656B7BB05BD75E8669E56B72BDA6E55367E12428CA552D53DC420FA92C6FDB5BA5DD5BB796C1EE3594F7E3CCEFD97BF8D873CE3C9190F254F7C5F8E33D401D93FEFB4A10791620BBB931427909F1851DA1973CE5B997089DBD20E54F645F8DCE0';
wwv_flow_imp.g_varchar2_table(53) := 'C37031273C7AE006548AA746A409A1050687D7422BAAFC01B0522E64B80ECE3EEF1C3C45AB7CE5F8E36AF44F783E1EDECA71C7E2A92F7B011EA5ADB52567B77D870D1B0F74F8EEE965E998A32CA5CACEB9C67C07A882C067B5345AC9D89314969712E1F3';
wwv_flow_imp.g_varchar2_table(54) := '8C0F68855642B90DA599E252C369BC658D8834A8A0839EC7E4036872C18DC29FA647DF47FDFC39F9C9CA2843D21BE943F7DC8B1FDD7C0B6EB9EE7B23B8F5FAEFE3D0BDF7996404F7DD79178C6FD21D8DB275B02E23C554B0AEC637F5F9D10F6EC19AC636';
wwv_flow_imp.g_varchar2_table(55) := 'B281E8DAFA00EBB3D8698F391B856C931A765433CAC83E6573D1B9AD0924B30FE9BC91799A6DBB2DEFC28180A8A71F1F88ADC4402FEB3C209737810650E39A341492B40A5A373A0BA99AAF55BD787BC4394FC5EAFD8ECF75DF7CD0BEF2EF3E8B0FFFDF7F';
wwv_flow_imp.g_varchar2_table(56) := '848BFFCD41BCEFFFF803BCB7820F5CF0FFE0FA2BBF6EB2115CFDD9FF8A0F1CFC7F473435ED91CEAD83751929A68275B5CEB52E1ECBC5FFFB417C4463BBEAEF3E078F5564F9B22D1E7ECED3B072FC319EFF8C0B2182D496A4A7BEB4C961A61C2A73F8666B';
wwv_flow_imp.g_varchar2_table(57) := '6B1F68D8D9D8DD82676F79191A849DC803B263D88966092B552F5BA6071C1481001943AB2BB749E6C90F39132709A0329486FD01BEF0D79FC45FBDED627CF7AB57E1EE1FFD18F72AC27865977037067ABB2DD2D1D55B5FC77D77DE2DB8EB28C3DDE8ADEB';
wwv_flow_imp.g_varchar2_table(58) := '95C04833645D9BBADDABB1784C1EDB27DE7611BEF8379F1C3B916C70F243CEC049673D289B8324DA9D0E829CC8F6F211A2217A66B1697FCFD34CA22591BB7320793F4984D802409D877A5A25932BC0CA93EEC625204DAD8010232402D0F694E44421461C';
wwv_flow_imp.g_varchar2_table(59) := '7FDAA9F0E11255FAA1B6ACAB3FF3F758BF6FADC24C6636CA7D77DD333A887B05AF6B4BB3BC49CA235FB30ED6C53AB977FFA0D8BD72ECA2719E31BE86F57BD770D5157F0F8FB9C6B5F430E147FFA0F74924617B7BE1FAB833D4BBABA479C08C34C28B87AC';
wwv_flow_imp.g_varchar2_table(60) := 'EC3F877606FBB6509ED96D11CE22B2822411F3C0909DA379D08393DA4929AFCB556D56487214970DF909415128696076AE10030E1C7F1CA8DCED498EF58FB7DD8E3B6FFFA1F8269DD3ED064F8643FF0DDFB826AFDC1BBE712DAEFBDAD75154BF99619AA3';
wwv_flow_imp.g_varchar2_table(61) := '05D6E1BA2BAF8675B2137D5F3A5E75C5E760A79FA593ED70E71D3FC49DB7DE0E8FDD3421441CF0B73DE5604090BD62ABAD2231D4F9B3D05666BA699049A751480DDB6F6A5C02B10B071A666592B40C8C8A2241F58442035261521556DE63AC7C2035A210';
wwv_flow_imp.g_varchar2_table(62) := '658C20C3240DAC342A51FEC842C993B4CCFCB67AA0A70E2C48375DFB6DFCE91FFC7BBCF975BF870FE92C71F3B7BF2B35D4D9029E23D194649F9BBFF5DDAC53D6ED0FFE10375DFB9D855D0F7B7D78CC1E7B2694295A3A6FDA8C24B3AD638C080CD02065F3';
wwv_flow_imp.g_varchar2_table(63) := 'C927D8CCD3B8911CD5AC8F6184D865411A2C2FA156842120C4529457C4F4B4597D43DDD3747B10BFDB8A392BC94672FB22B0F3ADDD7D37FEF1D6DBB076D7DD5B1A7591ACBD6E2BB45D59A7ACDBDDF7203516D0DCBEE478B3DB6A4B52362FFF426D311C62';
wwv_flow_imp.g_varchar2_table(64) := '9CEAF631C6A5EC6C2A244574CC952D821D5EE5ACEF90A9264F95214822841600E689ABF1A893DA61C875ADABC6004882762052E178F14ACAECFBB76C0192B279397D85A277126041AA6D9CA0776E5BD02E10B3A9A9D460137A7B082B6E6F2609875465AA';
wwv_flow_imp.g_varchar2_table(65) := '4AC1799104654A5E056531DFC900AAE495AA6CFF5A6001DBB86EA6EC06219216A4AE1A3DCA6DD3BAE2289FEB22347D8DDF6D1E7623202902153AA35846085163A11C28E9696CFEA7566F5F696A059079681293C45F281F5F2471FAC31F8AE7BDEAA5F895';
wwv_flow_imp.g_varchar2_table(66) := 'DF7DCD4F05FC82C67A9AC64CD67699B4475D73543185ED69A8F175CEE0D6AAC6F154A7A9055C512C958DA52EC50EA4EAF7973C9810BD8D09A70894E4E93345CA830AB535DB09FDAB06584C0D8E244E39E3743CE5977E01CFFCB55FFEA9008FD5632689E9';
wwv_flow_imp.g_varchar2_table(67) := '44D9892CF1A1DAFA6DCB4D4E213AA0A4835266D14DE6D722F55DC83DB876ED40FE04613D486A1B2B1DC80E52283A6166B2F28646A3C769102A4D4527A1F6AF8605C8CA50C2914460D48A4D7A2D503E15CB3B303B8DF9C4309B6409ECAE1D28E909A3EEB7';
wwv_flow_imp.g_varchar2_table(68) := '8C40DEC60AA48603916CAC05514FFB4F6EA71A34B4065F46ECDF262D205BD50892087A079714D1877AA1E8459B460BD0463620275B3788DE15635375F4707D37B06B072A74AAAF1588212087550DC883A9F1810114D4F5A4F6BAEC9CD0BF6A7085B63FE3';
wwv_flow_imp.g_varchar2_table(69) := '46A0D1AEE955FF0FBE7E0D6EFCDAD5B8E9AA6FE096AF5F8B9B95E7BABE81B9CDB85BAEBE1637E905E24DC65D7D4DA6CB78D13BBFE9CA6F6419375FF5CD89B61F88F6C6CC57CA36ADA1C4AB4FB5B96C5C0D3F908C1BA58F615A9E69AC93F570BBFB9DE637';
wwv_flow_imp.g_varchar2_table(70) := 'CD34DC7CF537619E5BAFF90E0EE9717F6483058556D40B45D9D6BF84D0DB5887A3BFC9C9B14DEB3A84B3DF241F136457E3770B61B70226F8A5A0A390FD23692524174C207C56DEE559D0684F996F4CE4FAAD7AF176F93BDF8B4FBEE9EDF8F41FBF1B57BC';
wwv_flow_imp.g_varchar2_table(71) := 'FDFDF8F45B2ECEF54FBEF91DB8E26DEFC367DEF9015CFEF64BF0C937BF1D7FFBFFBF1357BCA3C4196FB8E21DEFC7A7DEFCCECCF3E9B75CA4F6F7679ECFBCE303B84CB23EF526F1FDF1BB841FF35DF1F6F7657AF7F1776F7B6F49AF7E2CEFB2FFF01E7CEA';
wwv_flow_imp.g_varchar2_table(72) := '4DEFC8ED97499E7113A0FE2EFF0F9764D99633D156C998C099FEADEF91BC77E0F3977C08777CFBFA89283EB6C86429EA0563ABDD1632C15108B23949F8E7A1BD70D5505EC2518EA618AFFAE4838A104B5F87C1812240A0988E24589C9807078D5F4B4346';
wwv_flow_imp.g_varchar2_table(73) := '685217DA26FB87D6D15B3B84BE3E4CF6F5A174A0BC57E136D6D6E0F60D7D2BCB3487365437AC2B2FC1F4437D70757BAFA2374F7FFD107A874A28FA430CD67B639E8D1E7AEAB327FA9E7F005EFD659E2AEF99CFEDD2A78977D972A8798A3AA3247D521948';
wwv_flow_imp.g_varchar2_table(74) := '5FE3E782DB73DF87B021F91E73D306B24AB33A2A93443BFF35900EA0728831D7DB9D6EAEA34A2411637946F5A24C5336C692694F1D8852228600E776A0549D67A43B486345E0AB51CC55B5E5AD4FB97992A290F19B813A3452B200D313A5C379BB4C3288';
wwv_flow_imp.g_varchar2_table(75) := 'BF352983A320E95611342EAF4A3397F49A5DB599BE90B39341ABB63430AA44122473CD74B9307D533BC169EC52F51883F80206725C3B5ADD67921D37FC715839B9B9AF28A7E9ACACE45FFD59F1DF07EAAE20681E246CE272B4A2F0296F61F35C728265CB';
wwv_flow_imp.g_varchar2_table(76) := '8A35DE926827042146904111A8D0765B4E12E0411B9013733D174737B2C4DA110CA38646412408210AC39C93525F56B6E3F85B99433803E5086D90C474F23736F3274D84A16EF76AF7EA2425AF4656B97136F53C9D32D98CBE327E87376F39210645C043';
wwv_flow_imp.g_varchar2_table(77) := 'B8EE735FC45D37DF820D7D9DBFFDBBD7E37B5FFA0A06FD01621545A6451BDF51D4C94E32471FD384E0CF1F058AB98B745AF2E2FA668B2DA6DFD44A7002474D428811DA8B34E0FE445B5911FD8C01522B83F4135C9A3BB8527619254C6F6359E670D0C3C6';
wwv_flow_imp.g_varchar2_table(78) := 'BA7FD423A1D35D4588EADF0D531024BFA5AFD8859C6EE08FBE72717FBBF3AB88A0A71952BA4DF144CB127DD3E14C92C46BC7328727DEB85D83FACFFA2922DE71DDF7F1E937BF1B97FDF145B8FC2DEFC1EDDFB91EEE27C84EBBE9A7DDEE686A121C857723';
wwv_flow_imp.g_varchar2_table(79) := 'A7E6DDB5038530395924612300D41BE97EA5A84D6D00849621089268261B4748A144A708014D902A1397571059F291CC7B7D4B0748EB6067EAFAAF92A94E963413CC55C5BAB9D53FA436D44B50FFFE3C49580666246F87801C5B3AD551481A4ABD7C07D4';
wwv_flow_imp.g_varchar2_table(80) := 'C66089D89314E5E0904CF7B57ECFBDF8A11CC91F628D2BDBB0AB146200A91D420BC87DEC4A9898836057578871137F8811418A7A6B18F437E444495E5F6E67367598B18A285C9872C6A6600FDA0743D212CA9618A3F6FD63F2AFFFFA6FDD64E768B46346';
wwv_flow_imp.g_varchar2_table(81) := '0A3148B7886131C851CBDB9F1D33A8FF19E4082182248A34D4182AA77144120801EB6D98C5BB0C8EA4FA0C90870AAACB7D096F3D2BCCD299C713622C3F7AEF661BAB34B0A65571892C0F2A6E62B49231B633BED7DB8057F9386412D4A4E4C6C68D6415B9';
wwv_flow_imp.g_varchar2_table(82) := '1AC8AA280EF877C8428C15669C054D7C903C727B43315D5B61DC32877AF91662D4B6770096811929C4881003AC7F731BF33668F218022CCBE5BD029223FF49721EF7ED20673D76DB07498DA7A5F10CF5D83FC46E53D88D80E08993F9A6659044DB5B89DA';
wwv_flow_imp.g_varchar2_table(83) := '6DF47E6F1DCE2963FB6921C638CD92EB2D4D6C083AE3883F23AA5B8801ED4E07A40C8BD9E9447D2FFBA7FFF65F4F406F6F0000100049444154E057FFDDFF36171EF28C2765E6B60E9BABC71E8FD563EF87D5638E43539F95E38EC5CFFFFEEF8E649CFF07';
wwv_flow_imp.g_varchar2_table(84) := 'FF062FF9FFFE1D7EE30FFF4F9CFF7FFD5BFCCA85FF1A4F78D12FA373A07C4C8EADD97AF937699FFDFA578CE4CCD2EB59AF7D79D667FA96B47D1B8C4F8A1285A21F43D4F8B73F5D498E67B08C6968C516A8B9F0EFF615FEBB94BBF0A3ED6B34AD05626978';
wwv_flow_imp.g_varchar2_table(85) := 'CE9ED420253D5141033778FFEE740FC8B164F84DB24A04496D498E06A14454F7A0C11AAA6ACE6CE042874D1F82938CECBFBB73FCA9A7C03F3B3C0F3CA9995937CB8B31AA347931061C7FEAC913724E78D00371E219A7E184D31F88FB3DF054F8F7D4BC99';
wwv_flow_imp.g_varchar2_table(86) := 'F9B540D48BBC490965CD72564F3E11F37431FED8934F2A89A7EF12AEF9CFD8A1DE81B9E0ED39C80E2E6F057E22DDD0FB2DFF3514EF00B64F9327C4A8B96B6B5127AC8BAEEEA349B3DD72D82EE1345D2B761515BA5A15B31D88243A5AE92B3AD8D6E03A39';
wwv_flow_imp.g_varchar2_table(87) := '9BBE96EF0989723E60319D8DB47EE83EACAF09FC92AFDFD3BAC5114A099E50FFD590ED4EEA7615AB47ED49F70219685C31C4DCDF7664F84CB7A127D2BE8E0E3E7FF6E420A513C92B2B012435771D443D79262DC20ABD541696E2125367B58B98275A9539';
wwv_flow_imp.g_varchar2_table(88) := '174929D9CAB07D4313101F16A4A1CE2E3D7DF7B1B14C56E889C20643BD6C8D3C8CE0713B9A6E7F4CB39571144DD33A6BEC963BD01837B430640D745614951535664B19632D6BA0571A763C1FA2C880A039EAEB0DFC40F2C6944014BEBBB20A8F236E4376';
wwv_flow_imp.g_varchar2_table(89) := '93B7595EDA81E4164D3947AC9CB45D6DE84C65A70921223FBAEB553E6893615B2969D26AD816C33411034875388D6FD6D5C7562131E935C2ACED23EA513E04F711E049F66437452F2AD78BCA34E32849F437FC343C347A0496DBEE76813842EDB81076CC';
wwv_flow_imp.g_varchar2_table(90) := 'B1470C9E40AF9481A2C750E0FA7644FBAB73E1839F26D067ACA8D5E3A7AA18DBE036042439606FE3100EDD774F7E8C9F5E99DB10B12D9242CEE1BE161127147A57A6ADD7CED6202489AE1645F7C02A42DCFEEC26BDAB2A343E8B2289A8F3991DD1B629F4';
wwv_flow_imp.g_varchar2_table(91) := 'DA62B0C56FB660891476CCB3070C4906F396E343DE86CE310ED53D459524032C126F3EAF30E77EF1E81546127EA2B013815CC49EDB6CC4BE427AA1BE92BE09F98C70389CA8F0D942E3CC9D2EB8D5E3D944A2B1905B8FA7C9E73E6D9B8C136F88512661E9';
wwv_flow_imp.g_varchar2_table(92) := '84AA0F877DEDF2E3B310F6201D7107F2007D7E7114187A5FD6784ADC06FA3A302E1A93E90A452BD37865D9715C3634CBAECF04F56567B11C472F1F824D6767B643B9BC573031998B842A6224C12292EDB60DFDC456392D19408179B3ADA097A16A4F55BB';
wwv_flow_imp.g_varchar2_table(93) := 'F17B01612F84EC4486B72C4F98071242849FD072A8D60AE9290AD9F0F3E4799247215A6784269D7FB4E2E6ABAFC1F7BF7C256EFCEAD771F395DFDC04F7FEF0C7F9055A10AFA357881151E70D3B65DDAF3F71DC7ACD7747BCFE01B51BBE7225BEFF95AB60';
wwv_flow_imp.g_varchar2_table(94) := 'D9377CF56AFCE30D37E537B9CDFEA7CBFEF079EBB7BE8BEF8BD73266E973DBB7AFCB11C1B698E677BDBDD285DF4BB5BA5D40F6C116C96FD76B9226B9A3B51758A1883BAFAF9A6FA779D829434D3F50C1CA1854DCD6655A1FE692579C46E828106244D413';
wwv_flow_imp.g_varchar2_table(95) := '812732695B71744A735649125F9211DC193919DEEFBDFD47F8FC7B3F82BF7DCBBB71F9DBDE83CF5DF427F8FB8BFE7402FC538249B26D4C83E5B4F4C2B310AED0EA74BDBF7608FFEDC31FCF7C96F1E9B75C249917E133EF7C5F96FBE9B75E846F7EEA0AF4';
wwv_flow_imp.g_varchar2_table(96) := 'D7374C3E17FCE3185FFAE85FE2D3D2E733EF7C7F96D7D4E773EFFE137CE53FFE75E64F1A772E5437EAB5F3FDF4EEE9C9BFF9029CF77BAFC3135EF84B38EEFE27634B275284459508FDAB6C647924D592F2025261CFAEB0ACA4DEDA3D58D76366797EF109';
wwv_flow_imp.g_varchar2_table(97) := 'BFFCD6B5485E214315D51644129E3C922055D681CF933A547B514DE66C590D2B35083C09033D69F4D7D6B07EEFBDD8F00F97F907BE1AE0E892E48024479C8E465EA1EED7CE65E8AFAFC3116DEDEEBBB176CFDD186EF490FA058ADE5072EFC386FA50E818';
wwv_flow_imp.g_varchar2_table(98) := 'C9985D4872B275F4A447FFD04696679935B88FBC98C4EC3E95E58B244E78D06978C2AFFD52FEEB6C273DF84178F8394FC5994FFA59841833CDBCDB841C45D9311D1142C9EB71620FD3D20EE4AD68A00FA5FEC3523DBDB8CA91430EB248B7E48365F56CEB';
wwv_flow_imp.g_varchar2_table(99) := '0191E3EE83A2907149328A06DD2279D36D211B8D9ADB22C3747B59B70312D044212722C8B843396D73025CCE67340031EB16D0B2938BCFFA2545436C27891E9C4D483738FA69CC49B9A9BAC71F9BFF06E4E98F3D1B2196931ED4EF8AF0218FCF5473A0A1';
wwv_flow_imp.g_varchar2_table(100) := '1349583CAA143446923902D57D554DBBCAC633B86331430DB095DF533872D8997A7AFBB9E86D8C15F7F4B92BF338AF21C8389EA8CC5F19B36E9B95D7729A6DA48623BBE57E16C9108DAE112BB56540C62FF4A83B42AA50385A29274B6AEB1C3511C913AE';
wwv_flow_imp.g_varchar2_table(101) := '3635EDEAF2B66D01D617EAE3D8FB9F8467BFEE1538EDD18F829DC66DD038EEFBD13FE2F66F5DAF8F9F838C9A75B38C914D24CBBA121C91DABE503D496FD3628F922CBEACA4087F9AF039C63F930B29D7D721B8AF4764CC4CDA7F658C2A00811C0FAE268F';
wwv_flow_imp.g_varchar2_table(102) := '5A697579AB3C6912A76948C2FFDCC75C23659A31275524835974301E6FC324511B9D763094C991D2B20B395C89997317FF9C96113AEA5302325DCADFDAFCF7204F9DFA8BAE77DD763BBEF4671FC70D5FBD52FA0D47BCD385647D2A0F22F48F93534B0A17';
wwv_flow_imp.g_varchar2_table(103) := '344ED125CFC3B48025EB93BDEC4488C3BA422C49B45A6D44D5AD584F5168A873CCB4A83CB6AC782E4D37E7BA65E4C29237524692E192DC2169A54D8B51337CDE99C00B49390885B4FE0615F3951DC80D9A102348C2B852FED8D9B064A226D4633EF92167';
wwv_flow_imp.g_varchar2_table(104) := 'EAA0FCCBF0DF4234AE16E7A7C62F7CF8CFF19DCF7F01877C16F36B8FBA712A77B4CCD15B789220A952E3523D081CD1929CA8D1B2ABE2D20ED452B736A6B26CD456BB9D95F601D82FEB8C9F00F98D0D3FC2A93E2A570592A0B688AABA5496A3981CD5469A';
wwv_flow_imp.g_varchar2_table(105) := 'E82F4B63BE4FDF48E3CBF341B3CD2A962DBE972D41FAB95646205394F84D77E9B00937852074603EED01F96F46E76D4B0BB226B9EB96DBF099F77C10D7FFC39751F4079AF7840D7DFF4B73E4A6664426404E4E2D9991709A27C36D3B85C95E76C01D1D7E';
wwv_flow_imp.g_varchar2_table(106) := '21A52A1E47216A457915380215CD015534CD2CE9357EB35E972D071E6C8D989393E3BE9B24214655A918A4083135BF49588308262EDAD8123761584D54D2C13A13AA2DE7BA85289389BEA46D34A86DD6450450F4984A24B17AD20978EE1B5F83331EF768';
wwv_flow_imp.g_varchar2_table(107) := '8468BD45249DEFBEF576FCC39F7E0C37EA1D52A14F22AD7617AD76475BD8007E5811D5A62BC99E62DD843FDC88B074071AB06C3062670888FA1E6544A1A7A8616D7C232A20589594CD196D88518DD357C997EF55A764AE4D13C25B1429079AB185C97FF2';
wwv_flow_imp.g_varchar2_table(108) := '4ADEC42484A525397DE918D0740846A1DEAD22D2E533D0031EF1303CF8893F0B6F3DFE3924A1272ECB3064E49835577DA36C75E25967E09CDF79194E7DC443E1BAF1867BEEF821AEFCAB4FE2C6AF7D5D0E5380041C55A38E0924F5EDAC2FFCE6B390FCDD';
wwv_flow_imp.g_varchar2_table(109) := 'EC0B208DC69E66D96601E7A2A6A51D28EACC0310CD14AB43B08D97E444CDB64C9AC9F36DA2A959B1030CFDB1B4763019ADA537B2515BA4E5CA0A80706400B95916C98CCFB4989164695D530D545D4ED76CC8CE54643CDCAC92AF531FF9309CF3DB2FC739';
wwv_flow_imp.g_varchar2_table(110) := 'AF79199EFECA17E3C14F7E3C429C727AC9A9FBA798499AB504954F7CF0E97ACFF38BB8FFC31F5AE2AAFB3DB7DD915F2E7EEF0B5F41FD5767C980186286A0DC761DCE38635622724630E7B36EA559CBFBACF69DE2C24E1916D17B80A49497018B3C016345';
wwv_flow_imp.g_varchar2_table(111) := 'A94151C6001749509B78D7EFBA27BFAF500D2471EC2927E398934F4492CC8CD38D9C23C87883C24D3D89229FBC1C59D44F8DF4E192B43CAF523B0D90794D233CC19A14FE7FC94E79C883B17AE20938512FF9FC96F88C273C06218E4D5934FA8EC29363FE';
wwv_flow_imp.g_varchar2_table(112) := 'E31F787F3CF937CFC7037FE69108F918508A5EFBF19DF8F29F7D0237E933CC402F442522378410E008E53CC498F51A2ABA67FD32C5EC1B39EEB3A4204896C53DBC876565B51037B196836C657CF224D556C818A0A93E276A18A5A4F07AE70F6ECD6F702B';
wwv_flow_imp.g_varchar2_table(113) := '647E8DFFF0673F0DDDFB1D0B529C0C0821D6CD1339E9763940E907136DA0AA6AB75BCB5554A92EE1484720C8714B46D3B8952448BA98E1D09D776B124B1A23EC484F7CD1AFE08C273D0EA377371A43B2F389206AEB510609C1F1A79D8AA7BDFC85B8FFC3';
wwv_flow_imp.g_varchar2_table(114) := '1E0A3B05944CE703F3973EF271F85B5ED222310E95ED42752C30BF7F84562CD271281D6A0D85715F1954D665D9E45867A1F24596D35D8EBDC19F5B97BB951297E39DC91563E5402343946456BA680E3206909B0769EA1F7FEF26DCF6ADEB903411AE07AD';
wwv_flow_imp.g_varchar2_table(115) := 'D4873CF50978CEEB5E85873DF3A9F9DCE057FC27F8E794A7C03FBBECFF0DE7246D13279CF1409CD0683FE98CD371CA5967E6FF9CCE74A3B6D31FA08F96C7491FE87C31802730690158DD204725C77A7EFB8ACFE3075FFFD6C44BBD634F39098F7BFEF3E0';
wwv_flow_imp.g_varchar2_table(116) := 'B7C79E3CF3420E104240D4B66EDC49673D084F7FD58B71EAA31E0E86B1BC7BEEF811BEF4B14B71833E02271D98D5B958ABC925C51FA557499F650957280219502553D77D1AE5FE44E6E208482244D91C122FBB7A6C2AEEFA0ABB96D0104052036E69C0A1';
wwv_flow_imp.g_varchar2_table(117) := '5C25521475D22853D63AA99DF0590773927FA1EE9ACB3E837BEEB86344E1D57DE6E31F839F7BFDABF0DC37BC1ACFFAED97E199AF79E94CF8B937FC16CED5D3CD393AAB34699E259E73DFF8DB15FFCB27789FFAB25FC771A7DE3F1F527D06F304D9E9DB7A';
wwv_flow_imp.g_varchar2_table(118) := 'FA1929A182B79AAFFDE5DFC07FAEC534424103CA3F3CFFA417FF2ACE92A387760B7684103DF921FF95F927E8DBD6FD1FF610B0E13C77DF7A07BEAA0FAADFFFE25747679E04E403BC4D4506841085292F92888A6849CE3D68FC6C4F1271BDD848D104F394';
wwv_flow_imp.g_varchar2_table(119) := '4E8746AA6599BE81DE55714F1DC89A58496AE559C9E1F4614F03358D0D631A97674194016EFDE6B7F1E5BFFC4FF007C7264D7775556F6D4FD7A49C81937406D904679D8153744639E5A167E1249527DA553FE5A10F86A1D976CAC3CEC2239FF38CFC9FBF';
wwv_flow_imp.g_varchar2_table(120) := 'D929D6F56DAFAF17A231B41015419AFD7B5C3FFEFECDF8FCFB3F82DBBE7D5DB309C73DE0FE7A21F84B38F3898F05434410FFAA1ED5FD7F813DE0EC47081746F4769E2FFEE95FE0C62F5F95A35921A7A81BEBA9773427EB5AD9DA920391C4B0AFA7314579';
wwv_flow_imp.g_varchar2_table(121) := '6393F2228D9FCC42B403B9651248C932A8AF54CDC524C5CE6BE311ED9C7726074944190F4A83A91F104BD593598841C68DA2987D310450FFAE5514FADCC57F82BB6EB9351B6C36F5DE6083FA3CE684FB214F90B79F18D15959C1BC74CFED3FCC7F1FC83F';
wwv_flow_imp.g_varchar2_table(122) := '2262A7ABE98E39E9C4FC1FD579CB3DF1CCD3F1736F78154ED5939BB761D378E2FCB4F5352D8EDBAEFD8E0255D2480975E9E60C8E7C46841841AA2D63CB5B882D50F64D7202DB37C9116A30051910341697A7C16D96667A753CDDBC543D2CC5B580892442';
wwv_flow_imp.g_varchar2_table(123) := '8C702AE43003AD94B25C60A83ADC1E6404E5C6CF83A8951665AC6F7DE6F3F8DBB75E84AF7DE23FE3E6AF5F837B7566F08F6AF40FAD6311F4D60E21C3A14323BA5C37BE81B30CFFE9943BBEFB3D5CFFF9FF86EE8163B0B27A2CFC836EEE7F967E24D1D2D6';
wwv_flow_imp.g_varchar2_table(124) := 'B676D75DF8DC7B3F841BBF7A350ABF7AA8888F57247AC63F7F89CE6CAF2CFFD3980AEFEC2EBD61FEEA5FFC27DC7CE5379014398C833778181700001000494441546635C921929C21D793EEEA63962318D752543449FE4908BD9DAE7FCA525C95ED25D095';
wwv_flow_imp.g_varchar2_table(125) := '69904CA8B3246F353FF620EDB90359271B3EE45592D0D707D6428E93B73319C8438B3200E992A96743D02AF2AF9CB4F414E243F5D73EF15FF0F94B3EBC2DF8FBF77C1857BCEBFDB8CC3F58F6EE3F19F17CF6DD1F10EE627CF65D1F18E16A99FFF0FE8FE1';
wwv_flow_imp.g_varchar2_table(126) := '47D7DF08F75BEA1F40CED7D1939875BBF1667CE9A31FC74D5FFB069A91C84E748ABE719163193E307FF5CFFF26D3FA679346234F98E08526D85CA4EF23AA5C204BE78DB6AF1CB027FB0EFA1B6249D23DC21FB74966DAE9DB08ABFE921C76BA7D997A5886';
wwv_flow_imp.g_varchar2_table(127) := '692B9E1023A22208400C740EF20F9EF5F56E23D981A83645166C2345C9E9AC1CC8D1A01DDBD8B8EB5EDCFEEDEB71B326EBC6AF5C8D7970932282DBBEF7C52FE3BA2F7E454F3857E106D15FF7852FE37BAEABECF61A6EBEF29BDA266F1B47846DE8068DAD';
wwv_flow_imp.g_varchar2_table(128) := 'D35D0119F0C3EFDF802F7CF42F70CB37BF8589D498C83B6FBE155FF8E0C7F083ABAE41335A999E21E4878E1C49E43C9A5F40BCF31E34A2EC67BB783B330D43847F22C291B395ED8E9989242C37C9790A391FF620853D90B14904490DC8BF78180139CD50';
wwv_flow_imp.g_varchar2_table(129) := '5F918B6200AFEE8ECE15A406B2896B3682A4C65CC26C8AD9581B19D4C4C8816DB02483158A84142ECAE0B3B976860D31A26B2702F1C3EFDD80BF7DCBBBF083AF5F8B6624F2F8EFD27BADAF7CECAF70DB35DF45921E682492885544F60FE6F90D74D2E37C';
wwv_flow_imp.g_varchar2_table(130) := 'C685F9D3634739E0AD56B02A5839B08A287DB0456A773AD09460A0F369217BC85FB7E058DC3C5FC3C57C5BB67A305D0DCA8FC13E2FB43B5D1D4A57E1816FC9BC070476D69656AAB7CE9ECE097D3D55254D5ED40AE58289D969D71EDBCAEA31E8760FA0BF';
wwv_flow_imp.g_varchar2_table(131) := 'D6CB5BA3B7339FAD8AC11077DE7C0BAEFAEB4FE1D66B746056FFB3E4DB268E2090235A5765F96F0890C4A2E431DACE3B198F5F4646396CA185B551FDDAF3B0375CD4CDC2B6C3E640EE356A02BB2BAB581138B733918B8D62BEBD00926877BB7088F76AF3';
wwv_flow_imp.g_varchar2_table(132) := '3921B63AF987E0C8BDD5C1E3ECA8AFAEA2D1FADDF7E26B7AC2FAB222CE57FEFCAFF1C50F7D1C377E79F2903D3D3E52BA76BAF0827324B1AD2C739A6E2FEA76BABCF586086F99032DACDDC83DAC0E64C5A8D59E414672FD488227C1D1A1A3E8D091137B72';
wwv_flow_imp.g_varchar2_table(133) := '428C8749058264DEB2EFD60BC2EF7EF60BF8D6A73F873BF4AEA8683CA1CDEB9C648ECE8E68513A9292358F78977847BC153F6DCA265D9D31DDDFB2229776A0108A6B97EDB4E64BDA8C9B50E3F732B7137514197612FDAC5351E9B6942EE6D57655E89383';
wwv_flow_imp.g_varchar2_table(134) := '652D25434CBBD241FC8B2E3B8D8F15FE2907C445948BDB9676A0C56217B7263D05F84CD2D31EEC5F0B5AF7AF37FBEDAF0E7649C65FCCBDB9D54F2DE6336C6EDD3EC6FCD62BEB639DFC6B4B3A3FD911B62F652F28F5FA43B6D8A874F0A3FA4E9E9A0ADB57';
wwv_flow_imp.g_varchar2_table(135) := 'FC3E4F0DF41E2EA9BE48AB5084A583C11177A02407F1C07C80F3233EF46D88647E9DBFA109B353157E3A5834E2469BE579D22D6F63E390DE3B6DE447E206C9B68A4D39436D39D4D31AA55B5FEF592CDB87F16D099A22B25C4F7EA1714F35CDAD0EF514D6';
wwv_flow_imp.g_varchar2_table(136) := '97E30EE40483412F7FCEF1AF826FD72EFD5E0FD9F9B440D7D7EFCB7F446A60479ADBE3F20D47C1818A3CC9D0F363578FF45D9D4F7C68EC6A2F26899E5E8AD9C16CF8ED0CABAF4360CFD14B136DA36FA8BC21C379D2B6C35FD30CF4AAC1FD5A2F6F79D6A7';
wwv_flow_imp.g_varchar2_table(137) := '23DD3A9D15D879DCB65399FE28BBAE2872C87F046BED5ED8C1B71E57D2E1B6971701497464176F35D66F5D0B6C2B7EB70F3516E71E4BD256EA83F286EC329443D6E3DDAB3C2C2BE8A5EFFEA36F7955ACDD77370EADDD839E26703B06EE6B757870418FD3';
wwv_flow_imp.g_varchar2_table(138) := '31B64132830F8F1D1DEAFC9262A0819A6E2BDD3C41D6C18B3B4A5E5707C3105A9A803ED60FDDAB7CB09588DC3ED0EAECADAFABEB027E9CF68491A55E2E5B374F8A9D35336CE366DD3C69038D25E91D98C7DCD7CB547FA82D34A9F344782C7E4B6D7ADBA7';
wwv_flow_imp.g_varchar2_table(139) := 'DDEEE62747E759A61CD26DF3F82DBBB9E58610E584AB0001EBE3C580A9F4FA8FBC7BEA0DE814C182EAD20E6499BDDEC6E51E94A1A7556F053D00B7CD028771AF24B7053D9D396F424BEF276C289F69068A44431D429BEDCD72D2BEDE93D32659BCD56EA3';
wwv_flow_imp.g_varchar2_table(140) := 'AB95DAD1A3F08ABED67BD26DC48D8DB51C3D9A7CD365F3F7D557A16D33AAFF966490B2764548524ED541D04498CE8E5435CDCD6A9943BD6B31919DDAAF32DA9D4EFE28BC4886798672B8CC17353DEA1F02EB461203D9642870FB2CF038A0E85EB799CF76';
wwv_flow_imp.g_varchar2_table(141) := 'E9740E64EC86E6A9394789BCB0A65D269786CBB0953C32D4DF91012DAD12907ABBD9CFDB93F0989592569EC16D24C5421747407AB2BA0872AEA126B45F45AB1141A36023DA7129DAB6FA8F7AE7E4E6A089B6C1A2225292A11D35E6E963FAA126D94E4D12';
wwv_flow_imp.g_varchar2_table(142) := '1D3DADC5108C9E00CB0C926FDDFB8E2872DA0982A98A655AB71A1DF5581E622CEDA469747FB37432CEF2150A2B56825529EB20DD92164E219D2BF4A6CC3A7A01960D549F1D9044D4E2B08DCCEBA8883D4A9BADB513C145717939811DC410C5593E3D5849';
wwv_flow_imp.g_varchar2_table(143) := '55365DE38101B5613095428C889A2C1B7130D8C86781291255130A1D749326D286B571841C5DC6757476214BA7F6848D1A1B05EB938D29392D45B118DB8DD67191A49C3A82A422DA50AA9913735321E74F9A6813904488256F0801949D0A39B61708A652';
wwv_flow_imp.g_varchar2_table(144) := '921E45C339C8B195486639EA1C85F84D8BA9649CFB368D9B428C88825C56DFD18B4AAA0F1BFC01C5E56E5F16C2B28CE67BE3C7DE7B39C93C30AF508048325E5F8738CC4CD23EE36518F1E5E2D48D2402239065158A6A3DD8306824D919459EA08496269D';
wwv_flow_imp.g_varchar2_table(145) := '94BC46BB8B512BCE913189CE51A850F433BE098E5043E94A06B4645C72B31C5429C4B14EC90A54F8E9CC6D494F51CECBB680D23665CD139AA453D17094B205799C698E6C920821C2C9639F4757C8394C630831800C2E660872228941922D0C46BEF2A237';
wwv_flow_imp.g_varchar2_table(146) := '1F3D07B2020C1C39919533CE83983561C8C649301D311E18A6926402444E45F3C7623366F266234D62C6B556BB03A833EB339C3161859CDD1351F6577588D989A444518D491160A07CD6659CDA35412E193C690697494A46D02606C928648E64F408722D';
wwv_flow_imp.g_varchar2_table(147) := 'DF46A8C982F88D48929FE4842E37C1783B578D0B9CB431C9DC94D2302FC0045E9811BBB84DF6B08CA0EA1016B53A58299C07A2414E8B4BD9818425415285D91749B06A4A330CE5A65A5472650E04BDC7B11193A6CC4E04E54DD22421E6A7F4AE27B9D93E';
wwv_flow_imp.g_varchar2_table(148) := 'AB6C7AC3AC36E3921CBE9063BA6C083182AC4703503AB996F2B82625198F3A91E29B9C9E54D93473E55B4D5CE68564268D29D7C42F01B958DF48C913DE34497AD6F8DDE492B81B76E0751F7C8743A0CE4204A41C949207D230A250BA3462194077954DAB';
wwv_flow_imp.g_varchar2_table(149) := '6CCEC53CD052B5248318369396924AC7D8DC5A6288EC1896217D36C991BED20424E17F589052E62F1650944D09455EDD650D883ECFD515E576686548B64539045733D077E99233DDBC00948D2F8D6354C9C4A3DACC0235AA66836D41EA98A17E0B8DE795';
wwv_flow_imp.g_varchar2_table(150) := '17FDE1C166FB32E5729696E16CF0A41C0AA5AE9433DAE34C3290CB3524150A470037AABCE8A2566918C9F2A4997BCC911DA192E3AD2959EEB87954A24A5464840C59885E179A89348530CE0D2ACEBB0A8DC75A9883F47D0EA589461D11A1153191589ADC';
wwv_flow_imp.g_varchar2_table(151) := '641378572457974B800A0C252DEA249C8B65B6400713CD01667B24B9392E9C43B223F494863BE21D11CB93CB7350651C6F15C9516864C811E9B60A24C1DA7892916684DB7A02723F33DA734724420C5006D3E98699A91636B3711A49843C099899A4EE08';
wwv_flow_imp.g_varchar2_table(152) := '1F34863AE2D44852636390890AA9E3C551B7D43973C1BC345DAE95B710C7CE585295F8D1BD310EB75BC6A8AD2AC44AC6EB3EF8B683156A579946B22BFE1173721492716AC4BC3975BB07079477CC4C4473F079F2314E244196AA27CD9861DC3A590AC146';
wwv_flow_imp.g_varchar2_table(153) := '271C410A3975B375A82716B10B95349949F9FC8B549F6E2640EA86D9A9F9783E5A040DD21008E30B75ACABD132596435BE2636E6B1082355A5B10A9357B64325D4FCE5D82769F2965A9D5B275B96AB95B3B01CEF0497A2D041465E384616DA5834D23162';
wwv_flow_imp.g_varchar2_table(154) := 'DB255246B601959B291BC6850AA83C546DEA0449DB8B50332F4700521C32AC1DA626B24C3FC22B14C065E775DBEC5C3266374C608B194F7B1304204290D9A5CFB4DEE4E23E422C1783F5F582C0546A3A6F880176D42912E32E7CE347DF73701ABF6C3D2C';
wwv_flow_imp.g_varchar2_table(155) := 'CB388BEF77DE9FC3A20FD59A145134FDA7512E8BE55D54332F92327539ADC95ED2A4A22A6A474591A6220B1AC94624CB610EF5CDABD1241D4B1D922753D06C9B2E27F551524FB78CEB9ED461D38166C82489504592E1B08F2A8D32358FCAB30A1E8FED51';
wwv_flow_imp.g_varchar2_table(156) := 'E8105C5A674C55E8E56A5D63D5475DAFF2CB7FEB3D6F3E5895F7242B2DBB27A22A21295DE8529A9E7421D3C8A05B4D0510A2569BAD299E62E2C59C04EDE02209BF5484928DEE495671EA9AA5ED98C47A2739903C0E24C70D53A5245D9BC39E37CA1023A8';
wwv_flow_imp.g_varchar2_table(157) := '28E4CF1D99A721C7225C25674F4DDBEFB644540C8656C7A4192CABA8BEA101ACFE6122251F332630BBAFCCD6721772FD765A233BAF69C85A1CEB82F3E4DB7CF0D613646453A46AF25C5E06EC409EB064C35711C265E999C59104C95C9E77CBF46AB45EE4';
wwv_flow_imp.g_varchar2_table(158) := '6C5AF7816693FAABFB10EBE80A2122C6969A0AF83F8FA91B92B6E2A4B19244B49329C7548A7A636E7E47BAA1DEA2BB39A91F7FAE51E62ACC166C3B1732C6B18AE7E9989177870AB52759D813295342EC4405D279D27F52612146A44D438F90E3822723EA';
wwv_flow_imp.g_varchar2_table(159) := '3385318E1A3E74BABC1928832D1E460811516033F607E5A791425B40D264599EDB47672A236641A53BE74406B35846B33D6915CD5A272104B4ABAFFE83FE06921C074A591F7901A56B885198CD5714DEBC1E8BFF66A23FBEDA790CC699C34E6670597079';
wwv_flow_imp.g_varchar2_table(160) := 'C2E1711EC946F0ED70C01B3F7CD1E5AFBCF84DE749F90BB37CE67BBE9104C95C5E74B3B144980D5CE889699236E52A49913097E7DD42206C50524F633A270CE444039D8734572827734532E69B82241C794434C725304AE4580EE17FA3A6894254046AEB';
wwv_flow_imp.g_varchar2_table(161) := 'EBBFB71E3B4121871EE48842B4D416429CA0AF2B24B3F375578E91F484DEFA1A360EADE9297308B26E5B4508FE64C20B5F71D1BF3F2C91A7D6673CDA1AB3C7B9C2E6C1E4BD37697D54CFF69E0C925BF6E48F90A52192BE820F903CE3E272569653369A69';
wwv_flow_imp.g_varchar2_table(162) := '845E70317F2CF5A499CF3F3CE6F01FF592AFB3B28AA855BD80393791045532BFB26D5DA4380C33A849E6DFFDEAACAC686C43D43FF1D8EE7460C722C53B83CF2852BCA2F36FA276FC73507244FF64A7EB5D8DC7F690652EB4ED4D7F38E1B03B9095F7405E';
wwv_flow_imp.g_varchar2_table(163) := '79F11F71381C5EE83A194081CB8B8024A2F67C790E3CE1F5E479B5D61129E8AB3BB5DAB0450A31963F742603FB87C6FCB33F2B5AC5F9508AAD53D657FA5807C3D61C4088115C4048323B51574EE41F3FF1E477BA07600758C0366A0A2166FE8E1CC8D06A';
wwv_flow_imp.g_varchar2_table(164) := 'B52F07C3798A3AB4CD478487B1100EA3EC4DA27FF7C3EF3AF8C63FBB846CB52ED4402FDC4430852009FF26251972881EF47B99428E98EBC6B75BFAE29EB15BDF1CD13A3A7B7465F0B6F210E3D64C1505C95C4AD5B9295766DCEA7692F004433916249299';
wwv_flow_imp.g_varchar2_table(165) := '2EC4A83C88BCEC07DB4C15593EE7C8710EEB7655F535918589DA11AAFCCEFBDF7AD02B4403A6426D3E27299FE95051866D75E4243274AFB79E43BD1D298D7E46930000014F49444154495787FAA808A4E291BBD471ED24D39DDAB153752006083B2C0E4F';
wwv_flow_imp.g_varchar2_table(166) := 'B2C35C987438B60D0547DC71EA611D1507AA3B772E47BA5C3072A816D3D93584C4F323C2F97292F3099E8F343C5F6785F3B57D9DCFD83EBF1D3BE79BE64800A5874ED0E703389F29CCECB7907EC0F07C329D8F88F3439C4DB7137D6B5BD4B99C85023B8C';
wwv_flow_imp.g_varchar2_table(167) := '6D76B9F439AA5738AABDCFE8DCBFED51C3CB2FFEC34F185EF3DEB77CE20D1FBD58F05E8173C187DEF98957BDF74DB9DD34871BDC57A9C3C573FB2DF5B48E820F89EEE2DDEB57DBA2CE6798ECA8A2FE8773A0A36A8DFDCE776C817D07DAB1C9F6199A16D8';
wwv_flow_imp.g_varchar2_table(168) := '77A0A635F6CB3BB6C0BE03EDD8643F210C7B348C7D07DA2343FEB48AD977A09FD699DFA371EF3BD01E19F2A755CCBE03FDB4CEFC1E8D7BDF81F6C8903FAD62F61DE8A775E6F768DCFB0EB44786FCE9113339D27D079AB4C77E6D8716D877A01D1A6C9F7C';
wwv_flow_imp.g_varchar2_table(169) := 'D202FF1D0000FFFF0CE5F11B00000006494441540300862E0F10D6ACE5C80000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(1609806614306825657)
,p_file_name=>'icons/app-icon-144-rounded.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260505092756Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092756Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_192_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000C0000000C0080600000052DC6C0700001000494441547801ECBD09A02D4D551EBABEAA3D9C73EEBD3F883204648688CA2C93888251D438C42926C62921188DA0C6396AF2A211139F89C6C753A2080E71E4';
wwv_flow_imp.g_varchar2_table(2) := 'C531CE2222F3A8E2082AA020932820FCFFBD67DCBBEB7D5FF5AEDDD5BDBB7BF7DEE7DC73EFFDF9FB747555AD5AB56AD5AAB5560DBDF73EEED95FF09470C387CFFFB2F0EC3CA84F795EE92F208EE0E71ED8AEDA6F0B83796AD058F6A101571BCBB25BC1B8';
wwv_flow_imp.g_varchar2_table(3) := '5EE5BE3C8BF27230B31B3984A2B0E3A3433B3ADC8F61363B315DB3D971CC27F87C3613F85CFBAA06D56EE261353EB0F982DFBE31501F8F0E0F16FDA9EA1C1F56FD3E3A3AB0623E3FD7FEF5F1BCAE4C7D3A393AE2D81DD8ECF8C84208E7CEFB1175C64D77';
wwv_flow_imp.g_varchar2_table(4) := '76ED460EE3F1D840693BE74C613299DA74BAC33EEDC5BC600A002C969D637F27938991B51A1FE26519C853088579E76D12796E1F0B95F9D168418714A92CAAC3EA0B98B391F736DD6DAF7FBD8DAF675F423137B322CA27B03FB4001B6BECCE717CE238CC';
wwv_flow_imp.g_varchar2_table(5) := 'E7333BDCBF62572EBF8FE1665AE4A115F4AAE4EE86B8E56113A38033EF4706C0A4208E695B5CF2B405FBBAC89E4B54CC0B937CCBC6608E8AAE60D9254F284F94F7232B8E49D5198DC631AD4741E5393CB8AC640C708ECA7FC17CD6DF58701D3EE69CA58E';
wwv_flow_imp.g_varchar2_table(6) := '399BCD6B63116C76C2D980F070CEBAE78E0EF6ED848D1764AC20531A8CC3832B713ABD0EE5B7C2D29CCA9080E082CE51199497528C1A0A71B2586EA8FC3C828C4EED88979DDD3DDBDDBB18C364BA1B8D54650A81B3C0F1F1219D6050762500A0779C586E';
wwv_flow_imp.g_varchar2_table(7) := 'D01109CE46E389EDEE5EB4DC40EC3ABE2493BAF263C9EDC9C9B1CDCE798C5C9D9992173179C8F55141A32821D7EF535E3671072A8451599407609A6A814AC0F393727F60F1BAFA8F13B607F234DDD9A3024FCD791FC384CB9DF164A7C68064AE50036619';
wwv_flow_imp.g_varchar2_table(8) := 'E73C15FD82EDEC32EC5CA0215DB23D1A94683BEF33CCEB3B39A34C128792CD84CB1E208D51B023EEE782964409E92AC72ED10760F22629AFC1D04C30BFCE8D2004AD254BAEB504009230CD3C970D529CB2D4E8610B4EB5E763045A468A3779E6E64C0420';
wwv_flow_imp.g_varchar2_table(9) := 'AEF9C55FE24DB136F3AAA774330088C6A375F2783AE5588DD9BF9139CE7800EC2C2F29A0F898734530E7F82B7F16F445673EAFE40F60E91812FDC019FD843341CA5FEDD8A9014DD1537A9629A7662991600A730AE0843B74A5AFC72081E67C4919F23C00';
wwv_flow_imp.g_varchar2_table(10) := '2AC9D8F2EBBCA6D88203A9769DF726F92A9D07003669CE02AC2399E778E79D0E5C8EE95446CEEF60FF32F78797ED886BF3E20CD6E62B7DA30C249BD16852EBA6DA3F8BF66A443B324EF0F1786AF2549199C9D48C8CD9E23AE1DAB46F83B6408B51E0D425';
wwv_flow_imp.g_varchar2_table(11) := '2FB67FF9663BE0C65AD3D9090D481D5759443AC347680C8A737E85BAF3755841A3BE1ABC341B2E79A367CE64D9C4F13C0DA9F14CF969E63D0FFE9ABCA4BC94FD900A1FF9A07C0B1AE50975E098C7ACA7E5ABA9D4940E550DD6DCDBCC39EBA87D3B87CB39';
wwv_flow_imp.g_varchar2_table(12) := '2ACD783C898C0030A5650C79DB124AA067C861CDB4047570E5167A8BFD78F231E3C6FA98FB08791219C4FE959B23BC59EF34F9E696119048EB14D5BF1CA2412828E01C7635D21A44233BBC3BC90394B71C4E8621DE02152F039D4B32D0F88EA9F8277458';
wwv_flow_imp.g_varchar2_table(13) := '5C2C2EDAACB89F715932E3FA5D788BC28DA362F12EA65971444700445FBC28E2A91037C31AAB05E0AA454E4B1E3E960D00589D9AE935D7755ECCC6415F52AA2734B032A4821EA55E727639CD604D6AD5109625C1028F79AB7D43093DFB6758E330528B92';
wwv_flow_imp.g_varchar2_table(14) := '7F3EF83AD50A54C6547E55E216A21A179D06A622F1A5CD7ACA8B273935C509B6695CF4C8C4F37D4E4E4FBA147AF073DCD3A4E920FD4A7D19C4881BC8AAA0B4C8D0333052F0CA735435F3D49C56ADB77F7D7472FC4DD34053DDCD568C827D90B1DA55BEC2';
wwv_flow_imp.g_varchar2_table(15) := '402F8EECE836B244FE34F8317D4E0F8D871C5C920B4027C8932AE9406E9CDA3F157486DBB025DAA147A1D5564E37D0510E95615E6FD334757DB452070077E73B35B80434EFE9FC50C11C738A3D393EAED1BE9A1960D5280A0AB7E85150ED79F62FDF62B7';
wwv_flow_imp.g_varchar2_table(16) := 'BCEF3D7670E5324F8E8E396B1483D914ED404586C11C4F69ACE7029CF9C6FB8AF9ECFCE423D60215734EE7A4B4C2887B424F0728E7E1B93C112C85638E5F4A6F1C37D7AC1901C7A5B84206328D439EBF1A69672D0AA2869CE7C050084A972158B93E2C73';
wwv_flow_imp.g_varchar2_table(17) := '439EDADC8CE2FEC265E8816F9B0FCEF5451BA86419033C0ED54828E4D0321DA8B847DCBBCC17C775332AE3015F0C1E31C809A8BCC4EC7E062AD4BAD930D5066826DE330B86F2EE733425C6D93E43114C4B2F5105501E883006608E8A69D92543918167A0';
wwv_flow_imp.g_varchar2_table(18) := '41C940B9F6210230E7BDE557E22987A5B47838E6E6FC68B16F99735FB7AE8D54378F73CDCCE10638F3AD9D1FB67EF6349E1DBEFDD48B1A7D1605A806385041744214D608A5C6504BC6B94EF66BD8E032230748785D6DEB0C7ADE9CE9C8E78C1E521BFA41';
wwv_flow_imp.g_varchar2_table(19) := '46407CDE7993BD69473903B97CB84FE180F6563AC3C2B9DA5A301CBDFE421101988B32AE78335E9211A3CD6E8E7997CC4508C0A22D5B5E45731C9625160F5B8E0EF6A3333DA4C33AE491ED095FA2652883929D1A04C03CA73FA0D1F9E3EA45866557DE39';
wwv_flow_imp.g_varchar2_table(20) := '0931BD539000F5F266C2770C193AA7B76386938537CE4B86A7813A6F52ECB6DACEF91A38700994F39B0A0B2E8BFA841838884714F6594FCD8E4A06D4FB22834B7C5DED785E949F94553B3A93D7F829ADA0591C0D07323FE56990E836030073719C2A3904';
wwv_flow_imp.g_varchar2_table(21) := '1A659BAC0B1AEC8CA752962EE2151C537D22F68086A0742A6AC6CD7CA70108D1796F401D4553A01853791EF21DBE3AE2BCCF8BB9A7989A73D57E43346614242DA086779A8C68B6D56FF641386DB8126CA092ABBC2BA8FC84536F57B9E08103327409247C';
wwv_flow_imp.g_varchar2_table(22) := '270360503A85E89553E62AC781869F9AF08DFD887873A88F65C1B7EF9255AAB3754CA5CFEB3A1A00501980CA0A2AB6E23CCC7A6686190DE3E8F070F09EADAEDD792B4C4B71D0181831D4D6F91CE65807A87704008D6042AAD52D2F27AF5B41B649D5DB69';
wwv_flow_imp.g_varchar2_table(23) := 'A3E0B0DACD900D7AAA235EA2EE260063ED61263C1131F2CF6CBC23DFF44231D3F20824D2BEC368415E809A3C161C78F1B328BEAA51357630CDFA965D004CE369D915B467E8E97F86DA9B6CF6199C6980FA78CE29872691A20596E3CCF80E4A8690C3BAD2';
wwv_flow_imp.g_varchar2_table(24) := 'AB9A916102A040C6965F811E724E0B0C1CE4046F0E946F789184E7B92F70CEA72C9D7F61DAC82C015B249CAFBAE0C86F1B0937AADA4CE539FF82291FE8D972CFADE5803EC1A97DCC982723C24B41D3ADEAA47C1E07BE6B60E7CC34961D3C59F37242AE80';
wwv_flow_imp.g_varchar2_table(25) := '81720E2D465A619C4D2A701C03DB1235DFB2E44D70C55508F4B03376715333AF2828055F1F1747DD683A5C2D810279147E0A95C1268862F0FDD5AE12311C7173DC8E178B970FB74C75247C8349A1150D0B6C32289CB6E038C84DE3987119D434A0B6BA43';
wwv_flow_imp.g_varchar2_table(26) := '605DC301696243119B7D10FDBC1F1A88E8F955C0309ED4672F0937742868A0876415B6CA96B156C44235EFEACA40EDB262A19811A1E5217E155A8A068342D687E6597C22E2E9B8523AC57DFD4F38EB62D71813E13BBF2A879C47E1483631CE1E1AAFD164';
wwv_flow_imp.g_varchar2_table(27) := '6C6EB9CCE6692397AAEBE4B37674BC1F65CD94C939A7BFED9416E67CA383F496DA57D8195C9D9D8519C0875557937FD5CD61233FAEF11ABD132A710977D6F26A5F74C21AC5ADB8E84E057ABD958127BAE0F28A87FB57F88EE2163BE4F1EC9C33328BB6BA';
wwv_flow_imp.g_varchar2_table(28) := 'E74B038039DF1C1B8B9773CEC010338BC79C3A205E16D9338B9ACBA240594AD6A901A5036593F2299631C160E349E5A8E45CE76B64E3902874C4000C70B5D268FD64AC061C900160CE7B03EAF4DA14C9CEF4521F50A3D8542E0955A14482F9C67200102C';
wwv_flow_imp.g_varchar2_table(29) := '5F0EF2EC9C47A31A10CB2ED150C8405B2703651C1A83AD23C8FD2BB7983EB6A0C19D71D3B77FF9661AC2BECDB750CA62319B47256F8C4BCEB8F779DF55126CB67857A2DC5905E77C8D94FA9F788C050D7944181FD1401763946804CA6FC697AEA1A30EAB';
wwv_flow_imp.g_varchar2_table(30) := '190DAEAE8C023683F375A6B44E961134F186E4A5FC405D19D5C13E2687D0154E9DAA20655073309499C533503821170CD361E10D41B79084B8408F915BF1825A0737DF1007CED0D562ACDE6A2433F811164BA95441323FE631ACE49F6029D6C9D411CFC5';
wwv_flow_imp.g_varchar2_table(31) := '379D4D455334C0BE494E4AB78566DF8593EA2ABD4DF02DAB0BE79BBA66262793C64A3125BCD29CA3E10030C77EC879D9E29291F6F1E980F54324E12CE82D239D842C33CD440F4D31D8D0452A4CC14E0E7BC1D66C2ACFB7F15996C3DACAC242E18523A106';
wwv_flow_imp.g_varchar2_table(32) := '1A85D2C48E82543A0FCD01137E31ABF34D3BB244178099829DCD25EF1FD4C00A39B663E00C70126782DEB1C9EA8A5658CC0000480159693D19C7AD0E322DC51AA08DB26D63028807858A54411EC5AB201A27AE9A955C0600E66938000C609A7B1600A62B';
wwv_flow_imp.g_varchar2_table(33) := '708CFBE4B1DEFD93CAA8C552D5F9C414516AB773AB569C100090C946B31CD4D0F076097F9318402B3A00E35467CD2B3F62CBBD0400033D49135FB066DF4E668DCFEDA82F0CB12E488721A64FF9081A482E779A6400673B7B1762503AD088B53FD0A087C4';
wwv_flow_imp.g_varchar2_table(34) := '47B3D2225F906620BEB2513E3DBCAAEFC2CB83EAE672CBCB86A401ACA001A0328F2CBF723EF37485433A9443CA7BEA2B321DD4775424BF549EC70D4DCC8BAAB4065DC2AD204AD1162940A56C8DA0234EF610BD2C1BABAF3BF1C8F1374D03B05220A855CD';
wwv_flow_imp.g_varchar2_table(35) := '070FA897D510171900E67CDDB89B8E8052617FCA6591F3755C3BC525630D2D72D6C9CD88FB9518161F290E54EA93E3F2B776FA9A0C996735F60DE89381CA14EA14C5571D322C0774CB66B4E847A224E555D7031F4A27781553EAEC73CA3B3A2F4F234879';
wwv_flow_imp.g_varchar2_table(36) := 'E39431E3696395AF52830C000E26A2D6B84EB80914A8A020150F0DABB4D881644C4389ACE0AD0E4E8EE2A98C603F72D89C270412AA60C07A510030E79A03D7E09D83648B2B7AD545FAB45141F9245E735ACE8B1FF51DE634E8E4D178CD385BCC17E363CC';
wwv_flow_imp.g_varchar2_table(37) := 'B7DD52DE369A6DB8220BA89D7AA96458870CCB79DF2D6F292FA8C415A5B0FCF064A01C2A784AC1F497728A475C06294EE18433755B5FBBB948351903CE7C8320C136A75589A882F22920253A62A00D23D073569BC78EAA2BE0629EBC6D7F57BCBC64E324';
wwv_flow_imp.g_varchar2_table(38) := 'A3A0E12A88285B57D41B0098042B79E4885A6EA4FC9C2731292DDC945E1747E5ED410A71E0EBF2111FCE7B031083DACB8D2EBE0C8AF55609CBA0F2197015A30E0160AEA69416AF8247C1CDF18F058D075CC96702FB167D4A65CE7BCA7992B2319EF3C449';
wwv_flow_imp.g_varchar2_table(39) := 'EDB48D138015DE9AB348C17129E8F0AC71F56BCD021980395FEF80F12AF8E6B420E17983B0F39EA59BDD21F39C1BD61C8C3E6E7CFD504A25E555DBEAC79210FBBB4C3712CE7B731CCC1C9CF75F3455063873DE2B79D50200CB151E802153D2C06541E752';
wwv_flow_imp.g_varchar2_table(40) := '88F29611D82617B0821D48879E6B05BE0E00ACD24A7500981458324CB0199DADE4DCC6B3F0F27EA73AB99105CA624E5D0DE2372130760C83EE382DA18EAEC1D6C944AE3C6D8CAC34C00EAEC0EACE6DA5B80D90B76BD62D505B5CCE7B93975C6463A47362';
wwv_flow_imp.g_varchar2_table(41) := 'D1918023808F5CA998ADDD0007A7E1BD543F0D4CDACB34DBA91169C9B84C719BC571D01A031771C84B2E6F80BC35663919C0BC6529249AE23BD219F000E50BA0053358EA734B6127080D5D6A224ADF6404159C6F76F5F106CEDA15AC4CB99137609537D1';
wwv_flow_imp.g_varchar2_table(42) := '2831CAA70CA069AC758D2EF15A9F1AA071E3F330423CE1EBE622636AD41800E134836F7850549ACE760000100049444154954B881A14A5878622538A369A4D3A006C3CDDA5B0AA6E8BF7FD2B375B917D24188DBD4293CE785AFFE58C10BD4BF991E242B2';
wwv_flow_imp.g_varchar2_table(43) := '603BA3497D0A6FD268E681D5012C4837A88F0C4A37EBC850817ABDD1A4FEC22A9086BE7B316FCCD29AF9B4392C69C272432A61F5A7CA5DCBB805F216363CC1039C01A837D0C801307D062B6FB3906CD95E03D5BCAFF739954727443A293FE732AA294797';
wwv_flow_imp.g_varchar2_table(44) := '0A87C41A54A08771968D1A3BF836BA12E60A3C766CB3692048200B42B9A016A0D6C87316283FE3D3DD8F2E812682006C32A1112C00528282D36BC1F5766018F9910DE567412246CD7D80E8CA6345A944F944B4E5A34D8E6AD73514A2A0F2EB97A4C59F2A';
wwv_flow_imp.g_varchar2_table(45) := '8BAE666EA51500905F67DB5C62ABA9546D74726903586B00A201C0A6BBFA9163AF6C67D098B615C2C172C7A8B1C965C0C321736D15BB60CE391BB7CC02B6B8E2C073F017D9CE089000EA4D1794A406A6B3524B41EA8C8AD459C5EB02001B4F2626636EC3';
wwv_flow_imp.g_varchar2_table(46) := '05FBE8B9616E2BCB61FA98B4737E09D232434AC691353F9E30C2B26C68C291B71C37D07B078D1243A07CF232A51D7955DC0C13F6AF099BF114446F8A673C1DD2E63864CE03806936B13517D0D6277248A35F53D52810DE657D88EF565AB672793F8A46E0';
wwv_flow_imp.g_varchar2_table(47) := '1BCBCE84588E435D975219E0CC799FB231D6C18D12922739B7F69AC2E808E3E98EA9D166B1189DECEC5AD7A034F19DAF33264FC7716EA2F5E68B4CF090507BB1AB42096677F14B788E02565EC1FBB1E987660154C81D29E7BC95BFEF8988A125C6C9C921';
wwv_flow_imp.g_varchar2_table(48) := '1DC42406A084C7C2810FF192A3CA63052E2F3458058D212F531A686F43CA32CA6628E12AC808F48D292D5B954F41B273BE311EA9308B8507ACB629FE1432D4952450D5731C2BA0CAAF20670000A6A5CCDE854BB67BE1269BEA7756B98CDDE1F8EDEE5D8A';
wwv_flow_imp.g_varchar2_table(49) := 'BF959AA1D792405917A8DA9A713F245E037547F1C60620E62764604C014B204E8AC059614A863C95A9C6414F469DCA8B0307581699C3FAD2811E312CBC98F800AA4EF6D5CBCB64CCBB7B176D976F5253EC07787FD1004003987040760D7006063906C906';
wwv_flow_imp.g_varchar2_table(50) := 'D89C17D174540CC579D040E5F93CAD7EE7F994161DFDECA2EFF09A092FC543C7CD71ACD5CF542FC54163C7F148F975B168009BCB68C4B199D001EFD0D14AFF465C6E03FD74E454C477E249BC165CAEA677202E156C127B7A0B7DE7574AB343059A729D26';
wwv_flow_imp.g_varchar2_table(51) := 'D826349CF744AF335FD02A091C74070A5C41C8EAA084AAF4260180392A9D14C553B85D0A651D17001AC1D4762FC8882ED218B45EDD4AA4B185B63ECC79D41C0B5B1ECEF9166809F294EF4E1C975109E87C22CE589DC55981A3ACDA64541A69DCA964D8DD';
wwv_flow_imp.g_varchar2_table(52) := '49B8FAB877639EBE443C8F1A8E405F66D25250AB8EAD474B8290E790A081CD3B24C6543FEF62C1972A79BE2F2D2B4E0620E515BD3EFCAB5506C03C67BEB3E001901C156C79A57E964AB6041B005BD767E73C8DF312970917CD53099CF7B18EE0E279CC99';
wwv_flow_imp.g_varchar2_table(53) := '5BC6EBBCB721178068F04DDC393DEA3AE725FEE30C4F1A3067E77969A6579F539B732E8314943F5F4ED4E22200CE9CAF37DFF765E745B56524612A1805DABE815BA2DE3809F5855E3667580690E7535A537B4AF7C500A8B413D31A7A4F6B66CED89AB977';
wwv_flow_imp.g_varchar2_table(54) := 'B9A6D687E89ADEB18F96CA840FD48D54C7A95D7CAA8E4274569C246030778E3380F102C0D97997ED3AE6EAF72AA45E7E5573CEF91AFDC0357DC150037664221E97411DC5372418A07AB8FA9004AEAF8B96A5615376433A0CD296E777DE1B802155567000';
wwv_flow_imp.g_varchar2_table(55) := '986FFC9CB9F13A3E3EE2B3FB2E3856810100DBAEF7B1BBD6D99568069C70030DE76B44CF9F9345F300CC79BF228C21DF0E0B520A4EBBC68BE234C78165F286BF01B4F6A5796A63BC46DCB330BA26F7783C596937D071E5EF16728440C52FF82E2270DC00';
wwv_flow_imp.g_varchar2_table(56) := '8ED835182F0071AF73E1E24D36E1218E0C82CA67D7CC002420476B44633A4C6B33957705CA93B32EE75322B05FA68ED8ADE00260DE8FCD0C965FC5C2D8130C700686943FEFD85181DB9660279C058A96D92A70C0D2B83A8D39FB79DE3CA7F600C4E59096';
wwv_flow_imp.g_varchar2_table(57) := '849E0ED8A5826B110330076FF9A5C16E13628E238116F426250C866BA80C250F67F7F4F4EC8E0AD64751E500FA50AE6A19C89F94A7D988BE1B2123D0F8E4653A71D1F9BB60CED7C75BB06B19AEB9018C78969B0B2050B10B4E97396C254D8F923E06ADC1';
wwv_flow_imp.g_varchar2_table(58) := '9042ACE06C0808A249EF25E3537AC3EA6786AEBE4C78CEDD47D0392A519F01F4553E833200A6771EAB8E2798BE7D75727464DAA349963208BD794ECD7A9E98A5F4F5105F530390003C8FE7CC2A6F26E5D3B19A62EBB8245CAE8162A93B23EFAFF5EBD1E1';
wwv_flow_imp.g_varchar2_table(59) := '7EFCD1D593E3CD7E0E3D3272868F116532E211654E12547AC94A6F9FC7D3A90195CC72BCF34A4B91C72D7B018DCBD1D17EFC6EF2E1C115C657C852B95C358381B3875D47D735370047818C38EDE7329182F719C009CF7113BE6BD44DF04D624DCF52FE38';
wwv_flow_imp.g_varchar2_table(60) := '55C7CFCA7000F72FDB31D7B49BD0392B5C00719DBAB37B9167F817E259FE2EDF56EFF06DFB94B383940FC05935B7151D0016CFD73B96345AF32BE4C4479CED35DE39EC5AA7DDB56640ED4B904035A0B3C5971F54D60C5A67CEA9A4093EA6B74CE96D6219';
wwv_flow_imp.g_varchar2_table(61) := '9AA669BD15ACEA079B7319A6FF09A01F5AADE0E79792A28C27131B4FA636621FA5F48201959CCE8F9BF696C48FDE29E8C37F46EF6E3D1738534FA63B3D18EB8B34561AFF632EB18E8F0E4DE326E715B8745D5FBB1DE3AA1980982D787A316750BABDF912';
wwv_flow_imp.g_varchar2_table(62) := 'EA39BD8F6A67CBE55A526BC81283132BD7E8732925972909A665C23653AA1F8FEC9E8F7CA83DF0533E9EF1430CBE29864AC9E6F3D3FD847BE2F57A8BA30C1EF5307BE0A77EBCDDE3110F31E7FD562C3A8EDD0ECFD7353329DD4604008F1E77ACABBCAD4E';
wwv_flow_imp.g_varchar2_table(63) := '1B4CCAAF65D5D1E195B854555AFFC1E7E8E8203AAC757AD646D3B5014F0B93E26A4971B07F8B29282D58275D0A6834991850B15348D90FF6AD9C0DE67173A59FFB9011880E007AC789921B85BD0FB89D7DF27FFA1A7BDC977C813DE4333EC93EFA4BBFC8';
wwv_flow_imp.g_varchar2_table(64) := '3EFB3BBFC52E7ED007463A32A8DC53C9BB28C4C25BC9E3C2077E0065F0B5F6B87FF3F9F6904F970CBED03EF95BBEC6766F7FD3563D74CE712CA6A6D9406F98A75AAA4DF708DB619872197731C640E5586C8B4B8A5EF07D43BD6A8833C12175251485D5CB';
wwv_flow_imp.g_varchar2_table(65) := 'D6E72A8D5B8F3B08435678C8F5B3A62729BD98525A3FDF270B567993108038CD374F3F66B3E36840FB97DF47033888270B655DD0A3EC9ADFE244E1515FF84FEDA6BBDCA924B378DEFE1FDCD91EFF6FFF55CC4D27BB36E2E6CED1B3095050E0275C92B5F1';
wwv_flow_imp.g_varchar2_table(66) := 'ADF21B313CFA8B3E8732B8638DF5DB51068FFAFCCFA28C0BAE0615D2C6B586D6990160CE7BD3726DC265DB6467878ABFC770C1B4F60760A7B90AAE240A3AC59C861CA6F7E30852990C64D37172B1F6193E4A8F5D7E3D30271B78BC292B9DB32381CB99BC';
wwv_flow_imp.g_varchar2_table(67) := '2CA5C763AD797798ED16963CB4A6DB31850C74E391C8CAED2713BBEB877FC80A5C800F7ED087D9CEA54BA64DB573CE74E222B8C27CCB6590FA292770C23DCB8C1B77E545EF344134E4488E0E0F4C03BE29DDC9DEAEDDE543EFDFCAC25D1FFC61362B4EEC';
wwv_flow_imp.g_varchar2_table(68) := '88DE544E4BEDA8BD56E47306B67D4E6C4C1DD8BD70D1FCC208A47B05F56B13D6CED40024AC9393B6CF84948A5A14B328DC2E2601D8941BA5E9EE1EBDC928F603404C8F792CA853107D61451D074A9AB6C135DEE1F12195BBAD0A00DBBB8906C072000BAF';
wwv_flow_imp.g_varchar2_table(69) := 'E522EA9C9EA7E04C10331B3CD44FCD86873A0EDCBFD2DBF7A164031D8914FF98EBDE631A81686B4338B4FE7877C78076D9C9F0DDD89B0CF6887BAD44BB38C52673285FEBF0648C390E00F39C7100D898C7C216AF72391493031FE5080F445E8716282885';
wwv_flow_imp.g_varchar2_table(70) := '1C4FCABA77F192258F5AD0080E0E2EC7A936C74B6979F8C9646A172EDE64976E7707BB78D307C4B43EB9285A9EC79E40FB00261ADBC6CE8D96CAE1B9BC525B911667AC13BE1B88E90D1E875422190FD714BC0B2AD6915DE172EECAE59B4D9E7B03524B54';
wwv_flow_imp.g_varchar2_table(71) := '29427EBC18287319C33E979D67ADA8058D5EB4B58F537AC9C4392702E55F506FEACD623956CEF9E824552EB92A283D24B821484371E69C7E023D54C2079C4DF4C1232A934E0AC4A8CA82068DDE2BB063CA5F2FC1D1FB275E0098F602293FE77E64537E35';
wwv_flow_imp.g_varchar2_table(72) := '03A4FA795C7046996FB924D2349FD34A691D0D6BD9B2298FA97E1E6BDCE40012ACE0B81E72BCCEDAC012FD75716CB7B125016046FD325E1A37CFD980C9E868E42486CAE1CC0C400D16B452C56244411B2231A7B4F33E1A83191937A3073C8E273C4C9EFA';
wwv_flow_imp.g_varchar2_table(73) := '0615F7A6BBDC31AE6D3FF8A11F6E5DE1AE0F6C5FFF2706EEFAC007D4EADEEB110FB57B3DF26131DC93E9BB3EF8436BE55DED087E37AEA7EFC5A3D67B2DEA37E37B3CFCC18369899EC2DD1EF2E176F7873D30F293E8DDE7318FB07B3FEAE11176B7877C98';
wwv_flow_imp.g_varchar2_table(74) := '2908B72BDCE5C3FE61EA6E6B7C8F873EC8EEF7918FB2FB3DF6D176DF473F22D2555BF778E803EDAE0F7E4094F14D77B9A301E538B612396B209D6AAE57893C50F1E09C4F60AE2EE6348486C52C4BEB0927C20A75F0E6395969D33B694399531A71F9321E';
wwv_flow_imp.g_varchar2_table(75) := '9747976AF3A4F19B4239EEBAB4CEB1EFFD988FB0277CE593ED739EFE34FBB4A7FD7BFBB8AFF9527BFC539FD4193EF2499FDB4BF631FFF29FD5EA3EE1CBFFB57DD2D77FC532FCA3AFFCE25A795F5B4FF88A7ADD9C8ED21FFFD5FFD644BF8F46B3EC095FFE';
wwv_flow_imp.g_varchar2_table(76) := '24FBC4AFFFF2253FA2F3095FF314FBC4AF2B619FF8754FB58FFD8A27F7F2F8189E00F509E1639FF264FBB8AFFA9248E7895FFB94655B6AF7E3FEDD9744194BD6FFEC7BBFDD1E4FF9DCEB310FB7E63877D1D798CF39FB698932E7ACD285B7291C8039AE32';
wwv_flow_imp.g_varchar2_table(77) := '80D29FC71980AB0C1B70B923EEF8B5999AF1A462007E274A608305D78C398273254309264F5D0AABB4DC398531DF501000ECFE4F78ACFD93FFFACDF6D827FF0BBBDB833ED4B4B94D6DDC169F8F0446D3A97D30679C8F7AF2E7D9A77FC737C531318E4D5F';
wwv_flow_imp.g_varchar2_table(78) := 'EB527CFD2AC5C1955B4C8703DA6CCB28FAEAF495955A54623807368F98099C31AA4F0B4750E7C3E9D4E6989EF890271547073A6B2F7F6CB6B346474153F93BD0CC732904329BCAE73C634FE975F105BEC079E2373CC5745EBDB7E54B9B756DDC56BEB904';
wwv_flow_imp.g_varchar2_table(79) := 'F66E7FBB38269FF0EF9F6A7B77B87D2B01AD104E8E0E2DD0510AA1A0B33CA2F33D393EB2B0C55E10A0B22B88180340679BE5E774AE04AFBD59ABC41113C7C707F11FAFC9524BE8F0A7A69D15EC96659873DEF24F700EF5021F708FBBD927FD877F6777BC';
wwv_flow_imp.g_varchar2_table(80) := 'DFBD579AB90D707D48E08EF7BD97FD638ED107DCFD6E3586A45B333ABA7963B60FF4D43A6ED54BD2D063045D45008D60D112809A5ECD4F56DF4559CBE59AB06899DCF1F731D4ACA37CDB9413D84195E50180F9D1D8AA2BC44D4B955F4DDDEEAE778E6BCF';
wwv_flow_imp.g_varchar2_table(81) := '9D4B17570B6F83985D4732D8B9E9927DDCD77EA9E9CD72C516C7387AE4168F4824E99C6608265BEF60E55F6B610684ABD45934B3A2CEE4A2064C9B085B5C0599DDE4E54A596DB573A1C3749DAF76ECAADBF73D60BDB8D166707A614FA8B7851B40021AAB';
wwv_flow_imp.g_varchar2_table(82) := 'C773C33EE28B47B15B14C1F443544A77860E5D89F87D6511A1ED41A319502F1A80A3E5E82D6BEE994FB82F987163DCA5C4CD268BC6F4A6F22E2B74AE6E007D67E20FFBA79F6A97EEF44122B7361CED1FD8BBDFF60EFBBBB7BCAD35BCFBEDEFE8A5F19E77';
wwv_flow_imp.g_varchar2_table(83) := 'FC4D6BBD2E7A37225C7DEC138264D4D52F95C5DF3FED23B028D3983DECB33F35E60257026DFA110B178F399DEE5D67B7D3000010004944415422B9125195F571E0157813E07C5DAFD6B5A9FA4B030010BF352FA042A0F5CCB86EE30E45D9B5C179BF8A43';
wwv_flow_imp.g_varchar2_table(84) := '1AAB4033A05ABB19AF4001B5B573D33FB893DDEF718F2246F73DA7E1BDFAD79F67CFF8F26FB0A77DF617D9F77CF157DAD3BFE4AB5AC3B3BEEE3F751362C90F7FE3B7B5D6EBA27723C2D54776B5F3968CBAFAF53D4FFE4A7BDA677D5194F5AB7EEDB72C2C';
wwv_flow_imp.g_varchar2_table(85) := '36B45DC4EEFF318FB6DBDFED1F2CFEBD517D85B0E204FB0C803348571B39BCAE55B299F5073AD100006700CCF39C3E5F0ACDF8F6B358D349EBB9E61D751D671CB0CD5435D050DAF6101FFE49FFC8F2755DC24FF1CDEF7E8F3DEB6BFFA3FD9FFFF799F68E';
wwv_flow_imp.g_varchar2_table(86) := '37FE5502DF165F450968AC24EB5FFADE1FB41FA4EC6F79CFDF77B6A6B17BC0133F66610075347D092AD73579EBD3E85A9D7A9913AF65AAFBE9F22229A5CF3CB908E89426C7E94AC3D05254B7FA1C414690F26AA7D9F9D1741ABFAC92709AF1E1957DFB91';
wwv_flow_imp.g_varchar2_table(87) := '6FFA367BEB9FBFA159745BFE9C24F0963F7BBD694639DCDFEF6CF19E8F7888B9F1A856EE9CE771F8A8B6E29003D452B8863820D387D2E580F33A2ECF00B0D22A2B659ECD4E6CC8E55C8D54ACD237457ABEB98B487A700668E2DEE501F7353FCE4F8B8458';
wwv_flow_imp.g_varchar2_table(88) := '85E7FEC84FC6F57A05599F92A1F561052DC5FA106E0D6594755F37D2AF6DF4E1E4657FF796B7DAF37EF4A773502D3D9A4EEC2E0FB85F0D265D01605A71000BBD215F5ACE06C6B6E5A519A7567500ADD87AE0C08705B2E70C80EC4555E00B8BD633FE5A4B';
wwv_flow_imp.g_varchar2_table(89) := '66402465F99568E6B0942EDF08A71CD76B5C2EE5F81F78EF7B54858DD4E5F7BECF7EEF379FDF80AECFEEBFEF66BBC2D0867970F98ADDF2EEBF6F2BBA55C16EE692457D6DEB949633FB37DFDC56D40BFBDDDFF8ED4EB9AAE29DEE7F1F45CB20450560A0CE';
wwv_flow_imp.g_varchar2_table(90) := 'C80852C19CFB80827A90F27DB174A5892B7A7D75DACAA2D68A18553096CB333B57DFD0F61D53C64A7CA8538C56EE3937A92B40021C670C97B5A329B0E48385BC2FDDF98E7CB6DF6FF8FD3FB42146D9AC2DFACFFFC99F698263FE777EEA67F93E62FDA629';
wwv_flow_imp.g_varchar2_table(91) := '22DFC00FADB55FF89C9F6FED8164D05AB006A8C3128D49175AFD9D809974058039EAC028BE1382E92A6800CD9580E0DB06D15B57B734006165CBF5922901CB301FF08D2875AAC4AE3F0367973AA4CCC95A25803267E54669310B09A6B364C56DE15D6F7D';
wwv_flow_imp.g_varchar2_table(92) := '7B1B7810EC95BFFC1BF67FB8817BEFDFBE2BE2BFF7EFDE65BFFC8C67DBCB7EE15762FEFDE1F1929FFB25FB95FFF943A6BEABBF7FFFCEBFB55F78FA0FD8AB7EF5B9CA6E15DEFDF6BFE9ACB773317B8129C54754BB88AF1920D783D3EC034A338A64073F22';
wwv_flow_imp.g_varchar2_table(93) := '2752D278D6BAA8D63480C065D03ACB04DA9BEFAA07C090CF009CFA426600A07758B0B312CD67F315D8268057F308EFBBFEE597D9B77CDABFB0EFFAA22FB357FECA6F6E52FD5681FB0A3A02F55D32F8EE7FF554FB3D2E634ED3B1D9D1716775E7A39AC572';
wwv_flow_imp.g_varchar2_table(94) := 'F029E7C728DE4ABB4C0FDABEFA1811073CDA7426D7A93612256752BC50153BEF0DF04B40C1F239A7A725E00C1200CCD5943C7009B28962DBA9AFF906FF90E3D48D5DA704CE5F06300EFD521A002C3FEC28A8674DA50560432EA08E273A5D0E38D18B0610';
wwv_flow_imp.g_varchar2_table(95) := '112DB300968E27D9090C0DA0D02CC09845AD37006BB3C056E4055006006091E33288B3C032735BE2FD4602D283BCB34D670B50471472A48EB4F395E38E7ADDA3B322110D4089E6F197F7320036AC42863937B3A1633DCFE2CE5B86D35508B0F9AC63C56D';
wwv_flow_imp.g_varchar2_table(96) := '06D025AA5B35DCB94A69D5D1700A3DC83F691CE8D4D7E91435504DCAFBD63F3EEABC339F9DD5C7A969E02BE99262F90C3D753463C05022F239E7F4C7E8B6FBFD4C02AEB614B6AD4EF892C89CF7296946EF1FACFF642F33803A22E89D9D5F16935658FF89';
wwv_flow_imp.g_varchar2_table(97) := 'BEAAE965AAE89935002ABFC2023B9CC2F217246E8BAE7309C4E18E8F3AA3E50BD812D6A7332546F7D3B5CC268186D05563A9E1059738391200733EB326DBD232D9781703000CA45BDDF57D4805BF2D5593C00D9D81014BB55BF6A4B674A1235CB7743198';
wwv_flow_imp.g_varchar2_table(98) := '017C58FD428376E85981A8E69293404F1DA8AC02A6E0DDC880250AA7A6933813A4F221B1680676A813B7D18979C310DBEA3DFA533FC1BEF47FFC97DBC275248347714CDAC6AA090360009A6073BE72B6816BF75E9D616D18FF5AE810CCD2EA162D2A6D05';
wwv_flow_imp.g_varchar2_table(99) := '68A42AED6641B351E7BD699DCEA2780719499F3247ACFA23D0A814EAD02AD79CB2AA92EED4EDEF7447BBFB87FEC3DBC27524038D49F78865256857DC9A1E5067D62D83D058EAA41648DD00A42C755F26D0BDB2A81940F3D37300ACC6987119B4D546B59B';
wwv_flow_imp.g_varchar2_table(100) := '0192ACDD4D23AC15DE96B9E125902F75F2CE207EFEAC545C39CC82C7EEA95C796A72CAC618287163267F089C97D198F2E266BA6600216B34218E46A3948CF190CF0545C4810FCF5926470D9C65F2FC6DE95B990472E5CCBA06C05C761AA4177405571B81';
wwv_flow_imp.g_varchar2_table(101) := '0A1CAEA24ED40C400D5AE342C6948A6499814C295D0F30FDD561CA710A6AC557D96A086B362DAB356E83DC1A240038CB0D408732491F739D487D6DD74133E9A0820DBC6A06106871CD7AE5BB0054602A731B1E006B1A8B2A69F1D3C5ACCAE1BCA26558B7';
wwv_flow_imp.g_varchar2_table(102) := 'F65B22DE96B855490080395FE942A0D79F2FBE93DEA613A165B562BA6006F061E515A4AF0C656EF559370036DA4401603E7B21168853B4180A00CB2DD8D2450BE09D722BB163BD1CD8665C79F96DE95BA7040098A79E0195F21E1F97FF07AC4D27F2F706';
wwv_flow_imp.g_varchar2_table(103) := '965D30FE65AB96D0A3FCAA56330001DA823EB29AE0A2D76500401B39AABF2A25028D1819B32A0A34B0D0832F9C37BEFCD5F63BCFF8A15A78F10FFEB8BDFC479E13C30B7FE0476B652FFAC11F8BF054AEF825CFFAF11A8E607DE125CFFEC91AFE8B59BF0D';
wwv_flow_imp.g_varchar2_table(104) := 'FF653FFC1C537B89BF17FCCF1FB697FED04FADB4AFBA2F79F64FD468BEE899AB7C0A2F85177CFF8FD4F0954F655DF14BC8F70BBEFF8757EA75F1D4452787ABAEFAA53E4A8E2A7BF3EFFEA186E6544106D054ECE3A383960F49C2F453F9AD8DD180002C8B';
wwv_flow_imp.g_varchar2_table(105) := 'A44B7DEAD4A6B1CBCA2921C6CC1251ADE9DB7F7DB754E68467CB4B4C2C338D04207C85B240B80A65AEFDF9777FF966FBF317BEB416DEF8D257D95FBEEC776378C38B5F592B7BFD8B5E11E1A95CF1EB5FF2AA25CE5FBCF8E52BE5C2A98597BE7A89AFB6FF';
wwv_flow_imp.g_varchar2_table(106) := 'E2455D755E6DAF7FE1CB97B8AF7FF12B48FBD50C256F759ABFBBC413CD12B7056FD1AFD7B34DE1A5A07C8DDE022F87BDE915BF6F6F7AC56BEC0D94CF1BD8E737BDF235F6D7AFFA43FBAB97FF5E3B4F2D34727A314D598857F1219A82BDE7CD6F6D1FAC0D';
wwv_flow_imp.g_varchar2_table(107) := 'A0D29FC97487352A7D6066E5168ECF964B4D04D41C7130A3536DE2A4FC20031063CEFB54C7F4C1B936258D6CC7C7127550C2F98A36B9B536DAEB0889C78493A7052B5AD68B45F651E8AEA339D54D219F05050BF3FA4747048B81EE862E2226F550BDFA80';
wwv_flow_imp.g_varchar2_table(108) := '08BA08D1F8176946C55647CCACD8730388DE72EFC225DBBB78C9A2F2F0640FD862A0523BAAABC07CF3E89CA053DDA3D138FE8F64A08DBFB22F9DDE9F2D03B0A6CCFB5EAE0E330012CDD7F752A84D941468EB8C2DAF7C1F20BAA14561CD96E86B13BE6650';
wwv_flow_imp.g_varchar2_table(109) := '3429292543AAA836D487946F4EBB09DE8C3D0727C1B431139D944FB1943FC101986803EDFD07DAE1769D5F006CA90F995CED8C2E29F878B2436A957CB40AD9D9DDB3E974B76A9B186DB777DEE0AABA7D8E650303F0CBB6A43C6D4A2A4F5735BB40070CC0';
wwv_flow_imp.g_varchar2_table(110) := '22D31E4949520927AC8D6700C019F89768380A20A515074E81E2596985623EE7BAB2F2E0237A44C1D7050D42C269D25CC2798C2BFACA837CE57504CB83732ECF6E9C16FD8D2B9D5105B79071607F4572D6F38DB0E38303A194618D2E08090067AA690CD2';
wwv_flow_imp.g_varchar2_table(111) := '8D09957EBA7B21CE64CDD95DF8CD201CEF464B70DF2CE596583D0900E6E9550158BAF445E8944E71595CE124F8BA58B49738F428056780C078095B937054246416EFBC37C02F6B059E5ACD4E66D1B044F7241EAF950630A257979097C83D09E15AD9490B';
wwv_flow_imp.g_varchar2_table(112) := '1CF8A4E87995726628697B3F36F1969737D340C627FB5C90D7264E575E03DD557635E1004C32039C15616E817CBFED8F5FC7A571FB37FADEFC7BD506D9BB412A6720EDE9CE5EFCFF70FAAFA0351DB1F5D76832592205EA53D121D761DC9094F3DE40A698';
wwv_flow_imp.g_varchar2_table(113) := '8CF769BEBB1909640FD15548A09259CD0509D21F4BC980BAE18D1BBF29345F7CB1BFA0F79FCF8E1704615AD600F5BAD67149E13C8FEACAE210075C835FE6CB6791ED2D460D1E4A8CFA1399E1D64BAEEF9C77CE24776ABF052AD79577BDC75EFD933F1FD3';
wwv_flow_imp.g_varchar2_table(114) := '39E76F78F9ABEC75CF7FF11254C96F09BA2A09392B97CD021AF7B686061B801414EC742212A255B55B7CC2512CD5525DA5BB02805298565E126853B1CA92F6279C67815A62B4B8A5D866156C3E3B31FD16FDE1C1BE151C30E3E5B9F4198D270654780477';
wwv_flow_imp.g_varchar2_table(115) := 'DE00CC2F0DC0E2F723029757965D27FA3DD5988789BEADB9F20D78A02755DFD754591647055CE6CE3701EA827EDB29F2BC90814EDF7EE55BBFDBFEE8979E6B7FFAEBCFB7DFFE9E67DAF39FFE83DA8445E60067AA1733E7F0C81DD09C0EB0AD495703A25B';
wwv_flow_imp.g_varchar2_table(116) := '11007040F535495B5EB3E39365BA3B0103D05DCC1200960B46BBF6C025068BD6DEA0503D9731006AB8CE7BCB05A0C219973E45315332F66577EFA26DA244004C9E456D8A48FCBC0A6714A515A4FC814B02A5F5456F004AF686DCA0A82926855AA94040A0';
wwv_flow_imp.g_varchar2_table(117) := 'D106ABCF8AC07AFAAC7AD56EC942FCE66BEC9BDFF14EFBE35F7EAEFDC1CFFF9ABDF50F5F5BEB8FF3DE80F3E359FCB1C1D8FF196766F11A33D9A36600CEF9AC683539A6B7CCA1335A554EB43E3C252600C3BA691EB07ADBA2A4606B2F474FE45DAD1BB18E';
wwv_flow_imp.g_varchar2_table(118) := 'E0E3F194FDAF97018E9BAB5DDBE1A60A40C4DDE4E1BC37D12EEB0493D22B2D39CC4E8E948C210A3FA6FA1FCE5732178D82336B5B8D288DF8A84ADD9AF1AA30AF4E4AC60BC0828C93B357B395C099216779A84C9A74B6CD837AE7938CC84BD1225B971377';
wwv_flow_imp.g_varchar2_table(119) := 'AE96CD8B625AE5DAFCC40C1F05BDDF3C3BBB0EF4DAA1E1A58C0202FAE90230D136DB5C21A3F7EFE0DB7389B3B3579E1EE8586D67E782ED5EB84803D859B4671B5F004C53BF2D2ECD2AFAFD542DABE6944709C660FAE020210D92710EE851269612A3BA9D';
wwv_flow_imp.g_varchar2_table(120) := 'AF8CA7829E5F0A8079CEBE813C5BCB156D62690130E7CF975FC099F3DE7415D44DE9ABD279A869A67325728ED04C8FB35940163E8BFFE4AC3CF508FA0272EC7555CBC11BB05EB16558A0325435D7A700D86432ED440410972CF2F63B3C431E4FA7E6B986';
wwv_flow_imp.g_varchar2_table(121) := '07D6F3D349940513CE2C8C167788FFF150FFF02D2C3CCC7832313F4096220038F38B4152BEA03285860C05172C07CB6880D3F543744F1BC47BA0D3137F392DE5CBE5606901CE7B03FB9AE35CED3400CA96CB76C6721E733A6BF165D9E5B2B439EFF36C6B';
wwv_flow_imp.g_varchar2_table(122) := 'DAD3ABE68622EF37E3C64F848B96B7A37EB49EA61A72CE99735EC9C16132D935B0DEE00A6784E8BC376D9E1339F57DCEE5A0F29E1E51B3CD50BE00D4FAAD7F2514385D5BE30A51FB4B655291E73828BED6416356CE00156F89A740AF9BD28EE3042065CF';
wwv_flow_imp.g_varchar2_table(123) := '2D76DE995BB41BF76C743079E34B030019740C79615BDA51493D073995696074BA72C20DA62C2CC1532CCF9ED27D3180DAEFC5F7E1AACCF38C7D34A6752B730DC2846F2A3D6793AA6944A3D04CE3BDAFC06B5200CC539993770C9C458AE552CA9657E0C0';
wwv_flow_imp.g_varchar2_table(124) := '49D60930AAB59DA0D720EED0E940232EC873E2487A03742027A496F8B4A0B2DD723C0AC9969BE19CE6D2003C152A2FE84A03B0F164EBEF6F7B000010004944415452F35A81DEE9E8E00ACFC5CB13965457FF0564C4C14DF975B1BC6A52843E5C47439DEC';
wwv_flow_imp.g_varchar2_table(125) := 'EC98F3BE0FADB5EC7677BD8B7DE2377DC556E17677BDF392A6947687A7487B176F673B7B97ECC2A5DB5979AAD4CDD3C77FFD97B5B6FBC9FFF1ABED33BEFD9BED33BFFD3FC4A07CCEE3DD3FE2C13CBAAD8E9CE554FC0606F0C8CFFBCCD676F336DAD20FFD';
wwv_flow_imp.g_varchar2_table(126) := 'AC4F5EF6B72F21DF4F15A8A1047AFF820A1781D419E7BD01E76F00004CBA12F9E0E3F070DFE699837184C5DB93C19818F090F035CDF7A18E2753AECF77FA5056CA00B0CE7405DE04C8F38FB259A859DE971FEF4CEC83EE73CFADC2685AE74D8628B98D39';
wwv_flow_imp.g_varchar2_table(127) := '1329DDD7AECA3EE8DEF7686DF78EF7BD97DDF9FEF7B13BFFC3FBC67027A6731E776EBA689ABE4543417DD78CADF49020A3CFE90D4DDF74973B0D216F81DE5E6BEC1CB9DC17947B43E7BCF90D0C36A7D3960EB436CD2E8ADBCA9B30C9CBB9D1021CE2FB20';
wwv_flow_imp.g_varchar2_table(128) := '2DDBB97531272800F31B1880F11A4F26361A4F986ADEA0C5ED9A3EBFE1E8A99BA5EBF27A853D1AB5D1AD6A02AECABC1FA40A4EDBC99BCAFB8F2977E0FCBD6997A803BDBD94292FCF0D764C67059C9E5F29FC090F5D0EF66FB1832B0A976DE87FAD9C44E7';
wwv_flow_imp.g_varchar2_table(129) := '55F230E74BD143AE58E6DC145393502AEB86160AC0A63B7BB1AE67DDD178CA25C025BB78D3ED6D3ADDB56D945F0274CE9B8E2EB5C4507E9B1005C53DC9013BB94F41698F228B2FD294BC0DD16B58471B63352FC3DFE5FB0BE7BDB2D74580F18FBA50C459';
wwv_flow_imp.g_varchar2_table(130) := 'A06449DE39FD9F69E746A6A53080B270CBA7C6F470FFB245C55D3884390F1E8E8EF6ED80F082CB1AE17491F73442398E541E16FCBAF1A4F4E4C0E60C3A7A787D5069EFE24D54FE0B36E25200D89C4E622AC580682824C866B14EA60EF7AF988E6865ED1A';
wwv_flow_imp.g_varchar2_table(131) := '0C790DC14E7862B519B56B8F2D718CE8F5E5189CBF7E945F920160004C9E59F952F9F5E9CF109DA0F403808A4E156674681AD736222A3B3A3CE0524CBB91360C8BBC8C390B6806CD31DCB64B959CC8D5496F4755423AA6309A6B5251D394777274A8E40D';
wwv_flow_imp.g_varchar2_table(132) := '15469C5D35DB6AA63D5FC6BB152AF1013A41F12547A3658FE42B63006013AE10FC06872089663396518966135EE611A3D9EC78698411D0F2705C5DC4D509572C9E3302E0CCF16A41BD31411A80A3F861B7EAC4C4FB3167A74BECA88F9DD2E62C266EA087';
wwv_flow_imp.g_varchar2_table(133) := 'E3C0392A1A8073E53A2C369B7D8D02B0D2B37ADBBF72B3E98BEC00B88CBD188FB581D3F3ACE54DDBF2D55391B5FA706E1459D44C3FEB99E10198562917B862D137E49C77E662CD5BC943C2CF0525014DF906D8D30B4D76760D38FD60DC68A292122B6CC3';
wwv_flow_imp.g_varchar2_table(134) := 'B75E6CCAA9ACAB1BE52C6F4F85D489CB0EF7298AD7D51B5AAE316DEB83A71777740C531E897370492E988C4033063383EE5B8D0168A0665C2756BD06AD7D42CFEF281BA629ACD16852159F3235A3A739E46CA3B0A9D04FD9F446D5035F4685C5866FA38A';
wwv_flow_imp.g_varchar2_table(135) := '440E56D89C1BCDC09980D9DE5B0A2FC59F52F9A598BDC81B14AAEDA2E5F0028079EFE3D86A5D9F5E0C6A993BE3298F0DBCDC40BC33412B3B23A1CE28D8326C62AD5D4C886E738DE89C8F0600205603C0532BCE0256E62370CB878C4D270F27F1776B0EE3';
wwv_flow_imp.g_varchar2_table(136) := 'B9B2A6FF939A016E49FC8CAB49BE8146B02D59F5553486D477DE2F1DCE10FC213881C6DBD63EE04C8A2F1A8EB3808FCE4D631BE2E147D16234C26D06D7045CAD7CA01739E119EE218F26A53C65B8128FB5E44D55BE6DDB814292E5E7F53D973D124C0E03';
wwv_flow_imp.g_varchar2_table(137) := '0535E2694A0EDB34ADC1383A2A4F39525D47630B3C0B3F8A6F19EB6FC313CE46F11922CB839F869CFA2BF99E86C669EA06EA4DD1A2CCCE7B731CCF44DB8F949701587C6B2EBE53595FECFA0ACFAAACE019AD960A5141383D057AA432CC4DA70787873CB2';
wwv_flow_imp.g_varchar2_table(138) := 'E492429DDDA6CD39E9E7E7D0A2A1295971339CD600C4AFBC62A2EBA8FC3B7BE5864F7D3AE209D450E1271A5733CE79DDAE9D601ABFEDEA9EBE9664AAD0A404CA3D87691C8CB3BC60D2A3A13C5F750398F36D9B5E48E55F16119300A7B08505AB8347F29E';
wwv_flow_imp.g_varchar2_table(139) := '7CC1A1B24D42D9597A5D7A8ABC9E66803C9FD240E925527E93586DA93FB678EDA93EC4352FBDD1783235B04F3210CD74C2DD84F6D5C26D3A866DDA519FB6A9771675E6746E6D74BCABAB2E0073284F838CD7509EEB5458F12C6F29815E551734829CAE36';
wwv_flow_imp.g_varchar2_table(140) := 'A3FAE0983C675AC7052E63748A131A8A9CD76B4B0BBFE971414504B657F4B676228CBCE56D792EB3BC2F45E8BC37E77C449B712F90E345E0357AC8B99CB6E96BD997A6EEA4BE688C533AC5DEBB94B479CB47F3978559A2AA9101CF2AA9DDF88C2F28727A';
wwv_flow_imp.g_varchar2_table(141) := 'CE799B4C77AC549E91C973DAE292D5CE1BC6B228EA8CA20134BC041ADE21AF7C78CB65FBB3E7BFC4FEF4B75E10C36B9FF742FB8B17BC34FE9CA17ED2B02F1CDC7C0B9D7FF572C8F3D8CFAC343400ECD3D874155CB3B60DDC1B5EF4CA9576FEE2052FB3D7';
wwv_flow_imp.g_varchar2_table(142) := '3DEF459197C4538A5FF7DB2F226F2FB3F7BEED1D22BB7578D3EFFEC1927EA2D9D74F9549466FF9833F896DAA3F31710D1E5D3358DB1827672A364398F7BE19168EC255330029E6C951F51D5935A6A035B8F3A5A7547EA2A583ABF29A315457658342C32B';
wwv_flow_imp.g_varchar2_table(143) := 'AB8E77DDDDBAF2AEF7D8AB7EFC67ED25CFFE097BF1B37E2CFE90EDCBFFD7FFB657FDC4CFAD0D97DFF56E2B3853A90DC099F3DE80D200041B4F4A0350FA981B7EC579F8DDE7FCE24A1B2FFDE19FB217FEE08F465EC49378134CBCBDF099FFCB5EF6A3CFB1';
wwv_flow_imp.g_varchar2_table(144) := '77FED91B72321BA7FFE8579F1BE98BE6CB7EE4A7577868EBFB2B7EEC67ECB57412A9B179C3C924781E3B6E441FF4699F609FF29FBFCE3EFD3BBED93EF249FFDC766F77538EB2363D142113FBB28AF3F5711FC4B3944D539C82D24B6AA74CCCE9C99B9E43';
wwv_flow_imp.g_varchar2_table(145) := '56EB791E0F544AA366A69C11142B14C5CC36D9B885B81EAFBCB268AC0BCE5371974612866FF2D40C0D4EF4D505A0DE0F474306BC8A4973669269CC743C547E1C4F944A04CD8C299490B0F6F57E8937FC093803EA7CB7D5764BF994A581071765AAFDE9B8';
wwv_flow_imp.g_varchar2_table(146) := '1C7CFC539F640FFE279F60B7BFEB5DECE207DDC1EEF3D847DA277CE397DBF4E285F64AA7803ACABA59BD84557D0B9C899B38CDBC3BB87279F1D1D25B62ACD31A296F1371D3BCDE228685B74C7541E17B2A5FCAA7D8537869FA0A54B0994E8A18A7F2B38E';
wwv_flow_imp.g_varchar2_table(147) := '0118802559B5B7CCF424028D4DFC9528200D5726B3A7F7154C4BBAAC6825A9BD42A227E79096833AC10265A50AA2B14EF98477D6C1350DA03196797B7E3CB2C73FF55FD95D1FF8801C1CD31769080FF8F88F8EE96D1E6DCD4A565DB49CF7CBA2F429DA25';
wwv_flow_imp.g_varchar2_table(148) := 'A025E1E67CD357D05214A4F8277CB9B37FF996F84A390D4E4BBD5E90EA05AEC19A485274004DB08183AD414F0533EE1BC44FCA5F8DD8F94A50C580E97D280F9E335CC29DF59C6A4946331A7AC2D5D210286503C04693492AB21C6F09DC3201946DACAB0E';
wwv_flow_imp.g_varchar2_table(149) := 'D4F1A41B6D753C977D4FF88A2F6E55FE84FF81F7BE474A6E1CB7EA91AF969A4D82DEF92568C8B856EE6A594D8940033888D3AF064A908D02BD77D13265E6CCE5F4009814275976505DD2B0AB78E5BC04BA99367EB7695EC69CEA15742CA1A31F816D06F5';
wwv_flow_imp.g_varchar2_table(150) := '73813C6A0C6A9E9F9F958152CE405DB117CDB746582CE75458F0459FE23C44E5FFF227DB5D3EF47E3978257DF0DE9B5760A7013467A79C96F7D55168A0EC15F2F2667A6900AA3899EEDA52095959EB534DD3CD4AEBF271A9D0223043B7F03D3D323813AC';
wwv_flow_imp.g_varchar2_table(151) := 'A33DA45C4BF5B5780D5E86788B1A4DD60756FB0357C10295BCA011D4EA2D3281F20994B1B2EA3750D58B30E7CC39AF64DC4F24DC0838A787E7D274D914FB92F33054F9038DFC8D2F79E592CC2689BCBDBC9EF3A55C72584AC32F559A277605F761D52783';
wwv_flow_imp.g_varchar2_table(152) := '134E1E476C4741EB85CE849BD1E974CF807230C4C0567B82A881F191B7B51CD01A70910160A35CE00BF83651D1A174392DF539CF0FA993E34B42809E39D40CFA43146B3C862BA800D67681400546263A29AD3C8323CC79CF14C7918612BAE8448CABF3C8';
wwv_flow_imp.g_varchar2_table(153) := 'C743BA907818ACFCE4FB153C717BE75FFCE5560CB6CB0EE616F2B5960B8081CE434525CFAB7AA8B214E24869FDE95809808DC663866AFD49F1DBD186AFF7350314F418A991A1B166A1A1B87D7881DEB5AF5C6500142DC3107E61306BD4B3C605802828A1';
wwv_flow_imp.g_varchar2_table(154) := '5480D0A1B88E4E270DA4941D58D4296B1A8998708C57A02C8B01464DD4951B6C67053810A0F68192AFA0BE908F4D94FFC5CFFE71FBA35F7FAECDB6FC984B68919DA39E4A365D5D80F10F51AD796441ED25CF5DB88253F6304F4F03C07401E08BAA5D26CB';
wwv_flow_imp.g_varchar2_table(155) := '3C133C963CD97E3F20028B00543417A05A0475AE06D92E13D6745A54A320292CA515C2903787641FE04315BA02CBF37E042A4E1B2A0073CE5BD705C0121DD168F7865DB52B3850A5374EB132963C06F3D3893D61C09A5F8AFB22BE63D17B04A58F0EF7B7';
wwv_flow_imp.g_varchar2_table(156) := 'DAC88796710460BCBBBBC2C2E4583805F35E33030024D8503CC7FCCEEE5EAD119D0ECD79B65F037665D4A642A33C74284342F3D90626C1AE66EC7DA5809A01D6F1275E282D459D01802D07C0E881E8C53AE91297289D37C0D61884507006E8A42384AB10';
wwv_flow_imp.g_varchar2_table(157) := 'D434804879BCBB6B4FFCBAA7ACDDF006F6F705CFFC51BEDD7E61ACA747A022EB6BAA83F5479518E62D9B7F5037616069FB0DC0002C0BD576E8D13B6770E69C5F564809CFE3BC1143CA8BC8EC38FD6389046D8FB5040AEC747B693FB48D97FE1ADB97BADC';
wwv_flow_imp.g_varchar2_table(158) := 'E028A4C0D0470D404DB85DB870581649167443CB7C5B42836A56D5B1C5E534D86C535929D63AFE84D70C61C072B05927E5016732E60995FF53BEF9ABED4EF7BB772A6A8DC342F9FFFC775EB2525ED08087EA4FAADCD65F18CC1632B18E0BB9FCD78CA953';
wwv_flow_imp.g_varchar2_table(159) := '0701126D1003603202CB2E7DE123B09319E8CC931AF4D31205DC2012EA7B8548555D63B49265DBA05434CC00C952C1E215A880A41CD3CD4741A5100C0603A0642D44FE16702D81C21AFE6A9517996DEA2CAAC6687261CF3EE53F7C4DFCC1AE08E87804EA';
wwv_flow_imp.g_varchar2_table(160) := '853C7F5DF961931DAD24CABE1D1F1FF144ABFF5426271F16F2C961EBD280DA525860B6AC4416253172CEBB98683E00D8883380737979B093ECE54DB3CEBA7C31A0434DA35B47B3AD1C9907682B4F3037F229199D7490862F216D09A9F21A89B25A9419E5';
wwv_flow_imp.g_varchar2_table(161) := 'C7246FE2F366A276072A8C420DD8C880B27728792C28BB82751A281B6561B0C89B0DBB267BBBF649DFF8958394FF855CF6D495DFE8404736E6A1CA7832593418EC90072AEBE5CCA523C742D25E54BC6A11E5510AB8AD050D00160390CA6727C754969611';
wwv_flow_imp.g_varchar2_table(162) := '4D087D313BD557AC32E7C50F941C140098F8CC911D72A3CD4BEA69D6342C7129EE75FCB1DB43062F6F25EE2DE279440E359E4F178492601DBC92F3511E25B86859139725EDCF4D79CDA98C7777EC63BFEADFD81DEF73CF1CBC920E34CA97FDF04FDB9FBF';
wwv_flow_imp.g_varchar2_table(163) := 'E0652B65E25DF2D5C7DF0D88E5C5FC241EAAC44CCF23F2BE5E3C2B14544F211504CE9AA1675C5D622C55C86300967B49E3A50E2B30D979C3F8B754AC4EB4D602B01EADB2B5AC154821052E33F2B2A641E465791A80A5B648C668D9D677D144D6E234EB47';
wwv_flow_imp.g_varchar2_table(164) := 'DE22F17A89BC791A18F4CC58EACB3D1EFA207BE4E77EA63DE8539F6897EE7CC73AA19E5CA072D68AA15C7C28D119261776072BFF2B7FEC67ECF5F14557A39351B6230360CE3BF3CE9B2EF5591F1151ACFC550999C297ED3478CB1A756EC15806AB2513E3';
wwv_flow_imp.g_varchar2_table(165) := '09288FB6F6434692B142AAB4410C8002F3D6F6516A5B5CD34B171729EA23FDA89E4B0013EBFA4494F2168F6C2F6628B4A2614811DEF1903194C25D457085AECE1E00001000494441548E7EC5445C65C4246DA5F250483997701880BC38A6A5FC1FF7555F';
wwv_flow_imp.g_varchar2_table(166) := '629FCC0DE8477CD6A7D923FFF967D8A77CEBD7DA7D1EFB8858BEEED11C2718FFC85B5F3D29FFC77DF5970EF2FC52FE37BEF4D5F41BEA639D2A008EA3335D80B37C693B3BC567BDD0E32CD4D6A6A1E4B0A756CE7844E3A0692AEE1AFC88131F88CF4D1F00';
wwv_flow_imp.g_varchar2_table(167) := 'CC396FFBEF79AF755DF9B4DCC687F3BEAB6A0DAE81A92F97BA3D45ADA232446D6B5B4566EC3B6F5B5C4D4FAC7A8153F3A2B833BAFFE33FD2EEFEB007D5CA3DDF963FE65FFE33BBCF473DB2066FCD70AC7238E00CC818CB0B994ECA7F877B7E3073DDB7FA';
wwv_flow_imp.g_varchar2_table(168) := '93943F62C576289098291F92ABC6513900E6BD660367BA545F3AA4F4E601BD7D88F4109F831E25473DA800D8601D4D1DE8A962AC618EF5FA70BACA0098A3977ACF5BDE665DD707DDF79E76D3E2A7BB9B82049CA9FDAEBAFD7079B2FA4076E30BB7682D06';
wwv_flow_imp.g_varchar2_table(169) := 'C401966545CB2763E93697E5607F97992C71F7873D30CB5549E13FE68B3E67AD11346700C915A8F8AA289A6DABFC81CADFA60F8E4E0CA8DAF2744A70557EDBC314A0A291F39FA781F53809DF89B194698B0198E7699065979641A1CF830D6F3FA35A25E5';
wwv_flow_imp.g_varchar2_table(170) := '2DDEFEA77F56011A2900F6119FFBE9668C8BC6CB3976C87241DB9A2BC70D6B964030909A02175DB2130E3E012B77C9835BC28BE6E695F5683EB11C00A922A69B0F297A1396F22A5B6704CD763D678F543F8FB755FE48837D913EC474F6F0E374F25302C5';
wwv_flow_imp.g_varchar2_table(171) := 'AF77D5C798E7EB3E1E41BA65CDEC2959A1926B56B24C0230347134564B8C7AA29FDA0277D4109CD6AFA18DC1057E5724217495E570E1BDF7EDEFB4F7BCB57B16B8EB877F883DFC733ECD9AC22F3DCFA06E190036ABC068C84D542CBD1855B847060E7E49';
wwv_flow_imp.g_varchar2_table(172) := 'B1F9056DD6E404904605E63A6680BF79DD5F58DF2539751981C64721AFEF1B8E4C6543955F63FE529EF6BCE125AF52B56588BD589103CCFBAAFFB6B8F439B3459251E069D08C71FB2DDE15F252183A6565D92579028810E987E41D332D8F419AA237A6CE';
wwv_flow_imp.g_varchar2_table(173) := '551D0A3C936E3297D35659B1221423F3158D1CBF990640018EED4F7EE3F9D6777DE8133FC63EF1EBBFC22E7EE01D96688ECA0460995F97C052A1E5D58B4C31FB6B6AE0D5CF2E2CE72BD1062E818236BD0B6489262C665000E6C8B3B55CAF7BEE0BEDEFDE';
wwv_flow_imp.g_varchar2_table(174) := 'F8E696920AD46504A16C6489588E61C5930A3651FEE77FDFB3AD79CE2F1A94DA8ACC3C1D665B9F042FEB94CF19678132B5FA2CA27C24E5AA0C80211BAFAAA49E027515400406CDEA7532119E1E758924682356679ACCAFFDDEAE0620A30338139D0CD49B';
wwv_flow_imp.g_varchar2_table(175) := 'D4ACF367CF7FB1DDFCCEBFEDC5BBE7C31F6C9FF77DDF69FFF81BBFCA1EF6199F62F7FF988F349D920C0DF77BDC63EC439EF051F6218FFF28BBFF473FC6EECB1396AEBAF7FBA847D9031E5FE27EC8E31F6BF77DDCA35BDBBAC7231E6237DDA97E5CA9B7A0';
wwv_flow_imp.g_varchar2_table(176) := '5129D99BC0C1D55746993429263A0C607E32B3DF79FAB368046F126A6750FDE64C10A2FCAB916F8EDF26CAFF3BCFF8217BC34B5E1115BDA49BB15235B1048E5A661A150288FDB5C535E73B8122730C0B708C026514621F62363ED44F47E58E999E87A33C';
wwv_flow_imp.g_varchar2_table(177) := 'A56F250AFD7F834E092F9F830C0040F4C866A55519AF7963ED4DD0F2567B4DE69B0360B6446F4D083FCC0B7BD1B37E3C0ABE15690174DE9B0CE1D19FF7D9F6B82FFE7CFBC8277DEEE0F0D1FFE60BEC639FF264FBD8A73ED91EFF654FB2C73EF9F33AEBAA';
wwv_flow_imp.g_varchar2_table(178) := '4C38C2551DD56D6BEBA3BFF40BED33BFF33FDAC37974B960D1667C815870E654BE887B825273C68DB5B2CAF370727068BFF55DDF6FEF7CFD1B73F04A5ACA911B41A062E563E0790A932A6DA2FC2FFFA19FB637BDE2F763D5E89535B831573EA85E8D6528';
wwv_flow_imp.g_varchar2_table(179) := 'A8E4DEBAAE1167875426E56F73A4E23B398884AB38EF83F25D0180213314C9A20B779001A8B2F39E44A1640CF1CBDA0D61C482F8D0E02AC44C7C8CB2018880018F1195E3AD7FF4A7F69A5FF89501D8D7178AF3DE1EC59757F77AE4C323630595FFE8F0C0';
wwv_flow_imp.g_varchar2_table(180) := 'E654FED9F2E3243019BAADB9668747F66BFFF5FFB1B7BFF6CF7B3141CFA723D2FB3DFE315129D3F000CE1C832A6FACFCAF7A8D39EF55958E884BC4F8DE2566170FE9844299AD7BDF12963F7DEDAB9F81F23821DDBAAE4403A0BCF27A4A3B5FF2A1F4BAE0';
wwv_flow_imp.g_varchar2_table(181) := '7C853BE712B40B7FB80150B849888998DEE8A5741E077A9F3C1F0720B3FCBCAC2F2DEF08C05EF5FFFDA2BD8ECBA13EDCEBB5EC011FFBB8256B721AFB97DF678A059C4CA60654CA23585B00653F3F3EA1117C8FBDED4F5ED786B28401B0477DFE677329F8';
wwv_flow_imp.g_varchar2_table(182) := '18C24AC572CE1BB876DE46F949247E264C71E07A5ACAA9740AE2DE41CF12A2255D9E2FA1D5D37967C24910CD8CF3C66A22507FCA59326195B1673FCAD4FA67CE431BAD4461B00100A8316EBCE67CA3C768E56E36282FE7DCE0A696F454277E8E84AE4C1F';
wwv_flow_imp.g_varchar2_table(183) := 'B67ACD2FFEAA49384B841B20B173F1A2F99635B1FA35A6010CE90200F39C41F571E25FFFBF9F3EC8083EEA5F7F9E7DD8139F60BAE060D30B174C6F78D7BDE4D292E425CFFC717B133DBFEA2AC800156BC35BC6D5B3B904D298D1AA2B84460A704B83325E';
wwv_flow_imp.g_varchar2_table(184) := '32A893C60FA869A915B807607176C39CF736F4AA78B6DE4FA0BAA10485E71B0C48585AC7A92C0FD5145F423578669597B0A117077E341E1BC0BA348257FED4CF9914E096BF7BD7500AD71CEF5D7FF966D3978BC6931D932148F177762FD87477CFF241EA';
wwv_flow_imp.g_varchar2_table(185) := '631440ACEB9CB764047DEF498C1700FBE82FFEC26804BB375DB28FFFFA2FB321CAFFE21FF8317BCBEFFF3129543740F9A72CC72125576398FA0460B5680101609EAB01A052BD191DA90E096C7135670481DD860E34A7BF6A4CA258868A8B32DFFB1C353C';
wwv_flow_imp.g_varchar2_table(186) := '99947FC6A3AC900945B0225BBFC179F3AC07740BA5AB5100B1EE683CB574FDF51FFCB13DE7ABBED95EFC433F61EF7DC73B13F8BA8C2FBFEBDDF6BADF7C8139E7A311EC5DB864BB172EDA989EDF714081E132F1743EA371F9724946F06BDFF1747BC76BD7';
wwv_flow_imp.g_varchar2_table(187) := 'BC27207D19C1A73FED9BEC0E77BF5BAF8CE4CCA4FC6FFBC3D7F6E2AD6C4EB5CA52602D00E69DB37597F428F525E11E1DEE9BFEEFC25C7BA4962F5E35F153BDA171AEA3799DF5DC66D860E79C1B65106E6268BD39F179633DA781D3606795364A02B0C974';
wwv_flow_imp.g_varchar2_table(188) := 'C7E43953451D0FFEE96F3EDF9EF3EFBEC97EEE1B9F66BFF7BF7FC9FEEA15BF677FFBFABFB4BF7FCBDBB60AEF79F35BED5D6FFAEB18DECD741B9D3ACE5B3ADB91D77FED6FFC8EFDFAB73FDD8EF7F5CF3412E7A78BB564024AA3991D1FD973BFEB19F637AF';
wwv_flow_imp.g_varchar2_table(189) := '7B7D2F5100F1670AFB90D6297F3EBE5A9EE4B4B4040A2BCB951CA33D3DA11300CABE440C3A51FDAB29FD0395263DE7BC692510F1B67CC831B755756DC03ED878527AA18433E389C6ECA4FA115CCD08A94CB1E7DA1580925B0747C3D39261BAB36763CE06';
wwv_flow_imp.g_varchar2_table(190) := '9A51E411263BBB76E56FE965F9C2E8653CAEFBADFFF63FEDD7BEED7BB60ABFFC2DFFDD7EF61BFE33C3B7DACF7FD3D35A69FCC237FF9758FEB3DFF0ADF64BFFD777B6E2A8FDDFFC8EEFB5D7FCDCAFDAF195FDADFBDC56517250FF53D9E1952BF6BCFFF103';
wwv_flow_imp.g_varchar2_table(191) := 'F6F63FF9B304DA385EA7FC4D82738E7713B64DDE794FC7B66BB58B4650341C2800D3383B1A410D774D06A8EBDC9919C0886B722960DEFE118FF78E0EF6E32F473405A4E92EC7DD36ED68049A0976F62E585C4AEC5DB4E974D7FC1918987872DE99272DA5';
wwv_flow_imp.g_varchar2_table(192) := 'B5846BCE6482E7B0B3EA97E86E12C69C0D93FCE529AFDCFC3E7BDEF73CD3DEF647AFDB844CC41DAAFC000C70B18E64D37472B1800F80781B28EA98B340FE954992C86E981F4D6CEFE24D747A1303609B5C8EFA92E3CFF9D22DD0C07298D265AF941A1840';
wwv_flow_imp.g_varchar2_table(193) := '418871A0CED0F1F1A1E947B442361D4AA19CF703295F5B34F5CBF992D7C0E3BE39D7A22113983C48B1D8DB00DE9C2F71CF9B6B00562E1F5C6C3A50DEFBB7BCCF7EF3BBBFCFDEC2FD51040E78CCB9777BE1F7FD88AD5BF32752E3C92425976BF590C94785';
wwv_flow_imp.g_varchar2_table(194) := 'CE7B03EA7A2178570010FB32E5CC2EA3965389333B1D9B0E0A76F7F6CC39DF557D2D5C3413928CBDC9AFCA9C1E9B04002646C76472B5DE6237C402313EE11285C91BE206609E0368A601D4DEE6C47281E907016C718D788AB1489E7B04C034B09A0D2DF2';
wwv_flow_imp.g_varchar2_table(195) := '6AF13A3E38B0DFF8EFDF6B7FFD9A3F8EF9BE4754FE67FCA8BDE34FFFBC0FAD5626C5D4980A58709972787085EF33663108A6201C40F253AE3D34A1006C3C99F090E0024FC62ED80E8D614ABD194F2606B826FA4679F1932A14746833BE8DCFC754655BB5';
wwv_flow_imp.g_varchar2_table(196) := '00C0A69C8A350840A3C3CC7B2E25B4661FF1F4478DDC28417CBBC5D42961294860F2FEDA74C67EB07F230E4E4C5FA3070093EC75A2A44176CE1BA82C3AA1F9ADFFF1FDF6D63FEA3EC9D946F9D54DC9460E4DED285FD0080EF66F893FA2ACBC8C723C9E28';
wwv_flow_imp.g_varchar2_table(197) := 'B97100608E725700633BA36B444725BE4A7281BC1EDA8C339FC654B1C6D59585DB3D279C05A6B4D83137A6131A84D2B2604D5FA31B4CF9250109BF129899F636F2FC337A0E094B38EA97A3C2297DAD837891AC7775BCCABDD1EEEE459B702C5EFCFD3FD6';
wwv_flow_imp.g_varchar2_table(198) := 'BA31DE56F9533FD59EC6D82C777A30C96C425DB0EBEC021C6797A90125BF81CBC5A3C32BD110F4C3CF816F9C4F6500004C1E48DE5E0298D008C6DCD838EFED46BC00D884FC9B9502330B34827D0A4C4799C1642013BED00252B95DF30B80397A4D29A1A7';
wwv_flow_imp.g_varchar2_table(199) := 'C773DE5B319BD90BB9C4F9935FFB6D3B78DFCD5670FAFFDBD7FF953DEFBB9FB9D1B2C71A17008EF7D86474D1E951163A9050DEB3DD06FA35CF02E4978E583A9A9809DCB748F9E79CC104737A9C260030A00CA7A173BDD475DE9BD6A0C042341498F1D212';
wwv_flow_imp.g_varchar2_table(200) := '401E564A068090EBFB9611FCE12FFCBAFDFCD77D9BFDF4BFFDF7F65BFFED19F6AE37BEE9D44C03A0579D984EE3E4F8240F1920707DCA044069B0746C7260C63C38B6314D693886DBEE8604348BC501E6F26EC20D993C9CFEA5AB06BB817A5BF60691C094';
wwv_flow_imp.g_varchar2_table(201) := '63B9C325A296E8BB8BE5A29CDA391AC00D2229B209C0B4DED5926ECAB5ADA650793916DD76DFA0120034A623CE5E53F35C16792E178D93D6353300ADC552B84165BA31DBA9BF29DE98C0755E21F54BF175CEEA92BD73330009451F9B38393EE2C6F2A00C';
wwv_flow_imp.g_varchar2_table(202) := '7C7B7CB4F81094CA84B3E4EC5696D049923EEB72A43E2BE8ED39834E99D209D38DDE65F5258EA7FA777410FF27C0D51853C94B2FB6E6B31353FA34723B1703D08EFB70FFB21DEE5F31BD2DD62EFC846F8E4F4E8EE2C727F4DBF12A9372E868EA341DBA1E';
wwv_flow_imp.g_varchar2_table(203) := 'EB1ED3E80FF9E228F65B7D5660FF95175C7DD7805E8FBC0FE549062EE53F615F35AECB31A5831B4A631D9E8C499F18D5FB878383CB76407D3AB8C277116C5365EBEAB7955F750390673FA0F22B0E3C87E5528CEBEB89E918CD732DE69C8F7CA94C82DB67';
wwv_flow_imp.g_varchar2_table(204) := '87668B9715B1E00C1E32AA93E363DB271F572EBFCFD486142FF2C4B3E0B038E93983A66A2444F7885EFE88CAAFB40A01D8841BB2E9EE05D3DE82AF9B6D3E3F893C9D75BFD5DE798482C7ACEAA7FA92B71738DE3208FDDBDD3971C229E52C2721C3527B1A';
wwv_flow_imp.g_varchar2_table(205) := 'D340FA453137C977FFF2CD762C43E078E63CAC4BBB7508A72DD7B77D42C694BE18A21316059D21EFEE5D8CC660DA9198714A6387F8B242CAC9ECA9EF40A11F1D1D72E6B96273BDD0E24068EAD4C01CD2203470058578EA865A08CC79D63CA3B7B7451978';
wwv_flow_imp.g_varchar2_table(206) := 'FCA6D38829DF97E87D834E97248FB258EF1C0EE2997D993FFBA764AA7E97E1988637A3CE86533524F96AE9D394E1241E1E4C23ED390DFC88CBA239651F015B3EE69467575521B66D330000100049444154B5AF36B4CCDC645974550D2050F167B3EABFCA';
wwv_flow_imp.g_varchar2_table(207) := '38EFE32E1CC0B21FCEFB78EE3EA15298957075E0AC14B31CEC4333BED4E2A3769783776487FBFB67AE78A27D7C7848835EFC7C22FBAC3E46AFBFE002407CF1E6FD38428A62669AE28B333648C9F3900A78C825C321972465B8C27E5FE632E232799CC7F6';
wwv_flow_imp.g_varchar2_table(208) := 'B77988F68C8E25AF2BA3565FA73C421EF1FC5D65A5115C39555B7D06605177026781C3F8E2527CD980CB69A044F888D3F4213DA2822C499D1211950FA0D38AD2FCFDC7115FD33BBEB56C22EBA58404A6F3F75416A8045131694409B669AC29F3846BEDBC';
wwv_flow_imp.g_varchar2_table(209) := '9EF3BE7C31425E2C0ACD3828332E416EA6F08ECEC423CEE9E90EAE5CA6873DB174C9F3AB8F4069E409EEBCB7E9EE9EA52F8A6B7692F19F46EE965D05E5A7F1941C02970CECA029880B4E8EA6F6F62FDF621AEF204056774852F57383755CD26A1C0198E3';
wwv_flow_imp.g_varchar2_table(210) := '58EF6AA9379A982EE11DD208C593F29B04D5D178B6D591C1693605DB56F90997429A0986F4C769B02420AD9F3495291C5369B46E9751141C4C11DD34A8717D752FAFE739D8793E4F03F4869C05000D4D5932E79437A77711AD1232FCA93AEA8B04976A79';
wwv_flow_imp.g_varchar2_table(211) := '3F2A959F5E494A270F050E92F112FE31BDE33185C7ECD67749E7C0E69CF613117D9B6D3C2E9520C1F2587289BC2CFA2E653CE19E25C7D9362D45C867E1920E4C06A965A8739EF650D06BD2F8692C65F9F0E78C273139B6E7F9BA5BC834C19341283FA73E';
wwv_flow_imp.g_varchar2_table(212) := 'C9682427E58786B29DF6E5DA7832E17E6ACCB1DD33C0459227D4E1B24ECC763E9C4E22E654B4360C1138E4CC10B6104CC18E16F4E239DDC45C0ECBD312DC98CA59C1824989C316EDCFD9BE1429D192A24F3825CB080403606A4B9EC3510904D3A0481EEA';
wwv_flow_imp.g_varchar2_table(213) := 'B7F2DB040DEE2C5BF6A9DDF1746A007AC9E9C5DB38CE4A259A0650322C73DB3D555F749AB5A5A4231AA464E1C7E5F26B4E8395AC9BB87DF982E3ABFEE638C06A3F9DF79666384E3F5B1D8FAAADBC9D94069C69FC00986438E1DEC3ACE44163293DB09ECB';
wwv_flow_imp.g_varchar2_table(214) := '353B20A18860AAA3860F6804B9274D657DB17E9A3B68CACD90C863966B4F6A3AF33C1D4AA5731AE7F1165E59039FDA0760D3E95E1450A2AB182885A68D38500A8DEE309E2AA85DE16C12029710C7F43C791D7D784E32CD615D6929A5C1C562C95D0A299A';
wwv_flow_imp.g_varchar2_table(215) := '11B0E143F5E4FDDBAA8DB9240160004CE984734239AB5ECAAF8B8F89BF8A53D24D70C58E33422E83194FF9D43F950D0DA1E8F2FE75E732A2412B886E4127B8AE4FA5B485CD005020931D9B72DDC6ECF2D6DA6BB6E15224B4786DB7F0B44BC22D09803CD0';
wwv_flow_imp.g_varchar2_table(216) := '13025896AA139B28A48C754621270232A8249404CB63E7BD4D793409946DAAFE36CA57D0234AE8B6B8E4F5D42E50D25D803B233898A3B2D8E212BD4D1472512D46AAD72633C099F33EE2E8E1B964C1625C021D565B1DE13543A0B117B3EE5F776EE23BB6';
wwv_flow_imp.g_varchar2_table(217) := '012439848D0E1DD456A06C9B34CD60E2DFB20BC0C2D1956DCDB944931C33945AB26600C6CACE7BF30CCEFB0C914B115A7BD1A2D419D29924019894C6B951462F708D7A48E7DCEE0532C4989CD15835D5C60C1FE3864111B4728FA2E7A8D6E9DABF0C5586';
wwv_flow_imp.g_varchar2_table(218) := '44ECA4B16ED7124B039FCAD7C730971B003D9806DFB6B86488810ADDAC2AFAA0A1E5F0FC672B9B7DC8F1F2B4E86FA20FCE7B937ED9E29A513117C9B551A0DE051A5C13D1796FEA4F0E0760723C58F4B1A0E18857EBB85C0E87F18F0400F0786E272FE249';
wwv_flow_imp.g_varchar2_table(219) := 'C93C9E14D480572903C05CF62F4C8D972C79A8D03463B14ABC016F52EE98E979002EF6D9390E14F10295E7889BE2D0227816AFDC5206F1980A403A93C9346507C5CE39F3BE327CD10CE46350E50C29906719AFE20C1C93A2AFBEC6CCE291CBA7E09253ED';
wwv_flow_imp.g_varchar2_table(220) := '2E8A3A23FD3C4A58395A86817D68ABE4A3B2FA6591C6A88DBF25429690128716398866B32FAA2639E63FE339EB99A99C2AA400B0030CCA3BEF0DCE2BB90C5A162C331B269CAFD35A573DEF807003075583A358F9BE1032618D38C5F7E1E665CE7B1A4B35';
wwv_flow_imp.g_varchar2_table(221) := '0B14F4C01AA81CA72B2DBC5C71C6E38A4E579D36B8F3DE40632CCBA8621D6BDFB2BCFB99CBA0C28221D24705624AED01254CF5643C04F7DE417C714CEA489CA157601586ABE993FAB6784752A1B4A624D7D04237E73BAF08C09019A2C6262FCFD3350350';
wwv_flow_imp.g_varchar2_table(222) := '010045060E82A7B06266F1089C4EFA882DD05AA3A642B72265C0BC03091C859E32036397096248152D5B72BC636E6ADB849FE3A8BCE04BAC7CD9E5BCCF5106A72527A01C0355CA6715E587844007A0EF073771019877AB7C0130B780072A9A0C5FB1F55C';
wwv_flow_imp.g_varchar2_table(223) := '816DB41507D66F83B7C106191AE915D4BBB6FA6D3A92F0A4BF291DC23CAE60523E8FEB064041A442E7DC522809A678C62952715F901042A037C890E479B2ECDAA45B0C488E5850E8A29DC3D6A6B33EADC5258253BFF365886681357D164F05D7A9AC1E6F';
wwv_flow_imp.g_varchar2_table(224) := '9077D189994D1F0D7E759AB62909F1D2A65CE2C979BF4A4E6D2A2C4A8618C002B51E9186DAA803BB7373CAB6BBB42C091C73F5A7CC654FB655B9890CBE4882E3B848C6A86B19543300C7818BD88B87131136B4C8C6A858A30C11490F5AAEA214E4D9527A';
wwv_flow_imp.g_varchar2_table(225) := '480CB4742FD2AC1B56935688384DE8667997C9216800D60E547D3A77941BD0C2FF103656F8EFEF6F1BC930D7D262B51ED82F60952F00968F4FF4B82B7CD8A9AFB0054DD56935007143BE15B505EF6AAADD79EA54C76A50D23402430D5A50193A195A6046';
wwv_flow_imp.g_varchar2_table(226) := 'A6A9388BEC569194C81A6DDB804B6D2B24D43C9D60EBE2B2ED0A4B0AB1091D00E41C15810D5205956493B6DA48CF3B9C94F32DDEBF8500CD99DBDB5503CA511115ACDE47E5806E950A1D4B999C6E7B7A951758F9D78E6F86061F1A436BB9BAB925327494';
wwv_flow_imp.g_varchar2_table(227) := '0426B23B50B16504196835C941E499650DEEFC30E1E7959CAFD729D87610ED1C694DBAE85086BE6ABED92E8D3E644B9CD5BA30004BB073DE4A0559820627C46F603F07576841EC5AA68AAF16F4C87BCEAFFA1AD6C839F6363E728A88B472486F1ABDA56B';
wwv_flow_imp.g_varchar2_table(228) := '0BD153BFF97E407D2A388E4DA23503700D8A8033F02FAF24B914BDCAA0AD6030296B5E6F9BB4A722E5F5E2A0AC3A831C8576579FFEBBBC61AD522303F59B21810B763AD027A67C330628A50C1F401365505EFD6BCA56BC0CAA9C2169B0B3EC32E91B86BD';
wwv_flow_imp.g_varchar2_table(229) := '2C600268F0CC3E13DC790330344A01586E488DE2956CBEEC5A293C0300B231916C159A645D0E68320FC04CC1F28BAA704A0F9553EB4B3B5F638F96C5B67B1431D2E2C0F18E493DD4E962C3A917803957B51D585F74ACE782A3AC54CEBA605072AB90334F';
wwv_flow_imp.g_varchar2_table(230) := '02391FCC0EBC57BD04E0AC8F561CFB8CEF628D9303D45F858C25C28006AC565CC95460A01B57E5A70DF0F5F6A8402B249B18350400E6E0AD79050A679D4234EB6C9377D9694CAAAFB6537A683C6F99FAFAEA0230B87ABFB769B7AF8DA165CE552FC686D6';
wwv_flow_imp.g_varchar2_table(231) := '69C3F3D9E7ABDACA1D9CB1D7CBA26DFAEBF9CE05C0924633E17C5DA6CDF24DF2000C8D316AD6F799FEC875B619B5CB2B01C8B3318DE4D962AE7C04CE00A1E1A9CA92FCB94A2B2F1D920660CD4E06BD80E9AB0C67006A18614303200173D90C20627D4624';
wwv_flow_imp.g_varchar2_table(232) := '592C854BB928AF3A5B853AEBE6BCDB88CC928F462DD7E84FA3D8548E6CAC0BCE7A4D9C7579BF4621D5C63A1A2BE59ACC141A058033A021AC064E6E005C1BF35E25E4F23A20D13CDF952E077895581D3F2FEF67B45EAFCAC160AED1C9750303C09AD73C1E';
wwv_flow_imp.g_varchar2_table(233) := '0B36A1DD79000627D16089D4F7422AD021E42F08950F348465E50D1240D5E606D596A86D1B3D15AE553EB68B6CFC379599DA58175CC340BA8C35A723CF1D28DF1CA6B4E78C06F4CB2ACE6A599F42CB986894452F06CF292C26F247571BB97EE7F82D6938';
wwv_flow_imp.g_varchar2_table(234) := '188096923520D601EAF5428B30722A8E8A5B2A6F052DF82630B474BEC2584D79E76A3CCBF0BA064CCA1F32BE8417366C4F1C00EAAB8272DB85AE17674D9934A90330EFAB254A582BB3CDF974BEA26FBC242746BD7797410FF9888BF44EFA901A081CA3D0';
wwv_flow_imp.g_varchar2_table(235) := '1817970A81653281622C2B8A89EC5188D0BACD68861F513730985415803507AE687420E1E6F10ACFAC13B86FC971D6A5250F0035B479C7916AF3437A655B5B74B8D6DA7699A283C7B06EE9C8E69CAB2B68E89199C605A8CB8724AC2F00C25728B10A2EB3';
wwv_flow_imp.g_varchar2_table(236) := '9A0A599654CF36230160ADCEDAFA2FB5A590632DB5DE37AC3321A9A329BD6D1C363598AC21A01258091EA0588D3A4106C050D61FF68CFD6ED0D13FE76BAB1DD8BF1C5E4EDB3964583A90C7D0A035AC66892565915295B9FA73085DB8BA0174197C9DF266';
wwv_flow_imp.g_varchar2_table(237) := '3970665DD6605FBBF84D386D06DD763892F0FBE2100DBAAE3F4B0388DF466AA9DDF40A4211A1C0C152BA2DA82C343D4EBDDDB66A2B3000E6740AC2D81657C10DADE82FB21B449B3100C0BCDAB6EA9A17B3D68D548551A64AFE366B4F35554F41E96D42E0';
wwv_flow_imp.g_varchar2_table(238) := '0077D61FC04EB9ACA81CCE7CB6FDAF4574F19F7FF740BCCA68BB7055D666848E63D35527874B45D7753B1AC0783C35CF4D455EF9F4E97AD381D6BE0D4D478F0143ADAA06BA06B84A99D1A4FCBEEC923C257A75DBE6DC41254EED417D1F38D8651DCA9C77';
wwv_flow_imp.g_varchar2_table(239) := '99AE3F8B81F21F657A50F42C51CAF1AC37E6B363C77AEB552ED7B3407916B36EA7527EB1A9AABB4C21AAED32DB9DA03CD7F4DB4D76764D01A82B59222A054CE9D3C4EAEC36F5D53E50E7ADCD2B6C437B5D1D0D283261AB0F6D8AB446C6EB9A5996531FB8';
wwv_flow_imp.g_varchar2_table(240) := '5DAA944A7B191896E5EB13C4E5DD8A3790C9D164C2EA2591821B6179610256EE82276B410C2F4A4039C96017D9CEC873A9ED5CB5D4D2FEA9AD0DD19E653F2E9013F459FD1CBE9A563F14564B12C44DA7BBE69C33A01D1100CB5CC2AFE26A9C2AD8554849';
wwv_flow_imp.g_varchar2_table(241) := 'A8CD35DF765FCCC1C6DC01B05221CAAA814A346F78AC402508549412A37C3A0E10B0797B7A53297A25153E4563033292150CACB87A93CD55600B44463F1A97335FE06C343B39695DF6052B6AF0F1646A407BDB7933E2513F7C6056E2169C65F49DEF5ABF';
wwv_flow_imp.g_varchar2_table(242) := 'CD4C4E4E46C664ED069CB9C6B7056B085946ECAC5B2EB5687646619174DE2F525514289C2AA75415603053EB565DEA7895DB2C356E7CBB4AC252184A05806DDBFEC84B19B06C4A0393B7DD26074F798103B5AC3430012BFF127A9C0136A0E39CEBEC6741';
wwv_flow_imp.g_varchar2_table(243) := 'E34D74FB62D1D02F5938578EB9BC70B38FEA7F0E0360BEED08DD562F00369E4C6C329D2E0B4F8E0FEDE4F87869509A116627CAEB735D4BB498184F2696788B80DE07E5C9F6FA505C5F612A935748E914074ED629BD12C30CE0C3AA0BA8E7AB92F5A952B8';
wwv_flow_imp.g_varchar2_table(244) := '557D095F9BE1F53517186C1BA8EA2FA08322E79D79EF97B8F3D98915D95163F3D7EF6468FA212C608BF65847F5978D6D9190D1B4555BE709F33ACE7B2AE88EE9525F4F8E8F94AC85901D72688676AE92510DB125038046B063F97E43BFE1A3DFA0D2EFB8';
wwv_flow_imp.g_varchar2_table(245) := 'EA47D96410CDAA9EFB13CD1EC030D90230647C45C36DAC5C061A806FF26205A7AE15600EC81A823C1390976E9406603EF33081DE6C46450C03E77507BF629036F0D2C08E38BD9B55FC97BFDF59D010E6B6FCF7A9565ED39DBD1AAF2574D8138039544312';
wwv_flow_imp.g_varchar2_table(246) := '9DCCC03E5ABA482325F318A8F8CFE16D690054D0A995FD363B96878E1E991C911F3981D9BCFCD94790DFF1786A8E63DC46AB0B267CFDDBA9E9CE05D62D7F9D4E5E5FBFCE27A3D37230D505694FB854D78F29AB5E82AF8B0198F3DECCCABE6B6609D41DCB';
wwv_flow_imp.g_varchar2_table(247) := 'AE4ADA19B099049C01259154167A964094D1723A13BE0615A8D7177C93907B0BD56B2E45044B2188819461ECA31098D8F256DBB901163C8AD52F46C85B154B47002ACD4ECDAB6DD31C5C2527F5EC4DECE20000036049444154832AB70D99D53A70ABB035';
wwv_flow_imp.g_varchar2_table(248) := '10ED0FD3F1B8FAAB1FDA92A73E3A3CB0C0F107694A31478B3DC31A722BC50038D34C4D3F4C36A5E31873A9EBFDC89CF7E6197B7AFCC974C7F4EB7D8A57080C00C8608024D340C75D5F56B90134CC4800CE5B7E150D25AB9551419A160C438EB2715A0201';
wwv_flow_imp.g_varchar2_table(249) := '2A76A30170109A8464E5C55229CB523770D35462AF3E2544FD76A759D50779ABD9E2A7CF0198CA35484085631B5E80EABAAA568F8C2BA46129F5611866850580FDDAA392EEC6E194F2CB0884A1BEEAB745C7938901E25BD0ED82F39ECE636AD3DDBDF8DF';
wwv_flow_imp.g_varchar2_table(250) := '27E33FB3DBBBB050FCDDE854006C455CFD06AABA5A39E4845C9EE94A0358E9A4BCA03C545B1D29670E8FCACB692C876D9A06EBFB6C1964548EB6D320B51D3203008D461E7CD3F69AF8EAC3DEC54B368AD3BD3747872098F27B176EA292EC10E69AD536CE';
wwv_flow_imp.g_varchar2_table(251) := '3BCD0094B72A169CAEBB64ACF24D82F3750736A42E80D82719F7C59B6E6F976E7787182E5CBA9DC9634BAE00EC2C2E0006382BE5EA63EC9C3300A722EF384E0A89C89CA75A45E6385D2AE88B014486AC76050B19A1BC486BC49407CA4EA5FCB63100F37E';
wwv_flow_imp.g_varchar2_table(252) := '64F9252F9C2B88D20537A88A135EFAF1D7943F4DACF677E999762F5CB26560DE797F1AB2B5BA000C09A27D9442CA0F89E9189A687193CA7168C2DF5FF2232EADAABE069E38559BFA0D0C601555DEB6225CA60A2E7F023D579933033D9A3F030501609E6B';
wwv_flow_imp.g_varchar2_table(253) := 'C2DC9AD54E3E0B285FFFF90BD47EFCD5CEE872F44C0AC05255CF88B219209A0A5C75508E7433B6C9A559A3892F5E49B8097EBFC98FB84791F34A1D96E34CBABBAAD509AB114BF9E07C0D5A57B6B2E884534C992A9FA3D1D440852973A77B7A1A52DD9A79';
wwv_flow_imp.g_varchar2_table(254) := '42717460E9E594E28233406A65CCD31B9F2F9B52C10D1487168FDEC57EC1A55F68999535F8D108BA2ADECAE100B8B7B868632E5FCDC08DF0DCF62FDF1CF566B00148805240CBAE421F0ECB04AEC19A2F8EC74A34707333299367F494523BE797D402DBD7';
wwv_flow_imp.g_varchar2_table(255) := 'B1E4095FA41C67E7D59AF6850B94DE7459E1064BA87F43592E1A1F4F503DC099F35EC9F7EBE0E884E3269B1BEDD1686240A9FAE5738068002C2CA8420E7C1932A7D7499040655448F911BDAF1A4EF9B388456FB2B36BF9ACA23DC7D1E13ECFE5D3CF75C3';
wwv_flow_imp.g_varchar2_table(256) := 'A63C3716EE59B479BE3468B0BCB769B3E058042E9BF2BA00CC670EC3CEF8BA91C801D461AE0A6408BB172E9AF3DEFE7F000000FFFFDC36E4E100000006494441540300887B24DDCFA13DC40000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(1609806909232825658)
,p_file_name=>'icons/app-icon-192.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260505092756Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092756Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_256_rounded_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000001000000010008060000005C72A86600001000494441547801ECFD79B86C59592708BFBFB56238E70E496632269080892802324F226A825F89944355E18CA8CD245085435757573DDFF73DFD90FCD7F53CDD';
wwv_flow_imp.g_varchar2_table(2) := '5556775559A8AD285A550C320824A09003C83C25492683328AA2A5904066DE3345C45EFDFBADBD77C4DA3B768C274E9C73F3C4BAB1F69ADEF5AE77BDD31A769CB8CE3661C3810D074E2D07360EE0D48A7E33F10D07CC360E60A3051B0E9C620E6C1CC029';
wwv_flow_imp.g_varchar2_table(3) := '16FE66EAA79B039AFDC601880B9BB8E1C029E5C0C6019C52C16FA6BDE18038B07100E2C2266E38704A39B07100A754F09B699F6E0E94B3DF388092139B74C38153C8818D03388542DF4C79C38192031B07507262936E38700A39B07100A750E89B299F6E';
wwv_flow_imp.g_varchar2_table(4) := '0EA4B3DF3880941B9BFC8603A78C031B0770CA04BE99EE86032907360E20E5C626BFE1C029E3C0C6019C32816FA67BBA39509FFDC601D439B2296F38708A38B07100A748D89BA96E3850E7C0C601D439B2296F38708A38B07100A748D89BA99E6E0E34CD';
wwv_flow_imp.g_varchar2_table(5) := '7EE3009AB8B2A9DB70E0947060E3004E89A037D3DC70A089031B07D0C4954DDD8603A784031B07704A04BD99E6E9E6C0A4D96F1CC024CE6CEA371C38051CD838805320E4CD14371C98C48153EB007EFB392FBE5AF115CF7EF135BFFDF32FBABE8CBFF5EC';
wwv_flow_imp.g_varchar2_table(6) := '178599F1E77E39BCE2675F18FECBCFBC2046E57FABA87B4551A7B6583F0FBE2384110DA2653CBE30CE61E65C455B31B7210ECEFD15AC53DF3AFE57FCEC0B8278A1B6931A4B594BF68AD28349067257AF3F350EE0552FF8F5AB5FF5FC5FBF5EF10F9EF7EB';
wwv_flow_imp.g_varchar2_table(7) := 'A1DBD9BA5E717B6BEB65DDEEF6D565DCDADAB6699170D66AB52D6419E32046E79C75B7CE58BBDDB11046F5D9A06F1C632ABE69631DB6ADD3E99A6808594E6735EDC73629B8E0A68DA5B979DFB261FFC1C0BCF3D6E96C5996F0417307EBB7B6CF1CDB9CA7';
wwv_flow_imp.g_varchar2_table(8) := 'CDA36CEB16F296EC153BEDADEB7FEF175F1A7EEB675E78FD6FFEF4F3AEF9CD9F7EC13576170AD3A672977500AF7AC1BFBA9AF19A3F7CC1FF723D6380F9EB017FB5A2A3922E1BBDF7968790278039EF4DF5AD76C764009684018D0570B6EC78CBF6D39803';
wwv_flow_imp.g_varchar2_table(9) := '3AA08494C66CD6EFD9A0DF3760328DDE3BF3AD9601287004F6E959C67EF40A459D99738E4EA1CBD45F54518EAB77B06783AC7FB585F0320B8397BD823BB9DFFBA5975E2F1D62BCDAEEA2C1DDD5E62561D1E0AF8705C597717E2B155E08547E1A3513A236';
wwv_flow_imp.g_varchar2_table(10) := '73340A4F07A00280B83B50BE8CFDDE8169B75096D795463A7BFD623844836CB53AE6B97BA1255B1904D73BD8B71EE92CEBC653C47E70DECA907157B1BFBF5316E9005B7117E4B95318565E04998CB23CD8DFB701D394DC38BFDD9DAB07BD839721647111';
wwv_flow_imp.g_varchar2_table(11) := 'A16EDDE5760677090740C15C2DA367E44A1FAEA720576AF4C4977C02B7BD0396F31D000073C80D0380B5DA6D03466CCDC2802B8BE06DAD418A1D38B66869773AB6B57DD6BA716B7EC6BADD2D4362CC81C7963E9D80947E129172741DF69303016080A233';
wwv_flow_imp.g_varchar2_table(12) := '473C6D1E35CA63028049284E647D9F3BA06CB85302E7E5482718CD420876B0BF3B740E5C545E261DA3BE5DA318812EF287667BD14E814288864FC11CB1D1272CA2DD878C8FB20ACEE0728551950CC279AF6C8C8167E49182C5AAB53C0654EA8C74CA6073';
wwv_flow_imp.g_varchar2_table(13) := 'C36D99E316DD796F6D9EDDE5A8524204DFEFF5A2D2A7F569BE4DE7B625274267B2C5B87DE6AC6D9D39675DDE9BF8CA1121ED75B2F33AFED0D42391804507EEC9A358C1C7803B03390966871FEADBCB14A97F27DE110C899E907113EA4F743519BF7EC32F';
wwv_flow_imp.g_varchar2_table(14) := '3822D3D7CA5A14CDC72D2F35A7A80060BA2404467552A28C8A54801C79A2952BE3165D8A2DE307AA6206C0B3FA96791D07126A7414984E27CC396F2DDE7528AABFA7B1D4F1DB4A83765C9989AE8CCE7495A8C5A77E9F4734AEF4395ECACEB7E3FC00E455';
wwv_flow_imp.g_varchar2_table(15) := '16ACCF5DC2800EB5A8182672028AD4C76B86951759C65D64F49A984DA6172B7E882B9604B9BE79C8058C4693418C4A794E75A951042A6EC66D76DE7AF44FF143513438AEFA40A9CCA3B10158BBDD1D55301748638FCACEEC09F88468F4077B7BB6BFB763';
wwv_flow_imp.g_varchar2_table(16) := 'BBBB1798EE9A9C54181AECF2644A8A8306A70CF2CB796F4A4BEC929F760A81CEA0AC4B53EAE3F06890D65F0CF98BC601D0F0CB55FF6562AC94405BD6FDBD5D9ED3F64C97582A0FE4A957A0201AA31E35667D159281D5E1A43CC0C8E8020D4B2B581DEEA8';
wwv_flow_imp.g_varchar2_table(17) := 'CAA1987F9D8E743C007400EDB8A297F5EA37E031202BFA97F5C791F6F98641978CFB3C83F779419951AEFDDE7EEE045816AD87A28B739461A738C812038F73CE790346A611283FD130C1FE8728E408A8A7D70C2B2E82CC68962798583195CC2D567D8B97';
wwv_flow_imp.g_varchar2_table(18) := '707B5C11147B7C7D73C0B81FCB77DAEE853B6D67E70E6EDB0E8E6646549C0A628C0CBDAC076000CA62DCA5488143BDEF1062B5192976A0D2DA8884E60148A37601C00830F0E250B43677584FAD565B5DBEF5E98CEA236A5EF1C2B261F5AEC3CE2AC7C5A2';
wwv_flow_imp.g_varchar2_table(19) := '01C869174027903609564781304386D4D313B31B48E99F943FF10EA030FE97A51318F479B3CE1562280C0A45F93C6636605B7CB5C334ED771479290B3032A049636432C8498D2BAF0F743A46FB9F4D97E7E59D25AB9D3164322EF294D9B57F2443195AA4';
wwv_flow_imp.g_varchar2_table(20) := '218E0EF3BC67718941CA1815E3246DF910E23D49737FE7B90BA023485BE3F71ED28A29793902E9EE149013D174A21D80182846563925E5D66B359DE2AA2D6969C0B3EC3ECF8E19CFDF69FDAAF3C0B891392A0E50AD97424BB9573D7E13BE38CE9C06AC63';
wwv_flow_imp.g_varchar2_table(21) := '824F8C4B7D23AD4D88D750A7DD4B8F5B7DD1A1E1E4A03A7CCBA04B47A34BB322086620475594174D843F9BC2A3169D0E5095A11C93FACD3B9674573A3C2FFC71C09D5807F0AA17FCCB6BC4C03A5324B3791574C073632FBEDFCEEA688EBE5C531E294EC6';
wwv_flow_imp.g_varchar2_table(22) := '1547E9A4C1D5D6E7F9766F77279E75E5C4543709BEB19E0C0AD1E90503AA0ADC040FC03C573B4B42263A238EA4720D59CD55320BE5D8A44DDF31107D3E1AE48808C1C82047358BE534D6B41D44748C1C33C5AA3ED2BDB46E565E3A7C929DC0897400AF78';
wwv_flow_imp.g_varchar2_table(23) := 'F62F5F430157B6FD29A3258869C24B61757124434AEBD6931F37BE59BB913ECFBCFBBCD4ECF14E43518EE0607F2FDE86CF4B732060E40F5318F89CFE0160709E4060CC3F5A19B3B51E59F27125533980A2648E4793FC95AA332F27C572D9A639EAE2B72C';
wwv_flow_imp.g_varchar2_table(24) := '2F9C06716A7A2F577300C65BC0F91C4015F7713881E9331BB59E3807A03FC608FDC1CB063CE78FC89C9E031543DBC4EDB3E76D6BEB8C0189327335E97117902AD6746C535A8557710A48D9E4789B4C42CA624C33AEAC31D3F09073D0C557092305575E75';
wwv_flow_imp.g_varchar2_table(25) := 'BAD4D4EB30D535741DAB52BFB1CA2915CE3B532C4102E9CCC8B7B2BCAE54F31B14F73600ACDDE99085B92C417ECA21A4B404D229A7A97E69FD3CF960DA15560DB5DECFD7BE2721E83E779575B8B22C1DDBDDB9D3EEB8FD9B76E1CEDB6DE7C21DBC8CEED3';
wwv_flow_imp.g_varchar2_table(26) := 'AF6576529DC0897200327E72EB6581AB8F9819E6F0D200ACD56E5B87EFB43D3D76ABD3A5E2740D184D4D06B1ACA294C2552A55746E845775A43726630FD205A8C7A825AE1E0D73D23CFBDCFA4F5A75038D516F3AFABCD710EC08E36A7230FE4BF825AC32';
wwv_flow_imp.g_varchar2_table(27) := 'AEA3184BB827C5010D3A50F66A07E9913C95CF23CC796F66B034F407BDB4387F3E9B0E0A803B101890C89BB29BCC177D6D788F17D0A48770191D8574789F6FA70EF6F7E39BAB93E80492D9D9F107FD25564185189851F18B6225C9C8E0B20234C8368D5E';
wwv_flow_imp.g_varchar2_table(28) := '292081810E60CB3C9D410913082F030B857295F5CBA5A8744B69491B60CEAA90DC40723E5A45AC1644978C7BA23321BC60B41B9052B1B8D20FC843A48A4EEC192FD83426B36BFBA4F276DE1B9CAF8C2D478F1A53B5639083AC001EAA301A0080392F1A46';
wwv_flow_imp.g_varchar2_table(29) := '7581BA94D151592D0C06198D5FAB7D22E102B6C7239D8E7681FA57388123FC5B951A61338A6E46FBDA9A7FFBD92FBE261D4CCAD0ACEC81763262B2732D7335457154E8A82C4C4B9C125AFFE0A0D2B76C3B4C1A2864C53A0EC72DABD948718C81945B6850';
wwv_flow_imp.g_varchar2_table(30) := '9E8C8E41F41164F8016070CE000CEB04D7E371A669BC2190059BE4944630E339F1CC6C34D680344D1FC7561E32AE9AA5641D650A8CE8D160B18E3C517E186954DA390CCB87C9C08DF5D642522583FCCD4A2A4B70D5E92F2FEBF579BBF8A805484E40B291';
wwv_flow_imp.g_varchar2_table(31) := '13C85B8EE6B908D6F1192FD27B45B0BAF177CEBDCC120534293215C26A81F66681422FAB81AA9294F59EEFB789B32CC6B4C7F3651082585AEEA1D1003D67F46F50264E89B437F493DE28264D8EE74FDD6778A6568E47DA075C99E50812D0866C816C0E32';
wwv_flow_imp.g_varchar2_table(32) := 'CBCE0081F929CB461ED79DD2B0ED8832990C8B730460AEC1011883EA990C3F191D957832AC3844C6D59D0B71C90933197EC4D920274E3AD3CA40DAD536AC1B66C854CE47455D460F78D1CB7CFCAD0AA6C7FE39110E802C7A99F37EA8E7E28A0CB54F6629';
wwv_flow_imp.g_varchar2_table(33) := '55B98C8102B784F99EFDCAB634059CE9EFDF2D0921EB9B56D0A46AF12C894D95424A03B0B28629AFAFB33790F4F1C36746630B8C250A197DB7BB6D7AF7AD54AB50D926B83EEF0B42C283B22DA6D4C24065541EF04A66C6483DE710D3043AA3B3498A479F';
wwv_flow_imp.g_varchar2_table(34) := '0DFA7E879978E77C9D7766004CEFE7AD1602E90CD28B5AFDA245C019804A37CFA324583FAC24DFB5E3209B4755CC4986142E73D58FA7036FB73BB132238D3AC6657420DA05F0F5E0B11F055CA4EC181F64C2356630E7BC19534B42A0518869655520F315';
wwv_flow_imp.g_varchar2_table(35) := 'CBF2B41480E5AF90460255DFBEFEFA8B8298D67791B6300517E231A08A2D9D8F5A4453E03C9557044477C75CB11AC9D9B4B89B515B8CE4C1803BA349E3066E33026104EB884BE9CC48B8B11B76E218D0B0A6F5D5389A4F48E89F063FAD2DE22900405D00';
wwv_flow_imp.g_varchar2_table(36) := 'C65513806967643692A93164741CEACFECA13ECE55F10A198734B81A2D9479A8CF99FC127C3DCA91B5E8041CE7A436398A5E7114951350DD71C6DACCD64B8A8CBF64821393C7F9CFD7283D3AD6BABF9D8F4E090EA82295E164F4C0F361980D152878C526';
wwv_flow_imp.g_varchar2_table(37) := '48D49458B39002A4B0D1608B153BAF77D66AB70DC8E906608ECA038C44A595B949E1237E2AA78E4FB682A07126A1E97377B6B7BB6B7B7CEDB5B7BBC30B30DE7E4F029EA33EC8A034018335C9AD44E168A46A2FCB4A03F9D7C40FB52D14E3F8F51EA407A8';
wwv_flow_imp.g_varchar2_table(38) := '544A8681721F56325F290F1BCC243B45EF7D5E4BD83EDFE664B90EEA28B0D25D403EC8FCCF9156CDDFE74820019843C1241B059D9B46A5C572004C5B30005606C9B8CF956D92C04AB855A4A0B256F070F0C0DBE2B1BA68B4AA05E9F5E69CB33480E5B42E';
wwv_flow_imp.g_varchar2_table(39) := 'D058FA7CFDA53485A3A7E48783542A972F042AAB628A41E5FDBD3DD31F62F57B7B36E06EA4CF2389DE79C73A2AB760D23EF3E473030E265179E76D24B17A6F987755FEC8890E78BC5B665C9B11448F436D3CCA2B30965D8332F1A14C357AE74CF24BF530';
wwv_flow_imp.g_varchar2_table(40) := '23CF0674A01416E7195E56EDB1DE925BEF70A3D1D2D5BFAC852739A8893E04CB726F59822D948AF9950EC417E8002A7587280030008D18EA8A63717B5EBB03203D5A518440683CCF9CCAA711207EC5A4329B70A11912C534764BBA2C9115EF33523DEA9A';
wwv_flow_imp.g_varchar2_table(41) := '5116FA1E7EA0131AD5E6393902DD74F7A9DC21A5236F9EF80CE201E14B1B8A32ABCD37ED3CD65EF44F6196C9BB06DE1B99889A231FD2CB714D8169A87049956680332767C6B948AE2A5B11FA72029C338BC7BA0BA0C5918413F2F162568D16194736D560';
wwv_flow_imp.g_varchar2_table(42) := 'A76BB970D6509A70860605AEC3CD53766E320B538197B8A428F96A97D748E947B4C07CB955CE895D5C0000100049444154B451109EFA38C2D1C4978C065AF6ACF729EB174AA9DC5AA9D42730AF4BD4908CA1FA3CE672C8A8D807FB3BA6AFE90A3E6F9BFD';
wwv_flow_imp.g_varchar2_table(43) := '8C3889DF0C064CE1A999C9B18269FAC9A423B17F5ABB58DE796740153300D6792202E3E8231D2A4B9269C9A3B2CE0CE6BC3714FAE1BC37CFBB1C20C7237A07DCC51943790C6676ED1FB7F6118B019B26EDBC372B18644508F49259A3C2E500AE60705E1A';
wwv_flow_imp.g_varchar2_table(44) := '7FE602C8993E6CA5F12FA29CC37E4D991ABD250880C298EB63731FC0395911321A4CA93CEC6239BD4563910883732DB246B9A2922B8E56DAB214531AC0685E8405636C58CD4346AAF36B1D1BE04C3F3DD6DD3E6BA233E3FC0EF6F72C3A0BD25987AF9745';
wwv_flow_imp.g_varchar2_table(45) := '73C6737CAC27CD5365CA7634C83C504752A38CB8167EA0B107B803A8D3249D0CD4237508E47BC6392B5F469269CE519FCB0AA67AAB636A603EB0EFC1FE3E45AF25C056720F604B84637100DAFE37D12A8601E32489B9814C6EEA33BB0EE66A0A9311D7F2';
wwv_flow_imp.g_varchar2_table(46) := 'F86CFE40610375A5E27A41E1CF8F8490C4E1BC9469848B5388E76FB60E3F5225F14A15F99C47F0AA3B6CEC4F58659D77A68BCB1657B876A76D0A8173EC1DEC59A81986DAEA51B0C69BFC7AFDA2E58CF72B418C59B423E1A57793B815771C7402041B7EC2';
wwv_flow_imp.g_varchar2_table(47) := '4072CC8B81730D0DE306D6E710F9D3D121689CBCA4856010FFD02BB02F6DE2589CC0B8B595D41D61DAB4FA6B38005C355B560F52A252B195AFB74F2B13A50135D192E1A638ADE35C6D35BCB53E00ACC55740C0084E463AA02149E8026F5ACD545F8F8E4E';
wwv_flow_imp.g_varchar2_table(48) := '0C48C5152CD3AA573130622F944E789361EBE8962A0FB85BE108637D1D15DB7B6F207D5AE5E07C8491CCF4474C4A63C58487DA15D52C4ECDA45B008AEA9044D1971417CA3AF2D71A700A09D8E63D1D5BD21EC8E740DE07EA5188BB9726CEA8F72802B076';
wwv_flow_imp.g_varchar2_table(49) := 'F19D80B2B6A76F76B230C926D874A49F54A38E74A012F9344F07C05AED71079091D919959D3ED33232BCC41553F69924B8D86E300079B67846A1D5F1146D3313CA59FD89D49C9FCD3E198459323EC7CD520760F3052725E40A0B24B8D835C5955111899E';
wwv_flow_imp.g_varchar2_table(50) := 'B566820766D31781F900A027E3E48FC6AA3B4E00E6A2C1ABBF19E0CCC7CBB4BCAC23C3806F066C42102FB3C29026808C55C71599E3D61B063A53970CA837D6CA882B7A4EA3192C9F8335078EE56B8E5CBA583A9C40FD6CEA58C709C03C656849108E407D';
wwv_flow_imp.g_varchar2_table(51) := '60D5B15C06CEAF21A470459FA95B1D310DA8921528D4AC3F88BA176A5B4547C328C5B8087D618EB369133EDABF052AACDA80D9233BEFCD330ABE8C19152630AA9CD168958EE2649CB9F254DBA54065DF2C3AC9BC04E70DA8C2E62DCD4F60162C674E39D4';
wwv_flow_imp.g_varchar2_table(52) := '7B0330E79D9501405E2ED0699E3DBE154869B324480EA1E067523D3D4BDC308CC390BE8C71BCA1A9A6DA1FD12134C1591CC97B6FCE79B358A2F9931DBA83D1FCC2980C2D06EF5D4CD38793BE3AE1C96B03E9CD7207A08AA9B621804971D9FA710A97C534';
wwv_flow_imp.g_varchar2_table(53) := '673F6E757E601A28E0CCB7B9DD4A81C8A401BD7B4605D75F7F954D8205AA822CDB66A5814213F367C1D5DB17ED2381B7F4D78A099D19B7D2FA365846C5EF735EE5189A4F996F4A3D5756E7AA3BA4815657F227C2131F55D39CF3E61963DDBC0FD1378595';
wwv_flow_imp.g_varchar2_table(54) := '1A823ADF800DE6E02D0D9E343AE12B2A33CE51F36DE41DE5207E14A07325000955AC418B46F1B4563DB32854E23D40BC13A00158B7BB6DCEB902225896F54D177903EA6551394C223EF2615831CCC07C229BC085403A1048FC2CDBB02308E56C8E00F544';
wwv_flow_imp.g_varchar2_table(55) := '9453BD1C006BD1DB8A81290631399E97C8A8584F38E77DCC4E7B00142A1AA659E299D6B9D6260308D1C8F20658035E1B0F12B8D719326992E16A3EFA428884AF263867A456D9C608C0DA9DAA7354DF52E907542675745430E1527EDEE8E2D84DA36BD6C4';
wwv_flow_imp.g_varchar2_table(56) := '12F955E4592C3F7030006531A611175CCCEB211AFBBD8378E12507A5BA3266A459B12C1319B3557CACA87C40DC40134CE0EE2CFF7B824A87990518809950CE7BF2BF6B04B632C479353800E73DC1508255527DDF0018B549A70A194EB58D0A9215154652';
wwv_flow_imp.g_varchar2_table(57) := '5A11C2696878FEBF665A7BD9E67CDBA4446539A65440315BCAA4B2D8E76BE729D537C5315C04121E4566E7FF9086408555078DEFBC5776669431B6EABB002ACDC1FEAE95F88404A03812C5505D1A0198E759349D8FFAF7B9A33086ACD84A7AF2051085AC';
wwv_flow_imp.g_varchar2_table(58) := '5CE0233ACDAAFD0AC5B48C736F3A35C5D5BF3696F03857E54DC6F9EA37FEF567C69604DD119009790DF1385FED9737549F000C40B59225B9278DC3EC421F00C447DECFE805C0DA9D8EB53C9D30F30217FF87F4ABA2884E0EB58029AA6202C03CE708C9DA';
wwv_flow_imp.g_varchar2_table(59) := 'F29051A74ABA69236B7502B3679DD3B8D6A718148F0164D6A4819DF3D6A6314C6A2FEB011880B2384C83147A589A3F531A847A380A59E9AC08507178ACD1FFC927E36884278CD77C9836B6179500ACD5EE0EE7A4796474003A1A05EE4E40C56AF3A61918';
wwv_flow_imp.g_varchar2_table(60) := '9F73816262E2D8B7DE4DCA19576DE28E69AD37B803A855190093FCE0BCA541BB9EFD9D1DBEBED47D4E30F132FD8D0651EC79CC49FB2C94A74C85739E3E00229D8205986F9887DAEA1170D6D9DA32BDDD31F6ABB7AB0CC03CE701C09A82F406C978B90C73';
wwv_flow_imp.g_varchar2_table(61) := '9E90C72F6BEA33ADEE306D6B75008B9C71C4605F53A0E144C958194B5DC186EDB50CE00C8C6975A6DF84A3C2A47533F3844F150CCECDEC9202B4BB5D2A4EC7809A62B0EC3857AF9521EDD09007602D3A13C197CD720007FB7B66442BC333C2D812C135CC';
wwv_flow_imp.g_varchar2_table(62) := '27F08CAE953FE8D180D339DF506BE66900BEA16DC0FB8083BD1DEBEDEFDBFEEE0E17CFF4ABD13039219B2320CA13639081ABA94DA035054662804634D023059892D7DCF4C5A7B61CAD7306B07712D53E892F420BF67148F826BDA21357DB1CA447B0553D';
wwv_flow_imp.g_varchar2_table(63) := 'DCAA10CD8967EEED8DA70275B7CED81823C9E80E57C07667B40ACE1A1B14B663ACC069BF58A9985D5097C0AD6C84241DC062EC7384EF6E6D5BB77B8646DC31CF392AB65B9DF863A6CEB9887AD6437DF25D400E9F7175D656BAC51D44A7B3650066A1686C';
wwv_flow_imp.g_varchar2_table(64) := '775E4A59ED9B513165FC1AA3B19355E14B18CDA5C395D2353801D1BABFBF63FD7EF57F6F0260CE8B069B191C7985BA4CD92BC898E4B4989FF703389351CE0B2F38C9606BFBAC9DD10FD16E9FB30E7555E5ED33E7ACCBE8FCE4790030AF631AE7604518F0';
wwv_flow_imp.g_varchar2_table(65) := 'F816A2F3CAE6B691A2EBA11277A8DE0B745EE66C23267568303276315C4ADFE54D6CBBBB6552807987CF055C1588981DA82CF3E2887084CFB7C4C6F1BD0188D58B3C0058ABD3B12E15A6BB7DC662E41C35D745F0B43BEDE834C417C576A713BF8EBB085F';
wwv_flow_imp.g_varchar2_table(66) := 'EAE301E3EA201EC55D0081E50099543ED3C6135D9D05E6E6E9C00054F04F2A38EF0D68802591810E7152BFA67A00CDB89A806B75CE793AF3B675C8FF569B4E9D7370C457031B2B8A370E7E581F68FC3AC66583CC7EF327FFA7B5398171890F495A7966A9';
wwv_flow_imp.g_varchar2_table(67) := '49B5C9D40E8D5EDEB54B65EA2C68FC9A0500030565061B86C498877533321252B94593E0136C337A569B0198A3F7F7BE659E11CCDB820170D6A2D2892F8A1DF2C8C539DAD2010E0660AC7FE9F4C61A58E1483B30DE874DF1D36ECB38B6CCCDA00D806907';
wwv_flow_imp.g_varchar2_table(68) := '034CC61511160F17C76D525FEE5728DB026CAE0468C23357D704683EBACB0E92798BBB80B2ACF4E0609FBBA29EE9D705559E271E166615333F2C0D33FB4BD8CE7B533A13B80100A072F99631A9B4CAE3562A661472782E3144E45BDE24C4195D8EBCD979';
wwv_flow_imp.g_varchar2_table(69) := 'F245910671F8C1401EB90A1A9A533CA7C72340CDB00037070F602D3A71FD9F0D72529E37E8CE7B932C1D9D82A75C5AED2E77426709D7AE8C3DBD006BF31858871189031D5B94A93726E5C06302256980330049CB7AB200E98F8B991F0EA8E396DE0C39B3';
wwv_flow_imp.g_varchar2_table(70) := 'A5164B5B2270AC257A2DD165910BC025D0CFECE2BCAB083A5041C4F0991D1300BD67CF9506C4E59296BB4616E0BC6A8E24F2296EA935F3649E84757EA4BC494B63D6116F870ABF7DF69C6DF3CCDCE5F9593B972D9E97B778146A71EBDCD8714225006BD1';
wwv_flow_imp.g_varchar2_table(71) := '7980065C05097CBB50DEA8575BD292E645CF6644638E3B9FB46D5D7900BC3BD836CF79A4632284A95F964B610F9B77874570B1F4079C8131A577C08B97B8B2A59553F281F0521A33D85D3538EFAA530BC134EF6830498B385057DCA4B9310BC00098F3DE';
wwv_flow_imp.g_varchar2_table(72) := '64F09E5B60E75CAC03608B06EDC0BC1C47ADEF803B80ACBCAC9D80343FD6C8A9715CB80950475F2D3EC43B2DF2E4E8471B1F619D335FDBB6667C9A1695CC51E1000ADCCA10F84EBAF69F39944DB5540A952B8D99230E003588BB40917372AEC58954E7A6';
wwv_flow_imp.g_varchar2_table(73) := '6F612AB2A1F2F1C7A4B42911BA238221ADB2C01D8B8E6B75A795026574E6198F0100CC396FC7150098E6B07DE6BC75748FA3DD00EBE6A1671530EB7400ABA0F750387C837267FDF9AE5C0295A5BC003C141127B8B3CCC87B6780722342030D4ABB80510D';
wwv_flow_imp.g_varchar2_table(74) := '73209CF3CC1CEF07DC41383F4EC7A0DF2BBE7A3C4E9F1C43167708DC01B03F509DEF788FA3AF71A4A3A323128F449DCEF6DA164B77F4533B3923F8B11D80CDBF03E06B9AF20B2690F2339E9C99AD8E12CDADC59B7B9B6114DEB95920AB236A0A26194ED3';
wwv_flow_imp.g_varchar2_table(75) := '5144C780FD833DDE076463BDF59572ED10D4A07B04A527210230CDC7DCFA1C92B353140098D716CB4621D0B0B51D1CD58CE782CEC15A058B2600547E14A5C327113FC7383CA6C3630060AD56873A385D35200760ABE3C1B29403304F998A1EAB858CBB80';
wwv_flow_imp.g_varchar2_table(76) := 'DEC1417402258F07DCF1E98FB002E52E7077027631A2E3B8E274291F17554738AED7A551823FA3E1359D6F139098CDE8008CB046A56F52365B3204E2D47674C033A9F24BA2596937CF9D928F7C6A367047E39F64742B25644E64CE7BF374027570F1B3D7';
wwv_flow_imp.g_varchar2_table(77) := 'DBB383BD5D93E1EBEBD2FB7B3B36E02561098B35AEB6E598AB485785C3AD0AD1C58007D0EAD63229F0905E1920570529CBB0AE960934FE2C9E19CD8822F66F360D5B2868CC9D9D3B6CF782E2EDB673E7EDB64F65D58E446D0B215B2130005E4875E37B76';
wwv_flow_imp.g_varchar2_table(78) := 'E7BD791A97E7AEA0BB75C6B67946DD3E7B496C5BE19087422579EAFCECBC1FC31328BB5E6FDF76C967BD634F8DDFB99679CE0D588534C786BE282ADC4541E52A89A4B0BD6FD3904742CFC280ABC2E4BF23CF68FC8A910CF677541A2288C5651F818E4767';
wwv_flow_imp.g_varchar2_table(79) := 'D1D4D835468FE7D63DAE527D6E5F05B32CFEC3F673DC1AEB9B97DB7A5F2FA33F73D6F4C51BED0C1C770087C5BFEAFE9E3289F4319D0737E0E27C6C0541720A7434DA252A8DE515E05D078A53E7000058ABDD3150014A064B7083FE0177F8BC152E2B8B54';
wwv_flow_imp.g_varchar2_table(80) := '02EDF77AA6D4D8D7D1307CC34A53804F4D0018BC33C7089809AFD111A49DA43C031A7F6FBFF9022B853DEA3C00D2DA32478307C0E9E7D1561C40FCCE7B136F002C8DBDD3E95A676BCBBC9CC00C3C8289979D4B8F96772CE5B5C79D9BFEBA718FCE5BBBB8';
wwv_flow_imp.g_varchar2_table(81) := 'F4875E72C893F9BC4B38001970BF77600707FB7CF5D3A74D8D1B72CA7E3F3CE316B534C21E2F8B6478327409555178F5FFDEF5E91C04E9A8549DCE96B20BC7D676D7AE7CEC23ED69BFF27C7BC6FFEF57ED093FFF2CBBFC41F78F46159111B7739ED9DC00';
wwv_flow_imp.g_varchar2_table(82) := '34B66861C55DF603C02E7FE0FDED89CFF909FBE1FFFFAFD9D52F7DAEDDFF510FB7D65677C939C37481A9634AFE5FAB770AE7E5C8674530250CDF72C851383A9E25071A76EB51E764F47D1E33A427D2C3BCEE028F1D775A162F1BA7EBE310D99C995582B9';
wwv_flow_imp.g_varchar2_table(83) := '55223B0E5CDA42EB6CB7B77B81973D3BB6CBB4CF1554063C891E205702E7FD10245050F2DC07DC82CB11F4F6F7FE871DE600001000494441546D6FE74EEB0FB8FAD34108D0716571AD96B20BC53657A587FFF0D3ED7B9EF73376C5C3BFD32E7FC0FDED21';
wwv_flow_imp.g_varchar2_table(84) := '3FF0147BE6BFFE557B009D425C0169FCDA72C3A1C01D4C741485BB5CA239DFEF910FB3ABE9101FFCD427DA6557DED7EEFB88EFB2A7BCE0D9F6F0675C6DEDA59D8099706B97A7AF186F9F396F5B67CE9AF29DCE36770867ACBB75D63C65692B0832F6A0EF';
wwv_flow_imp.g_varchar2_table(85) := '885470050B3C12E8BE413F8B1E0AFDA9809C90C245ED00B44ACAF0A310C864315A0E4175BAF955FB243EEB2B989DEE365784110B329EF57553BC4BC3D7DFAB4B8046BC66304F8591813A94066A7387CB1F703F7BE0E31F65FAEBBDB21300DBBADB797BEC';
wwv_flow_imp.g_varchar2_table(86) := 'B37ED4CE5C7A376B7355D218ED762782682E3DEE6AA6CD21025EA48FAD4BCED9237EE4074D2930E269ABDBB1073CE1D176B7FB5F619247CEFFC52709C0B4C23BEFB92B685B8B7CEDD01177784C50BDAD20647C9B10694CBE210620DE2D38C78582BA1377';
wwv_flow_imp.g_varchar2_table(87) := '063C42AE60B8234131D2FE23417F744865207D32361A697D18325EC613BD2F3D71BDB92CE74E608B8AE2CD28382B83F28C000CDC26B63B1DAE1A0D3F4E52C24F49D5FF92FBDEDBCEDEFDB231280076C9BDEE6997DCFB5EE65B6D330793A202B958027725';
wwv_flow_imp.g_varchar2_table(88) := 'B376336348930AF58F7CE0AEE630781294C36C8F47A67DEEB614A3039EC2E761A72473F6EE979327971B80A436CF9EBB07DBEE7999EDF31E44DB6B3965C93950AE39C4F13F454B9F6F8FAA94C09CF35157DADD2EE7E6E8BF02EF7A0E726766272FE49A76';
wwv_flow_imp.g_varchar2_table(89) := 'F2E89A49512E80EA2FCAA813904F29D078F4FAE78067B430413901446FDDD9DA363903B35C19BDF7B1AC1DC2D6F639BE12DB36BFC4D6DF1840A36E73557374242C8E7D9CF7B675F68C39E7393A62AAA3861541C780B084E207CEFF80C7987D5E4A1DD090';
wwv_flow_imp.g_varchar2_table(90) := 'F67777AC47A35DC58E42C628A33F206F15F7F7774D638405E8144FE0735915531D268EBC6AD1E966DC91C571887F8FF42FCB8B21E215670683EA9B23AA93494F0044FD71DEC71105A7180B877CACBA7BB304563DCA11E00B346AC514B5E72ABA7DF63C0D';
wwv_flow_imp.g_varchar2_table(91) := '76CB00B029F06270CFF495D049CA0980DBEF4E7CBF7DFE6E97D9F9BB5D6E67CE5E12CB9DEE1605D9A2513AE23AC447A44CE90EE70B7A2DA66D1E07807CCC01B7998AB660E8D1D80F68A0E291624663DADFBB6017EEF8A6ED5CB8D30635E59D1F7D307DA9';
wwv_flow_imp.g_varchar2_table(92) := '26CB467F4311288B03EE327678741A5F15E7C75C814C7826D969BBBDC71DC71EE710E8DC2AB0C750100D19795A1F1A865805C0A48FC620D8F4C74F5975623EB9969D1872E62724A3028AB1650FD06064B05A3DDA9DAEB5DA1D03280CAE4A5A39144BD895';
wwv_flow_imp.g_varchar2_table(93) := 'A61C8203D9C46811C02606D2289A8D69199D6F99F3DE62D96CB47D4C6062DB9472C6799BCEA60D3032A6502A6F43FB34DC423BA053225956870BACEFD11104014DC10B90278C7CDAB440101AD18817BA4B97F3E9C9B1698C699D8FB82DE8E2AF810670F7';
wwv_flow_imp.g_varchar2_table(94) := 'A2A10158BEAB54C94C3C0B749479E9E43C2F4E0740C60FB88245452B78E96930BA440360CE796EEDB90B606A0CD920E316753F9EC7583CDC87F80198EFB4ED92FBDCD3EEFD90ABECBEBCD9BFEF231ECA5BEC86C8B64BEE732F33833505E7BDDDF3AA0756';
wwv_flow_imp.g_varchar2_table(95) := 'FA5EC957610F78CC77DB031EFDDD76E5A31E61F723EE2B8867E2186CAFB67DA7DDFF91DF15FB0B473D5EF9E847D87DBFFBBB181BE81DC3350E733FE2BEB2A04F743EE8B18FB207F26D86EAEE47BCF779D877D87D1FF19D8CE37D45E7151CE3EE0FBAD2C0';
wwv_flow_imp.g_varchar2_table(96) := 'B937F1447597DEF70A7BC0631E69DFF684C7D9B73DFE3111BFC612EDE2C57D1EFE1D76EFEFBC2ACA40BF840C90BF8AEABC8618E22E442E291D0C06B86185A33340A18382AFEBEC10F01833236A8F988840A35DD510FAEE7E460730C447C13BAE9AC33233';
wwv_flow_imp.g_varchar2_table(97) := '62BE6EEDCD605A09077C9DA70BB1C3D0A15753F778F083EC313FF9A3F68C7FF32FEC07FFE58BEDA92FFA457BCAF39FCDF8738DF1C9CFFD197BE0131E65910C1B0FED6EC71EF68CA755FBF255D80FBCF8B9F6F497BE20C61F78C9F3EC7B59F794E7378F31';
wwv_flow_imp.g_varchar2_table(98) := '5EFF6C4BFB9778D2F4FB66D03D8E331F5B743CED9F3FDF9EFE2F5E1069537AF5BF78BE3DED9FB3CCBAA731FFD45F7E0EE7339927C2FDB01FBEDA34F7718EB086F2FCF6A73C31CEE1FB5EF81CFBFE17FDD210FFD339C6D51C5FF5E2FD0FFE2F2FB667FC7F';
wwv_flow_imp.g_varchar2_table(99) := '5F6A8FF9891FB17B3CF881261911C3DC9F4043CEB8328745F5B36EFB0D2302304FBD04A483DC05F0F53457215B361C45BFB539006DC1336E3B176674C3ACB5A24B686593D8EBC86440B9BC1680F9C8FCD1147B3C172F3A3E00EB9C3D630F78FCA3ECEA5F';
wwv_flow_imp.g_varchar2_table(100) := 'A592FFDA0BECA1FFE8FBED32BECB3F73D9DD4CAFB1BAE7CE5897309362ABD3B18981F8DBDB5B63FDB7CE9FB5ADF3E78A78D6BAE718A78C511FBBDAFF5C81274917C437C4CF7E23BA0A7CB12EA197E521FC049AF5DD08E3DC27F1A5D5EDD896F014B13A9F';
wwv_flow_imp.g_varchar2_table(101) := 'B3911FA2E30C5FA15E76E5FDECA13FF403F6F45F7B2165F4FC282BC96C1A7E8D2B1DD2E5A2FE4E40A9F453F58789230DCCB138EFF30C9F5AB8E6F01B845CDFC7AD6B28BD5BDFB9F30ED3458E2E8A1635C4219DF4D4818EC474BE1D5632D3A04C00AC152F';
wwv_flow_imp.g_varchar2_table(102) := 'D472B104DE1BC811117ABE0FFBDF83DBF3C7FEE48FC46FABDDEBDB1F14571820C7371F920DD43A380020CAE65EDFFE6D5156714770D5036C9213C8B8EAEFF30D495FDFB5E06E52EFEB7779397AC03727CBEA26493070DB6F49F06E6462817A3BE03D49D2';
wwv_flow_imp.g_varchar2_table(103) := '7CECD911756B202570BBA5F7D1FB7CA5A38B9C8C425874587950796AFA81B9BA6A1760961B6C60A77EAF67F3047DE34F5FDED15776BFED7B1E1F5768438E679EFE1B9863E20065A4DDC7554F79BC3DF1E79F650F78DC234DB2AC53A3CB44C5B45E7AA56F';
wwv_flow_imp.g_varchar2_table(104) := '95EEEFEDC64BBBB46DEE7C4D45A03B01D2A4FED2DDFA98AA3FCEB8560710274A23CCB812F7785BDCA7F78D750B3E323A92FA0E40C6DD84C6796FC0482A1A7B126CD95F5E5CC6AF55E4B22BEF6BCEFBB269935E241C70DEDB653C1A3C96F73592A5643A22';
wwv_flow_imp.g_varchar2_table(105) := '9DAF32792714A21E8D6A95539D7603325419ACEA9A62E00E745AFBB00F750F28CC8C1D9659F484EBA86241D951A16FC04B86A8568C38D8DF2B3C2D39A3CAB922594F279282AA28C10565D206E60198F3230316CCB46D9814E58A873DC41EF1A3FF1F3B7B';
wwv_flow_imp.g_varchar2_table(106) := 'F7F16FEFD9265C541C900C25CBFB50A692AD881FF0AD50C66DBFF24D513AA238EDC24EED0DEA36866EB4F4A889BACBC54FB99312D7EA009C6B59BBB36540CE96400FACAFEB4A208B30243470BEA92EE2E458C0689A723519CF6214456CAE3FCE5C7A897D';
wwv_flow_imp.g_varchar2_table(107) := 'E7D39F6AE7EF79F77A536339F018D3E7B1425FF4688E3D9BA66C42AAD5A6B9EF81DD55EB3567CD7D5214CFFA07BD89F31FF4FA16F42E7E1282A4FEFC3DEF11652AD9AA3A50EFB2061D525B1905635360A447F55D68D9B79252D5013E8A4AF50B53F01660';
wwv_flow_imp.g_varchar2_table(108) := '6B4B4696B186217DAB659D4ED7BC6F73B49C29036EC5FAF12820D6B07AD647608A15389AF304A66A1440CFA203E13279FF311C6670CEBEFDFBBFC7EEFD5DDF11F3362910C7DE851DFBEC873E66EF7ECD1BEDBA3F7CADBDEB55AF617CF558BCEEBFBED63E';
wwv_flow_imp.g_varchar2_table(109) := 'F7B14F4CC264BDFD03BBE99D37B25F73FF77BD6A1CE7C55FF79A3867CD7D1263C433F1AE79AEE4D51FBDC6DEF3BA374619ECDD7981B6D820D002391CEC3E0F7D0865FBE42857ED3E8D4EA0686E4CE45CA8558D6DB152FDA907313FF501033082209971FC';
wwv_flow_imp.g_varchar2_table(110) := '51CDB1E6D6EB00E26B3958ABDD193245DE5037F30319E53CAC202F25D031D009C20060FA4E8025210AB70E4FB8F3F7BABB5DF53D8F33DFF20974353BE80FEC0B37DF6AAFFEDFFFBDFDF1BFFB4F76FD7F7B9DBDF70D6FB6F7BDF1AD8CD78EC50FBCE96DF6';
wwv_flow_imp.g_varchar2_table(111) := 'E55B3F639A6715535EEAF3D5E4A7DEF7217BDF9B9AFBBFEF8DE3382FFA3ACE5573D6DC732E549FE2D597C8B3F79377CD737DABBDF7F56FB6EBFEE875F6C7FFE77FB257FFDBDFB02F7EF2561E27ABDFCD4FB1FA768BB27D829DBBE7E5C57F7492B69AB55A';
wwv_flow_imp.g_varchar2_table(112) := '6DEAA41B560EB855979E0C2B6A19D158AB9A58A4CA266DC18CBBC6A46266F6280146333ECA510ADCB4B19873DE9BF32EE6F590478CABB20A4BC64C1E9917334DDD0167602CDB8265630629213DE8498FB36D1E014AB87ADAE7B6F3A6EBDE6DAFF9B7FFC1';
wwv_flow_imp.g_varchar2_table(113) := '3EF7D14FD8CEB76EE716B567DA8E0EFA7D9B1435BF3AAEB4ACB9CFC23109F745594F3E6ACE290FEAF94023993A37E29003D9B9FDF6288BD7FCDBFFCB3E71FD7B4C32AAE32ACBDB979EB7073DE131D412FD547828AB0D009D7EDB7CBB6D2C580C5C200647';
wwv_flow_imp.g_varchar2_table(114) := 'F4CA2E908238C60978B8E3A0C171AB0D8C565979D3F9BF1B00D3BF45E8A67C0DC0B04BC6B363880E635865DD4BCED9031FFF48D33160543BCA49216F7DCFFBED1DBFF30776E737BE39E64046909BDCBA391068AC77DCF60D7BFB6FFFBE7DEABD1F30C9AA';
wwv_flow_imp.g_varchar2_table(115) := '89067011B89232AE7F494832F7DE5BBBDD3500B1AB70F68A5F828A15877AE4384B1419E9B513E2048EC5010030311C2819134CDE564CB7390250F61B014BE891AFA3AA614E0296D3292B028D3FA4C0C4778F075D69DDF3E74A90B1F47F7CF9AFEDDDAF7D';
wwv_flow_imp.g_varchar2_table(116) := 'A3EDDC71E758DBB40A8D336DB553FB60DEE3CFB4812EB236F144739F44B6764496CA68126052BF73FB9DA63B99BFFFCADF24B549966AB37DC979BBC7550F4A2A8D46EF62F4CE512F5B5606D1A8589667A5A33DC5081200716358116134AF9819561F5BC6';
wwv_flow_imp.g_varchar2_table(117) := 'AD73E4DCF3E5233AEFC998D1F08137F362F634A5C87B5AD16FC4546398D60FF4FC720204CB3F14801C465E30036077BBEFBDCDF39C680D415BD1CF7CF02376DB57FFAEA1757A55C6ADECB7FEE1EBA64BC32648D5DFFEF56F3435DDA5EB6EE78AADB9374D';
wwv_flow_imp.g_varchar2_table(118) := '7297977ADFFA87AFF1A83CF94CDFD44F755FFFEADFDA673EF01193CC54AE47DFE9D865F7BF22CABC6C0360513F80781750D6CB01F5FA3D26735A2BC1027797C3FE658678CBECA2E951C38F2CF0A847127E1A831245AF0B417A5CE5CBA86F0996F9692980';
wwv_flow_imp.g_varchar2_table(119) := 'C6E68C67B6264720E8385ED22FC45D80CE82668E977EDD73E72CDD25A403ECEFECDA3F705599A45429EC589ECEE6AF3FFB97F6859B3E69F5955EB7E09F7AFF87EC9B7FFF0F63DDEEEA15DFFCFBAFD1503F1CDF82A473CDB81BFAC2C73F697FFD179F5B6A';
wwv_flow_imp.g_varchar2_table(120) := '97AC9D8364B5BFBB97A21DE61DDF086C9D3F6FE9B7031DF50240740A2DDE0338E787F0BAA05E849040790F3B3765D89E71B1A3AF686A5D7BDD5A1D40A89D7BF45A309DF1201A706E94697D9AA79C0C0E66FC582D90B7B59AA20858F4F0455189FEA0A884';
wwv_flow_imp.g_varchar2_table(121) := '579BA7E0AD09A999F5F93E7AF78E3B2CDDC1B07AEECFB7BE769BDDF89A37D8276F7CAF7D9DBB88DBBF7E9B7DF5735FB0F7F04871C37FFB63E23F981BD75D05503FBA7ADD7F7D1D5FE5BDC9BEFAF92F9A78A2D5FB1337FCB9E9A875FB92BB2219E02E8F69';
wwv_flow_imp.g_varchar2_table(122) := '7DBE5D69E215006B753BE65CA1FA2C233178A30E44BD64BD31042E5AD2156697FE60E99E47DFB1E0C2D10FA41132AEBAA537052808BE7A517D19033DA35680B2DC9CC20067686854FF86EA58E524648E190B7C6414AC948559E282414E853995EB31235D';
wwv_flow_imp.g_varchar2_table(123) := '03BEFEE35EB0DE34573970ACBFFDDC17EDDA57FCBEBDFEDFFF677BC3BFFF4D7BC36FFC97A8FCF11DF65C58EE7A409ABB9C60E40779F2FA7FF79FC9A357DADFD2218867CBCC58321DF47A36CD681D8D1FC8B103300079814F00E67DCBC07FC6A0454BAF04';
wwv_flow_imp.g_varchar2_table(124) := '995DEA031013C75BAAF31A3AB9358C311C42C249370191D10973B42DEA731730ECB0C24C2E743FC418E88C148715479C09DC6EE89578AC76970000100049444154D5976FF9B4FDE5476F8A4AAE23C0110F7BE2D18B073278F1E4CB7CF7AFD55BBC3A0CE1';
wwv_flow_imp.g_varchar2_table(125) := 'D2A372A1998507044061ECCCC68FE36281422FE5889A172544D8B91E7402295CE03DC13C734CFB1C557EBD0E6090A5F61FE7D4F26D030A66D248067C9F3E537882578C18E67F78A7E916639192C0957DFEDE1BC853C301EA1650EA09B591069B5137D3F9';
wwv_flow_imp.g_varchar2_table(126) := '3BED181398B4AD9E07401D97EEE52DC178CCADE1CB5BD6FF1C51B586B1038DAEBE8D6E75DA46EE581902B7CB036DB7CB8A8694EC642D18AB9FBA90AAAD66CEFB74281B70AC3ACCA6BCE1808C1BC0901141BBC5315D51BBE2106C624650809E3948A0F12B';
wwv_flow_imp.g_varchar2_table(127) := 'E6A5E37DAED501C8F8EBE7296DB714476C089671655E86418182D218235CD59CC368BADA26366FEDAA7D36A5D3C701504F80BAC172D55E92158DF8B4182E896F95DD4616B14AAC5370051E03D26600963A8040EF38E0AB205B22046ED564D813BBA6DB36';
wwv_flow_imp.g_varchar2_table(128) := '8E33EDA268228E4DC3A9E0808CD62C7702D249E9962D1BA8E3C0C8D484CFB4584DC1B7AEA611556B1851C6D9AF19B718E3F91EDEC8A492844C3B80B12D57D93A390D415F1CD128CD30CE39CB459AB7E7F0797EAE6742E35CF01BA0F573606119C1CA0BBF';
wwv_flow_imp.g_varchar2_table(129) := '94D8A82B5A305819B85A87390D166087DA0780A1C0159BB4F870B18AF9637EB8B58ECF898706C3069C3960488A60026187157366D4254C65EC688C12653ECE64A72138FDF5E215573DC8AE7AE423ECAA476DE289E601652459496692DDCC489500F8A801';
wwv_flow_imp.g_varchar2_table(130) := '02309475548F40BDCD75A5AC6C48D9015C641A5AC6AA844B71AC61CD15EB750071723C4BC952633E7FE4DED6E7053E33325B91D9053F81F707C43FA517E86CD2E68C3B12CA37AD1ACB9FB9E49C7DEFB37ECCFED9AFBF98F1259BF8EB2799072F8EB292CC';
wwv_flow_imp.g_varchar2_table(131) := 'C604D950018399C3580BA29E94F5D4AB39760030108F2293FA870E25AD0ADC55A4E5E3CAAFDD01C8F6EBC60D32DBF1DDEB880981863CB0653CA43CF5084F351745C3B1AAB5B34BCE7B3B7FF9A576D97DEEB58917010F242BE7470BCA34094BF760180301';
wwv_flow_imp.g_varchar2_table(132) := '57726054AF85822F0413382D1B8AA32A5087473D927A66E30574828F0A3E51BF09BEB6CFDA1D806696C90B2893445767B8EE011AE0922E13B255A1D481EACE3ECCE1D9EB3836E5BB0E07505788626A004D993A59142DA39E64893E663A6A26E512EE624B';
wwv_flow_imp.g_varchar2_table(133) := '8FC101047ABEEA361D80395FF5D8F2B861D50CD638F4D29684958F91E0DE642F060ED0D02790D94A7592BAA8AF184B5FCA38A1DBC4EAC9234DEC72E40DC7E000B891E2195F4C4C67078894118BD49E711790C2947900C64F591CA65AFB532F3D6C4833B5';
wwv_flow_imp.g_varchar2_table(134) := '8E81B49C90E3584AE5267F023850FFEFE6FABD9E495FA49B813B823A89814EA25E17CBD4B97804888593F590D5AD9522F1A88951F108906CB9E82622B31B892343E9021A9B9A70A7801A272DE70E43AE23ADDDE44F3B070098F72D4B579A8C0B927EB94A';
wwv_flow_imp.g_varchar2_table(135) := 'BA694D814E61A226115FDA25EA9D8C21AD34B37517D7EE00C4BC4046D5270AC03C190EC0CA904DF8C320D051289670C394DCE70163586CCC24F8D51EB40350665AA4A032BE2DD0DF9A5762BF6F5911074C27B595304AEB70AA9B152B7D340EE3B43EF3D0';
wwv_flow_imp.g_varchar2_table(136) := 'A1FE15BCBDBEC5F214DC65FBBCF8354619635F8D518F53C62BFB4E4B235EE28834318DB094D52A7675002CFD5B15E9EDC1FE8EF57A078D8B93AB1D2F5395CAF575A4DB813A95B61F57FE181CC0E4A9FAE4CC25064DFAAEBEA360108F0C0DB87439D350AD';
wwv_flow_imp.g_varchar2_table(137) := '2A0056DF8A053A23FA0D9B160E7677ED73EFFD907DFC8DD70EE34DCC7FF22D7F66B7BEED3ABB85F1E637BF63D826B84FBCE9ED76CBB5EF8AED8251BCE5DAEBECE637FFE908EE4DD756DA05538FB1CF9F547197E3D6616F25FE5BDEFAAE117ED228BA84A3';
wwv_flow_imp.g_varchar2_table(138) := '0E2B9A8547B4965134DF5AA3B9D28F6D9A7709AFF4136F7A1BE779DDD47968AC9BDFF2A77613E7FBF1222AFF893F79BB4D1D8F7CAD8CDF50D67C45B768116F35D6973E7C931DECED4E13E9DC6DAD76DB80AAE1F6F6F72CE36E204502D059743A15D87ABB';
wwv_flow_imp.g_varchar2_table(139) := '8DD0701DD452354BF3520C47933F590EA0A52DD788247D55374CF09480B8A99832864CA54193BB6965355FEBC71E04AF5E4A563B98ED5FD8B5BF78F7FBECA37FFC27A3F8FA379B144F46F4491AF54D6F7CFBA84D70AF7F8BDD4CC38DED741479FAA72603';
wwv_flow_imp.g_varchar2_table(140) := '2AF17C8C3079FD9FD9C434E27EDB08F7EBDE6C37D1E86E7EF3789F9B398EDA4AFC4A3FF1A67734E3567FE2164C193FFE86B79AE63289969B23FC9B47B4709E9A83EA27F551FD2D1CEBD6B7BC33F2EBA6375C6B8A37FFC99F92AE77E691ED825B2A92A68F';
wwv_flow_imp.g_varchar2_table(141) := 'BFFEAD91A64FD0E17D92B8BEF4818F5A6FA7F91781EAB29D55F6ADB6295A62BD633A499D124CFED3E2759DB4180010C348B7854331361EE36344D13112510E0D80CC6ED92864A6AD7713A3009829DA62415D9C4FA64D271C5FE9CC42434714785C18C560';
wwv_flow_imp.g_varchar2_table(142) := 'E0BFA01D87A2FA2730A25B78D55E4639346D5903F11861C13E817DA7458218000BEC53C6AC3F28CA745F95FE59515FA41CA3C56395310D1538F5134C992A9FF108D0E3CA166C1CB6ACA3A38CB872F810690AD1818631FC651FA6EC03EED83ADD6DDBDA3E';
wwv_flow_imp.g_varchar2_table(143) := '1B63BBD3B5961C3EDB24DFA9FD67E03632329016FD0D49E0024094AB380188F5E678DC14AD5EB4C69AFA832B3F79DCE98EFEC7AB3A84CA00CCB75B069058530851B7952BE371A489251CC7F0F53161DE794BC360C23D400A53C997FCAD54A605020C8540';
wwv_flow_imp.g_varchar2_table(144) := 'DDA5AA48795288B9F3441561894F8A12F3E5236A210DA62C17A91C43911D9B6B595F4FE19C29E6F5C18270E785B1674643282BE37107259165ED28059ADA68D0239095E600440300F27415C801E17211557EB116B32B7D38EAA40CDC510E29620074626D';
wwv_flow_imp.g_varchar2_table(145) := '6BD3F83D9D40DAD694F7AEC56A30E69F5417F29AF53F73CEAD7FDC8923E6AF5E464C8A2B6693C21384FCAFE26185AB31B90A90973C346D226051A833AE1ACC2EF401D45F31EFE6A824D4EEBC109FC1EA7FF83418F468BCA5538039DFB679820C59B184CD';
wwv_flow_imp.g_varchar2_table(146) := '78FE9CE404325D8011108069E5024634B27AF801C0F1BD1D3A108F59F318B68600C09C0C9329994B774EA74E1E84C4115A2D884743FECD413A006BF128D0D93A63DA09C0796BB5BBD6DD3E67DB67CF99DA6A4334165BDC45445AD92ABD1B2CA177ECBAD2';
wwv_flow_imp.g_varchar2_table(147) := '8F2C61A5080F830C401466C92463C8A4EC0DC274E696523B0E61A00001228F1FAEA8C4BFE8BA271A8121924837E022463DA46083E427A5558EEF9125790278EF4D91D9991F50C15D5C61F2F182E865AC77D418E58E49B4F8D8A70E552D0BAEAC110F84A3';
wwv_flow_imp.g_varchar2_table(148) := '2CCF933AF879C08E1426F287BC175FE404F43F36ED7EF3F6C63165FC17BE7E1B8F3BFDD8EED82F66E678B4E804BA74025BDB67ACBBB56D6D5E10CED16D04427D118EBC827AC7DDEDA2FCCEFBAEEEE956876A35980098F323A5229B782ED59FF9DA8A024C';
wwv_flow_imp.g_varchar2_table(149) := 'C66B65A041067962A665D53CA994AE0EA7F336901BA9DA648C19F10646299E7633AA57F434CE0A1DAA9C1085D2796F4A059291DEC0A87C1A65008163A94EB89B68545B1A234C89981E20F0BC9DB6CFCC8FA63B13F4A80064C49A87E61EE8182FFCC36DF6';
wwv_flow_imp.g_varchar2_table(150) := 'E50F7DDCF4F6261D53EDDFF8EADFD9E7DEFF619EBFF39D98733E05999A07609E7293113B3A655B3000305FFB7F317564135D764CE1443A003119C8354B0295215137E76351DE6D2AAC9405184D5D02D038DC3C4EED376A8479D7B2BA12B4285CB384001A';
wwv_flow_imp.g_varchar2_table(151) := 'A35E47C9F00F0EF6B838E54AE7B99244D8628E3633C05ADC3E1A0A9A8937F2A4E604FA7C3F5DCEC1710CCD73166ACD21A1985BE8B9391D510369EF58B5F687E6E969981A38CBFA34EE817DE1FD1FB14FBDFD7AFBC657BE6A3BDFFC96DDF9B5DBEC2B1FFF';
wwv_flow_imp.g_varchar2_table(152) := 'A45DF77FFFB6DDF90F5F279B344F98275F81F5CD41FCF6BE6D65901CCBFC71A485461DC7D093C794402D114AF492F4EC937BE42D12A35683BC34F9091A1220E81C263A001A555E9AFD046091C61AA8F32E2A545A3DE81FD8FEDE8E95FFE989739E5BC76E';
wwv_flow_imp.g_varchar2_table(153) := '63FFB45F3DAF7EDEFB61F5209E73A5C47995E6D02FB6949A9F77CE90374D7D56F9C5FD168F5CD33A8C46CCA11CC7C973C7F704271A79C3546F5A44497FFF800EE006BBE13FFD9EDDF81F5F6937FCDFBF6BEF79C51FD837FFE66FE988034160CE7B03D8C9';
wwv_flow_imp.g_varchar2_table(154) := 'D61B749C03F27107BC175AEFE8D5D15CB5B88612270E4C1FD6396FA962061A7F46859F87BA59B885C3D56888F83906970535CF8CA20F0D8AAFB13B9D2DF6CF85CB4C54B64C464507E3B8DA74F82AACDD99FC8511F59914D32FA5881F7202396C8867DAA0';
wwv_flow_imp.g_varchar2_table(155) := '715891D3E7999BFD91329650328B2CF2A1ACA9A6416D024AAA35E7A4784C59583E0FD8882766A277E7EBDFB0DBBEFC15FB16B7FEFB1776B8C3B118A802E6E90062618D0F0071DC926F92A3E8B4630A6EDDE3CA34E0609832B004930B3407D29977404FA9';
wwv_flow_imp.g_varchar2_table(156) := '552EAFA17029CA9A2E9A91B9CECF9E928C57D18641981487155332A0005BE61A1C803138EFADC3D7426A0740921C61BDB5E918B6796BDCEE746CD9E07D9BF87CECCEB5DA7A07FB269ED0B770877110F36A74DE71CCD97C286181029688323A5AE1545B3D';
wwv_flow_imp.g_varchar2_table(157) := 'B2B95E65918FC058FDBA2B1CE521BD09960DF950A7417A44B529AA612DF2B328AC3511ADA00DC44143B041E1B86379CD8F42F2EB1DD5C19BCD501AE7BD45E532066A9EB6B7942C0BF9474AAA9897464FE7FCA83025E7A830C0E2D30775DDB7BC296D420F';
wwv_flow_imp.g_varchar2_table(158) := 'C0F45E58B7C5DA0DE8C678FBCCB9786BAC319BFACC5B47D4E6B98B88F0E4C980E75D9DFB07DCFACB70550FC0227F6DBE00C0405E94D019F196F97A1AE29D43D5516A4EA8031E53D9EB1E20E45F9A6A2221A4179C80813AD60477D475E237E0E33019692A';
wwv_flow_imp.g_varchar2_table(159) := '65172BD6FC58DC020E4D20195F7ABF29B85A14261203CDFA7DAE723DF6C815302A634D59A5F820C43C1F1FF1CF0B9D6304609EFD5ABC60339BDCD7114E977C1DBE2A52EABC376032BCCD1B8843F8ACE40BE7AFFB8578D1C8955B689CF7D6E22E03808A33';
wwv_flow_imp.g_varchar2_table(160) := '2388CBB3CF109038272964D01160080873BE65C07CE3D81A82E6217202E7501F4E7559E2C072D8E3A11D80C991CB11682F2B7E57796B6B0BEB77009CBC737EE604C59CBAA11D70CBDBEFF54C82CC2ACA98A31353A9917961C653F8E7A1234503D2ADADFC';
wwv_flow_imp.g_varchar2_table(161) := 'BC63A47D579187C13C8D35F2857C340629B676005224DD117478C7E092159D20533F00CCB99619725508DC230B9FF05A2D88EF43DB82998F8EB006748C45B85CAF9A688F063624DECC1116C0B151EB353EE52902321E01068CCAAF3BE6525FD7A864B873';
wwv_flow_imp.g_varchar2_table(162) := 'CE80D98C0760ED0E6FCB9996E465DCEAEEEFEFC6FF4D372B56BCB24DA9A771289D27023019CC3CB0254C9BAFF97CB9052F2BE74C0118DC9211188E02C03A9D8E898F6525A0B9744CC61F9D43D990A4000C13C6F73CD228A2904D74AEB0113C5830E3EB35';
wwv_flow_imp.g_varchar2_table(163) := 'BDC6CC7760AAA9FC620EDBA77E8803804DA2616A3D3015F53C8D212E1839ED6630F10F383C5E5B3238EF4CFC567739D60177B8E91157F5EB886E1D83946388DD9EDBC6B23C2B7554C84E7402233265F8DAF666A9C704A2B3F05C91008D320BB31900D376';
wwv_flow_imp.g_varchar2_table(164) := '1ACEDBCC4094FA02473BD2C2C2CC0E5500FD11C8B77FFF93EDFBFFF973EDEA973E7FA1F8032F7D9E3DEA9F3DD3B62E393F44AA796E9F396F67CE5D62DB67999E65CA7B8669BCBDDFA31E66DFF7E25F6C1CFBE9BFFECBF6C3FFEBAFD833FFCDAFC6F843FF';
wwv_flow_imp.g_varchar2_table(165) := 'EA25F6B45F794101FB3C7BD22FFCA45D72C5BDB9F31A7D214B34383F07EF0AAAEF76DF7BDB539EFF7305CE4578F03C7BEA2F3FC7AE78D87718E8C00A74F4C9BF220000100049444154131399B876311500AEFC5A61D5A67A50AF14953FBE08EB76B7F2E1';
wwv_flow_imp.g_varchar2_table(166) := '495FEF60CF74CF35467B0E71644F7764981B11C3FC024A630C32523FCD6900D6E2AABC8C7102E03BF90E9DC174360025DCE2C6CF299894ED6E57DCCBEEFBF0EFB42B1EB158BCEF231E6A777FD095E66B5F3B957374CE9B276F9CF71A666A3C7BF965D188';
wwv_flow_imp.g_varchar2_table(167) := '9AC6D718F77FD4C3EDCA477F778CF77FD423ECBEDFFDD082D687DA3DBFE32A6B6D75AC5CA100986FB566F2CD92D039B36DF77EE8430A9C8BF0E0A1769FEF7A886D5F7637629B83FF34A6A0D59E293BC48F0C3FAF8B45F3CE9B63CC4B877F46FC1C4F63E8';
wwv_flow_imp.g_varchar2_table(168) := 'F8A1380B2B00D31D8AA7FCCC40D6063BD8A713E8F16D8EE8B7F504B79E61F2519C7371D27969BEA78CA7DDD196D78F75004003EEC6AD6FCEC8319099156DAEEA75E31AEF04131DE3F50BD40046391B808563EC68E301C8718DB734D410D6E0161E1B4044';
wwv_flow_imp.g_varchar2_table(169) := '36D0DF35C49C9914B7E5DB115751353381E99F19C074C168603F9B3FC8006594650F95E3B186F71B00B8602C467B89A729156E6DDF7511BBB7B713BFF4D53B38B07CBCA61EA33A0026FD033841568BC7FBBB3CE2D209B0B8968F5BCB281C04704BBD0A03';
wwv_flow_imp.g_varchar2_table(170) := '609E5BFBEEF619F3F496CE790AB063DDEDB3B6CDADAFFE2843F5B66470744A5D5E9C69A761063B4C90D025FCBDDD9DE8CD25509DEFB8741E06ED09E81B2CCE83AB9C23FFBB5B67ECD00EF1886625BA6494297A5D6A0E067A830473AE658BBC25B12941E3';
wwv_flow_imp.g_varchar2_table(171) := '1CF04E6A6FF74E3B8817D407F1BB1907FB7404BB174C8E614A77539B74BB95ECEE02DF5464E9F156404718D7E60064605A3996990B00F3BE655B67CED1E8CF333D1B3DA7E7D617389CD11A030003A01CE3721F096E9F86BF4FE1F77BFB7400BBB64725D8';
wwv_flow_imp.g_varchar2_table(172) := 'DBD931BDB908349EE5309F8C5EE28EF76DEB6C6DD3885CC1AF93415B49856804C0CBCA81C919AB5EC6A4AF618BFF8ECEBED3DD5A09EDC227DC3D1A7E885BF6D19E436D723A5A084A3A444B53144DAD1677B8D4E5A6F6A3AE73473D4089FFB08C0710154F';
wwv_flow_imp.g_varchar2_table(173) := '0C0360B05586C3619390F7F7762D2A1A95410AA0A8FA41FFC0B435ECAF715BB74ACEE4B8602D1E95B6CF9E35AD56C0E1F895E33C8227E9D2D144177E5A7DC5FF7D3AE501792FBDE96A17C9BB8B558C2CF9EACCAEB4099FEAB3AC6F7B3B17A2436A8229EB';
wwv_flow_imp.g_varchar2_table(174) := '3C69EA74B6CD796FA093522CDB8E3A5D9B0390008E7A32C7813FD0E0B50AE4069EAF0280A3A174CC73C53406298322B317E50780B5780CD3BC6058FF1CC8D679F807C0749FE39DB31E77617BDC81C9294BF73A3CB678DF326035F467DCA6677C2D6DF540';
wwv_flow_imp.g_varchar2_table(175) := 'FCFAAE88E7AA6EC6DD089D40FC15616EED6D4200C85F1E03B6B6CEE63F97D6EE4E805C7DF5DA1CC0EA493F1918B5D5EB53D9460A2A6176E2C56497DB65D01998AD46E9EC380395F4B0C3D38E974631D0F73EE63846C9D8DB5D1A100D6EC08B4BADA632C8';
wwv_flow_imp.g_varchar2_table(176) := 'DC81AD4E0E19E9C91A2604CA5AAFAE15458BF4428BC3A03F7A852A26D42300D34E20D24907666B0A1B077008464BB8DAFA67892638EF68FC5DF3DE9B042A27E028DC430C33D635E3AE232AA094902B91E818033A61155A3197254976DF2FBE013A0F8E36';
wwv_flow_imp.g_varchar2_table(177) := '57D0ADED73D6E1AA7F9617C5BA7F02304FD7B96064F7B943D217A3D22E8832773E97BDC63506CD5DBBC493282747FAEEE21F8A4B1AA4B8C2994A980329258DD1F87A2947CDD5BFD531E77C5EE4D373EBACC8EC4A3E32FE8378F3BC63BBDCE2CA01698BA9';
wwv_flow_imp.g_varchar2_table(178) := 'FA950C70044802F993D347592C855FFDB278ABAEDC3C287C3C57774D3B006075C6AFB103651EB8C3503E8D1AC6F398A13A007C45DD31636A0C031E17E4B4993D519FBBB40390D2C938F48A46B1C7F7B303AE9AAB9040A04311EE91F19B49D9DA6D0ADD46';
wwv_flow_imp.g_varchar2_table(179) := 'C1713B17B7755801AB35266F9DF379F478B9D4E71B86033BE0FBE78383BDF86592D1C8272847BA250B264B1325C31F2CF8755960B5865F121F68FCA17132887725259CF3DE7CE11002FB485F4263BFB2C7FA53B7FE218F7E44BDB3D6CAB8B37387EDF316';
wwv_flow_imp.g_varchar2_table(180) := '789F2B668C7B17782B7B874DBBBD9D973A79F38C173C297C9BABBD9C405AA7BC944051F9C3442990B69243A74305EF74B6B8C83853BDE6959D3005D37CA3F1F3A862DC09A8BC6C1CF05D7E46435AB6FFAAFAE5F3A96FFFCDF49A1B406598A81345DD806F';
wwv_flow_imp.g_varchar2_table(181) := '8442C8AC0270CC85BB9C0308DC9E1DECED4583085CED830CA288CA4B783DAE963A531E86F77AD594096F82440A90148759385893631802CC9911CD9A430407CCF32D835EAFEA920B66DC0DEC5BA65592F913F5219FC20A0C97684C323DEEB949C79A9C99';
wwv_flow_imp.g_varchar2_table(182) := 'A39C4D82480804770156548AFEC18CCB405B73B84B39808CABCCDEFE0E8D5FDBE19187069C79AECEBED88EC909E81CAD5744CBF03B5092199D0BF7DC4977700C6F404D032C0F13AAF3C6399E9ADB20EE38B41936F3AE655DBD6570CE5A3CEF3AE7E3975F';
wwv_flow_imp.g_varchar2_table(183) := 'B4F3097482768242E41779767892820D78963E3C9EE531C4B950F64DD3719039A1821CAC03CABA4019E53F475E013AC682283EC6E15737B404A32DB02EE652AC320C198A7E99A7D3DD36573A01AE488257BF147E9E7C605FC51416F4FE4029E8B425CF07';
wwv_flow_imp.g_varchar2_table(184) := '6A4CE0DB824A54DDACA83E829151E7B61F11FA68F4B9F8B4BBC8E705FAA481F5E2563301568F0247A443F9346A8C6991B0442C2C4BC5A0AD3FF10BC7C2F3E7D8A2597DB5EA668391635F8A981574CAB8D088963A2AC961AC8E3AE1E8A455AF790CE83C94';
wwv_flow_imp.g_varchar2_table(185) := '3F2931D7A09342CD21E810632B5BE402975EC5283AAE90329A167702B1898A35E07BE28C2B4A54D05839DF433B8820834CC081C9C69F71DBF737377FDA3EFAC76FB60FBDFAF5317EE4B56FCAFF93CC37BCCD6E7EE3E4A8FF7DF7F3EFFD90EDEFEC70B4DC';
wwv_flow_imp.g_varchar2_table(186) := 'A80198E603E46302304FC7C6847652AE9239AC15E11F3EFF65D37FD259198B63DFC4F8D1D7FD49A4A9A42D4D6F7AC3B5F6993F7BB75DF8DA370A4C4B2424E58EAF7DCD3ECE7996B83F465E7C8263DFACC8FA0A5D49F926B68B075FFBE25F59A013C9A2F1';
wwv_flow_imp.g_varchar2_table(187) := 'CD49031902C0649800CC14EDB041DAC20935A0013846AD5E559255591D48BF1C41593EEEF42EE100C4D07EEFC094A60C0510DFC903B96000963B5D039D4109B7BFCFE342CD98CBB64969A022D6C76ADAFE95FD337AFDBFFBF45FDAA7DE769D49996F7AE3';
wwv_flow_imp.g_varchar2_table(188) := 'B534866BED96B7BCD36E7DFBF576EBDB26C74FB1EDCB1FFAB8EDDF7941EB6844298572DEC57CF990732B155CE74C39C4B24DE96D7FF5D7F6E93FBBB13A16C7FEC49BDE6E1F7BC35B4C34DDF4A6B7D9ADD75E17A3F2AAFBE8EBDF629FBDE1BD76E1B64338';
wwv_flow_imp.g_varchar2_table(189) := '001270E7D7BF61B7BCFD9DF9389CFFCD6FF9B37CEEA461DAFC6FBDF65D76CB3B6EB0AF7FF92B51BE32BF8C464494533FAEE5ED1EDFF6007BFCCF3FCB9EF9BFFDBA3DFD7F7E913DF8A94FB4EEB9B353FB1DAA11D433C5140928A76207A06AAE3B1616D437';
wwv_flow_imp.g_varchar2_table(190) := 'F53BAA48EA8E0A7515AF269D71E24A653CCD3EB4DA67DE524685187025AF6CCB2808FD888719856249607DBBDD3620AF9771E67D1398995951AF3813700440C93B3A1E2616E75FD01CF3AC9C990ECD3F4709439E299E8E4AE6885FC550F059F9616C1843';
wwv_flow_imp.g_varchar2_table(191) := 'F2D05D8878A0F13D7747ED4EC75AE48F1C9AEA06DC25D58F55439C8B646AE347EA6B751AAF1E3544845546916C0F74C0CA4E8A2DCEE1018F7DA43DE5793F6B0FF9FE27DBA5F7BBC2EEFDD007DB137EF69FDAA37FE21FDBD625E726753D443DCC5106155A';
wwv_flow_imp.g_varchar2_table(192) := 'CDA2945CD4B5B22558C623A49D90B03607B0B7B76B7A25A7BF90D245558FEFB3A580ABE043541A2A7D8A4BEC4E5FC1946D004CDFD30685650C81C2E8F3E63C5019593CD28FC60444593E8C8C2BCFCD7E46A52F680428B6044FD9DBFBF212323F06841A4F';
wwv_flow_imp.g_varchar2_table(193) := '4A38A59A6F3F7E9129FF8AAA68D32B45E7BCC5E85B04D39D428E8B85E3F9709EC0886772F2A27D12318E7723F77BF4C3EDBB7FEC1FD9B97BDDC3000CA3EFB4ED018F7B94DDEF910F33CD77128EA9F572408C7518388E63A857C7B2C6528C053EA2DE17B2';
wwv_flow_imp.g_varchar2_table(194) := '64F1583F6E5DA3F77BFBD6E7E594628FAFE1F4E595DD0B7798DE6D4F13E83CF449D1EB38502872537F4F43512CDB32EE1EF25D4083644BA015A4520F706CA192FC073C1A28BFAAE85D6EB4C2971177A64154688C21CAA36CD21D822B9C2200F3342450A9';
wwv_flow_imp.g_varchar2_table(195) := '657019772BC2672B0BE404C798071D210DD073042D7AEAF2562B48FFFD1EF95DF6D89FFA313B7FEF7B8EF5134CABDD8A3B02CF54E545A33424901FF57ECE79E380D614009803CC18249240C72C3C2C1EFB676D0EA03E5309302323B505ED739B596F9FB7';
wwv_flow_imp.g_varchar2_table(196) := '9CE3D1CD7095A58ECA3055205CE120180E14241046293B8B47F791224851E208DC0AC6316361258FDC60735499704BDBF2E2D833E3363A23FF6303E9F2744C4C62518FBC9CAB47102C774AAA5F450440D1606E54006115D9435296CC99AD7CE4B0EEFFE8';
wwv_flow_imp.g_varchar2_table(197) := '47D8139FF313B67DB7F353F1C7FE4254C170B88273A471020AC01918F3E6C023A0F4352F1DF7D3AD9B0047C3F33C6B0239C3B4B21CF078D0E725DE52B450C9438372C230159DFE6E1C286156AC0D5346AE323CD86099E307910C494FC682F3068CE6A41F';
wwv_flow_imp.g_varchar2_table(198) := '994C9A2BD9101D445E05E33FF635A656045061B52B503188C7825761157148E37CC8444B74E802172D3579B7BA1D7BC0E31F654FF8B97F1A2FF90008B231F6F60FECB62F7D25F2BD1160666583AE703C47FE01CDE30230380AADC09D9197E269513CD664';
wwv_flow_imp.g_varchar2_table(199) := '44D51AC890F1EBE7B7BA5B67ACD5D277E61147CDB8121DF0365E69AC58E011C541A5A877016000EAD5C3B204E2BC1F960F9BC9B7DB919AA9A840454901A40C69799E3C0C04536452FF14731625B3F9292822601F449CCC271FCF63808A5CB34C742EAFB4';
wwv_flow_imp.g_varchar2_table(200) := '109AA523683C8EB144203A1455D656FE4A5EF87D37CFFCB356FEC141CF3EFF9E0FDA576FF98C051AA1FA2F1235A6F850EFA3D9810EB35E9F963507239F631DF535D49C58AC3F86C75A1D40BBDD352995A7E1B53B5D737E34FC80E7F0DEFEBE053267213E';
wwv_flow_imp.g_varchar2_table(201) := '103E37BE5AAF92D9B5EAB4E87D3B2D1E325F18D30C2C75B2B2905FC2CDE8365773AE887AE6E0D3941CDAB216C4280146FDD41B80792707C97AF1984EDA960C4445DD279EA5FBC350D2421C9A57A00101B02BBEFBBBEC51FFE41976EE9E77370E62938276';
wwv_flow_imp.g_varchar2_table(202) := '9A375FFB67F1F5EBFECEEE24B0D9F5E4C51810E90030565D56A8C991DF2544108EF9D4A5447164E9C8028F6C881CB1A300DB9D366594B3C1796FDDEEB6A541BFE2A23FDAD18A93D6CFCA4786D681F261EAB595B2F352F04AD5D2855C29A7770760DA0559';
wwv_flow_imp.g_varchar2_table(203) := '12D42F2936663515E7282AF66F04282BD9DEE2112B16A96472AA93EE351CE5A12858184C1FAB05E79D016C637D46073D09179BA77F8443713AD4C45651E0486F8AA2D56E9BCEFC4FF99F7EC6CE5C7EE990CE26240734F89BDF2AE37FABDD71DB6DF16D54';
wwv_flow_imp.g_varchar2_table(204) := 'D34ADED4B75E97F172B55EA757A670AE5E9D94618EFFAC08D257C5A278ACC934AA574A9894C94CA2B4180098E75D403C0A306F0C62CA8077014D4C66F3421F246335750460129CAD2888F6795081404894651145545F769FFA4971EBAB03D3E80266891F';
wwv_flow_imp.g_varchar2_table(205) := 'E60A5A335E04CEE3ACEC284294D568F6ADADAE3DF0498FB5C7FFDC3FB1F6F69601A3B6FAF0073B3BF6E9EBDE6D37BFF54FED808E404E4CF74D8AD37853C7539627F7994C43EC1BF998C3088762AC3FE6C72C0D581979801FC305C0F43FE9964A26808C67';
wwv_flow_imp.g_varchar2_table(206) := 'B3DEC1C1DC4781B893E26AA7BE699C87C11A17581B0B72F23867EF46638ACEC0ED6CDE38E1C93E40AE3C1320623500AB38007A00F133F228424C7BA0B1D1396F06B58543DE1CDDF91B000010004944415403D8A1022427D2A177F9577DCFE3ED913FF643';
wwv_flow_imp.g_varchar2_table(207) := '76E6B24BA7E2D405EB2DEFB8CE3EF1E677D8CE37BE398415BF7BFA1E4AC36A3E046ACA50CFC4CF7A13000350AFAE9401B6F39357064926CF1EF373A489474C88F3BE9149FAFFE5DABC1B4887D71764E6DF059099144CDA7F91BC93314A388B746A841D4A';
wwv_flow_imp.g_varchar2_table(208) := 'B7B135AD848CCA0A78D21EB8BAA6ED4D79A0806F6A4CEAF25DCD0896E8B9E84D7201793D000390601965BDE45614F3234551582421118171912E7558504E9EC79BAB9EFC787BE2CF3ECBCEDDE3F23A48A5DCE77DD2C7DFF056BBE98DD726C60F8BF236B1';
wwv_flow_imp.g_varchar2_table(209) := '245BF87721C4AD6C96B326EEFA476547FEC2A06C8C92F9617912111DF2B136078064F2159AC918E7E41C46A464BC705A5AD92AC867173C157C36D46C0860E20CC73AC34673A52A7235906AD9E440E399575948860118E20AE4E5B050CBCCF39775707ED8';
wwv_flow_imp.g_varchar2_table(210) := '2BE3EE8C5BB36179DE4CA49D739817BE09AED569DBB73FE589F67DCF7B8E6D5F72BE32C73A7C6F77CF3EF9F677992EFD0E982FDBA5679DEE19F6759C46B0FEA06703EE02227D25D0D494725A761E23914C1D61DD8DA9261EE9D8CE4DE680F3CEBCF795F1';
wwv_flow_imp.g_varchar2_table(211) := 'B57D8B0A57A99DBF10A8ACF308565F1D359B4C9B3506C12B8E1AA1F955AB468D490E8039CE97899521CCB103D05CA87E6597C92911C38DC4AA7E4DC0818E21D8EC2FA4081790E31BF0227012BEA63126D539D1C838A9BD5EDFDEEEDA554F79BC3DF9177F';
wwv_flow_imp.g_varchar2_table(212) := 'DAF47F0CD6DBD3726F6FDF3EF5CE1BEC93BCF43BB8A0BFA01CB5763A1DF37CB5D9E205A2697C1AB3BE8312A82B23A8C939CD5D7132C4C5D7924B761D748BE113C601150C4E0E606441FAF18B8C4A3AA14BA5BA19F55CE6620E9E71346E05F184421CAFD6';
wwv_flow_imp.g_varchar2_table(213) := '457330AB555A730008A7C8665119B8076076E227C25059678035F6CF262877AC17CED86B444F2C260F00E6BC37D0A938EFE932663B0D5B61F034DA073EE131F6F067FEA0CDFA4BBE3EEF8E3E7BDD9FDB2D6F7B97ED7EEBF62A1580C9D90330CFA304C039';
wwv_flow_imp.g_varchar2_table(214) := '9BF15EA36FF37E1335CCE1A889B2F193B1AFE45836061D2586FC2F6BD79FBAF50D9933BC713C36394F25633A6C277332AE38C3F2840C6474587E1A526C44E7336180866A92667563D4AAD600DA5805D25BC2E7B852D568EC12B7AC63833683566A431CA0';
wwv_flow_imp.g_varchar2_table(215) := '52150B191DC3B089C60020D6D71FAABEE49EF7B0C7FEB31FB1A7FDF3E7D9637FE2C7ECD2FB5F6140337CBDBFC61F3B37C7AEF15107AF94E1600F7CC2A3ED913FFE43F1CC0F4CEE93712BFFA9F8A7C5D7D9CE37BF55F06B84CE51C6CEB948B75EC53AB8D8';
wwv_flow_imp.g_varchar2_table(216) := '28FA06EC9B0D9911AB57F61822127EC5B282F9D9522F818F2ECDB97074F8879881C9C283C1BCAB9222E6F4FA47FFF3490047671CF4277F21276E1BB91219E12C0651A7180BA67AD4E8B72901005B1599702590313237F727DF3124E3577AC25CC46F3184';
wwv_flow_imp.g_varchar2_table(217) := 'B88B1A87CDA203C857738117D4C43EE9E35EDF7E95FDD0FFFA2FECF13FFD4FEDC14F79A23DE21FFFA03DF5979FC377F00F37ADA8296C535E06163856DA061A5F4A63DA56E65BE4F755DFFB047BD2CF3FCBB6EF764959DD98EACCFFA977DC107FEFA0B7BB';
wwv_flow_imp.g_varchar2_table(218) := '6B81AB6D1DD079CF2A309A79EFCC791FF37A645C6814955F2AC2997358AAEB7177AA5ADD315203E7CDA489560479482A8E14A8A8999800CB331F8081F6D1DBDBB349AB40ABDBE62BA74B28E49C5D759A6066708EE42B67B30308A738842401C3FC1C19DA';
wwv_flow_imp.g_varchar2_table(219) := '2DD9331110207E531408DD45CD2044BFA25AA7459DB71FFDAC7F6C77BBEF7D0CC030DEED3EF7B247FFC48FD8FD1EF95DE63CE5360D89DA6AC4023022B349A17366CBAE7AEA13EC51FFF487CDB5A6E397F17FEE3D1FB4BFB8EEBDD6DF3B300D559F1B0073';
wwv_flow_imp.g_varchar2_table(220) := '51BFAC0860B945129C29043961EE02945F26123DBB714E7C4EFC086806C8C4BE47D89073E008079817B573CEF26DD9884B81AB57A013988A838C05467DA6C24E680CD41ABD270E1394A0D5EDDA3DAE7AA0F96E870A162C234DA9C9022868B7B9434A3187';
wwv_flow_imp.g_varchar2_table(221) := '67BF14238B533E219E3FA6C0632456E1AE3B36CD9713198E80047E58C9CCE50FBA32CE1B48A96503CB97DCEB1EF6183A87073DE931367D2710AC323EFBC28DE823B6CA47EFF91FF4A4C7DAC39FF134DB3E7FDE8CF036216494D767AF7FAF7DFA4F6F1C9E';
wwv_flow_imp.g_varchar2_table(222) := 'F9038D3968D2691FE2907EC130ACD5AE0EC5AA2DF001770163FD86D0D333C008EF244840308A93208EA77EB224564C8F04300BA56FE9ABC255A8819C802454ADAE940ECB5600F6F52FFE155790FD0ADEB200C0EEFFA887DBBDBFE3AA58154853DD80A629';
wwv_flow_imp.g_varchar2_table(223) := '75EC943C0052AC58D65169B3DA2A5D369529C03EA502931F9394158039EF8D89E5818EA2F1EF0D582F0038C20AB70AD5B875FEDCC43636C4BFB9D72A7DE5631F6193566A926A191D6689592379AEC68072656D9E4A4764FC8FFAF11F8E5FEFD51879CBF8';
wwv_flow_imp.g_varchar2_table(224) := '53177EB7BCF59D766B72E1279E84C8C7626E4537E1751CB328C6C43967DEB5625E772B031E3703E55054CC9F701E806B844F2B01181238F1256D3FAEFC6CCAD748998B424265C454792A0DB30A647615D3E40E12CC6D5FF9AA7DF36FFF0775A1AA3C652F';
wwv_flow_imp.g_varchar2_table(225) := '7DFDF4B13FF96376D995F7B5A09583022DDB0018385E599E95028437CC021BB60B12E0939F61E5940C226E4408ADBE59348A588C8F40ED0B711761A6A9381A436CA83DBEF1577F6332B45A75A578E6B24BEDD1FFEC9976E5632638011915C71B76E23C74';
wwv_flow_imp.g_varchar2_table(226) := '09372C1719ADFCDFC633FFE37EEA47AD73B6FA372205C830D1BBFDCFBCF3CFEDB38CDAF60F1B98091A8F69FA01650387B42AE6BD2F1D80C49ED96090155C89CD638F1C77553F9CE633817F7504DE8906458EA79152BED481D7543E510E40EF6753A18807';
wwv_flow_imp.g_varchar2_table(227) := '19B7664AA7452979BDDD89D9144EBD7E521901F6E977BDDBFABD5E2308003B77AFBBDB937FE9A7EDDB1EFF18EB9E3D63C63A4570C5756E31564A21815C196C5688703014709A6F98A23CA245F82338E132ED5862A17C84640303039A69BFFD7FFC83FDE5';
wwv_flow_imp.g_varchar2_table(228) := '0DEFB71EDFAD973D9BD27377BFDC1EF123FFC8AE7CB49C40AB0292C5D57F64348E4EDED578A533FF8369FC8F7DD68F587B6BCB2CCED71A832EF9F4E3A28A07BCF0AB038538DEA81680391A7A7EBCB46100605EDF07B051D0DFA1248C193514B97C2E4561';
wwv_flow_imp.g_varchar2_table(229) := '98C00CCDFCB35A101D20B8AAA7C94FEDEB8AF351BE2E6AC89DBA50C4F4BA502BE450C1C79909EA90674405745201804929FFFA13B7D8D7BFF4159B1400D8E50FBCBF3DF9177ECA9EFADC67DB43BEF74976F995F7B34BEE754F3B7B8FCB178AE7F96AED3C';
wwv_flow_imp.g_varchar2_table(230) := 'CFD18AE7EE79773B77F7CB26F767DB25743EC33E829F341E61BBE7CF9A94CD8A90D101643C2F17C5B8250FC54A091AA362D996A681C6F49977BDC7BEF0BE8F4C7702E4CBA5F7BB8F3D861783F94E60E40442B2FB0060BE356A338656A7630F7AF2E3ECE1';
wwv_flow_imp.g_varchar2_table(231) := '3FFC74EB9C3B63149A4D0A7D3AA29BAF7DA77D9271E71BE3AFFAD42F501F94961170D6A283B68620993BE7872DF11E80731E56D43219F9388E1FE6C8439B23E432C9753290FF74C373F43A5A9013E500C41AED0024B4E1B4C928317E58AE65466BCBA841';
wwv_flow_imp.g_varchar2_table(232) := '0A0DED0046553373CE7BDBBBE382E937F2F777AADF204B3B03DC0970C57B308DFFA9CF7F8E3DF3DFFC9AFDA37FF9127BDAAF3C6FA1A83ECFFCD7BF6AFF98FD9FF1AF5E6A4FFBB5174EEEFFABCFB71FFC9F5FC4B172F867FEEB5FB11FFCF51735C2FFC04B';
wwv_flow_imp.g_varchar2_table(233) := '9F67DFFFE25FB26F277DFA128D68CFB8B595722BAF18649485A178AF7B17715E2DE371F7F63BEC161ADC173FF831D339791C62542327F8989FFC51CB2F0673C3CA28BF210479E7DCC80148460F7CD2A3B97BF841BE65B9DB10AC29A3B16FE6995FDFF0DB';
wwv_flow_imp.g_varchar2_table(234) := 'FDD6ED1668A8A198C3109EE57A1D00C31403F5943B8088229056FD406C2CD41E32D68C0EA0566DCE7B03F2FE695B535E8E02A55E8A56C9A109708D7527CA0168DE6292E7964D79C58C8C1A24AB97EAAA91A2A132A475C2A198D6CDCA0330DF6ADBDF7DE6';
wwv_flow_imp.g_varchar2_table(235) := '73F6A93FBDDEFAFB07362D08BF8E01E7B91A6BF5D3ABB245A2BE4C7319770F79BCAFCDC271E9FDAEE0FDC3FD86F152AEB84DE35D76FF2BEC8A877D873D854715ED5000FDB26FFE872F031EA7B4A31A0C7A16C857CD4F2B303558D9E648B8DD6FDE6E1F79';
wwv_flow_imp.g_varchar2_table(236) := 'CD1BED8B1FA21338683E22959DCF5E7EA93DFC994FB7FB3F9AC78176CBE2256ED1A86DB8A7C1A8D8EA76ECAAA73CC19EF8737CCF3FE3B65F7FC67BEBDBAEE3ABBE3F37FDAA8FFA673456D3395A8524521B929299565D60B29AE73F1D9F77114F26FD48AD';
wwv_flow_imp.g_varchar2_table(237) := '9C686830D85457732C939F6093F39ECFFC2359E4B9E37B4EE6CCF1D164CE914954DC48021530A3E7957062B9FE68D80278F69F26F43A8AB2AC3B085D7A7DF686F7DA5F7DFC661B4CB80F28E14F72DA3973C61EF7533FCE95F5D248A678187F8EBDB76F99';
wwv_flow_imp.g_varchar2_table(238) := '1C2AF92BE5754CA5981168C243ED0777EEDAFB7EEFBFD9A7AEBBB1F8BBFA09C0ACBEE4DEF78C17837A73E21C558C326475942B00D3DFF0CBF87579E8E8248C756A6F8A32FEBFBCF1FDF12E424ED951B6828BFA50973DF100A2561079D41CF35CF353F850';
wwv_flow_imp.g_varchar2_table(239) := 'E01444A0AEC951D65187B8C8D46BCD625F54C7B44981700E7ED89A35BE9D1936AF2543E9AC659CB9070160F0CE90F4C8C8FC8C8249AA86D99C8923C100B0F85E9AA92D183C771E8A7A1BA0FFC64B4E2070EC05D19C18F0B3975D6AF77EC88387F4E8CFAC';
wwv_flow_imp.g_varchar2_table(240) := '0FF676790730207F61ED4ED78094D343D06A8630BEE57944BAD33EF6BA37C7CBD28329C724753ECFFB0D19F843BEEF4956DEEB78AE7EF1B6FFC98FB587FDF0D5B675C979814E8C32F8CFBCF33DA6B8C7A30800F394913104EE00EAAB3DAB6B1F98E79D03';
wwv_flow_imp.g_varchar2_table(241) := '30798E7084215D5604E1EDF7B8FB23FEA22AEE96E434475A56B69839EF0DA3E2CC1C90430B9770CEEC70C400EE88F12F85DE3967801BF695114E62D6A057FBBA30FBE967B172360F51CC950160ED2E8DC260FAAFB46EFCAD3FB05BDF71BD35DD36CF85F0';
wwv_flow_imp.g_varchar2_table(242) := '040039F1A3DD3100C3E89C37FD87A92DD6DB9C417D647C7B77DC691F7FD3B5F6D91BDF6783031ACA94FE72028FFFA97F620FFE9EC79B9C80EE24BEED498FB547FEF833EC2C9DD394AEA6DBFE9B5E7F6DFC928F8CBF84057523E68B5D45CC970FD605C6B2';
wwv_flow_imp.g_varchar2_table(243) := '08C01C0DDCA6040767FAFF22C1D48A200790FE8190700EF43F3327B805AA3E8E63289FC669798D17DB896B924EC7F6353D4656B6A601E719464C82C310340A80DB56A5C3CA2213B76B72A745D93B6FB6A0502C098033AD1A4229C5FBC07F7D9DBDE7B75F';
wwv_flow_imp.g_varchar2_table(244) := '655FFBD25F596F7F3FAE0609F889CEDEF1F75FB7DBBEF8D7D6E96ED3B16D5BABDD8DF9AD33E798CF9DC2221368B5DB0487892FBA2CFDDCFB3E64630E9810E9E7ECE597997EC0E3C14F79A27DC7D5DF6B8FFB997F62F1AFFAA6C8E8E0C2AEDD7AEDF5F6F9';
wwv_flow_imp.g_varchar2_table(245) := 'F77E987731CD5FCED218A1E14C4EBB521323CC39A9F7488F6C4270CE9BF37ED82A3DD3AF5249B754A972A8EF0449BFFAA97DA1989013925DC642385608EC56886B65A89CF7E6301288F1B2475EB92E84D1D140E66A06C05A9DC515DB92E0A8346D1A8AA3';
wwv_flow_imp.g_varchar2_table(246) := '52A85ABF2C23457FE77FF82FF6B13F7EB37DE9C337D937BFFA77A6BB82406D53A4572089E1C444AD2CDFFC9BBFB59B5EFFD668409EFCEC76B76C6BFB0C1DC096A90C249AA889CE117DAB6DED4E27426A27F0DE57FE77FB0BEE040EE26FEDC5EAC6C7B97B';
wwv_flow_imp.g_varchar2_table(247) := 'DCDD9EFCEC9FB4C7FDF48F5B7BABDB0853561EF068A1FFC4F473EFF940A4BDAC6F4AB3C66321E540604DAF94218B533FA0CC5BDC0D01239EE8B8B4B77BC1FABC071AF40FE265668A04265D9343429E7B8B00001000494441544C6B17CF67D4A1C57BADAE';
wwv_flow_imp.g_varchar2_table(248) := '875B1DAAD562723C730218220DF4967D0A42A92A0319A75743CA97D1F91695BB5516974E3DCF8D1D1A8CF001A481637DEBABFF23FEB0E47BFE9F57D99FFFF61FDA87FEF08FED96B7BECBBEC055EACB1FF984FDD5476F5E2ACAA17CE1031FB5CF7FE023F6';
wwv_flow_imp.g_varchar2_table(249) := '05DEB237E1529D6EE005F379C27EE9C31FB72F4F18EFCB1FFE84E97F14FEF01FBDDEFEF6D6BFA06FCA0D626966241D012A3D9DA30C46D532D68FBDFE2DF61737BCCF0E6638813397DDCD5A9DB6BA4D8CFAC39E5BDF7E032FFCDE67FBB51FF31876A22CCA';
wwv_flow_imp.g_varchar2_table(250) := 'BC168032AF54330DF5955A0D3322006BB7DADC05B4CC98B722C891EEEFEDD8C1017721C9B86A968EE8E8A0FC6291FA947410BDA23BA95A6BF6C43A80966F9BA3674EB9A11F72EC2767FE7EEDBF145B76654BC7501E8049B8F13F30E97499EF9804EE1C5F';
wwv_flow_imp.g_varchar2_table(251) := '6BEDF5EC1B7FF555FBE2073EC66DEA3BED23AF7E937DF055AFB30FFCC16B978AEFFFFD57DB8DBFFD0776E32B5E69EF7EC5EF37E278FF2B5F6DEFE67DC48D6C7FF76FFDBEBD8FE50F4E18EF837FF8BAF8DEFEEF3FF7256ECFA7BFB2D35C178D9289786396';
wwv_flow_imp.g_varchar2_table(252) := '2BF29DB7DD46C7F867F685F77DF850E30DF87AF1136F783B5FF5BD77B2F11B0365C3271D9BCDFC5E82E0E68DA0AEC5FF1C155593C8B8CB0835A7E2B9A36A532F9CF363E8A7550030001590C0852D4EA652BBBE4275B6EB1B77E6481248ABB3558193C7DF';
wwv_flow_imp.g_varchar2_table(253) := 'DFBB107FCCB1C70BA88CEFB353004F2F4E0EA7554BE701588B3B81ADAD33B675E6AC6D9F396FCA77A2E0C936AE083AFFEADB695AB9968DFDBD03CBF67B7105D5AAB773FBEDBC00DBAB44D5EF5DE0BCB93DD685E480F0D3C6135D47A55400AC4DB978DF8A';
wwv_flow_imp.g_varchar2_table(254) := 'BC9571DCF9F5AFD9875FFD46FBDC9F7F88DBF6E91783B153EDB17FE705BBF94FDE619FFFF30FB23F57DB5A7B5A94F9201A69E0DB8CFCD77C026591C294794FF995F97952C177B7CF5A6ED81AA9DA4BF56DEE80B6A80B2DE95AB579AE92F4DAC8C31278D2';
wwv_flow_imp.g_varchar2_table(255) := '178FCAF6A34EA9C9473DC472F8012A5A5B2B6FDB528649D8FA6FC40EF677A9009995C1791F05372EB612E264A600CC796F790863AB9AE62BC7178A0B2F29A1E36A95C31FCFD393DE162F04011709107D725C1FE485E9A7DE7983C9A063C31C0FDD257CFA';
wwv_flow_imp.g_varchar2_table(256) := '4FDF4DE3A7F3E0797B6617F24B866A4C057BC08B596DD5C527957911131390B645F904C034B7CE962E4CDBCCB7CCD3D0753F20A7A737278A8BE2B5240030E724EF5C5307DCC58A7F764C2197E0310D3E6B5800D6E50DB62F569B123E70DBA458961D0D22';
wwv_flow_imp.g_varchar2_table(257) := '6EDF989675174B0A202A84143670251B0CFA36E01B0F2B425927C50660AD1A2F0AB0B5276D3AE776A76340AEC88132D9F9D6B74C77029F7AD78DB63FE90C9F50AADDD32DD7BECBFEF2DD53CEFC09BCB2004C633B3815C9AB9EE97F93D27DD080BC230B63';
wwv_flow_imp.g_varchar2_table(258) := 'BD7406D1D06271EE0790E3EF72E7D7E5A5E9167704793C63720458818E69F7C061224D81470C398158388647CEC5631878DE213DB7714D4E809A678A327EFDE722BAFDB78B34680EAE50D6C0F3A6EE3A64509A4E46A51E14471D50E93D0D4FF5C71D6508';
wwv_flow_imp.g_varchar2_table(259) := '1D3A67198AE72A29DA0098567FFD471C9FBDE1CFB99D9F7C1CD0A5E1475FFB66FBDC8D1F30BDF65B643E2DEE3EA231723C1D7564407BBB77DA3E6FEDC537D1A676770863555F3911A540EEE466D1384F3B00F3D469D1680C811E4BF2EE15BB9F8CF29733';
wwv_flow_imp.g_varchar2_table(260) := '63D35A3E27DE01880BCE7BEB705B96DFCA3B73CE5BCBB7ADD5EA58879EBA4DA380C12ED6206570DE937CCD21589F6F3BF4FA49CAA0BC949C8DE6656887506AE15865046032B4B842F29EA4D3D93645F4CD3EFDF61BED0BEFFFA80D78575319930A2F2771';
wwv_flow_imp.g_varchar2_table(261) := 'CB5BDE695FFC20DB0BC5AFC0CC2CC0DABC8B69B5BA8414CFB83F225E7E0C80698575DEB3ED647EE458BC6F1B893505C959475A39B201777F4A55BF8E785138000051A867CE9EB718CF5D62DB67CFD936952E1A3F2E8A694C9427006B77B89D2EBEFCA45D';
wwv_flow_imp.g_varchar2_table(262) := 'C0FEDEAEEDF315942E3BB54A786EFD3BDDAE39C24E44740C0D00CCD129C9E83A5B5B74C85BD6E20AADEDFDC7FFF82DA61FEED0771206BCE51FD019DCF695AFDA27DFFA4EFBFC7B3F64BACCB42583C6EC6E6F936F5DF35EE7F5369DCF9675B9206867A2F6';
wwv_flow_imp.g_varchar2_table(263) := '25511F793700A4B56B2DCA341F8C179ADCE9EDEEDC697B3B77D0DF8FEEB6F2F6A37BBAA343BD7ACC00CC794FC7997B7DBB0B05EF7C3CDB02B94802CFD4FDDE810130CF953F576A6F17539013D019FF837FF03AFBC0EFBFC6DEFFFBAFB50FF195E9E7DFF3';
wwv_flow_imp.g_varchar2_table(264) := 'C1F8D6E3B073014083CFBFE0B4C5F37A870EA8CDDDE04936FE72CECE7B3ACB6DF37402008C82B618948F99F53CDC7A86D98C329303147C87AFD7149DF3D40798D278FBCCB3B6E7B9D12EC2D0E72DFDD7BEF065FBD2873E6E5F66FCFA97BE32F56E60D129';
wwv_flow_imp.g_varchar2_table(265) := '02CE9CF7310289212D8AE890F0CB7497F1EBA251AFBB956FB53A7111D0B16A197CCBF471CB74DAF4391A0EC039D32A76F6FCDDECDC25979AD22EEF3E64FC008E66D00DD663E5800C7F8B32D6D156DF37D9E25B07C97B5D446D1CC0BA38BDF0381B835F98';
wwv_flow_imp.g_varchar2_table(266) := '6577990EEB93FD297100BC64E1EB958C37AC4157C5771945596C229ABB78A0A83CEFCE17437091416B8E71AE94FD4546FADAC8BD4B3A808C17683D5EA0EDEDEED8CE853BECC21DB73355BCC32EDCF92DDBB9F3768BDF203B258A3118F46C77E7429CB7F8';
wwv_flow_imp.g_varchar2_table(267) := 'A178813C50DCE3BB73F14AC6B236AD5BC3400707FBB67BE176D35C778AB4C7B710D9112C00E2DD80B7F8071CF3806F6F7A4CB36CB086591E7E88753A801B0E4FEE6C0C7AA7BA4FC38FAFD07AFBA62F556474081252504AA38FC2DAE76B36C265DC15F0BD';
wwv_flow_imp.g_varchar2_table(268) := 'CB6CC44B42042A5C1E330E13625C12D552DDF2B9EE599FBC905206F220AEFC4CF53B7732FE5C690FD64EDB52139AA393E6ACF90E285BCD573A213D38D8DFB103BE5A0D94C91C68E602C9884B8BC92E5FE109F7C1C15E7C7DBB4F47D0EFF54E3C4FD7E900';
wwv_flow_imp.g_varchar2_table(269) := 'E662E8618024F03DAE687DAEFE81864EEEC777D2BA59576C77BAE6F9DAC50C6CCAE2176EA2E0E8B157A914A640C5E85301E22E84EF7677B813D158FB5440195DA44F704718C58F5DAEFCA2A31CC6F3956297174D8A9DEE163901CBB85A89AE83A3E04339';
wwv_flow_imp.g_varchar2_table(270) := 'F09A52C9512BB0E65E1F528E406D7BE4891C8260EB308B9633AEFCBDDE9E05EA9BF095B14F1DDCA5DC257FE5553F3F6EAC65B1143D77290720E14A209A98A2BE39D88D5F0CD93229BBF25DBE2F9623D08DBB60322A7F8F5E5B713121A9F7A4184C46BE1F';
wwv_flow_imp.g_varchar2_table(271) := '578103CBFA7DCBB81A0DFABD58AF9522B6B1BCBA31ABB468BCDEBE1473B415D53B72BD5568B7DB16BFB84307A0AF51E7BC20CD740007EC13770855742B2969AEA5116A9C32F6C907D5073BDC5FC60BFF8006D9A7E3353AE09C68C4B96E51EE727E006CC0';
wwv_flow_imp.g_varchar2_table(272) := '23D1017780AB70021A6F34563E62FAECD31148D6ABD5AF7484C3E5D7E60082E1C6C3913ABD77143E1549A9200198DEA13BBE5A0360401EB503E852F1F5CED50CA620E5D3EA37A09196FD55BF6C1CF407D6A33165FA1DB9BA525331355EE920B4855CC598';
wwv_flow_imp.g_varchar2_table(273) := '755A65548A65BDF3DEDAFA3E41B10302600079D4EE58CBB7235888CE709F3B23FD8E408875AB7C64C4BFCF1D90FE78679F8E46514E609FBB36EDDCC4B743F182BC95C1051E6F4ABA257FE9819CBE1600C71D50101C9DB2E8382CFF33EA4C39563D05645E';
wwv_flow_imp.g_varchar2_table(274) := '21EEB034CF9CB6D97C0D168ED456523A45615A3ECAFC0D7D7A66095A5B30C5FDBD3D9E4D7B64D0E1BFFAA8BFAB0EA9E029E856CB37CE472B9E7604528A1220700B27459C26D012765A1AA85C327E3993120E80B568685BDBE7CCB73AAC0663E0AEA01F2F';
wwv_flow_imp.g_varchar2_table(275) := 'AA7A3C9FAB1F2B0FFD119E7DEE3CA470A1E0879CDE16B7FD9E4EA03E800CA4B3A5AFEF8A2EE36296F19CBC4B27D0AF831EAA3CE0CA2C99F7B9228AD726DA14893518B82AF7E3D76073BA036B17FF647430DA65A53DC5775F7C894AF3DF8E7C90C30B91FF';
wwv_flow_imp.g_varchar2_table(276) := 'FB3C0E04CA3EED336F3E63BF011D49A0CCEB7DC4F36DFDF622E50DC004238723C75F873DCEF2DA1C40BFBFC7CB112A1615A0AF3F7661EC1DECDA9E7EE0830A2B462ECB0831771057FF1186F8E7A264FCA8A69A8B8ACF3B01442F9DB7052AA48C91D2CA2B';
wwv_flow_imp.g_varchar2_table(277) := '9678CA81F4498B152B3F901B7F97AB6F8B5B6F7DE9438E47E30BBD94AFB7BF6F1A3734289260E68DEA2F0393030A9C8BFA697ED108E2CAAF9AF1285A224D85831850B1FB74D652F071E8C56B065C250F38C7317CE48D1C71973B32E73DD91EB8201C9874';
wwv_flow_imp.g_varchar2_table(278) := '212CC18B5E83318AE7801C6E4E372079B40D85DC33EED27279E5EDF33E45DF80478950F0B9DE4F4EC779673A72B5A29ED109643C6671E733A033ACC357CBEEAE7707F0DC57FEC71BC4EC40C15622954D5E719F5BC38C1EBCCA88F94A8138320AB2343AF5';
wwv_flow_imp.g_varchar2_table(279) := '0260FAA7FCA4E8BCB756872B1F610523BAA4F852406AA3AA168A52701D2542A2149E3B1129B9F3DE0098F33E2A455B4AEFBC29649CF78114838E23903FAA5B266AFCD4F885433FC72D07A0FCE408D39D40BBDD8D346AEE7D3A6A39D5C97DE66BD17CA4F0';
wwv_flow_imp.g_varchar2_table(280) := '7D3AFC543EEAAD5552BC117DF14846FE8817CB38C38C3C1FD069693CE1CE23CC153CB62478EE081C8F86AA12BCE42DDEA9BC481CD0B135C2731EBA7F029C39EFAD4307E0E3318BBB0EC93A1E0F27EF7A5FF887FFF1AEE7002C0FC38939D732C0E5B55C2D';
wwv_flow_imp.g_varchar2_table(281) := '07F48AFBBBBBDC968D2EAD8AC6998984AF575A638014C4585DAD42C291F297D5818A2423CE9630C43E0D7810155DD8609AA3B6DEAEA684004CC6D6E576148029043A316D11C507959789329C0115ACECEBA8E45DEE3C949675D3521922E02348E4039D52';
wwv_flow_imp.g_varchar2_table(282) := '58820F1141F19061C999C8A914553101606D6E8F5500602D3A4A18548C3B806C92714588FA23C43EA1E17FDA21EA3A30E5E20D34CCB2413C572CCBF3A6F53995FDBC6B994B640EE6DB5D39D75CDF07D39DEBD0464A7C4799E6141DE5080DB8019818D2A1';
wwv_flow_imp.g_varchar2_table(283) := '72A6CD1282760369DD3C7929A9620AEBA8FCB93AA5B5E37947E144E5234D65ABE8D0AA5096E74DCB9F0A173C00EB44A1375301C03C95B0DD9162E43032161971A043B40583E63FE00A582A2500F3342AE772DC36476017F6F14348D1A328DCC3CA053372';
wwv_flow_imp.g_varchar2_table(284) := '6C8DC60C672EB9A3718E6546A10F74C259E2C854372DCA4765BC78553A0DAE6C0360F18858381CED4C021DB02D181A171DE2707E341716E328DECB29381529A2DC6189B7B122798423BE2C4F868AD99CA2985DC32384976B14E7BC79EFADDDE9982B84AE';
wwv_flow_imp.g_varchar2_table(285) := '7A095E5BD8BE145915F3C628F9302FF4189C0C45B16CC8E9D8E36E64FE8B305D426689D20A9F6289B3290560FA7E8256DED8CE79C888FB07BDA824B16E8E8766AEDD87E82EC11D154EB82DAA9FCD1960EA67C3104CCE70585C22D38F3B225158EDEC9D37';
wwv_flow_imp.g_varchar2_table(286) := 'C00D2B0198F805C014A4034D06A2B67AD4BC07B523601DA65E76DE9B2B9C6310DFB97B535A879B540E9475B0F16D3C00ABF2D0620060923350CC8FF707A9BE44A06378B8758EF992D7BD326E6F24F83C92295C01AD608A689110A43481AB80CA4BC704E7';
wwv_flow_imp.g_varchar2_table(287) := '2C1C0072A131B5224838BD391D51A002653CC28472E5261ECF73260A052B503626702E2A8673DE14844BBB806C911589E36BC7A2BEC2217EEA4C2DDCB13CE7034074CCEA6F4510DE22BB70227AE44094D63B3BEF394C6E0C659BA7D32AF319B7F3924159';
wwv_flow_imp.g_varchar2_table(288) := '9E9606CE3F34E84B3EFFEA18251E8D058CD47F4083A6D72D9B67A6513E1C771C10E6390F607CDCDC3114F5EC2BDE582DFCC2EFFC1FD7D4AA8EB438E2C0910E53417E8371D4923F2D194A5988605A7506877A3508C082CB01D00000100049444154F42FA2';
wwv_flow_imp.g_varchar2_table(289) := '9BE3417073345624B08102EAF1ACA6ED61523D319B2A84B6979E060D5231B143D22085F1DCAE5B012FC59043B13943A0B3C8E20A98779033F1DC5E03C82B16783AE7C80B3FEC111A0C6BD8383313B88B1A5F258DF374E24F8D3EE7BD81E39B02F92F3E28';
wwv_flow_imp.g_varchar2_table(290) := '3B2B06C2F25303034741AD6E540460CE7B2B43200FC30273D59B926C7C5033E12DE760D5E0A4630549DA13E9D85285B0B840DA1A034D718DA36928E0461898533403BC955F44B12264BC00522C8A8B27E0B4B04837188C7DAC1AA41403D2129A045D0565';
wwv_flow_imp.g_varchar2_table(291) := '492265C20F9C3300CCCDF701108F4340D187E3F50E0EB8FD9EEF4254340E78062E47731C5FB12C2F96C23C8DD38A201E2C230BF12CA769C49702A539EF622CCB65AAD99763AB7F9FB7E54ACBF649A9604467B59DCE87BB88E90E5C238E7A898FC235AA69';
wwv_flow_imp.g_varchar2_table(292) := 'CE6946912794531DC2518640156F0903E3BF92B7EC3BD0AE9169D91ED67CFED7B84E8FB5C62CAB7839804CA1425469C8770161018F9CF69F2684142ECD03605191C9F013A83F8CC3F27C1950D016F1CD072F2847C590E3505E31E38A2E05517E5A0C54A0';
wwv_flow_imp.g_varchar2_table(293) := '10F954D209734E62852D1B00F555E4F479ACC9B43D5E02D924FAB5430272FC15B4AC03F950D685E1DCCA9A0929E14469BD15867AD5D47234EAA910796398B25B40E47D0E37F62439806493B704CA6DA005262FEA59B10D551C751C5173D42315F8750FE0';
wwv_flow_imp.g_varchar2_table(294) := 'E0871305608E4207C81D1B858C4A17A26047754D39C1C4ED77DA0867604CAB66E5E1AAE397F063B8CB8615A700CC27C7214DBD1F8F20363D1050BC2A8188C69CF70634CFA7849B37157F15E7852FE1D467C015AE2CA7299CE87369D5302F5D280BC2A16D';
wwv_flow_imp.g_varchar2_table(295) := 'B2D2B26EEE94F377DE137C7E3E685B3FCF3D40A0E106F29DC8AB1F8E69366D3C186A7A166557E0E2F97F6817B6A6D02C85231E9C6C783992311C58429514312664E5AA9600CF9125B639A0AA20523C9151AD9DBFB41CA555FCA2C1860AC45D50C337DBAC';
wwv_flow_imp.g_varchar2_table(296) := '16E2B88502954D8014BF2C2D9ED6D011411C85E9FC9FA0559271AC0799ECB84A4E92119B2B5D065C212B154D85D86912C6A60E795D4643CE738B3D83F4729C4911492425E69A1F9ECE2F6D1950C62A07C3CB95AE3B56AD6E4DA33FB7FE4D27C0A213B024';
wwv_flow_imp.g_varchar2_table(297) := '90C1F36CC9E489435D90D4057E1264F365517342B15788CFA98F405A4D4A31845227C561C55C1937363ECFB134A2C530619C97B658C8669E9D67E3CBB483E3F1A10E29B940464099D7DB2CD60962D4121A708C5AF31C0076455E289E2A39A76751319690';
wwv_flow_imp.g_varchar2_table(298) := 'ABE46DA57A1A7805B0E9C061A6EEE332B44A404DC6417CA2FE70F5BFA602B8A6C2B138807C6E186E77009829DA28503CBC04D35FA58DEA26E5424D9010936BF826F54DEB9DE7CA59EB175F0FA54073E4B5B2848A4398A313419CF7561BDE067C3F3D6D5B';
wwv_flow_imp.g_varchar2_table(299) := '0A90776E244600E6FCA86C0B864065CC266CDD1741955126C235DE07E6261826676239EDCA590C190D2466663D38EF3A08B0181F228AD1D07574872E0330E7BD998D06118F42967F3FC68E212CC6A11512188064CB030350C54E451C0CB26A5D538970FC';
wwv_flow_imp.g_varchar2_table(300) := '34B52C5CE7B832D5A8B040459E89880484641722E5971398D9AF06A0B1E3EA98D4CF830786BC0779A8395859B6C542E03C321A1C93614700062CAE26C2D5B878135F4EE370884A06E078A9832031115705AA5A600F63B76A254BD3C63183D543BE7A8FD7';
wwv_flow_imp.g_varchar2_table(301) := 'D7E10E53169D70293F8365FC77189C87E99B5272183C0BF7E596473B00450310631D8994B179B355850C8D9A568599A7043A001252019DA57C021E1B9F4A2B27A05D8CDAE78EE483170D49876CC6191820EF5C22469693EE8B67497BCA73100352836479';
wwv_flow_imp.g_varchar2_table(302) := 'BE8F66AF9842C3646480B0DA84008A60349FC8DBC4B936768219F8CF6AC1A57CA9B5A9088CC689658392A9F1F08D300023345C089FFBCAFFEB9A51C57A73550EAC776C9A2D5E5E0E89288C8431B12198760175358A4D47F0F0DC9EC150C31CE6DB05D47B';
wwv_flow_imp.g_varchar2_table(303) := '69259D67F750EBE7E21782924A1A6498650009F8CAB3008D56DB563B74202AD39B8E59882A864BE167E4C1AC3EF5767DEB0E51A7EA2DA3B2F3AB99D70823E69B5F32EE122A62AB0CC7EA00EABB00ABDB9E662A0ECD5000A0A9A33A2F1685C6F9AA52D0FC';
wwv_flow_imp.g_varchar2_table(304) := '2DCC33BE3A27C305D19D94E7C902B05CF947F3D1D893FEE8C418D41EE86C98CD3F3368CD81A63D47630B0A140A0065E78E91A60974383F5BE59CA30C8A3123FF97E4A5153826111EC799D438A55E34A5BBA4121400879C313F1865EC0907E3E3E52F79CD';
wwv_flow_imp.g_varchar2_table(305) := 'EF5C63C71866507BF49405BEFE202B260E94CD5AFD9A3A37D54D1C216D80A1BE6DA42287593418FB012922CBA8B4817D2B9573141CF10023B10847961A780D47E038C357651C2F23ACFAD4C0E62A02B0B1F91BCCC068F387407E05D232D6837866191D00';
wwv_flow_imp.g_varchar2_table(306) := '130D283A0B4FB6C4856AD9BF40D398B89AACB3269A9B7A0A4EB1D616771D359C351003FF7947F902F692D7FCEEB11ABF6823254A8E2F6A1710602F374CA0A181D115C8405F9CC290B1F19C59019ABF50570AA29F6B0780C468359A14971D955D2C927EEF';
wwv_flow_imp.g_varchar2_table(307) := '47620934A6016FE5433AC704A30C3EBD27105C46A790802C94E5F0849F240C36CDF111A9A2A30E0AE3BF1A9FEA302A579C209185F85A522DAB8B00CC796F6908E475E078695D9A575EEDE2AFF442E534B6EAC7B7B431C9470707FFF2A4EAD8B2234D3B36';
wwv_flow_imp.g_varchar2_table(308) := '12CC7EE177FEDD35006E40030D1985D2507D6455AEFE251A4A5A429F3520E927483A83C05DC07CDFE567C7CA072EC5933BB84934F4F59A90B7292304C1C2211CC008CFF2B910772173BCC19930049CB79C9F3980E6AE9897C69F82551C6F995E53EF933A';
wwv_flow_imp.g_varchar2_table(309) := 'D2693D8374927A5187F17428759C759858E6C5DF8BFEFB6F5D13F3C7FC38110E20F200AD468F38C321C7AE95070513D88949A57A9E828437667CD1B8A66393B9AAAF29930C942D6188C20339218C90C9A0331A55827A98557D9DBA10691E822C9411EFE8';
wwv_flow_imp.g_varchar2_table(310) := '7216EA53078EF3A60CEAF5C23D8F91C5A9C7478E41FDC2545E8A578A39FC224F399B123ED0B0B5DB2ACB93D2106551E5FA3CDBFF12DF2FFDEE6F5C53E68F3B3D310EE0B9AFFC8D1B82B93127305DF085AA56942D9804B92C630167D0192D41102AF89386';
wwv_flow_imp.g_varchar2_table(311) := '19D959B44FEAEE383E0CC3E640C55C045710BD8A430CF365D42F9B6A68B3F1E4380687704166A00C1CA31541733FAA9DA077DE0C09AFA371DBC420FE0C1A5ECDBA04C7C4CE6C08BCF36272623EEEC4504242E28D28B747CC0E3F52A861A13123830F8D2D';
wwv_flow_imp.g_varchar2_table(312) := 'CB54023027A5B022D090A480F42A45C5D1271A1F2E514A4E4F8A370F0D04A5578CCFA5080D35E5767E711599CEAFD9B401302719303506E94058F022107056742786C91FBD962C39AD71FAF1CFAAC7691406B56753EE6304332D061A3FEFBCAE9906B3EE';
wwv_flow_imp.g_varchar2_table(313) := '36B7EE01678D176F466B4E60569F7ABB9445C2AAD7CF5B76AECA968C4E201AE0BC080E09E7BD37EF5A099660812B53486ACA2C492BB32B49EB63006E25787324C1B29A83C9EBC79FBEE5ADDC0504EE2732CEDF264C366887C438C20273CE1BE06C56F0BC';
wwv_flow_imp.g_varchar2_table(314) := 'B84BE1321AF8203A81F19E81E3E73F12536F83693C9B12C209347E913B9B43825A73AC3A81B0D6D101446102E5BAC00595DBE2ACA260365F18A1980FBE84E2D8CE5715587FAA2A052C41CA3490B6D4303424A06709B1481AAC3E4FB7042E4407BA2C0D39';
wwv_flow_imp.g_varchar2_table(315) := 'BD3A53EB27CD63898637A061063A8258AE3DC497946EC7F19D9F4FB51D61F3DBFB9C5E8DA18BD5C8D7DA38199D9762ADDAC422CD19C871D4DBC309357ED1391F9704B9E6983A010978A1E19BE530370AE7ABC61768FC4D0A310B21B03C7BBD7E1BC08D26';
wwv_flow_imp.g_varchar2_table(316) := '22C5CBB80A061A4339AEF281B495E53C8539AE7E3641196D5A086CAC6DB5215CAC9EF703A018DF1A4336C188EBC0004C3FD95E8E2F0730A0018664FEC33EAC4BEB9DA7FCE6A41B80E9FF86F0BED87111977E87A12F87C3FC700C667AFD03FA5A318985E4';
wwv_flow_imp.g_varchar2_table(317) := '033A9161FFA45ED970828D5FF4393D4E6A9413A0477EB969959B40248CFF2880B419700620AD5A28AFD5C72538A507196948956C1E84CEBB79C01A611C15D8BB4229234488FF6B4E4983523985D8943C623F3A8FA46AFE2C79E67D956660713E02CEC07F';
wwv_flow_imp.g_varchar2_table(318) := 'F581032B443793B93ECEF9F89FA828A5E599FEF394A6FE928DDA8D0180C979BAC479DA8C20FCFAEFD19C7311528E56630DE804845B31FE445BFC9158CD2282C50700D3FFF1A0316345F20827DCF8456A3E63E54E687CD17FFF9D6BC4C845C8C322C00DB0';
wwv_flow_imp.g_varchar2_table(319) := '8E4285F3494BE0D975FE9F08CF3BC21C521CB670D0CF48A79DF4A7C1818EA8ACEBC5EF00942533479A3BDDAD51C53239AC4025C0811599A41F55B905F16B7BAE283C7278FA9D40E5CB287E84741744D9F9B89A6BB4126A7A0AC03CFB8CFEB72670CD1998';
wwv_flow_imp.g_varchar2_table(320) := 'FEAF48FD8F5565AC8C636600ACD5EA5A5D4EC6209D3D69177E246BECB302698FE15C79C52FBDF237AE79CEEFFC9F105367210760F0DE300B7046BB178E62451068BFDF8F4AA1FC3C1152742C4F05002A56DBBC6F0F87CBB815D93FD83529FD80F40CD29F';
wwv_flow_imp.g_varchar2_table(321) := '0C237CA7BB6D4D2BD110C11C19399139C0A682C0C0764526B54F736D0D282902E443B74B5E744C067870B067BA880BE4052B4CABB4CEECEA02F23CAEC6346695178900E24ABE75E61CD30E9DB7A3BC43DC75E94810EA4E869787DDAD33B675E68CB9444F';
wwv_flow_imp.g_varchar2_table(322) := '38265F67E3691783F19356BB281C8008551453EB4E20501114D55EC628100AB42C2F933A2A5175B59232F4A873610C9D6A9A68001655F731D4A6FF5DC8799F3770AE190D7F6F6F87DBE15DCB0AA50415B0D39691B40C587E4C0085328F7068FB6B2B0CA2';
wwv_flow_imp.g_varchar2_table(323) := '755174DE79F261CB4AE7A6EDB95665F1615FFF7D19EF2D9CF3A6FF88B3ADFF67C2960B00CC93D7C2D3DDA671330A9F5678DFEE44C7A0F2160D5FC6AF7A4B42E0969F0B958CFF86A4FA44672F2A07204ECA0990C9C3DD4054D0C210D46E06AB1AAE2D159C';
wwv_flow_imp.g_varchar2_table(324) := '7326279076D6AA5B37F4BC9D47047D5F9D069A978D7D9D01288B4BA7DAFE6A5533CB71697CAD485AF9E88D0C7026E3D7F655793B6C20CD00122C21C91F324BBC205F97C1E2E9906574E2857640BD8303D3FF22A53BC576A763DDEDB3D6A6F14B6ECBE04F';
wwv_flow_imp.g_varchar2_table(325) := 'FB88C6C8F74ED7B4ABD2B832FA4E34FCED388E1C0530E4D345B5EAA7737569E162CACB11047ADC7E3678794AB773DE9C7769D5D2F976BB5DE99BF116BE1F2F822AD5BC1FC81893EFFD5331A4B0C05041AA1D16291187147BEBCC596BF172CFC5F979F334';
wwv_flow_imp.g_varchar2_table(326) := '08D56F9FBBC464FC6E49C3AA93C2E14C0650D60F78F35EE60F9BC2608EF4DB924173EE72553E77C9A576FE6E97315E6E67CF5F623250F16649B453BB39F2358D804BE1A3E17341BAA856FD740295D9A40D17435E4EE0857FF89FAF09662FB7F8E52198F7';
wwv_flow_imp.g_varchar2_table(327) := 'DECC60870D004C3B0038E1B322041BF0559056DEA2820B10EBE818E24EA4A874EC032A4E513C740280DBCFB66D6D9FE399F39C6D2B3D7B2E2A7EBCB064FBA107192240857BC9A66608313B438990337538CF7333807AF5C558BEE80DBF64FA45ED00CA49';
wwv_flow_imp.g_varchar2_table(328) := 'E875618CAFFD5DB876FBE565FD61534086D7312057DA406B18F0D59062893BF0FC19CB6CCBEB4027D4B2551C43AC1260A053F17470CE7B137E80758C15B01514000CB1041D6D86A5F932E253EA24CB5E9EBB96327F11A6A5D1E3625EF1EB7C77F58A8BBD';
wwv_flow_imp.g_varchar2_table(329) := 'ACDF57A3807447F0B4C02302E773A80B191D039CF344937FA4DC07FBFB56AEF87A3595F1622E6F357334526DCDC1B4ACBBA8533936C5392721FE8837A1060F38F32D6F006A2D27B748CA64F42F0F86A751A72EDA6D3EE731F173977300DDD454AB000002';
wwv_flow_imp.g_varchar2_table(330) := '6A49444154E54C793CB88151AF0F253C39040952BB83851C029CB7F895D4447107835E7C3D9471EBAF5750A1BC849492F3DE404EA0A4E3624F03B7F2D9020E40F3155FEA3B007847E3776A3EC951BA21A38F3A5318FD35D423D59F64BA97A6EDC44B64E9';
wwv_flow_imp.g_varchar2_table(331) := '99D53A52881264EA10E20E81DEBD740A8D4206C0F377D75A7C0D6496AF5E8106B1BFB76B3B17EEE44DF41E753D98B1AD4D986E67CB801CCE2ED690D2AFA971BE734F85B083FA1FD3109F77ADB9511C31A0E41C63E00E91517A3034F8C2E8D57EC4649C0C';
wwv_flow_imp.g_varchar2_table(332) := 'F4A7C601D4D94D871077084C4BA7502A81CE7895F88BBFFBEFF1C23FFA2F7809EF185EF2DADF63AAF8BB78F1AB7FA7C8E7E517FCD16FE217084B25AAF4BF98CABFF0FFFC3BBCF0BFBE6238AF17718EBFF4CAFF30F77C34FF17BF26E50B79F39ADF45E40D';
wwv_flow_imp.g_varchar2_table(333) := '719F005E48CE314AF68CD2835363F0753B38B50EA0CE884D79C3819403A725BF7100A745D29B796E38D0C0818D036860CAA66AC381D3C2818D03382D92DECC73C381060E6C1C4003533655A79B03A769F61B07709AA4BD99EB8603350E6C1C408D219BE2';
wwv_flow_imp.g_varchar2_table(334) := '8603A789031B07709AA4BD99EB8603350E6C1C408D219BE2E9E6C0699BFDC6019C36896FE6BBE140C2818D034898B1C96E3870DA38B07100A74DE29BF96E38907060E30012666CB2A79B03A771F61B07701AA5BE99F386030507360EA060C426D970E034';
wwv_flow_imp.g_varchar2_table(335) := '7260E3004EA3D43773DE70A0E0C0C601148CD824A79B03A775F61B07705A25BF99F78603E4C0C60190099BCF8603A795031B07705A25BF99F78603E4C0C60190099BCFE9E6C0699EFDC6019C66E96FE67EEA39B07100A75E05360C38CD1CD83880D32CFD';
wwv_flow_imp.g_varchar2_table(336) := 'CDDC4F3D07360EE0D4ABC0E966C0699FFDFF0B0000FFFFED9D1E3500000006494441540300315C30B2617AC72D0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(1609807287614825659)
,p_file_name=>'icons/app-icon-256-rounded.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260505092756Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092756Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_32_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF40000095C4944415478016C576B8C555715FED6DEE7DC3B334087F7DB6252355681C132C394A8B5CD402CD6F8C0D6968A08544B2D945ACB3F1B8DAD89896DD21FC65228';
wwv_flow_imp.g_varchar2_table(2) := '1DA0948731B6B655A3D416E8F06C802085CA400B541471B491E03CEEDC7BCFD97EDFBECC04957D67DDBBF7DA6BAFF5ADB5D75AE78C5BB7F0DB61C3E29561E39207AF4A6B17DC1B44FFBBDFBE68455873D7B7C2BA85F787F645CBC333772F0B1BBEF1C0A0';
wwv_flow_imp.g_varchar2_table(3) := '8E0D8BFF5BDFDA05CB42FBD7570CEE4BDF7ACA3B334356ADC2398F6AA58C2CCBE0BC87F709C473CEC1CCA021DE009919EAEB8720E455244901759C2769019EE7CC0C95724947E02FAF439E21A7ACD60324DD2E4D8B345A256514C8916755E4D52C1ED697';
wwv_flow_imp.g_varchar2_table(4) := 'C1221081ECEBEB418914420E91F30E46E04080996160542B15824AA243E2859CFB7424270839D8DFD71BED692F46C0514946EF854C5E6459457B834ACD0C392363E047B29C072A85D600F7F2082C23782E0927C0FB74D008C87146B0C628572B91AF0885';
wwv_flow_imp.g_varchar2_table(5) := '101001F8846869D48C06289865B9F4D4883CEDE744EFE885F71ED91511024164979596FB4BC8088EF6C836DA0D8C6A2D9AC6B3499A2063743477CE732F87034792A4F0BA2B32CD6A07852ECF739819249C148AF15772548B244DA1E1A838BB0C4EBC525F';
wwv_flow_imp.g_varchar2_table(6) := '37ED87780E5415019983F39E670A480A05A4D2C5B580470066564B2246C2CCA20201C818524F4133438187140933CAD635C0FB44F66104A0E8689D329FEAEB87A258AC879941C92923BA3EE73C8C1FE9496847F2E0DAE18A11985C8C1B0F26A896FB91A9';
wwv_flow_imp.g_varchar2_table(7) := '3A68C8CC3074EC2854B232932F80E70649A0062A00944BEBEAD038612CA7464F0B51BE5A2DC3112838325E9192D4CC502832AAE4C5BFC08428F5F6A2BFD4470005C080624303868D1D8DC649E33177D5FD98F28926348C1E8E6BC68DC190D123D1306A04';
wwv_flow_imp.g_varchar2_table(8) := '1AC78FC5C8C913391F4ED9519838EDA368FBEE7DA8A7DCD031A331B47104EA1B866260542AFD10658CAE78AED4DB43942AAB10439FA6456444396CF4187C72E902DCFCC052DCB47C310A431AD0BAF076B47D6719D74B70CBCA6F46BA69F992B86E7B6819';
wwv_flow_imp.g_varchar2_table(9) := '3EB3622966DEF9C5282BB99B57DE83D64577206928C62A09CCA9C0EA49987355266E04C0803233AB9C130005CC19016598444F864D9E80177EBA16CF3FFA38BA2F5EC4CBABDBF1DCA33F19A44D8F3DFE7F73C94876F38F9EC08B3C3B6CF2788CBBFEC3D1';
wwv_flow_imp.g_varchar2_table(10) := '3925B5AED8CCB1026AD5E1CC0CD5180EC69C7F44829CD7D138713C3ADF3C8433478FE3C299B3D84A85EF1C3E82AEF7CEA1EBEC9FAF4EDC93CC16CAEA8CCE4AC7083AA2C8E6AC16E907ED044642730761A3E7CA017027FE322CE60C63A77C00CDB7B661E6';
wwv_flow_imp.g_varchar2_table(11) := '67DB30E9231F42D32D9FE67A0E9AE7CDBD3ADD3A27CA4CA6ACCEE8AC7438E7E19884B508D00A9D3653A4039C90683310048131FC0146E38AC29809E330B56566A469FC9DDEDA82E9AD33D1746333A6CDD26F0BA6B5DC80A656AEF93B63F6AC28DB44B9A6';
wwv_flow_imp.g_varchar2_table(12) := '1B6761FAAC668C9D3811725236724620D00EE8A89941C3E9CB3329327642F2B58423E2C0443C7BF008DE787A23763ED58E5DAB3760EFBACDE858B329D2AEA7D673BD053B7EF62C763FF37C94D9BB6E0B0EACFF39F63EBB159A77ACDD843FBDBA1397BAFE';
wwv_flow_imp.g_varchar2_table(13) := '49BD8622FB435AACA37E07C7F256B49D99C1B331E46CBF35868367F389E10A404241EF3C79971B0F51AA549D73742CC0CCA07EC1D0F19990411E4A8F7ED5FF4F751CC0C99D7B29071AF548D302E7B4499D51C6B3A59A596C1A294BD0790F4F409E8613AE';
wwv_flow_imp.g_varchar2_table(14) := '618807E77DEF41DCF1E46368B9EB4B505D37343662CEAAFBB0F0E92730F5B63636953A98592CCDDB9FFC2166DFB3001AD57219168C5311A0F2ABB0C9A983664C7E3E8E0BDC0412222B303C6256F9B071DE532150A1828854A08A29E00CE5F8AC0F10F8A4';
wwv_flow_imp.g_varchar2_table(15) := '58A0F17A38E7A31E4B3CC43346489148782EA19371935F7A6029DA398DC76742CEBB9620F7903349FAF9AC561BD63CF2623BF638F17A078EBEFC7B9CFBE33128B47DDDDD38B56B1F0EBFF06B9C7FBB93B584482776486E3BCE1C38ACE31873DD07317CE2';
wwv_flow_imp.g_varchar2_table(16) := 'B838D75760120A50957ACD0CAE9F8FD00ADF05C021EFE5495A2CD6EE953CB6A778AF2777ECC15BAFBC8AF36F9D60640C95520927DFD887A3AF6CC7F9E327683D443AD5B10FC77EF3079C3B7C14939A3E864FDDBB10D7B095F310A2A30618A34361683885';
wwv_flow_imp.g_varchar2_table(17) := 'BD4A004ABAA0E640011FC3CF0944123398397A18C01919FC368B0A05B87E782392BA22F981C43D5ED3E4A68FA399F9D2B96B2FDED973A096A07CD871173C4AA23E363CC70119D463D3CCA880D8A8A774A91BA3AFBB16697D1D7C9A4472DEC3F18E3D4965';
wwv_flow_imp.g_varchar2_table(18) := '94F1FA14CED6BBBF82995FFD4204E12973ED0D4D6859F06574BEB63B46C839CF5C2A61C041A066071CCECC90F0A5326352042274DE47047F39728C1E03F37FFC08E63DF2106EFBC12AD2C3913EF7FD8731EB6BF3799C48F9F7F6F69D18396532A67E7E2E';
wwv_flow_imp.g_varchar2_table(19) := 'A634CFC08CF9F3707AFF2174321FF24A152AE59CD15505080C4D42D71014016A81F31E81C6950B09C188D7F3FE4574AC7E0EFBDAB7E1D0B6977070DBAFB07FD32FF0E6E65FE2E0D6177166CFC198FD66867F9D3B8F5D6B3662D2D4EB317BD19DE87C7D37';
wwv_flow_imp.g_varchar2_table(20) := '8EFFF63594FBF866CC7D90525659CE244F0B75546FD0270C00303314EB86402F16CED5EEC62856EEEEC13FDE7D0F5D27DF259DC68513A7F037667CD7C9D3B8F8D70B315214A332A0A7EB7DA8F31D7DE977AC8EFD086C6CF25286A52B6129AA7F783AAB33';
wwv_flow_imp.g_varchar2_table(21) := 'CE7B3E852B705A8864D8398F52A917E5FEBEC12A6068A0C8A87E537AA1DA95BCBA9F1A8AF8F2C408E3D2F9BFE3D4EE03545C9648EC7A0ABB2A4D32626AADD77BFA8C02DF9E5C4FF7251A64A8B8AB10C960813D5BCD2667CD0692AAC4CC506153020D055E';
wwv_flow_imp.g_varchar2_table(22) := '5799DD4C80CC2C66383824DFD7F36FBE7CF442E7B41E486EE9A008AA7C2B768CB2CEF306C02404DB63994D886F453466E66066B1327266794E63499222254585E4A9897886D0A8C8390FC98023A372E379EF13E81D23E79DC3009F2450925304E2799F42';
wwv_flow_imp.g_varchar2_table(23) := 'CD2C848CBF3C004A49202724338386398FC0B5E6320CF23D8DCA236EC0D1B8F642AC15CD802CFEEBE5E13CCF122860FC3880DF03BAF44B55307308AC0C9673828886DEE30A65668640EF75388FBFC08027393DCB2F83030745799250A8C3CCE09CA7A739';
wwv_flow_imp.g_varchar2_table(24) := '0C8039831358966B7484926606235FF65C8165E17820482185CC0C1AE2C990842CAA02C4337351B9A79792AB9149AC36A50E47E56A5E8A88AECFCC90140AF121565B3B183F32E974CAF18E644C77EE7D2216CC1801A255050CF0B4512CD6B1641BE007E4';
wwv_flow_imp.g_varchar2_table(25) := '60620F92F39E738BCD2D4D0A4858396440095B647217F94F8D99C1793A1272FC070000FFFF3B8924CF000000064944415403000FD9CBA27C8FB9C60000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(1609806306823825656)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260505092756Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092756Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_512_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000200000002000806000000F478D4FA00001000494441547801ECFD07BC2CC951278C466456BB63EE1DAF919D19798B0C20A49190431202C13E3EBC9060113280B4C22CAC63DDFB3DD8FD965D58168F24841C';
wwv_flow_imp.g_varchar2_table(2) := '7657D81508218384461E2183BC65E4466ECCBDF7D836552FFE595DE79E53DDD999555DD55DDD27FBF4FF545566646464545656446456B57AF13F7F5E12107410FA40E803A10F843E10FAC0E9EA038AC2276820682068206820682068E094692021B5BFB7';
wwv_flow_imp.g_varchar2_table(3) := '4B0141077BBB3B04EC5E384FBB17CE59B1B77B41E82E1CF599DD9DF36430A30C78E6CB853E57AECF657A844E679D277B9E9C2F39C7199FDACF83F4AB7DC16C79CF4B9F4AFB5F5E1EF4496076F9ACBF9E27D46510C6B5A36B34AFD3705CEEDA5B27BD5D38';
wwv_flow_imp.g_varchar2_table(4) := '7F1B5D38778E4204E094D97CEEE6266E92C21475F02C2CC49A1558359DCE9277565E76DAAAA2C9F8856DD0C029D6409210914400CE9CBD94024EB70EB6CF5C42918E0CB4D6340B67CE5E26FD054875B6B9B94DC0AC32C853CC046C6F9F2520F4B9547FBE';
wwv_flow_imp.g_varchar2_table(5) := '7A80CE00E810804ECB41C9F955E65C804F14C979176C9F91F322FDC0571E6FBA4B2EA36D1963A2A84D805566A5482B459B5BD29F04197FADA43F028E7ED9EE74093823F519489D198FB02DD6D79AA0AF8D8D2D02B2F3CF72B33A8E56D42220DF5F9A207B';
wwv_flow_imp.g_varchar2_table(6) := 'D365C0784F321E937C94207C4FB906C67DE1946BE174373FF171B04BAA8899291B70287C82069C1AA8B1333AEB3E1D044C693B830190EAE1D4FE4F64E407E27844713CB4EA418BC50D30B38CE57C44D76A77286AB5254D191C655876FAFD43022CD921D9';
wwv_flow_imp.g_varchar2_table(7) := 'A28183C3033A38DCB7E4964F1E0D070460DE1C73EDE80B40798ED34BEA48936E45D33325354962020EF6F6E8607F9F86838141928C247D2414B3BFF0FE3BDDDE6CA290DB780DECEFCBFCFCFE1EEDEFED082E983169DAB8341CF60940BFDDDFDBA5D16868';
wwv_flow_imp.g_varchar2_table(8) := 'D0F806364C40D5307982382BA8016631088015947D75445E805724C66023F451540EE97BCCD2071B217C10A21A0D14E8EF45FB4B3502AE34974CF823036034140B4A602CAADD1DCA5609675B786D4022CA06320661BBDA1A48CF3B3CACD9175CB646C0D6';
wwv_flow_imp.g_varchar2_table(9) := '5A2DF3C8BAD5B2651FA50F24023018F48F8EC38E9F06CC7912AFD88FBA3815BC2CE040BC2978E1C539CC2ED1964811309B8A8E3CBEFDBD0BC60374D1777B9BD4ED6E90D61169818B3EE4375303665C90B1613886AF94C9387294DDB79258224902DFF2A7';
wwv_flow_imp.g_varchar2_table(10) := '9DEEC80038ED8A38DDED9F7DF3AF5C37C1882CA652D197C4C18B95998B5AFA03EA9C8BC7220A07AF7F115A0E75AC9B062EB6476596D79E58DC7BBBE7CDBC0AE656302F781C87323703E079DCBD9D0B643C1289185C6415F6565103B1CC9DC5234400664B';
wwv_flow_imp.g_varchar2_table(11) := '6F3CFCA865256AB73A045809C619A9C59E98FE8379DE7172D8583460AE33393F89DC9013F176F2644A4504747B1BD4156F7863F30C01BD8D6D02B49C33205FCE768C6B7F3894F977B9B6AB3C3FF0CE0D0ACA93979359110BD0B68DCD6DC21A14204F178E';
wwv_flow_imp.g_varchar2_table(12) := '57430389E9D7091D1E1ED0E141F9352E895C1B00D6B1604DC06AB47EF952AA2311E4441CED3B769202B40E56217B653450A5B7251EE6CAB4BB2982BA7456F5F971D5B74CBD3031F33205087557AA01E96B15DE53C2FD69F6C9399EAB607501C71367ED67';
wwv_flow_imp.g_varchar2_table(13) := 'AB72112D00B208C2AC3221AFB91A184A0400982D2193D24AA0C9F6D158032060D6C4021B5D963E18F609C88EC376BA06526F7C309119C99C3AB0B97D860078C140761EA2568B0078C900688109469684837DACC6DF959987C4C0425638B9B7B12591892D';
wwv_flow_imp.g_varchar2_table(14) := 'D29E9100F42500B2039B5BD2DEAD6D291F19141620146894068683FEF8698F58FA596C950D512E8059110B6C84713C34EB48C27DC9A6A193E9EAE461380A1A081A584F0D34CC63CE3CF86C7BA474C8791C9231412369E11B34305303125598997F5A334F';
wwv_flow_imp.g_varchar2_table(15) := 'B65B25E3B99393C9FE4707FBBB7470B047C1E2F2D759932893583C3C814D26166F9EC5E2666662661BD9517ABBDD26E028C1B2331A0C08B06487E4B106067D899408C687148DDFA88795EF3D99F3CFD25DDB5E6F837A42EFEB7967E3C240E66601177FDF';
wwv_flow_imp.g_varchar2_table(16) := '7C6636FD086F794364626BFB2C6D6D5F62D62D60ED427A7C96F0B6B2EDB397D0D699B3927FC6C80EF95929027CEB0B74CDD6C050C601C02565BB23E34AA723634B0A17FDE1C181595390C8D402E0A23FADF9AA92868B922BE113983454032C7201B209DF';
wwv_flow_imp.g_varchar2_table(17) := '466880795DCE87B4635A5B4C9AE43542DB4188E56B20F4852ACE419E87D300F0F5184C2440A2012112905771B38FE3F19C994D4AAD3569AD6CD913E92D999B6EB5DB923EFB824DC6912758FF801408DF631A48C4A84E3192B9D18B4F69B48C7E3BC7288B';
wwv_flow_imp.g_varchar2_table(18) := 'EDC28BEE4934C0B754BF7F487D8940A4B2541F5665661311D0514400BC7BC057BE40B7DA1A180EFBE6C933572B94D204A4FDDF7F7CC13B470017FFD39AAF4E6BC343BBEBD400D7C93CF09E5B03727EE4C6EBCF46A689C420F1A70F944103756A00FDB74E';
wwv_flow_imp.g_varchar2_table(19) := 'FEEBCA7BB25D5603A02B5E4257E60C314F8795BB4A45628145931C722978A200CF7426714C402E3B1CAE9806B48900686FA9D9CCD1B2F4152D70F797F00E6F9AFAC1BB19807C2656F603F974DFE3F4FC28C2EF3744124D20C727C92235C301054FCAA1AC';
wwv_flow_imp.g_varchar2_table(20) := '0AB2316602661C3DD89F78236B969E8841065450E5525898F75B0CEDBF3D62132AEDBF2C51C98874D422D7A77F7040FDC34317D9A9CD57F6968B9535CE64C63E304E706DA47312551F2E74551BF29BA201F415A029F2043982068206D6470305C796703F';
wwv_flow_imp.g_varchar2_table(21) := '32A77EDABF0903A0235E3F90CEB55C9C6BEC6EF4A8BBB1318DC789B464EC31ECEFEF117ED9E9446638688C06E065002E81528B7BA29BB88A89871909DC16FA40E6970783C9E7DC9D15AC39C1281E11903553A9C82BA292D1BBB6DD8E5CCF02175D966F3C';
wwv_flow_imp.g_varchar2_table(22) := '29F1A6B2E3B0AD56037DF1F6819D0BB711D03FDC17CF759F8EBF8D15FB59FAEE857304AC6A040D7D1BF0D3228BC7AFC5E3BF18513411AC569B5C9FECBD35669CE98748405E5F2A9FB07EC788446458BFD6AD458B8285BE16A73134A2A4064CFF2F59F6B4';
wwv_flow_imp.g_varchar2_table(23) := '142BE8F44FAA05F780C9D4D39332BDA5470640E661B4655E10C8936B1D911660DE10C8E7E78F61AD0258E10DE4F3EB3A86570BE07DD0F885A80BE76FA30BE76EA39DF3E70CF6762F9879B56C2E0D56B78158877D01CA0275C9D714BE711C13E092072B6F';
wwv_flow_imp.g_varchar2_table(24) := '01175D3E9FCD5A80A3EE95CF3E3A4E2DF498923811D8DF047654E0B4ECC8F9911374D45A564CC051C29C3BD9F9C9DE2BE062979E27894A8C8604AFD3451FF2FD348028E9FEC11E61DDD4A178FD7EA56482358BB4EEEE107EC131112302F02DBF6CBA44FA';
wwv_flow_imp.g_varchar2_table(25) := '3750560E5D706D52FFB02F11951001C8EBDB3D42E74BACCAB15C104654B3CDACBF6C6B72C2BF4669209C9B469D8E20CC823550BEFFA737FEF2E517DCD050DD123460ABF2C80068E32D4B021B61969ECE1D768959110BB274DBD6BC535CE6B76CF955A50F';
wwv_flow_imp.g_varchar2_table(26) := 'C47B07307F06E49F2F4DC61633A21240369706ABDB607F970E05280B18CB5C8E13312080AAE43C2D7CB4D204F8B537A1E17028086B01327DE1F71980ECB8AE6D7EAD8FAB1EBCBD1170D185FCD91A305147191787326E01B3A9EDB9C9785C1B1C1ED2E0F0';
wwv_flow_imp.g_varchar2_table(27) := 'C04ED8B01C449180B26269894603CC9A58E0E2138FDF77823A0117FD69C957E51ACA442C20CF4FB8897A2A2A90050D2C4B0305AEE7658918EA0D1A081A28A1017B11C5E2C5035855096FC04E9AE6647387ED56DBBC97394DB5FFCFE60E619DC2EAB553CE';
wwv_flow_imp.g_varchar2_table(28) := '97D3EF573BC703AB1CD8DFDB39D54F3328AD49693DDFC9F1280D6F17F0200D24156A00EF14D05144CC2C504ECE3847809330104CD540329EFBEEF70F64DE7F7F2A0D129915B1C0778D8689621EEE9B7534A8033C9A8C7814D3B4F75C149559B722027CCB';
wwv_flow_imp.g_varchar2_table(29) := '613D1AE04BBFEE742A6D202E7E4E7757F5BF44196A13DDF00E736CB5E937305EAA069871ED034B15E314559E5062C69453D4E4D0D4A5696056C54A9BB994E21E5EABD32500562A30AB12E4F565AE0B40C707905605C02B9179B0381E512CF33C55F03CCE';
wwv_flow_imp.g_varchar2_table(30) := '03EB0580ECD7A58EE79D867D6626662EDC54A51401BE05E3A19C3F812FFD7AD32566A5FD68B8B835115A6BD23216B8F40A99D239D46010BB74352DFF40BCF4038FB9FA4EB747406F738BBA1B9BC2CAEF1A4CF9DB230BC2A8015F1840B11841F33FF5D38A';
wwv_flow_imp.g_varchar2_table(31) := 'DA04F8366A2091E2F0DE918BDA5217775778CF8C45E6DF0A3722881E34704C034DEECE225B70608F9DABCA774FDEEC8DFD7D32A9F21A17C970E97DC708209D78918D5E5A5DB32B56A9E5AF67534DC96566E319B62DEF0DC81781970E0C06FD4ADF298E79';
wwv_flow_imp.g_varchar2_table(32) := '249FE7D9F3F2143DCE9E1A28FB0EEBA2F5AD3A7DB656C4B71D88DE00BEF481AE5A0D602D00E0CB15D71DAE055FFAD34E978CE7FEB1AE08B0E943472DD25144AD569B2EAEC9628A748BB01EC0562E4B07EFA18CB1597D597A53B6881EC512ADAD4A9EA8D5';
wwv_flow_imp.g_varchar2_table(33) := '32FA2262F2F9A46BD224FA10DE3B62D4B51E1100D394F02F68604D34D078E7A4F102AE7E471007AB7423CCE931FF4AB3A8BF6075F21955F9DDFF8F35ABBAFA8F316DDCAE4B20A564DE0F7011DAF2B10EA065DE1FE07706CC3BC50FAB7B239399935CE05C';
wwv_flow_imp.g_varchar2_table(34) := 'E9FEDE2EE1770E1209230136BD84F4721A805709942B6D2F35E81F1290BD11F2C2B95B08C0DB2201D409D8392C2607328C4623A9ECE40015C9750A48462DDF483C4FC097F9A2AF3B5FB99A4A3790310A70C987797F204F074F17C8A74F3F4EA82F73DD7D';
wwv_flow_imp.g_varchar2_table(35) := 'E9F3D3F397988A6E0D542A827F8424AD36A1D12816E03A4B534EEBFF8A220072F397AFB71257FDE6B9EAF27B9FA8534428E7F414B536343568E0946BA0722BA481FA748BA4989998D94D69A16066531EEF11F0F98D80740E664498A71A34D142B5B4334B';
wwv_flow_imp.g_varchar2_table(36) := 'CEE43FDCDF33EFE0CED2C376BA069815B1607AEE642A7E210C98CC2997823E061C1CC8F9326F761C11CE61C62D7B63E4DEDE05F31B11E96F45EC90F1C487C38C6CEDB7D99A0D664D2C703578381A12E0A20BF9A90686838119F3D2A3C9FF5A22300612E9';
wwv_flow_imp.g_varchar2_table(37) := 'D1823C05A233403EDD768C3E0FD8F2D72D5D632D80C0B75D58C3124B1FF6A55F573AB5AE0D0BED0A1A38A1012F0F3FF30AB2ED090EE12068600E0D843E3587F242D1121AF029529901D02AF83C66FFF07029BFCEC4E28D029DDE26011B9B6708E8747AD4';
wwv_flow_imp.g_varchar2_table(38) := '11F8280D3499E7082B1B40DA4A81455A4036757E95D6A4B4F6AE2219AF96F62E6021CCF864BFFA68219B48CEE6B6F776CF4B44E03C617D0090F19B28507142567FC56CBDD969CF37AB2D5B4EEF0635821073CE43892AD9DFEBD0C2AA7F814DDC8B111A45';
wwv_flow_imp.g_varchar2_table(39) := 'CCCA4676949E24B144BA62893A20F260AFF7A8C0827610DD03AAAE4ECB1803F8F245F40AF0A5B7D125E25800D96FC7605D11B073FE3602F6C6BF3E9BE58316B0F15B74BABB272D5AA245D427D3168BA826D4B13E1A68D245BB3E5A3D1D2D917B04510800';
wwv_flow_imp.g_varchar2_table(40) := 'ACEFC93627D8B7798BEA087EF25466004432FF02F8554BE6AD7D712C56B1CCC38C04BEE5E6A5EB6D6C514FBCFF76BB637ECB40471101ED6E8F80AEE4757B1BDED5180FF3F040ACEDC4C0BBE0920931CF082C598C89EAD11780898C820978DB1ADE8A968C';
wwv_flow_imp.g_varchar2_table(41) := '3DA182C58FC8B3480F9EFED8DBDD35E7382974C11FB15A891DF409C057D8D3B656C2572F191DF4139BA73AB294E9DB286A11D6514DCFBD988A73035C4C99BD3718F609984DB5C05C89F0C9E05F7985D009E0CB18E704F0A5B7D11DECEDD2C1FE1E99F72F';
wwv_flow_imp.g_varchar2_table(42) := '1C5BD3968CC79D2C5296E5EF5E384FBB3BE709BF8B03D8F82E2ABD32036051022FA69E82B129054E9F0000100049444154717343689665B7183D35B9963ACE471D3C9BACC3205B751A98D17710912C38E4542757E0B4700D98FB45BDB5FA72AFDC00C0DB';
wwv_flow_imp.g_varchar2_table(43) := 'AA005F01D2D5B1F5CF51617E1F80B70FD8E4C3DBB700B401B0D165E999A537383CA4814402B2F475D926D25981B2ED81550EF89687558E5F0AF3A5CFD325E26100C37EDF58E5F9FCB2C7B144AB0063F1EFED9565D3F8725A69027C05CD3C1C5FFAD34687';
wwv_flow_imp.g_varchar2_table(44) := 'F96EC0D66E8C31916E11CBBC3EB3DB0AD01269056CFCF2E9A3C1801085C8A7AFEBB1521101AEF62599872ED1E73211C7241B6724C28228A1ABBE2C3FAB37FBF546AC2F029239C7D98C7FD1AD2A5AE0D4D07B5C8CA746170B6F28BC25A05CC5B898A8D649';
wwv_flow_imp.g_varchar2_table(45) := '57914D2ED872D2AD4A29F7CD68555A72EAE594BE9A5E13A75E138D5540B5E7C7BF99951B00580700F88A30104F6D2056AA2F7D9E0E2B39817C7AFE18F36BF0ECF3E9B6E36EB747580B905AE66E35F565FE07C089046C7C572D3DF5C8CBBF310BB711C0B7';
wwv_flow_imp.g_varchar2_table(46) := 'DD89B1CCE506EB5B204737180E6A7D3E1DD6FE50EA180C646E55CE79AEFA953F44744C69FFA73670ED012BDFF09A1A90798A36F65A740DD8F2F3E92DAC1598F29E803C5D769C5D4F880220DA9AA5AFEB16F71EC0B77D65C7378C33806F3D36BAE1388280';
wwv_flow_imp.g_varchar2_table(47) := '28C0DEEE8E8DACB674F79DADB6AA8F31160BB55E8F8D89998F5518768306E6D1407903659E5A1755365C2A8BD274B97A98319601BEE5D7BBBFFA6AA1F174E63E38BF944538546E0098D5AC512432F87550BC950D56EA6834A291CCC748C14ABF980F524A';
wwv_flow_imp.g_varchar2_table(48) := '132B65E0CB3CA347D4007095431B00AC03005CF4A7251FBF3301146B6F227DA15C7F188A670E14ABAF38B58900485DC54BCE2E3132D741F988CB6CEEBEB92C06B35C2FAC9D05520F2A76D29D5682918C6980ADFD98CF076CF9F9F4745CCACE8FCA675B8F';
wwv_flow_imp.g_varchar2_table(49) := '210360256868064B1F64463BD94B4225E33CE0452C44F8255940760B7DA14BA050A119C4F1788D51F6BE8019A4956641B395324C99F99DAC9416FFC5425D82F5839A0382068206A669A0C8351CAEDF691AAC2FADC8B9A94F8AC5713E6DED8566E59AC2A6';
wwv_flow_imp.g_varchar2_table(50) := '308A15A8DC00B868A132B1B1DCFC04C21C1556ACFA515FA472AD42662572082E9628B687F705B45A6DEF42FD7E9FFA73AC69F0AEA822423616B6DBD32B5B1DB3E85F50B83CFA3F50B060122704F816C3EF57009B5B67696BFB2C611F7095CFFA9DE9B715';
wwv_flow_imp.g_varchar2_table(51) := 'FE6680484F80ABFEBAF3956652DA3D3C20EA9588F18E95EE557A44B4261F3CD102E49BC3AC88055A47A405F97CD731CE8DD2FED7ED40C625C0C5B769F94AFA20FAA2AF5C4A6B5252C6971E7D16F0A5CFE892F15300D97155DBF47D017D1A0E8682FA9F8E';
wwv_flow_imp.g_varchar2_table(52) := '5355097E920F139519F4A9991F66690F019EF2C98058EF9A064F390299B70698717E01EF2281F04803252CB5A3B2612768A06A0DACFA758CEB0928AE97A2256A320088B09AB8C8DCD640BC66C0B701F03A00177D24D635E0A2B3E5A7110D95B6276AD9C8';
wwv_flow_imp.g_varchar2_table(53) := '8ED2D3350D2382B53D588155E2B09681A306E47654C139B55CF1546F5A4B320BEAFFC6E3B934574D51D426006F8504B2F38CFD5E6F839835B1C0C5277B9ED7453777BE9C0702E666540F83742DC0B2D72ED4D3B679B866E3419E07C646209FEE7B8C310D';
wwv_flow_imp.g_varchar2_table(54) := 'F0A5CFE4486AF25C7DE5284A975D97BEE5B48CF7BAC07863227923FCEA67B11B2EA23A80AF5C191DC61400EFA401B2F4FC166F173C30BF5E9A90CF7D2E5FDEF7B83603C05780D5A12B7A032BD6A156470F25242DAA3A53C532F527029B888011C4F3DF32';
wwv_flow_imp.g_varchar2_table(55) := 'E5F5143190050D9C160DC825ECDD54B9744DD0B648016FDA451216AFAB360300D629E02B523CF6DC60ED00AE728BF6385AAD16155A0B70D827FCE2A1AB1D8DCFC78D1058B0A0E9DCBAFF1C18FA0CE0129359110B3AE2E5773736ADE49D4E873ADDAE353F';
wwv_flow_imp.g_varchar2_table(56) := 'CBC83C88C4AC3D987F35BCE1379C6CB7568AB4D259B5B56FB5F1A422EF7AB0921AF02EB0E68489C3D3C6D808945503A20740D1F243E95B40D172CBA2D772AD02C5EA67D2E8BF1E115B1A7FE2B8D8534789795F49F18897D28A003C59D6EA7489391D8FC6';
wwv_flow_imp.g_varchar2_table(57) := '621C6D52FEB1DC430E0C8E322ADE5115F30BEC8206A66BA088453E9D4385A94CCC5C1D3FF120EA5FF351A1BCD5B53C700A1A58030D980B78B1EDA872FC194B5E66539B01A0C45B018A0A957A7E9893295AB25EFAA8D526C0B796781CD1C00A53C0B75CD3';
wwv_flow_imp.g_varchar2_table(58) := 'E8AA89B430E98216392E49803C3FBE721ACBBBDD360600B3FDA68A730DF8559F50BF2F119F1558F3E1D71E22680620CF0FFA38E049EE4D968C3DE94462B48077C12513221A024C1783298A22817B4DD1F4F2441AD793802D1EA4ADDC703058C8EA725BFD';
wwv_flow_imp.g_varchar2_table(59) := '85D395DCA28082058BAE1DF01D3F0A8A31419EC9C5CCC4CCE61769DBEDCE045D96D03FDC371180EC3AC8D2ABDAAAAA18053E410341034103D56AE0B809887DA0DA1A96C78D975775A8792E0D882D3A57F9E2857D160216E78A12B51900E62900B1725149';
wwv_flow_imp.g_varchar2_table(60) := '110C867D028A9459042D331B8B4DA98800DF3AF16E03C0973ED0A51A803709A447EEFFE6397499C77351C2DA065C74CCC5CE77FAD447DFC5D69A8FB60256828667CCEB41C1BB07FA07E2F108762E9CA79DF3820BE76807389F6ED337A5ED515D1E51556A';
wwv_flow_imp.g_varchar2_table(61) := 'B6F547664DCC8A5849FF2AE1D9E6E5535A93D23A9F6C3D461F1B8D8ACF5D5B19D69D211120020AD6A35911E05B0CBF6701B8E811A1465F77D1D9F2211390E5B7C4FBF789341EF60FE840A20159B9AAB6AA2A46814FD040D040D040651A3872B3E0F58F71';
wwv_flow_imp.g_varchar2_table(62) := '22ADB29A96C088A54E40364BFB42A74BAB7C0D2AAE4E7FCCE80B4079B5942D59BB01C0C6E2D5DEF28D06431A0D9B6BA146AD1601BE0D825509F8D2AF2B1D8BB703F8B62F31ABEAFD2FB244BC04C0C65FA93472C305E5C0B9066C7CB3F4EC39EBD110FDB7';
wwv_flow_imp.g_varchar2_table(63) := 'C41A163415C818AED83631ABA28B3F0591C84D1DC02FA1EDED5CA0ECBD0A993EF36A48DF9476285181DB0C0E255A00800790A75FD631FA2290AF5F8BB7AE7575C3AED6116941BE1EDB71323E4F88028CCCF3EF36CAD54E2F7A9DC772CF01EA6E755EAEEC';
wwv_flow_imp.g_varchar2_table(64) := '388D98B7ACD567FD1E7D0AB01216CCA8AE2716AC7826B90C0AF5AFAA9E2941C80C1A081A589006125CEFC03CF5CD5B7E9EBA57AE2C2C4D60E5045F6381E7890094578B525A93D2FE1E7AD1AA9456C25F79174B2DFF58E6F81241718FC2BBA2928499C5E6';
wwv_flow_imp.g_varchar2_table(65) := '5B7C341C506A699FEE0B0EF35E80AFDEE2F15314BEF4D03160A36F49E406B0E5DBD28B9EEFFEE090001B3F5BBA6DCED846DFD4749C03C057BEFDBD5DC21BCF8A9EEF8C7FBA4A7A9FD208C28EB9D68AD49FF1A97A0B19803C5FAD3501F9F4B2C745FB6756';
wwv_flow_imp.g_varchar2_table(66) := 'CF68148BAE9A1B69CDE45412DD00B263DFAD529A005F7ADFFE076315F0E59BA78B2289200BF2E9189B5AAD763E79E2B8DF97F1453091513241952CB780626B74C344538005682D541134B05A1AA8F2C2A892D76A6931487B7A35304FCB15331333CFC363';
wwv_flow_imp.g_varchar2_table(67) := '66592D161C3093682233A1A1CCA536F18D555A2C4B6042E4990989B1B6313F3C93AC81994A490447B02CD1606D03AEFAF15E6EC046072F02B0E5DBD275418F0D4F7C943ACFB144BB80A982B07833CB3D0FE4FBC13D1870D00FC48B014C844CA2640E7267';
wwv_flow_imp.g_varchar2_table(68) := '76E6C1EDEFEE1000DE80B3604D04E88BD3568B97F5D86D626AA509B0E5DBD2119D006CF94D494FE7C6A3C2E228AD49695DB81CAE5DC056301E0D09B0E5DBD295630D129E06009815B1C0C6077D7AD0EF13C644C046E79BAE7C0903DDBC1AF01815E7ADE2';
wwv_flow_imp.g_varchar2_table(69) := 'D4965F846E0B18C9988F064EEDF96842C317D1276CED44DD802D3FA4070DCCA381C418002987F9FED76E00B0520414157328961650B45C9E1E7503F9F4B2C74A6B82575CB4FC48BC3BCCF3162DB76C7AE80E98570E2DF35E40513EF1682416B77BAE3231';
wwv_flow_imp.g_varchar2_table(70) := 'AB9BED745A29D272EE8AD6AF11C1529A9859A09CC553398A477C46D24EC05601B3D42F6DB0E5AF5AFA6030A0C1A0FC7B139815F13164ED4FF51F53F66B6AA9C7749865D7BE4DE43A4FF0048B188090255FA192BE04E4D3CB1E2BE9134A71E1E2E669AB41';
wwv_flow_imp.g_varchar2_table(71) := '89A7550AD7345F016626662ECC84994D39665CBBDABB3CC668C05600661D60CBB7A5A773FCF655FE5939440180EC38BF459F02101D9FE7FAC9F8AA6C276C0B6880416BFE6127A0F11A907325034269314D59E1E1CDA0CC10E1605EA47A07AB6664D7A0A3';
wwv_flow_imp.g_varchar2_table(72) := '66344CA45874DBD03900A93A7C4F9506E66D6CED068016AF0B282A685516AA529A80A2F5DBE8999998D9966D4D4F8C6720F3BC568AF5CE504AC97950851B19C723026C054712291A89F7EC7A6C94C54B9A2792A14D3FF69F8B84850ED8E4CEA74B508F80';
wwv_flow_imp.g_varchar2_table(73) := '7CFABA1D27E3EB00F3AC98FF2FDA3E66452CE86D6ED171200DC8F3C3130688062CEA1DF8E88BA311AEF3E94640D9EB20DFAEEC187D9AA56F67C7BEDBF469AB1165E7C3B7DCAAD1A5D7ADF6167B64C6137B64C4956FAD48C63F02AC046946D46A11901ED9';
wwv_flow_imp.g_varchar2_table(74) := 'FFF70F0E08B053F8E5283FB22AA88ADF34ABA8B5361E6BD69CDAF41418CFAF8175EB6B121E77196C339536CD009F9676C4444C2B53E75142CD3BD36FFE35571AD8AF95067C2EFAF91B5CBB01A00BCEA1664D3AB250E5C24D04597A33B64C1AED92796DF2';
wwv_flow_imp.g_varchar2_table(75) := 'FC94B61C3DF9379D2CF5541431A7F09517BFA80658E931D60256826A32B458E6802FB7A21E673C4A28369EE3C91AB06E027D8D68310302D5FC415464285E56D96A3ADD1E753A5DD2B8FE8EA12D696DC9B3F13D3CD823440330960036BA79D363695B6C22';
wwv_flow_imp.g_varchar2_table(76) := '52D33965D7C1F4DCC5A78E445660F135CFAE9159130B6653B973E14D036ECA942276BC1110E71648A9FDFF8FA45F00AE121A7D5AA1ED1827B5953CBB3F161D67F20C553EA19663639DAFC700568B7E02D3A0019900084A081A081A081A20DC2F01872AAA';
wwv_flow_imp.g_varchar2_table(77) := 'C85E8C012092EA8273A852C47CD3B9C2C9391958F180215A817F0956060B5640D45A453416AE58B9BE95C06A066CF44A6B525A4976BD0666DA7FED16B90870E21B8FDF64883E0A9CC89C384828B13CC5D0348F7142F48209F0FE8182C58EC8A3565BE648';
wwv_flow_imp.g_varchar2_table(78) := '27DF98D692748059110B8E0A8C7752FDC674804880609C5CF9066D032A673C932193525A1051D10FAE2DA068B9BAE9B5D604CC5B4FDA5FB0FADE6F7C48AF5B3C4D7432AC988CD7AE64FD685EB95CE55B12716CB527FB79BEDCBC4FB9A83CC3701C341034';
wwv_flow_imp.g_varchar2_table(79) := 'B0600D9C1C6B165CF969AD2E28FDF49C79B9F9CBB7487B1B37EB3C217C35090B330022B16880A2620F867D02F2E562995301F2E98B3A8EC48B057CEB8BC71EA12FFDB2E9E0450155CBD16A77A8D5765BB659BDA3E180E0A124724502597AB66566C25F76';
wwv_flow_imp.g_varchar2_table(80) := '5CD756CBF9069835B1C0B79E58E658011B3DDA24FEBF2D9B342B032BC18A65C48E39565B73948A086096B32DC8D331A7E958A701E4F3B363F3AB6A833E8D448ED17032B298D195DD8ED05F0565CB972DC74ADA2F285A1ED71650B45CDDF4F0FE8179EB61';
wwv_flow_imp.g_varchar2_table(81) := '16BD082289104532F6F8F2C3357BBC7F601D12E05B3E4FA7B9D875ACC7E34D9E4FFE7828F7C7E1682011441945648CCCE7BB8E176600B80409F9A749035CACB1C65933FFA6972BC86E3A93907A6A346006CA19FDE9D428223474BA069ADF374EC86DC435';
wwv_flow_imp.g_varchar2_table(82) := 'FF4E24FB1C2CCC0030169858613E421DA729FD6EF5E34CC2BE5503B074813C81D29A94D6F9E4B98F11058A5A11316B62811FC3A4368FCDAFFE8B54AD76BB780463864708DDC766F5FFF40BD83C0550E069938B92CEB75757BD652361916704B115C9F911';
wwv_flow_imp.g_varchar2_table(83) := 'B85A7FB0BF4F07FB7B2E32EF7C78D18077818A09B5A7C798AFD6442C249A3AD7639979A6338E7DFB952FDD8CAA308AAA4100001000494441544E64B55B1D024E24CE38C0DB0081192485B2949C1FC0B7906F7F4FF925943E0D50FCCD9A2A65D0F0FF62B1';
wwv_flow_imp.g_varchar2_table(84) := '2354DA70298378DE1A10975DC272DEE48670FA0D1259D23DB05961D8DBB6C28D0AA2AF8A06D0FD805591772172365921D5296061060033133313E6F100F2FC24667574221EE0D058395931ACB405B263DB56471101B6FC45A72772B702165DAFADBEC4E8';
wwv_flow_imp.g_varchar2_table(85) := '176F2EB351D493DE6EB5A82DDEB42FF78178D10399EFCAD3639E0E5E743EBDAE6363994B9FF2E58F3E0AD8E8E165E077226CF9E8BB802DFFB4A42BA564EC700F57D095F6885C6591887EFF908079F5381A8D0898974FD9F22C0501D994FA261897E2C58F';
wwv_flow_imp.g_varchar2_table(86) := '03A5842D51C8F40BB96E75D422C0C56270D8A7C1E1C5DF9030911219835CE56CF95A29D21EFD325F1EB202F9F4FC711A0118E4939DC7EE2BCAC9621104A7C31A5B8426D7B78E05F611316489E6196E297CEAD4803935E65F9DB504DE41039E1A90BE68C6';
wwv_flow_imp.g_varchar2_table(87) := '0C4F72075995D90B37005A9D0E01451B3192792A202D2711011CCFB0C89815B120A56FCE7F78AB4073245A8E24AD4E57FA419758CE11E092C2ACDE166F0D1E3F90D1A71E349EDBCD524E6EC11B20928B90E6FF6899CB8325CF466EED64683C07E9ABD639';
wwv_flow_imp.g_varchar2_table(88) := '56785D408E5324F3D8402E7971875017B0B81A67D6A49426602691643233312B02AD4FA4B17FB06FDEA99EC839008445A9AF59AB3428EE8195AA6C4A21160F139892E591941056B8031EC40B2061525ACEA1D654F5A7D3E95147E0E21B8F9FDA42740818';
wwv_flow_imp.g_varchar2_table(89) := '49A4147095CBE7A32F1A28E997728EF2F9AE633C6906B8E8CCD300122135911C89E6B8E8B37C95EDACD2D6B46F810EDF2AE9E674CABAE8CEC04472A321DF8F8867FAAC2F7DA0CB6940F49D4B711F16299398C7A8DC3CD799423AE93A372FDFB622D76FBE';
wwv_flow_imp.g_varchar2_table(90) := '6CD163D315CDBFA225A7D0579BB47003A02573303E164DBE99D91B8FB01D0EB0DA717687555A8B1559BD05792417AC39E02861B576E0450336A999D23F5BFEBCE9CCC25FD06E7708F0E58795DB07E2B565962EE6E9305F672BAF34FA81B265974E6F175C';
wwv_flow_imp.g_varchar2_table(91) := 'C380A8CF347DC3AB00F28298B50652473E7D51C769A423AAACBA644E0F5B694D5AE6707D056AB5226A79E82F11CF0E3838D8A3FDFD5D5FF6137423B306A0FAF70A4C546449505ACF35DEC1FB8F637B24CD526D6DC9323A103357CE1F7D48479AA2569B7C';
wwv_flow_imp.g_varchar2_table(92) := 'DE0B904688F6A96C8407EFA4409D651BA2A356A17E8F3106F0AD4FF9125649C7CCC20E904DF8060D14D58071A7671B804559D64BBF4AB2D6AB89B2DCCD9051B670EDE5C2F9AD5CC5B5DE1E6A655EB92A88202F4044157F166E00609E0A88C4B289649ED3';
wwv_flow_imp.g_varchar2_table(93) := 'B73DB0D201FCA217E02A872803E0A22B9BAF9526A0687958D940D1728BA6D7E2510075D77B712D802666EDAC2E1ECFCDED9CBF8D76CEDF2A7397430367C18A0932B97DD90E870302F2F449CE336656C4823402D0CE9337FED8B62623F5308BAF32872E00';
wwv_flow_imp.g_varchar2_table(94) := 'A26203A0F1BC3C220034FE98B51A728E30DF0B8C939D9BD1686856FF636C026C05948A08B0E5CF9BAE75445A50964FBE1F96E5336F39E848298C03C5CE77D17ABBDD0D0298D3EBCD561EE7F4386C74B6749C13C096EF4AD712F5D212B170C999F1C19352';
wwv_flow_imp.g_varchar2_table(95) := '4076ECDA2A17417DF9F59EE0FAE40E9CEBD00073E80F477A35BA08FA38D247D377562E22D574852E52BE55B8CE4446F91255AF97A51900ED4E87DA9D6EF52D1A73349653010F605CCC7BA39422C0BBC098B02996B6CD531B8B494A6B41941DD6B6656662';
wwv_flow_imp.g_varchar2_table(96) := '66EAF636A8B7B159793D8802015533664EE5C63C22E0E23FE8F709C8D3659E67966E3C57B1FA9953FE59FAB2B65A22758077FD12D19090CC04792237496022C391A034FAA172504D66C3EB029835B16092627ACAE1FE2E1D1EEC89570FCFDE3DA7DFEF1F';
wwv_flow_imp.g_varchar2_table(97) := '52DFAC499ACE2F4B55E2C501D971D3B6785705B06CB930A60275CBC19C5E5FBDCD4DEAD630EE64F26B896600D971D9AD9631016383ABBC59AB50E0372E8A5F592E091A91CF447282297CE6D080E8708ED2A168D0C0CA6A408C15EB639B2BDBA820B84D03';
wwv_flow_imp.g_varchar2_table(98) := 'CC32D601368286A47B8B6196A4987FCE224B33008C4503ABA6A887E1689236FC22D23A8583BC74362B45405106382D40D17295D35B3CB5AC1E66161B8AB3C3DAB7DAF48548A2423D83AA2A84D50C54C52FCFA7DBE951D723929524233210BD230A8495BA';
wwv_flow_imp.g_varchar2_table(99) := 'C0747EBD7CF2D28E99D23F5F01F0440390A78F65AE1CC8A7D77DDCEE7609285ACFFEEE2EEDEFEE582301388780F1B83C9EFFAF7B3C2ADABE3C7D122704E4D3AB3E86770F90F42B9AF2D112F101A664D592949D17AC07E8F6368959C675C1BC95657CB271';
wwv_flow_imp.g_varchar2_table(100) := '6D5E7E8862022E3EC9F8A99691E5A994448C5B83312335DEAED986D7AC3DA7B139AB740E455631984EE3590A6D0E1A582F0DC8B5DCC80615114A5C4CB9D1FB9458BA0180B732B5DBD5AD0500BF8E8747E6A31C1F1AA522027C684133124F08C0FE323132';
wwv_flow_imp.g_varchar2_table(101) := '16A2FDB95F58E94AEB858BD8E92202D0A5A8DD16744AD7AF4D24A8455A47A405A519390AF23812843EDC96688083DCFC02DDC1FE1EF50F0F0C32FAA8DD2120E397A52F7B0B6F0CF095231947387CE95D74F07A00179D2DBF85E7BDA52F641E998D2E9F9E';
wwv_flow_imp.g_varchar2_table(102) := '8C3D294401F6251A903D0F3E146F1FD8DBDBA53D89106474F9F2F963AD1469A5F3C9951FAB82E35126403C7EBA263BAE6BCB4A11B3FD266BF285A6AEFA6D7C5B72FD01D99A806CFCB0D1BBD23B1279EAC858E6A2F3CD37EF2D90BEEC4B8FE822A25379FA';
wwv_flow_imp.g_varchar2_table(103) := '58C6FDE4D8FB1E549E6019C7CCE810C0326A0F754E6A40CE857C27D31793C2BCC4CA17D3C450CB0235C08CFE0494AD543CAA7C514F0FEB62B179EABFC8652DF61AAE0AE679054479A0BAB35525A7E3BD79E906801ECFFDC26BEF7878503645A02C90F1B3';
wwv_flow_imp.g_varchar2_table(104) := 'D1559DAE1ABEBAD7D65E99F123C096CFCC332D755BB9AAD27B321F07E09C02CC8A58E0E2AFC61E109E28E86D6CB9C82BCB6F4BD40960D6C4021BE3E1B04FC7C1D226A02BDE02E6216DE59695AE7444806FFDE6A9068972E517D1B9224EBEFC8BD231A7FD';
wwv_flow_imp.g_varchar2_table(105) := '18EB00DAA2E3A2E5330FFFF0709F80FDBD0B0414F39899B444D3303651CD1F13B99BC3834EC4B0016A16D3CA5E294D8095A0E60C2DFD1DD8D8DC2683AD33B421E8C878046889260188D601189B8E03B41B5BDB8468025095B8CC693FC6BB730017DF8144';
wwv_flow_imp.g_varchar2_table(106) := 'AA803C5D2CDE7F22513A19FC4D9632FF57FE1FAF7C0B1AD58026AA532E005F1D31A301806F89E5D231435660B97254563B5C0CA032862BCE08A71658F16604F197A5816AEB4D0DBCF4026D8C0100EB1C805505F836195659A7B76156FAA2BC6FB9AAE830';
wwv_flow_imp.g_varchar2_table(107) := '3F09F8F28B4731C5A354F9BE65AAA74BD2D5CDC3C95F2F331E346BA9B2192316CE29B02956F8E6F619EA8C2DF1E35637F6E1EDF736B609341B5BDBC4CC06D290857C99D3FA7AE6B9E20DA95B19D82A674EF37B9B5BE63964E6B4BC8D7E59E9CCE5E4C220';
wwv_flow_imp.g_varchar2_table(108) := '633C8DB1E0883601E343EF0D8B370B7817B010B6658E17C0D80258C82A4F5688482DF07AC2132F40D986608E18285B7EDE727A1C119E974F55E5F5382280BE036C8C2303884E02189B8E23A3AFAAFE3C9FA8D522209F9E3F8EC76B3A12F1F6812C1FEF7A';
wwv_flow_imp.g_varchar2_table(109) := 'C03B60B26395EDACFE9657A809CB360044550D1041A428F89D758E67E515AC664E7266C802CCC928145F130D84BEB026277229CDA8B3D2C61900B0AA0CC49B834787F90E408FE75EDA9D9E794E7C6BFB1202609501752A6916EFF4370D2221F1BBC8CDB3';
wwv_flow_imp.g_varchar2_table(110) := 'E009DE89BE9C3B30ACC124B6D7AD1ABAA68199899909E7DA40E6738F5BDEB08A0139114BFD661EC0A6442136256A81BE0B184F5045847D009E3F90D12F55E819952BAD496925142CF0FD26148BE701F896B0D1A98AE784CDD82251244401005BBD55A5A3';
wwv_flow_imp.g_varchar2_table(111) := '4F462D8C0F55719CCD476B4DC06C2A7B6E2C73C4809D22E42C53035857D06AB7652C54062E590612E5054C442E91C8EF60607ED9302BA7B29DB09D47034506C7B41E3917E9CE52FEC30000965279A8540C99F55742D3FB57F16B76B5CED9BAB76FB5CE46';
wwv_flow_imp.g_varchar2_table(112) := '7969A79594735BD118D25803201ACF75C04B02B2B9173C5B0970457383D3D45B242D95838D35C68CB973BFD2B0B24766B5B41F7D5554F0CAE219118056D426A0AAFA4E2B9FB45F2842DF0536B7CF98F509D8C7130A5A47A4054DD70FB3F46DE2C2628E24';
wwv_flow_imp.g_varchar2_table(113) := '02707CAEB130837101A5B54420FCAFAB7131E7A6D7DBA09E4402B288A2B340410266452C30D1AA76A760E9F2E4E8535A6962A99B59176614CB79030A179CB34016E19D93CDA929DE6EB54D34D4D5E0ECFD15D97B4712893E03593995ED84ED3C1A900152';
wwv_flow_imp.g_varchar2_table(114) := '064A7F0E4DF78EFC5B12284F8106A47B9F8256AE4F13311601EBD3A253DB92BA1B1E0C808A34DC6AB5A8D56E7B73C34A5BC0BB404584E6396D9917B2B1CB222FB6FC907E1A35C0C4053DCA443C4920D596CC3D4AB40B7D2F3D76FF4FEB53C48CBAD95DA0';
wwv_flow_imp.g_varchar2_table(115) := '2405A289C0C6E61902B03E0328CA8E8D7ED4C41A8F2C12440BFE141D8F32F1F096C3E1C0FD2B88197DD12DFA443223025994DF69A56F75BA0464FDCEA60778FB40FF709F803C9DCA2784E3A081A081A081490DCC79135EB5A097181E44683340333EC807';
wwv_flow_imp.g_varchar2_table(116) := '4032DE9AB2385E55E0640175C90FDE405DFCD7856FFDED080640453AD6329F0BF8B2C3F398802F7D5574F8A53620CF2FCCC1E535128E8F6B406926A5FD870BAC6F01A8E447692DF5159FC32E591DE9F1F3E7668DC6E6166D9FB984B6CF5E425BDB670D10';
wwv_flow_imp.g_varchar2_table(117) := '1D00F0CE09205D9374C6E4199A33422730E5373649171C0FCACA6D2BD76E77BCE688F3E563F3FCF8C8FC326022519C7CFEBCC7585F104F8900E05D2AC0BCFC4F4B7966266626FC8261A7BB51BAD9AA74C950306820682068606D35C0D2324036946DB19F';
wwv_flow_imp.g_varchar2_table(118) := '219F963FCEE856751B3CF4659F39DFFA99D1F700DF1217E9820170511773ED651E842F9391CCB301BEF455D1C1AA07AAE217F89C0E0D14F568B1BE0528AB9DA2F595ADC7552E9BC3CFAEEFF6F8FD13D97196EFE2B3E8FC4C2E3D7E7F4AB1FA131A0C8782';
wwv_flow_imp.g_varchar2_table(119) := 'C9378516E333499D240901933921A58C06B2355BDDDE86890614E5110C80A21A0BF441034103853420637E21FA40DC040DD41901A89377137457850C8BE1110C808AF4CCCCC4CCA45464408E4FFA46C051FA4EFE517DAB6EF362602536904F17E909C8A7';
wwv_flow_imp.g_varchar2_table(120) := '87E3A0016880952200FB3E48C6CF1B631D401C8F7C8A9CA0D15A939679F41389E1A0B0065AAD3601450BF60F0EA97F7050B498931EFD61349AEC0FDAACC16839CB0782E91A68B53B04A4BF95B241CC8A58309DFA62AABAB81BF6820682068206EAD24051';
wwv_flow_imp.g_varchar2_table(121) := 'AF8FEB1224F06DA406C2F93E7E5AE6DBF7D7653000E6D3F4446955F05DFAB08681094615278C24CA00D8D8A61ED7E2565DDBE408E9CDD440D9FED1EF8B272928D62A26AD954053F8CCA78148220051AB254CFC6F0A422CF3F42383F4BD00D5AD0598CE8F';
wwv_flow_imp.g_varchar2_table(122) := '49C9F9563A9C6F9AF3D3964800B0B97D9680EC4D9788060079F6C100C86B241C070D040D344003C56E580D10B8C122882EE5DB60018368273450C301A30364B8C83F1800177551C91EDEA3DF8A6071FBB11BE57E9DC9AF5471AA244E08285E3294081A20';
wwv_flow_imp.g_varchar2_table(123) := 'F1C62303664D2CF0D5C950BC7FC0971EBC9915B16281F22D16E82C1A60163D0A22DDA228F27F5369C6AEDF3FA0BE9CC3ECB8EC368963197F628ACD7B062EAE7932E75AE4634EE52CCB3F943BA901E6549F78CB2590BDABC2BCDBE2CCA544924FF2095798';
wwv_flow_imp.g_varchar2_table(124) := '28A1FA2F57CF32700C1A38351AC0F5039C9A0637BCA145D76F146D0ECE3550B4DC7AD2D7DBAA54CFE97FA2600054ACED7435AB16AEBCEE1D9F00001000494441542C707F87C33E0D479863ABF7228B4743026C1269895A00B6FC901E34000DB4DA6D6AB5';
wwv_flow_imp.g_varchar2_table(125) := '8B7B9228EB032DF3C05AE6837D68038DBF0674AB45807F8994124F0C01880200696AF1FF07FB7B04E44B6A8DC812C6CB7C4E385E84068201B0082DBBEA907B7F7856DAA5A4901F341034B03C0DC82055B6F230B815D0DC6249830150B1BE9959A6579894';
wwv_flow_imp.g_varchar2_table(126) := 'D282887C3FF16844A3E1C5B931DF72BE7478FF3FE04B1FE88206A669002B8C5BADBA2300C1239CA6FB79D270CE80B23CF04E80FEC13EE14922C0978F59F52FE3DA7038A0A1443BF3E5B489F884F39DD7CBA28ED5A22A3A5DF5B03417908DD7770EEBDA8B';
wwv_flow_imp.g_varchar2_table(127) := '7F200A1AA84E03CCE8DB40753C03A775D600C637609DDB584DDB16CD25180035693C6A4514C9BC9B2FFBA1B190B116C0B74431BA783822607A2926638947FE110B0A9F53A9011EBF11B0DDE952BBD3AB5C0719FFCA199F7286CC6C229351BB4340517564';
wwv_flow_imp.g_varchar2_table(128) := '6F763CD893B9FCBD7DB3A23F89632B1B44098083FDDDA973FF5941A52302B2E3B05DAC068201B0587D37B33616B100D9846FD040D040D0C06C0D2494CC9CD7CFBCFD6C3B9B5BC8CD34B0F86D30006AD239BC7FC097BD992B1BD4150148284E2402104FAE';
wwv_flow_imp.g_varchar2_table(129) := '31504A2C70C61CDC6A5B00583F0160A532807D2091810AF03D0F81CE4F036D1301E892E93FD287FC4AD9A9F08CBA41AB4D787B9D9D32E4CCA381AE446D3AED6E6916B18C21C0DEEE05DADDB940581700E05A03F6C5E3DFDFDF23E4EF497E32FE4D085B85';
wwv_flow_imp.g_varchar2_table(130) := '6CDEF7B0DA638FAD6DAB901E0C8055384B73CA28F740A2608CCFA9C5503C68603D34C02C375C60EEE6CC1854CCA0337705A78AC1321A1B0C809AB4AE656E0B60D6C4025735B0AA8144E6D50017BD6F3E220BB0CC6D16C0AA5BE0A9C7B12B1EC7798343F1';
wwv_flow_imp.g_varchar2_table(131) := '4080BDDDF478F7C2790206FD43027CF516E8666B80998999A9BBB161C0D2C7015B29E4016DF140816E6F93808DAD3304F436B708604EF9DAF884F4F934C0E3351CDDAE9C37390765B9659EFDE1E13E01D9F586B73E022EBEE80B801E8F932EFA905F8F06';
wwv_flow_imp.g_varchar2_table(132) := '8201508F5E1BC67586A56E2465F37FBDFF653AC8B6EBDDDA45B78E39EB43D91612603F831C1FD1C87EF8060D040D1CD3C07276830150B3DEDBED3601BED50C8603027CE95D7483617F263FCCB71659ABE0AA6F51F9F0E601781B80ADDE2419117020F392';
wwv_flow_imp.g_varchar2_table(133) := '5891BC73FE3CED48540065015BB990EEA781CC83DBDC3E435B67C49BDFDCA68DCD33B4B57DD600EF1E07B6246F4B68F05E72A0D5EE109095F7AB2D5055A501E81EC0130140557C7DF974BA1DEA74BBBEE481AE260D0403A026C506B60DD640989FACE9E4';
wwv_flow_imp.g_varchar2_table(134) := 'C0DBCF5867FBD866C8F2C23668007D226821D3C0B2B6C100A859F3AD4E975A9D0E312B6281AB3AF3C6ADC3431799331FEB080078C780AD402B6A1160CB6F6AFA6020910D4151F9100D00100D000E0F640E5350944FA09FAE011D45046473CDD3A9426A53';
wwv_flow_imp.g_varchar2_table(135) := '34D0EB6D1280280050B75CCCE99AA856BB4DAD76A7EEEA2AE78F3115C0BAAA6948C4B9002AAFB82686AA26BE81ED090D88B55B64FEB3B24EB4AEF3DDEBDAAE139D261C040D2C500332462DA83666D4052CA8C2855683B129836FC5CBA30B0640CDBA6766';
wwv_flow_imp.g_varchar2_table(136) := '62666AB7DAD4F6B078E19D02F070F13C7B59F1F60FF608CFE3DACA6BF1FC8155F3D4607D277192BE937C38FF7B13067D4412E6E763D373480F1A58050DF47A1B2612D091884047F659A29540D5B2778577A7DBAB9A6DEDFCF0341580771FECEEE009A30B';
wwv_flow_imp.g_varchar2_table(137) := 'E6A9A3ECE9876CBB73FE1C01BB172E10803240ED0296AC40952C178A355A0362814A14A1D122CE124E0C2666319CC68F2C65460AE3A521923EAB68A9BC55D655A9068742956B40FA2533FA2CA0E8629F957D66228056E523F2AE8AA80B9753C6565367B6';
wwv_flow_imp.g_varchar2_table(138) := '3507C7FE211D4052B6C5BE1DCBCC51CBAC7C197527E3E7ECB1021CE8F70F09C8D2EB92295D0BD095714019B8EAC1DBB500BC4F1B70D163DE09D8DFDDA1FDDD5D1A89770CD8CA753A3DEA086CF9CB4A8FBA1DBAE2BABBD0FDBFF509F4A47FFFE3F41DBFF8';
wwv_flow_imp.g_varchar2_table(139) := '9FE929BFF9DFE8FFF9EFFF911EF5DCA7D3DD1EF330DAB8F23252621CF8C8C8E339471B2DA22DC9F86D654930046C6A0AE93334C05AD1D93BDC8EEEFEA887D1639EF70CFAF65FF84FA6CF7ED72FFF2C3DE15F3F87EEFF2D4FA0CBEE7247B33662069B4664';
wwv_flow_imp.g_varchar2_table(140) := '214A096C6E9F25006304E0BA8E5CC27725B200E08923C045DF947C78EFC0FE9E8CAB7B1728198F152EF9E2F11B13F7A50CB0B78B8801CA27C2A33986817235642DF3A70CF4C994B4956BBB771B9A67E1B378F767AEBE8A1EF9ECA7D1637FFC99F480273F';
wwv_flow_imp.g_varchar2_table(141) := '9E2EBDF31DA8B3B549F0A67A67B7E98E0FB80F3DF47BBF9D9EF8AF9E430F7BEA7751777B8B88AB688B5C90F2A5F0091A28A201E97BED8D1E3DE8DBBF991EFB63CFA4AF79CAB7D1EDEF772FD32FD1675B3066EF7A0D3DE05B1E4FE8D38FFCE1A751F7CCB6';
wwv_flow_imp.g_varchar2_table(142) := '74D92AFA6C11412BA095B6A65C207B863465F67F5ECDF61E6B94DCB2E5A8AE0142582FF17B6A0C0078D3C0CE8573B4B3738EB0021C381CBF396E57D29057D7AA70E6F4428015DCE96E384F7932B634F7C71E3D6407F22B4F337977655E0A180EFB04D82A';
wwv_flow_imp.g_varchar2_table(143) := 'C0BCBF362BB575633C120C9657DDFDAE6690BCC3FDEF4D185491C6CC279AC1CCA4224D5B975F46F7FF6619549FFB0CDABCEC92A9038C1EAF71D8DCDAA28D4D311468F6672811936189A70A66730DB9EBAA0166A68D4BCED0F5CFF83EBACFE31F65FAA1D2';
wwv_flow_imp.g_varchar2_table(144) := '58E13ED967D197BBDB5B74C707DE8FBEF1DF3D8FAEB8DBB50483B7C9BA6166735DB565BE1EC03B1CB6CE9CA5F49D0E97D0C6D6B6E08C5C5B297A1BDB04205A60D0DBA48E00E536B7CE1256FC034D6EF334D930BEE2C9AC697945D2108D054C2441EE3945';
wwv_flow_imp.g_varchar2_table(145) := 'CAD649ABEA64DE4CDEB32CB95979D5B586990B32F390CBDBFB47D5A81FC0FEF271C99DAE9681F429B475C56566D0F1914829457779F057D1637EE4E9D43B7B6646111EF3E41934212B68A098067A72F37FF8D3BF97EEF0807B136EF03EA599D9F4F1EB9F';
wwv_flow_imp.g_varchar2_table(146) := 'F114DABEDD953E451A48C3E3EBC95734F6253C3D74C7C6EA65377AED0D0078CD00DE570DB814DE3FDC2760F7C2790212395980AB9C6F3EE6BF0CDA1DF279EE36194702203BB0377EC77DB685AC404667938359110B7A6295F77AEE08848D4FD5E9EDCD0D';
wwv_flow_imp.g_varchar2_table(147) := '7AF0777C0BF52E3D5B983533D31DEF7F1FBAC7231F46F941D878219D9E49479E36518F96B58EFEE1A19CF7F9DFBF60AD2064AC8D06D09FAEFDBA07D3EDEE7D77622E7E83DBBCFC527AE853BF9D5A2BFC263CAD23D280B9AE2232635AAB45881618C8F8D6';
wwv_flow_imp.g_varchar2_table(148) := '164057C0AA9DFC64BC562C1ECFE517959F19D1203D510C510000EBCF8009820527A805D7B782D57978DFA55A557CE02855CD8942CBA8F38400270E9899AEBAC77574E5DD25242AFB27323D0F94D6F4E06F7F325D72FBDB1D2B31AD9DD3D28E1509BB4103';
wwv_flow_imp.g_varchar2_table(149) := '9E1A3873D51574DF273D8E98D9B3C4493266A6CBAFBD0B5D71D7BB9030A1F059370DF8F40BDC5796DFEEB53500B2B97278CD4051556796DFDECE0EEDC93C7C527124A0DBED117E914BA98880A2F2F9D2332B62417763937A9B9BC4123A077CCBD74AC74C';
wwv_flow_imp.g_varchar2_table(150) := 'F77EE2A3498BE7304F3D9D8D0DBAE7A3AE372CD858DE8AB41806F0FA4DA2FC8337D26E77656FFA373BDF78E202984E1552830688AEBDFEABA9DDB3F7251F1DE9768BEEFEE88751F6BE0F78834032F63C7D78049AFA3460D6040D8BBF1F6473FB12C25A89';
wwv_flow_imp.g_varchar2_table(151) := 'CDED33B4B1B54DCC9A589097F4F0E0900E0F0ECC1301B8B7E4F31775AC1655D14AD723377FDBCFE9AE46BB9898B971A2E2C67FC535779E5B36183457DFFB1E14B5DB691BD156203D0AFF83062AD340D4E9D0EDEE7137429F9B872933D3EDEF7B2FC23530';
wwv_flow_imp.g_varchar2_table(152) := '0F9F50B6591A60C6380B90735CA3067CD6D600E81F1EC89CEEC1DC2A8EC773402612B053DD739CCC6C3A08ACC48DAD2D5215470222997F0336B7CED0A658A25A47A405732BA42A06D2FE4BEE703B5291AE84231E1704DA32AFDA96413ACF34922803C0AC';
wwv_flow_imp.g_varchar2_table(153) := '8905F9FCEC18EF8400B2E3A66CE12500900DD81B3F57BCBFBF4B4016F16A8ABC45E540DB00ACBB012E9CBB858E236B2FA2334051FE55D1B737BAD4DEE855C22E6AB7A87B7693FA077B474F25ED5CB88D80DDF11AA4FEC1BEE4EF2FDD53ACA4C12BC46438';
wwv_flow_imp.g_varchar2_table(154) := '1A12E02B72367E3333315F4447C62320CF277DFFC88806729F02F2F98B3A5E5B03A03E05D631779376986A6466921E484DFF8894D4DAD81031B1279B39BF08F703540DBB39A55946F13AFAE532DAD1EC3A55145566B4A2A51B9E8B5F611C813E605D34D0';
wwv_flow_imp.g_varchar2_table(155) := '8C76AC9D01800B05188E06341CF6BDB5CCE21502B60227220115AE0960666266335FB429F3469DDEA6797E56472D02F2F2200D88A23601D96AF78DCD6DF34C2EE69FB6B62F31EFF5EE092F568A803C9F261C335728059809BF966ECDFC75431321E876AC';
wwv_flow_imp.g_varchar2_table(156) := '158F060382378D3E0458091794011900AC43D9930854F6DE0AAC2406F04B8F40E621E3B9652059B1B9E403F1740FC4138EC711B7BC7AD156606FE73CA1AD99679CA7ABF558FA57ADFC8F31CFF480F54B00DA8DA800D60900C748C36E0D1A180D47341A0C';
wwv_flow_imp.g_varchar2_table(157) := 'BD39B75A2D02F2055A88C4B6DA32C6CB38CC2A9F6DDE42DB5FE2FB4726259A10711513C41B926F6D9237724D40363A65DBDA5ABF068C1D3A6ADCF995CE6C6472A95EE85C248DCD2F20BB972E1ADBD039042BA0A3396A0945450315F63166196F00619B7D';
wwv_flow_imp.g_varchar2_table(158) := '4F6C4D5DCB39B76B6700C4A311C5A358F4EBA75016AB0CD8D8DAA64DF1C0F1A63E40184CFD6696F9FE9ECCBDEEED4CA59927B12D1623907AF4DBB47DF6B213C8D27B9B5B04B4BB3D02B48426016626669E4784952C8B162B15113B221EAD56DB58EA3C3E';
wwv_flow_imp.g_varchar2_table(159) := 'EFF9C626E3F72E0C2512305CA2659EC905AFF840BCE3ACDF65E9B62DDE0901ECE4E69287A63DC55735DBEAA92A3D91C10F80B785E88B2F5F78C500A201888E8007E05B7ED5E89271BFC4DB4B01ACFB0056AD1D4D973731FD31A6C4E87B5499B8189BA72D';
wwv_flow_imp.g_varchar2_table(160) := 'F84CEB8969805F25ED2FFE3D246B6700A467CCEFE69FD21231B3011DFF48DAF1C3B0BF4E1A6092134EA7E99350B16B62A1BA914177BEA76CA47586C742A50E95ADAB06CCA562FED5D4C2696C175D5F2AC3DA1900C3E140E6FEFDE76E7A1B5B048F9F99E5';
wwv_flow_imp.g_varchar2_table(161) := '9EC084391B00CFE8233D55D3E47FCC47024B998B9C1427A4C8F98395ED5204737A9E413BCD22CFCAE3F96C203B5ED636F58CFDFB735ECE2C727020D1AA7D413E7FD9C74389B2E09ACD3CA1A2F2E01A048C572C51B9A2E557951EEB3E004401F6F7F756B5';
wwv_flow_imp.g_varchar2_table(162) := '198D93DB44906344900B8A269147022CC55A91441E05966CEA1FF605210260D34F480F1A081A985B03CBF132E616DB9BC1BAB7CFA688D3DA6E9B3E9A9DDE24E9D62F02E039D78915F480F10465FE3C7F52100500DA1D996317E4F3B363CC431E1E1E9895';
wwv_flow_imp.g_varchar2_table(163) := 'E3A361794F2DE317B6E535A0B5F62EDC1EAFB5B01580570924E20D0036BABAD3B3E785ABAA279150395015BF79F90C3DAF57573D38574055FC5CF5D5959F8D37D9D6550FA200405FE68F01177DC89FAD81513C226036D564AE569A80C99C34C5769F4973';
wwv_flow_imp.g_varchar2_table(164) := '89E2F1D32FC982C71B950910B6F36820CC41CEA3BD5036682068605E0D8428C0BC1A5C4CF966D5B23606406639C5634BCAA5E6A8D522C045D7C12AFB4E979835B1C0468F67AF0FD6642E8E59E6C99522ACA8575A53D469537B6383F0A6BD2AD1C2FBD4D9';
wwv_flow_imp.g_varchar2_table(165) := 'A6D162E94A6BEA6E6F5107D8DA24979C1B67CF12D0936DEFCC19EA9ED99E0ADD6911E0E257757E24BA016C72954D6F6D74A9B5D173EAA7EAF6E4F9E157426D7FB100001000494441542081D646872281AB3D9B975E4AC025575D4D808D9E5A8AA8A509BC';
wwv_flow_imp.g_varchar2_table(166) := '817CBDF31D6F11DE0288EB82AAF830535BCE7357FAEC992BAEA033575C29C0F622CE5E75159DBDF2AAA97DF3B80E54BB45AA1D19F92023AE59A565CC1A5FC7CC155D6855B4BBC93CC4031777BC72099999989974D43220CB67301C1060C9AE3C5955CE71';
wwv_flow_imp.g_varchar2_table(167) := '0D193233C9D9A3B5FC48D3D03666260C6C1820AFBCC75DE99E8F7B043DF469DF418F7ACE3FA7C7FEF833C778966CABC233E981DFF624925A2B516BEFEC19BAFE879E22F241567F19BFF9DFFD047DF3CFFC043DF9677E722A9EF0AF9E4BC0637FDC9F6715';
wwv_flow_imp.g_varchar2_table(168) := 'B48FFF973F4C804DAEB2E98FFF973F62F85621E33C3C1EF713CF22E09B2D7ACFB7EF49FFE6C7E89B044FF8E91FA5C7FFF48F4C3D5728F3CDFFEEC709006F601E1927CB3E931EFEF4EF25F4B52A3A2D0B93AFFD9E6F97FEF793F4C47FF52F04CF95FEFBAC';
wwv_flow_imp.g_varchar2_table(169) := '1378E24F3D879EF0D3CFB1B6F7C963FDA1CDE8CB8FFBC96713F058B96671ED7ECD53BE8DEEF50D8FA42BEF719D18F21D738D334BCD80D41FBE8BD540D36A5B1B0300F35F80AF8295D6A4B4F62527F3EB7DBD0D2B7D1679C05BBA002B61833270C3DFBCFC';
wwv_flow_imp.g_varchar2_table(170) := '32BAFA3EF7A0FB7FEB13E809FFFA39F46DFFED67E8F13FF5C3F4D5DFFDCFE86E8F7C28DDE101F7A12BEF7E1D5D7EDD9DE9F26BEE58192EBBCB1D69FBCA2B482C00AAE2A35B115D7287ABE972E15B44CE2BAEBB0B5D71DD35565C7EED9DE90A41119ED5D0';
wwv_flow_imp.g_varchar2_table(171) := 'DE892EBFE64E344BB63279E099A2BA7359AEBD45DB7717E98302D1C9E5D7DCD9A197BB18DD5D6E682B6CA7F42DFC7E05FA5A157D96E4267CC9ED6F47574AFFBB5CFAD8D47E26E9264F68DCE7FB62BBAF946B16D7EE3D1EFD707AC8777DAB5CD33F42DFFD';
wwv_flow_imp.g_varchar2_table(172) := '2B3F6BAEF1FBCBB57EE5DDAEA5CDCB2F258C0195B42530F1D280D61169818D18EFC2006CF955A7ABAA19AE063FB1805743D0CAA564665291A6DBDFFFDEF488677E1FC14B7AF4737E901EF0E4C7D31577BD86A2CE452F8199658CBA0839A06A41D57E44DE';
wwv_flow_imp.g_varchar2_table(173) := 'A2F2315F6C1FF3F4FDA23CABA4679E2E1373B9F42A65AB821773B176A04E667719D0D5862A7BADB405723233613B0DCC2CC97E1042C3873947AF14E1668F6B1CD73A2204B8F6BFFE87BF9FAEBEEF3D49C998C0CCB4BC0FD63000CB93A0FE9A9B5783C2CA';
wwv_flow_imp.g_varchar2_table(174) := 'F5E3689E887E120D063277D2F77FF7BF529AB48EFC980B55D46A993503CC9A58204953BF8707077478B8F8E739A70A9325CA758D8B7FE3B24BE8DA877F353DF93FFF143DE65F3C9DEEF2350FA433B7BB922299E3473EB31052F8040D040DACAB06989970';
wwv_flow_imp.g_varchar2_table(175) := 'ADB7BA1D3A73F55574A707DF9F1EFB63CFA027FEEBE7D2B50FFB6ADA943142694DC454EB074FA200E97B0C76E9C2F9DBE8C2B9DB68E7FC39DAB9708EB0A60AA855882530D71A1100D1AFA56EFCD2E56854DD1B082DD51C25ABA3BD95DE11CB3111146803';
wwv_flow_imp.g_varchar2_table(176) := 'D7D9C18D2CC5E429207A215266A6A8D3A17B3FFE51F4D8E73D831EF603DF6D2E7CA53531D7A984426206E2A081A08125688099CD54E8E53215F6753FF09DF4E87FF14374CFC73D925A3266302F707C381A3365DC34FBB4769F8B0DF2D1ABE8E16281DAF6';
wwv_flow_imp.g_varchar2_table(177) := 'D4DEEE793A8E1DB1C4805579C35D12C794C4780C4FB649FD9613E6FF00DB19499FDB8E0956DC68B4DCF70244EDB699C3FFA67FFFE3F4E0EF78325D72C7ABE5625F139BCF7602427AD040D040290DE828A24BEF747B7AC8773E991EFFD33F4A777CE07D69';
wwv_flow_imp.g_varchar2_table(178) := 'D65847737CF6F7D2DF52C13B0C808C5562DEC11F137ECF02D8BD709E76772E5022460190D1356BCBA4943220C787151360234BC6ED1F491460B480FB87C7DD603196884D217EE99011F0A3AE9F4A64910E5B7F3DD36B6066DA9050DEF5CF7C0A5DFF8CA7';
wwv_flow_imp.g_varchar2_table(179) := 'D0B684F94DA793F4E925426AD040D040D0806840C6084C115C7A973BD2239EF954193FBECF8C2566FC90EC6ABE323E16F96D0A194B134135752F8B4BBE5ECE271C3B2EA89F63258BEE4E1800C9D80249DF70B74FBB172E180B2C5B2750B482BAE9638900';
wwv_flow_imp.g_varchar2_table(180) := 'C41201A8BB9E8C7F2B6A532B6A6587D6ED703824BC95CC4A505306BCFEDBDFEF5EF4847FF51CBAD383EE6F9E0B669ED5D96A1224B00D1A081A58590D30B34C1DB6E9CE0F79003DE9677E8CAEBECF3D49B75B73B727BD8F8C28DDBA7F9D321EBFD7654FA2';
wwv_flow_imp.g_varchar2_table(181) := '008804A4E5961B599DA6046626184ED3F28EA7610D8052FA78D2D4FDD1288D224FCDAC3071C20098CA7BEDACAFA9AD2C90C805681744CA4CE880F7FF96C7D3239EFD34DABAE2B230C7BF20D5876A8206D65503CC6CDE7BF0481953EEF3C4C710C618E22A';
wwv_flow_imp.g_varchar2_table(182) := '5A0B2FB7209F26DF871C3A39DE522E407BBC5C1DFB4E03E0C8021BAF1568DADA00BCFF1BA84339D378629E4C47B0E0669FC541BF4FC0341E75A4F5CE6E132ED2FB7EE363086F17ABA38EC033682068E0746A006F17FCAA6F7D023DFCE9DF630C82B25AE8';
wwv_flow_imp.g_varchar2_table(183) := '1F1EC8FCFE41E1E2E9DAAAD1D17AB5FDDD1D020A336A44012666452CB08983770100B6FCAAD2557946252CB8F295555F72C5C53FAE90AEDCFCAF7FE6F749C8FF7E642CF4E399613F6820682068A0020D606CB9E66B1F64D605E035C415B03C252C9ADBCC';
wwv_flow_imp.g_varchar2_table(184) := 'C20640BA3640AC38F170FBFDE53FEF3E4A64AE445054C509C95F89901233AC3726CCE3281591ED9359AC491C1360A39B2B5D64C162BF473CEBA974BB7BDC95944664622E8EA170D040D040D08055034A6BBADD3DEF4A187330F6908C4156E26319898CB5';
wwv_flow_imp.g_varchar2_table(185) := 'C070D827E05856A95DF000AA5E1350F67E52B4114AAB99E3752CF70DA028DFA2F4850D80B48235729FD30615FCCF420FC866595FB9F03A5B1B74FD0F7D2F5D75F7BB12AB92A77259F2877A83068206565203186BAE128703630FC6205F2360251B5B81D0';
wwv_flow_imp.g_varchar2_table(186) := '4D6651FAAE91AD0580770B2CAB91A81B28567F42F12816947F6F40D48A286AB59CD50E8703B178DDAB5D9D8C72049893BBFE19DF4757DDF36E6249963E8D39AEE1306820682068C0AD0178B0187BF062318C45AE12C38178FE0217DDB2F3712F01962D47';
wwv_flow_imp.g_varchar2_table(187) := '3C7EFAA16E39C29DA36E0DD7C05F694DF779FCA32414773731BE971C89A8A17D8165D040D040F335C0CC84478EEFFDF8AF172744375FE0A548D8EC4A270C00664D2C88DA1D026CE22732EF0EEC6135E6DEAE8D6C6DD31106035C0D1C8E8604B8E87CF351';
wwv_flow_imp.g_varchar2_table(188) := 'E7750FFF6ABAEF373D96EA7A4B97AF2C812E682068E0746B0063D0FDBEE97174CD431F44189B6CDAC01808D8F2CBA627E3B50565CB37BD5CDDED9B3000CA280442129DF67501653457B00C339DB9FD5574FF273F3E58DC143E410341034DD080D29ABEEA';
wwv_flow_imp.g_varchar2_table(189) := '9F7D236DDFEE0A2219A3287C8E34D0F49D090340CBC9047ABD4D0274D422C0D6906CAEA27F7040581760A3AB2B1DEF00008AF21FC523028A96CBE8B5D20464C7B6ED6830A4D1B0FC5A83E37C7514D143BEF35B68F3F24B8F2787FDA081A081A081A56A00';
wwv_flow_imp.g_varchar2_table(190) := '63D203FF3F4F228C51D304C11888B1705ADE3C69B144588179782CA3ACD6116981ABEE78349A6BAD9A8BBF721184FC0A342061AA79232408AFDDF5FAAFA1DBDFF79E62642F76DE1F111E3C9282CE682E643168E6DD8217166256A05DC3C2C82817CBBC72';
wwv_flow_imp.g_varchar2_table(191) := '85F2621857707ED7558FE8B7E86BA6D355F00FD7007856A52FF0C2B55AA58C3ECD6466BAD303EF47F778F4C30963D5C932121D3663E0C9D4F53F6A7E0B270C00AD350199E8ED7697DAED4E7668DDE29D00003A1E6025AC38433B2214D6EAE29808B01238';
wwv_flow_imp.g_varchar2_table(192) := '32700F061C64E9FB0062824E0007B9357BEB8ACBE83E4F7CF4426EFE18400EF6F6E8CB9FF91C7DFC1FDE4B6FF9D357D2AB5FF4BBF4C7BFF06BF4FB3FF73FAAC1CFFE0F7AE31FFEB1D18BB5D10532766EBD8DFEE2575F487F50957C814F35E7798DF488BE';
wwv_flow_imp.g_varchar2_table(193) := '853E86BE56A06B5A49311EBC41AE81DF976BA18AEB0AF2FDF9AF3CDF5CABEF7CD56BE953EFFB007DE9C6CFD0C1CEAE0C7532DEC97DD82A4C05194A2BBAFBA3BE8E362E3D7BC42D9131368913B9CE31065613093D622E3B2318FD02D9ADE48B68325009B3';
wwv_flow_imp.g_varchar2_table(194) := '194C70EB006690982CF411C01CD4F04FF9F1F411D58F53A02AAE0166366FF9DBBAF272120B806AF988858E0BF560778FDEFC27FF975EF61FFF2BBDE4DFFF2CBDEC3FFD577AD50B5F66D2DEFB861BE8236F7F573578C73FD0673EFC519291A192E6F40F0E';
wwv_flow_imp.g_varchar2_table(195) := 'E993EF7D3F7D58F8562663556D0D7CAAE9334BD623FA16FA18FA5A259D56AEB9CF7CE8A3F4918AFAEC87453FEFFA9BBF35D7EA5FFCEA0BE8A5FFE1BFC835FC73F452B996DFF6E7AFA2FD9D1D4AE4864C526F25F2E799C83875E67657D1750FFB6A3A1905';
wwv_flow_imp.g_varchar2_table(196) := 'A8D9F2C8CBD190E3551063C200C87BD478D63D6A4572DF499F0EB0352A193F1530383C20C046B72EE95AE66F00BFF624328F130BCA59C0DD335BB57AFF890C08E76EBE856E901BFF2F3DE379F4372FFE7DC2C074EE2B378BCCE239F8353250050D040D34';
wwv_flow_imp.g_varchar2_table(197) := '4803C3C180CEDF720B7DF6231FA357FDF6CBE87F3DEBC7E9863FFEBFB473DBF9DAA464C566ACDA9288252A493D748C21C58C8076A74700B3221680D7340CF166C111DEB3528CFF345E4D4C8B6B5EE3A0FC1A2D110016F81107AAA91A28D94145EFF77DD2';
wwv_flow_imp.g_varchar2_table(198) := '63A9BBBD3595EBBC89A3C190DEFFA6B712BC85D7BEEC0F68F7FC05829700A3203CD831AF7643F9A081256B40861D5CCBB8A6716DBFF6657F28D7FACFD1076E785B6DC67DABDBA17B3EEE11C71A2E421C3BAA7C57D88B0F5339DBF918AE46694F0380C41A';
wwv_flow_imp.g_varchar2_table(199) := 'EB50BBDB75B60AEB00FA2BF0C6273C930A381BE420502A22C041462309BD9579EA60F3B24BE90E0FB80FB1F23E552E514C3E0605CC0DC2EBFFD35FFA0DFAF2A73F4B3006285C49463FE15FD0C0DA6940AEEDD170485FF8D48DF4C7BFF8EB66AAE0707F5F';
wwv_flow_imp.g_varchar2_table(200) := '2E79B98356D8588C5557DFFB1ED4BBE40CC5F1480C8DE291CF565BEE379D2EE956CB60B67809A15D8878CCA60BB9790D547B57C9B84B4793C9DDEC286C4B6A8099E9B26BEE409B975D529283A5989C9F3DF1F4FFEC579E4FAF7BF91F11E634611058A843';
wwv_flow_imp.g_varchar2_table(201) := '72D040D0C01A6900D77AFFE0805EF7BB7F447FFECBCF278C05620554DAC2EDAB2EA72BAEBB0B958A1BCBB827DF4AE55934B355A9CFDB00D05A13E06A58325E0B3094D0F2222C32962E06B8E4AA2B5F89670EB8F88F642E0770D19DC867A27B3FFE51A4A2';
wwv_flow_imp.g_varchar2_table(202) := 'E844F2BC0787FB07F4AA17BC741C062C6E9DCF5B7F281F341034B07C0D0CFB03FAC7BF7B0BFDF56FBF9C3026542911C6ACBB5EFFB569E4B3C02AFD286A53A45BC4AC8899A925C7804BB6C1B04F808B6ED5F2EBFE7542559F42AA0D2BD5276743394BE7DF';
wwv_flow_imp.g_varchar2_table(203) := 'BEF20ABAFC9A3B9B0BA12A2907FD3EBDFEF75F41EF7BE39BC5E80FE7A82ABD063E4103ABA88144A281180BFE56C684A18C0D55B58199E9EAFBDE83CE5C752591383234F7A71226734BE1C76075A8BC0D003D5EF5CEAC8905AE260E8683855864884A002E';
wwv_flow_imp.g_varchar2_table(204) := '79EACA47DD808B7F12C704B8E8B27C663CFA777F52AD284B9A7B8B8BFD637FFF1EFAFB57BDA6D4BCDCDC020406410341038DD3C06830A0BF7FF5EBE813EFF947C2185195803A6AD1EDEF7F2FE1E9CF116329909588B0064022A0CC4C2C51812C3DBF451B';
wwv_flow_imp.g_varchar2_table(205) := '807C7A538FB14E0270C9877B06E0A22B9BEF6D0094AD20942BA7012D9DFEEAFBDCBD5CE169A5C4D2C75CDF2B7FE345D49729806924212D682068E0746AE070778FF0BE8FC1C16175CBB798E8CE0FBC1F293DDF6D865918012B726A5649CCC267468B470A';
wwv_flow_imp.g_varchar2_table(206) := 'B81A096B0C70D12D2B1F6F7B02E6AD5F8B950BB8F8A02EC04597E577B63769F3F2CB48BA7E9634D77624F37037BCE22FE8C2ADB78945DE8CD03FDE383857A38E154E9298626E9975ED0000100049444154C1B1A4B01B3450B906123C1B2BC674558C0FF7';
wwv_flow_imp.g_varchar2_table(207) := 'F6AA6235179F44DA74F3E7BF407FFB07AFA0D1683817AFAC30C6AEB3575F45DD339B5992738BB114C8136A7188B44403F2E9D97122D73E8075674096DED4AD529A8065CBA7962DC0FAD48FEE5E5D6BBADB5B72E16C115564F9DEF6A5AFD007DEFCB6C6DC';
wwv_flow_imp.g_varchar2_table(208) := 'FC6182DC72D317319C52159FFEFE611AD99081AC0A7E8147D0C08406A46F1DEE1D1056D04FE495484884DF2D5F906B40B6258A575F44E4F8D05BDE41E7BF724B35BC65ECEA9D3D43DDEDED6AF835988BA86E2CDD6A6D260C8018CF6D0A6CCDC08ACC9678';
wwv_flow_imp.g_varchar2_table(209) := 'BDB6FC2C3D599045A674444AEBACDA856F61992AED5F7FE2B916006FFF6B6FF42A694F1227F4C9F77D806EFDC29724BC875B6F256CE7632257CC6D5FFC329DFBF257E6364A12C3EB4BB47761673E9942E9A00187060E7677CD0D127DCE413A331BE5F13C';
wwv_flow_imp.g_varchar2_table(210) := 'FEDEB90B33E9169909996E9131E2C60F7E78EE6B3293BB256318A299E4E91F29A508C8CA675BFC1E0D901DDBB683253D0D104B8415EF22B0C9D5D4F40903C04F50CFB3E9C7AC02AAE5CA23862EF97670F2F830339DBDC3D51E947E24B11874EF7DDD1B2B';
wwv_flow_imp.g_varchar2_table(211) := 'BBA8FD6A7553219CFAEED78A5C62A0B8A9ED14F845B5F7BCFEEF9A63DCD8450D392BAE010CF4EFF82B2CA2C5EB6DCB37261147E0DDAFFBBBC65D9368DFBB5FF386CA1609E3667ED5DDAE23E6E58ED1E5CF944FC98B4E950F759368260C00744CC02664B6';
wwv_flow_imp.g_varchar2_table(212) := '2A93C8EF84623E09A09A3ECC4CCC5C9A3B64034A33300599B44422B4476404F3DE00CDFA28A64B2A3400E0F97FF6231F9F55E352F2C471A77F7CE39B4D14601E016EFCC087E923EF78D73C2C42D9A0016F0DE017323FF7D1F9AE274C7F7DE4ED7F5FD914';
wwv_flow_imp.g_varchar2_table(213) := '98B7F01E84B89E2EDC729B07A51FC9F695977B8FD158190FE4399BF155C658E578F32AD69DADA2279E6F6F768C7563E9FDA91E2363C200C82A9EB535F7DBF2F7DC59AC439E688089694B2E1AD9ADE48B0BDA697454525341266201DCFCF99BE82D7FF697';
wwv_flow_imp.g_varchar2_table(214) := '54E6A245C8123F58F4D7BFFD52F158E6F3C80A4A1EC84FB106E025FFF58B5E4E176EB9B594078FBEFEF657BE9A3005260C1AA7498C159F78CFFB2A936BDBBC0B802BE3E76424E3CA72F4EA94AC1C413DF77E234B290380E406652CB2A845AE0F5664E2AD';
wwv_flow_imp.g_varchar2_table(215) := '802EBAD2F9E857405906502E50B6FCB85C24D629303EB46E8C4537C4AF57594988C4C2EA6CF9AF9C25C7E7731FFD04CD8AEA388AD79A8DF0FD3BFEF2D5F4C63FFAD37471152E5E8F1A71F3DFB9F536FA9BDFF93DFAC2276F241C7B140B244103736B007D';
wwv_flow_imp.g_varchar2_table(216) := 'EDB31FFE18C108401FC4B11753E9DB5840F8C63FFC53429FC78DD6ABDC82899224A62FDDF8D9CA6ADDBAFC5262F99BC510D15360160DF25A9D0EB53A6DEC4E05644F44CFA3159D939FDAA81A134B1A004525AAE00E5BB4CA15A697FB3F55B500106AB8A5';
wwv_flow_imp.g_varchar2_table(217) := '492B8D21500EA3E188F088E26B5E3AFE3542B980E58E9EA34A0F7171C398B9F97337D12BFEC7AFD2FBDE70033575204D250EFFD75103E873EFFBDB1BCC8FEA9CBFF9164AE284D037A7B515E9C0E1C121E115DC37FCF19F4BC4ABB9AFE0465B6E9531635A';
wwv_flow_imp.g_varchar2_table(218) := '5BCAA4456DB961739992B6322E66CBB9DFD8A46D72FA8401E0FBEEE1A8D526C0D5B8381ECA003DA2248E0D5CF445F34D24C2ACC277758AE99CF10B7DC0F45CFFD4F46984C859C058A6629DBA085BBD8E8BC42B7FD0EFD3E0F0D08B769944F08CDEF6177F';
wwv_flow_imp.g_varchar2_table(219) := '4D2FFD0FFF853EFCD677129E4986EC994C6600DDDBA32FFDD367E84DAFF80B7AE14FFF27FAE47BDF4F48CF68C2366860911A40DFFBC4BBDF47BFF12FFE0DDDF0C77F415FFCD48D84E7FA919EC9D1DF3F20DC4CDFFDDA37D0AF3FF75F9937EEF5C510C8F2';
wwv_flow_imp.g_varchar2_table(220) := '9BBA3DD8DD238CD955C8D73B7346D8CC1E9F5922048010CEFCE209B45684719667D279455A6772A837138B23817A6B71739F3000DC45CA502461857661B5CDEEE045D8C1A12E42BF2C5A0C38377DE253F4BFFFFBAFD04BFEC3CFD14B7EE667E9F77FF617';
wwv_flow_imp.g_varchar2_table(221) := 'E87FFFFC2FD3CBFFF37FA317CBF14BFEE37FA1D7BEEC0F69EFFC793A3ED02E4BE650EFE9D600FA20FA22FAE44BA56FA28FA2AFA2CFA2EFE2F82562D4FEC5AFBED0180289440A564163A3E150A214D5BC1048EEED1537B9BAB1B13AC16AE624B7D03A6A98';
wwv_flow_imp.g_varchar2_table(222) := '3000124F4FBD15B508F0156A381AD2D035F7EDCBAC4A3A69AF8428E6E6A8C52A055C8CD2084058B066D3130654442C6EC5F3C81FF8307DF02D6F27FC58C947DFF90F8427192E48B8158BB04067E311D2830616A901F445DC30B1721E7D147D157D167DF7';
wwv_flow_imp.g_varchar2_table(223) := '331FFE28DDF2F92F10D642816E9172CD55574D371C9B4C5AA2B8802D3F4B67A5881593525A8048004DFD98FB8DDC73A6663620316D87F2964426986A7178FC25F0163510BA35B0E0ABCB2D50B329562584D16C2D06E916A981D0676BD4362200408D5514';
wwv_flow_imp.g_varchar2_table(224) := '64BDAAE4A50D80CC8261D6C40297029A6E91B9E477E533333103B3F5912423B1E4E2318221E0D26BC80F1A081A081AC86B206A4514B55AF9E4A3E3B26B009815B1E08851237612F39833229F558BA3AA66B8347EBCB49A4B542C377EF99628188A040D04';
wwv_flow_imp.g_varchar2_table(225) := '0D040D040D344A038B10A69E1BC68401602C273377E25761ABDDA656BBEDD4807943D3C0F1FCBB938B8D8049EB8874D4A2657FB4E75C161E23AAC3A25B76FB43FD410341034103756B208B40BBEA19C9BD0C70D165F94A6B525A6787B56F71CF025C1599';
wwv_flow_imp.g_varchar2_table(226) := 'FB455CFDA3A36A6AC57EF7FEA9454362D040D040D040D040D0C069D1C02AB773BA0150A0459887015C4592249DF7863506B8E85735DF370280770F00ABDACE2077D040D040D0C0B234A09526C0553FA2AC808BAEE9F96904A0FAA7C794ADE1C517B1AED4';
wwv_flow_imp.g_varchar2_table(227) := '24BCADD9213D682068206820682068C05303AB4D6635006035E1D95657F334E6DEC51AC3CA4966F7DC49BD6B015CD24EE657FD7482EFDC94EFFB1626250E29410341034103A75B034A29025C5A68FA388BDF8F015CED40D41C70D115CDB71800051701B0';
wwv_flow_imp.g_varchar2_table(228) := '78FF40D1DA037DD040D040D040D040D0C08A6A60D5C5B6180044713C32F06D60ABD5F27A1AA06A8FDB57BE45D129898600AEFA60CD012EBA901F34103410341034705203BE91D6A6DF6F7CDB71B2F5D51D590D80EAAA089C82068206820682068206D64D';
wwv_flow_imp.g_varchar2_table(229) := '03ABDF1EAB0190C43101BE4DD4580B2070D167EF1948928400177DDDF9F128A6785470CA639650321B42C02C1AC98B4DBDD5AFEA14D6E11B3410341034702A348067E8015B63D371B6C2F1DD5651C974448B95B2DE868FB89AFB660DBFA5E3AEF948840A';
wwv_flow_imp.g_varchar2_table(230) := '77CCF930FF2A643A0FAB26C9324F3B42D9A081A081A081A081931AA8677C3F59C73C471E1EE33CEC6794B51A0045E74EF02E0060465DC7B2121A0D4782E1B1B4E5EC66EFE627AAA693A491102D8D997D52D37AAB7FB393541CBE4103410341032BA50178';
wwv_flow_imp.g_varchar2_table(231) := 'F14051A15D73E8E9388B486B35E37B51F95CF44A6B525A09D9ECFB8510982FA2E68039A8E01F6AAE804D19160D3B210D13A78C464399A081A081A081A081490DC88CF364E25C29EB51D86A00A47327B09C8A3514561CE02A351A490460B4FC08402627AC';
wwv_flow_imp.g_varchar2_table(232) := 'AA226B1EB272611B34103410341034B01C0D685604B86AF77DAF8D8B8F2D5FC93CBED2DA966D4D6766C29F952097817600B9E4D2875603A034C750B0711A903E46CCD2CD02821E421F087DC0A30F10376E189B43A0EAC3BB27851165C9F7645A81A379CA';
wwv_flow_imp.g_varchar2_table(233) := '16A8661AA9D50048E74E8ACF51E3AD46C0B4CA8EA70D0703028EA72D6F3FA1BADEB5EC6AD36838AC752D84120BF96E0FFE2AFAAAC73C3220E820F481D007BCFA00C60C96B1C3357E5593CFA4B412682AFA513A927291B3585CF0BD364E863902662666CE';
wwv_flow_imp.g_varchar2_table(234) := 'A536FFD06A00345FF4AA25ACD84A6C485FD0AD881EFB94EFA0EFF8A9E706041D843E10FA80571FC09881B1A3EA51763DF8AD4F2B9C064052F47D00518B7414393514C743F1BA87E65D00987F7716A899208D00148F784C178B498B65AA4517D4800F56CA';
wwv_flow_imp.g_varchar2_table(235) := '2AADC5520E503AE840E9A003A5830E94B6EB0063C622872E26F92BE14133FB954BC7F7E26BDA5C3A6056C4CC2E32673E330B1FE5A48B2B8E64B86B748A348D80A72586B4A081A081A081A081A081490DACD02D63BAF0F33400658149CE75A7380D80A296';
wwv_flow_imp.g_varchar2_table(236) := '9316EF5F8B6549E4D7A0BAE7C0C9F393148C7478B20D644103410341034103160D306B62F1A289FCEE1794FBF8DE6F46A32101B9E2731F2AAD496955011F257CB4934FD5F7A9F9259F2632CE25302D2FA4050D040D040D040D040D1C6960CE9BC59CC58F';
wwv_flow_imp.g_varchar2_table(237) := 'C4F0DA592F22A70130923907A058B399B4E71C38AC3280D6ECC362D102AE66C5A25FC04517F2830682068206D64D03F09E95E6B99BC5AC88D9EE41FBBE4B1FCFD803730BB4220CD48AC819C40C1A081A081A081A081A98A281F90D88294CA726AD5BA2DB';
wwv_flow_imp.g_varchar2_table(238) := '0090B971020AB65C230220701583F70FB8E8562D5F6B4D804BEE44740BB8E8427ED040D040D040D0C0740D28998707A6E75E4CC5BB67808B2927F7922426E064EAFA1EA9F56D5A6859D040D040D040D040D040551A583F3E4E036064DED95FFCF9788577';
wwv_flow_imp.g_varchar2_table(239) := '230B5C2A33733323FC2640C52FE271551CF28306820682068206D6420378FB2CE06ACC60D827204F37927B10904F5FD43153FAB7A8FAB27A9C06404658EB36DCFB6B556F601E34103410341034309F06D6B1B4D3004828FD2BDA78A535296D5F9579925F';
wwv_flow_imp.g_varchar2_table(240) := '422313694024E0648EEF91D61169812F7D9E6E281620904F2F7D8CE807E06090B6BB7884C5C13664070D040D040D9C1A0DE8A84580ABC1A3C1804683296FA085130AB818E4F2CBFE6A6E8E0D69B95702F9F4BA8F55DD1504FE41034103410341034103CD';
wwv_flow_imp.g_varchar2_table(241) := 'D18038B549D1BBBD4BFAAAF9B9EAAB26DF6900E09948583945ABD3E28D03CC8A58E02A9FC47252042E3A5B3EDE5D0DD8F2179DAE9526C055AFB4DAC4585C74213F6820682068206860BA0634DE402B989E7B31152BFC8161FF90068707471978D70D7094';
wwv_flow_imp.g_varchar2_table(242) := 'E0B993FE6A6EF5BF3160AB1E516AC0965F345D152D10E8830682068206820682064E9306D6B5AD4E0300D61240E2A79651821E47025C65639983075C74B67C78DB802DBFA9E9F3463E9ADAAE2057D040D040D0C0A23510456D025CF51E1EEE133092FB0E';
wwv_flow_imp.g_varchar2_table(243) := '90947C1F8B52112989F61231CDF351729F04E6E151A6ACD30028C33494091A081A081A081A081A68BE0664EEDEB91EC0D10A9EEFE6EFE05E6B76ED06806EB50870B562649E0228BF1ADE770EC8264712CB6CBCC0965F345D694D4ABB9F8288E321C509DA';
wwv_flow_imp.g_varchar2_table(244) := '2D1DB168259EF48974F0646CE1FA6F537D24A293E98829F1E2E9E2E3CA77D5E32A3F6FFEA2EB77D587FC79DB74BC3CF8B9709CBEAA7D579DF9FCAAEA9DC6275F5791E369FC9A9A36AD5D165965CCF01C5E1A45D66A77A8D56E7BCBB4B77381F6762F505F';
wwv_flow_imp.g_varchar2_table(245) := '22028077C13161AB53ACBE71B1890D3313334FA4E71392F1789C4F2F7BACCA160CE52AD4407DF77E7393FECC7BDE4F1F7DD35B0BE1936F79277DF2ADEFA44FBDED5D53E1CBEFE36F7E1B7DFCCD6F9FCAC3C61BE99F903228E7AA07B475C0B77EC808DAAA';
wwv_flow_imp.g_varchar2_table(246) := '6470B5F7A36F7A9B398FF3D6079921BBABBE8FDDF076FAD80D6F2B7CFE5CF2B9EACDE7BBF895CD870E3EFEE677189DE6EBF439FE84F453A06CFD8B2A8773F8313997F936A1FDD3E4BFE9FD1F31634785A3DC0259B96FA445845967DADA0D002D5E30E052';
wwv_flow_imp.g_varchar2_table(247) := 'E2BC11808C3FB3261664C7BEDB189EB8C097DE45C7CCC4CC2EB2A37CE3A5D760758F86237AF79FFD25BDE1375F5C086FF99D3F20E06D2FF9237ADB4B4FE2AD92F6C6DF7A29BDF1B75EE2E4F9C64CAFCB560000100049444154E70B9D601A9F3CDFA363E1';
wwv_flow_imp.g_varchar2_table(248) := '7FC36FFF1EBDF985BFEBE45F886FAE1D47F5E5D3A5FEB7BCF88FE8ADBFF387CEFA6F1019DF24B2CE2587D4F7D697FC21BDF5C53EF5BD9C50E7BCF5BD19E7F745BFEF6CDFDFBDE0A5F4772F7819CD555F4EBF6F95F616ED8F28633D5F39FE45E8DEF9F23F';
wwv_flow_imp.g_varchar2_table(249) := '26E006D1C50D2FFA3DA73E32B96F78C1EFCA79F83D7AFBCB5E6150A57E8AC8EF452BFA7ED30B5E4E6F92F398C99F6D718DE15ACBCBFF8157BD8E6289CA1E0D502BB21349C419D09EEF0528DBAC74EE3FA276BB6350964F564E69ED1F318EAB8B18AB4C80';
wwv_flow_imp.g_varchar2_table(250) := 'FAB7FE37C3FA65695A0D49D935965E0D31C68557B8FE5888508C9104E1A66C8BFD31E844DAB13253EB408851684E9441DA0C18DAAC8C6CA7F21DA71BDA19BCC6329BB6F8EE1B9EC23FDB3AEBCF684BCA61EA91B2662BBC66D567DA20348656CA98E3825B';
wwv_flow_imp.g_varchar2_table(251) := '5336E321DBBAEBCBC948F8C11593E6AA3BCBC7F581FD82ED347538CA4017C0112DEA9905E1077A0065B0CD80E32602F299732CB29BEDB1F66579668BFC3144E55E834B53890A385FB39BD0D0DC8ACE4FED0680D61161753EB322666DD566FA3CE588CCCD';
wwv_flow_imp.g_varchar2_table(252) := '4A3AA395D091A1B422C041B6B06C66B45B39EB8BE5C26C92C5AD14935276B9A163A535D5F541FF066CFCEBB6F0999998D956FD51FA68BC8AF828A1E40ECE3DE02A8EF534808BCE95AF9496F35BDFF973D5DFB4FC5E6F837ABD4DEA8E11896767305E55DE';
wwv_flow_imp.g_varchar2_table(253) := '9174606BFB0C6D6D9DA5DEE69660D3F41166773F59767BB55CABC0B2E55854FD9D4E973ADD9E9C1F655055BDCC29BF4EAF47DD8D8DAAD812338F91F2773136F749B967B8E85CF9CA455049BE344E5A5709ABC064111A60A904904DF8060D040D1CD340B8';
wwv_flow_imp.g_varchar2_table(254) := '2E8E2963ED77A73790E576C6D3B3562C753106802845479A742B92BDD9DFD17048C06CAAD5C9555A93D26E4FCB587473443EAAD6084B048067440098D23F57BDF06ACBBC49D2E559A7B5B3ABFAD2F93A92C895C0C5209B5A70D15595DF92B94DA02A7E2E';
wwv_flow_imp.g_varchar2_table(255) := '3EA7EDD73A5BE2F903880618184F7FCBCCF362BE17D704E0D25BE3F2712D0339C146321D03E49257FE5023F22C401400A8AA41E0D5E976490B6FA02ABE191FDD6AC97DB2951D5AB6099988F1CA44002CCD08C9C735302BE07D9C6E15F7D1366015650F32';
wwv_flow_imp.g_varchar2_table(256) := '977C0758505CD04073348028746169F205EA7338F235B98FAB194F95BBA26A2822B19800173797E7E72ADFB47C780B804BAED4532EFF6B882EFE55E76B896A002EBE8978184989C806A206D0898D3FEA066CF955A56BF1B8011BBF38AEE63D0E713C12AB';
wwv_flow_imp.g_varchar2_table(257) := '1EAB7BA7D7A45444008B17074CA70AA94103D335A09526209F9B881709E4D3D7E518D11CA0DBDD30EB3B8AB68B59130BBABD2DEA6D6C11780145F9F8D2B7A236F944F810254774CE97AF8D4ED932427AD040A51A2864B01622AE54CC52CC202E50AA7028';
wwv_flow_imp.g_varchar2_table(258) := '14341034D0440D1C97897991DEFFE2EA5A9801E0BBEA783818D070B0784F185E1E70FCA457B1AF5911E0E2351A8D0870D1D59D0F6B974566A2D99D5049440720AF4F62DA06ABD5453E32ABEA479498C881FD57B65037E0E2376F3EA256C06C3EFEEDB3F1';
wwv_flow_imp.g_varchar2_table(259) := '71CDE9B5F0C63181AD7CD1741D4504142D17E85753034A6B525AAFA6F015480DAF1D68777A04D858322B6241F634C8D699B304E0DD0280AD5C55E9A823BD2E678FBF58B701CC5BAF9A97413DE5E14E01F5700F5C5D1A98DDF95CA5A7E717389F66CA6016';
wwv_flow_imp.g_varchar2_table(260) := '7D1DF24D97DA3F7596BCFE5C02E5140D34F1744F1133245934D0C84B6346A732DEBEA52D0B4836D5CF10AF4A11166600C0AA01605D01B646C4985395F9D0C4BC50C3EE01DACAC35B036CF98B4ED7660E3972569B50FAE724AC994069454ABB7B9FD69A00';
wwv_flow_imp.g_varchar2_table(261) := '5F714632D73892F3EAA23711A0A13D0284BEC3CCA4C58385B54C357FB4E7F9F36D9F4D5C44BDD0765B3EFAB4CFDCA0ADFCAAA62BAC7D602DE2BBFBA41085AF4503CC4CCC4C469FA2531A7FD2B5369377E858AEC1514591D89D5B6E2109E98D6B3CB961A5';
wwv_flow_imp.g_varchar2_table(262) := '0838995ADF51A7DBA34EB72B5100A027E348CBC0BCF3A1DDA1CDED33B4B975A6F6B9FED92D648A748BA2C8FE9B06F17044C06C3EEE5CE5265916C564A75C9624F3D7CBF3B3081C2E6A80D90C661713EADE63A900904D6DDF59FD9D17DCDEDA1A19183752';
wwv_flow_imp.g_varchar2_table(263) := '03937DEF70778F0E7776AD37EE22CDF8CA276F94FBFF641D4578544BCB33D8A5793308D62A6BE1068096B96360B616131A8A053A1C0E6693AD40AED29A9478D544B33BD648DA0AD0923F3837804B0C58ED06AC89052EFAC1E1210136BA44C2FEC0A02F74';
wwv_flow_imp.g_varchar2_table(264) := '021B1D9EC56EB7EC96B1AD5CD9742D91061DA18D8A989595CD683020C04A303323314F00C412FDCA9329159152527F4D9E52CA3FCA579B3B4ED2351C237B642657A0B243564C40650C4F392344CD804C0DE91B5811693D79833E387781CE7FF1CB1297CC';
wwv_flow_imp.g_varchar2_table(265) := '28CB6D1389FC7DE67D1F206CA771D0AC08989657675AC744027AB4B1B96D60DEF9D0DB2466E96F823AEBF6E18D7304D86863192B8044F40BD8E85CE9F611CD5532E4D7AC81931764CD9505F63335C044F2A59A3E62FB3838D758B9A3E6907D3A3490EF83';
wwv_flow_imp.g_varchar2_table(266) := '30663FFAFA37CF170110A617BEFC15BAE9831F2118F7ABA3C9D323E9C20D005835804BC543F13600175DD3F399999801255BED14375B05EF24AC894089A709F8B26FB5DBD46ABB3DF2786CB1A6ED9BF42407870712213890812236B0D5DF92793AC0965F';
wwv_flow_imp.g_varchar2_table(267) := '57BA8904B45A56F6B676590B8C33F064C4ACF71DB4A4CE96C71B34C7EC0A6F5849DF14380BC21E059C8481A0C91AD026023B390EA10FA22F66B2E3867DD3073F4A9F7DCF070879597A91ED6834A28FBDE96D74FE4B5FB11653220F602538A51918E30066';
wwv_flow_imp.g_varchar2_table(268) := '4D2CB0A9C1F5F490AD5C96AEB29DB0AD53032CCC01D9846FD0C0540D84BBEB54B584C41A34901F8BA6F7BD2489E95DFFFB2FE8D64F7F4E8CF2E93436E112094D7FF48D6FA67FF8B3BF24ECDBE89A987E9A645AB801104558DD18898EF39D50928E7D1182';
wwv_flow_imp.g_varchar2_table(269) := '028E25ADF4AED68AB4D6CE36C0DA069C843511A4E7C7EEE9E6AB2D4ADF3F382020E383C101E8F7FBD49F35F73F7E7E9725420164E517B56D4BE401B0D587C112801705D8E8F2E958E702E4D3B363BF778367D4C5B7D02550BCE4624A30A57F8BA96DFD6B';
wwv_flow_imp.g_varchar2_table(270) := '41F435928812B32216642D8EE3915987921D9BADDCF3776FB995DEF4FC975391857CA3FE803EFAA6B7D0DBFFE08F09FB8697E59F89AC45B81F58084E7972ABDD9E1961C5BA31A0AC9A54D982F395E3F98A87D20DD440B1739AC8FC60D688745F469B2C21';
wwv_flow_imp.g_varchar2_table(271) := '6C1BA881707E1A78524A8A24D7AA4C4B7A1596D3BE77CB6DF4A6DF7C29BDFB157F49581C9888774FC7AE5FF0C1358C470ACFDDF4257AF3EFFC3EDD2038B8B083AC15C3E91277E10600BC0D963947589FCC768F3891F013301A0D09A8FBB468998B02EAAA';
wwv_flow_imp.g_varchar2_table(272) := '07DE3FE0E23FEF9C8E8BBF2D1FE7C2A0A0876D2C78896C302B62B69FCFACDEE1B04FC0FEDE0EEDED5EA0DD9D0B668B730D6474D9569955F011C1FB6E77BA59F2C2B77ADC3FD046C026C0703890F6F93FBD3290C80790E7873A80ACDE7C7E55C75ACE1BE0';
wwv_flow_imp.g_varchar2_table(273) := 'E287A8C63C9E868BBF2D1FD70C60CB0FE9E53460AEDBD6C5481F6EEAC0346E89DCECF7CF5DA00FBFE68DF4573FFB3FE9DD7FF257F4F9F77F846EFED467E8961B3F4B5FFEC43FD1A7FFFE7DF4CEDFFB637AE5FFF7BFD327DFF24E1AEC1FD0AC4708B2EB9A';
wwv_flow_imp.g_varchar2_table(274) := '998999A7551BD2440369843592BDE95FAC9303A6E7BA53959BA40E0A39E1E1A4D7A1D8E5F0C4B9044AD52E2E86AB1C78032EBA901F341034509B063243E043AF7E03BDE1D75E44AFFBA5E7D3EBFEE7F3E9F5FFF30574C30B5E4E1F7FD3DBA9BFB72FC101';
wwv_flow_imp.g_varchar2_table(275) := '8F6BBA3629E763DCCCD272BF24A07AE996640010E9489396B9285793B00E0070D1CD9BCFC200904D2D5FAC74055CCCF13638C04557757EABDD9E39D7E4AAAFD3E950A7EBEFA1C39B049271A427CF3FF31036B6B66963738B98D9204FB7E8E356BB3D534F';
wwv_flow_imp.g_varchar2_table(276) := 'F0E60703770400E718489FC39EFC15405C1B40DDED439F045CF56048075C74AE7C7899495C0527574D217F960622896801190DBC48203B766D710EE1E5E3863F9428968B3E9FAF64FC07F2E9E1F8A4064CA44674C512A9034EE612610C4D23E4E5AE2995';
wwv_flow_imp.g_varchar2_table(277) := '6738F598A7A686C4A0817A352037FD7A2BA889BB844C13414DDCD7802D062B600D9A129AB0461A686A53E4062C5FAB747229951D6E9C06808E5AA4752475CF9240B20B7E5B519B0057317853838ADE493DAB2EA535F97842B378CCCAD3C21F984583BC78';
wwv_flow_imp.g_varchar2_table(278) := 'FCBC3CF61709C8969EE772B5B6DA1DF18C3BC4AC8905E5B81065EFE4EE89D7DF24CF3F6B4F24F3A6D18C55CBA9471F8B653E2478F859B9FC7630EC13904FCF8E5B72DDB5E41AC98EEBDA9AF3AE94933DBC0CC049E82048D7B8C888E5A0CBB2714D02D971';
wwv_flow_imp.g_varchar2_table(279) := 'D856A381A8D52620E386057C40765C763B1AF9FDAA29A20F40D97A4E5B392D638E96B1C7D66E3C3986753AB67C5BBAFBCAB7955C68BAFF80515EAC6A0D9CF2722CAB64B3DACFDC2C794E9C1523DB2CF9AAE8AFB3F89F9066FE03677BE6AF2270081A68BA';
wwv_flow_imp.g_varchar2_table(280) := '065657BEF2E3CDD20C00E3498945C3AC880536E5A71E31ACCA218D46936F90CB97832A807CBAEB981513E0A22B9BCFE26519F0ECF696E55FB61C740F44AD483C8256593647E57A9B9B048027709461D9010DD0DBD826839E941730CBF910588A2D2D59EB';
wwv_flow_imp.g_varchar2_table(281) := '88E0354366C026C8A07F48403E1F530349124B74A04F43A1C9E7A7C74C5AE6FD60F553CD1FD327D1F74DBFD4D6DAE0610056829A32989BD90F6A6AEEC2D832A77AD5126902D2C8D588923836282B4842E9DFECF24C9178B491D43D9B2EE4661A40B404C8';
wwv_flow_imp.g_varchar2_table(282) := '8EF3DBA24F1F65E555B6D3ECADDCD2CB4E7278358CBDA8D696480603A26A75C0ECC30F344CCC4CABF51179E55B5666D395CDBFB21CAA2E278D59E83990EBB9EA26047E2BA601E9738D92F8740AE3340060750075A907F31A808B7F7FD09FF9A6B8AC3CA2';
wwv_flow_imp.g_varchar2_table(283) := '044076ECBB554A8B6717F99297A6D3C683ACBF1E5F01CDDCBDCC07FAD2BBE8B2F66D6C9DA1CDED33D4156F1EE8747AD411182F5FBCFDADADB3B4B52D3803BAB31449340870F16F4ABE160F6656BF1DCA1C3F80280090C93D907E3C1CDA9F12502A22F445';
wwv_flow_imp.g_varchar2_table(284) := '665EA861A4117190285026677E8BA885C19C1E626CDE38875F9FCBD730FDD8E859743D3D37A4CEAB01AC0300323EE91A0DFFF39395CBB6492C110041769CDF326B6256C4883A4954349F1F8EA76B00E708989E4B84F546802DDF96AE6C19A72D9DF9B4B5';
wwv_flow_imp.g_varchar2_table(285) := '7811ED9DA1D42385CFA05984888DAC033A011A295C102A68603E0D986BBF59FD7BBE06AD6E69A701C062A5017535B115B5BD9E06C07C2990CCE981E4DBC1638B9468311D125E23400DF9B4DB1DF396BDAAC561666266F36400A20CED6E8F0078F900FA14';
wwv_flow_imp.g_varchar2_table(286) := '5075BD8BE2D76E89DE04AEFA0EF67709401400C0EF2000B6721DD153A7C0FB146C7C8AA623CA07B8CA8D3C5779DBF8F85EBF4A211212D9D884F48A34A011F91454C48E62C7534C5AA24C5AA24D55D5775AF830A7E3A98E5A04E4DB9DE93D29787F741A00';
wwv_flow_imp.g_varchar2_table(287) := 'F98AEA3BE6FA583B392FB36EA77081602D3410E6BDD7E2348646ACA1064E6F939C0680D29A94D6B56908DEA096393E66452CDEB8ABA283C37D3A383CB092993723CD9863CD17545A91D28B3300F07CB78FA79597B3EA63CCC703AC44EF82AAF9AF3B3FF4';
wwv_flow_imp.g_varchar2_table(288) := 'D914D32DF27CFB0FF6F74C24205B6D9DCFCFDE7F80EB01C8E7D77D1C896701B8EA198D865E4FE3D8F8C00C026CF959BA122F11C88EC3B61E0D28AD491DBBFE8B8E9F9954BE9E27C63E202B17B6C53400DD01B65203DCC4B0770000100049444154B9F701';
wwv_flow_imp.g_varchar2_table(289) := 'B6FC7CBACA272CE398596EC08077E53E438837B38513324B7B095878D5A1C2A081A081A081931A304391F97732FD941C9DE6663A0D00AD23D282BA95D46EB5642EBAEDAC06EB0000CCA7025981B29E09565602199FBAB799C7AD9416CB3BAABBBA09FECC';
wwv_flow_imp.g_varchar2_table(290) := '9A58D0EA7409982008098534D06E77A5DF760B95394E9C79FEBD5EFAFE83E3798BDCBFD82FA399FDD2F7B70E6CB2FB5EA7ADA8EDB536C8564F48F7D300331333FB11CFA01A79AE0D515AC63DC10C56216B860674D422C04682F545FDC3435BF644BA9A48';
wwv_flow_imp.g_varchar2_table(291) := '599984D58E02C855B73C4D5770C12F4FF886D63C974EE71F8017AA15BCC3005868A5A1B2A0813A34B0AA3C678C19B836018FA6590D00581980078F4A48E08D02CC8A58E0629ACDA9F6FB87E6FD00C6F239B0AF0DB0F1D3628D02B6FCBAD2DBED36B53B9D';
wwv_flow_imp.g_varchar2_table(292) := 'BAD85BF9767B1BD4EDF688990DAC8421C34B0398AF07BA5DD1AB78F1AE422CD117C09C07A14F3DFF0D57B185E5B7A44FB63AF6485CBA8621A6519CBE9DB3A86078DF3CE02A876B5247918B2CE4374403F16848804D1C96311DD0124D066C74217DB60670';
wwv_flow_imp.g_varchar2_table(293) := '4DE0DA802E99F504F1D1F58988CCD0FDE65C35C12124040D2C430363838439354C989BB12591A31E7570E56C9959C49D1F6406EB197C149354245FF60215FD3013C99716FD917A9999989B051168D19A3835F5AD6443A57FCEEE13888E03EED6590D00BD';
wwv_flow_imp.g_varchar2_table(294) := '604B8D39BDE8DAED0E016ED1538AC3FD5D0286E337AFA5A9EEFFED4E8F8045B733930CEB0E003683ADF53464E4736F23D1AB41AB45F058E766582103CC3FDFF941F7A76B1EFAE086E14174E5DDAE256676B6B625FA05F0064483CD33B421E888970F1CBD';
wwv_flow_imp.g_varchar2_table(295) := '01F1CC59DA1280167032F624E89ED9A26BBEF64173EBEF1E8F782801777FE4D791154273CDD73C88EE22709DB33B3DE4FED4DEEC99F7CB9B95E2C988E0A5D89A15891EA3565B74AE046EBDDBF8144D6766BADDBDEE26FA7B90A059FDF0EA7BDF9D708D14';
wwv_flow_imp.g_varchar2_table(296) := '6D53197ADC3680A265871201006CE594D6A4B4B66587F4821AE848A46ED6FB42F6F7F6687F6F57AEB5C4C0C65ED932D63B7D7103CB7AEBB19AD6B178940FF9EE6FA5873FFD7B9B851FFC5EBAFBA3BE8EE44E444DFF6C5F79057DDDF77FE7FCFAFBA1EFA3';
wwv_flow_imp.g_varchar2_table(297) := 'EB7FE829F4D8E73C6326BEFED94FA3AF7FF6F73BEAFB1E7AE853BF83B62EBFACE9EA239CE3FB3DE9B18EF62CA77F3EF0DB9E24E285318B2AFF04865603402945C0A25584B7C5612D805291D41F555EBDF130DA6DF1FEBBD491B9F0CA2BF064C8CCE6A26E';
wwv_flow_imp.g_varchar2_table(298) := 'B73B0478162B45A6A396CCFB6F10E69B4B31A8B91093FC8911A0B4F4B9068145166626118F7C3F594449CBFC3580730B20EA02F8F2294C277242DE6A74A849691FB8CE97F0509A48641B0E070490E3D36EC9F5207090559ECD8CF3CCC418F7E4BCAB0601';
wwv_flow_imp.g_varchar2_table(299) := '321157DEE4A90C47E2C90353336724C6A384E291FD3704A2569B80192C4256010DB4E4BE01306B6241BE28A26CC0C1C11E1D1CECE7B38F8ED5D15E837698D1DB81FA8462AE977F7D9297E3CC7CBADA5B4E4BA154D040D040390D94993828575355A54E0F';
wwv_flow_imp.g_varchar2_table(300) := '1FFBB9B118004C91783091788ECB525277A347DD8D0D6256C48279E5D0D216005E30302FBFAACA23DAD192F91CB411A88A6FC607F7FD4EA7FC73EA199FB00D1A9847038787877438E3291D5C9B2922D232F6CC535728BB680D2432CF1C0B461315634C03';
wwv_flow_imp.g_varchar2_table(301) := '5AAD16B5240A3041B0A209663D4B1CD3683834C88E17DD9C76BB2D11E4B6B55ABC3307D8BD709E00FC6220DEF6983D25A8A69634CEA2F937357BF512B3B664DBA6B58089999B2654902768A0020D8CBD8F6CC4A9806360D12C0D384FAD19DB9A36BECDA3';
wwv_flow_imp.g_varchar2_table(302) := 'C3719F3EC1224BCBB627321B75909EAF54CE090340C353D611B1CCC99AB9A72589AE450600F3F49D12BF8EC6AC88055881DDE9C9FCF7C6166D6C6E2DA935F66A99999859A21D9BD413F9586406EC25424ED0C06A69006FECC47C2490971C7D1DC07B149A';
wwv_flow_imp.g_varchar2_table(303) := '1499CBCB795A8EE3D168E65C7E5E0F38B7C3415F92D31B8AEC9CF8B6DB1D6AB7DAC49C8E73273257E800EB2280BDDD0BB4B7BB433B3BE768E7C239D93F6F807D83F3E725FD3CF565DE1DA8BB898820635D1BB32616D8EA8BC7BFD2B8BF77810EF6778EC8';
wwv_flow_imp.g_varchar2_table(304) := 'D4D1DE891D962340368DF8CE2F0BF3FC3C1AA18A2044D0C0CA6960FACDE1A819726D3287EBF3481F61A7760DCC5D8171A3F3FD7A7C6CF2E6AEC19B0133AE1DC0BBC811E19101C063CF1356784F3CE6238A25EFB4C48204BABD4D02323933B158AC1E00CF';
wwv_flow_imp.g_varchar2_table(305) := 'F403E619ECAD33B475E61283B6940732FAA66EF538E2B1B97D9636B7CF3455CC09B912E9ECC0703020607F7F978E031E0290C87C1930C12024ACB506124A68D0878738BD993D89CCF5E4DA46B411984E1552EBD50093525A10C93C3EE6F2B19A7F7C33A3';
wwv_flow_imp.g_varchar2_table(306) := 'D91FACEB00F25418930178A8403E7F558E3176017B3B17686FE7BCCCF70F0C6CF223CA051C1EEE13B02FD102006324602B57369D998999A9D3ED08BA85D9A8C225965D401A9B8AC0B201B0196F65377C97A1018FC1420C8554320FDA9430FC5F7B0D84EB';
wwv_flow_imp.g_varchar2_table(307) := 'B6A9A7F8E8726DAA8073C955B430C62CA068B98BF475DCFC2F722FBF776400609EBDD3ED11AC70A03CCB7A4A220A006C89878C37A96D9FBD8400EC6F89C70CD981CC93AE478AFAB932B3B1E8EAAF69BE1AD0A101CC87EDEDECD0FE1E7081B0E2F4380E24';
wwv_flow_imp.g_varchar2_table(308) := '2200EC8CE7CC76C67364B0AA81F9A408A5574D03CC8A58D0ED6D11BC7F1D4504AC5A3BD64D5E366BBE78DCAC848632AF3FEBFAEC8F7F8305DE2E302E78B4E94A14B9B7B149CC6C7094B1223B98EF070EF6F764CE7CAFB4D4C3F11B6A1105C05889311328';
wwv_flow_imp.g_varchar2_table(309) := 'CDD05210F746208ADA0458C82692D5C514BEB8DBF83DC89AA1F1C2961410ED2B597491C58E5C051F0B794C73542615749C9A1E84FFA74203CC2BD2BF4FC5D9A8BA91DCE89B7EB1D656383AE5C6BD6272D443AD3A32FF06C07A00EAA926705D370DECEFC9';
wwv_flow_imp.g_varchar2_table(310) := '5CBF78FDF17875A96FFBE02D00880A00BB17CE9BB935997CF46511E8564D034C8495CAC0E6D61902A2568B80556BCABACA1BE98880AC7DFDC34302B2E36C8BA8007028913D204BCFB65DB99F74C5FBD72B1ED9393C90397C41D6AE79B7D938B987B504BB';
wwv_flow_imp.g_varchar2_table(311) := '1757E1CFCB375FBE2B5197EEC606291519E4F3F3C72A9F108E83065C1A484358155AC6AE0A437ED0C069D640E32EB5C60954A077F890D6DC3E8904A463A88F2C6568C4E2F68CB029AC9007CA5413CA9C3E0D6085FFC1C19E59098B374ACDAB81CC32966B';
wwv_flow_imp.g_varchar2_table(312) := '625E56A17C0335C0C4D4C37CBF788661B57FB913942458955FAEAC6F29447F818C3EBB2E87E3A77BB22DA27607322F9ED1655B78FD5D39C7E00164E9ABB6C5BCFF683492F16D281894169F79FA73F9A95E473418F409EB284A576029C82C579CA0DB4BDF';
wwv_flow_imp.g_varchar2_table(313) := 'A48BF50080C6FB7D0488F6B7BB1B47A54304E048156167991AA8D9E65E66D34E79DDE98074CA95700A9ACF2BD1467F21EB1C91EAE4ED6E2133CE1540140C00B7BE028568006FB502B215FE9234F3ABC673501B9B6708C88E67160A99EBA90133E0AC67D3';
wwv_flow_imp.g_varchar2_table(314) := '16D1AA44C26319EAAA8F9522A0D3E9514790D58337C71D47969E6DE1F503F0FA812C7D55B759A4A3ACFC58E702E05D2E802D1280B1141895FCF545977C5A47A40578BB2CB0B1B92DE3F03621DADF6AB58939E5A0D24DF81F34508706C6BD0CACB31E87FD';
wwv_flow_imp.g_varchar2_table(315) := '80A081A081621A58B8D378ECDA2D266983A91725DAEAE82E18008BEA132B5A4F66A11EF60FCC9BAD5CCD5063CFDF589D5B5BE6196F1D45627D6ED1C6D696589ECAC0C527E4070D040D5CD40056DE0F0E0F2E26D4B4D7EEF6A8DDE952D46E0B3AD65ABABD';
wwv_flow_imp.g_varchar2_table(316) := '0DEAAEC19C7FBE81D978974FF73DEE4AF4A42BFA636619E798F02E84AEE82A5F3E4962020EF6F09E81FD7CF6C28ED5C26A0A15ADB006C4FD9030A47F03D2CE3F49CF9349212568206860A606E4EA93FCF4BFECD4FF959BD7EC4A701D03B3A99A96BB2C79';
wwv_flow_imp.g_varchar2_table(317) := '98A12BC02241A1B1D5C2A3647230004A2AEEB4143316EA9EBF850A6B172B5099D958C0999E98D3E3AE780DDD2916714617B64103CBD0C068382471C99651B5579DFDFE80FA337E53C18B4901A29E5CA700D6030051BB6322025BDB97D0D6F6596AC93150';
wwv_flow_imp.g_varchar2_table(318) := '80E54A90E2C926A0A8B059E493C76B29B2F2887E5E442B4B3EDAA64F050C69D03F3438CA58D04E300016A4E850CD710DB01C00B209DFA081A001870616E8FD3B2459DDEC654BEE1AEF96738E8301B0EC7ED1D0FAB3D5B09985EA1213CF9A0299B56BA38F';
wwv_flow_imp.g_varchar2_table(319) := 'F006B828A2286A09DA36B2954987E708E03DDF7BBB17280FBC3701000DB0320D3B6582F6078714CBBC6C539B9D242309508C68DE39EAA2ED336B02BA3D423400C87BB845F935957E5EBD9A714DC6365BFB3A9D2E753A3D5B361D1E1C0AEA5FE391172018';
wwv_flow_imp.g_varchar2_table(320) := '00798D84E3FA3520D301F557B2E81A9663C12FBA95A1BEA08155D4409079BA068201305D2FA73EB5E89C14560E03BE8AC33A00C097BE6974491C13B0BF875F41DC21CC1B4E43F6DE84BDDDF3121D384F8806004D6BCF699707D199246EBE119745E64EFB';
wwv_flow_imp.g_varchar2_table(321) := 'F9AABAFDF168444059BE694473728E3FE397454699A7BF21308BF0141D7733FE65B7C10028ABB950EE98065CF35BC7482DBBF373B0306E6872B2C495BF0D55C9F2C432E7A2F937FFE52968D56BAE5BFED51DBD8201E0D937E02100F0DE80BD29F3BD4843';
wwv_flow_imp.g_varchar2_table(322) := '1EB0AA967A32F66C87A3010D877DA776528B5691D69A60E53A0B8C09B2B9441DB5A49CDD721E93376EB37FB067BCF944E68D015F01B388007E4F01FDC4B75CA0AB470366EE371E51B22246403AAE0CEB51C629E63A1C0D0928AB02A5FDC6BF56BB4DADB6';
wwv_flow_imp.g_varchar2_table(323) := '7DED537A7ECBFF064151F955D10281FE346840BC21F97AB71473FA807781352034378C35684768C25803453AFCB8C8D236AB24EBD294745471ED3B120058D5E12F180096DE9179C2F0EA539C3773B89907376DBE1769597EF6FEECB4EC8EF130522FC352';
wwv_flow_imp.g_varchar2_table(324) := '61439207C3010DF04C34F90D32ADB658B43356BFBA9A8595B1EDB67D75ACABFCA2F3B3393A9C6BC0553FDA0728151190D167FDE4F0609F802C3D6C17AB81D160408067775FAC70536A8BE321C52662119B31650A49482AA181783822A0685113C1D49114';
wwv_flow_imp.g_varchar2_table(325) := '132B40FEBBBEAEB50288BA22FA9A98C8A2DF18ECAA73567E30006669A7B251210917EB0C3DFB5D3A33182C3CABCC85B97AAD5CB85A43859E1A90FE275F4FE2534EE6D3FC862913D1C50589140C805CFFC83CBC5D99E3DFDDB970B4BA3B47E67D38128F1A';
wwv_flow_imp.g_varchar2_table(326) := 'D8DFDD9108C28E3104129C606F0E8B251C0EFA04F8D6AAC5FA057CE9F3743A12CF58904F6FEA71FFF090FA87EEB511782702903D47BDB1B535F5B710FA87FBD4EF1F483F1B1A34B5DDEB2AD768342260D5DA17C731CDB36A7DD5DA5B97BC188B01445562';
wwv_flow_imp.g_varchar2_table(327) := '89AE14AD87736FFE7395575A4B2450B9C84C9FC49A3327E19C046E49E6AC60658BD77193AE83E7CA2AF8340A6E8902987EB12093FF34AA3DB4F9D46AA0910D37C380F9B774F18201303E05FDBE78768283FD5D02123307138F73E7DFC0BA040EF684FFDE';
wwv_flow_imp.g_varchar2_table(328) := 'DEFC0C6BE2806805E0CB1E1E3CE04B6FA36BFA229A443C2E20162F01B0B74313B326BCE3A0BBB17944C6CCC4CCD46E770C8E32C63BFBD227F6A56F8C0FC366411A90C93999E85B3DE30BD728B02035AD6D3588A2C4238CF3E5FA80664580AF8298310E28';
wwv_flow_imp.g_varchar2_table(329) := '190B006D2D168F8612E1A9FF690F65952064D4A801E96CC6EBABB18AC0BA3A0DC8E92AC44C2E72B9C20B1509C441034103556BC0975FD10BDC97EF2C3A9E95B9B0BC536F008CC4D2020E0FF6E850BC7F5FCDB3587E005678031B9BDB32D3D69657000010';
wwv_flow_imp.g_varchar2_table(330) := '0049444154C77B863A9D1E7504363E6695E77040C3E150E6DA17F7BCA74D9E2C1DF34D4076ECDAA2ED299898D945EE915F050F8F6A4A920CCD39739FAF76B74BED4EC7E88479B24DBAD5A269119365BD09ACA43AD6A618BC6860D51A345AD1B50B4DD333';
wwv_flow_imp.g_varchar2_table(331) := 'CE7D9171AF2AF9956652DA7EFB5DD4F9B54B40A7E92316E0BC1EF994C1DEAE41A94F028FF6FC90B3D61A307D65D23858EB3687C6050D2C5803A13AB7064EAD0190C80D1FD8DFDDA5FDDDE273F2BDCD4DEA6D6E51BBDB33D0E3D5F0E971573C406D603B05';
wwv_flow_imp.g_varchar2_table(332) := '07FBFB74B0BFD798A70246F188009BBCF974A5B558B03A9F5CFEB8E1F7C364BC06C0D5C056D422C04697F6132D7D4309F404D9E1C1011D1E1E4EA48784A081E31A304F01489F3C9E16F68B6B605E4F5BCBF50E14AD3992FB05602B37AF5C36BEF974954F';
wwv_flow_imp.g_varchar2_table(333) := '08C71E1A707A70723733341EBC020989B64E9916A4C5B3FA8718A762199E329D84E6060D54A981C0CB4703A7D600E81F1E1090CDBDFA280B346D99DF6FB7BBA4C5820390360D1D9907EEC87CF0B43CA465F5E2997B0069CB04DE8606F8CAC072DB067CE9';
wwv_flow_imp.g_varchar2_table(334) := '67D1211273E10B5FA6DB3EF705BAE5B39F4FF199CFD12D5370ABE403A0AD1BE73EFF05DABBF59C888EB5E23473D2468DDFF4C79ECF05B75A1229684FBE133CED17B189C68C46FEAB8087877D3AF7F92F1A1D96D1CBAD9FBD8980693A2F9276DBE76E1219';
wwv_flow_imp.g_varchar2_table(335) := '802FC8F60B74EE0B5F4ADFB4275A6CF2D7F4C12FDF4CB74EE973C7DB9F6F5F195DFB94B975DCCF51F7852F7D453A1FA60D2F6A30763C8D729132ECCDD240225735308BA68E3C25F70FC0C63B1D0746E207887470086C8473A69F5A03604EBD85E2156A00';
wwv_flow_imp.g_varchar2_table(336) := 'E1CC37FFF6EFD3EBFFD70BE855FFEF2F0BFE17BDF2E77E712A5EF5F3BF42C0EB7FE905861E656AC32FBD903EF0D77F4BC9C27F26F6E460EFA3EA73377D81DEF0ABBF534E27A2CBBFF91FBF4E804DEF59FA5F5ACE0BF291F79A5FFC4D7AED2FFED6911C6F';
wwv_flow_imp.g_varchar2_table(337) := 'FACD9792B981F9346289343000DEF67BAFA057FE97FF4968CB34A07DAFFD0569DF2F5C6C5F2D7D4FCEC7ABFFFBAFD1AB7FFED78C2C37BCE87709D7C812D573B26A895E318BF9AFC6C0BE808093944B3B0A15FB69E0D41A0083419FF0D63F3F355DA46A77';
wwv_flow_imp.g_varchar2_table(338) := 'B0CABB7B31C1B2D76A770860D6C4020B193565CE17030C6093339FAEB526209F5EEA582CDC830B3BB47FDB79EA9FDF11ECD2DE6DE7C4FBBE6D0217BE7433ED7CF916DA3F779EF685BE56481D83BD7DD32478E3803998F22F128F1E9892353509B4C0D44C';
wwv_flow_imp.g_varchar2_table(339) := '49CCDE4B21BB5EDF7838A2323AD9BB25D5F1B92F4AF4E00B8878A4C77BB71EDBCAB9E85FD823607830A091604FD24ED008FDAEE096CFDF44C07E766E448790CDAB11CB24923E78B8B333D1DF8EB771176D96F6EC9D3B4747EDCBDA59E556EAD897EB60FF';
wwv_flow_imp.g_varchar2_table(340) := 'FC05731D604B22DF34F5A04F02D3F2EA48EB5D72866E7FBF7BD257FDB36FA4EB7FE829F4A8E73E9D1EF6F4EFA57B3DFE5174E55DAFA1CED6661DD53697278B68806C8A7C796C3CB9CAC4A311012EBAB2F9AA6CC1552E076BDF76412DA55D72711B999652';
wwv_flow_imp.g_varchar2_table(341) := '79432B159DD8244B7555DC4BB6F13BEDE9D02760D5C3B4736153BFA4831760E5B7AA19D3F450575BB2BAB26D5DF5F8F015CFBEBDD1A3FB7DD3E3E8713FF16C7AF4737E90EEF7CD8FA36B1EFA60BAE303EE43D77DDD43E821DFF9647ACC8F3D831EF3BC1F';
wwv_flow_imp.g_varchar2_table(342) := 'A2ABEE7537C254980FEB7A6802575F0D9C3A03005E3FE6DC93826FFA8BDA1D02989998D957BF8475009D6EC74A9FCDF54026C86625AC3523A138114B53E6156BADC6833956D4EA19BF0D90EA2B2684E59306AD82468F003C9A6848B48E480B9815B1C024';
wwv_flow_imp.g_varchar2_table(343) := '1EFB87F518C0B1A45A76F7F777E9E0608F12CBF5C09C46B0F05643F3D48B5C07ED769B2283C97E9D9E9F112DB73FD7A22AC354EBF4BC99831AFF69A50970562106974C633BC94A13C858B771C959FABA1FF82E7AE0B73D892EB9E3D5847759E006CFCCC4';
wwv_flow_imp.g_varchar2_table(344) := '2C30DEAC221809574814E01BC448B8FF93BF81A2CEE41A97D27234B4A0D6E5FA836F393C9905D4D57C5517E3C0F7B806F8F84133F731903446321F7D354AE0C668AE164130C80B2EF2F6393F17A9C3DE8A6A40CE79EFEC363DFCE9DF43777EC80308377D';
wwv_flow_imp.g_varchar2_table(345) := '9F96A848D37DBFF1B1749F273EC6BB8C0F5F5F9A40E7AF0195488809C0DB90A60179803FCB66530E4743028A4AD98ADA04142E271E53ABDD164B39F5A46CE5CD9A8481FB57E66CE5D7251DDEBFD65A9A33EB2693907993E2D0FD663E6154C917EF0B9F35';
wwv_flow_imp.g_varchar2_table(346) := '17A74B3E0F6CF30492B1479E5D939534E218938CEF4874081CCB3AB1DBDBD8A45E6FE3441A0EDAD2AF01EC4F43FFF09080697921AD3A0DE0DC01D5711C736226DCFC1FF6CFBF9B6E77AFBBCBF835EB7A1C9739B681F7FF806F79BC4C133C887C0D8763C5';
wwv_flow_imp.g_varchar2_table(347) := '1BBFCB12B503E615548D9F1EB2F1419413B0E5CF9B9E4600C408B03382A795C14E15726669402E1E16CC2299C883CE27124F47425155D5AE159C0BA0F68A42054103CBD7808C551B12F6C722BFDBDFF75EC412E22F231433D3FD241280858365CA972B13';
wwv_flow_imp.g_varchar2_table(348) := '4A15D180DABD709E76772ED0DE2E705EB627B173FE1CA5384F3B428B39C37DBCC14EE65FEBB44C8A34A208ED683024A0481922262DF3D2B3566D93E3D3EE74A83DE3BD00B0E253887CC39183DBFA67332B624624607A5B11C501A6E7569F9A88919C8857';
wwv_flow_imp.g_varchar2_table(349) := '5E35672DD10EC0C637ED13D5473AFA03F1D005B67AF538A2A1A5DF03793AAD23D2029B0713C7430292151D27F2ED5DF431740E2CBA5E929B366EFE0F7DDA77D0EDEE2D9E7FC99BBF915B789DB9FD5574C5757721F0A5067E923821A0A8684A6B52DA3E3E';
wwv_flow_imp.g_varchar2_table(350) := 'F9F253325D02D8E8F1840760CB9F375D5D6460F370900E08A50C82F25FBEE363D93B155FF148A52F9F8AA636A391A2F0660812A4081A383D1A90416EE3D2B374FD339E427778C0BDE59E3DFF75A8B426134510DE8B5064A8A3980654B66AD7552CA31BF6';
wwv_flow_imp.g_varchar2_table(351) := '0F09D8DD392F9183F3E659FAE5AD5E77493D999FB56332677A8A8627A423C99CEF6268B5DA0408A3995F976736B3F01A652AADC4C23E669FE6DA164B9404C825AFDCA1E95FD2C76C8223CA01D8F2CBA69B3500037B642192FE0AB8F8B724B205D8E87C7F';
wwv_flow_imp.g_varchar2_table(352) := '45D156BE29E9CC8A58D014793239D03780ECB8F4566ED05B975F4A5FFFC33F4057DDF3AEC43CDF78775C8EABEE791DB152C7931AB31F8F2355450542F40B285A2E4FAFA54F01F9F4EC385D7B146787956F9B79562A6F66601834103470A40144F280A384';
wwv_flow_imp.g_varchar2_table(353) := 'B0739A35C0CCB475C565F488673D8D2EBFEECE95DEFCA1D7DED933C2137B75639DF9D713752F6D00603E1438183F478C2800D0D453603C9EA1FFBBD5B376C0CA03B2E3B25B66968B80296A770C6C7C105D19CE989BB5955BB774E81CB0B5ABACE56EE3D7';
wwv_flow_imp.g_varchar2_table(354) := 'D4F41156E98FD06FAB1900309F88E78A13310092196B1AF04B65B37ED530D31768409B1DE7B7F04E817CFAAA1D2BAD4969BD70B19935B1C0567152720EFB889F8C4B9B72F347D8BF8E9B3FEA49A4AF61BB4E5012D100E66D531A018CAC6CD28875D32300';
wwv_flow_imp.g_varchar2_table(355) := '6B7882AD67641119D58CF58B9034D4B1080DD4D21F66314D8D55DFA631B39002B209DFD5D1809C3784FD1FF1CCA7125EE0C35CCF39DCF9F2CDB408236075149F97D443EFB32ED73CBB02C7AA00ED4C521309906800A200C04CE22564A2030245ABC6A901';
wwv_flow_imp.g_varchar2_table(356) := '8A96B3D1E35D02802D3FA4A71A80CE81F4C8FEBF6C64C7CEB1640E84050A16D758656F3CCB5985131A8D460244020A56902377798CCC8A18504C3EF3B6A061D032CAE95C6D44F19AACD59868D88212F0840860AB2E3673D8786AA8E01D8225EC2F73FE75';
wwv_flow_imp.g_varchar2_table(357) := '85FD8FCBFBF97FFC302512A9389EB6EAFB4A6902E66D873A8A24F00C56E3EBBF44047B065393A5CCFFF02F682068600E0DCCBA783DD87A152F38C0CFACD687979750E35A84566E28E303CBC6A74E4BD190ECD64001F532CBCD5FC2FE8BB8F90F0E0EE8A6';
wwv_flow_imp.g_varchar2_table(358) := '0F7E949219D34DEEC6F9502C9246FAFB22AB33751538C186DEEF9FD50068777A046C6C9EA18DCD6D336F8DF96B175B130938D8A3C67866638163994705C687DE9BD4C3B1AAC99B4F4618B55A04AF8F68199D882AFBA03B029531CC31F2D57B1C8F08C815';
wwv_flow_imp.g_varchar2_table(359) := '5FF8A1529AB48E6AAB77348A095180792BC035104B34C1C647694D4A2B5BB635BD25FDBAD56E4FE4C7630F3591694260822024CCD400DEBB0FCC24924CE836893DE68AE5E65FF79CBF8863BE90E9E64F7D86CE7FE14B54EBEF1598DA8AFD836C40B15217';
wwv_flow_imp.g_varchar2_table(360) := 'A995D6948EE317D3CAECA5E31C1333A0AC2CF04BADB18C7556829219F61A4F30E41347CE03B9D81B77C69D422F8E40CE3551419552F8345A03E69C365AC220DCA9D78074D245CCF91B3DCB3DA0BFB34BEF7EC52BE950B626ADC67F8B662DAAACB04ADC0C';
wwv_flow_imp.g_varchar2_table(361) := '800A597AB29A3000948A08487FC5AE67AC1C583ADDEE0601C8035CFCF7F776697F6F47423F89818BBEA9F94A69D1C7E4DCE67CF23269F116F58CE7BFA9E19F91445480BAC4F4D57B225E0F50971C8BE1CBA68FCDBAAEA06B80E6FDC89CA354362F9789F2';
wwv_flow_imp.g_varchar2_table(362) := 'A63F4B9F9EC8300909A5CF3363AEDA24847F9E1AD0F03405B3C945BF721DC04BB4D2C91DCBDCFC6B7AD42F5FEFC1855D7ADB4BFE37DDFA99CF3772FC47140CC8CBED3A66D6C4AC84ACDA1BB6D28A94D6C277FA17631C303DB77C2A5A32595A3A0B91AD81';
wwv_flow_imp.g_varchar2_table(363) := 'B674B27CEA0C145BAA0CC9410341030DD3401807E63B21AE71D7AE5FE6C5CDF9A38DFDBD7D7AFBCBFE0F7DFE031F59D0CD1FB52E12AE73B14859E6AB6BC200E8F6E0E9F726B8323331336D6C6E127E216C8220979024B19CFC980EF6F6E8607F2F97BBF8';
wwv_flow_imp.g_varchar2_table(364) := 'C391CC7B028BAF797A8D78761A989E1B52894507806C667D47D2CF805934AB90C758492FB0C90AEB1FB0E5FBA6A71EE5C4657F545C8B170F1C2578EEA47CED1E4CBA26C8FEE641CF6A2A2743D405A89C71450C712EB4D2C4CC02FB79B3EA57CA6D5E7199';
wwv_flow_imp.g_varchar2_table(365) := '79BD6F5DCFF91F3555C2FE7BE7CED3EB7EFD85F4F177FCBD79536C2269C011CD8AEF28E3A973E5AD60A508B031C6BD0BB0E5974D57650A324301806769E9049E94812C68A0991A28D0DD9BD980E352A131C0F1B4B0DF580D141D6FB386483913F6AFF939';
wwv_flow_imp.g_varchar2_table(366) := '7F539D8CF183C3437AE3F35F4C9F79F7FBA90A63D5F0F5F81748CA6BE0C800502A9DFBD7782E596063C9634BA5D3E952A7331929C8971B0EFB04F4FB8704E4F317759C50FAB7A8FA5CF528F1B400175D53F3317F06D4259FF17C44472EFE18680017DD7C';
wwv_flow_imp.g_varchar2_table(367) := 'F94C5A64D135AED940340820CB678437020A2CD9DEC9A61D1A1EA59AEA51C22C00BC198E09B37181793ADFE16848C098BC311B96A80BD018812C8228E3796A4BEE94E4ECE6FFAC7A5EEF9BAF71EFFC057AEDAF3C9F3EFD0FEFA37828E75AC67BBCD574CF';
wwv_flow_imp.g_varchar2_table(368) := 'FCD26CF3D6828DE45A02F2ED701DA7D74FE4222B9CAF5911602B98DEBDECD33CB672AE74E522A82EBF7AE1AB932D700A1A384D1A28738B3F4DFA59EDB6322F7ECEFF8DCF7F097DE63DF0FCA78CF3121DA86F1A60B5CFD5B2A53F3200F07C3AE02B50BBDB';
wwv_flow_imp.g_varchar2_table(369) := '238059130B5CE50EF7F70880B706B8E89B92AF24E201542D0F2B26A06ABE8BE297C8DC3B50777DE85B80AD1E4421B0C2DC96BF2AE99907BD28790B7B949E8229AD49693D419D9EA7F014C084623C13342250021B39E6870162A6CD05CDF9277263DFBDF5';
wwv_flow_imp.g_varchar2_table(370) := '367ADDAFBD70ECF94F9EDFD8BC076248FBBB3BB427B0C9BF2AE92C8202B2A9F4ABE4DC0236A618E3005B7ED97455B660B97253ACC3728C42A9A081A081A081A081631A6066BAF4CE77A0473DE79FD7FA6E7F54899BFFC1851D7ADDAFBE403CFF7FF49BF3';
wwv_flow_imp.g_varchar2_table(371) := '174EDD47B50000100049444154830165AB44E0359F068E0C0078B94051767822A0B7B1E15D6C7F7F97F6251AE05D60C984B178BA40D562B82CFAAAEB5B557E5ABC49C0267F22E70758F5174F29A509B0B5334B1FC95C3A901D376D6B8B64E01C19C4B1DF';
wwv_flow_imp.g_varchar2_table(372) := 'CDA2690D5BB23CF03A01AB181251BCECDA3BD3A39FFB8374C91D6F2F818099D45636BE19BB37DF42AFF9A5DFA09B3EF01199F39FF4FCF37CB24840FF609F807CFEA28F47259F0A83970E542D2F33CF3C67493222A0EA7A55350C99447AF2FF201200F897';
wwv_flow_imp.g_varchar2_table(373) := '08944103B334109C8B59DA0979EBAC01185D575C7B177ADCF39E491B975E2243B18CC7353678EFB673F4B7BFF122FAC2873F2E37A5658EE33536F294B03E32009456A4B42EDC6C1D45A4234D51AB4D3EBF15809597E933AB23C2B67085250B60FE04F390';
wwv_flow_imp.g_varchar2_table(374) := '858BA37F03850BFA15502A22C08FFAF45169E99380ABE5712CFD49BC63175DD97CACD007CA967795535A93D21ED71FFA22E06258365F2922A06479CD8A005BF1B29E978DDF6949D7518B807C7B59CED595D75D43DFF063CFA2B3575F55EBCD3F112B7BE7';
wwv_flow_imp.g_varchar2_table(375) := '2B37D3EB7EE5F9F4F90F7E94CA8CA787871201E81F50B2E44850D955F5CC5C8B8E95D6A4B4CE9FDE89639C036022A36482BA588E2FEE16DE2B5AB6CE11ACB0F0A1C0CA6B20F4A7953F85A1018535C0CC04CFFF1B7EECD9B47DE51585CB1729809B0EE6FC';
wwv_flow_imp.g_varchar2_table(376) := '5FFFEBBF4D377DE863E6065EA4FC715AF0AA62CAEE38CFB05F4E03630380498BF5A17544653FDD4E8F00DFF2FDC303027CE9E7A3137BEF68AE783E4E55975662C10355F35D177E4AFA24E06C0F6C00C049D84C0266F6F22C30780275B5422B4D4059FEF0';
wwv_flow_imp.g_varchar2_table(377) := '52015BF958A234802D7FD1E9B1CC05038BAE77DEFAE0F95F219EFF37FED473E98C78FEC4F3729C5DFE68CEDFD3F36756C4021BD783FDFDA5BE21B67444D8D6A039D3999998D9C9057D1570127A122843E7AED790857F4103CDD5C00ADFFD9BABD4205903';
wwv_flow_imp.g_varchar2_table(378) := '35C08A0961FFC7FFF80F9B47FE98EB1DC09B39E73FCF89C15801CCC3633DCA8AF32973D08CB987F93A112C5200D63FE0520FDE0E082C7B2EC82567DDF9DA445EA0FFBA6BAA96BF5AD0DA0566F6B38C654E318EDDAB91CB6A615173D7CC8A58609333AEC4';
wwv_flow_imp.g_varchar2_table(379) := '834E68247CB01EC7564FD974195048C90DCA567E28F502B6FC45A7270D8D0CE6F590EA55FA865272F3BF969EF0933F2A73FEB72366CE9356769C9498F367B997001B5B67086056C482BC5018FB01AC0303F2F9751FA36D899CFBBAEB693A7FD57401837C';
wwv_flow_imp.g_varchar2_table(380) := '410341033568A05607083725A006B94F334BB9D99F98F3AF51C589DCFCCBCFF93331A7A8EB7405BED56840B158EB4035EC885AADB6812FBFC17040802FFDA2E9E0550275D58B68095017FFBAF8A2CF0075F1CFF86A3C6522511222A6599F442200C02C9A';
wwv_flow_imp.g_varchar2_table(381) := '79F29205FD9684D29A94AE2F22041D25717D777F160F9531A6B02216E4758EA803A20FABB6080C4F8000F9F62CEA58C97570F9B577A26FFCE966CEF9677A68B7DBD46EB788990D5AED0E01597E7E7BB0BF4707FBFBF9E4DA8E61D800B555B0628CD58AC9';
wwv_flow_imp.g_varchar2_table(382) := '1BC4AD4B035C17E30AF83659B60A9AB77016E2DDD57B03769C30B13F8C080B6FF86A56C8CC74E95DEE408F78F6D368F3F2CBCC8DB5CE96EC9F3BBFE0E7FCC5BC2ED421E66CBDF4BF7AFBFF9CF22DB0B882550B54556714B5A808BFC1E1210DFAFDAAAAAF';
wwv_flow_imp.g_varchar2_table(383) := '9C4F52B367A9B426CCEF552E7821864C5A47A4E5DC91E78729FDF3249F9B8C5911B3DD33C6350DCC5D51C3198C4678DF41F9B50EA6BCF4E9BA9BA9B422A5B5B59A38463B86D6FC90916A0011954BAFB9237DFD0FFF009DB9EA4A62E634A38EFF7213DEBD';
wwv_flow_imp.g_varchar2_table(384) := 'F9567AE36FBCB8F473FEBAD5222013AF8D0840AB9D1D4E6C63F35B01231A0EFA721F389CC8AF3A2196EB275E40FFAF5AEEBAF8A95A189B4E5AA0A34AC7AB458E55616A5465FEAD8AC40B9633E866C10AAFB9BAD360AACDAF4266F1FCEF7C077AC4B39E4A';
wwv_flow_imp.g_varchar2_table(385) := '5B575C363FC3591C640C3EDCD9A5BF7BFECBD237FC55789364C6F50BD80428D61F6C5C427A710D546E00C062E5A33940BB0790899A5980491253229D304BAF76CB62392B836AF9CECF8D39954D294D4A45F3335C10072DDE1DB0A0EA48696560AB6F341A';
wwv_flow_imp.g_varchar2_table(386) := '9A95EDB6FCF9D213C31BF3D7F3F199BFB4044BCD6A84B29C62D11350B6BC6F394401011B7D0C4F4C60CBAF3B3D911B1C50773D65F9B35212F6BFA3F9619FBA5FF20319776F3D476FFAAD97D3173F5CEE253F2CD13940239228004F00ED007414919E1161';
wwv_flow_imp.g_varchar2_table(387) := 'EC4B24184099D3083C0901B8DA8E310870D1F9E62B5FC262744C243736F2FE8805285F6FF2B524149DAD65BBD6A451A7BE7F56741E312E0015B15B4736CCE2F99B39FFA72EE4DDFE07E72ED0DB7EE70FE94B1FFF54AD4E5835E72A70A95203E256890D20';
wwv_flow_imp.g_varchar2_table(388) := 'D666954CC14B479A742BC2AE1786C3819907F2222E41947A90BA44C9C51489445791CC9F2DA6B6C95AE25142F1289ECCB0A4C0AA072CD99527C39B042A67DC30864CE99F4D2C9CA358CE952DDF953E94080060A3D3C653F3BF6E6D7CB274A5B5B9895D79';
wwv_flow_imp.g_varchar2_table(389) := 'D76BE92E0FFE2ABAE7231F46F7105C75AFBBD12577BA3DB5377AC4CC19F9C2B6980706BC2BC4180978172847C812E9BAECDA3B2D6ECEFF96DBE8CD2FFC3DFAE2C73E4988888C24120B14951E633D602BD792B1ADD56ADBB229366B01248A374C61250C19';
wwv_flow_imp.g_varchar2_table(390) := '956A4055CA2D305B610D041777754E5EF3CF153353D4EDD003BEF909F4CDFFF627E85BFEC34FD137FDDB1FA7C73DEF59F40D8227FD9B1FA36FFCD7CFA3473FF7E974E7AFFE2A5AA431D9D4F3CCCC74E5DDAFA3473EFBFB1734E7BF476F7DD11F88E79FDE';
wwv_flow_imp.g_varchar2_table(391) := 'FC9BAA97E37285FD6A35A0B4D20454CB9648B332F0E50BAF04F0A55F373AA5140159BBFA153D1BAB617977BB195BCB36A1442CFF24F15F5DAEA4DF0016860B4F8E257A012CBCE2718549021DCE7F63D65AAE47C198EDC406E728917355F63126E8089860';
wwv_flow_imp.g_varchar2_table(392) := '5C65026E6477BB8E9EF46F7F8C1EF6D4EFA4CBAFBD3375B6364F78FA4A2BEA9DDDA62BEF2137BC673D95BEF6A9DF4EBD4BCE5429C54C5E713C12AFD3BFBF6B25E7453093E91C992CFAB8F29E7715CF5F6EFE975F3A0727BFA2E99CFFCBE84BE2F91FEF0F';
wwv_flow_imp.g_varchar2_table(393) := '49C9B5115AE6FD015BED9178FF802D3F4BEF0F0E09C88E9BB6555A93D2BA6962959647952E190AD6A701B9991CEEEC55C67FF3CACB4E0CBE95310E8CC61A901BBF7CC7078BD92CBA3EDF5631D11DEF7F6FE3D95F71D76B089E3DB3245ACA333381E66E8F';
wwv_flow_imp.g_varchar2_table(394) := 'F85ABAFE19DF47DDEDAD53D757D1FEABC410BAFE87BE97BA622889022CDAAA26399BF3FFF227EA9CF3AF46D6935CC251D51AA8CD00D0518B005F81E3A158E4025FFA75A333EF4F109DA15DE24BD2EECDB762B7125C7AA73B50D5838A526AA19630FA1240';
wwv_flow_imp.g_varchar2_table(395) := '964FEA19FB7B741636A593319F8C95EDA519142C988891086FAD603189F48C0C8A96F3A267A2CDCB2EA5077FE7B7D0A678B1CC92E055904C5FBADDBDEE661E79DBB8F4AC7457F62C598E0CBA037C4B2BC5A454F5C3253CFFABEE799DB4FB69B429BA9386';
wwv_flow_imp.g_varchar2_table(396) := '536D1FE933BBC7E6FC8F7BFE599D492CA38F203BF6DD6AAD486B6D256766691A5314B50D6C84A3C1807C56C3DBCAD79DCE9CB6A3EE7A16C5BFFA1EBD28C9D7B91EF1EE766FBDADB216DEFE3EF7207819953124267C297C82068E698099E99E8FB99EB66F';
wwv_flow_imp.g_varchar2_table(397) := '7705314B1F3996E7B3CBCC74BB7BDD9D1EF683DF439832A0E22C7CAA2941034180124567146166C29CFFC39FFEBDD43BB33D83B2822CB9F923AA58CF9C3F74035420275888ACD3A6B8901550AD066A330094D6A4B4F696361EAF02359E8DE900DE45BD08';
wwv_flow_imp.g_varchar2_table(398) := '710304BC88974004D90C5849ED4CE7BEF045D956F3DDB8EC12C25CEB346EE9F3F3F09CC5EA9846904B63D6C422638A0A2FFA5C3DA7F550C95C2A30BBFD89CC5FC706B3E92EE6A6E7D9FEE6BDF47CA2EF5D2C53684F6E665B575E4E777DE4D792D2BA50D1';
wwv_flow_imp.g_varchar2_table(399) := 'E3C42C9EF6EDEE7D77F3DADB8D4B2E21AAA98BA1B703E4F8302B6240E4C2F5E920F7CE66F198AF1CCFF96F5E2AEDF42E598E70D73CE73F39E79FE7968DC3F974DBB1D18DE807DEBF96BE6BA3CBD2A3568B80EC38BF4D92582254310D0743C1209FBDB6C7';
wwv_flow_imp.g_varchar2_table(400) := '4A6B52BAFC75535631AA6CC150AE3E0D246200DDF6D9CF57560106AEBB5DFF35D2C1AA3ADD358DCA95B578198C7C6E2755CAB5E8FA66CBCECC74CDD73C903A1B9BB3093D729999AE9239F1879B39F1A6AC09A8AECFE37A44FBD66BCEBF3AFDA45D24DFBF';
wwv_flow_imp.g_varchar2_table(401) := 'D3D4F0BF5A0D28C27903AAE54BCC6CA05444802F7BCCA302BEF4BE749A1501BEF4CBA2C3AA7D1D4574FECB5FA1C39DDD4AC46066BAFCBABB98E7B1E5A49CE099C87C1F702271C6416AE9AB1914CBCD82F1042C5A0AB30620462465BE9A99D3EBC6C5A570';
wwv_flow_imp.g_varchar2_table(402) := '7D184F010B63A53529AD2DB9EE6466F4B16B88982AF928AD653AA0BE3501AE8848D608A5A117951DCEBD65F1FC9B34E79F352829B9FA5F692DFD46656C9C5B3C0980F54E2E42FC42EC60D89CDF88C13D0C70C95D369F998999CB162F5DCEFFCC95AE2214';
wwv_flow_imp.g_varchar2_table(403) := '2CA38183F33B845FE592785899E21365362FBB94EEFC9007D0E2BBD8842821610D35A0224DED8D2E55F9616631029AB826A05C2B9999D663CEBF5CFB8F4A9941C8FC3B4A72ED84FC7A34A0306F03D4C39E2872CCF9E4EB1D891705E4D34FCB31DE7607EC';
wwv_flow_imp.g_varchar2_table(404) := 'DD768ECE7FE9CB34C3692BA4122D03F47D9FF458DABEEA0A22198868FC89474302C687CE4D1A0128EF293A2BB0104847154FC35D6F3C1A497BE6F7C44F8AC1A23225B0D75FD6833A590F11A23F5AA31ECE679D38AEAABE8C2953FA971D17DE9A3EC5858B';
wwv_flow_imp.g_varchar2_table(405) := 'B90AB01223A086350158018FBEE2AA1FD722E0A273E5C3F36FE29C7F26771A51F27F136856CE78F4AD7676E8DC3233312B524A0B222BFD683024C04AB0E00C967E08D45D2DB32616D45D4FC65F653B61DB2C0D6070FACC7BDE5FDD6258B9F0B0B2FA21DF';
wwv_flow_imp.g_varchar2_table(406) := 'FDADD4EE55EBA9354B737549C375319EE48BAA80C99CC6A6A48FF1DA1719CE23383357BC26006635308F54FE65592923FF7ACDF9FBB77F3A65910E3E9D43F9D4C59DFBF2322EA664ED0680D61169E3D1F835C8776ECE8F5B055472F11250012B1F16C6A2';
wwv_flow_imp.g_varchar2_table(407) := 'C6FB0092843EFDDE7FA45822223EE57C689899AEBECF3DE86E8F7C28A928B5BE871201007CCA83468B6C00F617096626665E649527EA529A49E9DA2F174A3F4C8A3529959E239AF21949A4039892353509FD08989A29895A6B0264B7D4379139E45B6EFC';
wwv_flow_imp.g_varchar2_table(408) := '5CA9B23E8594D6321D50DD9A00AC134912B7C76BD6E44814D347C66934F0FC9B38E79F973591F106C8A7BB8ED16700175D3EBFD58AA83543AFD97B3D46323E01F9F2658F63194F11ED285A1E5120A068B9A2F44AC618C0566E54F0BAB7F1C9D255B653EF';
wwv_flow_imp.g_varchar2_table(409) := '76790377BDEDAA89BBA84BAE473AFF852FD367DFF7412A7361DA24C380F6806F7D225DFBD00791DC51297C82062AD18074D8CFBDEF0312B1AACFBB6266310256674D00F3E2E6FC3146EC5FD831EFF6FFE2C7D7EBDDFE95F4CFC064AA066A3700D2350091';
wwv_flow_imp.g_varchar2_table(410) := 'DC6B94C154298E2526E24900C7922AD9C5B0041465A69526A068B9B2F4CC6CF4A4A45E78811FBFE16D140FAB0DADB6BA1DF3B6363CB6C5520FE6437DE5D51239007CE94F0B1DA2284055ED554A49044059D915F504704D0136862CF501B67C573A6E405F';
wwv_flow_imp.g_varchar2_table(411) := 'FEC48D74D3073F5AA9C19AAF97652E769EF7048C8C47893522B3470366452CD0268219E5C5701EC3F3BF7281CFF95FF8D257E835FFF337E88B1FFD848C17689F53C41304B1E805389138E38059130B7449FD68CF48E27030A8F47D00B80680194D9B9A85';
wwv_flow_imp.g_varchar2_table(412) := '6B03989A596122A20CE660570A0000100049444154808D6542E99F2DBF68BA2A5AA01C3D13C98D8DC2A78006584E35D1E73FF8613AF7852F1528E7478AF5005FF703DF455FF3DDFF8CA24E87C2F9A1F09953033002DEFFCAD7D2C1F90B73729A5D9C99CD';
wwv_flow_imp.g_varchar2_table(413) := '9C7AB3DE13705166DC28AEBAC775B4A8397FDCFC5FFBCBBF45377DF863B51A5F175BB8C8BD50579D1A5890014032DFD3A6565B6E348ED68C860382952EB1440765B16CF0048A9522525A1B142D372F7D2473649178DB7883D7E73FF8112A63B5CE928199';
wwv_flow_imp.g_varchar2_table(414) := '099180077ECB13E9F13FF12CBAE29A3B938A3411D3D48F92F968606AE602135D9E436CE6F88A7B40AE26B0280670D15595AFA5DF01367ED91C69E219311BC97C3760E307AF238A5AB66CBF749906F8CA276FA40FBEEA6F697070E857A62495D225D704C0';
wwv_flow_imp.g_varchar2_table(415) := 'F1071CF562AA0C70904D64C3F3BF6A41EFF687C175EEA62FD26B7EE937E9CB9FFC273346C432470C4C08567142AB8DF1BC5D9AAB96B10D7031482300D54540710D00AE7AF3F94AAB85DC07948E66D683686D3CF2E8C0F906588E95257DB9C9681FB05C29';
wwv_flow_imp.g_varchar2_table(416) := '9A51BB0CAAEF7FD56B65403DA8451E568AAE79C803E99B7FE65FD243BFE7DBA9B7BD4D486366927B1E85CF69D000CEB5A082A6E2A6F4D137BE85DEFD8A57D2F0B0DE17B93073A3D604302F76CE7FF7E65BE8B5BFFC7CFAF2A76E949BFF7A0E9869976C42';
wwv_flow_imp.g_varchar2_table(417) := 'DBAAB93ED2F6B8FEBBEAAA4E1F0B3300A2568B0057D3D3FC44A200235AE6AF42316B620326664EC55AE07F2D9620802A3105F0DEFFFB6AB9C8DDAB96415F061B67CFD003FFD993E829BFF2DFE851CFFA7EBAFA5E77A7ED2B2EA7482C7DF053622800D86F';
wwv_flow_imp.g_varchar2_table(418) := '327C3DE2A26D80370E142D57961EDE27E02ADFEF1F12E0A21B0DE57A1A4C7A52CCE8E78A58E6D661F8B9F8F8E4C752D727DEFC4E7AFF5FBEB67E2340E42EB22600060AE06A87D61169818B2ECB67AD689173FEE7655AF0D5BFF0EBF41573F3BF382EA06D';
wwv_flow_imp.g_varchar2_table(419) := '4026575D5B448B8079F96B893A01363EB1F98D989119FB128976D9E87CD3C103F0A54FE99870EDEB02FD814A7ED27A94949E7ECF49237F38DFD51801A8492A6BE2B79A0636B16545654287FD887855B77DFE0B323352935EA4BF3133B5377A74EFC77EBD';
wwv_flow_imp.g_varchar2_table(420) := '44047E929EFCEF7F4AF02FC520F8017AF0B73F99EEFDB847D2DD1EF1D0A5E29E8F7984F9C539C8380DF778D4C309B86B857282177802D3EA44DA3D1F73BDC8F588B97473ED431F4C57DCED5A6AF57AA4B42EDA4D66D04B9F9148929540CE3B917400AAEE';
wwv_flow_imp.g_varchar2_table(421) := '8330F4875EF377F4CE3FFCD3DAA25799B4CC5C704D80E8232B5CC11686D3550B9CF3DFF9CA2DF4BA5F7D017DE59F3E4D8BB8D957A0A2922CB262C972DB59EDA591356AC6D6A3C28ABAB09A2145A559B09E00664D2C70311F0D871201A8EED7A092A2EFBC';
wwv_flow_imp.g_varchar2_table(422) := '9739782D70C959577E948B98ECDE722B7DE8756FA491CCF1D55567C617035AABDBA54BEE7035DDFE3EF7A4FB3CFED1F4103100AE7FFAF7D1D77DFF772E0D0F95BABFFE194F23E051CFFE019A86EB7FE8FB08A85A4EF004A6D58934C80440C63275A31C16';
wwv_flow_imp.g_varchar2_table(423) := 'B53DE1A77F94BEEDBFFD8C69C31DEE776F6A757BC42A22DB67201180C1A06F06C8693703A4A5888566726D44ABDDA659CF63DBEA75A68BC111CB35FC891BDE219180D7D160BF9E29AC4C0EA5B54C07B8DF13109BD5EE937AC8F8645BAD1569E1991DDBB6';
wwv_flow_imp.g_varchar2_table(424) := 'F0FCAF5AE09C3F16FCDDF0FC978BE7FF597106266F1469FB26233D36F9B3748C2B4076ECDA2A44043DF4E3E263D69E7878D643E9E3E8EB2E7EAEFC11D698095C74593EA213DAC837A9EB8CA6CA2DC65E96A8163313B3FDF66CAEE90A2222F61AAA6C55E0';
wwv_flow_imp.g_varchar2_table(425) := '35B7061239D91F78CD1BE8C677BD87123166E666588001B3744673C12BC280B72C28AD288596AD0D198DAA4CD6B4CE8CAF76D65D463F691DC23BD2260A73D7877F353DFA393F488FF9D1A7D3E6A5678998C9FA919B2D015682E565C4321DF081BF7E3DBD';
wwv_flow_imp.g_varchar2_table(426) := 'EDF7FE8F4402EA5D18C8CC620454F19E00E81A98AD37E6C5CEF9EFDD7A8E6E78C1EFD22D377E96163D069CD484E846BE27D3AA3F3ABD1CA15CA07E0DA8FAAB385943AB2D1E87E064EAE4D1502C756032A74C4A62DEA817CB7C926F695FCBD4975F59BA28';
wwv_flow_imp.g_varchar2_table(427) := '6A1380F278373642AA17BEF2151C06ACB9065ABD2EDDF5615F4DDFF0BC679AF518D39A9B24F0EC633AD8DFA383BDC95F8F84E7341C2092363D66988F344DAB639E341D45C4F2F7E1BFBD81DEFD27FFB77E2340BCA76C4DC0E6659792544DC73F58010E1C';
wwv_flow_imp.g_varchar2_table(428) := '4F3BBECFAC8805F0FE53CFEF78EEC57D1879572EF039FF9D2FDF4C7FF71B2FA15B3FFD394AC4D8D35A91D6FAA240E33DB40D181F7A6F124AFF5C05948A48294DCCD013BBC89DF95A229D808BB0DFEF13E0A2B3E58FE47E02D8F26DE95ABC7FC0965F57BA';
wwv_flow_imp.g_varchar2_table(429) := 'D28A94D616F689DCCF62030B8177B2F2A60C84CBD7805CF8B7DDF445FAFBFFF3E7144B7875F9020509EAD60033D3D5F7BE073DFA477E90362E4124A0EE1AEBE02F0396F4D7F7BEF26FE86D2FFFA3DAA70398D9AC09F8FA1FFE7EDA142380B9CC8DCA5E86';
wwv_flow_imp.g_varchar2_table(430) := '251A76D582E7FCDFFCC2DFA35B3FF37973F3AFE30C15E369D74D313EC7A9F33C8FE785FD490D4C37E827E966A72CDC008035A5AD96CD456147324F03C0DA052EE62C66CF4400A2D6622A9B514BABDDA156FBE2F3B6894C057CFC86B7D3BBFFECAF68D887';
wwv_flow_imp.g_varchar2_table(431) := '6737A370C85A0B0DE08673FB7BDF93AEFDDAAF2696BF698D1A0EFB04ECEFEFD2BE440370CD0088A201F932CC9A58A017E2E13069DD2226452612F0677F49FBE7CECB1C763583184DF928ADE9B26BEF4C3002B6AEBC9C98D950C5322501988329FF94D6E2';
wwv_flow_imp.g_varchar2_table(432) := '79A9293969123CFFAB9630E79F86FDB1FA3B95036328901E5DFC8FF101B898E2B7C762D4002EEAA885A7B922179977BE46FF53DA9C1F66BBDED3D5EF234AD786D5BFC6216B8012BD00D9F1A2B6462FA21B5B7D23B90F54F1ABB9768DDB6AAE243DBD182B';
wwv_flow_imp.g_varchar2_table(433) := '61550B13916F3C60D4C2BE305391E758997834A2F7FDE56BE8B3EFFD474A16BC1EE098186177811AD091A687FC3FDF4C51A7E3516B7D37568FCA679260007FCF5FFC35BDF1F92FA5830B3BB51A01CC6C8C80473CF3FB68E3B24B66CAE593C9BCA439FF71';
wwv_flow_imp.g_varchar2_table(434) := 'D8DF47C695A411BD12704CF8B0BB180D2CDC00C09C200633A2933735B27C306000966C6732BC20C0493826502A22058B542962C13879699BCCE2661679049920877B7BF40619446FFAF047080641961EB66BAA016609675F42D77D9D440166F4CB61FF50';
wwv_flow_imp.g_varchar2_table(435) := '224387B473FE5683EC98729F76BB4D402EB9B643CCF302A800FDF5C67F782FDDF0E2DF5F9811F0F53FF203B47DD5E51427238A67AC0532913F1D41CC1380E77FE5B2E6FCC5DB3B218C1C68894E02B27BE21B8F646E587022D1E340CBD802B8485D9EA9AB';
wwv_flow_imp.g_varchar2_table(436) := 'BC2D5F471165FDC34683F4C3C37D02B05F04A3C180802265408B7B0180FD45027747C05667227D02B0E5FBA62B5FC295A6330E91F9E7D70C196CFD081745255D212F539298C1F3F5BFF622BAE9C31F9548C0C5F0E0A2A40AF52C5803D207EEF480FB12B3';
wwv_flow_imp.g_varchar2_table(437) := 'F48705575D757518BC3EF1D677D21B7EEBC5B48FDF0E90FE5C751D193F668904DCE58EF488673D8DB6AEB8ACB0FEE0085CB57273FE05C6BB4C518DD9FA08B2EEEDF3D1C1FC340B370098D95C802C1627B376B66020739B8093D042006F23166BC9923D91';
wwv_flow_imp.g_varchar2_table(438) := 'DC92106BABDD9E485F7642BBD5168F2D17FE954173E72B37D3EB7EF905F4F90F8548C0B2CFD122EA3F73E515D4DDD82C5D953211AE885AED0EB53ADDD27C8A166C452D028E97831170E3BBDE4B6F79D91FD56F0448D4E4B26BEE444FFCC9E7D099ABAF22';
wwv_flow_imp.g_varchar2_table(439) := '663E2ECAD1BE12EF1FC812582BBAAA0173FE993CD956497B80EC38DBA673E5C59D01AC1301323EB6ADF1D4C55BB7E5974D6F4B7F045CE547666DD89046C391C07F2DC048A64D47237FFA4C8EBADA9BF1B76EE5FC126021405B004BB677F2C20D805432B9';
wwv_flow_imp.g_varchar2_table(440) := 'F82C17609A1FFE17D1C0DE6DE7E8F5BFFADBF4F1B7BC3D8D0404E3B888FA568A96655000E6121AD71E3017936A0A2762C47EFC86B7D11B9FFF1213D12239AE86F3241766A62BEF762D7DC3F39E4D9B1209102B6092E8580AB3D0DFFD3A7AF8D3BF977A67';
wwv_flow_imp.g_varchar2_table(441) := 'B68FE554BF0B3DDCFCA9CFA4CFF9AFFB9CBF437DEE6C0C70809B32A528429B96382DFF97640010E948936E4DCEB5E5158F799BD1B0B8E596F1492D46FFD5F2F05280AC7C53B6F0D60066452CC8CBB57BEB6DF4B7BFFE3BE611C1839D9D7C76385E130D0C';
wwv_flow_imp.g_varchar2_table(442) := '0E0E48AB8822F19800DF662929036C6C6ED1C6C62631B3816FF979E9786CB844519B80E3FC70F3BBF11FDE375E13B05BFBC24018014FFC971209B8DD95244AA0E31F56A21703B5B077FBA3FDB8F9BFF985BF4BB7E0E6EF11B1CCF4795CF63AF79935B181';
wwv_flow_imp.g_varchar2_table(443) := 'E847FA4ED575691D9116281511E0E2BFBFB747FB53DE7B912F072F7924DE7F327E5F463EDF769CB655DBB26B4FD74A1360ABA8EC5A8F3C3F954F68E4B1780589A091B2354528D10F42AAF8D1A0D7FEF2F3095181A0B3A69C9CEAE438F7B92F8E99F178EB';
wwv_flow_imp.g_varchar2_table(444) := 'B319D3D63070FBD4EE4383BE6BD604482460116B02AEB8EE1A7AFC8FFFF0D43501AC9409FB5FFF43DF4BDDAD4DA21AF5866B143FA1FCE6DFFE3DDAB9F9D6EA8C9F95757AA9E0C7A7A1A0010AB23E05E44B33006CAB6DF33A4F8CE59698F99EF48D66798A';
wwv_flow_imp.g_varchar2_table(445) := 'D9C783C18080D95464AC4E25D627CBC50FB8E8179DCFCC320EB15907306BAE6CD8EFD3E7DEFF21FA939FF959FAD4DBDF655EBA928871B06879437DD56B201E0CE9B3EF79BF44C913EAF536049BD4DBD8166C11A201C7D1E9F4A823D8D83C431B9BDBB4B9';
wwv_flow_imp.g_varchar2_table(446) := '95027D1BA85E3A3F8EED4ED7F4E169D430026E7CD7BBD33501E611C16954D5A461FEFCCABB5E3BB126A02591953B3FE8FEF4A81FFD41DABC0C6F12E46A2A9CC205D7253CFFB7BCE80F68F72BB75477F397BA12BCD9AFC2EB5E694580B0AEF5DBEE74A8DD';
wwv_flow_imp.g_varchar2_table(447) := '693BEB48D73A8C08EFBC006C0546E2FD8FCA3C15A13569818DEFB2D3B3F6CF2B879A97C162CA07EBAD889E3190EEC880F2BA5F7D21BDF6579E9FFE6A18C28A150E0845E409B4F36B00378B9B3EF451BAF9C6CF4CB95178DCA4C4809C5F8A8A381859A6CB';
wwv_flow_imp.g_varchar2_table(448) := '9CC4097DFCCD6FA7B7FCCE1F9099CAAAB1CF32F3893501308C6E7FBF7BD1C37EE0BB08BF8A59516BA7B2C1F9C4CD1F617F5CAB389E4A78CA12D3E64EEF1B69DEB4FFE1FE304D2B3E694B3300A2A845808F90A019F40F09C0BE0F704101713C9CF9DC6FC6';
wwv_flow_imp.g_varchar2_table(449) := 'AB259627901D37758B750000B32616CC927324D18F4FCBDCEA9FFECCCFD15B7FF7FFD0CD9FFE2CE1F70466950979CDD4C0A178C4EFFBF3578BF77F52BEA825D791A0D79368C031B4BB3D0296B68AF9A4984747993CE9B675947E7C271163F51312BD7AF3';
wwv_flow_imp.g_varchar2_table(450) := '8BFF800E77F6C4E0399E5BED3E736A047CE34FFD0BBAF7E31E458F78D653A9BBBD556D25396E18978E6EFE5586FD8FEA49289D2376FFEAE15111C78E6FC4D6C1C6998D084CABDD2696B10D7015C8DE7391BE017377827C7028F70DC144862341CB350538';
wwv_flow_imp.g_varchar2_table(451) := 'C8563E7B6906C0CA6B6EC90D60F6B39231D8C4F188DEFFAAD7D2AB7EFE57E835BFF41BF4A54F7C8AE2E1486E26C1725EF269F4AA1E8FB27EF87537D0B9CF7F516E86EB72CE66F7DF0446C05BFF9EDEF6D2FFBD90A703AEB8F6CEF4C8A73F855ADD0E91E7';
wwv_flow_imp.g_varchar2_table(452) := 'B545253EB81E6B99F32F214BF38A641249DF287D0ED6E5FAC87451EF76690600C26D06BE96DEB06FDE758E810170A965341C9A75032EBA2C1FD18856AB9D1D3676CBCC323E31753736A8B7B929FBCA60A6C0724DE026B2F3959BE99FDEF55EFAB3FFF8FF';
wwv_flow_imp.g_varchar2_table(453) := 'D25FFDFC2FD3C76E781BDDFAD9CF537FFF3403E654000010004944415480A0530C4E33F984CC856A00E7E3E0FC0EBDE74FFE8A3EF4EA3710CEE14205A8B1B24EA74B9D4ECF5A03E638E3D1803EF58E77D13B7EFF8FC50810EF4EFAB1B5C09C19188BEAF6';
wwv_flow_imp.g_varchar2_table(454) := 'F8703EE1F9D731E79F6F3EEA02F2E9B6E37894460D6CF98B4EEF4844B6D3ED7A579B4502F67677686FF7021D1EEC1BC49E11E0AC22E6743C5D95FBC16824F73941267FD1AD2A5A602DE9CD4D752D5B36D92899538DC538FAEC7BDF4FAFFFD517D22B7FEE';
wwv_flow_imp.g_varchar2_table(455) := '17E9AFFEEB2FD1DFBFE22FE80B1FF9B8F9B9D644BC2F0C1E7990946D2AF2B21E3FAE42E6E3FCF2FB55F0CF7864BC6389D0DCF4FE0F9B9F80FDC8EB6F58AB9BFF64A7B4A7401F9F7CEB3BE9ED2FFB3F74B80B23A0462BC02EC6DC3968076EFECD9DF35FBE';
wwv_flow_imp.g_varchar2_table(456) := '5EE75672650C5227AB32760D66B47403A0D56E53ABEDEF791F1CEE13E0D2A9AF65A4A316691D111BCB8F5D6C1B930F9981DEE6964402B68859130B8A0AB877EB79FAD2C73E451F7CD51BE835FFFD37E84F7EFAFF477FF3F3BF46EFF8DD3FA10FFDCD1BE9';
wwv_flow_imp.g_varchar2_table(457) := 'F3EFFB107D59F211B6BCE5D39F33CF2937697BF38D9F25E02B9FBA91A6E1E67FFAB45904595666F006A6F146DABCFCF3727DE9239FA08FBDE1ADF4B7BFFCDBF4C65F7F097DF99337D2FF9FBD6F7B92A547EECA94FA3E33E75BFC5FF2C40B0F3CF0C29B21';
wwv_flow_imp.g_varchar2_table(458) := '026C58B0176F788D71846D4C1888201C7680BD76D8E0059BC0ACF7C242ACC3B0DE0B0BE6FBBE7366FADE55E5FCA94A73666A5A2DD5ADBBAA5B7DCE6FAA25A552A92C952A33A5AA863150F5BCF69D5E8F4694632CC7B153DCDD6E4B5B59C3C5D30F7FFCCB';
wwv_flow_imp.g_varchar2_table(459) := 'FF4A8C806EF70438056950F0EAE6DFD29ABF31D2C5507789958A5708B8CA5FE767627FA682F6F60CBCE65F3D359E4CE5BE30356343CB1C1DCA21316F0ADCD34EEE1340683D4B379DCD692A9107662666B6D9FD3DC26E036A4A787103A0A6DC52AD41AFA5';
wwv_flow_imp.g_varchar2_table(460) := 'F6B5FD67AE33585FD411EF1E93CA4126DBBFFCF3BFA03F93E501849E7FFF677FD1DC8C7043FAEA4F7F99FA86DFF9A97F4ABFFD535F32518CDF90484619BFF5935FA4DFFABB5FAC2DF7EFFC832FD16FFFFD2F5199AF4DFFE64FFE23FACD06FCCBFAFCBD2F';
wwv_flow_imp.g_varchar2_table(461) := '7E85FECBAFFE1BFAB14463D2442664392FD736562BF74774809BE8FFFEA3FF465FFB855FA5F5870F72B31AC6F50FB9613CB7FE9C7F6525C60A51036F3570710360024B6F3C792B9923275FEBD9D17E076C1D5444FBFDE9725BF15CBB5B6D7B6D1FB5442F';
wwv_flow_imp.g_varchar2_table(462) := '80059EF37E7847D3F95D0E595FC51AEB48F4FB12B61CF4C0FDBB777427F546E33101463E4CB8A97805E261E02684770BECD71BDA3E2D7B87FD6A4387E546D68857B47D5CD1E6C3E32B3C7DF6293D7DF699C8FD24A82E3FDEB0B8FAFCF3573C5FB67130ED';
wwv_flow_imp.g_varchar2_table(463) := 'AF6BF13EA64FE81A86186E1CE65CD075FFC5189D4C66CE4E66E63D20A9ACEB3ED152D6777FF88DEF98E580F5E7EF7BBF213293EBE8FF8B31DDC59A3FF62C002EC5EDF77B9903F7AEE2C1E4E3E996D96C21DEB832E84AF0D97C4133993B6DE4A1AB7642F9';
wwv_flow_imp.g_varchar2_table(464) := '2AA508F0D1276942808FCE55AE5C05E7CC6786270A84B6EAB3FEA55C2EBE506EB74967F56D8F03D602C60FE0EA421C0E2ECDF4229F196310F08823D7346EAA3F1023C04402DE7FE8AD11003971F3EFEF9ABF47D73D2A6696B101742693F027A0B3067ACB';
wwv_flow_imp.g_varchar2_table(465) := 'F8E20600AC58603499D048BCD5504D6DD64B02769B3501B8E000BC2DF0B03F4888106B5AA9971DD697002F61CF099899989926A2430359CBC273E0B0A05FC294090DA20640CFBB152CDE582218E3892B92949927423036821916848984E18122F9E680B1';
wwv_flow_imp.g_varchar2_table(466) := '03BC296829E3DAD9E8622F807943A044AD5CFD4D8BDDDC6B890200FFE7BF7F97BEF6CF7E8DD63D3402300F3DDFFC5B5AF377E98559110BCAE5565F49D26C97B8E5AB651D1EB0E9731D716F00E68BBB62AFD3F1FE569547A911018BFB778448E858E644A0';
wwv_flow_imp.g_varchar2_table(467) := '2A9FAEE8592200808F7FD3F3AB7C0D9CAF9C1B35858B4EDC01C323FF6EBEC63F51038506240C507C8B87816BA08804FCF05BFF83105E5FC972405FAE79C811D7FCBB1C5FCDEE13AF256B93D76BCE4349F5C6009889C75A67AD67BB95F557C1EAE9032D1F';
wwv_flow_imp.g_varchar2_table(468) := '3F98A8C076B3F2EA1F5633A00B0FC45B2112F45A038866002E21F70759133DEC5CC5CE7C97858DB103743B7E9C625D5D411E019811B32216B83A789073082C1FDFCBF5FE9EBEF7F56FD27FFCCAAFD0EAB3CBEF09C0CDFFFF7DF77F19A364F997EDBEDBDF';
wwv_flow_imp.g_varchar2_table(469) := 'A50FBCBB0070956F562B9913D7AEE2E07CAC472BAD83E9DB26C4B50DE0DD27338906608C00A1ED306B6201F69C00F0FAEF1E1E48EB116941289F73D3694FE4056F7BC53B6F30F680AAF2A9AA15227DD440D440D4402F34504402BEFFF56F1176D9AF3EBF';
wwv_flow_imp.g_varchar2_table(470) := 'DC9E802CCDE8471291F80F3FF74BF42437FF3A9371673A153DD9E868AD366469917AE42C334318A0566F4C25E666F50D93BEFC69707E7B6300303331B3D989399B2F2AAB362B760BDBA38FC154220E808F2E960F430378820160F11E81B2D4C652DEEF29';
wwv_flow_imp.g_varchar2_table(471) := '938B05289797D3D82F0064C5B82A97C36B00CAF96DA66F8917737EFDCF17F784F55E5FDFED79C1B3DE88F8FDF97FFD13FADD9FFD0A2D2F1009C8644CFDF87F7ED7BCB678FDFE51EEB5E75B6E9A4DE7349BCE9CEA4AEDDE89F58AF0BE7CC80A382B940A46';
wwv_flow_imp.g_varchar2_table(472) := 'A3098DF498D85C575C2A3D7F12D71C802797EE1E3E29EE177734153D0073F3EB980F94FF0AE63B7AF8E4270CEEDF7D4200F64501E797BC5E8BA3B1E85FE0AA9D15F313E6AAC3BE7A84B33706C0EB0ECA409309E1755E9B29E1DF26BBC82B6A206AA0450D';
wwv_flow_imp.g_varchar2_table(473) := 'C8F559F1FACFD294BEFFA7DFA4AFFEE32FD3D3A79F1943AF45819CAC32B9F9FFF09BDFA1AF7DE55FD0B96FFE1F85AAA2AFB7C68974E123ABA3DF84FFD1FC98D91F0DBC3DAF21B2F5CE008017074C670BF33C7B4827AAD04CC4529C88C53C9E4C683C9956';
wwv_flow_imp.g_varchar2_table(474) := 'A91A6907A00178074059D4ACB094F7622503E5F2727A2F6BCD4039DFA63146019B6EFF789B1C75B12707FB8166F33B62E379864D539984E17FF8ADEFD0EF7FF99FD3528C00B1023A5522DAC30B9BFEE8977E9D569F5F660F02768A037897C244E6365787';
wwv_flow_imp.g_varchar2_table(475) := 'F3F7A76C69F5F444785F7E723898276376BB2DE5D7C3F11B08E6C8F1C4F5748DABB5EEF3999998D9CCE16399C72712D105704D02761C752F49B72D8CC5FBC7EF12F85AD96E36B4DDAC65C867063E7A5B1E766559EAAB3AF255F52676266A206A00D1F78C';
wwv_flow_imp.g_varchar2_table(476) := 'FEE24FBE41BFFB4F7E9EBA5C0EC0CDFF47DFFEF81482CCBAC351BFDFE51F4E5F6E4052B17348AC1DEAE2D35B036002AB4E80751DA069E7F18E01602A9622D0945FACDF4F0D8CC663025CD2E19D113BB19633990481325D26A164006FE483D7542EE7C223';
wwv_flow_imp.g_varchar2_table(477) := '451B589F2B97B795BE753EF0EA00FB5B17DAB31BFAA5BE705E7FF8EDEFD0EF7DE9173A3102C0FF526BFE2FFBF9F23BE63440A911012FCB5E7E4F8B3D01ABE50789047CA0ED7A69F09206DFADBEF3713E4656C40534C0CCC4AC08730DEE5FE4F864458473';
wwv_flow_imp.g_varchar2_table(478) := 'B35A129EFC7090918DF8C8F467487A6B0018E95EFDE157A96A892675ABB514A987A081D361B2CC5C1DC743A2A677725112C53145E7FC189D4B83F6285F4FFDC729FCFE9F7E8B7EF767BE42CB4F3F1707FDC4F93CC5A85486B171F935FF92502F9381FA79';
wwv_flow_imp.g_varchar2_table(479) := '59257E1F8206AACC37E1F35BEF0D00ACEB4C66339ACDF37735BB4E158B95043C5BAED8BD2A98C93AE24CEACE0DEE5CD563FE9568C058CAE22D622C00E56E6585A58CB7C9612D34933B0560E9AC856CD3E5239EB9D6B24ECDCCC4CCE5E296D2918DD500F6';
wwv_flow_imp.g_varchar2_table(480) := '73008BC53D2DEE1EE8FEE113C117C8EEF64674F0256CFE02BBC1E7F7F4FE7B3F22FC8AE0BA8535FA2CCDCC8F345D72CDDFEAC5755CDCDD13A2268802002E3A573E17F3E8643A2344145C7431FFBC1A087D4F0EDE9101AC574F12E17932862FE6370B4440';
wwv_flow_imp.g_varchar2_table(481) := 'F7DBCDB3F0BD37007249DB9868DBE0914B13FFF65C03E6C61C70BEE5E6DFF39E44F1DE6840CEAB39BF6F0A8E67C839C60F087DED17B04BBFFE7B0270F31FCA9A3F73451DBDD11C1333BFC98D1943D3803FEA351003809E777BDE3F7CC17800F639CFFB77';
wwv_flow_imp.g_varchar2_table(482) := '7F8D7248FEBB2F182F6171F760AC6058C25847048676EAA2BCF534C0CC66F21A4F4E3FE591DAB5D0A7475A090EFB3D0178AE1C28B7CE85676476A7CFAABFA7A2CCEF543A96B935C09C9F5FBB363D99CDE9256C3EA2340038C1FBF9F177BE4BFFE917FF25';
wwv_flow_imp.g_varchar2_table(483) := 'AD6BFC7680A97FA1E7FC217F1530E7FA594824006FBB43140070F1B0E3DA3CEF3F9A14F3E61D693D222D70D58BF9E7D500737E5E674544DBD77A72D81360DF98F9F4E13302B222026AEB2BFB251EA3066E5903B26A26DDF759CC2C34F1FF103590492400';
wwv_flow_imp.g_varchar2_table(484) := '6FEAFBC3AFFCAA796D30D221FDC8D2944C04E1A2CFF98748EAA0911B475E726AEC9E2ACB6BC7BF7DD200CE17D05CA6C119005CFC4A12AC7B809989999B6B2272B82A0DD8A748B8F0DC5D9D4B8B48C046D6CCB06EE6A283E53D37EF2067626617590BF991';
wwv_flow_imp.g_varchar2_table(485) := '45571AC04D1F9180AFFEF4CFD10FBEFE6DDA3E2D29931B3CF25FB689749A24B4FAF473FACE6FFF01FDE1CFFFF2C59EF37F295795EFCC6CC6A989044834603A5FD054BC47BB5F62BEB8A7F9E241A2A79F18205A0AC0EB07AAB41569CFA7813CC235A29144';
wwv_flow_imp.g_varchar2_table(486) := '384793A9B7E1ACE4F1972B0CCE00287720A6A306BAD7403E9976DF4E6CA16B0D64120978FFA3FF4B7867FF577FFACBF4CDDFF81DC2AFF71D363B630C6C1F97E69DFE7FFCCBFF9ABEFA0FBF4C7FF2EBBF41BBD51A2F18E85AB4EEF88B31F096391759F658';
wwv_flow_imp.g_varchar2_table(487) := '24E361001A68EF9C45036000A73B8A585D033652849DCC40550E5C440EE025CDC55B42B409A8CAA72A7DA43F8F0692FD813EFDDE0FE81BFFF6DFD1BFFF7B3F43BFF637FE36FDCA5FFF5BF4EB7FF3EFD0EF7DF1E7E9CFFEE03F130C054408CE235137AD30';
wwv_flow_imp.g_varchar2_table(488) := '333133D98898DD2F917B92E36E1A8D5C3BD7C05CA23900A20040DD0655DD8AB15ED4C0A0342093607579B97A955863381A9068002202B8C9BF4646C8973FC3E94B94F4C635506FAE8A06C08D0F9B6BEFFE58D6C980F93C5FF3D4A331015C78F8B6FFC803';
wwv_flow_imp.g_varchar2_table(489) := 'EC1AE9E2EE81EEEE1FE8BC9E9295261EA306A206A206FC1A4014603E5F10A294F385CC5732DF212280B90CB0F3993D82662673A1E51C0D00AB89788C1A78A101E67A16F50B16F16BD440D440D4C01934506DAECAA7B6BC4E3400CE707A621397D780F5E4';
wwv_flow_imp.g_varchar2_table(490) := 'E1D903F7EFF2F746D8DF0B471E60D748ED1E82734A1EDB8A1A881A881AA8A3013BBFCD8BBD0198CB003B9FD923E81019C88D00A26800D4D176AC1335103510351035103530700D440360E027308A7F2D1A88FD881A881A881A38AF06A201705E7DC7D6A2';
wwv_flow_imp.g_varchar2_table(491) := '06A206A206A206A2067AA1816800F4E23444216E5D03B1FF510351035103E7D6403400CEADF1D85ED440D440D440D440D4400F34100D808627012F0C0192C3815EC2BE58A421FB58FD2634D05E273116819763F1E5F7F65A8A9C6E4903763E7B3996F0FD';
wwv_flow_imp.g_varchar2_table(492) := '9674708D7D8D06C0359ED5D8A7A881A881A881A881A8018F06A201E05010BC2860B7DB12B05E3E11B07CFC40C0E3FB4F09C06F2C03ABE5077A89A7C7CF09000DB05A3E4AF9E37394C0D16CCCBE410D34E9F26EB326E0E9C37BCAF1991C3F93B1F67A3CAE';
wwv_flow_imp.g_varchar2_table(493) := '8AF189B1F812AB625CEE659C034D648975AF4F03EBF59200CC65C0AA1847F668C7D2AA184787FD9E80EBD3C4EB1E2589447C05B8371814D721AE45C0464C5ED7EA5F2A1A0027CF4976B2B4596197BC9B49166B470D440D440D34D3C0F5CE6F700C7DBA09';
wwv_flow_imp.g_varchar2_table(494) := 'A1F1F138477934004A5ADE8A2507C0DA8547B5150B18381C7688F05EED000010004944415404A4E9818052356F3239ECC5FBDF179ED9A34413C4B296A84286DF2317781944822BD540BD6EADD72BE3996DB76B02B22C21A02A373B2E3732CE81A544B856';
wwv_flow_imp.g_varchar2_table(495) := '4F8F14C765554D5E173DBC58E0209121C0D73B3B8ED62B99DB56122D2DC6A7AFDE50CAADC7FFF80111B6CF09D7C8EAE903E1DE60505C87B81681E5D37B7A7A7C6FAE515CAB7DBD9EA201E01A81192C58C045D024BF2BBE4D648A7587A581EEC6D050BC97';
wwv_flow_imp.g_varchar2_table(496) := '619DAF5B92B6BBB179712D3EDF1742FA6869ECF1E2D2BF11201A00854AB0CE05ECC492038A6CE741A9110178AF32C0AC8905CE0AA502441380A558914BF1B8B0A31628915D5D12EB8300740DD8B5437B44F405C07A34809B1170758A283A147A800E00AB';
wwv_flow_imp.g_varchar2_table(497) := '27786580AF3E7E190C98CEEF08C0778059110BCAF5D322C2B534E3F20359CFA74C17D3D7A9814CA291C076BB3191A5BABDC4D8049612515ACAFC86B10BD4E577E97AEBD552A2B64F95C5800E80A7624F18E63600BA002A336CB9826A99DF40D955B5D0F8';
wwv_flow_imp.g_varchar2_table(498) := '483F6D1E8EC011126756467D180C4EF15A2FA8A2EF2AB4AD0B7ABD0CEDAF815C6F0F63CF6A6A209F8B5ABCEEC46BCE79D614E8D2D5447E99A05B95A22FFAB8790300DEE8617FA0C36E27D87A4FF27C716F7E7BF9EEFE81EE1EDE117E7109B87FF78EEEDF';
wwv_flow_imp.g_varchar2_table(499) := '7D420F9FE4BF3237138F0B809705B81867592A632B25AC9DC1BB83D70BB8E887969FC9C503ACC40B588A37807EAE658D10563160D70EED11D11700EBD100EA2CC51BC57A24005EC0D0F4705CDEF0DCBD786480D593AFE66CBEA0998C41FBEB6093C99400';
wwv_flow_imp.g_varchar2_table(500) := '9BBEBB7F4700A25840995F568CCBCD6A459BF55AC6E8AD19A9658DDC461A51B9CD6615DC59CC6D398E4740D322A28427A8564F4F838B289908589A14E33F0DD68B8B10731B90CF878F94DF7FF62EF2CEF36FDE00F8A8E1508BB7F0EE9D1E1413337F645B';
wwv_flow_imp.g_varchar2_table(501) := 'E95BA80C9598F680B8E1CD438C881E74626022048CC1D0716AF47FAD637360A775D0E20E790C75217B173CAB0D909B3700B01E03F8D486755383F198F09BCA3EFAB1785C00BC2C005E16E0AB07AF17401400F0D1F7B53C939B06004B1796BFF504AACA9B';
wwv_flow_imp.g_varchar2_table(502) := '159E2876D60239BFC7C17912C7FA1D92673C9017CF1BFBEA4CA7739A0A30F600173D331B437571FF2051AC7BF9AE0CCAF4F6BCE11C42F7E5F26B4FE31A04109D3B0544A7007BBE86A617EC3FCAB12744997CF233E7E3E5EEE1130210FD04CC1C29735FB9';
wwv_flow_imp.g_varchar2_table(503) := 'BE1D478804AC974B1A8A9ED22421A0DC9FA6693CB103E411D147C218039AF2AD5A5F55AD10E9EB6980992B56BCBC755851E0B3926762609CB5C10B36D6795F3136810BF6B19F4D37B8066F627C569DD3EC596E1811B46CAEEAD860AC35D0C3CD1A0059B1';
wwv_flow_imp.g_varchar2_table(504) := 'DB352DD6A87C3A8457359B2D7C646FCA592902E06961DFC0683421E00D612963BBD910221343B1944BE2CBBAF18A36ABA5796702745C2EAF9B062F00BC8D2751FC06435D7E97AB77BA65DCF401ACC16FCD1A7CBE57C455CB7A5E93D99C00175D399F9989';
wwv_flow_imp.g_varchar2_table(505) := '9909631B7B06CAE5360D9D035823C673CD36FFDA8EF67A5B3EBE27BC076453BC1F015EF129203A05AC9E3E9867C49F1E3F1060F9F55D4F5577FD63ACCC177766EC30F373F7B0C70463C98EC7E782E24B5644F49EAF5F896E41474571EF0E07910F682A18';
wwv_flow_imp.g_varchar2_table(506) := 'F3F13D1296EF66BD228C354401009BDFF55175DDC055F097012EFF9B77A51526CDC5380B87B3784097B19ACFA2BF5E3772FD7ACF1A8DDF423F8D789C7B0014320735CBC4CC4E4A6677D9EB4A55DA7C5D33A6DAD1C01B03202B3C63AC679D82DDBD68E9DB';
wwv_flow_imp.g_varchar2_table(507) := '11E77C5CF6873D01BE168D253B9EC8805782D081EDE63A13AB79365F08AFD316615658CAF072D7AB55B10BB5FF174CBE8E78A083E8F770D8B915512A317A96B5C3F9E281002ED6184B64CF49AB9F957937F9A3F9BD06BC93FB99A0E75F5CE26572D30056';
wwv_flow_imp.g_varchar2_table(508) := 'CB27E349A69E08D5B3DE8A1DFF2EBEBE7CEC6B01F0AE00C0458F2737007829808B6E68F9F04281B5E81DC88AEBAF6E3FB0BE0BD888007405D4E5D755BDAC98EFF3EBD6BF1B1DEF3CD1A31159B8E442240040B41328D359FD42D76B891466C5B82FD35D2A';
wwv_flow_imp.g_varchar2_table(509) := '6DE549F67B02EACAA1D48880BB8707BA7B7867BE23EDE28728009EC2C058045C746DE5AB638CD0F963F9AFF3ECCDA87C7C4D15534734201632730563A26717C7911EBDCACAC78F1D17AF8A1C8923BAA8A21F425B8083FDC0B28DFEE49C878B7D447FE195';
wwv_flow_imp.g_varchar2_table(510) := '1D943E9ED7A36F87025ACC86AE801659B6C8CA8C37730D8532F58D8D503E059D8CF55C86227D6D073397153A33DF3D1D3CA33E9E0D00581BC0B2F85527AC679DC27AF5649E5DC73AD7D3D37B5A89E50C588BD2D3C58B17EFB65BDAC93ABB4F10AD47A405';
wwv_flow_imp.g_varchar2_table(511) := '3EBAD072662666264401B086E6AB072F02305ED776E323BF7839D6B2B077215490C9744E93E98CB06E683C86E2298BBBE23975780F808FDF56D6D0B6B25E3B8C35EAB7BDB1D7CDD2AC217FF0EE9D60CE2348D0DB4CD6FDDF72AC97339128CC6432A191C1';
wwv_flow_imp.g_varchar2_table(512) := 'D4C964E87B546CC770E301B0D762BD5C4AA4EDF45E0B5BCF1EE1CD01885A2DEEDE89673C36B0E5F6D8577D210A5A658D7B3299D144C688ED97EF88796E7A627C6645A4A56FF3DB61BF23C0CAE7EBA7AB7C329D8ABE1041CEE7FDC5DD3DCD0523D121E0AA';
wwv_flow_imp.g_varchar2_table(513) := '67F748641D1B03CF06C0B320D2E0F3F7A02F62D93ED791EF41752E4D24723ECB7C695962FBD00033E3F01AC7F25E533852727E1D25BDCFEEC5B83C722E7AAFB806028ACE31D136E040CC37A6B30ACA62866E800A95AE9894395417DDCF630A5E3F00EB77';
wwv_flow_imp.g_varchar2_table(514) := '2D5E7C56586455F56F77C8C283593E3D52BEA674A8CAA6737AF4354992C2D24FBCED69A509F0125624B06B687A3426C057DD4663ACA7E8A33F7739D63781D4B3666DE59AC99A3500EF00B0F9F6C8CC665285B50C605D1AB0E5AE233C09208F042C5D6417';
wwv_flow_imp.g_varchar2_table(515) := 'CD3FD6F846221840E8F537BF5B8827716774C4CCC75836CA433406C0D804CACCAC9CF09C37AB75B978306913C994C811A26C40A8E0CC79046671FF40802ED6C5E77853A88C6D66452CB0FCFAAAAFBD4442012BA7EF68FBE9A3B3E5AC440F8291CC73A722';
wwv_flow_imp.g_varchar2_table(516) := '79D8BF03642D1863B6ED2647444580263C5077349E1080EF0033133313AE2D003A0150F61259711F36E373D5DD3CA6D068264AA74A6B40A8750A3D7FCEB3F5FE9ED2452C7BAB017E9B159A23174F28E970E82A5AFA46070D74D8BA627A7EBDB7DE5F0F43';
wwv_flow_imp.g_varchar2_table(517) := '9C1FC049768BFAEAD378759E989E1674375E14D66B77B2B69C151647530D583E1BB1AAD762B964C52ED3A67CDBAA8F1D9D884EB4C5AF291F78BF58030FE5032F71B3E98FC7958931056CC593C03AA7AF1F58F71AC9FAF27832A1B1AC83F9E86DF9446881';
wwv_flow_imp.g_varchar2_table(518) := 'C5DD8378BE0F62452B035B5E3E220A00202A0194CB2F977EDD32C6627248829F9A18891EE05168AD49EBD16B661DA4F0FE0BACFBBA58A726E223F2CB9A699FF55C963F29DE1F612397E5725F7A3C99C8F8FDB8B66BE99959C62593F194C7632A7FFAA2AF';
wwv_flow_imp.g_varchar2_table(519) := '24391090CB131EA965CEFB57EE972F3D9E405FEE3D255971FFC1BA3BE0E3D77579D6F0BEA5D48800E6D3FAC25361D3134F85E5E3F3407BB9BE102169BBDFAA6D86AFF955F46C5E57BE9914334B5F013984FC979B6E08D959692ACB54A1BFA58E30A32E50';
wwv_flow_imp.g_varchar2_table(520) := '2A1874B2EAB572BEFE33A32DC0A5E0AAB2BBF8DC4A7ED4D7AD9CE9907E32E3DA025CD4DD8D17955B18FEE73FAD685AD672009B761DAD45872703568804C80D2213B8E8CF958F751D20B83D9C1720B8423542787100A20093E9DC5B19CFD61F0E7BB21E8C';
wwv_flow_imp.g_varchar2_table(521) := 'B742C704B04C01AC9F02AEE6600D0358F7025C74BE7CE80AC01314586FF5D12312B5D9AC08DE0EE0A3EFBABCCC7FB7DF1250CE2FA79915B120DFF5BF28177796D6666D1BEBDD685F3BDB41F4077012F4AC00514FA0AE58F99AF6D8597D3C128F57E022D8';
wwv_flow_imp.g_varchar2_table(522) := '49C40C7095779D0F6F12E8BA1DCB1FEF98006CDA75844E76DBF0F787B8F85C3ADFECFE9FBA231E563E662666A6E96C2A98D9EC3747FB4E1EDC43813704353354CD7AD5AAE1C60F54AB15A99D1AE86E4DC8D9E4C982EE2CD493CD9A42367F4FFE91B1D7E6';
wwv_flow_imp.g_varchar2_table(523) := '4573B2ADAB2C141DCB2475955DABD529D147AD7AB1529806309F0061D491AABE06820D00786FC0E2EE9EE079C15B057C4DA7668DF040B03677DBCB3FC78E5F76027C72DB72789B804D77759C4C6704B0787980AF1DEC05C01E0B1F5DD7E57897C26EB3F5';
wwv_flow_imp.g_varchar2_table(524) := '3683BD0E3359EBF2120612E49EE988C01320CF07630FFB5D3C641D177F640F8304C03E05E063C9F16FD8FF00303331F371A20E73F548931E8F9C2D20FA0320CA0238092F5C009D0387644F870A6FAAB462B3B93E9934F6604874841C1F78BB404EAFDE50';
wwv_flow_imp.g_varchar2_table(525) := 'D979316BB8D6FC867160868920EEC323BF816CBD64B887002EC2D4DC2F12C239025C74DDE66779C45022AD75DB1949A41C7B7542EB8316708D97ACD823B1977B2810CAD747F77664FA6A1013337BA92241D4C0470D70C763863F3615BF450D783520DEA5';
wwv_flow_imp.g_varchar2_table(526) := 'FCF792390964BC0D7A0E94CECB7F67F76241C387E2303E86A1C4600300D62C60BB056F15B069DF71B75D13602CCF43F8AE531FDFAAE5D692AA5AAF6B7A6636374978CA80AF3D785B805D1BF2D1B75D6ECF2364005CFCCDAEF5C984ACC7EEA2AB9B3F9E4C';
wwv_flow_imp.g_varchar2_table(527) := '09C0B3B4808B8FDDEB6222513B7FC4C2C5A749FECBBAD8E90CBCCC3BF69D59130B263389109D78A3DAB1BA6DE6693D222DF0F14C9244BC27FFFB357C7CBA2A87CE0FC6F3AD7707840EB478FFA1F2E9F1980017FDB9C7637EDDC2C34EC5CB4E5D6275968F';
wwv_flow_imp.g_varchar2_table(528) := '7B0870BA818C708E0EFBF3EF05C84C44A6DED8409F10DD500AD7AC226646561098D9D0632E035C9576BB1DEDCCF8755154CB57D5C82375D4404F352017504F256B2E96E91B37E71339440D180DE006079844FC53D64006DD00E582C0B4B95E0369EB9041';
wwv_flow_imp.g_varchar2_table(529) := '3EA04EDD529D6003408BD50BEBD7D6676663B1E41EDED4667B8FF91BED2EBF17C02BE8850860FD9D5A0B2A8B653C08B19473CBF57C163D76AE036579CAE9C9784A4039BFED34F601CC160B1993CAC0C5DF444C641D2D930B0870D1B59FFF9AA3B1E4B7FE';
wwv_flow_imp.g_varchar2_table(530) := '48C4543CFF69C06EE2D7DCDB4FE5D7BFF63236EFD968D143F1365891004F000115AB3D93C39B079E333C5F461235015C647BF1E8F667D4571E09BB5C0416F7108C25973E6C3ECE1160D3E73A9A08964401EAB637966B753C99D4AD4E5AC6CB29FD20DA9A';
wwv_flow_imp.g_varchar2_table(531) := '65292529226DCDCFA30A9794C349BD940DAC2B2FEFE1133043D740605FE466164879E564813A33FABAF01834325CF9E988DD0BD380190B171E8F6192B64415789DB6D4DAF0D8F8F4D3DE5809360098593C2B7EA34BEC4C06DE143832AC059A146FA27290';
wwv_flow_imp.g_varchar2_table(532) := 'DD7CB6D28A94D65E3DC01A0476B2AE0D782BB444901E12025CEC9835B1A0ABB5FF72BBCC4CCC4C53592707CAE5360D5D019BCD9A369B95CDEEFC681BB0919A542CF834755BF02CBA03C693A9D9E360EB5FEAA88D67322266452C70C991983D00E78B44B9';
wwv_flow_imp.g_varchar2_table(533) := 'E470E527FB0301AE725FFE783426C04767CBCD6E70F3B400DBAC5747EBD16569465903CFF315D3138904DEA3E004C9D1222DFD068E1656C8C4FABF3EA10FCB0AE708B0E9731D9386F725AD340175E5D532E76B99FB898E8F172A3E89B9CE9AEFB55105BF';
wwv_flow_imp.g_varchar2_table(534) := '160EA7057EDD805830C6EA7D9D1B535103B7A081CC8C7DB906AEB6B3E81B70B51DACD831DFDC28377F33262AB21D28B9D8E9E4B9BFD16D7F7CE3A53DED041B004A29525ABF6959C333509A981531EB37E5AE8C9DAC5B9FD36375C9E1CAD72D59BC2EFEBE';
wwv_flow_imp.g_varchar2_table(535) := '7C167D033E3A5BBE97080060D3DD1E334AB384D2131EEC783211CFB5FE5A585DF925F269100000100049444154C7E231E77B2834F189F18867EF814CBC2EA06E7B61F53E52E11C85EC6E9ECCA6849DFF1F6BF6E31BD6BF019734D6A375955F2A3F931B6C';
wwv_flow_imp.g_varchar2_table(536) := '8E842063553930960C2A5E97B88659313103CAD92CD6BBF70D9E3B77322E1560AC03A56C6F3233118AB68C3A268DFB86CCB1E4F8E01C199CF9FA3CECF7E609048758DE6C2DD10DC04BE82030E345C68AA3F839BBADBD36EE11F9DC14BE3091FC27D70702';
wwv_flow_imp.g_varchar2_table(537) := '03AEF2987F7D1A686B2EE84033CC3258810E789F8FA5F4E17C8DB5DF528FC747FB9DF571C4B9047C74B13C6A403480A102C8D7AEFF071A0044CC6C408ECF782C6B6393708FAF2D0BC621CEE0B3352B02423B92C9BA1E90345CC30A6DCF47672246E22DF9';
wwv_flow_imp.g_varchar2_table(538) := 'E8BA2A9F4EA7349DCDBCEC37DB35015EC206042FABEE763B025EE61DFBAE25DA061C2BBB641E76B403A765C8CCBB00F0CCF969BAF3954216A06E8B7A3C22A06E7DA51529AD9DD5F7DB2D014E82960AD22425A02ABB54A27D40D57A4DE99396D6BA43E540';
wwv_flow_imp.g_varchar2_table(539) := '1F81507A4BC7AC880536DDECC8A43D1192A4A5795E51FC440D440DF44C03DC3379EA8813430075B416EB440D9C5303AD1900F96ED771B0ECF05681A66B2EC10D562484970354ACD61AB9590BAAE34163DE055A93A41E2325B22BE5F678EA710DAF351A4F';
wwv_flow_imp.g_varchar2_table(540) := '08F0D5C03E80C37E27EBC299818FBE7A795E23ABB8060DDDC10BC86BF7E72FE452726E7D12C1DB4ECEB0A6ED93C39637F598301700965FD523EA02AE7AF03A013B4E5C744DF3CDBA7AD67CF778533942EBA7E2E902A1F475E9F2F1EA7E2AC7C757694D4A';
wwv_flow_imp.g_varchar2_table(541) := '9F6FBECB5A8AF82A5FC76279D4403D0D0CC88B350693F953AFAB6DD712D5C98A5BDB5C5BE42702B6C82DB28A1A881AB88C065A3300B0F311A8DA8DA69679687B59E18185D213BC1C20B842BB844ABC67A02AD7D43C5F3E1C0BBF6AFF42E999999899F468';
wwv_flow_imp.g_varchar2_table(542) := '6C40273F19E16D6C7B89049C24AB5168ABA4B29609D8B4EB68E495F53F22A6217F12E92FD0973EECF77BDAEFEABE5B9E69341A09C2239C6FFA8DB9047853F03AA3A927FA9A5B7B29332EE55A6A8F6318273C1D018451D7A7326FD693B9B33E87766B8646';
wwv_flow_imp.g_varchar2_table(543) := '80718D01755B0F3300863D17D5D54DAC77531AE85104E0A6F47E8ECECAB91507A0594B71126CA6BF58BB8F1AF01A00C6F2ABE091283512E77914DCD744D67880E00A3509E17D01A1D5B552A4950E256F9F0EF30D50917376E6E7662B8A7776722D6317F0';
wwv_flow_imp.g_varchar2_table(544) := '35BCDFEE3AD885FDB155AC87031F738E7F83ACC0F1D2E1E46694FFBBB4C4F9F520B29835D3EA91316645CC4CAC0055BB3B984B001F8354E643C04717CBDBD500EE4140BB5CEB73D3AC829E0283CC40DD96EA8FE8BA2D0EA61E0F46D22868D440D440971A';
wwv_flow_imp.g_varchar2_table(545) := 'C05C0074D946E41D35707E0DB46E00A8912620B42BF08A720B46C274A1956E800E5E20D0B7AE5A8FAA6F72B9E461A5C47B53AEE2E7FCB483E79C9F9957F8A2445EA04295B39256DE4B7356E9DE36964A440C208948BC2DF5E728AD4969E5276C8922E978';
wwv_flow_imp.g_varchar2_table(546) := 'EF04B32616B4246E6D36781701509B41CB15331927405DB6A1F34C287FA525922EF0D1A79EDF64F1D53FDFC83E2589DCFB1B2FD19DE21FCB5AD6809CB09A136ACB82447617D100CEFF451AAED9E8D0E4ADD9CDC1548BE7A32FA7AA75032074EDA2AC8014';
wwv_flow_imp.g_varchar2_table(547) := '96EFA1FE7398657EE574E55D9E88F8016546674EC35A07CEDCACB339785369EABF80FBE2296AA5492BE5EC4FB9A0BD5DD865CE6169A5B5789C3A8CF8025489AC512772AD5EA0E95A4D26873DE19CD6AA2C95B47861807C3DCBFF4C0C6BA0ABC694443380';
wwv_flow_imp.g_varchar2_table(548) := 'AAFCF10E03A06A3D177D56734F868BDFA5F3EBDEF75C72333331B3ABF8393F45E4D2BCD7C13F273F577AF145BDF87EC1AFF584BFA0C0B1E94169C07F210DAA3B51D8A881A881A801AB01DC3E019BAE706CDF0080B705541002A4B9A5BEC7D76E206B3C04';
wwv_flow_imp.g_varchar2_table(549) := '047167D25A0BC29F66A08E3EAAA2C58E6766818EC409669B8AA7080457E88850692D1EB512EE6146405BE3501A7CF53F748D509FD9E37C256440E2B0DF37FAB5B480265A25C1B500D4651A7ADE7CFCF56844808F2E95E84A9FD6C67DF2C6F26E3480B102';
wwv_flow_imp.g_varchar2_table(550) := '8471CF0851B93A912ECC8C616D44AAA881A881A881A881336800EE1C7086A6621357A2817AE3A57503402B4D5AA9CA4A35168C58BF952B0656E89A7FA01895C974CF3D425787E07501AEF273E533B3594B6356C4EC5F5B4F646D126826DFDBDA4AAE0BE0';
wwv_flow_imp.g_varchar2_table(551) := '6D499EC3463E95277AFCD7AC39CABA638F457C255A96CA8ABAE05566858496F30654A8D288345F1BAF3799376AD85319DEA8BEC09B00DB8AC078BAD7DBE2D0792195E8765AE34D861DCD38DC5B8546C16E5103713CDEE2598F7D6E5303F11A6A539B7DE1';
wwv_flow_imp.g_varchar2_table(552) := 'E53500B0F313081618E30408AE901376EDA18B1F60F6D7E6AD0DE7AF528A805089CD1AB6ACBFD77DEED9D78EE17FF0EFD508A5F3B5D756B9D2A247818F5F269634E0A33B555EA74C694D4AEB3A55CF5207EB8B40686398338050FAAEE85289560075F9EB';
wwv_flow_imp.g_varchar2_table(553) := 'C0B5FB50FE5ABC68C0479F49D42293B1E8A3AB5A8E730254AD4798D381CA159B55687B777D3369CE5F5BE9B079016305A82AA1AA5A219CFE02A3255CB8EBA6EC5F04F1BAF51D7B1735D0AA06700103AD326DC0AC83B9BC03960D3A78B3555B3700B4AC59';
wwv_flow_imp.g_varchar2_table(554) := '2B5937ABAAD1A1FD4E75D5FED5A5575A8B67A8EA56BF78BD44A211C0A50581D703F8E430910B91B97E04E5780BBA654FF2782BFDC91DFADAADAAF89B26A19A6789E8013EFA542200690711005FBBAE72CCE998DB5DE5D5F299146B52A2638A9F931AE0C0';
wwv_flow_imp.g_varchar2_table(555) := 'F17292C9894275A2AC761147EBAEB6EE8E578C0A3DAE978E72FBE47C75D4C5C8366A20580332FDC4393D585B8322ECC4002059306256C462E551C50FBC45A062B5AB25D71251D112052092AB90C23F997810590F3C88FCB9E6EABFC216DED330CAD0776B';
wwv_flow_imp.g_varchar2_table(556) := '5B6E59961160D3A1C748976B001E2390A786F777341E13D0B6E4A16BDA187B40DBED57E5A7B16741E620AA38FF90E7A3C4B3053C648329367A125DB52D703EFFFBDF478327AE80AAEDABAA15C2E9ABDDB0C2F9DE28652575C285056E54578DBB2DBA93FF';
wwv_flow_imp.g_varchar2_table(557) := '8DD9DC2C834A83F566B574BAE371009ED64F2C6D43039D19004A33295D833DC63D40F1F351034C5AAC70589914F84925029076110110CB9D80403910850002C93B23D315D7E09324A12ABBDE73C1DD7FC10B70535C5789D29AA0F3A1F64AC91807DA965F';
wwv_flow_imp.g_varchar2_table(558) := '8B97A8652CFAF8E691B3EE7E1BC5D7BE2D37F38ECC3D36DDD651637C08DAE277693E4AB14C8B8ADAFEE47A6A9FAF95B33BCEB685788C1A881AB8390DC435E353A73C46484E69677865389F4057928337D03E7FAF015075EDB4A988661776C073E655DBE9';
wwv_flow_imp.g_varchar2_table(559) := '7A37655579AAD257951FEB8740D5767CF45A69027C74B61CEB52804D5FEAC8CCC40C68396AAF18497220C04BF882E0D4D724958882C045937B7C97DF2BE1920FDE30E02AEF5B3EA22D405DB9948C73A06E7D573DA53529ADA49805EEFF0922500237C579';
wwv_flow_imp.g_varchar2_table(560) := '4A2025D0766B55E7B3B6DB2FF3C3EF2F00E57C5F9A5913B322960800FAE4A3AF5AAE25FAA275D1066B67F5BAF38772728C0503D7405C4719F8098CE2470D440D9C45030DE74A86890474252C7803EDF3F71A00CC4CCCDC7ECB67E6887568C0D72C8B95C5';
wwv_flow_imp.g_varchar2_table(561) := 'EC558B8F4DEBE55A64024219E71661076B88180A40A020B0AAD3A4E10516D856089912EF0BF0D156FFD5BBD31CF7BB1DEDB75B275196A594A39F4F1FC0BB019C1DE859412AD116A0AE584A29525AD7ADEEACC7CCC40C2839BAF963FF0EE06434F002A534';
wwv_flow_imp.g_varchar2_table(562) := '01BE6E9C2B12925F7BD52370E3C984C6E3B1AF1B8DCB95674F5D2E7F5AB91D55B9C6CD54E09BE969F71DED8F01D07D5F1D2D6451070ECDF4305BAE7DF9DF9D609D32EF4EECC8F9EA34E03500B06315B8BA9E3B3AA4B422C0517CB16C785FC0C504281AD6';
wwv_flow_imp.g_varchar2_table(563) := 'C59A1451D82496BFE11196693F6E80781B20409E4F5ABC433E931B37E021275779968A672F488D47EA8FC8E4919BEA9E88ABFD5BCD87F70CD4ED3F331333D7ADEEAD8739067011A6C5F873950F3D5F692DF3ACF67643E2619DFE864B62F6FAE07AAB373F';
wwv_flow_imp.g_varchar2_table(564) := 'E5F3E1C8DB8FA604A1ED6432D700A1EDA950C2481735F04A0315E746B98FBEAA7E4B89DC80A837C1DC929E625FA306A206CEAB01A701C0AC890575C581B70A54AD8F1DE340D57AD74EAF942620B49F499210104A5F8D8E49C9D8502ADCF28567DB645736';
wwv_flow_imp.g_varchar2_table(565) := 'B5F46159DB0542D94166E034BDBB74BFDBD261BF7313944ABA7A0AA6D4CCD52713E3D9F9232E975204A25080AF7D7873808F2EB45C07BE8720945F5D3A662666F65637D7839CCBB67F9BC3369CA5126310D874D523DE160954AD57951E9A027CF510F502';
wwv_flow_imp.g_varchar2_table(566) := '7C74B65CD92FF11835D09D06A2F7DB9D6E23E74E3470D54336E456D28956EB31BDEA73514F256DD5721A004A2B02EA36841DEB40DDFA97AAD7D422EC4A6E259E2B10CA5FECDA4ED7CE583101C1F2C81A401E0A0FADD10D9DAA1C49F1BF0FE094A4886601';
wwv_flow_imp.g_varchar2_table(567) := 'A7686259DB1AC824FA25E7ADF6FB44505F2268870E2308723D13E0E93ABC39C04336D86296482270BA03C5F9309180D394554B53E10954AD974752BADFFD5F552EDFFB46CAFC9C06409930A6A3069A69A06F663C37EB4EACDD5B0D88ADD955C4B8B77DBE';
wwv_flow_imp.g_varchar2_table(568) := '7EC1FA367F5C87C69D0600D6A780DADD84750BD46670998A2976DF66F57785762535D6AD81AEF877CD374D124AC5DAEEBA1D1F7F3D1A91D2DA47F65C7ED8EF650DFF9427F84CDACA97244B096885598B4CB00F0268916527ACB0F69FA6B87E3B61DF1A53';
wwv_flow_imp.g_varchar2_table(569) := '2D9128C0C7D0AC81D78E64F8B85FBE5C6925D7A3F336F42C609AA4327FB47F5E13999780E78602BF68F33454F81EA840B6CDC9D2940808E4E4D77C20A3AB228BC6E6559DCE7267B8B2F31F07445987FD4FC773D6FF731425BCB4069C068036BB45C7B5E5';
wwv_flow_imp.g_varchar2_table(570) := '83750B5465602C5EE329B67B01E716A458475505EA197DE879317ABC62CFA1D9696152E281A980A7185244848C47797C3C52CB9F4CAC77A065B637C32E158F0EE87B87B544A2009F9CF04E011FDD50CB1165067CF2631F04E0A30B2DC77E24E070D81110';
wwv_flow_imp.g_varchar2_table(571) := '5ACFD2C187006CBAEB23661FA0ED761C06C039BB76A44BADF7B406C31A558EF42466F55603D5C6B85957EE6D5F7A265835D5F64CF8284ED4C0ED68E08D01301A4D6864BC7F4D2116EA505495C9DA2ADE4A172A6F863DF43D9CF5ABAE3DC19B0442FB7D2B';
wwv_flow_imp.g_varchar2_table(572) := '74A3F1884615DEE10DAFF2ED1AF8AD688B2834A2A43177C8FA28D165AC008C75801A7E32B9F681866CBCD5F3F976E2A483F79FC8FAB793A0E30225E712E8AA19335E241AE2E36F7E4B6317FE3E0D1FBFC35E3C7F818FAE2FE58944C581B6E551C719E2E2';
wwv_flow_imp.g_varchar2_table(573) := '058E97C6DCA881DBD2400C07DDD6F9EE5B6F31FE80BEC9D5963CB8D7006DF18B7C4235F06C00584B74B6B8A3D962115ADF4D87F309B8297A5C9251BE67A0FD5DA74D3BAD9492F5EBE7D3E66597C89A28E025BC3182C9644A4068B7D33421E0257DFCFE56';
wwv_flow_imp.g_varchar2_table(574) := '032C9E3FF0B6645839A9785C40D752230A05B8DA41D43243F432CD284B9BEF610A8DE45879B4D604D874DB472DDEBF1E696256C4AC9DEC733DE4EF66682312B717EF1F7036E829405404F090F5BE58E512727E207B2C92F1103510351035103570610DC8';
wwv_flow_imp.g_varchar2_table(575) := 'CD5F96242E2C4487CDCB7DA7FAA3390DE4B9E6684A35B5A8E9FC8EA6F305CDC5F39FDFDD11331B5463F3965ACBDA11F0B624E634D100F66784EC9AB56D24E2C900361D8FB90658222980522302F25CF75FEC40063E52847DCB8CE736FC0907EF26007CBD';
wwv_flow_imp.g_varchar2_table(576) := '86B708F8E8BA2AE7E2BC76C5BF6DBEE3C99446E389CCB9DAC0C5FF20D7F1BE85A77A92C088A0522373EE7251D100000DC2494441545DF099F439198F2522377175FF397FBB5DD376BB794E57FD92491425936B32117D221A52B5BEA5D74AD139C77957E7';
wwv_flow_imp.g_varchar2_table(577) := 'A1880048B7E4C62F7FE3FF2168C09C2B1E82A451C6A881A8018F0698E55A063C74B1D86AA0A9412DF5E5BFE556FD783DE74B4DC40205AA2B21AC06B326168451472A9F06724B9089591107E8D5EC9EDDEF7D6C6FB67C3C9D12E05380D1E38B5DC83E7A5B';
wwv_flow_imp.g_varchar2_table(578) := '9E9AF70884BF4910D11DC0D6EFCB31339E53F335E8AEFBA39426A0EB76DAE63F9571389DCD9C6CF7DB2D014E82C002594CC0F34D5EEA89C80378095B22184F67721DCE88654E035C6CE1B5630F80858BCE958F28CADEFCC6433D0B4099C888DCD32402C0';
wwv_flow_imp.g_varchar2_table(579) := '02573B6DE76B5604B4CD57B5CDB0357EF5CE4F6BCDF79B111355F118CCFA615428C5CF0D6940AE911BEAED6D7555CC1833A7D5ED75C3B9B0CADC5B57C433D5EBDC00505A1150B53F999C60781D55EBB5468FF903688D61BB8CC6B266369EF8D7CCF2DDB3';
wwv_flow_imp.g_varchar2_table(580) := '97F7DCF2DDBEE37695D002B7F1684C211E77AE47BB0BD9EFD163EC025545D4725E81AAF5BAA667CAFFF9DAD1A24FC047D755B91E8D64BED18DD963BF03D098512083F1644A8076E82F2D2249753D5F2B46EE41FB238266AFD1D83FBF58BE4D8FCC32BE04';
wwv_flow_imp.g_varchar2_table(581) := 'D88786A7D09815B1C0C577B35ED27AB524B3962FEBF92EBA723EA228FB6DFDF709202A32999C4F2F65F9DB4EABB619F6961FF756B21B11ACBF278019B20137722AAEBC9BE6745E791F3BED1E1478C1CB81198D03BE5E36F4E47DEC6FA0BC730300DE1550';
wwv_flow_imp.g_varchar2_table(582) := '4D971961C73550AD9E8B9A49E3A904B1AE29E8C3A4B5168CA8AF1F3C3B0C84C99789A52CDE6B054B398C6F052A5CCF40852AE720C53A1EA0942625EB7BBE3677FB2D013EBA2470B7B5E5C3AC89051AE35460F3FB72D4E67AD07D11C7230713B322E6FAF2';
wwv_flow_imp.g_varchar2_table(583) := '6617DAF3309FDFD17CBE2036F2AB37FD84D7BB5EAFDEE4FB3242FB33C29B60F598D8B4CF3EB6AD976B19FB00F6434C677327FF0CEF46106C562BDAACD69421622C2857B0F9DBCD9A80B488A494E97C691B991917911A1F7DDBE5B6FDB6F9BE1D616DB710';
wwv_flow_imp.g_varchar2_table(584) := 'F9F54303472E8EF30976FE89A472DF8CD751B956ACD05B0D0C60CC397527B29F1A8F722DE3C6E6ACDEB840DA6FCCE39C0C326300B85A6C4F5743D38B4B231FF33B370072CBA5BF9EF447550CEB1BAC6420B7D4FDA7F17038D0E1824F03C0C386BC7DD532';
wwv_flow_imp.g_varchar2_table(585) := 'D6F5B0BEE793EFB0DB8A1E7794793CC4FD6147808F9F2D9F89D7877771D874DF8EAC14017D93CB258FD24C4A2BAAFB41D412A85BBF6E3DE81898CD1634936840998FDD8BB2DF6E68275E6DB9DC954634157095DBFCDCC3BDFC1A772EC7D4E86026D78695';
wwv_flow_imp.g_varchar2_table(586) := 'AF7C4C0B8F7EF5F481968F1F68B57C3480B70F983C29DB6DD70494EBFBD24AA282C04CCEC525AF4FA5B58C67ED13B788F486BFC1567939B6423030CB6960E2B6728A3A66C2D7A453F1C088DA5C7F6462E68ECF40641F3530540DE0DA007CF21FBB268FE5';
wwv_flow_imp.g_varchar2_table(587) := 'F9F894CAE5DA640E69BF546F00C9CE0D00A5B5582E4A54514D81492A6BD602A978D6FF266221EB5044D5E4A50B7DB0631CF0355FF739761F5F5F39B326E6EAE7DFC7B7ED72EB71B091573BD9DB828D78601BF12A6CDA1EB3223270D8EDE8B0DBDA6CE771';
wwv_flow_imp.g_varchar2_table(588) := '329DD3643A233D1A1938092F5CA09426E0C262DC4CF3D8DF63206BCE2341B9E3F91BF1D6E2F11D0CCAE5E534F6AD00E57C9B86970B9836C7639B7DF1A3BD2E17F70FB4B87F2763706450162CCB5202EC530EF0F601E401657A5F7A2AD72570F7F08EEEEE';
wwv_flow_imp.g_varchar2_table(589) := '1F88990D7CF5BA2A67CEDBC739025CED20CA03B8CACBF9AA9C11D35103ED6B80DB67D9638E59EB11821E77368AD67F0D98F1D87F31C324B473893D86D5AA442537DB4AF4BD240E8B7C746E0030B3B19C9871ACD09C785204B4A4DC2CCD08F0B1E381AD75';
wwv_flow_imp.g_varchar2_table(590) := '629D12F0F5CBAE1D264998C7E0E3175AAE2502A47585F31ECAB823BAE96C46D3D9D4C1FD6336BC7B602F5E3E604B36EB95D96D6CD3AEA32AD616E1FD032EBABEE42BB92E009F3CA944ED001F5D2C0FD3C05CD69EB11F408FC604946BAD974FB4592D656E';
wwv_flow_imp.g_varchar2_table(591) := '130FF8C57C99C97700FB047612AD7245A4B888784DE773C2F3F765FE7D496B89CA02770F88043CD06C9EEF91B0D7515339A15B60215186C5DD034D6612991334E5DB767D35D204B8F8A6664F4442704200179DCD57F64BB74716F6801CE2FFA881DE6B20';
wwv_flow_imp.g_varchar2_table(592) := '8ED5DE9FA21B129019E31138DE694CF4E2DE1C2F7CCE3DED1132BBF93FB3E8C917E6E1C8DA139539C538930140A4B41268A720E502BC850B28E7D74B67124C4804FE37B8C19B06EAB573FE5AA3F184B06E47C414F2D989C70A84D09EA249939480533428';
wwv_flow_imp.g_varchar2_table(593) := 'D35A1380EF43805D73843700BC94F9D877BC910CC06E63E07090B57FC1315AE4598F65717F2F6B9A0FC4CC0628EB335829027C326685E7E9A3EB7BB9D2B2D62CE88B9CD8813E5FDC93522297C0CA95156BDFCBC7F7F4F4F8B9D909BF7CFC60BE3F49DAEE';
wwv_flow_imp.g_varchar2_table(594) := '15B0F4F6689EF71F4DE80E6BDC022D7D056C79DF8FF63AB5F2DF3F7C818019222602ACDF03D83F014C644D1F401E60E9500780D70F4007405FFB0FD980D3F265941C1281FF7EA74E33BA8ED2AB5A023B7A4A9848FED3B93ED7AF5022EE50A1867787FC29';
wwv_flow_imp.g_varchar2_table(595) := '7EAE560366ECA0774DC68FAD6B8FE017715D1A381DF1B17D3D9B0100AB05B00DFB8E6D7912C9E1209E6A85E722C563555AFBC4EB4D3933CBBD8A69A4C704ABDE2758B2DF0759862E3E660F81ACF3E69E875FAFDAB176E9E2DF977CACBDC2EB6256C402A2';
wwv_flow_imp.g_varchar2_table(596) := 'D392A566EDCD6D71C3FB0016F7B28679774FCCF9793BCDB57FA5CC9A58D03FC9DA9588959C1F41BB5CEB736316790477183F82A9AC814FC5D32D4704CAE3D09663EC010BAC714BFDF9DD1D01CC39DFFA92F5A32617112A1B19B06BF8E63A163D4D653D1F';
wwv_flow_imp.g_varchar2_table(597) := 'B0F996CED6EB472FFC52209AAA259AEEA3DC1FF641EF21513E46D7531E66115D4F7F4FF4C478F04DF5D1B4FE09F97A53C4BD91240A12356035C0DCC6B86C838795281ECFAB019C3BA079AB673300AA5A5A69226BF682A65D0C7D9F00B32216E881AD8559';
wwv_flow_imp.g_varchar2_table(598) := 'FD601F0060D3AE63EEB9A774D81F04FE5F052BF3C1DB0481727E390D5D02BAE7CFB797E5B669662666A63BF19800AC2302B6DC77D445E46371F78E00781F0073CED757BFAFE54ABC0FC025DF2191712570950F239F496B2D18515F3F93C994803B59BF07';
wwv_flow_imp.g_varchar2_table(599) := '1E3EF9093A069401187B801EE8FCD6D7F3706EB9F2F387289C92F949399B37915E89F63A098A02378782201EAE5503B7E0C1B779EE3867263770227C07A8F4419EC0D0948A6272381A9053381C61A3A4B7A781F606E8D90C00AD3401A127CB7AAA59C35D';
wwv_flow_imp.g_varchar2_table(600) := 'C5A196901EB8659C3F0D10FE0EEFFD6E472F9F5F0F3D2F793DFFEF69E3ED844028DFBED2E5912B657EA10DEB890FEFBE40F782C51DD6F273EF1E1E3E7612DFBFFB44BCB02F1068F2F207D2038D80B8CE078BF103B8CA879E8F7D34D84F43D24F8A9FA881';
wwv_flow_imp.g_varchar2_table(601) := '9E6A407B2254F6FE89391E707543B90A627ED440D4C0310DC8EDEF98876FF2582A58C8D7F83F6A206A206AA0C71A389B0150D7134A928480BA3AF43D976DF962FD1CB0E9A11D99999899B04E0DF8E4B77A098DB024B2AE0BD8370AFAF88F4713027C7443';
wwv_flow_imp.g_varchar2_table(602) := '283F26A31DCFF6C89CEBFF18ED35E5E59E87767609EF86009C04672AC802DFFC591607512BA09C1FD351037DD2C0643A23C027D376B3A1EDD6FD9B246733007C82C6F26BD2005F5367625F6A6920EE31A9A5B658296AA06D0D64997935F031B667370094';
wwv_flow_imp.g_varchar2_table(603) := '7AFD26AB6342BDCC4BC5F3045EE6857CC7F3FF40082D6846A331611D1DDF878CC9784A93F124B80BF8453BFCB29DAFC22EF00D82F9F9D53492B5EF2147543EEA237EABA2813C429456A9D2016D466996509ABADFCBE06AD417E170D58BF95103E7D4808D';
wwv_flow_imp.g_varchar2_table(604) := '3C4E8A371CBADACEAFC784F07B10DBCDFA0DD9D90D803712F42143C2B7C47D10A42D19D01920945FDBDE9AB40D9D86361FE9A206DAD640DB43BA6DF922BFA8810B6AC05E1E673700C6D32901A17DAFFB5CF1E1B027C0D78EDDF5CBAC88596E5CBE0A3D2F';
wwv_flow_imp.g_varchar2_table(605) := 'B796617E1C7BA5C52FDAE197C2102D01CA15B2227C94EC0F84272ACAE5E5F46CBEA0D97C5ECE1E6C3A0A3E2C0D609F4A92E00D95768A0B939FCDF5AF48EB11694158AD48153570590DE0DD0E802F12B0DBAE250AB0A6C7F79FD2D387CF48D6048CE0CAFC';
wwv_flow_imp.g_varchar2_table(606) := 'BDF93FC3BFF1BF3D8555FA94C978704F98300264C4BC6D22E6440D38342076A3A3E41CD9EEB17C8ED6631B510397D34095799FE8EC06C058D6A747B2DE1EAAA0443CF924C15A5EB58B3AF44D77F93BA1C3D7CC43E5BE34DD743AA3A9AC0F85CA81DFB15F';
wwv_flow_imp.g_varchar2_table(607) := 'E377C565E6CE6FF879CDFD7E67222959F1AB6379EEDBBF78F200C8230FA3B70483CC8942D7D5409AE2E91D5CB77539D4AB9788F79F24D5F72060E73F50AFD5582B6AE0B21A401400C0FB47E68B0762D6C4029F54673700209089B49B3F480540EEFD725F';
wwv_flow_imp.g_varchar2_table(608) := '0A207C4922955E26E3F7A881A8813369205E7B6752746C266AE08D0698F94D9E2BE3EC06003313CB7A1BDEB685F5779760AFF3F1FBC687A077D767622964E2ADC203494FEC0266B18E80D118BBFFC7AF9BBB8294F5C47D6B43B6AB76B7E8F2F183F94DF1';
wwv_flow_imp.g_varchar2_table(609) := 'D5F29180ED7A4980A52B1F951A11309BCD69365B948B079D8EC237D0006C00A0018B3A55B14F05A85A7724EBFE40D57A913E6AA04F1AB0F33EDE4A0AE02DA500A2B300B32216589995FD72FE23576CB2C26C6248CD9F8A6D5C3379557D57D0851875441D';
wwv_flow_imp.g_varchar2_table(610) := 'F2A7F8891A881A881A881A68AC0133577FE472310360329D06BDC9C88A1AFAFBC68762CDDAD6731D27930901AEF26BC9C7BAD0643AA391F47734997ABB65230166EFC5C1FD6B812C5624305BE4BBFE999998D9CB7F380451D2631A60A5083856D687BC24';
wwv_flow_imp.g_varchar2_table(611) := '391050551678FF55F62655E51FE9A3062EA1011B1198CFEF08B87FF884EE0432591B7194F91BFF5CB50698E38DF9AA4F70EC5C430DC8F511AF91863A8CD587A40119F146DCBF020000FFFF27765693000000064944415403004213470D5896438E000000';
wwv_flow_imp.g_varchar2_table(612) := '0049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(1609807551940825659)
,p_file_name=>'icons/app-icon-512.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260505092756Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092756Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(1609808901660825665)
,p_name=>'Administration Rights'
,p_static_id=>'administration-rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'plsql_function_body', 'return true;')).to_clob
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_version_scn=>'SH256:K94FzTYWdjDQ6WIg6w48Or20nhyD_tWnqCuRh9rK4CU'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
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
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(1609809325095825667)
,p_name=>'FEEDBACK_ATTACHMENTS_YN'
,p_value=>'Y'
,p_is_required=>'N'
,p_valid_values=>'Y, N'
,p_on_upgrade_keep_value=>true
,p_required_patch=>wwv_flow_imp.id(1609807965143825660)
,p_version_scn=>'SH256:zBoHxELbCF64JiYwSzQdItfu58AlSVUWmbfwVhVGpyo'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
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
prompt --application/shared_components/user_interface/lovs/boolean
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(1609890807275826903)
,p_lov_name=>'BOOLEAN'
,p_static_id=>'boolean'
,p_lov_query=>'.'||wwv_flow_imp.id(1609890807275826903)||'.'
,p_location=>'STATIC'
,p_version_scn=>'SH256:CnCBOq-zabcz-aPWKwU8C5KDeZy6YuyjvpJoTrTywfI'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1609891524966826905)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'FALSE'
,p_static_id=>'false'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1609891118369826903)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'TRUE'
,p_static_id=>'true'
);
end;
/
prompt --application/shared_components/user_interface/lovs/ev_event_types_name
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(1609832329461825722)
,p_lov_name=>'EV_EVENT_TYPES.NAME'
,p_static_id=>'ev-event-types-name'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'EV_EVENT_TYPES'
,p_return_column_name=>'ID'
,p_display_column_name=>'NAME'
,p_default_sort_column_name=>'NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:yoDLEpFrRGRVkxWsLvDYK6_QDfgGamhFV7-lWZpoy-E'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/user_interface/lovs/ev_venues_name
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(1609831694142825719)
,p_lov_name=>'EV_VENUES.NAME'
,p_static_id=>'ev-venues-name'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'EV_VENUES'
,p_return_column_name=>'ID'
,p_display_column_name=>'NAME'
,p_default_sort_column_name=>'NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:M1FIPbN9K-549-c5Ri1zznqZMvWSLzHqYDjvJbCgAnc'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/user_interface/lovs/feedback_rating
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(1609897400995826920)
,p_lov_name=>'FEEDBACK_RATING'
,p_static_id=>'feedback-rating'
,p_lov_query=>'.'||wwv_flow_imp.id(1609897400995826920)||'.'
,p_location=>'STATIC'
,p_version_scn=>'SH256:QHID2_AL91pivdhRvWMf8rTxRdNvsqexHwq5MFyhCN4'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1609898533005826923)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Negative'
,p_lov_return_value=>'1'
,p_static_id=>'1'
,p_lov_template=>'<span title="#DISPLAY_VALUE#" aria-label="#DISPLAY_VALUE#"><span class="fa fa-frown-o fa-2x feedback-negative" aria-hidden="true" ></span></span>'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1609898167768826922)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Neutral'
,p_lov_return_value=>'2'
,p_static_id=>'2'
,p_lov_template=>'<span title="#DISPLAY_VALUE#" aria-label="#DISPLAY_VALUE#"><span class="fa fa-emoji-neutral fa-2x feedback-neutral" aria-hidden="true" ></span></span>'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1609897749463826921)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Positive'
,p_lov_return_value=>'3'
,p_static_id=>'3'
,p_lov_template=>'<span title="#DISPLAY_VALUE#" aria-label="#DISPLAY_VALUE#"><span class="fa fa-smile-o fa-2x feedback-positive" aria-hidden="true" ></span></span>'
);
end;
/
prompt --application/shared_components/user_interface/lovs/feedback_status
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(1609913531238826944)
,p_lov_name=>'FEEDBACK_STATUS'
,p_static_id=>'feedback-status'
,p_lov_query=>'.'||wwv_flow_imp.id(1609913531238826944)||'.'
,p_location=>'STATIC'
,p_version_scn=>'SH256:PpuBEbIoOUhSzFsElNFuOJRnL162R3kqFnYCQDsmzNw'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1609913803450826945)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'No Action'
,p_lov_return_value=>'0'
,p_static_id=>'0'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1609914257933826946)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Acknowledged'
,p_lov_return_value=>'1'
,p_static_id=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1609914633006826946)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Open'
,p_lov_return_value=>'3'
,p_static_id=>'3'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1609915048953826947)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Closed'
,p_lov_return_value=>'4'
,p_static_id=>'4'
);
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(1609809555559825669)
,p_group_name=>'Administration'
,p_static_id=>'administration'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(1609943443382827068)
,p_group_name=>'User Settings'
,p_static_id=>'user-settings'
);
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(1609803745059825410)
,p_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1609938946263827037)
,p_short_name=>'Administration'
,p_static_id=>'administration'
,p_link=>'f?p=&APP_ID.:10000:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>10000
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1609803900340825410)
,p_short_name=>'Dashboard'
,p_static_id=>'dashboard'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>1
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1609829614267825707)
,p_short_name=>'Event Calendar'
,p_static_id=>'event-calendar'
,p_link=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>2
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1609840474311825955)
,p_short_name=>'Event Search'
,p_static_id=>'event-search'
,p_link=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>3
,p_created_on=>wwv_flow_imp.dz('20260505092759Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092759Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1609865986506826855)
,p_short_name=>'Events'
,p_static_id=>'events'
,p_link=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>4
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092808Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
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
 p_id=>wwv_flow_imp.id(1609804626816825413)
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
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
,p_reference_id=>wwv_imp_util.get_subscription_id(4073840274158169736,2000,'universal-theme',8842.261)
,p_version_scn=>'SH256:RQZ7_KKNFF7leXIrwskeQw4WaazlZwly2sNGWk8hwQo'
,p_version_scn_master=>'SH256:WOPVC8vP1TPWUxczh2dJ4mCZcNGSTzA1cn8DjR2oQjY'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092756Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
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
 p_id=>wwv_flow_imp.id(1609803060418825408)
,p_build_option_name=>'Commented Out'
,p_static_id=>'commented-out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>'SH256:1lQI3DW9n-0ZEGoDXUirkaB0JWCIATVWpJZCTCkODmI'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(1609807965143825660)
,p_build_option_name=>'Feature: Feedback'
,p_static_id=>'feature-feedback'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>'SH256:-9Ls7ZAo6zbdD8UuleMQNJ-EewqxPr2_AP_bBrkky1Y'
,p_feature_identifier=>'APPLICATION_FEEDBACK'
,p_build_option_comment=>'Provide a mechanism for end users to post general comments back to the application administrators and developers.'
,p_created_on=>wwv_flow_imp.dz('20260505092756Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(1609943600940827069)
,p_build_option_name=>'Feature: Push Notifications'
,p_static_id=>'feature-push-notifications'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>'SH256:b0paf85_BYLQVs1BjvKF0WZuZJlTwaDoNNaiXLsQIJo'
,p_feature_identifier=>'APPLICATION_PUSH_NOTIFICATIONS'
,p_build_option_comment=>'Allow users to subscribe to push notifications on their devices.'
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(1609943921714827070)
,p_build_option_name=>'Feature: User Settings'
,p_static_id=>'feature-user-settings'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>'SH256:Rp05kWjDMEnP1SDxafk9smZgJCr-A8hhup2sqmTgGZ0'
,p_feature_identifier=>'APPLICATION_USER_SETTINGS'
,p_build_option_comment=>'The user settings page is a drawer that links to all user settings pages.'
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
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
 p_id=>wwv_flow_imp.id(1609803330828825409)
,p_name=>'Oracle APEX Accounts'
,p_static_id=>'oracle-apex-accounts'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>'SH256:MwlwV9vQNyvTGV3nRFfTrp5n7mJ1Ugme2lUrlsOYuxw'
,p_created_on=>wwv_flow_imp.dz('20260505092754Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092754Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_imp_page.create_page(
 p_id=>0
,p_name=>'Global Page'
,p_reload_on_submit=>null
,p_warn_on_unsaved_changes=>null
,p_autocomplete_on_off=>'OFF'
,p_protection_level=>'D'
,p_page_component_map=>'14'
,p_created_on=>wwv_flow_imp.dz('20260505092756Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260505092756Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Dashboard'
,p_alias=>'HOME'
,p_step_title=>'Event Management'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260511102728Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609820208546825694)
,p_plug_name=>'Total Events By Month/Year'
,p_static_id=>'attendee-count'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260511102728Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(1609820672003825695)
,p_region_id=>wwv_flow_imp.id(1609820208546825694)
,p_chart_type=>'line'
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
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260511102728Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(1609822344201825697)
,p_chart_id=>wwv_flow_imp.id(1609820672003825695)
,p_static_id=>'series-1'
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.name,',
'       count(ea.attendee_id) as registration_count',
'  from ev_events         e',
'  join ev_event_attendees ea',
'    on e.id = ea.event_id',
' group by e.name',
' order by registration_count desc',
' fetch first 5 rows only'))
,p_max_row_count=>20
,p_items_value_column_name=>'REGISTRATION_COUNT'
,p_items_label_column_name=>'NAME'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260511102728Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(1609821186157825696)
,p_chart_id=>wwv_flow_imp.id(1609820672003825695)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(1609821785155825696)
,p_chart_id=>wwv_flow_imp.id(1609820672003825695)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609822987230825697)
,p_plug_name=>'Chart 3'
,p_static_id=>'chart-3'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(1609823396782825698)
,p_region_id=>wwv_flow_imp.id(1609822987230825697)
,p_chart_type=>'line'
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
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(1609825051710825699)
,p_chart_id=>wwv_flow_imp.id(1609823396782825698)
,p_static_id=>'series-1'
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Series A'' label, 30 value from sys.dual',
'union all',
'select ''Series B'' label, 20 value from sys.dual',
'union all',
'select ''Series C'' label, 34 value from sys.dual',
'union all',
'select ''Series D'' label, 6  value from sys.dual',
'union all',
'select ''Series E'' label, 10 value from sys.dual',
'order by 1 desc'))
,p_max_row_count=>20
,p_series_type=>'line'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_items_label_rendered=>false
,p_threshold_display=>'onIndicator'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(1609823842911825698)
,p_chart_id=>wwv_flow_imp.id(1609823396782825698)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(1609824423052825698)
,p_chart_id=>wwv_flow_imp.id(1609823396782825698)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609825633090825700)
,p_plug_name=>'Chart 4'
,p_static_id=>'chart-4'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(1609826069951825700)
,p_region_id=>wwv_flow_imp.id(1609825633090825700)
,p_chart_type=>'pie'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
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
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(1609826556126825700)
,p_chart_id=>wwv_flow_imp.id(1609826069951825700)
,p_static_id=>'series-1'
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Series A'' label, 30 value from sys.dual',
'union all',
'select ''Series B'' label, 20 value from sys.dual',
'union all',
'select ''Series C'' label, 34 value from sys.dual',
'union all',
'select ''Series D'' label, 6  value from sys.dual',
'union all',
'select ''Series E'' label, 10 value from sys.dual',
'order by 1 desc'))
,p_max_row_count=>20
,p_series_type=>'pie'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_threshold_display=>'onIndicator'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609827378807825702)
,p_plug_name=>'Event Management'
,p_static_id=>'event-management'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>2675494171183407654
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_plug_source=>'Manage and track events, attendees, and sessions.'
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609817436866825691)
,p_plug_name=>'Event Types'
,p_static_id=>'upcoming-events'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260511101525Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(1609817883548825691)
,p_region_id=>wwv_flow_imp.id(1609817436866825691)
,p_chart_type=>'bar'
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
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260511101525Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(1609819645935825694)
,p_chart_id=>wwv_flow_imp.id(1609817883548825691)
,p_static_id=>'series-1'
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select et.name,',
'       count(e.id) as event_count',
'  from ev_event_types et',
'  join ev_events      e',
'    on e.event_type_id = et.id',
' group by et.name',
' order by event_count desc'))
,p_max_row_count=>20
,p_items_value_column_name=>'EVENT_COUNT'
,p_items_label_column_name=>'NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260511101525Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(1609818336975825692)
,p_chart_id=>wwv_flow_imp.id(1609817883548825691)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(1609819056702825693)
,p_chart_id=>wwv_flow_imp.id(1609817883548825691)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_imp_page.create_page(
 p_id=>2
,p_name=>'Event Calendar'
,p_alias=>'EVENT-CALENDAR'
,p_step_title=>'Event Calendar'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'08'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609829049601825706)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(1609803745059825410)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609828690641825705)
,p_plug_name=>'Event Calendar'
,p_static_id=>'event-calendar'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'EV_EVENTS'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_calendar_views', 'list:navigation',
  'display_column', 'NAME',
  'event_sorting', 'AUTOMATIC',
  'maximum_events_day', '10',
  'multiple_line_event', 'Y',
  'responsive_list_view', 'Y',
  'show_time', 'N',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'START_DATE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_imp_page.create_page(
 p_id=>3
,p_name=>'Event Search'
,p_alias=>'EVENT-SEARCH'
,p_step_title=>'Event Search'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2528119710305719084
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'22'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260518094207Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609839834528825954)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(1609803745059825410)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260505092759Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092759Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609833858499825726)
,p_plug_name=>'Button Bar'
,p_static_id=>'button-bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_plug_source=>'<div id="active_facets"></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609830804328825715)
,p_plug_name=>'Search'
,p_static_id=>'search'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'ABOVE'
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(1609830708794825715)
,p_landmark_label=>'Filters'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'current_facets_selector', '#active_facets',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'E',
  'show_total_row_count', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609833191266825725)
,p_name=>'P3_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1609830804328825715)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609832760871825724)
,p_name=>'P3_EVENT_TYPE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1609830804328825715)
,p_prompt=>'Event Type'
,p_source=>'EVENT_TYPE_ID'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'EV_EVENT_TYPES.NAME'
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609831330776825717)
,p_name=>'P3_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1609830804328825715)
,p_prompt=>'Search'
,p_source=>'VENUE_ID,EVENT_TYPE_ID,NAME,DESCRIPTION,CREATED_BY'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609833549762825726)
,p_name=>'P3_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1609830804328825715)
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609832026829825722)
,p_name=>'P3_VENUE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1609830804328825715)
,p_prompt=>'Venue'
,p_source=>'VENUE_ID'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'EV_VENUES.NAME'
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609830708794825715)
,p_plug_name=>'Events'
,p_static_id=>'search-results'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3372714138756020509
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ee.id,',
'   ee.venue_id,',
'   evv.name           as venue_name,',
'   ee.event_type_id,',
'   eet.name           as event_type_name,',
'   ee.name,',
'   ee.description,',
'   ee.start_date,',
'   ee.end_date,',
'   ee.created,',
'   ee.created_by,',
'   ee.updated,',
'   ee.updated_by',
'from ev_events        ee',
'join ev_venues        evv',
'on ee.venue_id = evv.id',
'join ev_event_types   eet',
'on ee.event_type_id = eet.id'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'AVATAR_ICON', 'fa-calender-month',
  'AVATAR_SHAPE', 't-Avatar--rounded',
  'AVATAR_TYPE', 'icon',
  'BADGE_ALIGNMENT', 't-ContentRow-badge--alignCenter',
  'BADGE_COL_WIDTH', 't-ContentRow-badge--md',
  'BADGE_LABEL', '&EVENT_TYPE_ID.',
  'BADGE_LABEL_DISPLAY', 'N',
  'BADGE_POS', 't-ContentRow-badge--posEnd',
  'BADGE_VALUE', 'EVENT_TYPE_NAME',
  'DESCRIPTION', wwv_flow_string.join(wwv_flow_t_varchar2(
    '<span>&DESCRIPTION.</span><br>',
    '<span><strong>Start Date:</strong> <span>&START_DATE.</span></span>',
    '<span style="margin-left: 20px;"><strong>End Date:</strong> <span>&END_DATE.</span></span>')),
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'Y',
  'HIDE_BORDERS', 'N',
  'REMOVE_PADDING', 'N',
  'STACK_MOBILE', 'N',
  'TITLE', '&NAME.')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092759Z')
,p_updated_on=>wwv_flow_imp.dz('20260518092221Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1610716479976561408)
,p_name=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED'
,p_data_type=>'DATE'
,p_display_sequence=>80
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
,p_updated_on=>wwv_flow_imp.dz('20260505094944Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1610716516804561409)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>90
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
,p_updated_on=>wwv_flow_imp.dz('20260505094944Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1610716127658561405)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
,p_updated_on=>wwv_flow_imp.dz('20260505094944Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1610716391339561407)
,p_name=>'END_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'END_DATE'
,p_data_type=>'DATE'
,p_display_sequence=>70
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
,p_updated_on=>wwv_flow_imp.dz('20260505094944Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1610715920521561403)
,p_name=>'EVENT_TYPE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_TYPE_ID'
,p_data_type=>'NUMBER'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
,p_updated_on=>wwv_flow_imp.dz('20260505094944Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1610716976793561413)
,p_name=>'EVENT_TYPE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_TYPE_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>130
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
,p_updated_on=>wwv_flow_imp.dz('20260505094944Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1610715791304561401)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_updated_on=>wwv_flow_imp.dz('20260505094944Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1610716063036561404)
,p_name=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
,p_updated_on=>wwv_flow_imp.dz('20260505094944Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1610716210952561406)
,p_name=>'START_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'START_DATE'
,p_data_type=>'DATE'
,p_display_sequence=>60
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
,p_updated_on=>wwv_flow_imp.dz('20260505094944Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1610716644283561410)
,p_name=>'UPDATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED'
,p_data_type=>'DATE'
,p_display_sequence=>100
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
,p_updated_on=>wwv_flow_imp.dz('20260505094944Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1610716793989561411)
,p_name=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>110
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
,p_updated_on=>wwv_flow_imp.dz('20260505094944Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1610715816232561402)
,p_name=>'VENUE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VENUE_ID'
,p_data_type=>'NUMBER'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
,p_updated_on=>wwv_flow_imp.dz('20260505094944Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(1610716856435561412)
,p_name=>'VENUE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VENUE_NAME'
,p_data_type=>'VARCHAR2'
,p_display_sequence=>120
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_available_clientside=>false
,p_updated_on=>wwv_flow_imp.dz('20260505094944Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(1610717008260561414)
,p_region_id=>wwv_flow_imp.id(1609830708794825715)
,p_position_id=>350199314123390058
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:P5_ID:&ID.'
,p_created_on=>wwv_flow_imp.dz('20260508044649Z')
,p_updated_on=>wwv_flow_imp.dz('20260518092221Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1610717204807561416)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1609839834528825954)
,p_button_name=>'EVENT_ASSISTANT'
,p_static_id=>'event-assistant'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Event Assistant'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chatbot'
,p_created_on=>wwv_flow_imp.dz('20260508064657Z')
,p_updated_on=>wwv_flow_imp.dz('20260518094207Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(1610717308020561417)
,p_button_id=>wwv_flow_imp.id(1610717204807561416)
,p_action_sequence=>10
,p_name=>'Event Assistant'
,p_action=>'NATIVE_OPEN_AI_ASSISTANT'
,p_static_id=>'event-assistant'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'DIALOG',
  'quick_action_message1', 'List all AI events',
  'quick_action_message2', 'List any Oracle APEX events',
  'title', 'Event Assistant')).to_clob
,p_ai_agent_id=>wwv_flow_imp.id(1977495326856825505)
,p_created_on=>wwv_flow_imp.dz('20260508064657Z')
,p_updated_on=>wwv_flow_imp.dz('20260518094207Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609834300432825727)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1609833858499825726)
,p_button_name=>'RESET'
,p_static_id=>'reset'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:RR,3::'
,p_icon_css_classes=>'fa-undo'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_imp_page.create_page(
 p_id=>4
,p_name=>'Events'
,p_alias=>'EVENTS'
,p_step_title=>'Events'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609865309760826854)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(1609803745059825410)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092808Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609858217782826824)
,p_plug_name=>'Events'
,p_static_id=>'events'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'EV_EVENTS'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(1609858308345826824)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.:RP:P5_ID:\#ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>1609858308345826824
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609862415964826845)
,p_db_column_name=>'CREATED'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609862829727826846)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609861227832826839)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609862023059826843)
,p_db_column_name=>'END_DATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'End Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609860491544826835)
,p_db_column_name=>'EVENT_TYPE_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Event Type'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(1609832329461825722)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609859686150826829)
,p_db_column_name=>'ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609860865289826837)
,p_db_column_name=>'NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609861683682826841)
,p_db_column_name=>'START_DATE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Start Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609863275748826848)
,p_db_column_name=>'UPDATED'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609863653342826850)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609860019356826832)
,p_db_column_name=>'VENUE_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Venue'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(1609831694142825719)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1609872802609826872)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VENUE_ID:EVENT_TYPE_ID:NAME:DESCRIPTION:START_DATE:END_DATE'
,p_sort_column_1=>'VENUE_ID'
,p_sort_direction_1=>'ASC'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609864094903826852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1609858217782826824)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.:5::'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092808Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1609864455407826852)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(1609858217782826824)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092808Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1609864810057826853)
,p_event_id=>wwv_flow_imp.id(1609864455407826852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1609858217782826824)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092808Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_imp_page.create_page(
 p_id=>5
,p_name=>'Edit Event'
,p_alias=>'EDIT-EVENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Event'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260505092806Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260518094827Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609854179665826816)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092808Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609845354633826581)
,p_plug_name=>'Event'
,p_static_id=>'edit-event'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'EV_EVENTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260505092806Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609854598953826817)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1609854179665826816)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092808Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(1609855055063826818)
,p_button_id=>wwv_flow_imp.id(1609854598953826817)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092808Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609856339294826820)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(1609854179665826816)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P5_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092808Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609855515417826819)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(1609854179665826816)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P5_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092808Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1610717423469561418)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_button_name=>'GENERATE_DESCRIPTION'
,p_static_id=>'generate-description'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generate Description'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-text'
,p_grid_new_row=>'Y'
,p_created_on=>wwv_flow_imp.dz('20260509123248Z')
,p_updated_on=>wwv_flow_imp.dz('20260518094827Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(1610717537821561419)
,p_button_id=>wwv_flow_imp.id(1610717423469561418)
,p_action_sequence=>10
,p_name=>'Generate Description'
,p_action=>'NATIVE_GENERATE_TEXT_AI'
,p_static_id=>'generate-description'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_value_item', 'P5_ID',
  'input_value_type', 'ITEM',
  'suppress_change_event', 'N',
  'use_response_item', 'P5_DESCRIPTION',
  'use_response_type', 'ITEM')).to_clob
,p_stop_execution_on_error=>true
,p_wait_for_result=>true
,p_ai_agent_id=>wwv_flow_imp.id(1977495326856825505)
,p_ai_items_to_submit=>'P5_ID,P5_DESCRIPTION'
,p_created_on=>wwv_flow_imp.dz('20260509124137Z')
,p_updated_on=>wwv_flow_imp.dz('20260509124552Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609855989457826820)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(1609854179665826816)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P5_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092808Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609849201002826809)
,p_name=>'P5_CREATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_item_source_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_source=>'CREATED'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260509123248Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609849659695826810)
,p_name=>'P5_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_item_source_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260509123248Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609848010388826806)
,p_name=>'P5_DESCRIPTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_item_source_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609848869303826808)
,p_name=>'P5_END_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_item_source_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_prompt=>'End Date'
,p_source=>'END_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260509123248Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609847235688826805)
,p_name=>'P5_EVENT_TYPE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_item_source_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_prompt=>'Event Type'
,p_source=>'EVENT_TYPE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'EV_EVENT_TYPES.NAME'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609845739336826582)
,p_name=>'P5_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_item_source_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_source=>'ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260509124137Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609847633484826806)
,p_name=>'P5_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_item_source_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_prompt=>'Name'
,p_source=>'NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609848440773826807)
,p_name=>'P5_START_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_item_source_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_prompt=>'Start Date'
,p_source=>'START_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260509123248Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609850089283826810)
,p_name=>'P5_UPDATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_item_source_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_source=>'UPDATED'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260509123248Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609850494391826811)
,p_name=>'P5_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_item_source_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260509123248Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609846853425826803)
,p_name=>'P5_VENUE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_item_source_plug_id=>wwv_flow_imp.id(1609845354633826581)
,p_prompt=>'Venue'
,p_source=>'VENUE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'EV_VENUES.NAME'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609857518171826822)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1609857518171826822
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092808Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609856734266826821)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(1609845354633826581)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Edit Event'
,p_static_id=>'initialize-form-edit-event'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>1609856734266826821
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092808Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609857193483826821)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(1609845354633826581)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Edit Event'
,p_static_id=>'process-form-edit-event'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1609857193483826821
,p_created_on=>wwv_flow_imp.dz('20260505092808Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092808Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_imp_page.create_page(
 p_id=>9999
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'Event Management - Log In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2102634289808461002
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'12'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609810127371825676)
,p_plug_name=>'Event Management'
,p_static_id=>'event-management'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2675634334296186762
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609812169535825681)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(1609810127371825676)
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
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609811013180825679)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1609810127371825676)
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
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609811871515825680)
,p_name=>'P9999_PERSISTENT_AUTH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1609810127371825676)
,p_prompt=>'Remember me'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_display_when=>'apex_authentication.persistent_auth_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>2042262243893469891
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609811453479825680)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1609810127371825676)
,p_prompt=>'Remember username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_display_when=>'apex_authentication.persistent_cookies_enabled and not apex_authentication.persistent_auth_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>2042262243893469891
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609810629650825678)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1609810127371825676)
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
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609816233854825687)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_static_id=>'clear-page-s-cache'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1609816233854825687
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609815858866825686)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_static_id=>'get-username-cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1609815858866825686
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609812579948825682)
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
,p_internal_uid=>1609812579948825682
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1609813544976825683)
,p_page_process_id=>wwv_flow_imp.id(1609812579948825682)
,p_page_id=>9999
,p_name=>'p_password'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_PASSWORD'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1609814080299825684)
,p_page_process_id=>wwv_flow_imp.id(1609812579948825682)
,p_page_id=>9999
,p_name=>'p_set_persistent_auth'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>3
,p_value_type=>'ITEM'
,p_value=>'P9999_PERSISTENT_AUTH'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1609813045339825683)
,p_page_process_id=>wwv_flow_imp.id(1609812579948825682)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'ITEM'
,p_value=>'P9999_USERNAME'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609814489093825685)
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
,p_internal_uid=>1609814489093825685
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1609815435509825686)
,p_page_process_id=>wwv_flow_imp.id(1609814489093825685)
,p_page_id=>9999
,p_name=>'p_consent'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_REMEMBER'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1609814927011825685)
,p_page_process_id=>wwv_flow_imp.id(1609814489093825685)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'lower( :P9999_USERNAME )'
,p_created_on=>wwv_flow_imp.dz('20260505092757Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092757Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_10000
begin
wwv_flow_imp_page.create_page(
 p_id=>10000
,p_name=>'Administration'
,p_alias=>'ADMINISTRATION'
,p_step_title=>'Administration'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(1609809555559825669)
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(1609808901660825665)
,p_protection_level=>'C'
,p_deep_linking=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The administration page allows application owners (Administrators) to configure the application and maintain common data used across the application.',
'By selecting one of the available settings, administrators can potentially change how the application is displayed and/or features available to the end users.</p>',
'<p>Access to this page should be limited to Administrators only.</p>'))
,p_page_component_map=>'03'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609938340570827036)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(1609803745059825410)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609940401971827041)
,p_plug_name=>'Column 2'
,p_static_id=>'column-2'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>3372714138756020509
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609940800173827042)
,p_plug_name=>'Feedback'
,p_static_id=>'feedback'
,p_parent_plug_id=>wwv_flow_imp.id(1609940401971827041)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_num_rows=>15
,p_required_patch=>wwv_flow_imp.id(1609807965143825660)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609943083699827066)
,p_plug_name=>'Feedback'
,p_static_id=>'feedback-2'
,p_parent_plug_id=>wwv_flow_imp.id(1609940800173827042)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_list_id=>wwv_flow_imp.id(1609939176622827037)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2069471208528591807
,p_plug_query_num_rows=>15
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1609941314997827044)
,p_name=>'Report'
,p_static_id=>'report'
,p_parent_plug_id=>wwv_flow_imp.id(1609940800173827042)
,p_template=>4073835273271169698
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--stacked:t-Region--scrollBody:t-Region--noPadding'
,p_component_template_options=>'#DEFAULT#:t-AVPList--rightAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select l.display_value                              as feedback_status, ',
'       (select count(*)',
'          from apex_team_feedback f',
'         where f.application_id  = :APP_ID',
'           and f.feedback_status = l.return_value ) as feedback_count ',
'  from apex_application_lov_entries l',
' where l.application_id      = :APP_ID',
'   and l.list_of_values_name = ''FEEDBACK_STATUS''',
' order by 2 desc, 1'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2101991461423792139
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1609942448731827062)
,p_query_column_id=>2
,p_column_alias=>'FEEDBACK_COUNT'
,p_column_display_sequence=>2
,p_column_heading=>'Feedback Count'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1609942004593827061)
,p_query_column_id=>1
,p_column_alias=>'FEEDBACK_STATUS'
,p_column_display_sequence=>1
,p_column_heading=>'Feedback Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_10010
begin
wwv_flow_imp_page.create_page(
 p_id=>10010
,p_name=>'Feedback'
,p_alias=>'FEEDBACK'
,p_page_mode=>'MODAL'
,p_step_title=>'Feedback'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(1609809555559825669)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.feedback-positive, .feedback-negative, .feedback-neutral { padding: 8px; border-radius: 100%; background-color: white; margin: 4px; }',
'.feedback-positive { color: var(--ut-feedback-positive-text-color, var(--ut-palette-success)); }',
'.feedback-neutral { color: var(--ut-feedback-neutral-text-color, var(--ut-palette-warning)); }',
'.feedback-negative { color: var(--ut-feedback-negative-text-color, var(--ut-palette-danger)); }'))
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(1609807965143825660)
,p_dialog_width=>'480'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609892027659826906)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609891986547826906)
,p_plug_name=>'Form on Feedback'
,p_static_id=>'form-on-feedback'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609895198261826918)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1609892027659826906)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(1609895681210826918)
,p_button_id=>wwv_flow_imp.id(1609895198261826918)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609892112204826906)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1609892027659826906)
,p_button_name=>'SUBMIT'
,p_static_id=>'submit'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Feedback'
,p_button_position=>'CREATE'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(1609903443677826930)
,p_branch_action=>'f?p=&APP_ID.:10011:&APP_SESSION.::&DEBUG.:RP::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609896103642826919)
,p_name=>'P10010_APPLICATION_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1609891986547826906)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609899652217826924)
,p_name=>'P10010_ATTACHMENT_BLOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1609891986547826906)
,p_prompt=>'Attachment'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_display_when=>'nvl(apex_app_setting.get_value( p_name => ''FEEDBACK_ATTACHMENTS_YN'' ),''N'') = ''Y'''
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>1610598304472262251
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'allow_multiple_files', 'N',
  'display_as', 'INLINE',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609899299096826924)
,p_name=>'P10010_FEEDBACK'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1609891986547826906)
,p_prompt=>'Feedback'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>1610598304472262251
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609896594383826919)
,p_name=>'P10010_PAGE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1609891986547826906)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609897364655826920)
,p_name=>'P10010_RATING'
,p_item_sequence=>35
,p_item_plug_id=>wwv_flow_imp.id(1609891986547826906)
,p_prompt=>'Experience'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'FEEDBACK_RATING'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '3',
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609896952902826920)
,p_name=>'P10010_USER_AGENT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1609891986547826906)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sys.owa_util.get_cgi_env(''user-agent'') x',
'from sys.dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(1609902982479826929)
,p_validation_name=>'At least One Feedback Required'
,p_static_id=>'at-least-one-feedback-required'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P10010_FEEDBACK is null and :P10010_RATING is null then',
'    return false;',
'else',
'    return true;',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Please provide feedback or your experience.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609900024036826925)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Submit Feedback'
,p_static_id=>'submit-feedback'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'APEX_UTIL',
  'package_method', 'SUBMIT_FEEDBACK',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1609892112204826906)
,p_process_success_message=>'Feedback Submitted'
,p_internal_uid=>1609900024036826925
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1609901039857826926)
,p_page_process_id=>wwv_flow_imp.id(1609900024036826925)
,p_page_id=>10010
,p_name=>'p_application_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'APP_ID'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1609902543985826928)
,p_page_process_id=>wwv_flow_imp.id(1609900024036826925)
,p_page_id=>10010
,p_name=>'p_attachment_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>5
,p_value_type=>'ITEM'
,p_value=>'P10010_ATTACHMENT_BLOB'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1609900577501826926)
,p_page_process_id=>wwv_flow_imp.id(1609900024036826925)
,p_page_id=>10010
,p_name=>'p_comment'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>1
,p_value_type=>'ITEM'
,p_value=>'P10010_FEEDBACK'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1609901569363826927)
,p_page_process_id=>wwv_flow_imp.id(1609900024036826925)
,p_page_id=>10010
,p_name=>'p_page_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>3
,p_value_type=>'ITEM'
,p_value=>'P10010_PAGE_ID'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1609902019694826927)
,p_page_process_id=>wwv_flow_imp.id(1609900024036826925)
,p_page_id=>10010
,p_name=>'p_rating'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>true
,p_display_sequence=>4
,p_value_type=>'ITEM'
,p_value=>'P10010_RATING'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_10011
begin
wwv_flow_imp_page.create_page(
 p_id=>10011
,p_name=>'Feedback Submitted'
,p_alias=>'FEEDBACK-SUBMITTED'
,p_page_mode=>'MODAL'
,p_step_title=>'Feedback Submitted'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(1609809555559825669)
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(1609807965143825660)
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'11'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609892565136826906)
,p_plug_name=>'Feedback Submitted'
,p_static_id=>'feedback-submitted'
,p_icon_css_classes=>'fa-check-circle'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--customIcons:t-Alert--success'
,p_escape_on_http_output=>'Y'
,p_plug_template=>2042159785845301134
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609892407312826906)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(1609892565136826906)
,p_button_name=>'CLOSE'
,p_static_id=>'close'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'w40p'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(1609904629813826932)
,p_button_id=>wwv_flow_imp.id(1609892407312826906)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_10012
begin
wwv_flow_imp_page.create_page(
 p_id=>10012
,p_name=>'Feedback Settings'
,p_alias=>'FEEDBACK-SETTINGS'
,p_page_mode=>'MODAL'
,p_step_title=>'Feedback Settings'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(1609809555559825669)
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(1609808901660825665)
,p_required_patch=>wwv_flow_imp.id(1609807965143825660)
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_help_text=>'<p><strong>Enable Attachments</strong> - If yes, users will be able to upload an attachment in support of their feedback.</p>'
,p_page_component_map=>'16'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609892896849826906)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609892770540826906)
,p_plug_name=>'Form Items Region'
,p_static_id=>'form-items-region'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609906349733826934)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1609892896849826906)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(1609906871586826935)
,p_button_id=>wwv_flow_imp.id(1609906349733826934)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609892942664826906)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1609892896849826906)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609907347350826935)
,p_name=>'P10012_FEEDBACK_ATTACHMENTS_YN'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1609892770540826906)
,p_prompt=>'Enable Attachments'
,p_source=>'apex_app_setting.get_value( p_name  => ''FEEDBACK_ATTACHMENTS_YN'' )'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_label_column_span=>3
,p_field_template=>2320077351817916916
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609908122143826937)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1609908122143826937
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609907728221826936)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update'
,p_static_id=>'update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_app_setting.set_value(',
'    p_name  => ''FEEDBACK_ATTACHMENTS_YN'',',
'    p_value => :P10012_FEEDBACK_ATTACHMENTS_YN );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1609892942664826906)
,p_process_success_message=>'Configuration Options updated. '
,p_internal_uid=>1609907728221826936
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_10013
begin
wwv_flow_imp_page.create_page(
 p_id=>10013
,p_name=>'Manage Feedback'
,p_alias=>'MANAGE-FEEDBACK'
,p_page_mode=>'MODAL'
,p_step_title=>'Manage Feedback'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(1609809555559825669)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Color feedback rating icons */',
'.feedback-positive { color: var(--ut-feedback-positive-text-color, var(--ut-palette-success)); }',
'.feedback-neutral { color: var(--ut-feedback-neutral-text-color, var(--ut-palette-warning)); }',
'.feedback-negative { color: var(--ut-feedback-negative-text-color, var(--ut-palette-danger)); }'))
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_role=>wwv_flow_imp.id(1609808901660825665)
,p_required_patch=>wwv_flow_imp.id(1609807965143825660)
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Feedback can be entered by end users from any normal page within the application.</p>',
'<p>This report shows the feedback entered, any response enter by administrators, and the status of the feedback.</p>',
'<p>Click the edit icon (yellow pencil) to enter a response or update the feedback status.</p>',
'<p><em><strong>Note:</strong> If feedback recipients have been defined then feedback submissions will also be emailed to the email addresses in the feedback recipients list.</em></p>'))
,p_page_component_map=>'18'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609893876078826906)
,p_plug_name=>'Manage Feedback'
,p_static_id=>'manage-feedback'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select feedback_id id,',
'    page_id||''. ''||page_name page_name,',
'    created_on created,',
'    lower(created_by) created_by,',
'    feedback,',
'    feedback_rating rating,',
'    case feedback_rating',
'      when 1 then ''fa-frown-o feedback-negative'' ',
'      when 2 then ''fa-emoji-neutral feedback-neutral''  ',
'      when 3 then ''fa-smile-o feedback-positive''',
'    end rating_icon,',
'    feedback_status status,',
'    public_response response,',
'    http_user_agent user_agent,',
'    updated_on updated,',
'    lower(updated_by) updated_by,',
'    page_id,',
'    (select ''<a href="''||apex_util.get_blob_file_src(''P10013_ATTACHMENT'',id)||''">''|| filename ||''</a>''',
'       from apex$team_dev_files',
'      where component_id = f.feedback_id',
'        and component_type = ''FEEDBACK'') download_attachment',
'from apex_team_feedback f',
'where application_id = :APP_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(1609921131502826955)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:10014:&APP_SESSION.::&DEBUG.:RP:P10014_ID:\#ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>1609921131502826955
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609923150003826975)
,p_db_column_name=>'CREATED'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Filed'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609923528944826977)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Filed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609927535574826997)
,p_db_column_name=>'DOWNLOAD_ATTACHMENT'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Attachment'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609923916643826979)
,p_db_column_name=>'FEEDBACK'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Feedback'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609922342458826970)
,p_db_column_name=>'ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609927187490826995)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Page'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609922791713826973)
,p_db_column_name=>'PAGE_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Page'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609924330301826981)
,p_db_column_name=>'RATING'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Rating'
,p_column_html_expression=>'<span class="fa #RATING_ICON#" aria-hidden="true" title="#RATING#"></span>'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(1609897400995826920)
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609924708061826983)
,p_db_column_name=>'RATING_ICON'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'RATING ICON'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609925541904826987)
,p_db_column_name=>'RESPONSE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Response'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609925112345826985)
,p_db_column_name=>'STATUS'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(1609913531238826944)
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609926319881826991)
,p_db_column_name=>'UPDATED'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609926789720826993)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1609925919776826989)
,p_db_column_name=>'USER_AGENT'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'User Agent'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1609932591510827012)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PAGE_NAME:CREATED:CREATED_BY:FEEDBACK:RATING:STATUS:RESPONSE:UPDATED:UPDATED_BY'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609933265238827018)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(1609893876078826906)
,p_button_name=>'RESET_REPORT'
,p_static_id=>'reset-report'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&APP_SESSION.::&DEBUG.:&APP_PAGE_ID.,RR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609933677068827018)
,p_name=>'P10013_ATTACHMENT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1609893876078826906)
,p_use_cache_before_default=>'NO'
,p_source=>'FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_display_when_type=>'NEVER'
,p_field_template=>2042262243893469891
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'blob_last_updated_column', 'UPDATED',
  'character_set_column', 'FILE_CHARSET',
  'content_disposition', 'inline',
  'display_as', 'INLINE',
  'display_download_link', 'Y',
  'filename_column', 'FILENAME',
  'mime_type_column', 'FILE_MIMETYPE',
  'storage_type', 'DB_COLUMN')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1609893746706826906)
,p_name=>'Refresh Report'
,p_static_id=>'refresh-report'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(1609893876078826906)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1609934345858827020)
,p_event_id=>wwv_flow_imp.id(1609893746706826906)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1609893876078826906)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609934895612827021)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Get File ID'
,p_static_id=>'get-file-id'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'primary_key_column', 'ID',
  'primary_key_item', 'P10013_ID',
  'table_name', 'APEX$TEAM_DEV_FILES')).to_clob
,p_internal_uid=>1609934895612827021
,p_created_on=>wwv_flow_imp.dz('20260505092810Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092810Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_10014
begin
wwv_flow_imp_page.create_page(
 p_id=>10014
,p_name=>'Feedback'
,p_alias=>'FEEDBACK1'
,p_page_mode=>'MODAL'
,p_step_title=>'Feedback'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(1609809555559825669)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Color feedback rating icons */',
'.feedback-positive { color: var(--ut-feedback-positive-text-color, var(--ut-palette-success)); }',
'.feedback-neutral { color: var(--ut-feedback-neutral-text-color, var(--ut-palette-warning)); }',
'.feedback-negative { color: var(--ut-feedback-negative-text-color, var(--ut-palette-danger)); }'))
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(1609808901660825665)
,p_required_patch=>wwv_flow_imp.id(1609807965143825660)
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609893273792826906)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609893164498826906)
,p_plug_name=>'Form Items Region'
,p_static_id=>'form-items-region'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609909762160826939)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1609893273792826906)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(1609910219676826939)
,p_button_id=>wwv_flow_imp.id(1609909762160826939)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609893511077826906)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(1609893273792826906)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'EDIT'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P10014_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609893379177826906)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1609893273792826906)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609915721334826948)
,p_name=>'P10014_ATTACHMENT_DISPLAY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1609893164498826906)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Attachment'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''<a href="''||apex_util.get_blob_file_src(''P10013_ATTACHMENT'',id)||''">''||filename||''</a>''',
'  from apex$team_dev_files',
' where component_id   = :P10014_ID',
'   and component_type = ''FEEDBACK'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'select 1 from apex$team_dev_files where component_id = :P10014_ID and component_type = ''FEEDBACK'''
,p_display_when_type=>'EXISTS'
,p_field_template=>1610598304472262251
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML',
  'send_on_page_submit', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609912627405826943)
,p_name=>'P10014_FEEDBACK'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1609893164498826906)
,p_prompt=>'Feedback'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609913454905826944)
,p_name=>'P10014_FEEDBACK_STATUS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1609893164498826906)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'FEEDBACK_STATUS'
,p_field_template=>1610598304472262251
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609911846505826941)
,p_name=>'P10014_FILED'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1609893164498826906)
,p_prompt=>'Filed'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609911000110826940)
,p_name=>'P10014_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1609893164498826906)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609911454800826941)
,p_name=>'P10014_PAGE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1609893164498826906)
,p_prompt=>'Page'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609912201092826942)
,p_name=>'P10014_RATING_ICON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1609893164498826906)
,p_prompt=>'Rating'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML',
  'send_on_page_submit', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609913091546826943)
,p_name=>'P10014_RESPONSE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1609893164498826906)
,p_prompt=>'Response'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>1610598304472262251
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609916163006826949)
,p_name=>'P10014_USER_AGENT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1609893164498826906)
,p_prompt=>'User Agent'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609919777318826953)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_static_id=>'clear-page-s-cache'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1609893511077826906)
,p_internal_uid=>1609919777318826953
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609920149231826953)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1609920149231826953
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609918883288826952)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Delete Feedback'
,p_static_id=>'delete-feedback'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'APEX_UTIL',
  'package_method', 'DELETE_FEEDBACK',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1609893511077826906)
,p_process_success_message=>'Feedback Deleted'
,p_internal_uid=>1609918883288826952
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1609919303909826952)
,p_page_process_id=>wwv_flow_imp.id(1609918883288826952)
,p_page_id=>10014
,p_name=>'p_feedback_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'ITEM'
,p_value=>'P10014_ID'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609916546949826949)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Data'
,p_static_id=>'load-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for l_feedback in (',
'   select page_id,',
'          page_name,',
'          case feedback_rating',
'                when 1 then ''<span class="fa fa-frown-o feedback-negative" aria-hidden="true" title="Negative"></span>'' ',
'                when 2 then ''<span class="fa fa-emoji-neutral feedback-neutral" aria-hidden="true" title="Neutral"></span>''  ',
'                when 3 then ''<span class="fa fa-smile-o feedback-positive" aria-hidden="true" title="Positive"></span>'' ',
'                end rating_icon,',
'          lower(created_by) || '' - '' || apex_util.get_since(created_on) filed,',
'          feedback,',
'          public_response,',
'          feedback_status,',
'          http_user_agent',
'     from apex_team_feedback',
'    where feedback_id = :P10014_ID )',
'loop',
'   :P10014_PAGE_ID         := l_feedback.page_id||''. ''||l_feedback.page_name;',
'   :P10014_FILED           := l_feedback.filed;',
'   :P10014_RATING_ICON     := l_feedback.rating_icon;',
'   :P10014_FEEDBACK        := l_feedback.feedback;',
'   :P10014_RESPONSE        := l_feedback.public_response;',
'   :P10014_FEEDBACK_STATUS := l_feedback.feedback_status;',
'   :P10014_USER_AGENT      := l_feedback.http_user_agent;',
'end loop;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1609916546949826949
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1609916977828826950)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Reply to Feedback'
,p_static_id=>'reply-to-feedback'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'APEX_UTIL',
  'package_method', 'REPLY_TO_FEEDBACK',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1609893379177826906)
,p_process_success_message=>'Action Processed.'
,p_internal_uid=>1609916977828826950
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1609917493805826951)
,p_page_process_id=>wwv_flow_imp.id(1609916977828826950)
,p_page_id=>10014
,p_name=>'p_feedback_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'ITEM'
,p_value=>'P10014_ID'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1609918495748826951)
,p_page_process_id=>wwv_flow_imp.id(1609916977828826950)
,p_page_id=>10014
,p_name=>'p_public_response'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>3
,p_value_type=>'ITEM'
,p_value=>'P10014_RESPONSE'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1609917930936826951)
,p_page_process_id=>wwv_flow_imp.id(1609916977828826950)
,p_page_id=>10014
,p_name=>'p_status'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>true
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P10014_FEEDBACK_STATUS'
,p_created_on=>wwv_flow_imp.dz('20260505092809Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092809Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_20000
begin
wwv_flow_imp_page.create_page(
 p_id=>20000
,p_name=>'Settings'
,p_alias=>'SETTINGS'
,p_page_mode=>'MODAL'
,p_step_title=>'Settings'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(1609943443382827068)
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--md'
,p_required_patch=>wwv_flow_imp.id(1609943921714827070)
,p_protection_level=>'C'
,p_help_text=>'This page contains a list of settings applicable to the current application user.'
,p_page_component_map=>'23'
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609948675693827083)
,p_plug_name=>'&APP_USER.'
,p_static_id=>'app-user'
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--hideIcon'
,p_plug_template=>2675494171183407654
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from apex_application_auth ',
' where application_id            = :APP_ID ',
'   and is_current_authentication = ''Y'' ',
'   and scheme_type_code          = ''NATIVE_APEX_ACCOUNTS'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609949091591827084)
,p_plug_name=>'&APP_USER.'
,p_static_id=>'app-user-2'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2074200852440250129
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'APEX_WORKSPACE_APEX_USERS'
,p_query_where=>'user_name = :APP_USER and workspace_id = :WORKSPACE_ID'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'  from apex_application_auth ',
' where application_id            = :APP_ID ',
'   and is_current_authentication = ''Y'' ',
'   and scheme_type_code          = ''NATIVE_APEX_ACCOUNTS'''))
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(1609949547509827084)
,p_region_id=>wwv_flow_imp.id(1609949091591827084)
,p_layout_type=>'ROW'
,p_card_css_classes=>'a-CardView--noUI'
,p_title_adv_formatting=>false
,p_title_column_name=>'USER_NAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'EMAIL'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'EMAIL'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609950085581827085)
,p_plug_name=>'Settings'
,p_static_id=>'settings'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_list_id=>wwv_flow_imp.id(1609947599782827079)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2069471208528591807
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_20010
begin
wwv_flow_imp_page.create_page(
 p_id=>20010
,p_name=>'Push Notifications'
,p_alias=>'PUSH-NOTIFICATIONS'
,p_page_mode=>'MODAL'
,p_step_title=>'Settings - Push Notifications'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(1609943443382827068)
,p_javascript_code_onload=>'apex.pwa.initPushSubscriptionPage();'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_patch=>wwv_flow_imp.id(1609943600940827069)
,p_protection_level=>'C'
,p_help_text=>'This page contains the settings for controlling push notification subscription for the current user.'
,p_page_component_map=>'17'
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609945322562827074)
,p_plug_name=>'Push Notifications'
,p_static_id=>'push-notifications'
,p_region_css_classes=>'a-pwaPush--subscriptionRegion'
,p_icon_css_classes=>'fa-bell-o'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--wizard:t-Alert--customIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark:t-Form--xlarge'
,p_plug_template=>2042159785845301134
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Push notifications have to be enabled for each device you want to receive the notifications on. The first time you enable push notifications, you will have to grant permission to your browser. This setting can be changed at any time.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1609944902481827073)
,p_plug_name=>'Push Notifications Not Supported'
,p_static_id=>'push-notifications-not-supported'
,p_region_css_classes=>'a-pwaPush--subscriptionRegion--not-supported u-DisplayNone'
,p_icon_css_classes=>'fa-bell-slash-o'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--wizard:t-Alert--customIcons:t-Alert--warning:t-Alert--removeHeading js-removeLandmark:t-Form--xlarge'
,p_plug_template=>2042159785845301134
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Push notifications are not currently supported in your browser.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1609944537330827072)
,p_button_sequence=>10
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Settings'
,p_button_redirect_url=>'f?p=&APP_ID.:20000:&APP_SESSION.::&DEBUG.:::'
,p_button_css_classes=>'t-Button--inlineLink'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_row=>'Y'
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1609945828020827075)
,p_name=>'P20010_ENABLE_PUSH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1609945322562827074)
,p_prompt=>'Enable push notifications on this device'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1609946156830827076)
,p_name=>'Change P20010_ENABLE_PUSH'
,p_static_id=>'change-p20010-enable-push'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20010_ENABLE_PUSH'
,p_condition_element=>'P20010_ENABLE_PUSH'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1609946548905827076)
,p_event_id=>wwv_flow_imp.id(1609946156830827076)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Subscribe to push notifications'
,p_static_id=>'subscribe-to-push-notifications'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.pwa.subscribePushNotifications();')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1609947000484827077)
,p_event_id=>wwv_flow_imp.id(1609946156830827076)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Unsubscribe from push notifications'
,p_static_id=>'unsubscribe-from-push-notifications'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.pwa.unsubscribePushNotifications();')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260505092811Z')
,p_updated_on=>wwv_flow_imp.dz('20260505092811Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(2648543182794315223)
,p_deinstall_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260513184932Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260514054124Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/deployment/install/install_data_model
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '   create table ev_venues ('||wwv_flow.LF||
'    id            number generated by default on null as identity'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2) := '              constraint ev_venues_id_pk primary key,'||wwv_flow.LF||
'    name          varchar2(255 char) not null';
wwv_flow_imp.g_varchar2_table(3) := ','||wwv_flow.LF||
'    address       varchar2(4000 char),'||wwv_flow.LF||
'    capacity      number,'||wwv_flow.LF||
'    created       date not nul';
wwv_flow_imp.g_varchar2_table(4) := 'l,'||wwv_flow.LF||
'    created_by    varchar2(255 char) not null,'||wwv_flow.LF||
'    updated       date not null,'||wwv_flow.LF||
'    updated_by';
wwv_flow_imp.g_varchar2_table(5) := '    varchar2(255 char) not null );'||wwv_flow.LF||
''||wwv_flow.LF||
'    create table ev_event_types ('||wwv_flow.LF||
'    id            number ge';
wwv_flow_imp.g_varchar2_table(6) := 'nerated by default on null as identity'||wwv_flow.LF||
'                  constraint ev_event_types_id_pk primary ke';
wwv_flow_imp.g_varchar2_table(7) := 'y,'||wwv_flow.LF||
'    name          varchar2(255 char) not null,'||wwv_flow.LF||
'    description   varchar2(4000 char),'||wwv_flow.LF||
'    crea';
wwv_flow_imp.g_varchar2_table(8) := 'ted       date not null,'||wwv_flow.LF||
'    created_by    varchar2(255 char) not null,'||wwv_flow.LF||
'    updated       date not';
wwv_flow_imp.g_varchar2_table(9) := ' null,'||wwv_flow.LF||
'    updated_by    varchar2(255 char) not null'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    create table ev_events ('||wwv_flow.LF||
'    id ';
wwv_flow_imp.g_varchar2_table(10) := '            number generated by default on null as identity'||wwv_flow.LF||
'                   constraint ev_events';
wwv_flow_imp.g_varchar2_table(11) := '_id_pk primary key,'||wwv_flow.LF||
'    venue_id       number                   constraint ev_events_venue_id_fk'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(12) := '                  references ev_venues not null,'||wwv_flow.LF||
'    event_type_id  number                   constr';
wwv_flow_imp.g_varchar2_table(13) := 'aint ev_events_event_type_id_fk'||wwv_flow.LF||
'                   references ev_event_types not null,'||wwv_flow.LF||
'    name   ';
wwv_flow_imp.g_varchar2_table(14) := '        varchar2(255 char) not null,'||wwv_flow.LF||
'    description    varchar2(4000 char),'||wwv_flow.LF||
'    start_date     da';
wwv_flow_imp.g_varchar2_table(15) := 'te not null,'||wwv_flow.LF||
'    end_date       date not null,'||wwv_flow.LF||
'    created        date not null,'||wwv_flow.LF||
'    created_by  ';
wwv_flow_imp.g_varchar2_table(16) := '   varchar2(255 char) not null,'||wwv_flow.LF||
'    updated        date not null,'||wwv_flow.LF||
'    updated_by     varchar2(255 ';
wwv_flow_imp.g_varchar2_table(17) := 'char) not null);'||wwv_flow.LF||
'    -- table index'||wwv_flow.LF||
'    create index ev_events_i1 on ev_events (venue_id);'||wwv_flow.LF||
'    cr';
wwv_flow_imp.g_varchar2_table(18) := 'eate index ev_events_i2 on ev_events (event_type_id);'||wwv_flow.LF||
'    create table ev_speakers ('||wwv_flow.LF||
'    id       ';
wwv_flow_imp.g_varchar2_table(19) := '     number generated by default on null as identity'||wwv_flow.LF||
'                  constraint ev_speakers_id_pk';
wwv_flow_imp.g_varchar2_table(20) := ' primary key,'||wwv_flow.LF||
'    name          varchar2(255 char) not null,'||wwv_flow.LF||
'    bio           varchar2(4000 char)';
wwv_flow_imp.g_varchar2_table(21) := ','||wwv_flow.LF||
'    email         varchar2(255 char),'||wwv_flow.LF||
'    phone         varchar2(255 char),'||wwv_flow.LF||
'    created       d';
wwv_flow_imp.g_varchar2_table(22) := 'ate not null,'||wwv_flow.LF||
'    created_by    varchar2(255 char) not null,'||wwv_flow.LF||
'    updated       date not null,'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(23) := ' updated_by    varchar2(255 char) not null);'||wwv_flow.LF||
'    create table ev_attendees ('||wwv_flow.LF||
'    id            num';
wwv_flow_imp.g_varchar2_table(24) := 'ber generated by default on null as identity'||wwv_flow.LF||
'                  constraint ev_attendees_id_pk primar';
wwv_flow_imp.g_varchar2_table(25) := 'y key,'||wwv_flow.LF||
'    name          varchar2(255 char) not null,'||wwv_flow.LF||
'    email         varchar2(255 char),'||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(26) := 'hone         varchar2(255 char),'||wwv_flow.LF||
'    created       date not null,'||wwv_flow.LF||
'    created_by    varchar2(255 c';
wwv_flow_imp.g_varchar2_table(27) := 'har) not null,'||wwv_flow.LF||
'    updated       date not null,'||wwv_flow.LF||
'    updated_by    varchar2(255 char) not null'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(28) := ' );'||wwv_flow.LF||
'    create table ev_sessions ('||wwv_flow.LF||
'    id                    number generated by default on null a';
wwv_flow_imp.g_varchar2_table(29) := 's identity'||wwv_flow.LF||
'                          constraint ev_sessions_id_pk primary key,'||wwv_flow.LF||
'    event_id       ';
wwv_flow_imp.g_varchar2_table(30) := '       number                          constraint ev_sessions_event_id_fk'||wwv_flow.LF||
'                         ';
wwv_flow_imp.g_varchar2_table(31) := ' references ev_events not null,'||wwv_flow.LF||
'    speaker_id            number                          constrain';
wwv_flow_imp.g_varchar2_table(32) := 't ev_sessions_speaker_id_fk'||wwv_flow.LF||
'                          references ev_speakers not null,'||wwv_flow.LF||
'    name   ';
wwv_flow_imp.g_varchar2_table(33) := '               varchar2(255 char) not null,'||wwv_flow.LF||
'    description           varchar2(4000 char),'||wwv_flow.LF||
'    ses';
wwv_flow_imp.g_varchar2_table(34) := 'sion_start_date    date not null,'||wwv_flow.LF||
'    session_end_date      date not null,'||wwv_flow.LF||
'    created            ';
wwv_flow_imp.g_varchar2_table(35) := '   date not null,'||wwv_flow.LF||
'    created_by            varchar2(255 char) not null,'||wwv_flow.LF||
'    updated              ';
wwv_flow_imp.g_varchar2_table(36) := ' date not null,'||wwv_flow.LF||
'    updated_by            varchar2(255 char) not null);'||wwv_flow.LF||
'    -- table index'||wwv_flow.LF||
'    cr';
wwv_flow_imp.g_varchar2_table(37) := 'eate index ev_sessions_i1 on ev_sessions (event_id);'||wwv_flow.LF||
'    create index ev_sessions_i2 on ev_sessions';
wwv_flow_imp.g_varchar2_table(38) := ' (speaker_id);'||wwv_flow.LF||
'    create table ev_event_attendees ('||wwv_flow.LF||
'    id             number generated by defaul';
wwv_flow_imp.g_varchar2_table(39) := 't on null as identity'||wwv_flow.LF||
'                   constraint ev_event_attendees_id_pk primary key,'||wwv_flow.LF||
'    even';
wwv_flow_imp.g_varchar2_table(40) := 't_id       number                   constraint ev_event_attendees_event_id_fk'||wwv_flow.LF||
'                   re';
wwv_flow_imp.g_varchar2_table(41) := 'ferences ev_events not null,'||wwv_flow.LF||
'    attendee_id    number                   constraint ev_event_attend';
wwv_flow_imp.g_varchar2_table(42) := 'ees_attendee_id_fk'||wwv_flow.LF||
'                   references ev_attendees not null,'||wwv_flow.LF||
'    created        date no';
wwv_flow_imp.g_varchar2_table(43) := 't null,'||wwv_flow.LF||
'    created_by     varchar2(255 char) not null,'||wwv_flow.LF||
'    updated        date not null,'||wwv_flow.LF||
'    upd';
wwv_flow_imp.g_varchar2_table(44) := 'ated_by     varchar2(255 char) not null);'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- table index'||wwv_flow.LF||
'    create index ev_event_attendees';
wwv_flow_imp.g_varchar2_table(45) := '_i1 on ev_event_attendees (event_id);'||wwv_flow.LF||
''||wwv_flow.LF||
'    create index ev_event_attendees_i2 on ev_event_attendee';
wwv_flow_imp.g_varchar2_table(46) := 's (attendee_id);'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- triggers'||wwv_flow.LF||
'    create or replace trigger ev_venues_biu'||wwv_flow.LF||
'    before insert ';
wwv_flow_imp.g_varchar2_table(47) := 'or update'||wwv_flow.LF||
'    on ev_venues'||wwv_flow.LF||
'    for each row'||wwv_flow.LF||
'    begin'||wwv_flow.LF||
'    if inserting then'||wwv_flow.LF||
'        :new.create';
wwv_flow_imp.g_varchar2_table(48) := 'd := sysdate;'||wwv_flow.LF||
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(49) := '  end if;'||wwv_flow.LF||
'    :new.updated := sysdate;'||wwv_flow.LF||
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',';
wwv_flow_imp.g_varchar2_table(50) := '''APP_USER''),user);'||wwv_flow.LF||
'    end ev_venues_biu;'||wwv_flow.LF||
'    /'||wwv_flow.LF||
''||wwv_flow.LF||
'    create or replace trigger ev_event_types_bi';
wwv_flow_imp.g_varchar2_table(51) := 'u'||wwv_flow.LF||
'    before insert or update'||wwv_flow.LF||
'    on ev_event_types'||wwv_flow.LF||
'    for each row'||wwv_flow.LF||
'    begin'||wwv_flow.LF||
'    if inserting';
wwv_flow_imp.g_varchar2_table(52) := ' then'||wwv_flow.LF||
'        :new.created := sysdate;'||wwv_flow.LF||
'        :new.created_by := coalesce(sys_context(''APEX$SESSI';
wwv_flow_imp.g_varchar2_table(53) := 'ON'',''APP_USER''),user);'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    :new.updated := sysdate;'||wwv_flow.LF||
'    :new.updated_by := coalesce(s';
wwv_flow_imp.g_varchar2_table(54) := 'ys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end ev_event_types_biu;'||wwv_flow.LF||
'    /'||wwv_flow.LF||
''||wwv_flow.LF||
'    create or re';
wwv_flow_imp.g_varchar2_table(55) := 'place trigger ev_events_biu'||wwv_flow.LF||
'    before insert or update'||wwv_flow.LF||
'    on ev_events'||wwv_flow.LF||
'    for each row'||wwv_flow.LF||
'    be';
wwv_flow_imp.g_varchar2_table(56) := 'gin'||wwv_flow.LF||
'    if inserting then'||wwv_flow.LF||
'        :new.created := sysdate;'||wwv_flow.LF||
'        :new.created_by := coalesce(sy';
wwv_flow_imp.g_varchar2_table(57) := 's_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    :new.updated := sysdate;'||wwv_flow.LF||
'    :new.upd';
wwv_flow_imp.g_varchar2_table(58) := 'ated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end ev_events_biu;'||wwv_flow.LF||
'    /'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(59) := '  create or replace trigger ev_speakers_biu'||wwv_flow.LF||
'    before insert or update'||wwv_flow.LF||
'    on ev_speakers'||wwv_flow.LF||
'    fo';
wwv_flow_imp.g_varchar2_table(60) := 'r each row'||wwv_flow.LF||
'    begin'||wwv_flow.LF||
'    if inserting then'||wwv_flow.LF||
'        :new.created := sysdate;'||wwv_flow.LF||
'        :new.created';
wwv_flow_imp.g_varchar2_table(61) := '_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    :new.updated := sysd';
wwv_flow_imp.g_varchar2_table(62) := 'ate;'||wwv_flow.LF||
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end ev_spea';
wwv_flow_imp.g_varchar2_table(63) := 'kers_biu;'||wwv_flow.LF||
'    /'||wwv_flow.LF||
'    create or replace trigger ev_attendees_biu'||wwv_flow.LF||
'    before insert or update'||wwv_flow.LF||
'    o';
wwv_flow_imp.g_varchar2_table(64) := 'n ev_attendees'||wwv_flow.LF||
'    for each row'||wwv_flow.LF||
'    begin'||wwv_flow.LF||
'    if inserting then'||wwv_flow.LF||
'        :new.created := sysdate;';
wwv_flow_imp.g_varchar2_table(65) := ''||wwv_flow.LF||
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(66) := '  :new.updated := sysdate;'||wwv_flow.LF||
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),u';
wwv_flow_imp.g_varchar2_table(67) := 'ser);'||wwv_flow.LF||
'    end ev_attendees_biu;'||wwv_flow.LF||
'    /'||wwv_flow.LF||
''||wwv_flow.LF||
'    create or replace trigger ev_sessions_biu'||wwv_flow.LF||
'    before';
wwv_flow_imp.g_varchar2_table(68) := ' insert or update'||wwv_flow.LF||
'    on ev_sessions'||wwv_flow.LF||
'    for each row'||wwv_flow.LF||
'    begin'||wwv_flow.LF||
'    if inserting then'||wwv_flow.LF||
'        :';
wwv_flow_imp.g_varchar2_table(69) := 'new.created := sysdate;'||wwv_flow.LF||
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),';
wwv_flow_imp.g_varchar2_table(70) := 'user);'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    :new.updated := sysdate;'||wwv_flow.LF||
'    :new.updated_by := coalesce(sys_context(''APEX';
wwv_flow_imp.g_varchar2_table(71) := '$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end ev_sessions_biu;'||wwv_flow.LF||
'    /'||wwv_flow.LF||
''||wwv_flow.LF||
'    create or replace trigger ev_ev';
wwv_flow_imp.g_varchar2_table(72) := 'ent_attendees_biu'||wwv_flow.LF||
'      before insert or update'||wwv_flow.LF||
'      on ev_event_attendees'||wwv_flow.LF||
'    for each row'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(73) := ' begin'||wwv_flow.LF||
'    if inserting then'||wwv_flow.LF||
'        :new.created := sysdate;'||wwv_flow.LF||
'        :new.created_by := coalesce';
wwv_flow_imp.g_varchar2_table(74) := '(sys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    :new.updated := sysdate;'||wwv_flow.LF||
'    :new.';
wwv_flow_imp.g_varchar2_table(75) := 'updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end ev_event_attendees_biu';
wwv_flow_imp.g_varchar2_table(76) := ';'||wwv_flow.LF||
'    /';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(2650326693517071367)
,p_install_id=>wwv_flow_imp.id(2648543182794315223)
,p_name=>'Data Model'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_updated_on=>wwv_flow_imp.dz('20260514053506Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650326896035071376)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'EV_ATTENDEES'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650327087746071379)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'EV_EVENTS'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650327296218071379)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'EV_EVENT_ATTENDEES'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650327444690071379)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'EV_EVENT_TYPES'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650327618639071379)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'EV_SESSIONS'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650327873743071380)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'EV_SPEAKERS'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650328045657071380)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'EV_VENUES'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650328257086071380)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'EV_ATTENDEES_BIU'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650328459146071380)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'EV_EVENTS_BIU'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650328687473071380)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'EV_EVENT_ATTENDEES_BIU'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650328813004071380)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'EV_EVENT_TYPES_BIU'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650329037919071381)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'EV_SESSIONS_BIU'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650329279550071381)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'EV_SPEAKERS_BIU'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650329421158071381)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'EV_VENUES_BIU'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(2650329648615071381)
,p_script_id=>wwv_flow_imp.id(2650326693517071367)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EV_EVENTS_PKG'
,p_created_on=>wwv_flow_imp.dz('20260513190501Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260513190501Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/deployment/install/install_data_package
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := 'begin'||wwv_flow.LF||
'    --EV_EVENT_TYPES: 8/10000 rows exported, APEX$DATA$PKG/EV_EVENT_TYPES$247909'||wwv_flow.LF||
'    apex_da';
wwv_flow_imp.g_varchar2_table(2) := 'ta_install.load_supporting_object_data(p_table_name => ''EV_EVENT_TYPES'', p_delete_after_install => t';
wwv_flow_imp.g_varchar2_table(3) := 'rue );'||wwv_flow.LF||
'    --EV_VENUES: 10/10000 rows exported, APEX$DATA$PKG/EV_VENUES$939506'||wwv_flow.LF||
'    apex_data_insta';
wwv_flow_imp.g_varchar2_table(4) := 'll.load_supporting_object_data(p_table_name => ''EV_VENUES'', p_delete_after_install => true );'||wwv_flow.LF||
'    -';
wwv_flow_imp.g_varchar2_table(5) := '-EV_SPEAKERS: 12/10000 rows exported, APEX$DATA$PKG/EV_SPEAKERS$26098'||wwv_flow.LF||
'    apex_data_install.load_su';
wwv_flow_imp.g_varchar2_table(6) := 'pporting_object_data(p_table_name => ''EV_SPEAKERS'', p_delete_after_install => true );'||wwv_flow.LF||
'    --EV_ATTE';
wwv_flow_imp.g_varchar2_table(7) := 'NDEES: 10/10000 rows exported, APEX$DATA$PKG/EV_ATTENDEES$42041'||wwv_flow.LF||
'    apex_data_install.load_supporti';
wwv_flow_imp.g_varchar2_table(8) := 'ng_object_data(p_table_name => ''EV_ATTENDEES'', p_delete_after_install => true );'||wwv_flow.LF||
'    --EV_EVENTS: 1';
wwv_flow_imp.g_varchar2_table(9) := '4/10000 rows exported, APEX$DATA$PKG/EV_EVENTS$127472'||wwv_flow.LF||
'    apex_data_install.load_supporting_object_';
wwv_flow_imp.g_varchar2_table(10) := 'data(p_table_name => ''EV_EVENTS'', p_delete_after_install => true );'||wwv_flow.LF||
'    --EV_SESSIONS: 14/10000 row';
wwv_flow_imp.g_varchar2_table(11) := 's exported, APEX$DATA$PKG/EV_SESSIONS$436787'||wwv_flow.LF||
'    apex_data_install.load_supporting_object_data(p_ta';
wwv_flow_imp.g_varchar2_table(12) := 'ble_name => ''EV_SESSIONS'', p_delete_after_install => true );'||wwv_flow.LF||
'    --EV_EVENT_ATTENDEES: 29/10000 row';
wwv_flow_imp.g_varchar2_table(13) := 's exported, APEX$DATA$PKG/EV_EVENT_ATTENDEES$865333'||wwv_flow.LF||
'    apex_data_install.load_supporting_object_da';
wwv_flow_imp.g_varchar2_table(14) := 'ta(p_table_name => ''EV_EVENT_ATTENDEES'', p_delete_after_install => true );'||wwv_flow.LF||
'    '||wwv_flow.LF||
'end;';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(2650354011195077519)
,p_install_id=>wwv_flow_imp.id(2648543182794315223)
,p_name=>'data package'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260513190602Z')
,p_updated_on=>wwv_flow_imp.dz('20260514054124Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
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
