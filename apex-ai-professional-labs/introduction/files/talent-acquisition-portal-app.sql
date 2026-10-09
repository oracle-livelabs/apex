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
,p_release=>'26.1.1'
,p_default_workspace_id=>43614049040180782
,p_default_application_id=>168
,p_default_id_offset=>43817272059645967
,p_default_owner=>'APEX_LL'
);
end;
/
 
prompt APPLICATION 168 - Talent Acquisition Portal
--
-- Application Export:
--   Application:     168
--   Name:            Talent Acquisition Portal
--   Date and Time:   19:20 Tuesday July 14, 2026
--   Exported By:     GENDEV
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     15
--       Items:                   55
--       Validations:              8
--       Processes:               16
--       Regions:                 30
--       Buttons:                 21
--       Dynamic Actions:          4
--     Shared Components:
--       Logic:
--         Build Options:          1
--       Navigation:
--         Lists:                  3
--         Breadcrumbs:            1
--           Entries:              9
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
--   Version:         26.1.1
--   Instance ID:     2207275652606981
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
,p_owner=>nvl(wwv_flow_application_install.get_schema,'APEX_LL')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Talent Acquisition Portal')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'TALENT-ACQUISITION-PORTAL')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'9445391F55D5C0D37160D1358FBAC974108C5044159CDE237BC1DF15DC01FFDD'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'26.1'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_flow_image_prefix=>nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(19582723321384922171)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'Talent Acquisition Portal'
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
,p_substitution_value_01=>'Talent Acquisition Portal'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'GENDEV'
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>2461236191955
,p_version_scn=>'58870649'
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'N'
,p_pwa_is_push_enabled=>'N'
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(19582724252820922185)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>2469215554099805162
,p_nav_list_template_options=>'#DEFAULT#:t-TreeNav--styleA:js-navCollapsed--hidden'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(19582725000313922250)
,p_nav_bar_list_template_id=>2849019392706229583
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(19582718919137922156)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>'SH256:NcagEyRP_F17oe14bnrSYSYienkBgpdRSvH17g_NxoE'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(19582719215390922159)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>'SH256:FJR60MFzlfEjx0PvnpYBK4631rNeUHXaF3eGFKxcTgE'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(19582719545202922160)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'show_on', 'FOCUS',
  'time_increment', '15')).to_clob
,p_version_scn=>'SH256:dQTHqehcDG0h-d-qmHe5lf-DuViElEHDw9zMkscLr6M'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(19582719829662922161)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'background', 'default',
  'display_as', 'LIST',
  'map_preview', 'POPUP:ITEM',
  'match_mode', 'RELAX_HOUSE_NUMBER')).to_clob
,p_version_scn=>'SH256:CU9J9l4sUtY-UffjdBCosfDW6ER-I0swXpw8GekLiYQ'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(19582720084154922162)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>'SH256:jJTPfH8wphTXe7ahDytF6PbWlPl1mXrDRYylCDda0k0'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(19582720470637922162)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>'SH256:oAqKgc-cSRXHDMjfwwNIgo78WqYXKjQz8MWGBG6Euj0'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(19582720757832922163)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>'SH256:uT4QhQbZQY61UFxAGl7ieo2urrCo8jUsFNprrg7lGHo'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(19582721021930922163)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>'SH256:wAjuCAsVhoIbbuKGWTMQ__Rd_YS_sY9KgWhpqOO11mc'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(19582721318792922164)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'match_mode', 'RELAX_HOUSE_NUMBER')).to_clob
,p_version_scn=>'SH256:GIeRbUJQ8yKfen6-dFvkghmSUZXFoUAXCCTNRhCJgh0'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(19582721630927922165)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'Y')).to_clob
,p_version_scn=>'SH256:4M27aN0U-JyQ0prILtI8ITLXOphqUdO-xWNcwkSL1SI'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(19582721906847922165)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>'SH256:tNGqNT-VaoKqWOwKbAdEqb6C0QO-GMcYRZJLXjScHMo'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(19582722225772922166)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>'SH256:vJP7K77hiNj1R2RE6dHVyRAhlmxDg6KGn4yRE20J9Qw'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(19582722498462922166)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>'SH256:fiSZ-OfcUl-d0e0dtJUYffG7q61xKsHlomsv7ZU1BMw'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(19582722812963922167)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>'SH256:dRkCWi6vQMhdQUSqb0QlRls9iYcsZ93IPYrbTqFqJFE'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_bar
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(19582725000313922250)
,p_name=>'Navigation Bar'
,p_static_id=>'navigation-bar'
,p_version_scn=>'SH256:vnb1-G39r80BPE-5P2Enpuf0sMSVvBeNQDVbFiNwRto'
,p_created_on=>wwv_flow_imp.dz('20260715064303Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064312Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19582848963206923132)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_static_id=>'app-user'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260715064312Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064312Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19582849516298923136)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_static_id=>'list_item'
,p_list_item_link_target=>'separator'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(19582848963206923132)
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260715064312Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064312Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19582850033405923137)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_static_id=>'sign-out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(19582848963206923132)
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260715064312Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064312Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_menu
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(19582724252820922185)
,p_name=>'Navigation Menu'
,p_static_id=>'navigation-menu'
,p_version_scn=>'SH256:1IwjAktkxoSdhG944NKTSDw79Y5HRtYqWbOW5o3MWzY'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260714123354Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19582767482707922748)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Candidate Pipeline'
,p_static_id=>'candidate-pipeline'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260715064308Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064308Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(43945837540708381)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Candidate Profile'
,p_static_id=>'candidate-profile'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-file-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'10'
,p_created_on=>wwv_flow_imp.dz('20260714123354Z')
,p_updated_on=>wwv_flow_imp.dz('20260714123354Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19582738601487922357)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_static_id=>'home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19582799142362923016)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Interview Schedule'
,p_static_id=>'interview-schedule'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-file-o'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19582740168560922369)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Job Requisitions'
,p_static_id=>'job-requisitions'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19589224364317270809)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Jobs'
,p_static_id=>'jobs'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'11,12'
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19587724586908121540)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Offer Management'
,p_static_id=>'offer-management'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8,9'
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081226Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19582953853303942317)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Offers'
,p_static_id=>'offers-2'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-file-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'6'
,p_created_on=>wwv_flow_imp.dz('20260715064623Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064623Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19589646251537665549)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Recruitment Metrics Overview'
,p_static_id=>'recruitment-metrics-overview'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&APP_SESSION.::&DEBUG.:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'13'
,p_created_on=>wwv_flow_imp.dz('20260715084656Z')
,p_updated_on=>wwv_flow_imp.dz('20260715084656Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/navigation/lists/page_navigation
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(19582845264450923120)
,p_name=>'Page Navigation'
,p_static_id=>'page-navigation'
,p_version_scn=>'SH256:OArDk9jPrXkbASy79tal5TKPLzPXOmtWKZMX8Wgev5o'
,p_created_on=>wwv_flow_imp.dz('20260715064311Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19582846193820923122)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Candidate Pipeline'
,p_static_id=>'candidate-pipeline'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260715064311Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19582847205687923124)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Interview Schedule'
,p_static_id=>'interview-schedule'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-file-o'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260715064311Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19582845769571923122)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Job Requisitions'
,p_static_id=>'job-requisitions'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260715064311Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19582846672762923123)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Offers'
,p_static_id=>'offers'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-file-o'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260715064311Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
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
prompt --application/shared_components/files/apex_data_pkg_tms_audit_log_508333_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B03041400000808007C9AEE5CDF5F372B371700004DAA000012000000544D535F41554449545F4C4F472E6A736F6EC59D6D73E238BA86BFF7AF70E57CDCC0F1BB4DEF9725C4E93093000B647A7A4F9F4A2946493C3136EB9764B253F3DF57B20DB264';
wwv_flow_imp.g_varchar2_table(2) := '6168C964A666AA26B6B943B82F1E498FA4477F7C3A0B32B84ECF3EFFDFA73F3E9D85F1D37DB03AFB6CE89FCECF32F010C2FB08ACE1D9E7B3E5EDE27E349C5C8E2F874B6F71866EC71B98802C882374773C5978F36571355CDDBF8230874832CAC3105D8A';
wwv_flow_imp.g_varchar2_table(3) := 'E0DBEED2D91FDFCF7632F7E3CBEF679F35F5FCFBD9DCFB67F993897EB81ACF17CBFBC9F0D64317BE9F0D83F4197C3F43376E86F5EB3F3F83A8B8ECDD0EC737C525801FEDBFA01BFF80BF83F526847D3F5E170FCDAEA793F2757F1B385ACF527B9665F554';
wwv_flow_imp.g_varchar2_table(4) := 'CDB48BDB736F7177EBDD5FDC4C2FBE97EF1C5D5C4CEFE6A3F24573F808930484C5C3A3BBF9DC9B2CEF17CBE197EA3D6E36610057C5DDE16C7633F62EEFF19F58DCD455DDEEA9E85F73A9AA9F8B7F8B072FC7BF78F3C578F9EDFEEA66F8A578F45BA930BE';
wwv_flow_imp.g_varchar2_table(5) := '5F8CA673FC6AA7AFFD893F571FFD4D4F7075FFF08E3EC42FDEE4D2FBA57E1964E872F97B9C9E662E35FDB36E7F56CDBEED589A6DA8AAFAAFE2F104828CA3525D3E5225DFAC782ADBCB47A9FCF9E9BCCE9BF181BC6975DEAC266F73F01A7070BB8551CCF2';
wwv_flow_imp.g_varchar2_table(6) := '96A047FB6B7CA39537AD37701DDBEA699A696947E1E6FD0EFD3C0B5EA17200BCEB2069C7CEECE9FA41EC262C760369EC1CCDD4E4B1ABAB8863475418ECCC0FC44E3F809D17C28817E666304BE257C09007F1D3FD4D79AF0D3E73D03376B1CE3D0ABE9B20';
wwv_flow_imp.g_varchar2_table(7) := '7A81AB71B407B939FC0DFAD941EAAC1F0F7696347503DBED80BABA8A38754485A1CEE251E7DDCE6EA6DF3C49E8B62A1573E70D0C2BB719F66EC13B173DF427860C786BF4687F836FFC03F86BD8AFD02B9EFA697A417EF1A5375B929F6E8713C4CF9C7A13';
wwv_flow_imp.g_varchar2_table(8) := '8BE1CD70FE0D3F60E8E8834257AEC773AF8E92E66294542680211497778BB2DDF57190DC32BF9CD6A1964369A0BA863C4A948A304A35150625FBA350D28F45E926006B0E4AA367C8369E217AB2EFA3EB2D20191448D6219006EE1E8E063D75D0D3ECBF82';
wwv_flow_imp.g_varchar2_table(9) := '23C3312C798EEA2AE21C11158623E7A338328EE5689604DC98340141C280B4C18FF62374A385249322493F4892B98724F4916A3D5DFD2B48B26CDD9527A9AE224E12516148723F8A24F3589216F163C023E90B48FC80ED57A5F8E1FE5371AB85269BA2C9';
wwv_flow_imp.g_varchar2_table(10) := '384493BB272EE92A6ADC7ADA5F4293633AA63C4D7515719A880A43D3E0A368B28EA5691283670E4C73587588094A117AB29FA0EB2D1CB91447E6218EEC3D5149D77A2AEAE01B7F054703DD76E439AAAB88734454688E4CF5A338B28FE5C8CBB6E92B1AA4';
wwv_flow_imp.g_varchar2_table(11) := '8B248E5F5276B4871FEE3F14B75A6872289AEC83DD6EDCEBDED7ED767BBAF3F13839AAA69AD2E92A5A4514A7BA0A8393F65138394D9C8AFC5527292B61906C8A226D5FE356243D75732F45D3E82106C92A889E4E4212EAEC4A07265A459C24A2C290C44D';
wwv_flow_imp.g_varchar2_table(12) := 'B48F274B6FFECBD8FB5A665DE4802A24F6E603A864A876BE7D9C749ED04704A3AD45BB37B62501F77C16A36BEFF2EE8697F1D6B4A55699DF578B7FFE55E84CEF96A3E9AEA31FFBDBC6F3CAF32E2F86A39FEF27D3A55742B2C892387A52FC78BDCEA3C02F';
wwv_flow_imp.g_varchar2_table(13) := '3E0205442B252D6FFC045EC1F7FF5DA03100FAE131CEA355F1485FB98D5FA192C54A06FD67FCC250D9800886FD92C22AE364F64D39CA34AB482D4A5246A908535653A129B3B819A7E9E4623A9C5F8E275FEE97C3C5CF72946105D2936A06B1E23EA10AFA';
wwv_flow_imp.g_varchar2_table(14) := '791264EFCAF00D24308269AA2C1310EC381B2E16E32F1344D4727A28553042CC7D99169108FD10A3EB0188FCF2DEE55D2320396DBDA4499C298B0C24DBE426627476E32D09D9F251C9B22D7720CD0BA522CC4B4D85E1859B56BAF186BF78F7CB6F33C980';
wwv_flow_imp.g_varchar2_table(15) := '447448D421937D5194A3AFEA0D0455FFE276F82BFAF4BF2DEE6728E67CF386733C7AB7E44CB035437E4E8C561136A1A6C298C0CDC99CCA04BD6EC222F05F0E58A0A99216E8B6251F372915710B880A63013799712A0B8CBA053398A47174F09B20F94570';
wwv_flow_imp.g_varchar2_table(16) := 'D581694BBB40A908BB5053615CE026014EE58249B9805BA7ECA00BB6E497C13554433E1E512AE2361015DA069B3B863E950D56DD860B98E0CF1F8D5AB2137F1F4CCB924E8AD12AE2461015C608EEE8B3FC002FD0A86C3292F4A21221AD73735691D7866F';
wwv_flow_imp.g_varchar2_table(17) := '1B67F4C7E02EDC6834BFF38AA6057B79B7F0B6B6CEF1607482BA9DC5C372860D54C791FFE6502AC286D55418C3B883BC5319A61F6598DE6258B122AB324C630C1B48FA65681D0CCA291571BF880AE3177735D2A9FC321A7EE9125F309DFD82199286998E';
wwv_flow_imp.g_varchar2_table(18) := 'FC3438AD226E1851610CE3AEE339956166C33043C23087314C73250DB38BE65BD6B0BA8AB8614485318C9B90389561CD8C84296198C97EC3E4D62C390367A0EBF286D555C40D232A8C612D1981EE0DB38F32ECD8268C0D89725F3057D50C437A1A9E5611';
wwv_flow_imp.g_varchar2_table(19) := 'F5ABAEC2F8D5923CE8DE2FA7E19725F105B3D98828D7E770D178C6924EB9D12AE2861115C6B0965443F786B90DC36C09C30C3622EA9286599A7C4E9D5611378CA83086B56425BA376CC04DAA8B1AA6B286C90D9B5DD531E487CDB48AB861448536CC69C9';
wwv_flow_imp.g_varchar2_table(20) := '5F9C60D8AC1EE5D8B16D18EB9864FAD555DD8123DDADA755C41D232A8C632D898EB9F7CF3B6FB19473AC12F9D144C762399C2F39134B2E3DB1843E82E6431ABB190327B0AAF751CB900C17D349F1BA2BB00EC277254B828DF210C72F70A580C70C264A8A';
wwv_flow_imp.g_varchar2_table(21) := '673C33651382084F9BF51B4B34369B247E25ABF4E7D35F7693B672EC68AE3B90CEB9D02AC2ECD45418765A722EDDB3D3CCB9ECEBB072D9B11B0B4A39ECA087B403ECE80C3BF0158182E7CA13E8231612C451B0861F888AAE199674BA87561146A5A6C2A0';
wwv_flow_imp.g_varchar2_table(22) := 'D292EEE91E9566BA675F4BCE45C56D44100E2A2EFECBDB5131685466388CA0D89225E0158655888977EB731480177C05590053052410AFC6D884306BA2B4C81FD641967159B22559324C557AAE8A56116789A830EB79B82C9D6A3D0F6753C6A1F53CCBDD';
wwv_flow_imp.g_varchar2_table(23) := '6A9871843C7E0DE01B7F658F7660658FBBD4CCCF86CCCA1EEF771F86219ED37900FE0B44616A05D3E029525641EAE7698A17FABC05D9B3B249307EF83D0FBF2E14F83BFAE40218F9905DCA239939D3DC8126BD538356115FCA435418C0B8A9CE5301C6D9';
wwv_flow_imp.g_varchar2_table(24) := 'ADA17F10603AFA38B4034BC716FE335CE5E17EC46678C557D56FFA3B6A05D37C0D95F4397E4BB7CBC786B3F15EA2E457FBE89AABCBCFAF532AC248D55418A4B8C9D85321C5D9B661D591D22590D20F20652D354B16A9AB18C526DC0882F4B3F273FE0093';
wwv_flow_imp.g_varchar2_table(25) := '083584A9B2FB6CD2736589776C3FC6C95A59C7580C5D0A223F58E1588720DCA087BA47CD522DE9B424AD228E1A516150E3A6914F851A674F877BCED49A6050BB051178425D9F03A099EDA0A90EFE30A496BD8E42081205E2B781067A298A5AA8ADC43DB1';
wwv_flow_imp.g_varchar2_table(26) := '6AED63FAF76D04434F244116A3CE3D3316DCB58B928B227457EB2288D555C4C9222A0C59DC84F7A9C8E2ECF268969560D0BA0AA2AA8A430327BB0D270BEF5BD5EC03388DAA1EF9A175D4490C566BB0517ECB574FC57A9A7229357881CFE82340E4AF8B6F';
wwv_flow_imp.g_varchar2_table(27) := '00BED557E6102FBB463D333432780E9246874B723180A1691D2C7BA25484C1AAA930607113F3D3AB2B6F2E87532171FCBAFCE2714407D9A16A95DB2EF664A334A6FE82F7EB6C3CFFC6C95AEDDF5CBF401094A0156FF5C65B226E99B211D510EFF2FEA25C';
wwv_flow_imp.g_varchar2_table(28) := '81BDB73C801C2AA6EACA0FFE681561546A2A0C2ADC29816E51E10CF91A6D5A0315576F45852D10B317156B2F2A33142470EB54A692AA38F703D8B46CBB9504C7B075F9F52B948A3838448559E1CA9D9AE8161CCE50AED96435C8D96DEEDA97B7348F41C7';
wwv_flow_imp.g_varchar2_table(29) := '6EDFE2ECC3CDB6E1FA01645AF6444A2263B9A6FC820C4A451C19A2C220C39D1B39D1969EE6D448734BCF78A92C60966FA4F6EF8C97FBF6ED20D4DCBD088D230575A79FD0D02A3DD9BE1D55733AD8B7535711DFB743541828B8931E2782A239E7D184E27A';
wwv_flow_imp.g_varchar2_table(30) := 'AE5CA2F132EE4DA65C30DA4A7750645CCF5BC8D8BF5199EE1637B8A869D46BC348A2A239967CFCA054C451212A0C2ADC44F58950E1CF79D0A85CC20D48B2624832C5C9B8ACF89D5C68DA77C353D810D5FDF818FBDBA68FD81068184607B4D455C469212A';
wwv_flow_imp.g_varchar2_table(31) := '0C2DDCACF3896869AEAF6DD23203EF491C862D4D4E4BF50D8A904AA925BA0CFED276C7D2E4571BD22AE27810151A0F6E5FE4D29BA12EE3AD37919C3DA5EBC891FA19D1531041986CB70CF32A5DDC4C91D5E36A8AF302464F4836C9959EB28CDF60A20C2B';
wwv_flow_imp.g_varchar2_table(32) := 'D36EA6F3E289FFD12DDBF02E24E33F1A1A9AF2430E5A45B8224A4D85B68CDB53E8DE326A5BE975BE06913287699C273E4C456DBB606DD3D48B81AB49DB66D8AE7420A655C46D232A4C41A48FB18DDA8ABA00E1B166DDE6EB071020A7BEC23453BE6EBF9B';
wwv_flow_imp.g_varchar2_table(33) := '35AFAEAC81A7CA7FC5CC81255F548F5211F78AA830E9A08FF18ADAB08A93CCDBEA075D7CB5DC0B6B74654BDB656B03E9C113AD226E175161FA381F6317B5B1150D9AA7BB79C3E34CBB7E5FA1173C8015326D14C6F94AB9CE1F58DB54FBC2BE34A56D730C';
wwv_flow_imp.g_varchar2_table(34) := 'F94408AD226E1B5161D6617F8C6D76DD36D4E95BE57E769C61B33C82C8AB7114C5AF65F59A1BD030CCBB32D13FD286B9660745B7291571C3880AB3DC8E67D84FD30B39A7A8D2C3CBF1F2A6D14B54AAB9DDD2B5F1A49EE4ACA652F08E7272D5ACAED63AA0';
wwv_flow_imp.g_varchar2_table(35) := '72F668BA235F6D815611B6A7A642DBC39DEEEACE1E9DB26701A3204E944BF80A43ACDDF4C6E55AA3766E8D6975704A02A5226E0D51A1ADE14E2F75678D4159833C996E5265FB056A3AE3B81C67B605986BED9DA4312890C817BDA554C48D212ACCF8973B';
wwv_flow_imp.g_varchar2_table(36) := '7FD39D3326E5CCF55CB9C8D3A0A89A3503491649B823B753CBD69C2E8AA4532AE2EE387B8AA46BDCF44477EE58AC3B5F20B20484419A357DB1748E2F76E7BE0C0CA7836F4D5D45DC17A2C2F8C2CD4174E78B4D37357814AB0C7D3FCEA34CD99DAFD27408';
wwv_flow_imp.g_varchar2_table(37) := 'B78ACD6F8ECA3A24B733C2D6555793EF0B502AC20ED5541887B8E986EE1C722887AA5EF5FE7EDA80E78CA637FA02721B0D6C5DEFE2C4244A45DC1A7DCF89491A37BBD09D352E6DCD36DDBE817EB02FB2F1DCB11BE6C8D5DBB475C356E5CB96532AE2E610';
wwv_flow_imp.g_varchar2_table(38) := '15C61C6E2EA13B7306744F0D64401946207CE7D962F33AD06EE7B69883817C8343A988DB4254185BB8B9820E879E2AE5CBDDAF68608337B470FB67DC56A6F3508682877C71764A45DC16A2C2D8B22F23506C581B2FC6389522BD038F6407A8B1283DBBB4';
wwv_flow_imp.g_varchar2_table(39) := 'DB2177703923674152DB5A866B6F78399ADE4D96DF773B1C7655B037D5C938D39937E1AC2567367D8E6EA60BAFB3F945DB3074F9C50AB48A3021351586907D49891310A29FB71E3FD420A46569932820DA8F01629C1610ABF0441690BA8A382044850164';
wwv_flow_imp.g_varchar2_table(40) := '5F6AE4048018E7CCD88F9EED6C00D2E63A4D48953D6E4181BFCC968B05BBE2B26B2C1CBD83F10BA5228E05516126B9F7E5654E808579DE7A3C50038BF68386444387F103A1C36A9CD1D83523AE6BCB678728157146880AC3C8BEECD00918B1CE5BCFD868';
wwv_flow_imp.g_varchar2_table(41) := '30D2BED0ADA3E6E52A08B7DB1D7994988D9D241425B5806375B582D236ABAA4B72E0502AC2E0D4541870F6A5AF4E008E7DCE8CFEE8E9FF06382D8BDF7EB4C9B94CC063D6D6CEB8278D21260AEDF24B0728157114880A83C2471E5F7DCE0C67D8D3D2A3E0';
wwv_flow_imp.g_varchar2_table(42) := '8577DADD1CC4CC4940003FD94F407CE4D9D5AA7ADCD9D5078E0F9E3E3E5603E24E0F4A77FB8E1C699666EBF223214A4598B49A0A43DA079E58DDA8F4D0383438F1F39483DA7550ADA7AD9F1A8C9FED3FA33B6DB4693D53B3AAC3AA0DF328DA3CA415BFC3';
wwv_flow_imp.g_varchar2_table(43) := '8307A5D33BBAF7A377F8D8EAC661E98EE44658DB324DF943CF681571F4880A831E37A9791AF48C03E84D02FE51E9207961C08B027C4C3ABADE869D8BCFE0C4D815DC5947713702A87D4D52651164700F72F4D959FB91737E3CDAD992E756D9966D39F22B';
wwv_flow_imp.g_varchar2_table(44) := '28291571E4880A831C37617B1AE4CC03C8FD04FCF881C3DC0D840C72BFE127FB2184ED914E47D657C4D94712B7DEE4A9E2BD6E77B334899BC3DFA09F91EA5B7B80737F3CC6997DC929696BA0A9F23304948A38704485018E9B8A3E0D708DAA370C70CB98';
wwv_flow_imp.g_varchar2_table(45) := '778EFA307C4581E73F0C7259BCEE83F24E3B7496A657D099C775E6E6D04FF20057835B14ABF65792CDABFDE3E8B97DC9C55D78E18E7CAE8A521146AFA6C2A0C7CD719F063DFB007AB790779AE8D7B86AC96ADD3A18F4DFD0E536E8D0D8C1D5740323A777';
wwv_flow_imp.g_varchar2_table(46) := 'D5B20E379B303818E60622EDAA6457CE362D55BE5DA554C459232A0C6BDC74F9695873CE99DC39C3DA970454FB1568DA7E0ED60C6C4FF8C9FE4BB06E0F71B6B96D574DA38BF1EA51AC35CAFA1EC19A23DBA4DA8EA5CB37A9948A386B4485D9B1C4CDC19F';
wwv_flow_imp.g_varchar2_table(47) := '86B546251486B56918BC06BC810382B0EA5311DCE2E2E1FE13BED5469C69F61C47557B03F5E84675F80423FF5D343F6235B6A41ED78A4AAE5873D40EEAAFD22AC2B4D55418DAB8D9FCD3D0363840DB258802187268BB48E237F658EE55F130CEF5BF45ED';
wwv_flow_imp.g_varchar2_table(48) := 'F1CD205DB80F1FA9B205A88FE0CE962CCB6A3B866ACA6780291571EE880AB3A9A5E504AAEE6B483777C8F3CE5BA9E602B9A5EA8D8335A49B0F356A4897A96852437A7B6429D86CE2202AAA2E340A44B323D40E6B8D5B86FC5180B48A787D68A2C270D272';
wwv_flow_imp.g_varchar2_table(49) := 'F055F79C340FBED2399CECAD353E687CE1399C0C9A29D303471A2CCBE21EAF507905D579EEB872A5B2A916372430842085CA238A49FFC1B5C6A3C7205997A7BAB33891D9299A25E9892757774C477ADD0BAD228E13516170E226C8AEE7F7B3E9CD78F44D';
wwv_flow_imp.g_varchar2_table(50) := '8AA452A25EA0B05635839CC24AD63BD68FEE5666A8FBB4EDE24C274BAF985A444D24FA5D3D7C088102ABBC7D8A0F27809806DD5256E03D55E247059452612185FE00C50721A20324CA3B0449BFFA1DE9739C872BE50122897FA3F79DE1C33132FCAA3453';
wwv_flow_imp.g_varchar2_table(51) := 'B2B7587983F02555824801AB57BC2DBA287609AAD30E948777257BC6AFDDC44986C12B4B5F22F9BB284FB156FD5DACC13BFE4D3E4812341A501EE3E40D24E819DF8FCB12F959AC84312E52BC29FE74250CD64196F625E7C25DC3D56DF923142815610E6B';
wwv_flow_imp.g_varchar2_table(52) := '2A0C87DCBC59F71CEAC770484E2FDF47A1D7604F5377EC6D40B05252AC41F02BA9BB8A13053CA4B850788ABC8E70A160BC42A360CDC7459DCB3D25CA5B9CBC6024B0E4798DF48A2190E2635C102F18C46085D882ABA2BCF5AAAA95550645F4C0F55C9E9F';
wwv_flow_imp.g_varchar2_table(53) := '81237FD03AAD22CE0F5161F8E126BFBAE7C760F99925F103293445ED4529AF2BA85713C4AB064213F85694C44D951426C872804840ED556F1D47C58905DB976F8A97F7B79B5A3071384B5A3F5B635395103A5792388445357A3FDB9612C7110B69E062E2';
wwv_flow_imp.g_varchar2_table(54) := '4504F39FA1FF5274AF528412BABC6B20CBA6F3290F71DDE802B9A298568AA472F93064AA5D1C1845A9086354536130E2E6B5BAC7C864319AC3759C41E56B5CCD3F12906A77F646A330780A1E42C8040A1C4490A1F8E5E1BB926F703CC081A688533828E1';
wwv_flow_imp.g_varchar2_table(55) := 'D6AD3C20A36AB8AAA60D847D05E349E4AA86D28F8BA60A7DBA956EF93B5679B13DBE46641AE38360023C2044E1EBDF79B02951C2C5B64A243308D6A861CDCA2D5B18D5E25C9828CE94150CC13B5CC913A76BF2E33E5A459C38A2C2EC96E766B7BA27CE62';
wwv_flow_imp.g_varchar2_table(56) := '89BB80117C0CAAAA8AB5DDA7108408887194E649112FBC086FDCDA15C0E3B782D83AB8A510C594E27C1F10BDF78AA30A508C5929CFA570B0137E4CE235EE3F0549110715FC11F6518385288956A90277BF17BF264BB6943461C33871502DEB36163DB4E2';
wwv_flow_imp.g_varchar2_table(57) := '24050C3AEAC9A5F01546A43B88BF0CF2A419A6FCD424AD224E1A516148E366B6BA27CD66495BA05E4D1264EF0C69E3A868938A466EFBC8E1FED63A475D73D4B9DE1156862E7CF4CF6B80BB55983E1C9550DC89F01F8B5E116641EF11F819EE7DE5888708';
wwv_flow_imp.g_varchar2_table(58) := '9F05847FEF7975B619EEBF2B699E6E8ACC82926EDFCDF6CC0D340458E32E162822290AA354D91D797C4CBB83E34A2915717C880A838FFE31F8382C3EA338DAD5CA21F48C62D4ED459DEDFADD3A31431F0D114771B2A9BA4369716E0AFA9FC73CC4ECACF3';
wwv_flow_imp.g_varchar2_table(59) := '680701B239CC53DCEFF651C8010F7142D151C4B022B2212757C5191AE817179D260C4780FADD418D6514636071541EA670130214EA023CB70DFC2A0121098B6DBAF2592A4A451C16A2C2C0C25DCFDA3D2C2E0BCBB2387E8E616557ECA2BCBB2FC8EC1EAB';
wwv_flow_imp.g_varchar2_table(60) := 'CEB0C33981A283CEF68EB6FD667C2C143E2D45F1D8D60707A84D52AC272467E2A1766715A30E7C71604671CC5D397ADC2038ABC6E91143F8B07D1F4547AD3C490FB762F8084F797CDCB22C91243E7515717C88CA9F9FFE1FFDF75F504B03041400000808';
wwv_flow_imp.g_varchar2_table(61) := '007C9AEE5C088A37C3CA0100003B0800001A000000544D535F41554449545F4C4F475F70726F66696C652E6A736F6EC5956F6BE24010C6DFF75384BC768BA60AD677E9255621D152E31D5A8FB04D46DDEB6637ECAE1529FDEEDDAC56396A848B960B6421';
wwv_flow_imp.g_varchar2_table(62) := '33F34C7EF3E4CFBE5D59963D271490DAE4605B1DAB592B4292B0850E0ABE2E62734C25D4F6A5C0129EEA822265BBC18D338EBA6DDBE4B50049A090282E4C9A28C8E436B7045CA824220CCD8990EA6BFB44BE16DD2997901AF9CCDE6AE75C249A51900CAD';
wwv_flow_imp.g_varchar2_table(63) := '97BAA7CC7162709558EDA49CAE3226754C5F3DE9D3B2DECCAA730C67A6D80E86F771DF332D4D22C50AEF27770E61484886294A96783BC5F51109A2C08CECA0FB6B72CA1731490F4222D11FC9D97E60137FAF959046EE5DE0C70337F44B681BE5440DA77D';
wwv_flow_imp.g_varchar2_table(64) := '1C49E1670AB1B94745ACE183FFE846FDE1A00255FD3814CF416045344255A6C08B7FBAC1D81F95419DA06AD6EB655C348D5F315D81AC0A36F07F7D071883F599603F7AEEE0DEF7E2BBC9BF3F46A7D53A8EA53F16B680347EDE9C8BE5462558AD136F57E3';
wwv_flow_imp.g_varchar2_table(65) := '341556879EFA67926185322C5F4CCD441F280C91E7CDEC6866F77A4EB313F63BA3D175B77B1B4D7B9D681A569EE9D177A38B5B2D00ABF3ACDE615DD4EA1DD5FFB27AFCE05DDEEA559E9E69F527D625ADFEA4FA6EABF5FADBECAE39167A4B2E36EC6287B5';
wwv_flow_imp.g_varchar2_table(66) := 'DA3757EF1F504B010214001400000808007C9AEE5CDF5F372B371700004DAA0000120000000000000000002000B68100000000544D535F41554449545F4C4F472E6A736F6E504B010214001400000808007C9AEE5C088A37C3CA0100003B0800001A0000';
wwv_flow_imp.g_varchar2_table(67) := '000000000000002000B68167170000544D535F41554449545F4C4F475F70726F66696C652E6A736F6E504B0506000000000200020088000000691900000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(44432810197144495)
,p_file_name=>'APEX$DATA$PKG/TMS_AUDIT_LOG$508333.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191955Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_tms_candidates_612617_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B03041400000808007C9AEE5C1EA226CBCB0300008A13000013000000544D535F43414E444944415445532E6A736F6EB5D85F73DA381000F0773E4586D7AB35922CC9364F475BA6CD35493324ED5D7B73C328B64254FC87138634EDF4BB77054D624C';
wwv_flow_imp.g_varchar2_table(2) := '2CC2D937436692F5DA0EFEB1AB15DF7B7D5DAA6CD11FFCDDFBDEEBC7324F74224B35D1497F407A2FFA46FDFBF0FBB5368B7292CB4CF507FD61AE67B20FD1543E06C7B2B02195499DC29FD2E620238BDFD55799CD5385E222B309F39B22B7F9BF45C48BC2';
wwv_flow_imp.g_varchar2_table(3) := '40708F108C893DB4289626B6C74E743E53C9716E83F1D2189597934529A7F6D8FBEB6B65EC01399FA75A2513FB3F439C622A3C0C2F7689F160FDB259895E29B3D0E5DDE43A9553C8FBB43E574F167161E0BC1005F62646C15592C9D59D7D7BE7A3BF26E7';
wwv_flow_imp.g_varchar2_table(4) := '1F5E9E1CBF9A7CB8188DFB9504593EDC2AF008BB247440C5003324381624C0187FB6E9CB79F278BD37A3B3D7A38FD5B0EB2A218D3657F9D17BB1C3425D2CA7D2C4CB45DDE5AD4ED32A4CB6CE4237106EA4211E23DCE39C7B98F86C8B66042714774A1D8D';
wwv_flow_imp.g_varchar2_table(5) := '153818993E65749C97CAACB4BA753971B7D3D9B65380A28E9C180D497B27E633D2ECE4BB9CCE74BE533DE7D2CCAA4A39E4A039041B8D42EA116C8DD6487C0BE995340A9EE6D10514F8533E17F09814DC62EAF2090EAA238158473E82F1B0BD8FE08436FB';
wwv_flow_imp.g_varchar2_table(6) := '3097CF1F322EAEEA40274A557DBED81C942AE5A8210A4FF1178FA8F164F3E5E268B40293A778C6EA8B8AE1FDB974C283AA8721DA914E1851DA5E075A1C6FD6E1151D5AD7B9DC3CE7AACD305DC107FE5BD5A72C3224376187107C467E09B1ED0568AC62B3';
wwv_flow_imp.g_varchar2_table(7) := '84E2314717EB50F29FBB9C38C82944A41B274158D0BECB09C27DDCEC245C4EA74AD79DFE2C361DE76129521ADD42AC510886839050DFFAD0831ADC70A3E182890E6C6F1D2D3F82F9D86F0FC3FCD051404105C6AFC3BC313256759A773AABCA4C6D0E9AE9';
wwv_flow_imp.g_varchar2_table(8) := 'CC513C82DDB737E63F7B7ADB0F43E8413041579D4D047EC4DAC3044CB06698B002C3EA30EF53BDD23B9301706D56897B9B629D86A636DEC8C39817C034EA41A3ADF7B6E154E5F1DDE1A335F7E89E9AD969667E373401A6B83D0D5C25748CD6918BE6356C';
wwv_flow_imp.g_varchar2_table(9) := '67545AA779698ADBBC4A93ACD3D0958D3B2AC77F5C76FE87B98D1C842450D81112EC5BDAEF7FE02A226C4622D8A534D48B9B9DFA797723B78CA44D42338836EF4C03180DF03DD1F6ECE6DAF63C63D5396C731A74350E041CF3F6AB4EC009766C7A48F54B';
wwv_flow_imp.g_varchar2_table(10) := '035EC719CBD5CE4070AAF2620BC74012CA6CF4395F1B30BEDDD9465F55BC2CE1993A37A76FB57118318FEE59806A0514756614603F6A6F14E0D0B10011EA321AA5EA89ADA92A4DB192552665F3D07C73A0790D8A3CFFA18AC2678F087B773F40B4E7BB83';
wwv_flow_imp.g_varchar2_table(11) := '5A19F1CE8822CE457BA248DC77CA1FBD7FE0E727504B03041400000808007C9AEE5C395DA74026020000AE0A00001B000000544D535F43414E444944415445535F70726F66696C652E6A736F6EBD965D6FDA301486EFFB2BA25CE3AA0D45EBB8CB485222';
wwv_flow_imp.g_varchar2_table(12) := '25C09230898EC9F21207BC391FB34D2B54F5BFCF3103340D4FAA618B94489C2F9EF3FAE8C82F57966597846220B62DB6ADA175D7EB4C9CD42B6964CD73672B11E5B87708C575DE1432A073D96ED477E659706F2BBF4C001C539C8B86293711B8E23BDF1A';
wwv_flow_imp.g_varchar2_table(13) := 'A32E8B03528392302EFE2C9FF3A7AE3A6D382E54FAD2DEE5960DCB25232315785ECB9ABC45B9C2156CF32BB5A19BAAE6D2267F7D96AF65BDA8AFF4D5A852C1F6C89D78A1E7663E0C3D5558B90B24D0A17FE768C639A91005F91AED7AB93E910228AE55DA';
wwv_flow_imp.g_varchar2_table(14) := '31EFB7FE735417444663488A633AE1E01B6FEA43F3CAFEDAD35027FEC7FFC6CBF08F3348833049333871635F437BAB27BABF394DA44605AABF30A48ADC8B43517426931FBB61F4769EBEA301C21522D41466369E4E0CC4196858DA75531B0B934EE7C9C8';
wwv_flow_imp.g_varchar2_table(15) := '00E6F64643C39B8DDC1DA638A37992F8930CA699FB6040D5D740E51BC6702D20176865CCE6CE6651E87BB05B681AB4BE1EEDDD6932D4B694E002763BEB5854EEDF0A095021FE5D452DE403E21878DED2CE96F678ECDC0DE37098A6A6BD78E1273F49C36C';
wwv_flow_imp.g_varchar2_table(16) := '0183C87D3038FED3DD14E409334EC4169614AD8C850E613A9A263A912FBC8211813C6F98F9C826BE1C080F7E58BC5D466730D00C2CC372200AF8757B2E969B69B0067F395DCDF1EEA9903018D5EB20789F3D8E87D9636CDAD37CE65D5EEA4D5B9C29F51E';
wwv_flow_imp.g_varchar2_table(17) := 'EB9252EFA9FEB5D4F2FB455DE85AC4E42DB0BB2372C5E55CBDFE04504B010214001400000808007C9AEE5C1EA226CBCB0300008A130000130000000000000000002000B68100000000544D535F43414E444944415445532E6A736F6E504B010214001400';
wwv_flow_imp.g_varchar2_table(18) := '000808007C9AEE5C395DA74026020000AE0A00001B0000000000000000002000B681FC030000544D535F43414E444944415445535F70726F66696C652E6A736F6E504B050600000000020002008A0000005B0600000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(44433041149144506)
,p_file_name=>'APEX$DATA$PKG/TMS_CANDIDATES$612617.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191955Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_tms_departments_618933_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B03041400000808007C9AEE5C10F31D51930100002806000014000000544D535F4445504152544D454E54532E6A736F6EADD45D6B83301406E07B7F85B8DB76C41813F5AEB6762D745BE9C73A3646891A44B04949CD4629FBEF4B4B375B285B990ADE';
wwv_flow_imp.g_varchar2_table(2) := '1C5F0FBC8FC19D61E5255B6DACE0D5D81956CAD6E5324FADC0365A16A72B660556C4B39C3326739E597ABAA29C664C1E525C15851E1522A1652EB80E878C67B45052996D73263E98343BFB97125108A91FDF40173B51781849464B962EE3AD9E77C6D1F3';
wwv_flow_imp.g_varchar2_table(3) := '723C0F47C3EE723E8D26A7015AEA000410B70169DB6866C300E200A05BD7C31EB101002FFBB85AA7D5BEBBE8A1173D9D8E7FD942807FDCF269B44E1160853050BAB739611BA164C236FF8108CF206C10FA9EDD0C04068E4B505D08BD0503EF228453414C';
wwv_flow_imp.g_varchar2_table(4) := '69714DFD7BB58A69AEBB2FD8A63417C7B3F3D3BEEFFA1168E81860803CE2D76F8F7C802FB64755FB7ECE294F58FDCFEF856EB78F9B02C03624F501B0EDA28B006E05309C998F6B260F35AF3806836DAAC3314D3543B7102A35072A3E830038C43DD41404';
wwv_flow_imp.g_varchar2_table(5) := '81C4A90F41A04F2E42E00A622C45AA92F26F82B1E24CB71F722EDE0F337344CF09A23ED25753049E836BFF13F75B3CF79BE04DDF5F504B03041400000808007C9AEE5CC43626F3A2010000D00600001C000000544D535F4445504152544D454E54535F70';
wwv_flow_imp.g_varchar2_table(6) := '726F66696C652E6A736F6EBD955D6F82301486EFFD15846B6BFC62D9B86382D344C4285EE85C480745BB51206D9D598CFF7DA54EC9323111DD4868E09CF39E3CE785B4DB8AA2A8218E10E09F2952155D6957B310C3F1520469B2C962218C18AA1E4B51EC';
wwv_flow_imp.g_varchar2_table(7) := '278128C852AA316835A76EF75E957921000C45C8E7099569CC1161FBDC0AC14CC5008E418829E3BFDBFBEC23EB1E250C0552BE50F7DA30A1BE60A49880CD4AF46429F4252EA7EB6F6912AD49CC444CBC3D8B5B51B67215B9181259AC9AD6C8F5FAA6EC29';
wwv_flow_imp.g_varchar2_table(8) := '3301E4F0387A330F231F1318017F05F763D44E4840846229CB753F460F50CA3D1CE44ACCC01B4BE2E3C832BEAB16B00E0DDB2A006D14C334EAF5D334B26F4914DB181A4FD6F8DF9C2330864B44AF306FE0740CB7EF0C4B18A8151818253EE458109444EA';
wwv_flow_imp.g_varchar2_table(9) := '3803677C394FAB0047FCEFE2A92CCBD8325CCBF41E6797033535AD808822C851E0BD7E5E8B65B80558DA99EFD6384F0579DE53EC26047240207B9735337101DB06A6B950DD85DAEB35DBBADDD727935AB7FBE0CE7BBA3BB7CBCE341D99B7B77A9D06575A';
wwv_flow_imp.g_varchar2_table(10) := '7DC0BAA5D507AABFB65AAC2F72CF4F21150745768C64FBBE7257D97D01504B010214001400000808007C9AEE5C10F31D519301000028060000140000000000000000002000B68100000000544D535F4445504152544D454E54532E6A736F6E504B010214';
wwv_flow_imp.g_varchar2_table(11) := '001400000808007C9AEE5CC43626F3A2010000D00600001C0000000000000000002000B681C5010000544D535F4445504152544D454E54535F70726F66696C652E6A736F6E504B050600000000020002008C000000A10300000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(44433368444144507)
,p_file_name=>'APEX$DATA$PKG/TMS_DEPARTMENTS$618933.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191955Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_tms_employees_403982_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B03041400000808007C9AEE5C2B9279FE400200008E0A000012000000544D535F454D504C4F594545532E6A736F6EBD955D6FD3301885EFFB33723D47B6E3381F57B0514D485BA9F6811008456EE2B5867C544E3A514DFC775E07C64CE77415814A89';
wwv_flow_imp.g_varchar2_table(2) := '949C1CBF8E9FE3E47D9878AA9355EBA59F260F132F1775A10AD1C94C155E5A6FCA7272E2DD29DD76592D2AE9A5DEA5D80A0FC4523C697318501A51564295205460F2D7467D25F24AFAF29BA8D6A534962FCDA2AF4DE0BA90EBEEF74D256AB194DA9EB815';
wwv_flow_imp.g_varchar2_table(3) := 'A5D05B781C508C31082BA565665E0FE6A098C4083384E90DC6697F98FA6D27BA0D2CC77B9D77EABE9F32D7128614D9626BE4F9F44336BF3DBD787B96DD5E4FAF6C83E8FABA94231C21C26E084D294F31F3799C24610CEFF0D1D837EBE2A9DEF974F666FA';
wwv_flow_imp.g_varchar2_table(4) := 'DE9687AB2498B0E4B18A0422CD56CA5F00BE4F4E0EE27FA144B5CBFF6C256B1B7F091E3F0771907E60D30FF7D34F6227FC04E104117E04F849C009190F3FE03C72C2A707C39F6BF57CF7CF84D236FDB531F935A883F8998D9FBE809F39F1C3EA08A2F818';
wwv_flow_imp.g_varchar2_table(5) := 'F8C390D2F1F8C390C74EFCC1C1F8AF9B3BF50CFFB9D0F94FF53180D6D8FC65AF0F46C0ED0882FD11C4CE2F8062F8F720729408A2208CC6471031CC9C11B08323983562B59BC0959485CDBF068FAF411C841FDBF0D97EF8DCB9FF29413844383806FC84F0';
wwv_flow_imp.g_varchar2_table(6) := '643CFC8492C0093F3C18FEB45B897A97FEA96E9AAFADCD5F1A9BBFE8F5C108223B02FE42FF359FBFBBFFC68846FF3F03D8FB09E3633330556277FFE5CE0C08D94DE04ADCABDD002E65DDFCD17E3598FCCAA87F479FDBE889FBDF038BE3883237FA77F5A2';
wwv_flow_imp.g_varchar2_table(7) := '11BA50F5F25FE10F02C36D2C7EE8C0D4893F02FC9FE1FC01504B03041400000808007C9AEE5CBD0D745706020000EF0A00001A000000544D535F454D504C4F594545535F70726F66696C652E6A736F6EBD96516F9B3010C7DFFB2910CF71B59046EBF2E6';
wwv_flow_imp.g_varchar2_table(8) := '0EB230411A11E7215D26E482D3B8B301D9CEAAA8EA779F719644D3E24A830C2490B8BBFFF1BBB3B1FD7AE538EE9A3202D4AE22AE33726E7AB549D2E2491B45F952DBD69849D23B8692222B731D50BB5C180DBC051ADFBAC6AF0540124632550AE3A68A70';
wwv_flow_imp.g_varchar2_table(9) := 'B9F76D08AE5512D002ACA990EAEFF499FC596767A524B991AFDCBD765D8A4C330ACAC1CB46E79415CE0CAE12DBDFD2926D7921B54DBF7DD3B7E3BC9AA7F615989B60378867D1FD3208D2D037798D37C70A1FCBF74E6692518E19C836785FCAF5190960A4';
wwv_flow_imp.g_varchar2_table(10) := '30B293EE8FF209AF58B92324A5F9494D25789665712CDDD8DF7A16E6CF70EA873E44DD4167B8C8A98E6E433D0E93394AA7300E2CCC7D3BD7ED87F35C66D2A4E6130DA922787128865B3205310CA37FE719781620C231654D61BEDEDF7536CD9ECBC71613';
wwv_flow_imp.g_varchar2_table(11) := 'CC0F66A833D49C54AA056B0CA7F04B907486CB71819F8868413C87114C96DDD04ACCB0D835259D844990D6CBA305766007FA789E67430549EBE5EF94516F3F1C2BC0B1FC614296FA02710C7C7FE5A2953B997837A3381CCDE78DFB8D205ACC1BAC029645';
wwv_flow_imp.g_varchar2_table(12) := '402AACB6B2F1969304BAA17E7A679B01EF1079C3A165571144F7344F1F1B0FF5010B220BD6D08ED5EFBF4F855583D1BE1E8F3FA187C9083DC44D6B5ACCFCCBB77A5BE52D5B7DC0BA64AB0F54FFBBD5FAF9DD1C092B2CF439B23E654AF3BB5FBDFD02504B';
wwv_flow_imp.g_varchar2_table(13) := '010214001400000808007C9AEE5C2B9279FE400200008E0A0000120000000000000000002000B68100000000544D535F454D504C4F594545532E6A736F6E504B010214001400000808007C9AEE5CBD0D745706020000EF0A00001A000000000000000000';
wwv_flow_imp.g_varchar2_table(14) := '2000B68170020000544D535F454D504C4F594545535F70726F66696C652E6A736F6E504B0506000000000200020088000000AE0400000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(44433602320144509)
,p_file_name=>'APEX$DATA$PKG/TMS_EMPLOYEES$403982.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191955Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_tms_hr_policy_42963_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B03041400000808007C9AEE5C4EEB545874040000450D000012000000544D535F48525F504F4C4943592E6A736F6EAD964F6FE33610C5EFF91484CFB121CBB2E3E496A4DE6E80ED36C89FB6685104B434B68950A496A4EC3516FDEE7D43D98E9C8D77';
wwv_flow_imp.g_varchar2_table(2) := '0FF12140409143FAFDE6CDCCB7938E0A54FACEC53F27DF4E3A95D52A5F3FA9A273D13F39EDE432D0DCBA75E7A2F389E4923A580B2A68C2C2A531B5D422AE8BDB788E3FE7D60432011B3ED45A77832A49505969BB26F2C2514E0AFBD3A128E4DA0B3B13B2';
wwv_flow_imp.g_varchar2_table(3) := '89A3639C8A9CC8A526534827D6245D6F73815FD85A17624A08F1A5261FA81032F0291F445859B1227AF64219218BA53439212E765495B34B6C9DAE4558F0D9CABAA0CC5C94D2C83921FCA3A93DC76ABFA2946BBE2997CE297C9B59B7920E7BF2DCBA824F';
wwv_flow_imp.g_varchar2_table(4) := '072BB4C53B45A397D0AA54C1F7E2EF7704D18AA7298B76793BF9EBE9F6F1EAD3CDF5D3E3FDE4AEBD41B24669928EBAC959B79F3DF4D38B74749164BDF16034CC064992FCCDDBEBAA7889F7EBE4F32F933FDACB3F8A321A0E9B28FF9D9CEEB34D7FC2F65E';
wwv_flow_imp.g_varchar2_table(5) := 'E5CF3F203BF98E673FD9F1ACA42A84E7002F481B921FAC1372EA09743CF433D01F54A489FC10DD535E078EB6B2EE9965E690A7ADECD97091FE1954C080E1AA02BCA8504CA3B0795DE28932286B78C3C7BBA331391F65C9FB999C8FCEFA07980CF699DC3A';
wwv_flow_imp.g_varchar2_table(6) := '3B8DBFA3CD65B7286EC9295BEC63F94C2BB1500E4279729051425D47D42DB163C1626DCE56F16C4FFCD67880292E15CE5A33B5B249706C9E2310D47756C3C05F2BCA1B59B1C4CE420CD8A28C4ECB17943F575699E08107CBC43467CA951CCAD1BCD67073';
wwv_flow_imp.g_varchar2_table(7) := '8391F1088F50F5D1EC9225E3B3F4DD68B2E43C490EA0C9F6D1DC516903893F91A56D38ADE5B75DA3D55C4D35BD4A684E7688C467F55AD415E72D1B22FA89CDC3954DAC14106E8AD6A6AC49DD138CFC25DCA648E63696293C7813B7B9A3A81DF36851F6B8';
wwv_flow_imp.g_varchar2_table(8) := 'C94965F03F6CF6A556558387425D359803C9124535385BD479C42F24F01A1B44415AAEA9381AC534C9B2F7534C93B3C1018AC37D8A57646886AADD46F891A486CE37C6D72EA6F6C420FF35AB72A802B21CB4258BDC87FA6525CDBAEB2BA8052F1462D144';
wwv_flow_imp.g_varchar2_table(9) := '55BBA833674BEE47CA45BF0AFE553D142B286F0A2F6877299F096EABFCF70019D11BF8B142A0CE1D8F4D1A93079DD1D392CC4B7BE5043B1ABDC1A07F040F0E06D9210F8EF6E9DDA3573815D66D7A372696A458E3B6DF7FD2BFCA1AE30306801DB5C66205';
wwv_flow_imp.g_varchar2_table(10) := 'B27BA9B84D3151760FFC6124232E6B1D547726F3C0DDAC86C626A0F9F0A58D659A1943F8DA73CD4428BF7D8A3239BA1557495572CB92D1F1B0FBCD83F81D4E6FEAEBD19064C3E40848B2E1E01092B37D24D7D670916813B9B6E8CE98095A9F5E285CE618';
wwv_flow_imp.g_varchar2_table(11) := '0DAFADAB36ED85FB50D46C566BE651D666272CA4D3B5E7D9208735E4D4BA3DC5A3D7A203314E143ABA64D63421165C613650ADE480176005D7D4DE4A4B5812350E00A2D18E0660948E8E50D14683747C00C0781FC083C3BCA5DBFA5F413383362E9A4F6F';
wwv_flow_imp.g_varchar2_table(12) := '9A61B727347B78BE8E43C4EB6EB3EDED536B793AEB89C9EBCAC346AA1CCDC871D9DBC443CD292C860C26E5EB2906E5666AAC007C5398660C76BA7D476C7C7216E274882AE654753424E3241DBE1FC93819EE90FC8BBFFF01504B03041400000808007C9A';
wwv_flow_imp.g_varchar2_table(13) := 'EE5CCF1C2D709A0100002B0600001A000000544D535F48525F504F4C4943595F70726F66696C652E6A736F6EB5945D6BC2301486EFFD15A5D746B45370DE395BA7E0171A2F740EC9D2A8D9D2A4247122E27F5F1AA76ECC0AEB5CA1859E73DEC373DEB467';
wwv_flow_imp.g_varchar2_table(14) := '97731C774119017A1B13D7A939E57C1252942F4D508A4D125B20A648FE544A3816A12948526EBD73E78D61B3EADABC11004518C15A489BA69A44EA905B1194A814A01C2CA854FA677BACDE93EE4C28125AF9CC3D68174262C3286904362BD353C5085B5C';
wwv_flow_imp.g_varchar2_table(15) := '2DD79F52C1D611572666DE9ECCED383BFB34398E225BEC0EFA9D7663326FFBB6ABCD8548A3D3F0DE394C308D100378850E83142E480023DCCACEBA6FC3C78251BC9DD3F0ACA50ABC2AC14F63DBF83E9FC2DBA8C3E0B13F9CA4E096D2914AC5E265268C34';
wwv_flow_imp.g_varchar2_table(16) := '590AB9CD8A04DBB013FC9EC74BE3D1543392D99F7E0F063D98867385A75C4C3548704DB8CE8C340CCCA1F9F3870C87E6552A294C9298630BE72F998FED88554F33AB72E55B2A5DA7425FCC323F6A843488907AB3351373816E17F8FECC8533B7D5F2CAB5';
wwv_flow_imp.g_varchar2_table(17) := '6EBB361A159ACD7B386DD5E0B49B75A6F1C0BFBDD5EB38FCA3D547AC5B5A7DA4FA6FABCDF3D9AED31849B383930D9DAC54A79ADB7F00504B010214001400000808007C9AEE5C4EEB545874040000450D0000120000000000000000002000B68100000000';
wwv_flow_imp.g_varchar2_table(18) := '544D535F48525F504F4C4943592E6A736F6E504B010214001400000808007C9AEE5CCF1C2D709A0100002B0600001A0000000000000000002000B681A4040000544D535F48525F504F4C4943595F70726F66696C652E6A736F6E504B0506000000000200';
wwv_flow_imp.g_varchar2_table(19) := '020088000000760600000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(44433971216144510)
,p_file_name=>'APEX$DATA$PKG/TMS_HR_POLICY$42963.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191955Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_tms_interview_stages_99460_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B03041400000808007C9AEE5C4AD74005AB020000FD09000019000000544D535F494E544552564945575F5354414745532E6A736F6EB5965B6FDA3014C7DFF914569E81C5B9933E751D9DBAAD152AE936ED2264E253F09AD899EDF4A26ADF7D763A2E';
wwv_flow_imp.g_varchar2_table(2) := '2D946A402322E0F8F8F8D83FFF7D7CDF7298865239E9F7D67DCB519A4C60C4A893E256DBC909A78C12BDB048F83DFFFDE0CB49094EEA0C7309C0199F38A685710DF29AC10DC8C6DBB7DEF914685D001DD980A687E77A51C78D3A1867D84D5DFBE9BAB3E7';
wwv_flow_imp.g_varchar2_table(3) := '9B0D236A9D8B26FA408A1C805AE3A5F91E93FC6AC485066547D652F009329E65CD594E34131C99C4917A68F840AEC98F37C34A9AE4D0A5A8396D5CBAE8545C03D20269C8A7B663812AC2A1E83A4DB6429A81836E6097418249998EC67766B8C341FFEB68';
wwv_flow_imp.g_varchar2_table(4) := '70F1F6D3C9D1E862D83F77961C889ECF2BEEE020C35EEA45A91B7463EC7B7E389B575DD145BCF7FDB377FDCFCBE64D51C2E45F943FADF6235CDEFFE1CAE6733E99B15A070E6F0497643848FDADC1F56F73280AE01A5933186214149B704499CA6BA52CC7';
wwv_flow_imp.g_varchar2_table(5) := '1BA6A7A89224D74DB2875F86086E2B900C780E8F49257B2295C48B896C4F2A49F033A4FC1552DE6B93F24C6AF805890D679DD7B21A5865A0B11057400F9004559780D454DCA899CC0E0727CFA0E17551EC878D87233FDA998D87633F58CF265861132EB1';
wwv_flow_imp.g_varchar2_table(6) := 'F1B664E36D64136638DC89CDB1306A41C4AC9E4AD1C77A0C92836941C2C0688E3AD5461948492E852C51296C2463623C67D4AACFD0AC8CD36B310B9238D89D59D08B7AEB99852BCC922566C15366A7849B7F7233B160133137B6896D5FB08E0A2012811D';
wwv_flow_imp.g_varchar2_table(7) := 'D214256574648E415B9CE0969495617330D394F1904C0B7987AA82705B5D1F1F79E19E10C549BC075925AE1BAF4714AD16A7E5EA143E6574CC3829D671899EE712767094E1E8052E47C2AEB0DE7C959082D09254E8574D27A555C8C36D825CC15414D4EC';
wwv_flow_imp.g_varchar2_table(8) := '9DB2D943B6A98BCEC1DE3C4CF5028AA64C3E294ABDFD10F2DD9EBBBB887CEC2E8AD24FF3FE05504B03041400000808007C9AEE5C94AD328301020000DB09000021000000544D535F494E544552564945575F5354414745535F70726F66696C652E6A736F';
wwv_flow_imp.g_varchar2_table(9) := '6EC5965D6F9B301486EFFB2B10D77195A4C9B4E58E82B3A09564236453BB4CC83587C62BE0CC368DAAAAFF7DC659124D2B950659860412E78BE7BC1C8C9FCE2CCB4E5906483DAEC1B646D6A05399242BEEB451F04D654B4926A1B30F8582F24407542EDB';
wwv_flow_imp.g_varchar2_table(10) := 'B9BAE82FA2F15BDBF87502929001555C18375390CBAD6F05A4CA928815286542AA3FCB53F95055CFB884C4A42FED6D6ECA05D58C82E568B3D235E59A5083AB44F92B9567655E486DD3775FF569594FE6AA7D05C94DB03D8F9CF738F63D53D4B812A2C8BE';
wwv_flow_imp.g_varchar2_table(11) := 'F7FEC10C94E524437445B67D9CBF908232284CDA21EFB7DEA5227710B3E490CA24FA2E79B16FDAD89F3B35B4AE33F57CCF894E474C4991301DDD863AC49F4EC62BE0470BD2ED344C9D00D7D0F6EA89DE745F7BE7E6110DA9FC6984C3CF3EFE82C393E9C8';
wwv_flow_imp.g_varchar2_table(12) := '0A05E281C106441B3DDD09F61657D88BABA1AD211FD6D3F57A359AD215246506495C8DE6A1AE5E1472A2504EE4BD89BBD6070A02E4794B3B5ADA93497F300AFCD17C7E3E1EBF8B6E26A3E82668DADB6C11B9B3268372513328BC5494379F9231C6DEA5E3';
wwv_flow_imp.g_varchar2_table(13) := '7E88A7B308CFEBB05EE11A74BB35642940724BE87D5C70BDD0361F86595827D7B1D759CA456321DD10EB61F5E2CBEBBF7FB7FDE1F065222A404F6A12DF3EB6C572A2E37D473B2AA2FECF37B4F8E81D5FEA729DB4947A87754CA97754FF5A6A7DFD66B63F';
wwv_flow_imp.g_varchar2_table(14) := '6B22F49EA9DA5149F37B3A7BFE09504B010214001400000808007C9AEE5C4AD74005AB020000FD090000190000000000000000002000B68100000000544D535F494E544552564945575F5354414745532E6A736F6E504B010214001400000808007C9AEE';
wwv_flow_imp.g_varchar2_table(15) := '5C94AD328301020000DB090000210000000000000000002000B681E2020000544D535F494E544552564945575F5354414745535F70726F66696C652E6A736F6E504B0506000000000200020096000000220500000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(44434231153144511)
,p_file_name=>'APEX$DATA$PKG/TMS_INTERVIEW_STAGES$99460.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191955Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_tms_jobs_172409_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B03041400000808007C9AEE5C9CB16B1CD6010000BB0900000D000000544D535F4A4F42532E6A736F6EB5D55B6BDB301400E077FF0AA1E776C8B22E96DFD2D674835D42B38CB2518C6A8BA0E1CAC6964B43D97F9FD22DABEA687DA81D8C5F8E0E077D';
wwv_flow_imp.g_varchar2_table(2) := 'BA1C3D46505B75D7C3EC47F418C19FCD6DA12B98C5D109B4DAD60A6630371B6D94EAB4D9804FD2C88DEAA01BBED3A6E8652DBBAD4B8F29426817940FCF41F23758A9D6FEAB5A764A5A5515B72E032E96F975B15C9F7DFC705EAC57F915F412A475091861';
wwv_flow_imp.g_varchar2_table(3) := '768AF8694CBEC638C32C43E41D8B3122AE32FABE4B1FDAEAB9DE65FEF922FFE6875FABF26782AECAAFE8C4B363CFBE5246371DB850F7AA6EDA43781A72A363B909E1E97437A16E0103EEC4733BF097B607FBAD1FB39FA631628B74A4A633A9A9E06CBA9A';
wwv_flow_imp.g_varchar2_table(4) := '218C426AE2A9DF5F81B3A177E2BE074BD959F346399E49CE3926D3E59C531192D397F24BE5B8B2D6BD1D9B293E34B36399051678BA5924FB957B6966FEDD96B5EAC1A22C9BC158903FA872B0FA5E8DF5BBB377B0E368A44FE6D163C4133A59EFAA3016D2';
wwv_flow_imp.g_varchar2_table(5) := '734FBFEC9A6A28EDFF3ABA08A8633C6E6C6C263646A998CEC6719C86D8A9CF96DBAEA96BB06A55A9C3A73D2067633899099ED0196EB8AB4279082EFC8E2EAD040B23EBED2199055EB1F4586422E6201341838F778C3CF3FADABDDCBDDE84FA78E8561FEB';
wwv_flow_imp.g_varchar2_table(6) := '78BB1D9A81ECBE644FBE71FF6F504B03041400000808007C9AEE5C11B5D6B49C0100001007000015000000544D535F4A4F42535F70726F66696C652E6A736F6EBD955D6BC2301486EFFD15A5D746B4B3B0795757C50EBB894698CE51629BCEB8F483246E';
wwv_flow_imp.g_varchar2_table(7) := '13F1BF2F8DD33266BDA8CE420339E7BC87E7BCA4CDA6A2697A482806629D625D6B69CD6A16E2247E9341967C66B110518EAB87521CFB49200BB2946EF56F8C31ECDEEA2A2F0580638A7D9130952602477C975B6094A93820310809E3E26F7B9F7F64DD69';
wwv_flow_imp.g_varchar2_table(8) := 'C271A0E4337DA70D13E64B464622F0B9903D798A7C852BD8EA479AD05514731993BB17F96ADA46AD3217A34815EB0F4F6DCFB1554B9508904087C98D3C8C7D12210AFC05DA4D513B220114C74A96EB7E4DBE4CE61E097221E160C993F830B08A6FAB05A4';
wwv_flow_imp.g_varchar2_table(9) := 'D081FD4E0168A318A661D68FD30822282E0BE33A8FDEC8EA5BC3C975AC8B48EC7144115B9726B69EAF4B8CBECE24B63B0378B5B319E0549C7138EF871D0B766CAF5DE4EE89136A98E671269F612470E0CD4B5BB8C7B260019679E2C3699CA64222EF297F';
wwv_flow_imp.g_varchar2_table(10) := '4611122042FC5DD54CE4035C17D8F64C8733BDD7339A2DD7698D46B56EF70E4E7B2D3875CBCE341ED897B77A9506675ABDC7BAA4D57BAAFFB65AAEAFEACA481193F74C760B71C555AF6CBF01504B010214001400000808007C9AEE5C9CB16B1CD6010000';
wwv_flow_imp.g_varchar2_table(11) := 'BB0900000D0000000000000000002000B68100000000544D535F4A4F42532E6A736F6E504B010214001400000808007C9AEE5C11B5D6B49C01000010070000150000000000000000002000B68101020000544D535F4A4F42535F70726F66696C652E6A73';
wwv_flow_imp.g_varchar2_table(12) := '6F6E504B050600000000020002007E000000D00300000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(44434598484144512)
,p_file_name=>'APEX$DATA$PKG/TMS_JOBS$172409.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191955Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_tms_job_requisitions_674791_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B03041400000808007C9AEE5C531F11F2C00100007708000019000000544D535F4A4F425F5245515549534954494F4E532E6A736F6EBDD4616F94301807F0F77C0AD3D73BD21668395E39DD694C8C5EDC668CC690E7E8B31D0A05A11897C5EF6EB9CD';
wwv_flow_imp.g_varchar2_table(2) := '5B156E5902B900A1297F1ECA2F4F7AEB91DC60D992E48B77EB91067FA4B92209F34EC8B76AB31B733B56589BFD031BEAB035A8D2CD0D49480937E0D760B0780E59893EFE82B22E90D824D47553FDFC1BAC9BDC2635E4CD20B8455059D56973F7B9D680E9';
wwv_flow_imp.g_varchar2_table(3) := 'EC9AC8FB1A75FFBCB2F754D96FD8394EB958507BB20B4A93DDD947B2A26AF13EA3BBA2E8A71A84FD324FD7AB4FE9FAF2C5DB372FD3CBF3D507E204C0ECEBCA050B2F184FB84868E88B804792514A3FF7F1AE560FF55EAFDE9DAD3EBAD38F559134BEABF2';
wwv_flow_imp.g_varchar2_table(4) := 'DB3B719CB9E31CB8CED1D0B9C8A1F4B32DEA5998D9939983633047C1524E678E4241C7980387397299F990F911BE7F9CEF7FFE10E91AB5CAF5F5B3D3DD3B501CE265F418BC92B119782513E1186FE8F00A973718F2B6D5550EFE3534590EB33472F0B446';
wwv_flow_imp.g_varchar2_table(5) := '8E163C3A86742CC572BA741CB3D1468E1C69E94A8BA1349A2D687FD354D5F776FE2DE3555E14A8C6ADC3053B6CFDD0F9FF65A6E387B43FA6E2DB1A9118C3170EFED2C50F87F8BA82ADDF20AA499BC8590357E6E0CE111FA19F434EE50CA49CB1FDCEF1D5';
wwv_flow_imp.g_varchar2_table(6) := '5E7F00504B03041400000808007C9AEE5C7720A5CBDF010000C809000021000000544D535F4A4F425F5245515549534954494F4E535F70726F66696C652E6A736F6EBD96D14EDB301486EF798A28D7355A5B3A46EF027155264A42E34C82758A8CE3AE66';
wwv_flow_imp.g_varchar2_table(7) := '891D6C078410EF8EE3AEADA635484BB2464AA49C73FEA3EF3F962DBF1E398EBB641905FAA5A0AE33764E7A554831FED304A578AE624B9C29DADB96524E446A0AAA94EB5D0D07319A7C716DDE0880A219255A489B669AE66A9D5B515CA914601C2C9954FA';
wwv_flow_imp.g_varchar2_table(8) := 'EFF6443D55DD33A1686AE50B77AD5D0A490CA36439785E999EAAC0C4E26A59FE968AACCCB93231F3F7DDBC8EF36ABF26C7716E8BDD39BC492E7DDBD22652ACF1D6F96017A684E538036485D72E8EF7484046B995ED747F3897F43161E94EC8147850826F';
wwv_flow_imp.g_varchar2_table(9) := '0DDBF85BAF86F46B707E30D20771DF82D487213A186A4A0BDD82D5AC7F0C2304FDE4FCB606B8FF01D46854BBD425559AA6C9FD4B53342F0CE7C1B7AEC9705148F1D40A6C0A3DFF2288AFD16156B83A258828B96ECA1B210FC5D1BFCF70F8693F90D25897';
wwv_flow_imp.g_varchar2_table(10) := 'AA294D10C2EBC4F710AC011AD6039DEEE71105E58929A6BB8EE674CCB1063956BF6CC9AD79C06C067C7FE1A2853B9D0E4EC6B3CB7114357571711544B05B1BF6903FB88F39F43ADFFD4452DC6EEF6FB0BCBA3D36AAC7EAF73FA6C2BAC17C8F2793337437';
wwv_flow_imp.g_varchar2_table(11) := '1DA3BB59534F71E8773FEAB2485B8E7A83D5E5A83754FF7BD4E6FBC3DE750A2CCD05A9BA3E55F71DE7F3D1DB3B504B010214001400000808007C9AEE5C531F11F2C001000077080000190000000000000000002000B68100000000544D535F4A4F425F52';
wwv_flow_imp.g_varchar2_table(12) := '45515549534954494F4E532E6A736F6E504B010214001400000808007C9AEE5C7720A5CBDF010000C8090000210000000000000000002000B681F7010000544D535F4A4F425F5245515549534954494F4E535F70726F66696C652E6A736F6E504B050600';
wwv_flow_imp.g_varchar2_table(13) := '0000000200020096000000150400000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(44434816676144513)
,p_file_name=>'APEX$DATA$PKG/TMS_JOB_REQUISITIONS$674791.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191955Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_tms_leave_balances_786234_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B03041400000808007C9AEE5C6007A986870100002C0A000017000000544D535F4C454156455F42414C414E4345532E6A736F6EADD65B4BC3301407F0F77E8C3C6F929C5CDB372F450491A14E44919275410ADB1C5D2794E177379DB04B20589A140A';
wwv_flow_imp.g_varchar2_table(2) := '497AF83FFC3849BA4B50D598E50665EFC92E4133BDD0ABD214D51C65241921B35C2FBE5A735C5818FD6D8AA65D1F975AA36B9401066127BA2CEBADB15F80DBD976D30DBB516D96BA5A55ABCFAED2CECBDAE8C6CC8B598B327439C95F8BC9F4EAFEEEBA98';
wwv_flow_imp.g_varchar2_table(3) := '3EE58FE8A44037B6A00B1F633926EC99400622C3EC42AA54A5D83E6F5DF9763D3FE6DDE60F37F9CBE9B23FC54608F697F2938C1C02E841005E02820F04E49C208D2390524C59B800C592FA04A82B00039B009C26A09108986069380113CA4BC05C023A90';
wwv_flow_imp.g_varchar2_table(4) := '409E13101589400013E1040214F6117097800D24604E1790480452310827904A721F81E841D0EB287036429C265098102943056C0A50E11390AE001FD804C2D907714E43852988E026B02914131F817209C44002EAEC038844C031D070028EB9F211A42E';
wwv_flow_imp.g_varchar2_table(5) := '811C48801D021E894046E982FD8DE821D86FE6FF0C7A9D058E0189F367A4B0522AF846B029291C0C3EECFB0B504B03041400000808007C9AEE5C6911C50ABC0100008F0800001F000000544D535F4C454156455F42414C414E4345535F70726F66696C65';
wwv_flow_imp.g_varchar2_table(6) := '2E6A736F6EBD96516FDA3010C7DFFB29A23CE36AB0226DBCB9C40C24C21084497454D1D5398637DB8962D30A55FDEE75CC0A9A5AFA10BA448AA5FCEFFEA7DF9DE2388F174110AE854462770586412FB86A559211FA9713CBFCA1D2D6200DB60EA9A8799E';
wwv_flow_imp.g_varchar2_table(7) := 'B9842A14D2F1E7CE22197C097DDC19884189DCE6A50F0B8BCAEC631B84CA6588D0642D4A635F97E7E6BEAA2E738399B7AFC2BD779D97DC31964291878DAB690AE01ED796DBBFD65C6E95364E734F3FDD1D048F7E75310DCA2787D7744C277D968E225FD6';
wwv_flow_imp.g_varchar2_table(8) := '0733B070E8BE7394910B0592F00DEC3BB97CC342246A6F3BFAFEE9FE0E24688EA9C88E6661C86F93EB43E35E7F6A9D2066F174FC7DC99A434655C87C87E7308F19FDC1D264396D8E5A22DC635A659EC1BD6474D60CEE0E9DB92625EDF7670BD6D05C8173';
wwv_flow_imp.g_varchar2_table(9) := 'B7C16A4F74316F0A746BEA53CE584C4793D1E45B33A8252A10BAFA7ED6E4EDCF184D58945E2F4F00B7DF81EA76DFA6E22582C52CBDDB9D8B45931358DDD358EDF6FB54608F35DD59A0C01205E6CF7EDBBA8BC43189A25598ACC2E1B073D58B47BDF9FC72';
wwv_flow_imp.g_varchar2_table(10) := '30F89ADC0C7BC94D5CFB059E461F3FEA6D919D39EA17AC8F1CF50BD5FF1EB55B6FFD895D40E9366DF513603CD7A78BA767504B010214001400000808007C9AEE5C6007A986870100002C0A0000170000000000000000002000B68100000000544D535F4C';
wwv_flow_imp.g_varchar2_table(11) := '454156455F42414C414E4345532E6A736F6E504B010214001400000808007C9AEE5C6911C50ABC0100008F0800001F0000000000000000002000B681BC010000544D535F4C454156455F42414C414E4345535F70726F66696C652E6A736F6E504B050600';
wwv_flow_imp.g_varchar2_table(12) := '0000000200020092000000B50300000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(44435108434144514)
,p_file_name=>'APEX$DATA$PKG/TMS_LEAVE_BALANCES$786234.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191955Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_tms_leave_requests_911612_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B03041400000808007C9AEE5CD237DD7302020000A107000017000000544D535F4C454156455F52455155455354532E6A736F6EBD946D6BDB3010C7DFFB5308BD6E8A2CF9A97EB7ADD9188C11DA748C956214FB32B4D9B226CB01AFECBBF79C862571';
wwv_flow_imp.g_varchar2_table(2) := '1E164818D8208EF35FE7FFEFEE9E3DAA1C540D4D1FBD678F5AF8D542E33255D0D4F7AE2854A6AC3B80BF8112E40232D79975A871D2BAAC900E684A39E3D188C523964C194B970FED757431CCF0F9564621BB265B5D0FA81C62CC826C6A8DDFBC97952A3B';
wwv_flow_imp.g_varchar2_table(3) := 'E2AC326456D73FA12072EEC092C658A51D31A5D45AE9EFD7F4B51ED7E20FD137C6D87A81621894AF67BBAC5A60204771BC289B757DE664FC359B3CBCFDF4F15DF6703FBEA31B09D26D161D4C7D9EF22865C175E247499C30C6BEF5E9AD29D67A1FC69F6F';
wwv_flow_imp.g_varchar2_table(4) := 'C75F36C347546226562A7FBCAB01033E6410EC32E0FB194423CE8E33C00CFF2803BEC500D03E2275412CE4BD95C84355F07F2DE73EF7C3B32D4795881FB25C0C2D8F4F6EFB64D8D43B96277D21C72C179B964FFAB6C65E77166F2F572D5FEB592D6D81DD';
wwv_flow_imp.g_varchar2_table(5) := '4E64EED44239050D9116485E63D9E00648EEDB59A59CDBC324BA1013C1137E3E1321F84126C19049B8CB441C5C45E25FAB68903164E26F31018B0789348CA971F754A0DDB6E177F003F27D7E5F6A06421E5E6006427E131CF23B1CFACD4F9E819B11F38F';
wwv_flow_imp.g_varchar2_table(6) := 'FB8D19E1E9AB7F8AFE4A6C73200B99E3A1D6CB6D4F0CEAF6336001EB6A80CC2DC0EF7E06F45CD96A99B88DE5D6E2FCEC30D16D595E084B2C78703E9658AC57D313BE2F504B03041400000808007C9AEE5C4CCFA471F9010000FF0900001F000000544D53';
wwv_flow_imp.g_varchar2_table(7) := '5F4C454156455F52455155455354535F70726F66696C652E6A736F6EBD965B6F9B3014C7DFFB2910CF7195E6A26D7963C3512A85868153893613F2E06461E336DBA48AAA7EF71A274D562D7E18642081C4B9F13B87BF2D3F5F1986B94E5240625782694C';
wwv_flow_imp.g_varchar2_table(8) := '8C51AF36F124FF218DAC78AA6D6B9A72E81D43218F8A5806D42ED39A0F074B32FD682ABF4C401C528844C1943B1190F1BD6F03B4CEE228C9D13A615CFC5D3EE2DBBA7A5A708855FACADCE7AE0B1649469664E869236BF292460A57B0EA905AA455967369';
wwv_flow_imp.g_varchar2_table(9) := '936F8FF2368C67F594BE9C662AD8F4F0D725F649786BABB2CA1953418FDD0F4E6688928CA628DAD07D27D76752500AB94A3BE5BDEB9EC1EF0AB80893F8949C70F49317F9B171657FE96988B1E3CE1701C69D214356A6C50EA005F31C5BF7382481DB1D75';
wwv_flow_imp.g_varchar2_table(10) := '0A740B611DD982DB27964742DB2258033DD4837D38CFC505652294D1702A29B59C518132CA7FA998405EC871906DAF4CB23267B3C168E2DC4E7CBFB166EEECCB760179DC750FB615F8E161B9E28E4414D31D0F0F4B161AABC8C396BFB8D310DFDCE8B146';
wwv_flow_imp.g_varchar2_table(11) := 'FD7E5FB78DD0FAFBCD654D96BE0E48CF33D4D0484D8B8A37A5B15CD75BDC63AFB3AD8196252BB6C05A6C0C5FE43F952A0C3F07FF3EC5C1787C9E2B927F55CA2CFCBE6B8B65110DD6588FF58710CF5251D160B15F4FA79FC8C36C421E9CA63D2D5DFBF2A3';
wwv_flow_imp.g_varchar2_table(12) := 'AECAB8E5A8DFB02E39EA37AAFF3D6AF9FCA68E482565F25C559FBAB842BE7A7905504B010214001400000808007C9AEE5CD237DD7302020000A1070000170000000000000000002000B68100000000544D535F4C454156455F52455155455354532E6A73';
wwv_flow_imp.g_varchar2_table(13) := '6F6E504B010214001400000808007C9AEE5C4CCFA471F9010000FF0900001F0000000000000000002000B68137020000544D535F4C454156455F52455155455354535F70726F66696C652E6A736F6E504B05060000000002000200920000006D04000000';
wwv_flow_imp.g_varchar2_table(14) := '00';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(44435408177144515)
,p_file_name=>'APEX$DATA$PKG/TMS_LEAVE_REQUESTS$911612.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191955Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_tms_leave_types_630859_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B03041400000808007C9AEE5C87C009AD0A0100006004000014000000544D535F4C454156455F54595045532E6A736F6EBDD3414BC3301407F07B3F85E4BCC9CB5BDAA6B96D5A4418529C13514688EB3B14D75AD24E2CC3EF6E8A480B427768F190CB';
wwv_flow_imp.g_varchar2_table(2) := 'CB3F0F7EFCC9C963594D79C5D48B77F2D881CC07E9BA2949672953DC9BB1C2E4C4145B16C5D11C2ED66D80B9716E3E756A9A4A97647543C63285BE9BEF2D999A52FDDAB48F92F84927DBD5FAF64A6F37F13DEB054CED020818CC219C73F1C05161A0405C';
wwv_flow_imp.g_varchar2_table(3) := '860184D20780E7367E2CD36EDF4D7C771D3FF6C7435BA4E43F5BBEBCD95F1B76B64DB67F1B94719848867E88E36518000EC8169D2C215BBD17677A9BA83609E10246E3DC96080670A28733968AFA0C2E98A83A89119F40879118AACEEF742BB2ED5DEE88';
wwv_flow_imp.g_varchar2_table(4) := 'FFD29E10EECB8CF60911C95FDFCE9D6F504B03041400000808007C9AEE5C3EDD2BCA93010000CB0500001C000000544D535F4C454156455F54595045535F70726F66696C652E6A736F6EBD945F6BC23014C5DFFD14A5CF46B453D87CEBD68A821DA275AC';
wwv_flow_imp.g_varchar2_table(5) := 'CE11B2F67666EB3F92A813F1BB2F8DD3326685A95BA181DC7BCFE197539A7545D3F4904680C42A035D6B6BCD6A5EE234799545962EF35A48220ED5FD28247E1AC881BCA59BFD2B63EC76AE75D59702C421025FA44CB5A980986F7B3320B98A239AA09032';
wwv_flow_imp.g_varchar2_table(6) := '2E7EDAFB7C91BB47298740C9A7FA561BA6CC978C8CC66839939E3C23BEC2156CFE254DA3799C705993BB27F96ADA5AADB29790580DEB7DDB7CB0B1EB0D6CDCB394B3EA0744907D004651069FC62442FE8C6C0F533B204111244A56E8BE0510015900CE27';
wwv_flow_imp.g_varchar2_table(7) := '310D0A3DE5E88DA7C9FEF8AABEA99670DF9B8E5D82DB28476AD4EB879994EF89288EF9882DD31BE1813DC49E6D0EFF27C6987CE080AC38CE80E11548A713F9EF86B6E9DA16BEF57E1FA8D16A1DA6F3191001017E599D8B65BA2558AD23DFB9719C8A88C2';
wwv_flow_imp.g_varchar2_table(8) := '53FE4831112826FC5DCD78F2418E832C6BAABB53BDDB359A6DA7D71E8D6A9DCE8D3BE9B6DD8973EA99C603EBF251CFB3E0CCA87758978C7A47F5D751CBF5595D771961F28ECC6F50AE902B9B4F504B010214001400000808007C9AEE5C87C009AD0A0100';
wwv_flow_imp.g_varchar2_table(9) := '0060040000140000000000000000002000B68100000000544D535F4C454156455F54595045532E6A736F6E504B010214001400000808007C9AEE5C3EDD2BCA93010000CB0500001C0000000000000000002000B6813C010000544D535F4C454156455F54';
wwv_flow_imp.g_varchar2_table(10) := '595045535F70726F66696C652E6A736F6E504B050600000000020002008C000000090300000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(44435731040144516)
,p_file_name=>'APEX$DATA$PKG/TMS_LEAVE_TYPES$630859.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191955Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_tms_offers_917370_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B03041400000808007C9AEE5C913AB5F156010000480400000F000000544D535F4F46464552532E6A736F6EB5D25D4BC3301406E0FBFE0AC9F55A9234E9D65E39B5882032DC26A248396BB359EC9769261BC3FF6E5A6576B653610C5A2887B727270F';
wwv_flow_imp.g_varchar2_table(2) := '6763A05889B444DEA3B131503E9F0B19C411F288D1432164511C8112DB8A14AFDBEF3A2BA2A08404E41A792EC718EB7AA940AAA0FA0D798862EA98B86F123EC1D8AB1FA4336255C472FD3384E94E4837524B3D191A8B4C5505280A99BFE92367FA3894C2';
wwv_flow_imp.g_varchar2_table(3) := '1AAC4277484E214C852556901689A882A114BAFE951B8EFCFB60343DBBBE3A0FA663FFB61900D59C914D08F5A8E36166F56DD7A5D5851EAAF8B288BEFB5DFA3717FE5DB3BCBF0BC384B99F5DDE8DDE0E306D010F1AC0AC0378407F01A6F43FC0BC1B7824';
wwv_flow_imp.g_varchar2_table(4) := 'F41CD9E264580343D2C62EF3790CD6026418C331B899CD08399CDBE69C7573DBED7D6E2E34EFF02664B017DC3129FB13DC3109EE061F86A128F45DDAD0423D4366CD649EBF944781E67D8C0F87E6FD7A1B6BE827FD7E00504B03041400000808007C9AEE';
wwv_flow_imp.g_varchar2_table(5) := '5CD65EECD6E00100004909000017000000544D535F4F46464552535F70726F66696C652E6A736F6EBD96516FDA3010C7DFFB29A23CE36A405137DED2261148A5658999464715798E33BC26716A9B76A8EA77DFC5B4A0A9B80F21038948B9BBFFE9F7F75D';
wwv_flow_imp.g_varchar2_table(6) := '243F9F388E9BF19C21BDAE98EB0C9DB34E1D52BCFC0541299EEA584672C53ADB5256529142419D72BDAB7E6F86C3CFAEC98300299633AA853469AE59A136B92523B54A215EA28C4BA5DFB7A7EAB1EE9E0BC552235FB81B6D26240546C90BF4B4849EAA22';
wwv_flow_imp.g_varchar2_table(7) := 'D4E06AB97A958A7C55940A62F0F603FE8EF36C9E902B49618ADD9B300CA264EC9BA62695124DB6DE7BBB30A3BC2039A24BB2F171BA478272561AD94EF78F7791654C263CDD49B942BF9528B7A64DFCA563A1BDF4AEFDB1EFE1E068C4949429876A760075';
wwv_flow_imp.g_varchar2_table(8) := '147C3D1AAF640F07909A6D08FC24F6AEBC687EC49D6069A2484EE4BA29798CBD0827F56A58A8FB76B2F3FD604A13A9937AF6BB96F0D51544A382A87B5333871F9A4C90EF2F5CBC7047A3DED970321EC671531FC1F7E9389AB76B84FDA9B85C1FDB094C04';
wwv_flow_imp.g_varchar2_table(9) := 'CF628B89AEDD44FF93751C7AA59AD278D36974F30D56FBC2B6D61F20F50683FD4CA4AAA47884E5FDD978712FA30066DD3217950C86DD0696872D58033B56B7FB3115D10DD6F0340CBFE0DBD110DF4E9A7A9A4DFDF68F7A55A5071EF51B569B47FD46F5BF';
wwv_flow_imp.g_varchar2_table(10) := '8F1A9E77E6B25111093794FAFEA2CC477CF2F217504B010214001400000808007C9AEE5C913AB5F156010000480400000F0000000000000000002000B68100000000544D535F4F46464552532E6A736F6E504B010214001400000808007C9AEE5CD65EEC';
wwv_flow_imp.g_varchar2_table(11) := 'D6E001000049090000170000000000000000002000B68183010000544D535F4F46464552535F70726F66696C652E6A736F6E504B0506000000000200020082000000980300000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(44436014147144518)
,p_file_name=>'APEX$DATA$PKG/TMS_OFFERS$917370.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191955Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/shared_components/files/apex_data_pkg_tms_onboarding_tasks_933069_zip
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '504B03041400000808007C9AEE5C47C950FCC90100002307000019000000544D535F4F4E424F415244494E475F5441534B532E6A736F6EC5945F6BDB3014C5DFFD298C9F1B23FF919DF8695D13D6C2E842928EB231CCAD7D49446DC948329B29FBEE93DC';
wwv_flow_imp.g_varchar2_table(2) := '7549A993C01228D8188EEE3917FFAEB84F8EC734D6CACBBE3B4F8EA7413DE6ACF4B2C0B9F0B06E2AD121F6426A84FE94438D5EE6DDACDC25EAB6F18C0E4AB135C732D7C29C540C6ABFD820FF00458D3EFE029383B6AE008D6B21BBDE6E85B2C5BC34A211';
wwv_flow_imp.g_varchar2_table(3) := '42122623928CC2F18A90AC7F6C85D2A05B650DDC9D4BB196A8541F256CA8363D9FFDBCAD2A2B4B042B3ED81E97F3D97D3EBFFBF8F9E62ABF5BCE16DE4E01E87F3DD35110AF82300B938CC47E1A4F68420921DF6C79DB94DBBC4FB3DBE9ECEBAE7C282549';
wwv_flow_imp.g_varchar2_table(4) := '26CF29BF9D8B5DB2E131B2D70B772A8AB646AED55BBA8D641DF81C983C84F77AB10F6F3A8CF7EA85E710DCAD3B79E53E036D1A24C9F864DA34484934483B3A467B8A0D486D61BB5F24331FD04CF0B7DC516F80FB0F5288477588FC366FCF0422323C815B';
wwv_flow_imp.g_varchar2_table(5) := 'A1DDA536DEE1199CEF82D3288CC3D39147613A1E441E1F433E874E8AAADAB73FB8808D2F11CB4398FF66ECBBE593775E2294127A06C6948CD341C6F418E32516AD64BA732F7F82446E7ED85D49609CF1F57F6EEC7E4330E0050E424F47247AEF8B6DF6F6';
wwv_flow_imp.g_varchar2_table(6) := 'E474E8098DC90BF41FE6FD03504B03041400000808007C9AEE5C8283D5ECEB0100000A09000021000000544D535F4F4E424F415244494E475F5441534B535F70726F66696C652E6A736F6EBD96516FDA3010C7DFFB29A23CE3AA40513BDEB22614D4A654';
wwv_flow_imp.g_varchar2_table(7) := '8D79A0638A3CE700B7491CC5CE2A54F5BBEF62066C1A41AACB1A299672777FE7777FDB925F4F1CC79D8B14885E15E03A7DE7BC558794C817182CE54B1D9BB354416B5B0A39970916D429D7BBED76267470E99A3C0A888214B896A5490B0D995AE796C06A';
wwv_flow_imp.g_varchar2_table(8) := '9522222773512AFDEFF45CFDAC674FA582C4C867EE5A3B972547C65264E4658973AA827183ABCBEAB754A655962B8CE1D7377C1DE7D58C98CB59668A5DEA4537F1C837739A4CC234DBB6DED985818B8CA5842FD9BA8DD33D1292426E643BDD5FAD6BA69E';
wwv_flow_imp.g_varchar2_table(9) := '6391EC9442912725F36DCB26FED66A600DC2FBDBF134083E8D17B222952B800F301B7FEFBC3068206E1FA03A3B3B60A3F98325941745A3EBBBC08FE9D802ABD7DB8FC594128B1C92584B5BB02B8F06D7E387E9FBA92E1BBCE24CC342962B5B227F12C43E';
wwv_flow_imp.g_varchar2_table(10) := '523510759B892EF6032515C458FBC7DAE149CE982619AEAAA998E243C290F8FECCA5337738EC9CF7C3513F8A6C7B88A84727D1FB3DED3678AA34D395B25EE3311EE380E2EE3BAAAF5CE261058DDBEF93DDBD7A08BCBA9BAF16BBB6F12CF11258DDCB0FEB';
wwv_flow_imp.g_varchar2_table(11) := '8DBBC1F2680356AF19ABDD3E4CC5B485BFA783C117FA38ECD3C7D0B6A7C9BD7F7CABAB22F9A0D51BAC635ABDA1FADF56E3F8DDDC160A56E215A3BE8028837CF2F60B504B010214001400000808007C9AEE5C47C950FCC901000023070000190000000000';
wwv_flow_imp.g_varchar2_table(12) := '000000002000B68100000000544D535F4F4E424F415244494E475F5441534B532E6A736F6E504B010214001400000808007C9AEE5C8283D5ECEB0100000A090000210000000000000000002000B68100020000544D535F4F4E424F415244494E475F5441';
wwv_flow_imp.g_varchar2_table(13) := '534B535F70726F66696C652E6A736F6E504B05060000000002000200960000002A0400000000';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(44436361767144519)
,p_file_name=>'APEX$DATA$PKG/TMS_ONBOARDING_TASKS$933069.zip'
,p_mime_type=>'application/x-zip'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191955Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_144_rounded_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000090000000900806000000E746E2B800000B92494441547801EC9DCF6F155514C7EF548DC18D0D2CB009045914E2C2564D44360A85B250A2FF800B12C34EFF03178585FF81EE88090BFF010DBAA058D00D60';
wwv_flow_imp.g_varchar2_table(2) := 'A2F6B930402212481013086C2044609CCFBC9E32EF31AF6F66EE9D3773E79E86D33B737FDFEFF9F4CC7D33533A65F44B15B0504001B2104F9B1AA3002905560A284056F26963054819B0524001B2924F1B2B40CA8095029501B21A551B77460105A833AE';
wwv_flow_imp.g_varchar2_table(3) := '6C66210A5033BA77665405A833AE6C66210A5033BA77665405A833AE6C66210A5033BA7766D4C9033446BAF99F9777656DEEEC990F43B7AC1E63E49B7871E300BDB1727AFFDCCAE963F32BCB2B732BCB71FCC85CCA9A89E36F43B7AC1E68845E18DA4D9C';
wwv_flow_imp.g_varchar2_table(4) := '98A1011B0188850B304F4CB4624CB4141BB3DFE8574105A2259368867659A04C035F130548C061E10A8C4B6FF78112985CF63CAEAF890044B865710ACE3877B8288F96D01ACD5DF436AE8FDA01EA2F849F907153D172B70A00D2E9636EFB7CB6B7DA0092';
wwv_flow_imp.g_varchar2_table(5) := 'CB9549AED546BF1A52205A62AF892FEA9A402D003161F797ABBA24E876BFEC35F1053EA963A5CE0162A24CB88EC96A9FD515C027F8A67A0FF92D9D0314EB252B5FE916E4D6E11BA700B1618EF57E4E0B50C99F02BEC147F9A5D5729D01D49F987EDAAAE6';
wwv_flow_imp.g_varchar2_table(6) := '8649B68A928FF9EE3E9D3903C8E8A5CBF8F3E5EE07DD0940FDE8E38F7C3A53635C6DA89D0064DA1D7D8C7E3DAB40ECC867D60069F479D6393EE4C4C9871D1751C81A201FC4D239E62B103B88420E0072B721CB5FA6E6D6A5409C4421DBBEAD007211026D';
wwv_flow_imp.g_varchar2_table(7) := '17A0EDED14B0F5A115404F1C106CB77C6D6DAB80AD0FAD00B29DBCB66F5E81C844FB6C66610950B4643378DBDB86303FDB7D506580F84D8110040E618D36BEAC0C5008C2EA1AC72BA0008DD7486B6CA0406580E2C7D1EE0DFAD5A24014A80C5020FA04B1';
wwv_flow_imp.g_varchar2_table(8) := '4C9B60A0000581487D8B5480EAD036A03E3B09D093070FCCA3DBB7CDC31B37D29463F202F2EBC496DA29808004681E5EBF6EFE4B007A72FF7E9A724C1E204D4CD94006EA0C40C001244033B7E355B3383F6F3E7E6F5F6A73C9F9D6E9E914A607972F07E2';
wwv_flow_imp.g_varchar2_table(9) := 'DAC92C736A32C3D43F0A51865100E7F51D3BCCD697A7394D8DF3C5B97903486410A548C719116D5C9DD0CB3B0110D107470248161CF2B206484422A2D42838C807302215118D14630CCAB2FDE9B1E9C65FEB21FA0006808C73AAD4A1CD705D20011A00DB';
wwv_flow_imp.g_varchar2_table(10) := 'B9658B11A31EF529A30EE76A7D05BC8F401215368A3CFDA5F6BF8FAA07184042ADA37BF79AA3EF3CB52F3E386C0ECEEEA228DD4751373D71FECDBF0EBD07A88AE4442BA28CB40542810758766EDE2245EBE981D959431919D4A50DC7A38C724013E37C54';
wwv_flow_imp.g_varchar2_table(11) := '5D9FF33B03D0AD7B770BFBE1D6DDBB66EAA597D6EB0B4C07D7A2CC7A41CE01D1896C20221D368061CFC4E58E3A629C53365CDFF773EF019ADAB4A9940FFEB8762DADFF5CA61D4E26F3C0EC2CC9864674626F24D0652BB3F996BEF6CCCC9893C9A50FFBEC';
wwv_flow_imp.g_varchar2_table(12) := 'CDB70C46197075291A790F100E7C21D9F01255040EF24659EFDADF69513602910114A4652C0B02D105A8D6C179FFB0D9F3CA4C6A9F2600614044FF8044DA059BEAC2229E4F000208E018051197B8E5DE6ABA5C8093C89585202D2CF12DDB874071720D9C';
wwv_flow_imp.g_varchar2_table(13) := 'BC6E04224003B8BC3ABEE575022044070A528108908006039CE5D5554394023480A32E2610705CD4AE268F49B27501827389301C8F3220224A0970A3EAF992DF19800061D3AE5D06908008031A0C707008652F6EDBC6E1800115505CBD737B203FEFE4C7';
wwv_flow_imp.g_varchar2_table(14) := '2B57D26CFA4A0F926F8F9387B749628083B4A8D944BFA1311A3BED0C40A220D1E5C5EDDB53907032C639705126F5B22975383F71FE3CC98676E64AFF591AD0494522105145CEC7A5EC8DC6D5F1A5BC7300213CD10858C438277F94512E107DFEFD292351';
wwv_flow_imp.g_varchar2_table(15) := '265B9FE8441979D4A50DC718305DBC7993C3E0CC7B80B80C606C4ACB5AD6DBC00618E4116580E5C485F366DDD6A21375A84BBD61BBF84F3188A45E16C2E1BE7C39F71A2080E1061DC6A6B4AC714F863EC45980C1E50E48C84BF745C98699942843197528';
wwv_flow_imp.g_varchar2_table(16) := 'CB9AD4FFEAB75FB3D9B9C7D4215A499BDC4A1E657A0B108E0798ADD3D3E9BB3FBCC651D4786A8FE127FAA02F8E31A20290B067C280264D93CD3765D41936F2010C300064B85CCE893C5FAE41C61892EF73EA2540381CC70301EFF9F080B48CF1441E0338';
wwv_flow_imp.g_varchar2_table(17) := '9C475FA479061C79F9C379F2E90E408EFC70CA6441021CCE8F24FB2BDA7525FAB0162F01928FCD40C022AA5A0A5D12C168CFE5AC8CF1D80290692B46A4020E221120BDF6F50983010EE74429225A9BA28FCCBD6AEA25407C6CAEBA6069C70DC66F7E3A97';
wwv_flow_imp.g_varchar2_table(18) := 'DE5C248F4719658C3910B9808E4D3C7D60C001248084010D297944A9A2118DBE7C302F014258F63EA4558D1B8CB43D983C81E7358DECFB3F458E69435BFA002452312001240C6848C993F22EA5DE0264E3041E73D01E000E1478024FDD3CA32D518B68C4';
wwv_flow_imp.g_varchar2_table(19) := 'E5AC8C65A3565EDFBEE40509903867E796CD725829E5E6A234240A95316E3D70F9033AE9C3C7344880D8FFE02CDEED21AD62C0C3A30FEE11F1188307A9658D7181CE6788820408C7D91AF0D007D0F00A070F52CBDA9F9F1C35C00744BE5ED21420282869';
wwv_flow_imp.g_varchar2_table(20) := 'F2AC0C7880A664F381EAD21E88060ADA7EB2363F05684D882AC9DB3333559A0DB4E1C93C51888DF8408127270A90278E6AEB3415A0B67AC6937929409E38AAADD3F41A206E088AC947F3B60ADDD579790910CF9778CF99F79EC5FEBD7BAFAB3E6AF5BABC';
wwv_flow_imp.g_varchar2_table(21) := '0488E74B3CA0C480A9D50A777C72E5016A89203CA0C4B2BF61DA92A905350D6F0172E1A5F5F79D2F9C373C9A70D167687D040D10CFB19EDA9DD07CEF64BD4103C41B84BCE8E544C9403B091A205B9FFF72F3A6E17D67B1A2FD497D498BB66B633D05C8C2';
wwv_flow_imp.g_varchar2_table(22) := '2BBCE7CCFBCE182FCD17ED0AF06823C63BD47CA22CDABE4DF514200B6F700BC1C6F1D29ECB289F282DA6D258D30902D4D81A6B1B18786C1CCF2D08DAFBFCBEB402541B5E6174AC0085E1E7DA56A900D5266D181D2B4061F8B9B6552A40B5491B46C7DE03';
wwv_flow_imp.g_varchar2_table(23) := 'C447615CC5FB40458DFA6A6E14F001A0422BE5FD207E5DB98851978FE0853AD64A1B2AE03D40DC43018632E6F38DBB0DBDD940A1F700A11937E3CA18D0D14ECD5E814E00642F83317FDDB99DFEE79AFCD2E038A32E632A881DF97B6138B3AA0101973FDE';
wwv_flow_imp.g_varchar2_table(24) := '0BE23FD72C62D4A54DD531BBD44E2350E24D2E7FF26E10FBA322469BA469F0FF14A00C0244A3A2966916F461A7019A9467B917C53B3DFC7F88458CF788981BED487D3605C881F7D80F610051D4B84C12ED1C0CDF68170A9003F901813D11BFAF56D468E3';
wwv_flow_imp.g_varchar2_table(25) := '60E8C6BB50801A7781DF135080FCF65FE3B3AF0C50F45C7CA9F1D9EB041A57A032408DCF5C27E04C019B60A000E5B941F30A2BA00015964A2BE6295019A0D57717FB7FFB31AF57CDF34A011B5F560608852263CE1AFDF25C81F8B8CD02AC008A4D7CCE66';
wwv_flow_imp.g_varchar2_table(26) := '706DEBBF025600258D350279CE80AD0F93F6D515F87DE19002545DBE56B4B4F5A1154028A0FB205410F32D8DADF63FACD60140F69360226A7E2A600D102150A3909FCEEF2D1C3A663B736B80984064340AA1835FE6C6674E00220AF9259ECED645F44145';
wwv_flow_imp.g_varchar2_table(27) := '2700D191D128D497C18BEF6EA20F4B7506509F68771363726A7528101FEFFBCA4DDFCE00623A4C4C37D42851DA26D200DFE023978339058889E9861A15DA6975F8C639406CA8A74CBCD04E09C39D153EC137AE15700E101364A24C9890C9B95A730AE003';
wwv_flow_imp.g_varchar2_table(28) := '7C814FEA98452D00315126BCBAB09844A2D8FA7639FDA95551203E8E0FF04595D645DAD406900CDEDFB42944A2C7E452B79FB646CDBB76801818887A0B8B49345590D0A32E4B043ECBE50AAD7B0E1E531499E744009289B0A8DE3A480A93E86293D256C0';
wwv_flow_imp.g_varchar2_table(29) := 'A9FB72C558C336518064F05EF2D3D1B7C5889F98FE5D6C054AF41997020C9AA15D2FF9816C021C99632300C9E0A46CF07A19A0A2E7CD6E3113451F856EA285A4BD35607A89666887864D5AE3000D2F9EDF1010EBED3FF85DE8265A483AAC57D3E7AD03A8';
wwv_flow_imp.g_varchar2_table(30) := '694174FC720A2840E5F4D2DA430A28404382E869390514A0727A75A7B6A39528408E840CB51B052854CF3B5AB702E448C850BB518042F5BCA3752B408E840CB51B052854CF3B5AB702E448C870BA195CA90234A8879E955440012A2998561F54E07F0000';
wwv_flow_imp.g_varchar2_table(31) := '00FFFF58C0A372000000064944415403009F67358AB185EFB10000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(19582726431390922275)
,p_file_name=>'icons/app-icon-144-rounded.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260715064303Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064303Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_192_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000C0000000C0080600000052DC6C0700000DEA494441547801EC9DCF8E1D4715C65B0614391B5B1E09C75222338B198905B640227805D24C36904760110979076FC09A37809D8594058F10D8D82058992C40';
wwv_flow_imp.g_varchar2_table(2) := '0E0B245B2258B164B2186436B12220D0BFCE3D9DE3F6BD73BBFB56F5AD3F5F94E3AAEEAE3A75EA3BDFD7D5DDEEDBBE70E37777FF271306B572E042A3FF8440C508480015275F536F1A09402CA81A0109A0EAF46BF2150B40C91702BA0412072A47402B40';
wwv_flow_imp.g_varchar2_table(3) := 'E504A87DFA1240ED0CA87CFE1240E504A87DFA12408D0CD09C7B0424801E0A556A444002A831EB9A738F8004D043A14A8D08480035665D73EE1190007A2854A90181E11C25802122DAAE0A0109A0AA746BB2430424802122DAAE0A0109A0AA746BB24304';
wwv_flow_imp.g_varchar2_table(4) := '24802122DAAE0A818A0450555E35D991084800238152B332119000CACCAB66351201096024506A56260212409979D5AC462220018C042AEB660A7E230212C0466874A0060424801AB2AC396E444002D8088D0ED480800450439635C78D0848001BA1D181';
wwv_flow_imp.g_varchar2_table(5) := '1210D8360709601B423A5E34021240D1E9D5E4B62120016C4348C78B464002283ABD9ADC360424806D08E978D108142C80A2F3A6C9054240020804A4DCE48980049067DE1475200424804040CA4D9E08480079E64D5107424002080464526E14CC680424';
wwv_flow_imp.g_varchar2_table(6) := '80D150A96189084800256655731A8D8004301A2A352C110109A0C4AC6A4EA31190004643A58639203035C6EA05F0D9F3E70DF6E993270DF6FCE1C306A3FE9FB3B3069B0AAADAE78340B502E849FFD147CDA7AD7DF6C9270D66A9A3FEEF5600188290100C';
wwv_flow_imp.g_varchar2_table(7) := '99B2CA2A05D0917F45FAB1E99410C6229557BBEA04C0999C33BE4FD3D5CB979BB76EDEECEC87DFFD5E6376E3FAD71ACCB74508F8F0FB54CF1781AA04007121B0A5EBAA11FFC6CDE6EAA5CB9DD931CA6F5CBFDE60EB44C02A421B59DE08142480ED897889';
wwv_flow_imp.g_varchar2_table(8) := 'FC2BE26FEB89085815108CB5651591080C8D7CCB6A04C0D9DFA7E9AD96FC7E7B4C9D3E5E045E5063FA23188C274C1837D71875E2C3C6F8519B70085423004FD6E125CD1438590DAC3D4F8A20B46D6F2A6903C95935B0AE5FFBD4C9DAB34D7C188290100C';
wwv_flow_imp.g_varchar2_table(9) := '99F8651502F08482FC9EC45321BECABD427BEF30B65F477E3D711A0BD7E2EDAA10406854BD80386B6FF28FF038E3FBE3870707CDED5BB73AFBD90FDE6ECC4E8F8E1BCCB7C5373EFC3ED5C322508500FEDBFE6DAFC1F6D5CB97AC1AB584B810D806E989FF';
wwv_flow_imp.g_varchar2_table(10) := '9D5BCDE19583CEEC18E5C9D151839DB64260DB0C1FAC22B6BDB6D4CED908542100AEB10D212E61AC3EB7F43EBC6FEF0FE2DA7647FE15F16DDFA6F2A41502AB027DAC0DAB88446068842DAB104058C8B67BE3ECEF5BDD6EC9EFB7C7D4E9E345E00535A63F';
wwv_flow_imp.g_varchar2_table(11) := '82C1BA9BEF274FBAF79BB8C1669BF8B0317E4A6F5385002EBCFA6A9FC78FFFF5ACAF87A878DFE6CF93F5747049636DC694A7ED6A60ED586920B46D6F2A6903C95935B0AE9F9E386D82ABA942001B673FF3C05F1E3FEE7B7EE9E2C5BE4EC59F5921FF8923';
wwv_flow_imp.g_varchar2_table(12) := '31C7A75877AFD0DE348FEDD3915F4F9CC6C2D5B5AB42005F7124F2E4ED1048FC0FBF0AF895651836C2E38CEFF7BF79ED5AF36EFBA409FBEB8F6E37663FF9E6B71ACCB7C5373EFCBE1CEABBC65885003C481F3F7BD6EC721984803E78FCF7DEE5979DB8D8';
wwv_flow_imp.g_varchar2_table(13) := 'E99F381D1E5C61577483B810D806EA89FFFDB79B375FBBD6991DA3FC712B006C9D08584568538B5DA861A217DACB147FAD0E89E7CEDB93DFAF2CE68F6B6EAB730963F5B9A5F7E17D7B7F2F917F457CDF665D1D11B02A20183BCE2A529308AA1000C9F564';
wwv_flow_imp.g_varchar2_table(14) := '6515B8FBC103764FB2619FE1D97F92B3408D39FB7B57EFB6E4F7DB63EAF4F122F0821AD33FE736D5088055E09537DEE87385087EF587DF376356032E99203F7DCC811794EDA3F42BCD87FF3C635730F3BECDA927EBF092C6DA8C29590DAC1D2B4D2DAB40';
wwv_flow_imp.g_varchar2_table(15) := '350220B98860485C2E691001461B33488F41FCBB0F1E3443F22F75F6FFEDA347165273DE1327C8EF49DC771A59E9EE15DA9BE691CD8B6996B100E6E500E2AE13014260453083F498273E23B28AE083FA3AF3BEEF39F2AE6B9BDA3E2F20BFB2A41667C878';
wwv_flow_imp.g_varchar2_table(16) := 'AA1300E041E08BC7C78D272BFBCF332E3F203FABC879EDFCB10FCFCE9A5D2E8338FBDF7BF4B07749DCFD465BF14F9CBE5DE1D9BB8560E7FFAB1480A106A14C08880192DB31EA18A4EFECF5D79B31E4A70DFDCCCFBD1D56817B8EFCC4673EADE45ADDEA5C';
wwv_flow_imp.g_varchar2_table(17) := 'C2587D6EE97D78DF73FDE5D0AF6A0158821002F64A4B72048151C73A42B78F51ADED98D2939555E0CE1FEF8FE9F6429B611FE27BA18136822020010481F14527888655C3F622829FFEFABD864B1ADBB7A9E49209F2D3C7DA7841D93E4ABFD2BCFF8FA7EC';
wwv_flow_imp.g_varchar2_table(18) := '0A66DE7730A7093A9200222505110C89CB250D22C0FCB0901E83F877EEDF6F86E47FE9ECEF3B07ACFFE2CF7FEABD0D9F38F5070AAB142F009E67776F47BA5782792D3884E177F817519E1F10779D0810022B8219A4C73CF1F1C32A820FEAEBCCFBF6E45D';
wwv_flow_imp.g_varchar2_table(19) := 'D756FBD62350AC007AE2AFDE8E8C7153874F1E1722A64D4280C0DC5378B2AE4FC5177BB9FC80FCAC225FEC3DBFF6FED3A7CD2E974108E8E76E0520EEF3472CE3689102E8C8BF22FE5269322130F6BA31219409013140726B471D83F49DB537E363C84F1B';
wwv_flow_imp.g_varchar2_table(20) := 'FA991F486CF5A9A5273FF14DED9F6BFB2205C00B5D3E217CCB874F1FF271AB90864FBE32E1C762EC4D22A01D42C078C2842030EA5847E81D9E38B10ABCF39BF71866920DFB10DF240719372E4E00C34B1148DA7DD0EAD2E5E069E2B7C17C218231BC7356';
wwv_flow_imp.g_varchar2_table(21) := '03BF1DB38E6858356C0C44F0F55FDE69C6AC065C32417EFA58FFD4CFFE1667A8B22801407E4F3ECECE903414589BFC30861701F706E7AD029BFCCCDD8F0886C4E592061160DE2FA4C720FE3BEDA3D921F96B3AFB834B5102604266909FB3B36DC72E1101';
wwv_flow_imp.g_varchar2_table(22) := '975A360E9742DC1C87B2394F9C1001C68A6006E9314F7C626615A98DFCCCBB2801F8776396FAFE0F20DA5BA3C317E73816CA585558DD10142BDD3ABF10987B8AE16AB0AEADEDE3261AF2B38AD8BE9ACAA20400492C799C91AD1EB3ECC83F785D3AE678F8';
wwv_flow_imp.g_varchar2_table(23) := '36216CBACCF242400C909C7E18750CD27736F289137D4BB4A204B08F04F1CAB41FF7F0E0F34F1FF271AB90C6E7144F079F58E1326B9308880921603C616265C0A8639CF131DAD56C190920BD340D7F440349BB0F5A5D39081E2CBF0D3E393AEABE29EA9D';
wwv_flow_imp.g_varchar2_table(24) := 'B31AF86DD5A72120014CC3EB85D6FC88C6769CB66767486ADBB14AC64068E69FCBBEF356016BA7723D0212C07A5CB6EEF5677FC87FD29E9DB7760AD4001170A965EEB814E2E63894D913A74D37DB366E09A50430338BDCFC5AD7C385BEFFC378F6D6E8F0';
wwv_flow_imp.g_varchar2_table(25) := 'C5398E853256152EADB0D2452001CC648D7FE4C91979A69B49DD3AF20F5E979EE460466344C0CA52EA6596043083148B77590DC82BD3AB6A57F02D9FE1670FF9D0D5AE864FBE32D10DB2FA83CBAC12452001AC129C7A31FC110D24ED3E68F5DAB5E0A1F3';
wwv_flow_imp.g_varchar2_table(26) := 'DB60BE10311401AB41F0C1F6EC5002D87302C60ECF8F68AC2DC484A4B61DAB440408CDFC736F50DA2A20015876132EFDD91FF243CCA5C245685C6AD978A5AD0212806536E1F26FEE138BFBF8FECF92825B3A0D12C0D288CF18CF3FF2E48C3CC3C54E5DFC';
wwv_flow_imp.g_varchar2_table(27) := '985C06EDE46C62E7D8CD2580D808CB7FD208480049A747C1C5464002888DB0FC278D800490747A145C6C042480D808CB7FD208242C80A4715370852050AC00EC1FBA189685E44DD30884405102E0F7AF8170919B4A10284A00FCFE5522A884B981A65994';
wwv_flow_imp.g_varchar2_table(28) := '00C00411F0E36F6FEC97098175081427807593CC6E9F025E0C01096031A835508A08480001B262FFD0C5B00CE05A2E22232001440658EED3464002483B3F8A2E320212400080F5C42900882B174B1712C0D2886BBCA4109000924A8782591A01096069C4';
wwv_flow_imp.g_varchar2_table(29) := '771CCFFEA18B61B9A3DBBEFBD0AF6DF70D0AAB4800852534F6744A7BD5440288CD9882FC437E5E3529684A4D42022809D6787359F289931F8B7A69E4274B120028C8AA454002A836F59A38084800A020AB160109A0DAD46BE220200180C2BE4DE3EF0D01';
wwv_flow_imp.g_varchar2_table(30) := '09606FD06BE01410900052C88262D81B0212C0DEA0D7C029202001A49005C5B037042480BD41AF814160DF2601EC3B031A7FAF08542780E1A712E76EEF356B1A3C1802550880B7188321367014D3F760286D4640A00A01F016630CA2E213DF11F222970B';
wwv_flow_imp.g_varchar2_table(31) := '21508500C012A2F24A6F48C327BE65F922B04701E40B9A222F070109A09C5C6A2633109000668036B6CBF0538973B7C78EA776D3119000A663766E0F6E8CCF6DB0C3C198BE77082BEBAE1240E0F471631C83A8F8C477E070AB77270144A000443DF769D3';
wwv_flow_imp.g_varchar2_table(32) := 'F17133F5383E23845ABD4B09A07A0AD40D80045077FEAB9FBD04500805EC1386BB9685C0317A1A12C068A8D26BC88D71ACA862FA8E15F31CBF12C01CD412E9C38D710CA2E213DF31A6999A4F0920B58C4C8C07A24E7DA2B4AD3D3E2786916D730920DBD4';
wwv_flow_imp.g_varchar2_table(33) := '29F0100848002150948F6C119000B24D9D020F818004100245F9C816810505902D460ABC600424808293ABA96D474002D88E915A148C800450707235B5ED084800DB31528B821190009648AEC64816010920D9D428B02510900096405963248B8004906C';
wwv_flow_imp.g_varchar2_table(34) := '6A14D8120848004BA0AC3192454002483635650496FA2C2480D433A4F8A2222001448557CE53474002483D438A2F2A0212405478E53C75042480D433A4F8A22210510051E39673211004010920088C72922B021240AE9953DC4110900082C02827B92220';
wwv_flow_imp.g_varchar2_table(35) := '01E49A39C51D04010920088C0327DACC060109209B5429D018084800315095CF6C109000B24995028D818004100355F9CC060109209B54E511686E514A00B9654CF106454002080AA79CE5868004905BC6146F50042480A070CA596E084800B9654CF106';
wwv_flow_imp.g_varchar2_table(36) := '4520A00082C625674260110424804560D620A9222001A49A19C5B5080212C022306B905411900052CD8CE25A0401092004CCF2912D021240B6A953E02110900042A0281FD9222001649B3A051E02010920048AF2912D021240B6A94B23F0DCA3F83F0000';
wwv_flow_imp.g_varchar2_table(37) := '00FFFFA34EA3B200000006494441540300984078EA1935D77D0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(19582726725351922276)
,p_file_name=>'icons/app-icon-192.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260715064303Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064303Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_256_rounded_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000001000000010008060000005C72A86600001000494441547801EC9D4DAF25C579C7EB8E13A1F1C6889142901811220D92178124521C5631F3C222F147C8022962977C832C1816F906F60E59F2221F61F08221';
wwv_flow_imp.g_varchar2_table(2) := '6367E5B08070B288049209C2D2184B832E1B8FAC241CF7EF9C5B779E53B7CFB9A7BBEBADBBFE57F34C7757573D55F5AB7EFE55DDE7ED8AD39F088840B3042400CD0EBD3A2E02CE490074158840C30424000D0FBEBADE36017A2F0180824C041A25200168';
wwv_flow_imp.g_varchar2_table(3) := '74E0D56D11808004000A321168948004A0D18157B7DB26E07B2F01F024B41581060948001A1C747559043C01098027A1AD0834484002D0E0A0ABCB6D13B0BD9700581ADA1781C60848001A1B707557042C010980A5A17D11688C8004A0B1015777DB2610';
wwv_flow_imp.g_varchar2_table(4) := 'F65E021012D1B10834444002D0D060ABAB22101290008444742C020D1190003434D8EA6ADB04FA7A2F01E8A3A2341168848004A09181563745A08F8004A08F8AD244A01102128046065ADD6C9BC0BEDE4B00F69151BA0834404002B06790FFFCC17BAFF5';
wwv_flow_imp.g_varchar2_table(5) := 'D9CB0FDEBB2BAB9741DF9891B667989B4F6E5600B8283082F99507F71F787BF9C1FD35F68D3B79D067CE9DBC25AB9741DF9891C6987A7B32D65B21E33A708DFE3523000CF29381BFBFE6A2C05C17D06BE75EF3E6F4B778024FC67A2B645C078803D70713';
wwv_flow_imp.g_varchar2_table(6) := '02B6240887FAB2580120E019C8EDA06E03FEC9C01F42A273AD12E0FA70DD84805941E05A720BFD5B9C003058043DAAEEBAC1DC0EAAD39F080C26B0BD764EDEE25A42109850063BA9BCC02204C0073D83C4606D07AE72F26ADE0C099CBCC53586106033EC';
wwv_flow_imp.g_varchar2_table(7) := 'C08526CF5A007CE02BE82F8CAB129212D83E3B4004B0A4554D747E59F1590A8002FFB261D5F93C049E08419EFAE2D7323B01407135E3C7BF10E4710A8127B70653BC94283B1B01F0B3BEEB1EEC39FD894095041082F7EE56D9B43D8D9A850068D6DF337A';
wwv_flow_imp.g_varchar2_table(8) := '4AAE900022C09BC9CA0BC13170AA170082DF69D677FA9B1B0184A07E11A85A0014FC73BBE8D5DE5D02F58B40B502A0E0DFBD9474345702758B409502A0E09FEBC5AE76F713C82F02FDEDB8985A9D0028F82F0E92529640A04E11A84A0014FC4BB8D0D587';
wwv_flow_imp.g_varchar2_table(9) := 'FD04EA1381AA04C0E969BFD3DFD2099CBCC57B5A6AE9653502B09DFD6BC1A27688403A02EBC413DD9096572100DBE0E77DD5439AAEBC22304F026BE75EDB5EF3E5DB5F8500B88A14D1E94F04B210A8E356A0B800D4A28459C65C95888021B0AE60E22B2A';
wwv_flow_imp.g_varchar2_table(10) := '00DBE0D7D2DF5C13DA6D88C0BABB1588FD407028BEA20230B4B1CA2F024B23B02EBC0A2826009AFD977629AB3F6308AC0BAF028A09C018582A23024B24B02EB80A282800BAF75FE2C5AC3E0D27B0EE5601C34B5D2C3126A588006C97FF639AAB3222B04C';
wwv_flow_imp.g_varchar2_table(11) := '02A51E061611005770C9E3F42702151258178A89EC02504AE92A1C73354904CE09ACBBDB8012B1915D00BEE93A7ADE6BED8880089C1398121BE74E06EE6417801377F2FD816D54761168824089D8C82E002C759A184D755204061228111B5905404FFF07';
wwv_flow_imp.g_varchar2_table(12) := '5E11CADE1C81DCCF01B20A4073A3A90E8BC04002EB11AF060CAC62277B560128718FB3D35B1D888008EC10C82A006BBD02B0035F07221012C81D23D90420F7BD4D0856C7223017023963259B0094788D732E03AE768AC0580253CB651380A90D55791168';
wwv_flow_imp.g_varchar2_table(13) := '8540CEC9329B00E801602B97AFFA399540CE58C9260053A1A8BC0888407C02D90420F7D3CDF8A8E45104EA2210A335D904204663E543045A209073B29400B47045A98F22B087401601C8F9BAE69E7E2A590466452057CC64118059915763456006046235';
wwv_flow_imp.g_varchar2_table(14) := '5102108BA4FC88C00C0948006638686AB208C42220018845527E446086042400331C3435B96D02317B9F450072BEB739269C9CBEBE79FCD86139EB545DF512C815335904A05ECCE55A46B0FFEE57BF72D8E34F3E71BFFBE28B8DB18FFDDFA3470E2BD742';
wwv_flow_imp.g_varchar2_table(15) := 'D5DC02010940E6513E0FFC2EE0BFF9ED6F1DD6D784FFED0400F362D09747692230958004602AC101E599D199E9F705FD3E5708012B857DE795DE0E81D83D9500C426BAC71F014C20DBD3CF3EFDB4BBF3CA2B1BFBFBBFF9BEF3F6F20B7FE2309B17D16035';
wwv_flow_imp.g_varchar2_table(16) := 'C00AC2A66B5F04A61090004CA1776459667E02D8677FD607FECBAFB867BFF3F4C6FC39B67FF6C20B0E431042216005411E9908C42020018841F1800F82DFCEFC9BE03F0BFC03C5CE4F21041744A07B78789E413B22308180046002BC638AF605FF31E56C';
wwv_flow_imp.g_varchar2_table(17) := '9E5004584D8CBD15A01CA2C42D8935D23867EBD57E5D0452B446029082EA994F82EA6C77B3B9D3CDFC9B9D11FF2102AC1E7C512B2C3EEDD096B6F00C815B08CA6E44E4EC5508F649E31C79C87BC897CE2D87800420E1581254DE7DB88CF7E943B68880CF';
wwv_flow_imp.g_varchar2_table(18) := '4FD01E33639387A0B66DF13EF66DC94B1909C13E42CB499700241A4B02CFBAB6C16BD387EC3FCB03C3EE01A22F43A0FAFDBE2D01CCAC1E9E7BF1DA3577FBC64B3B465A980FFFF808D375BC1C0212804463C90C9DC2F5B14242E012C0B60D04F99BAFBEEA';
wwv_flow_imp.g_varchar2_table(19) := 'DEFCEB57DDAD1B37768CB47FF9BB1F6C44C196C107BE6C9AF6F3134855A304201559E3D7DEBB9BE4C9BBFB44868025706D053EF05F7CE69A4DBEB08F3090D79EC057B8A2B1E7B53F5F021280F98EDDDE9613B0F62433FB65816FF3937753A6BB55F0E97D';
wwv_flow_imp.g_varchar2_table(20) := 'B712FEDC315B0424B463CA294F5A021280B47CB37B67F6B79586B3B93D77D9FEEDEE36C1E6097DDB737DFB04FCF94B8D5F6C3FEC849078E34123E787FAEDAB4B69E3084800C6712B56EA37A75F9FD77DE5DBDF3EDFF73B76F6BFDD3DE86336F7E7866E29';
wwv_flow_imp.g_varchar2_table(21) := 'CB73035FCEFAF6697DDBF3C0EF829EDB14AC2F1F699CC32F62202180C8454B9922014844D706E797A7A7EECBAF4FA3D7F4ADAB57777C127836E1563083DB73C7EEF370D0E60DEBB0E7D8E73C333C81CD7168DF7BEEB930E9FC182190089CE3C8B2230148';
wwv_flow_imp.g_varchar2_table(22) := '84F94A109C76E69E52E5EAF3FFD95BDC069D9DB9F71638F284F565EB088B13BC04BF4D27E07FD2BDBA80FDF73FBCE97EF2B73F706C31D2FEE92FFED266778800B7053B893A48464002900CAD7376157028708F6DC27F7DFEF94ED63F300FE938F1FF8F1F';
wwv_flow_imp.g_varchar2_table(23) := 'B3D9D89F5EF2B47F93E9C8FFAC2F5B872DCECC4FF0DA34829B80FFDE1F3FE7307B8E7DD2FEB11300C480BCA461888C440012E9ED4AFA2ADAADE10F8300BDBFFA78340C82DF8A48E87BB4E34805C3999FD99DE03ED63D7943116045716CF9A5E64BDD2F09';
wwv_flow_imp.g_varchar2_table(24) := '4042C2DC06D840E55900813CB44A9E1FD8E0A77C38FB9356CAC240259099DD87B60711E096C1976345C1CAC21F6B1B9F8004203ED31D8F046A782B304404C87BFFE3DD95C353D7AFEFD451FA8040F56D20F809647F3C74CB2D832D637DDB74EDC7212001';
wwv_flow_imp.g_varchar2_table(25) := '88C3F1A097A79E7FFEC2F3807FFDF79F3B829BD93D2C4C1AC62D4338F3B3A260651196E1D8BE2AF0CBAF1E9114C5AC2F5B07CEC3D97F4AF0E30F4344D8623C0F602B4B4340029086EB05AF8800C16B4F10DCCCEE880146C06FB6DD8C4F3AB70C363F333F';
wwv_flow_imp.g_varchar2_table(26) := '2B0A9B66F7ED4AE3B347F104C0FAB275D8BAD9B781CBF158FBABE0A5C2566F03C6F21B524E023084D6C4BC046F2802D66518F0FE1C4147F0EF9BF9CFF3052F3DBEF31FBFF0A7466FFFEDD34F77CA866DD8F7AAC04EA181073C3FB0CF02B40A1808704076';
wwv_flow_imp.g_varchar2_table(27) := '09C0005831B22202575F7AC9210404F63E9F9CC3087C560F61E0ED2B875F7F8E99FBB309B702947DFFD34FBCBB4D9BCF0FCE766C708633F759166D2A2620012834380801818D186C82BC7BB0B7B3ED9E1B70FED8C0F7DDC0AFDF67FB7E30839376ACBDF3';
wwv_flow_imp.g_varchar2_table(28) := '8BDD1544E8FB583FCA572F010940056343908736A55908892FCF2AE09FDFBDE798CD7DDA655BF286B70F76657159799D9F4E20970709402ED219EB414CC28065360FEFE7FB9A44E09317E1F0E7F1B56FF6E736C5E78BB9FDE0E1C398EEE46B0F0109C01E';
wwv_flow_imp.g_varchar2_table(29) := '303192797AED8D97CB62193E2F6B1F014BE0DA7CEF77F7F3AC060872C4C01A699CB3814F597CE08BFDCBEC471F7D78599651E75389CCA8C62CAC900420C18012A0BC979DB7C77AE30D2DB10C9F7C7C164354F67581C02580C3F3043962608DB4301FB712';
wwv_flow_imp.g_varchar2_table(30) := 'F808D3EDB1F5CFACFDC1AFA7CFDCA190B0A2B1756A3F1E0109403C96CE06BE7D3A1EB18A0BAE109543424000F3A0D106EA052741027929734CE091C7CED061F006AE8F3AFCA15949D096A30A2D2853CEAE480022D166266666EE0B7CBE1330A6F5351921';
wwv_flow_imp.g_varchar2_table(31) := 'A00D7DE748F342C0AC4E5011B4D648E31C814F5ECA1C6B94F57959054C1181377E7ACFBBDA6C87B6655348FF1D4D40027034AAC31909409B8380E7873FF97D3F7E1024A6E1130B7F6B80361C1201DAC78C4D50F112A335D238479EA14639C4C49763061F';
wwv_flow_imp.g_varchar2_table(32) := '2302043F02E2FD5861F169DAC625200188C0330C3A029380E77BFC23B8DFEB82AF084708101B9F0911F0FB39B78889AD6F8808F0DCA02FF81125EB53FBF1094800263225F86DD011FC04E644B7838A2336B6006DB2C7B9F6B985B0752102DFFDF13B8ED5';
wwv_flow_imp.g_varchar2_table(33) := '0066CF11F41881FFC6BBF79C9DF9594DB41AFC96518E7D094064CAB983DF373F5C05F06030B6F1CAC62171E15680670804B06F175B8400430CBC11F4980D7CF2B2EC0F5713A4CBD21090004CE46A3F0CC3EC3FD1DDA8E29B8F159F9E8E2A3BA4100F3859';
wwv_flow_imp.g_varchar2_table(34) := 'ED202C87848000269087F84634584168E61F426D7A5E09C0448604C54417938AF311623E563CC9C988C208012B827D45096456030801D6978FA0C7087C448315445F3EA5A523200188C8F68F9EFE4E446F97BB22F8C38F10F30DBEFC18486CBB7D63FB63';
wwv_flow_imp.g_varchar2_table(35) := 'A2B65588DF2111202F42802106D826D8AF5F779BFD911F78C2EF12AD449F240025A847A8335CF613F8FC9C17DFE3BFF9418F67AEB998DB5B376E388C3A6E7762E0BB708C08F8BC6C99E531F665E5094800CA8FC1A816D8653F0149E08F7234A2D0AD4E0C';
wwv_flow_imp.g_varchar2_table(36) := '6E0722C0BB2047B85291C20424008507604CF5CCFEB6DCAD2E20ED718E7DEA64D5E1EBE299000F065398AF43DBF8042400F19926F718CEFEC92BECA980EF0CB0C9DC0A200229ECB2571D6C3BE6BA5FAADD128052E423D5FBE2B56722793ADE0D1F230EBF';
wwv_flow_imp.g_varchar2_table(37) := '33E0F8D2E372222C128271EC0E9592001CA253E139BE2EDC368B077DF638F53EC1CFC788C37AF8124FBE1538A6E133AC0721E036234CD7F13802128071DC9A2C15063F01CA4F80F1DB7EFCA007BF0910D3F0896F44C5024704F4D0D11219BF2F0118CFAE';
wwv_flow_imp.g_varchar2_table(38) := 'B99276E627280950BEC23B35084405A1B1F52002F678CEFB25DB2E0128497F467533FBDBE61294F638F53E4283E8F87A78E8A85580A7317E2B0118CFAEA992E1EC5FA2F3880EB71DBE6EAD023C89F15B09C07876CD940C5FF223104B759E9540A9BA9758';
wwv_flow_imp.g_varchar2_table(39) := 'AF046089A31AB94F9F3DFA2AB2C7F1EEECAF0F711B30DE531D254BB74202507A046656BF5D82CFACE96A6E0F0109400F142589402B042400AD8CB4FA29023D0424003D509424023908D4508704A08651501B44A01001094021F0AA56046A20200188380A';
wwv_flow_imp.g_varchar2_table(40) := 'BF39FDDAF159FDD0C20FF044AC52AE4460120109C0247CCEF1A596DE059FD3EF3384C1E7D1560420508B4900268EC4BE6FBC9DE856C545200B0109C044CC7CC125DF708B1058B32B838955A8B80824232001888496AFBEB6F6ADAB572379961B11484740';
wwv_flow_imp.g_varchar2_table(41) := '02908EAD3C8B402F819A122500358DC688B6F049BD3E1BE14A451A24200198F9A0F3E59C7D167E81C7CCBBA9E6272220014804566E45600E042400731825B57131046AEB8804A0B61119D81E5E82F4A6971E07C253762701D04520020D139000343CF8EA';
wwv_flow_imp.g_varchar2_table(42) := 'BA084800740D0C22F0C1C387EE8D9FDEEBB50F7EFD7090AF43997FF4D187BD75907EA85CCD3048D9B30000073049444154E76A6C9B04A0C651A9BC4D88409FC56E765F1DA4F97A78EBB5DFD7761C0109C0386E2A5598000F3C79EB75E166CCBE7A09C0EC';
wwv_flow_imp.g_varchar2_table(43) := '87307F079879BDE5A89D60F7F5B17DEAFA75F7D4F3CFE7A87AF1754800163FC4713B483032F37A8BEBBDDF1B1FACF2F5B1E51398FD39EB4DADB56512805A4746ED12810C0424001920AB0A11A8958004A0D69151BB44200301094006C8AAA26D0235F75E';
wwv_flow_imp.g_varchar2_table(44) := '0250F3E8A86D2290988004203160B917819A0948006A1E1DB54D041213900024062CF76D13A8BDF71280DA4748ED13818404240009E1CAB508D44E400250FB08A97D229090800420215CEF9ADF0BBCBFFAD8C5307E78D4FBD5B66E0273689D0420D128F1';
wwv_flow_imp.g_varchar2_table(45) := 'A119EBFACBD35317CBBC5F3E19E7F7B515813104240063A81D51864FACA50C5004864FC61DD114651181BD0424007BD14C3F4180F2D9758420A6E1539F879F3E3EF2E0F4ADC0A92F02560208414CC367EA76CBFF34027329AD15C05C464AED1481040424';
wwv_flow_imp.g_varchar2_table(46) := '0009A0D6E0F2975F3D72FC3E600CC3570D7D521BE2139000C4675A85C7CF1E3D72EF7FFA4914C397EF145FCFE5F7B59D3F0109C0FCC7F0BC073C683C3F48B4C3B38C44AE17E3764E1D9100CC69B42E692B0F07F99D4084809709631BAF3E5CD2049D9E19';
wwv_flow_imp.g_varchar2_table(47) := '0109C0CC06EC98E6324BF332616C43608EA95F79E6434002309FB1524B45203A01094074A472D83281B9F55D0230B711ABB8BD6FBC7BCF7DF7C7EF44B11F7EF461C53D5D4ED32400CB19CB223DE18163EA8A799899BA8E56FD4B005A1DF948FDE681634A';
wwv_flow_imp.g_varchar2_table(48) := '11E095073D7C8C34583D6E24003D5094348C0022C0CB8F046B4CC3E79C827F18B53A72671180AE929FD5D15DB52225018235A6A56C6BEDBE73C54C574FED28D43E11108154042400A9C8CAAF08CC808004600683A426D64F60AE2D9400CC75E4D46E1188';
wwv_flow_imp.g_varchar2_table(49) := '4040021001A25C88C05C09641180FFBCF9BA5E0598EB15A2761721902B66B208401182AA54043211987335D904E0C439AD029CFE44A02E02D904A0AE6EAB3522502F819C93A504A0DEEB402D1381E404B209C0DAAD7F9EBC37AA4004321348515DCE58C9';
wwv_flow_imp.g_varchar2_table(50) := '26005D457A0690E26A914F119840A08BCB09A555540444203A812E28B34D965D5DD1DBDFEB30D7EB9ABD952B510466442067AC641300F8E77CBA497D321148492085EFDC319255005200934F115812819C0F00E19655004EDCFA6D2A95898008D44120AB';
wwv_flow_imp.g_varchar2_table(51) := '00E4BCB7A903AF5A2102C308AC6EBE7E77588969B9B30A004DCD7D8F439D3211884D2085BF12B1915D00D67A43508A6B473E1740A0446C641780AEC26CAF712EE09A50171A22502236BA3AF312E6394089A54EDE5EAA3611184E80D8185E6A5A89EC0240';
wwv_flow_imp.g_varchar2_table(52) := '73F56A001464732590A6DD655E212B220025942ECDA0C9AB08C42190FBE9BF6F751101A072DD0640412602102833FB5373410128D7693A2E13011170AE9800701B70A2AF09D335383302F19BBB7EBBD4F29FBE1413002AD7C34028C844A01C81A202A055';
wwv_flow_imp.g_varchar2_table(53) := '40B98157CD3510283BFB43A0A800D000AD02A0206B9140C9A5BFE75D5C005805387D4AD08F87B6151388DBB43A1E82171700A0A2847A200809591B04CA2FFD3DE72A0480C6E856000AB2160830E1D5D2CF6A0440B702B55C126A475A02752CFD7D1FAB11';
wwv_flow_imp.g_varchar2_table(54) := '001AB455C6BA00D12E9908C42150CFD2DFF7A72A01A051120128C89647A0BEE08771750240A3240250902D87409DC10FDF2A0580864904A0209B3F817A831FB6D50A008D93084041569AC0F8FAEB0E7EFA55B500D04089001464F323507FF0C3B47A01A0';
wwv_flow_imp.g_varchar2_table(55) := '9188C0EAE69D13BD63101AB29A097417E9CFAEB8F5CD55E6AFF71ECB641602E03BB785AA97093D0F6D6B23B07EFBE39B776E6EDFD3525BDBFADB332B01A00B88C04AAB0150C8321038A68AB9CDFAB64FB31300DFF8D56689C56A00F3A9DA8A403E023EF0';
wwv_flow_imp.g_varchar2_table(56) := 'E736EB5B42B315003A810860DB6703120298C8D2135842E07B4AB31600DF0944606B7A50E899681B97800FFA5577FB39E7193FA4B20801B09D5A75B706AB6E907812CBCA8081B3E7B52F02C712D85E3BEBB7B9969614F4B6FF8B1300DF399EC4AE3A3160';
wwv_flow_imp.g_varchar2_table(57) := 'E0569D202006D876507D2E6D45E00901AE0D8C80E79AD95E3BAFDFE55A7A926B597B8B15807098569D1860DB41BD73C220230818838E856574BC3C028CB337C69EEB005B759304D706B6E4800F47B41901083BCE20AF8C2830F0ABEE22F0C645D1675C34';
wwv_flow_imp.g_varchar2_table(58) := '321EB8D6697D63469A1F57C6D9DBAA1B7FAE032CBC3E5A396E56002E1B602E8A3EE3A291BD7EB756067D6346DA65E31D9E6FE55802D0CA48AB9F22D0434002D003454922D00A0109402B23AD7E8A400F0109400F1425B54DA0A5DE4B005A1A6DF5550402';
wwv_flow_imp.g_varchar2_table(59) := '02128000880E45A02502128096465B7D15818080042000A2C3B609B4D67B09406B23AEFE8A802120013030B42B02AD119000B436E2EAAF08180212000343BB6D1368B1F7128016475D7D1681330212803310DA88408B0424002D8EBAFA2C026704240067';
wwv_flow_imp.g_varchar2_table(60) := '20B4699B40ABBD9700B43AF2EAB708740424001D04FD1381560948005A1D79F55B043A0212800E82FEB54DA0E5DE4B005A1E7DF5BD79021280E62F010168998004A0E5D157DF9B27200168FE12681B40EBBDFF3D000000FFFFC5E7BF8500000006494441';
wwv_flow_imp.g_varchar2_table(61) := '54030039361AB51081F8BF0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(19582727017397922276)
,p_file_name=>'icons/app-icon-256-rounded.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260715064303Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064303Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_32_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000001FF494441547801EC95CD4A234114854F3AC30CBA1886C8646366822B85F8836E7421EAC285E242DCB8154110F1257C0971A3881BF505C48DF8B710C53F540421';
wwv_flow_imp.g_varchar2_table(2) := 'A004238898A0A8098831DED3D04DA769ADA20D08D28193AE5BA9BAF7EB53B73B46E3DA4AF12B65E08B3F0140E040E080B6037F1E1EF0FBE6062F994C591F5C2D00164D44A3E86E6C42672C86D77CDE54752E87F68A0A73EC974A0BC0A8AC2CC9FF2A853B';
wwv_flow_imp.g_varchar2_table(3) := '22110C0B5057750CFF8A45F3F7A697021AC429029B131A5F7A0072971BE934568E8F702AC7F0A3AA0A178EA3A8919845C7EAEA30D7DB87E9D6366D57B40068396F261B0EE3F6F9D9EC83CB5008EB5769CC0AD466360B2F97B847252500EFACD608633051';
wwv_flow_imp.g_varchar2_table(4) := '6F2B522880C7B02EAEA4D80F722486B834B2B38DA1E5254C9D9D812EA98AF37725001735C4E3BCD8AAFF1BC584D8EC141B920B0EC5A1FDFB3BD325C62A6901A892AC2693E811A8E3FE01581AFD1F8775741FED2F0B000B8C37B7F0628B318FC99E7867A0';
wwv_flow_imp.g_varchar2_table(5) := '0460732DECEDBEB3FDF3D36A0069AEB0C8596A4DBA9FB63BE7FC8E95005E89DD405C93589CE7C516639D27C117805DC5317043B963C7D292A11600FBE0249582A5920C9F0CF400A40792BF7EC212AD3DCF66C03EA052F99C6F0C2D00AFECD7F2FEDF0A01';
wwv_flow_imp.g_varchar2_table(6) := 'D495FC59D1A5C9C30358F2DAE335E71BC09D8CAFE299A74758A24BEE355E71D900BC92EBCC05008103DFDF01D593F0060000FFFFB3DC37A800000006494441540300E7130A50722EB6B80000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(19582726078916922274)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260715064303Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064303Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_512_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000200000002000806000000F478D4FA00001000494441547801ECDD4FCB64D77D27F0A26D235A1B0B37441174E378C0822C6293401CAF12E8F626F64BC82210BC4BDE81D77907333B61F0C22FC19E8D95C15E';
wwv_flow_imp.g_varchar2_table(2) := '39199841CE222081152143C6011979A3C624F6E4F93ED26D553F5D55F754D5FD77CEF9045FD553F79E7BCEEFF7394DCEEF9EAA7EFADE57FED78FFEBF83813F03FE0CF833E0CF803F037DFD19B8B7F37F040810204080406702BB9D02A0BB299730010204';
wwv_flow_imp.g_varchar2_table(3) := '08105000F833408000010204BA1348C27600A2E02040800001029D0928003A9B70E91220408040EF021FE7AF00F8D8C17F09102040804057020A80AEA65BB204081020D0BBC090BF026090F04A80000102043A1250007434D9522540800081DE053ECD5F';
wwv_flow_imp.g_varchar2_table(4) := '01F0A9859F08102040804037020A806EA65AA204081020D0BBC07EFE0A807D0D3F1320408000814E0414009D4CB43409102040A07781E7F357003CEFE11D0102040810E8424001D0C5344B92000102047A17B89BBF02E0AE88F70408102040A003010540';
wwv_flow_imp.g_varchar2_table(5) := '07932C4502040810E85DE0C5FC15002F9A384380000102049A175000343FC5122440800081DE050EE5AF0038A4E21C0102040810685C4001D0F8044B8F000102047A17389CBF02E0B08BB30408102040A069010540D3D32B3902040810E85DE058FE0A80';
wwv_flow_imp.g_varchar2_table(6) := '6332CE132040800081860514000D4FAED408102040A07781E3F92B008EDBB84280000102049A155000343BB5122340800081DE054EE5AF0038A5E31A010204081068544001D0E8C44A8B000102047A17389DBF02E0B48FAB0408102040A04901054093D3';
wwv_flow_imp.g_varchar2_table(7) := '2A2902040810E85D602C7F05C09890EB0408102040A04101054083932A2502040810E85D603C7F05C0B891160408102040A03901054073532A2102040810E85DA0247F05408992360408102040A03101054063132A1D02040810E85DA02C7F0540999356';
wwv_flow_imp.g_varchar2_table(8) := '0408102040A02901054053D3291902040810E85DA0347F0540A994760408102040A0210105404393291502040810E85DA03C7F0540B995960408102040A0190105403353291102040810E85DE09CFC1500E768694B80000102041A115000343291D22040';
wwv_flow_imp.g_varchar2_table(9) := '800081DE05CECB5F01709E97D60408102040A00901054013D3280902040810E85DE0DCFC1500E78A694F80000102041A105000343089522040800081DE05CECF5F0170BE993B081020408040F5020A80EAA7500204081020D0BBC025F92B002E51730F01';
wwv_flow_imp.g_varchar2_table(10) := '02040810A85C400150F9040A9F000102047A17B82C7F05C0656EEE224080000102550B2800AA9E3EC11320408040EF0297E6AF00B854CE7D0408102040A062010540C593277402040810E85DE0F2FC150097DBB9930001020408542BA000A876EA044E80';
wwv_flow_imp.g_varchar2_table(11) := '000102BD0B5C93BF02E01A3DF71220408000814A051400954E9CB009102040A07781EBF257005CE7E76E020408102050A58002A0CA69133401020408F42E706DFE0A806B05DD4F80000102042A145000543869422640800081DE05AECF5F0170BDA11E08';
wwv_flow_imp.g_varchar2_table(12) := '102040804075020A80EAA64CC004081020D0BBC014F92B00A650D4070102040810A84C400150D9840997000102047A1798267F05C0348E7A21408000010255092800AA9A2EC11220408040EF0253E5AF00984A523F0408102040A0220105404593255402';
wwv_flow_imp.g_varchar2_table(13) := '040810E85D60BAFC1500D359EA8900010204085423A000A866AA044A80000102BD0B4C99BF02604A4D7D1120408000814A041400954C943009102040A0778169F357004CEBA937020408102050858002A08A69122401020408F42E3075FE0A80A945F547';
wwv_flow_imp.g_varchar2_table(14) := '80000102042A105000543049422440800081DE05A6CF5F0130BDA91E0910204080C0E60514009B9F22011220408040EF0273E4AF009843559F040810204060E3020A808D4F90F008102040A0778179F25700CCE3AA570204081020B0690105C0A6A74770';
wwv_flow_imp.g_varchar2_table(15) := '04081020D0BBC05CF92B00E692D52F0102040810D8B0800260C393233402040810E85D60BEFC1500F3D9EA9900010204086C564001B0D9A9111801020408F42E3067FE0A803975F54D8000010204362AA000D8E8C4088B000102047A1798377F05C0BCBE';
wwv_flow_imp.g_varchar2_table(16) := '7A2740800001029B1450006C725A044580000102BD0BCC9DBF02606E61FD1320408000810D0A2800363829422240800081DE05E6CF5F0130BFB1110810204080C0E60414009B9B12011120408040EF024BE4AF005842D91804081020406063020A808D4D';
wwv_flow_imp.g_varchar2_table(17) := '887008102040A0778165F257002CE36C140204081020B0290105C0A6A6433004081020D0BBC052F92B009692360E0102040810D8908002604393211402040810E85D60B9FC1500CB591B8900010204086C464001B099A9100801020408F42EB064FE0A80';
wwv_flow_imp.g_varchar2_table(18) := '25B58D4580000102043622A000D8C8440883000102047A1758367F05C0B2DE462340800001029B1050006C621A044180000102BD0B2C9DBF02606971E31120408000810D082800363009422040800081DE0596CF5F01B0BCB9110910204080C0EA020A80';
wwv_flow_imp.g_varchar2_table(19) := 'D5A7400004081020D0BBC01AF92B00D6503726010204081058594001B0F204189E000102047A1758277F05C03AEE46254080000102AB0A280056E5373801020408F42EB056FE0A80B5E48D4B800001020456145000AC886F6802040810E85D60BDFC1500';
wwv_flow_imp.g_varchar2_table(20) := 'EBD91B990001020408AC26A000588DDEC004081020D0BBC09AF92B00D6D43736010204081058494001B012BC6109102040A0778175F35700ACEB6F740204081020B08A8002601576831220408040EF026BE7AF00587B068C7FB5C0EF9E3EDDFDE7071FDC';
wwv_flow_imp.g_varchar2_table(21) := '1EBFF9C52F76C3F1F4EDB7773986F7791DDAE5F5EA8175408000818A051400154F5EAFA167C1CF9105FD76817FFFFDDD7FDC1400397EF7D147BBE1187C86F7794D9BE1C8BD2904720C6DBD122040601981F5475100AC3F072228141816FDDFDC2CF839B2';
wwv_flow_imp.g_varchar2_table(22) := 'A017DE7AB4D97E31908242317094CA0502041A1350003436A12DA6B3BFF04FB1E81F334ADF2908869D8163ED9C274080C0B5025BB85F01B0855910C34181A516FE43832B040EA9384780404B020A809666B3A15CB21D3FD536FF352C29047C2C708DA07B';
wwv_flow_imp.g_varchar2_table(23) := '09107851601B671400DB9807517C2290A7FE6CC1673BFE9353ABBFA408B88DE9E9D3D5631100010204A61250004C25A99FAB05F2A49DA7FEAB3B9AA983C4961867EA5EB704087422B0953415005B9989CEE3C8C29A27ED4B195E7DE595DD57BEF807BB6F';
wwv_flow_imp.g_varchar2_table(24) := '7CF5ABCF8EBFFAF3BFD8E5D83FF7959B36392E1D273126D64BEF771F010204B622706F2B8188A35F812CA85958CF1578F566D1CFE27EBBC87FE5ABBB3FFAE21777AF7EFE9567C7D0DFFEB9B4C9917B5208E418DA95BE26D6C45CDA5E3B0204087C2AB09D';
wwv_flow_imp.g_varchar2_table(25) := '9F1400DB998B2E23C9429A05F59CE4B3686701FFC6CDA29FC5FD9C7BF7DBA610C891BED2E7FEB5B19F1373621F6BE73A010204B62AA000D8EACC74105716D02CA4A5A90E4FFC59B44BEF296D973ECF2D04127B72281D433B0204086C494001B0A5D9E828';
wwv_flow_imp.g_varchar2_table(26) := '967CDB3F0B6869CAD9EABFF689BF64AC140219ABA46DDA2487E4929F1D040810A849400150D36C35146BBE515F92CEF0D47FCD567FC938FB6D3256760332F6FEF9633F97E672EC7EE70910E845605B792A00B6351F5D4453BA6D9ECFE59778EA3F869EB1';
wwv_flow_imp.g_varchar2_table(27) := '13C3B1EBFBE7F38B8BF6DFFB990001025B1750006C7D861A8B2F8B7FB6CDC7D2CAC29BEDF8B176735F4F0C89656C9CFCE2221F058C29B94EA06F81AD65AF00D8DA8C341E4FC9E29FADF72CBC5BA1482C89692C9E92DCC6FA98E37A0A93145E39B253311C';
wwv_flow_imp.g_varchar2_table(28) := 'F9ED863986F7794D9BE19823167D1220B01D0105C076E6A2F948B2B0942499ADF792764BB62989692BBB0059F0736441BF5DE0DF7F7F97E224C76D8C1F7DB4CBEBE0979F87236D8623F766CE720C6DBD122070A9C0F6EE53006C6F4E9A8D280BCB5872E7';
wwv_flow_imp.g_varchar2_table(29) := '7C037FACAFA9AF97C45692E3D4710DFD0D8B7EBE9498238BFA70EDD2D7E49323C5400A0AC5C0A592EE23B03D0105C0F6E6A4C9884A168E7CD69E6FE06F1520B18D7D149045370BF1923964BC2CCE532DFAC7624F6E433150329FC7FA719E408F025BCC59';
wwv_flow_imp.g_varchar2_table(30) := '01B0C5596930A6DF16FC4B7AF9AC7DEBA997C4984572893C965AF80FE5921CB32BA01038A4E31C813A04140075CC53F551E6E9F1541279FA3F757D2BD7B20B30166B72CDE23C67CC4B3CF197C49F4240115022A54DDF02DBCC5E01B0CD79692AAA9205A2';
wwv_flow_imp.g_varchar2_table(31) := 'E4C97A2B286BC69AC2224FDE2932B6E29122E036A6825D9EADC42C0E0204763B05803F05AB0B8C3D51AF1EE08100C6BE0B9045F1C06D579D4A2195CFF9AFEA64C69B135B629C71085D13A85260AB412B00B63A330DC535C762B836CFD82EC0D44FE85958';
wwv_flow_imp.g_varchar2_table(32) := 'AF71FCD28307BB275F7E7DF7EDAF7FFDD9F1F7DFFCD62EC7FEB9B4C971A96F624CAC97DEEF3E0204961350002C67DDE548258BC1D862BA45B87C17602CAE6CD78FB529B91EC32CAC256DF7DB64D1CFE27EBBC8FFD9D7778FBFFCE5DD97BEF0E0D931B4DD';
wwv_flow_imp.g_varchar2_table(33) := '3F97363972CF939B8221C7D0AEF435B126E6D2F6DA11685B60BBD92900B63B375D4456E3F6FF3031631F034CB10B9085340BEA3066C96B16ED2CE0DFBE59F4B3B897DC73A8CDE39B822147FA7A72530C1C6A73EC5C624EECC7AE3B4F80C0FA020A80F5E7';
wwv_flow_imp.g_varchar2_table(34) := '4004950A94EC025C935A16D02CA4A57D0C4FFC8F6F16EED27B4ADBA5CF730B81C49E1C4AC7D08E408B025BCE4901B0E5D96920B6B1BFFFFF7BAF7CBEDA2CC7621FCBFD54E2F9F8200BE8A936FBD7B2D57FED13FF7E7FC77E4E2190B18E5DBF7B3E392497';
wwv_flow_imp.g_varchar2_table(35) := 'BBE7BD2740607D0105C0FA732002022F08E41BF52F9C3C706278EABF66ABFF40B7274F65ACEC0664EC930D3FB9589ACB27CDBD10684860DBA92800B63D3FA2EB50A074DBFCC9CDE7F24B3CF51F9B828C9D188E5DDF3F9F5F5CB4FFDECF0408AC2FA00058';
wwv_flow_imp.g_varchar2_table(36) := '7F0E9A8E60EC8B70737F8E3E27EE58EC63B91F8A2D8B7FB6CD0F5DDB3F9785F7F10C9FF5EF8F51F27362787253888CB58D858F02C6945C6F4D60EBF92800B63E43E2EB4AA064F1CFD6FBE30D2CFEC3C42496C434BC3FF65A92DBB17BE73C9FC22485578E';
wwv_flow_imp.g_varchar2_table(37) := 'EC540C477EBB618EE17D5ED36638E68C49DF04961050002CA1DCF118F75E7EF964F6BFFCF58727AF6FF9E258EC63B9DFCD2D0BCBDD7387DE67EBFDD0F935CF95C4B4955D802CF839B2A0DF2EF0EFBFBF4B7192E336C68F3EDAE575F0CCCFC39136C3917B';
wwv_flow_imp.g_varchar2_table(38) := '33673986B65E097C2AB0FD9F1400DB9F231176229085652CD573BE813FD6D7D4D74B622BC971EAB886FE86453F5F4ACC91457DB876E96BF2C9916220058562E05249F7AD21A0005843DD9804EE08942C1C4F6E3E6BCF37F0EFDCBA99B7896DECA3802CBA';
wwv_flow_imp.g_varchar2_table(39) := '5988970C3AE365719E6AD13F167B721B8A8192F93CD68FF36D08D4908502A08659AA38C6CFDCBF7F32FA7FFFF0D727AF6FF9E258EC63B9EFE756F23B031E6FE873FFFDD8F77F7E52106316C9FD7BE6FA79A985FF50FCC931BB020A81433ACE6D454001B0';
wwv_flow_imp.g_varchar2_table(40) := '9599E8348EB1CFD17B61C9D3E3A95C9FDC3CFD9FBABE956BD905188B35B966719E33E6259EF84BE24F21A00828916AAD4D1DF92800EA98A76AA31CFB22DC2F3FFCB0DADC7EF6DEBF4E127BC902F1B8E0C97A926026E864CD585358E4C93B45C604A94CD2';
wwv_flow_imp.g_varchar2_table(41) := '458A80DB989E3E9DA43F9D10984A40013095A47E0E0ADC1BF9082037D5B80BF0CFEFBD97D04F1E9F7DF0E0E4F5D28B4F2A79FADFCF67ECBB005914F7DB4FF1730AA97CCE3F455F73F491D812E31C7DEB735B02B544A300A865A62A8E736C17A06431AD2D';
wwv_flow_imp.g_varchar2_table(42) := 'FDCF9DB1F8CFB118AEED35F65D80A99FD0B3B05EE3F8B5D75EDBFDDD1FFFC9EE7BDFFCD6B317BE307A0000100049444154E35FFEE6DBBB1CFBE7D226C7A5BE8931B15E7ABFFB084C29A0009852535F0705C616C31A3F06B0FD7F70AA9F9DCC77019EBD39';
wwv_flow_imp.g_varchar2_table(43) := 'F243B6EB8F5C3AEB7416D42CAC67DD74D3388B7E16F7DB45FE2FBFB5FBDB9B02E06BBFFFDA6E386E9ADCFE6F789FD7B4C9917B5208E4B86D74C67F126B623EE3164DAB12A827D87BF5842AD296056ADA052889B5E7EDFFE1CFE9D8C70053EC026421CD82';
wwv_flow_imp.g_varchar2_table(44) := '3A8C59F29A453B0BF8F76E16FD2CEA25F71C6A93422047FA4A9F87DA1C3B979813FBB1EBCE1358424001B08472E763E47B00631F03E489BA96EF0224D653533A96EBA97B5BBAF6DFBE30CD77208E996401CD427AECFADDF3C3137F16EDBBD7AE7D9F3ECF';
wwv_flow_imp.g_varchar2_table(45) := '2D04127B72B8766CF76F4BA0A668140035CD56C5B18E7D0C90D44A9EACD36ECDA324C629FFFEFF971E7C61CD74AF1A7B2CF692DF7D702C807C7C9005F4D8F5BBE7B3D57FED13FFDD3E0FBD4F2190B10E5D3B742E39249743D79C2330B78002606E61FDDF';
wwv_flow_imp.g_varchar2_table(46) := '0A94EC02E4BB005BDE05486C634FFF4976AAEDFFF4E5382C906FD41FBEF2FCD9E1A9FF9AADFEE77B1C7F97B1B21B90B1C75BEF76A5B994F4A5CDDA02758DAF00A86BBEAA8EB66417E0476FBDB5CB42BBC54413DB585C25398EF5E1FA6981D26DF37C2EBF';
wwv_flow_imp.g_varchar2_table(47) := 'C453FFB16833766238767DFF7C7E71D1FE7B3F1358424001B084B2316E054A7601D2B0649B3DED963C7EF4B3B78A863BF7E97FEC8B7025DFA62F0A6C854663B18FE57E28E42CFED9363F746DFF5C16DE6CC7EF9F5BE3E7C49058C6C68E858F02C694B67F';
wwv_flow_imp.g_varchar2_table(48) := 'BDB6081500B5CD58E5F1963C21E7A3802D15018925318DD197E436D687EBA7054A16FF6CBD67E13DDDD37257134B621A1BB124B7B13E5C27708E8002E01C2D6DAF1628DD05C867ED5978AF1EF0CA0E12436219EB268BFFB94FFFE973EC6F0CBCFBAB0FD2';
wwv_flow_imp.g_varchar2_table(49) := 'ACCA632CF6B1DCEF269DA7FFBBE70EBDCFD6FBA1F36B9E2B89C92EC09A3334C5D8F5F5A100A86FCEAA8FF8A5870F7725FFCF3F0B6FE9D6FB1C28193B3194F47DC9E25FD2AF369F0A943C219FF30DFC4F7B5EE6A792D84A725C265AA3F420A000E8619637';
wwv_flow_imp.g_varchar2_table(50) := '98639E984BC2CAD6FBF77FF2E345BF18982F21DE8EF9E1872521EE5E7AF4A8A89D46970B943CFDE7B3F67C03FFF251E6BD33B18D7D14601760DE3998B3F71AFB5600D4386B0DC49C8F024A8B80A49B6FE0673B3E3FCF7564E1CF537FC62A1D23392497D2';
wwv_flow_imp.g_varchar2_table(51) := 'F677DB8DFDCE80773FF8D5DD5BAA793F16FB58EEFB8996FCCE807CD6BE7FCF167F2E89D12EC01667AECD9814006DCE6B155965DB3C0B6869B0D98ECF93F91C8540FACCC29F1D87D278127B72286D7F49BB9F57FC1D804BF23D764F9E8C8F5DCBF93CFDE7';
wwv_flow_imp.g_varchar2_table(52) := '75EB477601C6624DAEFE46C0D667F26E7C75BE5700D4396FCD449D05340BE93909ED170259B8CFB977BFEDF0C49FA2227DEE5F1BFB393127F6B17663D7C7BE0BF1EE07F57E09F0CD77DE1E4BBFE87AC9F67FC99375D1600B34AA29D605380CB1A2800260';
wwv_flow_imp.g_varchar2_table(53) := '457C437F2C9085340BEAC7EFCAFF9B453B4716F0140239B2A80FC7D0D3F03EAF69936DFEDC73EE13FFD05F624DCCC3FB6B5E4B3E3E18FB36FD35E3CF75EF3FBCF3CE68D753198E3D518F06B24283B1EF02F818608549B962C85A6F5500D43A738DC59DC5';
wwv_flow_imp.g_varchar2_table(54) := '200BEBA569A510C891457D38B2C8E718DEE7356DCED9E6BF1B4F624CAC77CF5FF37E6C17E0CD82C5F49AF1D7B8378EA5E3B6B8188EED02E46380521FED085C2AA000B854CE7D930B6461DDF237EA135B629C3AF1B1C5B0C68F01DEB4FD7FF28F49BE0B70';
wwv_flow_imp.g_varchar2_table(55) := 'B2C1CD45DF03B841A8E27FF506A900A877EE9A8C3C5BE2F75F7F7D37B6282E997C9ED01353625B72DCFDB14AB6D4F7DBAFF97349AC531552356EFF0F7333F631805D8041CAEB5C020A80B964F57B954016881401597CAFEAE88A9B33769EFAF38B8BAEE8';
wwv_flow_imp.g_varchar2_table(56) := '66F4D6141619EB54C33C51D7F25D80C47A2A97B15C4FDDDBD2B5925D8096F26D35979AF35200D43C7B8DC79E22208B6F0A812553CD02352CFC599C9718BB24C7372BF82E40C9D3FF947FFFFF4F5F7B6D89E999658CB1D84B7EF7C12C81E9B41B01054037';
wwv_flow_imp.g_varchar2_table(57) := '535D6FA22904B2059F45328BF35C99A4EFA517FE2197141A197F787FE835DF05D8F22E40627BB3E0B3FFCCE7A1FC9C23509F40DD112B00EA9EBFAEA2CFC2911D81A1184841702D4016DDDB45FFD1A35DFACE427C6D9F97DE5F92CF1B3FFDE92E0BEDA563';
wwv_flow_imp.g_varchar2_table(58) := 'CC795F621BEBBF24C7B13E5C2740601A0105C0348E7A595820C5408E140359C0B3B0E4C8823E1C4348C3FBBCA64D8EDC737B6FFE61A2FBF7776B2EFCCFE24C1C2FBF3CBC3DFAFAE6063F0A78E31F7F7A34DEFD0B99B3FDF7633F8F7D11AEE6CFD1C7621F';
wwv_flow_imp.g_varchar2_table(59) := 'CB7DCCCEF5F9056A1F410150FB0C8AFF76F1CEC292234FF1C391053EC7F03EAF6993630B0BFEA1A94B7172E8FCFEB97C1450F259FBFE3D73FE9C5812D3D81825B98DF5E13A0102D3092800A6B3D41381AB05529864A762ACA3376F3E6BCFC23BD66EEEEB';
wwv_flow_imp.g_varchar2_table(60) := '8921B18C8D93C53F85D758BBBBD7C72CFEE9FFFDDBDD5BAA793F16FB58EED524DA6CA0F527A600A87F0E65D09840762A4AFE9F7F16DED2ADF7398832766228E9FB92C5BFA45F6D0810B85C400170B99D3B09CC269027E692CEB3F5FE9D1FFE60D12F06E6';
wwv_flow_imp.g_varchar2_table(61) := '4B88B76316FE4345F9BE45492EDA10A849A0855815002DCCA21C9A13C84701A5454092CF37F0B31D9F9FE73AB2F0E7A93F63958E911C924B69FBBBEDC67E67C0FFFEB77A3F02188B7D2CF7BB56DE133857400170AE98F6041612C8B67916D0D2E1B21D9F';
wwv_flow_imp.g_varchar2_table(62) := '27F3390A81F499853F3B0EA5F124F6E450DAFE9276639FA35FD2A77B088C0BB4D14201D0C63CCAA251812CA05948CF496FBF10C8C27DCEBDFB6D8727FE1415E973FFDAD8CF8939B18FB51BBB3EF65D887FAA7807E0BFFFDFFF3396BEEB0466155000CCCA';
wwv_flow_imp.g_varchar2_table(63) := 'AB7302D70B6421CD827A6E4F59B47364014F2190238BFA700CFD0DEFF39A36D9E6CF3DE73EF10FFD25D6C43CBCBFE6B5E4E3831A7701FE47C1E23F95E135FEEE3D2CD0CA5905402B33B9F13C7EF7F4E9EE3F3FF860F79B5FFCE2D9F1F4EDB777AD1C435E';
wwv_flow_imp.g_varchar2_table(64) := 'C931B94E3D1D590CB2B05EDA6F0A811C59D487238B7C8EE17D5ED3E69C6DFEBBF124C6C47AF7FC35EFC776014A16D36BC65FE3DE38AE31AE31FB125000F435DF8B669B85300B6316F9DFBCFFFEEE3F6E0A80FC76B3E158349899071B724A8EC93539A718';
wwv_flow_imp.g_varchar2_table(65) := 'C831D5D05958B7FC8DFAC49618A7CA77E8676C31ACF16300DBFFC3ECD6F8DA4ECC0A8076E672339964D1CB029885300BE366025B38901403396211932986CF96787EBBE1D8A238C558A57DE4093D3125B6D27BA66E57D32E4049AC731452539BEBAF7E01';
wwv_flow_imp.g_varchar2_table(66) := '0540FD73B8990C8627FE2C7A9B096A2381C464CA42200B448A802CBE6BA598B1F3D49F5F5C34670C292C32D6A931F2445DCB770112EBA95CC6723D75AF6BF30BB4348202A0A5D95C31976CF5F7FEC45FC29F4260AADD801401597C5308948C3D559B2C50';
wwv_flow_imp.g_varchar2_table(67) := 'C3C29FC579AA7E4FF5539263C993F5A93196B85612A3BFFFBFC44C1823020A8028382E16189EFA7BDEEA3F172F454076036277EEBD87DAA710C8167C16C92CCE87DA4C712E7D2FBDF00F71A7D0C8F8C3FB43AFF92EC096770112DBD8D37FF2CA7CE6D5B1';
wwv_flow_imp.g_varchar2_table(68) := '4581B6625200B4359F8B669327594FFD9793C72E8697F7F0FC9D5938B22330140329089E6F71FEBB2CBAB78BFEA347BBF49D85F8FC5EA6B9A3249FBFFEE10F765968A71971DA5E12DB588F25398EF5E13A8152010540A99476CF0964E1CA93EC7327BD39';
wwv_flow_imp.g_varchar2_table(69) := '5B208653ED04EC0F9E6220478A812CE059587264411F8EA1FDF03EAF699323F7DCDEFBF0E1ED3FB7BCE6C2FF2CCEFBF7778971787FECB5649BFDD8BD739DFFEBFFF983A2AE3367450D355A45A0B5411500ADCDE802F964C1CAC275EE50AFBEF2CAEE1B5F';
wwv_flow_imp.g_varchar2_table(70) := 'FDEAB3E3AFFEFC2F762D1CC9E92B5FFC83DD709CEB929D80989E7B5F69FB2CDE595872E4297E38B2C0E718DEE7356D72E49ED2FE976C97E2646CBC7C14B0A52220B124A6B1B84B721BEBC37502E7082800CED1D2F656200BD6ED0F85FFC9C29885FE1B5F';
wwv_flow_imp.g_varchar2_table(71) := 'F9EAEED5CFBFF2EC28BC7DF3CD92D31F7DF18BBBE148AEC9F99CC0CF353DA7EF96DAA63029D905C867ED5978D7CE3D312496B138B2F8A7F01A6BE7FA9A02ED8DAD00686F4E67CD28DFF62F1D208B6016C32C8CA5F7B4D22E3927F71894E6748E6D699F2D';
wwv_flow_imp.g_varchar2_table(72) := 'B6CB4E45691150BAF53E8753C62E59FC33B6C53F0A8EA50514004B8B573C5E3EF72FFDB67FB6C5B308569CEE24A1C7A0B40888ED9C1F054C92D0463AC913734928D97AFFC3EFBEB1E81703F325C4DB310BFFA1A27CDFA224176DD61568717405408BB33A';
wwv_flow_imp.g_varchar2_table(73) := '534E259FFBBFFAC9E7FCAFDE6CF5CF144675DDA60848415412788971493FADB7C94701A545402CF20DFC6CC7E7E7B98E2CFC79EACF58A5632487E452DA5E3B02530A2800A6D46CB8AF3CFD97A4377CCE5FD2B6A73629884A8A00BB00E57F2AB26D9E05B4';
wwv_flow_imp.g_varchar2_table(74) := 'F48E6CC7E7C97C8E42207D66E1CF8E43693C893D3994B6D76E4D8136C75600B439AF936755F2645AB2C04D1E58451D96160125D615A53D6BA85940B3909E33C87E219085FB9C7BF7DB0E4FFC292AD2E7FEB5B19F1373621F6BE73A813905140073EA36D2';
wwv_flow_imp.g_varchar2_table(75) := '77C9D37F3EE7CE02D748CAB3A511A37C4C726A00BB00A7745EBC9685340BEA8B574E9FC9A29D230B780A811C59D48763B87B789FD7B4C9367FEE39F7897FE82FB126E6E1BDD7ED0BB41AA102A0D5995D38AF7CCEBDF090D50E978F49C682CF5F0BCCAF0B';
wwv_flow_imp.g_varchar2_table(76) := '6EE5C8DF70C89162728E2F3A6641CDC23AE67AEC7A0A811C59D487238B7C8EE17D5ED3E69C6DFEBBE325C6C47AF7BCF704D6105000ACA15ED998635BD279FAAF2CA5D5C3EDCDEC7657E3A38F76F9B33414372906724C35195958B7FC8DFAC49618A7CA57';
wwv_flow_imp.g_varchar2_table(77) := '3F4B09B43B8E02A0DDB99D24B392FF07EDE9FF3CEA7F7EEFBDDD2F7FFDE1793735D83AC5408EEC7294FC392B21C837EAF3DB0DF3A45DD27E8936F99D058929B12D319E3108940A28004AA5B43B28D0DB93EC4184C29359F4BFFF931FEF7EF6DEBFEE7EF9';
wwv_flow_imp.g_varchar2_table(78) := 'E1878577F5D16CEA42204FDA2902B2F8AE2598B1F3D49F5F5CB4560CC6BD5EA0E51E14002DCFEE04B9FDF6E9D3097AD1C58F7EF6D6EE476FBD0562442085C054BB012902B2F8A610181976D2CBFB0BBFA7FE49697536B180026062D0DEBAFBBD573EDF5B';
wwv_flow_imp.g_varchar2_table(79) := 'CA67E53B3CF57BE22F674B11908F05A6FAB2600A816CC1A710C8E25C1EC9792DD3F7F0C46FE13FCF6EBBADDB8E4C01D0F6FCCA6E45817CD6EFA9FFF209C89705A7DA0D48142904B223301403290872FE9AE3D9A2FFE8D12E7D5BF8AFD174EFD2020A80A5';
wwv_flow_imp.g_varchar2_table(80) := 'C52B1B2FDFDE3E1572FE5EFBA9EBBD5ECBE29FCFFA7BCD7FAABCB31B30D54EC07E4C290672A418C8537B8A811C59D08763683FBCCF6BDAE4C83DB7F73E7CB8CBA29F6368EFB51D81D6335100B43EC3F25B5C20DBFE972CFE5F7AF060F7EDAF7FFDD9F1F7';
wwv_flow_imp.g_varchar2_table(81) := 'DFFCD6AE8523393DF9F2EBBBE1387742B21330471130C491C53BC5408E3CC50F4716F81CC3FBBCA64D8EDC33DCEF9540AD020A805A674EDC9B153877DB3F0B6316FA6FFFD9D7775FFAC28367C766133C33B0E4F4F8CB5FDE0D47727D7253109CD34D8A80';
wwv_flow_imp.g_varchar2_table(82) := '73DA6B4BE07A81F67B5000B43FC7325C50205BFFA5C36511CC62F8F866712CBDA79576C939B93F39A310C86F126C257F7910D8828002600BB320862604B2F8976EFD675BFC71870BFFDD898EC193C22220DF4799F3A380BBB179DFB7400FD92B007A9865';
wwv_flow_imp.g_varchar2_table(83) := '392E2250B2F80F9FF3675B7C91A02A18E4F14D219482A824D47C29B0A49D3604088C0B2800C68DB420302A90A755E0E8E90000100049444154FFD146370D86CFF96F7EF4BF3D8114442545805D803D343FCE28D047D70A803EE65996330B943CFD972C70';
wwv_flow_imp.g_varchar2_table(84) := '3387B9E9EE4B8B00BB009B9E46C15524A000A868B284BA4D8192A7FF27379F736781DB6606DB892A46F998E4544476014EE9B83685402F7D28007A996979AE2AF0F8E673EE5503A868F07C4C32166EFE5A607E5D700B47FE76C370E4371FE618CBDF7502';
wwv_flow_imp.g_varchar2_table(85) := '53082800A650D447D70263DBFF4F6E9EFEBB06BA20F99ECC6E77343EFA6897D77CBC9123854D0A811C17F0B9E52A817E6E5600F433D7329D4120BFF56FACDBC79EFEC7889EBBFE0FEFBCB3FBF9AF3E78EE5C8F6F5208E4188A811E0DE43CAF8002605E5F';
wwv_flow_imp.g_varchar2_table(86) := 'BD372EF0EF1FFEFA64864F3CFD9FF4D9BFF8EECDA2FF9D1FFE60F7E63B6FEFDEFD4001B06FA310D8D798F7E79E7A5700F434DB729D5CA0640760F2411BECF08D7FFCE9EE8D9FFEB4C1CCA64D298540BE2F306DAF7AEB554001D0EBCCCB7B11812F3DF8C2';
wwv_flow_imp.g_varchar2_table(87) := '22E3D43AC8F0D4EF89BF7C06F35D817C2CE0B722969B95B7ECABA502A0AFF996EDC402BFFCF0C3897BECA7BB7CD6EFA9FFF2F9CEDF84F025C1CBFDDCB9DB2900FC292030A340FE5EFB8CDD57DB7516FF7CD65F6D021B093C1F092802A69B8CDE7A5200F4';
wwv_flow_imp.g_varchar2_table(88) := '36E3F225B0B240B6FD2F59FCBFF6DA6BBBEF7DF35BCF8E7FF99B6FEF5A38869CFEEE8FFF6497E3DCE94911E0E38073D5B48F8002200A0E020416133877DB3F8B6216FAEFFDE5B7765FFBFDD79E1D8B053CF340434E7F7B5300E448AEC9F99C6153049CD3';
wwv_flow_imp.g_varchar2_table(89) := '5EDB4302FD9DBBD75FCA322640602D816CFD978E9D45308B6116C5D27B5A69979C937B0C4A72CA1703FDED8012296DF6051400FB1A7E26406036812CFEA55BFFD916CF22385B3095741C835894849B22C04701255287DBF4785601D0E3ACCB99C00A0225';
wwv_flow_imp.g_varchar2_table(90) := '8BFFF0397FB6C55708719343C622BB01B1190BD047016342AEEF0B2800F635FC4C80C02C0279FA2FE978F89CBFA46D6F6DB21B3096737601FCAD8031A543D7FB3CA700E873DE654D60518192A7FFD2ADEE4503DFD060D9092831B20BB0A149DB78280A80';
wwv_flow_imp.g_varchar2_table(91) := '8D4F90F008D42E50F2F49F2FBB6581AB3DD7B9E38F51ACC6C6F15D8031A1E7AFF7FA4E01D0EBCCCB9BC086044AB6B73714EEAAA19458D90558758AAA195C0150CD540994409D0263DBFF254FB475663E5FD46366F92EC07CA3B7D673BFF92800FA9D7B99';
wwv_flow_imp.g_varchar2_table(92) := '13985D20BFF56F6C909227DAB13E7ABB5E62E66380DEFE549C9FAF02E07C337710205028F0EE07BF3AD972EC49F6E4CD9D5F1CFB6B817601CAFE80F4DC4A01D0F3ECCB9DC0CC023FFFD507338FD06FF763BB00BF7DFAB45F1C99170928008A9834224060';
wwv_flow_imp.g_varchar2_table(93) := '0E813F7DEDB539BAD527814281BE9B2900FA9E7FD9139855E0DD0FEC00CC0AAC730257082800AEC0732B0102D709E4EFB55FD743BF778FD9F90EC0F89F8DDE5B28007AFF13207F02040810E8524001D0E5B44B9A000102BD0BC85F01E0CF000102040810';
wwv_flow_imp.g_varchar2_table(94) := 'E8504001D0E1A44B99000102BD0BC87FB75300F8534080000102043A1450007438E95226408040DF02B28F8002200A0E0204081020D0998002A0B309972E0102047A1790FFC7020A808F1DFC9700010204087425A000E86ABA254B800081DE05E43F0828';
wwv_flow_imp.g_varchar2_table(95) := '000609AF0408102040A02301054047932D55020408F42E20FF4F0514009F5AF88900010204087423A000E866AA254A800081DE05E4BF2FA000D8D7F0330102040810E8444001D0C9444B93000102BD0BC8FF790105C0F31EDE9D29F0FD9FFC7877CD71E6';
wwv_flow_imp.g_varchar2_table(96) := '709A13204080C044020A8089205BEDE6DECB2FB79A9ABC0810E84A40B2770514007745BC7F4EE033F7EF3FF7DE1B0204081068434001D0C63CCE96851D80D968754C80C08202867A514001F0A289337B02F76E76003EF7E0C1DE193F12204080400B020A';
wwv_flow_imp.g_varchar2_table(97) := '80166671E61C3E7B530028026646D63D0102330AE8FA908002E0908A732F0828025E207182000102550B2800AA9EBE65834F1170FFF5D777D90DF0DD8065ED8D4680C0E502EE3C2CA00038ECE2EC098114022F3D7CB84B3130769CE8C625020408105851';
wwv_flow_imp.g_varchar2_table(98) := '4001B022BEA109102040606E01FD1F1350001C93719E0001020408342CA000687872A546800081DE05E47F5C400170DCC6150204081020D0AC8002A0D9A995180102047A1790FF290105C0291DD7081020408040A3020A804627565A040810E85D40FEA7';
wwv_flow_imp.g_varchar2_table(99) := '051400A77D5C257095C0777EF883DD35C75583BB990001022704140027705C22408000815A05C43D26A0001813729D00010204083428A000687052A544800081DE05E43F2EA0001837D28200010204083427A000686E4A2544800081DE05E45F22A00028';
wwv_flow_imp.g_varchar2_table(100) := '51D28600010204083426A000686C42A543800081DE05E45F26A0002873D28AC04502F75F7F7D77EAB8A8533711204060020105C00488BA2040800081AD0888A3544001502AA51D010204081068484001D0D0644A85000102BD0BC8BF5C4001506EA52501';
wwv_flow_imp.g_varchar2_table(101) := '0204081068464001D0CC544A84000102BD0BC8FF1C0105C0395ADA122040800081460414008D4CA434081020D0BB80FCCF1350009CE7A5350102130AFCE177DFD85D734C18CA2A5D5D937BEE5D2568833623A00068662A25428000814F05EEBDFCF2A76F';
wwv_flow_imp.g_varchar2_table(102) := 'BAF84992E70A2800CE15D39E00010215087CE6FEFD0AA214E29A020A8035F58D4D80008199043EFBE0C14C3D6FB35B519D2FA00038DFCC1D040810D8B4C0E72CFE9B9E9FAD04A700D8CA4C8883000102130864F1EFEFE97F02B80EBB50007438E9522640';
wwv_flow_imp.g_varchar2_table(103) := 'A04D018B7F9BF33A57560A80B964F54B8000810504F26DFF2CFC2F3D7AB4EBF5C97F01E6268750003439AD92225087C0FDD75FDF9D3AEAC862BE284FD90CD75E7AF8F076E1BFE75BFFF34D44A33D2B001A9D5869112040A00F01595E2AA000B854CE7D04';
wwv_flow_imp.g_varchar2_table(104) := '08102040A062010540C5932774020408F42E20FFCB05140097DBB9930001020408542BA000A876EA044E800081DE05E47F8D8002E01A3DF71220408000814A051400954E9CB0091020D0BB80FCAF1350005CE7E76E020408102050A58002A0CA69133401';
wwv_flow_imp.g_varchar2_table(105) := '02047A1790FFB5020A806B05DD4F80000102042A1450005438694226408040EF02F2BF5E400170BDA11E08102040804075020A80EAA64CC0040810E85D40FE53082800A650D4070102040810A84C400150D9840997000102BD0BC87F1A0105C0348E7A21';
wwv_flow_imp.g_varchar2_table(106) := '408000010255092800AA9A2EC1122040A07701F94F25A000984A523F0408102040A02201054045932554020408F42E20FFE9041400D359EA8900010204085423A000A866AA044A800081DE05E43FA58002604A4D7D1120408000814A041400954C943009';
wwv_flow_imp.g_varchar2_table(107) := '1020D0BB80FCA71550004CEBA937020408102050858002A08A6912240102047A1790FFD4020A80A945F54780000102042A1050005430494224408040EF02F29F5E400130BDA91E0910204080C0E60514009B9F2201122040A07701F9CF21A0009843559F';
wwv_flow_imp.g_varchar2_table(108) := '040810204060E3020A808D4F90F0081020D0BB80FCE7115000CCE3AAD74281EFFFE4C7BB9A8FC23435234080C0E60414009B9B92B602BAF7F2CB6D257446363DE77E0693A60446045C9E4B40013097AC7E6F053E73FFFEED6B8FFFE939F71EE75BCE046A';
wwv_flow_imp.g_varchar2_table(109) := '135000D4366395C5DBF353F0671F3CA86CB6844B607B02229A4F4001309FAD9E6F04EEDDEC007CAEC385B0C79C6FA6DBFF0810A848400150D164D51A6A9E847B5A10936B72AE75BEC44D603B02229953400130A7AEBE9F096441CCC2F8EC44A33F24C7E4';
wwv_flow_imp.g_varchar2_table(110) := 'DA687AD22240A0210105404393B9F554B230DE7FFDF55D16C996BE1B905C92D34B8F1EED92E3D6E7417C046A1110E7BC020A80797DF57E40208BE44B0F1FEE520CB4702497E494EF3B1C48D7290204086C524001B0C96911140102047A1790FFDC020A80';
wwv_flow_imp.g_varchar2_table(111) := 'B985F54F80000102043628A000D8E0A40889000102BD0BC87F7E0105C0FCC6462040800001029B1350006C6E4A0444800081DE05E4BF848002600965631020408000818D092800363621C221408040EF02F25F464001B08CB351085C24F09D1FFE6057F3';
wwv_flow_imp.g_varchar2_table(112) := '7151D26E224060110105C022CC0621705820BF45F0F095F6CFF69C7BFBB37B4D86EE5D4A4001B094B471081C10F8CCFDFB07CEF671AAE7DCFB9861596E5D4001B0F519125FD3023D3F05E7D727373DB992BB48C04DCB09280096B33612811704F2EF07E4';
wwv_flow_imp.g_varchar2_table(113) := '1F127AE142E3277ACCB9F129955E85020A800A274DC86D09E449B8A70531B926E7B6665136D308E865490105C092DAC6227044200B6216C623979B399D1C936B3309498440C5020A808A274FE86D096461CC3F8F9C45B2A5EF062497E4F4D2A347BBE4D8';
wwv_flow_imp.g_varchar2_table(114) := 'D6ACC9664A017D2D2BA00058D6DB68044605B248BEF4F0E12EC5400B4772494EF9BEC368F21A1020B098800260316A0311204080C0710157961650002C2D6E3C0204081020B0010105C006264108040810E85D40FECB0B2800963737220102040810585D';
wwv_flow_imp.g_varchar2_table(115) := '4001B0FA140880000102BD0BC87F0D0105C01AEAC62440800001022B0B2800569E00C3132040A07701F9AF23A00058C7DDA804084C20F087DF7D6357F33101812E085C2CA000B898CE8D0408CC2D90DF2238F7185BEDBF9FDCB73A03EDC7A500687F8E65';
wwv_flow_imp.g_varchar2_table(116) := '48A05A81CFDCBF5F6DECD706DE73EED7DAB9BF4C400150E6A41501022B08F4FC149C5F9FBC02F9E2431A703D0105C07AF6462640604420FF7E40FE21A19166CD5DEE31E7E626B182841400154C921009F42C9027E19E16C4E49A9CFB987359AE29A00058';
wwv_flow_imp.g_varchar2_table(117) := '53DFD8040814096441CCC258D4B8E246C931B9569C82D02B1250005434594225D0B34016C6FCF3C859245BFA6E4072494E2F3D7AB44B8E3DCDB15CD7155000ACEB6F740204CE14C822F9D2C387BB14032D1CC92539E5FB0E6752684EE02A0105C0557C6E';
wwv_flow_imp.g_varchar2_table(118) := '2640800081CB04DCB5B6800260ED19303E010204081058414001B002BA21091020D0BB80FCD7175000AC3F07222040800001028B0B2800162737200102047A1790FF160414005B980531102040800081850514000B831B8E000102BD0BC87F1B020A806D';
wwv_flow_imp.g_varchar2_table(119) := 'CC83280810204080C0A2020A8045B90D46800081DE05E4BF150105C05666421C040810204060410105C082D88622408040EF02F2DF8E8002603B7321120204081020B098800260316A03112040A07701F96F494001B0A5D9100B010204081058484001B0';
wwv_flow_imp.g_varchar2_table(120) := '10B461081020D0BB80FCB725A000D8D67C888600010204082C22A0005884D920040810E85D40FE5B1350006C6D46C4438000010204161050002C806C08020408F42E20FFED092800B6372722224080000102B30B2800662736000102047A1790FF160514';
wwv_flow_imp.g_varchar2_table(121) := '005B9C1531112040800081990514003303EB9E000102BD0BC87F9B020A806DCE8BA80810204080C0AC020A805979754E800081DE05E4BF550105C05667465C040810204060460105C08CB8BA26408040EF02F2DFAE800260BB7323320204081020309B80';
wwv_flow_imp.g_varchar2_table(122) := '0260365A1D132040A07701F96F594001B0E5D9111B0102040810984940013013AC6E091020D0BB80FCB72DA000D8F6FC888E0001020408CC22A000988555A7040810E85D40FE5B1750006C7D86C447800001020466105000CC80AA4B020408F42E20FFED';
wwv_flow_imp.g_varchar2_table(123) := '0B2800B63F4722244080000102930B28002627D5210102047A17907F0D020A801A66498C040810204060620105C0C4A0BA23408040EF02F2AF43400150C73C899200010204084C2AA00098945367040810E85D40FEB50828006A99297112204080008109';
wwv_flow_imp.g_varchar2_table(124) := '0514001362EA8A000102BD0BC8BF1E0105403D73255202040810203099800260324A1D112040A07701F9D724A000A869B6C44A80001A5ACD990000048049444154010204261250004C04A91B020408F42E20FFBA04140075CD97680910204080C024020A';
wwv_flow_imp.g_varchar2_table(125) := '8049187542800081DE05E45F9B8002A0B619132F0102040810984040013001A22E081020D0BB80FCEB135000D4376722264080000102570B2800AE26D4010102047A17907F8D020A801A674DCC0408102040E04A0105C095806E27408040EF02F2AF5340';
wwv_flow_imp.g_varchar2_table(126) := '0150E7BC899A00010204085C25A000B88ACFCD040810E85D40FEB50A28006A9D39711320408000812B04140057E0B995000102BD0BC8BF5E010540BD732772020408102070B18002E0623A37122040A07701F9D72CA000A879F6C44E80000102042E1450';
wwv_flow_imp.g_varchar2_table(127) := '005C08E736020408F42E20FFBA05140075CF9FE80910204080C045020A808BD8DC44800081DE05E45FBB8002A0F619143F0102040810B840400170019A5B081020D0BB80FCEB175000D43F8732204080000102670B2800CE2673030102047A17907F0B02';
wwv_flow_imp.g_varchar2_table(128) := '0A801666510E0408102040E04C0105C099609A132040A07701F9B721A00068631E65418000010204CE1250009CC5A5310102047A17907F2B020A805666521E0408102040E00C0105C019589A122040A07701F9B723A00068672E654280000102048A0514';
wwv_flow_imp.g_varchar2_table(129) := '00C5541A122040A07701F9B724A000686936E54280000102040A05140085509A112040A07701F9B725A000686B3E654380000102048A041400454C1A112040A07701F9B726A000686D46E54380000102040A04140005489A102040A07701F9B727A00068';
wwv_flow_imp.g_varchar2_table(130) := '6F4E6544800001020446051400A3441A102040A07701F9B728A000687156E54480000102044604140023402E132040A07701F9B729A00068735E654580000102044E0A28004EF2B848800081DE05E4DFAA8002A0D599951701020408103821A0003881E3';
wwv_flow_imp.g_varchar2_table(131) := '120102047A17907FBB020A8076E756660408102040E0A88002E0288D0B040810E85D40FE2D0B28005A9E5DB911204080008123020A8023304E132040A07701F9B72DA000687B7E654780000102040E0A28000EB23849800081DE05E4DFBA8002A0F51996';
wwv_flow_imp.g_varchar2_table(132) := '1F01020408103820A0003880E2140102047A17907FFB020A80F6E758860408102040E0050105C00B244E102040A07701F9F720A000E86196E5488000010204EE082800EE80784B800081DE05E4DF878002A08F7996250102040810784E4001F01C873704';
wwv_flow_imp.g_varchar2_table(133) := '0810E85D40FEBD0828007A9969791220408000813D0105C01E861F091020D0BB80FCFB115000F433D732254080000102CF041400CF28FC40800081DE05E4DF938002A0A7D9962B0102040810F8444001F0098417020408F42E20FFBE0414007DCDB76C09';
wwv_flow_imp.g_varchar2_table(134) := '10204080C0AD8002E096C17F081020D0BB80FC7B135000F436E3F225408000010237020A801B04FF23408040EF02F2EF4F4001D0DF9CCB980001020408EC1400FE10102040A07B01003D0A28007A9C75391320408040F7020A80EEFF08002040A07701F9';
wwv_flow_imp.g_varchar2_table(135) := 'F729A000E873DE654D800001029D0B28003AFF03207D02047A17907FAF020A805E675EDE04081020D0B58002A0EBE9973C0102BD0BC8BF5F010540BF732F7302040810E8584001D0F1E44B9D0081DE05E4DFB38002A0E7D9973B01020408742BA000E876';
wwv_flow_imp.g_varchar2_table(136) := 'EA254E8040EF02F2EF5BE0BF000000FFFF741802920000000649444154030075DE012D31504ECE0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(19582727364819922287)
,p_file_name=>'icons/app-icon-512.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260715064303Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064303Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(19582728656815922288)
,p_name=>'Administration Rights'
,p_static_id=>'administration-rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'plsql_function_body', 'return true;')).to_clob
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_version_scn=>'SH256:K94FzTYWdjDQ6WIg6w48Or20nhyD_tWnqCuRh9rK4CU'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
,p_created_on=>wwv_flow_imp.dz('20260715064303Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064303Z')
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
prompt --application/shared_components/user_interface/lovs/boolean
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(19582847896199923128)
,p_lov_name=>'BOOLEAN'
,p_static_id=>'boolean'
,p_lov_query=>'.'||wwv_flow_imp.id(19582847896199923128)||'.'
,p_location=>'STATIC'
,p_version_scn=>'SH256:CnCBOq-zabcz-aPWKwU8C5KDeZy6YuyjvpJoTrTywfI'
,p_created_on=>wwv_flow_imp.dz('20260715064311Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064312Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(19582848540460923131)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'FALSE'
,p_static_id=>'false'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(19582848195211923129)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'TRUE'
,p_static_id=>'true'
);
end;
/
prompt --application/shared_components/user_interface/lovs/tms_candidates_first_name
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(19587710904497121520)
,p_lov_name=>'TMS_CANDIDATES.FIRST_NAME'
,p_static_id=>'tms-candidates-first-name'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'TMS_CANDIDATES'
,p_return_column_name=>'CANDIDATE_ID'
,p_display_column_name=>'FIRST_NAME'
,p_default_sort_column_name=>'FIRST_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:0v8aEtcAXhhm0wMTi02LkyUic30xlZp5rx3MNbPaZ84'
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/user_interface/lovs/tms_departments_name
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(19582742933283922479)
,p_lov_name=>'TMS_DEPARTMENTS.NAME'
,p_static_id=>'tms-departments-name'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'TMS_DEPARTMENTS'
,p_return_column_name=>'DEPT_ID'
,p_display_column_name=>'NAME'
,p_default_sort_column_name=>'NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:JBT3jhsjzWOaf4wOnKmr5bUDZCclmGNI-OFatrUn58I'
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064305Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/user_interface/lovs/tms_job_requisitions_requested_by
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(19582770871788922941)
,p_lov_name=>'TMS_JOB_REQUISITIONS.REQUESTED_BY'
,p_static_id=>'tms-job-requisitions-requested-by'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'TMS_JOB_REQUISITIONS'
,p_return_column_name=>'REQ_ID'
,p_display_column_name=>'REQUESTED_BY'
,p_default_sort_column_name=>'REQUESTED_BY'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:L4ZNNVCycMMRz4MYv8G3uoxfsVQO5fhkRHjk5ofyCSM'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/shared_components/user_interface/lovs/tms_jobs_title
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(19582742258324922468)
,p_lov_name=>'TMS_JOBS.TITLE'
,p_static_id=>'tms-jobs-title'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'TMS_JOBS'
,p_return_column_name=>'JOB_ID'
,p_display_column_name=>'TITLE'
,p_default_sort_column_name=>'TITLE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:SoSbcOcgLMcARq6hix-r_UyA3r9scKwCEEX5RMoUGZo'
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064305Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(19582728959625922292)
,p_group_name=>'Administration'
,p_static_id=>'administration'
);
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(19582723706209922178)
,p_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260714123354Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(19582796674452923011)
,p_short_name=>'Candidate Pipeline'
,p_static_id=>'candidate-pipeline'
,p_link=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>4
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(43946811628708411)
,p_short_name=>'Candidate Profile'
,p_static_id=>'candidate-profile'
,p_link=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>10
,p_created_on=>wwv_flow_imp.dz('20260714123354Z')
,p_updated_on=>wwv_flow_imp.dz('20260714123354Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(19582723921800922179)
,p_short_name=>'Home'
,p_static_id=>'home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>1
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(19582800393819923018)
,p_short_name=>'Interview Schedule'
,p_static_id=>'interview-schedule'
,p_link=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>7
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(19582766776161922744)
,p_short_name=>'Job Requisitions'
,p_static_id=>'job-requisitions'
,p_link=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>2
,p_created_on=>wwv_flow_imp.dz('20260715064308Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064308Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(19589231385843270987)
,p_short_name=>'Jobs'
,p_static_id=>'jobs'
,p_link=>'f?p=&APP_ID.:11:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>11
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(19587733288787121826)
,p_short_name=>'Offer Management'
,p_static_id=>'offer-management'
,p_link=>'f?p=&APP_ID.:8:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>8
,p_created_on=>wwv_flow_imp.dz('20260715081226Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081226Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(19582954797377942320)
,p_short_name=>'Offers'
,p_static_id=>'offers'
,p_link=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>6
,p_created_on=>wwv_flow_imp.dz('20260715064623Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064623Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(19589647207458665551)
,p_short_name=>'Recruitment Metrics Overview'
,p_static_id=>'recruitment-metrics-overview'
,p_link=>'f?p=&APP_ID.:13:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>13
,p_created_on=>wwv_flow_imp.dz('20260715084656Z')
,p_updated_on=>wwv_flow_imp.dz('20260715084656Z')
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
 p_id=>wwv_flow_imp.id(19582724595868922191)
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
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064303Z')
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
 p_id=>wwv_flow_imp.id(19582722994623922167)
,p_build_option_name=>'Commented Out'
,p_static_id=>'commented-out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>'SH256:1lQI3DW9n-0ZEGoDXUirkaB0JWCIATVWpJZCTCkODmI'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
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
 p_id=>wwv_flow_imp.id(19582723321384922171)
,p_name=>'Oracle APEX Accounts'
,p_static_id=>'oracle-apex-accounts'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>'SH256:MwlwV9vQNyvTGV3nRFfTrp5n7mJ1Ugme2lUrlsOYuxw'
,p_created_on=>wwv_flow_imp.dz('20260715064302Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064302Z')
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
,p_step_template=>4073832297226169690
,p_protection_level=>'D'
,p_page_component_map=>'14'
,p_created_on=>wwv_flow_imp.dz('20260715064303Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714162240Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27420106449393915)
,p_plug_name=>'Hiring_Infor'
,p_static_id=>'hiring-infor'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'AFTER_LOGO'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<strong>Now Hiring:</strong> Open Roles at ACME Corp. <a href="f?p=&APP_ID.:2:&SESSION.">View Jobs </a>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260714162226Z')
,p_updated_on=>wwv_flow_imp.dz('20260714162240Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Talent Acquisition Portal'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714163224Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27420244740393916)
,p_plug_name=>'Active Candidates'
,p_static_id=>'active-candidates'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_count number;',
'begin',
'    select count(*)',
'      into l_count',
'      from TMS_candidates',
'     where current_stage not in (''Hired'', ''Rejected'');',
'',
'    return ''<p>Active candidates: '' || l_count || ''</p>'';',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_created_on=>wwv_flow_imp.dz('20260714163224Z')
,p_updated_on=>wwv_flow_imp.dz('20260714163224Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19582847488992923125)
,p_plug_name=>'Page Navigation'
,p_static_id=>'page-navigation'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--featured t-Cards--block force-fa-lg:t-Cards--displayIcons:t-Cards--4cols:t-Cards--hideBody:t-Cards--animColorFill'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_list_id=>wwv_flow_imp.id(19582845264450923120)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2888245825625742894
,p_plug_query_num_rows=>15
,p_created_on=>wwv_flow_imp.dz('20260715064311Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19582739540988922366)
,p_plug_name=>'Talent Acquisition Portal'
,p_static_id=>'talent-acquisition-portal'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>2675494171183407654
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_imp_page.create_page(
 p_id=>2
,p_name=>'Job Requisitions'
,p_alias=>'JOB-REQUISITIONS'
,p_step_title=>'Job Requisitions'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>To find data enter a search term into the search dialog, or click on the column headings to limit the records returned.</p>',
'',
'<p>You can perform numerous functions by clicking the <strong>Actions</strong> button. This includes selecting the columns that are displayed / hidden and their display sequence, plus numerous data and format functions.  You can also define additiona'
||'l views of the data using the chart, group by, and pivot options.</p>',
'',
'<p>If you want to save your customizations select report, or click download to unload the data. Enter you email address and time frame under subscription to be sent the data on a regular basis.<p>',
'',
'<p>For additional information click Help at the bottom of the Actions menu.</p> ',
'',
'<p>Click the <strong>Reset</strong> button to reset the interactive report back to the default settings.</p>'))
,p_page_component_map=>'18'
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19582766172846922738)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(19582723706209922178)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260715064308Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064308Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19582757186713922678)
,p_plug_name=>'Job Requisitions'
,p_static_id=>'job-requisitions'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'TMS_JOB_REQUISITIONS'
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
,p_created_on=>wwv_flow_imp.dz('20260715064307Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(19582757346611922678)
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
,p_detail_link=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:RP:P3_REQ_ID:\#REQ_ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>19538940074552276711
,p_created_on=>wwv_flow_imp.dz('20260715064307Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582761167893922717)
,p_db_column_name=>'APPROVED_BY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Approved By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064307Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582762708200922724)
,p_db_column_name=>'CLOSE_DATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Close Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064307Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582763561416922727)
,p_db_column_name=>'CREATED_AT'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Created At'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064307Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582763144204922726)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064307Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582760266147922714)
,p_db_column_name=>'DEPT_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Dept'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(19582742933283922479)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064307Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582761483912922719)
,p_db_column_name=>'HEADCOUNT'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Headcount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064307Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582759625020922712)
,p_db_column_name=>'JOB_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Job'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(19582742258324922468)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064307Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582762293819922722)
,p_db_column_name=>'OPEN_DATE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Open Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064307Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582760724793922716)
,p_db_column_name=>'REQUESTED_BY'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Requested By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064307Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582758544259922700)
,p_db_column_name=>'REQ_ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Req ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064307Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582761910764922721)
,p_db_column_name=>'STATUS'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064307Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582764485475922730)
,p_db_column_name=>'UPDATED_AT'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Updated At'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064308Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582764165091922729)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064307Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19582801168502923044)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'JOB_ID:DEPT_ID:REQUESTED_BY:APPROVED_BY:HEADCOUNT:STATUS:OPEN_DATE:CLOSE_DATE:CREATED_AT:UPDATED_AT'
,p_sort_column_1=>'JOB_ID'
,p_sort_direction_1=>'ASC'
,p_created_on=>wwv_flow_imp.dz('20260715064311Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19582764859852922731)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19582757186713922678)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:3::'
,p_created_on=>wwv_flow_imp.dz('20260715064308Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064308Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(19582765230148922732)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(19582757186713922678)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260715064308Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064308Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19582765595758922734)
,p_event_id=>wwv_flow_imp.id(19582765230148922732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19582757186713922678)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064308Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064308Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_imp_page.create_page(
 p_id=>3
,p_name=>'Job Requisition'
,p_alias=>'JOB-REQUISITION'
,p_page_mode=>'MODAL'
,p_step_title=>'Job Requisition'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19582752250770922496)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064305Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19582741414566922458)
,p_plug_name=>'Job Requisition'
,p_static_id=>'job-requisition'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'TMS_JOB_REQUISITIONS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19582752574677922496)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19582752250770922496)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064305Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(19582753096126922498)
,p_button_id=>wwv_flow_imp.id(19582752574677922496)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_stop_execution_on_error=>true
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064305Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19582754383800922501)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(19582752250770922496)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P3_REQ_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064305Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19582753654353922501)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(19582752250770922496)
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
,p_button_condition=>'P3_REQ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064308Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19582754030030922501)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(19582752250770922496)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P3_REQ_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064305Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582743948134922481)
,p_name=>'P3_APPROVED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_item_source_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_prompt=>'Approved By'
,p_source=>'APPROVED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582745547176922483)
,p_name=>'P3_CLOSE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_item_source_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_prompt=>'Close Date'
,p_source=>'CLOSE_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582746345189922485)
,p_name=>'P3_CREATED_AT'
,p_source_data_type=>'TIMESTAMP_LTZ'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_item_source_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_prompt=>'Created At'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
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
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582745878948922484)
,p_name=>'P3_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_item_source_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>32
,p_cMaxlength=>255
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582742815667922478)
,p_name=>'P3_DEPT_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_item_source_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_prompt=>'Dept'
,p_source=>'DEPT_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TMS_DEPARTMENTS.NAME'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582744285112922481)
,p_name=>'P3_HEADCOUNT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_item_source_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_prompt=>'Headcount'
,p_source=>'HEADCOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582742119758922466)
,p_name=>'P3_JOB_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_item_source_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_prompt=>'Job'
,p_source=>'JOB_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TMS_JOBS.TITLE'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582745133589922483)
,p_name=>'P3_OPEN_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_item_source_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_prompt=>'Open Date'
,p_source=>'OPEN_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
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
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582743482814922480)
,p_name=>'P3_REQUESTED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_item_source_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_prompt=>'Requested By'
,p_source=>'REQUESTED_BY'
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
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582741768153922459)
,p_name=>'P3_REQ_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_item_source_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_source=>'REQ_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582744715468922482)
,p_name=>'P3_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_item_source_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_prompt=>'Status'
,p_source=>'STATUS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582747512303922488)
,p_name=>'P3_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP_LTZ'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_item_source_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_prompt=>'Updated At'
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
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
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582747157101922488)
,p_name=>'P3_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_item_source_plug_id=>wwv_flow_imp.id(19582741414566922458)
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>32
,p_cMaxlength=>255
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(19582746718676922487)
,p_validation_name=>'P3_CREATED_AT must be timestamp'
,p_static_id=>'p3-created-at-must-be-timestamp'
,p_validation_sequence=>100
,p_validation=>'P3_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(19582746345189922485)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064305Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(19582747944288922489)
,p_validation_name=>'P3_UPDATED_AT must be timestamp'
,p_static_id=>'p3-updated-at-must-be-timestamp'
,p_validation_sequence=>120
,p_validation=>'P3_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(19582747512303922488)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064305Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19582755583216922503)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>19538938311157276536
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064305Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19582754801708922502)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(19582741414566922458)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Job Requisition'
,p_static_id=>'initialize-form-job-requisition'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>19538937529649276535
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064305Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19582755226544922503)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(19582741414566922458)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Job Requisition'
,p_static_id=>'process-form-job-requisition'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>19538937954485276536
,p_created_on=>wwv_flow_imp.dz('20260715064305Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064305Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_imp_page.create_page(
 p_id=>4
,p_name=>'Candidate Pipeline'
,p_alias=>'CANDIDATE-PIPELINE'
,p_step_title=>'Candidate Pipeline'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>To find data enter a search term into the search dialog, or click on the column headings to limit the records returned.</p>',
'',
'<p>You can perform numerous functions by clicking the <strong>Actions</strong> button. This includes selecting the columns that are displayed / hidden and their display sequence, plus numerous data and format functions.  You can also define additiona'
||'l views of the data using the chart, group by, and pivot options.</p>',
'',
'<p>If you want to save your customizations select report, or click download to unload the data. Enter you email address and time frame under subscription to be sent the data on a regular basis.<p>',
'',
'<p>For additional information click Help at the bottom of the Actions menu.</p> ',
'',
'<p>Click the <strong>Reset</strong> button to reset the interactive report back to the default settings.</p>'))
,p_page_component_map=>'23'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714160125Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19582796095457923010)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(19582723706209922178)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19582786833533922965)
,p_plug_name=>'Candidates'
,p_static_id=>'candidate-pipeline'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "CANDIDATE_ID",',
'       "REQ_ID",',
'       "FIRST_NAME",',
'       "LAST_NAME",',
'       "EMAIL",',
'       "PHONE",',
'       sys.dbms_lob.getlength( "RESUME_BLOB" ) "RESUME_BLOB",',
'       "SOURCE",',
'       "CURRENT_STAGE",',
'       "APPLIED_DATE",',
'       "DIVERSITY_FLAG",',
'       "AI_SCORE",',
'       "CREATED_BY",',
'       "CREATED_AT",',
'       "UPDATED_BY",',
'       "UPDATED_AT"',
'  from "TMS_CANDIDATES"'))
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
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(19582786915615922965)
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
,p_detail_link=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.:RP:P5_CANDIDATE_ID:\#CANDIDATE_ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>19538969643556276998
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582792812468922999)
,p_db_column_name=>'AI_SCORE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Ai Score'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582792001379922995)
,p_db_column_name=>'APPLIED_DATE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Applied Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582788430682922974)
,p_db_column_name=>'CANDIDATE_ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Candidate ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582793605161923003)
,p_db_column_name=>'CREATED_AT'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Created At'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582793201948923001)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582791579322922993)
,p_db_column_name=>'CURRENT_STAGE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Current Stage'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582792389815922997)
,p_db_column_name=>'DIVERSITY_FLAG'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Diversity Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582790071745922985)
,p_db_column_name=>'EMAIL'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582789185207922980)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582789599372922982)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582790444583922987)
,p_db_column_name=>'PHONE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Phone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582788805896922978)
,p_db_column_name=>'REQ_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Req'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(19582770871788922941)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582790776961922989)
,p_db_column_name=>'RESUME_BLOB'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Resume Blob'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DOWNLOAD:TMS_CANDIDATES:RESUME_BLOB:CANDIDATE_ID::::::attachment'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582791215480922991)
,p_db_column_name=>'SOURCE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Source'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582794391358923006)
,p_db_column_name=>'UPDATED_AT'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Updated At'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19582794038980923004)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19582821987998923089)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'REQ_ID:FIRST_NAME:LAST_NAME:EMAIL:PHONE:RESUME_BLOB:SOURCE:CURRENT_STAGE:APPLIED_DATE:DIVERSITY_FLAG:AI_SCORE:CREATED_AT:UPDATED_AT'
,p_sort_column_1=>'REQ_ID'
,p_sort_direction_1=>'ASC'
,p_created_on=>wwv_flow_imp.dz('20260715064311Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(44235812717426101)
,p_plug_name=>'Applied'
,p_static_id=>'candidate-pipeline_1'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2074200852440250129
,p_plug_display_sequence=>5
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  candidate_id,',
'  first_name || '' '' || last_name as candidate_name,',
'  current_stage,',
'  ''Applied: '' || to_char(applied_date, ''DD-Mon-YYYY'') as applied_on',
'from tms_candidates',
'order by applied_date desc'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_created_on=>wwv_flow_imp.dz('20260714143348Z')
,p_updated_on=>wwv_flow_imp.dz('20260714160125Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(44235942105426102)
,p_region_id=>wwv_flow_imp.id(44235812717426101)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'CANDIDATE_NAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'CURRENT_STAGE'
,p_body_adv_formatting=>false
,p_body_column_name=>'APPLIED_ON'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'CANDIDATE_NAME'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_updated_on=>wwv_flow_imp.dz('20260714160125Z')
,p_updated_by=>'GENDEV'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27419505440393909)
,p_plug_name=>'Open Requisitions'
,p_static_id=>'open-requisitions'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_06'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_open_count number;',
'begin',
'    select count(*)',
'      into l_open_count',
'      from tms_job_requisitions',
'     where status = ''Open'';',
'',
'    return ''Open Requisitions: '' || apex_escape.html(to_char(l_open_count));',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_created_on=>wwv_flow_imp.dz('20260714133649Z')
,p_updated_on=>wwv_flow_imp.dz('20260714133649Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19582794862663923008)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19582786833533922965)
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
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(19582795196764923009)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(19582786833533922965)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19582795597058923009)
,p_event_id=>wwv_flow_imp.id(19582795196764923009)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19582786833533922965)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_imp_page.create_page(
 p_id=>5
,p_name=>'Candidate'
,p_alias=>'CANDIDATE'
,p_page_mode=>'MODAL'
,p_step_title=>'Candidate'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260715064309Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19582782675922922959)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19582770011053922940)
,p_plug_name=>'Candidate'
,p_static_id=>'candidate'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'TMS_CANDIDATES'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19582783101223922959)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19582782675922922959)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(19582783623107922960)
,p_button_id=>wwv_flow_imp.id(19582783101223922959)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_stop_execution_on_error=>true
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19582784968054922962)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(19582782675922922959)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P5_CANDIDATE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19582784126935922961)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(19582782675922922959)
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
,p_button_condition=>'P5_CANDIDATE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19582784499726922962)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(19582782675922922959)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P5_CANDIDATE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582775019528922949)
,p_name=>'P5_AI_SCORE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_prompt=>'Ai Score'
,p_source=>'AI_SCORE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582774187727922947)
,p_name=>'P5_APPLIED_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_prompt=>'Applied Date'
,p_source=>'APPLIED_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
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
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582770272221922940)
,p_name=>'P5_CANDIDATE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_source=>'CANDIDATE_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582775862284922950)
,p_name=>'P5_CREATED_AT'
,p_source_data_type=>'TIMESTAMP_LTZ'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_prompt=>'Created At'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
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
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582775421479922949)
,p_name=>'P5_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>32
,p_cMaxlength=>255
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582773854564922947)
,p_name=>'P5_CURRENT_STAGE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_prompt=>'Current Stage'
,p_source=>'CURRENT_STAGE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582774652587922948)
,p_name=>'P5_DIVERSITY_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_prompt=>'Diversity Flag'
,p_source=>'DIVERSITY_FLAG'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582772209745922944)
,p_name=>'P5_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>320
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582771458277922943)
,p_name=>'P5_FIRST_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_prompt=>'First Name'
,p_source=>'FIRST_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>80
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582771819031922943)
,p_name=>'P5_LAST_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_prompt=>'Last Name'
,p_source=>'LAST_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>80
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582772635911922944)
,p_name=>'P5_PHONE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_prompt=>'Phone'
,p_source=>'PHONE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582770695773922941)
,p_name=>'P5_REQ_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_prompt=>'Req'
,p_source=>'REQ_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TMS_JOB_REQUISITIONS.REQUESTED_BY'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582772982982922945)
,p_name=>'P5_RESUME_BLOB'
,p_source_data_type=>'BLOB'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_prompt=>'Resume Blob'
,p_source=>'RESUME_BLOB'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'content_disposition', 'attachment',
  'display_as', 'INLINE',
  'display_download_link', 'Y',
  'storage_type', 'DB_COLUMN')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582773456216922946)
,p_name=>'P5_SOURCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_prompt=>'Source'
,p_source=>'SOURCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582777037292922952)
,p_name=>'P5_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP_LTZ'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_prompt=>'Updated At'
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
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
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582776636541922951)
,p_name=>'P5_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_item_source_plug_id=>wwv_flow_imp.id(19582770011053922940)
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>32
,p_cMaxlength=>255
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064311Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(19582776178334922950)
,p_validation_name=>'P5_CREATED_AT must be timestamp'
,p_static_id=>'p5-created-at-must-be-timestamp'
,p_validation_sequence=>130
,p_validation=>'P5_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(19582775862284922950)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(19582777450085922952)
,p_validation_name=>'P5_UPDATED_AT must be timestamp'
,p_static_id=>'p5-updated-at-must-be-timestamp'
,p_validation_sequence=>150
,p_validation=>'P5_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(19582777037292922952)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19582786144491922964)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>19538968872432276997
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19582785312334922963)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(19582770011053922940)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Candidate'
,p_static_id=>'initialize-form-candidate'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>19538968040275276996
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19582785712013922963)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(19582770011053922940)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Candidate'
,p_static_id=>'process-form-candidate'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>19538968439954276996
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_imp_page.create_page(
 p_id=>6
,p_name=>'Offers'
,p_alias=>'OFFERS'
,p_step_title=>'Offers'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
,p_created_on=>wwv_flow_imp.dz('20260715064623Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260715064623Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19582954192800942318)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(19582723706209922178)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260715064623Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064623Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_imp_page.create_page(
 p_id=>7
,p_name=>'Interview Schedule'
,p_alias=>'INTERVIEW-SCHEDULE'
,p_step_title=>'Interview Schedule'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19582799814387923018)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(19582723706209922178)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260715064310Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064310Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00008
begin
wwv_flow_imp_page.create_page(
 p_id=>8
,p_name=>'Offer Management'
,p_alias=>'OFFER-MANAGEMENT'
,p_step_title=>'Offer Management'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260715081237Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19587733430608121826)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(19582723706209922178)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260715081226Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081226Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19587725363757121781)
,p_plug_name=>'Offer Management'
,p_static_id=>'offer-management'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "OFFER_ID",',
'       "CANDIDATE_ID",',
'       "REQ_ID",',
'       "OFFERED_SALARY",',
'       "START_DATE",',
'       "EXPIRY_DATE",',
'       "STATUS",',
'       sys.dbms_lob.getlength( "OFFER_LETTER_BLOB" ) "OFFER_LETTER_BLOB",',
'       "APPROVED_BY",',
'       "CREATED_BY",',
'       "CREATED_AT",',
'       "UPDATED_BY",',
'       "UPDATED_AT"',
'  from "TMS_OFFERS"'))
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
,p_created_on=>wwv_flow_imp.dz('20260715081225Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081237Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(19587725440209121781)
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
,p_detail_link=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:RP:P9_OFFER_ID:\#OFFER_ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>19543908168149475814
,p_created_on=>wwv_flow_imp.dz('20260715081225Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081237Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19587729842382121810)
,p_db_column_name=>'APPROVED_BY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Approved By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715081225Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081225Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19587727035610121799)
,p_db_column_name=>'CANDIDATE_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Candidate'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(19587710904497121520)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715081225Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081225Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19587730605001121814)
,p_db_column_name=>'CREATED_AT'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Created At'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715081225Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081225Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19587730211689121812)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715081225Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081225Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19587728658639121805)
,p_db_column_name=>'EXPIRY_DATE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Expiry Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715081225Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081225Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19587727806477121802)
,p_db_column_name=>'OFFERED_SALARY'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Offered Salary'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715081225Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081225Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19587726577221121795)
,p_db_column_name=>'OFFER_ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Offer ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715081225Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081225Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19587729425927121808)
,p_db_column_name=>'OFFER_LETTER_BLOB'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Offer Letter Blob'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DOWNLOAD:TMS_OFFERS:OFFER_LETTER_BLOB:OFFER_ID::::::attachment'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715081225Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081225Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19587727419114121800)
,p_db_column_name=>'REQ_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Req'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(19582770871788922941)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715081225Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081225Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19587728193635121803)
,p_db_column_name=>'START_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Start Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715081225Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081225Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19587729046352121806)
,p_db_column_name=>'STATUS'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715081225Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081225Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19587731328259121817)
,p_db_column_name=>'UPDATED_AT'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Updated At'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715081226Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081226Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19587731033409121815)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715081226Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081226Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19587735340625122988)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'OFFER_ID:CANDIDATE_ID:REQ_ID:OFFERED_SALARY:START_DATE:EXPIRY_DATE:STATUS:OFFER_LETTER_BLOB:APPROVED_BY:CREATED_BY:CREATED_AT:UPDATED_BY:UPDATED_AT'
,p_created_on=>wwv_flow_imp.dz('20260715081237Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081237Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19587731767918121820)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19587725363757121781)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:9::'
,p_created_on=>wwv_flow_imp.dz('20260715081226Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081226Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(19587732075263121820)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(19587725363757121781)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260715081226Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081226Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19587732565141121821)
,p_event_id=>wwv_flow_imp.id(19587732075263121820)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19587725363757121781)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715081226Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081226Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_imp_page.create_page(
 p_id=>9
,p_name=>'Form on Offers'
,p_alias=>'FORM-ON-OFFERS'
,p_page_mode=>'MODAL'
,p_step_title=>'Form on Offers'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260715081221Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19587720488339121535)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19587710128589121509)
,p_plug_name=>'Form on Offers'
,p_static_id=>'form-on-offers'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'TMS_OFFERS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260715081222Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081222Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19587720878159121535)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19587720488339121535)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(19587721416728121536)
,p_button_id=>wwv_flow_imp.id(19587720878159121535)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_stop_execution_on_error=>true
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19587722695864121538)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(19587720488339121535)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P9_OFFER_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19587721906562121537)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(19587720488339121535)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P9_OFFER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19587722303747121537)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(19587720488339121535)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P9_OFFER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19587713777603121527)
,p_name=>'P9_APPROVED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_item_source_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_prompt=>'Approved By'
,p_source=>'APPROVED_BY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19587710810042121519)
,p_name=>'P9_CANDIDATE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_item_source_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_prompt=>'Candidate Id'
,p_source=>'CANDIDATE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TMS_CANDIDATES.FIRST_NAME'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19587714602531121529)
,p_name=>'P9_CREATED_AT'
,p_source_data_type=>'TIMESTAMP_LTZ'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_item_source_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_prompt=>'Created At'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
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
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19587714260933121528)
,p_name=>'P9_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_item_source_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
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
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19587712578789121525)
,p_name=>'P9_EXPIRY_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_item_source_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_prompt=>'Expiry Date'
,p_source=>'EXPIRY_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19587711819477121523)
,p_name=>'P9_OFFERED_SALARY'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_item_source_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_prompt=>'Offered Salary'
,p_source=>'OFFERED_SALARY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19587710426592121510)
,p_name=>'P9_OFFER_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_item_source_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_source=>'OFFER_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715081222Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19587713384070121527)
,p_name=>'P9_OFFER_LETTER_BLOB'
,p_source_data_type=>'BLOB'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_item_source_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_prompt=>'Offer Letter Blob'
,p_source=>'OFFER_LETTER_BLOB'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'content_disposition', 'attachment',
  'display_as', 'INLINE',
  'display_download_link', 'Y',
  'storage_type', 'DB_COLUMN')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19587711465167121523)
,p_name=>'P9_REQ_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_item_source_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_prompt=>'Req Id'
,p_source=>'REQ_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TMS_JOB_REQUISITIONS.REQUESTED_BY'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19587712241558121524)
,p_name=>'P9_START_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_item_source_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_prompt=>'Start Date'
,p_source=>'START_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19587713025364121526)
,p_name=>'P9_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_item_source_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_prompt=>'Status'
,p_source=>'STATUS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19587715781978121531)
,p_name=>'P9_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP_LTZ'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_item_source_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_prompt=>'Updated At'
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
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
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19587715422536121530)
,p_name=>'P9_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_item_source_plug_id=>wwv_flow_imp.id(19587710128589121509)
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
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
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(19587715005252121530)
,p_validation_name=>'P9_CREATED_AT must be timestamp'
,p_static_id=>'p9-created-at-must-be-timestamp'
,p_validation_sequence=>100
,p_validation=>'P9_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(19587714602531121529)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(19587716209850121531)
,p_validation_name=>'P9_UPDATED_AT must be timestamp'
,p_static_id=>'p9-updated-at-must-be-timestamp'
,p_validation_sequence=>120
,p_validation=>'P9_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(19587715781978121531)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19587723931003121539)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>19543906658943475572
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19587723138409121538)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(19587710128589121509)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Form on Offers'
,p_static_id=>'initialize-form-form-on-offers'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>19543905866349475571
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19587723556154121539)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(19587710128589121509)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Form on Offers'
,p_static_id=>'process-form-form-on-offers'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>19543906284094475572
,p_created_on=>wwv_flow_imp.dz('20260715081223Z')
,p_updated_on=>wwv_flow_imp.dz('20260715081223Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_imp_page.create_page(
 p_id=>10
,p_name=>'Candidate Profile'
,p_alias=>'CANDIDATE-PROFILE'
,p_step_title=>'Candidate Profile'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
,p_created_on=>wwv_flow_imp.dz('20260714123354Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714131804Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27419384878393907)
,p_plug_name=>'Application History'
,p_static_id=>'application-history'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260714131804Z')
,p_updated_on=>wwv_flow_imp.dz('20260714131804Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(43946270550708408)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(19582723706209922178)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260714123354Z')
,p_updated_on=>wwv_flow_imp.dz('20260714123354Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27418985775393903)
,p_plug_name=>'Candidate Details'
,p_static_id=>'candidate-details'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260714131804Z')
,p_updated_on=>wwv_flow_imp.dz('20260714131804Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_imp_page.create_page(
 p_id=>11
,p_name=>'Jobs'
,p_alias=>'JOBS'
,p_step_title=>'Jobs'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260715083837Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19589231496875270987)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(19582723706209922178)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19589224814275270943)
,p_plug_name=>'Jobs'
,p_static_id=>'jobs'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'TMS_JOBS'
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
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083837Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(19589224960714270943)
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
,p_detail_link=>'f?p=&APP_ID.:12:&APP_SESSION.::&DEBUG.:RP:P12_JOB_ID:\#JOB_ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>19545407688654624976
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083837Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19589228541356270971)
,p_db_column_name=>'CREATED_AT'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Created At'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19589228118603270969)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19589227768138270968)
,p_db_column_name=>'DEPT_ID'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Dept'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(19582742933283922479)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19589226109633270962)
,p_db_column_name=>'JOB_ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Job ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19589227297375270967)
,p_db_column_name=>'MAX_SALARY'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Max Salary'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19589226891854270965)
,p_db_column_name=>'MIN_SALARY'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Min Salary'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19589226512060270964)
,p_db_column_name=>'TITLE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Title'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19589229312311270974)
,p_db_column_name=>'UPDATED_AT'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Updated At'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19589228940664270972)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19589256881843278976)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'JOB_ID:TITLE:MIN_SALARY:MAX_SALARY:DEPT_ID:CREATED_BY:CREATED_AT:UPDATED_BY:UPDATED_AT'
,p_created_on=>wwv_flow_imp.dz('20260715083837Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083837Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19589229700054270975)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19589224814275270943)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&APP_SESSION.::&DEBUG.:12::'
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(19589230123801270976)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(19589224814275270943)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19589230535315270977)
,p_event_id=>wwv_flow_imp.id(19589230123801270976)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19589224814275270943)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715083717Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083717Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00012
begin
wwv_flow_imp_page.create_page(
 p_id=>12
,p_name=>'Form on Jobs'
,p_alias=>'FORM-ON-JOBS'
,p_page_mode=>'MODAL'
,p_step_title=>'Form on Jobs'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20260715083714Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19589220107691270793)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19589212620492270757)
,p_plug_name=>'Form on Jobs'
,p_static_id=>'form-on-jobs'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'TMS_JOBS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19589220538007270794)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19589220107691270793)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(19589220996269270798)
,p_button_id=>wwv_flow_imp.id(19589220538007270794)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_stop_execution_on_error=>true
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19589222362938270803)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(19589220107691270793)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'P12_JOB_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19589221525348270801)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(19589220107691270793)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P12_JOB_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19589221969651270802)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(19589220107691270793)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P12_JOB_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19589215319519270783)
,p_name=>'P12_CREATED_AT'
,p_source_data_type=>'TIMESTAMP_LTZ'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_item_source_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_prompt=>'Created At'
,p_source=>'CREATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
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
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19589214959142270783)
,p_name=>'P12_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_item_source_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
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
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19589214476074270781)
,p_name=>'P12_DEPT_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_item_source_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_prompt=>'Dept Id'
,p_source=>'DEPT_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TMS_DEPARTMENTS.NAME'
,p_lov_display_null=>'YES'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19589212917423270760)
,p_name=>'P12_JOB_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_item_source_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_source=>'JOB_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19589214139704270780)
,p_name=>'P12_MAX_SALARY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_item_source_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_prompt=>'Max Salary'
,p_source=>'MAX_SALARY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19589213720681270775)
,p_name=>'P12_MIN_SALARY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_item_source_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_prompt=>'Min Salary'
,p_source=>'MIN_SALARY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19589213367963270774)
,p_name=>'P12_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_item_source_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_prompt=>'Title'
,p_source=>'TITLE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>150
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19589216512476270787)
,p_name=>'P12_UPDATED_AT'
,p_source_data_type=>'TIMESTAMP_LTZ'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_item_source_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_prompt=>'Updated At'
,p_source=>'UPDATED_AT'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
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
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19589216146969270786)
,p_name=>'P12_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_item_source_plug_id=>wwv_flow_imp.id(19589212620492270757)
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
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
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(19589215696700270785)
,p_validation_name=>'P12_CREATED_AT must be timestamp'
,p_static_id=>'p12-created-at-must-be-timestamp'
,p_validation_sequence=>60
,p_validation=>'P12_CREATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(19589215319519270783)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(19589216903939270787)
,p_validation_name=>'P12_UPDATED_AT must be timestamp'
,p_static_id=>'p12-updated-at-must-be-timestamp'
,p_validation_sequence=>80
,p_validation=>'P12_UPDATED_AT'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(19589216512476270787)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19589223585437270807)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>19545406313377624840
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19589222697891270805)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(19589212620492270757)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Form on Jobs'
,p_static_id=>'initialize-form-form-on-jobs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>19545405425831624838
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19589223221928270806)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(19589212620492270757)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Form on Jobs'
,p_static_id=>'process-form-form-on-jobs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>19545405949868624839
,p_created_on=>wwv_flow_imp.dz('20260715083715Z')
,p_updated_on=>wwv_flow_imp.dz('20260715083715Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_imp_page.create_page(
 p_id=>13
,p_name=>'Recruitment Metrics Overview'
,p_alias=>'RECRUITMENT-METRICS-OVERVIEW'
,p_step_title=>'Recruitment Metrics Overview'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
,p_created_on=>wwv_flow_imp.dz('20260715084656Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260715084658Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19589646642285665550)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(19582723706209922178)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_created_on=>wwv_flow_imp.dz('20260715084656Z')
,p_updated_on=>wwv_flow_imp.dz('20260715084656Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19589647515752665775)
,p_plug_name=>'Recruitment Metrics Overview'
,p_static_id=>'recruitment-metrics-overview'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2074200852440250129
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "REQ_ID",',
'       "JOB_ID",',
'       ( select l1."TITLE" from "TMS_JOBS" l1 where l1."JOB_ID" = m."JOB_ID") "JOB_ID_L$1",',
'       "DEPT_ID",',
'       ( select l2."NAME" from "TMS_DEPARTMENTS" l2 where l2."DEPT_ID" = m."DEPT_ID") "DEPT_ID_L$2",',
'       "REQUESTED_BY",',
'       "APPROVED_BY",',
'       "HEADCOUNT",',
'       "STATUS",',
'       "OPEN_DATE",',
'       "CLOSE_DATE",',
'       "CREATED_BY",',
'       "CREATED_AT",',
'       "UPDATED_BY",',
'       "UPDATED_AT"',
'from "TMS_JOB_REQUISITIONS" m'))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{ "itemName": "P13_ORDER_BY", "orderBys": [{"key":"REQUESTED_BY","expr":"\"REQUESTED_BY\" asc"},{"key":"APPROVED_BY","expr":"\"APPROVED_BY\" asc"}]}'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_created_on=>wwv_flow_imp.dz('20260715084658Z')
,p_updated_on=>wwv_flow_imp.dz('20260715084658Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(19589647845988665779)
,p_region_id=>wwv_flow_imp.id(19589647515752665775)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'REQUESTED_BY'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_body_column_name=>'APPROVED_BY'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
,p_updated_on=>wwv_flow_imp.dz('20260715084658Z')
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19589648692879665782)
,p_name=>'P13_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19589647515752665775)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'REQUESTED_BY'
,p_prompt=>'Order By'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Requested By;REQUESTED_BY,Approved By;APPROVED_BY'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715084658Z')
,p_updated_on=>wwv_flow_imp.dz('20260715084658Z')
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
,p_step_title=>'Talent Acquisition Portal - Log In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2102634289808461002
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'12'
,p_created_on=>wwv_flow_imp.dz('20260715064303Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_last_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19582732626480922325)
,p_plug_name=>'Talent Acquisition Portal'
,p_static_id=>'talent-acquisition-portal'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2675634334296186762
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19582734159243922344)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(19582732626480922325)
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
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582733429735922337)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(19582732626480922325)
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
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582733861935922342)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(19582732626480922325)
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
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19582732978333922336)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19582732626480922325)
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
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19582738250112922353)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_static_id=>'clear-page-s-cache'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>19538920978053276386
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19582737773187922352)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_static_id=>'get-username-cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>19538920501128276385
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19582734501553922345)
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
,p_internal_uid=>19538917229494276378
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(19582735537281922350)
,p_page_process_id=>wwv_flow_imp.id(19582734501553922345)
,p_page_id=>9999
,p_name=>'p_password'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_PASSWORD'
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(19582736005329922350)
,p_page_process_id=>wwv_flow_imp.id(19582734501553922345)
,p_page_id=>9999
,p_name=>'p_set_persistent_auth'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>3
,p_value_type=>'API_DEFAULT'
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(19582735024497922348)
,p_page_process_id=>wwv_flow_imp.id(19582734501553922345)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'ITEM'
,p_value=>'P9999_USERNAME'
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19582736429276922350)
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
,p_internal_uid=>19538919157217276383
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(19582737407478922352)
,p_page_process_id=>wwv_flow_imp.id(19582736429276922350)
,p_page_id=>9999
,p_name=>'p_consent'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_REMEMBER'
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(19582736915955922351)
,p_page_process_id=>wwv_flow_imp.id(19582736429276922350)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'lower( :P9999_USERNAME )'
,p_created_on=>wwv_flow_imp.dz('20260715064304Z')
,p_updated_on=>wwv_flow_imp.dz('20260715064304Z')
,p_created_by=>'ANKITA.BERI@ORACLE.COM'
,p_updated_by=>'ANKITA.BERI@ORACLE.COM'
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(44415762488135617)
,p_deinstall_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191826Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
end;
/
prompt --application/deployment/install/install_db_objects
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '  CREATE TABLE "TMS_AUDIT_LOG" '||wwv_flow.LF||
'   (	"LOG_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVA';
wwv_flow_imp.g_varchar2_table(2) := 'LUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  N';
wwv_flow_imp.g_varchar2_table(3) := 'OKEEP  NOSCALE  NOT NULL ENABLE, '||wwv_flow.LF||
'	"TABLE_NAME" VARCHAR2(128) NOT NULL ENABLE, '||wwv_flow.LF||
'	"OPERATION" VARCH';
wwv_flow_imp.g_varchar2_table(4) := 'AR2(10) NOT NULL ENABLE, '||wwv_flow.LF||
'	"OLD_VALUES" CLOB, '||wwv_flow.LF||
'	"NEW_VALUES" CLOB, '||wwv_flow.LF||
'	"CHANGED_BY" VARCHAR2(255) D';
wwv_flow_imp.g_varchar2_table(5) := 'EFAULT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"CHANGED_AT" TIMESTAMP (6) ';
wwv_flow_imp.g_varchar2_table(6) := 'WITH LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_BY" VARCHAR2(255) DEF';
wwv_flow_imp.g_varchar2_table(7) := 'AULT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_AT" TIMESTAMP (6) WI';
wwv_flow_imp.g_varchar2_table(8) := 'TH LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_BY" VARCHAR2(255) DEFAU';
wwv_flow_imp.g_varchar2_table(9) := 'LT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_AT" TIMESTAMP (6) WITH';
wwv_flow_imp.g_varchar2_table(10) := ' LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_AUDIT_LOG_OP_CK" ';
wwv_flow_imp.g_varchar2_table(11) := 'CHECK (operation IN (''INSERT'',''UPDATE'',''DELETE'')) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_AUDIT_LOG_OLD_JSON" CH';
wwv_flow_imp.g_varchar2_table(12) := 'ECK (old_values IS JSON) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_AUDIT_LOG_NEW_JSON" CHECK (new_values IS JSON) ';
wwv_flow_imp.g_varchar2_table(13) := 'ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_AUDIT_LOG_PK" PRIMARY KEY ("LOG_ID")'||wwv_flow.LF||
'  USING INDEX  ENABLE'||wwv_flow.LF||
'   ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(14) := ' CREATE TABLE "TMS_CANDIDATES" '||wwv_flow.LF||
'   (	"CANDIDATE_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY';
wwv_flow_imp.g_varchar2_table(15) := ' MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCY';
wwv_flow_imp.g_varchar2_table(16) := 'CLE  NOKEEP  NOSCALE  NOT NULL ENABLE, '||wwv_flow.LF||
'	"REQ_ID" NUMBER NOT NULL ENABLE, '||wwv_flow.LF||
'	"FIRST_NAME" VARCHAR2(';
wwv_flow_imp.g_varchar2_table(17) := '80) NOT NULL ENABLE, '||wwv_flow.LF||
'	"LAST_NAME" VARCHAR2(80) NOT NULL ENABLE, '||wwv_flow.LF||
'	"EMAIL" VARCHAR2(320) NOT NULL ';
wwv_flow_imp.g_varchar2_table(18) := 'ENABLE, '||wwv_flow.LF||
'	"PHONE" VARCHAR2(50), '||wwv_flow.LF||
'	"RESUME_BLOB" BLOB, '||wwv_flow.LF||
'	"SOURCE" VARCHAR2(100), '||wwv_flow.LF||
'	"CURRENT_STAGE';
wwv_flow_imp.g_varchar2_table(19) := '" VARCHAR2(30) DEFAULT ON NULL ''Applied'' NOT NULL ENABLE, '||wwv_flow.LF||
'	"APPLIED_DATE" DATE DEFAULT ON NULL TRU';
wwv_flow_imp.g_varchar2_table(20) := 'NC(SYSDATE) NOT NULL ENABLE, '||wwv_flow.LF||
'	"DIVERSITY_FLAG" VARCHAR2(1), '||wwv_flow.LF||
'	"AI_SCORE" NUMBER(4,2), '||wwv_flow.LF||
'	"CREATED';
wwv_flow_imp.g_varchar2_table(21) := '_BY" VARCHAR2(255) DEFAULT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATE';
wwv_flow_imp.g_varchar2_table(22) := 'D_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_B';
wwv_flow_imp.g_varchar2_table(23) := 'Y" VARCHAR2(255) DEFAULT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_';
wwv_flow_imp.g_varchar2_table(24) := 'AT" TIMESTAMP (6) WITH LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT ';
wwv_flow_imp.g_varchar2_table(25) := '"TMS_CANDIDATES_STAGE_CK" CHECK (current_stage IN (''Applied'',''Screening'',''Interview'',''Offer'',''Hired''';
wwv_flow_imp.g_varchar2_table(26) := ',''Rejected'')) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_CANDIDATES_DIVERSITY_CK" CHECK (diversity_flag IS NULL OR ';
wwv_flow_imp.g_varchar2_table(27) := 'diversity_flag IN (''Y'',''N'')) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_CANDIDATES_AI_SCORE_CK" CHECK (ai_score IS ';
wwv_flow_imp.g_varchar2_table(28) := 'NULL OR ai_score BETWEEN 0 AND 10) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_CANDIDATES_PK" PRIMARY KEY ("CANDIDAT';
wwv_flow_imp.g_varchar2_table(29) := 'E_ID")'||wwv_flow.LF||
'  USING INDEX  ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_CANDIDATES_REQ_EMAIL_UK" UNIQUE ("REQ_ID", "EMAIL';
wwv_flow_imp.g_varchar2_table(30) := '")'||wwv_flow.LF||
'  USING INDEX  ENABLE'||wwv_flow.LF||
'   ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE TABLE "TMS_EMPLOYEES" '||wwv_flow.LF||
'   (	"EMPLOYEE_ID" NUMBER GENE';
wwv_flow_imp.g_varchar2_table(31) := 'RATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1';
wwv_flow_imp.g_varchar2_table(32) := ' START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, '||wwv_flow.LF||
'	"CANDIDATE_ID" NUMBER,';
wwv_flow_imp.g_varchar2_table(33) := ' '||wwv_flow.LF||
'	"FIRST_NAME" VARCHAR2(80) NOT NULL ENABLE, '||wwv_flow.LF||
'	"LAST_NAME" VARCHAR2(80) NOT NULL ENABLE, '||wwv_flow.LF||
'	"EMAI';
wwv_flow_imp.g_varchar2_table(34) := 'L" VARCHAR2(320) NOT NULL ENABLE, '||wwv_flow.LF||
'	"JOB_ID" NUMBER, '||wwv_flow.LF||
'	"DEPT_ID" NUMBER, '||wwv_flow.LF||
'	"MANAGER_ID" NUMBER, ';
wwv_flow_imp.g_varchar2_table(35) := ''||wwv_flow.LF||
'	"SALARY" NUMBER(12,2), '||wwv_flow.LF||
'	"HIRE_DATE" DATE DEFAULT ON NULL TRUNC(SYSDATE) NOT NULL ENABLE, '||wwv_flow.LF||
'	"STA';
wwv_flow_imp.g_varchar2_table(36) := 'TUS" VARCHAR2(30) DEFAULT ON NULL ''Onboarding'' NOT NULL ENABLE, '||wwv_flow.LF||
'	"PHOTO_BLOB" BLOB, '||wwv_flow.LF||
'	"CREATED_BY';
wwv_flow_imp.g_varchar2_table(37) := '" VARCHAR2(255) DEFAULT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_A';
wwv_flow_imp.g_varchar2_table(38) := 'T" TIMESTAMP (6) WITH LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_BY" ';
wwv_flow_imp.g_varchar2_table(39) := 'VARCHAR2(255) DEFAULT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_AT"';
wwv_flow_imp.g_varchar2_table(40) := ' TIMESTAMP (6) WITH LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TM';
wwv_flow_imp.g_varchar2_table(41) := 'S_EMPLOYEES_STATUS_CK" CHECK (status IN (''Onboarding'',''Active'',''Inactive'',''Terminated'')) ENABLE, '||wwv_flow.LF||
'	';
wwv_flow_imp.g_varchar2_table(42) := ' CONSTRAINT "TMS_EMPLOYEES_SALARY_CK" CHECK (salary IS NULL OR salary >= 0) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "';
wwv_flow_imp.g_varchar2_table(43) := 'TMS_EMPLOYEES_PK" PRIMARY KEY ("EMPLOYEE_ID")'||wwv_flow.LF||
'  USING INDEX  ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_EMPLOYEES_';
wwv_flow_imp.g_varchar2_table(44) := 'CANDIDATE_UK" UNIQUE ("CANDIDATE_ID")'||wwv_flow.LF||
'  USING INDEX  ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_EMPLOYEES_EMAIL_UK';
wwv_flow_imp.g_varchar2_table(45) := '" UNIQUE ("EMAIL")'||wwv_flow.LF||
'  USING INDEX  ENABLE'||wwv_flow.LF||
'   ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE TABLE "TMS_HR_POLICY" '||wwv_flow.LF||
'   (	"POLICY_I';
wwv_flow_imp.g_varchar2_table(46) := 'D" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 ';
wwv_flow_imp.g_varchar2_table(47) := 'INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, '||wwv_flow.LF||
'	"CATEGOR';
wwv_flow_imp.g_varchar2_table(48) := 'Y" VARCHAR2(100) NOT NULL ENABLE, '||wwv_flow.LF||
'	"TITLE" VARCHAR2(200) NOT NULL ENABLE, '||wwv_flow.LF||
'	"CONTENT" CLOB NOT NU';
wwv_flow_imp.g_varchar2_table(49) := 'LL ENABLE, '||wwv_flow.LF||
'	"EMBEDDING_VECTOR" VECTOR, '||wwv_flow.LF||
'	"CREATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS_CONTEXT(''';
wwv_flow_imp.g_varchar2_table(50) := 'USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE DEFAULT';
wwv_flow_imp.g_varchar2_table(51) := ' ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS_CONTEXT(''US';
wwv_flow_imp.g_varchar2_table(52) := 'ERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE DEFAULT O';
wwv_flow_imp.g_varchar2_table(53) := 'N NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_HR_POLICY_PK" PRIMARY KEY ("POLICY_ID")'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(54) := 'USING INDEX  ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_HR_POLICY_TITLE_UK" UNIQUE ("CATEGORY", "TITLE")'||wwv_flow.LF||
'  USING I';
wwv_flow_imp.g_varchar2_table(55) := 'NDEX  ENABLE'||wwv_flow.LF||
'   ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE TABLE "TMS_INTERVIEW_STAGES" '||wwv_flow.LF||
'   (	"STAGE_ID" NUMBER GENERATED BY ';
wwv_flow_imp.g_varchar2_table(56) := 'DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WI';
wwv_flow_imp.g_varchar2_table(57) := 'TH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, '||wwv_flow.LF||
'	"CANDIDATE_ID" NUMBER NOT NULL ';
wwv_flow_imp.g_varchar2_table(58) := 'ENABLE, '||wwv_flow.LF||
'	"REQ_ID" NUMBER NOT NULL ENABLE, '||wwv_flow.LF||
'	"STAGE_NAME" VARCHAR2(60) NOT NULL ENABLE, '||wwv_flow.LF||
'	"INTERV';
wwv_flow_imp.g_varchar2_table(59) := 'IEWER_ID" NUMBER, '||wwv_flow.LF||
'	"SCHEDULED_DATE" TIMESTAMP (6) WITH LOCAL TIME ZONE, '||wwv_flow.LF||
'	"OUTCOME" VARCHAR2(30),';
wwv_flow_imp.g_varchar2_table(60) := ' '||wwv_flow.LF||
'	"FEEDBACK_NOTES" CLOB, '||wwv_flow.LF||
'	"SCORE" NUMBER(3,1), '||wwv_flow.LF||
'	"CREATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS';
wwv_flow_imp.g_varchar2_table(61) := '_CONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZO';
wwv_flow_imp.g_varchar2_table(62) := 'NE DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS_C';
wwv_flow_imp.g_varchar2_table(63) := 'ONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE';
wwv_flow_imp.g_varchar2_table(64) := ' DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_INTERVIEW_STAGE_CK" CHECK (stage_';
wwv_flow_imp.g_varchar2_table(65) := 'name IN (''Screening'',''Phone Screen'',''Technical Interview'',''Manager Interview'',''HR Interview'',''Offer ';
wwv_flow_imp.g_varchar2_table(66) := 'Review'',''Final'')) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_INTERVIEW_OUTCOME_CK" CHECK (outcome IS NULL OR outcom';
wwv_flow_imp.g_varchar2_table(67) := 'e IN (''Scheduled'',''Proceed'',''Hold'',''Rejected'',''No Show'',''Completed'',''Cancelled'')) ENABLE, '||wwv_flow.LF||
'	 CONSTR';
wwv_flow_imp.g_varchar2_table(68) := 'AINT "TMS_INTERVIEW_SCORE_CK" CHECK (score IS NULL OR score BETWEEN 0 AND 5) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT ';
wwv_flow_imp.g_varchar2_table(69) := '"TMS_INTERVIEW_STAGES_PK" PRIMARY KEY ("STAGE_ID")'||wwv_flow.LF||
'  USING INDEX  ENABLE'||wwv_flow.LF||
'   ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE TABLE ';
wwv_flow_imp.g_varchar2_table(70) := '"TMS_LEAVE_REQUESTS" '||wwv_flow.LF||
'   (	"REQUEST_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 ';
wwv_flow_imp.g_varchar2_table(71) := 'MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP ';
wwv_flow_imp.g_varchar2_table(72) := ' NOSCALE  NOT NULL ENABLE, '||wwv_flow.LF||
'	"EMPLOYEE_ID" NUMBER NOT NULL ENABLE, '||wwv_flow.LF||
'	"LEAVE_TYPE_ID" NUMBER NOT NU';
wwv_flow_imp.g_varchar2_table(73) := 'LL ENABLE, '||wwv_flow.LF||
'	"START_DATE" DATE NOT NULL ENABLE, '||wwv_flow.LF||
'	"END_DATE" DATE NOT NULL ENABLE, '||wwv_flow.LF||
'	"DAYS_REQUES';
wwv_flow_imp.g_varchar2_table(74) := 'TED" NUMBER(5,2) NOT NULL ENABLE, '||wwv_flow.LF||
'	"REASON" CLOB, '||wwv_flow.LF||
'	"STATUS" VARCHAR2(30) DEFAULT ON NULL ''Submit';
wwv_flow_imp.g_varchar2_table(75) := 'ted'' NOT NULL ENABLE, '||wwv_flow.LF||
'	"APPROVER_ID" NUMBER, '||wwv_flow.LF||
'	"CREATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS_CON';
wwv_flow_imp.g_varchar2_table(76) := 'TEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE D';
wwv_flow_imp.g_varchar2_table(77) := 'EFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS_CONTE';
wwv_flow_imp.g_varchar2_table(78) := 'XT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE DEF';
wwv_flow_imp.g_varchar2_table(79) := 'AULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_LEAVE_REQ_DATES_CK" CHECK (end_date >';
wwv_flow_imp.g_varchar2_table(80) := '= start_date) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_LEAVE_REQ_DAYS_CK" CHECK (days_requested > 0) ENABLE, '||wwv_flow.LF||
'	 ';
wwv_flow_imp.g_varchar2_table(81) := 'CONSTRAINT "TMS_LEAVE_REQ_STATUS_CK" CHECK (status IN (''Draft'',''Submitted'',''Approved'',''Rejected'',''Ca';
wwv_flow_imp.g_varchar2_table(82) := 'ncelled'')) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_LEAVE_REQUESTS_PK" PRIMARY KEY ("REQUEST_ID")'||wwv_flow.LF||
'  USING INDEX ';
wwv_flow_imp.g_varchar2_table(83) := ' ENABLE'||wwv_flow.LF||
'   ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE TABLE "TMS_OFFERS" '||wwv_flow.LF||
'   (	"OFFER_ID" NUMBER GENERATED BY DEFAULT ON NULL';
wwv_flow_imp.g_varchar2_table(84) := ' AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 N';
wwv_flow_imp.g_varchar2_table(85) := 'OORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, '||wwv_flow.LF||
'	"CANDIDATE_ID" NUMBER NOT NULL ENABLE, '||wwv_flow.LF||
'	"REQ';
wwv_flow_imp.g_varchar2_table(86) := '_ID" NUMBER NOT NULL ENABLE, '||wwv_flow.LF||
'	"OFFERED_SALARY" NUMBER(12,2) NOT NULL ENABLE, '||wwv_flow.LF||
'	"START_DATE" DATE,';
wwv_flow_imp.g_varchar2_table(87) := ' '||wwv_flow.LF||
'	"EXPIRY_DATE" DATE, '||wwv_flow.LF||
'	"STATUS" VARCHAR2(30) DEFAULT ON NULL ''Draft'' NOT NULL ENABLE, '||wwv_flow.LF||
'	"OFFER_';
wwv_flow_imp.g_varchar2_table(88) := 'LETTER_BLOB" BLOB, '||wwv_flow.LF||
'	"APPROVED_BY" VARCHAR2(255), '||wwv_flow.LF||
'	"CREATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS';
wwv_flow_imp.g_varchar2_table(89) := '_CONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZO';
wwv_flow_imp.g_varchar2_table(90) := 'NE DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS_C';
wwv_flow_imp.g_varchar2_table(91) := 'ONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE';
wwv_flow_imp.g_varchar2_table(92) := ' DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_OFFERS_SALARY_CK" CHECK (offered_';
wwv_flow_imp.g_varchar2_table(93) := 'salary > 0) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_OFFERS_STATUS_CK" CHECK (status IN (''Draft'',''Pending Approva';
wwv_flow_imp.g_varchar2_table(94) := 'l'',''Sent'',''Accepted'',''Rejected'',''Expired'',''Withdrawn'')) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_OFFERS_PK" PRIMA';
wwv_flow_imp.g_varchar2_table(95) := 'RY KEY ("OFFER_ID")'||wwv_flow.LF||
'  USING INDEX  ENABLE'||wwv_flow.LF||
'   ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE TABLE "TMS_DEPARTMENTS" '||wwv_flow.LF||
'   (	"DEPT_';
wwv_flow_imp.g_varchar2_table(96) := 'ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999';
wwv_flow_imp.g_varchar2_table(97) := ' INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, '||wwv_flow.LF||
'	"NAME" ';
wwv_flow_imp.g_varchar2_table(98) := 'VARCHAR2(100) NOT NULL ENABLE, '||wwv_flow.LF||
'	"MANAGER_ID" NUMBER, '||wwv_flow.LF||
'	"LOCATION" VARCHAR2(150), '||wwv_flow.LF||
'	"COLOR" VARCH';
wwv_flow_imp.g_varchar2_table(99) := 'AR2(30), '||wwv_flow.LF||
'	"CREATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_USER'') NOT NUL';
wwv_flow_imp.g_varchar2_table(100) := 'L ENABLE, '||wwv_flow.LF||
'	"CREATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAMP NOT NULL E';
wwv_flow_imp.g_varchar2_table(101) := 'NABLE, '||wwv_flow.LF||
'	"UPDATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ';
wwv_flow_imp.g_varchar2_table(102) := 'ENABLE, '||wwv_flow.LF||
'	"UPDATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENA';
wwv_flow_imp.g_varchar2_table(103) := 'BLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_DEPARTMENTS_PK" PRIMARY KEY ("DEPT_ID")'||wwv_flow.LF||
'  USING INDEX  ENABLE, '||wwv_flow.LF||
'	 CONSTRA';
wwv_flow_imp.g_varchar2_table(104) := 'INT "TMS_DEPARTMENTS_NAME_UK" UNIQUE ("NAME")'||wwv_flow.LF||
'  USING INDEX  ENABLE'||wwv_flow.LF||
'   ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE TABLE "TMS_';
wwv_flow_imp.g_varchar2_table(105) := 'JOBS" '||wwv_flow.LF||
'   (	"JOB_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999';
wwv_flow_imp.g_varchar2_table(106) := '999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ';
wwv_flow_imp.g_varchar2_table(107) := 'ENABLE, '||wwv_flow.LF||
'	"TITLE" VARCHAR2(150) NOT NULL ENABLE, '||wwv_flow.LF||
'	"MIN_SALARY" NUMBER(12,2), '||wwv_flow.LF||
'	"MAX_SALARY" NUMB';
wwv_flow_imp.g_varchar2_table(108) := 'ER(12,2), '||wwv_flow.LF||
'	"DEPT_ID" NUMBER NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS_CON';
wwv_flow_imp.g_varchar2_table(109) := 'TEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE D';
wwv_flow_imp.g_varchar2_table(110) := 'EFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS_CONTE';
wwv_flow_imp.g_varchar2_table(111) := 'XT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE DEF';
wwv_flow_imp.g_varchar2_table(112) := 'AULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_JOBS_SALARY_CK" CHECK ('||wwv_flow.LF||
'        min_';
wwv_flow_imp.g_varchar2_table(113) := 'salary IS NULL OR max_salary IS NULL OR min_salary <= max_salary'||wwv_flow.LF||
'      ) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TM';
wwv_flow_imp.g_varchar2_table(114) := 'S_JOBS_PK" PRIMARY KEY ("JOB_ID")'||wwv_flow.LF||
'  USING INDEX  ENABLE'||wwv_flow.LF||
'   ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE TABLE "TMS_JOB_REQUISIT';
wwv_flow_imp.g_varchar2_table(115) := 'IONS" '||wwv_flow.LF||
'   (	"REQ_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999';
wwv_flow_imp.g_varchar2_table(116) := '999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ';
wwv_flow_imp.g_varchar2_table(117) := 'ENABLE, '||wwv_flow.LF||
'	"JOB_ID" NUMBER NOT NULL ENABLE, '||wwv_flow.LF||
'	"DEPT_ID" NUMBER NOT NULL ENABLE, '||wwv_flow.LF||
'	"REQUESTED_BY" V';
wwv_flow_imp.g_varchar2_table(118) := 'ARCHAR2(255) NOT NULL ENABLE, '||wwv_flow.LF||
'	"APPROVED_BY" VARCHAR2(255), '||wwv_flow.LF||
'	"HEADCOUNT" NUMBER(4,0) DEFAULT ON ';
wwv_flow_imp.g_varchar2_table(119) := 'NULL 1 NOT NULL ENABLE, '||wwv_flow.LF||
'	"STATUS" VARCHAR2(30) DEFAULT ON NULL ''Draft'' NOT NULL ENABLE, '||wwv_flow.LF||
'	"OPEN_D';
wwv_flow_imp.g_varchar2_table(120) := 'ATE" DATE DEFAULT ON NULL TRUNC(SYSDATE) NOT NULL ENABLE, '||wwv_flow.LF||
'	"CLOSE_DATE" DATE, '||wwv_flow.LF||
'	"CREATED_BY" VARC';
wwv_flow_imp.g_varchar2_table(121) := 'HAR2(255) DEFAULT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_AT" TIM';
wwv_flow_imp.g_varchar2_table(122) := 'ESTAMP (6) WITH LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_BY" VARCHA';
wwv_flow_imp.g_varchar2_table(123) := 'R2(255) DEFAULT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_AT" TIMES';
wwv_flow_imp.g_varchar2_table(124) := 'TAMP (6) WITH LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_JOB_';
wwv_flow_imp.g_varchar2_table(125) := 'REQ_HEADCOUNT_CK" CHECK (headcount > 0) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_JOB_REQ_STATUS_CK" CHECK (status';
wwv_flow_imp.g_varchar2_table(126) := ' IN (''Draft'',''Pending Approval'',''Open'',''Filled'',''Cancelled'',''Closed'')) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_J';
wwv_flow_imp.g_varchar2_table(127) := 'OB_REQ_DATES_CK" CHECK (close_date IS NULL OR close_date >= open_date) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_J';
wwv_flow_imp.g_varchar2_table(128) := 'OB_REQUISITIONS_PK" PRIMARY KEY ("REQ_ID")'||wwv_flow.LF||
'  USING INDEX  ENABLE'||wwv_flow.LF||
'   ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE TABLE "TMS_LEA';
wwv_flow_imp.g_varchar2_table(129) := 'VE_BALANCES" '||wwv_flow.LF||
'   (	"BALANCE_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE';
wwv_flow_imp.g_varchar2_table(130) := ' 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE';
wwv_flow_imp.g_varchar2_table(131) := '  NOT NULL ENABLE, '||wwv_flow.LF||
'	"EMPLOYEE_ID" NUMBER NOT NULL ENABLE, '||wwv_flow.LF||
'	"LEAVE_TYPE_ID" NUMBER NOT NULL ENABL';
wwv_flow_imp.g_varchar2_table(132) := 'E, '||wwv_flow.LF||
'	"YEAR" NUMBER(4,0) NOT NULL ENABLE, '||wwv_flow.LF||
'	"ACCRUED" NUMBER(7,2) DEFAULT ON NULL 0 NOT NULL ENABLE';
wwv_flow_imp.g_varchar2_table(133) := ', '||wwv_flow.LF||
'	"USED" NUMBER(7,2) DEFAULT ON NULL 0 NOT NULL ENABLE, '||wwv_flow.LF||
'	"REMAINING" NUMBER(7,2) DEFAULT ON NUL';
wwv_flow_imp.g_varchar2_table(134) := 'L 0 NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_US';
wwv_flow_imp.g_varchar2_table(135) := 'ER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAM';
wwv_flow_imp.g_varchar2_table(136) := 'P NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_USER';
wwv_flow_imp.g_varchar2_table(137) := ''') NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAMP ';
wwv_flow_imp.g_varchar2_table(138) := 'NOT NULL ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_LEAVE_BAL_YEAR_CK" CHECK (year BETWEEN 1900 AND 9999) ENABLE, ';
wwv_flow_imp.g_varchar2_table(139) := ''||wwv_flow.LF||
'	 CONSTRAINT "TMS_LEAVE_BAL_AMOUNTS_CK" CHECK (accrued >= 0 AND used >= 0 AND remaining >= 0) ENABL';
wwv_flow_imp.g_varchar2_table(140) := 'E, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_LEAVE_BALANCES_PK" PRIMARY KEY ("BALANCE_ID")'||wwv_flow.LF||
'  USING INDEX  ENABLE, '||wwv_flow.LF||
'	 CON';
wwv_flow_imp.g_varchar2_table(141) := 'STRAINT "TMS_LEAVE_BAL_EMP_TYPE_YEAR_UK" UNIQUE ("EMPLOYEE_ID", "LEAVE_TYPE_ID", "YEAR")'||wwv_flow.LF||
'  USING IN';
wwv_flow_imp.g_varchar2_table(142) := 'DEX  ENABLE'||wwv_flow.LF||
'   ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE TABLE "TMS_LEAVE_TYPES" '||wwv_flow.LF||
'   (	"LEAVE_TYPE_ID" NUMBER GENERATED BY D';
wwv_flow_imp.g_varchar2_table(143) := 'EFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WIT';
wwv_flow_imp.g_varchar2_table(144) := 'H 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, '||wwv_flow.LF||
'	"NAME" VARCHAR2(100) NOT NULL EN';
wwv_flow_imp.g_varchar2_table(145) := 'ABLE, '||wwv_flow.LF||
'	"MAX_DAYS_PER_YEAR" NUMBER(5,2) DEFAULT ON NULL 0 NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_BY" VARCHAR2';
wwv_flow_imp.g_varchar2_table(146) := '(255) DEFAULT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_AT" TIMESTA';
wwv_flow_imp.g_varchar2_table(147) := 'MP (6) WITH LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_BY" VARCHAR2(2';
wwv_flow_imp.g_varchar2_table(148) := '55) DEFAULT ON NULL SYS_CONTEXT(''USERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_AT" TIMESTAMP';
wwv_flow_imp.g_varchar2_table(149) := ' (6) WITH LOCAL TIME ZONE DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_LEAVE_TY';
wwv_flow_imp.g_varchar2_table(150) := 'PES_DAYS_CK" CHECK (max_days_per_year >= 0) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_LEAVE_TYPES_PK" PRIMARY KEY ';
wwv_flow_imp.g_varchar2_table(151) := '("LEAVE_TYPE_ID")'||wwv_flow.LF||
'  USING INDEX  ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_LEAVE_TYPES_NAME_UK" UNIQUE ("NAME")'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(152) := '  USING INDEX  ENABLE'||wwv_flow.LF||
'   ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE TABLE "TMS_ONBOARDING_TASKS" '||wwv_flow.LF||
'   (	"TASK_ID" NUMBER GENER';
wwv_flow_imp.g_varchar2_table(153) := 'ATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 ';
wwv_flow_imp.g_varchar2_table(154) := 'START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, '||wwv_flow.LF||
'	"EMPLOYEE_ID" NUMBER NO';
wwv_flow_imp.g_varchar2_table(155) := 'T NULL ENABLE, '||wwv_flow.LF||
'	"TASK_NAME" VARCHAR2(200) NOT NULL ENABLE, '||wwv_flow.LF||
'	"ASSIGNED_TO" VARCHAR2(255), '||wwv_flow.LF||
'	"CAT';
wwv_flow_imp.g_varchar2_table(156) := 'EGORY" VARCHAR2(80), '||wwv_flow.LF||
'	"DUE_DATE" DATE, '||wwv_flow.LF||
'	"STATUS" VARCHAR2(30) DEFAULT ON NULL ''Not Started'' NOT ';
wwv_flow_imp.g_varchar2_table(157) := 'NULL ENABLE, '||wwv_flow.LF||
'	"COMPLETED_DATE" DATE, '||wwv_flow.LF||
'	"CREATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS_CONTEXT(''US';
wwv_flow_imp.g_varchar2_table(158) := 'ERENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"CREATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE DEFAULT O';
wwv_flow_imp.g_varchar2_table(159) := 'N NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_BY" VARCHAR2(255) DEFAULT ON NULL SYS_CONTEXT(''USER';
wwv_flow_imp.g_varchar2_table(160) := 'ENV'',''SESSION_USER'') NOT NULL ENABLE, '||wwv_flow.LF||
'	"UPDATED_AT" TIMESTAMP (6) WITH LOCAL TIME ZONE DEFAULT ON ';
wwv_flow_imp.g_varchar2_table(161) := 'NULL SYSTIMESTAMP NOT NULL ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_TASKS_STATUS_CK" CHECK (status IN (''Not Start';
wwv_flow_imp.g_varchar2_table(162) := 'ed'',''In Progress'',''Completed'',''Blocked'',''Cancelled'',''Overdue'')) ENABLE, '||wwv_flow.LF||
'	 CONSTRAINT "TMS_ONBOARDI';
wwv_flow_imp.g_varchar2_table(163) := 'NG_TASKS_PK" PRIMARY KEY ("TASK_ID")'||wwv_flow.LF||
'  USING INDEX  ENABLE'||wwv_flow.LF||
'   ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_AUDIT_LOG';
wwv_flow_imp.g_varchar2_table(164) := '_TABLE_AT_IX" ON "TMS_AUDIT_LOG" ("TABLE_NAME", "CHANGED_AT") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ALTER TABLE "TMS_CANDIDATES';
wwv_flow_imp.g_varchar2_table(165) := '" ADD CONSTRAINT "TMS_CANDIDATES_REQ_FK" FOREIGN KEY ("REQ_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_JOB_REQUISITIONS';
wwv_flow_imp.g_varchar2_table(166) := '" ("REQ_ID") ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_CANDIDATES_REQ_IX" ON "TMS_CANDIDATES" ("REQ_ID") '||wwv_flow.LF||
'  ;';
wwv_flow_imp.g_varchar2_table(167) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_CANDIDATES_STAGE_IX" ON "TMS_CANDIDATES" ("CURRENT_STAGE") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE ';
wwv_flow_imp.g_varchar2_table(168) := 'OR REPLACE EDITIONABLE TRIGGER "TMS_CANDIDATES_BIU" '||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_CANDIDATES'||wwv_flow.LF||
'FOR';
wwv_flow_imp.g_varchar2_table(169) := ' EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at :=';
wwv_flow_imp.g_varchar2_table(170) := ' SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit';
wwv_flow_imp.g_varchar2_table(171) := '_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_';
wwv_flow_imp.g_varchar2_table(172) := 'by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_CANDIDATES_BIU" ENABLE;'||wwv_flow.LF||
'  CREAT';
wwv_flow_imp.g_varchar2_table(173) := 'E OR REPLACE EDITIONABLE TRIGGER "TMS_CANDIDATES_AUD" '||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_CAND';
wwv_flow_imp.g_varchar2_table(174) := 'IDATES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THE';
wwv_flow_imp.g_varchar2_table(175) := 'N'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''CANDIDATE_ID'' VALUE :NEW.CANDIDATE_ID, ''REQ_ID'' VALUE :NEW.REQ_ID, ''FIRST';
wwv_flow_imp.g_varchar2_table(176) := '_NAME'' VALUE :NEW.FIRST_NAME, ''LAST_NAME'' VALUE :NEW.LAST_NAME, ''EMAIL'' VALUE :NEW.EMAIL, ''PHONE'' VA';
wwv_flow_imp.g_varchar2_table(177) := 'LUE :NEW.PHONE, ''RESUME_BLOB'' VALUE CASE WHEN :NEW.RESUME_BLOB IS NULL THEN NULL ELSE ''[BLOB]'' END, ';
wwv_flow_imp.g_varchar2_table(178) := '''SOURCE'' VALUE :NEW.SOURCE, ''CURRENT_STAGE'' VALUE :NEW.CURRENT_STAGE, ''APPLIED_DATE'' VALUE :NEW.APPL';
wwv_flow_imp.g_varchar2_table(179) := 'IED_DATE, ''DIVERSITY_FLAG'' VALUE :NEW.DIVERSITY_FLAG, ''AI_SCORE'' VALUE :NEW.AI_SCORE RETURNING CLOB)';
wwv_flow_imp.g_varchar2_table(180) := ' INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_CANDIDATES'', ''INSERT'', NULL, l_new_';
wwv_flow_imp.g_varchar2_table(181) := 'values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''CANDIDATE_ID'' VALUE :OLD.CANDIDATE_ID, ''REQ';
wwv_flow_imp.g_varchar2_table(182) := '_ID'' VALUE :OLD.REQ_ID, ''FIRST_NAME'' VALUE :OLD.FIRST_NAME, ''LAST_NAME'' VALUE :OLD.LAST_NAME, ''EMAIL';
wwv_flow_imp.g_varchar2_table(183) := ''' VALUE :OLD.EMAIL, ''PHONE'' VALUE :OLD.PHONE, ''RESUME_BLOB'' VALUE CASE WHEN :OLD.RESUME_BLOB IS NULL';
wwv_flow_imp.g_varchar2_table(184) := ' THEN NULL ELSE ''[BLOB]'' END, ''SOURCE'' VALUE :OLD.SOURCE, ''CURRENT_STAGE'' VALUE :OLD.CURRENT_STAGE, ';
wwv_flow_imp.g_varchar2_table(185) := '''APPLIED_DATE'' VALUE :OLD.APPLIED_DATE, ''DIVERSITY_FLAG'' VALUE :OLD.DIVERSITY_FLAG, ''AI_SCORE'' VALUE';
wwv_flow_imp.g_varchar2_table(186) := ' :OLD.AI_SCORE RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''CANDIDATE_ID'' V';
wwv_flow_imp.g_varchar2_table(187) := 'ALUE :NEW.CANDIDATE_ID, ''REQ_ID'' VALUE :NEW.REQ_ID, ''FIRST_NAME'' VALUE :NEW.FIRST_NAME, ''LAST_NAME'' ';
wwv_flow_imp.g_varchar2_table(188) := 'VALUE :NEW.LAST_NAME, ''EMAIL'' VALUE :NEW.EMAIL, ''PHONE'' VALUE :NEW.PHONE, ''RESUME_BLOB'' VALUE CASE W';
wwv_flow_imp.g_varchar2_table(189) := 'HEN :NEW.RESUME_BLOB IS NULL THEN NULL ELSE ''[BLOB]'' END, ''SOURCE'' VALUE :NEW.SOURCE, ''CURRENT_STAGE';
wwv_flow_imp.g_varchar2_table(190) := ''' VALUE :NEW.CURRENT_STAGE, ''APPLIED_DATE'' VALUE :NEW.APPLIED_DATE, ''DIVERSITY_FLAG'' VALUE :NEW.DIVE';
wwv_flow_imp.g_varchar2_table(191) := 'RSITY_FLAG, ''AI_SCORE'' VALUE :NEW.AI_SCORE RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_aud';
wwv_flow_imp.g_varchar2_table(192) := 'it_pkg.log_change(''TMS_CANDIDATES'', ''UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(193) := '   SELECT JSON_OBJECT(''CANDIDATE_ID'' VALUE :OLD.CANDIDATE_ID, ''REQ_ID'' VALUE :OLD.REQ_ID, ''FIRST_NAM';
wwv_flow_imp.g_varchar2_table(194) := 'E'' VALUE :OLD.FIRST_NAME, ''LAST_NAME'' VALUE :OLD.LAST_NAME, ''EMAIL'' VALUE :OLD.EMAIL, ''PHONE'' VALUE ';
wwv_flow_imp.g_varchar2_table(195) := ':OLD.PHONE, ''RESUME_BLOB'' VALUE CASE WHEN :OLD.RESUME_BLOB IS NULL THEN NULL ELSE ''[BLOB]'' END, ''SOU';
wwv_flow_imp.g_varchar2_table(196) := 'RCE'' VALUE :OLD.SOURCE, ''CURRENT_STAGE'' VALUE :OLD.CURRENT_STAGE, ''APPLIED_DATE'' VALUE :OLD.APPLIED_';
wwv_flow_imp.g_varchar2_table(197) := 'DATE, ''DIVERSITY_FLAG'' VALUE :OLD.DIVERSITY_FLAG, ''AI_SCORE'' VALUE :OLD.AI_SCORE RETURNING CLOB) INT';
wwv_flow_imp.g_varchar2_table(198) := 'O l_old_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_CANDIDATES'', ''DELETE'', l_old_values, NU';
wwv_flow_imp.g_varchar2_table(199) := 'LL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_CANDIDATES_AUD" ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ALTER TABLE "TMS_DEPARTMEN';
wwv_flow_imp.g_varchar2_table(200) := 'TS" ADD CONSTRAINT "TMS_DEPARTMENTS_MANAGER_FK" FOREIGN KEY ("MANAGER_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_EMPLO';
wwv_flow_imp.g_varchar2_table(201) := 'YEES" ("EMPLOYEE_ID") ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE TRIGGER "TMS_DEPARTMENTS_BIU" '||wwv_flow.LF||
'BEF';
wwv_flow_imp.g_varchar2_table(202) := 'ORE INSERT OR UPDATE ON TMS_DEPARTMENTS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.creat';
wwv_flow_imp.g_varchar2_table(203) := 'ed_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS N';
wwv_flow_imp.g_varchar2_table(204) := 'ULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.';
wwv_flow_imp.g_varchar2_table(205) := 'updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER T';
wwv_flow_imp.g_varchar2_table(206) := 'RIGGER "TMS_DEPARTMENTS_BIU" ENABLE;'||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE TRIGGER "TMS_DEPARTMENTS_AUD" ';
wwv_flow_imp.g_varchar2_table(207) := ''||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_DEPARTMENTS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(208) := '  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''DEPT_ID'' VALUE :NEW.DEPT_I';
wwv_flow_imp.g_varchar2_table(209) := 'D, ''NAME'' VALUE :NEW.NAME, ''MANAGER_ID'' VALUE :NEW.MANAGER_ID, ''LOCATION'' VALUE :NEW.LOCATION, ''COLO';
wwv_flow_imp.g_varchar2_table(210) := 'R'' VALUE :NEW.COLOR RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_';
wwv_flow_imp.g_varchar2_table(211) := 'DEPARTMENTS'', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''DEPT_ID';
wwv_flow_imp.g_varchar2_table(212) := ''' VALUE :OLD.DEPT_ID, ''NAME'' VALUE :OLD.NAME, ''MANAGER_ID'' VALUE :OLD.MANAGER_ID, ''LOCATION'' VALUE :';
wwv_flow_imp.g_varchar2_table(213) := 'OLD.LOCATION, ''COLOR'' VALUE :OLD.COLOR RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT JSON';
wwv_flow_imp.g_varchar2_table(214) := '_OBJECT(''DEPT_ID'' VALUE :NEW.DEPT_ID, ''NAME'' VALUE :NEW.NAME, ''MANAGER_ID'' VALUE :NEW.MANAGER_ID, ''L';
wwv_flow_imp.g_varchar2_table(215) := 'OCATION'' VALUE :NEW.LOCATION, ''COLOR'' VALUE :NEW.COLOR RETURNING CLOB) INTO l_new_values FROM dual;';
wwv_flow_imp.g_varchar2_table(216) := ''||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_DEPARTMENTS'', ''UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DEL';
wwv_flow_imp.g_varchar2_table(217) := 'ETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''DEPT_ID'' VALUE :OLD.DEPT_ID, ''NAME'' VALUE :OLD.NAME, ''MANAGER_ID';
wwv_flow_imp.g_varchar2_table(218) := ''' VALUE :OLD.MANAGER_ID, ''LOCATION'' VALUE :OLD.LOCATION, ''COLOR'' VALUE :OLD.COLOR RETURNING CLOB) IN';
wwv_flow_imp.g_varchar2_table(219) := 'TO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_DEPARTMENTS'', ''DELETE'', l_old_values, ';
wwv_flow_imp.g_varchar2_table(220) := 'NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_DEPARTMENTS_AUD" ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ALTER TABLE "TMS_EMPLOY';
wwv_flow_imp.g_varchar2_table(221) := 'EES" ADD CONSTRAINT "TMS_EMPLOYEES_CANDIDATE_FK" FOREIGN KEY ("CANDIDATE_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_CA';
wwv_flow_imp.g_varchar2_table(222) := 'NDIDATES" ("CANDIDATE_ID") ENABLE;'||wwv_flow.LF||
'  ALTER TABLE "TMS_EMPLOYEES" ADD CONSTRAINT "TMS_EMPLOYEES_JOB_';
wwv_flow_imp.g_varchar2_table(223) := 'FK" FOREIGN KEY ("JOB_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_JOBS" ("JOB_ID") ENABLE;'||wwv_flow.LF||
'  ALTER TABLE "TMS_EMPLOYEE';
wwv_flow_imp.g_varchar2_table(224) := 'S" ADD CONSTRAINT "TMS_EMPLOYEES_DEPT_FK" FOREIGN KEY ("DEPT_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_DEPARTMENTS" (';
wwv_flow_imp.g_varchar2_table(225) := '"DEPT_ID") ENABLE;'||wwv_flow.LF||
'  ALTER TABLE "TMS_EMPLOYEES" ADD CONSTRAINT "TMS_EMPLOYEES_MANAGER_FK" FOREIGN ';
wwv_flow_imp.g_varchar2_table(226) := 'KEY ("MANAGER_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_EMPLOYEES" ("EMPLOYEE_ID") ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_EMP';
wwv_flow_imp.g_varchar2_table(227) := 'LOYEES_MANAGER_IX" ON "TMS_EMPLOYEES" ("MANAGER_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_EMPLOYEES_DEPT_IX"';
wwv_flow_imp.g_varchar2_table(228) := ' ON "TMS_EMPLOYEES" ("DEPT_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE TRIGGER "TMS_EMPLOYEES_BIU"';
wwv_flow_imp.g_varchar2_table(229) := ' '||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_EMPLOYEES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.c';
wwv_flow_imp.g_varchar2_table(230) := 'reated_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by ';
wwv_flow_imp.g_varchar2_table(231) := 'IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :';
wwv_flow_imp.g_varchar2_table(232) := 'NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALT';
wwv_flow_imp.g_varchar2_table(233) := 'ER TRIGGER "TMS_EMPLOYEES_BIU" ENABLE;'||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE TRIGGER "TMS_EMPLOYEES_AUD" ';
wwv_flow_imp.g_varchar2_table(234) := ''||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_EMPLOYEES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(235) := 'l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''EMPLOYEE_ID'' VALUE :NEW.EMPL';
wwv_flow_imp.g_varchar2_table(236) := 'OYEE_ID, ''CANDIDATE_ID'' VALUE :NEW.CANDIDATE_ID, ''FIRST_NAME'' VALUE :NEW.FIRST_NAME, ''LAST_NAME'' VAL';
wwv_flow_imp.g_varchar2_table(237) := 'UE :NEW.LAST_NAME, ''EMAIL'' VALUE :NEW.EMAIL, ''JOB_ID'' VALUE :NEW.JOB_ID, ''DEPT_ID'' VALUE :NEW.DEPT_I';
wwv_flow_imp.g_varchar2_table(238) := 'D, ''MANAGER_ID'' VALUE :NEW.MANAGER_ID, ''SALARY'' VALUE :NEW.SALARY, ''HIRE_DATE'' VALUE :NEW.HIRE_DATE,';
wwv_flow_imp.g_varchar2_table(239) := ' ''STATUS'' VALUE :NEW.STATUS, ''PHOTO_BLOB'' VALUE CASE WHEN :NEW.PHOTO_BLOB IS NULL THEN NULL ELSE ''[B';
wwv_flow_imp.g_varchar2_table(240) := 'LOB]'' END RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_EMPLOYEES''';
wwv_flow_imp.g_varchar2_table(241) := ', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''EMPLOYEE_ID'' VALUE ';
wwv_flow_imp.g_varchar2_table(242) := ':OLD.EMPLOYEE_ID, ''CANDIDATE_ID'' VALUE :OLD.CANDIDATE_ID, ''FIRST_NAME'' VALUE :OLD.FIRST_NAME, ''LAST_';
wwv_flow_imp.g_varchar2_table(243) := 'NAME'' VALUE :OLD.LAST_NAME, ''EMAIL'' VALUE :OLD.EMAIL, ''JOB_ID'' VALUE :OLD.JOB_ID, ''DEPT_ID'' VALUE :O';
wwv_flow_imp.g_varchar2_table(244) := 'LD.DEPT_ID, ''MANAGER_ID'' VALUE :OLD.MANAGER_ID, ''SALARY'' VALUE :OLD.SALARY, ''HIRE_DATE'' VALUE :OLD.H';
wwv_flow_imp.g_varchar2_table(245) := 'IRE_DATE, ''STATUS'' VALUE :OLD.STATUS, ''PHOTO_BLOB'' VALUE CASE WHEN :OLD.PHOTO_BLOB IS NULL THEN NULL';
wwv_flow_imp.g_varchar2_table(246) := ' ELSE ''[BLOB]'' END RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''EMPLOYEE_ID';
wwv_flow_imp.g_varchar2_table(247) := ''' VALUE :NEW.EMPLOYEE_ID, ''CANDIDATE_ID'' VALUE :NEW.CANDIDATE_ID, ''FIRST_NAME'' VALUE :NEW.FIRST_NAME';
wwv_flow_imp.g_varchar2_table(248) := ', ''LAST_NAME'' VALUE :NEW.LAST_NAME, ''EMAIL'' VALUE :NEW.EMAIL, ''JOB_ID'' VALUE :NEW.JOB_ID, ''DEPT_ID'' ';
wwv_flow_imp.g_varchar2_table(249) := 'VALUE :NEW.DEPT_ID, ''MANAGER_ID'' VALUE :NEW.MANAGER_ID, ''SALARY'' VALUE :NEW.SALARY, ''HIRE_DATE'' VALU';
wwv_flow_imp.g_varchar2_table(250) := 'E :NEW.HIRE_DATE, ''STATUS'' VALUE :NEW.STATUS, ''PHOTO_BLOB'' VALUE CASE WHEN :NEW.PHOTO_BLOB IS NULL T';
wwv_flow_imp.g_varchar2_table(251) := 'HEN NULL ELSE ''[BLOB]'' END RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_chang';
wwv_flow_imp.g_varchar2_table(252) := 'e(''TMS_EMPLOYEES'', ''UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OB';
wwv_flow_imp.g_varchar2_table(253) := 'JECT(''EMPLOYEE_ID'' VALUE :OLD.EMPLOYEE_ID, ''CANDIDATE_ID'' VALUE :OLD.CANDIDATE_ID, ''FIRST_NAME'' VALU';
wwv_flow_imp.g_varchar2_table(254) := 'E :OLD.FIRST_NAME, ''LAST_NAME'' VALUE :OLD.LAST_NAME, ''EMAIL'' VALUE :OLD.EMAIL, ''JOB_ID'' VALUE :OLD.J';
wwv_flow_imp.g_varchar2_table(255) := 'OB_ID, ''DEPT_ID'' VALUE :OLD.DEPT_ID, ''MANAGER_ID'' VALUE :OLD.MANAGER_ID, ''SALARY'' VALUE :OLD.SALARY,';
wwv_flow_imp.g_varchar2_table(256) := ' ''HIRE_DATE'' VALUE :OLD.HIRE_DATE, ''STATUS'' VALUE :OLD.STATUS, ''PHOTO_BLOB'' VALUE CASE WHEN :OLD.PHO';
wwv_flow_imp.g_varchar2_table(257) := 'TO_BLOB IS NULL THEN NULL ELSE ''[BLOB]'' END RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_au';
wwv_flow_imp.g_varchar2_table(258) := 'dit_pkg.log_change(''TMS_EMPLOYEES'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGE';
wwv_flow_imp.g_varchar2_table(259) := 'R "TMS_EMPLOYEES_AUD" ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_HR_POLICY_CATEGORY_IX" ON "TMS_HR_POLICY" ("CAT';
wwv_flow_imp.g_varchar2_table(260) := 'EGORY") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE TRIGGER "TMS_HR_POLICY_BIU" '||wwv_flow.LF||
'BEFORE INSERT OR UPDA';
wwv_flow_imp.g_varchar2_table(261) := 'TE ON TMS_HR_POLICY'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(262) := '      :NEW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW';
wwv_flow_imp.g_varchar2_table(263) := '.created_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIM';
wwv_flow_imp.g_varchar2_table(264) := 'ESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_HR_POLIC';
wwv_flow_imp.g_varchar2_table(265) := 'Y_BIU" ENABLE;'||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE TRIGGER "TMS_HR_POLICY_AUD" '||wwv_flow.LF||
'AFTER INSERT OR UPDATE';
wwv_flow_imp.g_varchar2_table(266) := ' OR DELETE ON TMS_HR_POLICY'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGI';
wwv_flow_imp.g_varchar2_table(267) := 'N'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''POLICY_ID'' VALUE :NEW.POLICY_ID, ''CATEGORY'' VALUE :N';
wwv_flow_imp.g_varchar2_table(268) := 'EW.CATEGORY, ''TITLE'' VALUE :NEW.TITLE, ''CONTENT'' VALUE DBMS_LOB.SUBSTR(:NEW.CONTENT, 4000, 1) RETURN';
wwv_flow_imp.g_varchar2_table(269) := 'ING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_HR_POLICY'', ''INSERT'', NULL';
wwv_flow_imp.g_varchar2_table(270) := ', l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''POLICY_ID'' VALUE :OLD.POLICY_ID, ''C';
wwv_flow_imp.g_varchar2_table(271) := 'ATEGORY'' VALUE :OLD.CATEGORY, ''TITLE'' VALUE :OLD.TITLE, ''CONTENT'' VALUE DBMS_LOB.SUBSTR(:OLD.CONTENT';
wwv_flow_imp.g_varchar2_table(272) := ', 4000, 1) RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''POLICY_ID'' VALUE :N';
wwv_flow_imp.g_varchar2_table(273) := 'EW.POLICY_ID, ''CATEGORY'' VALUE :NEW.CATEGORY, ''TITLE'' VALUE :NEW.TITLE, ''CONTENT'' VALUE DBMS_LOB.SUB';
wwv_flow_imp.g_varchar2_table(274) := 'STR(:NEW.CONTENT, 4000, 1) RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_chang';
wwv_flow_imp.g_varchar2_table(275) := 'e(''TMS_HR_POLICY'', ''UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OB';
wwv_flow_imp.g_varchar2_table(276) := 'JECT(''POLICY_ID'' VALUE :OLD.POLICY_ID, ''CATEGORY'' VALUE :OLD.CATEGORY, ''TITLE'' VALUE :OLD.TITLE, ''CO';
wwv_flow_imp.g_varchar2_table(277) := 'NTENT'' VALUE DBMS_LOB.SUBSTR(:OLD.CONTENT, 4000, 1) RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(278) := '  tms_audit_pkg.log_change(''TMS_HR_POLICY'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTE';
wwv_flow_imp.g_varchar2_table(279) := 'R TRIGGER "TMS_HR_POLICY_AUD" ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ALTER TABLE "TMS_INTERVIEW_STAGES" ADD CONSTRAINT "TMS_IN';
wwv_flow_imp.g_varchar2_table(280) := 'TERVIEW_CANDIDATE_FK" FOREIGN KEY ("CANDIDATE_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_CANDIDATES" ("CANDIDATE_ID") ';
wwv_flow_imp.g_varchar2_table(281) := 'ENABLE;'||wwv_flow.LF||
'  ALTER TABLE "TMS_INTERVIEW_STAGES" ADD CONSTRAINT "TMS_INTERVIEW_REQ_FK" FOREIGN KEY ("RE';
wwv_flow_imp.g_varchar2_table(282) := 'Q_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_JOB_REQUISITIONS" ("REQ_ID") ENABLE;'||wwv_flow.LF||
'  ALTER TABLE "TMS_INTERVIEW_STAGES';
wwv_flow_imp.g_varchar2_table(283) := '" ADD CONSTRAINT "TMS_INTERVIEW_INTERVIEWER_FK" FOREIGN KEY ("INTERVIEWER_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_E';
wwv_flow_imp.g_varchar2_table(284) := 'MPLOYEES" ("EMPLOYEE_ID") ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_INTERVIEW_CAND_IX" ON "TMS_INTERVIEW_STAGES';
wwv_flow_imp.g_varchar2_table(285) := '" ("CANDIDATE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_INTERVIEW_SCHED_IX" ON "TMS_INTERVIEW_STAGES" ("SCHE';
wwv_flow_imp.g_varchar2_table(286) := 'DULED_DATE") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_INTERVIEW_REQ_IX" ON "TMS_INTERVIEW_STAGES" ("REQ_ID") '||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(287) := ' ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE TRIGGER "TMS_INTERVIEW_STAGES_BIU" '||wwv_flow.LF||
'BEFORE INSERT OR UPDATE O';
wwv_flow_imp.g_varchar2_table(288) := 'N TMS_INTERVIEW_STAGES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THE';
wwv_flow_imp.g_varchar2_table(289) := 'N'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :';
wwv_flow_imp.g_varchar2_table(290) := 'NEW.created_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYS';
wwv_flow_imp.g_varchar2_table(291) := 'TIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_INTER';
wwv_flow_imp.g_varchar2_table(292) := 'VIEW_STAGES_BIU" ENABLE;'||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE TRIGGER "TMS_INTERVIEW_STAGES_AUD" '||wwv_flow.LF||
'AFTER';
wwv_flow_imp.g_varchar2_table(293) := ' INSERT OR UPDATE OR DELETE ON TMS_INTERVIEW_STAGES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(294) := 'l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''STAGE_ID'' VALUE :NEW.STAGE_I';
wwv_flow_imp.g_varchar2_table(295) := 'D, ''CANDIDATE_ID'' VALUE :NEW.CANDIDATE_ID, ''REQ_ID'' VALUE :NEW.REQ_ID, ''STAGE_NAME'' VALUE :NEW.STAGE';
wwv_flow_imp.g_varchar2_table(296) := '_NAME, ''INTERVIEWER_ID'' VALUE :NEW.INTERVIEWER_ID, ''SCHEDULED_DATE'' VALUE :NEW.SCHEDULED_DATE, ''OUTC';
wwv_flow_imp.g_varchar2_table(297) := 'OME'' VALUE :NEW.OUTCOME, ''FEEDBACK_NOTES'' VALUE DBMS_LOB.SUBSTR(:NEW.FEEDBACK_NOTES, 4000, 1), ''SCOR';
wwv_flow_imp.g_varchar2_table(298) := 'E'' VALUE :NEW.SCORE RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_';
wwv_flow_imp.g_varchar2_table(299) := 'INTERVIEW_STAGES'', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''ST';
wwv_flow_imp.g_varchar2_table(300) := 'AGE_ID'' VALUE :OLD.STAGE_ID, ''CANDIDATE_ID'' VALUE :OLD.CANDIDATE_ID, ''REQ_ID'' VALUE :OLD.REQ_ID, ''ST';
wwv_flow_imp.g_varchar2_table(301) := 'AGE_NAME'' VALUE :OLD.STAGE_NAME, ''INTERVIEWER_ID'' VALUE :OLD.INTERVIEWER_ID, ''SCHEDULED_DATE'' VALUE ';
wwv_flow_imp.g_varchar2_table(302) := ':OLD.SCHEDULED_DATE, ''OUTCOME'' VALUE :OLD.OUTCOME, ''FEEDBACK_NOTES'' VALUE DBMS_LOB.SUBSTR(:OLD.FEEDB';
wwv_flow_imp.g_varchar2_table(303) := 'ACK_NOTES, 4000, 1), ''SCORE'' VALUE :OLD.SCORE RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELE';
wwv_flow_imp.g_varchar2_table(304) := 'CT JSON_OBJECT(''STAGE_ID'' VALUE :NEW.STAGE_ID, ''CANDIDATE_ID'' VALUE :NEW.CANDIDATE_ID, ''REQ_ID'' VALU';
wwv_flow_imp.g_varchar2_table(305) := 'E :NEW.REQ_ID, ''STAGE_NAME'' VALUE :NEW.STAGE_NAME, ''INTERVIEWER_ID'' VALUE :NEW.INTERVIEWER_ID, ''SCHE';
wwv_flow_imp.g_varchar2_table(306) := 'DULED_DATE'' VALUE :NEW.SCHEDULED_DATE, ''OUTCOME'' VALUE :NEW.OUTCOME, ''FEEDBACK_NOTES'' VALUE DBMS_LOB';
wwv_flow_imp.g_varchar2_table(307) := '.SUBSTR(:NEW.FEEDBACK_NOTES, 4000, 1), ''SCORE'' VALUE :NEW.SCORE RETURNING CLOB) INTO l_new_values FR';
wwv_flow_imp.g_varchar2_table(308) := 'OM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_INTERVIEW_STAGES'', ''UPDATE'', l_old_values, l_new_values)';
wwv_flow_imp.g_varchar2_table(309) := ';'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''STAGE_ID'' VALUE :OLD.STAGE_ID, ''CANDIDATE_ID'' VALU';
wwv_flow_imp.g_varchar2_table(310) := 'E :OLD.CANDIDATE_ID, ''REQ_ID'' VALUE :OLD.REQ_ID, ''STAGE_NAME'' VALUE :OLD.STAGE_NAME, ''INTERVIEWER_ID';
wwv_flow_imp.g_varchar2_table(311) := ''' VALUE :OLD.INTERVIEWER_ID, ''SCHEDULED_DATE'' VALUE :OLD.SCHEDULED_DATE, ''OUTCOME'' VALUE :OLD.OUTCOM';
wwv_flow_imp.g_varchar2_table(312) := 'E, ''FEEDBACK_NOTES'' VALUE DBMS_LOB.SUBSTR(:OLD.FEEDBACK_NOTES, 4000, 1), ''SCORE'' VALUE :OLD.SCORE RE';
wwv_flow_imp.g_varchar2_table(313) := 'TURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_INTERVIEW_STAGES'', ''DE';
wwv_flow_imp.g_varchar2_table(314) := 'LETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_INTERVIEW_STAGES_AUD" ENABLE;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(315) := ''||wwv_flow.LF||
'  ALTER TABLE "TMS_JOBS" ADD CONSTRAINT "TMS_JOBS_DEPT_FK" FOREIGN KEY ("DEPT_ID")'||wwv_flow.LF||
'	  REFERENCES "';
wwv_flow_imp.g_varchar2_table(316) := 'TMS_DEPARTMENTS" ("DEPT_ID") ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_JOBS_DEPT_IX" ON "TMS_JOBS" ("DEPT_ID") ';
wwv_flow_imp.g_varchar2_table(317) := ''||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE TRIGGER "TMS_JOBS_BIU" '||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_JOB';
wwv_flow_imp.g_varchar2_table(318) := 'S'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created';
wwv_flow_imp.g_varchar2_table(319) := '_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms';
wwv_flow_imp.g_varchar2_table(320) := '_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.up';
wwv_flow_imp.g_varchar2_table(321) := 'dated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_JOBS_BIU" ENABLE;'||wwv_flow.LF||
'  CREAT';
wwv_flow_imp.g_varchar2_table(322) := 'E OR REPLACE EDITIONABLE TRIGGER "TMS_JOBS_AUD" '||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_JOBS'||wwv_flow.LF||
'FOR ';
wwv_flow_imp.g_varchar2_table(323) := 'EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    SELEC';
wwv_flow_imp.g_varchar2_table(324) := 'T JSON_OBJECT(''JOB_ID'' VALUE :NEW.JOB_ID, ''TITLE'' VALUE :NEW.TITLE, ''MIN_SALARY'' VALUE :NEW.MIN_SALA';
wwv_flow_imp.g_varchar2_table(325) := 'RY, ''MAX_SALARY'' VALUE :NEW.MAX_SALARY, ''DEPT_ID'' VALUE :NEW.DEPT_ID RETURNING CLOB) INTO l_new_valu';
wwv_flow_imp.g_varchar2_table(326) := 'es FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_JOBS'', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDA';
wwv_flow_imp.g_varchar2_table(327) := 'TING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''JOB_ID'' VALUE :OLD.JOB_ID, ''TITLE'' VALUE :OLD.TITLE, ''MIN_SALARY''';
wwv_flow_imp.g_varchar2_table(328) := ' VALUE :OLD.MIN_SALARY, ''MAX_SALARY'' VALUE :OLD.MAX_SALARY, ''DEPT_ID'' VALUE :OLD.DEPT_ID RETURNING C';
wwv_flow_imp.g_varchar2_table(329) := 'LOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''JOB_ID'' VALUE :NEW.JOB_ID, ''TITLE'' VALUE ';
wwv_flow_imp.g_varchar2_table(330) := ':NEW.TITLE, ''MIN_SALARY'' VALUE :NEW.MIN_SALARY, ''MAX_SALARY'' VALUE :NEW.MAX_SALARY, ''DEPT_ID'' VALUE ';
wwv_flow_imp.g_varchar2_table(331) := ':NEW.DEPT_ID RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_JOBS'', ';
wwv_flow_imp.g_varchar2_table(332) := '''UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''JOB_ID'' VALUE';
wwv_flow_imp.g_varchar2_table(333) := ' :OLD.JOB_ID, ''TITLE'' VALUE :OLD.TITLE, ''MIN_SALARY'' VALUE :OLD.MIN_SALARY, ''MAX_SALARY'' VALUE :OLD.';
wwv_flow_imp.g_varchar2_table(334) := 'MAX_SALARY, ''DEPT_ID'' VALUE :OLD.DEPT_ID RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_audit';
wwv_flow_imp.g_varchar2_table(335) := '_pkg.log_change(''TMS_JOBS'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_J';
wwv_flow_imp.g_varchar2_table(336) := 'OBS_AUD" ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ALTER TABLE "TMS_JOB_REQUISITIONS" ADD CONSTRAINT "TMS_JOB_REQ_JOB_FK" FOREIGN';
wwv_flow_imp.g_varchar2_table(337) := ' KEY ("JOB_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_JOBS" ("JOB_ID") ENABLE;'||wwv_flow.LF||
'  ALTER TABLE "TMS_JOB_REQUISITIONS" A';
wwv_flow_imp.g_varchar2_table(338) := 'DD CONSTRAINT "TMS_JOB_REQ_DEPT_FK" FOREIGN KEY ("DEPT_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_DEPARTMENTS" ("DEPT_';
wwv_flow_imp.g_varchar2_table(339) := 'ID") ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_JOB_REQ_DEPT_IX" ON "TMS_JOB_REQUISITIONS" ("DEPT_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(340) := '  CREATE INDEX "TMS_JOB_REQ_STATUS_IX" ON "TMS_JOB_REQUISITIONS" ("STATUS") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX ';
wwv_flow_imp.g_varchar2_table(341) := '"TMS_JOB_REQ_JOB_IX" ON "TMS_JOB_REQUISITIONS" ("JOB_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE T';
wwv_flow_imp.g_varchar2_table(342) := 'RIGGER "TMS_JOB_REQUISITIONS_BIU" '||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_JOB_REQUISITIONS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'B';
wwv_flow_imp.g_varchar2_table(343) := 'EGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTAM';
wwv_flow_imp.g_varchar2_table(344) := 'P;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit_pkg.current';
wwv_flow_imp.g_varchar2_table(345) := '_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_au';
wwv_flow_imp.g_varchar2_table(346) := 'dit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_JOB_REQUISITIONS_BIU" ENABLE;'||wwv_flow.LF||
'  CREATE OR R';
wwv_flow_imp.g_varchar2_table(347) := 'EPLACE EDITIONABLE TRIGGER "TMS_JOB_REQUISITIONS_AUD" '||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_JOB_';
wwv_flow_imp.g_varchar2_table(348) := 'REQUISITIONS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTI';
wwv_flow_imp.g_varchar2_table(349) := 'NG THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''REQ_ID'' VALUE :NEW.REQ_ID, ''JOB_ID'' VALUE :NEW.JOB_ID, ''DEPT_ID'' VA';
wwv_flow_imp.g_varchar2_table(350) := 'LUE :NEW.DEPT_ID, ''REQUESTED_BY'' VALUE :NEW.REQUESTED_BY, ''APPROVED_BY'' VALUE :NEW.APPROVED_BY, ''HEA';
wwv_flow_imp.g_varchar2_table(351) := 'DCOUNT'' VALUE :NEW.HEADCOUNT, ''STATUS'' VALUE :NEW.STATUS, ''OPEN_DATE'' VALUE :NEW.OPEN_DATE, ''CLOSE_D';
wwv_flow_imp.g_varchar2_table(352) := 'ATE'' VALUE :NEW.CLOSE_DATE RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_chang';
wwv_flow_imp.g_varchar2_table(353) := 'e(''TMS_JOB_REQUISITIONS'', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJ';
wwv_flow_imp.g_varchar2_table(354) := 'ECT(''REQ_ID'' VALUE :OLD.REQ_ID, ''JOB_ID'' VALUE :OLD.JOB_ID, ''DEPT_ID'' VALUE :OLD.DEPT_ID, ''REQUESTED';
wwv_flow_imp.g_varchar2_table(355) := '_BY'' VALUE :OLD.REQUESTED_BY, ''APPROVED_BY'' VALUE :OLD.APPROVED_BY, ''HEADCOUNT'' VALUE :OLD.HEADCOUNT';
wwv_flow_imp.g_varchar2_table(356) := ', ''STATUS'' VALUE :OLD.STATUS, ''OPEN_DATE'' VALUE :OLD.OPEN_DATE, ''CLOSE_DATE'' VALUE :OLD.CLOSE_DATE R';
wwv_flow_imp.g_varchar2_table(357) := 'ETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''REQ_ID'' VALUE :NEW.REQ_ID, ''JOB';
wwv_flow_imp.g_varchar2_table(358) := '_ID'' VALUE :NEW.JOB_ID, ''DEPT_ID'' VALUE :NEW.DEPT_ID, ''REQUESTED_BY'' VALUE :NEW.REQUESTED_BY, ''APPRO';
wwv_flow_imp.g_varchar2_table(359) := 'VED_BY'' VALUE :NEW.APPROVED_BY, ''HEADCOUNT'' VALUE :NEW.HEADCOUNT, ''STATUS'' VALUE :NEW.STATUS, ''OPEN_';
wwv_flow_imp.g_varchar2_table(360) := 'DATE'' VALUE :NEW.OPEN_DATE, ''CLOSE_DATE'' VALUE :NEW.CLOSE_DATE RETURNING CLOB) INTO l_new_values FRO';
wwv_flow_imp.g_varchar2_table(361) := 'M dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_JOB_REQUISITIONS'', ''UPDATE'', l_old_values, l_new_values);';
wwv_flow_imp.g_varchar2_table(362) := ''||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''REQ_ID'' VALUE :OLD.REQ_ID, ''JOB_ID'' VALUE :OLD.JOB_';
wwv_flow_imp.g_varchar2_table(363) := 'ID, ''DEPT_ID'' VALUE :OLD.DEPT_ID, ''REQUESTED_BY'' VALUE :OLD.REQUESTED_BY, ''APPROVED_BY'' VALUE :OLD.A';
wwv_flow_imp.g_varchar2_table(364) := 'PPROVED_BY, ''HEADCOUNT'' VALUE :OLD.HEADCOUNT, ''STATUS'' VALUE :OLD.STATUS, ''OPEN_DATE'' VALUE :OLD.OPE';
wwv_flow_imp.g_varchar2_table(365) := 'N_DATE, ''CLOSE_DATE'' VALUE :OLD.CLOSE_DATE RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_aud';
wwv_flow_imp.g_varchar2_table(366) := 'it_pkg.log_change(''TMS_JOB_REQUISITIONS'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER ';
wwv_flow_imp.g_varchar2_table(367) := 'TRIGGER "TMS_JOB_REQUISITIONS_AUD" ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ALTER TABLE "TMS_LEAVE_BALANCES" ADD CONSTRAINT "TMS';
wwv_flow_imp.g_varchar2_table(368) := '_LEAVE_BAL_EMPLOYEE_FK" FOREIGN KEY ("EMPLOYEE_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_EMPLOYEES" ("EMPLOYEE_ID") E';
wwv_flow_imp.g_varchar2_table(369) := 'NABLE;'||wwv_flow.LF||
'  ALTER TABLE "TMS_LEAVE_BALANCES" ADD CONSTRAINT "TMS_LEAVE_BAL_TYPE_FK" FOREIGN KEY ("LEAV';
wwv_flow_imp.g_varchar2_table(370) := 'E_TYPE_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_LEAVE_TYPES" ("LEAVE_TYPE_ID") ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_LEAVE_';
wwv_flow_imp.g_varchar2_table(371) := 'BAL_EMP_IX" ON "TMS_LEAVE_BALANCES" ("EMPLOYEE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE TRIGGER';
wwv_flow_imp.g_varchar2_table(372) := ' "TMS_LEAVE_BALANCES_BIU" '||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_LEAVE_BALANCES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF';
wwv_flow_imp.g_varchar2_table(373) := ' INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    EN';
wwv_flow_imp.g_varchar2_table(374) := 'D IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit_pkg.current_user_name';
wwv_flow_imp.g_varchar2_table(375) := ';'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pkg.cu';
wwv_flow_imp.g_varchar2_table(376) := 'rrent_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_LEAVE_BALANCES_BIU" ENABLE;'||wwv_flow.LF||
'  CREATE OR REPLACE EDITI';
wwv_flow_imp.g_varchar2_table(377) := 'ONABLE TRIGGER "TMS_LEAVE_BALANCES_AUD" '||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_LEAVE_BALANCES'||wwv_flow.LF||
'FO';
wwv_flow_imp.g_varchar2_table(378) := 'R EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    SEL';
wwv_flow_imp.g_varchar2_table(379) := 'ECT JSON_OBJECT(''BALANCE_ID'' VALUE :NEW.BALANCE_ID, ''EMPLOYEE_ID'' VALUE :NEW.EMPLOYEE_ID, ''LEAVE_TYP';
wwv_flow_imp.g_varchar2_table(380) := 'E_ID'' VALUE :NEW.LEAVE_TYPE_ID, ''YEAR'' VALUE :NEW.YEAR, ''ACCRUED'' VALUE :NEW.ACCRUED, ''USED'' VALUE :';
wwv_flow_imp.g_varchar2_table(381) := 'NEW.USED, ''REMAINING'' VALUE :NEW.REMAINING RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_aud';
wwv_flow_imp.g_varchar2_table(382) := 'it_pkg.log_change(''TMS_LEAVE_BALANCES'', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    S';
wwv_flow_imp.g_varchar2_table(383) := 'ELECT JSON_OBJECT(''BALANCE_ID'' VALUE :OLD.BALANCE_ID, ''EMPLOYEE_ID'' VALUE :OLD.EMPLOYEE_ID, ''LEAVE_T';
wwv_flow_imp.g_varchar2_table(384) := 'YPE_ID'' VALUE :OLD.LEAVE_TYPE_ID, ''YEAR'' VALUE :OLD.YEAR, ''ACCRUED'' VALUE :OLD.ACCRUED, ''USED'' VALUE';
wwv_flow_imp.g_varchar2_table(385) := ' :OLD.USED, ''REMAINING'' VALUE :OLD.REMAINING RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELEC';
wwv_flow_imp.g_varchar2_table(386) := 'T JSON_OBJECT(''BALANCE_ID'' VALUE :NEW.BALANCE_ID, ''EMPLOYEE_ID'' VALUE :NEW.EMPLOYEE_ID, ''LEAVE_TYPE_';
wwv_flow_imp.g_varchar2_table(387) := 'ID'' VALUE :NEW.LEAVE_TYPE_ID, ''YEAR'' VALUE :NEW.YEAR, ''ACCRUED'' VALUE :NEW.ACCRUED, ''USED'' VALUE :NE';
wwv_flow_imp.g_varchar2_table(388) := 'W.USED, ''REMAINING'' VALUE :NEW.REMAINING RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit';
wwv_flow_imp.g_varchar2_table(389) := '_pkg.log_change(''TMS_LEAVE_BALANCES'', ''UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN';
wwv_flow_imp.g_varchar2_table(390) := ''||wwv_flow.LF||
'    SELECT JSON_OBJECT(''BALANCE_ID'' VALUE :OLD.BALANCE_ID, ''EMPLOYEE_ID'' VALUE :OLD.EMPLOYEE_ID, ''L';
wwv_flow_imp.g_varchar2_table(391) := 'EAVE_TYPE_ID'' VALUE :OLD.LEAVE_TYPE_ID, ''YEAR'' VALUE :OLD.YEAR, ''ACCRUED'' VALUE :OLD.ACCRUED, ''USED''';
wwv_flow_imp.g_varchar2_table(392) := ' VALUE :OLD.USED, ''REMAINING'' VALUE :OLD.REMAINING RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(393) := ' tms_audit_pkg.log_change(''TMS_LEAVE_BALANCES'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(394) := 'ALTER TRIGGER "TMS_LEAVE_BALANCES_AUD" ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ALTER TABLE "TMS_LEAVE_REQUESTS" ADD CONSTRAINT ';
wwv_flow_imp.g_varchar2_table(395) := '"TMS_LEAVE_REQ_EMPLOYEE_FK" FOREIGN KEY ("EMPLOYEE_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_EMPLOYEES" ("EMPLOYEE_ID';
wwv_flow_imp.g_varchar2_table(396) := '") ENABLE;'||wwv_flow.LF||
'  ALTER TABLE "TMS_LEAVE_REQUESTS" ADD CONSTRAINT "TMS_LEAVE_REQ_TYPE_FK" FOREIGN KEY ("';
wwv_flow_imp.g_varchar2_table(397) := 'LEAVE_TYPE_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_LEAVE_TYPES" ("LEAVE_TYPE_ID") ENABLE;'||wwv_flow.LF||
'  ALTER TABLE "TMS_LEAVE';
wwv_flow_imp.g_varchar2_table(398) := '_REQUESTS" ADD CONSTRAINT "TMS_LEAVE_REQ_APPROVER_FK" FOREIGN KEY ("APPROVER_ID")'||wwv_flow.LF||
'	  REFERENCES "TM';
wwv_flow_imp.g_varchar2_table(399) := 'S_EMPLOYEES" ("EMPLOYEE_ID") ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_LEAVE_REQ_STATUS_IX" ON "TMS_LEAVE_REQUE';
wwv_flow_imp.g_varchar2_table(400) := 'STS" ("STATUS") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_LEAVE_REQ_EMP_IX" ON "TMS_LEAVE_REQUESTS" ("EMPLOYEE_ID';
wwv_flow_imp.g_varchar2_table(401) := '") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_LEAVE_REQ_TYPE_IX" ON "TMS_LEAVE_REQUESTS" ("LEAVE_TYPE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(402) := ''||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE TRIGGER "TMS_LEAVE_REQUESTS_BIU" '||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_';
wwv_flow_imp.g_varchar2_table(403) := 'LEAVE_REQUESTS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(404) := ' :NEW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.crea';
wwv_flow_imp.g_varchar2_table(405) := 'ted_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAM';
wwv_flow_imp.g_varchar2_table(406) := 'P;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_LEAVE_REQUEST';
wwv_flow_imp.g_varchar2_table(407) := 'S_BIU" ENABLE;'||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE TRIGGER "TMS_LEAVE_REQUESTS_AUD" '||wwv_flow.LF||
'AFTER INSERT OR U';
wwv_flow_imp.g_varchar2_table(408) := 'PDATE OR DELETE ON TMS_LEAVE_REQUESTS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values C';
wwv_flow_imp.g_varchar2_table(409) := 'LOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''REQUEST_ID'' VALUE :NEW.REQUEST_ID, ''EMPLOY';
wwv_flow_imp.g_varchar2_table(410) := 'EE_ID'' VALUE :NEW.EMPLOYEE_ID, ''LEAVE_TYPE_ID'' VALUE :NEW.LEAVE_TYPE_ID, ''START_DATE'' VALUE :NEW.STA';
wwv_flow_imp.g_varchar2_table(411) := 'RT_DATE, ''END_DATE'' VALUE :NEW.END_DATE, ''DAYS_REQUESTED'' VALUE :NEW.DAYS_REQUESTED, ''REASON'' VALUE ';
wwv_flow_imp.g_varchar2_table(412) := 'DBMS_LOB.SUBSTR(:NEW.REASON, 4000, 1), ''STATUS'' VALUE :NEW.STATUS, ''APPROVER_ID'' VALUE :NEW.APPROVER';
wwv_flow_imp.g_varchar2_table(413) := '_ID RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_LEAVE_REQUESTS'',';
wwv_flow_imp.g_varchar2_table(414) := ' ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''REQUEST_ID'' VALUE :O';
wwv_flow_imp.g_varchar2_table(415) := 'LD.REQUEST_ID, ''EMPLOYEE_ID'' VALUE :OLD.EMPLOYEE_ID, ''LEAVE_TYPE_ID'' VALUE :OLD.LEAVE_TYPE_ID, ''STAR';
wwv_flow_imp.g_varchar2_table(416) := 'T_DATE'' VALUE :OLD.START_DATE, ''END_DATE'' VALUE :OLD.END_DATE, ''DAYS_REQUESTED'' VALUE :OLD.DAYS_REQU';
wwv_flow_imp.g_varchar2_table(417) := 'ESTED, ''REASON'' VALUE DBMS_LOB.SUBSTR(:OLD.REASON, 4000, 1), ''STATUS'' VALUE :OLD.STATUS, ''APPROVER_I';
wwv_flow_imp.g_varchar2_table(418) := 'D'' VALUE :OLD.APPROVER_ID RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''REQU';
wwv_flow_imp.g_varchar2_table(419) := 'EST_ID'' VALUE :NEW.REQUEST_ID, ''EMPLOYEE_ID'' VALUE :NEW.EMPLOYEE_ID, ''LEAVE_TYPE_ID'' VALUE :NEW.LEAV';
wwv_flow_imp.g_varchar2_table(420) := 'E_TYPE_ID, ''START_DATE'' VALUE :NEW.START_DATE, ''END_DATE'' VALUE :NEW.END_DATE, ''DAYS_REQUESTED'' VALU';
wwv_flow_imp.g_varchar2_table(421) := 'E :NEW.DAYS_REQUESTED, ''REASON'' VALUE DBMS_LOB.SUBSTR(:NEW.REASON, 4000, 1), ''STATUS'' VALUE :NEW.STA';
wwv_flow_imp.g_varchar2_table(422) := 'TUS, ''APPROVER_ID'' VALUE :NEW.APPROVER_ID RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audi';
wwv_flow_imp.g_varchar2_table(423) := 't_pkg.log_change(''TMS_LEAVE_REQUESTS'', ''UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN';
wwv_flow_imp.g_varchar2_table(424) := ''||wwv_flow.LF||
'    SELECT JSON_OBJECT(''REQUEST_ID'' VALUE :OLD.REQUEST_ID, ''EMPLOYEE_ID'' VALUE :OLD.EMPLOYEE_ID, ''';
wwv_flow_imp.g_varchar2_table(425) := 'LEAVE_TYPE_ID'' VALUE :OLD.LEAVE_TYPE_ID, ''START_DATE'' VALUE :OLD.START_DATE, ''END_DATE'' VALUE :OLD.E';
wwv_flow_imp.g_varchar2_table(426) := 'ND_DATE, ''DAYS_REQUESTED'' VALUE :OLD.DAYS_REQUESTED, ''REASON'' VALUE DBMS_LOB.SUBSTR(:OLD.REASON, 400';
wwv_flow_imp.g_varchar2_table(427) := '0, 1), ''STATUS'' VALUE :OLD.STATUS, ''APPROVER_ID'' VALUE :OLD.APPROVER_ID RETURNING CLOB) INTO l_old_v';
wwv_flow_imp.g_varchar2_table(428) := 'alues FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_LEAVE_REQUESTS'', ''DELETE'', l_old_values, NULL);';
wwv_flow_imp.g_varchar2_table(429) := ''||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_LEAVE_REQUESTS_AUD" ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONAB';
wwv_flow_imp.g_varchar2_table(430) := 'LE TRIGGER "TMS_LEAVE_TYPES_BIU" '||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_LEAVE_TYPES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(431) := '  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(432) := '  END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit_pkg.current_user_';
wwv_flow_imp.g_varchar2_table(433) := 'name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pk';
wwv_flow_imp.g_varchar2_table(434) := 'g.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_LEAVE_TYPES_BIU" ENABLE;'||wwv_flow.LF||
'  CREATE OR REPLACE EDIT';
wwv_flow_imp.g_varchar2_table(435) := 'IONABLE TRIGGER "TMS_LEAVE_TYPES_AUD" '||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_LEAVE_TYPES'||wwv_flow.LF||
'FOR EAC';
wwv_flow_imp.g_varchar2_table(436) := 'H ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    SELECT J';
wwv_flow_imp.g_varchar2_table(437) := 'SON_OBJECT(''LEAVE_TYPE_ID'' VALUE :NEW.LEAVE_TYPE_ID, ''NAME'' VALUE :NEW.NAME, ''MAX_DAYS_PER_YEAR'' VAL';
wwv_flow_imp.g_varchar2_table(438) := 'UE :NEW.MAX_DAYS_PER_YEAR RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change';
wwv_flow_imp.g_varchar2_table(439) := '(''TMS_LEAVE_TYPES'', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''L';
wwv_flow_imp.g_varchar2_table(440) := 'EAVE_TYPE_ID'' VALUE :OLD.LEAVE_TYPE_ID, ''NAME'' VALUE :OLD.NAME, ''MAX_DAYS_PER_YEAR'' VALUE :OLD.MAX_D';
wwv_flow_imp.g_varchar2_table(441) := 'AYS_PER_YEAR RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''LEAVE_TYPE_ID'' VA';
wwv_flow_imp.g_varchar2_table(442) := 'LUE :NEW.LEAVE_TYPE_ID, ''NAME'' VALUE :NEW.NAME, ''MAX_DAYS_PER_YEAR'' VALUE :NEW.MAX_DAYS_PER_YEAR RET';
wwv_flow_imp.g_varchar2_table(443) := 'URNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_LEAVE_TYPES'', ''UPDATE'',';
wwv_flow_imp.g_varchar2_table(444) := ' l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''LEAVE_TYPE_ID'' VALUE :';
wwv_flow_imp.g_varchar2_table(445) := 'OLD.LEAVE_TYPE_ID, ''NAME'' VALUE :OLD.NAME, ''MAX_DAYS_PER_YEAR'' VALUE :OLD.MAX_DAYS_PER_YEAR RETURNIN';
wwv_flow_imp.g_varchar2_table(446) := 'G CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_LEAVE_TYPES'', ''DELETE'', l_ol';
wwv_flow_imp.g_varchar2_table(447) := 'd_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_LEAVE_TYPES_AUD" ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ALTER TABLE "';
wwv_flow_imp.g_varchar2_table(448) := 'TMS_OFFERS" ADD CONSTRAINT "TMS_OFFERS_CANDIDATE_FK" FOREIGN KEY ("CANDIDATE_ID")'||wwv_flow.LF||
'	  REFERENCES "TM';
wwv_flow_imp.g_varchar2_table(449) := 'S_CANDIDATES" ("CANDIDATE_ID") ENABLE;'||wwv_flow.LF||
'  ALTER TABLE "TMS_OFFERS" ADD CONSTRAINT "TMS_OFFERS_REQ_FK';
wwv_flow_imp.g_varchar2_table(450) := '" FOREIGN KEY ("REQ_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_JOB_REQUISITIONS" ("REQ_ID") ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX ';
wwv_flow_imp.g_varchar2_table(451) := '"TMS_OFFERS_STATUS_IX" ON "TMS_OFFERS" ("STATUS") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_OFFERS_REQ_IX" ON "TM';
wwv_flow_imp.g_varchar2_table(452) := 'S_OFFERS" ("REQ_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_OFFERS_CAND_IX" ON "TMS_OFFERS" ("CANDIDATE_ID") ';
wwv_flow_imp.g_varchar2_table(453) := ''||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE TRIGGER "TMS_OFFERS_BIU" '||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_OF';
wwv_flow_imp.g_varchar2_table(454) := 'FERS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.crea';
wwv_flow_imp.g_varchar2_table(455) := 'ted_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := ';
wwv_flow_imp.g_varchar2_table(456) := 'tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW';
wwv_flow_imp.g_varchar2_table(457) := '.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_OFFERS_BIU" ENABLE;'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(458) := 'CREATE OR REPLACE EDITIONABLE TRIGGER "TMS_OFFERS_AUD" '||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_OFF';
wwv_flow_imp.g_varchar2_table(459) := 'ERS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(460) := '    SELECT JSON_OBJECT(''OFFER_ID'' VALUE :NEW.OFFER_ID, ''CANDIDATE_ID'' VALUE :NEW.CANDIDATE_ID, ''REQ_';
wwv_flow_imp.g_varchar2_table(461) := 'ID'' VALUE :NEW.REQ_ID, ''OFFERED_SALARY'' VALUE :NEW.OFFERED_SALARY, ''START_DATE'' VALUE :NEW.START_DAT';
wwv_flow_imp.g_varchar2_table(462) := 'E, ''EXPIRY_DATE'' VALUE :NEW.EXPIRY_DATE, ''STATUS'' VALUE :NEW.STATUS, ''OFFER_LETTER_BLOB'' VALUE CASE ';
wwv_flow_imp.g_varchar2_table(463) := 'WHEN :NEW.OFFER_LETTER_BLOB IS NULL THEN NULL ELSE ''[BLOB]'' END, ''APPROVED_BY'' VALUE :NEW.APPROVED_B';
wwv_flow_imp.g_varchar2_table(464) := 'Y RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_OFFERS'', ''INSERT'',';
wwv_flow_imp.g_varchar2_table(465) := ' NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''OFFER_ID'' VALUE :OLD.OFFER_ID,';
wwv_flow_imp.g_varchar2_table(466) := ' ''CANDIDATE_ID'' VALUE :OLD.CANDIDATE_ID, ''REQ_ID'' VALUE :OLD.REQ_ID, ''OFFERED_SALARY'' VALUE :OLD.OFF';
wwv_flow_imp.g_varchar2_table(467) := 'ERED_SALARY, ''START_DATE'' VALUE :OLD.START_DATE, ''EXPIRY_DATE'' VALUE :OLD.EXPIRY_DATE, ''STATUS'' VALU';
wwv_flow_imp.g_varchar2_table(468) := 'E :OLD.STATUS, ''OFFER_LETTER_BLOB'' VALUE CASE WHEN :OLD.OFFER_LETTER_BLOB IS NULL THEN NULL ELSE ''[B';
wwv_flow_imp.g_varchar2_table(469) := 'LOB]'' END, ''APPROVED_BY'' VALUE :OLD.APPROVED_BY RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SE';
wwv_flow_imp.g_varchar2_table(470) := 'LECT JSON_OBJECT(''OFFER_ID'' VALUE :NEW.OFFER_ID, ''CANDIDATE_ID'' VALUE :NEW.CANDIDATE_ID, ''REQ_ID'' VA';
wwv_flow_imp.g_varchar2_table(471) := 'LUE :NEW.REQ_ID, ''OFFERED_SALARY'' VALUE :NEW.OFFERED_SALARY, ''START_DATE'' VALUE :NEW.START_DATE, ''EX';
wwv_flow_imp.g_varchar2_table(472) := 'PIRY_DATE'' VALUE :NEW.EXPIRY_DATE, ''STATUS'' VALUE :NEW.STATUS, ''OFFER_LETTER_BLOB'' VALUE CASE WHEN :';
wwv_flow_imp.g_varchar2_table(473) := 'NEW.OFFER_LETTER_BLOB IS NULL THEN NULL ELSE ''[BLOB]'' END, ''APPROVED_BY'' VALUE :NEW.APPROVED_BY RETU';
wwv_flow_imp.g_varchar2_table(474) := 'RNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_OFFERS'', ''UPDATE'', l_old';
wwv_flow_imp.g_varchar2_table(475) := '_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''OFFER_ID'' VALUE :OLD.OFFER_I';
wwv_flow_imp.g_varchar2_table(476) := 'D, ''CANDIDATE_ID'' VALUE :OLD.CANDIDATE_ID, ''REQ_ID'' VALUE :OLD.REQ_ID, ''OFFERED_SALARY'' VALUE :OLD.O';
wwv_flow_imp.g_varchar2_table(477) := 'FFERED_SALARY, ''START_DATE'' VALUE :OLD.START_DATE, ''EXPIRY_DATE'' VALUE :OLD.EXPIRY_DATE, ''STATUS'' VA';
wwv_flow_imp.g_varchar2_table(478) := 'LUE :OLD.STATUS, ''OFFER_LETTER_BLOB'' VALUE CASE WHEN :OLD.OFFER_LETTER_BLOB IS NULL THEN NULL ELSE ''';
wwv_flow_imp.g_varchar2_table(479) := '[BLOB]'' END, ''APPROVED_BY'' VALUE :OLD.APPROVED_BY RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(480) := 'tms_audit_pkg.log_change(''TMS_OFFERS'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRI';
wwv_flow_imp.g_varchar2_table(481) := 'GGER "TMS_OFFERS_AUD" ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ALTER TABLE "TMS_ONBOARDING_TASKS" ADD CONSTRAINT "TMS_TASKS_EMPL';
wwv_flow_imp.g_varchar2_table(482) := 'OYEE_FK" FOREIGN KEY ("EMPLOYEE_ID")'||wwv_flow.LF||
'	  REFERENCES "TMS_EMPLOYEES" ("EMPLOYEE_ID") ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CRE';
wwv_flow_imp.g_varchar2_table(483) := 'ATE INDEX "TMS_TASKS_STATUS_IX" ON "TMS_ONBOARDING_TASKS" ("STATUS") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_TA';
wwv_flow_imp.g_varchar2_table(484) := 'SKS_EMPLOYEE_IX" ON "TMS_ONBOARDING_TASKS" ("EMPLOYEE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE OR REPLACE EDITIONABLE ';
wwv_flow_imp.g_varchar2_table(485) := 'TRIGGER "TMS_ONBOARDING_TASKS_BIU" '||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_ONBOARDING_TASKS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(486) := 'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTA';
wwv_flow_imp.g_varchar2_table(487) := 'MP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit_pkg.curren';
wwv_flow_imp.g_varchar2_table(488) := 't_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_a';
wwv_flow_imp.g_varchar2_table(489) := 'udit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_ONBOARDING_TASKS_BIU" ENABLE;'||wwv_flow.LF||
'  CREATE OR ';
wwv_flow_imp.g_varchar2_table(490) := 'REPLACE EDITIONABLE TRIGGER "TMS_ONBOARDING_TASKS_AUD" '||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_ONB';
wwv_flow_imp.g_varchar2_table(491) := 'OARDING_TASKS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERT';
wwv_flow_imp.g_varchar2_table(492) := 'ING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''TASK_ID'' VALUE :NEW.TASK_ID, ''EMPLOYEE_ID'' VALUE :NEW.EMPLOYEE_ID,';
wwv_flow_imp.g_varchar2_table(493) := ' ''TASK_NAME'' VALUE :NEW.TASK_NAME, ''ASSIGNED_TO'' VALUE :NEW.ASSIGNED_TO, ''CATEGORY'' VALUE :NEW.CATEG';
wwv_flow_imp.g_varchar2_table(494) := 'ORY, ''DUE_DATE'' VALUE :NEW.DUE_DATE, ''STATUS'' VALUE :NEW.STATUS, ''COMPLETED_DATE'' VALUE :NEW.COMPLET';
wwv_flow_imp.g_varchar2_table(495) := 'ED_DATE RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_ONBOARDING_T';
wwv_flow_imp.g_varchar2_table(496) := 'ASKS'', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''TASK_ID'' VALUE';
wwv_flow_imp.g_varchar2_table(497) := ' :OLD.TASK_ID, ''EMPLOYEE_ID'' VALUE :OLD.EMPLOYEE_ID, ''TASK_NAME'' VALUE :OLD.TASK_NAME, ''ASSIGNED_TO''';
wwv_flow_imp.g_varchar2_table(498) := ' VALUE :OLD.ASSIGNED_TO, ''CATEGORY'' VALUE :OLD.CATEGORY, ''DUE_DATE'' VALUE :OLD.DUE_DATE, ''STATUS'' VA';
wwv_flow_imp.g_varchar2_table(499) := 'LUE :OLD.STATUS, ''COMPLETED_DATE'' VALUE :OLD.COMPLETED_DATE RETURNING CLOB) INTO l_old_values FROM d';
wwv_flow_imp.g_varchar2_table(500) := 'ual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''TASK_ID'' VALUE :NEW.TASK_ID, ''EMPLOYEE_ID'' VALUE :NEW.EMPLOYEE_ID, ''TA';
wwv_flow_imp.g_varchar2_table(501) := 'SK_NAME'' VALUE :NEW.TASK_NAME, ''ASSIGNED_TO'' VALUE :NEW.ASSIGNED_TO, ''CATEGORY'' VALUE :NEW.CATEGORY,';
wwv_flow_imp.g_varchar2_table(502) := ' ''DUE_DATE'' VALUE :NEW.DUE_DATE, ''STATUS'' VALUE :NEW.STATUS, ''COMPLETED_DATE'' VALUE :NEW.COMPLETED_D';
wwv_flow_imp.g_varchar2_table(503) := 'ATE RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_ONBOARDING_TASKS';
wwv_flow_imp.g_varchar2_table(504) := ''', ''UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''TASK_ID'' V';
wwv_flow_imp.g_varchar2_table(505) := 'ALUE :OLD.TASK_ID, ''EMPLOYEE_ID'' VALUE :OLD.EMPLOYEE_ID, ''TASK_NAME'' VALUE :OLD.TASK_NAME, ''ASSIGNED';
wwv_flow_imp.g_varchar2_table(506) := '_TO'' VALUE :OLD.ASSIGNED_TO, ''CATEGORY'' VALUE :OLD.CATEGORY, ''DUE_DATE'' VALUE :OLD.DUE_DATE, ''STATUS';
wwv_flow_imp.g_varchar2_table(507) := ''' VALUE :OLD.STATUS, ''COMPLETED_DATE'' VALUE :OLD.COMPLETED_DATE RETURNING CLOB) INTO l_old_values FR';
wwv_flow_imp.g_varchar2_table(508) := 'OM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_ONBOARDING_TASKS'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END';
wwv_flow_imp.g_varchar2_table(509) := ' IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'ALTER TRIGGER "TMS_ONBOARDING_TASKS_AUD" ENABLE;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_OFFERS_STATUS';
wwv_flow_imp.g_varchar2_table(510) := '_IX" ON "TMS_OFFERS" ("STATUS") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_INTERVIEW_CAND_IX" ON "TMS_INTERVIEW_ST';
wwv_flow_imp.g_varchar2_table(511) := 'AGES" ("CANDIDATE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_TASKS_STATUS_IX" ON "TMS_ONBOARDING_TASKS" ("STA';
wwv_flow_imp.g_varchar2_table(512) := 'TUS") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE UNIQUE INDEX "TMS_EMPLOYEES_PK" ON "TMS_EMPLOYEES" ("EMPLOYEE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(513) := '  CREATE INDEX "TMS_INTERVIEW_SCHED_IX" ON "TMS_INTERVIEW_STAGES" ("SCHEDULED_DATE") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREA';
wwv_flow_imp.g_varchar2_table(514) := 'TE UNIQUE INDEX "TMS_INTERVIEW_STAGES_PK" ON "TMS_INTERVIEW_STAGES" ("STAGE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE U';
wwv_flow_imp.g_varchar2_table(515) := 'NIQUE INDEX "TMS_JOB_REQUISITIONS_PK" ON "TMS_JOB_REQUISITIONS" ("REQ_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "';
wwv_flow_imp.g_varchar2_table(516) := 'TMS_OFFERS_REQ_IX" ON "TMS_OFFERS" ("REQ_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_CANDIDATES_REQ_IX" ON "TM';
wwv_flow_imp.g_varchar2_table(517) := 'S_CANDIDATES" ("REQ_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_CANDIDATES_STAGE_IX" ON "TMS_CANDIDATES" ("CUR';
wwv_flow_imp.g_varchar2_table(518) := 'RENT_STAGE") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE UNIQUE INDEX "TMS_OFFERS_PK" ON "TMS_OFFERS" ("OFFER_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(519) := 'CREATE UNIQUE INDEX "TMS_LEAVE_BALANCES_PK" ON "TMS_LEAVE_BALANCES" ("BALANCE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE';
wwv_flow_imp.g_varchar2_table(520) := ' UNIQUE INDEX "TMS_EMPLOYEES_EMAIL_UK" ON "TMS_EMPLOYEES" ("EMAIL") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE UNIQUE INDEX "';
wwv_flow_imp.g_varchar2_table(521) := 'TMS_JOBS_PK" ON "TMS_JOBS" ("JOB_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_OFFERS_CAND_IX" ON "TMS_OFFERS" (';
wwv_flow_imp.g_varchar2_table(522) := '"CANDIDATE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE UNIQUE INDEX "TMS_CANDIDATES_REQ_EMAIL_UK" ON "TMS_CANDIDATES" ("R';
wwv_flow_imp.g_varchar2_table(523) := 'EQ_ID", "EMAIL") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_LEAVE_REQ_STATUS_IX" ON "TMS_LEAVE_REQUESTS" ("STATUS"';
wwv_flow_imp.g_varchar2_table(524) := ') '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_HR_POLICY_CATEGORY_IX" ON "TMS_HR_POLICY" ("CATEGORY") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CRE';
wwv_flow_imp.g_varchar2_table(525) := 'ATE INDEX "TMS_JOBS_DEPT_IX" ON "TMS_JOBS" ("DEPT_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_JOB_REQ_DEPT_IX"';
wwv_flow_imp.g_varchar2_table(526) := ' ON "TMS_JOB_REQUISITIONS" ("DEPT_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_LEAVE_REQ_EMP_IX" ON "TMS_LEAVE_';
wwv_flow_imp.g_varchar2_table(527) := 'REQUESTS" ("EMPLOYEE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE UNIQUE INDEX "TMS_LEAVE_TYPES_NAME_UK" ON "TMS_LEAVE_TYP';
wwv_flow_imp.g_varchar2_table(528) := 'ES" ("NAME") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE UNIQUE INDEX "TMS_HR_POLICY_TITLE_UK" ON "TMS_HR_POLICY" ("CATEGORY",';
wwv_flow_imp.g_varchar2_table(529) := ' "TITLE") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE UNIQUE INDEX "TMS_LEAVE_REQUESTS_PK" ON "TMS_LEAVE_REQUESTS" ("REQUEST_I';
wwv_flow_imp.g_varchar2_table(530) := 'D") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE UNIQUE INDEX "TMS_CANDIDATES_PK" ON "TMS_CANDIDATES" ("CANDIDATE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(531) := ''||wwv_flow.LF||
'  CREATE UNIQUE INDEX "TMS_DEPARTMENTS_NAME_UK" ON "TMS_DEPARTMENTS" ("NAME") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE UNI';
wwv_flow_imp.g_varchar2_table(532) := 'QUE INDEX "TMS_EMPLOYEES_CANDIDATE_UK" ON "TMS_EMPLOYEES" ("CANDIDATE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "';
wwv_flow_imp.g_varchar2_table(533) := 'TMS_LEAVE_BAL_EMP_IX" ON "TMS_LEAVE_BALANCES" ("EMPLOYEE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE UNIQUE INDEX "TMS_LE';
wwv_flow_imp.g_varchar2_table(534) := 'AVE_BAL_EMP_TYPE_YEAR_UK" ON "TMS_LEAVE_BALANCES" ("EMPLOYEE_ID", "LEAVE_TYPE_ID", "YEAR") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(535) := '  CREATE UNIQUE INDEX "TMS_LEAVE_TYPES_PK" ON "TMS_LEAVE_TYPES" ("LEAVE_TYPE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE ';
wwv_flow_imp.g_varchar2_table(536) := 'UNIQUE INDEX "TMS_DEPARTMENTS_PK" ON "TMS_DEPARTMENTS" ("DEPT_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_JOB_';
wwv_flow_imp.g_varchar2_table(537) := 'REQ_STATUS_IX" ON "TMS_JOB_REQUISITIONS" ("STATUS") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_LEAVE_REQ_TYPE_IX" ';
wwv_flow_imp.g_varchar2_table(538) := 'ON "TMS_LEAVE_REQUESTS" ("LEAVE_TYPE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE UNIQUE INDEX "TMS_AUDIT_LOG_PK" ON "TMS_';
wwv_flow_imp.g_varchar2_table(539) := 'AUDIT_LOG" ("LOG_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_EMPLOYEES_MANAGER_IX" ON "TMS_EMPLOYEES" ("MANAGE';
wwv_flow_imp.g_varchar2_table(540) := 'R_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE UNIQUE INDEX "TMS_HR_POLICY_PK" ON "TMS_HR_POLICY" ("POLICY_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(541) := ' CREATE INDEX "TMS_JOB_REQ_JOB_IX" ON "TMS_JOB_REQUISITIONS" ("JOB_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS';
wwv_flow_imp.g_varchar2_table(542) := '_TASKS_EMPLOYEE_IX" ON "TMS_ONBOARDING_TASKS" ("EMPLOYEE_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_AUDIT_LOG';
wwv_flow_imp.g_varchar2_table(543) := '_TABLE_AT_IX" ON "TMS_AUDIT_LOG" ("TABLE_NAME", "CHANGED_AT") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_EMPLOYEES';
wwv_flow_imp.g_varchar2_table(544) := '_DEPT_IX" ON "TMS_EMPLOYEES" ("DEPT_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE INDEX "TMS_INTERVIEW_REQ_IX" ON "TMS_INTE';
wwv_flow_imp.g_varchar2_table(545) := 'RVIEW_STAGES" ("REQ_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  CREATE UNIQUE INDEX "TMS_ONBOARDING_TASKS_PK" ON "TMS_ONBOARDING';
wwv_flow_imp.g_varchar2_table(546) := '_TASKS" ("TASK_ID") '||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(547) := ''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'create or replace PACKAGE tms_audit_pkg AS'||wwv_flow.LF||
'  FUNCTION current_user_name RETURN VARCHAR2;';
wwv_flow_imp.g_varchar2_table(548) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'  PROCEDURE log_change('||wwv_flow.LF||
'    p_table_name IN VARCHAR2,'||wwv_flow.LF||
'    p_operation  IN VARCHAR2,'||wwv_flow.LF||
'    p_old';
wwv_flow_imp.g_varchar2_table(549) := '_values IN CLOB,'||wwv_flow.LF||
'    p_new_values IN CLOB'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'END tms_audit_pkg;'||wwv_flow.LF||
'/'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(550) := ''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(551) := ''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'create or replace TRIGGER TMS_CANDIDATE';
wwv_flow_imp.g_varchar2_table(552) := 'S_AUD'||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_CANDIDATES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLO';
wwv_flow_imp.g_varchar2_table(553) := 'B;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''CANDIDATE_ID'' VALUE :N';
wwv_flow_imp.g_varchar2_table(554) := 'EW.CANDIDATE_ID, ''REQ_ID'' VALUE :NEW.REQ_ID, ''FIRST_NAME'' VALUE :NEW.FIRST_NAME, ''LAST_NAME'' VALUE :';
wwv_flow_imp.g_varchar2_table(555) := 'NEW.LAST_NAME, ''EMAIL'' VALUE :NEW.EMAIL, ''PHONE'' VALUE :NEW.PHONE, ''RESUME_BLOB'' VALUE CASE WHEN :NE';
wwv_flow_imp.g_varchar2_table(556) := 'W.RESUME_BLOB IS NULL THEN NULL ELSE ''[BLOB]'' END, ''SOURCE'' VALUE :NEW.SOURCE, ''CURRENT_STAGE'' VALUE';
wwv_flow_imp.g_varchar2_table(557) := ' :NEW.CURRENT_STAGE, ''APPLIED_DATE'' VALUE :NEW.APPLIED_DATE, ''DIVERSITY_FLAG'' VALUE :NEW.DIVERSITY_F';
wwv_flow_imp.g_varchar2_table(558) := 'LAG, ''AI_SCORE'' VALUE :NEW.AI_SCORE RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.';
wwv_flow_imp.g_varchar2_table(559) := 'log_change(''TMS_CANDIDATES'', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_';
wwv_flow_imp.g_varchar2_table(560) := 'OBJECT(''CANDIDATE_ID'' VALUE :OLD.CANDIDATE_ID, ''REQ_ID'' VALUE :OLD.REQ_ID, ''FIRST_NAME'' VALUE :OLD.F';
wwv_flow_imp.g_varchar2_table(561) := 'IRST_NAME, ''LAST_NAME'' VALUE :OLD.LAST_NAME, ''EMAIL'' VALUE :OLD.EMAIL, ''PHONE'' VALUE :OLD.PHONE, ''RE';
wwv_flow_imp.g_varchar2_table(562) := 'SUME_BLOB'' VALUE CASE WHEN :OLD.RESUME_BLOB IS NULL THEN NULL ELSE ''[BLOB]'' END, ''SOURCE'' VALUE :OLD';
wwv_flow_imp.g_varchar2_table(563) := '.SOURCE, ''CURRENT_STAGE'' VALUE :OLD.CURRENT_STAGE, ''APPLIED_DATE'' VALUE :OLD.APPLIED_DATE, ''DIVERSIT';
wwv_flow_imp.g_varchar2_table(564) := 'Y_FLAG'' VALUE :OLD.DIVERSITY_FLAG, ''AI_SCORE'' VALUE :OLD.AI_SCORE RETURNING CLOB) INTO l_old_values ';
wwv_flow_imp.g_varchar2_table(565) := 'FROM dual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''CANDIDATE_ID'' VALUE :NEW.CANDIDATE_ID, ''REQ_ID'' VALUE :NEW.REQ_I';
wwv_flow_imp.g_varchar2_table(566) := 'D, ''FIRST_NAME'' VALUE :NEW.FIRST_NAME, ''LAST_NAME'' VALUE :NEW.LAST_NAME, ''EMAIL'' VALUE :NEW.EMAIL, ''';
wwv_flow_imp.g_varchar2_table(567) := 'PHONE'' VALUE :NEW.PHONE, ''RESUME_BLOB'' VALUE CASE WHEN :NEW.RESUME_BLOB IS NULL THEN NULL ELSE ''[BLO';
wwv_flow_imp.g_varchar2_table(568) := 'B]'' END, ''SOURCE'' VALUE :NEW.SOURCE, ''CURRENT_STAGE'' VALUE :NEW.CURRENT_STAGE, ''APPLIED_DATE'' VALUE ';
wwv_flow_imp.g_varchar2_table(569) := ':NEW.APPLIED_DATE, ''DIVERSITY_FLAG'' VALUE :NEW.DIVERSITY_FLAG, ''AI_SCORE'' VALUE :NEW.AI_SCORE RETURN';
wwv_flow_imp.g_varchar2_table(570) := 'ING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_CANDIDATES'', ''UPDATE'', l_o';
wwv_flow_imp.g_varchar2_table(571) := 'ld_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''CANDIDATE_ID'' VALUE :OLD.C';
wwv_flow_imp.g_varchar2_table(572) := 'ANDIDATE_ID, ''REQ_ID'' VALUE :OLD.REQ_ID, ''FIRST_NAME'' VALUE :OLD.FIRST_NAME, ''LAST_NAME'' VALUE :OLD.';
wwv_flow_imp.g_varchar2_table(573) := 'LAST_NAME, ''EMAIL'' VALUE :OLD.EMAIL, ''PHONE'' VALUE :OLD.PHONE, ''RESUME_BLOB'' VALUE CASE WHEN :OLD.RE';
wwv_flow_imp.g_varchar2_table(574) := 'SUME_BLOB IS NULL THEN NULL ELSE ''[BLOB]'' END, ''SOURCE'' VALUE :OLD.SOURCE, ''CURRENT_STAGE'' VALUE :OL';
wwv_flow_imp.g_varchar2_table(575) := 'D.CURRENT_STAGE, ''APPLIED_DATE'' VALUE :OLD.APPLIED_DATE, ''DIVERSITY_FLAG'' VALUE :OLD.DIVERSITY_FLAG,';
wwv_flow_imp.g_varchar2_table(576) := ' ''AI_SCORE'' VALUE :OLD.AI_SCORE RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_';
wwv_flow_imp.g_varchar2_table(577) := 'change(''TMS_CANDIDATES'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGG';
wwv_flow_imp.g_varchar2_table(578) := 'ER TMS_CANDIDATES_BIU'||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_CANDIDATES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTIN';
wwv_flow_imp.g_varchar2_table(579) := 'G THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(580) := '  IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    EN';
wwv_flow_imp.g_varchar2_table(581) := 'D IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pkg.current_use';
wwv_flow_imp.g_varchar2_table(582) := 'r_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_DEPARTMENTS_AUD'||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON';
wwv_flow_imp.g_varchar2_table(583) := ' TMS_DEPARTMENTS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INS';
wwv_flow_imp.g_varchar2_table(584) := 'ERTING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''DEPT_ID'' VALUE :NEW.DEPT_ID, ''NAME'' VALUE :NEW.NAME, ''MANAGER_I';
wwv_flow_imp.g_varchar2_table(585) := 'D'' VALUE :NEW.MANAGER_ID, ''LOCATION'' VALUE :NEW.LOCATION, ''COLOR'' VALUE :NEW.COLOR RETURNING CLOB) I';
wwv_flow_imp.g_varchar2_table(586) := 'NTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_DEPARTMENTS'', ''INSERT'', NULL, l_new_v';
wwv_flow_imp.g_varchar2_table(587) := 'alues);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''DEPT_ID'' VALUE :OLD.DEPT_ID, ''NAME'' VALUE :O';
wwv_flow_imp.g_varchar2_table(588) := 'LD.NAME, ''MANAGER_ID'' VALUE :OLD.MANAGER_ID, ''LOCATION'' VALUE :OLD.LOCATION, ''COLOR'' VALUE :OLD.COLO';
wwv_flow_imp.g_varchar2_table(589) := 'R RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''DEPT_ID'' VALUE :NEW.DEPT_ID,';
wwv_flow_imp.g_varchar2_table(590) := ' ''NAME'' VALUE :NEW.NAME, ''MANAGER_ID'' VALUE :NEW.MANAGER_ID, ''LOCATION'' VALUE :NEW.LOCATION, ''COLOR''';
wwv_flow_imp.g_varchar2_table(591) := ' VALUE :NEW.COLOR RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_DE';
wwv_flow_imp.g_varchar2_table(592) := 'PARTMENTS'', ''UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''D';
wwv_flow_imp.g_varchar2_table(593) := 'EPT_ID'' VALUE :OLD.DEPT_ID, ''NAME'' VALUE :OLD.NAME, ''MANAGER_ID'' VALUE :OLD.MANAGER_ID, ''LOCATION'' V';
wwv_flow_imp.g_varchar2_table(594) := 'ALUE :OLD.LOCATION, ''COLOR'' VALUE :OLD.COLOR RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_a';
wwv_flow_imp.g_varchar2_table(595) := 'udit_pkg.log_change(''TMS_DEPARTMENTS'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or';
wwv_flow_imp.g_varchar2_table(596) := ' replace TRIGGER TMS_DEPARTMENTS_BIU'||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_DEPARTMENTS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGI';
wwv_flow_imp.g_varchar2_table(597) := 'N'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTAMP;';
wwv_flow_imp.g_varchar2_table(598) := ''||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit_pkg.current_us';
wwv_flow_imp.g_varchar2_table(599) := 'er_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit';
wwv_flow_imp.g_varchar2_table(600) := '_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_EMPLOYEES_AUD'||wwv_flow.LF||
'AFTER INSERT OR UPDAT';
wwv_flow_imp.g_varchar2_table(601) := 'E OR DELETE ON TMS_EMPLOYEES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEG';
wwv_flow_imp.g_varchar2_table(602) := 'IN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''EMPLOYEE_ID'' VALUE :NEW.EMPLOYEE_ID, ''CANDIDATE_ID''';
wwv_flow_imp.g_varchar2_table(603) := ' VALUE :NEW.CANDIDATE_ID, ''FIRST_NAME'' VALUE :NEW.FIRST_NAME, ''LAST_NAME'' VALUE :NEW.LAST_NAME, ''EMA';
wwv_flow_imp.g_varchar2_table(604) := 'IL'' VALUE :NEW.EMAIL, ''JOB_ID'' VALUE :NEW.JOB_ID, ''DEPT_ID'' VALUE :NEW.DEPT_ID, ''MANAGER_ID'' VALUE :';
wwv_flow_imp.g_varchar2_table(605) := 'NEW.MANAGER_ID, ''SALARY'' VALUE :NEW.SALARY, ''HIRE_DATE'' VALUE :NEW.HIRE_DATE, ''STATUS'' VALUE :NEW.ST';
wwv_flow_imp.g_varchar2_table(606) := 'ATUS, ''PHOTO_BLOB'' VALUE CASE WHEN :NEW.PHOTO_BLOB IS NULL THEN NULL ELSE ''[BLOB]'' END RETURNING CLO';
wwv_flow_imp.g_varchar2_table(607) := 'B) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_EMPLOYEES'', ''INSERT'', NULL, l_new';
wwv_flow_imp.g_varchar2_table(608) := '_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''EMPLOYEE_ID'' VALUE :OLD.EMPLOYEE_ID, ''CAND';
wwv_flow_imp.g_varchar2_table(609) := 'IDATE_ID'' VALUE :OLD.CANDIDATE_ID, ''FIRST_NAME'' VALUE :OLD.FIRST_NAME, ''LAST_NAME'' VALUE :OLD.LAST_N';
wwv_flow_imp.g_varchar2_table(610) := 'AME, ''EMAIL'' VALUE :OLD.EMAIL, ''JOB_ID'' VALUE :OLD.JOB_ID, ''DEPT_ID'' VALUE :OLD.DEPT_ID, ''MANAGER_ID';
wwv_flow_imp.g_varchar2_table(611) := ''' VALUE :OLD.MANAGER_ID, ''SALARY'' VALUE :OLD.SALARY, ''HIRE_DATE'' VALUE :OLD.HIRE_DATE, ''STATUS'' VALU';
wwv_flow_imp.g_varchar2_table(612) := 'E :OLD.STATUS, ''PHOTO_BLOB'' VALUE CASE WHEN :OLD.PHOTO_BLOB IS NULL THEN NULL ELSE ''[BLOB]'' END RETU';
wwv_flow_imp.g_varchar2_table(613) := 'RNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''EMPLOYEE_ID'' VALUE :NEW.EMPLOYEE_I';
wwv_flow_imp.g_varchar2_table(614) := 'D, ''CANDIDATE_ID'' VALUE :NEW.CANDIDATE_ID, ''FIRST_NAME'' VALUE :NEW.FIRST_NAME, ''LAST_NAME'' VALUE :NE';
wwv_flow_imp.g_varchar2_table(615) := 'W.LAST_NAME, ''EMAIL'' VALUE :NEW.EMAIL, ''JOB_ID'' VALUE :NEW.JOB_ID, ''DEPT_ID'' VALUE :NEW.DEPT_ID, ''MA';
wwv_flow_imp.g_varchar2_table(616) := 'NAGER_ID'' VALUE :NEW.MANAGER_ID, ''SALARY'' VALUE :NEW.SALARY, ''HIRE_DATE'' VALUE :NEW.HIRE_DATE, ''STAT';
wwv_flow_imp.g_varchar2_table(617) := 'US'' VALUE :NEW.STATUS, ''PHOTO_BLOB'' VALUE CASE WHEN :NEW.PHOTO_BLOB IS NULL THEN NULL ELSE ''[BLOB]'' ';
wwv_flow_imp.g_varchar2_table(618) := 'END RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_EMPLOYEES'', ''UPD';
wwv_flow_imp.g_varchar2_table(619) := 'ATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''EMPLOYEE_ID'' VALU';
wwv_flow_imp.g_varchar2_table(620) := 'E :OLD.EMPLOYEE_ID, ''CANDIDATE_ID'' VALUE :OLD.CANDIDATE_ID, ''FIRST_NAME'' VALUE :OLD.FIRST_NAME, ''LAS';
wwv_flow_imp.g_varchar2_table(621) := 'T_NAME'' VALUE :OLD.LAST_NAME, ''EMAIL'' VALUE :OLD.EMAIL, ''JOB_ID'' VALUE :OLD.JOB_ID, ''DEPT_ID'' VALUE ';
wwv_flow_imp.g_varchar2_table(622) := ':OLD.DEPT_ID, ''MANAGER_ID'' VALUE :OLD.MANAGER_ID, ''SALARY'' VALUE :OLD.SALARY, ''HIRE_DATE'' VALUE :OLD';
wwv_flow_imp.g_varchar2_table(623) := '.HIRE_DATE, ''STATUS'' VALUE :OLD.STATUS, ''PHOTO_BLOB'' VALUE CASE WHEN :OLD.PHOTO_BLOB IS NULL THEN NU';
wwv_flow_imp.g_varchar2_table(624) := 'LL ELSE ''[BLOB]'' END RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS';
wwv_flow_imp.g_varchar2_table(625) := '_EMPLOYEES'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_EMPLO';
wwv_flow_imp.g_varchar2_table(626) := 'YEES_BIU'||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_EMPLOYEES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF';
wwv_flow_imp.g_varchar2_table(627) := ' :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.crea';
wwv_flow_imp.g_varchar2_table(628) := 'ted_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END I';
wwv_flow_imp.g_varchar2_table(629) := 'F;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;';
wwv_flow_imp.g_varchar2_table(630) := ''||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_HR_POLICY_AUD'||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_HR_POLICY'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(631) := 'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    S';
wwv_flow_imp.g_varchar2_table(632) := 'ELECT JSON_OBJECT(''POLICY_ID'' VALUE :NEW.POLICY_ID, ''CATEGORY'' VALUE :NEW.CATEGORY, ''TITLE'' VALUE :N';
wwv_flow_imp.g_varchar2_table(633) := 'EW.TITLE, ''CONTENT'' VALUE DBMS_LOB.SUBSTR(:NEW.CONTENT, 4000, 1) RETURNING CLOB) INTO l_new_values F';
wwv_flow_imp.g_varchar2_table(634) := 'ROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_HR_POLICY'', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPD';
wwv_flow_imp.g_varchar2_table(635) := 'ATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''POLICY_ID'' VALUE :OLD.POLICY_ID, ''CATEGORY'' VALUE :OLD.CATEGORY,';
wwv_flow_imp.g_varchar2_table(636) := ' ''TITLE'' VALUE :OLD.TITLE, ''CONTENT'' VALUE DBMS_LOB.SUBSTR(:OLD.CONTENT, 4000, 1) RETURNING CLOB) IN';
wwv_flow_imp.g_varchar2_table(637) := 'TO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''POLICY_ID'' VALUE :NEW.POLICY_ID, ''CATEGORY'' VALU';
wwv_flow_imp.g_varchar2_table(638) := 'E :NEW.CATEGORY, ''TITLE'' VALUE :NEW.TITLE, ''CONTENT'' VALUE DBMS_LOB.SUBSTR(:NEW.CONTENT, 4000, 1) RE';
wwv_flow_imp.g_varchar2_table(639) := 'TURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_HR_POLICY'', ''UPDATE'', ';
wwv_flow_imp.g_varchar2_table(640) := 'l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''POLICY_ID'' VALUE :OLD.P';
wwv_flow_imp.g_varchar2_table(641) := 'OLICY_ID, ''CATEGORY'' VALUE :OLD.CATEGORY, ''TITLE'' VALUE :OLD.TITLE, ''CONTENT'' VALUE DBMS_LOB.SUBSTR(';
wwv_flow_imp.g_varchar2_table(642) := ':OLD.CONTENT, 4000, 1) RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''T';
wwv_flow_imp.g_varchar2_table(643) := 'MS_HR_POLICY'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_HR_';
wwv_flow_imp.g_varchar2_table(644) := 'POLICY_BIU'||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_HR_POLICY'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(645) := 'IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.cr';
wwv_flow_imp.g_varchar2_table(646) := 'eated_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END';
wwv_flow_imp.g_varchar2_table(647) := ' IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END';
wwv_flow_imp.g_varchar2_table(648) := ';'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_INTERVIEW_STAGES_AUD'||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_IN';
wwv_flow_imp.g_varchar2_table(649) := 'TERVIEW_STAGES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSER';
wwv_flow_imp.g_varchar2_table(650) := 'TING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''STAGE_ID'' VALUE :NEW.STAGE_ID, ''CANDIDATE_ID'' VALUE :NEW.CANDIDAT';
wwv_flow_imp.g_varchar2_table(651) := 'E_ID, ''REQ_ID'' VALUE :NEW.REQ_ID, ''STAGE_NAME'' VALUE :NEW.STAGE_NAME, ''INTERVIEWER_ID'' VALUE :NEW.IN';
wwv_flow_imp.g_varchar2_table(652) := 'TERVIEWER_ID, ''SCHEDULED_DATE'' VALUE :NEW.SCHEDULED_DATE, ''OUTCOME'' VALUE :NEW.OUTCOME, ''FEEDBACK_NO';
wwv_flow_imp.g_varchar2_table(653) := 'TES'' VALUE DBMS_LOB.SUBSTR(:NEW.FEEDBACK_NOTES, 4000, 1), ''SCORE'' VALUE :NEW.SCORE RETURNING CLOB) I';
wwv_flow_imp.g_varchar2_table(654) := 'NTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_INTERVIEW_STAGES'', ''INSERT'', NULL, l_';
wwv_flow_imp.g_varchar2_table(655) := 'new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''STAGE_ID'' VALUE :OLD.STAGE_ID, ''CANDIDA';
wwv_flow_imp.g_varchar2_table(656) := 'TE_ID'' VALUE :OLD.CANDIDATE_ID, ''REQ_ID'' VALUE :OLD.REQ_ID, ''STAGE_NAME'' VALUE :OLD.STAGE_NAME, ''INT';
wwv_flow_imp.g_varchar2_table(657) := 'ERVIEWER_ID'' VALUE :OLD.INTERVIEWER_ID, ''SCHEDULED_DATE'' VALUE :OLD.SCHEDULED_DATE, ''OUTCOME'' VALUE ';
wwv_flow_imp.g_varchar2_table(658) := ':OLD.OUTCOME, ''FEEDBACK_NOTES'' VALUE DBMS_LOB.SUBSTR(:OLD.FEEDBACK_NOTES, 4000, 1), ''SCORE'' VALUE :O';
wwv_flow_imp.g_varchar2_table(659) := 'LD.SCORE RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''STAGE_ID'' VALUE :NEW.';
wwv_flow_imp.g_varchar2_table(660) := 'STAGE_ID, ''CANDIDATE_ID'' VALUE :NEW.CANDIDATE_ID, ''REQ_ID'' VALUE :NEW.REQ_ID, ''STAGE_NAME'' VALUE :NE';
wwv_flow_imp.g_varchar2_table(661) := 'W.STAGE_NAME, ''INTERVIEWER_ID'' VALUE :NEW.INTERVIEWER_ID, ''SCHEDULED_DATE'' VALUE :NEW.SCHEDULED_DATE';
wwv_flow_imp.g_varchar2_table(662) := ', ''OUTCOME'' VALUE :NEW.OUTCOME, ''FEEDBACK_NOTES'' VALUE DBMS_LOB.SUBSTR(:NEW.FEEDBACK_NOTES, 4000, 1)';
wwv_flow_imp.g_varchar2_table(663) := ', ''SCORE'' VALUE :NEW.SCORE RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_chang';
wwv_flow_imp.g_varchar2_table(664) := 'e(''TMS_INTERVIEW_STAGES'', ''UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT ';
wwv_flow_imp.g_varchar2_table(665) := 'JSON_OBJECT(''STAGE_ID'' VALUE :OLD.STAGE_ID, ''CANDIDATE_ID'' VALUE :OLD.CANDIDATE_ID, ''REQ_ID'' VALUE :';
wwv_flow_imp.g_varchar2_table(666) := 'OLD.REQ_ID, ''STAGE_NAME'' VALUE :OLD.STAGE_NAME, ''INTERVIEWER_ID'' VALUE :OLD.INTERVIEWER_ID, ''SCHEDUL';
wwv_flow_imp.g_varchar2_table(667) := 'ED_DATE'' VALUE :OLD.SCHEDULED_DATE, ''OUTCOME'' VALUE :OLD.OUTCOME, ''FEEDBACK_NOTES'' VALUE DBMS_LOB.SU';
wwv_flow_imp.g_varchar2_table(668) := 'BSTR(:OLD.FEEDBACK_NOTES, 4000, 1), ''SCORE'' VALUE :OLD.SCORE RETURNING CLOB) INTO l_old_values FROM ';
wwv_flow_imp.g_varchar2_table(669) := 'dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_INTERVIEW_STAGES'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF';
wwv_flow_imp.g_varchar2_table(670) := ';'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_INTERVIEW_STAGES_BIU'||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_INTER';
wwv_flow_imp.g_varchar2_table(671) := 'VIEW_STAGES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :N';
wwv_flow_imp.g_varchar2_table(672) := 'EW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created';
wwv_flow_imp.g_varchar2_table(673) := '_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;';
wwv_flow_imp.g_varchar2_table(674) := ''||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_JOBS_';
wwv_flow_imp.g_varchar2_table(675) := 'AUD'||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_JOBS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_';
wwv_flow_imp.g_varchar2_table(676) := 'new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''JOB_ID'' VALUE :NEW.JOB_ID, ''TI';
wwv_flow_imp.g_varchar2_table(677) := 'TLE'' VALUE :NEW.TITLE, ''MIN_SALARY'' VALUE :NEW.MIN_SALARY, ''MAX_SALARY'' VALUE :NEW.MAX_SALARY, ''DEPT';
wwv_flow_imp.g_varchar2_table(678) := '_ID'' VALUE :NEW.DEPT_ID RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''';
wwv_flow_imp.g_varchar2_table(679) := 'TMS_JOBS'', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''JOB_ID'' VA';
wwv_flow_imp.g_varchar2_table(680) := 'LUE :OLD.JOB_ID, ''TITLE'' VALUE :OLD.TITLE, ''MIN_SALARY'' VALUE :OLD.MIN_SALARY, ''MAX_SALARY'' VALUE :O';
wwv_flow_imp.g_varchar2_table(681) := 'LD.MAX_SALARY, ''DEPT_ID'' VALUE :OLD.DEPT_ID RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT';
wwv_flow_imp.g_varchar2_table(682) := ' JSON_OBJECT(''JOB_ID'' VALUE :NEW.JOB_ID, ''TITLE'' VALUE :NEW.TITLE, ''MIN_SALARY'' VALUE :NEW.MIN_SALAR';
wwv_flow_imp.g_varchar2_table(683) := 'Y, ''MAX_SALARY'' VALUE :NEW.MAX_SALARY, ''DEPT_ID'' VALUE :NEW.DEPT_ID RETURNING CLOB) INTO l_new_value';
wwv_flow_imp.g_varchar2_table(684) := 's FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_JOBS'', ''UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELS';
wwv_flow_imp.g_varchar2_table(685) := 'IF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''JOB_ID'' VALUE :OLD.JOB_ID, ''TITLE'' VALUE :OLD.TITLE, ''MIN_';
wwv_flow_imp.g_varchar2_table(686) := 'SALARY'' VALUE :OLD.MIN_SALARY, ''MAX_SALARY'' VALUE :OLD.MAX_SALARY, ''DEPT_ID'' VALUE :OLD.DEPT_ID RETU';
wwv_flow_imp.g_varchar2_table(687) := 'RNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_JOBS'', ''DELETE'', l_old_v';
wwv_flow_imp.g_varchar2_table(688) := 'alues, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_JOBS_BIU'||wwv_flow.LF||
'BEFORE INSERT OR UPDATE O';
wwv_flow_imp.g_varchar2_table(689) := 'N TMS_JOBS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NE';
wwv_flow_imp.g_varchar2_table(690) := 'W.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_';
wwv_flow_imp.g_varchar2_table(691) := 'by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(692) := '  :NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_JOB_RE';
wwv_flow_imp.g_varchar2_table(693) := 'QUISITIONS_AUD'||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_JOB_REQUISITIONS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l';
wwv_flow_imp.g_varchar2_table(694) := '_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''REQ_ID''';
wwv_flow_imp.g_varchar2_table(695) := ' VALUE :NEW.REQ_ID, ''JOB_ID'' VALUE :NEW.JOB_ID, ''DEPT_ID'' VALUE :NEW.DEPT_ID, ''REQUESTED_BY'' VALUE :';
wwv_flow_imp.g_varchar2_table(696) := 'NEW.REQUESTED_BY, ''APPROVED_BY'' VALUE :NEW.APPROVED_BY, ''HEADCOUNT'' VALUE :NEW.HEADCOUNT, ''STATUS'' V';
wwv_flow_imp.g_varchar2_table(697) := 'ALUE :NEW.STATUS, ''OPEN_DATE'' VALUE :NEW.OPEN_DATE, ''CLOSE_DATE'' VALUE :NEW.CLOSE_DATE RETURNING CLO';
wwv_flow_imp.g_varchar2_table(698) := 'B) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_JOB_REQUISITIONS'', ''INSERT'', NULL';
wwv_flow_imp.g_varchar2_table(699) := ', l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''REQ_ID'' VALUE :OLD.REQ_ID, ''JOB_ID''';
wwv_flow_imp.g_varchar2_table(700) := ' VALUE :OLD.JOB_ID, ''DEPT_ID'' VALUE :OLD.DEPT_ID, ''REQUESTED_BY'' VALUE :OLD.REQUESTED_BY, ''APPROVED_';
wwv_flow_imp.g_varchar2_table(701) := 'BY'' VALUE :OLD.APPROVED_BY, ''HEADCOUNT'' VALUE :OLD.HEADCOUNT, ''STATUS'' VALUE :OLD.STATUS, ''OPEN_DATE';
wwv_flow_imp.g_varchar2_table(702) := ''' VALUE :OLD.OPEN_DATE, ''CLOSE_DATE'' VALUE :OLD.CLOSE_DATE RETURNING CLOB) INTO l_old_values FROM du';
wwv_flow_imp.g_varchar2_table(703) := 'al;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''REQ_ID'' VALUE :NEW.REQ_ID, ''JOB_ID'' VALUE :NEW.JOB_ID, ''DEPT_ID'' VALUE ';
wwv_flow_imp.g_varchar2_table(704) := ':NEW.DEPT_ID, ''REQUESTED_BY'' VALUE :NEW.REQUESTED_BY, ''APPROVED_BY'' VALUE :NEW.APPROVED_BY, ''HEADCOU';
wwv_flow_imp.g_varchar2_table(705) := 'NT'' VALUE :NEW.HEADCOUNT, ''STATUS'' VALUE :NEW.STATUS, ''OPEN_DATE'' VALUE :NEW.OPEN_DATE, ''CLOSE_DATE''';
wwv_flow_imp.g_varchar2_table(706) := ' VALUE :NEW.CLOSE_DATE RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''T';
wwv_flow_imp.g_varchar2_table(707) := 'MS_JOB_REQUISITIONS'', ''UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON';
wwv_flow_imp.g_varchar2_table(708) := '_OBJECT(''REQ_ID'' VALUE :OLD.REQ_ID, ''JOB_ID'' VALUE :OLD.JOB_ID, ''DEPT_ID'' VALUE :OLD.DEPT_ID, ''REQUE';
wwv_flow_imp.g_varchar2_table(709) := 'STED_BY'' VALUE :OLD.REQUESTED_BY, ''APPROVED_BY'' VALUE :OLD.APPROVED_BY, ''HEADCOUNT'' VALUE :OLD.HEADC';
wwv_flow_imp.g_varchar2_table(710) := 'OUNT, ''STATUS'' VALUE :OLD.STATUS, ''OPEN_DATE'' VALUE :OLD.OPEN_DATE, ''CLOSE_DATE'' VALUE :OLD.CLOSE_DA';
wwv_flow_imp.g_varchar2_table(711) := 'TE RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_JOB_REQUISITIONS''';
wwv_flow_imp.g_varchar2_table(712) := ', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_JOB_REQUISITIONS';
wwv_flow_imp.g_varchar2_table(713) := '_BIU'||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_JOB_REQUISITIONS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(714) := ' IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.c';
wwv_flow_imp.g_varchar2_table(715) := 'reated_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  EN';
wwv_flow_imp.g_varchar2_table(716) := 'D IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'EN';
wwv_flow_imp.g_varchar2_table(717) := 'D;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_LEAVE_BALANCES_AUD'||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_LEA';
wwv_flow_imp.g_varchar2_table(718) := 'VE_BALANCES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTIN';
wwv_flow_imp.g_varchar2_table(719) := 'G THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''BALANCE_ID'' VALUE :NEW.BALANCE_ID, ''EMPLOYEE_ID'' VALUE :NEW.EMPLOYEE';
wwv_flow_imp.g_varchar2_table(720) := '_ID, ''LEAVE_TYPE_ID'' VALUE :NEW.LEAVE_TYPE_ID, ''YEAR'' VALUE :NEW.YEAR, ''ACCRUED'' VALUE :NEW.ACCRUED,';
wwv_flow_imp.g_varchar2_table(721) := ' ''USED'' VALUE :NEW.USED, ''REMAINING'' VALUE :NEW.REMAINING RETURNING CLOB) INTO l_new_values FROM dua';
wwv_flow_imp.g_varchar2_table(722) := 'l;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_LEAVE_BALANCES'', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDAT';
wwv_flow_imp.g_varchar2_table(723) := 'ING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''BALANCE_ID'' VALUE :OLD.BALANCE_ID, ''EMPLOYEE_ID'' VALUE :OLD.EMPLOY';
wwv_flow_imp.g_varchar2_table(724) := 'EE_ID, ''LEAVE_TYPE_ID'' VALUE :OLD.LEAVE_TYPE_ID, ''YEAR'' VALUE :OLD.YEAR, ''ACCRUED'' VALUE :OLD.ACCRUE';
wwv_flow_imp.g_varchar2_table(725) := 'D, ''USED'' VALUE :OLD.USED, ''REMAINING'' VALUE :OLD.REMAINING RETURNING CLOB) INTO l_old_values FROM d';
wwv_flow_imp.g_varchar2_table(726) := 'ual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''BALANCE_ID'' VALUE :NEW.BALANCE_ID, ''EMPLOYEE_ID'' VALUE :NEW.EMPLOYEE_I';
wwv_flow_imp.g_varchar2_table(727) := 'D, ''LEAVE_TYPE_ID'' VALUE :NEW.LEAVE_TYPE_ID, ''YEAR'' VALUE :NEW.YEAR, ''ACCRUED'' VALUE :NEW.ACCRUED, ''';
wwv_flow_imp.g_varchar2_table(728) := 'USED'' VALUE :NEW.USED, ''REMAINING'' VALUE :NEW.REMAINING RETURNING CLOB) INTO l_new_values FROM dual;';
wwv_flow_imp.g_varchar2_table(729) := ''||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_LEAVE_BALANCES'', ''UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF';
wwv_flow_imp.g_varchar2_table(730) := ' DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''BALANCE_ID'' VALUE :OLD.BALANCE_ID, ''EMPLOYEE_ID'' VALUE :OLD.';
wwv_flow_imp.g_varchar2_table(731) := 'EMPLOYEE_ID, ''LEAVE_TYPE_ID'' VALUE :OLD.LEAVE_TYPE_ID, ''YEAR'' VALUE :OLD.YEAR, ''ACCRUED'' VALUE :OLD.';
wwv_flow_imp.g_varchar2_table(732) := 'ACCRUED, ''USED'' VALUE :OLD.USED, ''REMAINING'' VALUE :OLD.REMAINING RETURNING CLOB) INTO l_old_values ';
wwv_flow_imp.g_varchar2_table(733) := 'FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_LEAVE_BALANCES'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END';
wwv_flow_imp.g_varchar2_table(734) := ' IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_LEAVE_BALANCES_BIU'||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_LEAV';
wwv_flow_imp.g_varchar2_table(735) := 'E_BALANCES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NE';
wwv_flow_imp.g_varchar2_table(736) := 'W.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_';
wwv_flow_imp.g_varchar2_table(737) := 'by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(738) := '  :NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_LEAVE_';
wwv_flow_imp.g_varchar2_table(739) := 'REQUESTS_AUD'||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_LEAVE_REQUESTS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old';
wwv_flow_imp.g_varchar2_table(740) := '_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''REQUEST_ID''';
wwv_flow_imp.g_varchar2_table(741) := ' VALUE :NEW.REQUEST_ID, ''EMPLOYEE_ID'' VALUE :NEW.EMPLOYEE_ID, ''LEAVE_TYPE_ID'' VALUE :NEW.LEAVE_TYPE_';
wwv_flow_imp.g_varchar2_table(742) := 'ID, ''START_DATE'' VALUE :NEW.START_DATE, ''END_DATE'' VALUE :NEW.END_DATE, ''DAYS_REQUESTED'' VALUE :NEW.';
wwv_flow_imp.g_varchar2_table(743) := 'DAYS_REQUESTED, ''REASON'' VALUE DBMS_LOB.SUBSTR(:NEW.REASON, 4000, 1), ''STATUS'' VALUE :NEW.STATUS, ''A';
wwv_flow_imp.g_varchar2_table(744) := 'PPROVER_ID'' VALUE :NEW.APPROVER_ID RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.l';
wwv_flow_imp.g_varchar2_table(745) := 'og_change(''TMS_LEAVE_REQUESTS'', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JS';
wwv_flow_imp.g_varchar2_table(746) := 'ON_OBJECT(''REQUEST_ID'' VALUE :OLD.REQUEST_ID, ''EMPLOYEE_ID'' VALUE :OLD.EMPLOYEE_ID, ''LEAVE_TYPE_ID'' ';
wwv_flow_imp.g_varchar2_table(747) := 'VALUE :OLD.LEAVE_TYPE_ID, ''START_DATE'' VALUE :OLD.START_DATE, ''END_DATE'' VALUE :OLD.END_DATE, ''DAYS_';
wwv_flow_imp.g_varchar2_table(748) := 'REQUESTED'' VALUE :OLD.DAYS_REQUESTED, ''REASON'' VALUE DBMS_LOB.SUBSTR(:OLD.REASON, 4000, 1), ''STATUS''';
wwv_flow_imp.g_varchar2_table(749) := ' VALUE :OLD.STATUS, ''APPROVER_ID'' VALUE :OLD.APPROVER_ID RETURNING CLOB) INTO l_old_values FROM dual';
wwv_flow_imp.g_varchar2_table(750) := ';'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''REQUEST_ID'' VALUE :NEW.REQUEST_ID, ''EMPLOYEE_ID'' VALUE :NEW.EMPLOYEE_ID, ';
wwv_flow_imp.g_varchar2_table(751) := '''LEAVE_TYPE_ID'' VALUE :NEW.LEAVE_TYPE_ID, ''START_DATE'' VALUE :NEW.START_DATE, ''END_DATE'' VALUE :NEW.';
wwv_flow_imp.g_varchar2_table(752) := 'END_DATE, ''DAYS_REQUESTED'' VALUE :NEW.DAYS_REQUESTED, ''REASON'' VALUE DBMS_LOB.SUBSTR(:NEW.REASON, 40';
wwv_flow_imp.g_varchar2_table(753) := '00, 1), ''STATUS'' VALUE :NEW.STATUS, ''APPROVER_ID'' VALUE :NEW.APPROVER_ID RETURNING CLOB) INTO l_new_';
wwv_flow_imp.g_varchar2_table(754) := 'values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_LEAVE_REQUESTS'', ''UPDATE'', l_old_values, l_new_';
wwv_flow_imp.g_varchar2_table(755) := 'values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''REQUEST_ID'' VALUE :OLD.REQUEST_ID, ''EMPLOYE';
wwv_flow_imp.g_varchar2_table(756) := 'E_ID'' VALUE :OLD.EMPLOYEE_ID, ''LEAVE_TYPE_ID'' VALUE :OLD.LEAVE_TYPE_ID, ''START_DATE'' VALUE :OLD.STAR';
wwv_flow_imp.g_varchar2_table(757) := 'T_DATE, ''END_DATE'' VALUE :OLD.END_DATE, ''DAYS_REQUESTED'' VALUE :OLD.DAYS_REQUESTED, ''REASON'' VALUE D';
wwv_flow_imp.g_varchar2_table(758) := 'BMS_LOB.SUBSTR(:OLD.REASON, 4000, 1), ''STATUS'' VALUE :OLD.STATUS, ''APPROVER_ID'' VALUE :OLD.APPROVER_';
wwv_flow_imp.g_varchar2_table(759) := 'ID RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_LEAVE_REQUESTS'', ';
wwv_flow_imp.g_varchar2_table(760) := '''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_LEAVE_REQUESTS_BIU';
wwv_flow_imp.g_varchar2_table(761) := ''||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_LEAVE_REQUESTS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :N';
wwv_flow_imp.g_varchar2_table(762) := 'EW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created';
wwv_flow_imp.g_varchar2_table(763) := '_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;';
wwv_flow_imp.g_varchar2_table(764) := ''||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/';
wwv_flow_imp.g_varchar2_table(765) := ''||wwv_flow.LF||
'create or replace TRIGGER TMS_LEAVE_TYPES_AUD'||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_LEAVE_TYPES';
wwv_flow_imp.g_varchar2_table(766) := ''||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(767) := 'SELECT JSON_OBJECT(''LEAVE_TYPE_ID'' VALUE :NEW.LEAVE_TYPE_ID, ''NAME'' VALUE :NEW.NAME, ''MAX_DAYS_PER_Y';
wwv_flow_imp.g_varchar2_table(768) := 'EAR'' VALUE :NEW.MAX_DAYS_PER_YEAR RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.lo';
wwv_flow_imp.g_varchar2_table(769) := 'g_change(''TMS_LEAVE_TYPES'', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_O';
wwv_flow_imp.g_varchar2_table(770) := 'BJECT(''LEAVE_TYPE_ID'' VALUE :OLD.LEAVE_TYPE_ID, ''NAME'' VALUE :OLD.NAME, ''MAX_DAYS_PER_YEAR'' VALUE :O';
wwv_flow_imp.g_varchar2_table(771) := 'LD.MAX_DAYS_PER_YEAR RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''LEAVE_TYP';
wwv_flow_imp.g_varchar2_table(772) := 'E_ID'' VALUE :NEW.LEAVE_TYPE_ID, ''NAME'' VALUE :NEW.NAME, ''MAX_DAYS_PER_YEAR'' VALUE :NEW.MAX_DAYS_PER_';
wwv_flow_imp.g_varchar2_table(773) := 'YEAR RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_LEAVE_TYPES'', ''';
wwv_flow_imp.g_varchar2_table(774) := 'UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''LEAVE_TYPE_ID''';
wwv_flow_imp.g_varchar2_table(775) := ' VALUE :OLD.LEAVE_TYPE_ID, ''NAME'' VALUE :OLD.NAME, ''MAX_DAYS_PER_YEAR'' VALUE :OLD.MAX_DAYS_PER_YEAR ';
wwv_flow_imp.g_varchar2_table(776) := 'RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_LEAVE_TYPES'', ''DELET';
wwv_flow_imp.g_varchar2_table(777) := 'E'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_LEAVE_TYPES_BIU'||wwv_flow.LF||
'BEFORE ';
wwv_flow_imp.g_varchar2_table(778) := 'INSERT OR UPDATE ON TMS_LEAVE_TYPES'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_a';
wwv_flow_imp.g_varchar2_table(779) := 't IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL ';
wwv_flow_imp.g_varchar2_table(780) := 'THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.upda';
wwv_flow_imp.g_varchar2_table(781) := 'ted_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or r';
wwv_flow_imp.g_varchar2_table(782) := 'eplace TRIGGER TMS_OFFERS_AUD'||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_OFFERS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE';
wwv_flow_imp.g_varchar2_table(783) := ''||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''OF';
wwv_flow_imp.g_varchar2_table(784) := 'FER_ID'' VALUE :NEW.OFFER_ID, ''CANDIDATE_ID'' VALUE :NEW.CANDIDATE_ID, ''REQ_ID'' VALUE :NEW.REQ_ID, ''OF';
wwv_flow_imp.g_varchar2_table(785) := 'FERED_SALARY'' VALUE :NEW.OFFERED_SALARY, ''START_DATE'' VALUE :NEW.START_DATE, ''EXPIRY_DATE'' VALUE :NE';
wwv_flow_imp.g_varchar2_table(786) := 'W.EXPIRY_DATE, ''STATUS'' VALUE :NEW.STATUS, ''OFFER_LETTER_BLOB'' VALUE CASE WHEN :NEW.OFFER_LETTER_BLO';
wwv_flow_imp.g_varchar2_table(787) := 'B IS NULL THEN NULL ELSE ''[BLOB]'' END, ''APPROVED_BY'' VALUE :NEW.APPROVED_BY RETURNING CLOB) INTO l_n';
wwv_flow_imp.g_varchar2_table(788) := 'ew_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_OFFERS'', ''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  E';
wwv_flow_imp.g_varchar2_table(789) := 'LSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''OFFER_ID'' VALUE :OLD.OFFER_ID, ''CANDIDATE_ID'' VALUE :OLD';
wwv_flow_imp.g_varchar2_table(790) := '.CANDIDATE_ID, ''REQ_ID'' VALUE :OLD.REQ_ID, ''OFFERED_SALARY'' VALUE :OLD.OFFERED_SALARY, ''START_DATE'' ';
wwv_flow_imp.g_varchar2_table(791) := 'VALUE :OLD.START_DATE, ''EXPIRY_DATE'' VALUE :OLD.EXPIRY_DATE, ''STATUS'' VALUE :OLD.STATUS, ''OFFER_LETT';
wwv_flow_imp.g_varchar2_table(792) := 'ER_BLOB'' VALUE CASE WHEN :OLD.OFFER_LETTER_BLOB IS NULL THEN NULL ELSE ''[BLOB]'' END, ''APPROVED_BY'' V';
wwv_flow_imp.g_varchar2_table(793) := 'ALUE :OLD.APPROVED_BY RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''OFFER_ID';
wwv_flow_imp.g_varchar2_table(794) := ''' VALUE :NEW.OFFER_ID, ''CANDIDATE_ID'' VALUE :NEW.CANDIDATE_ID, ''REQ_ID'' VALUE :NEW.REQ_ID, ''OFFERED_';
wwv_flow_imp.g_varchar2_table(795) := 'SALARY'' VALUE :NEW.OFFERED_SALARY, ''START_DATE'' VALUE :NEW.START_DATE, ''EXPIRY_DATE'' VALUE :NEW.EXPI';
wwv_flow_imp.g_varchar2_table(796) := 'RY_DATE, ''STATUS'' VALUE :NEW.STATUS, ''OFFER_LETTER_BLOB'' VALUE CASE WHEN :NEW.OFFER_LETTER_BLOB IS N';
wwv_flow_imp.g_varchar2_table(797) := 'ULL THEN NULL ELSE ''[BLOB]'' END, ''APPROVED_BY'' VALUE :NEW.APPROVED_BY RETURNING CLOB) INTO l_new_val';
wwv_flow_imp.g_varchar2_table(798) := 'ues FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_OFFERS'', ''UPDATE'', l_old_values, l_new_values);'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(799) := ' ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''OFFER_ID'' VALUE :OLD.OFFER_ID, ''CANDIDATE_ID'' VALUE :O';
wwv_flow_imp.g_varchar2_table(800) := 'LD.CANDIDATE_ID, ''REQ_ID'' VALUE :OLD.REQ_ID, ''OFFERED_SALARY'' VALUE :OLD.OFFERED_SALARY, ''START_DATE';
wwv_flow_imp.g_varchar2_table(801) := ''' VALUE :OLD.START_DATE, ''EXPIRY_DATE'' VALUE :OLD.EXPIRY_DATE, ''STATUS'' VALUE :OLD.STATUS, ''OFFER_LE';
wwv_flow_imp.g_varchar2_table(802) := 'TTER_BLOB'' VALUE CASE WHEN :OLD.OFFER_LETTER_BLOB IS NULL THEN NULL ELSE ''[BLOB]'' END, ''APPROVED_BY''';
wwv_flow_imp.g_varchar2_table(803) := ' VALUE :OLD.APPROVED_BY RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''';
wwv_flow_imp.g_varchar2_table(804) := 'TMS_OFFERS'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_OFFER';
wwv_flow_imp.g_varchar2_table(805) := 'S_BIU'||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_OFFERS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.';
wwv_flow_imp.g_varchar2_table(806) := 'created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by';
wwv_flow_imp.g_varchar2_table(807) := ' IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(808) := ':NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'cr';
wwv_flow_imp.g_varchar2_table(809) := 'eate or replace TRIGGER TMS_ONBOARDING_TASKS_AUD'||wwv_flow.LF||
'AFTER INSERT OR UPDATE OR DELETE ON TMS_ONBOARDING';
wwv_flow_imp.g_varchar2_table(810) := '_TASKS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'DECLARE'||wwv_flow.LF||
'  l_old_values CLOB;'||wwv_flow.LF||
'  l_new_values CLOB;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THE';
wwv_flow_imp.g_varchar2_table(811) := 'N'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''TASK_ID'' VALUE :NEW.TASK_ID, ''EMPLOYEE_ID'' VALUE :NEW.EMPLOYEE_ID, ''TASK_';
wwv_flow_imp.g_varchar2_table(812) := 'NAME'' VALUE :NEW.TASK_NAME, ''ASSIGNED_TO'' VALUE :NEW.ASSIGNED_TO, ''CATEGORY'' VALUE :NEW.CATEGORY, ''D';
wwv_flow_imp.g_varchar2_table(813) := 'UE_DATE'' VALUE :NEW.DUE_DATE, ''STATUS'' VALUE :NEW.STATUS, ''COMPLETED_DATE'' VALUE :NEW.COMPLETED_DATE';
wwv_flow_imp.g_varchar2_table(814) := ' RETURNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_ONBOARDING_TASKS'', ';
wwv_flow_imp.g_varchar2_table(815) := '''INSERT'', NULL, l_new_values);'||wwv_flow.LF||
'  ELSIF UPDATING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''TASK_ID'' VALUE :OLD.T';
wwv_flow_imp.g_varchar2_table(816) := 'ASK_ID, ''EMPLOYEE_ID'' VALUE :OLD.EMPLOYEE_ID, ''TASK_NAME'' VALUE :OLD.TASK_NAME, ''ASSIGNED_TO'' VALUE ';
wwv_flow_imp.g_varchar2_table(817) := ':OLD.ASSIGNED_TO, ''CATEGORY'' VALUE :OLD.CATEGORY, ''DUE_DATE'' VALUE :OLD.DUE_DATE, ''STATUS'' VALUE :OL';
wwv_flow_imp.g_varchar2_table(818) := 'D.STATUS, ''COMPLETED_DATE'' VALUE :OLD.COMPLETED_DATE RETURNING CLOB) INTO l_old_values FROM dual;'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(819) := '   SELECT JSON_OBJECT(''TASK_ID'' VALUE :NEW.TASK_ID, ''EMPLOYEE_ID'' VALUE :NEW.EMPLOYEE_ID, ''TASK_NAME';
wwv_flow_imp.g_varchar2_table(820) := ''' VALUE :NEW.TASK_NAME, ''ASSIGNED_TO'' VALUE :NEW.ASSIGNED_TO, ''CATEGORY'' VALUE :NEW.CATEGORY, ''DUE_D';
wwv_flow_imp.g_varchar2_table(821) := 'ATE'' VALUE :NEW.DUE_DATE, ''STATUS'' VALUE :NEW.STATUS, ''COMPLETED_DATE'' VALUE :NEW.COMPLETED_DATE RET';
wwv_flow_imp.g_varchar2_table(822) := 'URNING CLOB) INTO l_new_values FROM dual;'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_ONBOARDING_TASKS'', ''UPD';
wwv_flow_imp.g_varchar2_table(823) := 'ATE'', l_old_values, l_new_values);'||wwv_flow.LF||
'  ELSIF DELETING THEN'||wwv_flow.LF||
'    SELECT JSON_OBJECT(''TASK_ID'' VALUE :O';
wwv_flow_imp.g_varchar2_table(824) := 'LD.TASK_ID, ''EMPLOYEE_ID'' VALUE :OLD.EMPLOYEE_ID, ''TASK_NAME'' VALUE :OLD.TASK_NAME, ''ASSIGNED_TO'' VA';
wwv_flow_imp.g_varchar2_table(825) := 'LUE :OLD.ASSIGNED_TO, ''CATEGORY'' VALUE :OLD.CATEGORY, ''DUE_DATE'' VALUE :OLD.DUE_DATE, ''STATUS'' VALUE';
wwv_flow_imp.g_varchar2_table(826) := ' :OLD.STATUS, ''COMPLETED_DATE'' VALUE :OLD.COMPLETED_DATE RETURNING CLOB) INTO l_old_values FROM dual';
wwv_flow_imp.g_varchar2_table(827) := ';'||wwv_flow.LF||
'    tms_audit_pkg.log_change(''TMS_ONBOARDING_TASKS'', ''DELETE'', l_old_values, NULL);'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'E';
wwv_flow_imp.g_varchar2_table(828) := 'ND;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace TRIGGER TMS_ONBOARDING_TASKS_BIU'||wwv_flow.LF||
'BEFORE INSERT OR UPDATE ON TMS_ONBOARDIN';
wwv_flow_imp.g_varchar2_table(829) := 'G_TASKS'||wwv_flow.LF||
'FOR EACH ROW'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'  IF INSERTING THEN'||wwv_flow.LF||
'    IF :NEW.created_at IS NULL THEN'||wwv_flow.LF||
'      :NEW.c';
wwv_flow_imp.g_varchar2_table(830) := 'reated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'    IF :NEW.created_by IS NULL THEN'||wwv_flow.LF||
'      :NEW.created_by ';
wwv_flow_imp.g_varchar2_table(831) := ':= tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
'  :NEW.updated_at := SYSTIMESTAMP;'||wwv_flow.LF||
'  :';
wwv_flow_imp.g_varchar2_table(832) := 'NEW.updated_by := tms_audit_pkg.current_user_name;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(833) := ''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'create or replace PACKAGE BODY tms_audit_pkg AS'||wwv_flow.LF||
'  FUNC';
wwv_flow_imp.g_varchar2_table(834) := 'TION current_user_name RETURN VARCHAR2 IS'||wwv_flow.LF||
'    l_user VARCHAR2(255);'||wwv_flow.LF||
'  BEGIN'||wwv_flow.LF||
'    l_user := SYS_CON';
wwv_flow_imp.g_varchar2_table(835) := 'TEXT(''APEX$SESSION'', ''APP_USER'');'||wwv_flow.LF||
''||wwv_flow.LF||
'    IF l_user IS NULL THEN'||wwv_flow.LF||
'      l_user := SYS_CONTEXT(''USEREN';
wwv_flow_imp.g_varchar2_table(836) := 'V'', ''SESSION_USER'');'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
''||wwv_flow.LF||
'    RETURN SUBSTR(l_user, 1, 255);'||wwv_flow.LF||
'  END current_user_name;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(837) := ''||wwv_flow.LF||
'  PROCEDURE log_change('||wwv_flow.LF||
'    p_table_name IN VARCHAR2,'||wwv_flow.LF||
'    p_operation  IN VARCHAR2,'||wwv_flow.LF||
'    p_old_va';
wwv_flow_imp.g_varchar2_table(838) := 'lues IN CLOB,'||wwv_flow.LF||
'    p_new_values IN CLOB'||wwv_flow.LF||
'  ) IS'||wwv_flow.LF||
'  BEGIN'||wwv_flow.LF||
'    INSERT INTO tms_audit_log ('||wwv_flow.LF||
'      tab';
wwv_flow_imp.g_varchar2_table(839) := 'le_name,'||wwv_flow.LF||
'      operation,'||wwv_flow.LF||
'      old_values,'||wwv_flow.LF||
'      new_values,'||wwv_flow.LF||
'      changed_by,'||wwv_flow.LF||
'      changed_a';
wwv_flow_imp.g_varchar2_table(840) := 't,'||wwv_flow.LF||
'      created_by,'||wwv_flow.LF||
'      created_at,'||wwv_flow.LF||
'      updated_by,'||wwv_flow.LF||
'      updated_at'||wwv_flow.LF||
'    ) VALUES ('||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(841) := ' UPPER(p_table_name),'||wwv_flow.LF||
'      UPPER(p_operation),'||wwv_flow.LF||
'      p_old_values,'||wwv_flow.LF||
'      p_new_values,'||wwv_flow.LF||
'      cu';
wwv_flow_imp.g_varchar2_table(842) := 'rrent_user_name,'||wwv_flow.LF||
'      SYSTIMESTAMP,'||wwv_flow.LF||
'      current_user_name,'||wwv_flow.LF||
'      SYSTIMESTAMP,'||wwv_flow.LF||
'      current_';
wwv_flow_imp.g_varchar2_table(843) := 'user_name,'||wwv_flow.LF||
'      SYSTIMESTAMP'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  END log_change;'||wwv_flow.LF||
'END tms_audit_pkg;'||wwv_flow.LF||
'/'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(844) := ''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(44416310162142733)
,p_install_id=>wwv_flow_imp.id(44415762488135617)
,p_name=>'DB objects'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44416492924142746)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_AUDIT_LOG_PK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44416609906142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_AUDIT_LOG_TABLE_AT_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44416822235142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_CANDIDATES_PK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44417067940142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_CANDIDATES_REQ_EMAIL_UK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44417272610142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_CANDIDATES_REQ_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44417401829142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_CANDIDATES_STAGE_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44417640984142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_DEPARTMENTS_NAME_UK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44417873332142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_DEPARTMENTS_PK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44418024616142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_EMPLOYEES_CANDIDATE_UK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44418201407142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_EMPLOYEES_DEPT_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44418463832142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_EMPLOYEES_EMAIL_UK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44418625603142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_EMPLOYEES_MANAGER_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44418867443142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_EMPLOYEES_PK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44419041644142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_HR_POLICY_CATEGORY_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44419262881142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_HR_POLICY_PK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44419497457142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_HR_POLICY_TITLE_UK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44419693480142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_INTERVIEW_CAND_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44419833545142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_INTERVIEW_REQ_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44420067692142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_INTERVIEW_SCHED_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44420205172142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_INTERVIEW_STAGES_PK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44420415275142747)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_JOBS_DEPT_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44420669973142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_JOBS_PK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44420862686142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_JOB_REQUISITIONS_PK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44421066164142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_JOB_REQ_DEPT_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44421244381142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_JOB_REQ_JOB_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44421403290142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_JOB_REQ_STATUS_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44421664300142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_LEAVE_BALANCES_PK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44421879256142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_LEAVE_BAL_EMP_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44422007772142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_LEAVE_BAL_EMP_TYPE_YEAR_UK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44422271316142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_LEAVE_REQUESTS_PK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44422409582142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_LEAVE_REQ_EMP_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44422679413142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_LEAVE_REQ_STATUS_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44422861791142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_LEAVE_REQ_TYPE_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44423070873142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_LEAVE_TYPES_NAME_UK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44423225248142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_LEAVE_TYPES_PK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44423452153142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_OFFERS_CAND_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44423620879142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_OFFERS_PK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44423821959142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_OFFERS_REQ_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44424011360142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_OFFERS_STATUS_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44424216000142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_ONBOARDING_TASKS_PK'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44424489329142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_TASKS_EMPLOYEE_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44424629351142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'TMS_TASKS_STATUS_IX'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44424898503142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'TMS_AUDIT_PKG'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44425051878142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'TMS_AUDIT_LOG'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44425216079142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'TMS_CANDIDATES'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44425438968142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'TMS_DEPARTMENTS'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44425611826142748)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'TMS_EMPLOYEES'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44425821362142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'TMS_HR_POLICY'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44426022500142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'TMS_INTERVIEW_STAGES'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44426264131142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'TMS_JOBS'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44426498179142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'TMS_JOB_REQUISITIONS'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44426687148142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'TMS_LEAVE_BALANCES'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44426895557142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'TMS_LEAVE_REQUESTS'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44427086229142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'TMS_LEAVE_TYPES'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44427210100142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'TMS_OFFERS'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44427405470142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'TMS_ONBOARDING_TASKS'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44427697301142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_CANDIDATES_AUD'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44427809630142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_CANDIDATES_BIU'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44428030885142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_DEPARTMENTS_AUD'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44428297718142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_DEPARTMENTS_BIU'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44428413900142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_EMPLOYEES_AUD'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44428656885142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_EMPLOYEES_BIU'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44428801492142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_HR_POLICY_AUD'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44429023820142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_HR_POLICY_BIU'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44429274971142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_INTERVIEW_STAGES_AUD'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44429442684142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_INTERVIEW_STAGES_BIU'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44429635466142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_JOBS_AUD'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44429879512142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_JOBS_BIU'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44430093954142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_JOB_REQUISITIONS_AUD'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44430233955142749)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_JOB_REQUISITIONS_BIU'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44430493810142750)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_LEAVE_BALANCES_AUD'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44430638791142750)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_LEAVE_BALANCES_BIU'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44430819212142750)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_LEAVE_REQUESTS_AUD'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44431068525142750)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_LEAVE_REQUESTS_BIU'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44431242625142750)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_LEAVE_TYPES_AUD'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44431447629142750)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_LEAVE_TYPES_BIU'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44431605557142750)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_OFFERS_AUD'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44431883881142750)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_OFFERS_BIU'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44432021640142750)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_ONBOARDING_TASKS_AUD'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(44432207546142750)
,p_script_id=>wwv_flow_imp.id(44416310162142733)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'TMS_ONBOARDING_TASKS_BIU'
,p_created_on=>wwv_flow_imp.dz('20260714191938Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260714191938Z')
,p_created_by=>'GENDEV'
,p_last_updated_by=>'GENDEV'
);
end;
/
prompt --application/deployment/install/install_data_package
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := 'begin'||wwv_flow.LF||
'    --TMS_AUDIT_LOG: 83/10000 rows exported, APEX$DATA$PKG/TMS_AUDIT_LOG$508333'||wwv_flow.LF||
'    apex_dat';
wwv_flow_imp.g_varchar2_table(2) := 'a_install.load_supporting_object_data(p_table_name => ''TMS_AUDIT_LOG'', p_delete_after_install => tru';
wwv_flow_imp.g_varchar2_table(3) := 'e );'||wwv_flow.LF||
'    --TMS_CANDIDATES: 12/10000 rows exported, APEX$DATA$PKG/TMS_CANDIDATES$612617'||wwv_flow.LF||
'    apex_da';
wwv_flow_imp.g_varchar2_table(4) := 'ta_install.load_supporting_object_data(p_table_name => ''TMS_CANDIDATES'', p_delete_after_install => t';
wwv_flow_imp.g_varchar2_table(5) := 'rue );'||wwv_flow.LF||
'    --TMS_DEPARTMENTS: 6/10000 rows exported, APEX$DATA$PKG/TMS_DEPARTMENTS$618933'||wwv_flow.LF||
'    apex';
wwv_flow_imp.g_varchar2_table(6) := '_data_install.load_supporting_object_data(p_table_name => ''TMS_DEPARTMENTS'', p_delete_after_install ';
wwv_flow_imp.g_varchar2_table(7) := '=> true );'||wwv_flow.LF||
'    --TMS_EMPLOYEES: 7/10000 rows exported, APEX$DATA$PKG/TMS_EMPLOYEES$403982'||wwv_flow.LF||
'    apex';
wwv_flow_imp.g_varchar2_table(8) := '_data_install.load_supporting_object_data(p_table_name => ''TMS_EMPLOYEES'', p_delete_after_install =>';
wwv_flow_imp.g_varchar2_table(9) := ' true );'||wwv_flow.LF||
'    --TMS_HR_POLICY: 8/10000 rows exported, APEX$DATA$PKG/TMS_HR_POLICY$42963'||wwv_flow.LF||
'    apex_da';
wwv_flow_imp.g_varchar2_table(10) := 'ta_install.load_supporting_object_data(p_table_name => ''TMS_HR_POLICY'', p_delete_after_install => tr';
wwv_flow_imp.g_varchar2_table(11) := 'ue );'||wwv_flow.LF||
'    --TMS_INTERVIEW_STAGES: 6/10000 rows exported, APEX$DATA$PKG/TMS_INTERVIEW_STAGES$99460'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(12) := '    apex_data_install.load_supporting_object_data(p_table_name => ''TMS_INTERVIEW_STAGES'', p_delete_a';
wwv_flow_imp.g_varchar2_table(13) := 'fter_install => true );'||wwv_flow.LF||
'    --TMS_JOBS: 10/10000 rows exported, APEX$DATA$PKG/TMS_JOBS$172409'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(14) := 'apex_data_install.load_supporting_object_data(p_table_name => ''TMS_JOBS'', p_delete_after_install => ';
wwv_flow_imp.g_varchar2_table(15) := 'true );'||wwv_flow.LF||
'    --TMS_JOB_REQUISITIONS: 6/10000 rows exported, APEX$DATA$PKG/TMS_JOB_REQUISITIONS$67479';
wwv_flow_imp.g_varchar2_table(16) := '1'||wwv_flow.LF||
'    apex_data_install.load_supporting_object_data(p_table_name => ''TMS_JOB_REQUISITIONS'', p_delet';
wwv_flow_imp.g_varchar2_table(17) := 'e_after_install => true );'||wwv_flow.LF||
'    --TMS_LEAVE_BALANCES: 10/10000 rows exported, APEX$DATA$PKG/TMS_LEAV';
wwv_flow_imp.g_varchar2_table(18) := 'E_BALANCES$786234'||wwv_flow.LF||
'    apex_data_install.load_supporting_object_data(p_table_name => ''TMS_LEAVE_BALA';
wwv_flow_imp.g_varchar2_table(19) := 'NCES'', p_delete_after_install => true );'||wwv_flow.LF||
'    --TMS_LEAVE_REQUESTS: 5/10000 rows exported, APEX$DATA';
wwv_flow_imp.g_varchar2_table(20) := '$PKG/TMS_LEAVE_REQUESTS$911612'||wwv_flow.LF||
'    apex_data_install.load_supporting_object_data(p_table_name => ''T';
wwv_flow_imp.g_varchar2_table(21) := 'MS_LEAVE_REQUESTS'', p_delete_after_install => true );'||wwv_flow.LF||
'    --TMS_LEAVE_TYPES: 5/10000 rows exported,';
wwv_flow_imp.g_varchar2_table(22) := ' APEX$DATA$PKG/TMS_LEAVE_TYPES$630859'||wwv_flow.LF||
'    apex_data_install.load_supporting_object_data(p_table_nam';
wwv_flow_imp.g_varchar2_table(23) := 'e => ''TMS_LEAVE_TYPES'', p_delete_after_install => true );'||wwv_flow.LF||
'    --TMS_OFFERS: 3/10000 rows exported, ';
wwv_flow_imp.g_varchar2_table(24) := 'APEX$DATA$PKG/TMS_OFFERS$917370'||wwv_flow.LF||
'    apex_data_install.load_supporting_object_data(p_table_name => ''';
wwv_flow_imp.g_varchar2_table(25) := 'TMS_OFFERS'', p_delete_after_install => true );'||wwv_flow.LF||
'    --TMS_ONBOARDING_TASKS: 5/10000 rows exported, A';
wwv_flow_imp.g_varchar2_table(26) := 'PEX$DATA$PKG/TMS_ONBOARDING_TASKS$933069'||wwv_flow.LF||
'    apex_data_install.load_supporting_object_data(p_table_';
wwv_flow_imp.g_varchar2_table(27) := 'name => ''TMS_ONBOARDING_TASKS'', p_delete_after_install => true );'||wwv_flow.LF||
'end;';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(44436552715144519)
,p_install_id=>wwv_flow_imp.id(44415762488135617)
,p_name=>'Data Package'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260714191955Z')
,p_updated_on=>wwv_flow_imp.dz('20260714191955Z')
,p_created_by=>'GENDEV'
,p_updated_by=>'GENDEV'
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
