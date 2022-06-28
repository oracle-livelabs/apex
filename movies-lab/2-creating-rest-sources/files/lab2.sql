prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_210200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.0'
,p_default_workspace_id=>13049315968741382764
,p_default_application_id=>38872
,p_default_id_offset=>10764394298153007312
,p_default_owner=>'WKSP_MOVIESHOL'
);
end;
/
 
prompt APPLICATION 38872 - Movies Watchlist
--
-- Application Export:
--   Application:     38872
--   Name:            Movies Watchlist
--   Date and Time:   15:50 Friday February 18, 2022
--   Exported By:     LOW_CODER
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                      3
--       Items:                    3
--       Processes:                4
--       Regions:                  3
--       Buttons:                  1
--     Shared Components:
--       Logic:
--       Navigation:
--         Lists:                  2
--         Breadcrumbs:            1
--           Entries:              1
--       Security:
--         Authentication:         1
--         Authorization:          1
--       User Interface:
--         Themes:                 1
--         Templates:
--           Page:                10
--           Region:              18
--           Label:                7
--           List:                13
--           Popup LOV:            1
--           Calendar:             1
--           Breadcrumb:           1
--           Button:               3
--           Report:              12
--         LOVs:                   1
--         Shortcuts:              1
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--   Version:         21.2.0
--   Instance ID:     63102946836549
--

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'WKSP_MOVIESHOL')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Movies Watchlist')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'MOVIES-WATCHLIST1')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'3A10B160D027097D5D181F6C2D4C07489FFD804A85A7BE61FC09E33C1618BE52'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'21.2'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Application created from create application wizard 2021.09.30.'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(25680132036272493677)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'Movies Watchlist'
,p_app_builder_icon_name=>'app-icon.svg'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Movies Watchlist'
,p_last_updated_by=>'LOW_CODER'
,p_last_upd_yyyymmddhh24miss=>'20220218155003'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>3
,p_ui_type_name => null
,p_print_server_type=>'INSTANCE'
,p_is_pwa=>'N'
);
end;
/
prompt --application/shared_components/remote_servers/api_themoviedb_org_3
begin
wwv_flow_api.create_remote_server(
 p_id=>wwv_flow_api.id(13347052679448605304)
,p_name=>'api-themoviedb-org-3'
,p_static_id=>'api_themoviedb_org_3'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('api_themoviedb_org_3'),'https://api.themoviedb.org/3/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('api_themoviedb_org_3'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('api_themoviedb_org_3'),'')
,p_prompt_on_install=>false
);
end;
/
prompt --application/shared_components/data_profiles/popular_movies
begin
wwv_flow_api.create_data_profile(
 p_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'Popular Movies'
,p_format=>'JSON'
,p_row_selector=>'results'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765547054635589640)
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'ID'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765547341408589641)
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'ADULT'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'adult'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765547640838589641)
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'TITLE'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'title'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765547979407589642)
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'VIDEO'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'video'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765548212659589642)
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'OVERVIEW'
,p_sequence=>5
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'overview'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765548554292589642)
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'POPULARITY'
,p_sequence=>6
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'popularity'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765548858753589642)
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'VOTE_COUNT'
,p_sequence=>7
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_count'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765549164503589642)
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'POSTER_PATH'
,p_sequence=>8
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'poster_path'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765549429225589643)
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'RELEASE_DATE'
,p_sequence=>9
,p_column_type=>'DATA'
,p_data_type=>'DATE'
,p_format_mask=>'YYYY"-"MM"-"DD'
,p_has_time_zone=>false
,p_selector=>'release_date'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765549749891589643)
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'VOTE_AVERAGE'
,p_sequence=>10
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_average'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765550039713589643)
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'BACKDROP_PATH'
,p_sequence=>11
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'backdrop_path'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765550341097589643)
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'ORIGINAL_TITLE'
,p_sequence=>12
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_title'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765550678449589644)
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'ORIGINAL_LANGUAGE'
,p_sequence=>13
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_language'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765619048223595485)
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_name=>'POSTER_URL'
,p_sequence=>23
,p_column_type=>'SQL_EXPRESSION'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>true
,p_is_filterable=>false
,p_transform_type=>'SQL_EXPRESSION'
,p_expression1=>'CONCAT(''https://image.tmdb.org/t/p/w500'', POSTER_PATH)'
);
end;
/
prompt --application/shared_components/data_profiles/search_movies
begin
wwv_flow_api.create_data_profile(
 p_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'Search Movies'
,p_format=>'JSON'
,p_row_selector=>'results'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765924195710627521)
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'ID'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765924447569627521)
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'ADULT'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'adult'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765924780152627522)
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'TITLE'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'title'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765925037065627522)
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'VIDEO'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'video'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765925343683627522)
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'OVERVIEW'
,p_sequence=>5
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'overview'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765925629812627522)
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'POPULARITY'
,p_sequence=>6
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'popularity'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765925985685627522)
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'VOTE_COUNT'
,p_sequence=>7
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_count'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765926238618627523)
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'POSTER_PATH'
,p_sequence=>8
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'poster_path'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765926544828627523)
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'RELEASE_DATE'
,p_sequence=>9
,p_column_type=>'DATA'
,p_data_type=>'DATE'
,p_format_mask=>'YYYY"-"MM"-"DD'
,p_has_time_zone=>false
,p_selector=>'release_date'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765926818248627523)
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'VOTE_AVERAGE'
,p_sequence=>10
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_average'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765927187458627523)
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'BACKDROP_PATH'
,p_sequence=>11
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'backdrop_path'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765927453504627524)
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'ORIGINAL_TITLE'
,p_sequence=>12
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_title'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765927739948627524)
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'ORIGINAL_LANGUAGE'
,p_sequence=>13
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_language'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(10765954586462631119)
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_name=>'POSTER_URL'
,p_sequence=>23
,p_column_type=>'SQL_EXPRESSION'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>true
,p_is_filterable=>false
,p_transform_type=>'SQL_EXPRESSION'
,p_expression1=>'CONCAT(''https://image.tmdb.org/t/p/w500'', POSTER_PATH)'
);
end;
/
prompt --application/shared_components/web_sources/popular_movies
begin
wwv_flow_api.create_web_source_module(
 p_id=>wwv_flow_api.id(10765550915598589652)
,p_name=>'Popular Movies'
,p_static_id=>'Popular_Movies'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_api.id(10765546806876589632)
,p_remote_server_id=>wwv_flow_api.id(13347052679448605304)
,p_url_path_prefix=>'movie/popular'
,p_attribute_05=>'1'
,p_attribute_08=>'OFFSET'
,p_attribute_10=>'EQUALS'
,p_attribute_11=>'true'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(10765551683067589660)
,p_web_src_module_id=>wwv_flow_api.id(10765550915598589652)
,p_name=>'api_key'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(10765552000487589661)
,p_web_src_module_id=>wwv_flow_api.id(10765550915598589652)
,p_name=>'language'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'en-US'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(10765552430351589661)
,p_web_src_module_id=>wwv_flow_api.id(10765550915598589652)
,p_name=>'page'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'1'
);
wwv_flow_api.create_web_source_operation(
 p_id=>wwv_flow_api.id(10765551205463589656)
,p_web_src_module_id=>wwv_flow_api.id(10765550915598589652)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
end;
/
prompt --application/shared_components/web_sources/search_movies
begin
wwv_flow_api.create_web_source_module(
 p_id=>wwv_flow_api.id(10765928077487627529)
,p_name=>'Search Movies'
,p_static_id=>'Search_Movies'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_api.id(10765923909893627513)
,p_remote_server_id=>wwv_flow_api.id(13347052679448605304)
,p_url_path_prefix=>'search/movie'
,p_attribute_01=>'PAGE_NUMBER_FIXED_SIZE'
,p_attribute_04=>'page'
,p_attribute_05=>'1'
,p_attribute_06=>'20'
,p_attribute_08=>'OFFSET'
,p_attribute_10=>'EQUALS'
,p_attribute_11=>'true'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(10765928762431627542)
,p_web_src_module_id=>wwv_flow_api.id(10765928077487627529)
,p_name=>'api_key'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(10765929100143627543)
,p_web_src_module_id=>wwv_flow_api.id(10765928077487627529)
,p_name=>'language'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'en-US'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(10765929505453627544)
,p_web_src_module_id=>wwv_flow_api.id(10765928077487627529)
,p_name=>'query'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'harry potter'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(10765929908479627544)
,p_web_src_module_id=>wwv_flow_api.id(10765928077487627529)
,p_name=>'include_adult'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'false'
);
wwv_flow_api.create_web_source_operation(
 p_id=>wwv_flow_api.id(10765928261738627535)
,p_web_src_module_id=>wwv_flow_api.id(10765928077487627529)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_legacy_ords_fixed_page_size=>20
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(25680132808916493678)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(25680290835064494043)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'My Watchlist'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:'
,p_list_item_icon=>'fa-film'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_bar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(25680280621459493952)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(25680292586042494077)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(25680293148883494078)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(25680292586042494077)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(25680293526585494079)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(25680292586042494077)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files/app_icon_svg
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '3C73766720786D6C6E733D22687474703A2F2F7777772E77332E6F72672F323030302F737667222076696577426F783D22302030203634203634222077696474683D22363422206865696768743D223634223E3C726563742077696474683D2231303025';
wwv_flow_api.g_varchar2_table(2) := '22206865696768743D2231303025222066696C6C3D222345393542353422202F3E3C7061746820643D224D33322031376131352031352030203120302031352031352031352E3031372031352E3031372030203020302D31352D31357A6D302032396131';
wwv_flow_api.g_varchar2_table(3) := '342031342030203120312031342D31342031342E3031362031342E3031362030203020312D31342031347A22206F7061636974793D222E32222F3E3C7061746820643D224D33372E3520333061312E3520312E352030203120302D312E352D312E352031';
wwv_flow_api.g_varchar2_table(4) := '2E35303220312E35303220302030203020312E3520312E357A6D2D3131203061312E3520312E352030203120302D312E352D312E3520312E35303220312E35303220302030203020312E3520312E357A6D31322E3937352033682D31342E3935612E352E';
wwv_flow_api.g_varchar2_table(5) := '352030203020302D2E3439392E35333320372E393920372E39392030203020302031352E3934382030202E352E352030203020302D2E352D2E3533337A4D333220343061362E39393520362E3939352030203020312D352E3732382D336831312E343536';
wwv_flow_api.g_varchar2_table(6) := '41362E39393520362E3939352030203020312033322034307A6D362E33312D344832352E363961362E393220362E39322030203020312D2E36312D326831332E383461362E393220362E39322030203020312D2E363120327A22206F7061636974793D22';
wwv_flow_api.g_varchar2_table(7) := '2E32222F3E3C7061746820643D224D33382E33312033364832352E363961362E393220362E39322030203020312D2E36312D326831332E383461362E393220362E39322030203020312D2E363120327A222066696C6C3D222366636662666122206F7061';
wwv_flow_api.g_varchar2_table(8) := '636974793D222E39222F3E3C7061746820643D224D33322031386131342031342030203120302031342031342031342E3031362031342E3031362030203020302D31342D31347A6D2D352E35203961312E3520312E352030203120312D312E3520312E35';
wwv_flow_api.g_varchar2_table(9) := '20312E35303220312E35303220302030203120312E352D312E357A6D3131203061312E3520312E352030203120312D312E3520312E3520312E35303220312E35303220302030203120312E352D312E357A4D333220343161382E30313120382E30313120';
wwv_flow_api.g_varchar2_table(10) := '30203020312D372E3937342D372E3436372E352E35203020302031202E352D2E3533336831342E393439612E352E35203020302031202E3439392E35333341382E30313120382E3031312030203020312033322034317A222066696C6C3D222366636662';
wwv_flow_api.g_varchar2_table(11) := '666122206F7061636974793D222E36222F3E3C7061746820643D224D333220343061362E39393520362E3939352030203020312D352E3732382D336831312E34353641362E39393520362E3939352030203020312033322034307A222066696C6C3D2223';
wwv_flow_api.g_varchar2_table(12) := '66636662666122206F7061636974793D222E32222F3E3C2F7376673E';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(25680281986886493972)
,p_file_name=>'app-icon.svg'
,p_mime_type=>'image/svg+xml'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/app_icon_css
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E6170702D69636F6E207B0A202020206261636B67726F756E642D696D6167653A2075726C286170702D69636F6E2E737667293B0A202020206261636B67726F756E642D7265706561743A206E6F2D7265706561743B0A202020206261636B67726F756E';
wwv_flow_api.g_varchar2_table(2) := '642D73697A653A20636F7665723B0A202020206261636B67726F756E642D706F736974696F6E3A203530253B0A202020206261636B67726F756E642D636F6C6F723A20234539354235343B0A7D';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(25680282226298493973)
,p_file_name=>'app-icon.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(10764394653466007333)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_attribute_02=>'N'
,p_attribute_03=>'POPUP:ITEM'
,p_attribute_04=>'default'
,p_attribute_06=>'LIST'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(25680129332187493673)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'FULL'
,p_attribute_02=>'POPUP'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(25680129670425493674)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_JET'
,p_attribute_01=>'MONTH-PICKER:YEAR-PICKER'
,p_attribute_02=>'VISIBLE'
,p_attribute_03=>'15'
,p_attribute_04=>'FOCUS'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(25680129987879493674)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_RICH_TEXT_EDITOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(25680130271414493675)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(25680130506452493675)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attribute_01=>'fa-star'
,p_attribute_04=>'#VALUE#'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(25680130836714493675)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SWITCH_CB'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(25680131154577493676)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(25680131487779493676)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(25680131797201493677)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attribute_01=>'IG'
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(25680283532503493976)
,p_name=>'Administration Rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return true;'
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
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
prompt --application/shared_components/user_interface/lovs/login_remember_username
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(25680286074787494018)
,p_lov_name=>'LOGIN_REMEMBER_USERNAME'
,p_lov_query=>'.'||wwv_flow_api.id(25680286074787494018)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(25680286480675494019)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Remember username'
,p_lov_return_value=>'Y'
);
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(25680284063480493982)
,p_group_name=>'Administration'
);
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(25680132355044493677)
,p_name=>'Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(25680132546265493678)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
end;
/
prompt --application/shared_components/navigation/breadcrumbentry
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/page/drawer
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(10764947309376568887)
,p_theme_id=>42
,p_name=>'Drawer'
,p_internal_name=>'DRAWER'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Drawer-page t-PageTemplate--drawer #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Drawer" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Drawer-header">#REGION_POSITION_01#</div>',
'  <div class="t-Drawer-bodyWrapperOut">',
'    <div class="t-Drawer-bodyWrapperIn">',
'      <div class="t-Drawer-body" role="main">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION##BODY#</div>',
'    </div>',
'  </div>',
'  <div class="t-Drawer-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>11
,p_preset_template_options=>'js-dialog-class-t-Drawer--pullOutEnd'
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_js_init_code=>'apex.theme42.dialog(#PAGE_URL#,{title:#TITLE#,w:#DIALOG_WIDTH#,mxw:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,dlgCls:''t-Drawer-page--standard ''+#DIALOG_CSS_CLASSES#,#DIALOG_ATTRIBUTES#},#PAGE_CSS_CLASSES#,#TRIGGERING_ELEMENT#)'
,p_dialog_js_close_code=>'apex.theme42.dialog.close(#IS_MODAL#,#TARGET#)'
,p_dialog_js_cancel_code=>'apex.theme42.dialog.cancel(#IS_MODAL#)'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1659739787629394056
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764948772432568895)
,p_page_template_id=>wwv_flow_api.id(10764947309376568887)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764949571713568896)
,p_page_template_id=>wwv_flow_api.id(10764947309376568887)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764950219441568896)
,p_page_template_id=>wwv_flow_api.id(10764947309376568887)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(25680133132341493680)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_internal_name=>'LEFT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft t-PageBody--hideActions no-anim t-PageTemplate--leftCol #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." title="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." id="t_Button_navControl" type="button"><span class="t-Header-'
||'controlsIcon" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'      #AFTER_LOGO#',
'    </div>',
'    <div class="t-Header-navBar">',
'      <div class="t-Header-navBar--start">#BEFORE_NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--center">#NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--end">#AFTER_NAVIGATION_BAR#</div>',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-side" id="t_Body_side">#REGION_POSITION_02#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main class="t-Body-mainContent" id="main">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" id="t_Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs" id="t_Body_inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764882189174568816)
,p_page_template_id=>wwv_flow_api.id(25680133132341493680)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764882554589568816)
,p_page_template_id=>wwv_flow_api.id(25680133132341493680)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764883039063568817)
,p_page_template_id=>wwv_flow_api.id(25680133132341493680)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764883593908568817)
,p_page_template_id=>wwv_flow_api.id(25680133132341493680)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764884099105568818)
,p_page_template_id=>wwv_flow_api.id(25680133132341493680)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764884522695568818)
,p_page_template_id=>wwv_flow_api.id(25680133132341493680)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764885061871568818)
,p_page_template_id=>wwv_flow_api.id(25680133132341493680)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764885521201568819)
,p_page_template_id=>wwv_flow_api.id(25680133132341493680)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764886073469568819)
,p_page_template_id=>wwv_flow_api.id(25680133132341493680)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764886548800568819)
,p_page_template_id=>wwv_flow_api.id(25680133132341493680)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764887038441568820)
,p_page_template_id=>wwv_flow_api.id(25680133132341493680)
,p_name=>'Full Width Content'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_and_right_side_columns
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(25680135917086493699)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_internal_name=>'LEFT_AND_RIGHT_SIDE_COLUMNS'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft no-anim t-PageTemplate--leftRightCol #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<script>(sessionStorage.getItem("right.&APP_ID..&APP_PAGE_ID..preferenceForExpanded") === "true") ? document.getElementById(''t_PageBody'').classList.add(''js-rightExpanded'') : document.getElementById(''t_PageBody'').classList.add(''js-rightCollapsed'')</sc'
||'ript>',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." title="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." id="t_Button_navControl" type="button"><span class="t-Header-'
||'controlsIcon" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'      #AFTER_LOGO#',
'    </div>',
'    <div class="t-Header-navBar">',
'      <div class="t-Header-navBar--start">#BEFORE_NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--center">#NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--end">#AFTER_NAVIGATION_BAR#</div>',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-side" id="t_Body_side">#REGION_POSITION_02#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" id="t_Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs" id="t_Body_inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764891920223568835)
,p_page_template_id=>wwv_flow_api.id(25680135917086493699)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764892481661568835)
,p_page_template_id=>wwv_flow_api.id(25680135917086493699)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764892995854568835)
,p_page_template_id=>wwv_flow_api.id(25680135917086493699)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764893460411568836)
,p_page_template_id=>wwv_flow_api.id(25680135917086493699)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764893904446568836)
,p_page_template_id=>wwv_flow_api.id(25680135917086493699)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764894459002568836)
,p_page_template_id=>wwv_flow_api.id(25680135917086493699)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764894973532568837)
,p_page_template_id=>wwv_flow_api.id(25680135917086493699)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764895499820568837)
,p_page_template_id=>wwv_flow_api.id(25680135917086493699)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764895953752568837)
,p_page_template_id=>wwv_flow_api.id(25680135917086493699)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764896490019568838)
,p_page_template_id=>wwv_flow_api.id(25680135917086493699)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764896980468568838)
,p_page_template_id=>wwv_flow_api.id(25680135917086493699)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764897474842568838)
,p_page_template_id=>wwv_flow_api.id(25680135917086493699)
,p_name=>'Full Width Content'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
end;
/
prompt --application/shared_components/user_interface/templates/page/minimal_no_navigation
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(25680139082823493703)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_internal_name=>'MINIMAL_NO_NAVIGATION'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES# t-PageBody--noNav t-PageTemplate--minimal" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"'
||'></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'      #AFTER_LOGO#',
'    </div>',
'    <div class="t-Header-navBar">',
'      <div class="t-Header-navBar--start">#BEFORE_NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--center">#NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--end">#AFTER_NAVIGATION_BAR#</div>',
'    </div>',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" id="t_Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs" id="t_Body_inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764932691080568874)
,p_page_template_id=>wwv_flow_api.id(25680139082823493703)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764933199053568874)
,p_page_template_id=>wwv_flow_api.id(25680139082823493703)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764933600149568875)
,p_page_template_id=>wwv_flow_api.id(25680139082823493703)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764934188167568875)
,p_page_template_id=>wwv_flow_api.id(25680139082823493703)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764934667614568875)
,p_page_template_id=>wwv_flow_api.id(25680139082823493703)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764935115097568876)
,p_page_template_id=>wwv_flow_api.id(25680139082823493703)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764935694313568876)
,p_page_template_id=>wwv_flow_api.id(25680139082823493703)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764936157977568876)
,p_page_template_id=>wwv_flow_api.id(25680139082823493703)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764936602837568877)
,p_page_template_id=>wwv_flow_api.id(25680139082823493703)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764937149642568877)
,p_page_template_id=>wwv_flow_api.id(25680139082823493703)
,p_name=>'Full Width Content'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/page/right_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(25680141581320493705)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_internal_name=>'RIGHT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8"> ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft no-anim t-PageTemplate--rightSideCol #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<script>(sessionStorage.getItem("right.&APP_ID..&APP_PAGE_ID..preferenceForExpanded") === "true") ? document.getElementById(''t_PageBody'').classList.add(''js-rightExpanded'') : document.getElementById(''t_PageBody'').classList.add(''js-rightCollapsed'')</sc'
||'ript>',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." title="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." id="t_Button_navControl" type="button"><span class="t-Header-'
||'controlsIcon" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'      #AFTER_LOGO#',
'    </div>',
'    <div class="t-Header-navBar">',
'      <div class="t-Header-navBar--start">#BEFORE_NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--center">#NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--end">#AFTER_NAVIGATION_BAR#</div>',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" id="t_Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" aria-label="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button'
||'>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs" id="t_Body_inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764941413282568881)
,p_page_template_id=>wwv_flow_api.id(25680141581320493705)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764941954166568882)
,p_page_template_id=>wwv_flow_api.id(25680141581320493705)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764942463166568882)
,p_page_template_id=>wwv_flow_api.id(25680141581320493705)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764942909060568882)
,p_page_template_id=>wwv_flow_api.id(25680141581320493705)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764943433024568883)
,p_page_template_id=>wwv_flow_api.id(25680141581320493705)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764944093739568883)
,p_page_template_id=>wwv_flow_api.id(25680141581320493705)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764944547266568883)
,p_page_template_id=>wwv_flow_api.id(25680141581320493705)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764945191426568884)
,p_page_template_id=>wwv_flow_api.id(25680141581320493705)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764945652551568884)
,p_page_template_id=>wwv_flow_api.id(25680141581320493705)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764946153074568885)
,p_page_template_id=>wwv_flow_api.id(25680141581320493705)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764946671967568885)
,p_page_template_id=>wwv_flow_api.id(25680141581320493705)
,p_name=>'Full Width Content'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/standard
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(25680144433759493709)
,p_theme_id=>42
,p_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim t-PageTemplate--standard #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." title="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." id="t_Button_navControl" type="button"><span class="t-Header-'
||'controlsIcon" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'      #AFTER_LOGO#',
'    </div>',
'    <div class="t-Header-navBar">',
'      <div class="t-Header-navBar--start">#BEFORE_NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--center">#NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--end">#AFTER_NAVIGATION_BAR#</div>',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" id="t_Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs" id="t_Body_inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764917039904568859)
,p_page_template_id=>wwv_flow_api.id(25680144433759493709)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764917522309568859)
,p_page_template_id=>wwv_flow_api.id(25680144433759493709)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764918031214568860)
,p_page_template_id=>wwv_flow_api.id(25680144433759493709)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764918518494568860)
,p_page_template_id=>wwv_flow_api.id(25680144433759493709)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764919059583568860)
,p_page_template_id=>wwv_flow_api.id(25680144433759493709)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764919570337568861)
,p_page_template_id=>wwv_flow_api.id(25680144433759493709)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764920055638568861)
,p_page_template_id=>wwv_flow_api.id(25680144433759493709)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764920584817568861)
,p_page_template_id=>wwv_flow_api.id(25680144433759493709)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764921027302568862)
,p_page_template_id=>wwv_flow_api.id(25680144433759493709)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764921559965568862)
,p_page_template_id=>wwv_flow_api.id(25680144433759493709)
,p_name=>'Full Width Content'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/page/wizard_modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(25680146979333493712)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_internal_name=>'WIZARD_MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--wizard t-PageTemplate--wizard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'    <div class="t-Dialog-bodyWrapperIn">',
'      <div class="t-Dialog-body" role="main">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION##BODY#</div>',
'    </div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--wizard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764923886270568865)
,p_page_template_id=>wwv_flow_api.id(25680146979333493712)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764924331662568866)
,p_page_template_id=>wwv_flow_api.id(25680146979333493712)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764924880110568866)
,p_page_template_id=>wwv_flow_api.id(25680146979333493712)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/login
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(25680148454811493714)
,p_theme_id=>42
,p_name=>'Login'
,p_internal_name=>'LOGIN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody--login t-PageTemplate--login no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Login-container">',
'  <header class="t-Login-containerHeader">#REGION_POSITION_01#</header>',
'  <main class="t-Login-containerBody" id="main">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION##BODY#</main>',
'  <footer class="t-Login-containerFooter">#REGION_POSITION_02#</footer>',
'</div>',
''))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764899712527568842)
,p_page_template_id=>wwv_flow_api.id(25680148454811493714)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764900284552568842)
,p_page_template_id=>wwv_flow_api.id(25680148454811493714)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764900727525568842)
,p_page_template_id=>wwv_flow_api.id(25680148454811493714)
,p_name=>'Body Footer'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/master_detail
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(25680150731836493719)
,p_theme_id=>42
,p_name=>'Marquee'
,p_internal_name=>'MASTER_DETAIL'
,p_is_popup=>false
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'))
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--masterDetail t-PageBody--hideLeft no-anim t-PageTemplate--marquee #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<script>(sessionStorage.getItem("right.&APP_ID..&APP_PAGE_ID..preferenceForExpanded") === "true") ? document.getElementById(''t_PageBody'').classList.add(''js-rightExpanded'') : document.getElementById(''t_PageBody'').classList.add(''js-rightCollapsed'')</sc'
||'ript>',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." title="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." id="t_Button_navControl" type="button"><span class="t-Header-'
||'controlsIcon" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'      #AFTER_LOGO#',
'    </div>',
'    <div class="t-Header-navBar">',
'      <div class="t-Header-navBar--start">#BEFORE_NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--center">#NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--end">#AFTER_NAVIGATION_BAR#</div>',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-info" id="t_Body_info">#REGION_POSITION_02#</div>',
'        <div class="t-Body-contentInner" role="main">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" id="t_Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs" id="t_Body_inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764907500344568851)
,p_page_template_id=>wwv_flow_api.id(25680150731836493719)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764908053060568851)
,p_page_template_id=>wwv_flow_api.id(25680150731836493719)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764908597813568851)
,p_page_template_id=>wwv_flow_api.id(25680150731836493719)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764909036242568852)
,p_page_template_id=>wwv_flow_api.id(25680150731836493719)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764909583690568852)
,p_page_template_id=>wwv_flow_api.id(25680150731836493719)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764910002813568852)
,p_page_template_id=>wwv_flow_api.id(25680150731836493719)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764910541803568853)
,p_page_template_id=>wwv_flow_api.id(25680150731836493719)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764911071326568853)
,p_page_template_id=>wwv_flow_api.id(25680150731836493719)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764911582474568853)
,p_page_template_id=>wwv_flow_api.id(25680150731836493719)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764912046032568854)
,p_page_template_id=>wwv_flow_api.id(25680150731836493719)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764912505908568854)
,p_page_template_id=>wwv_flow_api.id(25680150731836493719)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764913041243568854)
,p_page_template_id=>wwv_flow_api.id(25680150731836493719)
,p_name=>'Full Width Content'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(25680153856093493722)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_internal_name=>'MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--standard t-PageTemplate--dialog #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'    <div class="t-Dialog-bodyWrapperIn">',
'      <div class="t-Dialog-body" role="main">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION##BODY#</div>',
'    </div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_js_init_code=>'apex.theme42.dialog(#PAGE_URL#,{title:#TITLE#,h:#DIALOG_HEIGHT#,w:#DIALOG_WIDTH#,mxw:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,dlgCls:''t-Dialog-page--standard ''+#DIALOG_CSS_CLASSES#,#DIALOG_ATTRIBUTES#},#PAGE_CSS_CLASSES#,#TRIGGERING_ELEMEN'
||'T#)'
,p_dialog_js_close_code=>'apex.theme42.dialog.close(#IS_MODAL#,#TARGET#)'
,p_dialog_js_cancel_code=>'apex.theme42.dialog.cancel(#IS_MODAL#)'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2098960803539086924
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764927449570568869)
,p_page_template_id=>wwv_flow_api.id(25680153856093493722)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764927973993568870)
,p_page_template_id=>wwv_flow_api.id(25680153856093493722)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764928434130568870)
,p_page_template_id=>wwv_flow_api.id(25680153856093493722)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/button/icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(25680255368198493876)
,p_template_name=>'Icon'
,p_internal_name=>'ICON'
,p_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidde'
||'n="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#"><span class="t-Icon #ICON_CSS_CLASSE'
||'S#" aria-hidden="true"></span></button>'
,p_reference_id=>2347660919680321258
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(25680256075260493879)
,p_template_name=>'Text'
,p_internal_name=>'TEXT'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text_with_icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(25680256147431493879)
,p_template_name=>'Text with Icon'
,p_internal_name=>'TEXT_WITH_ICON'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>2081382742158699622
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconLeft'
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_drawer
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(10765147952252569121)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'  <div id="#REGION_STATIC_ID#" class="t-DrawerRegion js-dialog-class-ui-dialog--drawer #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE!ATTR#">',
'    <div class="t-DrawerRegion-wrap">',
'      <div class="t-DrawerRegion-bodyWrapperOut">',
'        <div class="t-DrawerRegion-bodyWrapperIn">',
'          <div class="t-DrawerRegion-body">#BODY##SUB_REGIONS#</div>',
'        </div>',
'      </div>',
'      <div class="t-DrawerRegion-buttons">',
'        <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'          <div class="t-ButtonRegion-wrap">',
'            <div class="t-ButtonRegion-col t-ButtonRegion-col--left">',
'              <div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div>',
'            </div>',
'            <div class="t-ButtonRegion-col t-ButtonRegion-col--right">',
'              <div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div>',
'            </div>',
'          </div>',
'        </div>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Inline Drawer'
,p_internal_name=>'INLINE_DRAWER'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal'
,p_preset_template_options=>'js-dialog-class-t-Drawer--pullOutEnd'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>1659526333647509386
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765148424434569125)
,p_plug_template_id=>wwv_flow_api.id(10765147952252569121)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765148970489569125)
,p_plug_template_id=>wwv_flow_api.id(10765147952252569121)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765149472015569126)
,p_plug_template_id=>wwv_flow_api.id(10765147952252569121)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765149995499569126)
,p_plug_template_id=>wwv_flow_api.id(10765147952252569121)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765150450755569126)
,p_plug_template_id=>wwv_flow_api.id(10765147952252569121)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765150963132569127)
,p_plug_template_id=>wwv_flow_api.id(10765147952252569121)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765151400732569127)
,p_plug_template_id=>wwv_flow_api.id(10765147952252569121)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765151995561569128)
,p_plug_template_id=>wwv_flow_api.id(10765147952252569121)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/alert
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680155363231493726)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading" data-apex-heading>#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">#BODY##SUB_REGIONS#</div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_internal_name=>'ALERT'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2039236646100190748
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764957263331568918)
,p_plug_template_id=>wwv_flow_api.id(25680155363231493726)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764957709700568918)
,p_plug_template_id=>wwv_flow_api.id(25680155363231493726)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764958273210568919)
,p_plug_template_id=>wwv_flow_api.id(25680155363231493726)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764958720386568919)
,p_plug_template_id=>wwv_flow_api.id(25680155363231493726)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764959203467568919)
,p_plug_template_id=>wwv_flow_api.id(25680155363231493726)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764959756867568920)
,p_plug_template_id=>wwv_flow_api.id(25680155363231493726)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680159079337493738)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">#PREVIOUS##BODY##SUB_REGIONS##NEXT#</div>'
,p_page_plug_template_name=>'Blank with Attributes'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764969097053568934)
,p_plug_template_id=>wwv_flow_api.id(25680159079337493738)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764969531080568934)
,p_plug_template_id=>wwv_flow_api.id(25680159079337493738)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764970035075568935)
,p_plug_template_id=>wwv_flow_api.id(25680159079337493738)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764970560161568935)
,p_plug_template_id=>wwv_flow_api.id(25680159079337493738)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes_no_grid
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680159232602493738)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">#PREVIOUS##BODY##SUB_REGIONS##NEXT#</div>'
,p_page_plug_template_name=>'Blank with Attributes (No Grid)'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES_NO_GRID'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3369790999010910123
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764972901990568938)
,p_plug_template_id=>wwv_flow_api.id(25680159232602493738)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764973409755568939)
,p_plug_template_id=>wwv_flow_api.id(25680159232602493738)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764973976380568939)
,p_plug_template_id=>wwv_flow_api.id(25680159232602493738)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764974452594568939)
,p_plug_template_id=>wwv_flow_api.id(25680159232602493738)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/buttons_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680160044196493739)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-ButtonRegion t-Form--floatLeft #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ButtonRegion-wrap">',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##CLOSE##DELETE#</div></div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--content">',
'      #BODY#',
'      <div class="t-ButtonRegion-buttons">#CHANGE#</div>',
'      #SUB_REGIONS#',
'    </div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Buttons Container'
,p_internal_name=>'BUTTONS_CONTAINER'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2124982336649579661
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764978878188568944)
,p_plug_template_id=>wwv_flow_api.id(25680160044196493739)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764979348997568944)
,p_plug_template_id=>wwv_flow_api.id(25680160044196493739)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764979894133568945)
,p_plug_template_id=>wwv_flow_api.id(25680160044196493739)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764980350440568945)
,p_plug_template_id=>wwv_flow_api.id(25680160044196493739)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764980830072568945)
,p_plug_template_id=>wwv_flow_api.id(25680160044196493739)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764981372995568946)
,p_plug_template_id=>wwv_flow_api.id(25680160044196493739)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764981898804568946)
,p_plug_template_id=>wwv_flow_api.id(25680160044196493739)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764982323426568946)
,p_plug_template_id=>wwv_flow_api.id(25680160044196493739)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764982829185568947)
,p_plug_template_id=>wwv_flow_api.id(25680160044196493739)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/cards_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680162295480493741)
,p_layout=>'TABLE'
,p_template=>'<div role="region" aria-label="#TITLE!ATTR#" class="t-CardsRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY##SUB_REGIONS#</div>'
,p_page_plug_template_name=>'Cards Container'
,p_internal_name=>'CARDS_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>21
,p_default_template_options=>'u-colors'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2071277712695139743
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764987224062568952)
,p_plug_template_id=>wwv_flow_api.id(25680162295480493741)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764987764742568952)
,p_plug_template_id=>wwv_flow_api.id(25680162295480493741)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/carousel_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680163202257493742)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Region-header">',
'    <div class="t-Region-headerItems t-Region-headerItems--title">',
'      <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'      <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading" data-apex-heading>#TITLE#</h2>',
'    </div>',
'    <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
'  </div>',
'  <div role="region" aria-label="#TITLE#" class="t-Region-bodyWrap">',
'    <div class="t-Region-buttons t-Region-buttons--top">',
'      <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'      <div class="t-Region-buttons-right">#NEXT#</div>',
'    </div>',
'    <div class="t-Region-body">',
'      #BODY#',
'      <div class="t-Region-carouselRegions">#SUB_REGIONS#</div>',
'    </div>',
'    <div class="t-Region-buttons t-Region-buttons--bottom">',
'      <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'      <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'    </div>',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_internal_name=>'CAROUSEL_CONTAINER'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.1/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#'))
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2865840475322558786
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764995166165568960)
,p_plug_template_id=>wwv_flow_api.id(25680163202257493742)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764995670398568960)
,p_plug_template_id=>wwv_flow_api.id(25680163202257493742)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764996132728568961)
,p_plug_template_id=>wwv_flow_api.id(25680163202257493742)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764996681405568961)
,p_plug_template_id=>wwv_flow_api.id(25680163202257493742)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764997126221568961)
,p_plug_template_id=>wwv_flow_api.id(25680163202257493742)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764997632200568962)
,p_plug_template_id=>wwv_flow_api.id(25680163202257493742)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764998100444568962)
,p_plug_template_id=>wwv_flow_api.id(25680163202257493742)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764998696326568962)
,p_plug_template_id=>wwv_flow_api.id(25680163202257493742)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764999173524568963)
,p_plug_template_id=>wwv_flow_api.id(25680163202257493742)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10764999619019568963)
,p_plug_template_id=>wwv_flow_api.id(25680163202257493742)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765000195365568963)
,p_plug_template_id=>wwv_flow_api.id(25680163202257493742)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/content_block
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680170526868493751)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-ContentBlock #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ContentBlock-header">',
'    <div class="t-ContentBlock-headerItems t-ContentBlock-headerItems--title">',
'      <span class="t-ContentBlock-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'      <h1 class="t-ContentBlock-title" id="#REGION_STATIC_ID#_heading" data-apex-heading>#TITLE#</h1>',
'      #EDIT#',
'    </div>',
'    <div class="t-ContentBlock-headerItems t-ContentBlock-headerItems--buttons">#CHANGE#</div>',
'  </div>',
'  <div class="t-ContentBlock-body">#BODY##SUB_REGIONS#</div>',
'  <div class="t-ContentBlock-buttons">#PREVIOUS##NEXT#</div>',
'</div>',
''))
,p_page_plug_template_name=>'Content Block'
,p_internal_name=>'CONTENT_BLOCK'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-ContentBlock--h1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2320668864738842174
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765043573825569014)
,p_plug_template_id=>wwv_flow_api.id(25680170526868493751)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765043918545569014)
,p_plug_template_id=>wwv_flow_api.id(25680170526868493751)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765044452232569014)
,p_plug_template_id=>wwv_flow_api.id(25680170526868493751)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765044980631569015)
,p_plug_template_id=>wwv_flow_api.id(25680170526868493751)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765045423606569015)
,p_plug_template_id=>wwv_flow_api.id(25680170526868493751)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765045943851569015)
,p_plug_template_id=>wwv_flow_api.id(25680170526868493751)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_popup
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680172898635493753)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#" class="t-DialogRegion #REGION_CSS_CLASSES# js-regionPopup" #REGION_ATTRIBUTES# style="display:none" title="#TITLE!ATTR#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY##SUB_REGIONS#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Popup'
,p_internal_name=>'INLINE_POPUP'
,p_theme_id=>42
,p_theme_class_id=>24
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>1483922538999385230
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765073854450569043)
,p_plug_template_id=>wwv_flow_api.id(25680172898635493753)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765074345967569044)
,p_plug_template_id=>wwv_flow_api.id(25680172898635493753)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765074825342569044)
,p_plug_template_id=>wwv_flow_api.id(25680172898635493753)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765075399122569044)
,p_plug_template_id=>wwv_flow_api.id(25680172898635493753)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765075831784569045)
,p_plug_template_id=>wwv_flow_api.id(25680172898635493753)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765076382808569046)
,p_plug_template_id=>wwv_flow_api.id(25680172898635493753)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765076899017569046)
,p_plug_template_id=>wwv_flow_api.id(25680172898635493753)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765077312388569046)
,p_plug_template_id=>wwv_flow_api.id(25680172898635493753)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/interactive_report
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680176452434493757)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#">#PREVIOUS##BODY##SUB_REGIONS##NEXT#</div>',
''))
,p_page_plug_template_name=>'Interactive Report'
,p_internal_name=>'INTERACTIVE_REPORT'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765086497403569057)
,p_plug_template_id=>wwv_flow_api.id(25680176452434493757)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765086975594569058)
,p_plug_template_id=>wwv_flow_api.id(25680176452434493757)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765087464567569058)
,p_plug_template_id=>wwv_flow_api.id(25680176452434493757)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765087908134569058)
,p_plug_template_id=>wwv_flow_api.id(25680176452434493757)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/login
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680177063070493759)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Login-header">',
'    <span class="t-Login-logo #ICON_CSS_CLASSES#" aria-hidden="true"></span>',
'    <h1 class="t-Login-title" id="#REGION_STATIC_ID#_heading" data-apex-heading>#TITLE#</h1>',
'  </div>',
'  <div class="t-Login-body">#BODY#</div>',
'  <div class="t-Login-buttons">#NEXT#</div>',
'  <div class="t-Login-links">#EDIT##CREATE#</div>',
'  <div class="t-Login-subRegions">#SUB_REGIONS#</div>',
'</div>'))
,p_page_plug_template_name=>'Login'
,p_internal_name=>'LOGIN'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765091320555569063)
,p_plug_template_id=>wwv_flow_api.id(25680177063070493759)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765091857098569064)
,p_plug_template_id=>wwv_flow_api.id(25680177063070493759)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765092365879569064)
,p_plug_template_id=>wwv_flow_api.id(25680177063070493759)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765092824051569064)
,p_plug_template_id=>wwv_flow_api.id(25680177063070493759)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765093369081569065)
,p_plug_template_id=>wwv_flow_api.id(25680177063070493759)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/collapsible
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680178334212493760)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!HTML#" class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--controls"><span class="t-Button t-Button--icon t-Button--hideShow"><span class="a-Icon _a-Collapsible-icon" aria-hidden="true"></span></span></div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title" data-apex-heading><button class="t-Region-titleButton" type="button">#TITLE#</button></h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_internal_name=>'COLLAPSIBLE'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2662888092628347716
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765018678621568985)
,p_plug_template_id=>wwv_flow_api.id(25680178334212493760)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765019164063568986)
,p_plug_template_id=>wwv_flow_api.id(25680178334212493760)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765019633604568987)
,p_plug_template_id=>wwv_flow_api.id(25680178334212493760)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765020178403568987)
,p_plug_template_id=>wwv_flow_api.id(25680178334212493760)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765020611319568987)
,p_plug_template_id=>wwv_flow_api.id(25680178334212493760)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765021159958568988)
,p_plug_template_id=>wwv_flow_api.id(25680178334212493760)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765021649571568988)
,p_plug_template_id=>wwv_flow_api.id(25680178334212493760)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765022261711568989)
,p_plug_template_id=>wwv_flow_api.id(25680178334212493760)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765022742323568989)
,p_plug_template_id=>wwv_flow_api.id(25680178334212493760)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/hero
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680186090818493769)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-top">',
'    <div class="t-HeroRegion-wrap">',
'      <div class="t-HeroRegion-col t-HeroRegion-col--left"><span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
'      <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'        <h1 class="t-HeroRegion-title" data-apex-heading>#TITLE#</h1>',
'        #BODY#',
'      </div>',
'      <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form">#SUB_REGIONS#</div><div class="t-HeroRegion-buttons">#NEXT#</div></div>',
'    </div>',
'  </div>',
'  <div class="t-HeroRegion-bottom">#SMART_FILTERS#</div>',
'</div>',
''))
,p_page_plug_template_name=>'Hero'
,p_internal_name=>'HERO'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765052233949569023)
,p_plug_template_id=>wwv_flow_api.id(25680186090818493769)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765052765235569024)
,p_plug_template_id=>wwv_flow_api.id(25680186090818493769)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765053279924569024)
,p_plug_template_id=>wwv_flow_api.id(25680186090818493769)
,p_name=>'Smart Filters'
,p_placeholder=>'SMART_FILTERS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765053786505569024)
,p_plug_template_id=>wwv_flow_api.id(25680186090818493769)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_dialog
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680188415988493771)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#" class="t-DialogRegion #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE!ATTR#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY##SUB_REGIONS#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Dialog'
,p_internal_name=>'INLINE_DIALOG'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal:js-draggable:js-resizable'
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2671226943886536762
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765061766877569031)
,p_plug_template_id=>wwv_flow_api.id(25680188415988493771)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765062279884569032)
,p_plug_template_id=>wwv_flow_api.id(25680188415988493771)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765062725189569032)
,p_plug_template_id=>wwv_flow_api.id(25680188415988493771)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765063231522569032)
,p_plug_template_id=>wwv_flow_api.id(25680188415988493771)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765063738764569033)
,p_plug_template_id=>wwv_flow_api.id(25680188415988493771)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765064220984569033)
,p_plug_template_id=>wwv_flow_api.id(25680188415988493771)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765064778096569033)
,p_plug_template_id=>wwv_flow_api.id(25680188415988493771)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765065283329569033)
,p_plug_template_id=>wwv_flow_api.id(25680188415988493771)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/standard
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680190568255493773)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading" data-apex-heading>#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4070912133526059312
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765100392953569072)
,p_plug_template_id=>wwv_flow_api.id(25680190568255493773)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765100865150569072)
,p_plug_template_id=>wwv_flow_api.id(25680190568255493773)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765101301994569073)
,p_plug_template_id=>wwv_flow_api.id(25680190568255493773)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765101879842569073)
,p_plug_template_id=>wwv_flow_api.id(25680190568255493773)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765102399511569073)
,p_plug_template_id=>wwv_flow_api.id(25680190568255493773)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765102839224569074)
,p_plug_template_id=>wwv_flow_api.id(25680190568255493773)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765103331107569074)
,p_plug_template_id=>wwv_flow_api.id(25680190568255493773)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765103855289569075)
,p_plug_template_id=>wwv_flow_api.id(25680190568255493773)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765104354772569075)
,p_plug_template_id=>wwv_flow_api.id(25680190568255493773)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765104843517569075)
,p_plug_template_id=>wwv_flow_api.id(25680190568255493773)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765105330387569076)
,p_plug_template_id=>wwv_flow_api.id(25680190568255493773)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/tabs_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680197396445493779)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES# apex-tabs-region" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">#SUB_REGIONS#</div>',
'</div>'))
,p_sub_plug_template=>'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">#SUB_REGION#</div>'
,p_page_plug_template_name=>'Tabs Container'
,p_internal_name=>'TABS_CONTAINER'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765124345483569096)
,p_plug_template_id=>wwv_flow_api.id(25680197396445493779)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765124891593569097)
,p_plug_template_id=>wwv_flow_api.id(25680197396445493779)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/title_bar
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680199906867493782)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<nav aria-label="#TITLE!ATTR#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#">',
'  <div class="t-BreadcrumbRegion-top">',
'    <div class="t-BreadcrumbRegion-body">',
'      <div class="t-BreadcrumbRegion-breadcrumb">#BODY#</div>',
'        <div class="t-BreadcrumbRegion-title">',
'        <h1 id="#REGION_STATIC_ID#_heading" class="t-BreadcrumbRegion-titleText" data-apex-heading>#TITLE#</h1>',
'      </div>',
'    </div>',
'    <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-bottom">#SMART_FILTERS#</div>',
'</nav>',
''))
,p_page_plug_template_name=>'Title Bar'
,p_internal_name=>'TITLE_BAR'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2530016523834132090
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765139756208569112)
,p_plug_template_id=>wwv_flow_api.id(25680199906867493782)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765140234999569112)
,p_plug_template_id=>wwv_flow_api.id(25680199906867493782)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765140752967569113)
,p_plug_template_id=>wwv_flow_api.id(25680199906867493782)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765141206908569113)
,p_plug_template_id=>wwv_flow_api.id(25680199906867493782)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765141731918569113)
,p_plug_template_id=>wwv_flow_api.id(25680199906867493782)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765142296934569114)
,p_plug_template_id=>wwv_flow_api.id(25680199906867493782)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765142692009569114)
,p_plug_template_id=>wwv_flow_api.id(25680199906867493782)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765143135180569114)
,p_plug_template_id=>wwv_flow_api.id(25680199906867493782)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765143645223569115)
,p_plug_template_id=>wwv_flow_api.id(25680199906867493782)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765144126775569115)
,p_plug_template_id=>wwv_flow_api.id(25680199906867493782)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765144699655569115)
,p_plug_template_id=>wwv_flow_api.id(25680199906867493782)
,p_name=>'Smart Filters'
,p_placeholder=>'SMART_FILTERS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765145130636569116)
,p_plug_template_id=>wwv_flow_api.id(25680199906867493782)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/wizard_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(25680201188668493784)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Wizard-header">',
'    <h1 class="t-Wizard-title" id="#REGION_STATIC_ID#_heading" data-apex-heading>#TITLE#</h1>',
'    <div class="u-Table t-Wizard-controls">',
'      <div class="u-Table-fit t-Wizard-buttons">#PREVIOUS##CLOSE#</div>',
'      <div class="u-Table-fill t-Wizard-steps">#BODY#</div>',
'      <div class="u-Table-fit t-Wizard-buttons">#NEXT#</div>',
'    </div>',
'  </div>',
'  <div class="t-Wizard-body">#SUB_REGIONS#</div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Container'
,p_internal_name=>'WIZARD_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765131059069569103)
,p_plug_template_id=>wwv_flow_api.id(25680201188668493784)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765131599002569104)
,p_plug_template_id=>wwv_flow_api.id(25680201188668493784)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765132040109569104)
,p_plug_template_id=>wwv_flow_api.id(25680201188668493784)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765132525456569104)
,p_plug_template_id=>wwv_flow_api.id(25680201188668493784)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(10765133066818569105)
,p_plug_template_id=>wwv_flow_api.id(25680201188668493784)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
);
end;
/
prompt --application/shared_components/user_interface/templates/list/badge_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(25680227648836493825)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02# is-current" aria-current="page">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'    <span class="t-BadgeList-label">#TEXT#</span>',
'    <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'    <span class="t-BadgeList-label">#TEXT#</span>',
'    <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>',
''))
,p_list_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_theme_id=>42
,p_theme_class_id=>3
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--cols t-BadgeList--3cols:t-BadgeList--circular'
,p_list_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'Link Classes'
,p_reference_id=>2062482847268086664
,p_list_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/cards
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(25680231726060493838)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item is-active #A04#" aria-current="page">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap">',
'        <h3 class="t-Card-title">#TEXT#</h3>',
'        <h4 class="t-Card-subtitle">#A07#</h4>',
'      </div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#" aria-hidden="true"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap">',
'        <h3 class="t-Card-title">#TEXT#</h3>',
'        <h4 class="t-Card-subtitle">#A07#</h4>',
'      </div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#" aria-hidden="true"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_list_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Secondary Information'
,p_a03_label=>'Initials'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Attributes'
,p_a06_label=>'Card Color Class'
,p_a07_label=>'Subtitle'
,p_reference_id=>2885322685880632508
);
end;
/
prompt --application/shared_components/user_interface/templates/list/links_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(25680237346161493842)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-LinksList-item is-current #A03#" aria-current="page">',
'  <a href="#LINK#" class="t-LinksList-link" #A02#>',
'    <span class="t-LinksList-icon" aria-hidden="true"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span>',
'    <span class="t-LinksList-label">#TEXT#</span>',
'    <span class="t-LinksList-badge">#A01#</span>',
'  </a>',
'</li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-LinksList-item #A03#">',
'  <a href="#LINK#" class="t-LinksList-link" #A02#>',
'    <span class="t-LinksList-icon" aria-hidden="true"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span>',
'    <span class="t-LinksList-label">#TEXT#</span>',
'    <span class="t-LinksList-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Links List'
,p_internal_name=>'LINKS_LIST'
,p_theme_id=>42
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul class="t-LinksList-list">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-LinksList-item is-current #A03#" aria-current="page">',
'  <a href="#LINK#" class="t-LinksList-link" #A02#>',
'    <span class="t-LinksList-icon" aria-hidden="true"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span>',
'    <span class="t-LinksList-label">#TEXT#</span>',
'    <span class="t-LinksList-badge">#A01#</span>',
'  </a>',
'</li>',
''))
,p_sub_list_item_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-LinksList-item #A03#">',
'  <a href="#LINK#" class="t-LinksList-link" #A02#>',
'    <span class="t-LinksList-icon" aria-hidden="true"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span>',
'    <span class="t-LinksList-label">#TEXT#</span>',
'    <span class="t-LinksList-badge">#A01#</span>',
'  </a>',
'</li>',
''))
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-LinksList-item is-current #A03#" aria-current="page">',
'  <a href="#LINK#" class="t-LinksList-link" #A02#>',
'    <span class="t-LinksList-icon" aria-hidden="true"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span>',
'    <span class="t-LinksList-label">#TEXT#</span>',
'    <span class="t-LinksList-badge">#A01#</span>',
'  </a>',
'  #SUB_LISTS#',
'</li>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-LinksList-item #A03#">',
'  <a href="#LINK#" class="t-LinksList-link" #A02#>',
'    <span class="t-LinksList-icon" aria-hidden="true"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span>',
'    <span class="t-LinksList-label">#TEXT#</span>',
'    <span class="t-LinksList-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_a01_label=>'Badge Value'
,p_a02_label=>'Link Attributes'
,p_a03_label=>'List Item CSS Classes'
,p_reference_id=>4070914341144059318
);
end;
/
prompt --application/shared_components/user_interface/templates/list/media_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(25680238929000493844)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#" aria-current="page">',
'  <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'    <div class="t-MediaList-iconWrap" aria-hidden="true">',
'      <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'    </div>',
'    <div class="t-MediaList-body">',
'      <h3 class="t-MediaList-title">#TEXT#</h3>',
'      <p class="t-MediaList-desc">#A01#</p>',
'    </div>',
'    <div class="t-MediaList-badgeWrap">',
'      <span class="t-MediaList-badge">#A02#</span>',
'    </div>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item  #A04#">',
'  <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'    <div class="t-MediaList-iconWrap" aria-hidden="true">',
'      <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'    </div>',
'    <div class="t-MediaList-body">',
'      <h3 class="t-MediaList-title">#TEXT#</h3>',
'      <p class="t-MediaList-desc">#A01#</p>',
'    </div>',
'    <div class="t-MediaList-badgeWrap">',
'      <span class="t-MediaList-badge">#A02#</span>',
'    </div>',
'  </a>',
'</li>'))
,p_list_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-MediaList--showIcons:t-MediaList--showDesc'
,p_list_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Class'
,p_a06_label=>'Icon Color Class'
,p_reference_id=>2066548068783481421
);
end;
/
prompt --application/shared_components/user_interface/templates/list/navigation_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(25680241733373493846)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#" aria-current="page">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" title="#A04#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true" #IMAGE_ATTR#></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" title="#A04#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true" #IMAGE_ATTR#></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_internal_name=>'NAVIGATION_BAR'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#" aria-current="page">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#" title="#A04#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true" #IMAGE_ATTR#></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow" aria-hidden="true"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#" title="#A04#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true" #IMAGE_ATTR#></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow" aria-hidden="true"></span>',
'  </button>'))
,p_sub_templ_curr_w_child=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_a04_label=>'Title Attribute'
,p_reference_id=>2846096252961119197
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(25680242181015493848)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavTabs-item #A03# is-active" aria-current="page" id="#A01#">',
'  <a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span>',
'    <span class="t-NavTabs-label">#TEXT_ESC_SC#</span>',
'    <span class="t-NavTabs-badge #A05#">#A02#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavTabs-item #A03#" id="#A01#">',
'  <a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span>',
'    <span class="t-NavTabs-label">#TEXT_ESC_SC#</span>',
'    <span class="t-NavTabs-badge #A05#">#A02#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Top Navigation Tabs'
,p_internal_name=>'TOP_NAVIGATION_TABS'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-NavTabs--inlineLabels-lg:t-NavTabs--displayLabels-sm'
,p_list_template_before_rows=>'<ul class="t-NavTabs #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_navtabs">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'List Item ID'
,p_a02_label=>'Badge Value'
,p_a03_label=>'List Item Class'
,p_a04_label=>'Link Class'
,p_a05_label=>'Badge Class'
,p_reference_id=>1453011561172885578
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(25680243794828493849)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_internal_name=>'MENU_BAR'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  iconType: ''fa'',',
'  menubar: true,',
'  menubarOverflow: true,',
'  callout: e.hasClass("js-menu-callout")',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-showSubMenuIcons'
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Menu Item ID / Action Name'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute (Used By Actions Only)'
,p_a05_label=>'Shortcut'
,p_a06_label=>'Link Target'
,p_reference_id=>2008709236185638887
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_mega_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(25680244769370493851)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item t-MegaMenu-item--top t-MegaMenu-item--noSub is-active #A04#" data-current="true" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item t-MegaMenu-item--top t-MegaMenu-item--noSub #A04#" data-current="false" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_list_template_name=>'Top Navigation Mega Menu'
,p_internal_name=>'TOP_NAVIGATION_MEGA_MENU'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-MegaMenu #COMPONENT_CSS_CLASSES#" id="t_MenuNav" style="display:none;">',
'  <div class="a-Menu-content t-MegaMenu-container">',
'    <div class="t-MegaMenu-body">',
'    <ul class="t-MegaMenu-list t-MegaMenu-list--top">'))
,p_list_template_after_rows=>' </ul></div></div></div>'
,p_before_sub_list=>'<ul class="t-MegaMenu-list t-MegaMenu-list--sub">'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item is-active #A04#" data-current="true" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_sub_list_item_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item #A04#" data-current="false" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item t-MegaMenu-item--top t-MegaMenu-item--hasSub is-active #A04#" data-current="true" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item t-MegaMenu-item--top t-MegaMenu-item--hasSub #A04#" data-current="false" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_sub_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item is-active #A04#" data-current="true" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>'))
,p_sub_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item #A04#" data-current="false" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>'))
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Description'
,p_a04_label=>'List Item Class'
,p_a05_label=>'Shortcut Key'
,p_a06_label=>'Link Target'
,p_a07_label=>'Badge Class'
,p_a08_label=>'Menu Item Class'
,p_reference_id=>1665447133514362075
);
end;
/
prompt --application/shared_components/user_interface/templates/list/wizard_progress
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(25680246782939493854)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-WizardSteps-step is-active" aria-current="step" id="#LIST_ITEM_ID#">',
'  <div class="t-WizardSteps-wrap" data-link="#LINK#">',
'    <span class="t-WizardSteps-marker" aria-hidden="true"></span>',
'    <span class="t-WizardSteps-label">#TEXT# <span aria-hidden="true" class="t-WizardSteps-labelState"></span></span>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#">',
'  <div class="t-WizardSteps-wrap" data-link="#LINK#">',
'    <span class="t-WizardSteps-marker" aria-hidden="true"></span>',
'    <span class="t-WizardSteps-label">#TEXT# <span aria-hidden="true" class="t-WizardSteps-labelState"></span></span>',
'  </div>',
'</li>'))
,p_list_template_name=>'Wizard Progress'
,p_internal_name=>'WIZARD_PROGRESS'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>'<ul aria-label="#CURRENT_PROGRESS#" class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_popup
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(25680248157562493856)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_internal_name=>'MENU_POPUP'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({ iconType: ''fa'', callout: e.hasClass("js-menu-callout")});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Menu Item ID / Action Name'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute (Used By Actions Only)'
,p_a05_label=>'Shortcut'
,p_a06_label=>'Link Target'
,p_reference_id=>3492264004432431646
);
end;
/
prompt --application/shared_components/user_interface/templates/list/tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(25680248775061493856)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Tabs-item is-active #A03#" aria-current="page" id="#A01#">',
'  <a href="#LINK#" class="t-Tabs-link #A04#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span>',
'    <span class="t-Tabs-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Tabs-item #A03#" id="#A01#">',
'  <a href="#LINK#" class="t-Tabs-link #A04#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span>',
'    <span class="t-Tabs-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Tabs'
,p_internal_name=>'TABS'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Tabs--simple'
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'List Item ID'
,p_a03_label=>'List Item Class'
,p_a04_label=>'Link Class'
,p_reference_id=>3288206686691809997
);
end;
/
prompt --application/shared_components/user_interface/templates/list/side_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(25680250366249493859)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Side Navigation Menu'
,p_internal_name=>'SIDE_NAVIGATION_MENU'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>'apex.jQuery(''body'').addClass(''t-PageBody--leftNav'');'
,p_theme_id=>42
,p_theme_class_id=>19
,p_default_template_options=>'js-defaultCollapsed'
,p_preset_template_options=>'js-navCollapsed--hidden:t-TreeNav--styleA'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL".">',
'  <div class="t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL".">',
'    <ul style="display:none">',
''))
,p_list_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    </ul>',
'  </div>',
'</div>',
'<script>(sessionStorage.getItem("nav.&APP_ID..preferenceForExpanded") === "true" && window.matchMedia("(min-width: " + getComputedStyle(document.documentElement).getPropertyValue("--js-mq-lg") + ")").matches) && document.getElementById(''t_PageBody'').'
||'classList.add(''js-navExpanded'');</script>'))
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled (True/False)'
,p_a04_label=>'Title Attribute (Used By Actions Only)'
,p_a05_label=>'Shortcut Key'
,p_a06_label=>'Link Target'
,p_reference_id=>2466292414354694776
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(25680252101824493861)
,p_list_template_current=>'<li class="a-MenuBar-item a-Menu--current" data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a class="a-MenuBar-label" href="#LINK#" title="#A04#" target="#A06#">#TEXT_ES'
||'C_SC#</a></li>'
,p_list_template_noncurrent=>'<li class="a-MenuBar-item" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a class="a-MenuBar-label" href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_internal_name=>'TOP_NAVIGATION_MENU'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("#t_MenuNav", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  menubar: true,',
'  menubarOverflow: true,',
'  callout: e.hasClass("js-menu-callout")',
'});',
''))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-tabLike'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="t_MenuNav"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul style="display: none">'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li class="a-MenuBar-item a-Menu--current" data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a class="a-MenuBar-label" href="#LINK#" title="#A04#" target="#A06#">#TEXT_ES'
||'C_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li class="a-MenuBar-item" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a class="a-MenuBar-label" href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Menu Item ID / Action Name'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute (Used By Actions Only)'
,p_a05_label=>'Shortcut Key'
,p_a06_label=>'Link Target'
,p_reference_id=>2525307901300239072
);
end;
/
prompt --application/shared_components/user_interface/templates/report/alerts
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(25680202420437493785)
,p_row_template_name=>'Alerts'
,p_internal_name=>'ALERTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--horizontal t-Alert--colorBG t-Alert--defaultIcons t-Alert--#ALERT_TYPE#" role="alert">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon" aria-hidden="true"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title">#ALERT_TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #ALERT_DESC#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      #ALERT_ACTION#',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="t-Alerts #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_alerts" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/badge_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(25680202794185493792)
,p_row_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
'  <span class="t-BadgeList-wrap u-color">',
'    <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'    <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
'  </span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed:t-BadgeList--circular'
,p_reference_id=>2103197159775914759
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/cards
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(25680206722203493795)
,p_row_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <a href="#CARD_LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':CARD_LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <div class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_reference_id=>2973535649510699732
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/comments
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(25680212172366493801)
,p_row_template_name=>'Comments'
,p_internal_name=>'COMMENTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Comments-item #COMMENT_MODIFIERS#">',
'  <div class="t-Comments-icon">',
'    <div class="t-Comments-userIcon #ICON_MODIFIER#" aria-hidden="true">#USER_ICON#</div>',
'  </div>',
'  <div class="t-Comments-body">',
'    <div class="t-Comments-info">',
'      #USER_NAME# <span class="t-Comments-date">#COMMENT_DATE#</span> <span class="t-Comments-actions">#ACTIONS#</span>',
'    </div>',
'    <div class="t-Comments-comment">',
'      #COMMENT_TEXT##ATTRIBUTE_1##ATTRIBUTE_2##ATTRIBUTE_3##ATTRIBUTE_4#',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Comments #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Comments--chat'
,p_reference_id=>2611722012730764232
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/contextual_info
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(25680213319066493803)
,p_row_template_name=>'Contextual Info'
,p_internal_name=>'CONTEXTUAL_INFO'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ContextualInfo-item">',
'  <span class="t-ContextualInfo-label">#COLUMN_HEADER#</span>',
'  <span class="t-ContextualInfo-value">#COLUMN_VALUE#</span>',
'</div>'))
,p_row_template_before_rows=>' <div class="t-ContextualInfo #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_reference_id=>2114325881116323585
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/standard
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(25680214298161493804)
,p_row_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" id="report_table_#REGION_STATIC_ID#" aria-label="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_reference_id=>2537207537838287671
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/search_results
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(25680216939327493808)
,p_row_template_name=>'Search Results'
,p_internal_name=>'SEARCH_RESULTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition3=>':LABEL_04 is null'
,p_row_template4=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'      <span class="t-SearchResults-misc">#LABEL_04#: #VALUE_04#</span>',
'    </div>',
'  </li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070913431524059316
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/content_row
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(25680217152874493810)
,p_row_template_name=>'Content Row'
,p_internal_name=>'CONTENT_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-ContentRow-item #ITEM_CLASSES#">',
'  <div class="t-ContentRow-wrap">',
'    <div class="t-ContentRow-selection">#SELECTION#</div>',
'    <div class="t-ContentRow-iconWrap">',
'      <span class="t-ContentRow-icon #ICON_CLASS#">#ICON_HTML#</span>',
'    </div>',
'    <div class="t-ContentRow-body">',
'      <div class="t-ContentRow-content">',
'        <h3 class="t-ContentRow-title">#TITLE#</h3>',
'        <div class="t-ContentRow-description">#DESCRIPTION#</div>',
'      </div>',
'      <div class="t-ContentRow-misc">#MISC#</div>',
'      <div class="t-ContentRow-actions">#ACTIONS#</div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-ContentRow #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>1797843454948280151
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/timeline
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(25680220435339493814)
,p_row_template_name=>'Timeline'
,p_internal_name=>'TIMELINE'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <div class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#" role="presentation">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':EVENT_LINK is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <a href="#EVENT_LINK#" class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#" role="presentation">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline" data-region-id="#REGION_STATIC_ID#">',
''))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_reference_id=>1513373588340069864
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/media_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(25680220863741493815)
,p_row_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item #LIST_CLASS#">',
'  <a href="#LINK#" class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'    <div class="t-MediaList-iconWrap" aria-hidden"true">',
'      <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#"><span class="t-Icon #ICON_CLASS#"></span></span>',
'    </div>',
'    <div class="t-MediaList-body">',
'      <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'      <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'    </div>',
'    <div class="t-MediaList-badgeWrap">',
'      <span class="t-MediaList-badge">#LIST_BADGE#</span>',
'    </div>',
'  </a>',
'</li>',
''))
,p_row_template_condition1=>':LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item #LIST_CLASS#">',
'  <div class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'    <div class="t-MediaList-iconWrap" aria-hidden"true">',
'      <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#"><span class="t-Icon #ICON_CLASS#"></span></span>',
'    </div>',
'    <div class="t-MediaList-body">',
'      <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'      <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'    </div>',
'    <div class="t-MediaList-badgeWrap">',
'      <span class="t-MediaList-badge">#LIST_BADGE#</span>',
'    </div>',
'  </div>',
'</li>',
''))
,p_row_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_default_template_options=>'t-MediaList--showDesc:t-MediaList--showIcons'
,p_preset_template_options=>'t-MediaList--stack'
,p_reference_id=>2092157460408299055
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_column
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(25680223819450493819)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_COLUMN'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068636272681754
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_row
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(25680225798168493821)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068321678681753
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/hidden
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(25680253098260493863)
,p_template_name=>'Hidden'
,p_internal_name=>'HIDDEN'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--hiddenLabel rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>13
,p_reference_id=>2039339104148359505
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(25680253321366493868)
,p_template_name=>'Optional'
,p_internal_name=>'OPTIONAL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>',
''))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>2317154212072806530
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(25680253443376493869)
,p_template_name=>'Optional - Above'
,p_internal_name=>'OPTIONAL_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>3030114864004968404
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(25680253553416493869)
,p_template_name=>'Optional - Floating'
,p_internal_name=>'OPTIONAL_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>1607675164727151865
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(25680253664465493869)
,p_template_name=>'Required'
,p_internal_name=>'REQUIRED'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer is-required rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">',
'  <div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'))
,p_after_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#ITEM_POST_TEXT##HELP_TEMPLATE#',
'  </div>',
'  <div class="t-Form-itemAssistance">',
'    #ERROR_TEMPLATE#',
'    <div class="t-Form-itemRequired" aria-hidden="true">#REQUIRED#</div>',
'  </div>',
'  #INLINE_HELP_TEMPLATE#',
'</div>'))
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<div class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</div>'
,p_error_template=>'<div class="t-Form-error">#ERROR_MESSAGE#</div>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>2525313812251712801
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(25680254394252493872)
,p_template_name=>'Required - Above'
,p_internal_name=>'REQUIRED_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label> #HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-inputContainer">',
'  <div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'))
,p_after_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#ITEM_POST_TEXT##HELP_TEMPLATE#',
'  </div>',
'  <div class="t-Form-itemAssistance">',
'    #ERROR_TEMPLATE#',
'    <div class="t-Form-itemRequired" aria-hidden="true">#REQUIRED#</div>',
'  </div>',
'  #INLINE_HELP_TEMPLATE#',
'</div>'))
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<div class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</div>'
,p_error_template=>'<div class="t-Form-error">#ERROR_MESSAGE#</div>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>3030115129444970113
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(25680254824725493873)
,p_template_name=>'Required - Floating'
,p_internal_name=>'REQUIRED_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-inputContainer">',
'  <div class="t-Form-itemRequired-marker" aria-hidden="true"></div>',
'  <div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'))
,p_after_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#ITEM_POST_TEXT##HELP_TEMPLATE#',
'  </div>',
'  <div class="t-Form-itemAssistance">',
'    #ERROR_TEMPLATE#',
'    <div class="t-Form-itemRequired" aria-hidden="true">#REQUIRED#</div>',
'  </div>',
'  #INLINE_HELP_TEMPLATE#',
'</div>'))
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<div class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</div>'
,p_error_template=>'<div class="t-Form-error">#ERROR_MESSAGE#</div>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>1607675344320152883
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(25680257411360493880)
,p_name=>'Breadcrumb'
,p_internal_name=>'BREADCRUMB'
,p_before_first=>'<ul class="t-Breadcrumb #COMPONENT_CSS_CLASSES#">'
,p_current_page_option=>'<li class="t-Breadcrumb-item is-active" aria-current="page"><h1 class="t-Breadcrumb-label">#NAME#</h1></li>'
,p_non_current_page_option=>'<li class="t-Breadcrumb-item"><a href="#LINK#" class="t-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916542570059325
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(25680257635055493901)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#FAVICONS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="t-Page t-Page--popupLOV"'
,p_before_field_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="apex-item-text"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="t-Button t-Button--hot t-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="t-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
,p_prev_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_result_row_x_of_y=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>100
,p_before_result_set=>'<div class="t-PopupLOV-links">'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>2885398517835871876
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(25680257531695493886)
,p_cal_template_name=>'Calendar'
,p_internal_name=>'CALENDAR'
,p_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" aria-label="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>',
''))
,p_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" aria-label="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_weekly_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="t-ClassicCalendar-dayColumn">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" aria-label="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_daily_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_cust_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_cust_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" aria-label="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">'
,p_cust_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">'
,p_cust_weekend_close_format=>'</td>'
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_cust_wk_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_wk_week_open_format=>'<tr>'
,p_cust_wk_week_close_format=>'</tr> '
,p_cust_wk_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_day_close_format=>'</div></td>'
,p_cust_wk_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_weekend_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_wk_weekend_close_format=>'</td>'
,p_agenda_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-future">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'<span class="t-ClassicCalendar-event">#DATA#</span>'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916747979059326
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(25680259285108493924)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(25680144433759493709)
,p_default_dialog_template=>wwv_flow_api.id(25680153856093493722)
,p_error_template=>wwv_flow_api.id(25680148454811493714)
,p_printer_friendly_template=>wwv_flow_api.id(25680144433759493709)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(25680148454811493714)
,p_default_button_template=>wwv_flow_api.id(25680256075260493879)
,p_default_region_template=>wwv_flow_api.id(25680190568255493773)
,p_default_chart_template=>wwv_flow_api.id(25680190568255493773)
,p_default_form_template=>wwv_flow_api.id(25680190568255493773)
,p_default_reportr_template=>wwv_flow_api.id(25680190568255493773)
,p_default_tabform_template=>wwv_flow_api.id(25680190568255493773)
,p_default_wizard_template=>wwv_flow_api.id(25680190568255493773)
,p_default_menur_template=>wwv_flow_api.id(25680199906867493782)
,p_default_listr_template=>wwv_flow_api.id(25680190568255493773)
,p_default_irr_template=>wwv_flow_api.id(25680176452434493757)
,p_default_report_template=>wwv_flow_api.id(25680214298161493804)
,p_default_label_template=>wwv_flow_api.id(25680253553416493869)
,p_default_menu_template=>wwv_flow_api.id(25680257411360493880)
,p_default_calendar_template=>wwv_flow_api.id(25680257531695493886)
,p_default_list_template=>wwv_flow_api.id(25680237346161493842)
,p_default_nav_list_template=>wwv_flow_api.id(25680252101824493861)
,p_default_top_nav_list_temp=>wwv_flow_api.id(25680252101824493861)
,p_default_side_nav_list_temp=>wwv_flow_api.id(25680250366249493859)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(25680160044196493739)
,p_default_dialogr_template=>wwv_flow_api.id(25680159079337493738)
,p_default_option_label=>wwv_flow_api.id(25680253553416493869)
,p_default_required_label=>wwv_flow_api.id(25680254824725493873)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(25680241733373493846)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/21.2/')
,p_files_version=>65
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(10764615157059568535)
,p_theme_id=>42
,p_name=>'Redwood Light'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/oracle-fonts/oraclesans-apex#MIN#.css?v=#APEX_VERSION#',
'#THEME_IMAGES#css/Redwood#MIN#.css?v=#APEX_VERSION#'))
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Redwood-Theme.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Redwood-Theme#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2596426436825065489
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(10764615507338568535)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(10764615900647568536)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3543348412015319650
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(10764616358667568536)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>1938457712423918173
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(10764616725661568536)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(25680451500107499042)
,p_theme_id=>42
,p_name=>'Movies - Dark'
,p_is_current=>true
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_config=>'{"classes":[],"vars":{"@g_Accent-BG":"#c74634","@g_Accent-OG":"#312d2a"},"customCSS":"","useCustomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#25680451500107499042.css'
,p_theme_roller_read_only=>false
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '3A726F6F74207B0D0A20202D2D612D69636F6E2D73697A653A203172656D3B0D0A20202D2D612D627574746F6E2D626F726465722D7261646975733A20302E31323572656D3B0D0A20202D2D612D627574746F6E2D70616464696E672D793A20302E3572';
wwv_flow_api.g_varchar2_table(2) := '656D3B0D0A20202D2D612D627574746F6E2D70616464696E672D783A20302E373572656D3B0D0A20202D2D612D627574746F6E2D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D627574746F6E2D6C696E652D6865696768743A2031';
wwv_flow_api.g_varchar2_table(3) := '72656D3B0D0A20202D2D612D627574746F6E2D6761702D783A20302E323572656D3B0D0A20202D2D612D627574746F6E2D69636F6E2D73706163696E673A20302E33373572656D3B0D0A20202D2D612D627574746F6E2D69636F6E2D73697A653A203172';
wwv_flow_api.g_varchar2_table(4) := '656D3B0D0A20202D2D612D63762D677269642D6761703A203172656D3B0D0A20202D2D612D63762D6974656D2D77696474683A20323072656D3B0D0A20202D2D612D63762D626F726465722D7261646975733A20302E323572656D3B0D0A20202D2D612D';
wwv_flow_api.g_varchar2_table(5) := '63762D736861646F773A20766172282D2D75742D736861646F772D736D293B0D0A20202D2D612D63762D6865616465722D70616464696E672D793A203172656D3B0D0A20202D2D612D63762D6865616465722D70616464696E672D783A203172656D3B0D';
wwv_flow_api.g_varchar2_table(6) := '0A20202D2D612D63762D6865616465722D6974656D2D73706163696E672D783A20302E373572656D3B0D0A20202D2D612D63762D69636F6E2D73697A653A203172656D3B0D0A20202D2D612D63762D69636F6E2D636F6E7461696E65722D73697A653A20';
wwv_flow_api.g_varchar2_table(7) := '3272656D3B0D0A20202D2D612D63762D69636F6E2D70616464696E673A20302E3572656D3B0D0A20202D2D612D63762D69636F6E2D7370616365723A2063616C6328766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A652C203172';
wwv_flow_api.g_varchar2_table(8) := '656D29202B20766172282D2D612D63762D6865616465722D6974656D2D73706163696E672D782C20302E373572656D29293B0D0A20202D2D612D63762D696E697469616C732D73697A653A203272656D3B0D0A20202D2D612D63762D696E697469616C73';
wwv_flow_api.g_varchar2_table(9) := '2D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D612D63762D7469746C652D666F6E742D73697A653A203172656D3B0D0A20202D2D612D63762D7469746C652D6C696E652D6865696768743A20312E323572656D3B0D0A20202D2D612D';
wwv_flow_api.g_varchar2_table(10) := '63762D7375627469746C652D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D63762D7375627469746C652D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D63762D62616467652D666F6E742D73697A653A20302E37';
wwv_flow_api.g_varchar2_table(11) := '3572656D3B0D0A20202D2D612D63762D62616467652D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D0A20202D2D612D63762D626F64792D70616464696E672D783A203172656D3B0D0A';
wwv_flow_api.g_varchar2_table(12) := '20202D2D612D63762D626F64792D70616464696E672D793A203172656D3B0D0A20202D2D612D63762D6D61696E636F6E74656E742D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D612D63762D6D61696E636F6E74656E742D6C696E65';
wwv_flow_api.g_varchar2_table(13) := '2D6865696768743A20312E323572656D3B0D0A20202D2D612D63762D737562636F6E74656E742D666F6E742D73697A653A20302E3638373572656D3B0D0A20202D2D612D63762D737562636F6E74656E742D6C696E652D6865696768743A203172656D3B';
wwv_flow_api.g_varchar2_table(14) := '0D0A20202D2D612D63762D616374696F6E732D70616464696E672D793A203172656D3B0D0A20202D2D612D63762D616374696F6E732D70616464696E672D783A203172656D3B0D0A20202D2D612D636865636B626F782D73697A653A203172656D3B0D0A';
wwv_flow_api.g_varchar2_table(15) := '20202D2D612D636865636B626F782D6C6162656C2D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D636865636B626F782D626F726465722D7261646975733A20302E31323572656D3B0D0A20202D2D612D636865636B626F782D6963';
wwv_flow_api.g_varchar2_table(16) := '6F6E2D73697A653A20302E373572656D3B0D0A20202D2D612D636865636B626F782D69636F6E2D6368617261637465723A20225C65303037223B0D0A20202D2D612D636865636B626F782D696E64657465726D696E6174652D77696474683A20302E3632';
wwv_flow_api.g_varchar2_table(17) := '3572656D3B0D0A20202D2D612D636865636B626F782D696E64657465726D696E6174652D6865696768743A20302E31323572656D3B0D0A20202D2D612D636865636B626F782D6C6162656C2D73706163696E672D793A20302E31323572656D3B0D0A2020';
wwv_flow_api.g_varchar2_table(18) := '2D2D612D636865636B626F782D6C6162656C2D73706163696E672D783A20302E33373572656D3B0D0A20202D2D612D636F6D626F2D626F782D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D636F6D626F2D626F782D70616464696E';
wwv_flow_api.g_varchar2_table(19) := '672D783A20302E3572656D3B0D0A20202D2D612D6465762D746F6F6C6261722D6261636B67726F756E642D636F6C6F723A20233636363B0D0A20202D2D612D6465762D746F6F6C6261722D6261636B64726F702D66696C7465723A206E6F6E653B0D0A20';
wwv_flow_api.g_varchar2_table(20) := '202D2D612D66732D636F6E74726F6C2D736570657261746F722D626F726465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C20317078293B0D0A20202D2D612D66732D636F6E74726F6C2D736570';
wwv_flow_api.g_varchar2_table(21) := '657261746F722D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D66732D636F6E74726F6C2D6865616465722D70616464696E672D793A20302E373572656D3B0D';
wwv_flow_api.g_varchar2_table(22) := '0A20202D2D612D66732D636F6E74726F6C2D6865616465722D70616464696E672D783A20302E373572656D3B0D0A20202D2D612D66732D636F6E74726F6C2D6865616465722D666F6E742D73697A653A203172656D3B0D0A20202D2D612D66732D636F6E';
wwv_flow_api.g_varchar2_table(23) := '74726F6C2D6865616465722D6C696E652D6865696768743A20312E323572656D3B0D0A20202D2D612D66732D636F6E74726F6C2D626F64792D70616464696E672D793A20302E373572656D3B0D0A20202D2D612D66732D636F6E74726F6C2D626F64792D';
wwv_flow_api.g_varchar2_table(24) := '70616464696E672D783A20302E373572656D3B0D0A20202D2D612D66732D636F6E74726F6C2D616374696F6E732D70616464696E672D793A20302E373572656D3B0D0A20202D2D612D66732D636F6E74726F6C2D616374696F6E732D70616464696E672D';
wwv_flow_api.g_varchar2_table(25) := '783A203072656D3B0D0A20202D2D612D66732D636F6E74726F6C2D6974656D2D73706163696E673A20302E373572656D3B0D0A20202D2D612D66732D66696C7465722D67726F75702D626F726465722D636F6C6F723A20766172282D2D75742D636F6D70';
wwv_flow_api.g_varchar2_table(26) := '6F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D66732D66696C7465722D67726F75702D626F726465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C20317078293B0D0A2020';
wwv_flow_api.g_varchar2_table(27) := '2D2D612D66732D66696C7465722D67726F75702D6C6162656C2D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D612D66732D63686172742D70616464696E672D';
wwv_flow_api.g_varchar2_table(28) := '793A203172656D3B0D0A20202D2D612D66732D63686172742D70616464696E672D783A203172656D3B0D0A20202D2D612D66732D63686172742D626F726465722D77696474683A20766172282D2D75742D726567696F6E2D626F726465722D7769647468';
wwv_flow_api.g_varchar2_table(29) := '2C20766172282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C2031707829293B0D0A20202D2D612D66732D63686172742D626F726465722D636F6C6F723A20766172282D2D75742D726567696F6E2D626F726465722D636F6C6F72';
wwv_flow_api.g_varchar2_table(30) := '2C20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F7229293B0D0A20202D2D612D66732D63686172742D626F726465722D7261646975733A20766172282D2D75742D726567696F6E2D626F726465722D7261646975732C2076';
wwv_flow_api.g_varchar2_table(31) := '6172282D2D75742D636F6D706F6E656E742D626F726465722D72616469757329293B0D0A20202D2D612D66696C6564726F702D70616464696E672D793A203172656D3B0D0A20202D2D612D66696C6564726F702D70616464696E672D783A203172656D3B';
wwv_flow_api.g_varchar2_table(32) := '0D0A20202D2D612D66696C6564726F702D626F726465722D7261646975733A20302E31323572656D3B0D0A20202D2D612D66696C6564726F702D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D626F726465722D63';
wwv_flow_api.g_varchar2_table(33) := '6F6C6F72293B0D0A20202D2D612D66696C6564726F702D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D612D66696C6564726F702D666F6375732D626F726465';
wwv_flow_api.g_varchar2_table(34) := '722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D666F6375732D626F726465722D636F6C6F72293B0D0A20202D2D612D66696C6564726F702D6974656D2D73706163696E673A20302E323572656D3B0D0A20202D2D612D66696C65';
wwv_flow_api.g_varchar2_table(35) := '64726F702D69636F6E2D73697A653A203272656D3B0D0A20202D2D612D66696C6564726F702D68656164696E672D666F6E742D73697A653A20312E323572656D3B0D0A20202D2D612D66696C6564726F702D68656164696E672D6C696E652D6865696768';
wwv_flow_api.g_varchar2_table(36) := '743A20312E373572656D3B0D0A20202D2D612D66696C6564726F702D68656164696E672D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D7469746C652D636F6C6F72293B0D0A20202D2D612D66696C6564726F';
wwv_flow_api.g_varchar2_table(37) := '702D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D612D66696C6564726F702D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D66696C6564726F702D70726F67726573732D77696474683A20313572656D3B0D0A2020';
wwv_flow_api.g_varchar2_table(38) := '2D2D612D66696C6564726F702D70726F67726573732D6865696768743A20302E373572656D3B0D0A20202D2D612D66696C6564726F702D70726F67726573732D626F726465722D7261646975733A20302E33373572656D3B0D0A20202D2D612D66696C65';
wwv_flow_api.g_varchar2_table(39) := '64726F702D70726F67726573732D6261722D77696474683A203372656D3B0D0A20202D2D612D6669656C642D696E7075742D626F726465722D7261646975733A20302E31323572656D3B0D0A20202D2D612D6669656C642D73656C6563742D6261636B67';
wwv_flow_api.g_varchar2_table(40) := '726F756E642D73697A653A203272656D203172656D3B0D0A20202D2D612D6669656C642D73656C6563742D6172726F772D70616464696E673A203272656D3B0D0A20202D2D612D67762D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D61';
wwv_flow_api.g_varchar2_table(41) := '2D67762D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D67762D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D67762D63656C6C2D70616464';
wwv_flow_api.g_varchar2_table(42) := '696E672D793A20302E323572656D3B0D0A20202D2D612D67762D63656C6C2D70616464696E672D783A20302E3572656D3B0D0A20202D2D612D67762D63656C6C2D6865696768743A203272656D3B0D0A20202D2D612D67762D726F772D686F7665722D62';
wwv_flow_api.g_varchar2_table(43) := '61636B67726F756E642D636F6C6F723A20233036303630363B0D0A20202D2D612D67762D696E7365727465642D6261636B67726F756E642D636F6C6F723A20766172282D2D612D70616C657474652D737563636573732D7368616465293B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(44) := '612D67762D64656C657465642D6261636B67726F756E642D636F6C6F723A20233064306430643B0D0A20202D2D612D67762D6772616E64746F74616C2D6261636B67726F756E642D636F6C6F723A20233139313931393B0D0A20202D2D612D67762D7570';
wwv_flow_api.g_varchar2_table(45) := '64617465642D6261636B67726F756E642D636F6C6F723A20766172282D2D612D70616C657474652D696E666F2D7368616465293B0D0A20202D2D612D67762D6865616465722D63656C6C2D70616464696E672D793A20302E323572656D3B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(46) := '612D67762D6865616465722D63656C6C2D70616464696E672D783A20302E3572656D3B0D0A20202D2D612D67762D6865616465722D63656C6C2D6865696768743A20322E3572656D3B0D0A20202D2D612D67762D666F6F7465722D70616464696E672D79';
wwv_flow_api.g_varchar2_table(47) := '3A20302E3572656D3B0D0A20202D2D612D67762D666F6F7465722D70616464696E672D783A20302E373572656D3B0D0A20202D2D612D67762D706167696E6174696F6E2D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E737061';
wwv_flow_api.g_varchar2_table(48) := '72656E743B0D0A20202D2D612D67762D706167696E6174696F6E2D627574746F6E2D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D67762D706167696E6174696F6E2D627574746F';
wwv_flow_api.g_varchar2_table(49) := '6E2D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D67762D706167696E6174696F6E2D627574746F6E2D70616464696E672D783A20302E323572656D3B0D0A20202D2D612D67762D706167696E6174696F6E2D627574746F6E2D6761';
wwv_flow_api.g_varchar2_table(50) := '702D783A20302E323572656D3B0D0A20202D2D612D67762D706167696E6174696F6E2D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(51) := '6C6F72293B0D0A20202D2D612D67762D706167696E6174696F6E2D627574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D67762D6E6F6461';
wwv_flow_api.g_varchar2_table(52) := '74612D6D6573736167652D70616464696E672D793A203172656D3B0D0A20202D2D612D67762D6E6F646174612D6D6573736167652D70616464696E672D783A203172656D3B0D0A20202D2D612D67762D6E6F646174612D6D6573736167652D746578742D';
wwv_flow_api.g_varchar2_table(53) := '636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D612D67762D6E6F646174612D6D6573736167652D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D67762D';
wwv_flow_api.g_varchar2_table(54) := '6E6F646174612D6D6573736167652D69636F6E2D73697A653A203272656D3B0D0A20202D2D612D67762D6E6F646174612D6D6573736167652D69636F6E2D73706163696E673A20302E373572656D3B0D0A20202D2D612D68656C702D6469616C6F672D63';
wwv_flow_api.g_varchar2_table(55) := '6F64652D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D612D6D64656469746F722D6261636B67726F756E642D636F6C6F723A20766172282D2D612D6669656C';
wwv_flow_api.g_varchar2_table(56) := '642D696E7075742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D6D64656469746F722D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D626F726465722D636F6C6F72293B0D0A20202D2D612D6D';
wwv_flow_api.g_varchar2_table(57) := '64656469746F722D626F726465722D77696474683A20766172282D2D612D6669656C642D696E7075742D626F726465722D7769647468293B0D0A20202D2D612D6D64656469746F722D666F6375732D626F726465722D636F6C6F723A20766172282D2D61';
wwv_flow_api.g_varchar2_table(58) := '2D6669656C642D696E7075742D666F6375732D626F726465722D636F6C6F72293B0D0A20202D2D612D6D656E756261722D6974656D2D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D6D656E756261722D6974656D2D70616464696E67';
wwv_flow_api.g_varchar2_table(59) := '2D783A20302E3572656D3B0D0A20202D2D612D6D656E756261722D6974656D2D73706C69742D69636F6E2D73697A653A203172656D3B0D0A20202D2D612D6D656E756261722D6974656D2D73706C69742D69636F6E2D73706163696E673A20302E357265';
wwv_flow_api.g_varchar2_table(60) := '6D3B0D0A20202D2D612D6D656E752D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D6D656E752D70616464696E672D783A203072656D3B0D0A20202D2D612D6D656E752D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(61) := '612D6D656E752D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D6D656E752D626F726465722D7261646975733A20302E323572656D3B0D0A20202D2D612D6D656E752D7365702D626F726465722D636F6C6F723A20766172282D2D7574';
wwv_flow_api.g_varchar2_table(62) := '2D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D6D656E752D7365702D73706163696E672D793A20302E323572656D3B0D0A20202D2D612D6D656E752D69636F6E2D73697A653A203172656D3B0D0A20202D2D612D6D65';
wwv_flow_api.g_varchar2_table(63) := '6E752D69636F6E2D73706163696E672D793A20302E3572656D3B0D0A20202D2D612D6D656E752D69636F6E2D73706163696E672D783A20302E3572656D3B0D0A20202D2D612D6D656E752D6974656D2D67656E657269632D70616464696E672D793A2030';
wwv_flow_api.g_varchar2_table(64) := '2E3572656D3B0D0A20202D2D612D6D656E752D6974656D2D67656E657269632D70616464696E672D783A20302E3572656D3B0D0A20202D2D612D6D656E752D63616C6C6F75742D73697A653A20302E373572656D3B0D0A20202D2D612D6D656E752D6361';
wwv_flow_api.g_varchar2_table(65) := '6C6C6F75742D626F726465722D7261646975733A203072656D3B0D0A20202D2D612D6D656E752D63616C6C6F75742D736861646F773A2030203020302E323572656D2030207267626128302C20302C20302C20302E31293B0D0A20202D2D612D706F7075';
wwv_flow_api.g_varchar2_table(66) := '706C6F762D7365617263682D6261722D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D706F7075706C6F762D7365617263682D6261722D70616464696E672D783A20766172282D2D612D706F7075706C6F762D7365617263682D626172';
wwv_flow_api.g_varchar2_table(67) := '2D70616464696E672D79293B0D0A20202D2D612D72762D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D72762D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D72762D626F64792D70616464696E672D793A20302E';
wwv_flow_api.g_varchar2_table(68) := '323572656D3B0D0A20202D2D612D72762D626F64792D70616464696E672D783A203072656D3B0D0A20202D2D612D70657263656E742D63686172742D6865696768743A203172656D3B0D0A20202D2D612D70657263656E742D63686172742D6261636B67';
wwv_flow_api.g_varchar2_table(69) := '726F756E642D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D7368616465293B0D0A20202D2D612D70657263656E742D63686172742D626F726465722D7261646975733A20302E31323572656D3B0D0A20202D2D612D70';
wwv_flow_api.g_varchar2_table(70) := '657263656E742D63686172742D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D70657263656E742D63686172742D6261722D6261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(71) := '6F723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D612D70657263656E742D63686172742D6261722D746578742D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D636F6E74726173';
wwv_flow_api.g_varchar2_table(72) := '74293B0D0A20202D2D612D70657263656E742D63686172742D6261722D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D';
wwv_flow_api.g_varchar2_table(73) := '70616464696E672D793A20302E3572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D70616464696E672D783A20302E3572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D626F726465722D636F6C6F723A207661';
wwv_flow_api.g_varchar2_table(74) := '72282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D626F726465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F726465722D7769647468';
wwv_flow_api.g_varchar2_table(75) := '293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D6974656D2D73706163696E673A20302E323572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D73706163696E673A20302E3572656D3B0D0A20202D2D61';
wwv_flow_api.g_varchar2_table(76) := '2D7265706F72742D636F6E74726F6C732D63656C6C2D626F726465722D7261646975733A20302E31323572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D77696474683A2031382E373572656D3B0D0A20';
wwv_flow_api.g_varchar2_table(77) := '202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D6C696E652D6865696768743A2031';
wwv_flow_api.g_varchar2_table(78) := '72656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D7265706F7274';
wwv_flow_api.g_varchar2_table(79) := '2D636F6E74726F6C732D63656C6C2D6C6162656C2D626F726465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F726465722D7769647468293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D626F';
wwv_flow_api.g_varchar2_table(80) := '726465722D77696474683A20766172282D2D612D6669656C642D696E7075742D626F726465722D7769647468293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D626F726465722D636F6C6F723A20766172282D2D612D6669';
wwv_flow_api.g_varchar2_table(81) := '656C642D696E7075742D626F726465722D636F6C6F72293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D626F726465722D7261646975733A20766172282D2D612D6669656C642D696E7075742D626F726465722D72616469';
wwv_flow_api.g_varchar2_table(82) := '7573293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D666F6375732D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D666F6375732D626F726465722D636F6C6F72293B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(83) := '612D7265706F72742D636F6E74726F6C732D696E7075742D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D70616464696E672D783A20302E3572656D3B0D0A20202D2D612D7265';
wwv_flow_api.g_varchar2_table(84) := '706F72742D636F6E74726F6C732D696E7075742D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D73706C6974';
wwv_flow_api.g_varchar2_table(85) := '7465722D6261722D77696474683A20302E3572656D3B0D0A20202D2D612D73706C69747465722D7468756D622D77696474683A20302E3572656D3B0D0A20202D2D612D73706C69747465722D7468756D622D6865696768743A203372656D3B0D0A20202D';
wwv_flow_api.g_varchar2_table(86) := '2D612D73706C69747465722D7468756D622D626F726465722D7261646975733A203072656D3B0D0A20202D2D612D73746172726174696E672D73746172732D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D73746172726174696E67';
wwv_flow_api.g_varchar2_table(87) := '2D73746172732D62672D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D0A20202D2D612D73746172726174696E672D76616C75652D73706163696E673A20302E3572656D3B0D0A20202D2D612D7377697463682D77';
wwv_flow_api.g_varchar2_table(88) := '696474683A20322E373572656D3B0D0A20202D2D612D7377697463682D70616464696E672D793A20302E31323572656D3B0D0A20202D2D612D7377697463682D70616464696E672D783A20302E31323572656D3B0D0A20202D2D612D7377697463682D68';
wwv_flow_api.g_varchar2_table(89) := '6F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D612D7377697463682D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D7377697463682D6163746976652D6261636B67726F756E642D636F6C6F723A2076617228';
wwv_flow_api.g_varchar2_table(90) := '2D2D612D7377697463682D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D7377697463682D636865636B65642D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D612D7377697463682D636865';
wwv_flow_api.g_varchar2_table(91) := '636B65642D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D7377697463682D636865636B65642D6163746976652D6261636B67726F756E642D636F6C6F723A20766172282D2D612D7377697463682D636865636B65642D686F7665722D';
wwv_flow_api.g_varchar2_table(92) := '6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D7377697463682D746F67676C652D77696474683A20312E323572656D3B0D0A20202D2D612D7377697463682D746F67676C652D6865696768743A20312E323572656D3B0D0A20202D2D61';
wwv_flow_api.g_varchar2_table(93) := '2D746F6F6C6261722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D726567696F6E2D6865616465722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D746F6F6C6261722D626F726465722D77696474683A207661';
wwv_flow_api.g_varchar2_table(94) := '72282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C20317078293B0D0A20202D2D612D746F6F6C6261722D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D';
wwv_flow_api.g_varchar2_table(95) := '0A20202D2D612D746F6F6C6261722D6974656D2D73706163696E673A20302E3572656D3B0D0A20202D2D612D746F6F6C6261722D7365702D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465';
wwv_flow_api.g_varchar2_table(96) := '722D636F6C6F72293B0D0A20202D2D612D746F6F6C6261722D736D616C6C2D627574746F6E2D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D746F6F6C6261722D736D616C6C2D627574746F6E2D70616464696E672D783A20302E35';
wwv_flow_api.g_varchar2_table(97) := '72656D3B0D0A20202D2D612D74726565766965772D746F67676C652D73697A653A203172656D3B0D0A20202D2D612D74726565766965772D6E6F64652D69636F6E2D73697A653A203172656D3B0D0A20202D2D612D74726565766965772D6E6F64652D66';
wwv_flow_api.g_varchar2_table(98) := '6F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D74726565766965772D6E6F64652D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D74726565766965772D6E6F64652D70616464696E672D793A20302E323572656D3B0D';
wwv_flow_api.g_varchar2_table(99) := '0A20202D2D612D74726565766965772D6E6F64652D70616464696E672D783A20302E323572656D3B0D0A20202D2D612D74726565766965772D6E6F64652D746578742D636F6C6F723A20696E68657269743B0D0A20202D2D612D74726565766965772D6E';
wwv_flow_api.g_varchar2_table(100) := '6F64652D666F63757365642D736861646F773A20696E7365742030203020302031707820726762612835372C203135352C203233342C20302E35293B0D0A20202D2D612D74726565766965772D6E6F64652D706C616365686F6C6465722D626F72646572';
wwv_flow_api.g_varchar2_table(101) := '2D7261646975733A20302E31323572656D3B0D0A20202D2D612D74726565766965772D647261672D68656C7065722D626F726465722D7261646975733A20302E31323572656D3B0D0A20202D2D612D636869702D70616464696E672D793A20302E313235';
wwv_flow_api.g_varchar2_table(102) := '72656D3B0D0A20202D2D612D636869702D70616464696E672D783A20302E31323572656D3B0D0A20202D2D612D636869702D73706163696E673A20302E323572656D3B0D0A20202D2D612D636869702D666F6E742D73697A653A20302E373572656D3B0D';
wwv_flow_api.g_varchar2_table(103) := '0A20202D2D612D636869702D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D636869702D6C6162656C2D73706163696E673A20302E323572656D3B0D0A20202D2D612D636869702D626F726465722D7261646975733A20302E31323572';
wwv_flow_api.g_varchar2_table(104) := '656D3B0D0A20202D2D612D636869702D626F726465722D77696474683A20766172282D2D612D6669656C642D696E7075742D626F726465722D7769647468293B0D0A20202D2D612D636869702D626F726465722D636F6C6F723A20766172282D2D612D66';
wwv_flow_api.g_varchar2_table(105) := '69656C642D696E7075742D626F726465722D636F6C6F72293B0D0A20202D2D612D636869702D686F7665722D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D612D636869';
wwv_flow_api.g_varchar2_table(106) := '702D6163746976652D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D612D636869702D6170706C6965642D6261636B67726F756E642D636F6C6F723A2072676261283235352C';
wwv_flow_api.g_varchar2_table(107) := '203235352C203235352C20302E303735293B0D0A20202D2D612D636869702D6170706C6965642D686F7665722D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D0A20202D2D612D636869';
wwv_flow_api.g_varchar2_table(108) := '702D72656D6F76652D686F7665722D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D612D636869702D72656D6F76652D6163746976652D6261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(109) := '723A2072676261283235352C203235352C203235352C20302E303735293B0D0A20202D2D612D636869702D6170706C6965642D69732D6163746976652D72656D6F76652D686F7665722D6261636B67726F756E642D636F6C6F723A207267626128323535';
wwv_flow_api.g_varchar2_table(110) := '2C203235352C203235352C20302E31293B0D0A20202D2D612D636869702D6170706C6965642D69732D6163746976652D72656D6F76652D6163746976652D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20';
wwv_flow_api.g_varchar2_table(111) := '302E32293B0D0A20202D2D612D636869702D696E7075742D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D636869702D696E7075742D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D636F6D626F2D73656C656374';
wwv_flow_api.g_varchar2_table(112) := '2D69636F6E2D73697A653A203172656D3B0D0A20202D2D612D746F6F6C7469702D666F6E742D73697A653A20302E3638373572656D3B0D0A20202D2D612D7370696E6E65722D73697A653A203272656D3B0D0A20202D2D612D7370696E6E65722D626F72';
wwv_flow_api.g_varchar2_table(113) := '6465722D77696474683A20302E323572656D3B0D0A20202D2D612D7370696E6E65722D636F6E7461696E65722D70616464696E673A20302E3572656D3B0D0A20202D2D612D6C6F76652D617065782D6D617267696E3A203020302E31323572656D3B0D0A';
wwv_flow_api.g_varchar2_table(114) := '20202D2D612D6C6F76652D617065782D686F7665722D746578742D636F6C6F723A20766172282D2D612D70616C657474652D64616E6765722C2023463030293B0D0A20202D2D6A75692D6469616C6F672D6261636B67726F756E642D636F6C6F723A2076';
wwv_flow_api.g_varchar2_table(115) := '6172282D2D75742D726567696F6E2D6261636B67726F756E642D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F7229293B0D0A20202D2D6A75692D6469616C6F672D746578742D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(116) := '766172282D2D75742D726567696F6E2D746578742D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F7229293B0D0A20202D2D6A75692D6469616C6F672D626F726465722D636F6C6F723A2076';
wwv_flow_api.g_varchar2_table(117) := '6172282D2D75742D726567696F6E2D626F726465722D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F7229293B0D0A20202D2D6A75692D6469616C6F672D626F726465722D77696474683A20303B0D0A2020';
wwv_flow_api.g_varchar2_table(118) := '2D2D6A75692D6469616C6F672D626F726465722D7261646975733A20766172282D2D75742D726567696F6E2D626F726465722D7261646975732C20766172282D2D75742D636F6D706F6E656E742D626F726465722D72616469757329293B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(119) := '6A75692D6469616C6F672D736861646F773A20766172282D2D75742D736861646F772D6C67292C2030203020302031707820766172282D2D75742D726567696F6E2D626F726465722D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D62';
wwv_flow_api.g_varchar2_table(120) := '6F726465722D636F6C6F7229293B0D0A20202D2D6A75692D6469616C6F672D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D6A75692D6469616C6F672D7469746C656261722D70616464696E672D793A20302E373572656D3B0D0A20202D';
wwv_flow_api.g_varchar2_table(121) := '2D6A75692D6469616C6F672D7469746C656261722D70616464696E672D783A203172656D3B0D0A20202D2D6A75692D6469616C6F672D7469746C656261722D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D6A';
wwv_flow_api.g_varchar2_table(122) := '75692D6469616C6F672D7469746C656261722D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D7469746C652D636F6C6F72293B0D0A20202D2D6A75692D6469616C6F672D7469746C656261722D626F72646572';
wwv_flow_api.g_varchar2_table(123) := '2D77696474683A20766172282D2D75742D726567696F6E2D626F726465722D77696474682C20766172282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C2031707829293B0D0A20202D2D6A75692D6469616C6F672D7469746C6562';
wwv_flow_api.g_varchar2_table(124) := '61722D626F726465722D636F6C6F723A20766172282D2D75742D726567696F6E2D626F726465722D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F7229293B0D0A20202D2D6A75692D6469616C6F672D7469';
wwv_flow_api.g_varchar2_table(125) := '746C652D666F6E742D73697A653A203172656D3B0D0A20202D2D6A75692D6469616C6F672D7469746C652D6C696E652D6865696768743A20312E3572656D3B0D0A20202D2D6A75692D6469616C6F672D7469746C652D636C6F73652D77696474683A2031';
wwv_flow_api.g_varchar2_table(126) := '2E3572656D3B0D0A20202D2D6A75692D6469616C6F672D7469746C652D636C6F73652D6865696768743A20312E3572656D3B0D0A20202D2D6A75692D6469616C6F672D7469746C652D636C6F73652D70616464696E672D793A20302E3572656D3B0D0A20';
wwv_flow_api.g_varchar2_table(127) := '202D2D6A75692D6469616C6F672D7469746C652D636C6F73652D70616464696E672D783A20302E3572656D3B0D0A20202D2D6A75692D6469616C6F672D7469746C652D636C6F73652D626F726465722D7261646975733A20766172282D2D612D62757474';
wwv_flow_api.g_varchar2_table(128) := '6F6E2D626F726465722D7261646975732C20302E31323572656D293B0D0A20202D2D6A75692D6469616C6F672D7469746C652D636C6F73652D626F726465722D636F6C6F723A20766172282D2D612D627574746F6E2D626F726465722D636F6C6F72293B';
wwv_flow_api.g_varchar2_table(129) := '0D0A20202D2D6A75692D6469616C6F672D7469746C652D636C6F73652D69636F6E2D73697A653A203172656D3B0D0A20202D2D6A75692D6469616C6F672D636F6E74656E742D70616464696E672D793A203072656D3B0D0A20202D2D6A75692D6469616C';
wwv_flow_api.g_varchar2_table(130) := '6F672D636F6E74656E742D70616464696E672D783A203072656D3B0D0A20202D2D6A75692D6469616C6F672D627574746F6E70616E652D636F6E74656E742D70616464696E672D793A20302E373572656D3B0D0A20202D2D6A75692D6469616C6F672D62';
wwv_flow_api.g_varchar2_table(131) := '7574746F6E70616E652D636F6E74656E742D70616464696E672D783A203172656D3B0D0A20202D2D6A75692D6469616C6F672D627574746F6E70616E652D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465';
wwv_flow_api.g_varchar2_table(132) := '722D636F6C6F72293B0D0A20202D2D6A75692D646174657069636B65722D77696474683A2031372E3572656D3B0D0A20202D2D6A75692D646174657069636B65722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D636F6D706F6E65';
wwv_flow_api.g_varchar2_table(133) := '6E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6A75692D646174657069636B65722D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D6A75692D64';
wwv_flow_api.g_varchar2_table(134) := '6174657069636B65722D626F726465722D7261646975733A20302E3572656D3B0D0A20202D2D6A75692D646174657069636B65722D70616464696E673A20302E3572656D3B0D0A20202D2D6A75692D746F6F6C7469702D626F726465722D726164697573';
wwv_flow_api.g_varchar2_table(135) := '3A20302E31323572656D3B0D0A20202D2D6A75692D746F6F6C7469702D70616464696E673A20302E3572656D3B0D0A20202D2D6F6A65742D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D6F6A65742D736D616C6C2D666F6E742D7369';
wwv_flow_api.g_varchar2_table(136) := '7A653A20302E373572656D3B0D0A20202D2D6F6A65742D6D656469756D2D666F6E742D73697A653A203172656D3B0D0A20202D2D6F6A65742D6C617267652D666F6E742D73697A653A20312E31323572656D3B0D0A20202D2D6F6A65742D6C6172676572';
wwv_flow_api.g_varchar2_table(137) := '2D666F6E742D73697A653A20312E323572656D3B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D636F6C6F722D736368656D653A206461726B3B0D0A20202D2D75742D70616C657474652D67656E657269633A20233064306430643B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(138) := '75742D70616C657474652D67656E657269632D636F6E74726173743A20236666663B0D0A20202D2D75742D70616C657474652D67656E657269632D73686164653A20233036303630363B0D0A20202D2D75742D70616C657474652D67656E657269632D74';
wwv_flow_api.g_varchar2_table(139) := '6578743A20236666663B0D0A20202D2D612D67762D6865616465722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D726567696F6E2D6865616465722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D75742D7265706F';
wwv_flow_api.g_varchar2_table(140) := '72742D63656C6C2D616C742D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D75742D7265706F72742D6865616465722D6261636B67726F756E642D636F6C6F723A2072676261';
wwv_flow_api.g_varchar2_table(141) := '283235352C203235352C203235352C20302E303235293B0D0A20202D2D75742D6865616465722D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D0A20202D2D75742D6865616465722D626F782D73';
wwv_flow_api.g_varchar2_table(142) := '6861646F773A20766172282D2D75742D736861646F772D736D293B0D0A20202D2D75742D666F6F7465722D6261636B67726F756E642D636F6C6F723A20233064306430643B0D0A20202D2D75742D666F6F7465722D626F726465722D636F6C6F723A2072';
wwv_flow_api.g_varchar2_table(143) := '676261283235352C203235352C203235352C20302E31293B0D0A20202D2D75742D666F6F7465722D6974656D2D73706163696E673A20302E373572656D3B0D0A20202D2D75742D6E6176746162732D6974656D2D626F726465722D77696474683A203170';
wwv_flow_api.g_varchar2_table(144) := '783B0D0A20202D2D75742D6E6176746162732D6974656D2D686967686C696768742D636F6C6F723A207472616E73706172656E743B0D0A20202D2D75742D6E6176746162732D6974656D2D686967686C696768742D77696474683A203072656D3B0D0A20';
wwv_flow_api.g_varchar2_table(145) := '202D2D75742D6E6176746162732D6974656D2D6163746976652D686967686C696768742D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D75742D6E61766261722D627574746F6E2D62616467652D6261';
wwv_flow_api.g_varchar2_table(146) := '636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E33293B0D0A20202D2D75742D6E61766261722D627574746F6E2D62616467652D626F726465722D7261646975733A20313670783B0D0A20202D2D75742D626F64792D6E61';
wwv_flow_api.g_varchar2_table(147) := '762D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D75742D626F64792D7469746C652D626F726465722D77696474683A203070783B0D0A20202D2D75742D626F6479';
wwv_flow_api.g_varchar2_table(148) := '2D7469746C652D626F782D736861646F773A203020317078203020302072676261283235352C203235352C203235352C20302E3135293B0D0A20202D2D75742D626F64792D7469746C652D6261636B64726F702D66696C7465723A207361747572617465';
wwv_flow_api.g_varchar2_table(149) := '28313830252920626C757228387078293B0D0A20202D2D75742D62726561646372756D622D726567696F6E2D73706163696E673A20302E3572656D3B0D0A20202D2D75742D62726561646372756D622D6974656D2D6163746976652D746578742D636F6C';
wwv_flow_api.g_varchar2_table(150) := '6F723A20766172282D2D75742D626F64792D7469746C652D746578742D636F6C6F72293B0D0A20202D2D75742D736D6172742D66696C7465722D6D61782D77696474683A20333072656D3B0D0A20202D2D75742D6865726F2D726567696F6E2D7469746C';
wwv_flow_api.g_varchar2_table(151) := '652D746578742D636F6C6F723A20766172282D2D75742D626F64792D7469746C652D746578742D636F6C6F72293B0D0A20202D2D75742D726567696F6E2D626F726465722D77696474683A203170783B0D0A20202D2D75742D726567696F6E2D626F782D';
wwv_flow_api.g_varchar2_table(152) := '736861646F773A20766172282D2D75742D736861646F772D736D293B0D0A20202D2D75742D726567696F6E2D6D617267696E3A203172656D3B0D0A20202D2D75742D726567696F6E2D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D75';
wwv_flow_api.g_varchar2_table(153) := '742D726567696F6E2D6C696E652D6865696768743A20312E323572656D3B0D0A20202D2D75742D726567696F6E2D6865616465722D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E303735293B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(154) := '75742D726567696F6E2D626F64792D70616464696E672D793A203172656D3B0D0A20202D2D75742D726567696F6E2D626F64792D70616464696E672D783A203172656D3B0D0A20202D2D75742D726567696F6E2D627574746F6E732D70616464696E672D';
wwv_flow_api.g_varchar2_table(155) := '793A20302E3572656D3B0D0A20202D2D75742D726567696F6E2D627574746F6E732D70616464696E672D783A20302E373572656D3B0D0A20202D2D75742D627574746F6E2D726567696F6E2D626F782D736861646F773A20766172282D2D75742D736861';
wwv_flow_api.g_varchar2_table(156) := '646F772D736D293B0D0A20202D2D75742D636865636B626F782D6974656D2D73706163696E673A203172656D3B0D0A20202D2D75742D78732D6669656C642D696E7075742D666F6E742D73697A653A203172656D3B0D0A20202D2D75742D78732D666965';
wwv_flow_api.g_varchar2_table(157) := '6C642D696E7075742D6C696E652D6865696768743A20312E323572656D3B0D0A20202D2D75742D6C6F67696E2D706167652D6261636B67726F756E642D636F6C6F723A20233139313931393B0D0A20202D2D75742D6C6F67696E2D726567696F6E2D6261';
wwv_flow_api.g_varchar2_table(158) := '636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3635293B0D0A20202D2D75742D6C6F67696E2D726567696F6E2D66696C7465723A20626C757228347078293B0D0A20202D2D75742D6C6F67696E2D726567696F6E2D626F';
wwv_flow_api.g_varchar2_table(159) := '782D736861646F773A20766172282D2D75742D736861646F772D6C67293B0D0A20202D2D612D66732D746F67676C652D626F726465722D636F6C6F723A20766172282D2D612D627574746F6E2D626F726465722D636F6C6F72293B0D0A20202D2D612D66';
wwv_flow_api.g_varchar2_table(160) := '732D746F67676C652D626F726465722D77696474683A20766172282D2D612D627574746F6E2D626F726465722D7769647468293B0D0A20202D2D612D66732D746F67676C652D626F726465722D7261646975733A20766172282D2D612D627574746F6E2D';
wwv_flow_api.g_varchar2_table(161) := '626F726465722D726164697573293B0D0A20202D2D612D66732D746F67676C652D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D66732D746F67676C652D6261636B67726F756E64';
wwv_flow_api.g_varchar2_table(162) := '2D636F6C6F723A20766172282D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D66732D7365617263682D636F6E7461696E65722D626F726465722D77696474683A20766172282D2D612D627574746F6E2D626F';
wwv_flow_api.g_varchar2_table(163) := '726465722D7769647468293B0D0A20202D2D612D66732D7365617263682D636F6E7461696E65722D626F726465722D636F6C6F723A20766172282D2D612D627574746F6E2D626F726465722D636F6C6F72293B0D0A20202D2D75742D616C6572742D7469';
wwv_flow_api.g_varchar2_table(164) := '746C652D666F6E742D7765696768743A20766172282D2D612D626173652D666F6E742D7765696768742D73656D69626F6C642C20353030293B0D0A20202D2D75742D616C6572742D626F782D736861646F773A20766172282D2D75742D736861646F772D';
wwv_flow_api.g_varchar2_table(165) := '736D293B0D0A20202D2D6D672D6374726C2D67726F75702D627574746F6E2D746578742D636F6C6F723A20233030303B0D0A20202D2D6D672D706F7075702D636F6E74656E742D626F782D736861646F773A20766172282D2D75742D736861646F772D6C';
wwv_flow_api.g_varchar2_table(166) := '67293B0D0A20202D2D612D6D61702D6C6567656E642D7469746C652D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D75742D636172646C6973742D626F782D73';
wwv_flow_api.g_varchar2_table(167) := '6861646F773A20766172282D2D75742D736861646F772D736D293B0D0A20202D2D75742D6C696E6B736C6973742D6172726F772D636F6C6F723A2072676261283235352C203235352C203235352C20302E32293B0D0A20202D2D75742D746162732D6974';
wwv_flow_api.g_varchar2_table(168) := '656D2D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A20202D2D75742D746162732D6974656D2D6163746976652D746578742D636F6C6F723A20766172282D2D7574';
wwv_flow_api.g_varchar2_table(169) := '2D6C696E6B2D746578742D636F6C6F72293B0D0A20202D2D75742D746162732D6974656D2D68696E742D686967686C696768742D636F6C6F723A2072676261283235352C203235352C203235352C20302E32293B0D0A20202D2D75742D746162732D6974';
wwv_flow_api.g_varchar2_table(170) := '656D2D6163746976652D666F6E742D7765696768743A20766172282D2D612D626173652D666F6E742D7765696768742D626F6C642C20373030293B0D0A20202D2D75742D636F6D6D656E742D636861742D6261636B67726F756E642D636F6C6F723A2072';
wwv_flow_api.g_varchar2_table(171) := '676261283235352C203235352C203235352C20302E31293B0D0A20202D2D75742D77702D6D61726B65722D636F6C6F723A20233236323632363B0D0A20202D2D75742D77702D747261636B2D636F6C6F723A20233236323632363B0D0A20202D2D66632D';
wwv_flow_api.g_varchar2_table(172) := '6E65757472616C2D62672D636F6C6F723A2072676261283235352C203235352C203235352C20302E32293B0D0A20202D2D66632D6E65757472616C2D746578742D636F6C6F723A20236666663B0D0A20202D2D66632D6576656E742D73656C6563746564';
wwv_flow_api.g_varchar2_table(173) := '2D6F7665726C61792D636F6C6F723A2072676261283235352C203235352C203235352C20302E32293B0D0A20202D2D66632D6E6F6E2D627573696E6573732D636F6C6F723A2072676261283235352C203235352C203235352C20302E32293B0D0A20202D';
wwv_flow_api.g_varchar2_table(174) := '2D75742D616C7465726E6174652D68656164696E672D666F6E742D66616D696C793A20766172282D2D612D626173652D666F6E742D66616D696C792D7365726966293B0D0A20202D2D75742D616C7465726E6174652D68656164696E672D666F6E742D77';
wwv_flow_api.g_varchar2_table(175) := '65696768743A20766172282D2D612D626173652D666F6E742D7765696768742D6E6F726D616C293B0D0A20202D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D';
wwv_flow_api.g_varchar2_table(176) := '0A20202D2D75742D636F6D706F6E656E742D626F726465722D77696474683A203170783B0D0A20202D2D75742D636F6D706F6E656E742D626F726465722D7261646975733A20302E323572656D3B0D0A20202D2D75742D636F6D706F6E656E742D626F78';
wwv_flow_api.g_varchar2_table(177) := '2D736861646F773A20766172282D2D75742D736861646F772D6C67293B0D0A20202D2D75742D636F6D706F6E656E742D686967686C696768742D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3032';
wwv_flow_api.g_varchar2_table(178) := '35293B0D0A20202D2D75742D636F6D706F6E656E742D746F6F6C6261722D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D75742D636F6D706F6E656E742D696E6E65722D';
wwv_flow_api.g_varchar2_table(179) := '626F726465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F726465722D7769647468293B0D0A20202D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F723A2072676261283235352C203235352C';
wwv_flow_api.g_varchar2_table(180) := '203235352C20302E31293B0D0A20202D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F723A20236666663B0D0A20202D2D75742D636F6D706F6E656E742D746578742D7469746C652D636F6C6F723A20236666663B0D0A20';
wwv_flow_api.g_varchar2_table(181) := '202D2D75742D636F6D706F6E656E742D746578742D7375627469746C652D636F6C6F723A2072676261283235352C203235352C203235352C20302E3835293B0D0A20202D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(182) := '72676261283235352C203235352C203235352C20302E3635293B0D0A20202D2D75742D636F6D706F6E656E742D69636F6E2D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(183) := '75742D636F6D706F6E656E742D69636F6E2D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D636F6E7472617374293B0D0A20202D2D75742D636F6D706F6E656E742D62616467652D6261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(184) := '723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D75742D636F6D706F6E656E742D62616467652D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C';
wwv_flow_api.g_varchar2_table(185) := '6F72293B0D0A20202D2D75742D636F6D706F6E656E742D62616467652D626F726465722D7261646975733A20302E323572656D3B0D0A20202D2D75742D736861646F772D736D3A203020302E31323572656D20302E323572656D202D302E31323572656D';
wwv_flow_api.g_varchar2_table(186) := '207267626128302C20302C20302C20302E31293B0D0A20202D2D75742D736861646F772D6D643A203020302E373572656D20312E3572656D202D302E373572656D207267626128302C20302C20302C20302E33293B0D0A20202D2D75742D736861646F77';
wwv_flow_api.g_varchar2_table(187) := '2D6C673A203020312E3572656D203372656D202D312E3572656D207267626128302C20302C20302C20302E33293B0D0A20202D2D75742D626F726465722D7261646975732D736D3A20302E31323572656D3B0D0A20202D2D75742D626F726465722D7261';
wwv_flow_api.g_varchar2_table(188) := '646975732D6D643A20302E323572656D3B0D0A20202D2D75742D626F726465722D7261646975732D6C673A20302E3572656D3B0D0A20202D2D75742D626F726465722D7261646975733A20766172282D2D75742D626F726465722D7261646975732D6D64';
wwv_flow_api.g_varchar2_table(189) := '293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D70616C657474652D7072696D6172793A20236337343633343B0D0A20202D2D75742D70616C657474652D7072696D6172792D636F6E74726173743A20236666666666663B0D0A20202D2D75742D';
wwv_flow_api.g_varchar2_table(190) := '70616C657474652D7072696D6172792D73686164653A20233134303730353B0D0A20202D2D75742D70616C657474652D7072696D6172792D746578743A20766172282D2D612D70616C657474652D7072696D617279293B0D0A7D0D0A3A726F6F74207B0D';
wwv_flow_api.g_varchar2_table(191) := '0A20202D2D75742D6C696E6B2D746578742D636F6C6F723A20236464386137653B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D666F6375732D6F75746C696E652D636F6C6F723A20236337343633343B0D0A7D0D0A3A726F6F74207B0D0A20202D';
wwv_flow_api.g_varchar2_table(192) := '2D75742D636F6D706F6E656E742D626F726465722D7261646975733A203270783B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D6865616465722D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D75742D68656164';
wwv_flow_api.g_varchar2_table(193) := '65722D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D6261636B67726F756E642D636F6C6F723A20233331326432613B0D0A20202D2D75742D626F64792D746578742D636F6C6F723A';
wwv_flow_api.g_varchar2_table(194) := '20236666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D616374696F6E732D6261636B67726F756E642D636F6C6F723A20233335333132653B0D0A20202D2D75742D626F64792D616374696F6E732D746578742D636F6C6F';
wwv_flow_api.g_varchar2_table(195) := '723A20236666666666663B0D0A20202D2D75742D626F64792D616374696F6E73746F67676C652D6261636B67726F756E642D636F6C6F723A20233335333132653B0D0A20202D2D75742D626F64792D616374696F6E73746F67676C652D686F7665722D62';
wwv_flow_api.g_varchar2_table(196) := '61636B67726F756E642D636F6C6F723A20233531346134353B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D7469746C652D6261636B67726F756E642D636F6C6F723A20233339333533313B0D0A20202D2D75742D626F64792D746974';
wwv_flow_api.g_varchar2_table(197) := '6C652D746578742D636F6C6F723A20236666666666663B0D0A20202D2D75742D62726561646372756D622D6974656D2D746578742D636F6C6F723A2072676261283235352C203235352C203235352C20302E3635293B0D0A7D0D0A3A726F6F74207B0D0A';
wwv_flow_api.g_varchar2_table(198) := '20202D2D75742D626F64792D736964656261722D6261636B67726F756E642D636F6C6F723A20233366336133363B0D0A20202D2D75742D626F64792D736964656261722D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B';
wwv_flow_api.g_varchar2_table(199) := '0D0A20202D2D75742D626F64792D6E61762D6261636B67726F756E642D636F6C6F723A20233461346134613B0D0A20202D2D75742D626F64792D6E61762D746578742D636F6C6F723A20236666666666663B0D0A20202D2D75742D626F64792D6E61762D';
wwv_flow_api.g_varchar2_table(200) := '7363726F6C6C6261722D7468756D622D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E32293B0D0A20202D2D75742D626F64792D6E61762D7363726F6C6C6261722D747261636B2D6261636B67726F';
wwv_flow_api.g_varchar2_table(201) := '756E642D636F6C6F723A20233461346134613B0D0A20202D2D75742D6E6176746162732D6261636B67726F756E642D636F6C6F723A20233461346134613B0D0A20202D2D75742D6E6176746162732D746578742D636F6C6F723A20236666666666663B0D';
wwv_flow_api.g_varchar2_table(202) := '0A20202D2D75742D6E6176746162732D6974656D2D626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A20202D2D75742D6E6176746162732D6974656D2D6163746976652D6261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(203) := '20233331333133313B0D0A20202D2D75742D6E6176746162732D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D6E6176746162732D6974656D2D6163746976652D6261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(204) := '293B0D0A20202D2D75742D6865616465722D6D656E756261722D6261636B67726F756E642D636F6C6F723A20233461346134613B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D746578742D636F6C6F723A2023666666666666';
wwv_flow_api.g_varchar2_table(205) := '3B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D63757272656E742D6261636B67726F756E642D636F6C6F723A20233331333133313B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D63757272656E74';
wwv_flow_api.g_varchar2_table(206) := '2D746578742D636F6C6F723A20236666666666663B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D6865616465722D6D656E756261722D6974';
wwv_flow_api.g_varchar2_table(207) := '656D2D63757272656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D686F7665722D746578742D636F6C6F723A20766172282D2D75742D6865616465722D6D656E756261722D';
wwv_flow_api.g_varchar2_table(208) := '6974656D2D63757272656E742D746578742D636F6C6F72293B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A20202D2D75742D68656164';
wwv_flow_api.g_varchar2_table(209) := '65722D6D656E756261722D6974656D2D73706C69742D69636F6E2D636F6C6F723A20236666666666663B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D73706C69742D626F726465722D636F6C6F723A207267626128302C2030';
wwv_flow_api.g_varchar2_table(210) := '2C20302C20302E31293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D74726565766965772D6E6F64652D73656C65637465642D6261636B67726F756E642D636F6C6F723A20233331333133313B0D0A20202D2D612D74726565766965772D6E6F6465';
wwv_flow_api.g_varchar2_table(211) := '2D73656C65637465642D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D74726565766965772D6E6F64652D666F63757365642D6261636B67726F756E642D636F6C6F723A20233331333133313B0D0A20202D2D612D747265657669';
wwv_flow_api.g_varchar2_table(212) := '65772D6E6F64652D666F63757365642D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D74726565766965772D6E6F64652D73656C65637465642D69636F6E2D636F6C6F723A20236666666666663B0D';
wwv_flow_api.g_varchar2_table(213) := '0A20202D2D612D74726565766965772D6E6F64652D69636F6E2D636F6C6F723A20696E68657269743B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D74726565766965772D62616467652D6261636B67726F756E642D636F6C6F723A202363373436';
wwv_flow_api.g_varchar2_table(214) := '33343B0D0A20202D2D75742D74726565766965772D62616467652D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D6D656E752D6261636B67726F756E642D636F6C6F723A20233236323332313B0D0A';
wwv_flow_api.g_varchar2_table(215) := '20202D2D612D6D656E752D746578742D636F6C6F723A20236663666366633B0D0A20202D2D612D6D656E752D64656661756C742D746578742D636F6C6F723A20766172282D2D612D6D656E752D746578742D636F6C6F72293B0D0A20202D2D612D6D656E';
wwv_flow_api.g_varchar2_table(216) := '752D616363656C2D746578742D636F6C6F723A20766172282D2D612D6D656E752D746578742D636F6C6F72293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D6D656E752D666F63757365642D6261636B67726F756E642D636F6C6F723A2023633734';
wwv_flow_api.g_varchar2_table(217) := '3633343B0D0A20202D2D612D6D656E752D666F63757365642D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D6D656E752D666F63757365642D616363656C2D746578742D636F6C6F723A20766172282D2D612D6D656E752D666F63';
wwv_flow_api.g_varchar2_table(218) := '757365642D746578742D636F6C6F72293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D726567696F6E2D6865616465722D6261636B67726F756E642D636F6C6F723A20233162313931373B0D0A20202D2D75742D726567696F6E2D686561646572';
wwv_flow_api.g_varchar2_table(219) := '2D746578742D636F6C6F723A20236632663266323B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D726567696F6E2D6261636B67726F756E642D636F6C6F723A20233236323332313B0D0A20202D2D75742D726567696F6E2D746578742D636F6C6F';
wwv_flow_api.g_varchar2_table(220) := '723A20236663666366633B0D0A20202D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F723A20233236323332313B0D0A20202D2D75742D77697A6172642D6865616465722D6261636B67726F756E642D636F6C6F723A20233263';
wwv_flow_api.g_varchar2_table(221) := '323832353B0D0A20202D2D75742D7265706F72742D63656C6C2D626F726465722D636F6C6F723A20233431336333383B0D0A20202D2D75742D7265706F72742D63656C6C2D686F7665722D6261636B67726F756E642D636F6C6F723A2023326332383235';
wwv_flow_api.g_varchar2_table(222) := '3B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D70616C657474652D7072696D6172792D616C743A20236634643764333B0D0A20202D2D75742D70616C657474652D7072696D6172792D616C742D636F6E74726173743A20233339313430663B0D0A';
wwv_flow_api.g_varchar2_table(223) := '20202D2D75742D70616C657474652D7072696D6172792D616C742D73686164653A20233063306230623B0D0A20202D2D75742D70616C657474652D7072696D6172792D616C742D746578743A20236131373937343B0D0A7D0D0A3A726F6F74207B0D0A20';
wwv_flow_api.g_varchar2_table(224) := '202D2D75742D70616C657474652D737563636573733A20233338383732393B0D0A20202D2D75742D70616C657474652D737563636573732D636F6E74726173743A20234646463B0D0A20202D2D75742D70616C657474652D737563636573732D73686164';
wwv_flow_api.g_varchar2_table(225) := '653A20233063316530393B0D0A20202D2D75742D70616C657474652D737563636573732D746578743A20233535376434653B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D70616C657474652D696E666F3A20233030364244383B0D0A20202D2D75';
wwv_flow_api.g_varchar2_table(226) := '742D70616C657474652D696E666F2D636F6E74726173743A20234646463B0D0A20202D2D75742D70616C657474652D696E666F2D73686164653A20233030313833303B0D0A20202D2D75742D70616C657474652D696E666F2D746578743A202334303735';
wwv_flow_api.g_varchar2_table(227) := '61633B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D70616C657474652D7761726E696E673A20234642434534413B0D0A20202D2D75742D70616C657474652D7761726E696E672D636F6E74726173743A20233030303B0D0A20202D2D75742D7061';
wwv_flow_api.g_varchar2_table(228) := '6C657474652D7761726E696E672D73686164653A20233337326431303B0D0A20202D2D75742D70616C657474652D7761726E696E672D746578743A20233861373433323B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D70616C657474652D64616E';
wwv_flow_api.g_varchar2_table(229) := '6765723A20234545303730313B0D0A20202D2D75742D70616C657474652D64616E6765722D636F6E74726173743A20234646463B0D0A20202D2D75742D70616C657474652D64616E6765722D73686164653A20233334303230303B0D0A20202D2D75742D';
wwv_flow_api.g_varchar2_table(230) := '70616C657474652D64616E6765722D746578743A20236237343334303B0D0A7D0D0A3A726F6F74207B0D0A20202D2D752D636F6C6F722D313A20233330394644423B0D0A20202D2D752D636F6C6F722D312D636F6E74726173743A20236666666666663B';
wwv_flow_api.g_varchar2_table(231) := '0D0A20202D2D752D636F6C6F722D323A20233133423643463B0D0A20202D2D752D636F6C6F722D322D636F6E74726173743A20236534663966643B0D0A20202D2D752D636F6C6F722D333A20233245424642433B0D0A20202D2D752D636F6C6F722D332D';
wwv_flow_api.g_varchar2_table(232) := '636F6E74726173743A20236630666366623B0D0A20202D2D752D636F6C6F722D343A20233343414638353B0D0A20202D2D752D636F6C6F722D342D636F6E74726173743A20236630666166363B0D0A20202D2D752D636F6C6F722D353A20233831424235';
wwv_flow_api.g_varchar2_table(233) := '463B0D0A20202D2D752D636F6C6F722D352D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D363A20234444444535333B0D0A20202D2D752D636F6C6F722D362D636F6E74726173743A20233261326130383B0D0A20202D';
wwv_flow_api.g_varchar2_table(234) := '2D752D636F6C6F722D373A20234642434534413B0D0A20202D2D752D636F6C6F722D372D636F6E74726173743A20233434333330323B0D0A20202D2D752D636F6C6F722D383A20234544383133453B0D0A20202D2D752D636F6C6F722D382D636F6E7472';
wwv_flow_api.g_varchar2_table(235) := '6173743A20236666666666663B0D0A20202D2D752D636F6C6F722D393A20234539354235343B0D0A20202D2D752D636F6C6F722D392D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D31303A20234538354438383B0D0A';
wwv_flow_api.g_varchar2_table(236) := '20202D2D752D636F6C6F722D31302D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D31313A20234341353839443B0D0A20202D2D752D636F6C6F722D31312D636F6E74726173743A20236666666666663B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(237) := '752D636F6C6F722D31323A20233835344539423B0D0A20202D2D752D636F6C6F722D31322D636F6E74726173743A20236636663066383B0D0A20202D2D752D636F6C6F722D31333A20233541363841443B0D0A20202D2D752D636F6C6F722D31332D636F';
wwv_flow_api.g_varchar2_table(238) := '6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D31343A20234146424143353B0D0A20202D2D752D636F6C6F722D31342D636F6E74726173743A20233331336134343B0D0A20202D2D752D636F6C6F722D31353A202336453835';
wwv_flow_api.g_varchar2_table(239) := '39383B0D0A20202D2D752D636F6C6F722D31352D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D31363A20233539623265323B0D0A20202D2D752D636F6C6F722D31362D636F6E74726173743A20236666666666663B0D';
wwv_flow_api.g_varchar2_table(240) := '0A20202D2D752D636F6C6F722D31373A20233432633564393B0D0A20202D2D752D636F6C6F722D31372D636F6E74726173743A20233035313531373B0D0A20202D2D752D636F6C6F722D31383A20233538636363393B0D0A20202D2D752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(241) := '31382D636F6E74726173743A20233039316331633B0D0A20202D2D752D636F6C6F722D31393A20233633626639643B0D0A20202D2D752D636F6C6F722D31392D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32303A20';
wwv_flow_api.g_varchar2_table(242) := '233961633937663B0D0A20202D2D752D636F6C6F722D32302D636F6E74726173743A20233230333331363B0D0A20202D2D752D636F6C6F722D32313A20236534653537353B0D0A20202D2D752D636F6C6F722D32312D636F6E74726173743A2023346334';
wwv_flow_api.g_varchar2_table(243) := '6330663B0D0A20202D2D752D636F6C6F722D32323A20236663643836653B0D0A20202D2D752D636F6C6F722D32322D636F6E74726173743A20233639346630323B0D0A20202D2D752D636F6C6F722D32333A20236631396136353B0D0A20202D2D752D63';
wwv_flow_api.g_varchar2_table(244) := '6F6C6F722D32332D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32343A20236564376337363B0D0A20202D2D752D636F6C6F722D32342D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F72';
wwv_flow_api.g_varchar2_table(245) := '2D32353A20236564376461303B0D0A20202D2D752D636F6C6F722D32352D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32363A20236435373962313B0D0A20202D2D752D636F6C6F722D32362D636F6E74726173743A';
wwv_flow_api.g_varchar2_table(246) := '20236666666666663B0D0A20202D2D752D636F6C6F722D32373A20233964373161663B0D0A20202D2D752D636F6C6F722D32372D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32383A20233762383662643B0D0A2020';
wwv_flow_api.g_varchar2_table(247) := '2D2D752D636F6C6F722D32382D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32393A20236266633864313B0D0A20202D2D752D636F6C6F722D32392D636F6E74726173743A20233364343835343B0D0A20202D2D752D';
wwv_flow_api.g_varchar2_table(248) := '636F6C6F722D33303A20233862396461643B0D0A20202D2D752D636F6C6F722D33302D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D33313A20233139386363613B0D0A20202D2D752D636F6C6F722D33312D636F6E74';
wwv_flow_api.g_varchar2_table(249) := '726173743A20236536663466633B0D0A20202D2D752D636F6C6F722D33323A20233032613562653B0D0A20202D2D752D636F6C6F722D33322D636F6E74726173743A20236331663666653B0D0A20202D2D752D636F6C6F722D33333A2023313862316165';
wwv_flow_api.g_varchar2_table(250) := '3B0D0A20202D2D752D636F6C6F722D33332D636F6E74726173743A20236430663966383B0D0A20202D2D752D636F6C6F722D33343A20233234613437353B0D0A20202D2D752D636F6C6F722D33342D636F6E74726173743A20236432663565383B0D0A20';
wwv_flow_api.g_varchar2_table(251) := '202D2D752D636F6C6F722D33353A20233661616434323B0D0A20202D2D752D636F6C6F722D33352D636F6E74726173743A20236636666266343B0D0A20202D2D752D636F6C6F722D33363A20236339636133393B0D0A20202D2D752D636F6C6F722D3336';
wwv_flow_api.g_varchar2_table(252) := '2D636F6E74726173743A20233033303330313B0D0A20202D2D752D636F6C6F722D33373A20236439623133623B0D0A20202D2D752D636F6C6F722D33372D636F6E74726173743A20233132306530333B0D0A20202D2D752D636F6C6F722D33383A202364';
wwv_flow_api.g_varchar2_table(253) := '37366132373B0D0A20202D2D752D636F6C6F722D33382D636F6E74726173743A20236666666666653B0D0A20202D2D752D636F6C6F722D33393A20236432343233623B0D0A20202D2D752D636F6C6F722D33392D636F6E74726173743A20236666666666';
wwv_flow_api.g_varchar2_table(254) := '663B0D0A20202D2D752D636F6C6F722D34303A20236431343336663B0D0A20202D2D752D636F6C6F722D34302D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D34313A20236261336438383B0D0A20202D2D752D636F6C';
wwv_flow_api.g_varchar2_table(255) := '6F722D34312D636F6E74726173743A20236664663966623B0D0A20202D2D752D636F6C6F722D34323A20233737333339333B0D0A20202D2D752D636F6C6F722D34322D636F6E74726173743A20236538643566303B0D0A20202D2D752D636F6C6F722D34';
wwv_flow_api.g_varchar2_table(256) := '333A20233364346561333B0D0A20202D2D752D636F6C6F722D34332D636F6E74726173743A20236538656266363B0D0A20202D2D752D636F6C6F722D34343A20233863396562303B0D0A20202D2D752D636F6C6F722D34342D636F6E74726173743A2023';
wwv_flow_api.g_varchar2_table(257) := '6666666666663B0D0A20202D2D752D636F6C6F722D34353A20233465373339313B0D0A20202D2D752D636F6C6F722D34352D636F6E74726173743A20236561656666343B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D627574746F6E2D626F726465';
wwv_flow_api.g_varchar2_table(258) := '722D7261646975733A20302E31323572656D3B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20233466346434633B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(259) := '6666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D6669656C642D6C6162656C2D746578742D636F6C6F723A20236663666366633B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D6669656C642D696E7075742D626F726465722D72';
wwv_flow_api.g_varchar2_table(260) := '61646975733A203270783B0D0A20202D2D612D66696C6564726F702D626F726465722D7261646975733A203270783B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D6669656C642D696E7075742D6261636B67726F756E642D636F6C6F723A20233264';
wwv_flow_api.g_varchar2_table(261) := '323932363B0D0A20202D2D612D6669656C642D696E7075742D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D6669656C642D696E7075742D626F726465722D636F6C6F723A20233438343233653B0D0A20202D2D612D6669656C64';
wwv_flow_api.g_varchar2_table(262) := '2D696E7075742D686F7665722D6261636B67726F756E642D636F6C6F723A20233166316431623B0D0A20202D2D612D6669656C642D696E7075742D666F6375732D6261636B67726F756E642D636F6C6F723A20233131313030663B0D0A20202D2D612D66';
wwv_flow_api.g_varchar2_table(263) := '69656C642D696E7075742D666F6375732D626F726465722D636F6C6F723A20236337343633343B0D0A20202D2D75742D6669656C642D696E7075742D666F6375732D69636F6E2D636F6C6F723A20236337343633343B0D0A20202D2D75742D6669656C64';
wwv_flow_api.g_varchar2_table(264) := '2D666C2D696E7075742D666F6375732D69636F6E2D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D75742D6669656C642D666C2D696E7075742D666F6375732D69636F6E2D636F6C6F723A20236666666666663B0D0A20';
wwv_flow_api.g_varchar2_table(265) := '202D2D612D636865636B626F782D6261636B67726F756E642D636F6C6F723A20233264323932363B0D0A20202D2D612D636865636B626F782D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D0A20';
wwv_flow_api.g_varchar2_table(266) := '202D2D612D636865636B626F782D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D636865636B626F782D636865636B65642D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D612D636865636B626F';
wwv_flow_api.g_varchar2_table(267) := '782D636865636B65642D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D636865636B626F782D686F7665722D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A7D0D';
wwv_flow_api.g_varchar2_table(268) := '0A3A726F6F74207B0D0A20202D2D612D67762D6261636B67726F756E642D636F6C6F723A20233236323332313B0D0A20202D2D612D67762D63656C6C2D626F726465722D636F6C6F723A20233363333933373B0D0A20202D2D612D67762D686561646572';
wwv_flow_api.g_varchar2_table(269) := '2D63656C6C2D626F726465722D636F6C6F723A20233431336333383B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D746578742D636F6C6F723A20236663666366633B0D0A20202D2D612D7265706F72742D636F';
wwv_flow_api.g_varchar2_table(270) := '6E74726F6C732D63656C6C2D6C6162656C2D6261636B67726F756E642D636F6C6F723A20233236323332313B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D6865616465722D6865696768743A203372656D3B0D0A7D0D0A3A726F6F74207B0D0A20';
wwv_flow_api.g_varchar2_table(271) := '202D2D75742D6E61762D77696474683A20313572656D3B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D616374696F6E732D77696474683A2031322E3572656D3B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D7369';
wwv_flow_api.g_varchar2_table(272) := '64656261722D77696474683A20313572656D3B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D636F6E74656E742D6D61782D77696474683A20313030253B0D0A7D0D0A2E742D427574746F6E2D2D686561646572207B0D0A20202D2D61';
wwv_flow_api.g_varchar2_table(273) := '2D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20696E697469616C3B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F72';
wwv_flow_api.g_varchar2_table(274) := '3A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E31293B';
wwv_flow_api.g_varchar2_table(275) := '0D0A20202D2D612D627574746F6E2D686F7665722D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C';
wwv_flow_api.g_varchar2_table(276) := '20302E3135293B0D0A20202D2D612D627574746F6E2D6163746976652D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D6163746976652D736861646F773A206E6F6E653B0D0A20202D2D612D6275';
wwv_flow_api.g_varchar2_table(277) := '74746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2D2D6865616465722E69732D616374697665207B0D0A2020';
wwv_flow_api.g_varchar2_table(278) := '2D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3235293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A2072676261283235352C20';
wwv_flow_api.g_varchar2_table(279) := '3235352C203235352C20302E303735293B0D0A20202D2D612D627574746F6E2D736861646F773A20302032707820347078202D337078207267626128302C20302C20302C20302E31293B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67';
wwv_flow_api.g_varchar2_table(280) := '726F756E642D636F6C6F723A20233638363636353B0D0A20202D2D612D627574746F6E2D686F7665722D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E303735293B0D0A20202D2D612D627574746F6E2D686F';
wwv_flow_api.g_varchar2_table(281) := '7665722D736861646F773A20302032707820347078202D327078207267626128302C20302C20302C20302E31293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A20233139313931393B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(282) := '612D627574746F6E2D6163746976652D736861646F773A20302032707820327078202D317078207267626128302C20302C20302C20302E31352920696E7365743B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(283) := '6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D626F726465722D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D61';
wwv_flow_api.g_varchar2_table(284) := '7279293B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574746F6E2D747970652D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D747970652D626F';
wwv_flow_api.g_varchar2_table(285) := '782D736861646F773A206E6F6E653B0D0A7D0D0A2E742D427574746F6E2D2D6C696E6B207B0D0A2020626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E74';
wwv_flow_api.g_varchar2_table(286) := '3B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D6E6F55493A686F7665722C0D0A2E742D427574746F6E2D2D6E6F55493A6163746976652C0D0A2E612D427574';
wwv_flow_api.g_varchar2_table(287) := '746F6E2D2D6E6F55492C0D0A2E612D427574746F6E2D2D6E6F55493A686F7665722C0D0A2E612D427574746F6E2D2D6E6F55493A616374697665207B0D0A20202D2D612D627574746F6E2D747970652D736861646F773A206E6F6E653B0D0A20202D2D61';
wwv_flow_api.g_varchar2_table(288) := '2D627574746F6E2D747970652D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D747970652D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574';
wwv_flow_api.g_varchar2_table(289) := '746F6E2D747970652D746578742D636F6C6F723A20696E68657269743B0D0A2020636F6C6F723A20696E68657269743B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020746578742D736861646F773A206E';
wwv_flow_api.g_varchar2_table(290) := '6F6E653B0D0A7D0D0A2E742D427574746F6E2D2D686F742C0D0A2E612D427574746F6E2D2D686F742C0D0A2E75692D627574746F6E2D2D686F742C0D0A2E612D43617264566965772D627574746F6E2D2D686F742C0D0A2E617065782D627574746F6E2D';
wwv_flow_api.g_varchar2_table(291) := '67726F757020696E7075743A636865636B6564202B206C6162656C2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A6368';
wwv_flow_api.g_varchar2_table(292) := '65636B6564202B206C6162656C207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D62';
wwv_flow_api.g_varchar2_table(293) := '7574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20236434363935613B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A';
wwv_flow_api.g_varchar2_table(294) := '20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A20236233336632663B0D0A20202D2D612D627574746F6E2D6163746976652D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F766572';
wwv_flow_api.g_varchar2_table(295) := '2D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D62';
wwv_flow_api.g_varchar2_table(296) := '7574746F6E2D666F6375732D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0D0A2E612D42';
wwv_flow_api.g_varchar2_table(297) := '7574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0D0A2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0D0A2E612D43617264566965772D627574746F6E2D2D686F742E742D427574746F6E2D2D73';
wwv_flow_api.g_varchar2_table(298) := '696D706C652C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A636865636B6564202B206C6162656C2E742D427574746F6E2D2D73696D706C652C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574';
wwv_flow_api.g_varchar2_table(299) := '746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A636865636B6564202B206C6162656C2E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(300) := '6337343633343B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236133363335613B0D0A20202D2D612D627574746F';
wwv_flow_api.g_varchar2_table(301) := '6E2D686F7665722D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D6C696E6B2C0D0A2E612D427574746F6E2D2D686F742E742D427574746F6E2D2D6C696E6B2C0D0A2E7569';
wwv_flow_api.g_varchar2_table(302) := '2D627574746F6E2D2D686F742E742D427574746F6E2D2D6C696E6B2C0D0A2E612D43617264566965772D627574746F6E2D2D686F742E742D427574746F6E2D2D6C696E6B2C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A63686563';
wwv_flow_api.g_varchar2_table(303) := '6B6564202B206C6162656C2E742D427574746F6E2D2D6C696E6B2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A636865';
wwv_flow_api.g_varchar2_table(304) := '636B6564202B206C6162656C2E742D427574746F6E2D2D6C696E6B207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(305) := '723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D626F782D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236133363335613B0D0A7D0D0A2E742D427574746F6E2D2D686F';
wwv_flow_api.g_varchar2_table(306) := '742E742D427574746F6E2D2D6E6F55492C0D0A2E612D427574746F6E2D2D686F742E742D427574746F6E2D2D6E6F55492C0D0A2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D6E6F55492C0D0A2E612D43617264566965772D62757474';
wwv_flow_api.g_varchar2_table(307) := '6F6E2D2D686F742E742D427574746F6E2D2D6E6F55492C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A636865636B6564202B206C6162656C2E742D427574746F6E2D2D6E6F55492C0D0A2E742D466F726D2D6669656C64436F6E74';
wwv_flow_api.g_varchar2_table(308) := '61696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A636865636B6564202B206C6162656C2E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D686F742E61';
wwv_flow_api.g_varchar2_table(309) := '2D427574746F6E2D2D6E6F55492C0D0A2E612D427574746F6E2D2D686F742E612D427574746F6E2D2D6E6F55492C0D0A2E75692D627574746F6E2D2D686F742E612D427574746F6E2D2D6E6F55492C0D0A2E612D43617264566965772D627574746F6E2D';
wwv_flow_api.g_varchar2_table(310) := '2D686F742E612D427574746F6E2D2D6E6F55492C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A636865636B6564202B206C6162656C2E612D427574746F6E2D2D6E6F55492C0D0A2E742D466F726D2D6669656C64436F6E7461696E';
wwv_flow_api.g_varchar2_table(311) := '65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A636865636B6564202B206C6162656C2E612D427574746F6E2D2D6E6F5549207B0D0A20202D2D612D627574746F6E2D746578742D';
wwv_flow_api.g_varchar2_table(312) := '636F6C6F723A20236133363335613B0D0A2020636F6C6F723A20236133363335613B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E67207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20234642434534413B';
wwv_flow_api.g_varchar2_table(313) := '0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233030303B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20236663646337633B0D0A20202D2D612D627574746F6E2D686F7665722D';
wwv_flow_api.g_varchar2_table(314) := '746578742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A20236661633733313B0D0A20202D2D612D627574746F';
wwv_flow_api.g_varchar2_table(315) := '6E2D6163746976652D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D61';
wwv_flow_api.g_varchar2_table(316) := '2D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A';
wwv_flow_api.g_varchar2_table(317) := '7D0D0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A20234642434534413B0D0A20202D2D612D627574746F6E2D6261636B67726F75';
wwv_flow_api.g_varchar2_table(318) := '6E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233861373433323B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20233030303B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(319) := '2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D6C696E6B207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D6261636B67726F756E';
wwv_flow_api.g_varchar2_table(320) := '642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D626F782D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233861373433323B0D0A7D0D0A2E742D42757474';
wwv_flow_api.g_varchar2_table(321) := '6F6E2D2D7761726E696E672E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D7761726E696E672E612D427574746F6E2D2D6E6F5549207B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233861373433323B0D';
wwv_flow_api.g_varchar2_table(322) := '0A2020636F6C6F723A20233861373433323B0D0A7D0D0A2E742D427574746F6E2D2D73756363657373207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20233338383732393B0D0A20202D2D612D627574746F6E2D74';
wwv_flow_api.g_varchar2_table(323) := '6578742D636F6C6F723A20234646463B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20233438616533353B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A2076617228';
wwv_flow_api.g_varchar2_table(324) := '2D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A20233330373332333B0D0A20202D2D612D627574746F6E2D6163746976652D746578742D636F';
wwv_flow_api.g_varchar2_table(325) := '6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261';
wwv_flow_api.g_varchar2_table(326) := '636B67726F756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2D2D7375';
wwv_flow_api.g_varchar2_table(327) := '63636573732E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A20233338383732393B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E7370';
wwv_flow_api.g_varchar2_table(328) := '6172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233535376434653B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20234646463B0D0A7D0D0A2E742D427574746F6E2D2D7375636365';
wwv_flow_api.g_varchar2_table(329) := '73732E742D427574746F6E2D2D6C696E6B207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E737061';
wwv_flow_api.g_varchar2_table(330) := '72656E743B0D0A20202D2D612D627574746F6E2D626F782D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233535376434653B0D0A7D0D0A2E742D427574746F6E2D2D737563636573732E742D4275';
wwv_flow_api.g_varchar2_table(331) := '74746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D737563636573732E612D427574746F6E2D2D6E6F5549207B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233535376434653B0D0A2020636F6C6F723A20233535376434';
wwv_flow_api.g_varchar2_table(332) := '653B0D0A7D0D0A2E75692D627574746F6E2D2D64616E6765722C0D0A2E742D427574746F6E2D2D64616E676572207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20234545303730313B0D0A20202D2D612D62757474';
wwv_flow_api.g_varchar2_table(333) := '6F6E2D746578742D636F6C6F723A20234646463B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20236665323932343B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(334) := '766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A20236435303630313B0D0A20202D2D612D627574746F6E2D6163746976652D746578';
wwv_flow_api.g_varchar2_table(335) := '742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665';
wwv_flow_api.g_varchar2_table(336) := '722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A7D0D0A2E75692D627574746F';
wwv_flow_api.g_varchar2_table(337) := '6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C652C0D0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A20234545303730';
wwv_flow_api.g_varchar2_table(338) := '313B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236237343334303B0D0A20202D2D612D627574746F6E2D686F76';
wwv_flow_api.g_varchar2_table(339) := '65722D746578742D636F6C6F723A20234646463B0D0A7D0D0A2E75692D627574746F6E2D2D64616E6765722E742D427574746F6E2D2D6C696E6B2C0D0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D6C696E6B207B0D0A20202D';
wwv_flow_api.g_varchar2_table(340) := '2D612D627574746F6E2D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D626F782D';
wwv_flow_api.g_varchar2_table(341) := '736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236237343334303B0D0A7D0D0A2E75692D627574746F6E2D2D64616E6765722E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(342) := '64616E6765722E742D427574746F6E2D2D6E6F55492C0D0A2E75692D627574746F6E2D2D64616E6765722E612D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D64616E6765722E612D427574746F6E2D2D6E6F5549207B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(343) := '612D627574746F6E2D746578742D636F6C6F723A20236237343334303B0D0A2020636F6C6F723A20236237343334303B0D0A7D0D0A2E742D427574746F6E2D2D7072696D617279207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(344) := '6F6C6F723A20236634643764333B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233339313430663B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20236639656165383B0D0A2020';
wwv_flow_api.g_varchar2_table(345) := '2D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A2023656563';
wwv_flow_api.g_varchar2_table(346) := '3562663B0D0A20202D2D612D627574746F6E2D6163746976652D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F75';
wwv_flow_api.g_varchar2_table(347) := '6E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F76';
wwv_flow_api.g_varchar2_table(348) := '65722D746578742D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A20766172282D2D75742D70616C6574';
wwv_flow_api.g_varchar2_table(349) := '74652D7072696D6172792D616C74293B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20766172282D2D75742D70616C';
wwv_flow_api.g_varchar2_table(350) := '657474652D7072696D6172792D616C742D74657874293B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20233339313430663B0D0A7D0D0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D6C69';
wwv_flow_api.g_varchar2_table(351) := '6E6B207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D6275';
wwv_flow_api.g_varchar2_table(352) := '74746F6E2D626F782D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D616C742D74657874293B0D0A7D0D0A2E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(353) := '7072696D6172792E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D7072696D6172792E612D427574746F6E2D2D6E6F5549207B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20766172282D2D75742D70616C65';
wwv_flow_api.g_varchar2_table(354) := '7474652D7072696D6172792D616C742D74657874293B0D0A2020636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D616C742D74657874293B0D0A7D0D0A2E742D466F726D2D68656C70427574746F6E207B0D0A20202D2D61';
wwv_flow_api.g_varchar2_table(355) := '2D627574746F6E2D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D627574746F6E2D70616464696E672D783A20302E323572656D3B0D0A20202D2D612D627574746F6E2D747970652D6261636B67726F756E642D636F6C6F723A2074';
wwv_flow_api.g_varchar2_table(356) := '72616E73706172656E743B0D0A20202D2D612D627574746F6E2D747970652D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D747970652D626F782D736861646F773A206E6F6E653B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(357) := '612D627574746F6E2D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D75742D';
wwv_flow_api.g_varchar2_table(358) := '636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D6E6F5549202E66613A61667465722C0D0A2E742D427574746F6E2E742D427574746F6E2D2D6C696E6B202E6661';
wwv_flow_api.g_varchar2_table(359) := '3A61667465722C0D0A2E742D427574746F6E2E742D427574746F6E2D2D73696D706C65202E66613A61667465722C0D0A2E612D427574746F6E2E612D427574746F6E2D2D6E6F5549202E66613A6166746572207B0D0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(360) := '6F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D64616E676572202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A686F766572202E66613A616674657220';
wwv_flow_api.g_varchar2_table(361) := '7B0D0A20206261636B67726F756E642D636F6C6F723A20234545303730313B0D0A7D0D0A2E742D427574746F6E2D2D73756363657373202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7375636365';
wwv_flow_api.g_varchar2_table(362) := '73733A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20233338383732393B0D0A7D0D0A2E742D427574746F6E2D2D7072696D617279202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D';
wwv_flow_api.g_varchar2_table(363) := '706C652E742D427574746F6E2D2D7072696D6172793A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20236634643764333B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E67202E66613A616674';
wwv_flow_api.g_varchar2_table(364) := '65722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E673A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20234642434534413B0D0A7D0D0A2E742D42757474';
wwv_flow_api.g_varchar2_table(365) := '6F6E2D2D686F74202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F743A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20236337343633343B0D';
wwv_flow_api.g_varchar2_table(366) := '0A7D0D0A3A726F6F74207B0D0A20202D2D612D63762D6974656D2D77696474683A20313972656D3B0D0A20202D2D612D63762D666F6375732D6F75746C696E653A206E6F6E653B0D0A20202D2D612D63762D626F726465722D77696474683A203170783B';
wwv_flow_api.g_varchar2_table(367) := '0D0A20202D2D612D63762D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D0A20202D2D612D63762D626F726465722D7261646975733A20302E3138373572656D3B0D0A20202D2D612D63762D6261';
wwv_flow_api.g_varchar2_table(368) := '636B67726F756E642D636F6C6F723A20233236323332313B0D0A20202D2D612D63762D736861646F773A20302032707820347078202D327078207267626128302C20302C20302C20302E303735293B0D0A20202D2D612D63762D686F7665722D6261636B';
wwv_flow_api.g_varchar2_table(369) := '67726F756E642D636F6C6F723A20766172282D2D612D63762D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D63762D686F7665722D746578742D636F6C6F723A20766172282D2D612D63762D746578742D636F6C6F72293B0D0A20202D';
wwv_flow_api.g_varchar2_table(370) := '2D612D63762D686F7665722D626F726465722D636F6C6F723A20766172282D2D612D63762D626F726465722D636F6C6F72293B0D0A20202D2D612D63762D686F7665722D736861646F773A20302034707820302E3572656D2030207267626128302C2030';
wwv_flow_api.g_varchar2_table(371) := '2C20302C20302E31293B0D0A20202D2D612D63762D6163746976652D6261636B67726F756E642D636F6C6F723A20766172282D2D612D63762D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D63762D6163746976652D746578742D636F';
wwv_flow_api.g_varchar2_table(372) := '6C6F723A20766172282D2D612D63762D746578742D636F6C6F72293B0D0A20202D2D612D63762D6163746976652D626F726465722D636F6C6F723A20766172282D2D612D63762D626F726465722D636F6C6F72293B0D0A20202D2D612D63762D61637469';
wwv_flow_api.g_varchar2_table(373) := '76652D736861646F773A20766172282D2D612D63762D736861646F77293B0D0A20202D2D612D63762D666F6375732D626F726465722D636F6C6F723A20236337343633343B0D0A20202D2D612D63762D6D656469612D70616464696E672D793A20317265';
wwv_flow_api.g_varchar2_table(374) := '6D3B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A203172656D3B0D0A20202D2D612D63762D6865616465722D70616464696E672D793A203172656D3B0D0A20202D2D612D63762D6865616465722D70616464696E672D783A203172';
wwv_flow_api.g_varchar2_table(375) := '656D3B0D0A20202D2D612D63762D6865616465722D626F726465722D77696474683A203170783B0D0A20202D2D612D63762D6865616465722D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A2020';
wwv_flow_api.g_varchar2_table(376) := '2D2D612D63762D69636F6E2D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D612D63762D69636F6E2D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D63762D69636F6E2D626F726465722D726164';
wwv_flow_api.g_varchar2_table(377) := '6975733A20313030253B0D0A20202D2D612D63762D69636F6E2D73697A653A203172656D3B0D0A20202D2D612D63762D69636F6E2D636F6E7461696E65722D73697A653A203272656D3B0D0A20202D2D612D63762D69636F6E2D70616464696E673A2030';
wwv_flow_api.g_varchar2_table(378) := '2E3572656D3B0D0A20202D2D612D63762D696E697469616C732D666F6E742D7765696768743A203730303B0D0A20202D2D612D63762D696E697469616C732D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D63762D696E69746961';
wwv_flow_api.g_varchar2_table(379) := '6C732D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D612D63762D7375627469746C652D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D63762D7375627469746C652D666F6E742D7765696768743A';
wwv_flow_api.g_varchar2_table(380) := '203430303B0D0A20202D2D612D63762D7375627469746C652D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D63762D7375627469746C652D746578742D636F6C6F723A20236263626362633B0D0A20202D2D612D63762D626F64792D70';
wwv_flow_api.g_varchar2_table(381) := '616464696E672D783A203172656D3B0D0A20202D2D612D63762D626F64792D70616464696E672D793A203172656D3B0D0A20202D2D612D63762D6D61696E636F6E74656E742D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D612D6376';
wwv_flow_api.g_varchar2_table(382) := '2D6D61696E636F6E74656E742D6C696E652D6865696768743A20312E323572656D3B0D0A20202D2D612D63762D737562636F6E74656E742D666F6E742D73697A653A20302E3638373572656D3B0D0A20202D2D612D63762D737562636F6E74656E742D6C';
wwv_flow_api.g_varchar2_table(383) := '696E652D6865696768743A203172656D3B0D0A20202D2D612D63762D737562636F6E74656E742D746578742D636F6C6F723A20236263626362633B0D0A20202D2D612D63762D616374696F6E732D626F726465722D77696474683A203170783B0D0A2020';
wwv_flow_api.g_varchar2_table(384) := '2D2D612D63762D616374696F6E732D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D612D63762D616374696F6E732D70616464696E672D793A203172656D3B0D0A20202D2D612D63762D';
wwv_flow_api.g_varchar2_table(385) := '616374696F6E732D70616464696E672D783A203172656D3B0D0A7D0D0A2E612D544D562D2D6361726473202E612D47562D666F6F746572207B0D0A20206D696E2D6865696768743A20756E7365743B0D0A202070616464696E672D626C6F636B2D737461';
wwv_flow_api.g_varchar2_table(386) := '72743A20303B0D0A202070616464696E672D626C6F636B2D656E643A20303B0D0A7D0D0A2E612D544D562D2D6361726473202E612D47562D666F6F746572202E6A732D72616E6765446973706C6179207B0D0A20206D617267696E2D626C6F636B2D7374';
wwv_flow_api.g_varchar2_table(387) := '6172743A20766172282D2D612D67762D666F6F7465722D70616464696E672D79293B0D0A20206D617267696E2D626C6F636B2D656E643A20766172282D2D612D67762D666F6F7465722D70616464696E672D79293B0D0A7D0D0A2E612D43617264566965';
wwv_flow_api.g_varchar2_table(388) := '772D66756C6C4C696E6B3A666F637573207B0D0A2020626F782D736861646F773A20696E73657420302030203020766172282D2D612D63762D626F726465722D77696474682C20302920766172282D2D612D63762D666F6375732D626F726465722D636F';
wwv_flow_api.g_varchar2_table(389) := '6C6F72293B0D0A7D0D0A2E612D43617264566965772D6D65646961207B0D0A2020616C69676E2D6974656D733A2063656E7465723B0D0A20206A7573746966792D636F6E74656E743A2063656E7465723B0D0A7D0D0A2E612D43617264566965772D6D65';
wwv_flow_api.g_varchar2_table(390) := '6469612061207B0D0A20207472616E736974696F6E3A206F70616369747920302E327320656173653B0D0A7D0D0A2E612D43617264566965772D6D6564696120613A666F637573207B0D0A20206F7061636974793A20302E353B0D0A7D0D0A2E612D4361';
wwv_flow_api.g_varchar2_table(391) := '7264566965772D6865616465723A6C6173742D6368696C64207B0D0A20202D2D612D63762D6865616465722D626F726465722D77696474683A203070783B0D0A7D0D0A2E6861732D6D656469612D2D6669727374207B0D0A20202D2D612D63762D6D6564';
wwv_flow_api.g_varchar2_table(392) := '69612D70616464696E672D793A20303B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A20303B0D0A7D0D0A2E6861732D6D656469612D2D6261636B67726F756E64207B0D0A20202D2D612D63762D6D656469612D70616464696E672D';
wwv_flow_api.g_varchar2_table(393) := '793A203072656D3B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A203072656D3B0D0A20202D2D612D63762D746578742D636F6C6F723A20236666663B0D0A20202D2D612D63762D7375627469746C652D746578742D636F6C6F723A';
wwv_flow_api.g_varchar2_table(394) := '2072676261283235352C203235352C203235352C20302E3635293B0D0A20202D2D612D63762D737562636F6E74656E742D746578742D636F6C6F723A2072676261283235352C203235352C203235352C20302E3635293B0D0A20202D2D612D63762D6261';
wwv_flow_api.g_varchar2_table(395) := '6467652D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3235293B0D0A7D0D0A2E6861732D6D656469612D2D6261636B67726F756E6420613A6E6F74285B636C6173735D29207B0D0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(396) := '723A20696E68657269743B0D0A7D0D0A2E6861732D6D656469612D2D6261636B67726F756E6420613A6E6F74285B636C6173735D293A686F7665722C0D0A2E6861732D6D656469612D2D6261636B67726F756E6420613A6E6F74285B636C6173735D293A';
wwv_flow_api.g_varchar2_table(397) := '666F637573207B0D0A2020746578742D6465636F726174696F6E3A20756E6465726C696E653B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541207B0D0A20202D2D612D63762D6F766572666C6F773A2068696464656E3B0D0A20202D';
wwv_flow_api.g_varchar2_table(398) := '2D612D63762D6D656469612D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D612D63762D6D656469612D6F7665726C61792D636F6C6F723A207267626128302C20302C20';
wwv_flow_api.g_varchar2_table(399) := '302C20302E3735293B0D0A20202D2D612D63762D6865616465722D626F726465722D77696474683A203070783B0D0A20202D2D612D63762D6865616465722D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A20202D2D612D63762D6163';
wwv_flow_api.g_varchar2_table(400) := '74696F6E732D626F726465722D77696474683A203070783B0D0A20202D2D612D63762D616374696F6E732D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A20202D2D612D63762D69636F6E2D636F6E7461696E65722D73697A653A2032';
wwv_flow_api.g_varchar2_table(401) := '2E3572656D3B0D0A20202D2D612D63762D69636F6E2D73697A653A20312E323572656D3B0D0A20202D2D612D63762D69636F6E2D626F726465722D7261646975733A20302E3138373572656D3B0D0A20202D2D612D63762D69636F6E2D696D6167652D73';
wwv_flow_api.g_varchar2_table(402) := '697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D69636F6E2D696D6167652D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164';
wwv_flow_api.g_varchar2_table(403) := '697573293B0D0A20202D2D612D63762D696E697469616C732D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D73697A653A20766172';
wwv_flow_api.g_varchar2_table(404) := '282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D696E697469616C732D666F6E742D73697A653A20312E323572656D3B0D0A20202D2D612D63762D696E697469616C732D666F6E742D7765696768743A';
wwv_flow_api.g_varchar2_table(405) := '203430303B0D0A20202D2D612D63762D62616467652D70616464696E673A20302E323572656D20302E3572656D3B0D0A20202D2D612D63762D62616467652D626F726465722D7261646975733A20312E323572656D3B0D0A7D0D0A2E742D436172647352';
wwv_flow_api.g_varchar2_table(406) := '6567696F6E2D2D7374796C6541202E6861732D6D656469612D2D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D6669727374207B0D0A20202D2D612D63762D6D656469612D626F726465722D72';
wwv_flow_api.g_varchar2_table(407) := '61646975733A20302E3138373572656D3B0D0A20202D2D612D63762D6D656469612D70616464696E672D793A203172656D3B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A203172656D3B0D0A7D0D0A2E742D436172647352656769';
wwv_flow_api.g_varchar2_table(408) := '6F6E2D2D7374796C6541202E6861732D6D656469612D2D626F6479202E612D43617264566965772D6D656469612C0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D6669727374202E612D4361726456696577';
wwv_flow_api.g_varchar2_table(409) := '2D6D65646961207B0D0A20206D617267696E2D696E6C696E652D73746172743A20766172282D2D612D63762D6D656469612D70616464696E672D78293B0D0A20206D617267696E2D696E6C696E652D656E643A20766172282D2D612D63762D6D65646961';
wwv_flow_api.g_varchar2_table(410) := '2D70616464696E672D78293B0D0A202070616464696E673A20303B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D6669727374202E612D43617264566965772D6D65646961207B0D0A20206D617267';
wwv_flow_api.g_varchar2_table(411) := '696E2D626C6F636B2D73746172743A20766172282D2D612D63762D6D656469612D70616464696E672D79293B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D69636F6E2D2D746F70207B0D0A20202D2D612D63762D69';
wwv_flow_api.g_varchar2_table(412) := '636F6E2D636F6E7461696E65722D73697A653A203672656D3B0D0A20202D2D612D63762D69636F6E2D73697A653A203372656D3B0D0A20202D2D612D63762D69636F6E2D626F726465722D7261646975733A20302E3572656D3B0D0A20202D2D612D6376';
wwv_flow_api.g_varchar2_table(413) := '2D69636F6E2D696D6167652D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D69636F6E2D696D6167652D626F726465722D7261646975733A20766172282D2D612D63762D6963';
wwv_flow_api.g_varchar2_table(414) := '6F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469';
wwv_flow_api.g_varchar2_table(415) := '616C732D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D696E697469616C732D666F6E742D73697A653A20312E3572656D3B0D0A7D0D0A2E742D4361726473526567696F6E2D';
wwv_flow_api.g_varchar2_table(416) := '2D7374796C6541202E6861732D6D656469612D2D6669727374202E612D43617264566965772D686561646572202B202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D';
wwv_flow_api.g_varchar2_table(417) := '2D6261636B67726F756E64202E612D43617264566965772D686561646572202B202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E612D43617264566965772D626F6479202B202E612D436172';
wwv_flow_api.g_varchar2_table(418) := '64566965772D616374696F6E73207B0D0A202070616464696E672D626C6F636B2D73746172743A20303B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E612D43617264566965772D6974656D732D2D726F77202E742D43617264';
wwv_flow_api.g_varchar2_table(419) := '73526567696F6E2D2D7374796C6541202E612D43617264566965772D616374696F6E73207B0D0A2020666C65782D646972656374696F6E3A20636F6C756D6E3B0D0A2020616C69676E2D6974656D733A20666C65782D656E643B0D0A2020677269642D63';
wwv_flow_api.g_varchar2_table(420) := '6F6C756D6E3A20343B0D0A2020677269642D726F772D73746172743A20313B0D0A2020677269642D726F772D656E643A20343B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E612D43617264566965772D6974656D732D2D726F';
wwv_flow_api.g_varchar2_table(421) := '77202E612D43617264566965772D6D65646961207B0D0A20206D617267696E2D626C6F636B2D73746172743A20766172282D2D612D63762D6D656469612D70616464696E672D79293B0D0A20206D617267696E2D626C6F636B2D656E643A20766172282D';
wwv_flow_api.g_varchar2_table(422) := '2D612D63762D6D656469612D70616464696E672D79293B0D0A20206D617267696E2D696E6C696E652D656E643A20303B0D0A7D0D0A2E752D52544C202E742D4361726473526567696F6E2D2D7374796C6541202E612D43617264566965772D6974656D73';
wwv_flow_api.g_varchar2_table(423) := '2D2D726F77202E612D43617264566965772D6D65646961207B0D0A20206D617267696E2D696E6C696E652D656E643A20766172282D2D612D63762D6D656469612D70616464696E672D78293B0D0A20206D617267696E2D696E6C696E652D73746172743A';
wwv_flow_api.g_varchar2_table(424) := '20303B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542207B0D0A20202D2D612D63762D6F766572666C6F773A2068696464656E3B0D0A20202D2D612D63762D6D656469612D6261636B67726F756E642D636F6C6F723A207267626128';
wwv_flow_api.g_varchar2_table(425) := '3235352C203235352C203235352C20302E303235293B0D0A20202D2D612D63762D6D656469612D6F7665726C61792D636F6C6F723A207267626128302C20302C20302C20302E3735293B0D0A20202D2D612D63762D69636F6E2D636F6E7461696E65722D';
wwv_flow_api.g_varchar2_table(426) := '73697A653A203472656D3B0D0A20202D2D612D63762D69636F6E2D73697A653A203272656D3B0D0A20202D2D612D63762D69636F6E2D626F726465722D7261646975733A20302E323572656D3B0D0A20202D2D612D63762D69636F6E2D696D6167652D73';
wwv_flow_api.g_varchar2_table(427) := '697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D69636F6E2D696D6167652D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164';
wwv_flow_api.g_varchar2_table(428) := '697573293B0D0A20202D2D612D63762D696E697469616C732D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D73697A653A20766172';
wwv_flow_api.g_varchar2_table(429) := '282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D696E697469616C732D666F6E742D73697A653A203272656D3B0D0A20202D2D612D63762D696E697469616C732D666F6E742D7765696768743A203430';
wwv_flow_api.g_varchar2_table(430) := '303B0D0A20202D2D612D63762D6D656469612D70616464696E672D793A203072656D3B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A203072656D3B0D0A20202D2D612D63762D6865616465722D626F726465722D77696474683A20';
wwv_flow_api.g_varchar2_table(431) := '3070783B0D0A20202D2D612D63762D6865616465722D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A20202D2D612D63762D616374696F6E732D626F726465722D77696474683A203070783B0D0A20202D2D612D63762D616374696F6E';
wwv_flow_api.g_varchar2_table(432) := '732D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A20202D2D612D63762D7469746C652D666F6E742D73697A653A20312E323572656D3B0D0A20202D2D612D63762D7469746C652D6C696E652D6865696768743A20312E373572656D3B';
wwv_flow_api.g_varchar2_table(433) := '0D0A20202D2D612D63762D62616467652D70616464696E673A20302E323572656D20302E373572656D3B0D0A20202D2D612D63762D62616467652D626F726465722D7261646975733A20312E323572656D3B0D0A7D0D0A2E742D4361726473526567696F';
wwv_flow_api.g_varchar2_table(434) := '6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70207B0D0A20202D2D612D63762D69636F6E2D636F6E7461696E65722D73697A653A203772656D3B0D0A20202D2D612D63762D69636F6E2D73697A653A203272656D3B0D0A20202D2D612D6376';
wwv_flow_api.g_varchar2_table(435) := '2D69636F6E2D626F726465722D7261646975733A20302E323572656D3B0D0A20202D2D612D63762D69636F6E2D696D6167652D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D';
wwv_flow_api.g_varchar2_table(436) := '69636F6E2D696D6167652D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D626F726465722D7261646975733A20766172282D2D612D';
wwv_flow_api.g_varchar2_table(437) := '63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D696E697469616C73';
wwv_flow_api.g_varchar2_table(438) := '2D666F6E742D73697A653A203272656D3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70202E612D43617264566965772D69636F6E57726170207B0D0A20206D617267696E2D696E6C696E652D';
wwv_flow_api.g_varchar2_table(439) := '73746172743A2063616C6328766172282D2D612D63762D6865616465722D70616464696E672D7829202A202D31293B0D0A20206D617267696E2D696E6C696E652D656E643A2063616C6328766172282D2D612D63762D6865616465722D70616464696E67';
wwv_flow_api.g_varchar2_table(440) := '2D7829202A202D31293B0D0A20206D617267696E2D626C6F636B2D73746172743A2063616C6328766172282D2D612D63762D6865616465722D70616464696E672D7929202A202D31293B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C65';
wwv_flow_api.g_varchar2_table(441) := '42202E6861732D69636F6E2D2D746F70202E612D43617264566965772D69636F6E57726170202E612D43617264566965772D696E697469616C732C0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70202E';
wwv_flow_api.g_varchar2_table(442) := '612D43617264566965772D69636F6E57726170202E612D43617264566965772D69636F6E2C0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70202E612D43617264566965772D69636F6E57726170202E61';
wwv_flow_api.g_varchar2_table(443) := '2D43617264566965772D69636F6E496D67207B0D0A202077696474683A20313030253B0D0A2020626F726465722D7261646975733A20303B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70202E';
wwv_flow_api.g_varchar2_table(444) := '612D43617264566965772D69636F6E3A6265666F7265207B0D0A2020626F726465722D7261646975733A20313030253B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A2020746578742D7368';
wwv_flow_api.g_varchar2_table(445) := '61646F773A20302031707820317078207267626128302C20302C20302C20302E31293B0D0A20206D617267696E3A206175746F3B0D0A202070616464696E673A2063616C6328766172282D2D612D63762D69636F6E2D73697A6529202F2032293B0D0A7D';
wwv_flow_api.g_varchar2_table(446) := '0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D7374617274202E612D43617264566965772D69636F6E57726170207B0D0A20206D617267696E2D626C6F636B2D656E643A20766172282D2D612D63762D686561';
wwv_flow_api.g_varchar2_table(447) := '6465722D6974656D2D73706163696E672D782C20302E373572656D293B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D656E64202E612D43617264566965772D69636F6E57726170207B0D0A20206D61';
wwv_flow_api.g_varchar2_table(448) := '7267696E2D626C6F636B2D73746172743A20766172282D2D612D63762D6865616465722D6974656D2D73706163696E672D782C20302E373572656D293B0D0A2020677269642D617265613A2062616467652D626F74746F6D3B0D0A7D0D0A2E742D436172';
wwv_flow_api.g_varchar2_table(449) := '6473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D656E64202E612D43617264566965772D686561646572426F6479207B0D0A2020677269642D617265613A2069636F6E2D746F703B0D0A7D0D0A2E742D4361726473526567696F6E2D';
wwv_flow_api.g_varchar2_table(450) := '2D7374796C6542202E6861732D69636F6E2D2D656E64202E612D43617264566965772D6261646765207B0D0A2020677269642D617265613A20626F64793B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965';
wwv_flow_api.g_varchar2_table(451) := '772D69636F6E57726170207B0D0A2020677269642D617265613A2069636F6E2D746F703B0D0A20206D617267696E2D696E6C696E652D656E643A20756E7365743B0D0A20206D617267696E2D696E6C696E652D73746172743A20756E7365743B0D0A2020';
wwv_flow_api.g_varchar2_table(452) := '646973706C61793A20666C65783B0D0A20206A7573746966792D636F6E74656E743A2063656E7465723B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D686561646572426F6479207B0D0A20207465';
wwv_flow_api.g_varchar2_table(453) := '78742D616C69676E3A2063656E7465723B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D6261646765207B0D0A20206D617267696E2D696E6C696E652D73746172743A206175746F3B0D0A20206D61';
wwv_flow_api.g_varchar2_table(454) := '7267696E2D696E6C696E652D656E643A206175746F3B0D0A2020677269642D617265613A2062616467652D626F74746F6D3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D62616467653A6E6F7428';
wwv_flow_api.g_varchar2_table(455) := '3A66697273742D6368696C6429207B0D0A20206D617267696E2D626C6F636B2D73746172743A20766172282D2D612D63762D6865616465722D6974656D2D73706163696E672D782C20302E373572656D293B0D0A7D0D0A2E742D4361726473526567696F';
wwv_flow_api.g_varchar2_table(456) := '6E2D2D7374796C6542202E612D43617264566965772D62616467654C6162656C207B0D0A2020626F726465723A20756E7365743B0D0A2020636C69703A20756E7365743B0D0A2020636C69702D706174683A20756E7365743B0D0A20206865696768743A';
wwv_flow_api.g_varchar2_table(457) := '20756E7365743B0D0A20206D617267696E3A20756E7365743B0D0A20206F766572666C6F773A20756E7365743B0D0A202070616464696E673A20756E7365743B0D0A2020706F736974696F6E3A20756E7365743B0D0A202077696474683A20756E736574';
wwv_flow_api.g_varchar2_table(458) := '3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D616374696F6E73207B0D0A2020666C65782D646972656374696F6E3A20636F6C756D6E3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374';
wwv_flow_api.g_varchar2_table(459) := '796C6542202E612D43617264566965772D616374696F6E735072696D617279202E612D43617264566965772D627574746F6E207B0D0A202077696474683A20313030253B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43';
wwv_flow_api.g_varchar2_table(460) := '617264566965772D616374696F6E735072696D617279202E612D43617264566965772D627574746F6E202B202E612D43617264566965772D627574746F6E207B0D0A20206D617267696E2D626C6F636B2D73746172743A20302E323572656D3B0D0A7D0D';
wwv_flow_api.g_varchar2_table(461) := '0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D616374696F6E735365636F6E64617279207B0D0A2020746578742D616C69676E3A2063656E7465723B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374';
wwv_flow_api.g_varchar2_table(462) := '796C6542202E612D43617264566965772D616374696F6E735365636F6E646172793A6E6F74283A6F6E6C792D6368696C6429207B0D0A20206D617267696E2D626C6F636B2D73746172743A20302E3572656D3B0D0A7D0D0A2E742D436172647352656769';
wwv_flow_api.g_varchar2_table(463) := '6F6E2D2D7374796C6543207B0D0A20202D2D612D63762D6F766572666C6F773A2068696464656E3B0D0A20202D2D612D63762D6D656469612D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303235';
wwv_flow_api.g_varchar2_table(464) := '293B0D0A20202D2D612D63762D6D656469612D6F7665726C61792D636F6C6F723A207267626128302C20302C20302C20302E3735293B0D0A20202D2D612D63762D6D656469612D70616464696E672D793A203072656D3B0D0A20202D2D612D63762D6D65';
wwv_flow_api.g_varchar2_table(465) := '6469612D70616464696E672D783A203072656D3B0D0A20202D2D612D63762D6865616465722D626F726465722D77696474683A203070783B0D0A20202D2D612D63762D6865616465722D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A';
wwv_flow_api.g_varchar2_table(466) := '20202D2D612D63762D616374696F6E732D626F726465722D77696474683A203070783B0D0A20202D2D612D63762D616374696F6E732D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A7D0D0A2E742D4361726473526567696F6E2D2D73';
wwv_flow_api.g_varchar2_table(467) := '74796C6543202E6861732D7469746C652E6861732D626F64793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D7469746C65';
wwv_flow_api.g_varchar2_table(468) := '2E6861732D7365636F6E646172793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D7375627469746C652E6861732D626F64';
wwv_flow_api.g_varchar2_table(469) := '793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D7375627469746C652E6861732D7365636F6E646172793A6E6F74282E68';
wwv_flow_api.g_varchar2_table(470) := '61732D6D656469612D2D626F647929202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D69636F6E2E6861732D626F64793A6E6F74282E6861732D6D656469612D2D626F647929202E';
wwv_flow_api.g_varchar2_table(471) := '612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D69636F6E2E6861732D7365636F6E646172793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D62';
wwv_flow_api.g_varchar2_table(472) := '6F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D62616467652E6861732D626F64793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F64792C0D0A2E742D43617264735265';
wwv_flow_api.g_varchar2_table(473) := '67696F6E2D2D7374796C6543202E6861732D62616467652E6861732D7365636F6E646172793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F6479207B0D0A202070616464696E672D626C6F636B2D73746172';
wwv_flow_api.g_varchar2_table(474) := '743A20303B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E612D43617264566965772D626F6479207B0D0A2020677269642D636F6C756D6E2D73746172743A20333B0D';
wwv_flow_api.g_varchar2_table(475) := '0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E612D43617264566965772D616374696F6E73207B0D0A2020666C65782D646972656374696F6E3A20636F6C756D6E3B0D0A';
wwv_flow_api.g_varchar2_table(476) := '2020616C69676E2D6974656D733A20666C65782D656E643B0D0A2020677269642D636F6C756D6E3A20343B0D0A2020677269642D726F772D73746172743A20313B0D0A2020677269642D726F772D656E643A20343B0D0A7D0D0A2E742D43617264735265';
wwv_flow_api.g_varchar2_table(477) := '67696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E612D43617264566965773A6E6F74282E6861732D69636F6E292C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D';
wwv_flow_api.g_varchar2_table(478) := '6974656D732D2D726F77202E6861732D69636F6E2D2D746F702C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E6861732D69636F6E2D2D656E64207B0D0A20202D2D612D6376';
wwv_flow_api.g_varchar2_table(479) := '2D69636F6E2D7370616365723A203072656D3B0D0A7D0D0A406D6564696120286D61782D77696474683A20373638707829207B0D0A20202E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77';
wwv_flow_api.g_varchar2_table(480) := '202E6861732D6D65646961207B0D0A20202020677269642D74656D706C6174652D636F6C756D6E733A206D696E6D617828312E323572656D2C203572656D29206D696E6D617828302C20766172282D2D612D63762D69636F6E2D7370616365722C20322E';
wwv_flow_api.g_varchar2_table(481) := '373572656D292920316672206D696E6D617828302C206175746F293B0D0A20207D0D0A7D0D0A2E742D466F726D2D2D6C617267652C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765207B0D0A20202D2D75742D6669656C64';
wwv_flow_api.g_varchar2_table(482) := '2D6C6162656C2D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D75742D6669656C642D6C6162656C2D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D6669656C642D696E7075742D666F6E742D73697A653A20302E38';
wwv_flow_api.g_varchar2_table(483) := '373572656D3B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D783A20302E3572656D3B0D0A20202D2D75742D6669656C642D696E70';
wwv_flow_api.g_varchar2_table(484) := '75742D69636F6E2D70616464696E672D783A20302E3572656D3B0D0A20202D2D75742D6669656C642D696E7075742D69636F6E2D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D636865636B626F782D73697A653A20312E323572656D';
wwv_flow_api.g_varchar2_table(485) := '3B0D0A20202D2D612D636865636B626F782D69636F6E2D73697A653A20312E31323572656D3B0D0A20202D2D612D636865636B626F782D6C6162656C2D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D612D636865636B626F782D6C61';
wwv_flow_api.g_varchar2_table(486) := '62656C2D6C696E652D6865696768743A20312E323572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D70616464696E672D793A20302E3572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D70616464696E672D783A20302E37357265';
wwv_flow_api.g_varchar2_table(487) := '6D3B0D0A20202D2D75742D70696C6C627574746F6E2D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D6C696E652D6865696768743A203172656D3B0D0A20202D2D75742D70696C6C627574746F6E2D63';
wwv_flow_api.g_varchar2_table(488) := '6865636B626F782D6F66667365743A20302E33373572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D636865636B626F782D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D706F7075706C6F762D636869702D6D617267696E';
wwv_flow_api.g_varchar2_table(489) := '2D783A20302E31323572656D3B0D0A20202D2D612D706F7075706C6F762D636869702D6D617267696E2D793A20302E31323572656D3B0D0A20202D2D612D706F7075706C6F762D636869702D666F6E742D73697A653A20302E38373572656D3B0D0A2020';
wwv_flow_api.g_varchar2_table(490) := '2D2D612D706F7075706C6F762D636869702D6C696E652D6865696768743A20312E323572656D3B0D0A20202D2D612D706F7075706C6F762D636869702D70616464696E672D793A20302E31323572656D3B0D0A20202D2D612D706F7075706C6F762D6368';
wwv_flow_api.g_varchar2_table(491) := '69702D70616464696E672D783A20302E33373572656D3B0D0A20202D2D612D7377697463682D77696474683A20332E373572656D3B0D0A20202D2D612D7377697463682D70616464696E672D793A20302E3138373572656D3B0D0A20202D2D612D737769';
wwv_flow_api.g_varchar2_table(492) := '7463682D70616464696E672D783A20302E3138373572656D3B0D0A20202D2D612D7377697463682D746F67676C652D77696474683A20312E36323572656D3B0D0A20202D2D612D7377697463682D746F67676C652D6865696768743A20312E3632357265';
wwv_flow_api.g_varchar2_table(493) := '6D3B0D0A7D0D0A2E742D466F726D2D2D6C61726765202E742D466F726D2D6974656D546578742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E742D466F726D2D6974656D54657874207B0D0A20206C696E652D6865';
wwv_flow_api.g_varchar2_table(494) := '696768743A203272656D3B0D0A2020666F6E742D73697A653A20302E38373572656D3B0D0A7D0D0A2E742D466F726D2D2D6C61726765202E617065782D6974656D2D69636F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C6172';
wwv_flow_api.g_varchar2_table(495) := '6765202E617065782D6974656D2D69636F6E2C0D0A2E742D466F726D2D2D6C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B65722C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C617267652E';
wwv_flow_api.g_varchar2_table(496) := '617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B6572207B0D0A20202D2D612D69636F6E2D70616464696E673A20302E3572656D3B0D0A7D0D0A2E742D466F726D2D2D6C617267652E617065782D6974656D2D777261707065722D';
wwv_flow_api.g_varchar2_table(497) := '2D636F6C6F722D7069636B65722C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B6572207B0D0A20202D2D612D69636F6E2D73697A653A20312E';
wwv_flow_api.g_varchar2_table(498) := '323572656D3B0D0A20202D2D612D6974656D2D69636F6E2D6F66667365743A2063616C6328766172282D2D612D69636F6E2D73697A652C203172656D29202B20766172282D2D612D69636F6E2D70616464696E6729293B0D0A7D0D0A2E742D466F726D2D';
wwv_flow_api.g_varchar2_table(499) := '2D6C61726765202E617065782D6974656D2D67726F75702D2D636F6C6F722D7069636B6572202E612D427574746F6E2D2D636F6C6F725069636B65724F6E6C792C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E6170';
wwv_flow_api.g_varchar2_table(500) := '65782D6974656D2D67726F75702D2D636F6C6F722D7069636B6572202E612D427574746F6E2D2D636F6C6F725069636B65724F6E6C79207B0D0A20202D2D612D636F6C6F722D7069636B65722D636F6C6F722D6F6E6C792D6865696768743A203172656D';
wwv_flow_api.g_varchar2_table(501) := '3B0D0A20202D2D612D636F6C6F722D7069636B65722D636F6C6F722D6F6E6C792D77696474683A203272656D3B0D0A20202D2D612D627574746F6E2D70616464696E673A20302E3572656D3B0D0A7D0D0A2E742D466F726D2D2D6C617267652E61706578';
wwv_flow_api.g_varchar2_table(502) := '2D6974656D2D777261707065722D2D6861732D69636F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C617267652E617065782D6974656D2D777261707065722D2D6861732D69636F6E207B0D0A20202D2D612D69636F6E2D7061';
wwv_flow_api.g_varchar2_table(503) := '6464696E673A20302E3572656D3B0D0A20202D2D612D6974656D2D69636F6E2D6F66667365743A2063616C6328766172282D2D612D69636F6E2D73697A652C203172656D29202B20766172282D2D612D69636F6E2D70616464696E6729293B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(504) := '2E742D466F726D2D2D6C61726765202E742D466F726D2D6974656D57726170706572202E612D427574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E742D466F726D2D6974656D57726170706572202E612D';
wwv_flow_api.g_varchar2_table(505) := '427574746F6E2C0D0A2E742D466F726D2D2D6C61726765202E742D466F726D2D6974656D57726170706572202E6F6A2D696E7075746461746574696D652D696E7075742D747269676765722C0D0A2E742D466F726D2D6669656C64436F6E7461696E6572';
wwv_flow_api.g_varchar2_table(506) := '2D2D6C61726765202E742D466F726D2D6974656D57726170706572202E6F6A2D696E7075746461746574696D652D696E7075742D747269676765722C0D0A2E742D466F726D2D2D6C61726765202E742D466F726D2D6974656D57726170706572202E742D';
wwv_flow_api.g_varchar2_table(507) := '466F726D2D68656C70427574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E742D466F726D2D6974656D57726170706572202E742D466F726D2D68656C70427574746F6E2C0D0A2E742D466F726D2D2D6C61';
wwv_flow_api.g_varchar2_table(508) := '726765202E617065782D6974656D2D66696C652D2D6E61746976653A3A2D7765626B69742D66696C652D75706C6F61642D627574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E617065782D6974656D2D66';
wwv_flow_api.g_varchar2_table(509) := '696C652D2D6E61746976653A3A2D7765626B69742D66696C652D75706C6F61642D627574746F6E207B0D0A20202D2D612D627574746F6E2D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D627574746F6E2D70616464696E672D783A20';
wwv_flow_api.g_varchar2_table(510) := '302E373572656D3B0D0A20202D2D612D69636F6E2D73697A653A203172656D3B0D0A7D0D0A2E742D466F726D2D2D6C61726765202E617065782D6974656D2D67726F75702D2D73687574746C652073656C6563742E73687574746C655F6C6566742C0D0A';
wwv_flow_api.g_varchar2_table(511) := '2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E617065782D6974656D2D67726F75702D2D73687574746C652073656C6563742E73687574746C655F6C6566742C0D0A2E742D466F726D2D2D6C61726765202E617065782D69';
wwv_flow_api.g_varchar2_table(512) := '74656D2D67726F75702D2D73687574746C652073656C6563742E73687574746C655F72696768742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E617065782D6974656D2D67726F75702D2D73687574746C65207365';
wwv_flow_api.g_varchar2_table(513) := '6C6563742E73687574746C655F7269676874207B0D0A20206D696E2D6865696768743A2031312E323572656D3B0D0A7D0D0A2E742D466F726D2D2D786C617267652C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765207B';
wwv_flow_api.g_varchar2_table(514) := '0D0A20202D2D75742D6669656C642D6C6162656C2D666F6E742D73697A653A203172656D3B0D0A20202D2D75742D6669656C642D6C6162656C2D70616464696E672D793A20302E373572656D3B0D0A20202D2D612D6669656C642D696E7075742D666F6E';
wwv_flow_api.g_varchar2_table(515) := '742D73697A653A203172656D3B0D0A20202D2D612D6669656C642D696E7075742D6C696E652D6865696768743A20312E323572656D3B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D793A20302E36323572656D3B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(516) := '612D6669656C642D696E7075742D70616464696E672D783A20302E36323572656D3B0D0A20202D2D75742D6669656C642D696E7075742D69636F6E2D70616464696E672D783A20302E3572656D3B0D0A20202D2D75742D6669656C642D696E7075742D69';
wwv_flow_api.g_varchar2_table(517) := '636F6E2D70616464696E672D793A20302E373572656D3B0D0A20202D2D612D636865636B626F782D73697A653A20312E3572656D3B0D0A20202D2D612D636865636B626F782D69636F6E2D73697A653A20312E31323572656D3B0D0A20202D2D612D6368';
wwv_flow_api.g_varchar2_table(518) := '65636B626F782D6C6162656C2D666F6E742D73697A653A203172656D3B0D0A20202D2D612D636865636B626F782D6C6162656C2D6C696E652D6865696768743A20312E3572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D70616464696E672D';
wwv_flow_api.g_varchar2_table(519) := '793A20302E373572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D70616464696E672D783A20302E373572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D75742D70';
wwv_flow_api.g_varchar2_table(520) := '696C6C627574746F6E2D6C696E652D6865696768743A203172656D3B0D0A20202D2D75742D70696C6C627574746F6E2D636865636B626F782D6F66667365743A20302E3572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D636865636B626F78';
wwv_flow_api.g_varchar2_table(521) := '2D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D706F7075706C6F762D636869702D6D617267696E2D783A20302E31323572656D3B0D0A20202D2D612D706F7075706C6F762D636869702D6D617267696E2D793A20302E31323572656D';
wwv_flow_api.g_varchar2_table(522) := '3B0D0A20202D2D612D706F7075706C6F762D636869702D666F6E742D73697A653A203172656D3B0D0A20202D2D612D706F7075706C6F762D636869702D6C696E652D6865696768743A20312E3572656D3B0D0A20202D2D612D706F7075706C6F762D6368';
wwv_flow_api.g_varchar2_table(523) := '69702D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D706F7075706C6F762D636869702D70616464696E672D783A20302E3572656D3B0D0A20202D2D612D7377697463682D77696474683A20342E373572656D3B0D0A20202D2D612D';
wwv_flow_api.g_varchar2_table(524) := '7377697463682D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D7377697463682D70616464696E672D783A20302E323572656D3B0D0A20202D2D612D7377697463682D746F67676C652D77696474683A203272656D3B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(525) := '612D7377697463682D746F67676C652D6865696768743A203272656D3B0D0A7D0D0A2E742D466F726D2D2D786C61726765202E742D466F726D2D6974656D546578742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C6172676520';
wwv_flow_api.g_varchar2_table(526) := '2E742D466F726D2D6974656D54657874207B0D0A20206C696E652D6865696768743A20322E3572656D3B0D0A2020666F6E742D73697A653A203172656D3B0D0A7D0D0A2E742D466F726D2D2D786C61726765202E617065782D6974656D2D69636F6E2C0D';
wwv_flow_api.g_varchar2_table(527) := '0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765202E617065782D6974656D2D69636F6E2C0D0A2E742D466F726D2D2D786C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B65722C0D0A';
wwv_flow_api.g_varchar2_table(528) := '2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B6572207B0D0A20202D2D612D69636F6E2D70616464696E673A20302E3572656D3B0D0A7D0D0A2E74';
wwv_flow_api.g_varchar2_table(529) := '2D466F726D2D2D786C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B65722C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C617267652E617065782D6974656D2D777261707065722D2D636F';
wwv_flow_api.g_varchar2_table(530) := '6C6F722D7069636B6572207B0D0A20202D2D612D69636F6E2D73697A653A20312E323572656D3B0D0A20202D2D612D6974656D2D69636F6E2D6F66667365743A2063616C6328766172282D2D612D69636F6E2D73697A652C203172656D29202B20766172';
wwv_flow_api.g_varchar2_table(531) := '282D2D612D69636F6E2D70616464696E6729293B0D0A7D0D0A2E742D466F726D2D2D786C61726765202E617065782D6974656D2D67726F75702D2D636F6C6F722D7069636B6572202E612D427574746F6E2D2D636F6C6F725069636B65724F6E6C792C0D';
wwv_flow_api.g_varchar2_table(532) := '0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765202E617065782D6974656D2D67726F75702D2D636F6C6F722D7069636B6572202E612D427574746F6E2D2D636F6C6F725069636B65724F6E6C79207B0D0A20202D2D612D63';
wwv_flow_api.g_varchar2_table(533) := '6F6C6F722D7069636B65722D636F6C6F722D6F6E6C792D6865696768743A20312E3572656D3B0D0A20202D2D612D636F6C6F722D7069636B65722D636F6C6F722D6F6E6C792D77696474683A203272656D3B0D0A20202D2D612D627574746F6E2D706164';
wwv_flow_api.g_varchar2_table(534) := '64696E673A20302E3572656D3B0D0A7D0D0A2E742D466F726D2D2D786C61726765202E742D466F726D2D6974656D57726170706572202E612D427574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765202E742D';
wwv_flow_api.g_varchar2_table(535) := '466F726D2D6974656D57726170706572202E612D427574746F6E2C0D0A2E742D466F726D2D2D786C61726765202E742D466F726D2D6974656D57726170706572202E6F6A2D696E7075746461746574696D652D696E7075742D747269676765722C0D0A2E';
wwv_flow_api.g_varchar2_table(536) := '742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765202E742D466F726D2D6974656D57726170706572202E6F6A2D696E7075746461746574696D652D696E7075742D747269676765722C0D0A2E742D466F726D2D2D786C6172676520';
wwv_flow_api.g_varchar2_table(537) := '2E742D466F726D2D6974656D57726170706572202E742D466F726D2D68656C70427574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765202E742D466F726D2D6974656D57726170706572202E742D466F726D2D';
wwv_flow_api.g_varchar2_table(538) := '68656C70427574746F6E2C0D0A2E742D466F726D2D2D786C61726765202E617065782D6974656D2D66696C652D2D6E61746976653A3A2D7765626B69742D66696C652D75706C6F61642D627574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E74';
wwv_flow_api.g_varchar2_table(539) := '61696E65722D2D786C61726765202E617065782D6974656D2D66696C652D2D6E61746976653A3A2D7765626B69742D66696C652D75706C6F61642D627574746F6E207B0D0A20202D2D612D627574746F6E2D70616464696E672D793A20302E3638373572';
wwv_flow_api.g_varchar2_table(540) := '656D3B0D0A20202D2D612D627574746F6E2D70616464696E672D783A20302E373572656D3B0D0A20202D2D612D69636F6E2D73697A653A203172656D3B0D0A7D0D0A2E742D466F726D2D2D786C617267652E617065782D6974656D2D777261707065722D';
wwv_flow_api.g_varchar2_table(541) := '2D6861732D69636F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C617267652E617065782D6974656D2D777261707065722D2D6861732D69636F6E207B0D0A20202D2D612D69636F6E2D70616464696E673A20302E3572656D';
wwv_flow_api.g_varchar2_table(542) := '3B0D0A20202D2D612D6974656D2D69636F6E2D6F66667365743A2063616C6328766172282D2D612D69636F6E2D73697A652C203172656D29202B20766172282D2D612D69636F6E2D70616464696E6729293B0D0A7D0D0A2E742D466F726D2D6669656C64';
wwv_flow_api.g_varchar2_table(543) := '436F6E7461696E65722D2D666C6F6174696E674C6162656C2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C617267652C0D0A2E742D466F726D2D2D6C61726765202E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174';
wwv_flow_api.g_varchar2_table(544) := '696E674C6162656C207B0D0A20202D2D75742D6669656C642D6C6162656C2D666F6E742D73697A653A203172656D3B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D783A20302E373572656D3B0D0A20202D2D612D6669656C642D';
wwv_flow_api.g_varchar2_table(545) := '696E7075742D70616464696E672D793A20302E36323572656D3B0D0A20202D2D612D6669656C642D696E7075742D666F6E742D73697A653A203172656D3B0D0A20202D2D75742D6669656C642D666C2D6C6162656C2D6C696E652D6865696768743A2031';
wwv_flow_api.g_varchar2_table(546) := '2E323572656D3B0D0A20202D2D75742D6669656C642D666C2D6C6162656C2D666F6E742D73697A653A20302E373572656D3B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E742D466F726D2D';
wwv_flow_api.g_varchar2_table(547) := '6669656C64436F6E7461696E65722D2D786C617267652C0D0A2E742D466F726D2D2D786C61726765202E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C207B0D0A20202D2D75742D6669656C642D6C6162656C';
wwv_flow_api.g_varchar2_table(548) := '2D666F6E742D73697A653A203172656D3B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D783A20302E373572656D3B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D793A20302E373572656D3B0D0A20202D';
wwv_flow_api.g_varchar2_table(549) := '2D612D6669656C642D696E7075742D666F6E742D73697A653A203172656D3B0D0A20202D2D75742D6669656C642D666C2D6C6162656C2D6C696E652D6865696768743A20312E33373572656D3B0D0A20202D2D75742D6669656C642D666C2D6C6162656C';
wwv_flow_api.g_varchar2_table(550) := '2D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D75742D6669656C642D696E7075742D69636F6E2D70616464696E672D783A20302E36323572656D3B0D0A7D0D0A2E726F2D636865636B626F782C0D0A2E752D636865636B626F783A62';
wwv_flow_api.g_varchar2_table(551) := '65666F72652C0D0A2E752D726164696F3A6265666F7265207B0D0A20207472616E73666F726D2D6F726967696E3A2063656E7465722063656E7465723B0D0A20207472616E736974696F6E3A207472616E73666F726D20302E3132357320656173652C20';
wwv_flow_api.g_varchar2_table(552) := '6261636B67726F756E642D636F6C6F7220302E31357320656173652C20626F782D736861646F7720302E31357320656173652C20626F726465722D636F6C6F7220302E31357320656173653B0D0A7D0D0A2E726F2D636865636B626F783A6265666F7265';
wwv_flow_api.g_varchar2_table(553) := '2C0D0A2E752D636865636B626F783A61667465722C0D0A2E752D726164696F3A6166746572207B0D0A20207472616E73666F726D2D6F726967696E3A2063656E7465722063656E7465723B0D0A20207472616E73666F726D3A207363616C652830293B0D';
wwv_flow_api.g_varchar2_table(554) := '0A20207472616E736974696F6E3A206F70616369747920302E31357320656173652C207472616E73666F726D20302E327320656173653B0D0A7D0D0A2E726F2D636865636B626F783A6163746976652C0D0A2E726F2D636865636B626F783A6163746976';
wwv_flow_api.g_varchar2_table(555) := '653A6265666F72652C0D0A2E752D636865636B626F783A6163746976653A6265666F72652C0D0A2E752D636865636B626F783A6163746976653A61667465722C0D0A696E7075743A636865636B6564202B202E752D636865636B626F783A616374697665';
wwv_flow_api.g_varchar2_table(556) := '3A61667465722C0D0A2E752D726164696F3A6163746976653A6265666F72652C0D0A2E752D726164696F3A6163746976653A61667465722C0D0A696E7075743A636865636B6564202B202E752D726164696F3A6163746976653A6166746572207B0D0A20';
wwv_flow_api.g_varchar2_table(557) := '207472616E73666F726D3A207363616C6528302E3735293B0D0A7D0D0A2E726F2D636865636B626F782E69732D636865636B65643A6265666F72652C0D0A2E752D636865636B626F782E69732D636865636B65643A61667465722C0D0A696E7075743A63';
wwv_flow_api.g_varchar2_table(558) := '6865636B6564202B202E752D636865636B626F783A61667465722C0D0A696E7075743A636865636B6564202B202E752D726164696F3A6166746572207B0D0A20207472616E73666F726D3A207363616C652831293B0D0A7D0D0A2E742D4D6567614D656E';
wwv_flow_api.g_varchar2_table(559) := '75207B0D0A20202D2D612D6D656E752D666F63757365642D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D6D656E752D666F63757365642D746578742D636F6C6F723A20696E697469616C3B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(560) := '2E742D4D6567614D656E752D6974656D426F64792E69732D666F6375736564202E742D4D6567614D656E752D6C6162656C2C0D0A2E742D4D6567614D656E752D6974656D426F64793A686F766572202E742D4D6567614D656E752D6C6162656C207B0D0A';
wwv_flow_api.g_varchar2_table(561) := '2020636F6C6F723A20766172282D2D75742D6C696E6B2D746578742D636F6C6F72293B0D0A7D0D0A2E742D4865616465722D6E6176202E742D4865616465722D6E61762D6C697374207B0D0A20206261636B67726F756E642D636F6C6F723A2076617228';
wwv_flow_api.g_varchar2_table(562) := '2D2D612D6D656E756261722D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E75426172207B0D0A2020626F782D736861646F773A20696E73657420302063616C6328766172282D2D612D6D65';
wwv_flow_api.g_varchar2_table(563) := '6E756261722D6974656D2D626F726465722D77696474682C2031707829202A202D3129203020766172282D2D612D6D656E756261722D6974656D2D626F726465722D636F6C6F72293B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E7542';
wwv_flow_api.g_varchar2_table(564) := '61722D6974656D207B0D0A2020626F726465722D746F702D77696474683A20303B0D0A2020626F726465722D626F74746F6D2D77696474683A20303B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D3A666F637573';
wwv_flow_api.g_varchar2_table(565) := '2D77697468696E207B0D0A20206F75746C696E653A20766172282D2D75742D666F6375732D6F75746C696E652C206175746F2031707820766172282D2D75742D666F6375732D6F75746C696E652D636F6C6F722C202D7765626B69742D666F6375732D72';
wwv_flow_api.g_varchar2_table(566) := '696E672D636F6C6F7229293B0D0A20206F75746C696E652D6F66667365743A202D3170783B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D202E612D4D656E754261722D6C6162656C207B0D0A20206F75746C696E';
wwv_flow_api.g_varchar2_table(567) := '653A206E6F6E653B0D0A202077686974652D73706163653A206E6F777261703B0D0A20206D696E2D6865696768743A2063616C632863616C6328766172282D2D612D6D656E756261722D6974656D2D70616464696E672D792C2038707829202A20322920';
wwv_flow_api.g_varchar2_table(568) := '2B20766172282D2D612D6D656E756261722D6974656D2D6C696E652D6865696768742C203136707829293B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E752D2D73706C6974202E612D4D656E754261722D6C6162656C207B0D0A202070';
wwv_flow_api.g_varchar2_table(569) := '616464696E672D696E6C696E652D656E643A20303B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E752D2D73706C6974202E612D4D656E752D7375624D656E75436F6C207B0D0A20202D2D612D6D656E752D69636F6E2D73697A653A2031';
wwv_flow_api.g_varchar2_table(570) := '72656D3B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E752D2D63757272656E74207B0D0A20202D2D612D6D656E756261722D6974656D2D666F6E742D7765696768743A20766172282D2D612D626173652D666F6E742D7765696768742D';
wwv_flow_api.g_varchar2_table(571) := '626F6C642C20373030293B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E69732D666F6375736564207B0D0A20202D2D612D6D656E756261722D6974656D2D6261636B67726F756E642D636F6C6F723A20766172';
wwv_flow_api.g_varchar2_table(572) := '282D2D612D6D656E756261722D6974656D2D666F63757365642D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D6D656E756261722D6974656D2D746578742D636F6C6F723A20766172282D2D612D6D656E756261722D6974656D2D666F';
wwv_flow_api.g_varchar2_table(573) := '63757365642D746578742D636F6C6F72293B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742C0D0A2E742D547265654E6176';
wwv_flow_api.g_varchar2_table(574) := '202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D73656C65637465642C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54';
wwv_flow_api.g_varchar2_table(575) := '726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564207B0D0A20206261636B67726F756E642D636F6C6F723A20233339333933393B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E';
wwv_flow_api.g_varchar2_table(576) := '6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65';
wwv_flow_api.g_varchar2_table(577) := '203E202E612D54726565566965772D726F772C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20206261636B67726F756E642D636F6C6F723A20233331333133313B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(578) := '6F723A20236666666666663B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572207B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(579) := '723A20233430343034302021696D706F7274616E743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D5472656556';
wwv_flow_api.g_varchar2_table(580) := '6965772D746F67676C652C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D636F6E74656E742C0D0A';
wwv_flow_api.g_varchar2_table(581) := '2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D746F67676C65202B202E612D54726565566965772D636F';
wwv_flow_api.g_varchar2_table(582) := '6E74656E74207B0D0A2020636F6C6F723A20766172282D2D612D74726565766965772D6E6F64652D73656C65637465642D746578742D636F6C6F72293B0D0A7D0D0A2E612D54726565566965772D636F6E74656E742E69732D73656C6563746564203E20';
wwv_flow_api.g_varchar2_table(583) := '2E6661207B0D0A20202D2D75742D74726565766965772D69636F6E2D6F7061636974793A20313B0D0A7D0D0A2E742D547265654E61762D2D7374796C65412C0D0A2E742D547265654E61762D2D7374796C6542207B0D0A20202D2D75742D747265657669';
wwv_flow_api.g_varchar2_table(584) := '65772D62616467652D626F726465722D7261646975733A20312E323572656D3B0D0A20202D2D75742D74726565766965772D62616467652D666F6E742D7765696768743A20766172282D2D612D626173652D666F6E742D7765696768742D73656D69626F';
wwv_flow_api.g_varchar2_table(585) := '6C642C20353030293B0D0A20202D2D75742D74726565766965772D69636F6E2D73697A653A20312E323572656D3B0D0A20202D2D75742D74726565766965772D746F706C6576656C2D69636F6E2D636F6E7461696E65722D77696474683A20312E373572';
wwv_flow_api.g_varchar2_table(586) := '656D3B0D0A20202D2D75742D74726565766965772D6E6F64652D69636F6E2D73697A653A203172656D3B0D0A20202D2D75742D74726565766965772D6E6F64652D69636F6E2D636F6E7461696E65722D77696474683A20766172282D2D75742D74726565';
wwv_flow_api.g_varchar2_table(587) := '766965772D746F706C6576656C2D69636F6E2D636F6E7461696E65722D77696474682C20312E373572656D293B0D0A20202D2D75742D74726565766965772D6E6F64652D696E64656E743A203072656D3B0D0A20202D2D75742D74726565766965772D6C';
wwv_flow_api.g_varchar2_table(588) := '6561662D6E6F64652D696E64656E743A20302E36323572656D3B0D0A20202D2D75742D74726565766965772D746F706C6576656C2D6C6561662D70616464696E672D793A203072656D3B0D0A20202D2D612D74726565766965772D6E6F64652D70616464';
wwv_flow_api.g_varchar2_table(589) := '696E672D793A20302E36323572656D3B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C2C0D0A2E742D547265654E61762D2D7374796C6542202E612D547265655669';
wwv_flow_api.g_varchar2_table(590) := '65772D6E6F64652D2D746F704C6576656C20756C207B0D0A20202D2D612D74726565766965772D6E6F64652D70616464696E672D793A20302E373572656D3B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E';
wwv_flow_api.g_varchar2_table(591) := '6F64652D2D746F704C6576656C207B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C69642072676261283235352C203235352C203235352C20302E31293B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565';
wwv_flow_api.g_varchar2_table(592) := '566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65207B0D0A2020636F6C6F723A20766172282D2D612D74726565766965772D6E6F64652D73656C65637465642D746578742D636F6C6F72293B0D0A7D0D0A2E742D5472';
wwv_flow_api.g_varchar2_table(593) := '65654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E61762D2D7374796C6541202E612D547265';
wwv_flow_api.g_varchar2_table(594) := '65566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D612D74726565766965772D6E6F64652D73656C65637465642D6261636B67726F756E642D636F6C6F72293B0D0A2020';
wwv_flow_api.g_varchar2_table(595) := '636F6C6F723A20766172282D2D612D74726565766965772D6E6F64652D73656C65637465642D746578742D636F6C6F72293B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C';
wwv_flow_api.g_varchar2_table(596) := '202E612D54726565566965772D726F772E69732D63757272656E742D2D746F70202E612D54726565566965772D726F772E69732D73656C65637465642C0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D';
wwv_flow_api.g_varchar2_table(597) := '746F704C6576656C20756C202E612D54726565566965772D726F772E69732D73656C6563746564207B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D75742D626F64792D6E61762D6261636B67726F756E642D636F6C6F72293B0D';
wwv_flow_api.g_varchar2_table(598) := '0A2020636F6C6F723A20766172282D2D612D74726565766965772D6E6F64652D73656C65637465642D746578742D636F6C6F72293B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C65';
wwv_flow_api.g_varchar2_table(599) := '76656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E';
wwv_flow_api.g_varchar2_table(600) := '69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F77207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D70616C657474652D7072696D6172792920347078203020303B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(601) := '752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E752D52544C202E742D54726565';
wwv_flow_api.g_varchar2_table(602) := '4E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F77207B0D0A2020626F78';
wwv_flow_api.g_varchar2_table(603) := '2D736861646F773A20696E73657420766172282D2D75742D70616C657474652D7072696D61727929202D347078203020303B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C';
wwv_flow_api.g_varchar2_table(604) := '202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D666F63757365642C0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D5472656556';
wwv_flow_api.g_varchar2_table(605) := '6965772D726F772E69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D70616C657474652D7072696D';
wwv_flow_api.g_varchar2_table(606) := '6172792920347078203020302C2030203020302031707820766172282D2D75742D70616C657474652D7072696D6172792920696E7365743B0D0A7D0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E';
wwv_flow_api.g_varchar2_table(607) := '6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D666F63757365642C0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64';
wwv_flow_api.g_varchar2_table(608) := '652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A2020626F782D736861646F773A20696E7365742076';
wwv_flow_api.g_varchar2_table(609) := '6172282D2D75742D70616C657474652D7072696D61727929202D347078203020302C2030203020302031707820766172282D2D75742D70616C657474652D7072696D6172792920696E7365743B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542';
wwv_flow_api.g_varchar2_table(610) := '203E20756C207B0D0A20207472616E736974696F6E3A206D617267696E20766172282D2D75742D6C61796F75742D7472616E736974696F6E2C20302E31732920656173653B0D0A20206D617267696E3A20302E323572656D3B0D0A7D0D0A4061742D726F';
wwv_flow_api.g_varchar2_table(611) := '6F74202E6A732D6E6176436F6C6C61707365642026207B0D0A20202D2D612D74726565766965772D6E6F64652D70616464696E672D793A20302E3572656D3B0D0A2020203E20756C207B0D0A202020206D617267696E3A20303B0D0A20207D0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(612) := '2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F6465207B0D0A20206D617267696E2D626C6F636B2D73746172743A20302E323572656D3B0D0A20206D617267696E2D626C6F636B2D656E643A20302E323572656D3B0D';
wwv_flow_api.g_varchar2_table(613) := '0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C207B0D0A20206D617267696E2D696E6C696E652D73746172743A20302E323572656D3B0D0A20206D617267696E2D696E6C696E';
wwv_flow_api.g_varchar2_table(614) := '652D656E643A20302E323572656D3B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172';
wwv_flow_api.g_varchar2_table(615) := '656E743B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E61762D';
wwv_flow_api.g_varchar2_table(616) := '2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564207B0D0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(617) := '3A20236337343633343B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C65';
wwv_flow_api.g_varchar2_table(618) := '63746564202B202E612D54726565566965772D746F67676C652C0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D637572';
wwv_flow_api.g_varchar2_table(619) := '72656E742D2D746F70207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74';
wwv_flow_api.g_varchar2_table(620) := '2E69732D63757272656E742D2D746F702E69732D686F766572207B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D74';
wwv_flow_api.g_varchar2_table(621) := '6F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236361343833362021696D706F7274616E743B0D0A7D0D0A2E742D54';
wwv_flow_api.g_varchar2_table(622) := '7265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F77207B0D0A2020626F726465722D7261646975733A20302E323572656D3B0D0A7D0D0A2E612D4952522D6469';
wwv_flow_api.g_varchar2_table(623) := '616C6F672D2D646F776E6C6F61642C0D0A2E612D4952522D6469616C6F672D2D737562736372697074696F6E207B0D0A20202D2D612D69636F6E6C6973742D6974656D2D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D636F6D706F';
wwv_flow_api.g_varchar2_table(624) := '6E656E742D746F6F6C6261722D6261636B67726F756E642D636F6C6F722C207267626128302C20302C20302C20302E30323529293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D746578742D636F6C6F723A20766172282D2D75742D636F6D70';
wwv_flow_api.g_varchar2_table(625) := '6F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D686F7665722D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F';
wwv_flow_api.g_varchar2_table(626) := '6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D69636F6E';
wwv_flow_api.g_varchar2_table(627) := '6C6973742D6974656D2D73656C65637465642D746578742D636F6C6F723A20766172282D2D612D69636F6E6C6973742D6974656D2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D73656C65637465';
wwv_flow_api.g_varchar2_table(628) := '642D6261636B67726F756E642D636F6C6F723A20766172282D2D612D69636F6E6C6973742D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E612D4952522D6469616C6F672D2D646F776E6C6F6164202E612D4963';
wwv_flow_api.g_varchar2_table(629) := '6F6E4C6973742D6974656D2C0D0A2E612D4952522D6469616C6F672D2D737562736372697074696F6E202E612D49636F6E4C6973742D6974656D207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D636F6D706F6E656E74';
wwv_flow_api.g_varchar2_table(630) := '2D696E6E65722D626F726465722D636F6C6F72292030202D317078203020303B0D0A7D0D0A2E612D4952522D6469616C6F672D2D646F776E6C6F6164202E612D49636F6E4C6973742D6974656D2E69732D73656C65637465642C0D0A2E612D4952522D64';
wwv_flow_api.g_varchar2_table(631) := '69616C6F672D2D737562736372697074696F6E202E612D49636F6E4C6973742D6974656D2E69732D73656C6563746564207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D70616C657474652D7072696D61727929203020';
wwv_flow_api.g_varchar2_table(632) := '327078203020303B0D0A7D0D0A2E612D4952522D69636F6E4C6973742D6974656D202B202E612D4952522D69636F6E4C6973742D6974656D207B0D0A2020626F726465722D6C6566742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D';
wwv_flow_api.g_varchar2_table(633) := '696E6E65722D626F726465722D636F6C6F72293B0D0A7D0D0A2E752D52544C202E612D4952522D69636F6E4C6973742D6974656D202B202E612D4952522D69636F6E4C6973742D6974656D207B0D0A2020626F726465722D72696768742D636F6C6F723A';
wwv_flow_api.g_varchar2_table(634) := '20766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72293B0D0A7D0D0A2E612D4952522D726164696F49636F6E4C697374207B0D0A20202D2D612D69636F6E6C6973742D6974656D2D6261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(635) := '636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746F6F6C6261722D6261636B67726F756E642D636F6C6F722C207267626128302C20302C20302C20302E30323529293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D74657874';
wwv_flow_api.g_varchar2_table(636) := '2D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D686F7665722D746578742D636F6C6F723A20766172282D2D75742D636F6D70';
wwv_flow_api.g_varchar2_table(637) := '6F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E';
wwv_flow_api.g_varchar2_table(638) := '642D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D73656C65637465642D746578742D636F6C6F723A20766172282D2D612D69636F6E6C6973742D6974656D2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D';
wwv_flow_api.g_varchar2_table(639) := '69636F6E6C6973742D6974656D2D73656C65637465642D6261636B67726F756E642D636F6C6F723A20766172282D2D612D69636F6E6C6973742D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E612D4952522D72';
wwv_flow_api.g_varchar2_table(640) := '6164696F49636F6E4C6973742D6974656D202B202E612D4952522D726164696F49636F6E4C6973742D6974656D207B0D0A2020626F726465722D6C6566742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465';
wwv_flow_api.g_varchar2_table(641) := '722D636F6C6F72293B0D0A7D0D0A2E752D52544C202E612D4952522D726164696F49636F6E4C6973742D6974656D202B202E612D4952522D726164696F49636F6E4C6973742D6974656D207B0D0A2020626F726465722D72696768742D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(642) := '766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72293B0D0A7D0D0A2E612D4952522D726164696F49636F6E4C6973742D6974656D20696E7075745B747970653D726164696F5D202B206C6162656C207B0D0A20';
wwv_flow_api.g_varchar2_table(643) := '20626F782D736861646F773A20696E73657420766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72292030202D317078203020303B0D0A7D0D0A2E612D4952522D726164696F49636F6E4C6973742D6974656D20';
wwv_flow_api.g_varchar2_table(644) := '696E7075745B747970653D726164696F5D3A636865636B6564202B206C6162656C207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D70616C657474652D7072696D61727929203020327078203020303B0D0A7D0D0A2E61';
wwv_flow_api.g_varchar2_table(645) := '2D4952522D6469616C6F67496E666F3A66697273742D6368696C64207B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72293B0D0A7D0D0A2E61';
wwv_flow_api.g_varchar2_table(646) := '2D49472D627574746F6E2E612D49472D627574746F6E2D2D636F6E74726F6C732C0D0A2E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D636F6E74726F6C73207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(647) := '6F6C6F723A20766172282D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E612D4952522D6469616C6F67526F772D2D6865616465722C0D0A2E612D4952522D6469616C6F674C6973742061207B0D0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(648) := '723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A7D0D0A2E612D4952522D6469616C6F674C697374207B0D0A2020626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E65';
wwv_flow_api.g_varchar2_table(649) := '6E742D626F726465722D636F6C6F72293B0D0A7D0D0A2E612D4952522D686967686C6967687450726576696577207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72';
wwv_flow_api.g_varchar2_table(650) := '29203020302030203170783B0D0A7D0D0A2E612D4952522D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233263323832353B0D0A7D0D0A2E612D4952522D6865616465723A686F766572207B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(651) := '6E642D636F6C6F723A20233334333032633B0D0A7D0D0A2E612D4952522D6865616465722E69732D6163746976652C0D0A2E612D47562D6865616465722E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D';
wwv_flow_api.g_varchar2_table(652) := '2D612D6D656E752D6261636B67726F756E642D636F6C6F72293B0D0A2020636F6C6F723A20766172282D2D612D6D656E752D746578742D636F6C6F72293B0D0A7D0D0A2E612D4952522D6865616465722D2D67726F7570207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(653) := '756E642D636F6C6F723A20233331326432613B0D0A7D0D0A2E612D4952522D736F72745769646765742D7365617263684C6162656C3A6265666F7265207B0D0A2020636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D7574';
wwv_flow_api.g_varchar2_table(654) := '65642D636F6C6F72293B0D0A7D0D0A2E612D4952522D736F72745769646765742D736561726368203E202E612D4952522D736F72745769646765742D7365617263684669656C645B747970653D2274657874225D207B0D0A2020636F6C6F723A20766172';
wwv_flow_api.g_varchar2_table(655) := '282D2D612D6669656C642D696E7075742D73746174652D746578742D636F6C6F722C20766172282D2D612D6669656C642D696E7075742D746578742D636F6C6F7229293B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D612D6669';
wwv_flow_api.g_varchar2_table(656) := '656C642D696E7075742D73746174652D6261636B67726F756E642D636F6C6F722C20766172282D2D612D6669656C642D696E7075742D6261636B67726F756E642D636F6C6F7229293B0D0A7D0D0A2E612D47562D7461626C652074682E612D47562D636F';
wwv_flow_api.g_varchar2_table(657) := '6E74726F6C427265616B486561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233331326432613B0D0A2020626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D';
wwv_flow_api.g_varchar2_table(658) := '0A2020636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D73617665645265706F72742C0D0A2E612D49472D636F';
wwv_flow_api.g_varchar2_table(659) := '6E74726F6C732D6974656D2D2D73617665645265706F72742C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D73617665645265706F72742C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D73617665645265706F72';
wwv_flow_api.g_varchar2_table(660) := '74207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233441413445433B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C61';
wwv_flow_api.g_varchar2_table(661) := '62656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233066353638653B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D7365617263682C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D736561';
wwv_flow_api.g_varchar2_table(662) := '7263682C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D7365617263682C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D736561726368207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C';
wwv_flow_api.g_varchar2_table(663) := '2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233441413445433B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233066';
wwv_flow_api.g_varchar2_table(664) := '353638653B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D66696C7465722C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D66696C7465722C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D';
wwv_flow_api.g_varchar2_table(665) := '2D2D66696C7465722C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D66696C746572207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(666) := '3234434237463B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233064343932653B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D69';
wwv_flow_api.g_varchar2_table(667) := '74656D2D2D636F6E74726F6C427265616B2C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D636F6E74726F6C427265616B2C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D636F6E74726F6C427265616B2C0D0A2E61';
wwv_flow_api.g_varchar2_table(668) := '2D4952522D636F6E74726F6C732D6974656D2D2D636F6E74726F6C427265616B207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233342383342443B';
wwv_flow_api.g_varchar2_table(669) := '0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233134326434313B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D6772';
wwv_flow_api.g_varchar2_table(670) := '6F757042792C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D67726F757042792C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D67726F757042792C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D6772';
wwv_flow_api.g_varchar2_table(671) := '6F75704279207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233342383342443B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C';
wwv_flow_api.g_varchar2_table(672) := '6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233134326434313B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D6167677265676174652C0D0A2E612D49472D636F6E74726F6C732D6974';
wwv_flow_api.g_varchar2_table(673) := '656D2D2D6167677265676174652C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D6167677265676174652C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D616767726567617465207B0D0A20202D2D612D7265706F';
wwv_flow_api.g_varchar2_table(674) := '72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233342383342443B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67';
wwv_flow_api.g_varchar2_table(675) := '726F756E642D636F6C6F723A20233134326434313B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D686967686C696768742C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D686967686C696768742C0D0A2E612D';
wwv_flow_api.g_varchar2_table(676) := '4952522D7265706F727453756D6D6172792D6974656D2D2D686967686C696768742C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D686967686C69676874207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C61';
wwv_flow_api.g_varchar2_table(677) := '62656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20234646424532413B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233836356430';
wwv_flow_api.g_varchar2_table(678) := '303B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D666C6173686261636B2C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D666C6173686261636B2C0D0A2E612D4952522D7265706F727453756D6D6172792D69';
wwv_flow_api.g_varchar2_table(679) := '74656D2D2D666C6173686261636B2C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D666C6173686261636B207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E64';
wwv_flow_api.g_varchar2_table(680) := '2D636F6C6F723A20233945413741443B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233265333433373B0D0A7D0D0A2E612D49472D7265706F7274';
wwv_flow_api.g_varchar2_table(681) := '53756D6D6172792D6974656D2D2D63686172742C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D63686172742C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D63686172742C0D0A2E612D4952522D636F6E74726F6C';
wwv_flow_api.g_varchar2_table(682) := '732D6974656D2D2D6368617274207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233342383342443B0D0A20202D2D612D7265706F72742D636F6E74';
wwv_flow_api.g_varchar2_table(683) := '726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233034306130653B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D7069766F742C0D0A2E612D49472D636F6E74726F6C';
wwv_flow_api.g_varchar2_table(684) := '732D6974656D2D2D7069766F742C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D7069766F742C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D7069766F74207B0D0A20202D2D612D7265706F72742D636F6E7472';
wwv_flow_api.g_varchar2_table(685) := '6F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233945413741443B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(686) := '6C6F723A20233265333433373B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D696E76616C696453657474696E67732C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D696E76616C696453657474696E67732C0D';
wwv_flow_api.g_varchar2_table(687) := '0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D696E76616C696453657474696E67732C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D696E76616C696453657474696E6773207B0D0A20202D2D612D7265706F72742D';
wwv_flow_api.g_varchar2_table(688) := '636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20234244433343373B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F75';
wwv_flow_api.g_varchar2_table(689) := '6E642D636F6C6F723A20233439353135363B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D696E61637469766553657474696E67732C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D696E616374697665536574';
wwv_flow_api.g_varchar2_table(690) := '74696E67732C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D696E61637469766553657474696E67732C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D696E61637469766553657474696E6773207B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(691) := '612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20234244433343373B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F766572';
wwv_flow_api.g_varchar2_table(692) := '2D6261636B67726F756E642D636F6C6F723A20233439353135363B0D0A7D0D0A2E612D47562D7461626C65202E612D47562D63656C6C2E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20233139313931393B0D0A7D0D';
wwv_flow_api.g_varchar2_table(693) := '0A2E612D47562D2D656469744D6F6465202E612D47562D726F772E69732D726561646F6E6C79202E612D47562D63656C6C2C0D0A2E612D47562D2D656469744D6F6465202E612D47562D63656C6C2E69732D726561646F6E6C79207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(694) := '67726F756E642D636F6C6F723A20233064306430643B0D0A2020636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A7D0D0A2E612D47562D63656C6C202E612D47562D636F6C756D6E4974';
wwv_flow_api.g_varchar2_table(695) := '656D20696E7075743A6E6F74285B747970653D22726164696F225D293A6E6F74285B747970653D22636865636B626F78225D293A666F6375732C0D0A2E612D47562D63656C6C202E612D47562D636F6C756D6E4974656D2073656C6563745B73697A653D';
wwv_flow_api.g_varchar2_table(696) := '2731275D3A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A20233030303B0D0A7D0D0A2E612D436869702D72656D6F7665207B0D0A20206D617267696E2D696E6C696E652D656E643A2063616C6328766172282D2D612D63686970';
wwv_flow_api.g_varchar2_table(697) := '2D6C6162656C2D73706163696E672C2034707829202F2032293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D7072696D6172793A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661';
wwv_flow_api.g_varchar2_table(698) := '756C742D636F6C6F72293B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D7365636F6E646172793A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D6F6A2D636F72652D7465';
wwv_flow_api.g_varchar2_table(699) := '78742D636F6C6F722D6272616E643A20766172282D2D75742D70616C657474652D7072696D6172792D74657874293B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D64616E6765723A20766172282D2D75742D70616C657474652D64616E';
wwv_flow_api.g_varchar2_table(700) := '6765722D74657874293B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D7761726E696E673A20766172282D2D75742D70616C657474652D7761726E696E672D74657874293B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D';
wwv_flow_api.g_varchar2_table(701) := '737563636573733A20766172282D2D75742D70616C657474652D737563636573732D74657874293B0D0A20202D2D6F6A2D636F72652D69636F6E2D73697A652D6C673A20312E3572656D3B0D0A20202D2D6F6A2D636F72652D69636F6E2D73697A652D73';
wwv_flow_api.g_varchar2_table(702) := '6D3A203172656D3B0D0A20202D2D6F6A2D636F72652D646976696465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D6F6A2D636F72652D646976696465722D6D617267696E3A20';
wwv_flow_api.g_varchar2_table(703) := '302E3572656D3B0D0A20202D2D6F6A2D636F72652D666F6375732D626F726465722D636F6C6F723A20766172282D2D75742D666F6375732D6F75746C696E652D636F6C6F72293B0D0A20202D2D6F6A2D636F6C6F722D737065637472756D2D626F726465';
wwv_flow_api.g_varchar2_table(704) := '722D636F6C6F723A20233333333333333B0D0A20202D2D6F6A2D706F7075702D62672D636F6C6F723A20766172282D2D612D6D656E752D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A2D636F72652D62672D636F6C6F722D686F7665';
wwv_flow_api.g_varchar2_table(705) := '723A20766172282D2D612D6D656E752D666F63757365642D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A2D636F72652D626F782D736861646F773A20766172282D2D75742D736861646F772D736D293B0D0A20202D2D6F6A2D6C696E';
wwv_flow_api.g_varchar2_table(706) := '6B2D746578742D636F6C6F723A20766172282D2D75742D6C696E6B2D746578742D636F6C6F72293B0D0A20202D2D6F6A2D746578742D6669656C642D62672D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D6261636B67726F756E64';
wwv_flow_api.g_varchar2_table(707) := '2D636F6C6F72293B0D0A20202D2D6F6A2D746578742D6669656C642D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D626F726465722D636F6C6F72293B0D0A20202D2D6F6A2D746578742D6669656C642D74657874';
wwv_flow_api.g_varchar2_table(708) := '2D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D746578742D636F6C6F72293B0D0A20202D2D6F6A2D636F6C6C656374696F6E2D667265652D73706163652D62672D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D';
wwv_flow_api.g_varchar2_table(709) := '6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A2D636F6C6C656374696F6E2D6865616465722D62672D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A';
wwv_flow_api.g_varchar2_table(710) := '2D636F6C6C656374696F6E2D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D6F6A2D636F6C6C656374696F6E2D62672D636F6C6F723A20766172282D2D75742D636F';
wwv_flow_api.g_varchar2_table(711) := '6D706F6E656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A2D707269766174652D67616E74742D6D696C6573746F6E652D62672D636F6C6F723A20766172282D2D752D636F6C6F722D3135293B0D0A20202D2D6F6A2D70726976';
wwv_flow_api.g_varchar2_table(712) := '6174652D67616E74742D7461736B2D62672D636F6C6F723A20766172282D2D752D636F6C6F722D31293B0D0A20202D2D6F6A2D707269766174652D67616E74742D7461736B2D70726F67726573732D62672D636F6C6F723A20766172282D2D752D636F6C';
wwv_flow_api.g_varchar2_table(713) := '6F722D31293B0D0A20202D2D6F6A2D627574746F6E2D6F75746C696E65642D6368726F6D652D62672D636F6C6F722D686F7665723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D6F6A2D627574746F6E2D6F75746C';
wwv_flow_api.g_varchar2_table(714) := '696E65642D6368726F6D652D626F726465722D636F6C6F722D686F7665723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D6F6A2D627574746F6E2D6F75746C696E65642D6368726F6D652D746578742D636F6C6F72';
wwv_flow_api.g_varchar2_table(715) := '2D686F7665723A20766172282D2D75742D70616C657474652D7072696D6172792D636F6E7472617374293B0D0A20202D2D6F6A2D627574746F6E2D626F726465726C6573732D6368726F6D652D62672D636F6C6F722D686F7665723A20766172282D2D75';
wwv_flow_api.g_varchar2_table(716) := '742D70616C657474652D7072696D617279293B0D0A20202D2D6F6A2D627574746F6E2D626F726465726C6573732D6368726F6D652D746578742D636F6C6F722D686F7665723A20766172282D2D75742D70616C657474652D7072696D6172792D636F6E74';
wwv_flow_api.g_varchar2_table(717) := '72617374293B0D0A20202D2D6F6A2D68656164696E672D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D7469746C652D636F6C6F72293B0D0A7D0D0A2E6F6A2D6C697374626F782D64726F703A6E6F74282E6F';
wwv_flow_api.g_varchar2_table(718) := '6A2D6C697374626F782D686964652D686F76657229202E6F6A2D6C697374626F782D726573756C7473202E6F6A2D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D612D6D656E752D666F63757365642D6261636B';
wwv_flow_api.g_varchar2_table(719) := '67726F756E642D636F6C6F72293B0D0A2020636F6C6F723A20766172282D2D612D6D656E752D666F63757365642D746578742D636F6C6F72293B0D0A7D0D0A2E6F6A2D6C697374626F782D726573756C74732C0D0A2E6F6A2D6C697374626F782D726573';
wwv_flow_api.g_varchar2_table(720) := '756C74732D626173652C0D0A2E6F6A2D73656C6563742D726573756C7473207B0D0A20206D617267696E3A20303B0D0A7D0D0A2E6F6A2D6C697374626F782D64726F70207B0D0A202070616464696E672D626C6F636B2D73746172743A2063616C632876';
wwv_flow_api.g_varchar2_table(721) := '6172282D2D612D6D656E752D70616464696E672D792C20302E3572656D29202D20766172282D2D612D6D656E752D626F726465722D77696474682C2031707829293B0D0A202070616464696E672D626C6F636B2D656E643A2063616C6328766172282D2D';
wwv_flow_api.g_varchar2_table(722) := '612D6D656E752D70616464696E672D792C20302E3572656D29202D20766172282D2D612D6D656E752D626F726465722D77696474682C2031707829293B0D0A202070616464696E672D696E6C696E652D73746172743A2063616C6328766172282D2D612D';
wwv_flow_api.g_varchar2_table(723) := '6D656E752D70616464696E672D782C203072656D29202D20766172282D2D612D6D656E752D626F726465722D77696474682C2031707829293B0D0A202070616464696E672D696E6C696E652D656E643A2063616C6328766172282D2D612D6D656E752D70';
wwv_flow_api.g_varchar2_table(724) := '616464696E672D782C203072656D29202D20766172282D2D612D6D656E752D626F726465722D77696474682C2031707829293B0D0A2020626F726465722D7261646975733A20766172282D2D612D6D656E752D626F726465722D7261646975732C20302E';
wwv_flow_api.g_varchar2_table(725) := '323572656D293B0D0A2020626F726465722D636F6C6F723A20766172282D2D612D6D656E752D626F726465722D636F6C6F72293B0D0A2020626F726465722D77696474683A20766172282D2D612D6D656E752D626F726465722D77696474682C20317078';
wwv_flow_api.g_varchar2_table(726) := '293B0D0A2020626F726465722D7374796C653A20736F6C69643B0D0A2020626F782D736861646F773A20766172282D2D612D6D656E752D736861646F77293B0D0A20206D696E2D6865696768743A2063616C6328766172282D2D612D6D656E752D6C696E';
wwv_flow_api.g_varchar2_table(727) := '652D6865696768742C203172656D29202B2028766172282D2D612D6D656E752D70616464696E672D792C20302E3572656D29202A203229293B0D0A2020636F6C6F723A20766172282D2D612D6D656E752D746578742D636F6C6F72293B0D0A2020626163';
wwv_flow_api.g_varchar2_table(728) := '6B67726F756E642D636F6C6F723A20766172282D2D612D6D656E752D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E646172207B0D0A2020666F6E742D73697A653A20766172282D2D6A7569';
wwv_flow_api.g_varchar2_table(729) := '2D646174657069636B65722D666F6E742D73697A652C20302E3638373572656D293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E646172207468207B0D0A2020636F6C6F723A20766172282D2D6A75692D646174657069636B65722D68';
wwv_flow_api.g_varchar2_table(730) := '65616465722C2023363636293B0D0A2020626F726465722D626F74746F6D2D7374796C653A20736F6C69643B0D0A2020626F726465722D626F74746F6D2D77696474683A20766172282D2D6A75692D646174657069636B65722D626F726465722D776964';
wwv_flow_api.g_varchar2_table(731) := '74682C20317078293B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A20766172282D2D75742D646174657069636B65722D626F726465722D636F6C6F722C207267626128302C20302C20302C20302E3129293B0D0A202070616464696E672D';
wwv_flow_api.g_varchar2_table(732) := '626C6F636B2D73746172743A20766172282D2D6A75692D646174657069636B65722D70616464696E672D792C20302E3572656D293B0D0A202070616464696E672D696E6C696E652D656E643A20766172282D2D6A75692D646174657069636B65722D7061';
wwv_flow_api.g_varchar2_table(733) := '6464696E672D782C20302E3572656D293B0D0A202070616464696E672D626C6F636B2D656E643A20766172282D2D6A75692D646174657069636B65722D70616464696E672D792C20302E3572656D293B0D0A202070616464696E672D696E6C696E652D73';
wwv_flow_api.g_varchar2_table(734) := '746172743A20766172282D2D6A75692D646174657069636B65722D70616464696E672D782C20302E3572656D293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E646172207464207B0D0A202077696474683A20766172282D2D6A75692D';
wwv_flow_api.g_varchar2_table(735) := '646174657069636B65722D646174652D73697A652C203372656D293B0D0A20206865696768743A20766172282D2D6A75692D646174657069636B65722D646174652D73697A652C203372656D293B0D0A20206D617267696E3A20766172282D2D6A75692D';
wwv_flow_api.g_varchar2_table(736) := '646174657069636B65722D646174652D6D617267696E2C20302E31323572656D293B0D0A20206C696E652D6865696768743A20766172282D2D6A75692D646174657069636B65722D646174652D73697A652C203372656D293B0D0A2020626F726465722D';
wwv_flow_api.g_varchar2_table(737) := '7261646975733A20766172282D2D6A75692D646174657069636B65722D646174652D626F726465722D7261646975732C2031303025293B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D6A75692D646174657069636B65722D6461';
wwv_flow_api.g_varchar2_table(738) := '74652D6261636B67726F756E642D636F6C6F722C207472616E73706172656E74293B0D0A2020636F6C6F723A20766172282D2D6A75692D646174657069636B65722D646174652D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D746578';
wwv_flow_api.g_varchar2_table(739) := '742D64656661756C742D636F6C6F7229293B0D0A20207472616E736974696F6E3A20766172282D2D6A75692D646174657069636B65722D646174652D7472616E736974696F6E2C206261636B67726F756E642D636F6C6F7220302E31732C20636F6C6F72';
wwv_flow_api.g_varchar2_table(740) := '20302E3173293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E6461722074643A666F637573207B0D0A20206F75746C696E653A20303B0D0A2020626F782D736861646F773A20766172282D2D6A75692D646174657069636B65722D6461';
wwv_flow_api.g_varchar2_table(741) := '74652D666F6375732D626F782D736861646F772C2033352030203020317078202330303736646620696E7365742C203020302031707820327078207267626128302C203131382C203232332C20302E323529292021696D706F7274616E743B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(742) := '2E6F6A2D646174657069636B65722D63616C656E64617220746420612E6F6A2D73656C65637465642C0D0A2E6F6A2D646174657069636B65722D63616C656E6461722074642E6F6A2D646174657069636B65722D746F64617920612E6F6A2D73656C6563';
wwv_flow_api.g_varchar2_table(743) := '746564207B0D0A20202D2D6A75692D646174657069636B65722D646174652D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D6A75692D646174657069636B65722D64617465';
wwv_flow_api.g_varchar2_table(744) := '2D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D636F6E7472617374293B0D0A2020666F6E742D7765696768743A20766172282D2D6A75692D646174657069636B65722D73656C65637465642D666F6E742D7765696768';
wwv_flow_api.g_varchar2_table(745) := '742C20373030293B0D0A2020666F6E742D73697A653A20766172282D2D6A75692D646174657069636B65722D6163746976652D666F6E742D73697A652C20302E38373572656D293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E646172';
wwv_flow_api.g_varchar2_table(746) := '202E6F6A2D656E61626C65642E6F6A2D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D6A75692D646174657069636B65722D686F7665722D6261636B67726F756E642D636F6C6F722C2023653865386538293B0D';
wwv_flow_api.g_varchar2_table(747) := '0A2020636F6C6F723A20766172282D2D6A75692D646174657069636B65722D686F7665722D636F6C6F722C20626C61636B293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E646172202E6F6A2D646174657069636B65722D6E6578742D';
wwv_flow_api.g_varchar2_table(748) := '69636F6E3A6E6F74282E6F6A2D64697361626C6564292E6F6A2D686F7665722C0D0A2E6F6A2D646174657069636B65722D63616C656E646172202E6F6A2D646174657069636B65722D707265762D69636F6E3A6E6F74282E6F6A2D64697361626C656429';
wwv_flow_api.g_varchar2_table(749) := '2E6F6A2D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D6A75692D646174657069636B65722D686F7665722D6261636B67726F756E642D636F6C6F722C2023653865386538293B0D0A2020636F6C6F723A207661';
wwv_flow_api.g_varchar2_table(750) := '72282D2D6A75692D646174657069636B65722D686F7665722D636F6C6F722C20626C61636B293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626173652D66696C7465723A20696E766572742831293B0D0A7D0D0A';
null;
end;
/
begin
wwv_flow_api.create_theme_file(
 p_id=>wwv_flow_api.id(10765342577194572767)
,p_theme_id=>42
,p_file_name=>'25680451500107499042.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '3A726F6F74207B0D0A20202D2D75742D70616C657474652D7072696D6172793A20236337343633343B0D0A20202D2D75742D70616C657474652D7072696D6172792D636F6E74726173743A20236666666666663B0D0A20202D2D75742D70616C65747465';
wwv_flow_api.g_varchar2_table(2) := '2D7072696D6172792D73686164653A20233134303730353B0D0A20202D2D75742D70616C657474652D7072696D6172792D746578743A20766172282D2D612D70616C657474652D7072696D617279293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D7574';
wwv_flow_api.g_varchar2_table(3) := '2D6C696E6B2D746578742D636F6C6F723A20236464386137653B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D666F6375732D6F75746C696E652D636F6C6F723A20236337343633343B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D636F6D';
wwv_flow_api.g_varchar2_table(4) := '706F6E656E742D626F726465722D7261646975733A203270783B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D6261636B67726F756E642D636F6C6F723A20233331326432613B0D0A20202D2D75742D626F64792D746578742D636F6C';
wwv_flow_api.g_varchar2_table(5) := '6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D616374696F6E732D6261636B67726F756E642D636F6C6F723A20233335333132653B0D0A20202D2D75742D626F64792D616374696F6E732D746578742D63';
wwv_flow_api.g_varchar2_table(6) := '6F6C6F723A20236666666666663B0D0A20202D2D75742D626F64792D616374696F6E73746F67676C652D6261636B67726F756E642D636F6C6F723A20233335333132653B0D0A20202D2D75742D626F64792D616374696F6E73746F67676C652D686F7665';
wwv_flow_api.g_varchar2_table(7) := '722D6261636B67726F756E642D636F6C6F723A20233531346134353B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D7469746C652D6261636B67726F756E642D636F6C6F723A20233339333533313B0D0A20202D2D75742D626F64792D';
wwv_flow_api.g_varchar2_table(8) := '7469746C652D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D6865616465722D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D75742D6865616465722D74657874';
wwv_flow_api.g_varchar2_table(9) := '2D636F6C6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D736964656261722D6261636B67726F756E642D636F6C6F723A20233366336133363B0D0A20202D2D75742D626F64792D736964656261722D7465';
wwv_flow_api.g_varchar2_table(10) := '78742D636F6C6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D6E61762D6261636B67726F756E642D636F6C6F723A20233461346134613B0D0A20202D2D75742D626F64792D6E61762D746578742D636F6C';
wwv_flow_api.g_varchar2_table(11) := '6F723A20236666666666663B0D0A20202D2D75742D6E6176746162732D6261636B67726F756E642D636F6C6F723A20233461346134613B0D0A20202D2D75742D6E6176746162732D746578742D636F6C6F723A20236666666666663B0D0A20202D2D7574';
wwv_flow_api.g_varchar2_table(12) := '2D6E6176746162732D6974656D2D626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A20202D2D75742D6E6176746162732D6974656D2D6163746976652D6261636B67726F756E642D636F6C6F723A20233331333133';
wwv_flow_api.g_varchar2_table(13) := '313B0D0A20202D2D75742D6E6176746162732D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D6E6176746162732D6974656D2D6163746976652D6261636B67726F756E642D636F6C6F72293B0D0A20202D';
wwv_flow_api.g_varchar2_table(14) := '2D75742D6865616465722D6D656E756261722D6261636B67726F756E642D636F6C6F723A20233461346134613B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D746578742D636F6C6F723A20236666666666663B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(15) := '75742D6865616465722D6D656E756261722D6974656D2D63757272656E742D6261636B67726F756E642D636F6C6F723A20233331333133313B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D63757272656E742D746578742D63';
wwv_flow_api.g_varchar2_table(16) := '6F6C6F723A20236666666666663B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D6865616465722D6D656E756261722D6974656D2D63757272';
wwv_flow_api.g_varchar2_table(17) := '656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D686F7665722D746578742D636F6C6F723A20766172282D2D75742D6865616465722D6D656E756261722D6974656D2D6375';
wwv_flow_api.g_varchar2_table(18) := '7272656E742D746578742D636F6C6F72293B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A20202D2D75742D6865616465722D6D656E75';
wwv_flow_api.g_varchar2_table(19) := '6261722D6974656D2D73706C69742D69636F6E2D636F6C6F723A20236666666666663B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D73706C69742D626F726465722D636F6C6F723A207267626128302C20302C20302C20302E';
wwv_flow_api.g_varchar2_table(20) := '31293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D74726565766965772D6E6F64652D73656C65637465642D6261636B67726F756E642D636F6C6F723A20233331333133313B0D0A20202D2D612D74726565766965772D6E6F64652D73656C656374';
wwv_flow_api.g_varchar2_table(21) := '65642D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D74726565766965772D6E6F64652D73656C65637465642D69636F6E2D636F6C6F723A20236666666666663B0D0A20202D2D612D747265657669';
wwv_flow_api.g_varchar2_table(22) := '65772D6E6F64652D69636F6E2D636F6C6F723A20696E68657269743B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D74726565766965772D62616467652D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D75742D74';
wwv_flow_api.g_varchar2_table(23) := '726565766965772D62616467652D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D6D656E752D6261636B67726F756E642D636F6C6F723A20233236323332313B0D0A20202D2D612D6D656E752D7465';
wwv_flow_api.g_varchar2_table(24) := '78742D636F6C6F723A20236663666366633B0D0A20202D2D612D6D656E752D64656661756C742D746578742D636F6C6F723A20766172282D2D612D6D656E752D746578742D636F6C6F72293B0D0A20202D2D612D6D656E752D616363656C2D746578742D';
wwv_flow_api.g_varchar2_table(25) := '636F6C6F723A20766172282D2D612D6D656E752D746578742D636F6C6F72293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D6D656E752D666F63757365642D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D612D6D';
wwv_flow_api.g_varchar2_table(26) := '656E752D666F63757365642D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D6D656E752D666F63757365642D616363656C2D746578742D636F6C6F723A20766172282D2D612D6D656E752D666F63757365642D746578742D636F6C';
wwv_flow_api.g_varchar2_table(27) := '6F72293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D726567696F6E2D6865616465722D6261636B67726F756E642D636F6C6F723A20233162313931373B0D0A20202D2D75742D726567696F6E2D6865616465722D746578742D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(28) := '236632663266323B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D726567696F6E2D6261636B67726F756E642D636F6C6F723A20233236323332313B0D0A20202D2D75742D726567696F6E2D746578742D636F6C6F723A20236663666366633B0D0A';
wwv_flow_api.g_varchar2_table(29) := '20202D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F723A20233236323332313B0D0A20202D2D75742D77697A6172642D6865616465722D6261636B67726F756E642D636F6C6F723A20233263323832353B0D0A20202D2D7574';
wwv_flow_api.g_varchar2_table(30) := '2D7265706F72742D63656C6C2D626F726465722D636F6C6F723A20233431336333383B0D0A20202D2D75742D7265706F72742D63656C6C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233263323832353B0D0A7D0D0A3A726F6F74207B';
wwv_flow_api.g_varchar2_table(31) := '0D0A20202D2D75742D70616C657474652D7072696D6172792D616C743A20236634643764333B0D0A20202D2D75742D70616C657474652D7072696D6172792D616C742D636F6E74726173743A20233339313430663B0D0A20202D2D75742D70616C657474';
wwv_flow_api.g_varchar2_table(32) := '652D7072696D6172792D616C742D73686164653A20233063306230623B0D0A20202D2D75742D70616C657474652D7072696D6172792D616C742D746578743A20236131373937343B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D70616C65747465';
wwv_flow_api.g_varchar2_table(33) := '2D737563636573733A20233338383732393B0D0A20202D2D75742D70616C657474652D737563636573732D636F6E74726173743A20234646463B0D0A20202D2D75742D70616C657474652D737563636573732D73686164653A20233063316530393B0D0A';
wwv_flow_api.g_varchar2_table(34) := '20202D2D75742D70616C657474652D737563636573732D746578743A20233535376434653B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D70616C657474652D696E666F3A20233030364244383B0D0A20202D2D75742D70616C657474652D696E66';
wwv_flow_api.g_varchar2_table(35) := '6F2D636F6E74726173743A20234646463B0D0A20202D2D75742D70616C657474652D696E666F2D73686164653A20233030313833303B0D0A20202D2D75742D70616C657474652D696E666F2D746578743A20233430373561633B0D0A7D0D0A3A726F6F74';
wwv_flow_api.g_varchar2_table(36) := '207B0D0A20202D2D75742D70616C657474652D7761726E696E673A20234642434534413B0D0A20202D2D75742D70616C657474652D7761726E696E672D636F6E74726173743A20233030303B0D0A20202D2D75742D70616C657474652D7761726E696E67';
wwv_flow_api.g_varchar2_table(37) := '2D73686164653A20233337326431303B0D0A20202D2D75742D70616C657474652D7761726E696E672D746578743A20233861373433323B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D70616C657474652D64616E6765723A20234545303730313B';
wwv_flow_api.g_varchar2_table(38) := '0D0A20202D2D75742D70616C657474652D64616E6765722D636F6E74726173743A20234646463B0D0A20202D2D75742D70616C657474652D64616E6765722D73686164653A20233334303230303B0D0A20202D2D75742D70616C657474652D64616E6765';
wwv_flow_api.g_varchar2_table(39) := '722D746578743A20236237343334303B0D0A7D0D0A3A726F6F74207B0D0A20202D2D752D636F6C6F722D313A20233330394644423B0D0A20202D2D752D636F6C6F722D312D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F72';
wwv_flow_api.g_varchar2_table(40) := '2D323A20233133423643463B0D0A20202D2D752D636F6C6F722D322D636F6E74726173743A20236534663966643B0D0A20202D2D752D636F6C6F722D333A20233245424642433B0D0A20202D2D752D636F6C6F722D332D636F6E74726173743A20236630';
wwv_flow_api.g_varchar2_table(41) := '666366623B0D0A20202D2D752D636F6C6F722D343A20233343414638353B0D0A20202D2D752D636F6C6F722D342D636F6E74726173743A20236630666166363B0D0A20202D2D752D636F6C6F722D353A20233831424235463B0D0A20202D2D752D636F6C';
wwv_flow_api.g_varchar2_table(42) := '6F722D352D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D363A20234444444535333B0D0A20202D2D752D636F6C6F722D362D636F6E74726173743A20233261326130383B0D0A20202D2D752D636F6C6F722D373A2023';
wwv_flow_api.g_varchar2_table(43) := '4642434534413B0D0A20202D2D752D636F6C6F722D372D636F6E74726173743A20233434333330323B0D0A20202D2D752D636F6C6F722D383A20234544383133453B0D0A20202D2D752D636F6C6F722D382D636F6E74726173743A20236666666666663B';
wwv_flow_api.g_varchar2_table(44) := '0D0A20202D2D752D636F6C6F722D393A20234539354235343B0D0A20202D2D752D636F6C6F722D392D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D31303A20234538354438383B0D0A20202D2D752D636F6C6F722D31';
wwv_flow_api.g_varchar2_table(45) := '302D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D31313A20234341353839443B0D0A20202D2D752D636F6C6F722D31312D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D31323A2023';
wwv_flow_api.g_varchar2_table(46) := '3835344539423B0D0A20202D2D752D636F6C6F722D31322D636F6E74726173743A20236636663066383B0D0A20202D2D752D636F6C6F722D31333A20233541363841443B0D0A20202D2D752D636F6C6F722D31332D636F6E74726173743A202366666666';
wwv_flow_api.g_varchar2_table(47) := '66663B0D0A20202D2D752D636F6C6F722D31343A20234146424143353B0D0A20202D2D752D636F6C6F722D31342D636F6E74726173743A20233331336134343B0D0A20202D2D752D636F6C6F722D31353A20233645383539383B0D0A20202D2D752D636F';
wwv_flow_api.g_varchar2_table(48) := '6C6F722D31352D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D31363A20233539623265323B0D0A20202D2D752D636F6C6F722D31362D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(49) := '31373A20233432633564393B0D0A20202D2D752D636F6C6F722D31372D636F6E74726173743A20233035313531373B0D0A20202D2D752D636F6C6F722D31383A20233538636363393B0D0A20202D2D752D636F6C6F722D31382D636F6E74726173743A20';
wwv_flow_api.g_varchar2_table(50) := '233039316331633B0D0A20202D2D752D636F6C6F722D31393A20233633626639643B0D0A20202D2D752D636F6C6F722D31392D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32303A20233961633937663B0D0A20202D';
wwv_flow_api.g_varchar2_table(51) := '2D752D636F6C6F722D32302D636F6E74726173743A20233230333331363B0D0A20202D2D752D636F6C6F722D32313A20236534653537353B0D0A20202D2D752D636F6C6F722D32312D636F6E74726173743A20233463346330663B0D0A20202D2D752D63';
wwv_flow_api.g_varchar2_table(52) := '6F6C6F722D32323A20236663643836653B0D0A20202D2D752D636F6C6F722D32322D636F6E74726173743A20233639346630323B0D0A20202D2D752D636F6C6F722D32333A20236631396136353B0D0A20202D2D752D636F6C6F722D32332D636F6E7472';
wwv_flow_api.g_varchar2_table(53) := '6173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32343A20236564376337363B0D0A20202D2D752D636F6C6F722D32342D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32353A20236564376461303B';
wwv_flow_api.g_varchar2_table(54) := '0D0A20202D2D752D636F6C6F722D32352D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32363A20236435373962313B0D0A20202D2D752D636F6C6F722D32362D636F6E74726173743A20236666666666663B0D0A2020';
wwv_flow_api.g_varchar2_table(55) := '2D2D752D636F6C6F722D32373A20233964373161663B0D0A20202D2D752D636F6C6F722D32372D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32383A20233762383662643B0D0A20202D2D752D636F6C6F722D32382D';
wwv_flow_api.g_varchar2_table(56) := '636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32393A20236266633864313B0D0A20202D2D752D636F6C6F722D32392D636F6E74726173743A20233364343835343B0D0A20202D2D752D636F6C6F722D33303A20233862';
wwv_flow_api.g_varchar2_table(57) := '396461643B0D0A20202D2D752D636F6C6F722D33302D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D33313A20233139386363613B0D0A20202D2D752D636F6C6F722D33312D636F6E74726173743A2023653666346663';
wwv_flow_api.g_varchar2_table(58) := '3B0D0A20202D2D752D636F6C6F722D33323A20233032613562653B0D0A20202D2D752D636F6C6F722D33322D636F6E74726173743A20236331663666653B0D0A20202D2D752D636F6C6F722D33333A20233138623161653B0D0A20202D2D752D636F6C6F';
wwv_flow_api.g_varchar2_table(59) := '722D33332D636F6E74726173743A20236430663966383B0D0A20202D2D752D636F6C6F722D33343A20233234613437353B0D0A20202D2D752D636F6C6F722D33342D636F6E74726173743A20236432663565383B0D0A20202D2D752D636F6C6F722D3335';
wwv_flow_api.g_varchar2_table(60) := '3A20233661616434323B0D0A20202D2D752D636F6C6F722D33352D636F6E74726173743A20236636666266343B0D0A20202D2D752D636F6C6F722D33363A20236339636133393B0D0A20202D2D752D636F6C6F722D33362D636F6E74726173743A202330';
wwv_flow_api.g_varchar2_table(61) := '33303330313B0D0A20202D2D752D636F6C6F722D33373A20236439623133623B0D0A20202D2D752D636F6C6F722D33372D636F6E74726173743A20233132306530333B0D0A20202D2D752D636F6C6F722D33383A20236437366132373B0D0A20202D2D75';
wwv_flow_api.g_varchar2_table(62) := '2D636F6C6F722D33382D636F6E74726173743A20236666666666653B0D0A20202D2D752D636F6C6F722D33393A20236432343233623B0D0A20202D2D752D636F6C6F722D33392D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C';
wwv_flow_api.g_varchar2_table(63) := '6F722D34303A20236431343336663B0D0A20202D2D752D636F6C6F722D34302D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D34313A20236261336438383B0D0A20202D2D752D636F6C6F722D34312D636F6E74726173';
wwv_flow_api.g_varchar2_table(64) := '743A20236664663966623B0D0A20202D2D752D636F6C6F722D34323A20233737333339333B0D0A20202D2D752D636F6C6F722D34322D636F6E74726173743A20236538643566303B0D0A20202D2D752D636F6C6F722D34333A20233364346561333B0D0A';
wwv_flow_api.g_varchar2_table(65) := '20202D2D752D636F6C6F722D34332D636F6E74726173743A20236538656266363B0D0A20202D2D752D636F6C6F722D34343A20233863396562303B0D0A20202D2D752D636F6C6F722D34342D636F6E74726173743A20236666666666663B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(66) := '752D636F6C6F722D34353A20233465373339313B0D0A20202D2D752D636F6C6F722D34352D636F6E74726173743A20236561656666343B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D627574746F6E2D626F726465722D7261646975733A20327078';
wwv_flow_api.g_varchar2_table(67) := '3B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20233466346434633B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A3A726F6F7420';
wwv_flow_api.g_varchar2_table(68) := '7B0D0A20202D2D75742D6669656C642D6C6162656C2D746578742D636F6C6F723A20236663666366633B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D6669656C642D696E7075742D626F726465722D7261646975733A203270783B0D0A20202D2D61';
wwv_flow_api.g_varchar2_table(69) := '2D66696C6564726F702D626F726465722D7261646975733A203270783B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D6669656C642D696E7075742D6261636B67726F756E642D636F6C6F723A20233264323932363B0D0A20202D2D612D6669656C64';
wwv_flow_api.g_varchar2_table(70) := '2D696E7075742D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D6669656C642D696E7075742D626F726465722D636F6C6F723A20233438343233653B0D0A20202D2D612D6669656C642D696E7075742D686F7665722D6261636B67';
wwv_flow_api.g_varchar2_table(71) := '726F756E642D636F6C6F723A20233166316431623B0D0A20202D2D612D6669656C642D696E7075742D666F6375732D6261636B67726F756E642D636F6C6F723A20233131313030663B0D0A20202D2D612D6669656C642D696E7075742D666F6375732D62';
wwv_flow_api.g_varchar2_table(72) := '6F726465722D636F6C6F723A20236337343633343B0D0A20202D2D75742D6669656C642D696E7075742D666F6375732D69636F6E2D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D75742D6669656C642D696E7075742D';
wwv_flow_api.g_varchar2_table(73) := '666F6375732D69636F6E2D636F6C6F723A20236666666666663B0D0A20202D2D612D636865636B626F782D6261636B67726F756E642D636F6C6F723A20233264323932363B0D0A20202D2D612D636865636B626F782D626F726465722D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(74) := '72676261283235352C203235352C203235352C20302E3135293B0D0A20202D2D612D636865636B626F782D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D636865636B626F782D636865636B65642D6261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(75) := '6F6C6F723A20236337343633343B0D0A20202D2D612D636865636B626F782D636865636B65642D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D636865636B626F782D686F7665722D6261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(76) := '72676261283235352C203235352C203235352C20302E31293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D67762D6261636B67726F756E642D636F6C6F723A20233236323332313B0D0A20202D2D612D67762D63656C6C2D626F726465722D636F6C';
wwv_flow_api.g_varchar2_table(77) := '6F723A20233363333933373B0D0A20202D2D612D67762D6865616465722D63656C6C2D626F726465722D636F6C6F723A20233431336333383B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D746578742D636F6C';
wwv_flow_api.g_varchar2_table(78) := '6F723A20236663666366633B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D6261636B67726F756E642D636F6C6F723A20233236323332313B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D686561646572';
wwv_flow_api.g_varchar2_table(79) := '2D6865696768743A20343870783B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D6E61762D77696474683A2032343070783B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D616374696F6E732D77696474683A2032303070783B0D';
wwv_flow_api.g_varchar2_table(80) := '0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D736964656261722D77696474683A2032343070783B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D636F6E74656E742D6D61782D77696474683A20313030253B0D0A7D0D';
wwv_flow_api.g_varchar2_table(81) := '0A3A726F6F74207B0D0A20202D2D612D627574746F6E2D6761702D783A203470783B0D0A20202D2D612D63762D62616467652D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D0A20202D';
wwv_flow_api.g_varchar2_table(82) := '2D612D636865636B626F782D6C6162656C2D73706163696E672D783A203670783B0D0A20202D2D612D6465762D746F6F6C6261722D6261636B67726F756E642D636F6C6F723A20233636363B0D0A20202D2D612D6465762D746F6F6C6261722D6261636B';
wwv_flow_api.g_varchar2_table(83) := '64726F702D66696C7465723A206E6F6E653B0D0A20202D2D612D6465762D746F6F6C6261722D627574746F6E2D6261636B67726F756E642D636F6C6F723A20233636363B0D0A20202D2D612D66732D636F6E74726F6C2D736570657261746F722D626F72';
wwv_flow_api.g_varchar2_table(84) := '6465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C20317078293B0D0A20202D2D612D66732D636F6E74726F6C2D736570657261746F722D626F726465722D636F6C6F723A20766172282D2D7574';
wwv_flow_api.g_varchar2_table(85) := '2D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D66732D66696C7465722D67726F75702D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A2020';
wwv_flow_api.g_varchar2_table(86) := '2D2D612D66732D66696C7465722D67726F75702D626F726465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C20317078293B0D0A20202D2D612D66732D66696C7465722D67726F75702D6C616265';
wwv_flow_api.g_varchar2_table(87) := '6C2D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D612D66732D63686172742D626F726465722D77696474683A20766172282D2D75742D726567696F6E2D626F';
wwv_flow_api.g_varchar2_table(88) := '726465722D77696474682C20766172282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C2031707829293B0D0A20202D2D612D66732D63686172742D626F726465722D636F6C6F723A20766172282D2D75742D726567696F6E2D626F';
wwv_flow_api.g_varchar2_table(89) := '726465722D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F7229293B0D0A20202D2D612D66732D63686172742D626F726465722D7261646975733A20766172282D2D75742D726567696F6E2D626F72646572';
wwv_flow_api.g_varchar2_table(90) := '2D7261646975732C20766172282D2D75742D636F6D706F6E656E742D626F726465722D72616469757329293B0D0A20202D2D612D66696C6564726F702D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D626F726465';
wwv_flow_api.g_varchar2_table(91) := '722D636F6C6F72293B0D0A20202D2D612D66696C6564726F702D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D612D66696C6564726F702D666F6375732D626F';
wwv_flow_api.g_varchar2_table(92) := '726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D666F6375732D626F726465722D636F6C6F72293B0D0A20202D2D612D66696C6564726F702D68656164696E672D746578742D636F6C6F723A20766172282D2D75742D636F';
wwv_flow_api.g_varchar2_table(93) := '6D706F6E656E742D746578742D7469746C652D636F6C6F72293B0D0A20202D2D612D67762D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D67762D726F772D68';
wwv_flow_api.g_varchar2_table(94) := '6F7665722D6261636B67726F756E642D636F6C6F723A20233036303630363B0D0A20202D2D612D67762D696E7365727465642D6261636B67726F756E642D636F6C6F723A20766172282D2D612D70616C657474652D737563636573732D7368616465293B';
wwv_flow_api.g_varchar2_table(95) := '0D0A20202D2D612D67762D64656C657465642D6261636B67726F756E642D636F6C6F723A20233064306430643B0D0A20202D2D612D67762D6772616E64746F74616C2D6261636B67726F756E642D636F6C6F723A20233139313931393B0D0A20202D2D61';
wwv_flow_api.g_varchar2_table(96) := '2D67762D757064617465642D6261636B67726F756E642D636F6C6F723A20766172282D2D612D70616C657474652D696E666F2D7368616465293B0D0A20202D2D612D67762D706167696E6174696F6E2D627574746F6E2D6261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(97) := '6C6F723A207472616E73706172656E743B0D0A20202D2D612D67762D706167696E6174696F6E2D627574746F6E2D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D67762D70616769';
wwv_flow_api.g_varchar2_table(98) := '6E6174696F6E2D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D67762D706167696E6174696F6E2D62';
wwv_flow_api.g_varchar2_table(99) := '7574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D67762D6E6F646174612D6D6573736167652D746578742D636F6C6F723A20766172282D';
wwv_flow_api.g_varchar2_table(100) := '2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D612D68656C702D6469616C6F672D636F64652D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D63';
wwv_flow_api.g_varchar2_table(101) := '6F6C6F72293B0D0A20202D2D612D6D64656469746F722D6261636B67726F756E642D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D6D64656469746F722D626F7264';
wwv_flow_api.g_varchar2_table(102) := '65722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D626F726465722D636F6C6F72293B0D0A20202D2D612D6D64656469746F722D626F726465722D77696474683A20766172282D2D612D6669656C642D696E7075742D626F726465';
wwv_flow_api.g_varchar2_table(103) := '722D7769647468293B0D0A20202D2D612D6D64656469746F722D666F6375732D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D666F6375732D626F726465722D636F6C6F72293B0D0A20202D2D612D6D656E752D73';
wwv_flow_api.g_varchar2_table(104) := '65702D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D6D656E752D63616C6C6F75742D626F726465722D7261646975733A203070783B0D0A20202D2D612D6D65';
wwv_flow_api.g_varchar2_table(105) := '6E752D63616C6C6F75742D736861646F773A20302030203470782030207267626128302C20302C20302C20302E31293B0D0A20202D2D612D70657263656E742D63686172742D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D70616C';
wwv_flow_api.g_varchar2_table(106) := '657474652D7072696D6172792D7368616465293B0D0A20202D2D612D70657263656E742D63686172742D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D706572';
wwv_flow_api.g_varchar2_table(107) := '63656E742D63686172742D6261722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D612D70657263656E742D63686172742D6261722D626F726465722D636F6C6F723A2076';
wwv_flow_api.g_varchar2_table(108) := '6172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F';
wwv_flow_api.g_varchar2_table(109) := '72293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D626F726465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F726465722D7769647468293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D6365';
wwv_flow_api.g_varchar2_table(110) := '6C6C2D6C6162656C2D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D626F726465722D7769';
wwv_flow_api.g_varchar2_table(111) := '6474683A20766172282D2D75742D636F6D706F6E656E742D626F726465722D7769647468293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D626F726465722D77696474683A20766172282D2D612D6669656C642D696E7075';
wwv_flow_api.g_varchar2_table(112) := '742D626F726465722D7769647468293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D626F726465722D636F6C6F72293B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(113) := '612D7265706F72742D636F6E74726F6C732D696E7075742D626F726465722D7261646975733A20766172282D2D612D6669656C642D696E7075742D626F726465722D726164697573293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E';
wwv_flow_api.g_varchar2_table(114) := '7075742D666F6375732D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D666F6375732D626F726465722D636F6C6F72293B0D0A20202D2D612D73746172726174696E672D73746172732D62672D636F6C6F723A2072';
wwv_flow_api.g_varchar2_table(115) := '676261283235352C203235352C203235352C20302E3135293B0D0A20202D2D612D7377697463682D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D612D7377697463682D6261636B67726F756E642D636F6C6F72293B0D0A20';
wwv_flow_api.g_varchar2_table(116) := '202D2D612D7377697463682D6163746976652D6261636B67726F756E642D636F6C6F723A20766172282D2D612D7377697463682D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D7377697463682D636865636B65642D68';
wwv_flow_api.g_varchar2_table(117) := '6F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D612D7377697463682D636865636B65642D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D7377697463682D636865636B65642D6163746976652D6261636B6772';
wwv_flow_api.g_varchar2_table(118) := '6F756E642D636F6C6F723A20766172282D2D612D7377697463682D636865636B65642D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D746F6F6C6261722D6261636B67726F756E642D636F6C6F723A20766172282D2D75';
wwv_flow_api.g_varchar2_table(119) := '742D726567696F6E2D6865616465722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D746F6F6C6261722D626F726465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C20317078';
wwv_flow_api.g_varchar2_table(120) := '293B0D0A20202D2D612D746F6F6C6261722D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D746F6F6C6261722D7365702D626F726465722D636F6C6F723A2076';
wwv_flow_api.g_varchar2_table(121) := '6172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72293B0D0A20202D2D612D74726565766965772D6E6F64652D746578742D636F6C6F723A20696E68657269743B0D0A20202D2D612D6C6F76652D617065782D686F';
wwv_flow_api.g_varchar2_table(122) := '7665722D746578742D636F6C6F723A20766172282D2D612D70616C657474652D64616E6765722C2023463030293B0D0A20202D2D6A75692D6469616C6F672D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D726567696F6E2D626163';
wwv_flow_api.g_varchar2_table(123) := '6B67726F756E642D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F7229293B0D0A20202D2D6A75692D6469616C6F672D746578742D636F6C6F723A20766172282D2D75742D726567696F6E2D7465';
wwv_flow_api.g_varchar2_table(124) := '78742D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F7229293B0D0A20202D2D6A75692D6469616C6F672D626F726465722D636F6C6F723A20766172282D2D75742D726567696F6E2D626F72';
wwv_flow_api.g_varchar2_table(125) := '6465722D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F7229293B0D0A20202D2D6A75692D6469616C6F672D626F726465722D77696474683A20303B0D0A20202D2D6A75692D6469616C6F672D626F726465';
wwv_flow_api.g_varchar2_table(126) := '722D7261646975733A20766172282D2D75742D726567696F6E2D626F726465722D7261646975732C20766172282D2D75742D636F6D706F6E656E742D626F726465722D72616469757329293B0D0A20202D2D6A75692D6469616C6F672D736861646F773A';
wwv_flow_api.g_varchar2_table(127) := '20766172282D2D75742D736861646F772D6C67292C2030203020302031707820766172282D2D75742D726567696F6E2D626F726465722D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F7229293B0D0A2020';
wwv_flow_api.g_varchar2_table(128) := '2D2D6A75692D6469616C6F672D666F6E742D73697A653A20313270783B0D0A20202D2D6A75692D6469616C6F672D7469746C656261722D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D6A75692D6469616C6F';
wwv_flow_api.g_varchar2_table(129) := '672D7469746C656261722D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D7469746C652D636F6C6F72293B0D0A20202D2D6A75692D6469616C6F672D7469746C656261722D626F726465722D77696474683A20';
wwv_flow_api.g_varchar2_table(130) := '766172282D2D75742D726567696F6E2D626F726465722D77696474682C20766172282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C2031707829293B0D0A20202D2D6A75692D6469616C6F672D7469746C656261722D626F726465';
wwv_flow_api.g_varchar2_table(131) := '722D636F6C6F723A20766172282D2D75742D726567696F6E2D626F726465722D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F7229293B0D0A20202D2D6A75692D6469616C6F672D7469746C652D636C6F73';
wwv_flow_api.g_varchar2_table(132) := '652D626F726465722D7261646975733A20766172282D2D612D627574746F6E2D626F726465722D7261646975732C20327078293B0D0A20202D2D6A75692D6469616C6F672D7469746C652D636C6F73652D626F726465722D636F6C6F723A20766172282D';
wwv_flow_api.g_varchar2_table(133) := '2D612D627574746F6E2D626F726465722D636F6C6F72293B0D0A20202D2D6A75692D6469616C6F672D636F6E74656E742D70616464696E672D793A203070783B0D0A20202D2D6A75692D6469616C6F672D636F6E74656E742D70616464696E672D783A20';
wwv_flow_api.g_varchar2_table(134) := '3070783B0D0A20202D2D6A75692D6469616C6F672D627574746F6E70616E652D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D6A75692D646174657069636B65722D';
wwv_flow_api.g_varchar2_table(135) := '6261636B67726F756E642D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6A75692D646174657069636B65722D626F726465722D636F6C6F723A20766172282D2D75742D63';
wwv_flow_api.g_varchar2_table(136) := '6F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D636F6C6F722D736368656D653A206461726B3B0D0A20202D2D75742D70616C657474652D67656E657269633A20233064306430643B0D0A20';
wwv_flow_api.g_varchar2_table(137) := '202D2D75742D70616C657474652D67656E657269632D636F6E74726173743A20236666663B0D0A20202D2D75742D70616C657474652D67656E657269632D73686164653A20233036303630363B0D0A20202D2D75742D70616C657474652D67656E657269';
wwv_flow_api.g_varchar2_table(138) := '632D746578743A20236666663B0D0A20202D2D612D67762D6865616465722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D726567696F6E2D6865616465722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D75742D72';
wwv_flow_api.g_varchar2_table(139) := '65706F72742D63656C6C2D616C742D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D75742D7265706F72742D6865616465722D6261636B67726F756E642D636F6C6F723A2072';
wwv_flow_api.g_varchar2_table(140) := '676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D75742D6865616465722D6C6F676F2D6865696768743A20333270783B0D0A20202D2D75742D666F6F7465722D6261636B67726F756E642D636F6C6F723A20233064306430';
wwv_flow_api.g_varchar2_table(141) := '643B0D0A20202D2D75742D666F6F7465722D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D75742D666F6F7465722D6974656D2D73706163696E673A20313270783B0D0A20202D2D7574';
wwv_flow_api.g_varchar2_table(142) := '2D6E6176746162732D6974656D2D626F726465722D77696474683A203170783B0D0A20202D2D75742D6E6176746162732D6974656D2D686967686C696768742D636F6C6F723A207472616E73706172656E743B0D0A20202D2D75742D6E6176746162732D';
wwv_flow_api.g_varchar2_table(143) := '6974656D2D686967686C696768742D77696474683A203070783B0D0A20202D2D75742D6E6176746162732D6974656D2D6163746976652D686967686C696768742D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A';
wwv_flow_api.g_varchar2_table(144) := '20202D2D75742D626F64792D6E61762D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D75742D626F64792D7469746C652D626F726465722D77696474683A20307078';
wwv_flow_api.g_varchar2_table(145) := '3B0D0A20202D2D75742D626F64792D7469746C652D626F782D736861646F773A203020317078203020302072676261283235352C203235352C203235352C20302E3135293B0D0A20202D2D75742D626F64792D7469746C652D6261636B64726F702D6669';
wwv_flow_api.g_varchar2_table(146) := '6C7465723A20736174757261746528313830252920626C757228387078293B0D0A20202D2D75742D726567696F6E2D626F726465722D77696474683A203170783B0D0A20202D2D75742D726567696F6E2D626F782D736861646F773A20766172282D2D75';
wwv_flow_api.g_varchar2_table(147) := '742D736861646F772D736D293B0D0A20202D2D75742D726567696F6E2D6865616465722D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E303735293B0D0A20202D2D75742D627574746F6E2D726567696F6E2D';
wwv_flow_api.g_varchar2_table(148) := '626F782D736861646F773A20766172282D2D75742D736861646F772D736D293B0D0A20202D2D75742D6C6F67696E2D706167652D6261636B67726F756E642D636F6C6F723A20233139313931393B0D0A20202D2D75742D6C6F67696E2D726567696F6E2D';
wwv_flow_api.g_varchar2_table(149) := '6261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3635293B0D0A20202D2D75742D6C6F67696E2D726567696F6E2D66696C7465723A20626C757228347078293B0D0A20202D2D75742D6C6F67696E2D726567696F6E2D';
wwv_flow_api.g_varchar2_table(150) := '626F782D736861646F773A20766172282D2D75742D736861646F772D6C67293B0D0A20202D2D612D66732D746F67676C652D626F726465722D636F6C6F723A20766172282D2D612D627574746F6E2D626F726465722D636F6C6F72293B0D0A20202D2D61';
wwv_flow_api.g_varchar2_table(151) := '2D66732D746F67676C652D626F726465722D77696474683A20766172282D2D612D627574746F6E2D626F726465722D7769647468293B0D0A20202D2D612D66732D746F67676C652D626F726465722D7261646975733A20766172282D2D612D627574746F';
wwv_flow_api.g_varchar2_table(152) := '6E2D626F726465722D726164697573293B0D0A20202D2D612D66732D746F67676C652D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D66732D746F67676C652D6261636B67726F75';
wwv_flow_api.g_varchar2_table(153) := '6E642D636F6C6F723A20766172282D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D66732D7365617263682D636F6E7461696E65722D626F726465722D77696474683A20766172282D2D612D627574746F6E2D';
wwv_flow_api.g_varchar2_table(154) := '626F726465722D7769647468293B0D0A20202D2D612D66732D7365617263682D636F6E7461696E65722D626F726465722D636F6C6F723A20766172282D2D612D627574746F6E2D626F726465722D636F6C6F72293B0D0A20202D2D6D672D6374726C2D67';
wwv_flow_api.g_varchar2_table(155) := '726F75702D627574746F6E2D746578742D636F6C6F723A20233030303B0D0A20202D2D6D672D706F7075702D636F6E74656E742D626F782D736861646F773A20766172282D2D75742D736861646F772D6C67293B0D0A20202D2D612D6D61702D6C656765';
wwv_flow_api.g_varchar2_table(156) := '6E642D7469746C652D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D75742D636172646C6973742D626F782D736861646F773A20766172282D2D75742D736861';
wwv_flow_api.g_varchar2_table(157) := '646F772D736D293B0D0A20202D2D75742D6C696E6B736C6973742D6172726F772D636F6C6F723A2072676261283235352C203235352C203235352C20302E32293B0D0A20202D2D75742D746162732D6974656D2D746578742D636F6C6F723A2076617228';
wwv_flow_api.g_varchar2_table(158) := '2D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A20202D2D75742D746162732D6974656D2D6163746976652D746578742D636F6C6F723A20766172282D2D75742D6C696E6B2D746578742D636F6C6F72293B0D';
wwv_flow_api.g_varchar2_table(159) := '0A20202D2D75742D746162732D6974656D2D68696E742D686967686C696768742D636F6C6F723A2072676261283235352C203235352C203235352C20302E32293B0D0A20202D2D75742D636F6D6D656E742D636861742D6261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(160) := '6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D75742D77702D6D61726B65722D636F6C6F723A20233236323632363B0D0A20202D2D75742D77702D747261636B2D636F6C6F723A20233236323632363B0D0A20';
wwv_flow_api.g_varchar2_table(161) := '202D2D66632D6E65757472616C2D62672D636F6C6F723A2072676261283235352C203235352C203235352C20302E32293B0D0A20202D2D66632D6E65757472616C2D746578742D636F6C6F723A20236666663B0D0A20202D2D66632D6576656E742D7365';
wwv_flow_api.g_varchar2_table(162) := '6C65637465642D6F7665726C61792D636F6C6F723A2072676261283235352C203235352C203235352C20302E32293B0D0A20202D2D66632D6E6F6E2D627573696E6573732D636F6C6F723A2072676261283235352C203235352C203235352C20302E3229';
wwv_flow_api.g_varchar2_table(163) := '3B0D0A20202D2D75742D616C7465726E6174652D68656164696E672D666F6E742D66616D696C793A20766172282D2D612D626173652D666F6E742D66616D696C792D7365726966293B0D0A20202D2D75742D616C7465726E6174652D68656164696E672D';
wwv_flow_api.g_varchar2_table(164) := '666F6E742D7765696768743A20766172282D2D612D626173652D666F6E742D7765696768742D6E6F726D616C293B0D0A20202D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C2030';
wwv_flow_api.g_varchar2_table(165) := '2E3135293B0D0A20202D2D75742D636F6D706F6E656E742D626F726465722D77696474683A203170783B0D0A20202D2D75742D636F6D706F6E656E742D626F782D736861646F773A20766172282D2D75742D736861646F772D6C67293B0D0A20202D2D75';
wwv_flow_api.g_varchar2_table(166) := '742D636F6D706F6E656E742D686967686C696768742D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D75742D636F6D706F6E656E742D746F6F6C6261722D6261636B6772';
wwv_flow_api.g_varchar2_table(167) := '6F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F72';
wwv_flow_api.g_varchar2_table(168) := '6465722D7769647468293B0D0A20202D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D75742D636F6D706F6E656E742D746578742D64';
wwv_flow_api.g_varchar2_table(169) := '656661756C742D636F6C6F723A20236666663B0D0A20202D2D75742D636F6D706F6E656E742D746578742D7469746C652D636F6C6F723A20236666663B0D0A20202D2D75742D636F6D706F6E656E742D746578742D7375627469746C652D636F6C6F723A';
wwv_flow_api.g_varchar2_table(170) := '2072676261283235352C203235352C203235352C20302E3835293B0D0A20202D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3635293B0D0A20202D2D75742D63';
wwv_flow_api.g_varchar2_table(171) := '6F6D706F6E656E742D69636F6E2D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D75742D636F6D706F6E656E742D69636F6E2D636F6C6F723A20766172282D2D75742D7061';
wwv_flow_api.g_varchar2_table(172) := '6C657474652D7072696D6172792D636F6E7472617374293B0D0A20202D2D75742D636F6D706F6E656E742D62616467652D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D7574';
wwv_flow_api.g_varchar2_table(173) := '2D636F6D706F6E656E742D62616467652D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A20202D2D75742D636F6D706F6E656E742D62616467652D626F726465722D';
wwv_flow_api.g_varchar2_table(174) := '7261646975733A203470783B0D0A20202D2D75742D736861646F772D736D3A20302032707820347078202D327078207267626128302C20302C20302C20302E31293B0D0A20202D2D75742D736861646F772D6D643A203020313270782032347078202D31';
wwv_flow_api.g_varchar2_table(175) := '327078207267626128302C20302C20302C20302E33293B0D0A20202D2D75742D736861646F772D6C673A203020323470782034387078202D32347078207267626128302C20302C20302C20302E33293B0D0A7D0D0A2E742D427574746F6E2D2D68656164';
wwv_flow_api.g_varchar2_table(176) := '6572207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20696E697469616C3B0D0A20202D2D612D627574746F6E2D62';
wwv_flow_api.g_varchar2_table(177) := '6F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A207267626128302C20';
wwv_flow_api.g_varchar2_table(178) := '302C20302C20302E31293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3135293B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F75';
wwv_flow_api.g_varchar2_table(179) := '6E642D636F6C6F723A20766172282D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2D2D6865616465722E69732D616374697665207B0D0A20202D2D612D627574746F6E2D6261636B67726F75';
wwv_flow_api.g_varchar2_table(180) := '6E642D636F6C6F723A207267626128302C20302C20302C20302E3235293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C';
wwv_flow_api.g_varchar2_table(181) := '6F72293B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20233638363636353B0D0A20202D2D612D627574746F6E2D686F7665722D626F726465722D636F6C6F723A2072676261283235352C203235352C';
wwv_flow_api.g_varchar2_table(182) := '203235352C20302E3135293B0D0A20202D2D612D627574746F6E2D686F7665722D736861646F773A20302032707820347078202D327078207267626128302C20302C20302C20302E31293B0D0A20202D2D612D627574746F6E2D6163746976652D626163';
wwv_flow_api.g_varchar2_table(183) := '6B67726F756E642D636F6C6F723A20233139313931393B0D0A20202D2D612D627574746F6E2D6163746976652D736861646F773A20302032707820327078202D317078207267626128302C20302C20302C20302E31352920696E7365743B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(184) := '612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D626F726465722D';
wwv_flow_api.g_varchar2_table(185) := '636F6C6F723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574746F6E2D747970652D6261636B67726F756E642D636F6C6F723A207472616E73';
wwv_flow_api.g_varchar2_table(186) := '706172656E743B0D0A20202D2D612D627574746F6E2D747970652D626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E742D427574746F6E2D2D6C696E6B207B0D0A2020626F726465722D636F6C6F723A207472616E73706172656E743B0D0A2020';
wwv_flow_api.g_varchar2_table(187) := '6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D6E6F55493A686F7665722C0D0A2E74';
wwv_flow_api.g_varchar2_table(188) := '2D427574746F6E2D2D6E6F55493A6163746976652C0D0A2E612D427574746F6E2D2D6E6F55492C0D0A2E612D427574746F6E2D2D6E6F55493A686F7665722C0D0A2E612D427574746F6E2D2D6E6F55493A616374697665207B0D0A20202D2D612D627574';
wwv_flow_api.g_varchar2_table(189) := '746F6E2D747970652D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D747970652D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D747970652D626F726465722D63';
wwv_flow_api.g_varchar2_table(190) := '6F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D747970652D746578742D636F6C6F723A20696E68657269743B0D0A2020636F6C6F723A20696E68657269743B0D0A20206261636B67726F756E642D636F6C6F723A2074';
wwv_flow_api.g_varchar2_table(191) := '72616E73706172656E743B0D0A2020746578742D736861646F773A206E6F6E653B0D0A7D0D0A2E742D427574746F6E2D2D686F742C0D0A2E612D427574746F6E2D2D686F742C0D0A2E75692D627574746F6E2D2D686F742C0D0A2E612D43617264566965';
wwv_flow_api.g_varchar2_table(192) := '772D627574746F6E2D2D686F742C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A636865636B6564202B206C6162656C2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F757020';
wwv_flow_api.g_varchar2_table(193) := '2E617065782D6974656D2D67726F75702D2D726320696E7075743A636865636B6564202B206C6162656C207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D612D627574746F6E2D';
wwv_flow_api.g_varchar2_table(194) := '746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20236434363935613B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(195) := '766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A20236233336632663B0D0A20202D2D612D627574746F6E2D6163746976652D746578';
wwv_flow_api.g_varchar2_table(196) := '742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665';
wwv_flow_api.g_varchar2_table(197) := '722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E';
wwv_flow_api.g_varchar2_table(198) := '2D2D686F742E742D427574746F6E2D2D73696D706C652C0D0A2E612D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0D0A2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0D0A2E612D436172';
wwv_flow_api.g_varchar2_table(199) := '64566965772D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A636865636B6564202B206C6162656C2E742D427574746F6E2D2D73696D706C652C0D0A2E742D';
wwv_flow_api.g_varchar2_table(200) := '466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A636865636B6564202B206C6162656C2E742D427574746F6E2D2D73696D706C65207B0D';
wwv_flow_api.g_varchar2_table(201) := '0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A20236337343633343B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D74657874';
wwv_flow_api.g_varchar2_table(202) := '2D636F6C6F723A20236133363335613B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D6C696E6B2C0D0A2E612D427574';
wwv_flow_api.g_varchar2_table(203) := '746F6E2D2D686F742E742D427574746F6E2D2D6C696E6B2C0D0A2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D6C696E6B2C0D0A2E612D43617264566965772D627574746F6E2D2D686F742E742D427574746F6E2D2D6C696E6B2C0D0A';
wwv_flow_api.g_varchar2_table(204) := '2E617065782D627574746F6E2D67726F757020696E7075743A636865636B6564202B206C6162656C2E742D427574746F6E2D2D6C696E6B2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E';
wwv_flow_api.g_varchar2_table(205) := '617065782D6974656D2D67726F75702D2D726320696E7075743A636865636B6564202B206C6162656C2E742D427574746F6E2D2D6C696E6B207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A207472616E73706172656E743B0D';
wwv_flow_api.g_varchar2_table(206) := '0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D626F782D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F';
wwv_flow_api.g_varchar2_table(207) := '723A20236133363335613B0D0A7D0D0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D6E6F55492C0D0A2E612D427574746F6E2D2D686F742E742D427574746F6E2D2D6E6F55492C0D0A2E75692D627574746F6E2D2D686F742E742D4275';
wwv_flow_api.g_varchar2_table(208) := '74746F6E2D2D6E6F55492C0D0A2E612D43617264566965772D627574746F6E2D2D686F742E742D427574746F6E2D2D6E6F55492C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A636865636B6564202B206C6162656C2E742D427574';
wwv_flow_api.g_varchar2_table(209) := '746F6E2D2D6E6F55492C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A636865636B6564202B206C6162656C2E742D4275';
wwv_flow_api.g_varchar2_table(210) := '74746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D686F742E612D427574746F6E2D2D6E6F55492C0D0A2E612D427574746F6E2D2D686F742E612D427574746F6E2D2D6E6F55492C0D0A2E75692D627574746F6E2D2D686F742E612D427574746F';
wwv_flow_api.g_varchar2_table(211) := '6E2D2D6E6F55492C0D0A2E612D43617264566965772D627574746F6E2D2D686F742E612D427574746F6E2D2D6E6F55492C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A636865636B6564202B206C6162656C2E612D427574746F6E';
wwv_flow_api.g_varchar2_table(212) := '2D2D6E6F55492C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A636865636B6564202B206C6162656C2E612D427574746F';
wwv_flow_api.g_varchar2_table(213) := '6E2D2D6E6F5549207B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236133363335613B0D0A2020636F6C6F723A20236133363335613B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E67207B0D0A20202D2D612D62757474';
wwv_flow_api.g_varchar2_table(214) := '6F6E2D6261636B67726F756E642D636F6C6F723A20234642434534413B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233030303B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(215) := '236663646337633B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E64';
wwv_flow_api.g_varchar2_table(216) := '2D636F6C6F723A20236661633733313B0D0A20202D2D612D627574746F6E2D6163746976652D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F';
wwv_flow_api.g_varchar2_table(217) := '6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D746578742D636F6C6F723A20766172282D2D';
wwv_flow_api.g_varchar2_table(218) := '612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A202346';
wwv_flow_api.g_varchar2_table(219) := '42434534413B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233861373433323B0D0A20202D2D612D627574746F6E';
wwv_flow_api.g_varchar2_table(220) := '2D686F7665722D746578742D636F6C6F723A20233030303B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D6C696E6B207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A207472616E737061';
wwv_flow_api.g_varchar2_table(221) := '72656E743B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D626F782D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D746578';
wwv_flow_api.g_varchar2_table(222) := '742D636F6C6F723A20233861373433323B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D7761726E696E672E612D427574746F6E2D2D6E6F5549207B0D0A20202D2D61';
wwv_flow_api.g_varchar2_table(223) := '2D627574746F6E2D746578742D636F6C6F723A20233861373433323B0D0A2020636F6C6F723A20233861373433323B0D0A7D0D0A2E742D427574746F6E2D2D73756363657373207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(224) := '6C6F723A20233338383732393B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20234646463B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20233438616533353B0D0A20202D2D612D';
wwv_flow_api.g_varchar2_table(225) := '627574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A20233330373332333B';
wwv_flow_api.g_varchar2_table(226) := '0D0A20202D2D612D627574746F6E2D6163746976652D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(227) := '6F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D74';
wwv_flow_api.g_varchar2_table(228) := '6578742D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A20233338383732393B0D0A20202D2D612D6275';
wwv_flow_api.g_varchar2_table(229) := '74746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233535376434653B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F';
wwv_flow_api.g_varchar2_table(230) := '723A20234646463B0D0A7D0D0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D6C696E6B207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574';
wwv_flow_api.g_varchar2_table(231) := '746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D626F782D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A2023353537643465';
wwv_flow_api.g_varchar2_table(232) := '3B0D0A7D0D0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D737563636573732E612D427574746F6E2D2D6E6F5549207B0D0A20202D2D612D627574746F6E2D746578742D636F6C';
wwv_flow_api.g_varchar2_table(233) := '6F723A20233535376434653B0D0A2020636F6C6F723A20233535376434653B0D0A7D0D0A2E742D427574746F6E2D2D64616E676572207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20234545303730313B0D0A2020';
wwv_flow_api.g_varchar2_table(234) := '2D2D612D627574746F6E2D746578742D636F6C6F723A20234646463B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20236665323932343B0D0A20202D2D612D627574746F6E2D686F7665722D74657874';
wwv_flow_api.g_varchar2_table(235) := '2D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A20236435303630313B0D0A20202D2D612D627574746F6E2D6163';
wwv_flow_api.g_varchar2_table(236) := '746976652D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574';
wwv_flow_api.g_varchar2_table(237) := '746F6E2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(238) := '742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A20234545303730313B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(239) := '6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236237343334303B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20234646463B0D0A7D0D0A2E742D4275';
wwv_flow_api.g_varchar2_table(240) := '74746F6E2D2D64616E6765722E742D427574746F6E2D2D6C696E6B207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(241) := '723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D626F782D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236237343334303B0D0A7D0D0A2E742D427574746F6E2D2D6461';
wwv_flow_api.g_varchar2_table(242) := '6E6765722E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D64616E6765722E612D427574746F6E2D2D6E6F5549207B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236237343334303B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(243) := '3A20236237343334303B0D0A7D0D0A2E742D427574746F6E2D2D7072696D617279207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20236634643764333B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F';
wwv_flow_api.g_varchar2_table(244) := '723A20233339313430663B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20236639656165383B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D612D62';
wwv_flow_api.g_varchar2_table(245) := '7574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A20236565633562663B0D0A20202D2D612D627574746F6E2D6163746976652D746578742D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(246) := '766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F';
wwv_flow_api.g_varchar2_table(247) := '756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2D2D7072696D617279';
wwv_flow_api.g_varchar2_table(248) := '2E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D616C74293B0D0A20202D2D612D627574746F6E2D6261636B67726F';
wwv_flow_api.g_varchar2_table(249) := '756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D616C742D74657874293B0D0A20202D2D612D627574746F6E2D';
wwv_flow_api.g_varchar2_table(250) := '686F7665722D746578742D636F6C6F723A20233339313430663B0D0A7D0D0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D6C696E6B207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A207472616E73';
wwv_flow_api.g_varchar2_table(251) := '706172656E743B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D626F782D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D74';
wwv_flow_api.g_varchar2_table(252) := '6578742D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D616C742D74657874293B0D0A7D0D0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D7072';
wwv_flow_api.g_varchar2_table(253) := '696D6172792E612D427574746F6E2D2D6E6F5549207B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D616C742D74657874293B0D0A2020636F6C6F723A20766172282D';
wwv_flow_api.g_varchar2_table(254) := '2D75742D70616C657474652D7072696D6172792D616C742D74657874293B0D0A7D0D0A2E742D466F726D2D68656C70427574746F6E207B0D0A20202D2D612D627574746F6E2D70616464696E672D793A203470783B0D0A20202D2D612D627574746F6E2D';
wwv_flow_api.g_varchar2_table(255) := '70616464696E672D783A203470783B0D0A20202D2D612D627574746F6E2D747970652D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D747970652D626F726465722D636F6C6F723A2074';
wwv_flow_api.g_varchar2_table(256) := '72616E73706172656E743B0D0A20202D2D612D627574746F6E2D747970652D626F782D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D';
wwv_flow_api.g_varchar2_table(257) := '757465642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2E74';
wwv_flow_api.g_varchar2_table(258) := '2D427574746F6E2D2D6E6F5549202E66613A61667465722C0D0A2E742D427574746F6E2E742D427574746F6E2D2D6C696E6B202E66613A61667465722C0D0A2E742D427574746F6E2E742D427574746F6E2D2D73696D706C65202E66613A61667465722C';
wwv_flow_api.g_varchar2_table(259) := '0D0A2E612D427574746F6E2E612D427574746F6E2D2D6E6F5549202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D64616E676572202E66613A6166746572';
wwv_flow_api.g_varchar2_table(260) := '2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20234545303730313B0D0A7D0D0A2E742D427574746F6E2D';
wwv_flow_api.g_varchar2_table(261) := '2D73756363657373202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A2023333838';
wwv_flow_api.g_varchar2_table(262) := '3732393B0D0A7D0D0A2E742D427574746F6E2D2D7072696D617279202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A686F766572202E66613A6166746572207B0D0A2020626163';
wwv_flow_api.g_varchar2_table(263) := '6B67726F756E642D636F6C6F723A20236634643764333B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E67202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E673A686F766572';
wwv_flow_api.g_varchar2_table(264) := '202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20234642434534413B0D0A7D0D0A2E742D427574746F6E2D2D686F74202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E';
wwv_flow_api.g_varchar2_table(265) := '2D2D686F743A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20236337343633343B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D63762D6974656D2D77696474683A2033303470783B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(266) := '612D63762D666F6375732D6F75746C696E653A206E6F6E653B0D0A20202D2D612D63762D626F726465722D77696474683A203170783B0D0A20202D2D612D63762D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C2030';
wwv_flow_api.g_varchar2_table(267) := '2E3135293B0D0A20202D2D612D63762D626F726465722D7261646975733A203370783B0D0A20202D2D612D63762D6261636B67726F756E642D636F6C6F723A20233236323332313B0D0A20202D2D612D63762D736861646F773A20302032707820347078';
wwv_flow_api.g_varchar2_table(268) := '202D327078207267626128302C20302C20302C20302E303735293B0D0A20202D2D612D63762D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D612D63762D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D63';
wwv_flow_api.g_varchar2_table(269) := '762D686F7665722D746578742D636F6C6F723A20766172282D2D612D63762D746578742D636F6C6F72293B0D0A20202D2D612D63762D686F7665722D626F726465722D636F6C6F723A20766172282D2D612D63762D626F726465722D636F6C6F72293B0D';
wwv_flow_api.g_varchar2_table(270) := '0A20202D2D612D63762D686F7665722D736861646F773A203020347078203870782030207267626128302C20302C20302C20302E31293B0D0A20202D2D612D63762D6163746976652D6261636B67726F756E642D636F6C6F723A20766172282D2D612D63';
wwv_flow_api.g_varchar2_table(271) := '762D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D63762D6163746976652D746578742D636F6C6F723A20766172282D2D612D63762D746578742D636F6C6F72293B0D0A20202D2D612D63762D6163746976652D626F726465722D636F';
wwv_flow_api.g_varchar2_table(272) := '6C6F723A20766172282D2D612D63762D626F726465722D636F6C6F72293B0D0A20202D2D612D63762D6163746976652D736861646F773A20766172282D2D612D63762D736861646F77293B0D0A20202D2D612D63762D666F6375732D626F726465722D63';
wwv_flow_api.g_varchar2_table(273) := '6F6C6F723A20236337343633343B0D0A20202D2D612D63762D6D656469612D70616464696E672D793A20313670783B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A20313670783B0D0A20202D2D612D63762D6865616465722D7061';
wwv_flow_api.g_varchar2_table(274) := '6464696E672D793A20313670783B0D0A20202D2D612D63762D6865616465722D70616464696E672D783A20313670783B0D0A20202D2D612D63762D6865616465722D626F726465722D77696474683A203170783B0D0A20202D2D612D63762D6865616465';
wwv_flow_api.g_varchar2_table(275) := '722D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D612D63762D69636F6E2D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D612D63762D69636F6E2D74';
wwv_flow_api.g_varchar2_table(276) := '6578742D636F6C6F723A20236666666666663B0D0A20202D2D612D63762D69636F6E2D626F726465722D7261646975733A20313030253B0D0A20202D2D612D63762D69636F6E2D73697A653A20313670783B0D0A20202D2D612D63762D69636F6E2D636F';
wwv_flow_api.g_varchar2_table(277) := '6E7461696E65722D73697A653A20333270783B0D0A20202D2D612D63762D69636F6E2D70616464696E673A203870783B0D0A20202D2D612D63762D696E697469616C732D666F6E742D7765696768743A203730303B0D0A20202D2D612D63762D696E6974';
wwv_flow_api.g_varchar2_table(278) := '69616C732D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D63762D696E697469616C732D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D612D63762D7375627469746C652D666F6E742D73697A65';
wwv_flow_api.g_varchar2_table(279) := '3A20313270783B0D0A20202D2D612D63762D7375627469746C652D666F6E742D7765696768743A203430303B0D0A20202D2D612D63762D7375627469746C652D6C696E652D6865696768743A20313670783B0D0A20202D2D612D63762D7375627469746C';
wwv_flow_api.g_varchar2_table(280) := '652D746578742D636F6C6F723A20236263626362633B0D0A20202D2D612D63762D626F64792D70616464696E672D783A20313670783B0D0A20202D2D612D63762D626F64792D70616464696E672D793A20313670783B0D0A20202D2D612D63762D6D6169';
wwv_flow_api.g_varchar2_table(281) := '6E636F6E74656E742D666F6E742D73697A653A20313470783B0D0A20202D2D612D63762D6D61696E636F6E74656E742D6C696E652D6865696768743A20323070783B0D0A20202D2D612D63762D737562636F6E74656E742D666F6E742D73697A653A2031';
wwv_flow_api.g_varchar2_table(282) := '3170783B0D0A20202D2D612D63762D737562636F6E74656E742D6C696E652D6865696768743A20313670783B0D0A20202D2D612D63762D737562636F6E74656E742D746578742D636F6C6F723A20236263626362633B0D0A20202D2D612D63762D616374';
wwv_flow_api.g_varchar2_table(283) := '696F6E732D626F726465722D77696474683A203170783B0D0A20202D2D612D63762D616374696F6E732D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D612D63762D616374696F6E732D';
wwv_flow_api.g_varchar2_table(284) := '70616464696E672D793A20313670783B0D0A20202D2D612D63762D616374696F6E732D70616464696E672D783A20313670783B0D0A7D0D0A2E612D544D562D2D6361726473202E612D47562D666F6F746572207B0D0A20206D696E2D6865696768743A20';
wwv_flow_api.g_varchar2_table(285) := '756E7365743B0D0A202070616464696E672D746F703A20303B0D0A202070616464696E672D626F74746F6D3A20303B0D0A7D0D0A2E612D544D562D2D6361726473202E612D47562D666F6F746572202E6A732D72616E6765446973706C6179207B0D0A20';
wwv_flow_api.g_varchar2_table(286) := '206D617267696E2D746F703A20766172282D2D612D67762D666F6F7465722D70616464696E672D79293B0D0A20206D617267696E2D626F74746F6D3A20766172282D2D612D67762D666F6F7465722D70616464696E672D79293B0D0A7D0D0A2E612D4361';
wwv_flow_api.g_varchar2_table(287) := '7264566965772D66756C6C4C696E6B3A666F637573207B0D0A2020626F782D736861646F773A20696E73657420302030203020766172282D2D612D63762D626F726465722D77696474682C20302920766172282D2D612D63762D666F6375732D626F7264';
wwv_flow_api.g_varchar2_table(288) := '65722D636F6C6F72293B0D0A7D0D0A2E612D43617264566965772D6D65646961207B0D0A2020616C69676E2D6974656D733A2063656E7465723B0D0A20206A7573746966792D636F6E74656E743A2063656E7465723B0D0A7D0D0A2E612D436172645669';
wwv_flow_api.g_varchar2_table(289) := '65772D6D656469612061207B0D0A20207472616E736974696F6E3A206F70616369747920302E327320656173653B0D0A7D0D0A2E612D43617264566965772D6D6564696120613A666F637573207B0D0A20206F7061636974793A20302E353B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(290) := '2E612D43617264566965772D6865616465723A6C6173742D6368696C64207B0D0A20202D2D612D63762D6865616465722D626F726465722D77696474683A203070783B0D0A7D0D0A2E6861732D6D656469612D2D6669727374207B0D0A20202D2D612D63';
wwv_flow_api.g_varchar2_table(291) := '762D6D656469612D70616464696E672D793A20303B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A20303B0D0A7D0D0A2E6861732D6D656469612D2D6261636B67726F756E64207B0D0A20202D2D612D63762D6D656469612D706164';
wwv_flow_api.g_varchar2_table(292) := '64696E672D793A203070783B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A203070783B0D0A20202D2D612D63762D746578742D636F6C6F723A20236666663B0D0A20202D2D612D63762D7375627469746C652D746578742D636F6C';
wwv_flow_api.g_varchar2_table(293) := '6F723A2072676261283235352C203235352C203235352C20302E3635293B0D0A20202D2D612D63762D737562636F6E74656E742D746578742D636F6C6F723A2072676261283235352C203235352C203235352C20302E3635293B0D0A20202D2D612D6376';
wwv_flow_api.g_varchar2_table(294) := '2D62616467652D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3235293B0D0A7D0D0A2E6861732D6D656469612D2D6261636B67726F756E6420613A6E6F74285B636C6173735D29207B0D0A202063';
wwv_flow_api.g_varchar2_table(295) := '6F6C6F723A20696E68657269743B0D0A7D0D0A2E6861732D6D656469612D2D6261636B67726F756E6420613A6E6F74285B636C6173735D293A686F7665722C0D0A2E6861732D6D656469612D2D6261636B67726F756E6420613A6E6F74285B636C617373';
wwv_flow_api.g_varchar2_table(296) := '5D293A666F637573207B0D0A2020746578742D6465636F726174696F6E3A20756E6465726C696E653B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541207B0D0A20202D2D612D63762D6F766572666C6F773A2068696464656E3B0D0A';
wwv_flow_api.g_varchar2_table(297) := '20202D2D612D63762D6D656469612D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D612D63762D6D656469612D6F7665726C61792D636F6C6F723A207267626128302C20';
wwv_flow_api.g_varchar2_table(298) := '302C20302C20302E3735293B0D0A20202D2D612D63762D6865616465722D626F726465722D77696474683A203070783B0D0A20202D2D612D63762D6865616465722D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A20202D2D612D6376';
wwv_flow_api.g_varchar2_table(299) := '2D616374696F6E732D626F726465722D77696474683A203070783B0D0A20202D2D612D63762D616374696F6E732D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A20202D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65';
wwv_flow_api.g_varchar2_table(300) := '3A20343070783B0D0A20202D2D612D63762D69636F6E2D73697A653A20323070783B0D0A20202D2D612D63762D69636F6E2D626F726465722D7261646975733A203370783B0D0A20202D2D612D63762D69636F6E2D696D6167652D73697A653A20766172';
wwv_flow_api.g_varchar2_table(301) := '282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D69636F6E2D696D6167652D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20';
wwv_flow_api.g_varchar2_table(302) := '202D2D612D63762D696E697469616C732D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D73697A653A20766172282D2D612D63762D';
wwv_flow_api.g_varchar2_table(303) := '69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D696E697469616C732D666F6E742D73697A653A20323070783B0D0A20202D2D612D63762D696E697469616C732D666F6E742D7765696768743A203430303B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(304) := '612D63762D62616467652D70616464696E673A20347078203870783B0D0A20202D2D612D63762D62616467652D626F726465722D7261646975733A20323070783B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D65';
wwv_flow_api.g_varchar2_table(305) := '6469612D2D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D6669727374207B0D0A20202D2D612D63762D6D656469612D626F726465722D7261646975733A203370783B0D0A20202D2D612D6376';
wwv_flow_api.g_varchar2_table(306) := '2D6D656469612D70616464696E672D793A20313670783B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A20313670783B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D626F6479';
wwv_flow_api.g_varchar2_table(307) := '202E612D43617264566965772D6D656469612C0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D6669727374202E612D43617264566965772D6D65646961207B0D0A20206D617267696E2D6C6566743A207661';
wwv_flow_api.g_varchar2_table(308) := '72282D2D612D63762D6D656469612D70616464696E672D78293B0D0A20206D617267696E2D72696768743A20766172282D2D612D63762D6D656469612D70616464696E672D78293B0D0A202070616464696E673A20303B0D0A7D0D0A2E742D4361726473';
wwv_flow_api.g_varchar2_table(309) := '526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D6669727374202E612D43617264566965772D6D65646961207B0D0A20206D617267696E2D746F703A20766172282D2D612D63762D6D656469612D70616464696E672D79293B0D0A7D0D';
wwv_flow_api.g_varchar2_table(310) := '0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D69636F6E2D2D746F70207B0D0A20202D2D612D63762D69636F6E2D636F6E7461696E65722D73697A653A20393670783B0D0A20202D2D612D63762D69636F6E2D73697A653A2034';
wwv_flow_api.g_varchar2_table(311) := '3870783B0D0A20202D2D612D63762D69636F6E2D626F726465722D7261646975733A203870783B0D0A20202D2D612D63762D69636F6E2D696D6167652D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D';
wwv_flow_api.g_varchar2_table(312) := '0A20202D2D612D63762D69636F6E2D696D6167652D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D626F726465722D726164697573';
wwv_flow_api.g_varchar2_table(313) := '3A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63';
wwv_flow_api.g_varchar2_table(314) := '762D696E697469616C732D666F6E742D73697A653A20323470783B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D6669727374202E612D43617264566965772D686561646572202B202E612D436172';
wwv_flow_api.g_varchar2_table(315) := '64566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D6261636B67726F756E64202E612D43617264566965772D686561646572202B202E612D43617264566965772D626F64792C0D0A2E';
wwv_flow_api.g_varchar2_table(316) := '742D4361726473526567696F6E2D2D7374796C6541202E612D43617264566965772D626F6479202B202E612D43617264566965772D616374696F6E73207B0D0A202070616464696E672D746F703A20303B0D0A7D0D0A2E742D4361726473526567696F6E';
wwv_flow_api.g_varchar2_table(317) := '2D2D7374796C6541202E612D43617264566965772D6974656D732D2D726F77202E742D4361726473526567696F6E2D2D7374796C6541202E612D43617264566965772D616374696F6E73207B0D0A2020666C65782D646972656374696F6E3A20636F6C75';
wwv_flow_api.g_varchar2_table(318) := '6D6E3B0D0A2020616C69676E2D6974656D733A20666C65782D656E643B0D0A2020677269642D636F6C756D6E3A20343B0D0A2020677269642D726F772D73746172743A20313B0D0A2020677269642D726F772D656E643A20343B0D0A7D0D0A2E742D4361';
wwv_flow_api.g_varchar2_table(319) := '726473526567696F6E2D2D7374796C6541202E612D43617264566965772D6974656D732D2D726F77202E612D43617264566965772D6D65646961207B0D0A20206D617267696E2D746F703A20766172282D2D612D63762D6D656469612D70616464696E67';
wwv_flow_api.g_varchar2_table(320) := '2D79293B0D0A20206D617267696E2D626F74746F6D3A20766172282D2D612D63762D6D656469612D70616464696E672D79293B0D0A20206D617267696E2D72696768743A20303B0D0A7D0D0A2E752D52544C202E742D4361726473526567696F6E2D2D73';
wwv_flow_api.g_varchar2_table(321) := '74796C6541202E612D43617264566965772D6974656D732D2D726F77202E612D43617264566965772D6D65646961207B0D0A20206D617267696E2D72696768743A20766172282D2D612D63762D6D656469612D70616464696E672D78293B0D0A20206D61';
wwv_flow_api.g_varchar2_table(322) := '7267696E2D6C6566743A20303B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542207B0D0A20202D2D612D63762D6F766572666C6F773A2068696464656E3B0D0A20202D2D612D63762D6D656469612D6261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(323) := '6C6F723A2072676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D612D63762D6D656469612D6F7665726C61792D636F6C6F723A207267626128302C20302C20302C20302E3735293B0D0A20202D2D612D63762D69636F6E2D';
wwv_flow_api.g_varchar2_table(324) := '636F6E7461696E65722D73697A653A20363470783B0D0A20202D2D612D63762D69636F6E2D73697A653A20333270783B0D0A20202D2D612D63762D69636F6E2D626F726465722D7261646975733A203470783B0D0A20202D2D612D63762D69636F6E2D69';
wwv_flow_api.g_varchar2_table(325) := '6D6167652D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D69636F6E2D696D6167652D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F7264';
wwv_flow_api.g_varchar2_table(326) := '65722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D73697A';
wwv_flow_api.g_varchar2_table(327) := '653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D696E697469616C732D666F6E742D73697A653A20333270783B0D0A20202D2D612D63762D696E697469616C732D666F6E742D77656967';
wwv_flow_api.g_varchar2_table(328) := '68743A203430303B0D0A20202D2D612D63762D6D656469612D70616464696E672D793A203070783B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A203070783B0D0A20202D2D612D63762D6865616465722D626F726465722D776964';
wwv_flow_api.g_varchar2_table(329) := '74683A203070783B0D0A20202D2D612D63762D6865616465722D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A20202D2D612D63762D616374696F6E732D626F726465722D77696474683A203070783B0D0A20202D2D612D63762D6163';
wwv_flow_api.g_varchar2_table(330) := '74696F6E732D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A20202D2D612D63762D7469746C652D666F6E742D73697A653A20323070783B0D0A20202D2D612D63762D7469746C652D6C696E652D6865696768743A20323870783B0D0A';
wwv_flow_api.g_varchar2_table(331) := '20202D2D612D63762D62616467652D70616464696E673A2034707820313270783B0D0A20202D2D612D63762D62616467652D626F726465722D7261646975733A20323070783B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E68';
wwv_flow_api.g_varchar2_table(332) := '61732D69636F6E2D2D746F70207B0D0A20202D2D612D63762D69636F6E2D636F6E7461696E65722D73697A653A2031313270783B0D0A20202D2D612D63762D69636F6E2D73697A653A20333270783B0D0A20202D2D612D63762D69636F6E2D626F726465';
wwv_flow_api.g_varchar2_table(333) := '722D7261646975733A203470783B0D0A20202D2D612D63762D69636F6E2D696D6167652D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D69636F6E2D696D6167652D626F7264';
wwv_flow_api.g_varchar2_table(334) := '65722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D';
wwv_flow_api.g_varchar2_table(335) := '726164697573293B0D0A20202D2D612D63762D696E697469616C732D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D696E697469616C732D666F6E742D73697A653A20333270';
wwv_flow_api.g_varchar2_table(336) := '783B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70202E612D43617264566965772D69636F6E57726170207B0D0A20206D617267696E2D6C6566743A2063616C6328766172282D2D612D63762D';
wwv_flow_api.g_varchar2_table(337) := '6865616465722D70616464696E672D7829202A202D31293B0D0A20206D617267696E2D72696768743A2063616C6328766172282D2D612D63762D6865616465722D70616464696E672D7829202A202D31293B0D0A20206D617267696E2D746F703A206361';
wwv_flow_api.g_varchar2_table(338) := '6C6328766172282D2D612D63762D6865616465722D70616464696E672D7929202A202D31293B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70202E612D43617264566965772D69636F6E577261';
wwv_flow_api.g_varchar2_table(339) := '70202E612D43617264566965772D696E697469616C732C0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70202E612D43617264566965772D69636F6E57726170202E612D43617264566965772D69636F6E';
wwv_flow_api.g_varchar2_table(340) := '2C0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70202E612D43617264566965772D69636F6E57726170202E612D43617264566965772D69636F6E496D67207B0D0A202077696474683A20313030253B0D';
wwv_flow_api.g_varchar2_table(341) := '0A2020626F726465722D7261646975733A20303B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70202E612D43617264566965772D69636F6E3A6265666F7265207B0D0A2020626F726465722D72';
wwv_flow_api.g_varchar2_table(342) := '61646975733A20313030253B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A2020746578742D736861646F773A20302031707820317078207267626128302C20302C20302C20302E31293B0D';
wwv_flow_api.g_varchar2_table(343) := '0A20206D617267696E3A206175746F3B0D0A202070616464696E673A2063616C6328766172282D2D612D63762D69636F6E2D73697A6529202F2032293B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D';
wwv_flow_api.g_varchar2_table(344) := '7374617274202E612D43617264566965772D69636F6E57726170207B0D0A20206D617267696E2D626F74746F6D3A20766172282D2D612D63762D6865616465722D6974656D2D73706163696E672D782C2031327078293B0D0A7D0D0A2E742D4361726473';
wwv_flow_api.g_varchar2_table(345) := '526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D656E64202E612D43617264566965772D69636F6E57726170207B0D0A20206D617267696E2D746F703A20766172282D2D612D63762D6865616465722D6974656D2D73706163696E672D78';
wwv_flow_api.g_varchar2_table(346) := '2C2031327078293B0D0A2020677269642D617265613A2062616467652D626F74746F6D3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D656E64202E612D43617264566965772D686561646572426F64';
wwv_flow_api.g_varchar2_table(347) := '79207B0D0A2020677269642D617265613A2069636F6E2D746F703B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D656E64202E612D43617264566965772D6261646765207B0D0A2020677269642D6172';
wwv_flow_api.g_varchar2_table(348) := '65613A20626F64793B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D69636F6E57726170207B0D0A2020677269642D617265613A2069636F6E2D746F703B0D0A20206D617267696E2D72696768743A';
wwv_flow_api.g_varchar2_table(349) := '20756E7365743B0D0A20206D617267696E2D6C6566743A20756E7365743B0D0A2020646973706C61793A20666C65783B0D0A20206A7573746966792D636F6E74656E743A2063656E7465723B0D0A7D0D0A2E742D4361726473526567696F6E2D2D737479';
wwv_flow_api.g_varchar2_table(350) := '6C6542202E612D43617264566965772D686561646572426F6479207B0D0A2020746578742D616C69676E3A2063656E7465723B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D6261646765207B0D0A';
wwv_flow_api.g_varchar2_table(351) := '20206D617267696E2D6C6566743A206175746F3B0D0A20206D617267696E2D72696768743A206175746F3B0D0A2020677269642D617265613A2062616467652D626F74746F6D3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E';
wwv_flow_api.g_varchar2_table(352) := '612D43617264566965772D62616467653A6E6F74283A66697273742D6368696C6429207B0D0A20206D617267696E2D746F703A20766172282D2D612D63762D6865616465722D6974656D2D73706163696E672D782C2031327078293B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(353) := '4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D62616467654C6162656C207B0D0A2020626F726465723A20756E7365743B0D0A2020636C69703A20756E7365743B0D0A2020636C69702D706174683A20756E7365743B0D';
wwv_flow_api.g_varchar2_table(354) := '0A20206865696768743A20756E7365743B0D0A20206D617267696E3A20756E7365743B0D0A20206F766572666C6F773A20756E7365743B0D0A202070616464696E673A20756E7365743B0D0A2020706F736974696F6E3A20756E7365743B0D0A20207769';
wwv_flow_api.g_varchar2_table(355) := '6474683A20756E7365743B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D616374696F6E73207B0D0A2020666C65782D646972656374696F6E3A20636F6C756D6E3B0D0A7D0D0A2E742D4361726473';
wwv_flow_api.g_varchar2_table(356) := '526567696F6E2D2D7374796C6542202E612D43617264566965772D616374696F6E735072696D617279202E612D43617264566965772D627574746F6E207B0D0A202077696474683A20313030253B0D0A7D0D0A2E742D4361726473526567696F6E2D2D73';
wwv_flow_api.g_varchar2_table(357) := '74796C6542202E612D43617264566965772D616374696F6E735072696D617279202E612D43617264566965772D627574746F6E202B202E612D43617264566965772D627574746F6E207B0D0A20206D617267696E2D746F703A203470783B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(358) := '742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D616374696F6E735365636F6E64617279207B0D0A2020746578742D616C69676E3A2063656E7465723B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C';
wwv_flow_api.g_varchar2_table(359) := '6542202E612D43617264566965772D616374696F6E735365636F6E646172793A6E6F74283A6F6E6C792D6368696C6429207B0D0A20206D617267696E2D746F703A203870783B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6543207B0D';
wwv_flow_api.g_varchar2_table(360) := '0A20202D2D612D63762D6F766572666C6F773A2068696464656E3B0D0A20202D2D612D63762D6D656469612D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D612D63762D';
wwv_flow_api.g_varchar2_table(361) := '6D656469612D6F7665726C61792D636F6C6F723A207267626128302C20302C20302C20302E3735293B0D0A20202D2D612D63762D6D656469612D70616464696E672D793A203070783B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A';
wwv_flow_api.g_varchar2_table(362) := '203070783B0D0A20202D2D612D63762D6865616465722D626F726465722D77696474683A203070783B0D0A20202D2D612D63762D6865616465722D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A20202D2D612D63762D616374696F6E';
wwv_flow_api.g_varchar2_table(363) := '732D626F726465722D77696474683A203070783B0D0A20202D2D612D63762D616374696F6E732D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D7469746C';
wwv_flow_api.g_varchar2_table(364) := '652E6861732D626F64793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D7469746C652E6861732D7365636F6E646172793A';
wwv_flow_api.g_varchar2_table(365) := '6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D7375627469746C652E6861732D626F64793A6E6F74282E6861732D6D656469';
wwv_flow_api.g_varchar2_table(366) := '612D2D626F647929202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D7375627469746C652E6861732D7365636F6E646172793A6E6F74282E6861732D6D656469612D2D626F647929';
wwv_flow_api.g_varchar2_table(367) := '202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D69636F6E2E6861732D626F64793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F6479';
wwv_flow_api.g_varchar2_table(368) := '2C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D69636F6E2E6861732D7365636F6E646172793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F64792C0D0A2E742D436172647352';
wwv_flow_api.g_varchar2_table(369) := '6567696F6E2D2D7374796C6543202E6861732D62616467652E6861732D626F64793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E68';
wwv_flow_api.g_varchar2_table(370) := '61732D62616467652E6861732D7365636F6E646172793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F6479207B0D0A202070616464696E672D746F703A20303B0D0A7D0D0A2E742D4361726473526567696F';
wwv_flow_api.g_varchar2_table(371) := '6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E612D43617264566965772D626F6479207B0D0A2020677269642D636F6C756D6E2D73746172743A20333B0D0A7D0D0A2E742D4361726473526567696F6E2D2D737479';
wwv_flow_api.g_varchar2_table(372) := '6C6543202E612D43617264566965772D6974656D732D2D726F77202E612D43617264566965772D616374696F6E73207B0D0A2020666C65782D646972656374696F6E3A20636F6C756D6E3B0D0A2020616C69676E2D6974656D733A20666C65782D656E64';
wwv_flow_api.g_varchar2_table(373) := '3B0D0A2020677269642D636F6C756D6E3A20343B0D0A2020677269642D726F772D73746172743A20313B0D0A2020677269642D726F772D656E643A20343B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965';
wwv_flow_api.g_varchar2_table(374) := '772D6974656D732D2D726F77202E612D43617264566965773A6E6F74282E6861732D69636F6E292C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E6861732D69636F6E2D2D74';
wwv_flow_api.g_varchar2_table(375) := '6F702C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E6861732D69636F6E2D2D656E64207B0D0A20202D2D612D63762D69636F6E2D7370616365723A203070783B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(376) := '406D6564696120286D61782D77696474683A20373638707829207B0D0A20202E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E6861732D6D65646961207B0D0A20202020677269642D';
wwv_flow_api.g_varchar2_table(377) := '74656D706C6174652D636F6C756D6E733A206D696E6D617828323070782C203830707829206D696E6D617828302C20766172282D2D612D63762D69636F6E2D7370616365722C2034347078292920316672206D696E6D617828302C206175746F293B0D0A';
wwv_flow_api.g_varchar2_table(378) := '20207D0D0A7D0D0A2E742D466F726D2D2D6C617267652C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765207B0D0A20202D2D75742D6669656C642D6C6162656C2D666F6E742D73697A653A20313470783B0D0A20202D2D75';
wwv_flow_api.g_varchar2_table(379) := '742D6669656C642D6C6162656C2D70616464696E672D793A203870783B0D0A20202D2D612D6669656C642D696E7075742D666F6E742D73697A653A20313470783B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D793A203870783B';
wwv_flow_api.g_varchar2_table(380) := '0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D783A203870783B0D0A20202D2D75742D6669656C642D696E7075742D69636F6E2D70616464696E672D783A203870783B0D0A20202D2D75742D6669656C642D696E7075742D69636F';
wwv_flow_api.g_varchar2_table(381) := '6E2D70616464696E672D793A203870783B0D0A20202D2D612D636865636B626F782D73697A653A20323070783B0D0A20202D2D612D636865636B626F782D69636F6E2D73697A653A20313870783B0D0A20202D2D612D636865636B626F782D6C6162656C';
wwv_flow_api.g_varchar2_table(382) := '2D666F6E742D73697A653A20313470783B0D0A20202D2D612D636865636B626F782D6C6162656C2D6C696E652D6865696768743A20323070783B0D0A20202D2D75742D70696C6C627574746F6E2D70616464696E672D793A203870783B0D0A20202D2D75';
wwv_flow_api.g_varchar2_table(383) := '742D70696C6C627574746F6E2D70616464696E672D783A20313270783B0D0A20202D2D75742D70696C6C627574746F6E2D666F6E742D73697A653A20313270783B0D0A20202D2D75742D70696C6C627574746F6E2D6C696E652D6865696768743A203136';
wwv_flow_api.g_varchar2_table(384) := '70783B0D0A20202D2D75742D70696C6C627574746F6E2D636865636B626F782D6F66667365743A203670783B0D0A20202D2D75742D70696C6C627574746F6E2D636865636B626F782D6C696E652D6865696768743A20313670783B0D0A20202D2D612D70';
wwv_flow_api.g_varchar2_table(385) := '6F7075706C6F762D636869702D6D617267696E2D783A203270783B0D0A20202D2D612D706F7075706C6F762D636869702D6D617267696E2D793A203270783B0D0A20202D2D612D706F7075706C6F762D636869702D666F6E742D73697A653A2031347078';
wwv_flow_api.g_varchar2_table(386) := '3B0D0A20202D2D612D706F7075706C6F762D636869702D6C696E652D6865696768743A20323070783B0D0A20202D2D612D706F7075706C6F762D636869702D70616464696E672D793A203270783B0D0A20202D2D612D706F7075706C6F762D636869702D';
wwv_flow_api.g_varchar2_table(387) := '70616464696E672D783A203670783B0D0A20202D2D612D7377697463682D77696474683A20363070783B0D0A20202D2D612D7377697463682D70616464696E672D793A203370783B0D0A20202D2D612D7377697463682D70616464696E672D783A203370';
wwv_flow_api.g_varchar2_table(388) := '783B0D0A20202D2D612D7377697463682D746F67676C652D77696474683A20323670783B0D0A20202D2D612D7377697463682D746F67676C652D6865696768743A20323670783B0D0A7D0D0A2E742D466F726D2D2D6C61726765202E742D466F726D2D69';
wwv_flow_api.g_varchar2_table(389) := '74656D546578742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E742D466F726D2D6974656D54657874207B0D0A20206C696E652D6865696768743A20333270783B0D0A2020666F6E742D73697A653A20313470783B';
wwv_flow_api.g_varchar2_table(390) := '0D0A7D0D0A2E742D466F726D2D2D6C61726765202E617065782D6974656D2D69636F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E617065782D6974656D2D69636F6E2C0D0A2E742D466F726D2D2D6C61726765';
wwv_flow_api.g_varchar2_table(391) := '2E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B65722C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B6572207B0D0A';
wwv_flow_api.g_varchar2_table(392) := '20202D2D612D69636F6E2D70616464696E673A203870783B0D0A7D0D0A2E742D466F726D2D2D6C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B65722C0D0A2E742D466F726D2D6669656C64436F6E7461696E6572';
wwv_flow_api.g_varchar2_table(393) := '2D2D6C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B6572207B0D0A20202D2D612D69636F6E2D73697A653A20323070783B0D0A20202D2D612D6974656D2D69636F6E2D6F66667365743A2063616C632876617228';
wwv_flow_api.g_varchar2_table(394) := '2D2D612D69636F6E2D73697A652C203136707829202B20766172282D2D612D69636F6E2D70616464696E6729293B0D0A7D0D0A2E742D466F726D2D2D6C61726765202E617065782D6974656D2D67726F75702D2D636F6C6F722D7069636B6572202E612D';
wwv_flow_api.g_varchar2_table(395) := '427574746F6E2D2D636F6C6F725069636B65724F6E6C792C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E617065782D6974656D2D67726F75702D2D636F6C6F722D7069636B6572202E612D427574746F6E2D2D636F';
wwv_flow_api.g_varchar2_table(396) := '6C6F725069636B65724F6E6C79207B0D0A20202D2D612D636F6C6F722D7069636B65722D636F6C6F722D6F6E6C792D6865696768743A20313670783B0D0A20202D2D612D636F6C6F722D7069636B65722D636F6C6F722D6F6E6C792D77696474683A2033';
wwv_flow_api.g_varchar2_table(397) := '3270783B0D0A20202D2D612D627574746F6E2D70616464696E673A203870783B0D0A7D0D0A2E742D466F726D2D2D6C617267652E617065782D6974656D2D777261707065722D2D6861732D69636F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461';
wwv_flow_api.g_varchar2_table(398) := '696E65722D2D6C617267652E617065782D6974656D2D777261707065722D2D6861732D69636F6E207B0D0A20202D2D612D69636F6E2D70616464696E673A203870783B0D0A20202D2D612D6974656D2D69636F6E2D6F66667365743A2063616C63287661';
wwv_flow_api.g_varchar2_table(399) := '72282D2D612D69636F6E2D73697A652C203136707829202B20766172282D2D612D69636F6E2D70616464696E6729293B0D0A7D0D0A2E742D466F726D2D2D6C61726765202E742D466F726D2D6974656D57726170706572202E612D427574746F6E2C0D0A';
wwv_flow_api.g_varchar2_table(400) := '2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E742D466F726D2D6974656D57726170706572202E612D427574746F6E2C0D0A2E742D466F726D2D2D6C61726765202E742D466F726D2D6974656D57726170706572202E6F6A';
wwv_flow_api.g_varchar2_table(401) := '2D696E7075746461746574696D652D696E7075742D747269676765722C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E742D466F726D2D6974656D57726170706572202E6F6A2D696E7075746461746574696D652D69';
wwv_flow_api.g_varchar2_table(402) := '6E7075742D747269676765722C0D0A2E742D466F726D2D2D6C61726765202E742D466F726D2D6974656D57726170706572202E742D466F726D2D68656C70427574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765';
wwv_flow_api.g_varchar2_table(403) := '202E742D466F726D2D6974656D57726170706572202E742D466F726D2D68656C70427574746F6E2C0D0A2E742D466F726D2D2D6C61726765202E617065782D6974656D2D66696C652D2D6E61746976653A3A2D7765626B69742D66696C652D75706C6F61';
wwv_flow_api.g_varchar2_table(404) := '642D627574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E617065782D6974656D2D66696C652D2D6E61746976653A3A2D7765626B69742D66696C652D75706C6F61642D627574746F6E207B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(405) := '612D627574746F6E2D70616464696E672D793A203870783B0D0A20202D2D612D627574746F6E2D70616464696E672D783A20313270783B0D0A20202D2D612D69636F6E2D73697A653A20313670783B0D0A7D0D0A2E742D466F726D2D2D6C61726765202E';
wwv_flow_api.g_varchar2_table(406) := '617065782D6974656D2D67726F75702D2D73687574746C652073656C6563742E73687574746C655F6C6566742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E617065782D6974656D2D67726F75702D2D7368757474';
wwv_flow_api.g_varchar2_table(407) := '6C652073656C6563742E73687574746C655F6C6566742C0D0A2E742D466F726D2D2D6C61726765202E617065782D6974656D2D67726F75702D2D73687574746C652073656C6563742E73687574746C655F72696768742C0D0A2E742D466F726D2D666965';
wwv_flow_api.g_varchar2_table(408) := '6C64436F6E7461696E65722D2D6C61726765202E617065782D6974656D2D67726F75702D2D73687574746C652073656C6563742E73687574746C655F7269676874207B0D0A20206D696E2D6865696768743A2031383070783B0D0A7D0D0A2E742D466F72';
wwv_flow_api.g_varchar2_table(409) := '6D2D2D786C617267652C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765207B0D0A20202D2D75742D6669656C642D6C6162656C2D666F6E742D73697A653A20313670783B0D0A20202D2D75742D6669656C642D6C616265';
wwv_flow_api.g_varchar2_table(410) := '6C2D70616464696E672D793A20313270783B0D0A20202D2D612D6669656C642D696E7075742D666F6E742D73697A653A20313670783B0D0A20202D2D612D6669656C642D696E7075742D6C696E652D6865696768743A20323070783B0D0A20202D2D612D';
wwv_flow_api.g_varchar2_table(411) := '6669656C642D696E7075742D70616464696E672D793A20313070783B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D783A20313070783B0D0A20202D2D75742D6669656C642D696E7075742D69636F6E2D70616464696E672D783A';
wwv_flow_api.g_varchar2_table(412) := '203870783B0D0A20202D2D75742D6669656C642D696E7075742D69636F6E2D70616464696E672D793A20313270783B0D0A20202D2D612D636865636B626F782D73697A653A20323470783B0D0A20202D2D612D636865636B626F782D69636F6E2D73697A';
wwv_flow_api.g_varchar2_table(413) := '653A20313870783B0D0A20202D2D612D636865636B626F782D6C6162656C2D666F6E742D73697A653A20313670783B0D0A20202D2D612D636865636B626F782D6C6162656C2D6C696E652D6865696768743A20323470783B0D0A20202D2D75742D70696C';
wwv_flow_api.g_varchar2_table(414) := '6C627574746F6E2D70616464696E672D793A20313270783B0D0A20202D2D75742D70696C6C627574746F6E2D70616464696E672D783A20313270783B0D0A20202D2D75742D70696C6C627574746F6E2D666F6E742D73697A653A20313470783B0D0A2020';
wwv_flow_api.g_varchar2_table(415) := '2D2D75742D70696C6C627574746F6E2D6C696E652D6865696768743A20313670783B0D0A20202D2D75742D70696C6C627574746F6E2D636865636B626F782D6F66667365743A203870783B0D0A20202D2D75742D70696C6C627574746F6E2D636865636B';
wwv_flow_api.g_varchar2_table(416) := '626F782D6C696E652D6865696768743A20313670783B0D0A20202D2D612D706F7075706C6F762D636869702D6D617267696E2D783A203270783B0D0A20202D2D612D706F7075706C6F762D636869702D6D617267696E2D793A203270783B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(417) := '612D706F7075706C6F762D636869702D666F6E742D73697A653A20313670783B0D0A20202D2D612D706F7075706C6F762D636869702D6C696E652D6865696768743A20323470783B0D0A20202D2D612D706F7075706C6F762D636869702D70616464696E';
wwv_flow_api.g_varchar2_table(418) := '672D793A203470783B0D0A20202D2D612D706F7075706C6F762D636869702D70616464696E672D783A203870783B0D0A20202D2D612D7377697463682D77696474683A20373670783B0D0A20202D2D612D7377697463682D70616464696E672D793A2034';
wwv_flow_api.g_varchar2_table(419) := '70783B0D0A20202D2D612D7377697463682D70616464696E672D783A203470783B0D0A20202D2D612D7377697463682D746F67676C652D77696474683A20333270783B0D0A20202D2D612D7377697463682D746F67676C652D6865696768743A20333270';
wwv_flow_api.g_varchar2_table(420) := '783B0D0A7D0D0A2E742D466F726D2D2D786C61726765202E742D466F726D2D6974656D546578742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765202E742D466F726D2D6974656D54657874207B0D0A20206C696E652D';
wwv_flow_api.g_varchar2_table(421) := '6865696768743A20343070783B0D0A2020666F6E742D73697A653A20313670783B0D0A7D0D0A2E742D466F726D2D2D786C61726765202E617065782D6974656D2D69636F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C6172';
wwv_flow_api.g_varchar2_table(422) := '6765202E617065782D6974656D2D69636F6E2C0D0A2E742D466F726D2D2D786C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B65722C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C617267';
wwv_flow_api.g_varchar2_table(423) := '652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B6572207B0D0A20202D2D612D69636F6E2D70616464696E673A203870783B0D0A7D0D0A2E742D466F726D2D2D786C617267652E617065782D6974656D2D777261707065722D';
wwv_flow_api.g_varchar2_table(424) := '2D636F6C6F722D7069636B65722C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B6572207B0D0A20202D2D612D69636F6E2D73697A653A2032';
wwv_flow_api.g_varchar2_table(425) := '3070783B0D0A20202D2D612D6974656D2D69636F6E2D6F66667365743A2063616C6328766172282D2D612D69636F6E2D73697A652C203136707829202B20766172282D2D612D69636F6E2D70616464696E6729293B0D0A7D0D0A2E742D466F726D2D2D78';
wwv_flow_api.g_varchar2_table(426) := '6C61726765202E617065782D6974656D2D67726F75702D2D636F6C6F722D7069636B6572202E612D427574746F6E2D2D636F6C6F725069636B65724F6E6C792C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765202E6170';
wwv_flow_api.g_varchar2_table(427) := '65782D6974656D2D67726F75702D2D636F6C6F722D7069636B6572202E612D427574746F6E2D2D636F6C6F725069636B65724F6E6C79207B0D0A20202D2D612D636F6C6F722D7069636B65722D636F6C6F722D6F6E6C792D6865696768743A2032347078';
wwv_flow_api.g_varchar2_table(428) := '3B0D0A20202D2D612D636F6C6F722D7069636B65722D636F6C6F722D6F6E6C792D77696474683A20333270783B0D0A20202D2D612D627574746F6E2D70616464696E673A203870783B0D0A7D0D0A2E742D466F726D2D2D786C61726765202E742D466F72';
wwv_flow_api.g_varchar2_table(429) := '6D2D6974656D57726170706572202E612D427574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765202E742D466F726D2D6974656D57726170706572202E612D427574746F6E2C0D0A2E742D466F726D2D2D786C';
wwv_flow_api.g_varchar2_table(430) := '61726765202E742D466F726D2D6974656D57726170706572202E6F6A2D696E7075746461746574696D652D696E7075742D747269676765722C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765202E742D466F726D2D6974';
wwv_flow_api.g_varchar2_table(431) := '656D57726170706572202E6F6A2D696E7075746461746574696D652D696E7075742D747269676765722C0D0A2E742D466F726D2D2D786C61726765202E742D466F726D2D6974656D57726170706572202E742D466F726D2D68656C70427574746F6E2C0D';
wwv_flow_api.g_varchar2_table(432) := '0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765202E742D466F726D2D6974656D57726170706572202E742D466F726D2D68656C70427574746F6E2C0D0A2E742D466F726D2D2D786C61726765202E617065782D6974656D2D';
wwv_flow_api.g_varchar2_table(433) := '66696C652D2D6E61746976653A3A2D7765626B69742D66696C652D75706C6F61642D627574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765202E617065782D6974656D2D66696C652D2D6E61746976653A3A2D';
wwv_flow_api.g_varchar2_table(434) := '7765626B69742D66696C652D75706C6F61642D627574746F6E207B0D0A20202D2D612D627574746F6E2D70616464696E672D793A20313170783B0D0A20202D2D612D627574746F6E2D70616464696E672D783A20313270783B0D0A20202D2D612D69636F';
wwv_flow_api.g_varchar2_table(435) := '6E2D73697A653A20313670783B0D0A7D0D0A2E742D466F726D2D2D786C617267652E617065782D6974656D2D777261707065722D2D6861732D69636F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C617267652E617065782D';
wwv_flow_api.g_varchar2_table(436) := '6974656D2D777261707065722D2D6861732D69636F6E207B0D0A20202D2D612D69636F6E2D70616464696E673A203870783B0D0A20202D2D612D6974656D2D69636F6E2D6F66667365743A2063616C6328766172282D2D612D69636F6E2D73697A652C20';
wwv_flow_api.g_varchar2_table(437) := '3136707829202B20766172282D2D612D69636F6E2D70616464696E6729293B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C6172';
wwv_flow_api.g_varchar2_table(438) := '67652C0D0A2E742D466F726D2D2D6C61726765202E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C207B0D0A20202D2D75742D6669656C642D6C6162656C2D666F6E742D73697A653A20313670783B0D0A2020';
wwv_flow_api.g_varchar2_table(439) := '2D2D612D6669656C642D696E7075742D70616464696E672D783A20313270783B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D793A20313070783B0D0A20202D2D612D6669656C642D696E7075742D666F6E742D73697A653A2031';
wwv_flow_api.g_varchar2_table(440) := '3670783B0D0A20202D2D75742D6669656C642D666C2D6C6162656C2D6C696E652D6865696768743A20323070783B0D0A20202D2D75742D6669656C642D666C2D6C6162656C2D666F6E742D73697A653A20313270783B0D0A7D0D0A2E742D466F726D2D66';
wwv_flow_api.g_varchar2_table(441) := '69656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C617267652C0D0A2E742D466F726D2D2D786C61726765202E742D466F726D2D6669656C64436F6E7461696E65722D';
wwv_flow_api.g_varchar2_table(442) := '2D666C6F6174696E674C6162656C207B0D0A20202D2D75742D6669656C642D6C6162656C2D666F6E742D73697A653A20313670783B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D783A20313270783B0D0A20202D2D612D666965';
wwv_flow_api.g_varchar2_table(443) := '6C642D696E7075742D70616464696E672D793A20313270783B0D0A20202D2D612D6669656C642D696E7075742D666F6E742D73697A653A20313670783B0D0A20202D2D75742D6669656C642D666C2D6C6162656C2D6C696E652D6865696768743A203232';
wwv_flow_api.g_varchar2_table(444) := '70783B0D0A20202D2D75742D6669656C642D666C2D6C6162656C2D666F6E742D73697A653A20313470783B0D0A20202D2D75742D6669656C642D696E7075742D69636F6E2D70616464696E672D783A20313070783B0D0A7D0D0A2E726F2D636865636B62';
wwv_flow_api.g_varchar2_table(445) := '6F782C0D0A2E752D636865636B626F783A6265666F72652C0D0A2E752D726164696F3A6265666F7265207B0D0A20207472616E73666F726D2D6F726967696E3A2063656E7465722063656E7465723B0D0A20207472616E736974696F6E3A207472616E73';
wwv_flow_api.g_varchar2_table(446) := '666F726D20302E3132357320656173652C206261636B67726F756E642D636F6C6F7220302E31357320656173652C20626F782D736861646F7720302E31357320656173652C20626F726465722D636F6C6F7220302E31357320656173653B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(447) := '726F2D636865636B626F783A6265666F72652C0D0A2E752D636865636B626F783A61667465722C0D0A2E752D726164696F3A6166746572207B0D0A20207472616E73666F726D2D6F726967696E3A2063656E7465722063656E7465723B0D0A2020747261';
wwv_flow_api.g_varchar2_table(448) := '6E73666F726D3A207363616C652830293B0D0A20207472616E736974696F6E3A206F70616369747920302E31357320656173652C207472616E73666F726D20302E327320656173653B0D0A7D0D0A2E726F2D636865636B626F783A6163746976652C0D0A';
wwv_flow_api.g_varchar2_table(449) := '2E726F2D636865636B626F783A6163746976653A6265666F72652C0D0A2E752D636865636B626F783A6163746976653A6265666F72652C0D0A2E752D636865636B626F783A6163746976653A61667465722C0D0A696E7075743A636865636B6564202B20';
wwv_flow_api.g_varchar2_table(450) := '2E752D636865636B626F783A6163746976653A61667465722C0D0A2E752D726164696F3A6163746976653A6265666F72652C0D0A2E752D726164696F3A6163746976653A61667465722C0D0A696E7075743A636865636B6564202B202E752D726164696F';
wwv_flow_api.g_varchar2_table(451) := '3A6163746976653A6166746572207B0D0A20207472616E73666F726D3A207363616C6528302E3735293B0D0A7D0D0A2E726F2D636865636B626F782E69732D636865636B65643A6265666F72652C0D0A2E752D636865636B626F782E69732D636865636B';
wwv_flow_api.g_varchar2_table(452) := '65643A61667465722C0D0A696E7075743A636865636B6564202B202E752D636865636B626F783A61667465722C0D0A696E7075743A636865636B6564202B202E752D726164696F3A6166746572207B0D0A20207472616E73666F726D3A207363616C6528';
wwv_flow_api.g_varchar2_table(453) := '31293B0D0A7D0D0A2E742D4D6567614D656E75207B0D0A20202D2D612D6D656E752D666F63757365642D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D6D656E752D666F63757365642D746578742D636F';
wwv_flow_api.g_varchar2_table(454) := '6C6F723A20696E697469616C3B0D0A7D0D0A2E742D4D6567614D656E752D6974656D426F64792E69732D666F6375736564202E742D4D6567614D656E752D6C6162656C2C0D0A2E742D4D6567614D656E752D6974656D426F64793A686F766572202E742D';
wwv_flow_api.g_varchar2_table(455) := '4D6567614D656E752D6C6162656C207B0D0A2020636F6C6F723A20766172282D2D75742D6C696E6B2D746578742D636F6C6F72293B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E75426172207B0D0A2020626F782D736861646F773A20';
wwv_flow_api.g_varchar2_table(456) := '696E73657420302063616C6328766172282D2D612D6D656E756261722D6974656D2D626F726465722D77696474682C2031707829202A202D3129203020766172282D2D612D6D656E756261722D6974656D2D626F726465722D636F6C6F72293B0D0A7D0D';
wwv_flow_api.g_varchar2_table(457) := '0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D207B0D0A2020626F726465722D746F702D77696474683A20303B0D0A2020626F726465722D626F74746F6D2D77696474683A20303B0D0A7D0D0A2E742D4865616465722D6E61';
wwv_flow_api.g_varchar2_table(458) := '76202E612D4D656E754261722D6974656D3A666F6375732D77697468696E207B0D0A20206F75746C696E653A20766172282D2D75742D666F6375732D6F75746C696E652C206175746F2031707820766172282D2D75742D666F6375732D6F75746C696E65';
wwv_flow_api.g_varchar2_table(459) := '2D636F6C6F722C202D7765626B69742D666F6375732D72696E672D636F6C6F7229293B0D0A20206F75746C696E652D6F66667365743A202D3170783B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D202E612D4D65';
wwv_flow_api.g_varchar2_table(460) := '6E754261722D6C6162656C207B0D0A20206F75746C696E653A206E6F6E653B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E752D2D73706C6974202E612D4D656E754261722D6C6162656C207B0D0A202070616464696E672D7269676874';
wwv_flow_api.g_varchar2_table(461) := '3A20303B0D0A7D0D0A2E752D52544C202E742D4865616465722D6E6176202E612D4D656E752D2D73706C6974202E612D4D656E754261722D6C6162656C207B0D0A202070616464696E672D6C6566743A20303B0D0A202070616464696E672D7269676874';
wwv_flow_api.g_varchar2_table(462) := '3A20766172282D2D612D6D656E756261722D6974656D2D70616464696E672D782C20387078293B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E752D2D73706C6974202E612D4D656E752D7375624D656E75436F6C207B0D0A20202D2D61';
wwv_flow_api.g_varchar2_table(463) := '2D6D656E752D69636F6E2D73697A653A20313670783B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E752D2D63757272656E74207B0D0A20202D2D612D6D656E756261722D6974656D2D666F6E742D7765696768743A20766172282D2D61';
wwv_flow_api.g_varchar2_table(464) := '2D626173652D666F6E742D7765696768742D626F6C642C20373030293B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E69732D666F6375736564207B0D0A20202D2D612D6D656E756261722D6974656D2D626163';
wwv_flow_api.g_varchar2_table(465) := '6B67726F756E642D636F6C6F723A20766172282D2D612D6D656E756261722D6974656D2D666F63757365642D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D6D656E756261722D6974656D2D746578742D636F6C6F723A20766172282D';
wwv_flow_api.g_varchar2_table(466) := '2D612D6D656E756261722D6974656D2D666F63757365642D746578742D636F6C6F72293B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D6375';
wwv_flow_api.g_varchar2_table(467) := '7272656E742C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D73656C65637465642C0D0A2E742D547265654E6176202E612D54726565566965772D6E';
wwv_flow_api.g_varchar2_table(468) := '6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564207B0D0A20206261636B67726F756E642D636F6C6F723A20233339333933393B0D0A7D0D0A2E742D547265';
wwv_flow_api.g_varchar2_table(469) := '654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C65';
wwv_flow_api.g_varchar2_table(470) := '76656C2E69732D636F6C6C61707369626C65203E202E612D54726565566965772D726F772C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(471) := '723A20233331333133313B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572207B0D0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(472) := '3A20233430343034302021696D706F7274616E743B0D0A7D0D0A2E612D54726565566965772D636F6E74656E742E69732D73656C6563746564203E202E6661207B0D0A20202D2D75742D74726565766965772D69636F6E2D6F7061636974793A20313B0D';
wwv_flow_api.g_varchar2_table(473) := '0A7D0D0A2E742D547265654E61762D2D7374796C65412C0D0A2E742D547265654E61762D2D7374796C6542207B0D0A20202D2D75742D74726565766965772D62616467652D626F726465722D7261646975733A20323070783B0D0A20202D2D75742D7472';
wwv_flow_api.g_varchar2_table(474) := '6565766965772D62616467652D666F6E742D7765696768743A20766172282D2D612D626173652D666F6E742D7765696768742D73656D69626F6C642C20353030293B0D0A20202D2D75742D74726565766965772D69636F6E2D73697A653A20323070783B';
wwv_flow_api.g_varchar2_table(475) := '0D0A20202D2D75742D74726565766965772D746F706C6576656C2D69636F6E2D636F6E7461696E65722D77696474683A20323870783B0D0A20202D2D75742D74726565766965772D6E6F64652D69636F6E2D73697A653A20313670783B0D0A20202D2D75';
wwv_flow_api.g_varchar2_table(476) := '742D74726565766965772D6E6F64652D69636F6E2D636F6E7461696E65722D77696474683A20766172282D2D75742D74726565766965772D746F706C6576656C2D69636F6E2D636F6E7461696E65722D77696474682C2032387078293B0D0A20202D2D75';
wwv_flow_api.g_varchar2_table(477) := '742D74726565766965772D6E6F64652D696E64656E743A203070783B0D0A20202D2D75742D74726565766965772D6C6561662D6E6F64652D696E64656E743A20313070783B0D0A20202D2D75742D74726565766965772D746F706C6576656C2D6C656166';
wwv_flow_api.g_varchar2_table(478) := '2D70616464696E672D793A203070783B0D0A20202D2D612D74726565766965772D6E6F64652D70616464696E672D793A20313070783B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C';
wwv_flow_api.g_varchar2_table(479) := '6576656C20756C2C0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20202D2D612D74726565766965772D6E6F64652D70616464696E672D793A20313270783B0D0A';
wwv_flow_api.g_varchar2_table(480) := '7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C207B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C69642072676261283235352C203235352C203235352C2030';
wwv_flow_api.g_varchar2_table(481) := '2E31293B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E61762D';
wwv_flow_api.g_varchar2_table(482) := '2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D612D74726565766965772D6E6F64652D73656C65637465642D6261636B67726F75';
wwv_flow_api.g_varchar2_table(483) := '6E642D636F6C6F72293B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F70202E612D54726565';
wwv_flow_api.g_varchar2_table(484) := '566965772D726F772E69732D73656C65637465642C0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C202E612D54726565566965772D726F772E69732D73656C656374656420';
wwv_flow_api.g_varchar2_table(485) := '7B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D75742D626F64792D6E61762D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D';
wwv_flow_api.g_varchar2_table(486) := '2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965';
wwv_flow_api.g_varchar2_table(487) := '772D726F772E69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F77207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D70616C657474652D7072696D6172792920347078203020303B';
wwv_flow_api.g_varchar2_table(488) := '0D0A7D0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E752D52544C202E';
wwv_flow_api.g_varchar2_table(489) := '742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F77207B0D';
wwv_flow_api.g_varchar2_table(490) := '0A2020626F782D736861646F773A20696E73657420766172282D2D75742D70616C657474652D7072696D61727929202D347078203020303B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F';
wwv_flow_api.g_varchar2_table(491) := '704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D666F63757365642C0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E61';
wwv_flow_api.g_varchar2_table(492) := '2D54726565566965772D726F772E69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D70616C657474';
wwv_flow_api.g_varchar2_table(493) := '652D7072696D6172792920347078203020302C2030203020302031707820766172282D2D75742D70616C657474652D7072696D6172792920696E7365743B0D0A7D0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565';
wwv_flow_api.g_varchar2_table(494) := '566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D666F63757365642C0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D547265655669';
wwv_flow_api.g_varchar2_table(495) := '65772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A2020626F782D736861646F773A2069';
wwv_flow_api.g_varchar2_table(496) := '6E73657420766172282D2D75742D70616C657474652D7072696D61727929202D347078203020302C2030203020302031707820766172282D2D75742D70616C657474652D7072696D6172792920696E7365743B0D0A7D0D0A2E742D547265654E61762D2D';
wwv_flow_api.g_varchar2_table(497) := '7374796C6542203E20756C207B0D0A20207472616E736974696F6E3A206D617267696E20766172282D2D75742D6C61796F75742D7472616E736974696F6E2C20302E31732920656173653B0D0A20206D617267696E3A203470783B0D0A7D0D0A4061742D';
wwv_flow_api.g_varchar2_table(498) := '726F6F74202E6A732D6E6176436F6C6C61707365642026207B0D0A20202D2D612D74726565766965772D6E6F64652D70616464696E672D793A203870783B0D0A2020203E20756C207B0D0A202020206D617267696E3A20303B0D0A20207D0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(499) := '742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F6465207B0D0A20206D617267696E2D746F703A203470783B0D0A20206D617267696E2D626F74746F6D3A203470783B0D0A7D0D0A2E742D547265654E61762D2D7374796C';
wwv_flow_api.g_varchar2_table(500) := '6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C207B0D0A20206D617267696E2D6C6566743A203470783B0D0A20206D617267696E2D72696768743A203470783B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E61';
wwv_flow_api.g_varchar2_table(501) := '2D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E';
wwv_flow_api.g_varchar2_table(502) := '6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D547265';
wwv_flow_api.g_varchar2_table(503) := '65566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564207B0D0A20206261636B67726F756E642D636F6C6F723A20236337343633343B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565';
wwv_flow_api.g_varchar2_table(504) := '566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564202B202E612D54726565566965772D746F67676C652C0D0A2E742D547265654E61762D2D73';
wwv_flow_api.g_varchar2_table(505) := '74796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D547265';
wwv_flow_api.g_varchar2_table(506) := '654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F702E69732D686F766572207B0D0A2020636F6C6F723A20236666';
wwv_flow_api.g_varchar2_table(507) := '666666662021696D706F7274616E743B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69';
wwv_flow_api.g_varchar2_table(508) := '732D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236361343833362021696D706F7274616E743B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C';
wwv_flow_api.g_varchar2_table(509) := '202E612D54726565566965772D726F77207B0D0A2020626F726465722D7261646975733A203470783B0D0A7D0D0A2E612D4952522D6469616C6F672D2D646F776E6C6F6164207B0D0A20202D2D612D69636F6E6C6973742D6974656D2D6261636B67726F';
wwv_flow_api.g_varchar2_table(510) := '756E642D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746F6F6C6261722D6261636B67726F756E642D636F6C6F722C207267626128302C20302C20302C20302E30323529293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D';
wwv_flow_api.g_varchar2_table(511) := '746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D686F7665722D746578742D636F6C6F723A20766172282D2D75742D';
wwv_flow_api.g_varchar2_table(512) := '636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D6261636B67';
wwv_flow_api.g_varchar2_table(513) := '726F756E642D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D73656C65637465642D746578742D636F6C6F723A20766172282D2D612D69636F6E6C6973742D6974656D2D686F7665722D746578742D636F6C6F72293B0D0A2020';
wwv_flow_api.g_varchar2_table(514) := '2D2D612D69636F6E6C6973742D6974656D2D73656C65637465642D6261636B67726F756E642D636F6C6F723A20766172282D2D612D69636F6E6C6973742D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E612D49';
wwv_flow_api.g_varchar2_table(515) := '52522D6469616C6F672D2D646F776E6C6F6164202E612D49636F6E4C6973742D6974656D207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72292030';
wwv_flow_api.g_varchar2_table(516) := '202D317078203020303B0D0A7D0D0A2E612D4952522D6469616C6F672D2D646F776E6C6F6164202E612D49636F6E4C6973742D6974656D2E69732D73656C6563746564207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D';
wwv_flow_api.g_varchar2_table(517) := '70616C657474652D7072696D61727929203020327078203020303B0D0A7D0D0A2E612D4952522D69636F6E4C6973742D6974656D202B202E612D4952522D69636F6E4C6973742D6974656D207B0D0A2020626F726465722D6C6566742D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(518) := '766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72293B0D0A7D0D0A2E752D52544C202E612D4952522D69636F6E4C6973742D6974656D202B202E612D4952522D69636F6E4C6973742D6974656D207B0D0A2020';
wwv_flow_api.g_varchar2_table(519) := '626F726465722D72696768742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72293B0D0A7D0D0A2E612D4952522D726164696F49636F6E4C697374207B0D0A20202D2D612D69636F6E6C69';
wwv_flow_api.g_varchar2_table(520) := '73742D6974656D2D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746F6F6C6261722D6261636B67726F756E642D636F6C6F722C207267626128302C20302C20302C20302E30323529293B0D0A20202D2D61';
wwv_flow_api.g_varchar2_table(521) := '2D69636F6E6C6973742D6974656D2D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D686F7665722D746578742D63';
wwv_flow_api.g_varchar2_table(522) := '6F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D';
wwv_flow_api.g_varchar2_table(523) := '636F6D706F6E656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D73656C65637465642D746578742D636F6C6F723A20766172282D2D612D69636F6E6C6973742D6974656D2D686F7665722D74';
wwv_flow_api.g_varchar2_table(524) := '6578742D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D73656C65637465642D6261636B67726F756E642D636F6C6F723A20766172282D2D612D69636F6E6C6973742D6974656D2D686F7665722D6261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(525) := '6F6C6F72293B0D0A7D0D0A2E612D4952522D726164696F49636F6E4C6973742D6974656D202B202E612D4952522D726164696F49636F6E4C6973742D6974656D207B0D0A2020626F726465722D6C6566742D636F6C6F723A20766172282D2D75742D636F';
wwv_flow_api.g_varchar2_table(526) := '6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72293B0D0A7D0D0A2E752D52544C202E612D4952522D726164696F49636F6E4C6973742D6974656D202B202E612D4952522D726164696F49636F6E4C6973742D6974656D207B0D0A202062';
wwv_flow_api.g_varchar2_table(527) := '6F726465722D72696768742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72293B0D0A7D0D0A2E612D4952522D726164696F49636F6E4C6973742D6974656D20696E7075745B747970653D';
wwv_flow_api.g_varchar2_table(528) := '726164696F5D202B206C6162656C207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72292030202D317078203020303B0D0A7D0D0A2E612D4952522D';
wwv_flow_api.g_varchar2_table(529) := '726164696F49636F6E4C6973742D6974656D20696E7075745B747970653D726164696F5D3A636865636B6564202B206C6162656C207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D70616C657474652D7072696D617279';
wwv_flow_api.g_varchar2_table(530) := '29203020327078203020303B0D0A7D0D0A2E612D4952522D6469616C6F67496E666F3A66697273742D6368696C64207B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F';
wwv_flow_api.g_varchar2_table(531) := '726465722D636F6C6F72293B0D0A7D0D0A2E612D49472D627574746F6E2E612D49472D627574746F6E2D2D636F6E74726F6C732C0D0A2E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D636F6E74726F6C73207B0D0A20202D2D612D';
wwv_flow_api.g_varchar2_table(532) := '627574746F6E2D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E612D4952522D6469616C6F67526F772D2D6865616465722C0D0A2E612D4952522D646961';
wwv_flow_api.g_varchar2_table(533) := '6C6F674C6973742061207B0D0A2020636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A7D0D0A2E612D4952522D6469616C6F674C697374207B0D0A2020626F726465722D636F6C6F';
wwv_flow_api.g_varchar2_table(534) := '723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A7D0D0A2E612D4952522D686967686C6967687450726576696577207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D636F6D';
wwv_flow_api.g_varchar2_table(535) := '706F6E656E742D626F726465722D636F6C6F7229203020302030203170783B0D0A7D0D0A2E612D4952522D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233263323832353B0D0A7D0D0A2E612D4952522D6865616465723A';
wwv_flow_api.g_varchar2_table(536) := '686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233334333032633B0D0A7D0D0A2E612D4952522D6865616465722E69732D6163746976652C0D0A2E612D47562D6865616465722E69732D616374697665207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(537) := '67726F756E642D636F6C6F723A20766172282D2D612D6D656E752D6261636B67726F756E642D636F6C6F72293B0D0A2020636F6C6F723A20766172282D2D612D6D656E752D746578742D636F6C6F72293B0D0A7D0D0A2E612D4952522D6865616465722D';
wwv_flow_api.g_varchar2_table(538) := '2D67726F7570207B0D0A20206261636B67726F756E642D636F6C6F723A20233331326432613B0D0A7D0D0A2E612D4952522D736F72745769646765742D7365617263684C6162656C3A6265666F7265207B0D0A2020636F6C6F723A20766172282D2D7574';
wwv_flow_api.g_varchar2_table(539) := '2D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A7D0D0A2E612D4952522D736F72745769646765742D736561726368203E202E612D4952522D736F72745769646765742D7365617263684669656C645B747970653D22746578';
wwv_flow_api.g_varchar2_table(540) := '74225D207B0D0A2020636F6C6F723A20766172282D2D612D6669656C642D696E7075742D73746174652D746578742D636F6C6F722C20766172282D2D612D6669656C642D696E7075742D746578742D636F6C6F7229293B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(541) := '642D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D73746174652D6261636B67726F756E642D636F6C6F722C20766172282D2D612D6669656C642D696E7075742D6261636B67726F756E642D636F6C6F7229293B0D0A7D0D0A2E612D';
wwv_flow_api.g_varchar2_table(542) := '47562D7461626C652074682E612D47562D636F6E74726F6C427265616B486561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233331326432613B0D0A2020626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E';
wwv_flow_api.g_varchar2_table(543) := '656E742D626F726465722D636F6C6F72293B0D0A2020636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D736176';
wwv_flow_api.g_varchar2_table(544) := '65645265706F72742C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D73617665645265706F72742C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D73617665645265706F72742C0D0A2E612D4952522D636F6E74726F';
wwv_flow_api.g_varchar2_table(545) := '6C732D6974656D2D2D73617665645265706F7274207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233441413445433B0D0A20202D2D612D7265706F';
wwv_flow_api.g_varchar2_table(546) := '72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233066353638653B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D7365617263682C0D0A2E612D4947';
wwv_flow_api.g_varchar2_table(547) := '2D636F6E74726F6C732D6974656D2D2D7365617263682C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D7365617263682C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D736561726368207B0D0A20202D2D612D72';
wwv_flow_api.g_varchar2_table(548) := '65706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233441413445433B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261';
wwv_flow_api.g_varchar2_table(549) := '636B67726F756E642D636F6C6F723A20233066353638653B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D66696C7465722C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D66696C7465722C0D0A2E612D495252';
wwv_flow_api.g_varchar2_table(550) := '2D7265706F727453756D6D6172792D6974656D2D2D66696C7465722C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D66696C746572207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D';
wwv_flow_api.g_varchar2_table(551) := '6261636B67726F756E642D636F6C6F723A20233234434237463B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233064343932653B0D0A7D0D0A2E61';
wwv_flow_api.g_varchar2_table(552) := '2D49472D7265706F727453756D6D6172792D6974656D2D2D636F6E74726F6C427265616B2C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D636F6E74726F6C427265616B2C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D';
wwv_flow_api.g_varchar2_table(553) := '2D2D636F6E74726F6C427265616B2C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D636F6E74726F6C427265616B207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F';
wwv_flow_api.g_varchar2_table(554) := '756E642D636F6C6F723A20233342383342443B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233134326434313B0D0A7D0D0A2E612D49472D726570';
wwv_flow_api.g_varchar2_table(555) := '6F727453756D6D6172792D6974656D2D2D67726F757042792C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D67726F757042792C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D67726F757042792C0D0A2E612D4952';
wwv_flow_api.g_varchar2_table(556) := '522D636F6E74726F6C732D6974656D2D2D67726F75704279207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233342383342443B0D0A20202D2D612D';
wwv_flow_api.g_varchar2_table(557) := '7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233134326434313B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D6167677265676174652C';
wwv_flow_api.g_varchar2_table(558) := '0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D6167677265676174652C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D6167677265676174652C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D61676772';
wwv_flow_api.g_varchar2_table(559) := '6567617465207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233342383342443B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C';
wwv_flow_api.g_varchar2_table(560) := '6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233134326434313B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D686967686C696768742C0D0A2E612D49472D636F6E74726F6C732D6974';
wwv_flow_api.g_varchar2_table(561) := '656D2D2D686967686C696768742C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D686967686C696768742C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D686967686C69676874207B0D0A20202D2D612D7265706F';
wwv_flow_api.g_varchar2_table(562) := '72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20234646424532413B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67';
wwv_flow_api.g_varchar2_table(563) := '726F756E642D636F6C6F723A20233836356430303B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D666C6173686261636B2C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D666C6173686261636B2C0D0A2E612D';
wwv_flow_api.g_varchar2_table(564) := '4952522D7265706F727453756D6D6172792D6974656D2D2D666C6173686261636B2C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D666C6173686261636B207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C61';
wwv_flow_api.g_varchar2_table(565) := '62656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233945413741443B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233265333433';
wwv_flow_api.g_varchar2_table(566) := '373B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D63686172742C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D63686172742C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D636861';
wwv_flow_api.g_varchar2_table(567) := '72742C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D6368617274207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233342383342443B';
wwv_flow_api.g_varchar2_table(568) := '0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233034306130653B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D7069';
wwv_flow_api.g_varchar2_table(569) := '766F742C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D7069766F742C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D7069766F742C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D7069766F74207B0D';
wwv_flow_api.g_varchar2_table(570) := '0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233945413741443B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D';
wwv_flow_api.g_varchar2_table(571) := '686F7665722D6261636B67726F756E642D636F6C6F723A20233265333433373B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D696E76616C696453657474696E67732C0D0A2E612D49472D636F6E74726F6C732D6974656D';
wwv_flow_api.g_varchar2_table(572) := '2D2D696E76616C696453657474696E67732C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D696E76616C696453657474696E67732C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D696E76616C696453657474696E';
wwv_flow_api.g_varchar2_table(573) := '6773207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20234244433343373B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C';
wwv_flow_api.g_varchar2_table(574) := '6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233439353135363B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D696E61637469766553657474696E67732C0D0A2E612D49472D636F6E74726F6C';
wwv_flow_api.g_varchar2_table(575) := '732D6974656D2D2D696E61637469766553657474696E67732C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D696E61637469766553657474696E67732C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D696E616374';
wwv_flow_api.g_varchar2_table(576) := '69766553657474696E6773207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20234244433343373B0D0A20202D2D612D7265706F72742D636F6E74726F';
wwv_flow_api.g_varchar2_table(577) := '6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233439353135363B0D0A7D0D0A2E612D47562D7461626C65202E612D47562D63656C6C2E69732D616374697665207B0D0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(578) := '636F6C6F723A20233139313931393B0D0A7D0D0A2E612D47562D2D656469744D6F6465202E612D47562D726F772E69732D726561646F6E6C79202E612D47562D63656C6C2C0D0A2E612D47562D2D656469744D6F6465202E612D47562D63656C6C2E6973';
wwv_flow_api.g_varchar2_table(579) := '2D726561646F6E6C79207B0D0A20206261636B67726F756E642D636F6C6F723A20233064306430643B0D0A2020636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A7D0D0A2E612D47562D';
wwv_flow_api.g_varchar2_table(580) := '63656C6C202E612D47562D636F6C756D6E4974656D20696E7075743A6E6F74285B747970653D22726164696F225D293A6E6F74285B747970653D22636865636B626F78225D293A666F6375732C0D0A2E612D47562D63656C6C202E612D47562D636F6C75';
wwv_flow_api.g_varchar2_table(581) := '6D6E4974656D2073656C6563745B73697A653D2731275D3A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A20233030303B0D0A7D0D0A3A726F6F74207B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D7072696D61';
wwv_flow_api.g_varchar2_table(582) := '72793A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D6272616E643A20766172282D2D75742D70616C657474652D7072696D6172792D';
wwv_flow_api.g_varchar2_table(583) := '74657874293B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D64616E6765723A20766172282D2D75742D70616C657474652D64616E6765722D74657874293B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D7761726E696E';
wwv_flow_api.g_varchar2_table(584) := '673A20766172282D2D75742D70616C657474652D7761726E696E672D74657874293B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D737563636573733A20766172282D2D75742D70616C657474652D737563636573732D74657874293B0D';
wwv_flow_api.g_varchar2_table(585) := '0A20202D2D6F6A2D636F72652D69636F6E2D73697A652D6C673A20312E3572656D3B0D0A20202D2D6F6A2D636F72652D69636F6E2D73697A652D736D3A203172656D3B0D0A20202D2D6F6A2D636F72652D646976696465722D6D617267696E3A20302E35';
wwv_flow_api.g_varchar2_table(586) := '72656D3B0D0A20202D2D6F6A2D636F72652D666F6375732D626F726465722D636F6C6F723A20766172282D2D75742D666F6375732D6F75746C696E652D636F6C6F72293B0D0A20202D2D6F6A2D636F6C6F722D737065637472756D2D626F726465722D63';
wwv_flow_api.g_varchar2_table(587) := '6F6C6F723A20233333333333333B0D0A20202D2D6F6A2D706F7075702D62672D636F6C6F723A20766172282D2D612D6D656E752D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A2D636F72652D62672D636F6C6F722D686F7665723A20';
wwv_flow_api.g_varchar2_table(588) := '766172282D2D612D6D656E752D666F63757365642D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A2D636F72652D626F782D736861646F773A20766172282D2D75742D736861646F772D736D293B0D0A20202D2D6F6A2D6C696E6B2D74';
wwv_flow_api.g_varchar2_table(589) := '6578742D636F6C6F723A20766172282D2D75742D6C696E6B2D746578742D636F6C6F72293B0D0A20202D2D6F6A2D746578742D6669656C642D62672D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D6261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(590) := '6C6F72293B0D0A20202D2D6F6A2D746578742D6669656C642D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D626F726465722D636F6C6F72293B0D0A20202D2D6F6A2D746578742D6669656C642D746578742D636F';
wwv_flow_api.g_varchar2_table(591) := '6C6F723A20766172282D2D612D6669656C642D696E7075742D746578742D636F6C6F72293B0D0A20202D2D6F6A2D636F6C6C656374696F6E2D667265652D73706163652D62672D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626163';
wwv_flow_api.g_varchar2_table(592) := '6B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A2D636F6C6C656374696F6E2D6865616465722D62672D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A2D636F';
wwv_flow_api.g_varchar2_table(593) := '6C6C656374696F6E2D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D6F6A2D636F6C6C656374696F6E2D62672D636F6C6F723A20766172282D2D75742D636F6D706F';
wwv_flow_api.g_varchar2_table(594) := '6E656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A2D707269766174652D67616E74742D6D696C6573746F6E652D62672D636F6C6F723A20766172282D2D752D636F6C6F722D3135293B0D0A20202D2D6F6A2D70726976617465';
wwv_flow_api.g_varchar2_table(595) := '2D67616E74742D7461736B2D62672D636F6C6F723A20766172282D2D752D636F6C6F722D31293B0D0A20202D2D6F6A2D707269766174652D67616E74742D7461736B2D70726F67726573732D62672D636F6C6F723A20766172282D2D752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(596) := '31293B0D0A20202D2D6F6A2D636F72652D646976696465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D6F6A2D627574746F6E2D6F75746C696E65642D6368726F6D652D62672D';
wwv_flow_api.g_varchar2_table(597) := '636F6C6F722D686F7665723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D6F6A2D627574746F6E2D6F75746C696E65642D6368726F6D652D626F726465722D636F6C6F722D686F7665723A20766172282D2D75742D';
wwv_flow_api.g_varchar2_table(598) := '70616C657474652D7072696D617279293B0D0A20202D2D6F6A2D627574746F6E2D6F75746C696E65642D6368726F6D652D746578742D636F6C6F722D686F7665723A20766172282D2D75742D70616C657474652D7072696D6172792D636F6E7472617374';
wwv_flow_api.g_varchar2_table(599) := '293B0D0A20202D2D6F6A2D627574746F6E2D626F726465726C6573732D6368726F6D652D62672D636F6C6F722D686F7665723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D6F6A2D627574746F6E2D626F72646572';
wwv_flow_api.g_varchar2_table(600) := '6C6573732D6368726F6D652D746578742D636F6C6F722D686F7665723A20766172282D2D75742D70616C657474652D7072696D6172792D636F6E7472617374293B0D0A20202D2D6F6A2D68656164696E672D746578742D636F6C6F723A20766172282D2D';
wwv_flow_api.g_varchar2_table(601) := '75742D636F6D706F6E656E742D746578742D7469746C652D636F6C6F72293B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D7365636F6E646172793A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C';
wwv_flow_api.g_varchar2_table(602) := '6F72293B0D0A7D0D0A2E6F6A2D6C697374626F782D64726F703A6E6F74282E6F6A2D6C697374626F782D686964652D686F76657229202E6F6A2D6C697374626F782D726573756C7473202E6F6A2D686F766572207B0D0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(603) := '636F6C6F723A20766172282D2D612D6D656E752D666F63757365642D6261636B67726F756E642D636F6C6F72293B0D0A2020636F6C6F723A20766172282D2D612D6D656E752D666F63757365642D746578742D636F6C6F72293B0D0A7D0D0A2E6F6A2D6C';
wwv_flow_api.g_varchar2_table(604) := '697374626F782D726573756C74732C0D0A2E6F6A2D6C697374626F782D726573756C74732D626173652C0D0A2E6F6A2D73656C6563742D726573756C7473207B0D0A20206D617267696E3A20303B0D0A7D0D0A2E6F6A2D6C697374626F782D64726F7020';
wwv_flow_api.g_varchar2_table(605) := '7B0D0A202070616464696E672D746F703A2063616C6328766172282D2D612D6D656E752D70616464696E672D792C2038707829202D20766172282D2D612D6D656E752D626F726465722D77696474682C2031707829293B0D0A202070616464696E672D62';
wwv_flow_api.g_varchar2_table(606) := '6F74746F6D3A2063616C6328766172282D2D612D6D656E752D70616464696E672D792C2038707829202D20766172282D2D612D6D656E752D626F726465722D77696474682C2031707829293B0D0A202070616464696E672D6C6566743A2063616C632876';
wwv_flow_api.g_varchar2_table(607) := '6172282D2D612D6D656E752D70616464696E672D782C2030707829202D20766172282D2D612D6D656E752D626F726465722D77696474682C2031707829293B0D0A202070616464696E672D72696768743A2063616C6328766172282D2D612D6D656E752D';
wwv_flow_api.g_varchar2_table(608) := '70616464696E672D782C2030707829202D20766172282D2D612D6D656E752D626F726465722D77696474682C2031707829293B0D0A2020626F726465722D7261646975733A20766172282D2D612D6D656E752D626F726465722D7261646975732C203470';
wwv_flow_api.g_varchar2_table(609) := '78293B0D0A2020626F726465722D636F6C6F723A20766172282D2D612D6D656E752D626F726465722D636F6C6F72293B0D0A2020626F726465722D77696474683A20766172282D2D612D6D656E752D626F726465722D77696474682C20317078293B0D0A';
wwv_flow_api.g_varchar2_table(610) := '2020626F726465722D7374796C653A20736F6C69643B0D0A2020626F782D736861646F773A20766172282D2D612D6D656E752D736861646F77293B0D0A20206D696E2D6865696768743A2063616C6328766172282D2D612D6D656E752D6C696E652D6865';
wwv_flow_api.g_varchar2_table(611) := '696768742C203136707829202B2028766172282D2D612D6D656E752D70616464696E672D792C2038707829202A203229293B0D0A2020636F6C6F723A20766172282D2D612D6D656E752D746578742D636F6C6F72293B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(612) := '2D636F6C6F723A20766172282D2D612D6D656E752D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E646172207B0D0A2020666F6E742D73697A653A20766172282D2D6A75692D646174657069';
wwv_flow_api.g_varchar2_table(613) := '636B65722D666F6E742D73697A652C2031317078293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E646172207468207B0D0A2020636F6C6F723A20766172282D2D6A75692D646174657069636B65722D6865616465722C202336363629';
wwv_flow_api.g_varchar2_table(614) := '3B0D0A2020626F726465722D626F74746F6D2D7374796C653A20736F6C69643B0D0A2020626F726465722D626F74746F6D2D77696474683A20766172282D2D6A75692D646174657069636B65722D626F726465722D77696474682C20317078293B0D0A20';
wwv_flow_api.g_varchar2_table(615) := '20626F726465722D626F74746F6D2D636F6C6F723A20766172282D2D75742D646174657069636B65722D626F726465722D636F6C6F722C207267626128302C20302C20302C20302E3129293B0D0A202070616464696E672D746F703A20766172282D2D6A';
wwv_flow_api.g_varchar2_table(616) := '75692D646174657069636B65722D70616464696E672D792C20387078293B0D0A202070616464696E672D72696768743A20766172282D2D6A75692D646174657069636B65722D70616464696E672D782C20387078293B0D0A202070616464696E672D626F';
wwv_flow_api.g_varchar2_table(617) := '74746F6D3A20766172282D2D6A75692D646174657069636B65722D70616464696E672D792C20387078293B0D0A202070616464696E672D6C6566743A20766172282D2D6A75692D646174657069636B65722D70616464696E672D782C20387078293B0D0A';
wwv_flow_api.g_varchar2_table(618) := '7D0D0A2E6F6A2D646174657069636B65722D63616C656E646172207464207B0D0A202077696474683A20766172282D2D6A75692D646174657069636B65722D646174652D73697A652C2034387078293B0D0A20206865696768743A20766172282D2D6A75';
wwv_flow_api.g_varchar2_table(619) := '692D646174657069636B65722D646174652D73697A652C2034387078293B0D0A20206D617267696E3A20766172282D2D6A75692D646174657069636B65722D646174652D6D617267696E2C20327078293B0D0A20206C696E652D6865696768743A207661';
wwv_flow_api.g_varchar2_table(620) := '72282D2D6A75692D646174657069636B65722D646174652D73697A652C2034387078293B0D0A2020626F726465722D7261646975733A20766172282D2D6A75692D646174657069636B65722D646174652D626F726465722D7261646975732C2031303025';
wwv_flow_api.g_varchar2_table(621) := '293B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D6A75692D646174657069636B65722D646174652D6261636B67726F756E642D636F6C6F722C207472616E73706172656E74293B0D0A2020636F6C6F723A20766172282D2D6A75';
wwv_flow_api.g_varchar2_table(622) := '692D646174657069636B65722D646174652D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F7229293B0D0A20207472616E736974696F6E3A20766172282D2D6A75692D646174657069636B65';
wwv_flow_api.g_varchar2_table(623) := '722D646174652D7472616E736974696F6E2C206261636B67726F756E642D636F6C6F7220302E31732C20636F6C6F7220302E3173293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E6461722074643A666F637573207B0D0A20206F7574';
wwv_flow_api.g_varchar2_table(624) := '6C696E653A20303B0D0A2020626F782D736861646F773A20766172282D2D6A75692D646174657069636B65722D646174652D666F6375732D626F782D736861646F772C2033352030203020317078202330303736646620696E7365742C20302030203170';
wwv_flow_api.g_varchar2_table(625) := '7820327078207267626128302C203131382C203232332C20302E323529292021696D706F7274616E743B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E64617220746420612E6F6A2D73656C65637465642C0D0A2E6F6A2D646174657069';
wwv_flow_api.g_varchar2_table(626) := '636B65722D63616C656E6461722074642E6F6A2D646174657069636B65722D746F64617920612E6F6A2D73656C6563746564207B0D0A20202D2D6A75692D646174657069636B65722D646174652D6261636B67726F756E642D636F6C6F723A2076617228';
wwv_flow_api.g_varchar2_table(627) := '2D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D6A75692D646174657069636B65722D646174652D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D636F6E7472617374293B0D0A2020666F6E742D77';
wwv_flow_api.g_varchar2_table(628) := '65696768743A20766172282D2D6A75692D646174657069636B65722D73656C65637465642D666F6E742D7765696768742C20373030293B0D0A2020666F6E742D73697A653A20766172282D2D6A75692D646174657069636B65722D6163746976652D666F';
wwv_flow_api.g_varchar2_table(629) := '6E742D73697A652C2031347078293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E646172202E6F6A2D656E61626C65642E6F6A2D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D6A75692D6461';
wwv_flow_api.g_varchar2_table(630) := '74657069636B65722D686F7665722D6261636B67726F756E642D636F6C6F722C2023653865386538293B0D0A2020636F6C6F723A20766172282D2D6A75692D646174657069636B65722D686F7665722D636F6C6F722C20626C61636B293B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(631) := '6F6A2D646174657069636B65722D63616C656E646172202E6F6A2D646174657069636B65722D6E6578742D69636F6E3A6E6F74282E6F6A2D64697361626C6564292E6F6A2D686F7665722C0D0A2E6F6A2D646174657069636B65722D63616C656E646172';
wwv_flow_api.g_varchar2_table(632) := '202E6F6A2D646174657069636B65722D707265762D69636F6E3A6E6F74282E6F6A2D64697361626C6564292E6F6A2D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D6A75692D646174657069636B65722D686F76';
wwv_flow_api.g_varchar2_table(633) := '65722D6261636B67726F756E642D636F6C6F722C2023653865386538293B0D0A2020636F6C6F723A20766172282D2D6A75692D646174657069636B65722D686F7665722D636F6C6F722C20626C61636B293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D';
wwv_flow_api.g_varchar2_table(634) := '75742D626173652D66696C7465723A20696E766572742831293B0D0A7D0D0A0D0A';
null;
end;
/
begin
wwv_flow_api.create_theme_file(
 p_id=>wwv_flow_api.id(25680451937623499050)
,p_theme_id=>42
,p_file_name=>'14916057201954491730.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764759901484568675)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764760342173568675)
,p_theme_id=>42
,p_name=>'ICON_HOVER_ANIMATION'
,p_display_name=>'Icon Hover Animation'
,p_display_sequence=>55
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764760754347568676)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764761126357568676)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764761506335568676)
,p_theme_id=>42
,p_name=>'SPACING_BOTTOM'
,p_display_name=>'Spacing Bottom'
,p_display_sequence=>100
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the bottom of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764761902563568677)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764762325799568677)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764762705629568677)
,p_theme_id=>42
,p_name=>'SPACING_TOP'
,p_display_name=>'Spacing Top'
,p_display_sequence=>90
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the top of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764763115718568678)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764763573442568678)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764763986654568678)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764764352021568678)
,p_theme_id=>42
,p_name=>'BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the bottom margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764764731785568679)
,p_theme_id=>42
,p_name=>'ITEM_POST_TEXT'
,p_display_name=>'Item Post Text'
,p_display_sequence=>30
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Post Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764765112699568679)
,p_theme_id=>42
,p_name=>'ITEM_PRE_TEXT'
,p_display_name=>'Item Pre Text'
,p_display_sequence=>20
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Pre Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764765500981568679)
,p_theme_id=>42
,p_name=>'LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the left margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764765910699568680)
,p_theme_id=>42
,p_name=>'PRESERVE_LABEL_SPACING'
,p_display_name=>'Preserve Label Spacing'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_help_text=>'Preserves the label space and enables use of the Label Column Span property.'
,p_null_text=>'Yes'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764766339126568680)
,p_theme_id=>42
,p_name=>'RADIO_GROUP_DISPLAY'
,p_display_name=>'Item Group Display'
,p_display_sequence=>300
,p_template_types=>'FIELD'
,p_help_text=>'Determines the display style for radio and check box items.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764766778992568680)
,p_theme_id=>42
,p_name=>'REQUIRED_INDICATOR'
,p_display_name=>'Required Indicator'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764767132057568681)
,p_theme_id=>42
,p_name=>'RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'FIELD'
,p_help_text=>'Set the right margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764767656777568681)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764768069106568681)
,p_theme_id=>42
,p_name=>'TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'FIELD'
,p_help_text=>'Set the top margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764768412700568681)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>80
,p_template_types=>'LIST'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764768827038568682)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764769269858568682)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764769669070568682)
,p_theme_id=>42
,p_name=>'COLLAPSE_STYLE'
,p_display_name=>'Collapse Mode'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764770041625568683)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764770469109568683)
,p_theme_id=>42
,p_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_sequence=>90
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a desktop-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764770815454568683)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764771248020568684)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764771644200568684)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'LIST'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764772014848568684)
,p_theme_id=>42
,p_name=>'ICON_STYLE'
,p_display_name=>'Icon Style'
,p_display_sequence=>35
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764772444088568684)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764772829576568685)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764773271913568685)
,p_theme_id=>42
,p_name=>'MOBILE'
,p_display_name=>'Mobile'
,p_display_sequence=>100
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a mobile-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764773645875568685)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764774051946568686)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764774437219568686)
,p_theme_id=>42
,p_name=>'CONTENT_PADDING'
,p_display_name=>'Content Padding'
,p_display_sequence=>1
,p_template_types=>'PAGE'
,p_help_text=>'Sets the Content Body padding for the page.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764774884355568686)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'PAGE'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764775258800568687)
,p_theme_id=>42
,p_name=>'DISPLAY_MODE'
,p_display_name=>'Display Mode'
,p_display_sequence=>30
,p_template_types=>'PAGE'
,p_help_text=>'Determines the default display appearance and positioning of the dialog. The default opens a floating dialog position at the center of the screen.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764775612193568687)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND'
,p_display_name=>'Page Background'
,p_display_sequence=>20
,p_template_types=>'PAGE'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764776083864568687)
,p_theme_id=>42
,p_name=>'PAGE_LAYOUT'
,p_display_name=>'Page Layout'
,p_display_sequence=>10
,p_template_types=>'PAGE'
,p_null_text=>'Floating (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764776446473568687)
,p_theme_id=>42
,p_name=>'PAGE_POSITION'
,p_display_name=>'Position'
,p_display_sequence=>1
,p_template_types=>'PAGE'
,p_help_text=>'Sets the position of the page.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764776816071568688)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764777253127568688)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764777657155568688)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764778054254568689)
,p_theme_id=>42
,p_name=>'ALERT_TITLE'
,p_display_name=>'Alert Title'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the title of the alert is displayed.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764778425900568689)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764778830629568689)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764779251958568690)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764779669642568690)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764780007896568690)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764780430887568690)
,p_theme_id=>42
,p_name=>'BODY_STYLE'
,p_display_name=>'Body Style'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the region''s body container.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764780832048568691)
,p_theme_id=>42
,p_name=>'CALLOUT_POSITION'
,p_display_name=>'Callout Position'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Determines where the callout for the popup will be positioned relative to its parent.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764781297561568691)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_BUTTON_ICONS'
,p_display_name=>'Collapsible Button Icons'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines which arrows to use to represent the icons for the collapse and expand button.'
,p_null_text=>'Arrows'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764781617088568692)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_ICON_POSITION'
,p_display_name=>'Collapsible Icon Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the position of the expand and collapse toggle for the region.'
,p_null_text=>'Start'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764782000591568692)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764782465810568692)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764782878149568692)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON'
,p_display_name=>'Display Icon'
,p_display_sequence=>50
,p_template_types=>'REGION'
,p_help_text=>'Display the Hero Region icon.'
,p_null_text=>'Yes (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764783202705568693)
,p_theme_id=>42
,p_name=>'DISPLAY_MODE'
,p_display_name=>'Display Mode'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the default display appearance and positioning of the dialog. The default opens a floating dialog position at the center of the screen.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764783678472568693)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764784089978568693)
,p_theme_id=>42
,p_name=>'HEADING_FONT'
,p_display_name=>'Heading Font'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the font-family of the heading for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764784408246568694)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764784852059568694)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764785293798568694)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REGION'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Rounded Corners'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764785675631568695)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Spacing'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764786061004568695)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764786492218568695)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764786812566568695)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764787217792568696)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764787675727568696)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764788058025568696)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER'
,p_display_name=>'Login Header'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the Login region header.'
,p_null_text=>'Icon and Title (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764788480601568697)
,p_theme_id=>42
,p_name=>'REGION_BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>210
,p_template_types=>'REGION'
,p_help_text=>'Set the bottom margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764788810637568697)
,p_theme_id=>42
,p_name=>'REGION_LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'REGION'
,p_help_text=>'Set the left margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764789261307568697)
,p_theme_id=>42
,p_name=>'REGION_POSITION'
,p_display_name=>'Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764789658247568697)
,p_theme_id=>42
,p_name=>'REGION_RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'REGION'
,p_help_text=>'Set the right margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764790060831568698)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764790415333568698)
,p_theme_id=>42
,p_name=>'REGION_TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'REGION'
,p_help_text=>'Set the top margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764790874970568698)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764791247811568699)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764791608547568699)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764792052409568699)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764792490499568700)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764792825841568700)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>70
,p_template_types=>'REPORT'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764793297897568700)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764793675259568700)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764794007630568701)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764794404751568701)
,p_theme_id=>42
,p_name=>'COL_ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>150
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764794856961568701)
,p_theme_id=>42
,p_name=>'COL_CONTENT_DESCRIPTION'
,p_display_name=>'Description'
,p_display_sequence=>130
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764795228442568702)
,p_theme_id=>42
,p_name=>'COL_CONTENT_TITLE'
,p_display_name=>'Title'
,p_display_sequence=>120
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764795669471568702)
,p_theme_id=>42
,p_name=>'COL_ICON'
,p_display_name=>'Icon'
,p_display_sequence=>110
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764796060686568702)
,p_theme_id=>42
,p_name=>'COL_MISC'
,p_display_name=>'Misc'
,p_display_sequence=>140
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764796464692568702)
,p_theme_id=>42
,p_name=>'COL_SELECTION'
,p_display_name=>'Selection'
,p_display_sequence=>100
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764796876821568703)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764797203203568703)
,p_theme_id=>42
,p_name=>'CONTENT_ALIGNMENT'
,p_display_name=>'Content Alignment'
,p_display_sequence=>90
,p_template_types=>'REPORT'
,p_null_text=>'Center (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764797632008568703)
,p_theme_id=>42
,p_name=>'DISPLAY_ITEMS'
,p_display_name=>'Display Items'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_null_text=>'Inline (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764798097163568704)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS'
,p_display_name=>'Display Labels'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_null_text=>'Inline (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764798430726568704)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764798844622568704)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REPORT'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764799277504568704)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764799615712568705)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764800045261568705)
,p_theme_id=>42
,p_name=>'PAGINATION_DISPLAY'
,p_display_name=>'Pagination Display'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of pagination for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764800402147568705)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764800883029568706)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764801212571568706)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>35
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(10764801625203568706)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the overall style for the component.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764825076024568735)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_api.id(10764763573442568678)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764825840317568737)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_LINK'
,p_display_name=>'Display as Link'
,p_display_sequence=>30
,p_css_classes=>'t-Button--link'
,p_group_id=>wwv_flow_api.id(10764763115718568678)
,p_template_types=>'BUTTON'
,p_help_text=>'This option makes the button appear as a text link.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764826565625568738)
,p_theme_id=>42
,p_name=>'FBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(10764764352021568678)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764827283610568739)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_PILL_BUTTON'
,p_display_name=>'Display as Pill Button'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--radioButtonGroup'
,p_group_id=>wwv_flow_api.id(10764766339126568680)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the radio buttons to look like a button set / pill button.  Note that the the radio buttons must all be in the same row for this option to work.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764827927842568740)
,p_theme_id=>42
,p_name=>'FBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(10764764352021568678)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764828650855568740)
,p_theme_id=>42
,p_name=>'FBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(10764764352021568678)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764829314214568741)
,p_theme_id=>42
,p_name=>'FBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(10764764352021568678)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764830066781568742)
,p_theme_id=>42
,p_name=>'FLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(10764765500981568679)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764830756756568742)
,p_theme_id=>42
,p_name=>'FLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(10764765500981568679)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764831467903568743)
,p_theme_id=>42
,p_name=>'FLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(10764765500981568679)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764832102653568744)
,p_theme_id=>42
,p_name=>'FLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(10764765500981568679)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764832883408568745)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_api.id(10764786061004568695)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764833570439568746)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(10764786812566568695)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764834245320568746)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'None'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_api.id(10764785675631568695)
,p_template_types=>'REGION'
,p_help_text=>'Removes spacing between items.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764834906954568747)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_api.id(10764786061004568695)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764835642304568748)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_api.id(10764785675631568695)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item spacing.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764836362421568748)
,p_theme_id=>42
,p_name=>'FORMSTANDARDPADDING'
,p_display_name=>'Standard'
,p_display_sequence=>5
,p_css_classes=>'t-Form--standardPadding'
,p_group_id=>wwv_flow_api.id(10764785675631568695)
,p_template_types=>'REGION'
,p_help_text=>'Uses the standard spacing between items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764837081543568749)
,p_theme_id=>42
,p_name=>'FRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(10764767132057568681)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764837754939568750)
,p_theme_id=>42
,p_name=>'FRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(10764767132057568681)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764838467996568750)
,p_theme_id=>42
,p_name=>'FRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(10764767132057568681)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764839108552568751)
,p_theme_id=>42
,p_name=>'FRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(10764767132057568681)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764839864905568752)
,p_theme_id=>42
,p_name=>'FTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(10764768069106568681)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764840535885568752)
,p_theme_id=>42
,p_name=>'FTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(10764768069106568681)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764841224177568753)
,p_theme_id=>42
,p_name=>'FTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(10764768069106568681)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764841980724568754)
,p_theme_id=>42
,p_name=>'FTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(10764768069106568681)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764842625365568754)
,p_theme_id=>42
,p_name=>'H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_api.id(10764784408246568694)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764843327439568755)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_api.id(10764784408246568694)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764844059632568756)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_api.id(10764784408246568694)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764844747430568756)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_api.id(10764784408246568694)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764845488498568757)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_api.id(10764784408246568694)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764846131818568758)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_api.id(10764784408246568694)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764847008152568759)
,p_theme_id=>42
,p_name=>'HIDE_WHEN_ALL_ROWS_DISPLAYED'
,p_display_name=>'Hide when all rows displayed'
,p_display_sequence=>10
,p_css_classes=>'t-Report--hideNoPagination'
,p_group_id=>wwv_flow_api.id(10764800045261568705)
,p_template_types=>'REPORT'
,p_help_text=>'This option will hide the pagination when all rows are displayed.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764847732706568760)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_api.id(10764761126357568676)
,p_template_types=>'BUTTON'
,p_help_text=>'A large button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764848491243568762)
,p_theme_id=>42
,p_name=>'LARGEBOTTOMMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapBottom'
,p_group_id=>wwv_flow_api.id(10764761506335568676)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764849144193568762)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(10764761902563568677)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764849802613568763)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_api.id(10764762325799568677)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764850563020568764)
,p_theme_id=>42
,p_name=>'LARGETOPMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapTop'
,p_group_id=>wwv_flow_api.id(10764762705629568677)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764851244975568765)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_api.id(10764763115718568678)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764851955273568766)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_api.id(10764759901484568675)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764852624306568766)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(10764759901484568675)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764853351117568767)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_api.id(10764759901484568675)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764854081492568768)
,p_theme_id=>42
,p_name=>'POST_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--postTextBlock'
,p_group_id=>wwv_flow_api.id(10764764731785568679)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Post Text in a block style immediately after the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764854745969568769)
,p_theme_id=>42
,p_name=>'PRE_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--preTextBlock'
,p_group_id=>wwv_flow_api.id(10764765112699568679)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Pre Text in a block style immediately before the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764855492277568771)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_api.id(10764763573442568678)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764856181619568772)
,p_theme_id=>42
,p_name=>'REMOVE_PADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>1
,p_css_classes=>'t-PageBody--noContentPadding'
,p_group_id=>wwv_flow_api.id(10764774437219568686)
,p_template_types=>'PAGE'
,p_help_text=>'Removes padding from the content region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764856840195568773)
,p_theme_id=>42
,p_name=>'RLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(10764788810637568697)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764857529075568774)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_api.id(10764767656777568681)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764858206333568774)
,p_theme_id=>42
,p_name=>'RBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(10764788480601568697)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764858979745568775)
,p_theme_id=>42
,p_name=>'RBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(10764788480601568697)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764859649922568776)
,p_theme_id=>42
,p_name=>'RBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(10764788480601568697)
,p_template_types=>'REGION'
,p_help_text=>'Removes the bottom margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764860334333568776)
,p_theme_id=>42
,p_name=>'RBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(10764788480601568697)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764861124214568777)
,p_theme_id=>42
,p_name=>'RLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(10764788810637568697)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764861812712568778)
,p_theme_id=>42
,p_name=>'RLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(10764788810637568697)
,p_template_types=>'REGION'
,p_help_text=>'Removes the left margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764862525424568778)
,p_theme_id=>42
,p_name=>'RLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(10764788810637568697)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small left margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764863272923568779)
,p_theme_id=>42
,p_name=>'RRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(10764789658247568697)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764863923330568780)
,p_theme_id=>42
,p_name=>'RRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(10764789658247568697)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764864657173568780)
,p_theme_id=>42
,p_name=>'RRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(10764789658247568697)
,p_template_types=>'REGION'
,p_help_text=>'Removes the right margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764865490418568781)
,p_theme_id=>42
,p_name=>'RRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(10764789658247568697)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764866124360568782)
,p_theme_id=>42
,p_name=>'RTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(10764790415333568698)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764866889039568783)
,p_theme_id=>42
,p_name=>'RTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(10764790415333568698)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764867545918568783)
,p_theme_id=>42
,p_name=>'RTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(10764790415333568698)
,p_template_types=>'REGION'
,p_help_text=>'Removes the top margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764868233862568784)
,p_theme_id=>42
,p_name=>'RTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(10764790415333568698)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764868984347568784)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(10764787217792568696)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764869673013568785)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_api.id(10764763115718568678)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764870300790568786)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_api.id(10764761126357568676)
,p_template_types=>'BUTTON'
,p_help_text=>'A small button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764871063064568786)
,p_theme_id=>42
,p_name=>'SMALLBOTTOMMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padBottom'
,p_group_id=>wwv_flow_api.id(10764761506335568676)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764871789437568787)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_api.id(10764761902563568677)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764872415180568787)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_api.id(10764762325799568677)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764873143902568788)
,p_theme_id=>42
,p_name=>'SMALLTOPMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padTop'
,p_group_id=>wwv_flow_api.id(10764762705629568677)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764873894509568789)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_api.id(10764763986654568678)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764874602047568789)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_api.id(10764786492218568695)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764875076333568790)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764875892075568791)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_api.id(10764763573442568678)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764876532884568792)
,p_theme_id=>42
,p_name=>'TINY'
,p_display_name=>'Tiny'
,p_display_sequence=>10
,p_css_classes=>'t-Button--tiny'
,p_group_id=>wwv_flow_api.id(10764761126357568676)
,p_template_types=>'BUTTON'
,p_help_text=>'A very small button.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764877291386568793)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_api.id(10764763573442568678)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764877974221568794)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_api.id(10764767656777568681)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764951802497568900)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_page_template_id=>wwv_flow_api.id(10764947309376568887)
,p_css_classes=>'js-dialog-class-t-Drawer--lg'
,p_group_id=>wwv_flow_api.id(10764774884355568686)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764952262564568900)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(10764947309376568887)
,p_css_classes=>'js-dialog-class-t-Drawer--md'
,p_group_id=>wwv_flow_api.id(10764774884355568686)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764952657870568900)
,p_theme_id=>42
,p_name=>'POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(10764947309376568887)
,p_css_classes=>'js-dialog-class-t-Drawer--pullOutEnd'
,p_group_id=>wwv_flow_api.id(10764776446473568687)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764953008901568901)
,p_theme_id=>42
,p_name=>'POSITION_START'
,p_display_name=>'Start'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_api.id(10764947309376568887)
,p_css_classes=>'js-dialog-class-t-Drawer--pullOutStart'
,p_group_id=>wwv_flow_api.id(10764776446473568687)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764953449783568901)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_api.id(10764947309376568887)
,p_css_classes=>'js-dialog-class-t-Drawer--sm'
,p_group_id=>wwv_flow_api.id(10764774884355568686)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764953878781568901)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_EXTRA_LARGE'
,p_display_name=>'Extra Large'
,p_display_sequence=>40
,p_page_template_id=>wwv_flow_api.id(10764947309376568887)
,p_css_classes=>'js-dialog-class-t-Drawer--xl'
,p_group_id=>wwv_flow_api.id(10764774884355568686)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10764954267720568902)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(10764947309376568887)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10765066069129569035)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(25680188415988493771)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_api.id(10764782465810568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10765152435264569128)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(10765147952252569121)
,p_css_classes=>'js-dialog-class-t-Drawer--lg'
,p_group_id=>wwv_flow_api.id(10764782465810568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10765152860441569129)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(10765147952252569121)
,p_css_classes=>'js-dialog-class-t-Drawer--md'
,p_group_id=>wwv_flow_api.id(10764782465810568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10765153266479569129)
,p_theme_id=>42
,p_name=>'POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(10765147952252569121)
,p_css_classes=>'js-dialog-class-t-Drawer--pullOutEnd'
,p_group_id=>wwv_flow_api.id(10764789261307568697)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10765153604841569130)
,p_theme_id=>42
,p_name=>'POSITION_START'
,p_display_name=>'Start'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(10765147952252569121)
,p_css_classes=>'js-dialog-class-t-Drawer--pullOutStart'
,p_group_id=>wwv_flow_api.id(10764789261307568697)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10765154042499569130)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(10765147952252569121)
,p_css_classes=>'js-dialog-class-t-Drawer--sm'
,p_group_id=>wwv_flow_api.id(10764782465810568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10765154422497569131)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_EXTRA_LARGE'
,p_display_name=>'Extra Large'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(10765147952252569121)
,p_css_classes=>'js-dialog-class-t-Drawer--xl'
,p_group_id=>wwv_flow_api.id(10764782465810568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10765154870756569131)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None (Auto)'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(10765147952252569121)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_api.id(10764782465810568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10765155294652569131)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(10765147952252569121)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10765155609005569133)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(10765147952252569121)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(10765276368877569346)
,p_theme_id=>42
,p_name=>'HIDE_ICON_ON_DESKTOP'
,p_display_name=>'Hide Icon on Desktop'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(25680256147431493879)
,p_css_classes=>'t-Button--desktopHideIcon'
,p_template_types=>'BUTTON'
,p_help_text=>'This template options hides the button icon on large screens.'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680135868450493699)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(25680133132341493680)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680138906670493703)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(25680135917086493699)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680141484725493705)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(25680139082823493703)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680144396596493709)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(25680141581320493705)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680146842863493712)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(25680144433759493709)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680148160698493713)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(25680146979333493712)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680148370699493714)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_api.id(25680146979333493712)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680149868310493717)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_1'
,p_display_name=>'Background 1'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_api.id(25680148454811493714)
,p_css_classes=>'t-LoginPage--bg1'
,p_group_id=>wwv_flow_api.id(10764775612193568687)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680150087942493718)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_2'
,p_display_name=>'Background 2'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(25680148454811493714)
,p_css_classes=>'t-LoginPage--bg2'
,p_group_id=>wwv_flow_api.id(10764775612193568687)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680150285641493718)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_3'
,p_display_name=>'Background 3'
,p_display_sequence=>30
,p_page_template_id=>wwv_flow_api.id(25680148454811493714)
,p_css_classes=>'t-LoginPage--bg3'
,p_group_id=>wwv_flow_api.id(10764775612193568687)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680150678808493718)
,p_theme_id=>42
,p_name=>'PAGE_LAYOUT_SPLIT'
,p_display_name=>'Split'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(25680148454811493714)
,p_css_classes=>'t-LoginPage--split'
,p_group_id=>wwv_flow_api.id(10764776083864568687)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680153757924493722)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(25680150731836493719)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680155073098493725)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(25680153856093493722)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680155246621493725)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(25680153856093493722)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680155985981493734)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(25680155363231493726)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680156310225493735)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680155363231493726)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_api.id(10764778425900568689)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680156726602493736)
,p_theme_id=>42
,p_name=>'HIDDENHEADER'
,p_display_name=>'Hidden but Accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680155363231493726)
,p_css_classes=>'t-Alert--accessibleHeading'
,p_group_id=>wwv_flow_api.id(10764778054254568689)
,p_template_types=>'REGION'
,p_help_text=>'Visually hides the alert title, but assistive technologies can still read it.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680156948050493736)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680155363231493726)
,p_css_classes=>'t-Alert--removeHeading js-removeLandmark'
,p_group_id=>wwv_flow_api.id(10764778054254568689)
,p_template_types=>'REGION'
,p_help_text=>'Hides the Alert Title from being displayed.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680157362077493736)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680155363231493726)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_api.id(10764777657155568688)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680157703442493737)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680155363231493726)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(10764777253127568688)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680157907952493737)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680155363231493726)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_api.id(10764778425900568689)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680158132768493737)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680155363231493726)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_api.id(10764777657155568688)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680158336604493737)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(25680155363231493726)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_api.id(10764778425900568689)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680158524230493737)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680155363231493726)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_api.id(10764777657155568688)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680158726354493737)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680155363231493726)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_api.id(10764778425900568689)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680158900548493738)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680155363231493726)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_api.id(10764777253127568688)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680161122610493740)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(25680160044196493739)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680161500710493741)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_api.id(25680160044196493739)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(10764780007896568690)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680161764512493741)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_api.id(25680160044196493739)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680161932475493741)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(25680160044196493739)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(10764780007896568690)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680162155088493741)
,p_theme_id=>42
,p_name=>'STICK_TO_BOTTOM'
,p_display_name=>'Stick to Bottom for Mobile'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680160044196493739)
,p_css_classes=>'t-ButtonRegion--stickToBottom'
,p_template_types=>'REGION'
,p_help_text=>'This will position the button container region to the bottom of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680162537187493742)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(25680162295480493741)
,p_css_classes=>'u-colors'
,p_template_types=>'REGION'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680162740656493742)
,p_theme_id=>42
,p_name=>'STYLE_A'
,p_display_name=>'Style A'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680162295480493741)
,p_css_classes=>'t-CardsRegion--styleA'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680162967802493742)
,p_theme_id=>42
,p_name=>'STYLE_B'
,p_display_name=>'Style B'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680162295480493741)
,p_css_classes=>'t-CardsRegion--styleB'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680163169643493742)
,p_theme_id=>42
,p_name=>'STYLE_C'
,p_display_name=>'Style C'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680162295480493741)
,p_css_classes=>'t-CardsRegion--styleC'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680164430873493744)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_api.id(10764792052409568699)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680164659443493745)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_api.id(10764792052409568699)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680164822515493745)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_api.id(10764792052409568699)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680165205914493746)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(10764779251958568690)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680165403902493746)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(10764779251958568690)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680165684373493746)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(10764779251958568690)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680165843616493747)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_api.id(10764792052409568699)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680165998854493747)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(10764779251958568690)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680166475700493747)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680166604068493747)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680166870441493748)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680167016808493748)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680167231540493748)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680167664585493748)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(10764783678472568693)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680168017572493748)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(10764779669642568690)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680168283534493749)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(10764783678472568693)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680168456451493749)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680168665711493750)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680168859501493750)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680169269246493750)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_api.id(10764778830629568689)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680169401162493750)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680169670593493750)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(10764779669642568690)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680169803792493750)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680170026550493751)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_api.id(10764778830629568689)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680170220637493751)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680170469422493751)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680163202257493742)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680170826972493751)
,p_theme_id=>42
,p_name=>'ADD_BODY_PADDING'
,p_display_name=>'Add Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680170526868493751)
,p_css_classes=>'t-ContentBlock--padded'
,p_template_types=>'REGION'
,p_help_text=>'Adds padding to the region''s body container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680171258806493752)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H1'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680170526868493751)
,p_css_classes=>'t-ContentBlock--h1'
,p_group_id=>wwv_flow_api.id(10764790060831568698)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680171414785493752)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H2'
,p_display_name=>'Medium'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680170526868493751)
,p_css_classes=>'t-ContentBlock--h2'
,p_group_id=>wwv_flow_api.id(10764790060831568698)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680171661414493752)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H3'
,p_display_name=>'Small'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680170526868493751)
,p_css_classes=>'t-ContentBlock--h3'
,p_group_id=>wwv_flow_api.id(10764790060831568698)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680172017262493753)
,p_theme_id=>42
,p_name=>'HEADING_FONT_ALTERNATIVE'
,p_display_name=>'Alternative'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(25680170526868493751)
,p_css_classes=>'t-ContentBlock--headingFontAlt'
,p_group_id=>wwv_flow_api.id(10764784089978568693)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680172495319493753)
,p_theme_id=>42
,p_name=>'LIGHT_BACKGROUND'
,p_display_name=>'Light Background'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680170526868493751)
,p_css_classes=>'t-ContentBlock--lightBG'
,p_group_id=>wwv_flow_api.id(10764780430887568690)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly lighter background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680172644875493753)
,p_theme_id=>42
,p_name=>'SHADOW_BACKGROUND'
,p_display_name=>'Shadow Background'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680170526868493751)
,p_css_classes=>'t-ContentBlock--shadowBG'
,p_group_id=>wwv_flow_api.id(10764780430887568690)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly darker background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680172837057493753)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680170526868493751)
,p_css_classes=>'t-ContentBlock--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680173703615493754)
,p_theme_id=>42
,p_name=>'ABOVE'
,p_display_name=>'Above'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680172898635493753)
,p_css_classes=>'js-popup-pos-above'
,p_group_id=>wwv_flow_api.id(10764780832048568691)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout above or typically on top of the parent.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680173953259493755)
,p_theme_id=>42
,p_name=>'AFTER'
,p_display_name=>'After'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680172898635493753)
,p_css_classes=>'js-popup-pos-after'
,p_group_id=>wwv_flow_api.id(10764780832048568691)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout after or typically to the right of the parent.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680174150713493755)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(25680172898635493753)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680174317278493755)
,p_theme_id=>42
,p_name=>'BEFORE'
,p_display_name=>'Before'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680172898635493753)
,p_css_classes=>'js-popup-pos-before'
,p_group_id=>wwv_flow_api.id(10764780832048568691)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout before or typically to the left of the parent.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680174593111493755)
,p_theme_id=>42
,p_name=>'BELOW'
,p_display_name=>'Below'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(25680172898635493753)
,p_css_classes=>'js-popup-pos-below'
,p_group_id=>wwv_flow_api.id(10764780832048568691)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout below or typically to the bottom of the parent.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680174786771493756)
,p_theme_id=>42
,p_name=>'DISPLAY_POPUP_CALLOUT'
,p_display_name=>'Display Popup Callout'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(25680172898635493753)
,p_css_classes=>'js-popup-callout'
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add display a callout for the popup. Note that callout will only be displayed if the data-parent-element custom attribute is defined.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680174898916493756)
,p_theme_id=>42
,p_name=>'INSIDE'
,p_display_name=>'Inside'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(25680172898635493753)
,p_css_classes=>'js-popup-pos-inside'
,p_group_id=>wwv_flow_api.id(10764780832048568691)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout inside of the parent. This is useful when the parent is sufficiently large, such as a report or large region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680175346467493756)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680172898635493753)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(10764782465810568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680175580006493756)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680172898635493753)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(10764782465810568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680175760889493756)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(25680172898635493753)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_api.id(10764782465810568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680175988076493757)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680172898635493753)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680176191383493757)
,p_theme_id=>42
,p_name=>'REMOVE_PAGE_OVERLAY'
,p_display_name=>'Remove Page Overlay'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680172898635493753)
,p_css_classes=>'js-popup-noOverlay'
,p_template_types=>'REGION'
,p_help_text=>'This option will display the inline dialog without an overlay on the background.'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680176381243493757)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680172898635493753)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(10764782465810568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680176728635493758)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680176452434493757)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680176916210493759)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680176452434493757)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680177878684493760)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER_ICON'
,p_display_name=>'Icon'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680177063070493759)
,p_css_classes=>'t-Login-region--headerIcon'
,p_group_id=>wwv_flow_api.id(10764788058025568696)
,p_template_types=>'REGION'
,p_help_text=>'Displays only the Region Icon in the Login region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680178096713493760)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER_TITLE'
,p_display_name=>'Title'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680177063070493759)
,p_css_classes=>'t-Login-region--headerTitle js-removeLandmark'
,p_group_id=>wwv_flow_api.id(10764788058025568696)
,p_template_types=>'REGION'
,p_help_text=>'Displays only the Region Title in the Login region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680178274697493760)
,p_theme_id=>42
,p_name=>'LOGO_HEADER_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680177063070493759)
,p_css_classes=>'t-Login-region--headerHidden js-removeLandmark'
,p_group_id=>wwv_flow_api.id(10764788058025568696)
,p_template_types=>'REGION'
,p_help_text=>'Hides both the Region Icon and Title from the Login region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680179292221493762)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(10764779251958568690)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680179549503493762)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(10764779251958568690)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680179765213493762)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(10764779251958568690)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680180040542493762)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(10764779251958568690)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680180265820493763)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680180478104493763)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680180625908493763)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680180816140493763)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680181064375493763)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680181271112493764)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680181470952493764)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680181616719493764)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680181848238493764)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680182029592493764)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680182240650493765)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680182433126493765)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680182614052493765)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680182880944493765)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680183055608493765)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680183491331493766)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(10764782000591568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680183804865493766)
,p_theme_id=>42
,p_name=>'CONRTOLS_POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--controlsPosEnd'
,p_group_id=>wwv_flow_api.id(10764781617088568692)
,p_template_types=>'REGION'
,p_help_text=>'Position the expand / collapse button to the end of the region header.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680184001291493767)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(10764782000591568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680184285887493767)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(10764779669642568690)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680184639058493767)
,p_theme_id=>42
,p_name=>'ICONS_PLUS_OR_MINUS'
,p_display_name=>'Plus or Minus'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--hideShowIconsMath'
,p_group_id=>wwv_flow_api.id(10764781297561568691)
,p_template_types=>'REGION'
,p_help_text=>'Use the plus and minus icons for the expand and collapse button.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680184819984493768)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680185063377493768)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680185366657493768)
,p_theme_id=>42
,p_name=>'REMEMBER_COLLAPSIBLE_STATE'
,p_display_name=>'Remember Collapsible State'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
,p_help_text=>'This option saves the current state of the collapsible region for the duration of the session.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680185526372493768)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680185760069493768)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(10764779669642568690)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680185938407493768)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680178334212493760)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680186821444493770)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON_NO'
,p_display_name=>'No'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680186090818493769)
,p_css_classes=>'t-HeroRegion--hideIcon'
,p_group_id=>wwv_flow_api.id(10764782878149568692)
,p_template_types=>'REGION'
,p_help_text=>'Hide the Hero Region icon.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680187053997493770)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680186090818493769)
,p_css_classes=>'t-HeroRegion--featured'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680187289240493770)
,p_theme_id=>42
,p_name=>'HEADING_FONT_ALTERNATIVE'
,p_display_name=>'Alternative'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(25680186090818493769)
,p_css_classes=>'t-HeroRegion--headingFontAlt'
,p_group_id=>wwv_flow_api.id(10764784089978568693)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680187625727493770)
,p_theme_id=>42
,p_name=>'ICONS_CIRCULAR'
,p_display_name=>'Circle'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680186090818493769)
,p_css_classes=>'t-HeroRegion--iconsCircle'
,p_group_id=>wwv_flow_api.id(10764785293798568694)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a circle.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680187805356493770)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680186090818493769)
,p_css_classes=>'t-HeroRegion--iconsSquare'
,p_group_id=>wwv_flow_api.id(10764785293798568694)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a square.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680188185629493771)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680186090818493769)
,p_css_classes=>'t-HeroRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the hero region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680188314138493771)
,p_theme_id=>42
,p_name=>'STACKED_FEATURED'
,p_display_name=>'Stacked Featured'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680186090818493769)
,p_css_classes=>'t-HeroRegion--featured t-HeroRegion--centered'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680189093446493771)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(25680188415988493771)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680189218297493772)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680188415988493771)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680189429897493772)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680188415988493771)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(10764782465810568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680189626601493772)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680188415988493771)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(10764782465810568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680189837309493772)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680188415988493771)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680190048798493772)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(25680188415988493771)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680190296129493773)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680188415988493771)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680190398844493773)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680188415988493771)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(10764782465810568692)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680191474963493774)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(10764779251958568690)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680191692584493774)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(10764779251958568690)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680191798219493774)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(10764779251958568690)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680192088498493774)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(10764779251958568690)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680192202894493775)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680192441652493775)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680192661738493776)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680192849710493776)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680193078330493776)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680193234564493776)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680193451241493776)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680193629484493776)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680193879497493777)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680194019645493777)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680194230909493777)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680194398714493777)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680194602234493777)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680194855411493777)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680195004106493778)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_api.id(10764776816071568688)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680195230000493778)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--removeHeader js-removeLandmark'
,p_group_id=>wwv_flow_api.id(10764783678472568693)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680195461947493778)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(10764779669642568690)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680195650618493778)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(10764783678472568693)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680195894369493778)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680196038035493778)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680196254090493779)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680196458302493779)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(10764779669642568690)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680196627584493779)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680196815966493779)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680197051378493779)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680197200567493779)
,p_theme_id=>42
,p_name=>'TEXT_CONTENT'
,p_display_name=>'Text Content'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(25680190568255493773)
,p_css_classes=>'t-Region--textContent'
,p_group_id=>wwv_flow_api.id(10764790874970568698)
,p_template_types=>'REGION'
,p_help_text=>'Useful for displaying primarily text-based content, such as FAQs and more.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680198466866493781)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680197396445493779)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_api.id(10764787675727568696)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680198871237493781)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680197396445493779)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_api.id(10764791608547568699)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680199019059493782)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680197396445493779)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680199270476493782)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680197396445493779)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_api.id(10764791608547568699)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680199670169493782)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680197396445493779)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_api.id(10764791247811568699)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680199854214493782)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680197396445493779)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_api.id(10764791247811568699)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680200249052493783)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(25680199906867493782)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_api.id(10764790060831568698)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680200463210493783)
,p_theme_id=>42
,p_name=>'HEADING_FONT_ALTERNATIVE'
,p_display_name=>'Alternative'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(25680199906867493782)
,p_css_classes=>'t-BreadcrumbRegion--headingFontAlt'
,p_group_id=>wwv_flow_api.id(10764784089978568693)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680200640996493783)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(25680199906867493782)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680200798520493783)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(25680199906867493782)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_api.id(10764790060831568698)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680201065058493784)
,p_theme_id=>42
,p_name=>'USE_COMPACT_STYLE'
,p_display_name=>'Use Compact Style'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680199906867493782)
,p_css_classes=>'t-BreadcrumbRegion--compactTitle'
,p_template_types=>'REGION'
,p_help_text=>'Uses a compact style for the breadcrumbs.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680201959823493784)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(25680201188668493784)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_api.id(10764784852059568694)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680202129698493785)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680201188668493784)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_api.id(10764784852059568694)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680202365368493785)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(25680201188668493784)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680203200657493793)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(10764793297897568700)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680203683745493793)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680203813870493793)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(10764793297897568700)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680204053193493793)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680204247103493793)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(10764793297897568700)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680204468381493794)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680204681459493794)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680204857911493794)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(10764793297897568700)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680205042240493794)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(10764793297897568700)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680205247686493794)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680205694380493794)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(10764801625203568706)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680205869983493795)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680206047898493795)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680206205555493795)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680206456913493795)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(10764801625203568706)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680206675223493795)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680202794185493792)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680207059840493796)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680207405891493796)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(10764793675259568700)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680207679402493797)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680207815328493797)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(10764793675259568700)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680208068530493797)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680208259517493797)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(10764793675259568700)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680208405300493797)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680208627501493798)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(10764801625203568706)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680208869660493798)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(10764801625203568706)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680209236548493798)
,p_theme_id=>42
,p_name=>'CARDS_COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(10764792825841568700)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680209461984493798)
,p_theme_id=>42
,p_name=>'CARD_RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(10764792825841568700)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680209631292493799)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(10764801625203568706)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680210077378493799)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(10764798430726568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680210272905493799)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(10764798430726568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680210444875493799)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680210621353493800)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(10764801625203568706)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680210887603493800)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680211039824493800)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(10764793675259568700)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680211474427493800)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_api.id(10764798844622568704)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680211675024493801)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_api.id(10764798844622568704)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680211825440493801)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680212046280493801)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680206722203493795)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680212646716493802)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680212172366493801)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_api.id(10764796876821568703)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680212829820493802)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680212172366493801)
,p_css_classes=>'t-Comments--iconsRounded'
,p_group_id=>wwv_flow_api.id(10764798844622568704)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680213021581493802)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680212172366493801)
,p_css_classes=>'t-Comments--iconsSquare'
,p_group_id=>wwv_flow_api.id(10764798844622568704)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680213249967493802)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680212172366493801)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_api.id(10764796876821568703)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680213894410493803)
,p_theme_id=>42
,p_name=>'DISPLAY_ITEMS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(25680213319066493803)
,p_css_classes=>'t-ContextualInfo-item--stacked'
,p_group_id=>wwv_flow_api.id(10764797632008568703)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680214225853493804)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(25680213319066493803)
,p_css_classes=>'t-ContextualInfo-label--stacked'
,p_group_id=>wwv_flow_api.id(10764798097163568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680214824918493806)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680214298161493804)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(10764792490499568700)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680215081151493806)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680214298161493804)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_api.id(10764792490499568700)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680215435366493807)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680214298161493804)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(10764800883029568706)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680215814868493807)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680214298161493804)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(10764800402147568705)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680216046287493807)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(25680214298161493804)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_api.id(10764800402147568705)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680216212382493807)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(25680214298161493804)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_api.id(10764800402147568705)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680216409753493808)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680214298161493804)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_api.id(10764800883029568706)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680216623084493808)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680214298161493804)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680216890756493808)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680214298161493804)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(10764800402147568705)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680217622558493811)
,p_theme_id=>42
,p_name=>'ACTIONS_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(25680217152874493810)
,p_css_classes=>'t-ContentRow--hideActions'
,p_group_id=>wwv_flow_api.id(10764794404751568701)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Actions column from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680218075155493812)
,p_theme_id=>42
,p_name=>'ALIGNMENT_TOP'
,p_display_name=>'Top'
,p_display_sequence=>100
,p_report_template_id=>wwv_flow_api.id(25680217152874493810)
,p_css_classes=>'t-ContentRow--alignTop'
,p_group_id=>wwv_flow_api.id(10764797203203568703)
,p_template_types=>'REPORT'
,p_help_text=>'Aligns the content to the top of the row. This is useful when you expect that yours rows will vary in height (e.g. some rows will have longer descriptions than others).'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680218480438493812)
,p_theme_id=>42
,p_name=>'DESCRIPTION_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(25680217152874493810)
,p_css_classes=>'t-ContentRow--hideDescription'
,p_group_id=>wwv_flow_api.id(10764794856961568701)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Description from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680218852284493812)
,p_theme_id=>42
,p_name=>'ICON_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680217152874493810)
,p_css_classes=>'t-ContentRow--hideIcon'
,p_group_id=>wwv_flow_api.id(10764795669471568702)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Icon from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680219229335493813)
,p_theme_id=>42
,p_name=>'MISC_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(25680217152874493810)
,p_css_classes=>'t-ContentRow--hideMisc'
,p_group_id=>wwv_flow_api.id(10764796060686568702)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Misc column from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680219611603493813)
,p_theme_id=>42
,p_name=>'SELECTION_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680217152874493810)
,p_css_classes=>'t-ContentRow--hideSelection'
,p_group_id=>wwv_flow_api.id(10764796464692568702)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Selection column from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680219869205493813)
,p_theme_id=>42
,p_name=>'STYLE_COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(25680217152874493810)
,p_css_classes=>'t-ContentRow--styleCompact'
,p_group_id=>wwv_flow_api.id(10764801625203568706)
,p_template_types=>'REPORT'
,p_help_text=>'This option reduces the padding and font sizes to present a compact display of the same information.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680220268581493814)
,p_theme_id=>42
,p_name=>'TITLE_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(25680217152874493810)
,p_css_classes=>'t-ContentRow--hideTitle'
,p_group_id=>wwv_flow_api.id(10764795228442568702)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Title from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680220759216493815)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(25680220435339493814)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_api.id(10764801625203568706)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact version of timeline with smaller text and fewer columns.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680221152264493816)
,p_theme_id=>42
,p_name=>'2_COLUMN_GRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680220863741493815)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680221327482493816)
,p_theme_id=>42
,p_name=>'3_COLUMN_GRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680220863741493815)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680221507092493817)
,p_theme_id=>42
,p_name=>'4_COLUMN_GRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(25680220863741493815)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680221748993493817)
,p_theme_id=>42
,p_name=>'5_COLUMN_GRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(25680220863741493815)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680221974758493817)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(25680220863741493815)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680222138402493817)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680220863741493815)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_api.id(10764798844622568704)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680222396585493817)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680220863741493815)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_api.id(10764798844622568704)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680222762484493818)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680220863741493815)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(10764801212571568706)
,p_template_types=>'REPORT'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680222928957493818)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(25680220863741493815)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680223145064493818)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680220863741493815)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680223349431493819)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680220863741493815)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'REPORT'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680223590096493819)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(25680220863741493815)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680223699278493819)
,p_theme_id=>42
,p_name=>'STACK'
,p_display_name=>'Stack'
,p_display_sequence=>5
,p_report_template_id=>wwv_flow_api.id(25680220863741493815)
,p_css_classes=>'t-MediaList--stack'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680224322983493820)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(25680223819450493819)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(10764799277504568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680224523314493820)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680223819450493819)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(10764799277504568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680224736777493820)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680223819450493819)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(10764799277504568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680224992774493821)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680223819450493819)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680225110541493821)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680223819450493819)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680225317116493821)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(25680223819450493819)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(10764799277504568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680225524092493821)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(25680223819450493819)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(10764799277504568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680225721185493821)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(25680223819450493819)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(10764799277504568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680226173384493822)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(25680225798168493821)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(10764799277504568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680226330165493822)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680225798168493821)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(10764799277504568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680226565490493822)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680225798168493821)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(10764799277504568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680226724263493823)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(25680225798168493821)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680226915734493823)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(25680225798168493821)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(10764799615712568705)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680227176357493823)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(25680225798168493821)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(10764799277504568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680227298485493823)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(25680225798168493821)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(10764799277504568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680227559714493823)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(25680225798168493821)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(10764799277504568704)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680228273538493835)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680228411130493836)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680228628497493836)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680228843012493836)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680229077672493836)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680229492393493836)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(10764774051946568686)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680229639964493836)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680229825821493837)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680230074206493837)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680230230762493837)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(10764774051946568686)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680230659917493837)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(10764768827038568682)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680230853461493837)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(10764768827038568682)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680231036484493837)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(10764768827038568682)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680231257701493838)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680231444640493838)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(10764768827038568682)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680231692180493838)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(25680227648836493825)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(10764768827038568682)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680232091085493838)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680232460541493839)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(10764769269858568682)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680232605394493839)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680232843672493839)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(10764769269858568682)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680233010012493839)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680233249843493839)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(10764769269858568682)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680233447489493840)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680233601984493840)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(10764774051946568686)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680233834189493840)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(10764774051946568686)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680234003467493840)
,p_theme_id=>42
,p_name=>'CARDS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--stacked'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_help_text=>'Stacks the cards on top of each other.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680234478286493840)
,p_theme_id=>42
,p_name=>'COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(10764768412700568681)
,p_template_types=>'LIST'
,p_help_text=>'Fills the card background with the color of the icon or default link style.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680234630823493840)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(10764774051946568686)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680234999598493841)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(10764771248020568684)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680235286488493841)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(10764771248020568684)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680235446675493841)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680235645852493841)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(10764774051946568686)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680235822887493841)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680236049557493842)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(10764769269858568682)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680236475977493842)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_api.id(10764771644200568684)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680236685304493842)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_api.id(10764771644200568684)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680236835642493842)
,p_theme_id=>42
,p_name=>'RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(10764768412700568681)
,p_template_types=>'LIST'
,p_help_text=>'Raises the card so it pops up.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680237069701493842)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680237242411493842)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680231726060493838)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680237628801493843)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680237346161493842)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_api.id(10764774051946568686)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680237824950493843)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(25680237346161493842)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680238022646493843)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680237346161493842)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680238255345493843)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680237346161493842)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680238617365493844)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680237346161493842)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(10764770815454568683)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680238812895493844)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680237346161493842)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(10764770815454568683)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680239209409493844)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680238929000493844)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680239449087493845)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680238929000493844)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680239599682493845)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(25680238929000493844)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680239884788493845)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(25680238929000493844)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680240075973493845)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(25680238929000493844)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies colors from the Theme''s color palette to icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680240214783493845)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680238929000493844)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_api.id(10764771644200568684)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680240494048493845)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680238929000493844)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_api.id(10764771644200568684)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680240863692493846)
,p_theme_id=>42
,p_name=>'LIST_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680238929000493844)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(10764773645875568685)
,p_template_types=>'LIST'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680240999538493846)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(25680238929000493844)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680241296865493846)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680238929000493844)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680241437376493846)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680238929000493844)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Display an icon next to the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680241670151493846)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(25680238929000493844)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680242005162493848)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680241733373493846)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680242686841493848)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS_SM'
,p_display_name=>'Display labels'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(25680242181015493848)
,p_css_classes=>'t-NavTabs--displayLabels-sm'
,p_group_id=>wwv_flow_api.id(10764773271913568685)
,p_template_types=>'LIST'
,p_help_text=>'Displays the label for the list items below the icon'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680242887578493849)
,p_theme_id=>42
,p_name=>'HIDE_LABELS_SM'
,p_display_name=>'Do not display labels'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(25680242181015493848)
,p_css_classes=>'t-NavTabs--hiddenLabels-sm'
,p_group_id=>wwv_flow_api.id(10764773271913568685)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680243198488493849)
,p_theme_id=>42
,p_name=>'LABEL_ABOVE_LG'
,p_display_name=>'Display labels above'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680242181015493848)
,p_css_classes=>'t-NavTabs--stacked'
,p_group_id=>wwv_flow_api.id(10764770469109568683)
,p_template_types=>'LIST'
,p_help_text=>'Display the label stacked above the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680243475150493849)
,p_theme_id=>42
,p_name=>'LABEL_INLINE_LG'
,p_display_name=>'Display labels inline'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680242181015493848)
,p_css_classes=>'t-NavTabs--inlineLabels-lg'
,p_group_id=>wwv_flow_api.id(10764770469109568683)
,p_template_types=>'LIST'
,p_help_text=>'Display the label inline with the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680243636891493849)
,p_theme_id=>42
,p_name=>'NO_LABEL_LG'
,p_display_name=>'Do not display labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(25680242181015493848)
,p_css_classes=>'t-NavTabs--hiddenLabels-lg'
,p_group_id=>wwv_flow_api.id(10764770469109568683)
,p_template_types=>'LIST'
,p_help_text=>'Hides the label for the list item'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680244002660493851)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(25680243794828493849)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680244237314493851)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680243794828493849)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680244476296493851)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(25680243794828493849)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680244647371493851)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(25680243794828493849)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680245053945493853)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680244769370493851)
,p_css_classes=>'t-MegaMenu--layout2Cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680245247847493853)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680244769370493851)
,p_css_classes=>'t-MegaMenu--layout3Cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680245469790493853)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(25680244769370493851)
,p_css_classes=>'t-MegaMenu--layout4Cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680245645707493853)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(25680244769370493851)
,p_css_classes=>'t-MegaMenu--layout5Cols'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680245860599493854)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(25680244769370493851)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680246019379493854)
,p_theme_id=>42
,p_name=>'CUSTOM'
,p_display_name=>'Custom'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(25680244769370493851)
,p_css_classes=>'t-MegaMenu--layoutCustom'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680246233978493854)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680244769370493851)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Displays a callout arrow that points to where the menu was activated from.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680246433840493854)
,p_theme_id=>42
,p_name=>'FULL_WIDTH'
,p_display_name=>'Full Width'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680244769370493851)
,p_css_classes=>'t-MegaMenu--fullWidth'
,p_template_types=>'LIST'
,p_help_text=>'Stretches the menu to fill the width of the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680246614483493854)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(25680244769370493851)
,p_css_classes=>'t-MegaMenu--layoutStacked'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680247278549493855)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680246782939493854)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_api.id(10764772444088568684)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680247417311493855)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680246782939493854)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_api.id(10764772444088568684)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680247619293493855)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(25680246782939493854)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_api.id(10764772444088568684)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680247826569493855)
,p_theme_id=>42
,p_name=>'VERTICAL_LIST'
,p_display_name=>'Vertical Orientation'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680246782939493854)
,p_css_classes=>'t-WizardSteps--vertical'
,p_template_types=>'LIST'
,p_help_text=>'Displays the wizard progress list in a vertical orientation and is suitable for displaying within a side column of a page.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680248014272493855)
,p_theme_id=>42
,p_name=>'WIZARD_PROGRESS_LINKS'
,p_display_name=>'Make Wizard Steps Clickable'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(25680246782939493854)
,p_css_classes=>'js-wizardProgressLinks'
,p_template_types=>'LIST'
,p_help_text=>'This option will make the wizard steps clickable links.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680248494603493856)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680248157562493856)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Enables you to define a keyboard shortcut to activate the menu item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680248633068493856)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680248157562493856)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu. Note that callout will only be displayed if the data-parent-element custom attribute is defined.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680249043132493858)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680248775061493856)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_api.id(10764771248020568684)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680249273947493858)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(25680248775061493856)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_api.id(10764772829576568685)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680249459841493858)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680248775061493856)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_api.id(10764771248020568684)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680249645422493859)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680248775061493856)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_api.id(10764773645875568685)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680249803704493859)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680248775061493856)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_api.id(10764774051946568686)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680250047727493859)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680248775061493856)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_api.id(10764774051946568686)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680250200507493859)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(25680248775061493856)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_api.id(10764773645875568685)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680250601268493860)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(25680250366249493859)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680250872552493860)
,p_theme_id=>42
,p_name=>'COLLAPSED_DEFAULT'
,p_display_name=>'Collapsed by Default'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680250366249493859)
,p_css_classes=>'js-defaultCollapsed'
,p_template_types=>'LIST'
,p_help_text=>'This option will load the side navigation menu in a collapsed state by default.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680251230038493860)
,p_theme_id=>42
,p_name=>'COLLAPSE_STYLE_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680250366249493859)
,p_css_classes=>'js-navCollapsed--hidden'
,p_group_id=>wwv_flow_api.id(10764769669070568682)
,p_template_types=>'LIST'
,p_help_text=>'Completely hide the navigation menu when it is collapsed.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680251470505493861)
,p_theme_id=>42
,p_name=>'ICON_DEFAULT'
,p_display_name=>'Icon (Default)'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680250366249493859)
,p_css_classes=>'js-navCollapsed--default'
,p_group_id=>wwv_flow_api.id(10764769669070568682)
,p_template_types=>'LIST'
,p_help_text=>'Display icons when the navigation menu is collapsed for large screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680251659914493861)
,p_theme_id=>42
,p_name=>'STYLE_A'
,p_display_name=>'Style A'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(25680250366249493859)
,p_css_classes=>'t-TreeNav--styleA'
,p_group_id=>wwv_flow_api.id(10764774051946568686)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation A'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680251827030493861)
,p_theme_id=>42
,p_name=>'STYLE_B'
,p_display_name=>'Style B'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(25680250366249493859)
,p_css_classes=>'t-TreeNav--styleB'
,p_group_id=>wwv_flow_api.id(10764774051946568686)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation B'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680252077303493861)
,p_theme_id=>42
,p_name=>'STYLE_C'
,p_display_name=>'Classic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(25680250366249493859)
,p_css_classes=>'t-TreeNav--classic'
,p_group_id=>wwv_flow_api.id(10764774051946568686)
,p_template_types=>'LIST'
,p_help_text=>'Classic Style'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680252476546493862)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(25680252101824493861)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680252637315493862)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(25680252101824493861)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680252828186493862)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(25680252101824493861)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680253078362493862)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(25680252101824493861)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680254079019493871)
,p_theme_id=>42
,p_name=>'INDICATOR_ASTERISK'
,p_display_name=>'Asterisk'
,p_display_sequence=>10
,p_field_template_id=>wwv_flow_api.id(25680253664465493869)
,p_css_classes=>'t-Form-fieldContainer--indicatorAsterisk'
,p_group_id=>wwv_flow_api.id(10764766778992568680)
,p_template_types=>'FIELD'
,p_help_text=>'Displays an asterisk * on required items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680254263237493872)
,p_theme_id=>42
,p_name=>'INDICATOR_LABEL'
,p_display_name=>'Inline Label'
,p_display_sequence=>20
,p_field_template_id=>wwv_flow_api.id(25680253664465493869)
,p_css_classes=>'t-Form-fieldContainer--indicatorLabel'
,p_group_id=>wwv_flow_api.id(10764766778992568680)
,p_template_types=>'FIELD'
,p_help_text=>'Displays "Required" inline.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680254561969493872)
,p_theme_id=>42
,p_name=>'INDICATOR_ASTERISK'
,p_display_name=>'Asterisk'
,p_display_sequence=>10
,p_field_template_id=>wwv_flow_api.id(25680254394252493872)
,p_css_classes=>'t-Form-fieldContainer--indicatorAsterisk'
,p_group_id=>wwv_flow_api.id(10764766778992568680)
,p_template_types=>'FIELD'
,p_help_text=>'Displays an asterisk * on required items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680254780726493873)
,p_theme_id=>42
,p_name=>'INDICATOR_LABEL'
,p_display_name=>'Inline Label'
,p_display_sequence=>20
,p_field_template_id=>wwv_flow_api.id(25680254394252493872)
,p_css_classes=>'t-Form-fieldContainer--indicatorLabel'
,p_group_id=>wwv_flow_api.id(10764766778992568680)
,p_template_types=>'FIELD'
,p_help_text=>'Displays "Required" inline.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680254998502493873)
,p_theme_id=>42
,p_name=>'INDICATOR_ASTERISK'
,p_display_name=>'Asterisk'
,p_display_sequence=>10
,p_field_template_id=>wwv_flow_api.id(25680254824725493873)
,p_css_classes=>'t-Form-fieldContainer--indicatorAsterisk'
,p_group_id=>wwv_flow_api.id(10764766778992568680)
,p_template_types=>'FIELD'
,p_help_text=>'Displays an asterisk * on required items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680255296484493874)
,p_theme_id=>42
,p_name=>'INDICATOR_LABEL'
,p_display_name=>'Inline Label'
,p_display_sequence=>20
,p_field_template_id=>wwv_flow_api.id(25680254824725493873)
,p_css_classes=>'t-Form-fieldContainer--indicatorLabel'
,p_group_id=>wwv_flow_api.id(10764766778992568680)
,p_template_types=>'FIELD'
,p_help_text=>'Displays "Required" inline.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680255752244493878)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(25680255368198493876)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_api.id(10764760342173568675)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680255967989493879)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(25680255368198493876)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_api.id(10764760342173568675)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680256361632493879)
,p_theme_id=>42
,p_name=>'HIDE_LABEL_ON_MOBILE'
,p_display_name=>'Hide Label on Mobile'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(25680256147431493879)
,p_css_classes=>'t-Button--mobileHideLabel'
,p_template_types=>'BUTTON'
,p_help_text=>'This template options hides the button label on small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680256710550493880)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(25680256147431493879)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(10764760754347568676)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680256932524493880)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(25680256147431493879)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_api.id(10764760342173568675)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680257156441493880)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(25680256147431493879)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_api.id(10764760754347568676)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(25680257354842493880)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(25680256147431493879)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_api.id(10764760342173568675)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
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
null;
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
prompt --application/shared_components/user_interface/shortcuts/delete_confirm_msg
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(25680283976694493978)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
end;
/
prompt --application/shared_components/security/authentications/application_express_accounts
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(25680132036272493677)
,p_name=>'Application Express Accounts'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(25680280954711493953)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_api.id(25680132808916493678)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(25680250366249493859)
,p_nav_list_template_options=>'#DEFAULT#:t-TreeNav--styleA:js-navCollapsed--hidden'
,p_css_file_urls=>'#APP_IMAGES#app-icon.css?version=#APP_VERSION#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(25680280621459493952)
,p_nav_bar_list_template_id=>wwv_flow_api.id(25680241733373493846)
,p_nav_bar_template_options=>'#DEFAULT#'
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
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(25680280954711493953)
,p_name=>'Global Page - Desktop'
,p_step_title=>'Global Page - Desktop'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_updated_by=>'PAIGE.HANSSEN@ORACLE.COM'
,p_last_upd_yyyymmddhh24miss=>'20210930164836'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(25680280954711493953)
,p_name=>'My Watchlist'
,p_alias=>'HOME'
,p_step_title=>'Movies Watchlist'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'PAIGE.HANSSEN@ORACLE.COM'
,p_last_upd_yyyymmddhh24miss=>'20210930164837'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25680291743904494054)
,p_plug_name=>'Movies Watchlist'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(25680186090818493769)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_api.create_page(
 p_id=>9999
,p_user_interface_id=>wwv_flow_api.id(25680280954711493953)
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'Movies Watchlist - Sign In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(25680148454811493714)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'PAIGE.HANSSEN@ORACLE.COM'
,p_last_upd_yyyymmddhh24miss=>'20210930164837'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25680284980928494014)
,p_plug_name=>'Movies Watchlist'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(25680177063070493759)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25680289655837494025)
,p_plug_name=>'Language Selector'
,p_parent_plug_id=>wwv_flow_api.id(25680284980928494014)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(25680159079337493738)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'apex_lang.emit_language_selector_list;'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_num_rows=>15
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25680287778334494022)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(25680284980928494014)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(25680256075260493879)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'NEXT'
,p_button_alignment=>'LEFT'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25680285319528494016)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25680284980928494014)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(25680253098260493863)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25680285769242494017)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(25680284980928494014)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(25680253098260493863)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25680286848322494019)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(25680284980928494014)
,p_prompt=>'Remember username'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'LOGIN_REMEMBER_USERNAME'
,p_lov=>'.'||wwv_flow_api.id(25680286074787494018)||'.'
,p_label_alignment=>'RIGHT'
,p_display_when=>'apex_authentication.persistent_cookies_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_api.id(25680253098260493863)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(25680288501441494023)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P9999_USERNAME),',
'    p_consent  => :P9999_REMEMBER = ''Y'' );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(25680288141347494022)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P9999_USERNAME,',
'    p_password => :P9999_PASSWORD );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(25680289359416494024)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(25680288947746494024)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
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
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
