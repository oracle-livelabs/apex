prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_220100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.3'
,p_default_workspace_id=>13049315968741382764
,p_default_application_id=>31843
,p_default_id_offset=>0
,p_default_owner=>'WKSP_MOVIESHOL'
);
end;
/
 
prompt APPLICATION 31843 - Movies Watchlist
--
-- Application Export:
--   Application:     31843
--   Name:            Movies Watchlist
--   Date and Time:   13:37 Friday August 19, 2022
--   Exported By:     LOW_CODER
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                      5
--       Items:                   26
--       Processes:                8
--       Regions:                  9
--       Buttons:                  6
--       Dynamic Actions:          1
--     Shared Components:
--       Logic:
--         Items:                  1
--         Processes:              1
--         Build Options:          1
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
--           Region:              19
--           Label:                7
--           List:                13
--           Popup LOV:            1
--           Calendar:             1
--           Breadcrumb:           1
--           Button:               3
--           Report:              12
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--       Install scripts:          1
--   Version:         22.1.3
--   Instance ID:     63102946836549
--

prompt --application/delete_application
begin
wwv_flow_imp.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_flow_imp.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'WKSP_MOVIESHOL')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Movies Watchlist')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'MOVIES-WATCHLIST')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'1DC2BA1CED157B94D5FBBFD44991F90F35E0CCDBE1A7EB5D08E9A5AC24065595'
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
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_imp.id(22241219121745054968)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'Movies Watchlist'
,p_public_user=>'APEX_PUBLIC_USER'
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
,p_last_upd_yyyymmddhh24miss=>'20220819133749'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>4
,p_ui_type_name => null
,p_print_server_type=>'INSTANCE'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'N'
);
end;
/
prompt --workspace/credentials/credentials_for_movies
begin
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(22266736914319684464)
,p_name=>'Credentials for Movies'
,p_static_id=>'Credentials_for_Movies'
,p_authentication_type=>'HTTP_QUERY_STRING'
,p_valid_for_urls=>'https://api.themoviedb.org/3/'
,p_prompt_on_install=>true
);
end;
/
prompt --workspace/remote_servers/api_themoviedb_org_3
begin
wwv_imp_workspace.create_remote_server(
 p_id=>wwv_flow_imp.id(22266737186085684464)
,p_name=>'api-themoviedb-org-3'
,p_static_id=>'api_themoviedb_org_3'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('api_themoviedb_org_3'),'https://api.themoviedb.org/3/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('api_themoviedb_org_3'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('api_themoviedb_org_3'),'')
,p_remote_sql_default_schema=>nvl(wwv_flow_application_install.get_remote_server_default_db('api_themoviedb_org_3'),'')
,p_mysql_sql_modes=>nvl(wwv_flow_application_install.get_remote_server_sql_mode('api_themoviedb_org_3'),'')
,p_prompt_on_install=>false
);
end;
/
prompt --application/shared_components/data_profiles/movie_cast
begin
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(22266737387501684465)
,p_name=>'Movie Cast'
,p_format=>'JSON'
,p_row_selector=>'cast'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266739085478684467)
,p_data_profile_id=>wwv_flow_imp.id(22266737387501684465)
,p_name=>'ID'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266737568907684466)
,p_data_profile_id=>wwv_flow_imp.id(22266737387501684465)
,p_name=>'NAME'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'name'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266737846447684466)
,p_data_profile_id=>wwv_flow_imp.id(22266737387501684465)
,p_name=>'ADULT'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'adult'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266738123842684466)
,p_data_profile_id=>wwv_flow_imp.id(22266737387501684465)
,p_name=>'ORDER_'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'order'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266738498366684467)
,p_data_profile_id=>wwv_flow_imp.id(22266737387501684465)
,p_name=>'GENDER'
,p_sequence=>5
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'gender'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266738795379684467)
,p_data_profile_id=>wwv_flow_imp.id(22266737387501684465)
,p_name=>'CAST_ID'
,p_sequence=>6
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'cast_id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266739319163684468)
,p_data_profile_id=>wwv_flow_imp.id(22266737387501684465)
,p_name=>'CHARACTER'
,p_sequence=>7
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'character'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266739695940684468)
,p_data_profile_id=>wwv_flow_imp.id(22266737387501684465)
,p_name=>'CREDIT_ID'
,p_sequence=>8
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'credit_id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266739993387684469)
,p_data_profile_id=>wwv_flow_imp.id(22266737387501684465)
,p_name=>'POPULARITY'
,p_sequence=>9
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'popularity'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266740246313684469)
,p_data_profile_id=>wwv_flow_imp.id(22266737387501684465)
,p_name=>'PROFILE_PATH'
,p_sequence=>10
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'profile_path'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266740554081684469)
,p_data_profile_id=>wwv_flow_imp.id(22266737387501684465)
,p_name=>'ORIGINAL_NAME'
,p_sequence=>11
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_name'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266740817473684469)
,p_data_profile_id=>wwv_flow_imp.id(22266737387501684465)
,p_name=>'KNOWN_FOR_DEPARTMENT'
,p_sequence=>12
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'known_for_department'
);
end;
/
prompt --application/shared_components/data_profiles/movie_details
begin
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'Movie Details'
,p_format=>'JSON'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266744737172684474)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'ID'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266745039200684474)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'ADULT'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'adult'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266745304485684474)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'TITLE'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'title'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266745670231684474)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'VIDEO'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'video'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266745902286684475)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'BUDGET'
,p_sequence=>5
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'budget'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266746221658684475)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'STATUS'
,p_sequence=>6
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'status'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266746512345684475)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'IMDB_ID'
,p_sequence=>7
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'imdb_id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266746855931684475)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'REVENUE'
,p_sequence=>8
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'revenue'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266747178319684476)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'RUNTIME'
,p_sequence=>9
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'runtime'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266747402304684476)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'TAGLINE'
,p_sequence=>10
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'tagline'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266747731615684476)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'HOMEPAGE'
,p_sequence=>11
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'homepage'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266748007718684476)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'OVERVIEW'
,p_sequence=>12
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'overview'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266748338975684476)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'POPULARITY'
,p_sequence=>13
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'popularity'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266743548657684473)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'VOTE_COUNT'
,p_sequence=>14
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_count'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266743868419684473)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'POSTER_PATH'
,p_sequence=>15
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'poster_path'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266744148181684473)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'RELEASE_DATE'
,p_sequence=>16
,p_column_type=>'DATA'
,p_data_type=>'DATE'
,p_format_mask=>'YYYY"-"MM"-"DD'
,p_has_time_zone=>false
,p_selector=>'release_date'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266744450361684474)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'VOTE_AVERAGE'
,p_sequence=>17
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_average'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266742366750684472)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'BACKDROP_PATH'
,p_sequence=>18
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'backdrop_path'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266742680242684472)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'ORIGINAL_TITLE'
,p_sequence=>19
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_title'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266742906834684473)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'ORIGINAL_LANGUAGE'
,p_sequence=>20
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_language'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266743209684684473)
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_name=>'BELONGS_TO_COLLECTION'
,p_sequence=>21
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'belongs_to_collection'
);
end;
/
prompt --application/shared_components/data_profiles/search_movies
begin
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(22266749787991684478)
,p_name=>'Search Movies'
,p_format=>'JSON'
,p_row_selector=>'results'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266749933708684479)
,p_data_profile_id=>wwv_flow_imp.id(22266749787991684478)
,p_name=>'ID'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266750226715684479)
,p_data_profile_id=>wwv_flow_imp.id(22266749787991684478)
,p_name=>'ADULT'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'adult'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266750563045684479)
,p_data_profile_id=>wwv_flow_imp.id(22266749787991684478)
,p_name=>'TITLE'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'title'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266750890762684479)
,p_data_profile_id=>wwv_flow_imp.id(22266749787991684478)
,p_name=>'VIDEO'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'video'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266751194428684480)
,p_data_profile_id=>wwv_flow_imp.id(22266749787991684478)
,p_name=>'OVERVIEW'
,p_sequence=>5
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'overview'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266751452240684480)
,p_data_profile_id=>wwv_flow_imp.id(22266749787991684478)
,p_name=>'POPULARITY'
,p_sequence=>6
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'popularity'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266751767706684480)
,p_data_profile_id=>wwv_flow_imp.id(22266749787991684478)
,p_name=>'VOTE_COUNT'
,p_sequence=>7
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_count'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266752047237684480)
,p_data_profile_id=>wwv_flow_imp.id(22266749787991684478)
,p_name=>'POSTER_PATH'
,p_sequence=>8
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'poster_path'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266752399495684480)
,p_data_profile_id=>wwv_flow_imp.id(22266749787991684478)
,p_name=>'RELEASE_DATE'
,p_sequence=>9
,p_column_type=>'DATA'
,p_data_type=>'DATE'
,p_format_mask=>'YYYY"-"MM"-"DD'
,p_has_time_zone=>false
,p_selector=>'release_date'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266752604932684481)
,p_data_profile_id=>wwv_flow_imp.id(22266749787991684478)
,p_name=>'VOTE_AVERAGE'
,p_sequence=>10
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_average'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266752964030684481)
,p_data_profile_id=>wwv_flow_imp.id(22266749787991684478)
,p_name=>'BACKDROP_PATH'
,p_sequence=>11
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'backdrop_path'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266753365883684481)
,p_data_profile_id=>wwv_flow_imp.id(22266749787991684478)
,p_name=>'ORIGINAL_TITLE'
,p_sequence=>12
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_title'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266753636575684481)
,p_data_profile_id=>wwv_flow_imp.id(22266749787991684478)
,p_name=>'ORIGINAL_LANGUAGE'
,p_sequence=>13
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_language'
);
end;
/
prompt --application/shared_components/data_profiles/popular_movies
begin
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(22266755878213684484)
,p_name=>'Popular Movies'
,p_format=>'JSON'
,p_row_selector=>'results'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266756005249684484)
,p_data_profile_id=>wwv_flow_imp.id(22266755878213684484)
,p_name=>'ID'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266756361797684484)
,p_data_profile_id=>wwv_flow_imp.id(22266755878213684484)
,p_name=>'ADULT'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'adult'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266756657422684485)
,p_data_profile_id=>wwv_flow_imp.id(22266755878213684484)
,p_name=>'TITLE'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'title'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266756926121684485)
,p_data_profile_id=>wwv_flow_imp.id(22266755878213684484)
,p_name=>'VIDEO'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'video'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266757289600684485)
,p_data_profile_id=>wwv_flow_imp.id(22266755878213684484)
,p_name=>'OVERVIEW'
,p_sequence=>5
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'overview'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266757584219684485)
,p_data_profile_id=>wwv_flow_imp.id(22266755878213684484)
,p_name=>'POPULARITY'
,p_sequence=>6
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'popularity'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266757899478684486)
,p_data_profile_id=>wwv_flow_imp.id(22266755878213684484)
,p_name=>'VOTE_COUNT'
,p_sequence=>7
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_count'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266758196569684486)
,p_data_profile_id=>wwv_flow_imp.id(22266755878213684484)
,p_name=>'POSTER_PATH'
,p_sequence=>8
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'poster_path'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266758411309684486)
,p_data_profile_id=>wwv_flow_imp.id(22266755878213684484)
,p_name=>'RELEASE_DATE'
,p_sequence=>9
,p_column_type=>'DATA'
,p_data_type=>'DATE'
,p_format_mask=>'YYYY"-"MM"-"DD'
,p_has_time_zone=>false
,p_selector=>'release_date'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266758720088684486)
,p_data_profile_id=>wwv_flow_imp.id(22266755878213684484)
,p_name=>'VOTE_AVERAGE'
,p_sequence=>10
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_average'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266759092148684486)
,p_data_profile_id=>wwv_flow_imp.id(22266755878213684484)
,p_name=>'BACKDROP_PATH'
,p_sequence=>11
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'backdrop_path'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266759347694684487)
,p_data_profile_id=>wwv_flow_imp.id(22266755878213684484)
,p_name=>'ORIGINAL_TITLE'
,p_sequence=>12
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_title'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(22266759608463684487)
,p_data_profile_id=>wwv_flow_imp.id(22266755878213684484)
,p_name=>'ORIGINAL_LANGUAGE'
,p_sequence=>13
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_language'
);
end;
/
prompt --application/shared_components/web_sources/movie_cast
begin
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(22266741171217684469)
,p_name=>'Movie Cast'
,p_static_id=>'Movie_Cast'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(22266737387501684465)
,p_remote_server_id=>wwv_flow_imp.id(22266737186085684464)
,p_url_path_prefix=>'movie/:movie_id/credits'
,p_credential_id=>wwv_flow_imp.id(22266736914319684464)
,p_catalog_internal_name=>'TMDB'
,p_catalog_service_name=>'Movie Cast'
,p_catalog_service_version=>20220802
,p_attribute_05=>'1'
,p_attribute_08=>'OFFSET'
,p_attribute_10=>'EQUALS'
,p_attribute_11=>'true'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(22266741751048684471)
,p_web_src_module_id=>wwv_flow_imp.id(22266741171217684469)
,p_name=>'movie_id'
,p_param_type=>'URL_PATTERN'
,p_is_required=>false
,p_value=>'505'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(22266741302983684470)
,p_web_src_module_id=>wwv_flow_imp.id(22266741171217684469)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
end;
/
prompt --application/shared_components/web_sources/movie_details
begin
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(22266748668760684477)
,p_name=>'Movie Details'
,p_static_id=>'Movie_Details'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(22266742170229684472)
,p_remote_server_id=>wwv_flow_imp.id(22266737186085684464)
,p_url_path_prefix=>'movie/:movie_id'
,p_credential_id=>wwv_flow_imp.id(22266736914319684464)
,p_catalog_internal_name=>'TMDB'
,p_catalog_service_name=>'Movie Details'
,p_catalog_service_version=>20220802
,p_attribute_05=>'1'
,p_attribute_08=>'OFFSET'
,p_attribute_10=>'EQUALS'
,p_attribute_11=>'true'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(22266749376057684477)
,p_web_src_module_id=>wwv_flow_imp.id(22266748668760684477)
,p_name=>'movie_id'
,p_param_type=>'URL_PATTERN'
,p_is_required=>false
,p_value=>'505'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(22266748952557684477)
,p_web_src_module_id=>wwv_flow_imp.id(22266748668760684477)
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
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(22266753916841684482)
,p_name=>'Search Movies'
,p_static_id=>'Search_Movies'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(22266749787991684478)
,p_remote_server_id=>wwv_flow_imp.id(22266737186085684464)
,p_url_path_prefix=>'search/movie'
,p_credential_id=>wwv_flow_imp.id(22266736914319684464)
,p_catalog_internal_name=>'TMDB'
,p_catalog_service_name=>'Search Movies'
,p_catalog_service_version=>20220802
,p_attribute_01=>'PAGE_NUMBER_FIXED_SIZE'
,p_attribute_04=>'page'
,p_attribute_05=>'1'
,p_attribute_06=>'20'
,p_attribute_08=>'OFFSET'
,p_attribute_10=>'EQUALS'
,p_attribute_11=>'true'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(22266754696869684482)
,p_web_src_module_id=>wwv_flow_imp.id(22266753916841684482)
,p_name=>'language'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'en-US'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(22266755016586684482)
,p_web_src_module_id=>wwv_flow_imp.id(22266753916841684482)
,p_name=>'query'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'harry potter'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(22266755408422684483)
,p_web_src_module_id=>wwv_flow_imp.id(22266753916841684482)
,p_name=>'include_adult'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'false'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(22266754247166684482)
,p_web_src_module_id=>wwv_flow_imp.id(22266753916841684482)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_legacy_ords_fixed_page_size=>20
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
end;
/
prompt --application/shared_components/web_sources/popular_movies
begin
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(22266759957212684487)
,p_name=>'Popular Movies'
,p_static_id=>'Popular_Movies'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(22266755878213684484)
,p_remote_server_id=>wwv_flow_imp.id(22266737186085684464)
,p_url_path_prefix=>'movie/popular'
,p_credential_id=>wwv_flow_imp.id(22266736914319684464)
,p_catalog_internal_name=>'TMDB'
,p_catalog_service_name=>'Popular Movies'
,p_catalog_service_version=>20220802
,p_attribute_05=>'1'
,p_attribute_08=>'OFFSET'
,p_attribute_10=>'EQUALS'
,p_attribute_11=>'true'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(22266760635659684488)
,p_web_src_module_id=>wwv_flow_imp.id(22266759957212684487)
,p_name=>'language'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'en-US'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(22266761018389684488)
,p_web_src_module_id=>wwv_flow_imp.id(22266759957212684487)
,p_name=>'page'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'1'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(22266760276002684487)
,p_web_src_module_id=>wwv_flow_imp.id(22266759957212684487)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_menu
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(22241220208093054979)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(22241630945070055407)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'My Watchlist'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:'
,p_list_item_icon=>'fa-film'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_bar
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(22241615951143055322)
,p_name=>'Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(22241632459639055443)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(22241632983377055444)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(22241632459639055443)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(22241633382513055444)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_imp.id(22241632459639055443)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_32_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000000017352474200AECE1CE900000215494441545847ED95CB6B135114C6BFC9C334433249C94CC0C4466A1A69C1E24E042D2ED42E0C85D2872DB8F3F157D5082E0A';
wwv_flow_imp.g_varchar2_table(2) := 'AD2214A42ED42E8A96823B578A71121A4D4AD309CD8B3C9A57991B3BA421E9DC84294198595ECE9CF3BBDF39E7BBCCC193850606F8313A80AE80AEC07FAB40BE5245A956230E326434C26636F5E5263DFB40AADE80391080E3DA18AC6E81142D260F9189';
wwv_flow_imp.g_varchar2_table(3) := 'FC46251C86CBC0F404420D50ACD650E07978EE3F84C9CE752C52CD6591D8FA045692603519A940A80152CE61F866E7A992C636DEC1953EA28AA5029065F72C2E75BD797B25A2C4DB75AA76500164FD015C9EBA47EAD48FCBC84722E0C627CED4CD452360';
wwv_flow_imp.g_varchar2_table(4) := '0501469B9D9CEF7FD90627865555500590A79D0BCEC0EAF19264D99F3F10DDF98A9BCF5E9C49FE3DB482D13B7715B062228EECE67BD5ED5005904A658C3C7D0EC3258BEA6D5A031A953262A197E087CEFFAF6780E4B75D30E8BE6AC2ADDB4AABFEBCD200';
wwv_flow_imp.g_varchar2_table(5) := 'A0BD056951847B6EB1A31A89D5D7E06F4C36BD41AB1690BEB70CA13C5CB9D81E71BFD64F7645BBEFAA32AC9A0DA15C445E43EFE36532E1726FA31F36C1D61BB0391C84219FC9A0606030FA2808C66C412D9F43FCCD9A766B4820DA8CA810FF8BC2619200';
wwv_flow_imp.g_varchar2_table(6) := 'B0821BACF78A2288E646447AFACF8ABD0FA6955D6F1F0472F3CF1F2FC68A4F8B351FA3EB70FAC760E179725C9624A445F931FA45257B2BB8EA1A765BFE813DC73DB9114570DF0A50E4A60AD101740574054E007A311310D66744FE0000000049454E44AE';
wwv_flow_imp.g_varchar2_table(7) := '426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(22241617705318055342)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_192_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000C0000000C0080600000052DC6C07000000017352474200AECE1CE90000154649444154785EED5D697054D795FEA46E75B7D4EA566BC71821400BAB88C12CC606D778C6994941668243C680ED314ED580A7';
wwv_flow_imp.g_varchar2_table(2) := '6662A72A95F9973FF99DA9D44C9C99AAE04CC5604FC09EF204BC4C1863A79C800D96308BC5A615C4222CB5D65EA4DEA49E3AAFBB1F4F428227DEEBA675EFB9552A44EBBEDBF77CE77CEF6EE79E93D3F3FCF7E2E0C208488A400E134052CDB3D80A024C00';
wwv_flow_imp.g_varchar2_table(3) := '3604A911600248AD7E169E09C0362035024C00A9D5CFC23301D806A446800920B5FA59782600DB80D4083001A4563F0BCF04601B901A012680D4EA67E199006C035223C004905AFD2C3C13806D406A04980052AB9F856702B00D488D0013406AF5B3F04C';
wwv_flow_imp.g_varchar2_table(4) := '00B601A911600248AD7E169E09C0362035024C00A9D5CFC23301D806A446800920B5FA59782600DB80D4083001A4563F0BCF04601B901A012680D4EA67E199006C035223C004905AFD2C3C13806D406A04980052AB9F856702B00D488D0013406AF5B3F0';
wwv_flow_imp.g_varchar2_table(5) := '4C00B601A911600248AD7E169E09C0362035024C00A9D5CFC23301D806A446800920B5FA59782600DB80D4083001A4563F0BCF04601B901A012680D4EA67E199006C035223C004905AFD2C3C13806D406A04980052AB9F856702B00D488D0013406AF5B3';
wwv_flow_imp.g_varchar2_table(6) := 'F04C00B601A9116002A449FD63F13846623144C6C7114DFE44C6C6311E8F632C0ED0DF63F171E5DBAD39B9B0E4E4C09203E4E6E4C066C9455E6E2E6CB9897F9D56ABF23917F3116002988869786C0CBE6814BE4814C1D818E2889BD27A0E72E0B45AE0B6';
wwv_flow_imp.g_varchar2_table(7) := 'E5C19D9707BBC5624ABBDC08C004306805F4761F0C4730188920343666B0357D8FE75B2CF0D86C28B6DB941182CBFD23C004B84FECC8E8FBC3610463B1695B70798A915FE486DD5D047B519132CDB19795C162B723CFE180A5A45479766CA01FD1500863';
wwv_flow_imp.g_varchar2_table(8) := 'E130C27D7DCAF428E4ED452414C2C8900F81E1C169BF83A647650EBB42082E334780093043CCC8F07B4643088F4FFDB6F75454A2BCBE1E9E9A5AE49596CDB0F5A9AB47FBFB30D8D18EBED6560CF5F64C59C961B1A032DFC1449821E24C009D800D4522B8';
wwv_flow_imp.g_varchar2_table(9) := '3532AA2C6A2797CABA3A94D4D6C3356F1EAC2EB7CE16EFAF5ACCEF83AFB31D03D7AEA1B7ADED8E46980833C39509700FBC6827E7E6C8A8B2A3A32D79763B6A9E7A1AC57535C8C9B3CF0C75936AC7A3610C5CB880CECF8E231A0E4F6895A6460F171420DF';
wwv_flow_imp.g_varchar2_table(10) := 'CA0BE6BBC1CD0498061D5ADC768F8C82DEFCDA62B5DB317FCD3A54AE5EF5C00C7F72978908BDA7CFA0EB5423629388506CB3E1A1827C5E2C4FA36726C014C00C47A2B8160C2A7BF6A9425B910B1E7F0295AB5723D7F660DEF8F71A38C62361DCFCE3A7B8';
wwv_flow_imp.g_varchar2_table(11) := 'D1DC3C610B96CE10AA0B9DCA162A9789083001347890B9D33CDF1B0A4D40E9E1152BF1F0860D699FDF9B659C51FF30BA4F9CC4CDF35F4D68B2C2E15046032EB711600224B1A0B7FDD54010FE68544587E6F90DDB77C251563E2B6D26D4E745F3DB0726AC';
wwv_flow_imp.g_varchar2_table(12) := '0F6814A0D1804F96132A65020088C5E3B8E2F363447390E5AEA8C4B267B767ED74472F2369D7E8F2E143F069B64F0B2C162C74BB6065F70A26002D763B7C8109FBFA735734A0FAA9A7B26691ABD7D8A7AB478BE4CE2347D0D3D6AA56B1E75A50E32E947E';
wwv_flow_imp.g_varchar2_table(13) := '712CF508407BFA6DC37ED5298DACA36EE32694AF7BCCA8CD65E5F3BD8D27D17EFCD8ED295E6E2EEADC2EA949202D0168DAD336EC530FB668BEBF6CCB163817D464A5F19AD5A940CB655CFAF823755D4023416D91BCD321290940BE369D9A393F19FF233B';
wwv_flow_imp.g_varchar2_table(14) := '9E33CD75C12C634D573BE45A71E6E06FD533035A13D4B85D522E8CA523006D7576F8FC139CD81EF9EE36142C58942E7BCBCA76FD2D97D1FCE1FB6ADF0AAD562C72BB20DBAD03E908703338823ECD6969FDA64D285B2BE69CFF5ECCEB6B3A89D663B7D704';
wwv_flow_imp.g_varchar2_table(15) := 'E50E07E64A764E201501E8B2CA157F40B58B790D0D98FFCD6FDDCB4E84FEFB950FDEC3ADD61655C645AE42B8243A31968600B4DDD932EC537CEDA9782AE728FBFCC893DC8F3E1AC1C5B70FAA6ED6743D73B1C72DCD19813404B81A08807C7CA8D81D0EAC';
wwv_flow_imp.g_varchar2_table(16) := 'DEBD47987D7EA343141D969D7B731FC249171072A09B5FE834DAECAC785E0A0204A23174F8FD8A42C80560F58B2FC166D2659559A1651D9D0C75DFC09983075527BA5AB74BB98C2F7A119E0034E16919F2A927BD0BBFF1081EFA8B6F8AAED7FB92AFFB93';
wwv_flow_imp.g_varchar2_table(17) := '8F70F5DC39E559BA58535FE4167E57487802D0F5C5AF474715A5D29DDCB5BBF720B730BDB7B6EECBFAB2E0A1B1800FA75EDFABAE936847887686442E42138016BC17878655BF7E91DD1CCC32D25B9F1CC5957367D517C6524FE232BFA8456802D09B9F46';
wwv_flow_imp.g_varchar2_table(18) := '002A36BB038FEEE185EFBD0C991CE74EEDFD95EA2AF1507E3E2AF2C51D05842500F9F7D3DB3FB5ED29F381D7BD8C7EF2DFBD8D27D196749AA36DD1A51EB7B06E12C212806E75D19D5E7EFBCFD4FC011A05BEDCBB17917062F4A4CBF5147B48C4222C012E';
wwv_flow_imp.g_varchar2_table(19) := '6B767E966DDE02CF926522EA2F6D3269DD246847687191981B074212804298B4F912FBFE7499FDB1575EE143AF195285468193AFBDA69E0BD4BBDD428658119200DD2323F0861271722AEAEA51FBD7DF99A1FAEF5E9DE6C8DE6494B65424B84C5FA2C944';
wwv_flow_imp.g_varchar2_table(20) := '1FDADF3F8CDEE42D32511DE58424C085C161F59697D9D39F8B6FED9F323C211161D90B2F9A4AB4E91ACB541F06CE9DC5E54F8E2ADDA0C5F0F2E2A28CC897C92F118E0014ACB63D39FD2120D7ED7ED9B47026BD8D27D07EFCF8B4FAA9DDB81115EB36A455';
wwv_flow_imp.g_varchar2_table(21) := '7F99EC03F90835BEFE2B551EBA3E5920987B847004D09EFC16555462B9896FE5E9DEBC290BC9C42890E93E9C7F6BBF1A5142C43301E108D0E90FA8B17DCC7E237FFEF39FDDF3EDFEF88FFEF99E758C54C8741F6E1DFB23AE34352A5DA698420B5D8546BA';
wwv_flow_imp.g_varchar2_table(22) := '9F75CF0A4500727C3B3F38A4BA3EACD9455E9FE605B5BAF0D67E0C4F139E9C346BF6883395B564BA0F917E2F4EED7B43E90A79D236147BB2CE888D74482802508616BAF44225DFEDC1AABFDF6D049B3B9ECDE4FC7BBA8E3F883E9CF9F5EB18F50D295D5A';
wwv_flow_imp.g_varchar2_table(23) := '42093F044AD12414012892735720A828AAA27A016AB7FDADA904A0C6A67B0367E2ED9F1226D37D687BF7BFE1EDBAAA7CFD82C24214D9C409B22B1401B40BE0AA952B51F5F45F994E006A90024CD139004D87C8F029234C4586836965B20F5D1FBE879B2D';
wwv_flow_imp.g_varchar2_table(24) := '897BC3A22D848522C0B54050495647C5EC05705A98344B1AED693C818EE4F66F89DD862AA738D725852200B93FA432B92C7EF24994AE593F4B4C2CBBBBD9DFF4055A8EFD49E9245D93A4EB92A214A108706968580D75D8F0CC36B816CA15EC2A5D46E9BF';
wwv_flow_imp.g_varchar2_table(25) := 'D289E6DFBDAB344FA1149778C4718C138A005A1788D53B9F83E3A187D3651352B51BBA7513A70FFC569199F2122FF388E3122114019A356700EB5EFA3EAC25E6A42995CADAA71096628936EDFB8DF217BA1EB942A0B300A108706EE07642E9749FC8CA44';
wwv_flow_imp.g_varchar2_table(26) := '8A38E238F1F37F514426F7F29525E21C86094580AF068654FFF50D3FFAB1A22C2EC611D01240B4D360A108406E10A93BC06B777D5F9A70E7C64DFCEE2D68DD2178119C6EB40DB4AFDD05E245B00120273D3ADA7D53C927C0DBA0E6619A9696C80F88FC81';
wwv_flow_imp.g_varchar2_table(27) := 'A898B50D4ABE375D4D4D7764624F8B0026364A493FAAD7AE35E57E82761BD463B32959264529424D8128F14520165374B378D393285D6BFC20ECDC7FBE8EE070C2116CB615B3FC93B417E4CB1D76CC2D28986D504CDB5FA10870233882FE64F28B9A8D1B';
wwv_flow_imp.g_varchar2_table(28) := '5169C2EDACD677DF415F57D7AC5478597535EAB73D6BB8EF5F379E4067D21542B470894211A07734845BC938A0552B1B50F5B4F1E417D73F3E82EB5F352B46F4E80F7E0857966793F1377D812F7FF9AF4A7FCDC2E0EA07EFA13B994483A63F340D12A508';
wwv_flow_imp.g_varchar2_table(29) := '4500AD3B7479F502D499E00EADF5BFAFDFBC0573B7BF90D5BAEF3EB01FAD477EAFF4D12C8740ED2858E372A1304F9CB0E9421160343686569FB91762B43B20E575F558FE939F6635019A7FFA13F47776287D5CB5E339E4CF35EE0E72FAD77B11F20D2B6D';
wwv_flow_imp.g_varchar2_table(30) := 'F285982C563FC503BDA089064D89301C65C6AE445280A813AFFD42913A2727071BFFED3F6029CACE93D031DF108EBDFA8F40320DD486575E351C102CD4E7C5E9FD892B91E406B1BCD823D4F1A25023002949BB1364D642F8EAD123E86E4EAC0356EE7C01';
wwv_flow_imp.g_varchar2_table(31) := '25DFDA9295AF81DE0F0FE3E23B0795BECD6D68C0021312006A17C022A64E128E00DA85B059DB80BECE4E9C3F9470072EACA8C49A9F251699D955E238F5E31F22E0F52ADD5AB1751BDC8B8CBB837FF5E63E04BCBD4A9BA22D809551BDE7F9EF25D2260A52';
wwv_flow_imp.g_varchar2_table(32) := 'B4714149A4F57BFE019642E317389AFEFD17B3E6308C0EC1D6FED3AB86351A0BF8D0B83711188BFCAA28329C68C932842300298BF202505A542A668546D44E050C5B569A1B58B47123E69870063270EE0C2E7FF2B1D25BCA1D4C3984452B4212401B1CB7';
wwv_flow_imp.g_varchar2_table(33) := 'B2AE1E352604C7A5C5F0997DFBD4DD906C350487BB08AB76ED32BCF825F9DADE3F0C6F3238EE3C67014AEDE2E508109200DAED50253CFA0F5E418ECDB8F2FC9D1D683EF43FAAED2FAE5F0CE703F68B09068268D1647A6FD8FA5DB816D518E6E778248C93';
wwv_flow_imp.g_varchar2_table(34) := 'BF4CEC7E2923A9A748B90D265A119200A4246D828CA59B37A378C9725374A73D14A2B9767D5D3DEC0F284E4E3812456B5BABBA3631CBF58180EA3F7B062D7F484C7F0A2C16D471820C53EC27638D4C4E914499E1734D180522BE6125AB7A34E97364773A';
wwv_flow_imp.g_varchar2_table(35) := 'B1B4BE3EE339B4E8CCE3526B2BC2C144203022E337FE6E176C6EE3F775E9EDFFE5EBB713E589E6FFA33542614700BA1843F703521764CC3A1320F022FD7D387DE0BF309E8C41E472B951535B93311290F177B477C0EF4F9C7AE7DA6C58BDF379D84ACDB9';
wwv_flow_imp.g_varchar2_table(36) := '03AD5DF0D3AE0F4D7FE826988845580290B2B46952AD763B1EDDFD322C268C02D4F6E4F540A1D389F90B16C2614FAFA358281C41E7954E844646547B5CF9EC0E14CEAB32C53EC7228934A9F42F95CA7C07E6E4E79BD27636362234012627CA5EF4C446CC';
wwv_flow_imp.g_varchar2_table(37) := '596F5E020BDFE54B38FFBF1FA87ACDB15A5135AF0A6525C569D175DFC020AEDFB88E78F2CE037DC98ACDDF867BC952D3BEEFC69F3EC5B5534D899125F9F6176DEF5F8A29504A48ED28403B42EBF6BC6CCAC158AAFD709F17170EFD6EC2F6A8A7B818F3E7';
wwv_flow_imp.g_varchar2_table(38) := 'CE058D3A669458388C6BDDDD181ABC1DF582B63B976F7D067683BE4EDAFE690FBEE8737AF3D3082072117A0420C5D13137AD05520763F31A1A30DF041F19AD51D0A2B1F5BDC318B836F1E28CDBE3414949293C45334F344DF3FCA1611F0606FAE11B9A78';
wwv_flow_imp.g_varchar2_table(39) := '23AD647E35EAFFE63BA62CEAB5725CFDE808BACF277C9E6CB9B958E22912CAF16D2A220B4F00125A7B4F80FEBFEAC55DC82FAB30FDC5D67FF102BA3EFFEC8EC3329A1A95B8DD28703A61B3D961B3DB916BB1C09EF4AB1F8DC480F13144C2614422618C04';
wwv_flow_imp.g_varchar2_table(40) := '8318F0F9264C75A8B3F4D6AF7EFC09942E33674B570BC088B71767DFDCA77E245A18F4E9942D050148784A9C4709F4A8D0D464F5AE97602D343FC6259D187BCF9C415753A369BE43890BEEEB50BE6E7D5A621DD1D4E7CB37DE5017BE85562B6A040A807B';
wwv_flow_imp.g_varchar2_table(41) := 'B7379D3404A02910458D486D8BBACA2BB162FB76534E88A702988830DCDE81FEF65678BBBAD42D53BDC30E6D6D965757A3B4B61E45B535A6B8364CF5DD347D3BFFF641D5E39316BC94155EC4535F69A74029C18723515C0D04541CE6AE68C082BF347E6F';
wwv_flow_imp.g_varchar2_table(42) := 'F85E464D91D582573AE1EBE981FFC675A57A606404E1BE3EE5F782F272E427B71A5DF3AAE0AEAC8473E1A2B4BCED27F7B5E3FF7E8F9E0BE7D58FC9E18D1CDF6429D28C002985DE0C8EA02F798A4B9FD56DDC844C6779CF16E39AECE12A5AC8133D384B47';
wwv_flow_imp.g_varchar2_table(43) := '00DA156A1BF6613419408B405AF9CC36144A964BC0DF7209CD1FDE3EC3C84FFAFB8879DE3B3D15A423004141EB015A1447927706143F9A1D3B4D4DA9AAE7EDF3A0EA50ACCFB3070F80CE17A8D09627657D9165DEAFC55D4A02100064FC4482D4F9009160';
wwv_flow_imp.g_varchar2_table(44) := 'D9E66F2B736F914BA0F5122E1D3DAAEE5091D1D7496AFCA4676909301509E8B3FA4D9B5096E5C1AFEE97A0DEC693683B7E4C7D9C8C9FDEFC3402C85AA426C054D321FA8C4E8BABFEECCF9193975EC7B64C195D3C1AC1F54FFF801BC9C816F4BD14E6BCC6';
wwv_flow_imp.g_varchar2_table(45) := '5D28E5B487A740932C2F168FA3D3E79FB030F654CEC192AD5B91EB347EA13E53863ED5F78C07FDB87CE810867ABE56FF4C175C16BA5DB00AEAE23C13BCA51F015260D101D9557F408D2EADBC251D0EAC787687A90E6733518ED1BAE4A877FE9D83088742';
wwv_flow_imp.g_varchar2_table(46) := '6A5374CABBD05528AC7FFF4C3163026810A32DD25B23A3A0DB64A9421EA4146476EE86C767CD683016F0E3D6C9CF95A0BE7408972A150E07E614E40BEFE03613123001A6402B108DE15A30A8EE105115F28DAF5EB31695EB1F33DD0B73260ABB5B5D726B';
wwv_flow_imp.g_varchar2_table(47) := 'E8F9E224BA4E3581BC49538516BBF39D4EA182DA9A851913601A24694A44A3412ADF806A4CC9CC2B658FACCE1A2290E17BCF9E5632D9A4F6F653FD2DB3DB95B7BEC8975A8C908109700FF428D21C25DED09E1CD32336BB031480CAB374D903230219FEE0';
wwv_flow_imp.g_varchar2_table(48) := 'C58BE8FCECD81D9EA774B24BB17C0AACE284323762E8D33DCB04D0812A4D26FA42217C3D1A9A30B5483D4A61D34BAAE62B5E9BE970B1D676915C97152FD3EBD7D0970C5AA5FD3B4DD5E6E43B50E670F05C5F876E99003A404A55A1EDD2FE50589916A54E';
wwv_flow_imp.g_varchar2_table(49) := '90273F4E6ED6E58BEBE059546B38347BAA6D0A513ED4D90E6F4B1BFCDE9E297B4CF37C8ADC56EAB0F3F6E60C74CA04980158DAAA03E13006C211F592CD54CDE4B9DD70161523CF6187B3BC1CD6DC1CD8CB2A6073D861B1DBD53CC6D1FE3E8CD16DB05018';
wwv_flow_imp.g_varchar2_table(50) := 'E1BE5EC4C6E3087ABD8886C2080E0F229A4CFA31D57790EB32852D2F4E73348AFB8429EB1F63021854118D0483E1080623113545ABC126EFFAB83527176E9B55F1D977E7E5F17EBE41B099000601D43E4E0E76C1684C1915E82795B3D8E857382C16C5D8';
wwv_flow_imp.g_varchar2_table(51) := 'DDB63C3879516B14CE09CF33014C85736263B4174F24B8FD338EB1F1718CC5A15CCD8CC5C795ED499ABFD30F39A5257E4F7C96FABFA851D9D208BDEEA69900BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E2';
wwv_flow_imp.g_varchar2_table(52) := '8A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BA';
wwv_flow_imp.g_varchar2_table(53) := 'A1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E0498';
wwv_flow_imp.g_varchar2_table(54) := '00BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E';
wwv_flow_imp.g_varchar2_table(55) := '049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222C0041051AB2C936E049800BAA1E28A2222F0FF12E20D88';
wwv_flow_imp.g_varchar2_table(56) := '3D8242BF0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(22241618338414055346)
,p_file_name=>'icons/app-icon-192.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_512_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000200000002000806000000F478D4FA000000017352474200AECE1CE90000200049444154785EEDDD77901CE799E7F95F79DB16AE1B6878EF48D05324454A14BD484934B21C6A56B39AD1CC6EC446DC5EEC46';
wwv_flow_imp.g_varchar2_table(2) := 'DC5DDCDD3F7B7FDC46DCED99D88DDD9DD3485A795AD193A293488A46140D2C01344CC335BA0174A34D797BF116088AA4BAAAB21AD5DD9599DF5420484A6F65BECFE779A97A2AF3CDF7F50CDF7F5F591C08208000020820E02A010F0580ABF24DB0082080';
wwv_flow_imp.g_varchar2_table(3) := '000208540428001808082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(4) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(5) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(6) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(7) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(8) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(9) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(10) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(11) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(12) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(13) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(14) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(15) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(16) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(17) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(18) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404';
wwv_flow_imp.g_varchar2_table(19) := '104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C08549276404104000010428001803082080000208B8508002C085492764770B942595CB6599BF9AC363FE783C95BF722080807B042800DC';
wwv_flow_imp.g_varchar2_table(20) := '936B2275A040BE5452A15456BE6CFE5A52B15C56A92C952A7F2D57FEB9F0D1DF7FF68BFFB31CE70B01AF24AFC753F9E3ABFCF5DC3FFB3D5EF9BDE7FEBBF37F1FF09AD61C08206047010A003B668D3EBB46A0F245AE735FE8C54F7CD1E74A25E58AA5CA97';
wwv_flow_imp.g_varchar2_table(21) := 'BBF9E237FF6CBEEC67E330F70A223EAF7C5EAF02DE73C540D0E755B0F2CFDE4AB1608A8973C503F7156623275C0381E90850004C478DCF20308302E68B3C912F2891CF2B5928CCEA977BB3C2325FFEA6208807026A0BF815F5FB2B0501070208B48E0005';
wwv_flow_imp.g_varchar2_table(22) := '40EBE4829EB850C07CD99BDBF8E94251E9A2F9D22F285F3A77EBFECF4FE9ED0D63EE07984707619F4F11F3C7EFABFCBDF9C3810002732740013077F65CD9A502E6B67DA65054AA5050AA5850A65052B654748D86792C60EE0E9C2F06627EBF823E9FFCDC';
wwv_flow_imp.g_varchar2_table(23) := '2170CD1820D0D610A000688D3CD00B1708985FF7A3D9AC26F2F9597B5E6F1756338FA03DE8577728245310702080C0CC0B5000CCBC315770A980B98D6F7EE54FE4F2952F7D736BDF29B7F5672AA5E727189E9B3B10A83C2E60EEC04C69735EB70B5000B8';
wwv_flow_imp.g_varchar2_table(24) := '7D04107F5305CC3CFC5CB1A844A1A0F15CBE5200CCD6ECFCF381982F517337FDE329776636BED7675EF6AFBCD2E7A9BCBA67FE3BAFCA1E8FCAC5A2542EFD796D00F3E641A1F871B172FEDD02F326C26C1EE6AE8029003A8201B50702F27BBDAC55309B09';
wwv_flow_imp.g_varchar2_table(25) := 'E05A8E17A000707C8A09703604CC57E3782EA7B3D99C26F38559FFA56F9EA987FC7E45A25145DADAE40B852A7FBCA1B07C61F3F761792AFF1C912F14ACFC77F2F92BFD2CE7722A67732AE5322A65B22A65322A6632957F2E66B32A64CC9F8CB2A9B4D2E9';
wwv_flow_imp.g_varchar2_table(26) := '9432854265ED81D9BC9B618A9AF38F08CC9D01DE27988D51CD359C2E4001E0F40C13DF8C0A98D9FB6773B9CA97BF79177F268F60BC4D6D9D9D8AB5B7C9FC7DA8BD5DA1785CFE584C9E48541EBF5F1E33B3FEFC2FE5F38BF45426D799D57C2C2EDA5389A3';
wwv_flow_imp.g_varchar2_table(27) := '6C960BFCF88F5939D063EE0C148B9582A19449AB904C2A3B99502E31A1CC6442E989092547479449A76792A1B2B640773058992F60EE10702080C0F4042800A6E7C6A75C2E6066F28F64B21AC9662BAFF135F530B3E4C36185DBDA155BB848F1050B14EA';
wwv_flow_imp.g_varchar2_table(28) := 'EC50301A933F1C96CF7CE1FB034DBDE4859EAC944EA998CBAA643CD269A5C6C7353178429933234A4F4E289FC99C2B269A78984587CCA38105E19042BC52D844594EE516010A00B7649A389B22902916753A93D1582E5F599DAF5987598B3F148DAA6DC1';
wwv_flow_imp.g_varchar2_table(29) := '4275F6F5A97DF90A85162DFA68A5FE665D650ECE532E293B3CA4C9A3473476FCB8C64F9D56369D6A6A31601E0F748782140273905E2E696F010A007BE78FDECF928099D077269351AA586CDA177F3C1251D7B2656A5FB64CD165CB15E8E89AA568E6F232';
wwv_flow_imp.g_varchar2_table(30) := '6515C6CE2A357842134706347AE4A892A974D3E613983B02F3C2A1CA1B04CC1398CB3C736D3B085000D8214BF4714E04CCEFFBC97CBEF2EEBE99D877A1BFF8BD3EBFE2DD5DEA5CBC449D2B5628D2DB5B99A4E7F1B9F4BDF762A1328F2075E2B8C68E1DD7';
wwv_flow_imp.g_varchar2_table(31) := 'D8D0A052A36755BAC04591CC6B83662D814591706509620E0410985A8002809181C01402E6B9FEC954BA32C1EF420EF3CA9D99813F7F699FE6AD5DA7784FAF7C1D9D17724AC77EB63431A6C4C9933ADDDF5F2906CC04C30B9D37D0150CAA371AA96C52C4';
wwv_flow_imp.g_varchar2_table(32) := '8100029F16A000604420F00901F3C56F9EF18F667317F4FE7E281452F78A959ABF7EBD622B56CADB6293F65A3DE9A57C4E8981C31AE9DFA7D3870EAB70018598796BC04C149C1F0EB3DC70AB279EFECDAA0005C0AC7273B1561538FF1EFF703A2333D16F';
wwv_flow_imp.g_varchar2_table(33) := '3A87C7E355E7EAD55AB46993DA972EABBC877F6E635C8EE90A98B5060AD9AC92832734BC6387CE0E0CA8542C4CEB74E6B1C0FC70A8F2E600DB144F8B900F394C8002C06109259CC605CCBBFC43E97465B9DEE91CDE6048F356AF56CFE6CD8A2F5ED272AF';
wwv_flow_imp.g_varchar2_table(34) := 'E84D27A656FC4CD9EC9678E2B84EEEDCA9D181C395570EA7739895051747A3950D89381070B30005809BB3EFF2D8CDED7EF38BDFDCEE9FCEAA76DE40408BCC17FF25972AD2BBC4E59AB31B7E7AF0B886B6EFD0A9FEFD2A161A2FDCCC1D8079955707C3CC';
wwv_flow_imp.g_varchar2_table(35) := '0F98DDD471B51612A00068A164D095D911306BF39B0D7A4E65A677BB3F100AA9E7A28BB4E0E24B2AABF1719B7F76F2F6D9AB98A22D3B36AEA177FFA853BB77AB5068FCD140C8EBD3C248485D95C7351C08B84B8002C05DF9767DB4E6F9BE99DD3F9DDBFD';
wwv_flow_imp.g_varchar2_table(36) := 'A1CE2E2DDABC450B366D52A8ADDDF596AD04904B26757AFBFB1AFC708FF2E3E30D77AD3318D462DE1668D88D0FD85B8002C0DEF9A3F70D0898F7F94FA4D20DBFCF6FD6DA5FB26D9B16ACDBA06057770357A4E96C0BE4C7C734BC7BA78EBFF7BE4AB9C6E6';
wwv_flow_imp.g_varchar2_table(37) := '0898DD077BA3E1CA1E031C08B8418002C00D5976798CE75EEDCB565EEF6BE830CF89D7AED3D2EBAF57A4BD835BFD0DE1CD5D63F368203336A623AFFE5EA3070F34B496C0F98D867AA211990585381070B200058093B34B6CCA168B3A964C29D9E0F3E1C8';
wwv_flow_imp.g_varchar2_table(38) := '82855A71FDF5EA58B65C5E0FB3C5ED38944C2130766440875F794599D191864288FBFD5A1A8FF1A640436A34B69B000580DD32467F2D0B989DFA061BBCE5EF8F44B5F8924BD47BD9E5F2058296AF45C3D61528A4531AFAE07D0DEEF8408564CA7247CD23';
wwv_flow_imp.g_varchar2_table(39) := '819E6858F3782460D98C86F612A000B057BEE8AD0501B355EF603255D9B1CFF2EB7D66B5B8751BB4E48A2B1459B890DBFD169CEDD624717250C7DF7CA3B28680D5C3BCE1313FCCEB8256BD68672F010A007BE58BDED61130B3FC8F2592955DFBAC1E6693';
wwv_flow_imp.g_varchar2_table(40) := '9EB5B7DFAEEE75EBF9E2B78A66D376259535B26B970EFFFE772A64ADCF09318F0496C4A20AFB7C368D9C6E23F0970214008C0AC7089CCDE67422956A680DFFF9AB566BC5F55F50B09BD9FD8E19081602C94F8CE9D02BAF68C44C12B4789809822BE2B1CA';
wwv_flow_imp.g_varchar2_table(41) := '56C31C0838418002C0095974790C661D7FF38A9F79BFDF2CF263E5F005C35A7AE9A55A74F915F20579D66FC5CC696D4AB98C86DE7B4F47DF7EDBF2FE02E691405F2CC2AB824E1B0C2E8D8702C0A589774AD8A572B9F28A9F59CBDFEA11EEE8D4EA2F7E51';
wwv_flow_imp.g_varchar2_table(42) := '1DABD658FD08ED1C2C3076F0A00EBEF0BCB2A9A4E528CDA2416619610E04EC2C400160E7ECB9BCEFE6CBFF7832A5B30D6C15BB70C346ADBCE966F9822CF6E2F2E1F3A9F0F389491D7EE9059D3978D032CBFC50488B63519610B62C46C35613A00068B58C';
wwv_flow_imp.g_varchar2_table(43) := 'D01F4B0266711FF37EFFA4C51DFC02D1A8965D795565FD7E2F13B92C19BBAD51299FD3E90FDED7C05B6FA998CF590ABF2B18542F4B085BB2A251EB095000B45E4EE8511D814617F789CD5FA895D75FAFF6152BB145A0AEC0E4C021ED7BE179E5261375DB';
wwv_flow_imp.g_varchar2_table(44) := '9A066652E0B2784C7E560EB4E445A3D611A000689D5CD0130B02E6CBFFD06442B952C9426BA9A37789D6DD79A7026CDE63C98B46E70472A367B4EF89C735393A6A89C4BC1E68DE10087177C992178D5A438002A035F2402F2C0898DBFD0389A4E5CD7C16';
wwv_flow_imp.g_varchar2_table(45) := '6FDCA4E5B7DC2A8FCF6FE1EC3441E0D3026605C1038F3EACD1E1614B34A608309303794DD012178D5A408002A005924017EA0B982FFF2389A4E5D7FC965D7685965C771D5FFEF569695143A09849EBD0534FEAF4D123969C825E6FE57140CC4FD169098C';
wwv_flow_imp.g_varchar2_table(46) := '46732A400130A7FC5CDC8A80B9EDBF7F62D2F22FFF55D75EA79E2BAF92D8C4C70A2F6DEA08948B051D7FEE191DDBB7CF9295D94570755B9B227E560DB40446A33913A00098337A2E6C45C02CED7BD8E2337F9FD7ABB5B7DCA6EE4D9BAD9C9A3608581728';
wwv_flow_imp.g_varchar2_table(47) := '9574EAD5DFEBE07BEF5ADA5F22EAF3A92F16A308B02E4CCB3910A0009803742E694DC0FCF23F6A715DFF507B9BD6DF748BE22B56593B39AD106854A054D2E8DB6FA9FFED3755B43009D53C0658D116E7ED80469D693F6B021400B346CD851A11303BFA1D';
wwv_flow_imp.g_varchar2_table(48) := '9A9854DAC2A63ED1AE4E6DBCED0E857A97347209DA22300D81B226DE7947FBDE7A53790B6B05982260757B1B8B054D439A8FCCBC0005C0CC1B73850605CC7AFE039309250A85BA9F6CEBECD2FABBEF51B08BCD7CEA62D1A06902E93D3BB5E7A59794B5B0';
wwv_flow_imp.g_varchar2_table(49) := '10D5BC50A8B293A0A76957E7440834478002A0398E9CA54902E6CBDF6CEA3392CDD63D63A4B3539BEFBE972FFFBA523498098174FF7EED7EE629E52CDCA55A1409AB271299896E704E04A62D4001306D3A3E38130283A95465739F7A47A8AD5D5BEEBC93';
wwv_flow_imp.g_varchar2_table(50) := 'DBFEF5A0F8DF675420F1A777B4E7F5D7542815EB5EC76C1E64D609E040A0550428005A2513F443C3E94CE54F59B5B7F4F5FB03DA72F7DD8A2E5D8E1A02732E70F6D557B4F74FD6DE0E58168BA92BC4F6D3739E343A5011A0006020B48440AA50D0C1C944';
wwv_flow_imp.g_varchar2_table(51) := 'DD77FDCD7EEC5BEFBD57F1E5ACEBDF1289A31352B9A4D32FBFA803DB77D42D5ECD1A01CBE331560B64DCB4840005404BA4C1DD9D3033FE0F4E4CCABCF35FEBF0783CDAF8A59BD479D1367783117DEB09140B1A7CFE390DECFDB06EDFCC92C16BDADB648A';
wwv_flow_imp.g_varchar2_table(52) := '010E04E6528002602EF5B97645C02CF13B96ABBFFDEAEACF5FAF45575C851A022D2960560C3CF1D8233A7AF468DDFE996D8497C663BC1950578A06332940013093BA9CBBAEC0E94C4683A974DD762BAFBC5ABDD75D679E5AD56D4B0304E64AA0944C68E0';
wwv_flow_imp.g_varchar2_table(53) := 'C9DF6868F064DD2E301FA02E110D66588002608681397D7501F3DCFFC044A2EE73D3259BB668F96DB74389802D044C11B0EF57BFD4D9F1B19AFD65CF005BA4D3D19DA40070747A5B37B85CA95459E3BFDE73FF79CB5768DDD7EE6657BFD64D253D9B4220';
wwv_flow_imp.g_varchar2_table(54) := '7FFA943E7CE8D74A6432357DCC9E01AB980FC0189A23010A80398277F365CD4B7EC793498D666B3FF78F767468E35D5F5168618F9BB988DDA602899D1F68F74B2FD5DD37A03318AC6C21CCC32D9B26DAC6DDA600B071F2ECDAF553E98C4EA6EB3FF7DF78';
wwv_flow_imp.g_varchar2_table(55) := 'CB6DEADAB2D5AE61D26FD70B9475FAF967D5BF7B775D09E603D425A2C10C085000CC002AA7AC2E9034EFFB5B78EEBF74F3162DBDE556C9E3851301DB0A9412133AF4C4E33A3534543306BFC75B591F201EF0DB36563A6E3F010A00FBE5CCB63DCE974A95';
wwv_flow_imp.g_varchar2_table(56) := '4D7E5275DEF78F757669EB03DF9537C08A69B64D361DFF58203778427B1E7948A93A1B07C53FDA3E98F501183CB3254001305BD25C4743E97465A9DF5A472014D2A6DBEF506CD51AC410708C4062D74EEDFCEDF375DF7861D320C7A4DC16815000D8224D';
wwv_flow_imp.g_varchar2_table(57) := 'F6EFA479E56F209194B90B50EB587BE5555A70DDF5F60F980810F88CC0C9679ED4E1BD7B6BBA783D1EADEF6857D0CBA32F06D0CC0B5000CCBC315790D43F31295304D43AE6F7F569CD9D77C91B8D638680E3044A8949ED7BEC519D3D7DAA666CF342212D';
wwv_flow_imp.g_varchar2_table(58) := '8945792BC07123A0F502A20068BD9C38AE4766995FB3DC6FADC3E7F5EAD2EFDCAF00AFFC392EFF04F46781CCC17EED7EF6696573F99A2CABDBDA9810C8C09971010A80192776F705CC463F07C62795ADB35FFADA6BAED582ABAF713716D1BB4260E4AD37';
wwv_flow_imp.g_varchar2_table(59) := 'B4EF8D3FD48CD52C10B4BABD4DE691000702332540013053B29CB7226026FD99C97FB58E790B166AFD77EE977CBC02C5B071BE40B958D4EE1FFD501313E335836542A0F3C7C25C47480130D71970F0F5CD33FFC3934915CAD527FEF9FC7E6DB9F576C5D6';
wwv_flow_imp.g_varchar2_table(60) := '6F70B004A121F06981E4FE7DDAFED4133559CCEB806642608009810C9F1912A0009821584E2B1D9A4C68B2CEBBCFCB376FD1925BD9E887F1E23681B20E3DF82B0D1D3F5E33F0EE50507D31960976DBE898AD782900664BDA65D719CFE52B13FFCA322BFF';
wwv_flow_imp.g_varchar2_table(61) := '4F7D0443615D72FFFDF27576BB4C87701190B26681A0C71F53BACE23B215F1B83A8201C81068BA000540D34939A195897F1E79B4FE86EBD57DD9958021E05281B24EBFF1BAFADF7AAB66FC31BF5F2BDBE2628540970E93190C9B02600671DD7A6A2B9BFD';
wwv_flow_imp.g_varchar2_table(62) := '74999DFEFEFA7B929F5F366E1D27C42D1527C6B4EFD14734363A5A95C314CB8BA311CD0F872043A0A90214004DE5E46456D6FBF7FBFDDA74DB1D8AAF5B0F1802AE17481DD8A7ED4F3C59F37159C8EBD3FACE76160772FD68692E000540733D5D7FB6D399';
wwv_flow_imp.g_varchar2_table(63) := '8C0653B55FFB5BBA6EBD96DE7997C4FF9DB97EBC00704EE0E0230F69F8C8404D0EE602305A9A2D4001D06C51179FCF4CF7DB37365173D11FBFCFA74BBEFE4D05162F71B114A123F06981F4D123DAF59BC7942F545F21D0EC1668E602B03810A3A7590214';
wwv_flow_imp.g_varchar2_table(64) := '00CD92E43C9AC8E7757832515362D9C517ABEF8B3749BCDBCC8841E05302471F7F4CC70F1EE02E00E362D6042800668DDAD9172A95CB3A3899A8B9E18F59D0E4E26FDFAFE0A21E6763101D02D310C81E39ACED8FFF46851A9B667506835A16675D8069F0';
wwv_flow_imp.g_varchar2_table(65) := 'F2912904280018164D11300BFE98857F6A1D7DAB5669D957EF963C6C75DA14744EE22881723EA763CF3DA3E3FDFD55E332AF029AB900F100CB663B2AF973140C05C01CC13BEDB24713499DCDE5AA86E5F77AB5F5BE6F2AD2D7E7B4D0890781A60998BB00';
wwv_flow_imp.g_varchar2_table(66) := 'EF3DF248CD3702CCA240A608E040E0420528002E5490CF5796FB35ABFE15CBD557FD5BDCB7542BBEF14D66FE335E10A82550C86BDFAF7EA19153A7AAB632930037B04700E3A8090214004D4074FB29EAFDFAF7FAFCDA76E79D0AAF5EEB762AE247A0AE40';
wwv_flow_imp.g_varchar2_table(67) := 'A27FBF763DF584CCBC9A6AC7C27058BDD148DD73D100815A0214008C8F0B1230FF27B5777C426601A06AC78265CBB5F6EE7BD8EEF782A4F9B06B04CA25F5FFE2E73A3D3C54356433A1766D7B1B3B05BA6650CC4CA0140033E3EA9AB38E66B33A964CD5BC';
wwv_flow_imp.g_varchar2_table(68) := '5DB9E5B62F2BBE71A36B4C0814810B1598D8F1BEF6BCF4B24A35B6D25E1E8FC9BC15C081C074052800A62BC7E72AFBFC1D9C9854B2D66B4B3D3DDA74EFD7A55018310410B02860DE08E87FF8419D3979B2EA27CC64C0E5F138EB695A34A5D95F0A500030';
wwv_flow_imp.g_varchar2_table(69) := '2AA62D902916B56F7CA2E6E737DE729BBAB66C9DF635F820026E1598D8B34BBB9E7BB6E6638095F1B8227E9F5B8988FB020528002E10D0CD1F3F93C9EA44AAFAEDFF7020A08BBEFF77F247A26E66227604A625501C3DA3777FF6D39A0B03F544225A14E1';
wwv_flow_imp.g_varchar2_table(70) := 'EEDAB480F99028001804D31230AFFC9957FFCC2B80D58E252B576AF9DDF74DEBFCB6FB50A9A4B259C7BD5492271462B1A36627B05454F9A3B1E6090424AF0B7EF5E6731A78FE390DEEDF575533EAF3696D477BB3B5399F4B0428005C92E8668759F7DD7F';
wwv_flow_imp.g_varchar2_table(71) := '8F47DB6EBF43D10D9B9A7DE996395FB95C56EAECA826878794181C547A7444A56251F19E1EC57A96A8BDA747918E767958F9705A392BABACF4F884264E1C53E2C409254E9F96D7EF536CFE7CC57A17AB6D51AFA2DD5DF238F829F8E4BE0FB5FB99A7ABBE';
wwv_flow_imp.g_varchar2_table(72) := '126862DFD0D9AE207B6B4C6B8CB9FD4314006E1F01D38CFF4432A533D96CD54F8723116DFBDEDFC81B76DEEDFF52B1A033DBB7EBF8F6F7941D1B972904A63A3C3E9F82B1A8965F7DADE66DD9E2E82FAA690EA3293F6666BE8FECDEA963EFBEA7ECD95195';
wwv_flow_imp.g_varchar2_table(73) := 'ABBC62EAF17814EA9EA7A5975CA6795BB7C8EBC042AB9C496BC70FFF51C91AFFAEF546225AC86380660E41D79C8B02C035A96E6EA01F8E8D2B57E3DDFFA5EB3768E997EF6AEE455BE06CE9E1933AF0C61B4A0C1CAEFAC5FF17DDF478D4B976AD565E758D';
wwv_flow_imp.g_varchar2_table(74) := '220B16B44014ADDB85F4C8191D78E525258E1DB3EC6B0A81D8E2255A77F3CD0A77CF6FDDE0A6D5B3B28E3EF11B1D3F507D97C088CFA7D5ED6D32FB047020D088000540235AB4AD0824F285CAC63FE616ED5487CFEFD7D63BEE5074CD7A47899DDDBF4FFD';
wwv_flow_imp.g_varchar2_table(75) := '2FBDA842BAFAC4C75A01FBDBDAB4F6FA2FAA6BBDB35C9A95E4B103FBB5EFF9E754ACF16BB7D6B57CE19036DC76873A56AD6956975AE23C89FE7DDAF1D493528D950157B5C5D566E6467020D0800005400358343D27702C99D468B6FAC63F5D8B1669C3D7';
wwv_flow_imp.g_varchar2_table(76) := 'EE9627D6E618B2D4A9616DFFF94F2DFF2AAD16B8C76C89FC570F283A7FA1636C9A1148727858BB1E7950C54CE6824EE70B87B5E5EE7B2B73049C72947219EDF9F18F3491A8BEDB264B033B25DBB31B0705C0EC7ADBFE6A66F6FFFEF1899AB7FFD75D73AD';
wwv_flow_imp.g_varchar2_table(77) := 'E65F7D8DED633D1F40219BD1F65FFD42D99191A6C4145BB64C9BEFFAAAFC2C8E54F12C160B15DFCCF070537C83DDF374C903DF95CFE79C2D73875F785E0777EEA8EA13F3FBB5A22D2E3F8F019A3286DC72120A00B764BA4971D65BFCC7EC54B6ED5BF72B';
wwv_flow_imp.g_varchar2_table(78) := 'DCDBDBA42BCEF569CA3AFEE61B3AFAE61B4DEDC8B2ABAF51DF35D736F59C763DD9D1577FA7E37F7AA7A9DD5F76E5D5EABBEEF34D3DE75C9E2C7BE880DE7FEA2995CCABA6531C666F8065B198E201E7143D73E9ED966B5300B825D34D8AF36C36A7A3C964';
wwv_flow_imp.g_varchar2_table(79) := 'D5B32D5CB2446BEEB94F0A38638DF2C2A961BDF3CB9FAB5C2C3649F0DC69BCC1802EFFF65FC93FCF6993D61A632A8C9ED13B3FFD6F4DF7356F605CF1C077E577C8A440F336C09E471ED6788D0D82781BA0B1B1476BB1101083C0BA8099F2675EFF1BA931';
wwv_flow_imp.g_varchar2_table(80) := '496BFDB5D76ADE559F931CF26EF6E9577FA7FE26FF3A3D2FBEF6F22BB4E0FA2F584F80035B8EBCF347ED7BEDF73312D986EB6F50F7E557CEC8B9E7E2A483BF7F5903EFBE5BF5D2666F8015F1F85C748D6BDA54803B00364DDC5C74DBBCF6776432A1548D';
wwv_flow_imp.g_varchar2_table(81) := '5FC3977EE3DB0AF7F5CD45F766E49AFD4F3EAED3FDFB67E4DCF397AFD03AB351924B0FB3E1CDC1175FD0A90FF7CC8840CF968BB4EA965B1C538C4E1CECD7874F3C2E330F67AAC32C06B4B1B363462C39A9330528009C99D719896A229FD7C064B2EAEB7F';
wwv_flow_imp.g_varchar2_table(82) := 'FE404097FFE0EFE50D3A676DF29D8F3CA4C9230333E21999374F977CF79FB976D9E07232A11D8F3FA6E450F57DEF2F04BE7DD56A6DBEE55679A2B10B394DCB7CB6383EA60F7EFC23658B8529FB645605DCD8D92E331F8003012B0214005694685311184E';
wwv_flow_imp.g_varchar2_table(83) := '6734944E57D5E85EB8481BFEEABBCED12A97B4FDA107953C7E6C4662F285A3BAEA077F2FF95CB0AEFD1482A5B151C98C35290000200049444154FDE997BF9CF6BA0AF592125DDCA78BEEB85DDEF6CE7A4D6DF1BF97B319EDFFCD631A3971BC6A7F97C763';
wwv_flow_imp.g_varchar2_table(84) := 'EA0C3A63FE8D2D9262F34E5200D83C81B3D9FDC3930999BB00D58E95975EA6DE2FDC389B5D9AF16BED78F841258E1E9991EB04E36DBAFCFB7F27B9F4175B2931A1ED8F3EAAF499D333E21B5FBA4C5B6FBF439EB843D6A3289734F487D775E88F6F57F59A';
wwv_flow_imp.g_varchar2_table(85) := '170A69492CEA90193833322C38E927042800180E9605F68E4D285B9A7A36BC3F18D4E6DB6E576CCD3ACBE7B343C3BD4F3EA1D1FEEABBB15D480CED3DBDDAF29DFB1DF38CBA510BF38B76DFF3CF6BF4C00CCDB1D8B8596B6FBA491E87BC91627C134706B4';
wwv_flow_imp.g_varchar2_table(86) := 'E39187AA5287BC3EADE968633D804607A34BDB5300B834F18D866DDEFFEF9F98ACBA2B59B4A353177FF35BCEF9B5F511D0B1D77EA763EF34F71DF5F3F64B2EBA58CB6F3293D4DC7B1C7FF30F4D5F63E1BCE68AEB6FD06207BD0560E232CB506FFFC7FFA2';
wwv_flow_imp.g_varchar2_table(87) := '6C61EA7900A6CD868E76855CFA58C9BDFF264D2F720A80E9B9B9EE536732599D48555F037F5EDF52ADFFC6B71CE732BE7FAF769B75D89B7C980D6C36DC7C8BBAB65CD4E433DBEB74E307FAB5FB89DFCC48A7B7DC73AFDA57AC9A9173CFD549CDFE1BFB7E';
wwv_flow_imp.g_varchar2_table(88) := 'F2238DD6589592790073951DFB5D9702C07E399BF51E9B978E8E26921ACB555FFF7FD55557A9E7DAEB67BD6F337DC1FCE484B63FF46BE5C6C69A7A29B35CEDB66F7C537E87CC509F2E8E5966F9BD1FFD50851AC5E574CE6DF604B8FC6F7F209F836EFF9F';
wwv_flow_imp.g_varchar2_table(89) := '7738F9C26F7578E7F6AA2C0BC2612D8E46A6C3C6675C264001E0B2844F275CF3DE71FFF864D5E7FFE69C9BBFFC1575387497BBC15DBB34F0DB67A74337F5673C1E2DBFFE0B5A72D9E5CD3BA78DCF74ECEDB774EC8DD76BEE76D750781E8F965E739D965E';
wwv_flow_imp.g_varchar2_table(90) := '7575431FB34BE3C487BBB5F385E7552E4C3D1F870581EC92C9B9EF2705C0DCE7A0E57B502897F5E1D878D5E7FF01AF4F5BBEF92D451CB403DB27935252593B7EF173A5864E36255795F7D3BFF25579BCEE7CFDEFB3886633A00F7EF21365C7469BE21B5B';
wwv_flow_imp.g_varchar2_table(91) := 'BC445BBFF14D791DEA5B1839A3F71E7E4885E4D4BB039A8D81CC6300D60368CA7072F44928001C9DDEE604972D16B5777CA2EAC9BA7B7AB4FA8E3B15E8EC6ACE055BF02CE9D133DAFEF39FA954E335482BDDF60602DAF6D7DF53B89D15DB3EE9953C7942';
wwv_flow_imp.g_varchar2_table(92) := '3B1F7A50A51A93DBACF8FA23516DFEDA3D8A396633AABF8CBA6C0AA69FFD54E99133539298370196C6A33285000702B5042800181F750512F9820E4E4E566DB778C3462DBBF14679C3D1BAE7B27383B37B76ABFFF7AFA8506331A45AF1F96371ADBBE916';
wwv_flow_imp.g_varchar2_table(93) := '75AE5E6D678619EBFBC4E143DAF3F4932AD5986B52EBE2DE60489BEEFA8ADA97AF98B13EB6CA89F73CF46B8D1D3B3A6577CC8E9C7DD1A8BA422C08D42AF96AD57E5000B46A665AA85FF576005C79E5D5EA75D0D6ABB5E853C78F6ADFEF7EA7F4A9C6F6AE';
wwv_flow_imp.g_varchar2_table(94) := '8FF52CD2DA1B6F56B4C729DB24CFCC004D0D1ED7BE175EA8FAEBB6DA55C35DDDDA70EBAD32ABFFB9E138F4ECD31AAAB187424F24A24511E72CC9ED869CCE458C140073A16EB36BD65B0278E32DB7BAEA75B652B1A023AFBCACA19D3B54AEB231CBC729F6';
wwv_flow_imp.g_varchar2_table(95) := '78B4E4F22BB4F4DAEB1CFB4CBAD9C3B994CFE9E8EBAFEBE4F6F7552E956A9EDEE3F5AA77DB255A76DDE7E5F5079ADD95963DDFD01FDFD2A1D75FABDABFEE50504B63CED803A16593E0808E5100382089331DC2F13A5B005F7CEF7D8A2D5F39D3DD68B9F3';
wwv_flow_imp.g_varchar2_table(96) := 'E7262795183AA9F4C48432E363CAA6922A15CB8AB4B72BDCD1A1D882F98A2E58A8609857B2A693BC7C3AADC4E07125CF9E556E7242A9C9843C3E9FC291A8426D6D8A76B62BBE64A9822E7C957274E70EED7FF1B75527E69AE7FF6BDA1DB204F274060F9F';
wwv_flow_imp.g_varchar2_table(97) := 'B12440016089C9BD8DCC1B00660D80C91A93DFAEFC9B7F2E7F67B77B91881C815916481E3AA0DD8F3FAE4279EA3B246C0D3CCB09B1E9E528006C9AB8D9EA76AA50D0B1644A6629E0A90EAFCFAF2B7EF0F7F2F12B77B652C27510506EF8A4F63EF5B412E3';
wwv_flow_imp.g_varchar2_table(98) := '67A7D4F07BBCDAD4D5C1A6408C95DA8FD086EFBFCF2CF4C681C09402E3B9BC8E2693556F358663716DFBDEDFC8CCC0E6400081D911284D4E68DF334FE9EC8913535ED0E7F1687D473B6B01CC4E3A6C7B15EE00D83675B3D3F1916C56660E40B5A36B499F';
wwv_flow_imp.g_varchar2_table(99) := '36DC7B9F3C2E9A80353BF25C0581DA02879E7D46431FEE9EFACE9CC7A395F1B8E201D602601C5517A0006074D414184AA765DE02A8762CDEBC59CB6FBE9555ED184708CCB2C0F1D75FD3D13FBE35E5553DF268698CB500663925B6BB1C0580ED5236BB1D';
wwv_flow_imp.g_varchar2_table(100) := '3E914CE94C363BF5FFC978BD5A7EF995EABDE61A0A80D94D0B574340C3EFBDAB83BF7BB96A01D01B0DCB6C0CC4814035010A00C6464D8163C9A446B353EF02685EC95A7DEDE7B5F0D2CB24AF1749041098458133BB7668FF6F9FAF5A002C0887D4138D30';
wwv_flow_imp.g_varchar2_table(101) := '1170167362B74B5100D82D63B3DCDF2335B601F605025A77E397D4B579EB2CF78ACB2180C0E8DE3DDAFBCCD3550B80F9E1A0CC8A806669600E04A612A000605CD414383C99D044953500FC818036DCF665B5AF5D8B220208CCB2C0D881FDDAF3C4E355AF';
wwv_flow_imp.g_varchar2_table(102) := '6A56035C128D5200CC725EEC74390A003B656B0EFA7A706252892A3BB40582416DBCF32B8AAF70DF2A8073900A2E89C0A704C6070E6BF7A30F5755690F04B42C1E937925900301EE0030061A16A85D0084B5E5DE7B15E95DDCF079F90002085C98C0E4F1';
wwv_flow_imp.g_varchar2_table(103) := '63DAF9E0AFAA9E24EEF76B795B5C7E0A800B8376F0A7B903E0E0E43623B40313934A56B903100A47B4F9EBDF5078C1C2665C8A732080400302C9E1216DFFF94FAB7E22EAF76B25054003A2EE6B4A01E0BE9C371471FFC4A4CC72C0531DE168445BBFF91D';
wwv_flow_imp.g_varchar2_table(104) := '05BAD807A021541A23D00481F4E888DEFFF13F553D53D8E7D3AAB638AB0136C1DAA9A7A000706A669B1457FFF8845255F601884463DAFAC003F2C7D875AC49DC9C0601CB0299D1337AEFC73FAADA3EE0F56A6D7B1B05806551F735A400705FCE2D476C36';
wwv_flow_imp.g_varchar2_table(105) := '89300540BA4A01106B6BD796071E902F1CB57C4E1A2280407304326747F5FE8F7FA472951D01CD86406B3BDA647606E440602A010A00C64555817A0540BCB3535BFEEA017983AC36C6304260B605B2E3637AFF9F7EA8529502C0CCFE377700423EDF6C77';
wwv_flow_imp.g_varchar2_table(106) := '8DEBD9448002C026899A8B6ED62B00DA3ABBB4F981EFCA1B08CE45F7B82602AE16C84D8CEBBD1FFD934AC5A9E7E85000B87A78580A9E02C012937B1BD59A0310EBE8ACCC01E00E807BC70791CF9D40BD3B003C0298BBDCD8E5CA140076C9D41CF5B3D65B';
wwv_flow_imp.g_varchar2_table(107) := '00D1B6B8B6DEFF5DF9A2B139EA1D9745C0BD02660EC07B3FFEA1646ED54D719867FF6B9804E8DE016221720A000B486E6E526B1D807034AA8BBE73BFFCED9D6E26227604E644203D7AA63209B0DAC16B807392165B5D9402C056E99AFDCED65A0930188E';
wwv_flow_imp.g_varchar2_table(108) := 'E8A26F7F4741D60198FDC47045D70BA4474EEBFD9FFCB8AA43D4E7D3CAF636560274FD48A90E4001C0E0A82950B3000845B4E5BEFB145ED483220208CCB24072E8A4B6FFE26755AF1AF3FBB582950067392BF6BA1C0580BDF235EBBD3D3499D06495DD00';
wwv_flow_imp.g_varchar2_table(109) := '03A190367DE56B8A2D5D36EBFDE28208B85D60E2E811ED7AF8C1AA0C6C06E4F611523F7E0A80FA46AE6E516B3BE073BB01DEA5F88A550E33AA32ABCA6151BA2F1C67ED8A3776F080F63CFE58D534B21DB0FB4678A3115300342AE6B2F64713499DCDE5A6';
wwv_flow_imp.g_varchar2_table(110) := '8CDA1F0868ED4DB7A86BE3265BAB14CE8EEAD4EE9D3A337044D9744AE52A2B1FDA3A483A2F79BD8AB4B5AB7B699F166DDA227FF73C5BAB9CEDDFA70F9F7C62CA183CF2684138A44591B0BCEC0668EB3CCF64E729006652D701E73E9E4C69249B9D3212AF';
wwv_flow_imp.g_varchar2_table(111) := 'DFAFD59FBF410B2EB9D4B69196CE8E68EF6F7FABB113C76D1B031D6F5CA063C1026DFCEAD7E4B5F11B2C6776EFD2FEE79FAD5A00982F7F53045000343E3EDCF2090A00B7647A9A710EA6523A9D99BA0090C7A355575DA59EABAFADFCBAB2E371E6CD3F68';
wwv_flow_imp.g_varchar2_table(112) := 'FF9B6FD8B1EBF4F90205365C7F83BA2FBFF202CF32771F3FF5FE9F74E09557AA1600BD515300B04CF7DC65A8F5AF4C01D0FA399AD31E9E4CA5752A93A9DA87255B366BF94DB7D9B600E87FF0573A7DFCD89C1A73F1B9115872D1362DBFE9E6B9B97813AE';
wwv_flow_imp.g_varchar2_table(113) := '7AFC0FAFEAE8DB6F572D0096C6A2EA0AB14C7713A81D7B0A0A00C7A6B639819DCE6434984A573D59575F9F36DEFB75C9E76FCE0567F92CFB1E794823470666F9AA5CAE15047A2FDAA695762D004A251D7CEE190DEFFD704A4A73DB7F453CA6B640A015A8';
wwv_flow_imp.g_varchar2_table(114) := 'E9438B0A5000B468625AA55B63B99C8E249255BB138EB7EB92EF7D4F1E9B6E0834F0DCB31ADCB3AB55B8E9C72C0A2CBBF26AF55DF7F959BC62F32E559A18D3DE679ED1D8E089AA05C03A76026C1EB843CF4401E0D0C4362BAC44BE203311305B2A4EFD7F';
wwv_flow_imp.g_varchar2_table(115) := '345E9FAEF8BB1FD8763F80A1B7DED0A137FED02C2ECE632381B5377E490BB6D973026B7EF8A4763DFE1BA5138929C5CD46401B3BDB990068A3F138175DA500980B751B5D33572AC9BC0A982C4CBDE5A809E5B2EF7E4FA1F9F36D14D59FBB7A76CF6EED7D';
wwv_flow_imp.g_varchar2_table(116) := 'F1B72AD788CF9681D1E9BA029BEFB94F1D2B56D66DD78A0D260F1DACAC01502C4FBD6645C8EBD386CEF656EC3A7D6A21010A80164A46AB76A5D65A00A6CF17DD73AF6D17034A9E38A63DCF3EABFCC4F894FCBD9BB768FDBFFD9F5A3535F4AB86C0DE7FFF';
wwv_flow_imp.g_varchar2_table(117) := 'BF69687795C73B1E8FB6DDFF5D45172EB4A5E1C8CE1DEA7FF1B72A552900E2E615DDF6365BC646A7674F800260F6AC6D7BA57A6F026CB8E916755F74B12DE3CBA753DAF5D8A34A0F9D9CFA566A28A4EBFECB3F491E7BBEE668CBA434A3D3E5925EFFBBEF';
wwv_flow_imp.g_varchar2_table(118) := 'A9506511AB40BC4D177FEBDB0AB67734E36AB37E8EC13FBCA681B7DFAA7ADD79A190FA62D159EF1717B497000580BDF23527BD1DCD66752C99AA7AED55575FA39E6BAE9D93BE5DE845CB2A6BD7E38F6BF2607FD5535DF3EFFE7705D9EFE042A967F5F3B9';
wwv_flow_imp.g_varchar2_table(119) := 'A3037AE37FFE1FAA5E33BE6AB5B6DC7187BC417BBE277FE0C9DFE8547FF531DB1389545601E440A096000500E3A3AE809908787072B26ABBC59B3669C52D662D005FDD73B56283032FBFA4531FBC57B56B17FFCDDFAAEB861B5BB1EBF4A98AC0D9575ED4';
wwv_flow_imp.g_varchar2_table(120) := 'F61FFFB0AA4FCF15576AD5B59FB7EDFA15BB7FFD4B8DD758BD72592CC61A00FCDB51578002A02E110DF2A592F68C4DFD8CDCE874F52ED69ADBEF50A0B3CB965883EFBFA781575EAADAF7959FBF41CBBFFFF7B68CCDAD9D1EF8C7FFA481D75FAB1AFEEA5B';
wwv_flow_imp.g_varchar2_table(121) := '6ED7A22D5B6CC953CEE7F4FE2F7FA1CC99D353F6DF4C005C1A8FCA6C07CC8100770018031724502897F5E1D878D50947E148441BBF768F22BD8B2FE83A73F5E1F18143DAFDE823552FDFBEA84797FEFBFF3057DDE3BAD31078F7BFFF579AACF205694EB7';
wwv_flow_imp.g_varchar2_table(122) := 'F5DBDF515BEF92699C79EE3F923F734A1F3CF6A8F255EECA992FFE65F19882365D9E7BEE85DDD303EE00B827D7D38ED4CC34EE9F9854A6C62E799BEFFAAA3AD6AE9BF635E6F28399E121BDF7F39FD6ECC2F5FFE9BFCA1B6356F55CE6C9EAB58BE3637AED';
wwv_flow_imp.g_varchar2_table(123) := '5FFD43CDE697FFFD3F28188D5B3D654BB59BDCBF57BB9E7BB6EAABAB9DC1A096C7632DD5673AD39A021400AD999796EA9579D3F87832A9D1ECD4DB029BCE2EBFE4322DF9A23D9F931727C6F4EE2F7EAE42AAFA44C72BFEF5BF51EC627B2E1AD352836916';
wwv_flow_imp.g_varchar2_table(124) := '3A9378EF1DFDE9FFFE3FAB5EC9170AE9CABFFF97F2F8EC396765E8772FE9D07BD5E7AC2C0C87D51B8DCC823497B0BB000580DD33384BFD376F021C4FA66566CD4F7554F604F8C6B767A9374DBE4C3EA7FDCF3CAD33070F543DF1AA1BBFA4657FFDFD265F';
wwv_flow_imp.g_varchar2_table(125) := '98D3CD84C091FFEF3FEBF06BBFAF7AEA79CB9669FD7DDF9C894BCFF8394B2A6BDF7FFB89CED678BC617EFD9BBB001C08D413A000A827C4FF5E11302B02EE1F9FA8BAF258A4B34B5BEFFBBAFC367DAF7A64C707DAF7E20B55B31D088775CDFFFB9FE50986';
wwv_flow_imp.g_varchar2_table(126) := '18112D2C50CE65F5FA3FFCAD8A85FCD4BDF478B4EEFA2F68FE6597B77014D5BB96CF66F4EE7FFA8F2A954B551BADEF6857D8A677376C99141B779A02C0C6C99BEDAEEF1D9BA8BA27802F10D4A6DB6E53DBDAF5B3DDADA65CAF904CE89D7FFC2F2A97AAFF';
wwv_flow_imp.g_varchar2_table(127) := '1FEB253FF817EAB8C69E9BC73405C90627197BF5157DF0C3FF5AB5A7BE4844977EE77E053AECF9C6CAE4D101ED7CF8A1AAF1993700D674B4C9EFF1D8205B7471AE052800E63A0336BAFEB13AF300965D72A9FABEF8251B45F4E9AEEEFAF52F3551E3DDEA';
wwv_flow_imp.g_varchar2_table(128) := '85EB376AD3FFF8BFD8363E37747CD7BFFB5F75A67F7FD550BBD7AED386BBBE6A538AB24EBCF9A68EBC597DF3AAEE50507DB198F8FAB7698A67B9DB1400B30C6EE7CB9DCE6434984A570DA16DC1426D7DE0AF6D1BE299DDBBD4FFDBE754AEB2BEBA09ECBA';
wwv_flow_imp.g_varchar2_table(129) := '7FFF1FE45FD463DB189DDCF1FCA921FDE1DFFC775543F478BD5A77FB97356FFD065B3298F7FFF73DF688468F1FAFDA7F9EFFDB32B573D6690A8039A3B7DF8527F3791D4DA454A8F2FCD1EBF1EA8A7FF817F285ED3903399F49EBFD9FFC58E67140B563C3';
wwv_flow_imp.g_varchar2_table(130) := '57BEA69E7BED3981CC7E23AEB11E0F3EF80BED7FFAC9EAB7C7E7CDD796BBEF56A8BDB3B113B748EBDCC49876FCF847CA55D9B9D2EBF1684347BB02BCFFDF22196BFD6E5000B47E8E5AA6876645C02375B606DEF6AD6F2BBAB8AF65FADC6847F6BFF0BCCE';
wwv_flow_imp.g_varchar2_table(131) := 'ECDC51F56391F64E5DF5FFFC4736076A147686DB974B45BDF92F7FA05C2A59F54A8BAEB852AB3F7FC30CF764E64E3F7EF8A0F63CF658D53771CCC23F1B3BEDB9B9D1CCA971E65A0214008C8F86044E24533A93CD56FDCC9AEBAFD7C2CBAF946CFA1472EC';
wwv_flow_imp.g_varchar2_table(132) := 'F021ED7DEA0995F25566914BBAE25FFF5BC52EBEA421371ACFAC40E2FD3FE94FFFD7FF51F3225BBF7DBFDA6CBA5AA509ECF89B7FD0D137DFA81A634730A015717B2E6E34B3A383B35713A000606C34243096CB55EE02543BE6F52DD5DABBEF913760CFF7';
wwv_flow_imp.g_varchar2_table(133) := '904BF99C763EFAA892278E35E442E3D616882EEAD145DFFA8EBC367D3DCEBCDEB8E7C927347E64604A688F3C5A1C8D687E98D7545B7B24B656EF28005A2B1F2DDF9B7A1B03F9BC5E6DFB9BEF2B64D3F5004C0206DF795B03AFBDDAF2B9A083D605CC424E';
wwv_flow_imp.g_varchar2_table(134) := '3DDBECBB9263E6E4A0763CF11B15925317DFE6F6BF990018650320EB838296A2006010342460655F80B537DDAC05176D6BE8BCADD4387BF6ACDEFBF10F6BBE0DD04AFDA52FB505BCC1902EFBE7DF572012B52DD5A93FBEA903AFBF5EB5FF71BF5FABDBD9';
wwv_flow_imp.g_varchar2_table(135) := 'ABC2B6099EA38E5300CC11BC9D2F3B944E6B389DA91A42F7F2155A7FD7576CBC6A5E59FDCF3CA5D37BF7DA394DF4FD2381056BD769AD6DDFFD972ACBFFFEEA173A3B385835A73D91881645C2E41C81860428001AE2A2B111C8168BDA373E597536B23F14';
wwv_flow_imp.g_varchar2_table(136) := 'D696AF7C45D1A5CB6D0B961E1BD5073FFA27EE02D83683E73A6E56FEBBE8BE6F28B260A16D23499D1CD4F6877E5D75F73FF3FC7F7D479B42369DDF60DBC438A0E314000E48E25C84D03F3EA1548DED81975D7699FA6EB0E7EE80E73D0FFFEE259DACB1EB';
wwv_flow_imp.g_varchar2_table(137) := 'DA5CB873CDC604967CEE1A2DFFDCB58D7DA8C55A1F7FF9451DFDE0FD9AB7FF57B6C565D601E040A011010A8046B468FBB140BDC700B1790B74D177BF2B8FC76B5BB55C22A15D8F3DACCCE9D3B68DC1CD1D0FCD5FA0ADF7DCAB60DCBECFC68BB9AC76FEE8';
wwv_flow_imp.g_varchar2_table(138) := '874A5599FC67F2BB3416557788D9FF6E1EEBD38D9D0260BA722EFF5CAA50D0402229F356C05487D96BFDE27BEF53B46F99ADA50677EDD491179EE751800DB3B8FAAEAF6AD1DA7536ECF99FBB9C38714C3B7FFDEBAA8FDB4CCB4D9D1DACFE67EB2CCF5DE7';
wwv_flow_imp.g_varchar2_table(139) := '2900E6CEDED657366F031C4D26359EABBE60CEB2AD17A9EFE65B6D1D67219FD787CF3CA9C983076BC6B1B8A7473D8B17DB3A56BB747E68705083434335BB1B5BB65C5BEEBD4F3E1BDF8152B9A4C3BF7B4527DF7FAF6AAC31BF5F6B98FD6F97A1DB72FDA4';
wwv_flow_imp.g_varchar2_table(140) := '0068B994D8A74367B3B94A1150ED0886C2DAF6FDBF95991468E7637CE48CF6FCECBFA95C63CE83896FCDEA356AEF68B773A82DDFF7F1F1711DAC538C99897FEBEFFDBA3A172E6AF9786A75B03039AEED0F3EA8ECF8D8D477D958FCC7D6F96D85CE5300B4';
wwv_flow_imp.g_varchar2_table(141) := '42166CDA8742B9AC0FC7C665EE06543B2EBAE75EC557ACB26984E7BA5D5659FD2FBDA833DB3FA819872F10D08675EB150AD97315C4564F52369BD387FBF6A954A87ED7C9C4B070DB255A7DE3976466C7DBF918DBBD537B9E7FAE6A08619F4F2BE23166FF';
wwv_flow_imp.g_varchar2_table(142) := 'DB39C973DC770A80394E809D2F6FBEF68F2412351F032C58B3566BBF7CA7E4F3DB3954999D02DFFBE17F55319BAB19472416D3FA75EB9891DDE46C9B2273DFFEFD4AD7B8E3642E199A375F177DE31B0A44624DEEC12C9FAE54D2DE871FD4E8F1EA4B52CF';
wwv_flow_imp.g_varchar2_table(143) := '0B85D417B3EFE246B32CCAE5A610A00060585C908099033090A8BE7DAED7E7D7D6BBEF9179266BF76378E70E1D7CE1F9BA617476776BD58A1575DBD1C0BAC0A181018D8D8ED6FDC086AFDEADEED56BEAB66BF506934706B4FB89DFD4DC94CA2CFDDB19E4';
wwv_flow_imp.g_varchar2_table(144) := '6E53ABE7B295FB4701D0CAD9B141DF8AE5B2F6D4790CB068C346ADBEE34E1B4453BB8B660E40FFCB2FE8CCCE9D756359B4A8474B963029B02E948506274E0C6A78B8F6A43F739AF99BB76AEDCD37CBE3F559386B6B37D9F7C8831A3972A46A27435E9F56';
wwv_flow_imp.g_varchar2_table(145) := 'B7C799FDDFDA696CF9DE5100B47C8A5ABF83F5B608F68542DAF6B57B145AD2D7FAC1D4E9612E31A13D4F3CA1D4D0C9BAB1F4F42ED6E2DE9EBAED68505DE0C4C9210D9FACBE04EEF94F86CDBA13DFFA96ED279C9A7852A74F69C7CF7EAA5279EA576C4D1B';
wwv_flow_imp.g_varchar2_table(146) := '96FEE5DF9A660850003443D1E5E748178A3A9C48545D13C0F02C59BF5ECBBFFC154748A52727B4F3173FABBA33DB2783EC5DBC44BD3DF69E8D3E57491B1C1AD6D0E089BA97F7C7E2DAFACD6F29D2D955B7AD1D1AF43FFBB44E7FB8A76A57CD8A7F1B3ADA';
wwv_flow_imp.g_varchar2_table(147) := 'F9F56F8764B6781F29005A3C4176E9DEF1644A23D96CD5EE9A19F2DB1EF8670A7576DA25A49AFD1C3D7E54079E7E5A8564F5F90FE74F4011D078CA4F0E0DEBA4952FFF68446BEFFCAABAFA96367E9116FC446EF48CFEF4931F4B35DEAC31CFFDCDF37F0E';
wwv_flow_imp.g_varchar2_table(148) := '042E548002E04205F97C4520532C6A7F8D0D824C9BBE6DDBB4ECC69B1D2336B867978EBEFCB24AB9EA85CFF9607B7A7AB49885822CE57E707050437516FAA99CC8E3D1CABBBEA6DE35F69FF4770EA6ACE3AFFE5E47FFF44E5527BFC7AB156D3199058038';
wwv_flow_imp.g_varchar2_table(149) := '10B850010A800B15E4F31F0B1C4D24753657FD35B9803FA06DFFFC6F158839E3D78B591FE0E8FBEFE9C42B2F5B1A05F3E72FD0D2A57DF2B069CB945E65B3BAE4B1631A3973A6BEA7C7A3BE9B6ED6D2AD17D9FE7DFFF3C1A68787B5FDA15FA954E3DFA1EE';
wwv_flow_imp.g_varchar2_table(150) := '50504B1DF2EF4FFD24D362A6052800665AD845E7377301F64F4CD48C78E5E73EA7DECF5DE7189562B9A48137DED4F0DB6F588A29DEDEAE952B5628C02FB84F79E50B051D3A3CA0E464EDF173FE438BAEBA5A2BAEB9D6DE4BFD7E66C41C7BF9451DABB1EB';
wwv_flow_imp.g_varchar2_table(151) := '9F59D8684D7B5C51C68EA57FD768545F8002A0BE112D1A10383499D064BEFA4A6DC1F60E5D7CDFD71570C8842D43638A80FE679ED6E8BEBD96A4FCC1A0562E5BAE36D670AF784D4E4CEAF0D1232AD4F8E5FB49D885975CAA95377C413E07BCEE773EAECC';
wwv_flow_imp.g_varchar2_table(152) := 'E888763DF86BE552D597D6EE0A06B5341EB3F9FA8696FE15A1D12C095000CC12B45B2E3396CBE95832557379E065975FA1BEEBBFE02892623EA77DCF3CADB183072CC7D5DBBB58BD2E7F4DF0E4C993327FAC1E5D6BD66ADD6DB7CB1774D6F6B77B1F7D58';
wwv_flow_imp.g_varchar2_table(153) := 'A30387AB32985FFF6BDBDB14F1DB7F8D03ABB9A6DDCC0B5000CCBCB1ABAE60966C3D3C9950A250A81AB7591DF0E27BEE5164A9FD5707FC6490A608F8F0E10735D1C0175ABCAD4D4BFB962A12B1F786498D0EF2743AA363C78F29313969F9A36D3DBDDA74';
wwv_flow_imp.g_varchar2_table(154) := 'DFD71DF7E59F3876543B1EFA754D0776FDB33C4C68D880000540035834B526506F79607396AEDEC5DAF0AD6FCB63E7ED5AA7E028150B3AFCD20B1ADEB5CB1AD647AD16F6F4A8B7B7573E874F102C94CA1A1A3AA9535666F97F4270E1E6AD5A75E38DF206';
wwv_flow_imp.g_varchar2_table(155) := '9CB5F4AD291AF73EFC90C66B2C76647EFD2F8B4759F6B7A17FA3686C458002C08A126D1A12307701CC5C80648DBB00E6841BBE7CA7BAD76F6CE8DC76686C66B30FBEF3968EFDF11D4BAF089E8FC91F0A69C9E2C59AD7E58C056D3E9BAB33A36735787250';
wwv_flow_imp.g_varchar2_table(156) := '851AEB457CF633DE4040CBAFBF413D66B6BF839EF99F8FF3F4F60FD4FFD20B3587757B20A0956D713B0C7DFA6833010A009B25CC2EDD355FFE07266ADFDE0DC6E2DA76FF5FC91F6FB34B580DF5736CE0900EBCF4A272E3E30D7D2ED6D65E593DB0BDCD19';
wwv_flow_imp.g_varchar2_table(157) := '2E139393320BFB589DE1FF7141148B6BDD6DB7A973F9CA86FCECD2383B3AAADD8F3EA44C8D3767CCAA7F2BE371C503BCF76F97BCDAA99F140076CA96CDFA7A249194991458EB587ED9655A72C38D368BCC7A7733A9B4F63FF394124707AC7FE8A396D1B6';
wwv_flow_imp.g_varchar2_table(158) := '762D5AB4489D6D71DBAD1D60EE829C9D9CD4A9E1534A597CB5EF93406D2B5769CD4D372BD2D6DEB09B5D3E70F0B9A735BCA7FA92BF268E05E1B07AA31166FEDB25A936EB270580CD1266A7EE9A7501CC56C1B952F54D4D7CE188B6DC7DB762BD4BEC145A';
wwv_flow_imp.g_varchar2_table(159) := '437D2D16F23AF2F6DB1A7AFBCD863E77BE71301AD3C205F3D5DDD52DBFD733AD73CCD687CC33FE91B3A33A7DFA4CCD57DAAAF5C7EBF7ABE7AACFA9EFD24BE577D8F3FE4FC69C3C395899F857AEF198CCACFAB7BEB35D7E87CF0B99ADB1C975FE52800280';
wwv_flow_imp.g_varchar2_table(160) := '5131A302A7D2199D4CA76B5E63DECA955A77F7BD8E59D16DAA60CD2FE2917D1FEAC08B2F36342FE093E7326F4FB47775AABBBB5BF168AC658A01F3A53F994CEAECD9514D9C1D939908399DC31F8F6BCD976E56F7EAD5669DDFE99CC2169F2915F2DAFDEB';
wwv_flow_imp.g_varchar2_table(161) := '5F69B2C616C766E2DFE26844F3C3CE7ADDD1160972512729005C94ECB908B5F8D184C0549D09811BEFFA8ABAD6AE9F8B2ECEEA35336747B5FFE9A79438357C41D7355B2CB7B577A8ABB3436DB1F8AC1703E7BEF4131A1D1B5762625CC50626F64D15787C';
wwv_flow_imp.g_varchar2_table(162) := '518F36DCF16505BBBA2FC8C50E1F3EB57B970E3CFF6CCDAEC6FDFECAC43F33078003819912A000982959CEFBB180F9F23F309190593BBFDA616E736F7BE001F963CE98F8562BFDE57C4E23FBF7E9F05B6F2ADFE004C1A9CEEBF1FB158FC5148FC71589C6';
wwv_flow_imp.g_varchar2_table(163) := '148E4614F27A9B366FC0DCBDC8964A32F31952A9A412898492C964CDDBD756877F78FE022DBBE412CDDBB4451E9FF317B9C94C8C69CFC30F2933365695C8FCFA371BFE98D9FF1C08CCA40005C04CEA72EE8F05CC5C00B33E40AD63E1C6CD5A75CBADF2BA';
wwv_flow_imp.g_varchar2_table(164) := 'E08BC03814D2299DFCD31F35DCDFAF5C8D2F84868791C7235F30A84824A26828AC5028287F20209FDF2FBFCF2F9FCF57F963E613982FF762592A168B953F856241C54241857C5ED96C4EA96C46E9745A453399B3C616B58DF631D8D5A5C5175FA2459B37';
wwv_flow_imp.g_varchar2_table(165) := 'CB1772C72248A600EE7FFA299DA9B364F47CF33A682CDA2829ED1168588002A061323E301D013321D0AC0D5028579F1068CEDA950C6B0000187B49444154BBEA4B37A9E7E24BA67309DB7E263B31AE93BB766AF8830F54CCD49E2F61DB203FEAB83F1AD5';
wwv_flow_imp.g_varchar2_table(166) := 'C28B2F51EF96AD0A39E43547AB3939F1F69B3AF2C61F6A16524CFCB3AA49BB66085000344391735812389DC9683055FB0BCEE70F68E3D7BEA6F6652B2C9DD3498DB2D98C4EBEFB270DBDF76ECD2D61ED18B399B3D073E965953F2197FCE2FF649E124327';
wwv_flow_imp.g_varchar2_table(167) := 'B5F3973FAFDC71A975F446225AE8B265A1ED389E9DD2670A00A764D2067158D927C084116EEFD445F7DF2F7FC49DB7413393090DEFFC4066B258BE81B5F25B710804DADBB570D316F55C7AA942E1482B7671C6FB64EEF0EC79EC11A547466A5ECB6CF3BB';
wwv_flow_imp.g_varchar2_table(168) := 'A6BDCDC1EF3FCC38351768508002A041309A5F9840BE54D2FEF1C9BA8F027A366DD6CA9B6F75C5C4B0A945CB4A9F3DABD37B766B6460403933D33E9369EA73F80BCBE4D49FF6783CF286C30AC4E35AB8619316AC5BAB5087339736B6E2572E16D4FFC26F';
wwv_flow_imp.g_varchar2_table(169) := '7566CFEE9ACDCDADFFD5ED71855D32FFC58A1D6D665E800260E68DB9C2670446B2599D48A66BBE15603EB2EED6DB347FF356D7FB95CA25998563460706347A6440D9915195F2CD9D9477A1C866CDFEF0C245EA5EB1425D2B5729B670A1BCFC96D5F07BEF';
wwv_flow_imp.g_varchar2_table(170) := 'EAE0EF5EAECBBB221E57479059FF75A168D054010A80A6727232AB02C792498D666B2F13EC8FC4B4D9AC12D8D36BF5B48E6F572C9794C96695183EA5D183FD4A1C3AA4FC44637B0D340B29346F9E62CBCC17FE0AC57B7A150E85E473D8EE8E1762953871';
wwv_flow_imp.g_varchar2_table(171) := '423B1F79B0EEEB925DC1A096C5631772293E8BC0B4042800A6C5C6872E54A0502EEBF0C4A452C562CD5345172CD4D66F7F47667220C7A705CAE592F2D98CB293934A9E3EA34C62529944528594F99352299B567E3271EED1C1348E40BC4DBE485866B966';
wwv_flow_imp.g_varchar2_table(172) := '5F242A7F3CAA7034A668679722DD5D0AC7DBE40F859BB6DEC034BAD8B21FC9A792DAF58B9F295D63A31FD379F3DC7F555BDCF1DB40B76CA25CDE310A00970F80B90C3F5B2CAA7F625266B5C05AC7BC152BB5F66B77CBEBC0ED609BED6FDE3537ABF41532';
wwv_flow_imp.g_varchar2_table(173) := '29652726954D259549A4944B4EAA903C5718143F7AAFBF5C2CCA2C34E7316B038482F28623F24723F2C7E20AC5DA148A462B7FC2F3BA2B05985937C0FC87A3B640B990D7A1DFBDACE11D3B6A3634CFFD97C763ECF4C7809A33010A8039A3E7C246E04C26';
wwv_flow_imp.g_varchar2_table(174) := '5B7935B0D62A81A6DDF22BAED4E2EBAEE7D7E6050C1B636C4AADF3AFA2954B65954B45990D78CC6126F099AF77BEE4A78F6C6C8FBDF5A68EBFF987BA27591A8BAA3BC45AFF75A16830630214003346CB89AD0A1C4FA6642606D63C3C1EADB8F63A2DBEF2';
wwv_flow_imp.g_varchar2_table(175) := '6AABA7A51D02B32E70FCCD3774ECED3755AEB103A6E9547728A8A5319EFBCF7A82B8E0A70428001810732E605E0D1C984CD49D0F607EA9AEFEFCF55A70C96573DE673A80C067054EEDDEA9032FBE60D655AE8913FB68A31F1F1BFD3088E6588002608E13';
wwv_flow_imp.g_varchar2_table(176) := 'C0E5CF0958D930C8B43345C0A6BBBEAAF695ABA043A06504CE1ED8AFBD4F3F2533AFA2D611F09E7BEE6F8A000E04E65A800260AE33C0F53F1618CBE5742491AC2B6226A46DB9F73EC596F4D56D4B0304665A6062E090763FF178DDD7FDCCDC8A956D31B5';
wwv_flow_imp.g_varchar2_table(177) := 'B1CBDF4CA784F35B14A000B00845B3D9113093024FA452752F166E6FD7FADB6E57AC6F59DDB6344060A604264F9CD0DEA71E573E59BB70F57A3C5A1C8D681E93FE662A159C771A021400D340E323332B309CCE68285D7F57BCC8BC79DAF4E53B159ABF70';
wwv_flow_imp.g_varchar2_table(178) := '663BC4D911984220337A46BB1E7E48B944A2AECFA248583D1177EE8550178706732640013067F45CB896C089644A67EABD19601652E9EAD6A67BEE51D0C5EBCD3392665F203739A11DBFFA857216366B32BFFAFB62EEDCD86AF633C3151B11A00068448B';
wwv_flow_imp.g_varchar2_table(179) := 'B6B32660DE57374540DDD703CDEE81B1B8367CF92E45FB9813306B0972F185268E1D55FFB34F2B6BE197BF79DEBF221E937904C08140AB095000B45A46E8CFC70266B9E06389A426F2F9BA2A66F7B90D5FFC92DAD6AEABDB9606084C5760FCD001EDFFED';
wwv_flow_imp.g_varchar2_table(180) := 'F3CA5B98A71237CBFCB2BDEF74A9F9DC2C085000CC02329798BE805926F8C0C4A432755EAF325730EBD2AFBDE92675ADDF38FD0BF24904A614286BE4C3BDEA7FE139950A85BA46519F4F2BDBDBE4E7977F5D2B1ACC9D0005C0DCD973658B02B95249472C';
wwv_flow_imp.g_varchar2_table(181) := '2C14644E675EB55A7DE317B560DBA52C696BD19766F50586DE7D47875FFDFDC7CB28D7FA44D0EBD59AF6369977FE39106865010A8056CE0E7DFB58205928C82C196CE54E80D9E166E5E557A887BD031841172860F64A38FEDAAB3AFEFE7B7597F7359732';
wwv_flow_imp.g_varchar2_table(182) := '5FFE6677BF90CF778157E6E308CCBC0005C0CC1B73852609983B01872612CA966AAFB656B99CC7A3DE4D9BB5E2E65BE46117C12665C05DA729E5323AF2DA6B3AB963BBD941A96EF0E6CB7F757B5BA508E040C00E02140076C8127DFC58C0EC1B702C99D2';
wwv_flow_imp.g_varchar2_table(183) := 'A4858981E6430BD7ADD38A9B6F939F055818450D08E453490DFCFE159DFEF0434B9F324BFB9A257EB9ED6F898B462D224001D02289A01BD6054C1160560B1CCFD57F3BC09C353E6FBE56DF7EBB620B7BAC5F8496AE15480E0FE9C0B34F2B393A6AC9C0CC';
wwv_flow_imp.g_varchar2_table(184) := 'F65FD116179BFB58E2A2510B095000B45032E88A7581927945309992D93FC0CAE18F46B4F2AACF69C1C5DB241E095821735D9B72B1A0D33BB6EBD06BAF5A9AE96F80CCB6BE7DB19878CBDF75C3C51101530038228DEE0D623095D6E94CC61280C7E351CF';
wwv_flow_imp.g_varchar2_table(185) := 'E62DEABBEA6A053A3A2D7D8646EE10C84F8CEBE89B7FD0F0EEDD9602366F9BCC0F87D41B8DF0E56F498C46AD284001D08A59A14F9605CCD4ACD3E98C4E5AD83BE0FC49DBBABBB5E6965B1559CCCA8196A11DDC3075E2B8FA9F7F4EC9B1B396A234ABFA2D';
wwv_flow_imp.g_varchar2_table(186) := '088758DBDF92168D5A598002A095B343DF2C0B982583CD6B82560FAFC7AB35575FA505575CA5B23F60F563B4739240B9A4A1D75FD3A177FE68392AF3CB7F498C5DFD2C83D1B0A50528005A3A3D74AE1101332970309592795DD0EAB160E52AADB8E61A05';
wwv_flow_imp.g_varchar2_table(187) := '16F55AFD08ED1C20901B1DD1B1D75ED5F0C10396A309797D952F7FB3BE3F07024E10A00070421689E1638174A1587943C02C1C64F588B7B569F5E73EA7D8E6AD928777B8ADBAD9B15D399FD3F8DEBD3AFAC7B794181FB71C82F9D25F1C8D28CC023F96CD';
wwv_flow_imp.g_varchar2_table(188) := '68D8FA021400AD9F237AD8A0807943C01401A3596B6F089C3FFDC2458BB4F4862F2AD4B7B4C12BD2DC0E02B913C774F895973572EA5443DD3533FD9744A3ECE8D7901A8DED20400160872CD1C78605CCE4C0B3D9AC4EA4D2320581D5C3EBF36BE9BAB55A';
wwv_flow_imp.g_varchar2_table(189) := 'F4B96BE5EFECB2FA31DAB5B04061F48C86FEF8470DEEDFA742037786FC1EAF7AA36175B388540B6797AE5D880005C085E8F1D99617487DB48740DAC26E829F0CA6ADB353CBAEBC5AED6BD7CA130AB77C9C74F02F05CA85BC26F6ECD1C0DB6F2B3969FD76';
wwv_flow_imp.g_varchar2_table(190) := 'BF3993B9D56F6EF9F3BC9F91E564010A00276797D82A0205B3685022A9098BCB077F926DD1F2155A76EDB50AF42C46D34602B9A1933AFAEAEF75EAF8B1867BDD1E08A82F166559DF86E5F880DD042800EC9631FA3B2D81F3EB050CA5332ACBFA23017331';
wwv_flow_imp.g_varchar2_table(191) := 'B3C46BDFA64D5A74D5E7782C302DFDD9FB50616C5427DF784327F6ED6DE8D18FE9A179C5AF2712D6824898C57D662F655C690E052800E6109F4BCFBE80593A78389DB1B6ADF067BA176B6B57DFE6CDEADCB459BE4EB392200BC0CE7E06A7BE627EE48C26';
wwv_flow_imp.g_varchar2_table(192) := 'F77EA8E37B762B3139D970B778C5AF61323EE000010A00072491101A13309B099D4CA575D6E23E029F3D7BC7BC79EA59BB569D1B37CBD765260A520834968166B52E2B3F32A2B37BF7EAC487BB949E68FC8BDFF4A43318AC3CEF6727BF66E585F3D84580';
wwv_flow_imp.g_varchar2_table(193) := '02C02E99A29F4D17306B0598BB0156B716FE6C07827EBF7A376ED2C24B2F5360DEFCA6F78F134E2D601EE1A44F9FD1D09FDED1F0DE0F552E5B5FF8E9936734BBF8F54423325BF97220E046010A0037669D983F1630AF08260A050D26D3CA968AD39231BF';
wwv_flow_imp.g_varchar2_table(194) := '1C17AD5CA905175FACC8B2959297C584A60559E743C5425E93038775F2830F347EFCB84AD3CC57D0EBAD6CE4635EEF630BDF99C814E7B48B0005805D32453F6754C0BC2930984C4DFBB180E99C3F10D0A2257D5AB0658BC23D3DF2C6DB29062E346BE592';
wwv_flow_imp.g_varchar2_table(195) := '7293131A1B18D0D0AE9D4A9E39A37203EFF27FF2F266925F5728A04591884C11C08180DB052800DC3E0288FF5302E6B1C0502A5DB92B702147381251CF860DEA5ABB4191DE1EC9C76DE6463C0BD98C264E9ED4C8C1031A1F38AC5C03CBF64E751D73BBDF';
wwv_flow_imp.g_varchar2_table(196) := '6CDD1BE5767F2369A0ADC30528001C9E60C26B5CC03C16301304CF64B2D37A5BE0935734B798CD5E030BD6AE53C7860D0A2EEC91C7C3A4C1CF66C53CD72F964A4A0E9ED4E8DE3D3AD3DFAF7CDAFAEE8ED5B21CF5F9D41D0E5526FA71BBBFF17F17F884B3';
wwv_flow_imp.g_varchar2_table(197) := '0528009C9D5FA2BB0001F358C02C276C0A81467618AC76499FDFAFAECE4ECD5FB356EDAB56CBBF70A1E4F55D400FEDFFD1523EA7F4F050E597FEC8C01165C6C7A67D8BFF931AE6B5BE79E1A0E68542ACE16FFF614204332440013043B09CD6390266D9A0';
wwv_flow_imp.g_varchar2_table(198) := 'F15C4EA7335999A5859B71F8235175F4F6AA6BC572C516F528D2D129AFD966B6B2D5AC53EF109455CEE795CF66959E9CD4C489133A3B7058E953C32A6632CD60ADCCE83713FC3A8241C72A36058A932060FE9F66F8FEFB1A5B160D36045C2A502C973591';
wwv_flow_imp.g_varchar2_table(199) := 'CB6B246B0A8162C32B0A56BD33E0F128188EAAAD6F893A962C56ACA757C1AE6EF92291CAEA74763E4AE552E5CB3D3B3A5279A63F71EC9826074F548A80661DC6281EF0CBECDA67D6EEE7567FB364398FD30528009C9E61E26BBAC0F942E04C26A354839B';
wwv_flow_imp.g_varchar2_table(200) := '0C59ED4C281050BCBD5D1D0B1729DEB348A1853DF2CF9F2F4F6567BA562D0ACA2A25932A9C39ADCCC88812432735363CAC89B1719942A0D987F9E28FF9CDADFE73CFF8391040A031010A80C6BC688DC0C702E6D659325FD0E94C665A1B0D59A53493067D';
wwv_flow_imp.g_varchar2_table(201) := 'E18882E19082A1B0C2B198C26D6D0A77752AD4D6A640342E7F2C264F383CF33B17964A2A2526544CA5944B26954D24959D18576A7454B9545299545AB94C5AA57C5EE552F3BFF48D99F9E26F0FFAD513895476EDE3400081E90950004CCF8D4F21F0B180';
wwv_flow_imp.g_varchar2_table(202) := '796B20532C568A80C95C5E19F325599EF9276BE656B7F98FCFEB55A4BB5BA1EE790A75762AD81697371094DF3C070F04E40F86E40DF82AAF227ABD5E79CC9F73DFA495C39CA3320BDFDCCDA83CDA908AF9BC8AE974E5997D219753319BA9CCCACF8C8D2B';
wwv_flow_imp.g_varchar2_table(203) := '3F31A1ECE48472C9944A2ACF4AAC5E8F4761AF576DC140E5D77EC8E76BD9FB20FCAB81805D042800EC9229FA690B01F3E640229FD7D96C4E93F942D3E609342B787337C1EBF3CB17F0CBBC9560EA94CA977DA1706E65BD59285C1A89C5ACB268DEE13793';
wwv_flow_imp.g_varchar2_table(204) := 'FA6201BFFCBC42D9081F6D11A8294001C00041608604CE2F337CAE18C8CBCC1DE0A82F60EE6C747CF44BDFCCEA37BFFE391040A0F9021400CD37E58C087C4AC07CED174A2525F285CA6B84E962B1B2AE80D9959043F27BBC0AF9BC8AF87C955FF966B53E';
wwv_flow_imp.g_varchar2_table(205) := 'F3CB9FAF7D460702332B400130B3BE9C1D81BF10308F09328562A51848154D515054A1649EC2BBE30E819973E0F77ACE7DE1FBCF7DE187FD3E6EEFF3EF0A02B32C400130CBE05C0E81CF0A98AFFD5CB128B30F81993760FEEAB4BB03E6177D5BC0AFB83F';
wwv_flow_imp.g_varchar2_table(206) := 'A0A8DFA72093F8F81701813917A00098F314D00104FE2C70FE7181992F600A0173A7205B2A551E21E44BE5CA3C8256BE5360BEE8CD443DF357735BDFBCA617F1F915F0792B0BF4705B9FD18E40EB085000B44E2EE809025505CC9C8174A158B933902B7D';
wwv_flow_imp.g_varchar2_table(207) := '3487A05852BE7CEE353C53389C9F63385305C2F9AF6F3327CF7C919B7F0E783D0AFABC95ED75835E5FE58BDFFCBDB9A5CF973D031A81D616A00068EDFCD03B046A0A9CBF63600A84EC47930BCD7C0273A7E07C61F0E702E15C69F0C982E1935FE6DEF35F';
wwv_flow_imp.g_varchar2_table(208) := 'ECE655C18F7EAD9BBF9AFFDE4CC9337F6F7ED59B77F0CD97BC9F897A8C4E046C2D400160EBF4D179043E2D70EE4EC04777043EFA9FCC3F4F35EFE093FFDD677FAD9BF502CEFF779FFCDF78258F118780730428009C934B22410001041040C0B200058065';
wwv_flow_imp.g_varchar2_table(209) := '2A1A228000020820E01C010A00E7E49248104000010410B02C400160998A8608208000020838478002C039B924120410400001042C0B500058A6A221020820800002CE11A000704E2E8904010410400001CB02140096A96888000208208080730428009C';
wwv_flow_imp.g_varchar2_table(210) := '934B22410001041040C0B2000580652A1A228000020820E01C010A00E7E49248104000010410B02C400160998A8608208000020838478002C039B924120410400001042C0B500058A6A221020820800002CE11A000704E2E8904010410400001CB021400';
wwv_flow_imp.g_varchar2_table(211) := '96A96888000208208080730428009C934B22410001041040C0B2000580652A1A228000020820E01C010A00E7E49248104000010410B02C400160998A8608208000020838478002C039B924120410400001042C0B500058A6A221020820800002CE11A000';
wwv_flow_imp.g_varchar2_table(212) := '704E2E8904010410400001CB02140096A96888000208208080730428009C934B22410001041040C0B2000580652A1A228000020820E01C010A00E7E49248104000010410B02C400160998A8608208000020838478002C039B924120410400001042C0B50';
wwv_flow_imp.g_varchar2_table(213) := '0058A6A221020820800002CE11A000704E2E8904010410400001CB02140096A96888000208208080730428009C934B22410001041040C0B2000580652A1A228000020820E01C010A00E7E49248104000010410B02C400160998A86082080000208384780';
wwv_flow_imp.g_varchar2_table(214) := '02C039B924120410400001042C0B500058A6A221020820800002CE11A000704E2E8904010410400001CB02140096A96888000208208080730428009C934B22410001041040C0B2000580652A1A228000020820E01C010A00E7E49248104000010410B02C';
wwv_flow_imp.g_varchar2_table(215) := '400160998A8608208000020838478002C039B924120410400001042C0B500058A6A221020820800002CE11A000704E2E8904010410400001CB02140096A96888000208208080730428009C934B22410001041040C0B2000580652A1A228000020820E01C';
wwv_flow_imp.g_varchar2_table(216) := '010A00E7E49248104000010410B02C400160998A8608208000020838478002C039B924120410400001042C0B500058A6A221020820800002CE11A000704E2E8904010410400001CB02140096A96888000208208080730428009C934B22410001041040C0';
wwv_flow_imp.g_varchar2_table(217) := 'B2000580652A1A228000020820E01C010A00E7E49248104000010410B02C400160998A8608208000020838478002C039B924120410400001042C0B500058A6A221020820800002CE11A000704E2E8904010410400001CB02140096A96888000208208080';
wwv_flow_imp.g_varchar2_table(218) := '730428009C934B22410001041040C0B2000580652A1A228000020820E01C010A00E7E49248104000010410B02C400160998A8608208000020838478002C039B924120410400001042C0B500058A6A221020820800002CE11A000704E2E89040104104000';
wwv_flow_imp.g_varchar2_table(219) := '01CB02140096A96888000208208080730428009C934B22410001041040C0B2000580652A1A228000020820E01C010A00E7E49248104000010410B02C400160998A8608208000020838478002C039B924120410400001042C0B500058A6A2210208208000';
wwv_flow_imp.g_varchar2_table(220) := '02CE11A000704E2E8904010410400001CB02140096A96888000208208080730428009C934B22410001041040C0B2000580652A1A228000020820E01C010A00E7E49248104000010410B02C400160998A8608208000020838478002C039B9241204104000';
wwv_flow_imp.g_varchar2_table(221) := '01042C0B500058A6A221020820800002CE11A000704E2E8904010410400001CB02140096A96888000208208080730428009C934B22410001041040C0B2000580652A1A228000020820E01C010A00E7E49248104000010410B02C400160998A8608208000';
wwv_flow_imp.g_varchar2_table(222) := '020838478002C039B924120410400001042C0B500058A6A221020820800002CE11A000704E2E8904010410400001CB02140096A96888000208208080730428009C934B22410001041040C0B2000580652A1A228000020820E01C010A00E7E49248104000';
wwv_flow_imp.g_varchar2_table(223) := '010410B02C400160998A8608208000020838478002C039B924120410400001042C0B500058A6A221020820800002CE11A000704E2E8904010410400001CB02140096A96888000208208080730428009C934B22410001041040C0B2000580652A1A228000';
wwv_flow_imp.g_varchar2_table(224) := '020820E01C010A00E7E49248104000010410B02C400160998A8608208000020838478002C039B924120410400001042C0B500058A6A221020820800002CE11A000704E2E8904010410400001CB02140096A96888000208208080730428009C934B224100';
wwv_flow_imp.g_varchar2_table(225) := '01041040C0B2000580652A1A228000020820E01C010A00E7E49248104000010410B02C400160998A8608208000020838478002C039B924120410400001042C0B500058A6A221020820800002CE11A000704E2E8904010410400001CB02140096A9688800';
wwv_flow_imp.g_varchar2_table(226) := '0208208080730428009C934B22410001041040C0B2000580652A1A228000020820E01C010A00E7E49248104000010410B02C400160998A8608208000020838478002C039B924120410400001042C0B500058A6A221020820800002CE11A000704E2E8904';
wwv_flow_imp.g_varchar2_table(227) := '010410400001CB02140096A96888000208208080730428009C934B22410001041040C0B2000580652A1A228000020820E01C010A00E7E49248104000010410B02C400160998A8608208000020838478002C039B924120410400001042C0B500058A6A221';
wwv_flow_imp.g_varchar2_table(228) := '020820800002CE11A000704E2E8904010410400001CB02FF3F1F63D596901F8E070000000049454E44AE426082';
null;
end;
/
begin
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(22241618881506055348)
,p_file_name=>'icons/app-icon-512.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
null;
end;
/
prompt --application/plugin_settings
begin
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(22241215819076054961)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'FULL'
,p_attribute_02=>'POPUP'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(22241216154810054962)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_JET'
,p_attribute_01=>'MONTH-PICKER:YEAR-PICKER'
,p_attribute_02=>'VISIBLE'
,p_attribute_03=>'15'
,p_attribute_04=>'FOCUS'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(22241216490789054963)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_attribute_02=>'N'
,p_attribute_03=>'POPUP:ITEM'
,p_attribute_04=>'default'
,p_attribute_06=>'LIST'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(22241216795148054963)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_RICH_TEXT_EDITOR'
,p_attribute_01=>'Y'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(22241217062483054964)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(22241217338282054965)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attribute_01=>'fa-star'
,p_attribute_04=>'#VALUE#'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(22241217675425054965)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SWITCH_CB'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(22241217994024054966)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(22241218230581054966)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(22241218555268054966)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attribute_01=>'IG'
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(22241620368337055349)
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
prompt --application/shared_components/logic/application_processes/add_user
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(22958688494372620375)
,p_process_sequence=>1
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Add User'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- create movie user ID',
'-- query movie_users table to check for existing user',
'-- if yes, return PK as user_id',
'-- if no, add new user to movie_users',
'declare',
'    l_user_id number;',
'begin',
'    select id into l_user_id from movie_users where username = :APP_USER;',
'',
'    :USER_ID := l_user_id;',
'',
'    exception',
'        when no_data_found then',
'        insert into movie_users ',
'                (username)',
'            values ',
'                (:APP_USER)',
'            returning ',
'                id into :USER_ID;',
'end;'))
,p_process_clob_language=>'PLSQL'
);
end;
/
prompt --application/shared_components/logic/application_items/user_id
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(22958483508408610949)
,p_name=>'USER_ID'
,p_protection_level=>'I'
);
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
prompt --application/pages/page_groups
begin
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(22241621122886055351)
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
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(22241219400905054974)
,p_name=>'Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(22241219684254054974)
,p_short_name=>'My Watchlist'
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
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(22241220559988054981)
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
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241221037743054997)
,p_page_template_id=>wwv_flow_imp.id(22241220559988054981)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241221394834054999)
,p_page_template_id=>wwv_flow_imp.id(22241220559988054981)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241221610819055000)
,p_page_template_id=>wwv_flow_imp.id(22241220559988054981)
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
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(22241223687341055012)
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
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241223985083055014)
,p_page_template_id=>wwv_flow_imp.id(22241223687341055012)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241224262931055014)
,p_page_template_id=>wwv_flow_imp.id(22241223687341055012)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241224513674055014)
,p_page_template_id=>wwv_flow_imp.id(22241223687341055012)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241224883141055014)
,p_page_template_id=>wwv_flow_imp.id(22241223687341055012)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241225152339055014)
,p_page_template_id=>wwv_flow_imp.id(22241223687341055012)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241225421811055014)
,p_page_template_id=>wwv_flow_imp.id(22241223687341055012)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241225713798055015)
,p_page_template_id=>wwv_flow_imp.id(22241223687341055012)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241226025959055015)
,p_page_template_id=>wwv_flow_imp.id(22241223687341055012)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241226385961055015)
,p_page_template_id=>wwv_flow_imp.id(22241223687341055012)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241226622713055015)
,p_page_template_id=>wwv_flow_imp.id(22241223687341055012)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241226947650055015)
,p_page_template_id=>wwv_flow_imp.id(22241223687341055012)
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
prompt --application/shared_components/user_interface/templates/page/right_side_column
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(22241227307551055017)
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
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241227656179055017)
,p_page_template_id=>wwv_flow_imp.id(22241227307551055017)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241227948360055017)
,p_page_template_id=>wwv_flow_imp.id(22241227307551055017)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241228269939055018)
,p_page_template_id=>wwv_flow_imp.id(22241227307551055017)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241228568143055018)
,p_page_template_id=>wwv_flow_imp.id(22241227307551055017)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241228895799055018)
,p_page_template_id=>wwv_flow_imp.id(22241227307551055017)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241229180256055018)
,p_page_template_id=>wwv_flow_imp.id(22241227307551055017)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241229448040055019)
,p_page_template_id=>wwv_flow_imp.id(22241227307551055017)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241229710480055019)
,p_page_template_id=>wwv_flow_imp.id(22241227307551055017)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241230098146055019)
,p_page_template_id=>wwv_flow_imp.id(22241227307551055017)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241230362782055020)
,p_page_template_id=>wwv_flow_imp.id(22241227307551055017)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241230689890055020)
,p_page_template_id=>wwv_flow_imp.id(22241227307551055017)
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
prompt --application/shared_components/user_interface/templates/page/wizard_modal_dialog
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(22241231024436055021)
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
,p_dialog_js_init_code=>'apex.theme42.dialog(#PAGE_URL#,{title:#TITLE#,h:#DIALOG_HEIGHT#,w:#DIALOG_WIDTH#,mxw:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,dlgCls:''t-Dialog-page--wizard ''+#DIALOG_CSS_CLASSES#,#DIALOG_ATTRIBUTES#},#PAGE_CSS_CLASSES#,#TRIGGERING_ELEMENT#'
||')'
,p_dialog_js_close_code=>'apex.theme42.dialog.close(#IS_MODAL#,#TARGET#)'
,p_dialog_js_cancel_code=>'apex.theme42.dialog.cancel(#IS_MODAL#)'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241231382201055021)
,p_page_template_id=>wwv_flow_imp.id(22241231024436055021)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241231623666055022)
,p_page_template_id=>wwv_flow_imp.id(22241231024436055021)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241231937066055022)
,p_page_template_id=>wwv_flow_imp.id(22241231024436055021)
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
prompt --application/shared_components/user_interface/templates/page/left_and_right_side_columns
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(22241232540340055023)
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
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241432806492055024)
,p_page_template_id=>wwv_flow_imp.id(22241232540340055023)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241433114263055024)
,p_page_template_id=>wwv_flow_imp.id(22241232540340055023)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241433403964055024)
,p_page_template_id=>wwv_flow_imp.id(22241232540340055023)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241433759767055025)
,p_page_template_id=>wwv_flow_imp.id(22241232540340055023)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241434064095055025)
,p_page_template_id=>wwv_flow_imp.id(22241232540340055023)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241434316599055025)
,p_page_template_id=>wwv_flow_imp.id(22241232540340055023)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241434606581055026)
,p_page_template_id=>wwv_flow_imp.id(22241232540340055023)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241434954083055026)
,p_page_template_id=>wwv_flow_imp.id(22241232540340055023)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241435280859055026)
,p_page_template_id=>wwv_flow_imp.id(22241232540340055023)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241435559960055027)
,p_page_template_id=>wwv_flow_imp.id(22241232540340055023)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241435883596055027)
,p_page_template_id=>wwv_flow_imp.id(22241232540340055023)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241436117723055027)
,p_page_template_id=>wwv_flow_imp.id(22241232540340055023)
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
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(22241436523671055028)
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
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241436801727055028)
,p_page_template_id=>wwv_flow_imp.id(22241436523671055028)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241437127185055029)
,p_page_template_id=>wwv_flow_imp.id(22241436523671055028)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241437489814055029)
,p_page_template_id=>wwv_flow_imp.id(22241436523671055028)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241437715338055029)
,p_page_template_id=>wwv_flow_imp.id(22241436523671055028)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241438086888055029)
,p_page_template_id=>wwv_flow_imp.id(22241436523671055028)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241438399546055029)
,p_page_template_id=>wwv_flow_imp.id(22241436523671055028)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241438647546055030)
,p_page_template_id=>wwv_flow_imp.id(22241436523671055028)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241438979314055030)
,p_page_template_id=>wwv_flow_imp.id(22241436523671055028)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241439223973055030)
,p_page_template_id=>wwv_flow_imp.id(22241436523671055028)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241439575556055031)
,p_page_template_id=>wwv_flow_imp.id(22241436523671055028)
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
prompt --application/shared_components/user_interface/templates/page/login
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(22241439980132055031)
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
'#FORM_OPEN#',
'<div class="t-Login-bg">',
'  #BACKGROUND_IMAGE#',
'  <div class="t-Login-bgImg"></div>',
'</div>'))
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
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241440290320055032)
,p_page_template_id=>wwv_flow_imp.id(22241439980132055031)
,p_name=>'Background Image'
,p_placeholder=>'BACKGROUND_IMAGE'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241440522996055032)
,p_page_template_id=>wwv_flow_imp.id(22241439980132055031)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241440855877055032)
,p_page_template_id=>wwv_flow_imp.id(22241439980132055031)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241441189357055033)
,p_page_template_id=>wwv_flow_imp.id(22241439980132055031)
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
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(22241442596323055035)
,p_theme_id=>42
,p_name=>'Marquee'
,p_internal_name=>'MASTER_DETAIL'
,p_is_popup=>false
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'))
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
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241442895902055037)
,p_page_template_id=>wwv_flow_imp.id(22241442596323055035)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241443102597055037)
,p_page_template_id=>wwv_flow_imp.id(22241442596323055035)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241443490422055037)
,p_page_template_id=>wwv_flow_imp.id(22241442596323055035)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241443743981055038)
,p_page_template_id=>wwv_flow_imp.id(22241442596323055035)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241444006047055038)
,p_page_template_id=>wwv_flow_imp.id(22241442596323055035)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241444330304055038)
,p_page_template_id=>wwv_flow_imp.id(22241442596323055035)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241444691516055038)
,p_page_template_id=>wwv_flow_imp.id(22241442596323055035)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241444995094055038)
,p_page_template_id=>wwv_flow_imp.id(22241442596323055035)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241445240337055039)
,p_page_template_id=>wwv_flow_imp.id(22241442596323055035)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241445576675055039)
,p_page_template_id=>wwv_flow_imp.id(22241442596323055035)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241445827682055039)
,p_page_template_id=>wwv_flow_imp.id(22241442596323055035)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241446194804055039)
,p_page_template_id=>wwv_flow_imp.id(22241442596323055035)
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
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(22241446574015055040)
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
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241446882047055041)
,p_page_template_id=>wwv_flow_imp.id(22241446574015055040)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241447117706055041)
,p_page_template_id=>wwv_flow_imp.id(22241446574015055040)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241447429768055041)
,p_page_template_id=>wwv_flow_imp.id(22241446574015055040)
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
prompt --application/shared_components/user_interface/templates/page/standard
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(22241448014788055042)
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
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241448348369055043)
,p_page_template_id=>wwv_flow_imp.id(22241448014788055042)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241448630138055043)
,p_page_template_id=>wwv_flow_imp.id(22241448014788055042)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241448954977055043)
,p_page_template_id=>wwv_flow_imp.id(22241448014788055042)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241449272719055043)
,p_page_template_id=>wwv_flow_imp.id(22241448014788055042)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241449513730055043)
,p_page_template_id=>wwv_flow_imp.id(22241448014788055042)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241449884176055044)
,p_page_template_id=>wwv_flow_imp.id(22241448014788055042)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241450184322055044)
,p_page_template_id=>wwv_flow_imp.id(22241448014788055042)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241450404124055044)
,p_page_template_id=>wwv_flow_imp.id(22241448014788055042)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241450750959055044)
,p_page_template_id=>wwv_flow_imp.id(22241448014788055042)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241451032527055044)
,p_page_template_id=>wwv_flow_imp.id(22241448014788055042)
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
prompt --application/shared_components/user_interface/templates/button/icon
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(22241589974661055244)
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
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(22241590606246055248)
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
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(22241590713761055249)
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
prompt --application/shared_components/user_interface/templates/region/alert
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241451465823055046)
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241451707044055052)
,p_plug_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241452088704055054)
,p_plug_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241452393396055054)
,p_plug_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241452696265055055)
,p_plug_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241452939274055055)
,p_plug_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241453267463055055)
,p_plug_template_id=>wwv_flow_imp.id(22241451465823055046)
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
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241456623640055059)
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241456940123055059)
,p_plug_template_id=>wwv_flow_imp.id(22241456623640055059)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241457234727055060)
,p_plug_template_id=>wwv_flow_imp.id(22241456623640055059)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241457541439055061)
,p_plug_template_id=>wwv_flow_imp.id(22241456623640055059)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241457863506055061)
,p_plug_template_id=>wwv_flow_imp.id(22241456623640055059)
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
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241458089180055061)
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241458392939055062)
,p_plug_template_id=>wwv_flow_imp.id(22241458089180055061)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241458610762055063)
,p_plug_template_id=>wwv_flow_imp.id(22241458089180055061)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241458932100055063)
,p_plug_template_id=>wwv_flow_imp.id(22241458089180055061)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241459250612055063)
,p_plug_template_id=>wwv_flow_imp.id(22241458089180055061)
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
prompt --application/shared_components/user_interface/templates/region/cards_container
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241459493641055063)
,p_layout=>'TABLE'
,p_template=>'<div role="region" aria-label="#TITLE!ATTR#" class="t-CardsRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#ORDER_BY_ITEM##BODY##SUB_REGIONS#</div>'
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241459718083055064)
,p_plug_template_id=>wwv_flow_imp.id(22241459493641055063)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241460078213055064)
,p_plug_template_id=>wwv_flow_imp.id(22241459493641055063)
,p_name=>'Sort Order'
,p_placeholder=>'ORDER_BY_ITEM'
,p_has_grid_support=>true
,p_has_region_support=>false
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241460338962055064)
,p_plug_template_id=>wwv_flow_imp.id(22241459493641055063)
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
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241461524336055066)
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
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#APEX_FILES#plugins/com.oracle.apex.carousel/1.1/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#'))
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241461828237055068)
,p_plug_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241462190049055068)
,p_plug_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241462461329055069)
,p_plug_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241462730118055069)
,p_plug_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241463035173055069)
,p_plug_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241463351554055070)
,p_plug_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241463646213055070)
,p_plug_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241463964827055070)
,p_plug_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241464250567055071)
,p_plug_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241464525217055071)
,p_plug_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241464828410055072)
,p_plug_template_id=>wwv_flow_imp.id(22241461524336055066)
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
prompt --application/shared_components/user_interface/templates/region/image
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241471464684055081)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-ImageRegion #REGION_CSS_CLASSES#"><img src="#REGION_IMAGE_URL#" alt="#REGION_IMAGE_ALT_TEXT#" #REGION_IMAGE_ATTRIBUTES# /></div>'
,p_page_plug_template_name=>'Image'
,p_internal_name=>'IMAGE'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-ImageRegion--noFilter:t-ImageRegion--auto:t-ImageRegion--cover:t-ImageRegion--square'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>1673953645642781634
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241471772695055082)
,p_plug_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241472031819055082)
,p_plug_template_id=>wwv_flow_imp.id(22241471464684055081)
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
prompt --application/shared_components/user_interface/templates/region/inline_drawer
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241476808920055085)
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241477102245055086)
,p_plug_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241477430202055086)
,p_plug_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241477711531055086)
,p_plug_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241478059199055086)
,p_plug_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241478348189055087)
,p_plug_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241478650769055087)
,p_plug_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241478960025055087)
,p_plug_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241479276838055087)
,p_plug_template_id=>wwv_flow_imp.id(22241476808920055085)
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
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241481675098055090)
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241481971628055091)
,p_plug_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241482201058055091)
,p_plug_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241482508245055091)
,p_plug_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241482900477055091)
,p_plug_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241483285834055092)
,p_plug_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241483595523055092)
,p_plug_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241483833192055092)
,p_plug_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241484170080055092)
,p_plug_template_id=>wwv_flow_imp.id(22241481675098055090)
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
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241487195801055097)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#">#PREVIOUS##ORDER_BY_ITEM##BODY##SUB_REGIONS##NEXT#</div>',
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241487423142055097)
,p_plug_template_id=>wwv_flow_imp.id(22241487195801055097)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241487796537055098)
,p_plug_template_id=>wwv_flow_imp.id(22241487195801055097)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241488056238055098)
,p_plug_template_id=>wwv_flow_imp.id(22241487195801055097)
,p_name=>'Sort Order'
,p_placeholder=>'ORDER_BY_ITEM'
,p_has_grid_support=>true
,p_has_region_support=>false
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241488304315055098)
,p_plug_template_id=>wwv_flow_imp.id(22241487195801055097)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241488680221055098)
,p_plug_template_id=>wwv_flow_imp.id(22241487195801055097)
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
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241489256245055099)
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
'     #ORDER_BY_ITEM#',
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241489588872055100)
,p_plug_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241489899953055100)
,p_plug_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241490106874055101)
,p_plug_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241490478298055101)
,p_plug_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241490747002055101)
,p_plug_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241491048143055101)
,p_plug_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241491310727055102)
,p_plug_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241491630912055102)
,p_plug_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241491957068055102)
,p_plug_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241492249509055102)
,p_plug_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_name=>'Sort Order'
,p_placeholder=>'ORDER_BY_ITEM'
,p_has_grid_support=>true
,p_has_region_support=>false
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241492510720055103)
,p_plug_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241492876061055103)
,p_plug_template_id=>wwv_flow_imp.id(22241489256245055099)
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
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241499088148055111)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES# apex-tabs-region" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">#SUB_REGIONS#</div>',
'</div>'))
,p_sub_plug_template=>'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">#SUB_REGION#</div>'
,p_page_plug_template_name=>'Tabs Container'
,p_internal_name=>'TABS_CONTAINER'
,p_javascript_file_urls=>'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241499372256055112)
,p_plug_template_id=>wwv_flow_imp.id(22241499088148055111)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241499621922055112)
,p_plug_template_id=>wwv_flow_imp.id(22241499088148055111)
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
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241501650118055115)
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241501973637055115)
,p_plug_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241502299025055116)
,p_plug_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241502593027055116)
,p_plug_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241502810423055116)
,p_plug_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241503190170055117)
,p_plug_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241503406326055117)
,p_plug_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241503766710055117)
,p_plug_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241504041324055118)
,p_plug_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241504329718055118)
,p_plug_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241504626957055118)
,p_plug_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241504978039055119)
,p_plug_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_name=>'Smart Filters'
,p_placeholder=>'SMART_FILTERS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241505260297055119)
,p_plug_template_id=>wwv_flow_imp.id(22241501650118055115)
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
prompt --application/shared_components/user_interface/templates/region/buttons_container
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241506840845055122)
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241507118887055123)
,p_plug_template_id=>wwv_flow_imp.id(22241506840845055122)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241507489850055123)
,p_plug_template_id=>wwv_flow_imp.id(22241506840845055122)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241507752089055123)
,p_plug_template_id=>wwv_flow_imp.id(22241506840845055122)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241508087125055124)
,p_plug_template_id=>wwv_flow_imp.id(22241506840845055122)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241508330935055124)
,p_plug_template_id=>wwv_flow_imp.id(22241506840845055122)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241508691658055125)
,p_plug_template_id=>wwv_flow_imp.id(22241506840845055122)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241508955470055125)
,p_plug_template_id=>wwv_flow_imp.id(22241506840845055122)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241509213927055125)
,p_plug_template_id=>wwv_flow_imp.id(22241506840845055122)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241509562686055126)
,p_plug_template_id=>wwv_flow_imp.id(22241506840845055122)
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
prompt --application/shared_components/user_interface/templates/region/collapsible
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241510985710055127)
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241511289754055128)
,p_plug_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241511635729055129)
,p_plug_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241511921628055129)
,p_plug_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241512215495055129)
,p_plug_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241512546761055129)
,p_plug_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241512842372055129)
,p_plug_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241513120812055130)
,p_plug_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241513476184055130)
,p_plug_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241513755370055130)
,p_plug_template_id=>wwv_flow_imp.id(22241510985710055127)
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
prompt --application/shared_components/user_interface/templates/region/content_block
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241520656036055138)
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241520901264055139)
,p_plug_template_id=>wwv_flow_imp.id(22241520656036055138)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241521299803055139)
,p_plug_template_id=>wwv_flow_imp.id(22241520656036055138)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241521560141055139)
,p_plug_template_id=>wwv_flow_imp.id(22241520656036055138)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241521824181055140)
,p_plug_template_id=>wwv_flow_imp.id(22241520656036055138)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241522126891055140)
,p_plug_template_id=>wwv_flow_imp.id(22241520656036055138)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241522406165055140)
,p_plug_template_id=>wwv_flow_imp.id(22241520656036055138)
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
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241524448084055143)
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241524790908055144)
,p_plug_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241525042778055144)
,p_plug_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241525300308055145)
,p_plug_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241525608917055145)
,p_plug_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241525985423055145)
,p_plug_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241526277254055145)
,p_plug_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241526587696055146)
,p_plug_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241526815986055146)
,p_plug_template_id=>wwv_flow_imp.id(22241524448084055143)
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
prompt --application/shared_components/user_interface/templates/region/hero
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241528861888055150)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-top">',
'    <div class="t-HeroRegion-wrap">',
'      <div class="t-HeroRegion-col t-HeroRegion-col--left">#REGION_IMAGE#<span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
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
,p_image_template=>'<img class="t-HeroRegion-icon" src="#REGION_IMAGE_URL#" alt="" />'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241529173303055151)
,p_plug_template_id=>wwv_flow_imp.id(22241528861888055150)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241529426137055152)
,p_plug_template_id=>wwv_flow_imp.id(22241528861888055150)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241529767188055152)
,p_plug_template_id=>wwv_flow_imp.id(22241528861888055150)
,p_name=>'Smart Filters'
,p_placeholder=>'SMART_FILTERS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241530116379055152)
,p_plug_template_id=>wwv_flow_imp.id(22241528861888055150)
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
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241532137618055154)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Login-header">',
'    #REGION_IMAGE#',
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
,p_image_template=>'<img class="t-Login-logo" src="#REGION_IMAGE_URL#" alt="" data-app-icon />'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241532452556055155)
,p_plug_template_id=>wwv_flow_imp.id(22241532137618055154)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241532783174055155)
,p_plug_template_id=>wwv_flow_imp.id(22241532137618055154)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241533009711055156)
,p_plug_template_id=>wwv_flow_imp.id(22241532137618055154)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241533348932055156)
,p_plug_template_id=>wwv_flow_imp.id(22241532137618055154)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241533642618055156)
,p_plug_template_id=>wwv_flow_imp.id(22241532137618055154)
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
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(22241534684297055157)
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
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241534994961055158)
,p_plug_template_id=>wwv_flow_imp.id(22241534684297055157)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241535240124055158)
,p_plug_template_id=>wwv_flow_imp.id(22241534684297055157)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241535546442055158)
,p_plug_template_id=>wwv_flow_imp.id(22241534684297055157)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241535871685055158)
,p_plug_template_id=>wwv_flow_imp.id(22241534684297055157)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(22241536193768055159)
,p_plug_template_id=>wwv_flow_imp.id(22241534684297055157)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/list/badge_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(22241562240858055200)
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
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(22241566239888055208)
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
prompt --application/shared_components/user_interface/templates/list/media_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(22241571892463055213)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#">',
'  <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'    <div class="t-MediaList-iconWrap" aria-hidden="true">',
'      <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'    </div>',
'    <div class="t-MediaList-body">',
'      <h3 class="t-MediaList-title" aria-current="page">#TEXT#</h3>',
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
prompt --application/shared_components/user_interface/templates/list/tabs
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(22241574649983055216)
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
,p_javascript_file_urls=>'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
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
prompt --application/shared_components/user_interface/templates/list/top_navigation_tabs
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(22241576470596055218)
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
prompt --application/shared_components/user_interface/templates/list/links_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(22241578082708055220)
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
prompt --application/shared_components/user_interface/templates/list/menu_bar
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(22241579607624055221)
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
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul>'
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
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(22241580632924055223)
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
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(22241582699763055225)
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
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(22241584010075055226)
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
prompt --application/shared_components/user_interface/templates/list/navigation_bar
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(22241584632893055227)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#" aria-current="page">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" title="#A04#" target="#A06#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true" #IMAGE_ATTR#></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" title="#A04#" target="#A06#">',
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
,p_sub_list_item_current=>'<li class="#A02#" data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li class="#A02#" data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
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
,p_sub_templ_curr_w_child=>'<li class="#A02#" data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li class="#A02#" data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_a04_label=>'Title Attribute'
,p_a06_label=>'Link Target'
,p_reference_id=>2846096252961119197
);
end;
/
prompt --application/shared_components/user_interface/templates/list/side_navigation_menu
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(22241585034647055228)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#">',
'  <a href="#LINK#" title="#A04#" style="display: none" target="#A06#">#TEXT_ESC_SC#</a>',
'  <div class="a-TreeView-node a-TreeView-node--topLevel" aria-hidden="true">',
'    <div role="none" class="a-TreeView-row is-selected is-current--top"></div>',
'    <div role="none" class="a-TreeView-content is-selected is-current--top">',
'      <span class="fa fa-file-o #ICON_CSS_CLASSES#"></span>',
'      <span class="a-TreeView-label">#TEXT_ESC_SC#</span>',
'    </div>',
'  </div>',
'</li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-current="false" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#">',
'  <a href="#LINK#" title="#A04#" style="display: none" target="#A06#">#TEXT_ESC_SC#</a>',
'  <div class="a-TreeView-node a-TreeView-node--topLevel" aria-hidden="true">',
'    <div role="none" class="a-TreeView-row"></div>',
'    <div role="none" class="a-TreeView-content">',
'      <span class="fa fa-file-o #ICON_CSS_CLASSES#"></span>',
'      <span class="a-TreeView-label">#TEXT_ESC_SC#</span>',
'    </div>',
'  </div>',
'</li>'))
,p_list_template_name=>'Side Navigation Menu'
,p_internal_name=>'SIDE_NAVIGATION_MENU'
,p_javascript_file_urls=>'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>'apex.jQuery(''body'').addClass(''t-PageBody--leftNav'');'
,p_theme_id=>42
,p_theme_class_id=>19
,p_default_template_options=>'js-defaultCollapsed'
,p_preset_template_options=>'js-navCollapsed--hidden:t-TreeNav--styleA'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL".">',
'  <div class="a-TreeView t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL".">',
'    <ul>',
''))
,p_list_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    </ul>',
'  </div>',
'</div>',
'<script>(sessionStorage.getItem("nav.&APP_ID..preferenceForExpanded") === "true" && window.matchMedia("(min-width: " + getComputedStyle(document.documentElement).getPropertyValue("--js-mq-lg") + ")").matches) && document.getElementById(''t_PageBody'').'
||'classList.add(''js-navExpanded'');</script>',
'<script>',
'    const labels = document.querySelectorAll(".a-TreeView .a-TreeView-label");',
'    for (const label of labels) {',
'        label.textContent = label.textContent.replaceAll(/\[(.*?)\]/ig, '''');',
'    }',
'</script>'))
,p_before_sub_list=>'<ul style="display:none">'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#">',
'  <a href="#LINK#" title="#A04#" style="display: none" target="#A06#">#TEXT_ESC_SC#</a>',
'  <div class="a-TreeView-node a-TreeView-node--topLevel" aria-hidden="true">',
'    <div role="none" class="a-TreeView-row is-selected is-current--top"></div>',
'    <div role="none" class="a-TreeView-content is-selected is-current--top">',
'      <span class="fa fa-file-o #ICON_CSS_CLASSES#"></span>',
'      <span class="a-TreeView-label">#TEXT_ESC_SC#</span>',
'    </div>',
'  </div>',
''))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-current="false" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#">',
'  <a href="#LINK#" title="#A04#" style="display: none" target="#A06#">#TEXT_ESC_SC#</a>',
'  <div class="a-TreeView-node a-TreeView-node--topLevel" aria-hidden="true">',
'    <div role="none" class="a-TreeView-row"></div>',
'    <div role="none" class="a-TreeView-content">',
'      <span class="fa fa-file-o #ICON_CSS_CLASSES#"></span>',
'      <span class="a-TreeView-label">#TEXT_ESC_SC#</span>',
'    </div>',
'  </div>',
''))
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
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(22241586827046055232)
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
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(22241537164630055160)
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
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(22241537341711055165)
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
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(22241541345148055168)
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
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(22241546781939055175)
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
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(22241547930440055176)
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
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(22241549077050055178)
,p_row_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# #ACCESSIBLE_HEADERS#>#COLUMN_VALUE#</td>'
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
,p_column_heading_template=>'<th class="t-Report-colHead" #ARIA_SORT# #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
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
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(22241551675667055182)
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
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(22241551833426055184)
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
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(22241555028969055189)
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
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(22241555425005055190)
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
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(22241558465277055194)
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
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(22241560483014055197)
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
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(22241587805841055234)
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
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(22241587943657055237)
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
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(22241588044166055238)
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
prompt --application/shared_components/user_interface/templates/label/required
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(22241588174443055239)
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
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(22241588850522055240)
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
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(22241589365814055241)
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
prompt --application/shared_components/user_interface/templates/label/optional_floating
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(22241589892635055243)
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
prompt --application/shared_components/user_interface/templates/breadcrumb/breadcrumb
begin
wwv_flow_imp_shared.create_menu_template(
 p_id=>wwv_flow_imp.id(22241592338571055252)
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
wwv_flow_imp_shared.create_popup_lov_template(
 p_id=>wwv_flow_imp.id(22241592857726055268)
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
wwv_flow_imp_shared.create_calendar_template(
 p_id=>wwv_flow_imp.id(22241592474776055256)
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
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(22241594135623055288)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(22241448014788055042)
,p_default_dialog_template=>wwv_flow_imp.id(22241446574015055040)
,p_error_template=>wwv_flow_imp.id(22241439980132055031)
,p_printer_friendly_template=>wwv_flow_imp.id(22241448014788055042)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(22241439980132055031)
,p_default_button_template=>wwv_flow_imp.id(22241590606246055248)
,p_default_region_template=>wwv_flow_imp.id(22241489256245055099)
,p_default_chart_template=>wwv_flow_imp.id(22241489256245055099)
,p_default_form_template=>wwv_flow_imp.id(22241489256245055099)
,p_default_reportr_template=>wwv_flow_imp.id(22241489256245055099)
,p_default_tabform_template=>wwv_flow_imp.id(22241489256245055099)
,p_default_wizard_template=>wwv_flow_imp.id(22241489256245055099)
,p_default_menur_template=>wwv_flow_imp.id(22241501650118055115)
,p_default_listr_template=>wwv_flow_imp.id(22241489256245055099)
,p_default_irr_template=>wwv_flow_imp.id(22241487195801055097)
,p_default_report_template=>wwv_flow_imp.id(22241549077050055178)
,p_default_label_template=>wwv_flow_imp.id(22241589892635055243)
,p_default_menu_template=>wwv_flow_imp.id(22241592338571055252)
,p_default_calendar_template=>wwv_flow_imp.id(22241592474776055256)
,p_default_list_template=>wwv_flow_imp.id(22241578082708055220)
,p_default_nav_list_template=>wwv_flow_imp.id(22241586827046055232)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(22241586827046055232)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(22241585034647055228)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(22241506840845055122)
,p_default_dialogr_template=>wwv_flow_imp.id(22241456623640055059)
,p_default_option_label=>wwv_flow_imp.id(22241589892635055243)
,p_default_required_label=>wwv_flow_imp.id(22241589365814055241)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_imp.id(22241584632893055227)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/22.1/')
,p_files_version=>66
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(22241593126675055274)
,p_theme_id=>42
,p_name=>'Redwood Light'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/oracle-fonts/oraclesans-apex#MIN#.css?v=#APEX_VERSION#',
'#THEME_FILES#css/Redwood#MIN#.css?v=#APEX_VERSION#'))
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Redwood-Theme.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Redwood-Theme#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2596426436825065489
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(22241593385960055274)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(22241593515176055274)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3543348412015319650
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(22241593773363055274)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>1938457712423918173
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(22241593987727055274)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita-Slate.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(22242383430537501314)
,p_theme_id=>42
,p_name=>'Movies - Dark'
,p_is_current=>true
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita-Dark.less'
,p_theme_roller_config=>'{"classes":[],"vars":{"@g_Accent-BG":"#c74634","@g_Accent-OG":"#312d2a"},"customCSS":"","useCustomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#22242383430537501314.css'
,p_theme_roller_read_only=>false
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '3A726F6F74207B0D0A20202D2D612D626173652D666F6E742D7765696768742D73656D69626F6C643A203630303B0D0A20202D2D612D69636F6E2D73697A653A203172656D3B0D0A20202D2D612D627574746F6E2D626F726465722D7261646975733A20';
wwv_flow_imp.g_varchar2_table(2) := '302E31323572656D3B0D0A20202D2D612D627574746F6E2D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D627574746F6E2D70616464696E672D783A20302E373572656D3B0D0A20202D2D612D627574746F6E2D666F6E742D73697A65';
wwv_flow_imp.g_varchar2_table(3) := '3A20302E373572656D3B0D0A20202D2D612D627574746F6E2D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D627574746F6E2D6761702D783A20302E323572656D3B0D0A20202D2D612D627574746F6E2D69636F6E2D73706163696E67';
wwv_flow_imp.g_varchar2_table(4) := '3A20302E33373572656D3B0D0A20202D2D612D627574746F6E2D69636F6E2D73697A653A203172656D3B0D0A20202D2D612D63762D677269642D6761703A203172656D3B0D0A20202D2D612D63762D6974656D2D77696474683A20323072656D3B0D0A20';
wwv_flow_imp.g_varchar2_table(5) := '202D2D612D63762D626F726465722D7261646975733A20302E323572656D3B0D0A20202D2D612D63762D736861646F773A20766172282D2D75742D736861646F772D736D293B0D0A20202D2D612D63762D6865616465722D70616464696E672D793A2031';
wwv_flow_imp.g_varchar2_table(6) := '72656D3B0D0A20202D2D612D63762D6865616465722D70616464696E672D783A203172656D3B0D0A20202D2D612D63762D6865616465722D6974656D2D73706163696E672D783A20302E373572656D3B0D0A20202D2D612D63762D69636F6E2D73697A65';
wwv_flow_imp.g_varchar2_table(7) := '3A203172656D3B0D0A20202D2D612D63762D69636F6E2D636F6E7461696E65722D73697A653A203272656D3B0D0A20202D2D612D63762D69636F6E2D70616464696E673A20302E3572656D3B0D0A20202D2D612D63762D69636F6E2D7370616365723A20';
wwv_flow_imp.g_varchar2_table(8) := '63616C6328766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A652C203172656D29202B20766172282D2D612D63762D6865616465722D6974656D2D73706163696E672D782C20302E373572656D29293B0D0A20202D2D612D63762D';
wwv_flow_imp.g_varchar2_table(9) := '696E697469616C732D73697A653A203272656D3B0D0A20202D2D612D63762D696E697469616C732D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D612D63762D7469746C652D666F6E742D73697A653A203172656D3B0D0A20202D2D61';
wwv_flow_imp.g_varchar2_table(10) := '2D63762D7469746C652D6C696E652D6865696768743A20312E323572656D3B0D0A20202D2D612D63762D7375627469746C652D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D63762D7375627469746C652D6C696E652D6865696768';
wwv_flow_imp.g_varchar2_table(11) := '743A203172656D3B0D0A20202D2D612D63762D62616467652D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D63762D62616467652D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C2030';
wwv_flow_imp.g_varchar2_table(12) := '2E3135293B0D0A20202D2D612D63762D626F64792D70616464696E672D783A203172656D3B0D0A20202D2D612D63762D626F64792D70616464696E672D793A203172656D3B0D0A20202D2D612D63762D6D61696E636F6E74656E742D666F6E742D73697A';
wwv_flow_imp.g_varchar2_table(13) := '653A20302E38373572656D3B0D0A20202D2D612D63762D6D61696E636F6E74656E742D6C696E652D6865696768743A20312E323572656D3B0D0A20202D2D612D63762D737562636F6E74656E742D666F6E742D73697A653A20302E3638373572656D3B0D';
wwv_flow_imp.g_varchar2_table(14) := '0A20202D2D612D63762D737562636F6E74656E742D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D63762D616374696F6E732D70616464696E672D793A203172656D3B0D0A20202D2D612D63762D616374696F6E732D70616464696E67';
wwv_flow_imp.g_varchar2_table(15) := '2D783A203172656D3B0D0A20202D2D612D636865636B626F782D73697A653A203172656D3B0D0A20202D2D612D636865636B626F782D6C6162656C2D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D636865636B626F782D626F7264';
wwv_flow_imp.g_varchar2_table(16) := '65722D7261646975733A20302E31323572656D3B0D0A20202D2D612D636865636B626F782D69636F6E2D73697A653A20302E373572656D3B0D0A20202D2D612D636865636B626F782D696E64657465726D696E6174652D77696474683A20302E36323572';
wwv_flow_imp.g_varchar2_table(17) := '656D3B0D0A20202D2D612D636865636B626F782D696E64657465726D696E6174652D6865696768743A20302E31323572656D3B0D0A20202D2D612D636865636B626F782D6C6162656C2D73706163696E672D793A20302E31323572656D3B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(18) := '612D636865636B626F782D6C6162656C2D73706163696E672D783A20302E33373572656D3B0D0A20202D2D612D636F6D626F2D626F782D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D636F6D626F2D626F782D70616464696E672D';
wwv_flow_imp.g_varchar2_table(19) := '783A20302E3572656D3B0D0A20202D2D612D6465762D746F6F6C6261722D6261636B67726F756E642D636F6C6F723A20233636363B0D0A20202D2D612D6465762D746F6F6C6261722D6261636B64726F702D66696C7465723A206E6F6E653B0D0A20202D';
wwv_flow_imp.g_varchar2_table(20) := '2D612D66732D636F6E74726F6C2D736570657261746F722D626F726465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C20317078293B0D0A20202D2D612D66732D636F6E74726F6C2D7365706572';
wwv_flow_imp.g_varchar2_table(21) := '61746F722D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D66732D636F6E74726F6C2D6865616465722D70616464696E672D793A20302E373572656D3B0D0A20';
wwv_flow_imp.g_varchar2_table(22) := '202D2D612D66732D636F6E74726F6C2D6865616465722D70616464696E672D783A20302E373572656D3B0D0A20202D2D612D66732D636F6E74726F6C2D6865616465722D666F6E742D73697A653A203172656D3B0D0A20202D2D612D66732D636F6E7472';
wwv_flow_imp.g_varchar2_table(23) := '6F6C2D6865616465722D6C696E652D6865696768743A20312E323572656D3B0D0A20202D2D612D66732D636F6E74726F6C2D626F64792D70616464696E672D793A20302E373572656D3B0D0A20202D2D612D66732D636F6E74726F6C2D626F64792D7061';
wwv_flow_imp.g_varchar2_table(24) := '6464696E672D783A20302E373572656D3B0D0A20202D2D612D66732D636F6E74726F6C2D616374696F6E732D70616464696E672D793A20302E373572656D3B0D0A20202D2D612D66732D636F6E74726F6C2D616374696F6E732D70616464696E672D783A';
wwv_flow_imp.g_varchar2_table(25) := '203072656D3B0D0A20202D2D612D66732D636F6E74726F6C2D6974656D2D73706163696E673A20302E373572656D3B0D0A20202D2D612D66732D66696C7465722D67726F75702D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E';
wwv_flow_imp.g_varchar2_table(26) := '656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D66732D66696C7465722D67726F75702D626F726465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C20317078293B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(27) := '612D66732D66696C7465722D67726F75702D6C6162656C2D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D612D66732D6974656D2D7375622D67726F75702D73';
wwv_flow_imp.g_varchar2_table(28) := '706163696E673A20302E3572656D3B0D0A20202D2D612D66732D63686172742D70616464696E672D793A203172656D3B0D0A20202D2D612D66732D63686172742D70616464696E672D783A203172656D3B0D0A20202D2D612D66732D63686172742D626F';
wwv_flow_imp.g_varchar2_table(29) := '726465722D77696474683A20766172282D2D75742D726567696F6E2D626F726465722D77696474682C20766172282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C2031707829293B0D0A20202D2D612D66732D63686172742D626F';
wwv_flow_imp.g_varchar2_table(30) := '726465722D636F6C6F723A20766172282D2D75742D726567696F6E2D626F726465722D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F7229293B0D0A20202D2D612D66732D63686172742D626F726465722D';
wwv_flow_imp.g_varchar2_table(31) := '7261646975733A20766172282D2D75742D726567696F6E2D626F726465722D7261646975732C20766172282D2D75742D636F6D706F6E656E742D626F726465722D72616469757329293B0D0A20202D2D612D66732D63686172742D6261636B67726F756E';
wwv_flow_imp.g_varchar2_table(32) := '642D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D66732D63686172742D736861646F773A20766172282D2D75742D726567696F6E2D626F782D736861646F77293B0D';
wwv_flow_imp.g_varchar2_table(33) := '0A20202D2D612D66696C6564726F702D70616464696E672D793A203172656D3B0D0A20202D2D612D66696C6564726F702D70616464696E672D783A203172656D3B0D0A20202D2D612D66696C6564726F702D626F726465722D7261646975733A20302E31';
wwv_flow_imp.g_varchar2_table(34) := '323572656D3B0D0A20202D2D612D66696C6564726F702D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D626F726465722D636F6C6F72293B0D0A20202D2D612D66696C6564726F702D746578742D636F6C6F723A20';
wwv_flow_imp.g_varchar2_table(35) := '766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D612D66696C6564726F702D666F6375732D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D666F6375732D';
wwv_flow_imp.g_varchar2_table(36) := '626F726465722D636F6C6F72293B0D0A20202D2D612D66696C6564726F702D6974656D2D73706163696E673A20302E323572656D3B0D0A20202D2D612D66696C6564726F702D69636F6E2D73697A653A203272656D3B0D0A20202D2D612D66696C656472';
wwv_flow_imp.g_varchar2_table(37) := '6F702D68656164696E672D666F6E742D73697A653A20312E323572656D3B0D0A20202D2D612D66696C6564726F702D68656164696E672D6C696E652D6865696768743A20312E373572656D3B0D0A20202D2D612D66696C6564726F702D68656164696E67';
wwv_flow_imp.g_varchar2_table(38) := '2D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D7469746C652D636F6C6F72293B0D0A20202D2D612D66696C6564726F702D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D612D66696C6564';
wwv_flow_imp.g_varchar2_table(39) := '726F702D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D66696C6564726F702D70726F67726573732D77696474683A20313572656D3B0D0A20202D2D612D66696C6564726F702D70726F67726573732D6865696768743A20302E373572';
wwv_flow_imp.g_varchar2_table(40) := '656D3B0D0A20202D2D612D66696C6564726F702D70726F67726573732D626F726465722D7261646975733A20302E33373572656D3B0D0A20202D2D612D66696C6564726F702D70726F67726573732D6261722D77696474683A203372656D3B0D0A20202D';
wwv_flow_imp.g_varchar2_table(41) := '2D612D6669656C642D696E7075742D626F726465722D7261646975733A20302E31323572656D3B0D0A20202D2D612D6669656C642D73656C6563742D6261636B67726F756E642D73697A653A203272656D203172656D3B0D0A20202D2D612D6669656C64';
wwv_flow_imp.g_varchar2_table(42) := '2D73656C6563742D6172726F772D70616464696E673A203272656D3B0D0A20202D2D612D67762D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D67762D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D67762D626F';
wwv_flow_imp.g_varchar2_table(43) := '726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D67762D63656C6C2D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D67762D63656C6C2D70616464';
wwv_flow_imp.g_varchar2_table(44) := '696E672D783A20302E3572656D3B0D0A20202D2D612D67762D63656C6C2D6865696768743A203272656D3B0D0A20202D2D612D67762D726F772D686F7665722D6261636B67726F756E642D636F6C6F723A20233036303630363B0D0A20202D2D612D6776';
wwv_flow_imp.g_varchar2_table(45) := '2D696E7365727465642D6261636B67726F756E642D636F6C6F723A20766172282D2D612D70616C657474652D737563636573732D7368616465293B0D0A20202D2D612D67762D64656C657465642D6261636B67726F756E642D636F6C6F723A2023306430';
wwv_flow_imp.g_varchar2_table(46) := '6430643B0D0A20202D2D612D67762D6772616E64746F74616C2D6261636B67726F756E642D636F6C6F723A20233139313931393B0D0A20202D2D612D67762D757064617465642D6261636B67726F756E642D636F6C6F723A20766172282D2D612D70616C';
wwv_flow_imp.g_varchar2_table(47) := '657474652D696E666F2D7368616465293B0D0A20202D2D612D67762D6865616465722D63656C6C2D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D67762D6865616465722D63656C6C2D70616464696E672D783A20302E3572656D3B';
wwv_flow_imp.g_varchar2_table(48) := '0D0A20202D2D612D67762D6865616465722D63656C6C2D6865696768743A20322E3572656D3B0D0A20202D2D612D67762D666F6F7465722D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D67762D666F6F7465722D70616464696E672D';
wwv_flow_imp.g_varchar2_table(49) := '783A20302E373572656D3B0D0A20202D2D612D67762D706167696E6174696F6E2D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D67762D706167696E6174696F6E2D627574746F6E2D74';
wwv_flow_imp.g_varchar2_table(50) := '6578742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D67762D706167696E6174696F6E2D627574746F6E2D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D67762D706167';
wwv_flow_imp.g_varchar2_table(51) := '696E6174696F6E2D627574746F6E2D70616464696E672D783A20302E323572656D3B0D0A20202D2D612D67762D706167696E6174696F6E2D627574746F6E2D6761702D783A20302E323572656D3B0D0A20202D2D612D67762D706167696E6174696F6E2D';
wwv_flow_imp.g_varchar2_table(52) := '627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D67762D706167696E6174696F6E2D627574746F6E2D68';
wwv_flow_imp.g_varchar2_table(53) := '6F7665722D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D67762D6E6F646174612D6D6573736167652D70616464696E672D793A203172656D3B0D0A20202D2D612D';
wwv_flow_imp.g_varchar2_table(54) := '67762D6E6F646174612D6D6573736167652D70616464696E672D783A203172656D3B0D0A20202D2D612D67762D6E6F646174612D6D6573736167652D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465';
wwv_flow_imp.g_varchar2_table(55) := '642D636F6C6F72293B0D0A20202D2D612D67762D6E6F646174612D6D6573736167652D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D67762D6E6F646174612D6D6573736167652D69636F6E2D73697A653A203272656D3B0D0A2020';
wwv_flow_imp.g_varchar2_table(56) := '2D2D612D67762D6E6F646174612D6D6573736167652D69636F6E2D73706163696E673A20302E373572656D3B0D0A20202D2D612D68656C702D6469616C6F672D636F64652D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D';
wwv_flow_imp.g_varchar2_table(57) := '746578742D6D757465642D636F6C6F72293B0D0A20202D2D612D6D64656469746F722D6261636B67726F756E642D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D6D';
wwv_flow_imp.g_varchar2_table(58) := '64656469746F722D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D626F726465722D636F6C6F72293B0D0A20202D2D612D6D64656469746F722D626F726465722D77696474683A20766172282D2D612D6669656C64';
wwv_flow_imp.g_varchar2_table(59) := '2D696E7075742D626F726465722D7769647468293B0D0A20202D2D612D6D64656469746F722D666F6375732D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D666F6375732D626F726465722D636F6C6F72293B0D0A';
wwv_flow_imp.g_varchar2_table(60) := '20202D2D612D6D656E756261722D6974656D2D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D6D656E756261722D6974656D2D70616464696E672D783A20302E3572656D3B0D0A20202D2D612D6D656E756261722D6974656D2D73706C';
wwv_flow_imp.g_varchar2_table(61) := '69742D69636F6E2D73697A653A203172656D3B0D0A20202D2D612D6D656E756261722D6974656D2D73706C69742D69636F6E2D73706163696E673A20302E3572656D3B0D0A20202D2D612D6D656E752D70616464696E672D793A20302E3572656D3B0D0A';
wwv_flow_imp.g_varchar2_table(62) := '20202D2D612D6D656E752D70616464696E672D783A203072656D3B0D0A20202D2D612D6D656E752D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D6D656E752D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D6D65';
wwv_flow_imp.g_varchar2_table(63) := '6E752D626F726465722D7261646975733A20302E323572656D3B0D0A20202D2D612D6D656E752D7365702D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D6D65';
wwv_flow_imp.g_varchar2_table(64) := '6E752D7365702D73706163696E672D793A20302E323572656D3B0D0A20202D2D612D6D656E752D69636F6E2D73697A653A203172656D3B0D0A20202D2D612D6D656E752D69636F6E2D73706163696E672D793A20302E3572656D3B0D0A20202D2D612D6D';
wwv_flow_imp.g_varchar2_table(65) := '656E752D69636F6E2D73706163696E672D783A20302E3572656D3B0D0A20202D2D612D6D656E752D6974656D2D67656E657269632D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D6D656E752D6974656D2D67656E657269632D706164';
wwv_flow_imp.g_varchar2_table(66) := '64696E672D783A20302E3572656D3B0D0A20202D2D612D6D656E752D63616C6C6F75742D73697A653A20302E373572656D3B0D0A20202D2D612D6D656E752D63616C6C6F75742D626F726465722D7261646975733A203072656D3B0D0A20202D2D612D6D';
wwv_flow_imp.g_varchar2_table(67) := '656E752D63616C6C6F75742D736861646F773A2030203020302E323572656D2030207267626128302C20302C20302C20302E31293B0D0A20202D2D612D706F7075706C6F762D7365617263682D6261722D70616464696E672D793A20302E3572656D3B0D';
wwv_flow_imp.g_varchar2_table(68) := '0A20202D2D612D706F7075706C6F762D7365617263682D6261722D70616464696E672D783A20766172282D2D612D706F7075706C6F762D7365617263682D6261722D70616464696E672D79293B0D0A20202D2D612D72762D666F6E742D73697A653A2030';
wwv_flow_imp.g_varchar2_table(69) := '2E373572656D3B0D0A20202D2D612D72762D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D72762D626F64792D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D72762D626F64792D70616464696E672D783A203072';
wwv_flow_imp.g_varchar2_table(70) := '656D3B0D0A20202D2D612D70657263656E742D63686172742D6865696768743A203172656D3B0D0A20202D2D612D70657263656E742D63686172742D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D61';
wwv_flow_imp.g_varchar2_table(71) := '72792D7368616465293B0D0A20202D2D612D70657263656E742D63686172742D626F726465722D7261646975733A20302E31323572656D3B0D0A20202D2D612D70657263656E742D63686172742D626F726465722D636F6C6F723A20766172282D2D7574';
wwv_flow_imp.g_varchar2_table(72) := '2D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D70657263656E742D63686172742D6261722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D';
wwv_flow_imp.g_varchar2_table(73) := '2D612D70657263656E742D63686172742D6261722D746578742D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D636F6E7472617374293B0D0A20202D2D612D70657263656E742D63686172742D6261722D626F72646572';
wwv_flow_imp.g_varchar2_table(74) := '2D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D7265706F72742D636F';
wwv_flow_imp.g_varchar2_table(75) := '6E74726F6C732D70616464696E672D783A20302E3572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A2020';
wwv_flow_imp.g_varchar2_table(76) := '2D2D612D7265706F72742D636F6E74726F6C732D626F726465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F726465722D7769647468293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D6974656D2D73706163';
wwv_flow_imp.g_varchar2_table(77) := '696E673A20302E323572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D73706163696E673A20302E3572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D626F726465722D726164697573';
wwv_flow_imp.g_varchar2_table(78) := '3A20302E31323572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D77696474683A2031382E373572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D666F6E';
wwv_flow_imp.g_varchar2_table(79) := '742D73697A653A20302E373572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C61';
wwv_flow_imp.g_varchar2_table(80) := '62656C2D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D626F726465722D77696474683A20';
wwv_flow_imp.g_varchar2_table(81) := '766172282D2D75742D636F6D706F6E656E742D626F726465722D7769647468293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D626F726465722D77696474683A20766172282D2D612D6669656C642D696E7075742D626F72';
wwv_flow_imp.g_varchar2_table(82) := '6465722D7769647468293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D626F726465722D636F6C6F72293B0D0A20202D2D612D726570';
wwv_flow_imp.g_varchar2_table(83) := '6F72742D636F6E74726F6C732D696E7075742D626F726465722D7261646975733A20766172282D2D612D6669656C642D696E7075742D626F726465722D726164697573293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D66';
wwv_flow_imp.g_varchar2_table(84) := '6F6375732D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D666F6375732D626F726465722D636F6C6F72293B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D70616464696E672D793A20';
wwv_flow_imp.g_varchar2_table(85) := '302E3572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D70616464696E672D783A20302E3572656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D666F6E742D73697A653A20302E3735';
wwv_flow_imp.g_varchar2_table(86) := '72656D3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D696E7075742D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D73706C69747465722D6261722D77696474683A20302E3572656D3B0D0A20202D2D612D73706C6974';
wwv_flow_imp.g_varchar2_table(87) := '7465722D7468756D622D77696474683A20302E3572656D3B0D0A20202D2D612D73706C69747465722D7468756D622D6865696768743A203372656D3B0D0A20202D2D612D73706C69747465722D7468756D622D626F726465722D7261646975733A203072';
wwv_flow_imp.g_varchar2_table(88) := '656D3B0D0A20202D2D612D73746172726174696E672D73746172732D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D73746172726174696E672D73746172732D62672D636F6C6F723A2072676261283235352C203235352C20323535';
wwv_flow_imp.g_varchar2_table(89) := '2C20302E3135293B0D0A20202D2D612D73746172726174696E672D76616C75652D73706163696E673A20302E3572656D3B0D0A20202D2D612D7377697463682D77696474683A20322E373572656D3B0D0A20202D2D612D7377697463682D70616464696E';
wwv_flow_imp.g_varchar2_table(90) := '672D793A20302E31323572656D3B0D0A20202D2D612D7377697463682D70616464696E672D783A20302E31323572656D3B0D0A20202D2D612D7377697463682D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D612D73776974';
wwv_flow_imp.g_varchar2_table(91) := '63682D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D7377697463682D6163746976652D6261636B67726F756E642D636F6C6F723A20766172282D2D612D7377697463682D686F7665722D6261636B67726F756E642D636F6C6F72293B';
wwv_flow_imp.g_varchar2_table(92) := '0D0A20202D2D612D7377697463682D636865636B65642D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D612D7377697463682D636865636B65642D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D73776974';
wwv_flow_imp.g_varchar2_table(93) := '63682D636865636B65642D6163746976652D6261636B67726F756E642D636F6C6F723A20766172282D2D612D7377697463682D636865636B65642D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D7377697463682D746F';
wwv_flow_imp.g_varchar2_table(94) := '67676C652D77696474683A20312E323572656D3B0D0A20202D2D612D7377697463682D746F67676C652D6865696768743A20312E323572656D3B0D0A20202D2D612D746F6F6C6261722D6261636B67726F756E642D636F6C6F723A20766172282D2D7574';
wwv_flow_imp.g_varchar2_table(95) := '2D726567696F6E2D6865616465722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D746F6F6C6261722D626F726465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C2031707829';
wwv_flow_imp.g_varchar2_table(96) := '3B0D0A20202D2D612D746F6F6C6261722D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D612D746F6F6C6261722D6974656D2D73706163696E673A20302E3572656D';
wwv_flow_imp.g_varchar2_table(97) := '3B0D0A20202D2D612D746F6F6C6261722D7365702D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72293B0D0A20202D2D612D746F6F6C6261722D736D616C6C2D62757474';
wwv_flow_imp.g_varchar2_table(98) := '6F6E2D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D746F6F6C6261722D736D616C6C2D627574746F6E2D70616464696E672D783A20302E3572656D3B0D0A20202D2D612D74726565766965772D746F67676C652D73697A653A2031';
wwv_flow_imp.g_varchar2_table(99) := '72656D3B0D0A20202D2D612D74726565766965772D6E6F64652D69636F6E2D73697A653A203172656D3B0D0A20202D2D612D74726565766965772D6E6F64652D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D74726565766965772D';
wwv_flow_imp.g_varchar2_table(100) := '6E6F64652D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D74726565766965772D6E6F64652D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D74726565766965772D6E6F64652D70616464696E672D783A20302E32';
wwv_flow_imp.g_varchar2_table(101) := '3572656D3B0D0A20202D2D612D74726565766965772D6E6F64652D746578742D636F6C6F723A20696E68657269743B0D0A20202D2D612D74726565766965772D6E6F64652D666F63757365642D736861646F773A20696E73657420302030203020317078';
wwv_flow_imp.g_varchar2_table(102) := '20726762612835372C203135352C203233342C20302E35293B0D0A20202D2D612D74726565766965772D6E6F64652D706C616365686F6C6465722D626F726465722D7261646975733A20302E31323572656D3B0D0A20202D2D612D74726565766965772D';
wwv_flow_imp.g_varchar2_table(103) := '647261672D68656C7065722D626F726465722D7261646975733A20302E31323572656D3B0D0A20202D2D612D636869702D70616464696E672D793A20302E31323572656D3B0D0A20202D2D612D636869702D70616464696E672D783A20302E3132357265';
wwv_flow_imp.g_varchar2_table(104) := '6D3B0D0A20202D2D612D636869702D73706163696E673A20302E323572656D3B0D0A20202D2D612D636869702D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D636869702D6C696E652D6865696768743A203172656D3B0D0A20202D';
wwv_flow_imp.g_varchar2_table(105) := '2D612D636869702D6C6162656C2D73706163696E673A20302E323572656D3B0D0A20202D2D612D636869702D626F726465722D7261646975733A20302E31323572656D3B0D0A20202D2D612D636869702D626F726465722D77696474683A20766172282D';
wwv_flow_imp.g_varchar2_table(106) := '2D612D6669656C642D696E7075742D626F726465722D7769647468293B0D0A20202D2D612D636869702D626F726465722D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D626F726465722D636F6C6F72293B0D0A20202D2D612D6368';
wwv_flow_imp.g_varchar2_table(107) := '69702D686F7665722D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D612D636869702D6163746976652D6261636B67726F756E642D636F6C6F723A207267626128323535';
wwv_flow_imp.g_varchar2_table(108) := '2C203235352C203235352C20302E31293B0D0A20202D2D612D636869702D6170706C6965642D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303735293B0D0A20202D2D612D636869702D6170706C';
wwv_flow_imp.g_varchar2_table(109) := '6965642D686F7665722D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D0A20202D2D612D636869702D72656D6F76652D686F7665722D6261636B67726F756E642D636F6C6F723A207267';
wwv_flow_imp.g_varchar2_table(110) := '6261283235352C203235352C203235352C20302E31293B0D0A20202D2D612D636869702D72656D6F76652D6163746976652D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303735293B0D0A20202D';
wwv_flow_imp.g_varchar2_table(111) := '2D612D636869702D6170706C6965642D69732D6163746976652D72656D6F76652D686F7665722D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D612D636869702D6170706C69';
wwv_flow_imp.g_varchar2_table(112) := '65642D69732D6163746976652D72656D6F76652D6163746976652D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E32293B0D0A20202D2D612D636869702D696E7075742D666F6E742D73697A653A20';
wwv_flow_imp.g_varchar2_table(113) := '302E373572656D3B0D0A20202D2D612D636869702D696E7075742D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D636F6D626F2D73656C6563742D69636F6E2D73697A653A203172656D3B0D0A20202D2D612D746F6F6C7469702D666F';
wwv_flow_imp.g_varchar2_table(114) := '6E742D73697A653A20302E3638373572656D3B0D0A20202D2D612D7370696E6E65722D73697A653A203272656D3B0D0A20202D2D612D7370696E6E65722D626F726465722D77696474683A20302E323572656D3B0D0A20202D2D612D7370696E6E65722D';
wwv_flow_imp.g_varchar2_table(115) := '636F6E7461696E65722D70616464696E673A20302E3572656D3B0D0A20202D2D612D6C6F76652D617065782D6D617267696E3A203020302E31323572656D3B0D0A20202D2D612D6C6F76652D617065782D686F7665722D746578742D636F6C6F723A2076';
wwv_flow_imp.g_varchar2_table(116) := '6172282D2D612D70616C657474652D64616E6765722C2023463030293B0D0A20202D2D6A75692D6469616C6F672D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D726567696F6E2D6261636B67726F756E642D636F6C6F722C207661';
wwv_flow_imp.g_varchar2_table(117) := '72282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F7229293B0D0A20202D2D6A75692D6469616C6F672D746578742D636F6C6F723A20766172282D2D75742D726567696F6E2D746578742D636F6C6F722C20766172282D2D75';
wwv_flow_imp.g_varchar2_table(118) := '742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F7229293B0D0A20202D2D6A75692D6469616C6F672D626F726465722D636F6C6F723A20766172282D2D75742D726567696F6E2D626F726465722D636F6C6F722C20766172282D2D';
wwv_flow_imp.g_varchar2_table(119) := '75742D636F6D706F6E656E742D626F726465722D636F6C6F7229293B0D0A20202D2D6A75692D6469616C6F672D626F726465722D77696474683A20303B0D0A20202D2D6A75692D6469616C6F672D626F726465722D7261646975733A20766172282D2D75';
wwv_flow_imp.g_varchar2_table(120) := '742D726567696F6E2D626F726465722D7261646975732C20766172282D2D75742D636F6D706F6E656E742D626F726465722D72616469757329293B0D0A20202D2D6A75692D6469616C6F672D736861646F773A20766172282D2D75742D736861646F772D';
wwv_flow_imp.g_varchar2_table(121) := '6C67292C2030203020302031707820766172282D2D75742D726567696F6E2D626F726465722D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F7229293B0D0A20202D2D6A75692D6469616C6F672D666F6E74';
wwv_flow_imp.g_varchar2_table(122) := '2D73697A653A20302E373572656D3B0D0A20202D2D6A75692D6469616C6F672D7469746C656261722D70616464696E672D793A20302E373572656D3B0D0A20202D2D6A75692D6469616C6F672D7469746C656261722D70616464696E672D783A20317265';
wwv_flow_imp.g_varchar2_table(123) := '6D3B0D0A20202D2D6A75692D6469616C6F672D7469746C656261722D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D6A75692D6469616C6F672D7469746C656261722D746578742D636F6C6F723A2076617228';
wwv_flow_imp.g_varchar2_table(124) := '2D2D75742D636F6D706F6E656E742D746578742D7469746C652D636F6C6F72293B0D0A20202D2D6A75692D6469616C6F672D7469746C656261722D626F726465722D77696474683A20766172282D2D75742D726567696F6E2D626F726465722D77696474';
wwv_flow_imp.g_varchar2_table(125) := '682C20766172282D2D75742D636F6D706F6E656E742D626F726465722D77696474682C2031707829293B0D0A20202D2D6A75692D6469616C6F672D7469746C656261722D626F726465722D636F6C6F723A20766172282D2D75742D726567696F6E2D626F';
wwv_flow_imp.g_varchar2_table(126) := '726465722D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F7229293B0D0A20202D2D6A75692D6469616C6F672D7469746C652D666F6E742D73697A653A203172656D3B0D0A20202D2D6A75692D6469616C6F';
wwv_flow_imp.g_varchar2_table(127) := '672D7469746C652D6C696E652D6865696768743A20312E3572656D3B0D0A20202D2D6A75692D6469616C6F672D7469746C652D636C6F73652D77696474683A20312E3572656D3B0D0A20202D2D6A75692D6469616C6F672D7469746C652D636C6F73652D';
wwv_flow_imp.g_varchar2_table(128) := '6865696768743A20312E3572656D3B0D0A20202D2D6A75692D6469616C6F672D7469746C652D636C6F73652D70616464696E672D793A20302E3572656D3B0D0A20202D2D6A75692D6469616C6F672D7469746C652D636C6F73652D70616464696E672D78';
wwv_flow_imp.g_varchar2_table(129) := '3A20302E3572656D3B0D0A20202D2D6A75692D6469616C6F672D7469746C652D636C6F73652D626F726465722D7261646975733A20766172282D2D612D627574746F6E2D626F726465722D7261646975732C20302E31323572656D293B0D0A20202D2D6A';
wwv_flow_imp.g_varchar2_table(130) := '75692D6469616C6F672D7469746C652D636C6F73652D626F726465722D636F6C6F723A20766172282D2D612D627574746F6E2D626F726465722D636F6C6F72293B0D0A20202D2D6A75692D6469616C6F672D7469746C652D636C6F73652D69636F6E2D73';
wwv_flow_imp.g_varchar2_table(131) := '697A653A203172656D3B0D0A20202D2D6A75692D6469616C6F672D636F6E74656E742D70616464696E672D793A203072656D3B0D0A20202D2D6A75692D6469616C6F672D636F6E74656E742D70616464696E672D783A203072656D3B0D0A20202D2D6A75';
wwv_flow_imp.g_varchar2_table(132) := '692D6469616C6F672D627574746F6E70616E652D636F6E74656E742D70616464696E672D793A20302E373572656D3B0D0A20202D2D6A75692D6469616C6F672D627574746F6E70616E652D636F6E74656E742D70616464696E672D783A203172656D3B0D';
wwv_flow_imp.g_varchar2_table(133) := '0A20202D2D6A75692D6469616C6F672D627574746F6E70616E652D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D6A75692D646174657069636B65722D7769647468';
wwv_flow_imp.g_varchar2_table(134) := '3A2031372E3572656D3B0D0A20202D2D6A75692D646174657069636B65722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6A75692D64617465';
wwv_flow_imp.g_varchar2_table(135) := '7069636B65722D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D6A75692D646174657069636B65722D626F726465722D7261646975733A20302E3572656D3B0D0A20';
wwv_flow_imp.g_varchar2_table(136) := '202D2D6A75692D646174657069636B65722D70616464696E673A20302E3572656D3B0D0A20202D2D6A75692D746F6F6C7469702D626F726465722D7261646975733A20302E31323572656D3B0D0A20202D2D6A75692D746F6F6C7469702D70616464696E';
wwv_flow_imp.g_varchar2_table(137) := '673A20302E3572656D3B0D0A20202D2D6F6A65742D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D6F6A65742D736D616C6C2D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D6F6A65742D6D656469756D2D666F6E742D';
wwv_flow_imp.g_varchar2_table(138) := '73697A653A203172656D3B0D0A20202D2D6F6A65742D6C617267652D666F6E742D73697A653A20312E31323572656D3B0D0A20202D2D6F6A65742D6C61726765722D666F6E742D73697A653A20312E323572656D3B0D0A7D0D0A3A726F6F74207B0D0A20';
wwv_flow_imp.g_varchar2_table(139) := '202D2D75742D636F6C6F722D736368656D653A206461726B3B0D0A20202D2D75742D70616C657474652D67656E657269633A20233064306430643B0D0A20202D2D75742D70616C657474652D67656E657269632D636F6E74726173743A20236666663B0D';
wwv_flow_imp.g_varchar2_table(140) := '0A20202D2D75742D70616C657474652D67656E657269632D73686164653A20233036303630363B0D0A20202D2D75742D70616C657474652D67656E657269632D746578743A20236666663B0D0A20202D2D612D67762D6865616465722D6261636B67726F';
wwv_flow_imp.g_varchar2_table(141) := '756E642D636F6C6F723A20766172282D2D75742D726567696F6E2D6865616465722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D75742D7265706F72742D63656C6C2D616C742D6261636B67726F756E642D636F6C6F723A207267626128';
wwv_flow_imp.g_varchar2_table(142) := '3235352C203235352C203235352C20302E31293B0D0A20202D2D75742D7265706F72742D6865616465722D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D75742D686561';
wwv_flow_imp.g_varchar2_table(143) := '6465722D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D0A20202D2D75742D6865616465722D626F782D736861646F773A20766172282D2D75742D736861646F772D736D293B0D0A20202D2D7574';
wwv_flow_imp.g_varchar2_table(144) := '2D666F6F7465722D6261636B67726F756E642D636F6C6F723A20233064306430643B0D0A20202D2D75742D666F6F7465722D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D75742D666F';
wwv_flow_imp.g_varchar2_table(145) := '6F7465722D6974656D2D73706163696E673A20302E373572656D3B0D0A20202D2D75742D6E6176746162732D6974656D2D626F726465722D77696474683A203170783B0D0A20202D2D75742D6E6176746162732D6974656D2D686967686C696768742D63';
wwv_flow_imp.g_varchar2_table(146) := '6F6C6F723A207472616E73706172656E743B0D0A20202D2D75742D6E6176746162732D6974656D2D686967686C696768742D77696474683A203072656D3B0D0A20202D2D75742D6E6176746162732D6974656D2D6163746976652D686967686C69676874';
wwv_flow_imp.g_varchar2_table(147) := '2D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D75742D6E61766261722D627574746F6E2D62616467652D6261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E33293B';
wwv_flow_imp.g_varchar2_table(148) := '0D0A20202D2D75742D6E61766261722D627574746F6E2D62616467652D626F726465722D7261646975733A20313670783B0D0A20202D2D75742D626F64792D6E61762D626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D';
wwv_flow_imp.g_varchar2_table(149) := '626F726465722D636F6C6F72293B0D0A20202D2D75742D626F64792D7469746C652D626F726465722D77696474683A203070783B0D0A20202D2D75742D626F64792D7469746C652D626F782D736861646F773A2030203170782030203020726762612832';
wwv_flow_imp.g_varchar2_table(150) := '35352C203235352C203235352C20302E3135293B0D0A20202D2D75742D626F64792D7469746C652D6261636B64726F702D66696C7465723A20736174757261746528313830252920626C757228387078293B0D0A20202D2D75742D62726561646372756D';
wwv_flow_imp.g_varchar2_table(151) := '622D726567696F6E2D73706163696E673A20302E3572656D3B0D0A20202D2D75742D62726561646372756D622D6974656D2D6163746976652D746578742D636F6C6F723A20766172282D2D75742D626F64792D7469746C652D746578742D636F6C6F7229';
wwv_flow_imp.g_varchar2_table(152) := '3B0D0A20202D2D75742D736D6172742D66696C7465722D6D61782D77696474683A20333072656D3B0D0A20202D2D75742D6865726F2D726567696F6E2D7469746C652D746578742D636F6C6F723A20766172282D2D75742D626F64792D7469746C652D74';
wwv_flow_imp.g_varchar2_table(153) := '6578742D636F6C6F72293B0D0A20202D2D75742D726567696F6E2D626F726465722D77696474683A203170783B0D0A20202D2D75742D726567696F6E2D626F782D736861646F773A20766172282D2D75742D736861646F772D736D293B0D0A20202D2D75';
wwv_flow_imp.g_varchar2_table(154) := '742D726567696F6E2D6D617267696E3A203172656D3B0D0A20202D2D75742D726567696F6E2D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D75742D726567696F6E2D6C696E652D6865696768743A20312E323572656D3B0D0A20202D';
wwv_flow_imp.g_varchar2_table(155) := '2D75742D726567696F6E2D6865616465722D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E303735293B0D0A20202D2D75742D726567696F6E2D626F64792D70616464696E672D793A203172656D3B0D0A2020';
wwv_flow_imp.g_varchar2_table(156) := '2D2D75742D726567696F6E2D626F64792D70616464696E672D783A203172656D3B0D0A20202D2D75742D726567696F6E2D627574746F6E732D70616464696E672D793A20302E3572656D3B0D0A20202D2D75742D726567696F6E2D627574746F6E732D70';
wwv_flow_imp.g_varchar2_table(157) := '616464696E672D783A20302E373572656D3B0D0A20202D2D75742D627574746F6E2D726567696F6E2D626F782D736861646F773A20766172282D2D75742D736861646F772D736D293B0D0A20202D2D75742D636865636B626F782D6974656D2D73706163';
wwv_flow_imp.g_varchar2_table(158) := '696E673A203172656D3B0D0A20202D2D75742D78732D6669656C642D696E7075742D666F6E742D73697A653A203172656D3B0D0A20202D2D75742D78732D6669656C642D696E7075742D6C696E652D6865696768743A20312E323572656D3B0D0A20202D';
wwv_flow_imp.g_varchar2_table(159) := '2D75742D6C6F67696E2D706167652D6261636B67726F756E642D636F6C6F723A20233139313931393B0D0A20202D2D75742D6C6F67696E2D726567696F6E2D6261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E363529';
wwv_flow_imp.g_varchar2_table(160) := '3B0D0A20202D2D75742D6C6F67696E2D726567696F6E2D66696C7465723A20626C757228347078293B0D0A20202D2D75742D6C6F67696E2D726567696F6E2D626F782D736861646F773A20766172282D2D75742D736861646F772D6C67293B0D0A20202D';
wwv_flow_imp.g_varchar2_table(161) := '2D612D66732D746F67676C652D626F726465722D636F6C6F723A20766172282D2D612D627574746F6E2D626F726465722D636F6C6F72293B0D0A20202D2D612D66732D746F67676C652D626F726465722D77696474683A20766172282D2D612D62757474';
wwv_flow_imp.g_varchar2_table(162) := '6F6E2D626F726465722D7769647468293B0D0A20202D2D612D66732D746F67676C652D626F726465722D7261646975733A20766172282D2D612D627574746F6E2D626F726465722D726164697573293B0D0A20202D2D612D66732D746F67676C652D7465';
wwv_flow_imp.g_varchar2_table(163) := '78742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D66732D746F67676C652D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D6261636B67726F756E642D63';
wwv_flow_imp.g_varchar2_table(164) := '6F6C6F72293B0D0A20202D2D612D66732D7365617263682D636F6E7461696E65722D626F726465722D77696474683A20766172282D2D612D627574746F6E2D626F726465722D7769647468293B0D0A20202D2D612D66732D7365617263682D636F6E7461';
wwv_flow_imp.g_varchar2_table(165) := '696E65722D626F726465722D636F6C6F723A20766172282D2D612D627574746F6E2D626F726465722D636F6C6F72293B0D0A20202D2D75742D616C6572742D7469746C652D666F6E742D7765696768743A20766172282D2D612D626173652D666F6E742D';
wwv_flow_imp.g_varchar2_table(166) := '7765696768742D73656D69626F6C642C20353030293B0D0A20202D2D75742D616C6572742D626F782D736861646F773A20766172282D2D75742D736861646F772D736D293B0D0A20202D2D6D672D6374726C2D67726F75702D627574746F6E2D74657874';
wwv_flow_imp.g_varchar2_table(167) := '2D636F6C6F723A20233030303B0D0A20202D2D6D672D706F7075702D636F6E74656E742D626F782D736861646F773A20766172282D2D75742D736861646F772D6C67293B0D0A20202D2D612D6D61702D6C6567656E642D7469746C652D746578742D636F';
wwv_flow_imp.g_varchar2_table(168) := '6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D75742D636172646C6973742D626F782D736861646F773A20766172282D2D75742D736861646F772D736D293B0D0A20202D2D7574';
wwv_flow_imp.g_varchar2_table(169) := '2D6C696E6B736C6973742D6172726F772D636F6C6F723A2072676261283235352C203235352C203235352C20302E32293B0D0A20202D2D75742D746162732D6974656D2D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D74';
wwv_flow_imp.g_varchar2_table(170) := '6578742D64656661756C742D636F6C6F72293B0D0A20202D2D75742D746162732D6974656D2D6163746976652D746578742D636F6C6F723A20766172282D2D75742D6C696E6B2D746578742D636F6C6F72293B0D0A20202D2D75742D746162732D697465';
wwv_flow_imp.g_varchar2_table(171) := '6D2D68696E742D686967686C696768742D636F6C6F723A2072676261283235352C203235352C203235352C20302E32293B0D0A20202D2D75742D746162732D6974656D2D6163746976652D666F6E742D7765696768743A20766172282D2D612D62617365';
wwv_flow_imp.g_varchar2_table(172) := '2D666F6E742D7765696768742D626F6C642C20373030293B0D0A20202D2D75742D636F6D6D656E742D636861742D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D75742D7770';
wwv_flow_imp.g_varchar2_table(173) := '2D6D61726B65722D636F6C6F723A20233236323632363B0D0A20202D2D75742D77702D747261636B2D636F6C6F723A20233236323632363B0D0A20202D2D66632D6E65757472616C2D62672D636F6C6F723A2072676261283235352C203235352C203235';
wwv_flow_imp.g_varchar2_table(174) := '352C20302E32293B0D0A20202D2D66632D6E65757472616C2D746578742D636F6C6F723A20236666663B0D0A20202D2D66632D6576656E742D73656C65637465642D6F7665726C61792D636F6C6F723A2072676261283235352C203235352C203235352C';
wwv_flow_imp.g_varchar2_table(175) := '20302E32293B0D0A20202D2D66632D6E6F6E2D627573696E6573732D636F6C6F723A2072676261283235352C203235352C203235352C20302E32293B0D0A20202D2D75742D616C7465726E6174652D68656164696E672D666F6E742D66616D696C793A20';
wwv_flow_imp.g_varchar2_table(176) := '766172282D2D612D626173652D666F6E742D66616D696C792D7365726966293B0D0A20202D2D75742D616C7465726E6174652D68656164696E672D666F6E742D7765696768743A20766172282D2D612D626173652D666F6E742D7765696768742D6E6F72';
wwv_flow_imp.g_varchar2_table(177) := '6D616C293B0D0A20202D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D0A20202D2D75742D636F6D706F6E656E742D626F726465722D77696474683A20317078';
wwv_flow_imp.g_varchar2_table(178) := '3B0D0A20202D2D75742D636F6D706F6E656E742D626F726465722D7261646975733A20302E323572656D3B0D0A20202D2D75742D636F6D706F6E656E742D626F782D736861646F773A20766172282D2D75742D736861646F772D6C67293B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(179) := '75742D636F6D706F6E656E742D686967686C696768742D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D75742D636F6D706F6E656E742D746F6F6C6261722D6261636B67';
wwv_flow_imp.g_varchar2_table(180) := '726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D77696474683A20766172282D2D75742D636F6D706F6E656E742D626F';
wwv_flow_imp.g_varchar2_table(181) := '726465722D7769647468293B0D0A20202D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D75742D636F6D706F6E656E742D746578742D';
wwv_flow_imp.g_varchar2_table(182) := '64656661756C742D636F6C6F723A20236666663B0D0A20202D2D75742D636F6D706F6E656E742D746578742D7469746C652D636F6C6F723A20236666663B0D0A20202D2D75742D636F6D706F6E656E742D746578742D7375627469746C652D636F6C6F72';
wwv_flow_imp.g_varchar2_table(183) := '3A2072676261283235352C203235352C203235352C20302E3835293B0D0A20202D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3635293B0D0A20202D2D75742D';
wwv_flow_imp.g_varchar2_table(184) := '636F6D706F6E656E742D69636F6E2D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D75742D636F6D706F6E656E742D69636F6E2D636F6C6F723A20766172282D2D75742D70';
wwv_flow_imp.g_varchar2_table(185) := '616C657474652D7072696D6172792D636F6E7472617374293B0D0A20202D2D75742D636F6D706F6E656E742D62616467652D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D75';
wwv_flow_imp.g_varchar2_table(186) := '742D636F6D706F6E656E742D62616467652D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A20202D2D75742D636F6D706F6E656E742D62616467652D626F72646572';
wwv_flow_imp.g_varchar2_table(187) := '2D7261646975733A20302E323572656D3B0D0A20202D2D75742D736861646F772D736D3A203020302E31323572656D20302E323572656D202D302E31323572656D207267626128302C20302C20302C20302E31293B0D0A20202D2D75742D736861646F77';
wwv_flow_imp.g_varchar2_table(188) := '2D6D643A203020302E373572656D20312E3572656D202D302E373572656D207267626128302C20302C20302C20302E33293B0D0A20202D2D75742D736861646F772D6C673A203020312E3572656D203372656D202D312E3572656D207267626128302C20';
wwv_flow_imp.g_varchar2_table(189) := '302C20302C20302E33293B0D0A20202D2D75742D626F726465722D7261646975732D736D3A20302E31323572656D3B0D0A20202D2D75742D626F726465722D7261646975732D6D643A20302E323572656D3B0D0A20202D2D75742D626F726465722D7261';
wwv_flow_imp.g_varchar2_table(190) := '646975732D6C673A20302E3572656D3B0D0A20202D2D75742D626F726465722D7261646975733A20766172282D2D75742D626F726465722D7261646975732D6D64293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D70616C657474652D7072696D';
wwv_flow_imp.g_varchar2_table(191) := '6172793A20236337343633343B0D0A20202D2D75742D70616C657474652D7072696D6172792D636F6E74726173743A20236666666666663B0D0A20202D2D75742D70616C657474652D7072696D6172792D73686164653A20233134303730353B0D0A2020';
wwv_flow_imp.g_varchar2_table(192) := '2D2D75742D70616C657474652D7072696D6172792D746578743A20766172282D2D612D70616C657474652D7072696D617279293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D6C696E6B2D746578742D636F6C6F723A20236464386137653B0D0A';
wwv_flow_imp.g_varchar2_table(193) := '7D0D0A3A726F6F74207B0D0A20202D2D75742D666F6375732D6F75746C696E652D636F6C6F723A20236337343633343B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D636F6D706F6E656E742D626F726465722D7261646975733A203270783B0D0A';
wwv_flow_imp.g_varchar2_table(194) := '7D0D0A3A726F6F74207B0D0A20202D2D75742D6865616465722D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D75742D6865616465722D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B';
wwv_flow_imp.g_varchar2_table(195) := '0D0A20202D2D75742D626F64792D6261636B67726F756E642D636F6C6F723A20233331326432613B0D0A20202D2D75742D626F64792D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D';
wwv_flow_imp.g_varchar2_table(196) := '616374696F6E732D6261636B67726F756E642D636F6C6F723A20233335333132653B0D0A20202D2D75742D626F64792D616374696F6E732D746578742D636F6C6F723A20236666666666663B0D0A20202D2D75742D626F64792D616374696F6E73746F67';
wwv_flow_imp.g_varchar2_table(197) := '676C652D6261636B67726F756E642D636F6C6F723A20233335333132653B0D0A20202D2D75742D626F64792D616374696F6E73746F67676C652D686F7665722D6261636B67726F756E642D636F6C6F723A20233531346134353B0D0A7D0D0A3A726F6F74';
wwv_flow_imp.g_varchar2_table(198) := '207B0D0A20202D2D75742D626F64792D7469746C652D6261636B67726F756E642D636F6C6F723A20233339333533313B0D0A20202D2D75742D626F64792D7469746C652D746578742D636F6C6F723A20236666666666663B0D0A20202D2D75742D627265';
wwv_flow_imp.g_varchar2_table(199) := '61646372756D622D6974656D2D746578742D636F6C6F723A2072676261283235352C203235352C203235352C20302E3635293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D736964656261722D6261636B67726F756E642D636F6C6F';
wwv_flow_imp.g_varchar2_table(200) := '723A20233366336133363B0D0A20202D2D75742D626F64792D736964656261722D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D6E61762D6261636B67726F756E642D636F6C6F723A';
wwv_flow_imp.g_varchar2_table(201) := '20233461346134613B0D0A20202D2D75742D626F64792D6E61762D746578742D636F6C6F723A20236666666666663B0D0A20202D2D75742D626F64792D6E61762D7363726F6C6C6261722D7468756D622D6261636B67726F756E642D636F6C6F723A2072';
wwv_flow_imp.g_varchar2_table(202) := '676261283235352C203235352C203235352C20302E32293B0D0A20202D2D75742D626F64792D6E61762D7363726F6C6C6261722D747261636B2D6261636B67726F756E642D636F6C6F723A20233461346134613B0D0A20202D2D75742D6E617674616273';
wwv_flow_imp.g_varchar2_table(203) := '2D6261636B67726F756E642D636F6C6F723A20233461346134613B0D0A20202D2D75742D6E6176746162732D746578742D636F6C6F723A20236666666666663B0D0A20202D2D75742D6E6176746162732D6974656D2D626F726465722D636F6C6F723A20';
wwv_flow_imp.g_varchar2_table(204) := '7267626128302C20302C20302C20302E31293B0D0A20202D2D75742D6E6176746162732D6974656D2D6163746976652D6261636B67726F756E642D636F6C6F723A20233331333133313B0D0A20202D2D75742D6E6176746162732D6974656D2D686F7665';
wwv_flow_imp.g_varchar2_table(205) := '722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D6E6176746162732D6974656D2D6163746976652D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D75742D6865616465722D6D656E756261722D6261636B67726F756E';
wwv_flow_imp.g_varchar2_table(206) := '642D636F6C6F723A20233461346134613B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D746578742D636F6C6F723A20236666666666663B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D6375727265';
wwv_flow_imp.g_varchar2_table(207) := '6E742D6261636B67726F756E642D636F6C6F723A20233331333133313B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D63757272656E742D746578742D636F6C6F723A20236666666666663B0D0A20202D2D75742D6865616465';
wwv_flow_imp.g_varchar2_table(208) := '722D6D656E756261722D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D6865616465722D6D656E756261722D6974656D2D63757272656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(209) := '75742D6865616465722D6D656E756261722D6974656D2D686F7665722D746578742D636F6C6F723A20766172282D2D75742D6865616465722D6D656E756261722D6974656D2D63757272656E742D746578742D636F6C6F72293B0D0A20202D2D75742D68';
wwv_flow_imp.g_varchar2_table(210) := '65616465722D6D656E756261722D6974656D2D626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D73706C69742D69636F6E2D636F6C6F723A2023';
wwv_flow_imp.g_varchar2_table(211) := '6666666666663B0D0A20202D2D75742D6865616465722D6D656E756261722D6974656D2D73706C69742D626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D7472656576';
wwv_flow_imp.g_varchar2_table(212) := '6965772D6E6F64652D73656C65637465642D6261636B67726F756E642D636F6C6F723A20233331333133313B0D0A20202D2D612D74726565766965772D6E6F64652D73656C65637465642D746578742D636F6C6F723A20236666666666663B0D0A20202D';
wwv_flow_imp.g_varchar2_table(213) := '2D612D74726565766965772D6E6F64652D666F63757365642D6261636B67726F756E642D636F6C6F723A20233331333133313B0D0A20202D2D612D74726565766965772D6E6F64652D666F63757365642D746578742D636F6C6F723A2023666666666666';
wwv_flow_imp.g_varchar2_table(214) := '3B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D74726565766965772D6E6F64652D73656C65637465642D69636F6E2D636F6C6F723A20236666666666663B0D0A20202D2D612D74726565766965772D6E6F64652D69636F6E2D636F6C6F723A20696E';
wwv_flow_imp.g_varchar2_table(215) := '68657269743B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D74726565766965772D62616467652D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D75742D74726565766965772D62616467652D746578742D636F6C';
wwv_flow_imp.g_varchar2_table(216) := '6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D6D656E752D6261636B67726F756E642D636F6C6F723A20233236323332313B0D0A20202D2D612D6D656E752D746578742D636F6C6F723A20236663666366633B0D0A2020';
wwv_flow_imp.g_varchar2_table(217) := '2D2D612D6D656E752D64656661756C742D746578742D636F6C6F723A20766172282D2D612D6D656E752D746578742D636F6C6F72293B0D0A20202D2D612D6D656E752D616363656C2D746578742D636F6C6F723A20766172282D2D612D6D656E752D7465';
wwv_flow_imp.g_varchar2_table(218) := '78742D636F6C6F72293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D6D656E752D666F63757365642D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D612D6D656E752D666F63757365642D746578742D636F6C6F72';
wwv_flow_imp.g_varchar2_table(219) := '3A20236666666666663B0D0A20202D2D612D6D656E752D666F63757365642D616363656C2D746578742D636F6C6F723A20766172282D2D612D6D656E752D666F63757365642D746578742D636F6C6F72293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(220) := '75742D726567696F6E2D6865616465722D6261636B67726F756E642D636F6C6F723A20233162313931373B0D0A20202D2D75742D726567696F6E2D6865616465722D746578742D636F6C6F723A20236632663266323B0D0A7D0D0A3A726F6F74207B0D0A';
wwv_flow_imp.g_varchar2_table(221) := '20202D2D75742D726567696F6E2D6261636B67726F756E642D636F6C6F723A20233236323332313B0D0A20202D2D75742D726567696F6E2D746578742D636F6C6F723A20236663666366633B0D0A20202D2D75742D636F6D706F6E656E742D6261636B67';
wwv_flow_imp.g_varchar2_table(222) := '726F756E642D636F6C6F723A20233236323332313B0D0A20202D2D75742D77697A6172642D6865616465722D6261636B67726F756E642D636F6C6F723A20233263323832353B0D0A20202D2D75742D7265706F72742D63656C6C2D626F726465722D636F';
wwv_flow_imp.g_varchar2_table(223) := '6C6F723A20233431336333383B0D0A20202D2D75742D7265706F72742D63656C6C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233263323832353B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D70616C657474652D7072696D61';
wwv_flow_imp.g_varchar2_table(224) := '72792D616C743A20236634643764333B0D0A20202D2D75742D70616C657474652D7072696D6172792D616C742D636F6E74726173743A20233339313430663B0D0A20202D2D75742D70616C657474652D7072696D6172792D616C742D73686164653A2023';
wwv_flow_imp.g_varchar2_table(225) := '3063306230623B0D0A20202D2D75742D70616C657474652D7072696D6172792D616C742D746578743A20236131373937343B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D70616C657474652D737563636573733A20233338383732393B0D0A2020';
wwv_flow_imp.g_varchar2_table(226) := '2D2D75742D70616C657474652D737563636573732D636F6E74726173743A20234646463B0D0A20202D2D75742D70616C657474652D737563636573732D73686164653A20233063316530393B0D0A20202D2D75742D70616C657474652D73756363657373';
wwv_flow_imp.g_varchar2_table(227) := '2D746578743A20233535376434653B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D70616C657474652D696E666F3A20233030364244383B0D0A20202D2D75742D70616C657474652D696E666F2D636F6E74726173743A20234646463B0D0A20202D';
wwv_flow_imp.g_varchar2_table(228) := '2D75742D70616C657474652D696E666F2D73686164653A20233030313833303B0D0A20202D2D75742D70616C657474652D696E666F2D746578743A20233430373561633B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D70616C657474652D776172';
wwv_flow_imp.g_varchar2_table(229) := '6E696E673A20234642434534413B0D0A20202D2D75742D70616C657474652D7761726E696E672D636F6E74726173743A20233030303B0D0A20202D2D75742D70616C657474652D7761726E696E672D73686164653A20233337326431303B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(230) := '75742D70616C657474652D7761726E696E672D746578743A20233861373433323B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D70616C657474652D64616E6765723A20234545303730313B0D0A20202D2D75742D70616C657474652D64616E6765';
wwv_flow_imp.g_varchar2_table(231) := '722D636F6E74726173743A20234646463B0D0A20202D2D75742D70616C657474652D64616E6765722D73686164653A20233334303230303B0D0A20202D2D75742D70616C657474652D64616E6765722D746578743A20236237343334303B0D0A7D0D0A3A';
wwv_flow_imp.g_varchar2_table(232) := '726F6F74207B0D0A20202D2D752D636F6C6F722D313A20233330394644423B0D0A20202D2D752D636F6C6F722D312D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D323A20233133423643463B0D0A20202D2D752D636F';
wwv_flow_imp.g_varchar2_table(233) := '6C6F722D322D636F6E74726173743A20236534663966643B0D0A20202D2D752D636F6C6F722D333A20233245424642433B0D0A20202D2D752D636F6C6F722D332D636F6E74726173743A20236630666366623B0D0A20202D2D752D636F6C6F722D343A20';
wwv_flow_imp.g_varchar2_table(234) := '233343414638353B0D0A20202D2D752D636F6C6F722D342D636F6E74726173743A20236630666166363B0D0A20202D2D752D636F6C6F722D353A20233831424235463B0D0A20202D2D752D636F6C6F722D352D636F6E74726173743A2023666666666666';
wwv_flow_imp.g_varchar2_table(235) := '3B0D0A20202D2D752D636F6C6F722D363A20234444444535333B0D0A20202D2D752D636F6C6F722D362D636F6E74726173743A20233261326130383B0D0A20202D2D752D636F6C6F722D373A20234642434534413B0D0A20202D2D752D636F6C6F722D37';
wwv_flow_imp.g_varchar2_table(236) := '2D636F6E74726173743A20233434333330323B0D0A20202D2D752D636F6C6F722D383A20234544383133453B0D0A20202D2D752D636F6C6F722D382D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D393A202345393542';
wwv_flow_imp.g_varchar2_table(237) := '35343B0D0A20202D2D752D636F6C6F722D392D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D31303A20234538354438383B0D0A20202D2D752D636F6C6F722D31302D636F6E74726173743A20236666666666663B0D0A';
wwv_flow_imp.g_varchar2_table(238) := '20202D2D752D636F6C6F722D31313A20234341353839443B0D0A20202D2D752D636F6C6F722D31312D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D31323A20233835344539423B0D0A20202D2D752D636F6C6F722D31';
wwv_flow_imp.g_varchar2_table(239) := '322D636F6E74726173743A20236636663066383B0D0A20202D2D752D636F6C6F722D31333A20233541363841443B0D0A20202D2D752D636F6C6F722D31332D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D31343A2023';
wwv_flow_imp.g_varchar2_table(240) := '4146424143353B0D0A20202D2D752D636F6C6F722D31342D636F6E74726173743A20233331336134343B0D0A20202D2D752D636F6C6F722D31353A20233645383539383B0D0A20202D2D752D636F6C6F722D31352D636F6E74726173743A202366666666';
wwv_flow_imp.g_varchar2_table(241) := '66663B0D0A20202D2D752D636F6C6F722D31363A20233539623265323B0D0A20202D2D752D636F6C6F722D31362D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D31373A20233432633564393B0D0A20202D2D752D636F';
wwv_flow_imp.g_varchar2_table(242) := '6C6F722D31372D636F6E74726173743A20233035313531373B0D0A20202D2D752D636F6C6F722D31383A20233538636363393B0D0A20202D2D752D636F6C6F722D31382D636F6E74726173743A20233039316331633B0D0A20202D2D752D636F6C6F722D';
wwv_flow_imp.g_varchar2_table(243) := '31393A20233633626639643B0D0A20202D2D752D636F6C6F722D31392D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32303A20233961633937663B0D0A20202D2D752D636F6C6F722D32302D636F6E74726173743A20';
wwv_flow_imp.g_varchar2_table(244) := '233230333331363B0D0A20202D2D752D636F6C6F722D32313A20236534653537353B0D0A20202D2D752D636F6C6F722D32312D636F6E74726173743A20233463346330663B0D0A20202D2D752D636F6C6F722D32323A20236663643836653B0D0A20202D';
wwv_flow_imp.g_varchar2_table(245) := '2D752D636F6C6F722D32322D636F6E74726173743A20233639346630323B0D0A20202D2D752D636F6C6F722D32333A20236631396136353B0D0A20202D2D752D636F6C6F722D32332D636F6E74726173743A20236666666666663B0D0A20202D2D752D63';
wwv_flow_imp.g_varchar2_table(246) := '6F6C6F722D32343A20236564376337363B0D0A20202D2D752D636F6C6F722D32342D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32353A20236564376461303B0D0A20202D2D752D636F6C6F722D32352D636F6E7472';
wwv_flow_imp.g_varchar2_table(247) := '6173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32363A20236435373962313B0D0A20202D2D752D636F6C6F722D32362D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32373A20233964373161663B';
wwv_flow_imp.g_varchar2_table(248) := '0D0A20202D2D752D636F6C6F722D32372D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D32383A20233762383662643B0D0A20202D2D752D636F6C6F722D32382D636F6E74726173743A20236666666666663B0D0A2020';
wwv_flow_imp.g_varchar2_table(249) := '2D2D752D636F6C6F722D32393A20236266633864313B0D0A20202D2D752D636F6C6F722D32392D636F6E74726173743A20233364343835343B0D0A20202D2D752D636F6C6F722D33303A20233862396461643B0D0A20202D2D752D636F6C6F722D33302D';
wwv_flow_imp.g_varchar2_table(250) := '636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D33313A20233139386363613B0D0A20202D2D752D636F6C6F722D33312D636F6E74726173743A20236536663466633B0D0A20202D2D752D636F6C6F722D33323A20233032';
wwv_flow_imp.g_varchar2_table(251) := '613562653B0D0A20202D2D752D636F6C6F722D33322D636F6E74726173743A20236331663666653B0D0A20202D2D752D636F6C6F722D33333A20233138623161653B0D0A20202D2D752D636F6C6F722D33332D636F6E74726173743A2023643066396638';
wwv_flow_imp.g_varchar2_table(252) := '3B0D0A20202D2D752D636F6C6F722D33343A20233234613437353B0D0A20202D2D752D636F6C6F722D33342D636F6E74726173743A20236432663565383B0D0A20202D2D752D636F6C6F722D33353A20233661616434323B0D0A20202D2D752D636F6C6F';
wwv_flow_imp.g_varchar2_table(253) := '722D33352D636F6E74726173743A20236636666266343B0D0A20202D2D752D636F6C6F722D33363A20236339636133393B0D0A20202D2D752D636F6C6F722D33362D636F6E74726173743A20233033303330313B0D0A20202D2D752D636F6C6F722D3337';
wwv_flow_imp.g_varchar2_table(254) := '3A20236439623133623B0D0A20202D2D752D636F6C6F722D33372D636F6E74726173743A20233132306530333B0D0A20202D2D752D636F6C6F722D33383A20236437366132373B0D0A20202D2D752D636F6C6F722D33382D636F6E74726173743A202366';
wwv_flow_imp.g_varchar2_table(255) := '66666666653B0D0A20202D2D752D636F6C6F722D33393A20236432343233623B0D0A20202D2D752D636F6C6F722D33392D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D34303A20236431343336663B0D0A20202D2D75';
wwv_flow_imp.g_varchar2_table(256) := '2D636F6C6F722D34302D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D34313A20236261336438383B0D0A20202D2D752D636F6C6F722D34312D636F6E74726173743A20236664663966623B0D0A20202D2D752D636F6C';
wwv_flow_imp.g_varchar2_table(257) := '6F722D34323A20233737333339333B0D0A20202D2D752D636F6C6F722D34322D636F6E74726173743A20236538643566303B0D0A20202D2D752D636F6C6F722D34333A20233364346561333B0D0A20202D2D752D636F6C6F722D34332D636F6E74726173';
wwv_flow_imp.g_varchar2_table(258) := '743A20236538656266363B0D0A20202D2D752D636F6C6F722D34343A20233863396562303B0D0A20202D2D752D636F6C6F722D34342D636F6E74726173743A20236666666666663B0D0A20202D2D752D636F6C6F722D34353A20233465373339313B0D0A';
wwv_flow_imp.g_varchar2_table(259) := '20202D2D752D636F6C6F722D34352D636F6E74726173743A20236561656666343B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D627574746F6E2D626F726465722D7261646975733A20302E31323572656D3B0D0A7D0D0A3A726F6F74207B0D0A2020';
wwv_flow_imp.g_varchar2_table(260) := '2D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20233466346434633B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D6669656C642D6C';
wwv_flow_imp.g_varchar2_table(261) := '6162656C2D746578742D636F6C6F723A20236663666366633B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D6669656C642D696E7075742D626F726465722D7261646975733A203270783B0D0A20202D2D612D66696C6564726F702D626F726465722D';
wwv_flow_imp.g_varchar2_table(262) := '7261646975733A203270783B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D6669656C642D696E7075742D6261636B67726F756E642D636F6C6F723A20233264323932363B0D0A20202D2D612D6669656C642D696E7075742D746578742D636F6C6F72';
wwv_flow_imp.g_varchar2_table(263) := '3A20236666666666663B0D0A20202D2D612D6669656C642D696E7075742D626F726465722D636F6C6F723A20233438343233653B0D0A20202D2D612D6669656C642D696E7075742D686F7665722D6261636B67726F756E642D636F6C6F723A2023316631';
wwv_flow_imp.g_varchar2_table(264) := '6431623B0D0A20202D2D612D6669656C642D696E7075742D666F6375732D6261636B67726F756E642D636F6C6F723A20233131313030663B0D0A20202D2D612D6669656C642D696E7075742D666F6375732D626F726465722D636F6C6F723A2023633734';
wwv_flow_imp.g_varchar2_table(265) := '3633343B0D0A20202D2D75742D6669656C642D696E7075742D666F6375732D69636F6E2D636F6C6F723A20236337343633343B0D0A20202D2D75742D6669656C642D666C2D696E7075742D666F6375732D69636F6E2D6261636B67726F756E642D636F6C';
wwv_flow_imp.g_varchar2_table(266) := '6F723A20236337343633343B0D0A20202D2D75742D6669656C642D666C2D696E7075742D666F6375732D69636F6E2D636F6C6F723A20236666666666663B0D0A20202D2D612D636865636B626F782D6261636B67726F756E642D636F6C6F723A20233264';
wwv_flow_imp.g_varchar2_table(267) := '323932363B0D0A20202D2D612D636865636B626F782D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D0A20202D2D612D636865636B626F782D746578742D636F6C6F723A20236666666666663B0D';
wwv_flow_imp.g_varchar2_table(268) := '0A20202D2D612D636865636B626F782D636865636B65642D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D612D636865636B626F782D636865636B65642D746578742D636F6C6F723A20236666666666663B0D0A20202D';
wwv_flow_imp.g_varchar2_table(269) := '2D612D636865636B626F782D686F7665722D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D67762D6261636B67726F756E642D636F6C6F72';
wwv_flow_imp.g_varchar2_table(270) := '3A20233236323332313B0D0A20202D2D612D67762D63656C6C2D626F726465722D636F6C6F723A20233363333933373B0D0A20202D2D612D67762D6865616465722D63656C6C2D626F726465722D636F6C6F723A20233431336333383B0D0A20202D2D61';
wwv_flow_imp.g_varchar2_table(271) := '2D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D746578742D636F6C6F723A20236663666366633B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D6261636B67726F756E642D636F6C6F723A';
wwv_flow_imp.g_varchar2_table(272) := '20233236323332313B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D6865616465722D6865696768743A203372656D3B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D6E61762D77696474683A20313572656D3B0D0A7D0D0A3A726F6F74207B';
wwv_flow_imp.g_varchar2_table(273) := '0D0A20202D2D75742D626F64792D616374696F6E732D77696474683A2031322E3572656D3B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626F64792D736964656261722D77696474683A20313572656D3B0D0A7D0D0A3A726F6F74207B0D0A2020';
wwv_flow_imp.g_varchar2_table(274) := '2D2D75742D626F64792D636F6E74656E742D6D61782D77696474683A20313030253B0D0A7D0D0A2E742D427574746F6E2D2D686561646572207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E7370617265';
wwv_flow_imp.g_varchar2_table(275) := '6E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20696E697469616C3B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D736861646F77';
wwv_flow_imp.g_varchar2_table(276) := '3A206E6F6E653B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A20202D2D612D627574746F6E2D686F7665722D626F726465722D636F6C6F723A20';
wwv_flow_imp.g_varchar2_table(277) := '7472616E73706172656E743B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3135293B0D0A20202D2D612D627574746F6E2D6163746976652D626F72646572';
wwv_flow_imp.g_varchar2_table(278) := '2D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D6163746976652D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D';
wwv_flow_imp.g_varchar2_table(279) := '612D627574746F6E2D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2D2D6865616465722E69732D616374697665207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20726762612830';
wwv_flow_imp.g_varchar2_table(280) := '2C20302C20302C20302E3235293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E303735293B0D0A20202D2D612D627574746F6E2D736861';
wwv_flow_imp.g_varchar2_table(281) := '646F773A20302032707820347078202D337078207267626128302C20302C20302C20302E31293B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20233638363636353B0D0A20202D2D612D627574746F6E';
wwv_flow_imp.g_varchar2_table(282) := '2D686F7665722D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E303735293B0D0A20202D2D612D627574746F6E2D686F7665722D736861646F773A20302032707820347078202D327078207267626128302C20';
wwv_flow_imp.g_varchar2_table(283) := '302C20302C20302E31293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A20233139313931393B0D0A20202D2D612D627574746F6E2D6163746976652D736861646F773A20302032707820327078202D';
wwv_flow_imp.g_varchar2_table(284) := '317078207267626128302C20302C20302C20302E31352920696E7365743B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F756E64';
wwv_flow_imp.g_varchar2_table(285) := '2D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D626F726465722D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D61';
wwv_flow_imp.g_varchar2_table(286) := '2D627574746F6E2D747970652D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D747970652D626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E742D427574746F6E2D2D6C696E6B';
wwv_flow_imp.g_varchar2_table(287) := '207B0D0A2020626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E742D427574746F';
wwv_flow_imp.g_varchar2_table(288) := '6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D6E6F55493A686F7665722C0D0A2E742D427574746F6E2D2D6E6F55493A6163746976652C0D0A2E612D427574746F6E2D2D6E6F55492C0D0A2E612D427574746F6E2D2D6E6F55493A686F7665722C0D';
wwv_flow_imp.g_varchar2_table(289) := '0A2E612D427574746F6E2D2D6E6F55493A616374697665207B0D0A20202D2D612D627574746F6E2D747970652D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D747970652D6261636B67726F756E642D636F6C6F723A207472616E';
wwv_flow_imp.g_varchar2_table(290) := '73706172656E743B0D0A20202D2D612D627574746F6E2D747970652D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D747970652D746578742D636F6C6F723A20696E68657269743B0D0A2020636F';
wwv_flow_imp.g_varchar2_table(291) := '6C6F723A20696E68657269743B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020746578742D736861646F773A206E6F6E653B0D0A7D0D0A2E742D427574746F6E2D2D686F742C0D0A2E612D427574746F6E';
wwv_flow_imp.g_varchar2_table(292) := '2D2D686F742C0D0A2E75692D627574746F6E2D2D686F742C0D0A2E612D43617264566965772D627574746F6E2D2D686F742C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A636865636B6564202B206C6162656C2C0D0A2E742D466F';
wwv_flow_imp.g_varchar2_table(293) := '726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A636865636B6564202B206C6162656C207B0D0A20202D2D612D627574746F6E2D6261636B67';
wwv_flow_imp.g_varchar2_table(294) := '726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A202364343639';
wwv_flow_imp.g_varchar2_table(295) := '35613B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F';
wwv_flow_imp.g_varchar2_table(296) := '723A20236233336632663B0D0A20202D2D612D627574746F6E2D6163746976652D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D62';
wwv_flow_imp.g_varchar2_table(297) := '61636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D746578742D636F6C6F723A20766172282D2D612D627574';
wwv_flow_imp.g_varchar2_table(298) := '746F6E2D686F7665722D746578742D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0D0A2E612D427574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0D0A2E75692D62';
wwv_flow_imp.g_varchar2_table(299) := '7574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0D0A2E612D43617264566965772D627574746F6E2D2D686F742E742D427574746F6E2D2D73696D706C652C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A6368';
wwv_flow_imp.g_varchar2_table(300) := '65636B6564202B206C6162656C2E742D427574746F6E2D2D73696D706C652C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E707574';
wwv_flow_imp.g_varchar2_table(301) := '3A636865636B6564202B206C6162656C2E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A20236337343633343B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F';
wwv_flow_imp.g_varchar2_table(302) := '6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236133363335613B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20236666666666663B0D0A7D0D0A2E74';
wwv_flow_imp.g_varchar2_table(303) := '2D427574746F6E2D2D686F742E742D427574746F6E2D2D6C696E6B2C0D0A2E612D427574746F6E2D2D686F742E742D427574746F6E2D2D6C696E6B2C0D0A2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D6C696E6B2C0D0A2E612D4361';
wwv_flow_imp.g_varchar2_table(304) := '7264566965772D627574746F6E2D2D686F742E742D427574746F6E2D2D6C696E6B2C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A636865636B6564202B206C6162656C2E742D427574746F6E2D2D6C696E6B2C0D0A2E742D466F72';
wwv_flow_imp.g_varchar2_table(305) := '6D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A636865636B6564202B206C6162656C2E742D427574746F6E2D2D6C696E6B207B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(306) := '612D627574746F6E2D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D626F782D73';
wwv_flow_imp.g_varchar2_table(307) := '6861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236133363335613B0D0A7D0D0A2E742D427574746F6E2D2D686F742E742D427574746F6E2D2D6E6F55492C0D0A2E612D427574746F6E2D2D686F742E74';
wwv_flow_imp.g_varchar2_table(308) := '2D427574746F6E2D2D6E6F55492C0D0A2E75692D627574746F6E2D2D686F742E742D427574746F6E2D2D6E6F55492C0D0A2E612D43617264566965772D627574746F6E2D2D686F742E742D427574746F6E2D2D6E6F55492C0D0A2E617065782D62757474';
wwv_flow_imp.g_varchar2_table(309) := '6F6E2D67726F757020696E7075743A636865636B6564202B206C6162656C2E742D427574746F6E2D2D6E6F55492C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D';
wwv_flow_imp.g_varchar2_table(310) := '67726F75702D2D726320696E7075743A636865636B6564202B206C6162656C2E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D686F742E612D427574746F6E2D2D6E6F55492C0D0A2E612D427574746F6E2D2D686F742E612D4275';
wwv_flow_imp.g_varchar2_table(311) := '74746F6E2D2D6E6F55492C0D0A2E75692D627574746F6E2D2D686F742E612D427574746F6E2D2D6E6F55492C0D0A2E612D43617264566965772D627574746F6E2D2D686F742E612D427574746F6E2D2D6E6F55492C0D0A2E617065782D627574746F6E2D';
wwv_flow_imp.g_varchar2_table(312) := '67726F757020696E7075743A636865636B6564202B206C6162656C2E612D427574746F6E2D2D6E6F55492C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F';
wwv_flow_imp.g_varchar2_table(313) := '75702D2D726320696E7075743A636865636B6564202B206C6162656C2E612D427574746F6E2D2D6E6F5549207B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236133363335613B0D0A2020636F6C6F723A20236133363335613B0D';
wwv_flow_imp.g_varchar2_table(314) := '0A7D0D0A2E742D427574746F6E2D2D7761726E696E67207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20234642434534413B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233030303B0D0A20';
wwv_flow_imp.g_varchar2_table(315) := '202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20236663646337633B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C';
wwv_flow_imp.g_varchar2_table(316) := '6F72293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A20236661633733313B0D0A20202D2D612D627574746F6E2D6163746976652D746578742D636F6C6F723A20766172282D2D612D627574746F6E';
wwv_flow_imp.g_varchar2_table(317) := '2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20';
wwv_flow_imp.g_varchar2_table(318) := '202D2D612D627574746F6E2D666F6375732D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D73696D';
wwv_flow_imp.g_varchar2_table(319) := '706C65207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A20234642434534413B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F';
wwv_flow_imp.g_varchar2_table(320) := '6E2D746578742D636F6C6F723A20233861373433323B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20233030303B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D6C696E6B207B';
wwv_flow_imp.g_varchar2_table(321) := '0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E';
wwv_flow_imp.g_varchar2_table(322) := '2D626F782D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233861373433323B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E672E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574';
wwv_flow_imp.g_varchar2_table(323) := '746F6E2D2D7761726E696E672E612D427574746F6E2D2D6E6F5549207B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233861373433323B0D0A2020636F6C6F723A20233861373433323B0D0A7D0D0A2E742D427574746F6E2D2D73';
wwv_flow_imp.g_varchar2_table(324) := '756363657373207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20233338383732393B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20234646463B0D0A20202D2D612D627574746F6E2D686F7665';
wwv_flow_imp.g_varchar2_table(325) := '722D6261636B67726F756E642D636F6C6F723A20233438616533353B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D62757474';
wwv_flow_imp.g_varchar2_table(326) := '6F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A20233330373332333B0D0A20202D2D612D627574746F6E2D6163746976652D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F';
wwv_flow_imp.g_varchar2_table(327) := '72293B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375';
wwv_flow_imp.g_varchar2_table(328) := '732D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574';
wwv_flow_imp.g_varchar2_table(329) := '746F6E2D626F726465722D636F6C6F723A20233338383732393B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A202335';
wwv_flow_imp.g_varchar2_table(330) := '35376434653B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20234646463B0D0A7D0D0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D6C696E6B207B0D0A20202D2D612D627574746F6E2D62';
wwv_flow_imp.g_varchar2_table(331) := '6F726465722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D626F782D736861646F773A206E6F6E';
wwv_flow_imp.g_varchar2_table(332) := '653B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233535376434653B0D0A7D0D0A2E742D427574746F6E2D2D737563636573732E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D737563636573732E612D42';
wwv_flow_imp.g_varchar2_table(333) := '7574746F6E2D2D6E6F5549207B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20233535376434653B0D0A2020636F6C6F723A20233535376434653B0D0A7D0D0A2E75692D627574746F6E2D2D64616E6765722C0D0A2E742D42757474';
wwv_flow_imp.g_varchar2_table(334) := '6F6E2D2D64616E676572207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20234545303730313B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20234646463B0D0A20202D2D612D627574746F6E2D';
wwv_flow_imp.g_varchar2_table(335) := '686F7665722D6261636B67726F756E642D636F6C6F723A20236665323932343B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D';
wwv_flow_imp.g_varchar2_table(336) := '627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A20236435303630313B0D0A20202D2D612D627574746F6E2D6163746976652D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D';
wwv_flow_imp.g_varchar2_table(337) := '636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D';
wwv_flow_imp.g_varchar2_table(338) := '666F6375732D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A7D0D0A2E75692D627574746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C652C0D0A2E742D427574';
wwv_flow_imp.g_varchar2_table(339) := '746F6E2D2D64616E6765722E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A20234545303730313B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20';
wwv_flow_imp.g_varchar2_table(340) := '7472616E73706172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236237343334303B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20234646463B0D0A7D0D0A2E75692D627574746F6E';
wwv_flow_imp.g_varchar2_table(341) := '2D2D64616E6765722E742D427574746F6E2D2D6C696E6B2C0D0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D6C696E6B207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A207472616E73706172656E74';
wwv_flow_imp.g_varchar2_table(342) := '3B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D626F782D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D746578742D636F';
wwv_flow_imp.g_varchar2_table(343) := '6C6F723A20236237343334303B0D0A7D0D0A2E75692D627574746F6E2D2D64616E6765722E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D64616E6765722E742D427574746F6E2D2D6E6F55492C0D0A2E75692D627574746F6E2D';
wwv_flow_imp.g_varchar2_table(344) := '2D64616E6765722E612D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D2D64616E6765722E612D427574746F6E2D2D6E6F5549207B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20236237343334303B0D0A2020636F';
wwv_flow_imp.g_varchar2_table(345) := '6C6F723A20236237343334303B0D0A7D0D0A2E742D427574746F6E2D2D7072696D617279207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20236634643764333B0D0A20202D2D612D627574746F6E2D746578742D63';
wwv_flow_imp.g_varchar2_table(346) := '6F6C6F723A20233339313430663B0D0A20202D2D612D627574746F6E2D686F7665722D6261636B67726F756E642D636F6C6F723A20236639656165383B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D';
wwv_flow_imp.g_varchar2_table(347) := '612D627574746F6E2D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D6163746976652D6261636B67726F756E642D636F6C6F723A20236565633562663B0D0A20202D2D612D627574746F6E2D6163746976652D746578742D636F6C6F';
wwv_flow_imp.g_varchar2_table(348) := '723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D6261636B67726F756E642D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D6261636B';
wwv_flow_imp.g_varchar2_table(349) := '67726F756E642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D666F6375732D746578742D636F6C6F723A20766172282D2D612D627574746F6E2D686F7665722D746578742D636F6C6F72293B0D0A7D0D0A2E742D427574746F6E2D2D7072696D';
wwv_flow_imp.g_varchar2_table(350) := '6172792E742D427574746F6E2D2D73696D706C65207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D616C74293B0D0A20202D2D612D627574746F6E2D6261636B';
wwv_flow_imp.g_varchar2_table(351) := '67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D616C742D74657874293B0D0A20202D2D612D62757474';
wwv_flow_imp.g_varchar2_table(352) := '6F6E2D686F7665722D746578742D636F6C6F723A20233339313430663B0D0A7D0D0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D6C696E6B207B0D0A20202D2D612D627574746F6E2D626F726465722D636F6C6F723A207472';
wwv_flow_imp.g_varchar2_table(353) := '616E73706172656E743B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D626F782D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F';
wwv_flow_imp.g_varchar2_table(354) := '6E2D746578742D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D616C742D74657874293B0D0A7D0D0A2E742D427574746F6E2D2D7072696D6172792E742D427574746F6E2D2D6E6F55492C0D0A2E742D427574746F6E2D';
wwv_flow_imp.g_varchar2_table(355) := '2D7072696D6172792E612D427574746F6E2D2D6E6F5549207B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D616C742D74657874293B0D0A2020636F6C6F723A207661';
wwv_flow_imp.g_varchar2_table(356) := '72282D2D75742D70616C657474652D7072696D6172792D616C742D74657874293B0D0A7D0D0A2E742D466F726D2D68656C70427574746F6E207B0D0A20202D2D612D627574746F6E2D70616464696E672D793A20302E323572656D3B0D0A20202D2D612D';
wwv_flow_imp.g_varchar2_table(357) := '627574746F6E2D70616464696E672D783A20302E323572656D3B0D0A20202D2D612D627574746F6E2D747970652D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D747970652D626F7264';
wwv_flow_imp.g_varchar2_table(358) := '65722D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D627574746F6E2D747970652D626F782D736861646F773A206E6F6E653B0D0A20202D2D612D627574746F6E2D746578742D636F6C6F723A20766172282D2D75742D636F6D706F';
wwv_flow_imp.g_varchar2_table(359) := '6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D612D627574746F6E2D686F7665722D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A7D0D0A';
wwv_flow_imp.g_varchar2_table(360) := '2E742D427574746F6E2E742D427574746F6E2D2D6E6F5549202E66613A61667465722C0D0A2E742D427574746F6E2E742D427574746F6E2D2D6C696E6B202E66613A61667465722C0D0A2E742D427574746F6E2E742D427574746F6E2D2D73696D706C65';
wwv_flow_imp.g_varchar2_table(361) := '202E66613A61667465722C0D0A2E612D427574746F6E2E612D427574746F6E2D2D6E6F5549202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D64616E6765';
wwv_flow_imp.g_varchar2_table(362) := '72202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20234545303730313B0D0A7D0D';
wwv_flow_imp.g_varchar2_table(363) := '0A2E742D427574746F6E2D2D73756363657373202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D';
wwv_flow_imp.g_varchar2_table(364) := '636F6C6F723A20233338383732393B0D0A7D0D0A2E742D427574746F6E2D2D7072696D617279202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A686F766572202E66613A616674';
wwv_flow_imp.g_varchar2_table(365) := '6572207B0D0A20206261636B67726F756E642D636F6C6F723A20236634643764333B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E67202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761';
wwv_flow_imp.g_varchar2_table(366) := '726E696E673A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20234642434534413B0D0A7D0D0A2E742D427574746F6E2D2D686F74202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D70';
wwv_flow_imp.g_varchar2_table(367) := '6C652E742D427574746F6E2D2D686F743A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20236337343633343B0D0A7D0D0A3A726F6F74207B0D0A20202D2D612D63762D6974656D2D77696474683A2031';
wwv_flow_imp.g_varchar2_table(368) := '3972656D3B0D0A20202D2D612D63762D666F6375732D6F75746C696E653A206E6F6E653B0D0A20202D2D612D63762D626F726465722D77696474683A203170783B0D0A20202D2D612D63762D626F726465722D636F6C6F723A2072676261283235352C20';
wwv_flow_imp.g_varchar2_table(369) := '3235352C203235352C20302E3135293B0D0A20202D2D612D63762D626F726465722D7261646975733A20302E3138373572656D3B0D0A20202D2D612D63762D6261636B67726F756E642D636F6C6F723A20233236323332313B0D0A20202D2D612D63762D';
wwv_flow_imp.g_varchar2_table(370) := '736861646F773A20302032707820347078202D327078207267626128302C20302C20302C20302E303735293B0D0A20202D2D612D63762D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D612D63762D6261636B67726F756E64';
wwv_flow_imp.g_varchar2_table(371) := '2D636F6C6F72293B0D0A20202D2D612D63762D686F7665722D746578742D636F6C6F723A20766172282D2D612D63762D746578742D636F6C6F72293B0D0A20202D2D612D63762D686F7665722D626F726465722D636F6C6F723A20766172282D2D612D63';
wwv_flow_imp.g_varchar2_table(372) := '762D626F726465722D636F6C6F72293B0D0A20202D2D612D63762D686F7665722D736861646F773A20302034707820302E3572656D2030207267626128302C20302C20302C20302E31293B0D0A20202D2D612D63762D6163746976652D6261636B67726F';
wwv_flow_imp.g_varchar2_table(373) := '756E642D636F6C6F723A20766172282D2D612D63762D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D63762D6163746976652D746578742D636F6C6F723A20766172282D2D612D63762D746578742D636F6C6F72293B0D0A20202D2D61';
wwv_flow_imp.g_varchar2_table(374) := '2D63762D6163746976652D626F726465722D636F6C6F723A20766172282D2D612D63762D626F726465722D636F6C6F72293B0D0A20202D2D612D63762D6163746976652D736861646F773A20766172282D2D612D63762D736861646F77293B0D0A20202D';
wwv_flow_imp.g_varchar2_table(375) := '2D612D63762D666F6375732D626F726465722D636F6C6F723A20236337343633343B0D0A20202D2D612D63762D6D656469612D70616464696E672D793A203172656D3B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A203172656D3B';
wwv_flow_imp.g_varchar2_table(376) := '0D0A20202D2D612D63762D6865616465722D70616464696E672D793A203172656D3B0D0A20202D2D612D63762D6865616465722D70616464696E672D783A203172656D3B0D0A20202D2D612D63762D6865616465722D626F726465722D77696474683A20';
wwv_flow_imp.g_varchar2_table(377) := '3170783B0D0A20202D2D612D63762D6865616465722D626F726465722D636F6C6F723A2072676261283235352C203235352C203235352C20302E31293B0D0A20202D2D612D63762D69636F6E2D6261636B67726F756E642D636F6C6F723A202363373436';
wwv_flow_imp.g_varchar2_table(378) := '33343B0D0A20202D2D612D63762D69636F6E2D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D63762D69636F6E2D626F726465722D7261646975733A20313030253B0D0A20202D2D612D63762D69636F6E2D73697A653A20317265';
wwv_flow_imp.g_varchar2_table(379) := '6D3B0D0A20202D2D612D63762D69636F6E2D636F6E7461696E65722D73697A653A203272656D3B0D0A20202D2D612D63762D69636F6E2D70616464696E673A20302E3572656D3B0D0A20202D2D612D63762D696E697469616C732D666F6E742D77656967';
wwv_flow_imp.g_varchar2_table(380) := '68743A203730303B0D0A20202D2D612D63762D696E697469616C732D746578742D636F6C6F723A20236666666666663B0D0A20202D2D612D63762D696E697469616C732D6261636B67726F756E642D636F6C6F723A20236337343633343B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(381) := '612D63762D7375627469746C652D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D612D63762D7375627469746C652D666F6E742D7765696768743A203430303B0D0A20202D2D612D63762D7375627469746C652D6C696E652D6865696768';
wwv_flow_imp.g_varchar2_table(382) := '743A203172656D3B0D0A20202D2D612D63762D7375627469746C652D746578742D636F6C6F723A20236263626362633B0D0A20202D2D612D63762D626F64792D70616464696E672D783A203172656D3B0D0A20202D2D612D63762D626F64792D70616464';
wwv_flow_imp.g_varchar2_table(383) := '696E672D793A203172656D3B0D0A20202D2D612D63762D6D61696E636F6E74656E742D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D612D63762D6D61696E636F6E74656E742D6C696E652D6865696768743A20312E323572656D3B0D';
wwv_flow_imp.g_varchar2_table(384) := '0A20202D2D612D63762D737562636F6E74656E742D666F6E742D73697A653A20302E3638373572656D3B0D0A20202D2D612D63762D737562636F6E74656E742D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D63762D737562636F6E74';
wwv_flow_imp.g_varchar2_table(385) := '656E742D746578742D636F6C6F723A20236263626362633B0D0A20202D2D612D63762D616374696F6E732D626F726465722D77696474683A203170783B0D0A20202D2D612D63762D616374696F6E732D626F726465722D636F6C6F723A20726762612832';
wwv_flow_imp.g_varchar2_table(386) := '35352C203235352C203235352C20302E31293B0D0A20202D2D612D63762D616374696F6E732D70616464696E672D793A203172656D3B0D0A20202D2D612D63762D616374696F6E732D70616464696E672D783A203172656D3B0D0A7D0D0A2E612D544D56';
wwv_flow_imp.g_varchar2_table(387) := '2D2D6361726473202E612D47562D666F6F746572207B0D0A20206D696E2D6865696768743A20756E7365743B0D0A202070616464696E672D626C6F636B2D73746172743A20303B0D0A202070616464696E672D626C6F636B2D656E643A20303B0D0A7D0D';
wwv_flow_imp.g_varchar2_table(388) := '0A2E612D544D562D2D6361726473202E612D47562D666F6F746572202E6A732D72616E6765446973706C6179207B0D0A20206D617267696E2D626C6F636B2D73746172743A20766172282D2D612D67762D666F6F7465722D70616464696E672D79293B0D';
wwv_flow_imp.g_varchar2_table(389) := '0A20206D617267696E2D626C6F636B2D656E643A20766172282D2D612D67762D666F6F7465722D70616464696E672D79293B0D0A7D0D0A2E612D43617264566965772D66756C6C4C696E6B3A666F637573207B0D0A2020626F782D736861646F773A2069';
wwv_flow_imp.g_varchar2_table(390) := '6E73657420302030203020766172282D2D612D63762D626F726465722D77696474682C20302920766172282D2D612D63762D666F6375732D626F726465722D636F6C6F72293B0D0A7D0D0A2E612D43617264566965772D6D65646961207B0D0A2020616C';
wwv_flow_imp.g_varchar2_table(391) := '69676E2D6974656D733A2063656E7465723B0D0A20206A7573746966792D636F6E74656E743A2063656E7465723B0D0A7D0D0A2E612D43617264566965772D6D656469612061207B0D0A20207472616E736974696F6E3A206F70616369747920302E3273';
wwv_flow_imp.g_varchar2_table(392) := '20656173653B0D0A7D0D0A2E612D43617264566965772D6D6564696120613A666F637573207B0D0A20206F7061636974793A20302E353B0D0A7D0D0A2E612D43617264566965772D6865616465723A6C6173742D6368696C64207B0D0A20202D2D612D63';
wwv_flow_imp.g_varchar2_table(393) := '762D6865616465722D626F726465722D77696474683A203070783B0D0A7D0D0A2E6861732D6D656469612D2D6669727374207B0D0A20202D2D612D63762D6D656469612D70616464696E672D793A20303B0D0A20202D2D612D63762D6D656469612D7061';
wwv_flow_imp.g_varchar2_table(394) := '6464696E672D783A20303B0D0A7D0D0A2E6861732D6D656469612D2D6261636B67726F756E64207B0D0A20202D2D612D63762D6D656469612D70616464696E672D793A203072656D3B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A';
wwv_flow_imp.g_varchar2_table(395) := '203072656D3B0D0A20202D2D612D63762D746578742D636F6C6F723A20236666663B0D0A20202D2D612D63762D7375627469746C652D746578742D636F6C6F723A2072676261283235352C203235352C203235352C20302E3635293B0D0A20202D2D612D';
wwv_flow_imp.g_varchar2_table(396) := '63762D737562636F6E74656E742D746578742D636F6C6F723A2072676261283235352C203235352C203235352C20302E3635293B0D0A20202D2D612D63762D62616467652D6261636B67726F756E642D636F6C6F723A2072676261283235352C20323535';
wwv_flow_imp.g_varchar2_table(397) := '2C203235352C20302E3235293B0D0A7D0D0A2E6861732D6D656469612D2D6261636B67726F756E6420613A6E6F74285B636C6173735D29207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E6861732D6D656469612D2D6261636B67726F';
wwv_flow_imp.g_varchar2_table(398) := '756E6420613A6E6F74285B636C6173735D293A686F7665722C0D0A2E6861732D6D656469612D2D6261636B67726F756E6420613A6E6F74285B636C6173735D293A666F637573207B0D0A2020746578742D6465636F726174696F6E3A20756E6465726C69';
wwv_flow_imp.g_varchar2_table(399) := '6E653B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541207B0D0A20202D2D612D63762D6F766572666C6F773A2068696464656E3B0D0A20202D2D612D63762D6D656469612D6261636B67726F756E642D636F6C6F723A207267626128';
wwv_flow_imp.g_varchar2_table(400) := '3235352C203235352C203235352C20302E303235293B0D0A20202D2D612D63762D6D656469612D6F7665726C61792D636F6C6F723A207267626128302C20302C20302C20302E3735293B0D0A20202D2D612D63762D6865616465722D626F726465722D77';
wwv_flow_imp.g_varchar2_table(401) := '696474683A203070783B0D0A20202D2D612D63762D6865616465722D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A20202D2D612D63762D616374696F6E732D626F726465722D77696474683A203070783B0D0A20202D2D612D63762D';
wwv_flow_imp.g_varchar2_table(402) := '616374696F6E732D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A20202D2D612D63762D69636F6E2D636F6E7461696E65722D73697A653A20322E3572656D3B0D0A20202D2D612D63762D69636F6E2D73697A653A20312E323572656D';
wwv_flow_imp.g_varchar2_table(403) := '3B0D0A20202D2D612D63762D69636F6E2D626F726465722D7261646975733A20302E3138373572656D3B0D0A20202D2D612D63762D69636F6E2D696D6167652D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65';
wwv_flow_imp.g_varchar2_table(404) := '293B0D0A20202D2D612D63762D69636F6E2D696D6167652D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D626F726465722D726164';
wwv_flow_imp.g_varchar2_table(405) := '6975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(406) := '612D63762D696E697469616C732D666F6E742D73697A653A20312E323572656D3B0D0A20202D2D612D63762D696E697469616C732D666F6E742D7765696768743A203430303B0D0A20202D2D612D63762D62616467652D70616464696E673A20302E3235';
wwv_flow_imp.g_varchar2_table(407) := '72656D20302E3572656D3B0D0A20202D2D612D63762D62616467652D626F726465722D7261646975733A20312E323572656D3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D626F64792C0D0A2E74';
wwv_flow_imp.g_varchar2_table(408) := '2D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D6669727374207B0D0A20202D2D612D63762D6D656469612D626F726465722D7261646975733A20302E3138373572656D3B0D0A20202D2D612D63762D6D656469612D70';
wwv_flow_imp.g_varchar2_table(409) := '616464696E672D793A203172656D3B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A203172656D3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D626F6479202E612D43617264';
wwv_flow_imp.g_varchar2_table(410) := '566965772D6D656469612C0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D6669727374202E612D43617264566965772D6D65646961207B0D0A20206D617267696E2D696E6C696E652D73746172743A207661';
wwv_flow_imp.g_varchar2_table(411) := '72282D2D612D63762D6D656469612D70616464696E672D78293B0D0A20206D617267696E2D696E6C696E652D656E643A20766172282D2D612D63762D6D656469612D70616464696E672D78293B0D0A202070616464696E673A20303B0D0A7D0D0A2E742D';
wwv_flow_imp.g_varchar2_table(412) := '4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D6669727374202E612D43617264566965772D6D65646961207B0D0A20206D617267696E2D626C6F636B2D73746172743A20766172282D2D612D63762D6D656469612D7061';
wwv_flow_imp.g_varchar2_table(413) := '6464696E672D79293B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D69636F6E2D2D746F70207B0D0A20202D2D612D63762D69636F6E2D636F6E7461696E65722D73697A653A203672656D3B0D0A20202D2D612D6376';
wwv_flow_imp.g_varchar2_table(414) := '2D69636F6E2D73697A653A203372656D3B0D0A20202D2D612D63762D69636F6E2D626F726465722D7261646975733A20302E3572656D3B0D0A20202D2D612D63762D69636F6E2D696D6167652D73697A653A20766172282D2D612D63762D69636F6E2D63';
wwv_flow_imp.g_varchar2_table(415) := '6F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D69636F6E2D696D6167652D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E69746961';
wwv_flow_imp.g_varchar2_table(416) := '6C732D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E6572';
wwv_flow_imp.g_varchar2_table(417) := '2D73697A65293B0D0A20202D2D612D63762D696E697469616C732D666F6E742D73697A653A20312E3572656D3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D6669727374202E612D436172645669';
wwv_flow_imp.g_varchar2_table(418) := '65772D686561646572202B202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E6861732D6D656469612D2D6261636B67726F756E64202E612D43617264566965772D686561646572202B202E61';
wwv_flow_imp.g_varchar2_table(419) := '2D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E612D43617264566965772D626F6479202B202E612D43617264566965772D616374696F6E73207B0D0A202070616464696E672D626C6F636B2D7374';
wwv_flow_imp.g_varchar2_table(420) := '6172743A20303B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E612D43617264566965772D6974656D732D2D726F77202E742D4361726473526567696F6E2D2D7374796C6541202E612D43617264566965772D616374696F6E73';
wwv_flow_imp.g_varchar2_table(421) := '207B0D0A2020666C65782D646972656374696F6E3A20636F6C756D6E3B0D0A2020616C69676E2D6974656D733A20666C65782D656E643B0D0A2020677269642D636F6C756D6E3A20343B0D0A2020677269642D726F772D73746172743A20313B0D0A2020';
wwv_flow_imp.g_varchar2_table(422) := '677269642D726F772D656E643A20343B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6541202E612D43617264566965772D6974656D732D2D726F77202E612D43617264566965772D6D65646961207B0D0A20206D617267696E2D626C6F';
wwv_flow_imp.g_varchar2_table(423) := '636B2D73746172743A20766172282D2D612D63762D6D656469612D70616464696E672D79293B0D0A20206D617267696E2D626C6F636B2D656E643A20766172282D2D612D63762D6D656469612D70616464696E672D79293B0D0A20206D617267696E2D69';
wwv_flow_imp.g_varchar2_table(424) := '6E6C696E652D656E643A20303B0D0A7D0D0A2E752D52544C202E742D4361726473526567696F6E2D2D7374796C6541202E612D43617264566965772D6974656D732D2D726F77202E612D43617264566965772D6D65646961207B0D0A20206D617267696E';
wwv_flow_imp.g_varchar2_table(425) := '2D696E6C696E652D656E643A20766172282D2D612D63762D6D656469612D70616464696E672D78293B0D0A20206D617267696E2D696E6C696E652D73746172743A20303B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542207B0D0A20';
wwv_flow_imp.g_varchar2_table(426) := '202D2D612D63762D6F766572666C6F773A2068696464656E3B0D0A20202D2D612D63762D6D656469612D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D612D63762D6D65';
wwv_flow_imp.g_varchar2_table(427) := '6469612D6F7665726C61792D636F6C6F723A207267626128302C20302C20302C20302E3735293B0D0A20202D2D612D63762D69636F6E2D636F6E7461696E65722D73697A653A203472656D3B0D0A20202D2D612D63762D69636F6E2D73697A653A203272';
wwv_flow_imp.g_varchar2_table(428) := '656D3B0D0A20202D2D612D63762D69636F6E2D626F726465722D7261646975733A20302E323572656D3B0D0A20202D2D612D63762D69636F6E2D696D6167652D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65';
wwv_flow_imp.g_varchar2_table(429) := '293B0D0A20202D2D612D63762D69636F6E2D696D6167652D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D626F726465722D726164';
wwv_flow_imp.g_varchar2_table(430) := '6975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(431) := '612D63762D696E697469616C732D666F6E742D73697A653A203272656D3B0D0A20202D2D612D63762D696E697469616C732D666F6E742D7765696768743A203430303B0D0A20202D2D612D63762D6D656469612D70616464696E672D793A203072656D3B';
wwv_flow_imp.g_varchar2_table(432) := '0D0A20202D2D612D63762D6D656469612D70616464696E672D783A203072656D3B0D0A20202D2D612D63762D6865616465722D626F726465722D77696474683A203070783B0D0A20202D2D612D63762D6865616465722D6261636B67726F756E642D636F';
wwv_flow_imp.g_varchar2_table(433) := '6C6F723A20756E7365743B0D0A20202D2D612D63762D616374696F6E732D626F726465722D77696474683A203070783B0D0A20202D2D612D63762D616374696F6E732D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A20202D2D612D63';
wwv_flow_imp.g_varchar2_table(434) := '762D7469746C652D666F6E742D73697A653A20312E323572656D3B0D0A20202D2D612D63762D7469746C652D6C696E652D6865696768743A20312E373572656D3B0D0A20202D2D612D63762D62616467652D70616464696E673A20302E323572656D2030';
wwv_flow_imp.g_varchar2_table(435) := '2E373572656D3B0D0A20202D2D612D63762D62616467652D626F726465722D7261646975733A20312E323572656D3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70207B0D0A20202D2D612D63';
wwv_flow_imp.g_varchar2_table(436) := '762D69636F6E2D636F6E7461696E65722D73697A653A203772656D3B0D0A20202D2D612D63762D69636F6E2D73697A653A203272656D3B0D0A20202D2D612D63762D69636F6E2D626F726465722D7261646975733A20302E323572656D3B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(437) := '612D63762D69636F6E2D696D6167652D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D69636F6E2D696D6167652D626F726465722D7261646975733A20766172282D2D612D63';
wwv_flow_imp.g_varchar2_table(438) := '762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D696E697469616C732D626F726465722D7261646975733A20766172282D2D612D63762D69636F6E2D626F726465722D726164697573293B0D0A20202D2D612D63762D69';
wwv_flow_imp.g_varchar2_table(439) := '6E697469616C732D73697A653A20766172282D2D612D63762D69636F6E2D636F6E7461696E65722D73697A65293B0D0A20202D2D612D63762D696E697469616C732D666F6E742D73697A653A203272656D3B0D0A7D0D0A2E742D4361726473526567696F';
wwv_flow_imp.g_varchar2_table(440) := '6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70202E612D43617264566965772D69636F6E57726170207B0D0A20206D617267696E2D696E6C696E652D73746172743A2063616C6328766172282D2D612D63762D6865616465722D7061646469';
wwv_flow_imp.g_varchar2_table(441) := '6E672D7829202A202D31293B0D0A20206D617267696E2D696E6C696E652D656E643A2063616C6328766172282D2D612D63762D6865616465722D70616464696E672D7829202A202D31293B0D0A20206D617267696E2D626C6F636B2D73746172743A2063';
wwv_flow_imp.g_varchar2_table(442) := '616C6328766172282D2D612D63762D6865616465722D70616464696E672D7929202A202D31293B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70202E612D43617264566965772D69636F6E5772';
wwv_flow_imp.g_varchar2_table(443) := '6170202E612D43617264566965772D696E697469616C732C0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70202E612D43617264566965772D69636F6E57726170202E612D43617264566965772D69636F';
wwv_flow_imp.g_varchar2_table(444) := '6E2C0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70202E612D43617264566965772D69636F6E57726170202E612D43617264566965772D69636F6E496D67207B0D0A202077696474683A20313030253B';
wwv_flow_imp.g_varchar2_table(445) := '0D0A2020626F726465722D7261646975733A20303B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D746F70202E612D43617264566965772D69636F6E3A6265666F7265207B0D0A2020626F726465722D';
wwv_flow_imp.g_varchar2_table(446) := '7261646975733A20313030253B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A2020746578742D736861646F773A20302031707820317078207267626128302C20302C20302C20302E31293B';
wwv_flow_imp.g_varchar2_table(447) := '0D0A20206D617267696E3A206175746F3B0D0A202070616464696E673A2063616C6328766172282D2D612D63762D69636F6E2D73697A6529202F2032293B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D';
wwv_flow_imp.g_varchar2_table(448) := '2D7374617274202E612D43617264566965772D69636F6E57726170207B0D0A20206D617267696E2D626C6F636B2D656E643A20766172282D2D612D63762D6865616465722D6974656D2D73706163696E672D782C20302E373572656D293B0D0A7D0D0A2E';
wwv_flow_imp.g_varchar2_table(449) := '742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D656E64202E612D43617264566965772D69636F6E57726170207B0D0A20206D617267696E2D626C6F636B2D73746172743A20766172282D2D612D63762D686561646572';
wwv_flow_imp.g_varchar2_table(450) := '2D6974656D2D73706163696E672D782C20302E373572656D293B0D0A2020677269642D617265613A2062616467652D626F74746F6D3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D656E64202E612D';
wwv_flow_imp.g_varchar2_table(451) := '43617264566965772D686561646572426F6479207B0D0A2020677269642D617265613A2069636F6E2D746F703B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E6861732D69636F6E2D2D656E64202E612D43617264566965772D';
wwv_flow_imp.g_varchar2_table(452) := '6261646765207B0D0A2020677269642D617265613A20626F64793B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D69636F6E57726170207B0D0A2020677269642D617265613A2069636F6E2D746F70';
wwv_flow_imp.g_varchar2_table(453) := '3B0D0A20206D617267696E2D696E6C696E652D656E643A20756E7365743B0D0A20206D617267696E2D696E6C696E652D73746172743A20756E7365743B0D0A2020646973706C61793A20666C65783B0D0A20206A7573746966792D636F6E74656E743A20';
wwv_flow_imp.g_varchar2_table(454) := '63656E7465723B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D686561646572426F6479207B0D0A2020746578742D616C69676E3A2063656E7465723B0D0A7D0D0A2E742D4361726473526567696F';
wwv_flow_imp.g_varchar2_table(455) := '6E2D2D7374796C6542202E612D43617264566965772D6261646765207B0D0A20206D617267696E2D696E6C696E652D73746172743A206175746F3B0D0A20206D617267696E2D696E6C696E652D656E643A206175746F3B0D0A2020677269642D61726561';
wwv_flow_imp.g_varchar2_table(456) := '3A2062616467652D626F74746F6D3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D62616467653A6E6F74283A66697273742D6368696C6429207B0D0A20206D617267696E2D626C6F636B2D737461';
wwv_flow_imp.g_varchar2_table(457) := '72743A20766172282D2D612D63762D6865616465722D6974656D2D73706163696E672D782C20302E373572656D293B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D62616467654C6162656C207B0D';
wwv_flow_imp.g_varchar2_table(458) := '0A2020626F726465723A20756E7365743B0D0A2020636C69703A20756E7365743B0D0A2020636C69702D706174683A20756E7365743B0D0A20206865696768743A20756E7365743B0D0A20206D617267696E3A20756E7365743B0D0A20206F766572666C';
wwv_flow_imp.g_varchar2_table(459) := '6F773A20756E7365743B0D0A202070616464696E673A20756E7365743B0D0A2020706F736974696F6E3A20756E7365743B0D0A202077696474683A20756E7365743B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D436172';
wwv_flow_imp.g_varchar2_table(460) := '64566965772D616374696F6E73207B0D0A2020666C65782D646972656374696F6E3A20636F6C756D6E3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D616374696F6E735072696D617279202E612D';
wwv_flow_imp.g_varchar2_table(461) := '43617264566965772D627574746F6E207B0D0A202077696474683A20313030253B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D616374696F6E735072696D617279202E612D43617264566965772D';
wwv_flow_imp.g_varchar2_table(462) := '627574746F6E202B202E612D43617264566965772D627574746F6E207B0D0A20206D617267696E2D626C6F636B2D73746172743A20302E323572656D3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D4361726456696577';
wwv_flow_imp.g_varchar2_table(463) := '2D616374696F6E735365636F6E64617279207B0D0A2020746578742D616C69676E3A2063656E7465723B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6542202E612D43617264566965772D616374696F6E735365636F6E646172793A6E';
wwv_flow_imp.g_varchar2_table(464) := '6F74283A6F6E6C792D6368696C6429207B0D0A20206D617267696E2D626C6F636B2D73746172743A20302E3572656D3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6543207B0D0A20202D2D612D63762D6F766572666C6F773A206869';
wwv_flow_imp.g_varchar2_table(465) := '6464656E3B0D0A20202D2D612D63762D6D656469612D6261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E303235293B0D0A20202D2D612D63762D6D656469612D6F7665726C61792D636F6C6F723A2072';
wwv_flow_imp.g_varchar2_table(466) := '67626128302C20302C20302C20302E3735293B0D0A20202D2D612D63762D6D656469612D70616464696E672D793A203072656D3B0D0A20202D2D612D63762D6D656469612D70616464696E672D783A203072656D3B0D0A20202D2D612D63762D68656164';
wwv_flow_imp.g_varchar2_table(467) := '65722D626F726465722D77696474683A203070783B0D0A20202D2D612D63762D6865616465722D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A20202D2D612D63762D616374696F6E732D626F726465722D77696474683A203070783B';
wwv_flow_imp.g_varchar2_table(468) := '0D0A20202D2D612D63762D616374696F6E732D6261636B67726F756E642D636F6C6F723A20756E7365743B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D7469746C652E6861732D626F64793A6E6F74282E6861732D';
wwv_flow_imp.g_varchar2_table(469) := '6D656469612D2D626F647929202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D7469746C652E6861732D7365636F6E646172793A6E6F74282E6861732D6D656469612D2D626F6479';
wwv_flow_imp.g_varchar2_table(470) := '29202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D7375627469746C652E6861732D626F64793A6E6F74282E6861732D6D656469612D2D626F647929202E612D4361726456696577';
wwv_flow_imp.g_varchar2_table(471) := '2D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D7375627469746C652E6861732D7365636F6E646172793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F64792C0D0A';
wwv_flow_imp.g_varchar2_table(472) := '2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D69636F6E2E6861732D626F64793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D73';
wwv_flow_imp.g_varchar2_table(473) := '74796C6543202E6861732D69636F6E2E6861732D7365636F6E646172793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D62';
wwv_flow_imp.g_varchar2_table(474) := '616467652E6861732D626F64793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F64792C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E6861732D62616467652E6861732D7365636F6E6461';
wwv_flow_imp.g_varchar2_table(475) := '72793A6E6F74282E6861732D6D656469612D2D626F647929202E612D43617264566965772D626F6479207B0D0A202070616464696E672D626C6F636B2D73746172743A20303B0D0A7D0D0A406D6564696120286D61782D77696474683A20373637707829';
wwv_flow_imp.g_varchar2_table(476) := '207B0D0A20202E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E612D4361726456696577207B0D0A20202020646973706C61793A20666C65783B0D0A20207D0D0A7D0D0A2E742D4361';
wwv_flow_imp.g_varchar2_table(477) := '726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E6861732D69636F6E2D2D7374617274202E612D43617264566965772D626F6479207B0D0A2020677269642D636F6C756D6E2D73746172743A2032';
wwv_flow_imp.g_varchar2_table(478) := '3B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E6861732D6D656469612D2D6669727374202E612D43617264566965772D626F6479207B0D0A2020677269642D636F6C';
wwv_flow_imp.g_varchar2_table(479) := '756D6E2D73746172743A20323B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E6861732D6D656469612D2D66697273742E6861732D69636F6E2D2D7374617274202E61';
wwv_flow_imp.g_varchar2_table(480) := '2D43617264566965772D626F6479207B0D0A2020677269642D636F6C756D6E2D73746172743A20333B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E612D4361726456';
wwv_flow_imp.g_varchar2_table(481) := '6965772D616374696F6E73207B0D0A2020666C65782D646972656374696F6E3A20636F6C756D6E3B0D0A2020616C69676E2D6974656D733A2063656E7465723B0D0A2020677269642D636F6C756D6E3A20343B0D0A2020677269642D726F772D73746172';
wwv_flow_imp.g_varchar2_table(482) := '743A20313B0D0A2020677269642D726F772D656E643A20323B0D0A2020616C69676E2D73656C663A2063656E7465723B0D0A7D0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E';
wwv_flow_imp.g_varchar2_table(483) := '6861732D626F6479202E612D43617264566965772D616374696F6E73207B0D0A2020616C69676E2D6974656D733A20666C65782D656E643B0D0A2020677269642D726F772D656E643A20343B0D0A7D0D0A2E742D4361726473526567696F6E2D2D737479';
wwv_flow_imp.g_varchar2_table(484) := '6C6543202E612D43617264566965772D6974656D732D2D726F77202E612D43617264566965773A6E6F74282E6861732D69636F6E292C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F';
wwv_flow_imp.g_varchar2_table(485) := '77202E6861732D69636F6E2D2D746F702C0D0A2E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E6861732D69636F6E2D2D656E64207B0D0A20202D2D612D63762D69636F6E2D737061';
wwv_flow_imp.g_varchar2_table(486) := '6365723A203072656D3B0D0A7D0D0A406D6564696120286D61782D77696474683A20373637707829207B0D0A20202E742D4361726473526567696F6E2D2D7374796C6543202E612D43617264566965772D6974656D732D2D726F77202E6861732D6D6564';
wwv_flow_imp.g_varchar2_table(487) := '6961207B0D0A20202020677269642D74656D706C6174652D636F6C756D6E733A206D696E6D617828312E323572656D2C203572656D29206D696E6D617828302C20766172282D2D612D63762D69636F6E2D7370616365722C20322E373572656D29292031';
wwv_flow_imp.g_varchar2_table(488) := '6672206D696E6D617828302C206175746F293B0D0A20207D0D0A7D0D0A2E742D466F726D2D2D6C617267652C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765207B0D0A20202D2D75742D6669656C642D6C6162656C2D666F';
wwv_flow_imp.g_varchar2_table(489) := '6E742D73697A653A20302E38373572656D3B0D0A20202D2D75742D6669656C642D6C6162656C2D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D6669656C642D696E7075742D666F6E742D73697A653A20302E38373572656D3B0D0A20';
wwv_flow_imp.g_varchar2_table(490) := '202D2D612D6669656C642D696E7075742D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D783A20302E3572656D3B0D0A20202D2D75742D6669656C642D696E7075742D69636F6E2D70';
wwv_flow_imp.g_varchar2_table(491) := '616464696E672D783A20302E3572656D3B0D0A20202D2D75742D6669656C642D696E7075742D69636F6E2D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D636865636B626F782D73697A653A20312E323572656D3B0D0A20202D2D612D';
wwv_flow_imp.g_varchar2_table(492) := '636865636B626F782D69636F6E2D73697A653A20312E31323572656D3B0D0A20202D2D612D636865636B626F782D6C6162656C2D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D612D636865636B626F782D6C6162656C2D6C696E652D';
wwv_flow_imp.g_varchar2_table(493) := '6865696768743A20312E323572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D70616464696E672D793A20302E3572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D70616464696E672D783A20302E373572656D3B0D0A20202D2D75';
wwv_flow_imp.g_varchar2_table(494) := '742D70696C6C627574746F6E2D666F6E742D73697A653A20302E373572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D6C696E652D6865696768743A203172656D3B0D0A20202D2D75742D70696C6C627574746F6E2D636865636B626F782D6F';
wwv_flow_imp.g_varchar2_table(495) := '66667365743A20302E33373572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D636865636B626F782D6C696E652D6865696768743A203172656D3B0D0A20202D2D612D706F7075706C6F762D636869702D6D617267696E2D783A20302E313235';
wwv_flow_imp.g_varchar2_table(496) := '72656D3B0D0A20202D2D612D706F7075706C6F762D636869702D6D617267696E2D793A20302E31323572656D3B0D0A20202D2D612D706F7075706C6F762D636869702D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D612D706F707570';
wwv_flow_imp.g_varchar2_table(497) := '6C6F762D636869702D6C696E652D6865696768743A20312E323572656D3B0D0A20202D2D612D706F7075706C6F762D636869702D70616464696E672D793A20302E31323572656D3B0D0A20202D2D612D706F7075706C6F762D636869702D70616464696E';
wwv_flow_imp.g_varchar2_table(498) := '672D783A20302E33373572656D3B0D0A20202D2D612D7377697463682D77696474683A20332E373572656D3B0D0A20202D2D612D7377697463682D70616464696E672D793A20302E3138373572656D3B0D0A20202D2D612D7377697463682D7061646469';
wwv_flow_imp.g_varchar2_table(499) := '6E672D783A20302E3138373572656D3B0D0A20202D2D612D7377697463682D746F67676C652D77696474683A20312E36323572656D3B0D0A20202D2D612D7377697463682D746F67676C652D6865696768743A20312E36323572656D3B0D0A7D0D0A2E74';
wwv_flow_imp.g_varchar2_table(500) := '2D466F726D2D2D6C61726765202E742D466F726D2D6974656D546578742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E742D466F726D2D6974656D54657874207B0D0A20206C696E652D6865696768743A20327265';
wwv_flow_imp.g_varchar2_table(501) := '6D3B0D0A2020666F6E742D73697A653A20302E38373572656D3B0D0A7D0D0A2E742D466F726D2D2D6C61726765202E617065782D6974656D2D69636F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E617065782D';
wwv_flow_imp.g_varchar2_table(502) := '6974656D2D69636F6E2C0D0A2E742D466F726D2D2D6C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B65722C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C617267652E617065782D6974656D';
wwv_flow_imp.g_varchar2_table(503) := '2D777261707065722D2D636F6C6F722D7069636B6572207B0D0A20202D2D612D69636F6E2D70616464696E673A20302E3572656D3B0D0A7D0D0A2E742D466F726D2D2D6C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069';
wwv_flow_imp.g_varchar2_table(504) := '636B65722C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B6572207B0D0A20202D2D612D69636F6E2D73697A653A20312E323572656D3B0D0A20';
wwv_flow_imp.g_varchar2_table(505) := '202D2D612D6974656D2D69636F6E2D6F66667365743A2063616C6328766172282D2D612D69636F6E2D73697A652C203172656D29202B20766172282D2D612D69636F6E2D70616464696E6729293B0D0A7D0D0A2E742D466F726D2D2D6C61726765202E61';
wwv_flow_imp.g_varchar2_table(506) := '7065782D6974656D2D67726F75702D2D636F6C6F722D7069636B6572202E612D427574746F6E2D2D636F6C6F725069636B65724F6E6C792C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E617065782D6974656D2D67';
wwv_flow_imp.g_varchar2_table(507) := '726F75702D2D636F6C6F722D7069636B6572202E612D427574746F6E2D2D636F6C6F725069636B65724F6E6C79207B0D0A20202D2D612D636F6C6F722D7069636B65722D636F6C6F722D6F6E6C792D6865696768743A203172656D3B0D0A20202D2D612D';
wwv_flow_imp.g_varchar2_table(508) := '636F6C6F722D7069636B65722D636F6C6F722D6F6E6C792D77696474683A203272656D3B0D0A20202D2D612D627574746F6E2D70616464696E673A20302E3572656D3B0D0A7D0D0A2E742D466F726D2D2D6C617267652E617065782D6974656D2D777261';
wwv_flow_imp.g_varchar2_table(509) := '707065722D2D6861732D69636F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C617267652E617065782D6974656D2D777261707065722D2D6861732D69636F6E207B0D0A20202D2D612D69636F6E2D70616464696E673A20302E';
wwv_flow_imp.g_varchar2_table(510) := '3572656D3B0D0A20202D2D612D6974656D2D69636F6E2D6F66667365743A2063616C6328766172282D2D612D69636F6E2D73697A652C203172656D29202B20766172282D2D612D69636F6E2D70616464696E6729293B0D0A7D0D0A2E742D466F726D2D2D';
wwv_flow_imp.g_varchar2_table(511) := '6C61726765202E742D466F726D2D6974656D57726170706572202E612D427574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E742D466F726D2D6974656D57726170706572202E612D427574746F6E2C0D0A';
wwv_flow_imp.g_varchar2_table(512) := '2E742D466F726D2D2D6C61726765202E742D466F726D2D6974656D57726170706572202E6F6A2D696E7075746461746574696D652D696E7075742D747269676765722C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E';
wwv_flow_imp.g_varchar2_table(513) := '742D466F726D2D6974656D57726170706572202E6F6A2D696E7075746461746574696D652D696E7075742D747269676765722C0D0A2E742D466F726D2D2D6C61726765202E742D466F726D2D6974656D57726170706572202E742D466F726D2D68656C70';
wwv_flow_imp.g_varchar2_table(514) := '427574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E742D466F726D2D6974656D57726170706572202E742D466F726D2D68656C70427574746F6E2C0D0A2E742D466F726D2D2D6C61726765202E61706578';
wwv_flow_imp.g_varchar2_table(515) := '2D6974656D2D66696C652D2D6E61746976653A3A2D7765626B69742D66696C652D75706C6F61642D627574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E617065782D6974656D2D66696C652D2D6E617469';
wwv_flow_imp.g_varchar2_table(516) := '76653A3A2D7765626B69742D66696C652D75706C6F61642D627574746F6E207B0D0A20202D2D612D627574746F6E2D70616464696E672D793A20302E3572656D3B0D0A20202D2D612D627574746F6E2D70616464696E672D783A20302E373572656D3B0D';
wwv_flow_imp.g_varchar2_table(517) := '0A20202D2D612D69636F6E2D73697A653A203172656D3B0D0A7D0D0A2E742D466F726D2D2D6C61726765202E617065782D6974656D2D67726F75702D2D73687574746C652073656C6563742E73687574746C655F6C6566742C0D0A2E742D466F726D2D66';
wwv_flow_imp.g_varchar2_table(518) := '69656C64436F6E7461696E65722D2D6C61726765202E617065782D6974656D2D67726F75702D2D73687574746C652073656C6563742E73687574746C655F6C6566742C0D0A2E742D466F726D2D2D6C61726765202E617065782D6974656D2D67726F7570';
wwv_flow_imp.g_varchar2_table(519) := '2D2D73687574746C652073656C6563742E73687574746C655F72696768742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C61726765202E617065782D6974656D2D67726F75702D2D73687574746C652073656C6563742E73687574';
wwv_flow_imp.g_varchar2_table(520) := '746C655F7269676874207B0D0A20206D696E2D6865696768743A2031312E323572656D3B0D0A7D0D0A2E742D466F726D2D2D786C617267652C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765207B0D0A20202D2D75742D';
wwv_flow_imp.g_varchar2_table(521) := '6669656C642D6C6162656C2D666F6E742D73697A653A203172656D3B0D0A20202D2D75742D6669656C642D6C6162656C2D70616464696E672D793A20302E373572656D3B0D0A20202D2D612D6669656C642D696E7075742D666F6E742D73697A653A2031';
wwv_flow_imp.g_varchar2_table(522) := '72656D3B0D0A20202D2D612D6669656C642D696E7075742D6C696E652D6865696768743A20312E323572656D3B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D793A20302E36323572656D3B0D0A20202D2D612D6669656C642D69';
wwv_flow_imp.g_varchar2_table(523) := '6E7075742D70616464696E672D783A20302E36323572656D3B0D0A20202D2D75742D6669656C642D696E7075742D69636F6E2D70616464696E672D783A20302E3572656D3B0D0A20202D2D75742D6669656C642D696E7075742D69636F6E2D7061646469';
wwv_flow_imp.g_varchar2_table(524) := '6E672D793A20302E373572656D3B0D0A20202D2D612D636865636B626F782D73697A653A20312E3572656D3B0D0A20202D2D612D636865636B626F782D69636F6E2D73697A653A20312E31323572656D3B0D0A20202D2D612D636865636B626F782D6C61';
wwv_flow_imp.g_varchar2_table(525) := '62656C2D666F6E742D73697A653A203172656D3B0D0A20202D2D612D636865636B626F782D6C6162656C2D6C696E652D6865696768743A20312E3572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D70616464696E672D793A20302E37357265';
wwv_flow_imp.g_varchar2_table(526) := '6D3B0D0A20202D2D75742D70696C6C627574746F6E2D70616464696E672D783A20302E373572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D666F6E742D73697A653A20302E38373572656D3B0D0A20202D2D75742D70696C6C627574746F6E';
wwv_flow_imp.g_varchar2_table(527) := '2D6C696E652D6865696768743A203172656D3B0D0A20202D2D75742D70696C6C627574746F6E2D636865636B626F782D6F66667365743A20302E3572656D3B0D0A20202D2D75742D70696C6C627574746F6E2D636865636B626F782D6C696E652D686569';
wwv_flow_imp.g_varchar2_table(528) := '6768743A203172656D3B0D0A20202D2D612D706F7075706C6F762D636869702D6D617267696E2D783A20302E31323572656D3B0D0A20202D2D612D706F7075706C6F762D636869702D6D617267696E2D793A20302E31323572656D3B0D0A20202D2D612D';
wwv_flow_imp.g_varchar2_table(529) := '706F7075706C6F762D636869702D666F6E742D73697A653A203172656D3B0D0A20202D2D612D706F7075706C6F762D636869702D6C696E652D6865696768743A20312E3572656D3B0D0A20202D2D612D706F7075706C6F762D636869702D70616464696E';
wwv_flow_imp.g_varchar2_table(530) := '672D793A20302E323572656D3B0D0A20202D2D612D706F7075706C6F762D636869702D70616464696E672D783A20302E3572656D3B0D0A20202D2D612D7377697463682D77696474683A20342E373572656D3B0D0A20202D2D612D7377697463682D7061';
wwv_flow_imp.g_varchar2_table(531) := '6464696E672D793A20302E323572656D3B0D0A20202D2D612D7377697463682D70616464696E672D783A20302E323572656D3B0D0A20202D2D612D7377697463682D746F67676C652D77696474683A203272656D3B0D0A20202D2D612D7377697463682D';
wwv_flow_imp.g_varchar2_table(532) := '746F67676C652D6865696768743A203272656D3B0D0A7D0D0A2E742D466F726D2D2D786C61726765202E742D466F726D2D6974656D546578742C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765202E742D466F726D2D69';
wwv_flow_imp.g_varchar2_table(533) := '74656D54657874207B0D0A20206C696E652D6865696768743A20322E3572656D3B0D0A2020666F6E742D73697A653A203172656D3B0D0A7D0D0A2E742D466F726D2D2D786C61726765202E617065782D6974656D2D69636F6E2C0D0A2E742D466F726D2D';
wwv_flow_imp.g_varchar2_table(534) := '6669656C64436F6E7461696E65722D2D786C61726765202E617065782D6974656D2D69636F6E2C0D0A2E742D466F726D2D2D786C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B65722C0D0A2E742D466F726D2D66';
wwv_flow_imp.g_varchar2_table(535) := '69656C64436F6E7461696E65722D2D786C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B6572207B0D0A20202D2D612D69636F6E2D70616464696E673A20302E3572656D3B0D0A7D0D0A2E742D466F726D2D2D786C';
wwv_flow_imp.g_varchar2_table(536) := '617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B65722C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C617267652E617065782D6974656D2D777261707065722D2D636F6C6F722D7069636B65';
wwv_flow_imp.g_varchar2_table(537) := '72207B0D0A20202D2D612D69636F6E2D73697A653A20312E323572656D3B0D0A20202D2D612D6974656D2D69636F6E2D6F66667365743A2063616C6328766172282D2D612D69636F6E2D73697A652C203172656D29202B20766172282D2D612D69636F6E';
wwv_flow_imp.g_varchar2_table(538) := '2D70616464696E6729293B0D0A7D0D0A2E742D466F726D2D2D786C61726765202E617065782D6974656D2D67726F75702D2D636F6C6F722D7069636B6572202E612D427574746F6E2D2D636F6C6F725069636B65724F6E6C792C0D0A2E742D466F726D2D';
wwv_flow_imp.g_varchar2_table(539) := '6669656C64436F6E7461696E65722D2D786C61726765202E617065782D6974656D2D67726F75702D2D636F6C6F722D7069636B6572202E612D427574746F6E2D2D636F6C6F725069636B65724F6E6C79207B0D0A20202D2D612D636F6C6F722D7069636B';
wwv_flow_imp.g_varchar2_table(540) := '65722D636F6C6F722D6F6E6C792D6865696768743A20312E3572656D3B0D0A20202D2D612D636F6C6F722D7069636B65722D636F6C6F722D6F6E6C792D77696474683A203272656D3B0D0A20202D2D612D627574746F6E2D70616464696E673A20302E35';
wwv_flow_imp.g_varchar2_table(541) := '72656D3B0D0A7D0D0A2E742D466F726D2D2D786C61726765202E742D466F726D2D6974656D57726170706572202E612D427574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765202E742D466F726D2D6974656D';
wwv_flow_imp.g_varchar2_table(542) := '57726170706572202E612D427574746F6E2C0D0A2E742D466F726D2D2D786C61726765202E742D466F726D2D6974656D57726170706572202E6F6A2D696E7075746461746574696D652D696E7075742D747269676765722C0D0A2E742D466F726D2D6669';
wwv_flow_imp.g_varchar2_table(543) := '656C64436F6E7461696E65722D2D786C61726765202E742D466F726D2D6974656D57726170706572202E6F6A2D696E7075746461746574696D652D696E7075742D747269676765722C0D0A2E742D466F726D2D2D786C61726765202E742D466F726D2D69';
wwv_flow_imp.g_varchar2_table(544) := '74656D57726170706572202E742D466F726D2D68656C70427574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C61726765202E742D466F726D2D6974656D57726170706572202E742D466F726D2D68656C70427574746F';
wwv_flow_imp.g_varchar2_table(545) := '6E2C0D0A2E742D466F726D2D2D786C61726765202E617065782D6974656D2D66696C652D2D6E61746976653A3A2D7765626B69742D66696C652D75706C6F61642D627574746F6E2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C';
wwv_flow_imp.g_varchar2_table(546) := '61726765202E617065782D6974656D2D66696C652D2D6E61746976653A3A2D7765626B69742D66696C652D75706C6F61642D627574746F6E207B0D0A20202D2D612D627574746F6E2D70616464696E672D793A20302E3638373572656D3B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(547) := '612D627574746F6E2D70616464696E672D783A20302E373572656D3B0D0A20202D2D612D69636F6E2D73697A653A203172656D3B0D0A7D0D0A2E742D466F726D2D2D786C617267652E617065782D6974656D2D777261707065722D2D6861732D69636F6E';
wwv_flow_imp.g_varchar2_table(548) := '2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C617267652E617065782D6974656D2D777261707065722D2D6861732D69636F6E207B0D0A20202D2D612D69636F6E2D70616464696E673A20302E3572656D3B0D0A20202D2D612D';
wwv_flow_imp.g_varchar2_table(549) := '6974656D2D69636F6E2D6F66667365743A2063616C6328766172282D2D612D69636F6E2D73697A652C203172656D29202B20766172282D2D612D69636F6E2D70616464696E6729293B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E6572';
wwv_flow_imp.g_varchar2_table(550) := '2D2D666C6F6174696E674C6162656C2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C617267652C0D0A2E742D466F726D2D2D6C61726765202E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C20';
wwv_flow_imp.g_varchar2_table(551) := '7B0D0A20202D2D75742D6669656C642D6C6162656C2D666F6E742D73697A653A203172656D3B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D783A20302E373572656D3B0D0A20202D2D612D6669656C642D696E7075742D706164';
wwv_flow_imp.g_varchar2_table(552) := '64696E672D793A20302E36323572656D3B0D0A20202D2D612D6669656C642D696E7075742D666F6E742D73697A653A203172656D3B0D0A20202D2D75742D6669656C642D666C2D6C6162656C2D6C696E652D6865696768743A20312E323572656D3B0D0A';
wwv_flow_imp.g_varchar2_table(553) := '20202D2D75742D6669656C642D666C2D6C6162656C2D666F6E742D73697A653A20302E373572656D3B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E742D466F726D2D6669656C64436F6E74';
wwv_flow_imp.g_varchar2_table(554) := '61696E65722D2D786C617267652C0D0A2E742D466F726D2D2D786C61726765202E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C207B0D0A20202D2D75742D6669656C642D6C6162656C2D666F6E742D73697A';
wwv_flow_imp.g_varchar2_table(555) := '653A203172656D3B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D783A20302E373572656D3B0D0A20202D2D612D6669656C642D696E7075742D70616464696E672D793A20302E373572656D3B0D0A20202D2D612D6669656C642D';
wwv_flow_imp.g_varchar2_table(556) := '696E7075742D666F6E742D73697A653A203172656D3B0D0A20202D2D75742D6669656C642D666C2D6C6162656C2D6C696E652D6865696768743A20312E33373572656D3B0D0A20202D2D75742D6669656C642D666C2D6C6162656C2D666F6E742D73697A';
wwv_flow_imp.g_varchar2_table(557) := '653A20302E38373572656D3B0D0A20202D2D75742D6669656C642D696E7075742D69636F6E2D70616464696E672D783A20302E36323572656D3B0D0A7D0D0A2E726F2D636865636B626F782C0D0A2E752D636865636B626F783A6265666F72652C0D0A2E';
wwv_flow_imp.g_varchar2_table(558) := '752D726164696F3A6265666F7265207B0D0A20207472616E73666F726D2D6F726967696E3A2063656E7465722063656E7465723B0D0A20207472616E736974696F6E3A207472616E73666F726D20302E3132357320656173652C206261636B67726F756E';
wwv_flow_imp.g_varchar2_table(559) := '642D636F6C6F7220302E31357320656173652C20626F782D736861646F7720302E31357320656173652C20626F726465722D636F6C6F7220302E31357320656173653B0D0A7D0D0A2E726F2D636865636B626F783A6265666F72652C0D0A2E752D636865';
wwv_flow_imp.g_varchar2_table(560) := '636B626F783A61667465722C0D0A2E752D726164696F3A6166746572207B0D0A20207472616E73666F726D2D6F726967696E3A2063656E7465722063656E7465723B0D0A20207472616E73666F726D3A207363616C652830293B0D0A20207472616E7369';
wwv_flow_imp.g_varchar2_table(561) := '74696F6E3A206F70616369747920302E31357320656173652C207472616E73666F726D20302E327320656173653B0D0A7D0D0A2E726F2D636865636B626F783A6163746976652C0D0A2E726F2D636865636B626F783A6163746976653A6265666F72652C';
wwv_flow_imp.g_varchar2_table(562) := '0D0A2E752D636865636B626F783A6163746976653A6265666F72652C0D0A2E752D636865636B626F783A6163746976653A61667465722C0D0A696E7075743A636865636B6564202B202E752D636865636B626F783A6163746976653A61667465722C0D0A';
wwv_flow_imp.g_varchar2_table(563) := '2E752D726164696F3A6163746976653A6265666F72652C0D0A2E752D726164696F3A6163746976653A61667465722C0D0A696E7075743A636865636B6564202B202E752D726164696F3A6163746976653A6166746572207B0D0A20207472616E73666F72';
wwv_flow_imp.g_varchar2_table(564) := '6D3A207363616C6528302E3735293B0D0A7D0D0A2E726F2D636865636B626F782E69732D636865636B65643A6265666F72652C0D0A2E752D636865636B626F782E69732D636865636B65643A61667465722C0D0A696E7075743A636865636B6564202B20';
wwv_flow_imp.g_varchar2_table(565) := '2E752D636865636B626F783A61667465722C0D0A696E7075743A636865636B6564202B202E752D726164696F3A6166746572207B0D0A20207472616E73666F726D3A207363616C652831293B0D0A7D0D0A2E742D4D6567614D656E75207B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(566) := '612D6D656E752D666F63757365642D6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A20202D2D612D6D656E752D666F63757365642D746578742D636F6C6F723A20696E697469616C3B0D0A7D0D0A2E742D4D6567614D65';
wwv_flow_imp.g_varchar2_table(567) := '6E752D6974656D426F64792E69732D666F6375736564202E742D4D6567614D656E752D6C6162656C2C0D0A2E742D4D6567614D656E752D6974656D426F64793A686F766572202E742D4D6567614D656E752D6C6162656C207B0D0A2020636F6C6F723A20';
wwv_flow_imp.g_varchar2_table(568) := '766172282D2D75742D6C696E6B2D746578742D636F6C6F72293B0D0A7D0D0A2E742D4865616465722D6E6176202E742D4865616465722D6E61762D6C697374207B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D612D6D656E7562';
wwv_flow_imp.g_varchar2_table(569) := '61722D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E75426172207B0D0A2020626F782D736861646F773A20696E73657420302063616C6328766172282D2D612D6D656E756261722D697465';
wwv_flow_imp.g_varchar2_table(570) := '6D2D626F726465722D77696474682C2031707829202A202D3129203020766172282D2D612D6D656E756261722D6974656D2D626F726465722D636F6C6F72293B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D207B';
wwv_flow_imp.g_varchar2_table(571) := '0D0A2020626F726465722D746F702D77696474683A20303B0D0A2020626F726465722D626F74746F6D2D77696474683A20303B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D3A666F6375732D77697468696E207B';
wwv_flow_imp.g_varchar2_table(572) := '0D0A20206F75746C696E653A20766172282D2D75742D666F6375732D6F75746C696E652C206175746F2031707820766172282D2D75742D666F6375732D6F75746C696E652D636F6C6F722C202D7765626B69742D666F6375732D72696E672D636F6C6F72';
wwv_flow_imp.g_varchar2_table(573) := '29293B0D0A20206F75746C696E652D6F66667365743A202D3170783B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D202E612D4D656E754261722D6C6162656C207B0D0A20206F75746C696E653A206E6F6E653B0D';
wwv_flow_imp.g_varchar2_table(574) := '0A202077686974652D73706163653A206E6F777261703B0D0A20206D696E2D6865696768743A2063616C632863616C6328766172282D2D612D6D656E756261722D6974656D2D70616464696E672D792C2038707829202A203229202B20766172282D2D61';
wwv_flow_imp.g_varchar2_table(575) := '2D6D656E756261722D6974656D2D6C696E652D6865696768742C203136707829293B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E752D2D73706C6974202E612D4D656E754261722D6C6162656C207B0D0A202070616464696E672D696E';
wwv_flow_imp.g_varchar2_table(576) := '6C696E652D656E643A20303B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E752D2D73706C6974202E612D4D656E752D7375624D656E75436F6C207B0D0A20202D2D612D6D656E752D69636F6E2D73697A653A203172656D3B0D0A7D0D0A';
wwv_flow_imp.g_varchar2_table(577) := '2E742D4865616465722D6E6176202E612D4D656E752D2D63757272656E74207B0D0A20202D2D612D6D656E756261722D6974656D2D666F6E742D7765696768743A20766172282D2D612D626173652D666F6E742D7765696768742D626F6C642C20373030';
wwv_flow_imp.g_varchar2_table(578) := '293B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E69732D666F6375736564207B0D0A20202D2D612D6D656E756261722D6974656D2D6261636B67726F756E642D636F6C6F723A20766172282D2D612D6D656E75';
wwv_flow_imp.g_varchar2_table(579) := '6261722D6974656D2D666F63757365642D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D6D656E756261722D6974656D2D746578742D636F6C6F723A20766172282D2D612D6D656E756261722D6974656D2D666F63757365642D746578';
wwv_flow_imp.g_varchar2_table(580) := '742D636F6C6F72293B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742C0D0A2E742D547265654E6176202E612D5472656556';
wwv_flow_imp.g_varchar2_table(581) := '6965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D73656C65637465642C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D72';
wwv_flow_imp.g_varchar2_table(582) := '6F772E69732D63757272656E742D2D746F702E69732D73656C6563746564207B0D0A20206261636B67726F756E642D636F6C6F723A20233339333933393B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C';
wwv_flow_imp.g_varchar2_table(583) := '6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65203E202E612D547265';
wwv_flow_imp.g_varchar2_table(584) := '65566965772D726F772C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20206261636B67726F756E642D636F6C6F723A20233331333133313B0D0A2020636F6C6F723A202366666666';
wwv_flow_imp.g_varchar2_table(585) := '66663B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233430343034';
wwv_flow_imp.g_varchar2_table(586) := '302021696D706F7274616E743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D746F67676C';
wwv_flow_imp.g_varchar2_table(587) := '652C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D636F6E74656E742C0D0A2E742D547265654E61';
wwv_flow_imp.g_varchar2_table(588) := '76202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D746F67676C65202B202E612D54726565566965772D636F6E74656E74207B0D0A';
wwv_flow_imp.g_varchar2_table(589) := '2020636F6C6F723A20766172282D2D612D74726565766965772D6E6F64652D73656C65637465642D746578742D636F6C6F72293B0D0A7D0D0A2E612D54726565566965772D636F6E74656E742E69732D73656C6563746564203E202E6661207B0D0A2020';
wwv_flow_imp.g_varchar2_table(590) := '2D2D75742D74726565766965772D69636F6E2D6F7061636974793A20313B0D0A7D0D0A2E742D547265654E61762D2D7374796C65412C0D0A2E742D547265654E61762D2D7374796C6542207B0D0A20202D2D75742D74726565766965772D62616467652D';
wwv_flow_imp.g_varchar2_table(591) := '626F726465722D7261646975733A20312E323572656D3B0D0A20202D2D75742D74726565766965772D62616467652D666F6E742D7765696768743A20766172282D2D612D626173652D666F6E742D7765696768742D73656D69626F6C642C20353030293B';
wwv_flow_imp.g_varchar2_table(592) := '0D0A20202D2D75742D74726565766965772D69636F6E2D73697A653A20312E323572656D3B0D0A20202D2D75742D74726565766965772D746F706C6576656C2D69636F6E2D636F6E7461696E65722D77696474683A20312E373572656D3B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(593) := '75742D74726565766965772D6E6F64652D69636F6E2D73697A653A203172656D3B0D0A20202D2D75742D74726565766965772D6E6F64652D69636F6E2D636F6E7461696E65722D77696474683A20766172282D2D75742D74726565766965772D746F706C';
wwv_flow_imp.g_varchar2_table(594) := '6576656C2D69636F6E2D636F6E7461696E65722D77696474682C20312E373572656D293B0D0A20202D2D75742D74726565766965772D6E6F64652D696E64656E743A203072656D3B0D0A20202D2D75742D74726565766965772D6C6561662D6E6F64652D';
wwv_flow_imp.g_varchar2_table(595) := '696E64656E743A20302E36323572656D3B0D0A20202D2D75742D74726565766965772D746F706C6576656C2D6C6561662D70616464696E672D793A203072656D3B0D0A20202D2D612D74726565766965772D6E6F64652D70616464696E672D793A20302E';
wwv_flow_imp.g_varchar2_table(596) := '36323572656D3B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C2C0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D';
wwv_flow_imp.g_varchar2_table(597) := '746F704C6576656C20756C207B0D0A20202D2D612D74726565766965772D6E6F64652D70616464696E672D793A20302E373572656D3B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C';
wwv_flow_imp.g_varchar2_table(598) := '6576656C207B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C69642072676261283235352C203235352C203235352C20302E31293B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F6465';
wwv_flow_imp.g_varchar2_table(599) := '2D2D746F704C6576656C2E69732D636F6C6C61707369626C65207B0D0A2020636F6C6F723A20766172282D2D612D74726565766965772D6E6F64652D73656C65637465642D746578742D636F6C6F72293B0D0A7D0D0A2E742D547265654E61762D2D7374';
wwv_flow_imp.g_varchar2_table(600) := '796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64';
wwv_flow_imp.g_varchar2_table(601) := '652D2D746F704C6576656C20756C207B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D612D74726565766965772D6E6F64652D73656C65637465642D6261636B67726F756E642D636F6C6F72293B0D0A2020636F6C6F723A207661';
wwv_flow_imp.g_varchar2_table(602) := '72282D2D612D74726565766965772D6E6F64652D73656C65637465642D746578742D636F6C6F72293B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D5472656556';
wwv_flow_imp.g_varchar2_table(603) := '6965772D726F772E69732D63757272656E742D2D746F70202E612D54726565566965772D726F772E69732D73656C65637465642C0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C20';
wwv_flow_imp.g_varchar2_table(604) := '756C202E612D54726565566965772D726F772E69732D73656C6563746564207B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D75742D626F64792D6E61762D6261636B67726F756E642D636F6C6F72293B0D0A2020636F6C6F723A';
wwv_flow_imp.g_varchar2_table(605) := '20766172282D2D612D74726565766965772D6E6F64652D73656C65637465642D746578742D636F6C6F72293B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D5472';
wwv_flow_imp.g_varchar2_table(606) := '6565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E';
wwv_flow_imp.g_varchar2_table(607) := '742D2D746F70207E20756C202E612D54726565566965772D726F77207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D70616C657474652D7072696D6172792920347078203020303B0D0A7D0D0A2E752D52544C202E742D';
wwv_flow_imp.g_varchar2_table(608) := '547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E752D52544C202E742D547265654E61762D2D7374796C';
wwv_flow_imp.g_varchar2_table(609) := '6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F77207B0D0A2020626F782D736861646F773A20';
wwv_flow_imp.g_varchar2_table(610) := '696E73657420766172282D2D75742D70616C657474652D7072696D61727929202D347078203020303B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D5472656556';
wwv_flow_imp.g_varchar2_table(611) := '6965772D726F772E69732D63757272656E742D2D746F702E69732D666F63757365642C0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69';
wwv_flow_imp.g_varchar2_table(612) := '732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D70616C657474652D7072696D617279292034707820';
wwv_flow_imp.g_varchar2_table(613) := '3020302C2030203020302031707820766172282D2D75742D70616C657474652D7072696D6172792920696E7365743B0D0A7D0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C';
wwv_flow_imp.g_varchar2_table(614) := '6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D666F63757365642C0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576';
wwv_flow_imp.g_varchar2_table(615) := '656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D70';
wwv_flow_imp.g_varchar2_table(616) := '616C657474652D7072696D61727929202D347078203020302C2030203020302031707820766172282D2D75742D70616C657474652D7072696D6172792920696E7365743B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542203E20756C207B0D0A';
wwv_flow_imp.g_varchar2_table(617) := '20207472616E736974696F6E3A206D617267696E20766172282D2D75742D6C61796F75742D7472616E736974696F6E2C20302E31732920656173653B0D0A20206D617267696E3A20302E323572656D3B0D0A7D0D0A4061742D726F6F74202E6A732D6E61';
wwv_flow_imp.g_varchar2_table(618) := '76436F6C6C61707365642026207B0D0A20202D2D612D74726565766965772D6E6F64652D70616464696E672D793A20302E3572656D3B0D0A2020203E20756C207B0D0A202020206D617267696E3A20303B0D0A20207D0D0A7D0D0A2E742D547265654E61';
wwv_flow_imp.g_varchar2_table(619) := '762D2D7374796C6542202E612D54726565566965772D6E6F6465207B0D0A20206D617267696E2D626C6F636B2D73746172743A20302E323572656D3B0D0A20206D617267696E2D626C6F636B2D656E643A20302E323572656D3B0D0A7D0D0A2E742D5472';
wwv_flow_imp.g_varchar2_table(620) := '65654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C207B0D0A20206D617267696E2D696E6C696E652D73746172743A20302E323572656D3B0D0A20206D617267696E2D696E6C696E652D656E643A20302E';
wwv_flow_imp.g_varchar2_table(621) := '323572656D3B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A';
wwv_flow_imp.g_varchar2_table(622) := '2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E61762D2D7374796C6542202E';
wwv_flow_imp.g_varchar2_table(623) := '612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564207B0D0A20206261636B67726F756E642D636F6C6F723A2023633734363334';
wwv_flow_imp.g_varchar2_table(624) := '3B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564202B202E61';
wwv_flow_imp.g_varchar2_table(625) := '2D54726565566965772D746F67676C652C0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70';
wwv_flow_imp.g_varchar2_table(626) := '207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D6375727265';
wwv_flow_imp.g_varchar2_table(627) := '6E742D2D746F702E69732D686F766572207B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E';
wwv_flow_imp.g_varchar2_table(628) := '612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236361343833362021696D706F7274616E743B0D0A7D0D0A2E742D547265654E61762D2D73';
wwv_flow_imp.g_varchar2_table(629) := '74796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F77207B0D0A2020626F726465722D7261646975733A20302E323572656D3B0D0A7D0D0A2E612D4952522D6469616C6F672D2D646F77';
wwv_flow_imp.g_varchar2_table(630) := '6E6C6F61642C0D0A2E612D4952522D6469616C6F672D2D737562736372697074696F6E207B0D0A20202D2D612D69636F6E6C6973742D6974656D2D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746F6F6C';
wwv_flow_imp.g_varchar2_table(631) := '6261722D6261636B67726F756E642D636F6C6F722C207267626128302C20302C20302C20302E30323529293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578';
wwv_flow_imp.g_varchar2_table(632) := '742D64656661756C742D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D686F7665722D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A2020';
wwv_flow_imp.g_varchar2_table(633) := '2D2D612D69636F6E6C6973742D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D';
wwv_flow_imp.g_varchar2_table(634) := '2D73656C65637465642D746578742D636F6C6F723A20766172282D2D612D69636F6E6C6973742D6974656D2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D73656C65637465642D6261636B67726F';
wwv_flow_imp.g_varchar2_table(635) := '756E642D636F6C6F723A20766172282D2D612D69636F6E6C6973742D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E612D4952522D6469616C6F672D2D646F776E6C6F6164202E612D49636F6E4C6973742D6974';
wwv_flow_imp.g_varchar2_table(636) := '656D2C0D0A2E612D4952522D6469616C6F672D2D737562736372697074696F6E202E612D49636F6E4C6973742D6974656D207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F';
wwv_flow_imp.g_varchar2_table(637) := '726465722D636F6C6F72292030202D317078203020303B0D0A7D0D0A2E612D4952522D6469616C6F672D2D646F776E6C6F6164202E612D49636F6E4C6973742D6974656D2E69732D73656C65637465642C0D0A2E612D4952522D6469616C6F672D2D7375';
wwv_flow_imp.g_varchar2_table(638) := '62736372697074696F6E202E612D49636F6E4C6973742D6974656D2E69732D73656C6563746564207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D70616C657474652D7072696D61727929203020327078203020303B0D';
wwv_flow_imp.g_varchar2_table(639) := '0A7D0D0A2E612D4952522D69636F6E4C6973742D6974656D202B202E612D4952522D69636F6E4C6973742D6974656D207B0D0A2020626F726465722D6C6566742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F72';
wwv_flow_imp.g_varchar2_table(640) := '6465722D636F6C6F72293B0D0A7D0D0A2E752D52544C202E612D4952522D69636F6E4C6973742D6974656D202B202E612D4952522D69636F6E4C6973742D6974656D207B0D0A2020626F726465722D72696768742D636F6C6F723A20766172282D2D7574';
wwv_flow_imp.g_varchar2_table(641) := '2D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72293B0D0A7D0D0A2E612D4952522D726164696F49636F6E4C697374207B0D0A20202D2D612D69636F6E6C6973742D6974656D2D6261636B67726F756E642D636F6C6F723A207661';
wwv_flow_imp.g_varchar2_table(642) := '72282D2D75742D636F6D706F6E656E742D746F6F6C6261722D6261636B67726F756E642D636F6C6F722C207267626128302C20302C20302C20302E30323529293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D746578742D636F6C6F723A2076';
wwv_flow_imp.g_varchar2_table(643) := '6172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D686F7665722D746578742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578';
wwv_flow_imp.g_varchar2_table(644) := '742D64656661756C742D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F72293B';
wwv_flow_imp.g_varchar2_table(645) := '0D0A20202D2D612D69636F6E6C6973742D6974656D2D73656C65637465642D746578742D636F6C6F723A20766172282D2D612D69636F6E6C6973742D6974656D2D686F7665722D746578742D636F6C6F72293B0D0A20202D2D612D69636F6E6C6973742D';
wwv_flow_imp.g_varchar2_table(646) := '6974656D2D73656C65637465642D6261636B67726F756E642D636F6C6F723A20766172282D2D612D69636F6E6C6973742D6974656D2D686F7665722D6261636B67726F756E642D636F6C6F72293B0D0A7D0D0A2E612D4952522D726164696F49636F6E4C';
wwv_flow_imp.g_varchar2_table(647) := '6973742D6974656D202B202E612D4952522D726164696F49636F6E4C6973742D6974656D207B0D0A2020626F726465722D6C6566742D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72293B';
wwv_flow_imp.g_varchar2_table(648) := '0D0A7D0D0A2E752D52544C202E612D4952522D726164696F49636F6E4C6973742D6974656D202B202E612D4952522D726164696F49636F6E4C6973742D6974656D207B0D0A2020626F726465722D72696768742D636F6C6F723A20766172282D2D75742D';
wwv_flow_imp.g_varchar2_table(649) := '636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72293B0D0A7D0D0A2E612D4952522D726164696F49636F6E4C6973742D6974656D20696E7075745B747970653D726164696F5D202B206C6162656C207B0D0A2020626F782D73686164';
wwv_flow_imp.g_varchar2_table(650) := '6F773A20696E73657420766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72292030202D317078203020303B0D0A7D0D0A2E612D4952522D726164696F49636F6E4C6973742D6974656D20696E7075745B747970';
wwv_flow_imp.g_varchar2_table(651) := '653D726164696F5D3A636865636B6564202B206C6162656C207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D70616C657474652D7072696D61727929203020327078203020303B0D0A7D0D0A2E612D4952522D6469616C';
wwv_flow_imp.g_varchar2_table(652) := '6F67496E666F3A66697273742D6368696C64207B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D696E6E65722D626F726465722D636F6C6F72293B0D0A7D0D0A2E612D49472D627574746F';
wwv_flow_imp.g_varchar2_table(653) := '6E2E612D49472D627574746F6E2D2D636F6E74726F6C732C0D0A2E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D636F6E74726F6C73207B0D0A20202D2D612D627574746F6E2D6261636B67726F756E642D636F6C6F723A20233466';
wwv_flow_imp.g_varchar2_table(654) := '346434633B0D0A7D0D0A2E612D4952522D6469616C6F67526F772D2D6865616465722C0D0A2E612D4952522D6469616C6F674C6973742061207B0D0A2020636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C74';
wwv_flow_imp.g_varchar2_table(655) := '2D636F6C6F72293B0D0A7D0D0A2E612D4952522D6469616C6F674C697374207B0D0A2020626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A7D0D0A2E612D4952522D686967686C';
wwv_flow_imp.g_varchar2_table(656) := '6967687450726576696577207B0D0A2020626F782D736861646F773A20696E73657420766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F7229203020302030203170783B0D0A7D0D0A2E612D4952522D686561646572207B0D0A';
wwv_flow_imp.g_varchar2_table(657) := '20206261636B67726F756E642D636F6C6F723A20233263323832353B0D0A7D0D0A2E612D4952522D6865616465723A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233334333032633B0D0A7D0D0A2E612D4952522D68656164';
wwv_flow_imp.g_varchar2_table(658) := '65722E69732D6163746976652C0D0A2E612D47562D6865616465722E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D612D6D656E752D6261636B67726F756E642D636F6C6F72293B0D0A2020636F6C6F';
wwv_flow_imp.g_varchar2_table(659) := '723A20766172282D2D612D6D656E752D746578742D636F6C6F72293B0D0A7D0D0A2E612D4952522D6865616465722D2D67726F7570207B0D0A20206261636B67726F756E642D636F6C6F723A20233331326432613B0D0A7D0D0A2E612D4952522D736F72';
wwv_flow_imp.g_varchar2_table(660) := '745769646765742D7365617263684C6162656C3A6265666F7265207B0D0A2020636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A7D0D0A2E612D4952522D736F72745769646765742D73';
wwv_flow_imp.g_varchar2_table(661) := '6561726368203E202E612D4952522D736F72745769646765742D7365617263684669656C645B747970653D2274657874225D207B0D0A2020636F6C6F723A20766172282D2D612D6669656C642D696E7075742D73746174652D746578742D636F6C6F722C';
wwv_flow_imp.g_varchar2_table(662) := '20766172282D2D612D6669656C642D696E7075742D746578742D636F6C6F7229293B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D73746174652D6261636B67726F756E642D636F6C6F722C20';
wwv_flow_imp.g_varchar2_table(663) := '766172282D2D612D6669656C642D696E7075742D6261636B67726F756E642D636F6C6F7229293B0D0A7D0D0A2E612D47562D7461626C652074682E612D47562D636F6E74726F6C427265616B486561646572207B0D0A20206261636B67726F756E642D63';
wwv_flow_imp.g_varchar2_table(664) := '6F6C6F723A20233331326432613B0D0A2020626F726465722D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A2020636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D746578742D';
wwv_flow_imp.g_varchar2_table(665) := '6D757465642D636F6C6F72293B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D73617665645265706F72742C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D73617665645265706F72742C0D0A2E612D4952522D';
wwv_flow_imp.g_varchar2_table(666) := '7265706F727453756D6D6172792D6974656D2D2D73617665645265706F72742C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D73617665645265706F7274207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C61';
wwv_flow_imp.g_varchar2_table(667) := '62656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233441413445433B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233066353638';
wwv_flow_imp.g_varchar2_table(668) := '653B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D7365617263682C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D7365617263682C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D73';
wwv_flow_imp.g_varchar2_table(669) := '65617263682C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D736561726368207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A2023344141';
wwv_flow_imp.g_varchar2_table(670) := '3445433B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233066353638653B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D';
wwv_flow_imp.g_varchar2_table(671) := '2D2D66696C7465722C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D66696C7465722C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D66696C7465722C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D66';
wwv_flow_imp.g_varchar2_table(672) := '696C746572207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233234434237463B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C';
wwv_flow_imp.g_varchar2_table(673) := '6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233064343932653B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D636F6E74726F6C427265616B2C0D0A2E612D49472D636F6E74726F6C73';
wwv_flow_imp.g_varchar2_table(674) := '2D6974656D2D2D636F6E74726F6C427265616B2C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D636F6E74726F6C427265616B2C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D636F6E74726F6C427265616B207B';
wwv_flow_imp.g_varchar2_table(675) := '0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233342383342443B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C';
wwv_flow_imp.g_varchar2_table(676) := '2D686F7665722D6261636B67726F756E642D636F6C6F723A20233134326434313B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D67726F757042792C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D67726F7570';
wwv_flow_imp.g_varchar2_table(677) := '42792C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D67726F757042792C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D67726F75704279207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C';
wwv_flow_imp.g_varchar2_table(678) := '6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233342383342443B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A202331';
wwv_flow_imp.g_varchar2_table(679) := '34326434313B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D6167677265676174652C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D6167677265676174652C0D0A2E612D4952522D7265706F727453756D6D61';
wwv_flow_imp.g_varchar2_table(680) := '72792D6974656D2D2D6167677265676174652C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D616767726567617465207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B6772';
wwv_flow_imp.g_varchar2_table(681) := '6F756E642D636F6C6F723A20233342383342443B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233134326434313B0D0A7D0D0A2E612D49472D7265';
wwv_flow_imp.g_varchar2_table(682) := '706F727453756D6D6172792D6974656D2D2D686967686C696768742C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D686967686C696768742C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D686967686C696768742C';
wwv_flow_imp.g_varchar2_table(683) := '0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D686967686C69676874207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A2023464642453241';
wwv_flow_imp.g_varchar2_table(684) := '3B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233836356430303B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D66';
wwv_flow_imp.g_varchar2_table(685) := '6C6173686261636B2C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D666C6173686261636B2C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D666C6173686261636B2C0D0A2E612D4952522D636F6E74726F6C732D69';
wwv_flow_imp.g_varchar2_table(686) := '74656D2D2D666C6173686261636B207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233945413741443B0D0A20202D2D612D7265706F72742D636F6E';
wwv_flow_imp.g_varchar2_table(687) := '74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233265333433373B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D63686172742C0D0A2E612D49472D636F6E74726F';
wwv_flow_imp.g_varchar2_table(688) := '6C732D6974656D2D2D63686172742C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D63686172742C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D6368617274207B0D0A20202D2D612D7265706F72742D636F6E74';
wwv_flow_imp.g_varchar2_table(689) := '726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C6F723A20233342383342443B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D63';
wwv_flow_imp.g_varchar2_table(690) := '6F6C6F723A20233034306130653B0D0A7D0D0A2E612D49472D7265706F727453756D6D6172792D6974656D2D2D7069766F742C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D7069766F742C0D0A2E612D4952522D7265706F727453756D6D61';
wwv_flow_imp.g_varchar2_table(691) := '72792D6974656D2D2D7069766F742C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D7069766F74207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E642D636F6C';
wwv_flow_imp.g_varchar2_table(692) := '6F723A20233945413741443B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233265333433373B0D0A7D0D0A2E612D49472D7265706F727453756D6D';
wwv_flow_imp.g_varchar2_table(693) := '6172792D6974656D2D2D696E76616C696453657474696E67732C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D696E76616C696453657474696E67732C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D2D696E76616C69';
wwv_flow_imp.g_varchar2_table(694) := '6453657474696E67732C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D696E76616C696453657474696E6773207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D6261636B67726F756E';
wwv_flow_imp.g_varchar2_table(695) := '642D636F6C6F723A20234244433343373B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233439353135363B0D0A7D0D0A2E612D49472D7265706F72';
wwv_flow_imp.g_varchar2_table(696) := '7453756D6D6172792D6974656D2D2D696E61637469766553657474696E67732C0D0A2E612D49472D636F6E74726F6C732D6974656D2D2D696E61637469766553657474696E67732C0D0A2E612D4952522D7265706F727453756D6D6172792D6974656D2D';
wwv_flow_imp.g_varchar2_table(697) := '2D696E61637469766553657474696E67732C0D0A2E612D4952522D636F6E74726F6C732D6974656D2D2D696E61637469766553657474696E6773207B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D69636F6E2D';
wwv_flow_imp.g_varchar2_table(698) := '6261636B67726F756E642D636F6C6F723A20234244433343373B0D0A20202D2D612D7265706F72742D636F6E74726F6C732D63656C6C2D6C6162656C2D686F7665722D6261636B67726F756E642D636F6C6F723A20233439353135363B0D0A7D0D0A2E61';
wwv_flow_imp.g_varchar2_table(699) := '2D47562D7461626C65202E612D47562D63656C6C2E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20233139313931393B0D0A7D0D0A2E612D47562D2D656469744D6F6465202E612D47562D726F772E69732D72656164';
wwv_flow_imp.g_varchar2_table(700) := '6F6E6C79202E612D47562D63656C6C2C0D0A2E612D47562D2D656469744D6F6465202E612D47562D63656C6C2E69732D726561646F6E6C79207B0D0A20206261636B67726F756E642D636F6C6F723A20233064306430643B0D0A2020636F6C6F723A2076';
wwv_flow_imp.g_varchar2_table(701) := '6172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A7D0D0A2E612D47562D63656C6C202E612D47562D636F6C756D6E4974656D20696E7075743A6E6F74285B747970653D22726164696F225D293A6E6F74285B';
wwv_flow_imp.g_varchar2_table(702) := '747970653D22636865636B626F78225D293A666F6375732C0D0A2E612D47562D63656C6C202E612D47562D636F6C756D6E4974656D2073656C6563745B73697A653D2731275D3A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_imp.g_varchar2_table(703) := '233030303B0D0A7D0D0A2E612D436869702D72656D6F7665207B0D0A20206D617267696E2D696E6C696E652D656E643A2063616C6328766172282D2D612D636869702D6C6162656C2D73706163696E672C2034707829202F2032293B0D0A7D0D0A3A726F';
wwv_flow_imp.g_varchar2_table(704) := '6F74207B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D7072696D6172793A20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F72293B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F';
wwv_flow_imp.g_varchar2_table(705) := '722D7365636F6E646172793A20766172282D2D75742D636F6D706F6E656E742D746578742D6D757465642D636F6C6F72293B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D6272616E643A20766172282D2D75742D70616C657474652D70';
wwv_flow_imp.g_varchar2_table(706) := '72696D6172792D74657874293B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D64616E6765723A20766172282D2D75742D70616C657474652D64616E6765722D74657874293B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F72';
wwv_flow_imp.g_varchar2_table(707) := '2D7761726E696E673A20766172282D2D75742D70616C657474652D7761726E696E672D74657874293B0D0A20202D2D6F6A2D636F72652D746578742D636F6C6F722D737563636573733A20766172282D2D75742D70616C657474652D737563636573732D';
wwv_flow_imp.g_varchar2_table(708) := '74657874293B0D0A20202D2D6F6A2D636F72652D69636F6E2D73697A652D6C673A20312E3572656D3B0D0A20202D2D6F6A2D636F72652D69636F6E2D73697A652D736D3A203172656D3B0D0A20202D2D6F6A2D636F72652D646976696465722D636F6C6F';
wwv_flow_imp.g_varchar2_table(709) := '723A20766172282D2D75742D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D6F6A2D636F72652D646976696465722D6D617267696E3A20302E3572656D3B0D0A20202D2D6F6A2D636F72652D666F6375732D626F726465722D';
wwv_flow_imp.g_varchar2_table(710) := '636F6C6F723A20766172282D2D75742D666F6375732D6F75746C696E652D636F6C6F72293B0D0A20202D2D6F6A2D636F6C6F722D737065637472756D2D626F726465722D636F6C6F723A20233333333333333B0D0A20202D2D6F6A2D706F7075702D6267';
wwv_flow_imp.g_varchar2_table(711) := '2D636F6C6F723A20766172282D2D612D6D656E752D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A2D636F72652D62672D636F6C6F722D686F7665723A20766172282D2D612D6D656E752D666F63757365642D6261636B67726F756E64';
wwv_flow_imp.g_varchar2_table(712) := '2D636F6C6F72293B0D0A20202D2D6F6A2D636F72652D626F782D736861646F773A20766172282D2D75742D736861646F772D736D293B0D0A20202D2D6F6A2D6C696E6B2D746578742D636F6C6F723A20766172282D2D75742D6C696E6B2D746578742D63';
wwv_flow_imp.g_varchar2_table(713) := '6F6C6F72293B0D0A20202D2D6F6A2D746578742D6669656C642D62672D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A2D746578742D6669656C642D626F72646572';
wwv_flow_imp.g_varchar2_table(714) := '2D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D626F726465722D636F6C6F72293B0D0A20202D2D6F6A2D746578742D6669656C642D746578742D636F6C6F723A20766172282D2D612D6669656C642D696E7075742D746578742D63';
wwv_flow_imp.g_varchar2_table(715) := '6F6C6F72293B0D0A20202D2D6F6A2D636F6C6C656374696F6E2D667265652D73706163652D62672D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A2D636F6C6C656374';
wwv_flow_imp.g_varchar2_table(716) := '696F6E2D6865616465722D62672D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A2D636F6C6C656374696F6E2D626F726465722D636F6C6F723A20766172282D2D7574';
wwv_flow_imp.g_varchar2_table(717) := '2D636F6D706F6E656E742D626F726465722D636F6C6F72293B0D0A20202D2D6F6A2D636F6C6C656374696F6E2D62672D636F6C6F723A20766172282D2D75742D636F6D706F6E656E742D6261636B67726F756E642D636F6C6F72293B0D0A20202D2D6F6A';
wwv_flow_imp.g_varchar2_table(718) := '2D707269766174652D67616E74742D6D696C6573746F6E652D62672D636F6C6F723A20766172282D2D752D636F6C6F722D3135293B0D0A20202D2D6F6A2D707269766174652D67616E74742D7461736B2D62672D636F6C6F723A20766172282D2D752D63';
wwv_flow_imp.g_varchar2_table(719) := '6F6C6F722D31293B0D0A20202D2D6F6A2D707269766174652D67616E74742D7461736B2D70726F67726573732D62672D636F6C6F723A20766172282D2D752D636F6C6F722D31293B0D0A20202D2D6F6A2D627574746F6E2D6F75746C696E65642D636872';
wwv_flow_imp.g_varchar2_table(720) := '6F6D652D62672D636F6C6F722D686F7665723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D6F6A2D627574746F6E2D6F75746C696E65642D6368726F6D652D626F726465722D636F6C6F722D686F7665723A207661';
wwv_flow_imp.g_varchar2_table(721) := '72282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D6F6A2D627574746F6E2D6F75746C696E65642D6368726F6D652D746578742D636F6C6F722D686F7665723A20766172282D2D75742D70616C657474652D7072696D6172792D63';
wwv_flow_imp.g_varchar2_table(722) := '6F6E7472617374293B0D0A20202D2D6F6A2D627574746F6E2D626F726465726C6573732D6368726F6D652D62672D636F6C6F722D686F7665723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D6F6A2D627574746F6E';
wwv_flow_imp.g_varchar2_table(723) := '2D626F726465726C6573732D6368726F6D652D746578742D636F6C6F722D686F7665723A20766172282D2D75742D70616C657474652D7072696D6172792D636F6E7472617374293B0D0A20202D2D6F6A2D68656164696E672D746578742D636F6C6F723A';
wwv_flow_imp.g_varchar2_table(724) := '20766172282D2D75742D636F6D706F6E656E742D746578742D7469746C652D636F6C6F72293B0D0A7D0D0A2E6F6A2D6C697374626F782D64726F703A6E6F74282E6F6A2D6C697374626F782D686964652D686F76657229202E6F6A2D6C697374626F782D';
wwv_flow_imp.g_varchar2_table(725) := '726573756C7473202E6F6A2D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D612D6D656E752D666F63757365642D6261636B67726F756E642D636F6C6F72293B0D0A2020636F6C6F723A20766172282D2D612D6D';
wwv_flow_imp.g_varchar2_table(726) := '656E752D666F63757365642D746578742D636F6C6F72293B0D0A7D0D0A2E6F6A2D6C697374626F782D726573756C74732C0D0A2E6F6A2D6C697374626F782D726573756C74732D626173652C0D0A2E6F6A2D73656C6563742D726573756C7473207B0D0A';
wwv_flow_imp.g_varchar2_table(727) := '20206D617267696E3A20303B0D0A7D0D0A2E6F6A2D6C697374626F782D64726F70207B0D0A202070616464696E672D626C6F636B2D73746172743A2063616C6328766172282D2D612D6D656E752D70616464696E672D792C20302E3572656D29202D2076';
wwv_flow_imp.g_varchar2_table(728) := '6172282D2D612D6D656E752D626F726465722D77696474682C2031707829293B0D0A202070616464696E672D626C6F636B2D656E643A2063616C6328766172282D2D612D6D656E752D70616464696E672D792C20302E3572656D29202D20766172282D2D';
wwv_flow_imp.g_varchar2_table(729) := '612D6D656E752D626F726465722D77696474682C2031707829293B0D0A202070616464696E672D696E6C696E652D73746172743A2063616C6328766172282D2D612D6D656E752D70616464696E672D782C203072656D29202D20766172282D2D612D6D65';
wwv_flow_imp.g_varchar2_table(730) := '6E752D626F726465722D77696474682C2031707829293B0D0A202070616464696E672D696E6C696E652D656E643A2063616C6328766172282D2D612D6D656E752D70616464696E672D782C203072656D29202D20766172282D2D612D6D656E752D626F72';
wwv_flow_imp.g_varchar2_table(731) := '6465722D77696474682C2031707829293B0D0A2020626F726465722D7261646975733A20766172282D2D612D6D656E752D626F726465722D7261646975732C20302E323572656D293B0D0A2020626F726465722D636F6C6F723A20766172282D2D612D6D';
wwv_flow_imp.g_varchar2_table(732) := '656E752D626F726465722D636F6C6F72293B0D0A2020626F726465722D77696474683A20766172282D2D612D6D656E752D626F726465722D77696474682C20317078293B0D0A2020626F726465722D7374796C653A20736F6C69643B0D0A2020626F782D';
wwv_flow_imp.g_varchar2_table(733) := '736861646F773A20766172282D2D612D6D656E752D736861646F77293B0D0A20206D696E2D6865696768743A2063616C6328766172282D2D612D6D656E752D6C696E652D6865696768742C203172656D29202B2028766172282D2D612D6D656E752D7061';
wwv_flow_imp.g_varchar2_table(734) := '6464696E672D792C20302E3572656D29202A203229293B0D0A2020636F6C6F723A20766172282D2D612D6D656E752D746578742D636F6C6F72293B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D612D6D656E752D6261636B6772';
wwv_flow_imp.g_varchar2_table(735) := '6F756E642D636F6C6F72293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E646172207B0D0A2020666F6E742D73697A653A20766172282D2D6A75692D646174657069636B65722D666F6E742D73697A652C20302E3638373572656D293B';
wwv_flow_imp.g_varchar2_table(736) := '0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E646172207468207B0D0A2020636F6C6F723A20766172282D2D6A75692D646174657069636B65722D6865616465722C2023363636293B0D0A2020626F726465722D626F74746F6D2D737479';
wwv_flow_imp.g_varchar2_table(737) := '6C653A20736F6C69643B0D0A2020626F726465722D626F74746F6D2D77696474683A20766172282D2D6A75692D646174657069636B65722D626F726465722D77696474682C20317078293B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A20';
wwv_flow_imp.g_varchar2_table(738) := '766172282D2D75742D646174657069636B65722D626F726465722D636F6C6F722C207267626128302C20302C20302C20302E3129293B0D0A202070616464696E672D626C6F636B2D73746172743A20766172282D2D6A75692D646174657069636B65722D';
wwv_flow_imp.g_varchar2_table(739) := '70616464696E672D792C20302E3572656D293B0D0A202070616464696E672D696E6C696E652D656E643A20766172282D2D6A75692D646174657069636B65722D70616464696E672D782C20302E3572656D293B0D0A202070616464696E672D626C6F636B';
wwv_flow_imp.g_varchar2_table(740) := '2D656E643A20766172282D2D6A75692D646174657069636B65722D70616464696E672D792C20302E3572656D293B0D0A202070616464696E672D696E6C696E652D73746172743A20766172282D2D6A75692D646174657069636B65722D70616464696E67';
wwv_flow_imp.g_varchar2_table(741) := '2D782C20302E3572656D293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E646172207464207B0D0A202077696474683A20766172282D2D6A75692D646174657069636B65722D646174652D73697A652C203372656D293B0D0A20206865';
wwv_flow_imp.g_varchar2_table(742) := '696768743A20766172282D2D6A75692D646174657069636B65722D646174652D73697A652C203372656D293B0D0A20206D617267696E3A20766172282D2D6A75692D646174657069636B65722D646174652D6D617267696E2C20302E31323572656D293B';
wwv_flow_imp.g_varchar2_table(743) := '0D0A20206C696E652D6865696768743A20766172282D2D6A75692D646174657069636B65722D646174652D73697A652C203372656D293B0D0A2020626F726465722D7261646975733A20766172282D2D6A75692D646174657069636B65722D646174652D';
wwv_flow_imp.g_varchar2_table(744) := '626F726465722D7261646975732C2031303025293B0D0A20206261636B67726F756E642D636F6C6F723A20766172282D2D6A75692D646174657069636B65722D646174652D6261636B67726F756E642D636F6C6F722C207472616E73706172656E74293B';
wwv_flow_imp.g_varchar2_table(745) := '0D0A2020636F6C6F723A20766172282D2D6A75692D646174657069636B65722D646174652D636F6C6F722C20766172282D2D75742D636F6D706F6E656E742D746578742D64656661756C742D636F6C6F7229293B0D0A20207472616E736974696F6E3A20';
wwv_flow_imp.g_varchar2_table(746) := '766172282D2D6A75692D646174657069636B65722D646174652D7472616E736974696F6E2C206261636B67726F756E642D636F6C6F7220302E31732C20636F6C6F7220302E3173293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E6461';
wwv_flow_imp.g_varchar2_table(747) := '722074643A666F637573207B0D0A20206F75746C696E653A20303B0D0A2020626F782D736861646F773A20766172282D2D6A75692D646174657069636B65722D646174652D666F6375732D626F782D736861646F772C2033352030203020317078202330';
wwv_flow_imp.g_varchar2_table(748) := '303736646620696E7365742C203020302031707820327078207267626128302C203131382C203232332C20302E323529292021696D706F7274616E743B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E64617220746420612E6F6A2D7365';
wwv_flow_imp.g_varchar2_table(749) := '6C65637465642C0D0A2E6F6A2D646174657069636B65722D63616C656E6461722074642E6F6A2D646174657069636B65722D746F64617920612E6F6A2D73656C6563746564207B0D0A20202D2D6A75692D646174657069636B65722D646174652D626163';
wwv_flow_imp.g_varchar2_table(750) := '6B67726F756E642D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D617279293B0D0A20202D2D6A75692D646174657069636B65722D646174652D636F6C6F723A20766172282D2D75742D70616C657474652D7072696D6172792D63';
wwv_flow_imp.g_varchar2_table(751) := '6F6E7472617374293B0D0A2020666F6E742D7765696768743A20766172282D2D6A75692D646174657069636B65722D73656C65637465642D666F6E742D7765696768742C20373030293B0D0A2020666F6E742D73697A653A20766172282D2D6A75692D64';
wwv_flow_imp.g_varchar2_table(752) := '6174657069636B65722D6163746976652D666F6E742D73697A652C20302E38373572656D293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E646172202E6F6A2D656E61626C65642E6F6A2D686F766572207B0D0A20206261636B67726F';
wwv_flow_imp.g_varchar2_table(753) := '756E642D636F6C6F723A20766172282D2D6A75692D646174657069636B65722D686F7665722D6261636B67726F756E642D636F6C6F722C2023653865386538293B0D0A2020636F6C6F723A20766172282D2D6A75692D646174657069636B65722D686F76';
wwv_flow_imp.g_varchar2_table(754) := '65722D636F6C6F722C20626C61636B293B0D0A7D0D0A2E6F6A2D646174657069636B65722D63616C656E646172202E6F6A2D646174657069636B65722D6E6578742D69636F6E3A6E6F74282E6F6A2D64697361626C6564292E6F6A2D686F7665722C0D0A';
wwv_flow_imp.g_varchar2_table(755) := '2E6F6A2D646174657069636B65722D63616C656E646172202E6F6A2D646174657069636B65722D707265762D69636F6E3A6E6F74282E6F6A2D64697361626C6564292E6F6A2D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A2076';
wwv_flow_imp.g_varchar2_table(756) := '6172282D2D6A75692D646174657069636B65722D686F7665722D6261636B67726F756E642D636F6C6F722C2023653865386538293B0D0A2020636F6C6F723A20766172282D2D6A75692D646174657069636B65722D686F7665722D636F6C6F722C20626C';
wwv_flow_imp.g_varchar2_table(757) := '61636B293B0D0A7D0D0A3A726F6F74207B0D0A20202D2D75742D626173652D66696C7465723A20696E766572742831293B0D0A20202D2D707269736D2D636F6D6D656E743A20233641393935353B0D0A20202D2D707269736D2D737472696E673A202343';
wwv_flow_imp.g_varchar2_table(758) := '45393137383B0D0A20202D2D707269736D2D6C69746572616C3A20233943444346453B0D0A20202D2D707269736D2D6B6579776F72643A20234335383643303B0D0A20202D2D707269736D2D66756E6374696F6E3A20234443444341413B0D0A20202D2D';
wwv_flow_imp.g_varchar2_table(759) := '707269736D2D64656C657465643A20234345393137383B0D0A20202D2D707269736D2D636C6173733A20233445433942303B0D0A20202D2D707269736D2D6275696C74696E3A20234443444341413B0D0A20202D2D707269736D2D70726F70657274793A';
wwv_flow_imp.g_varchar2_table(760) := '20233943444346453B0D0A20202D2D707269736D2D6E616D6573706163653A20233445433942303B0D0A20202D2D707269736D2D6E756D6265723A20234235434541383B0D0A7D0D0A';
null;
end;
/
begin
wwv_flow_imp_shared.create_theme_file(
 p_id=>wwv_flow_imp.id(22242383810902501327)
,p_theme_id=>42
,p_file_name=>'22242383430537501314.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241221998747055006)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'PAGE'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241222912535055010)
,p_theme_id=>42
,p_name=>'PAGE_POSITION'
,p_display_name=>'Position'
,p_display_sequence=>1
,p_template_types=>'PAGE'
,p_help_text=>'Sets the position of the page.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241441482031055033)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND'
,p_display_name=>'Page Background'
,p_display_sequence=>20
,p_template_types=>'PAGE'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241442232124055035)
,p_theme_id=>42
,p_name=>'PAGE_LAYOUT'
,p_display_name=>'Page Layout'
,p_display_sequence=>10
,p_template_types=>'PAGE'
,p_null_text=>'Floating (Default)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241453740531055057)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241454177468055057)
,p_theme_id=>42
,p_name=>'ALERT_TITLE'
,p_display_name=>'Alert Title'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the title of the alert is displayed.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241454733414055058)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241455188770055058)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241460876595055065)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241465132993055073)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241465978832055075)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241467166786055077)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241468368715055078)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241468728502055078)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241470597874055081)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241472381539055083)
,p_theme_id=>42
,p_name=>'IMAGE_FILTER'
,p_display_name=>'Filter'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241473925020055084)
,p_theme_id=>42
,p_name=>'IMAGE_RATIO'
,p_display_name=>'Ratio'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241475103348055084)
,p_theme_id=>42
,p_name=>'IMAGE_SCALE'
,p_display_name=>'Scale'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241476166701055085)
,p_theme_id=>42
,p_name=>'IMAGE_SHAPE'
,p_display_name=>'Shape'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241479576817055088)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241480961399055090)
,p_theme_id=>42
,p_name=>'REGION_POSITION'
,p_display_name=>'Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241484498700055093)
,p_theme_id=>42
,p_name=>'CALLOUT_POSITION'
,p_display_name=>'Callout Position'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Determines where the callout for the popup will be positioned relative to its parent.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241499989985055113)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241500381395055113)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241501123633055114)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241505513691055120)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241505909963055121)
,p_theme_id=>42
,p_name=>'HEADING_FONT'
,p_display_name=>'Heading Font'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the font-family of the heading for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241510039594055127)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241517911900055135)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241518340104055135)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_ICON_POSITION'
,p_display_name=>'Collapsible Icon Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the position of the expand and collapse toggle for the region.'
,p_null_text=>'Start'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241519158687055136)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_BUTTON_ICONS'
,p_display_name=>'Collapsible Button Icons'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines which arrows to use to represent the icons for the collapse and expand button.'
,p_null_text=>'Arrows'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241523717094055143)
,p_theme_id=>42
,p_name=>'BODY_STYLE'
,p_display_name=>'Body Style'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the region''s body container.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241530494787055153)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON'
,p_display_name=>'Display Icon'
,p_display_sequence=>50
,p_template_types=>'REGION'
,p_help_text=>'Display the Hero Region icon.'
,p_null_text=>'Yes (Default)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241531254469055154)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REGION'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Rounded Corners'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241533983048055157)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER'
,p_display_name=>'Login Header'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the Login region header.'
,p_null_text=>'Icon and Title (Default)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241536417484055159)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241537668136055165)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241538072335055166)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241540030329055167)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the overall style for the component.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241541814345055170)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241543648492055172)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>70
,p_template_types=>'REPORT'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241544495649055173)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241545890566055174)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REPORT'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241547006801055175)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241548202544055177)
,p_theme_id=>42
,p_name=>'DISPLAY_ITEMS'
,p_display_name=>'Display Items'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_null_text=>'Inline (Default)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241548711223055178)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS'
,p_display_name=>'Display Labels'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_null_text=>'Inline (Default)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241549328918055180)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241549994313055181)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241550314204055181)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241552196319055185)
,p_theme_id=>42
,p_name=>'COL_ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>150
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241552536821055186)
,p_theme_id=>42
,p_name=>'CONTENT_ALIGNMENT'
,p_display_name=>'Content Alignment'
,p_display_sequence=>90
,p_template_types=>'REPORT'
,p_null_text=>'Center (Default)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241552955392055186)
,p_theme_id=>42
,p_name=>'COL_CONTENT_DESCRIPTION'
,p_display_name=>'Description'
,p_display_sequence=>130
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241553359538055187)
,p_theme_id=>42
,p_name=>'COL_ICON'
,p_display_name=>'Icon'
,p_display_sequence=>110
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241553703361055187)
,p_theme_id=>42
,p_name=>'COL_MISC'
,p_display_name=>'Misc'
,p_display_sequence=>140
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241554167697055188)
,p_theme_id=>42
,p_name=>'COL_SELECTION'
,p_display_name=>'Selection'
,p_display_sequence=>100
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241554793150055188)
,p_theme_id=>42
,p_name=>'COL_CONTENT_TITLE'
,p_display_name=>'Title'
,p_display_sequence=>120
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241557152110055193)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>35
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241558728046055195)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241562593794055205)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241563735979055206)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241564983300055207)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241566714178055209)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241568759894055211)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>80
,p_template_types=>'LIST'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241569316861055211)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241570777433055212)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'LIST'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241573588655055215)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241576711477055219)
,p_theme_id=>42
,p_name=>'MOBILE'
,p_display_name=>'Mobile'
,p_display_sequence=>100
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a mobile-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241577394701055219)
,p_theme_id=>42
,p_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_sequence=>90
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a desktop-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241579169996055221)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241582977452055226)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241585726516055231)
,p_theme_id=>42
,p_name=>'COLLAPSE_STYLE'
,p_display_name=>'Collapse Mode'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241588388589055240)
,p_theme_id=>42
,p_name=>'REQUIRED_INDICATOR'
,p_display_name=>'Required Indicator'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241590196749055248)
,p_theme_id=>42
,p_name=>'ICON_HOVER_ANIMATION'
,p_display_name=>'Icon Hover Animation'
,p_display_sequence=>55
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241591462383055250)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241594343226055290)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241594953111055292)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241595387667055292)
,p_theme_id=>42
,p_name=>'RADIO_GROUP_DISPLAY'
,p_display_name=>'Item Group Display'
,p_display_sequence=>300
,p_template_types=>'FIELD'
,p_help_text=>'Determines the display style for radio and check box items.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241595772660055293)
,p_theme_id=>42
,p_name=>'BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the bottom margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241596753061055294)
,p_theme_id=>42
,p_name=>'LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the left margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241597837559055295)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241598281679055295)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Spacing'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241598628653055295)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241599647402055296)
,p_theme_id=>42
,p_name=>'RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'FIELD'
,p_help_text=>'Set the right margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241600696646055297)
,p_theme_id=>42
,p_name=>'TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'FIELD'
,p_help_text=>'Set the top margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241601608224055298)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241603013822055301)
,p_theme_id=>42
,p_name=>'PAGINATION_DISPLAY'
,p_display_name=>'Pagination Display'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of pagination for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241603430108055301)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241603884831055302)
,p_theme_id=>42
,p_name=>'SPACING_BOTTOM'
,p_display_name=>'Spacing Bottom'
,p_display_sequence=>100
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the bottom of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241604205914055302)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241604641977055302)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241605093461055303)
,p_theme_id=>42
,p_name=>'SPACING_TOP'
,p_display_name=>'Spacing Top'
,p_display_sequence=>90
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the top of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241605439118055303)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241606026744055304)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241606848278055305)
,p_theme_id=>42
,p_name=>'ITEM_POST_TEXT'
,p_display_name=>'Item Post Text'
,p_display_sequence=>30
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Post Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241607222542055305)
,p_theme_id=>42
,p_name=>'ITEM_PRE_TEXT'
,p_display_name=>'Item Pre Text'
,p_display_sequence=>20
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Pre Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241607821851055306)
,p_theme_id=>42
,p_name=>'REGION_BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>210
,p_template_types=>'REGION'
,p_help_text=>'Set the bottom margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241608866215055308)
,p_theme_id=>42
,p_name=>'CONTENT_PADDING'
,p_display_name=>'Content Padding'
,p_display_sequence=>1
,p_template_types=>'PAGE'
,p_help_text=>'Sets the Content Body padding for the page.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241609289468055308)
,p_theme_id=>42
,p_name=>'REGION_LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'REGION'
,p_help_text=>'Set the left margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241610290855055309)
,p_theme_id=>42
,p_name=>'REGION_RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'REGION'
,p_help_text=>'Set the right margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241611243768055311)
,p_theme_id=>42
,p_name=>'REGION_TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'REGION'
,p_help_text=>'Set the top margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241612263814055312)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241613881238055314)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(22241614293084055314)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241222126241055008)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_EXTRA_LARGE'
,p_display_name=>'Extra Large'
,p_display_sequence=>40
,p_page_template_id=>wwv_flow_imp.id(22241220559988054981)
,p_css_classes=>'js-dialog-class-t-Drawer--xl'
,p_group_id=>wwv_flow_imp.id(22241221998747055006)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241222399532055009)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_page_template_id=>wwv_flow_imp.id(22241220559988054981)
,p_css_classes=>'js-dialog-class-t-Drawer--lg'
,p_group_id=>wwv_flow_imp.id(22241221998747055006)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241222553189055009)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(22241220559988054981)
,p_css_classes=>'js-dialog-class-t-Drawer--md'
,p_group_id=>wwv_flow_imp.id(22241221998747055006)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241222700017055010)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_imp.id(22241220559988054981)
,p_css_classes=>'js-dialog-class-t-Drawer--sm'
,p_group_id=>wwv_flow_imp.id(22241221998747055006)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241223187276055011)
,p_theme_id=>42
,p_name=>'POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(22241220559988054981)
,p_css_classes=>'js-dialog-class-t-Drawer--pullOutEnd'
,p_group_id=>wwv_flow_imp.id(22241222912535055010)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241223391697055012)
,p_theme_id=>42
,p_name=>'POSITION_START'
,p_display_name=>'Start'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_imp.id(22241220559988054981)
,p_css_classes=>'js-dialog-class-t-Drawer--pullOutStart'
,p_group_id=>wwv_flow_imp.id(22241222912535055010)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241223553326055012)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(22241220559988054981)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241227252866055016)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(22241223687341055012)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241230906975055021)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(22241227307551055017)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241232280526055023)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(22241231024436055021)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241232471086055023)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_imp.id(22241231024436055021)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241436420786055028)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(22241232540340055023)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241439882329055031)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(22241436523671055028)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241441600669055033)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_1'
,p_display_name=>'Background 1'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_imp.id(22241439980132055031)
,p_css_classes=>'t-LoginPage--bg1'
,p_group_id=>wwv_flow_imp.id(22241441482031055033)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241441858764055034)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_2'
,p_display_name=>'Background 2'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(22241439980132055031)
,p_css_classes=>'t-LoginPage--bg2'
,p_group_id=>wwv_flow_imp.id(22241441482031055033)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241442058279055035)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_3'
,p_display_name=>'Background 3'
,p_display_sequence=>30
,p_page_template_id=>wwv_flow_imp.id(22241439980132055031)
,p_css_classes=>'t-LoginPage--bg3'
,p_group_id=>wwv_flow_imp.id(22241441482031055033)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241442427615055035)
,p_theme_id=>42
,p_name=>'PAGE_LAYOUT_SPLIT'
,p_display_name=>'Split'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_imp.id(22241439980132055031)
,p_css_classes=>'t-LoginPage--split'
,p_group_id=>wwv_flow_imp.id(22241442232124055035)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241446412608055040)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(22241442596323055035)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241447732894055042)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(22241446574015055040)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241447973002055042)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_imp.id(22241446574015055040)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241451351492055045)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(22241448014788055042)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241453540298055056)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241453905908055057)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_imp.id(22241453740531055057)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241454321444055057)
,p_theme_id=>42
,p_name=>'HIDDENHEADER'
,p_display_name=>'Hidden but Accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_css_classes=>'t-Alert--accessibleHeading'
,p_group_id=>wwv_flow_imp.id(22241454177468055057)
,p_template_types=>'REGION'
,p_help_text=>'Visually hides the alert title, but assistive technologies can still read it.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241454501850055057)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_css_classes=>'t-Alert--removeHeading js-removeLandmark'
,p_group_id=>wwv_flow_imp.id(22241454177468055057)
,p_template_types=>'REGION'
,p_help_text=>'Hides the Alert Title from being displayed.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241454913760055058)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_imp.id(22241454733414055058)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241455333218055058)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(22241455188770055058)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241455518577055058)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_imp.id(22241453740531055057)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241455705332055058)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_imp.id(22241454733414055058)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241455949247055058)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_imp.id(22241453740531055057)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241456188894055059)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_imp.id(22241454733414055058)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241456391546055059)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_imp.id(22241453740531055057)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241456552552055059)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241451465823055046)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(22241455188770055058)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241460653405055065)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241459493641055063)
,p_css_classes=>'u-colors'
,p_template_types=>'REGION'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241461047997055066)
,p_theme_id=>42
,p_name=>'STYLE_A'
,p_display_name=>'Style A'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241459493641055063)
,p_css_classes=>'t-CardsRegion--styleA'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241461239879055066)
,p_theme_id=>42
,p_name=>'STYLE_B'
,p_display_name=>'Style B'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241459493641055063)
,p_css_classes=>'t-CardsRegion--styleB'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241461494710055066)
,p_theme_id=>42
,p_name=>'STYLE_C'
,p_display_name=>'Style C'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241459493641055063)
,p_css_classes=>'t-CardsRegion--styleC'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241465324474055073)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_imp.id(22241465132993055073)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241465567028055074)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_imp.id(22241465132993055073)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241465735242055074)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_imp.id(22241465132993055073)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241466114087055075)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_imp.id(22241465978832055075)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241466346335055076)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_imp.id(22241465978832055075)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241466511100055076)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_imp.id(22241465978832055075)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241466734688055076)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_imp.id(22241465132993055073)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241466944192055076)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_imp.id(22241465978832055075)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241467376232055077)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241467561998055077)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241467722389055077)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241467924559055077)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241468102748055078)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241468546799055078)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_imp.id(22241468368715055078)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241468908606055078)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_imp.id(22241468728502055078)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241469149834055079)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(22241468368715055078)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241469396907055080)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241469591060055080)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241469736082055080)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241469924711055080)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_imp.id(22241468728502055078)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241470183092055080)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241470375553055081)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241470786162055081)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_imp.id(22241470597874055081)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241470983742055081)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_imp.id(22241470597874055081)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241471145275055081)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241471307001055081)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(22241461524336055066)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241472560834055083)
,p_theme_id=>42
,p_name=>'FILTER_BLUR'
,p_display_name=>'Blur'
,p_display_sequence=>430
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--blur'
,p_group_id=>wwv_flow_imp.id(22241472381539055083)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241472762190055083)
,p_theme_id=>42
,p_name=>'FILTER_GRAYSCALE'
,p_display_name=>'Grayscale'
,p_display_sequence=>410
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--grayscale'
,p_group_id=>wwv_flow_imp.id(22241472381539055083)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241472950455055083)
,p_theme_id=>42
,p_name=>'FILTER_INVERT'
,p_display_name=>'Invert'
,p_display_sequence=>440
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--invert'
,p_group_id=>wwv_flow_imp.id(22241472381539055083)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241473193118055083)
,p_theme_id=>42
,p_name=>'FILTER_NONE'
,p_display_name=>'None'
,p_display_sequence=>400
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--noFilter'
,p_group_id=>wwv_flow_imp.id(22241472381539055083)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241473371902055083)
,p_theme_id=>42
,p_name=>'FILTER_SATURATE'
,p_display_name=>'Saturate'
,p_display_sequence=>450
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--saturate'
,p_group_id=>wwv_flow_imp.id(22241472381539055083)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241473551377055083)
,p_theme_id=>42
,p_name=>'FILTER_SEPIA'
,p_display_name=>'Sepia'
,p_display_sequence=>420
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--sepia'
,p_group_id=>wwv_flow_imp.id(22241472381539055083)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241473778192055083)
,p_theme_id=>42
,p_name=>'IMAGE_STRETCH'
,p_display_name=>'Image Stretch'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--stretch'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241474149363055084)
,p_theme_id=>42
,p_name=>'RATIO_16_9'
,p_display_name=>'16:9 (Widescreen)'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--16x9'
,p_group_id=>wwv_flow_imp.id(22241473925020055084)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241474335873055084)
,p_theme_id=>42
,p_name=>'RATIO_1_1'
,p_display_name=>'1:1 (Square)'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--1x1'
,p_group_id=>wwv_flow_imp.id(22241473925020055084)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241474517363055084)
,p_theme_id=>42
,p_name=>'RATIO_2_1'
,p_display_name=>'2:1 (Univisium)'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--2x1'
,p_group_id=>wwv_flow_imp.id(22241473925020055084)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241474763089055084)
,p_theme_id=>42
,p_name=>'RATIO_4_3'
,p_display_name=>'4:3 (Standard)'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--4x3'
,p_group_id=>wwv_flow_imp.id(22241473925020055084)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241474958122055084)
,p_theme_id=>42
,p_name=>'RATIO_AUTO'
,p_display_name=>'Auto'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--auto'
,p_group_id=>wwv_flow_imp.id(22241473925020055084)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241475360964055084)
,p_theme_id=>42
,p_name=>'SCALE_CONTAIN'
,p_display_name=>'Contain'
,p_display_sequence=>200
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--contain'
,p_group_id=>wwv_flow_imp.id(22241475103348055084)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241475560633055084)
,p_theme_id=>42
,p_name=>'SCALE_COVER'
,p_display_name=>'Cover'
,p_display_sequence=>210
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--cover'
,p_group_id=>wwv_flow_imp.id(22241475103348055084)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241475758055055085)
,p_theme_id=>42
,p_name=>'SCALE_DOWN'
,p_display_name=>'Scale Down'
,p_display_sequence=>230
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--scale-down'
,p_group_id=>wwv_flow_imp.id(22241475103348055084)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241475953359055085)
,p_theme_id=>42
,p_name=>'SCALE_FILL'
,p_display_name=>'Fill'
,p_display_sequence=>220
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--fill'
,p_group_id=>wwv_flow_imp.id(22241475103348055084)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241476367148055085)
,p_theme_id=>42
,p_name=>'SHAPE_CIRCLE'
,p_display_name=>'Circle'
,p_display_sequence=>320
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--circle'
,p_group_id=>wwv_flow_imp.id(22241476166701055085)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241476589722055085)
,p_theme_id=>42
,p_name=>'SHAPE_ROUNDED'
,p_display_name=>'Rounded'
,p_display_sequence=>310
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--rounded'
,p_group_id=>wwv_flow_imp.id(22241476166701055085)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241476772750055085)
,p_theme_id=>42
,p_name=>'SHAPE_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>300
,p_region_template_id=>wwv_flow_imp.id(22241471464684055081)
,p_css_classes=>'t-ImageRegion--square'
,p_group_id=>wwv_flow_imp.id(22241476166701055085)
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241479707176055088)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_EXTRA_LARGE'
,p_display_name=>'Extra Large'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_css_classes=>'js-dialog-class-t-Drawer--xl'
,p_group_id=>wwv_flow_imp.id(22241479576817055088)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241479908533055089)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_css_classes=>'js-dialog-class-t-Drawer--lg'
,p_group_id=>wwv_flow_imp.id(22241479576817055088)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241480137966055089)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_css_classes=>'js-dialog-class-t-Drawer--md'
,p_group_id=>wwv_flow_imp.id(22241479576817055088)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241480359975055089)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_css_classes=>'js-dialog-class-t-Drawer--sm'
,p_group_id=>wwv_flow_imp.id(22241479576817055088)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241480567437055089)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241480748722055089)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None (Auto)'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_imp.id(22241479576817055088)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241481118483055090)
,p_theme_id=>42
,p_name=>'POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_css_classes=>'js-dialog-class-t-Drawer--pullOutEnd'
,p_group_id=>wwv_flow_imp.id(22241480961399055090)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241481327101055090)
,p_theme_id=>42
,p_name=>'POSITION_START'
,p_display_name=>'Start'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_css_classes=>'js-dialog-class-t-Drawer--pullOutStart'
,p_group_id=>wwv_flow_imp.id(22241480961399055090)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241481538235055090)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_imp.id(22241476808920055085)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241484622059055093)
,p_theme_id=>42
,p_name=>'ABOVE'
,p_display_name=>'Above'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_css_classes=>'js-popup-pos-above'
,p_group_id=>wwv_flow_imp.id(22241484498700055093)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout above or typically on top of the parent.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241484895210055093)
,p_theme_id=>42
,p_name=>'AFTER'
,p_display_name=>'After'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_css_classes=>'js-popup-pos-after'
,p_group_id=>wwv_flow_imp.id(22241484498700055093)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout after or typically to the right of the parent.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241485022225055094)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241485205600055094)
,p_theme_id=>42
,p_name=>'BEFORE'
,p_display_name=>'Before'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_css_classes=>'js-popup-pos-before'
,p_group_id=>wwv_flow_imp.id(22241484498700055093)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout before or typically to the left of the parent.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241485447625055094)
,p_theme_id=>42
,p_name=>'BELOW'
,p_display_name=>'Below'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_css_classes=>'js-popup-pos-below'
,p_group_id=>wwv_flow_imp.id(22241484498700055093)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout below or typically to the bottom of the parent.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241485637703055094)
,p_theme_id=>42
,p_name=>'DISPLAY_POPUP_CALLOUT'
,p_display_name=>'Display Popup Callout'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_css_classes=>'js-popup-callout'
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add display a callout for the popup. Note that callout will only be displayed if the data-parent-element custom attribute is defined.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241485841527055095)
,p_theme_id=>42
,p_name=>'INSIDE'
,p_display_name=>'Inside'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_css_classes=>'js-popup-pos-inside'
,p_group_id=>wwv_flow_imp.id(22241484498700055093)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout inside of the parent. This is useful when the parent is sufficiently large, such as a report or large region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241486016946055095)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_imp.id(22241479576817055088)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241486234720055095)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_imp.id(22241479576817055088)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241486484428055095)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_imp.id(22241479576817055088)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241486643054055096)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241486878239055096)
,p_theme_id=>42
,p_name=>'REMOVE_PAGE_OVERLAY'
,p_display_name=>'Remove Page Overlay'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_css_classes=>'js-popup-noOverlay'
,p_template_types=>'REGION'
,p_help_text=>'This option will display the inline dialog without an overlay on the background.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241487059399055097)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241481675098055090)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_imp.id(22241479576817055088)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241488915840055099)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241487195801055097)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241489173832055099)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241487195801055097)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241493144484055104)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_imp.id(22241465978832055075)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241493360971055104)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_imp.id(22241465978832055075)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241493576406055104)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_imp.id(22241465978832055075)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241493786323055105)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_imp.id(22241465978832055075)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241493971467055105)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241494160741055105)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241494319521055105)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241494559226055105)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241494733525055106)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241494971212055106)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241495166075055107)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241495375760055107)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241495565557055107)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241495760422055107)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241495998759055108)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241496195626055108)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241496368709055108)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241496526175055108)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241496784738055108)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241496902615055109)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--removeHeader js-removeLandmark'
,p_group_id=>wwv_flow_imp.id(22241468368715055078)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241497181496055109)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_imp.id(22241468728502055078)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241497356192055109)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(22241468368715055078)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241497549219055109)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241497728411055110)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241497935558055110)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241498154608055110)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_imp.id(22241468728502055078)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241498321721055110)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241498511535055111)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241498706424055111)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241498957308055111)
,p_theme_id=>42
,p_name=>'TEXT_CONTENT'
,p_display_name=>'Text Content'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(22241489256245055099)
,p_css_classes=>'t-Region--textContent'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
,p_help_text=>'Useful for displaying primarily text-based content, such as FAQs and more.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241500184739055113)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241499088148055111)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_imp.id(22241499989985055113)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241500599280055114)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241499088148055111)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_imp.id(22241500381395055113)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241500787568055114)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241499088148055111)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241500975653055114)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241499088148055111)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_imp.id(22241500381395055113)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241501390134055114)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241499088148055111)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_imp.id(22241501123633055114)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241501598324055115)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241499088148055111)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_imp.id(22241501123633055114)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241505743207055120)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_imp.id(22241505513691055120)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241506100678055121)
,p_theme_id=>42
,p_name=>'HEADING_FONT_ALTERNATIVE'
,p_display_name=>'Alternative'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_css_classes=>'t-BreadcrumbRegion--headingFontAlt'
,p_group_id=>wwv_flow_imp.id(22241505909963055121)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241506361916055121)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241506557918055121)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_imp.id(22241505513691055120)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241506754903055121)
,p_theme_id=>42
,p_name=>'USE_COMPACT_STYLE'
,p_display_name=>'Use Compact Style'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241501650118055115)
,p_css_classes=>'t-BreadcrumbRegion--compactTitle'
,p_template_types=>'REGION'
,p_help_text=>'Uses a compact style for the breadcrumbs.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241509882185055126)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241506840845055122)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241510253172055127)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_imp.id(22241506840845055122)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(22241510039594055127)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241510477397055127)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_imp.id(22241506840845055122)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241510635711055127)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_imp.id(22241506840845055122)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(22241510039594055127)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241510885084055127)
,p_theme_id=>42
,p_name=>'STICK_TO_BOTTOM'
,p_display_name=>'Stick to Bottom for Mobile'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241506840845055122)
,p_css_classes=>'t-ButtonRegion--stickToBottom'
,p_template_types=>'REGION'
,p_help_text=>'This will position the button container region to the bottom of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241514089567055130)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_imp.id(22241465978832055075)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241514221752055131)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_imp.id(22241465978832055075)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241514424424055131)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_imp.id(22241465978832055075)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241514605678055131)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_imp.id(22241465978832055075)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241514864941055131)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241515083292055132)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241515247336055132)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241515405195055132)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241515609723055132)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241515815638055132)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241516069577055132)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241516272995055133)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241516490892055133)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241516684179055133)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241516891195055133)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241517097521055134)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241517253075055134)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241517467935055134)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241517781481055134)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_imp.id(22241467166786055077)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241518168542055135)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(22241517911900055135)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241518530133055135)
,p_theme_id=>42
,p_name=>'CONRTOLS_POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--controlsPosEnd'
,p_group_id=>wwv_flow_imp.id(22241518340104055135)
,p_template_types=>'REGION'
,p_help_text=>'Position the expand / collapse button to the end of the region header.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241518777823055136)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(22241517911900055135)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241518977960055136)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_imp.id(22241468728502055078)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241519384900055136)
,p_theme_id=>42
,p_name=>'ICONS_PLUS_OR_MINUS'
,p_display_name=>'Plus or Minus'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--hideShowIconsMath'
,p_group_id=>wwv_flow_imp.id(22241519158687055136)
,p_template_types=>'REGION'
,p_help_text=>'Use the plus and minus icons for the expand and collapse button.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241519568032055137)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241519701554055137)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241519977566055137)
,p_theme_id=>42
,p_name=>'REMEMBER_COLLAPSIBLE_STATE'
,p_display_name=>'Remember Collapsible State'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
,p_help_text=>'This option saves the current state of the collapsible region for the duration of the session.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241520103531055137)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241520383229055138)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_imp.id(22241468728502055078)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241520526622055138)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241510985710055127)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241522715466055141)
,p_theme_id=>42
,p_name=>'ADD_BODY_PADDING'
,p_display_name=>'Add Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241520656036055138)
,p_css_classes=>'t-ContentBlock--padded'
,p_template_types=>'REGION'
,p_help_text=>'Adds padding to the region''s body container.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241522969547055141)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H1'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241520656036055138)
,p_css_classes=>'t-ContentBlock--h1'
,p_group_id=>wwv_flow_imp.id(22241505513691055120)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241523144164055142)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H2'
,p_display_name=>'Medium'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241520656036055138)
,p_css_classes=>'t-ContentBlock--h2'
,p_group_id=>wwv_flow_imp.id(22241505513691055120)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241523333433055142)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H3'
,p_display_name=>'Small'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241520656036055138)
,p_css_classes=>'t-ContentBlock--h3'
,p_group_id=>wwv_flow_imp.id(22241505513691055120)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241523508546055142)
,p_theme_id=>42
,p_name=>'HEADING_FONT_ALTERNATIVE'
,p_display_name=>'Alternative'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241520656036055138)
,p_css_classes=>'t-ContentBlock--headingFontAlt'
,p_group_id=>wwv_flow_imp.id(22241505909963055121)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241523988016055143)
,p_theme_id=>42
,p_name=>'LIGHT_BACKGROUND'
,p_display_name=>'Light Background'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241520656036055138)
,p_css_classes=>'t-ContentBlock--lightBG'
,p_group_id=>wwv_flow_imp.id(22241523717094055143)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly lighter background.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241524156722055143)
,p_theme_id=>42
,p_name=>'SHADOW_BACKGROUND'
,p_display_name=>'Shadow Background'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241520656036055138)
,p_css_classes=>'t-ContentBlock--shadowBG'
,p_group_id=>wwv_flow_imp.id(22241523717094055143)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly darker background.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241524338027055143)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241520656036055138)
,p_css_classes=>'t-ContentBlock--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241527190261055148)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241527373295055148)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241527596993055148)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_imp.id(22241479576817055088)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241527778909055149)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_imp.id(22241479576817055088)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241527979485055149)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241528126000055149)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_imp.id(22241479576817055088)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241528316020055149)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241528564154055150)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241528726145055150)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241524448084055143)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_imp.id(22241479576817055088)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241530664189055153)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON_NO'
,p_display_name=>'No'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241528861888055150)
,p_css_classes=>'t-HeroRegion--hideIcon'
,p_group_id=>wwv_flow_imp.id(22241530494787055153)
,p_template_types=>'REGION'
,p_help_text=>'Hide the Hero Region icon.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241530840222055154)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241528861888055150)
,p_css_classes=>'t-HeroRegion--featured'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241531015748055154)
,p_theme_id=>42
,p_name=>'HEADING_FONT_ALTERNATIVE'
,p_display_name=>'Alternative'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(22241528861888055150)
,p_css_classes=>'t-HeroRegion--headingFontAlt'
,p_group_id=>wwv_flow_imp.id(22241505909963055121)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241531440036055154)
,p_theme_id=>42
,p_name=>'ICONS_CIRCULAR'
,p_display_name=>'Circle'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241528861888055150)
,p_css_classes=>'t-HeroRegion--iconsCircle'
,p_group_id=>wwv_flow_imp.id(22241531254469055154)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a circle.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241531696984055154)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241528861888055150)
,p_css_classes=>'t-HeroRegion--iconsSquare'
,p_group_id=>wwv_flow_imp.id(22241531254469055154)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a square.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241531824760055154)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241528861888055150)
,p_css_classes=>'t-HeroRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the hero region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241532012182055154)
,p_theme_id=>42
,p_name=>'STACKED_FEATURED'
,p_display_name=>'Stacked Featured'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241528861888055150)
,p_css_classes=>'t-HeroRegion--featured t-HeroRegion--centered'
,p_group_id=>wwv_flow_imp.id(22241460876595055065)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241534182161055157)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER_ICON'
,p_display_name=>'Icon'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241532137618055154)
,p_css_classes=>'t-Login-region--headerIcon'
,p_group_id=>wwv_flow_imp.id(22241533983048055157)
,p_template_types=>'REGION'
,p_help_text=>'Displays only the Region Icon in the Login region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241534301016055157)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER_TITLE'
,p_display_name=>'Title'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241532137618055154)
,p_css_classes=>'t-Login-region--headerTitle js-removeLandmark'
,p_group_id=>wwv_flow_imp.id(22241533983048055157)
,p_template_types=>'REGION'
,p_help_text=>'Displays only the Region Title in the Login region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241534586977055157)
,p_theme_id=>42
,p_name=>'LOGO_HEADER_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(22241532137618055154)
,p_css_classes=>'t-Login-region--headerHidden js-removeLandmark'
,p_group_id=>wwv_flow_imp.id(22241533983048055157)
,p_template_types=>'REGION'
,p_help_text=>'Hides both the Region Icon and Title from the Login region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241536616767055159)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(22241534684297055157)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_imp.id(22241536417484055159)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241536824740055159)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241534684297055157)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_imp.id(22241536417484055159)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241537076778055160)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(22241534684297055157)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241537886983055165)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(22241537668136055165)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241538213756055166)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241538479041055166)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(22241537668136055165)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241538645120055166)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241538880686055166)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(22241537668136055165)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241539086830055166)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241539277571055166)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241539430075055166)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(22241537668136055165)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241539627932055166)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(22241537668136055165)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241539873403055166)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241540279128055167)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_imp.id(22241540030329055167)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241540459233055167)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241540661168055167)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241540886395055168)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241541055140055168)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_imp.id(22241540030329055167)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241541225991055168)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241537341711055165)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241541620093055169)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241542063297055170)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_imp.id(22241541814345055170)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241542292708055170)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241542475654055171)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_imp.id(22241541814345055170)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241542601613055171)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241542868050055171)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_imp.id(22241541814345055170)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241543074023055171)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241543261399055171)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_imp.id(22241540030329055167)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241543455407055172)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_imp.id(22241540030329055167)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241543852271055172)
,p_theme_id=>42
,p_name=>'CARDS_COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_imp.id(22241543648492055172)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241544098592055172)
,p_theme_id=>42
,p_name=>'CARD_RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_imp.id(22241543648492055172)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241544245315055172)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_imp.id(22241540030329055167)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241544655820055173)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_imp.id(22241544495649055173)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241544895087055173)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_imp.id(22241544495649055173)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241545020538055173)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241545220492055173)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_imp.id(22241540030329055167)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241545494944055174)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241545668304055174)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_imp.id(22241541814345055170)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241546002201055174)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_imp.id(22241545890566055174)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
end;
/
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241546267167055174)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_imp.id(22241545890566055174)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241546423459055174)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241546636367055175)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241541345148055168)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241547245012055175)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241546781939055175)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_imp.id(22241547006801055175)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241547473599055176)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241546781939055175)
,p_css_classes=>'t-Comments--iconsRounded'
,p_group_id=>wwv_flow_imp.id(22241545890566055174)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241547632898055176)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241546781939055175)
,p_css_classes=>'t-Comments--iconsSquare'
,p_group_id=>wwv_flow_imp.id(22241545890566055174)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241547896272055176)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241546781939055175)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_imp.id(22241547006801055175)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241548416843055177)
,p_theme_id=>42
,p_name=>'DISPLAY_ITEMS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(22241547930440055176)
,p_css_classes=>'t-ContextualInfo-item--stacked'
,p_group_id=>wwv_flow_imp.id(22241548202544055177)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241548999992055178)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(22241547930440055176)
,p_css_classes=>'t-ContextualInfo-label--stacked'
,p_group_id=>wwv_flow_imp.id(22241548711223055178)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241549554033055180)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241549077050055178)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(22241549328918055180)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241549723183055180)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241549077050055178)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_imp.id(22241549328918055180)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241550130981055181)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241549077050055178)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(22241549994313055181)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241550584793055181)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241549077050055178)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(22241550314204055181)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241550706399055181)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(22241549077050055178)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(22241550314204055181)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241550978142055182)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(22241549077050055178)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_imp.id(22241550314204055181)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241551113601055182)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241549077050055178)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_imp.id(22241549994313055181)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241551360670055182)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241549077050055178)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241551507404055182)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241549077050055178)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(22241550314204055181)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241552347491055185)
,p_theme_id=>42
,p_name=>'ACTIONS_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(22241551833426055184)
,p_css_classes=>'t-ContentRow--hideActions'
,p_group_id=>wwv_flow_imp.id(22241552196319055185)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Actions column from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241552760639055186)
,p_theme_id=>42
,p_name=>'ALIGNMENT_TOP'
,p_display_name=>'Top'
,p_display_sequence=>100
,p_report_template_id=>wwv_flow_imp.id(22241551833426055184)
,p_css_classes=>'t-ContentRow--alignTop'
,p_group_id=>wwv_flow_imp.id(22241552536821055186)
,p_template_types=>'REPORT'
,p_help_text=>'Aligns the content to the top of the row. This is useful when you expect that yours rows will vary in height (e.g. some rows will have longer descriptions than others).'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241553197826055186)
,p_theme_id=>42
,p_name=>'DESCRIPTION_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(22241551833426055184)
,p_css_classes=>'t-ContentRow--hideDescription'
,p_group_id=>wwv_flow_imp.id(22241552955392055186)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Description from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241553593101055187)
,p_theme_id=>42
,p_name=>'ICON_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241551833426055184)
,p_css_classes=>'t-ContentRow--hideIcon'
,p_group_id=>wwv_flow_imp.id(22241553359538055187)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Icon from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241553993466055187)
,p_theme_id=>42
,p_name=>'MISC_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(22241551833426055184)
,p_css_classes=>'t-ContentRow--hideMisc'
,p_group_id=>wwv_flow_imp.id(22241553703361055187)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Misc column from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241554392417055188)
,p_theme_id=>42
,p_name=>'SELECTION_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241551833426055184)
,p_css_classes=>'t-ContentRow--hideSelection'
,p_group_id=>wwv_flow_imp.id(22241554167697055188)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Selection column from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241554595703055188)
,p_theme_id=>42
,p_name=>'STYLE_COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(22241551833426055184)
,p_css_classes=>'t-ContentRow--styleCompact'
,p_group_id=>wwv_flow_imp.id(22241540030329055167)
,p_template_types=>'REPORT'
,p_help_text=>'This option reduces the padding and font sizes to present a compact display of the same information.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241554959436055189)
,p_theme_id=>42
,p_name=>'TITLE_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(22241551833426055184)
,p_css_classes=>'t-ContentRow--hideTitle'
,p_group_id=>wwv_flow_imp.id(22241554793150055188)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Title from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241555370092055190)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(22241555028969055189)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_imp.id(22241540030329055167)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact version of timeline with smaller text and fewer columns.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241555798301055191)
,p_theme_id=>42
,p_name=>'2_COLUMN_GRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241555425005055190)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241555901380055191)
,p_theme_id=>42
,p_name=>'3_COLUMN_GRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241555425005055190)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241556148252055191)
,p_theme_id=>42
,p_name=>'4_COLUMN_GRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(22241555425005055190)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241556364902055191)
,p_theme_id=>42
,p_name=>'5_COLUMN_GRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(22241555425005055190)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241556557458055192)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(22241555425005055190)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241556768478055192)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241555425005055190)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_imp.id(22241545890566055174)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241556922699055192)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241555425005055190)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_imp.id(22241545890566055174)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241557315173055193)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241555425005055190)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_imp.id(22241557152110055193)
,p_template_types=>'REPORT'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241557509208055193)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(22241555425005055190)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241557785608055193)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241555425005055190)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241557931399055193)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241555425005055190)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241558136062055193)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(22241555425005055190)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241558345738055194)
,p_theme_id=>42
,p_name=>'STACK'
,p_display_name=>'Stack'
,p_display_sequence=>5
,p_report_template_id=>wwv_flow_imp.id(22241555425005055190)
,p_css_classes=>'t-MediaList--stack'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241558996228055195)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(22241558465277055194)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_imp.id(22241558728046055195)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241559176737055196)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241558465277055194)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_imp.id(22241558728046055195)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241559389268055196)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241558465277055194)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_imp.id(22241558728046055195)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241559547934055196)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241558465277055194)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241559781456055196)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241558465277055194)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241559956917055196)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(22241558465277055194)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_imp.id(22241558728046055195)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241560125292055197)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(22241558465277055194)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_imp.id(22241558728046055195)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241560399304055197)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(22241558465277055194)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_imp.id(22241558728046055195)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241560750603055197)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(22241560483014055197)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_imp.id(22241558728046055195)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241560912553055198)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241560483014055197)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_imp.id(22241558728046055195)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241561158647055198)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241560483014055197)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_imp.id(22241558728046055195)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241561395679055198)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(22241560483014055197)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241561552065055198)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(22241560483014055197)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_imp.id(22241538072335055166)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241561769962055198)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(22241560483014055197)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_imp.id(22241558728046055195)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241561955495055199)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(22241560483014055197)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_imp.id(22241558728046055195)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241562109550055199)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(22241560483014055197)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_imp.id(22241558728046055195)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241562718480055205)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241562905543055205)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241563186827055206)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241563350139055206)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241563505163055206)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241563967958055206)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_imp.id(22241563735979055206)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241564167858055206)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241564375351055207)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241564543872055207)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241564711985055207)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_imp.id(22241563735979055206)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241565175937055207)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(22241564983300055207)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241565307973055207)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(22241564983300055207)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241565571487055207)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(22241564983300055207)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241565767121055208)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241565905867055208)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(22241564983300055207)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241566161752055208)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(22241562240858055200)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(22241564983300055207)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241566521169055209)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241566936460055209)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_imp.id(22241566714178055209)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241567149330055209)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241567355822055209)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_imp.id(22241566714178055209)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241567535884055210)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241567714712055210)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_imp.id(22241566714178055209)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241567911552055210)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241568164005055210)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_imp.id(22241563735979055206)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241568393832055210)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_imp.id(22241563735979055206)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241568511101055210)
,p_theme_id=>42
,p_name=>'CARDS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--stacked'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_help_text=>'Stacks the cards on top of each other.'
);
end;
/
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241568991226055211)
,p_theme_id=>42
,p_name=>'COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_imp.id(22241568759894055211)
,p_template_types=>'LIST'
,p_help_text=>'Fills the card background with the color of the icon or default link style.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241569127441055211)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_imp.id(22241563735979055206)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241569593452055211)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_imp.id(22241569316861055211)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241569789480055211)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_imp.id(22241569316861055211)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241569997413055211)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241570167060055212)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_imp.id(22241563735979055206)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241570345682055212)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241570521022055212)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_imp.id(22241566714178055209)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241570967822055212)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_imp.id(22241570777433055212)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241571108602055212)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_imp.id(22241570777433055212)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241571370790055212)
,p_theme_id=>42
,p_name=>'RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_imp.id(22241568759894055211)
,p_template_types=>'LIST'
,p_help_text=>'Raises the card so it pops up.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241571585350055213)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241571716164055213)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241566239888055208)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241572175303055214)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241571892463055213)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241572385793055214)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241571892463055213)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241572522603055214)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(22241571892463055213)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241572776722055214)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(22241571892463055213)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241572941896055214)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(22241571892463055213)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies colors from the Theme''s color palette to icons in the list.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241573132318055215)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241571892463055213)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_imp.id(22241570777433055212)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241573317810055215)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241571892463055213)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_imp.id(22241570777433055212)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241573790665055215)
,p_theme_id=>42
,p_name=>'LIST_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241571892463055213)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_imp.id(22241573588655055215)
,p_template_types=>'LIST'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241573949907055215)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(22241571892463055213)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241574119835055215)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241571892463055213)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241574371212055216)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241571892463055213)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Display an icon next to the list item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241574509357055216)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(22241571892463055213)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241574950319055217)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241574649983055216)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_imp.id(22241569316861055211)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241575140103055217)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(22241574649983055216)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241575388319055218)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241574649983055216)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_imp.id(22241569316861055211)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241575660209055218)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241574649983055216)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_imp.id(22241573588655055215)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241575829929055218)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241574649983055216)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_imp.id(22241563735979055206)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241576026144055218)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241574649983055216)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_imp.id(22241563735979055206)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241576348296055218)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_imp.id(22241574649983055216)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_imp.id(22241573588655055215)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241576931394055219)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS_SM'
,p_display_name=>'Display labels'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(22241576470596055218)
,p_css_classes=>'t-NavTabs--displayLabels-sm'
,p_group_id=>wwv_flow_imp.id(22241576711477055219)
,p_template_types=>'LIST'
,p_help_text=>'Displays the label for the list items below the icon'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241577119759055219)
,p_theme_id=>42
,p_name=>'HIDE_LABELS_SM'
,p_display_name=>'Do not display labels'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(22241576470596055218)
,p_css_classes=>'t-NavTabs--hiddenLabels-sm'
,p_group_id=>wwv_flow_imp.id(22241576711477055219)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241577528003055220)
,p_theme_id=>42
,p_name=>'LABEL_ABOVE_LG'
,p_display_name=>'Display labels above'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241576470596055218)
,p_css_classes=>'t-NavTabs--stacked'
,p_group_id=>wwv_flow_imp.id(22241577394701055219)
,p_template_types=>'LIST'
,p_help_text=>'Display the label stacked above the icon and badge'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241577748870055220)
,p_theme_id=>42
,p_name=>'LABEL_INLINE_LG'
,p_display_name=>'Display labels inline'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241576470596055218)
,p_css_classes=>'t-NavTabs--inlineLabels-lg'
,p_group_id=>wwv_flow_imp.id(22241577394701055219)
,p_template_types=>'LIST'
,p_help_text=>'Display the label inline with the icon and badge'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241577987011055220)
,p_theme_id=>42
,p_name=>'NO_LABEL_LG'
,p_display_name=>'Do not display labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(22241576470596055218)
,p_css_classes=>'t-NavTabs--hiddenLabels-lg'
,p_group_id=>wwv_flow_imp.id(22241577394701055219)
,p_template_types=>'LIST'
,p_help_text=>'Hides the label for the list item'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241578329229055221)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241578082708055220)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_imp.id(22241563735979055206)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241578505587055221)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(22241578082708055220)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241578705120055221)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241578082708055220)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241578969976055221)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241578082708055220)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241579368357055221)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241578082708055220)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(22241579169996055221)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241579504641055221)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241578082708055220)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(22241579169996055221)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241579966379055223)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(22241579607624055221)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241580139855055223)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241579607624055221)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241580397677055223)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(22241579607624055221)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241580511489055223)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(22241579607624055221)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241580957608055224)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241580632924055223)
,p_css_classes=>'t-MegaMenu--layout2Cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241581133363055225)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241580632924055223)
,p_css_classes=>'t-MegaMenu--layout3Cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241581392679055225)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(22241580632924055223)
,p_css_classes=>'t-MegaMenu--layout4Cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241581505005055225)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(22241580632924055223)
,p_css_classes=>'t-MegaMenu--layout5Cols'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241581776042055225)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(22241580632924055223)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241581944146055225)
,p_theme_id=>42
,p_name=>'CUSTOM'
,p_display_name=>'Custom'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_imp.id(22241580632924055223)
,p_css_classes=>'t-MegaMenu--layoutCustom'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241582196523055225)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241580632924055223)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Displays a callout arrow that points to where the menu was activated from.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241582306988055225)
,p_theme_id=>42
,p_name=>'FULL_WIDTH'
,p_display_name=>'Full Width'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241580632924055223)
,p_css_classes=>'t-MegaMenu--fullWidth'
,p_template_types=>'LIST'
,p_help_text=>'Stretches the menu to fill the width of the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241582516203055225)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_imp.id(22241580632924055223)
,p_css_classes=>'t-MegaMenu--layoutStacked'
,p_group_id=>wwv_flow_imp.id(22241562593794055205)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241583172053055226)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241582699763055225)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_imp.id(22241582977452055226)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241583348578055226)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241582699763055225)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_imp.id(22241582977452055226)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241583506780055226)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(22241582699763055225)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_imp.id(22241582977452055226)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241583796402055226)
,p_theme_id=>42
,p_name=>'VERTICAL_LIST'
,p_display_name=>'Vertical Orientation'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241582699763055225)
,p_css_classes=>'t-WizardSteps--vertical'
,p_template_types=>'LIST'
,p_help_text=>'Displays the wizard progress list in a vertical orientation and is suitable for displaying within a side column of a page.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241583980682055226)
,p_theme_id=>42
,p_name=>'WIZARD_PROGRESS_LINKS'
,p_display_name=>'Make Wizard Steps Clickable'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(22241582699763055225)
,p_css_classes=>'js-wizardProgressLinks'
,p_template_types=>'LIST'
,p_help_text=>'This option will make the wizard steps clickable links.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241584389528055227)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241584010075055226)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Enables you to define a keyboard shortcut to activate the menu item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241584571799055227)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241584010075055226)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu. Note that callout will only be displayed if the data-parent-element custom attribute is defined.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241584903203055228)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241584632893055227)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241585363467055230)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(22241585034647055228)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241585575878055230)
,p_theme_id=>42
,p_name=>'COLLAPSED_DEFAULT'
,p_display_name=>'Collapsed by Default'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241585034647055228)
,p_css_classes=>'js-defaultCollapsed'
,p_template_types=>'LIST'
,p_help_text=>'This option will load the side navigation menu in a collapsed state by default.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241585902651055231)
,p_theme_id=>42
,p_name=>'COLLAPSE_STYLE_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241585034647055228)
,p_css_classes=>'js-navCollapsed--hidden'
,p_group_id=>wwv_flow_imp.id(22241585726516055231)
,p_template_types=>'LIST'
,p_help_text=>'Completely hide the navigation menu when it is collapsed.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241586182194055231)
,p_theme_id=>42
,p_name=>'ICON_DEFAULT'
,p_display_name=>'Icon'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241585034647055228)
,p_css_classes=>'js-navCollapsed--default'
,p_group_id=>wwv_flow_imp.id(22241585726516055231)
,p_template_types=>'LIST'
,p_help_text=>'Display icons when the navigation menu is collapsed for large screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241586370536055231)
,p_theme_id=>42
,p_name=>'STYLE_A'
,p_display_name=>'Style A'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(22241585034647055228)
,p_css_classes=>'t-TreeNav--styleA'
,p_group_id=>wwv_flow_imp.id(22241563735979055206)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation A'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241586513954055231)
,p_theme_id=>42
,p_name=>'STYLE_B'
,p_display_name=>'Style B'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(22241585034647055228)
,p_css_classes=>'t-TreeNav--styleB'
,p_group_id=>wwv_flow_imp.id(22241563735979055206)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation B'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241586715543055232)
,p_theme_id=>42
,p_name=>'STYLE_C'
,p_display_name=>'Classic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(22241585034647055228)
,p_css_classes=>'t-TreeNav--classic'
,p_group_id=>wwv_flow_imp.id(22241563735979055206)
,p_template_types=>'LIST'
,p_help_text=>'Classic Style'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241587185084055233)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(22241586827046055232)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241587338079055233)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(22241586827046055232)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241587506887055233)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(22241586827046055232)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241587733759055233)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(22241586827046055232)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241588556751055240)
,p_theme_id=>42
,p_name=>'INDICATOR_ASTERISK'
,p_display_name=>'Asterisk'
,p_display_sequence=>10
,p_field_template_id=>wwv_flow_imp.id(22241588174443055239)
,p_css_classes=>'t-Form-fieldContainer--indicatorAsterisk'
,p_group_id=>wwv_flow_imp.id(22241588388589055240)
,p_template_types=>'FIELD'
,p_help_text=>'Displays an asterisk * on required items.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241588738560055240)
,p_theme_id=>42
,p_name=>'INDICATOR_LABEL'
,p_display_name=>'Inline Label'
,p_display_sequence=>20
,p_field_template_id=>wwv_flow_imp.id(22241588174443055239)
,p_css_classes=>'t-Form-fieldContainer--indicatorLabel'
,p_group_id=>wwv_flow_imp.id(22241588388589055240)
,p_template_types=>'FIELD'
,p_help_text=>'Displays "Required" inline.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241589099596055241)
,p_theme_id=>42
,p_name=>'INDICATOR_ASTERISK'
,p_display_name=>'Asterisk'
,p_display_sequence=>10
,p_field_template_id=>wwv_flow_imp.id(22241588850522055240)
,p_css_classes=>'t-Form-fieldContainer--indicatorAsterisk'
,p_group_id=>wwv_flow_imp.id(22241588388589055240)
,p_template_types=>'FIELD'
,p_help_text=>'Displays an asterisk * on required items.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241589267363055241)
,p_theme_id=>42
,p_name=>'INDICATOR_LABEL'
,p_display_name=>'Inline Label'
,p_display_sequence=>20
,p_field_template_id=>wwv_flow_imp.id(22241588850522055240)
,p_css_classes=>'t-Form-fieldContainer--indicatorLabel'
,p_group_id=>wwv_flow_imp.id(22241588388589055240)
,p_template_types=>'FIELD'
,p_help_text=>'Displays "Required" inline.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241589519657055243)
,p_theme_id=>42
,p_name=>'INDICATOR_ASTERISK'
,p_display_name=>'Asterisk'
,p_display_sequence=>10
,p_field_template_id=>wwv_flow_imp.id(22241589365814055241)
,p_css_classes=>'t-Form-fieldContainer--indicatorAsterisk'
,p_group_id=>wwv_flow_imp.id(22241588388589055240)
,p_template_types=>'FIELD'
,p_help_text=>'Displays an asterisk * on required items.'
);
end;
/
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241589774059055243)
,p_theme_id=>42
,p_name=>'INDICATOR_LABEL'
,p_display_name=>'Inline Label'
,p_display_sequence=>20
,p_field_template_id=>wwv_flow_imp.id(22241589365814055241)
,p_css_classes=>'t-Form-fieldContainer--indicatorLabel'
,p_group_id=>wwv_flow_imp.id(22241588388589055240)
,p_template_types=>'FIELD'
,p_help_text=>'Displays "Required" inline.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241590307560055248)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_imp.id(22241589974661055244)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_imp.id(22241590196749055248)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241590533366055248)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(22241589974661055244)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_imp.id(22241590196749055248)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241590939972055250)
,p_theme_id=>42
,p_name=>'HIDE_ICON_ON_DESKTOP'
,p_display_name=>'Hide Icon on Desktop'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_imp.id(22241590713761055249)
,p_css_classes=>'t-Button--desktopHideIcon'
,p_template_types=>'BUTTON'
,p_help_text=>'This template options hides the button icon on large screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241591259292055250)
,p_theme_id=>42
,p_name=>'HIDE_LABEL_ON_MOBILE'
,p_display_name=>'Hide Label on Mobile'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(22241590713761055249)
,p_css_classes=>'t-Button--mobileHideLabel'
,p_template_types=>'BUTTON'
,p_help_text=>'This template options hides the button label on small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241591685087055250)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(22241590713761055249)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(22241591462383055250)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241591807417055250)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_imp.id(22241590713761055249)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_imp.id(22241590196749055248)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241592036667055251)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_imp.id(22241590713761055249)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_imp.id(22241591462383055250)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241592217797055251)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(22241590713761055249)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_imp.id(22241590196749055248)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241594562055055291)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_imp.id(22241594343226055290)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241594710185055292)
,p_theme_id=>42
,p_name=>'DEFERRED_PAGE_RENDERING'
,p_display_name=>'Deferred Page Rendering'
,p_display_sequence=>1
,p_css_classes=>'t-DeferredRendering'
,p_template_types=>'PAGE'
,p_help_text=>'Defer page rendering until all page components have finished loading.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241595185044055292)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_LINK'
,p_display_name=>'Display as Link'
,p_display_sequence=>30
,p_css_classes=>'t-Button--link'
,p_group_id=>wwv_flow_imp.id(22241594953111055292)
,p_template_types=>'BUTTON'
,p_help_text=>'This option makes the button appear as a text link.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241595539654055293)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_PILL_BUTTON'
,p_display_name=>'Display as Pill Button'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--radioButtonGroup'
,p_group_id=>wwv_flow_imp.id(22241595387667055292)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the radio buttons to look like a button set / pill button.  Note that the the radio buttons must all be in the same row for this option to work.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241595991671055293)
,p_theme_id=>42
,p_name=>'FBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_imp.id(22241595772660055293)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large bottom margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241596195566055294)
,p_theme_id=>42
,p_name=>'FBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_imp.id(22241595772660055293)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium bottom margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241596369994055294)
,p_theme_id=>42
,p_name=>'FBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_imp.id(22241595772660055293)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the bottom margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241596502520055294)
,p_theme_id=>42
,p_name=>'FBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_imp.id(22241595772660055293)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small bottom margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241596956972055294)
,p_theme_id=>42
,p_name=>'FLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_imp.id(22241596753061055294)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large left margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241597151332055294)
,p_theme_id=>42
,p_name=>'FLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_imp.id(22241596753061055294)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium left margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241597397302055294)
,p_theme_id=>42
,p_name=>'FLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_imp.id(22241596753061055294)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the left margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241597649017055294)
,p_theme_id=>42
,p_name=>'FLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_imp.id(22241596753061055294)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small left margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241598059987055295)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(22241597837559055295)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241598461390055295)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'None'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_imp.id(22241598281679055295)
,p_template_types=>'REGION'
,p_help_text=>'Removes spacing between items.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241598846370055296)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_imp.id(22241598628653055295)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241599003783055296)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_imp.id(22241598628653055295)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241599274016055296)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_imp.id(22241598281679055295)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item spacing.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241599462149055296)
,p_theme_id=>42
,p_name=>'FORMSTANDARDPADDING'
,p_display_name=>'Standard'
,p_display_sequence=>5
,p_css_classes=>'t-Form--standardPadding'
,p_group_id=>wwv_flow_imp.id(22241598281679055295)
,p_template_types=>'REGION'
,p_help_text=>'Uses the standard spacing between items.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241599805315055297)
,p_theme_id=>42
,p_name=>'FRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_imp.id(22241599647402055296)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large right margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241600031870055297)
,p_theme_id=>42
,p_name=>'FRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_imp.id(22241599647402055296)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium right margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241600274797055297)
,p_theme_id=>42
,p_name=>'FRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_imp.id(22241599647402055296)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the right margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241600417908055297)
,p_theme_id=>42
,p_name=>'FRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_imp.id(22241599647402055296)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small right margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241600828271055297)
,p_theme_id=>42
,p_name=>'FTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_imp.id(22241600696646055297)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large top margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241601083756055298)
,p_theme_id=>42
,p_name=>'FTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_imp.id(22241600696646055297)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium top margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241601264261055298)
,p_theme_id=>42
,p_name=>'FTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_imp.id(22241600696646055297)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the top margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241601411245055298)
,p_theme_id=>42
,p_name=>'FTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_imp.id(22241600696646055297)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small top margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241601897631055299)
,p_theme_id=>42
,p_name=>'H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(22241601608224055298)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241602006185055299)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(22241601608224055298)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241602299781055299)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(22241601608224055298)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241602483305055299)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(22241601608224055298)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241602697339055300)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(22241601608224055298)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241602845018055300)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(22241601608224055298)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241603243251055301)
,p_theme_id=>42
,p_name=>'HIDE_WHEN_ALL_ROWS_DISPLAYED'
,p_display_name=>'Hide when all rows displayed'
,p_display_sequence=>10
,p_css_classes=>'t-Report--hideNoPagination'
,p_group_id=>wwv_flow_imp.id(22241603013822055301)
,p_template_types=>'REPORT'
,p_help_text=>'This option will hide the pagination when all rows are displayed.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241603656377055301)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_imp.id(22241603430108055301)
,p_template_types=>'BUTTON'
,p_help_text=>'A large button.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241604066669055302)
,p_theme_id=>42
,p_name=>'LARGEBOTTOMMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapBottom'
,p_group_id=>wwv_flow_imp.id(22241603884831055302)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241604447621055302)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(22241604205914055302)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241604887721055303)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(22241604641977055302)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241605258055055303)
,p_theme_id=>42
,p_name=>'LARGETOPMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapTop'
,p_group_id=>wwv_flow_imp.id(22241605093461055303)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241605669936055303)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_imp.id(22241605439118055303)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241605883695055304)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_imp.id(22241594953111055292)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241606209250055304)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_imp.id(22241606026744055304)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241606494580055304)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(22241606026744055304)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241606650171055305)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(22241606026744055304)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241607095602055305)
,p_theme_id=>42
,p_name=>'POST_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--postTextBlock'
,p_group_id=>wwv_flow_imp.id(22241606848278055305)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Post Text in a block style immediately after the item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241607420143055305)
,p_theme_id=>42
,p_name=>'PRE_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--preTextBlock'
,p_group_id=>wwv_flow_imp.id(22241607222542055305)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Pre Text in a block style immediately before the item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241607675251055306)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_imp.id(22241594343226055290)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241608036946055306)
,p_theme_id=>42
,p_name=>'RBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_imp.id(22241607821851055306)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large bottom margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241608201020055307)
,p_theme_id=>42
,p_name=>'RBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_imp.id(22241607821851055306)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium bottom margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241608417121055307)
,p_theme_id=>42
,p_name=>'RBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_imp.id(22241607821851055306)
,p_template_types=>'REGION'
,p_help_text=>'Removes the bottom margin for this region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241608666141055307)
,p_theme_id=>42
,p_name=>'RBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_imp.id(22241607821851055306)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small bottom margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241609079237055308)
,p_theme_id=>42
,p_name=>'REMOVE_PADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>1
,p_css_classes=>'t-PageBody--noContentPadding'
,p_group_id=>wwv_flow_imp.id(22241608866215055308)
,p_template_types=>'PAGE'
,p_help_text=>'Removes padding from the content region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241609444965055308)
,p_theme_id=>42
,p_name=>'RLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_imp.id(22241609289468055308)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241609657709055309)
,p_theme_id=>42
,p_name=>'RLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_imp.id(22241609289468055308)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241609890460055309)
,p_theme_id=>42
,p_name=>'RLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_imp.id(22241609289468055308)
,p_template_types=>'REGION'
,p_help_text=>'Removes the left margin from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241610037294055309)
,p_theme_id=>42
,p_name=>'RLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_imp.id(22241609289468055308)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small left margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241610434157055310)
,p_theme_id=>42
,p_name=>'RRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_imp.id(22241610290855055309)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241610692472055310)
,p_theme_id=>42
,p_name=>'RRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_imp.id(22241610290855055309)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241610886998055310)
,p_theme_id=>42
,p_name=>'RRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_imp.id(22241610290855055309)
,p_template_types=>'REGION'
,p_help_text=>'Removes the right margin from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241611010457055310)
,p_theme_id=>42
,p_name=>'RRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_imp.id(22241610290855055309)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241611467264055311)
,p_theme_id=>42
,p_name=>'RTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_imp.id(22241611243768055311)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large top margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241611621503055311)
,p_theme_id=>42
,p_name=>'RTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_imp.id(22241611243768055311)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium top margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241611869083055311)
,p_theme_id=>42
,p_name=>'RTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_imp.id(22241611243768055311)
,p_template_types=>'REGION'
,p_help_text=>'Removes the top margin for this region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241612049424055311)
,p_theme_id=>42
,p_name=>'RTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_imp.id(22241611243768055311)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small top margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241612443838055312)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(22241612263814055312)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241612631913055312)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_imp.id(22241594953111055292)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241612889989055312)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_imp.id(22241603430108055301)
,p_template_types=>'BUTTON'
,p_help_text=>'A small button.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241613084755055313)
,p_theme_id=>42
,p_name=>'SMALLBOTTOMMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padBottom'
,p_group_id=>wwv_flow_imp.id(22241603884831055302)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241613218838055313)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(22241604205914055302)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241613482396055313)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_imp.id(22241604641977055302)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241613648848055313)
,p_theme_id=>42
,p_name=>'SMALLTOPMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padTop'
,p_group_id=>wwv_flow_imp.id(22241605093461055303)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241614024772055314)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_imp.id(22241613881238055314)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241614473333055314)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_imp.id(22241614293084055314)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241614603950055315)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241614803036055315)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_imp.id(22241594343226055290)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241615003944055315)
,p_theme_id=>42
,p_name=>'TINY'
,p_display_name=>'Tiny'
,p_display_sequence=>10
,p_css_classes=>'t-Button--tiny'
,p_group_id=>wwv_flow_imp.id(22241603430108055301)
,p_template_types=>'BUTTON'
,p_help_text=>'A very small button.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241615266346055315)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_imp.id(22241594343226055290)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(22241615492095055315)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_imp.id(22241605439118055303)
,p_template_types=>'FIELD'
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
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(22241218880245054967)
,p_build_option_name=>'Commented Out'
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
 p_id=>wwv_flow_imp.id(22241219121745054968)
,p_name=>'Oracle APEX Accounts'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(22241616386904055324)
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
,p_navigation_list_id=>wwv_flow_imp.id(22241220208093054979)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_imp.id(22241585034647055228)
,p_nav_list_template_options=>'#DEFAULT#:t-TreeNav--styleA:js-navCollapsed--hidden'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(22241615951143055322)
,p_nav_bar_list_template_id=>wwv_flow_imp.id(22241584632893055227)
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
wwv_flow_imp_page.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_imp.id(22241616386904055324)
,p_name=>'Global Page'
,p_step_title=>'Global Page'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_page_component_map=>'14'
,p_last_updated_by=>'LOW_CODER'
,p_last_upd_yyyymmddhh24miss=>'20220816144853'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_imp_page.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_imp.id(22241616386904055324)
,p_name=>'My Watchlist'
,p_alias=>'HOME'
,p_step_title=>'Movies Watchlist'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
,p_last_updated_by=>'LOW_CODER'
,p_last_upd_yyyymmddhh24miss=>'20220816200849'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22241631871751055413)
,p_plug_name=>'My Watchlist'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(22241528861888055150)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(21237668572273188347)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(22241631871751055413)
,p_button_name=>'ADD_MOVIE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(22241590606246055248)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Movie'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2::'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(21237668643840188348)
,p_name=>'Refresh on Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(21237668572273188347)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21237668721515188349)
,p_event_id=>wwv_flow_imp.id(21237668643840188348)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_imp_page.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_imp.id(22241616386904055324)
,p_name=>'Movie Search'
,p_alias=>'MOVIE-SEARCH'
,p_page_mode=>'MODAL'
,p_step_title=>'Movie Search'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Set posters to be the same size/ratio */',
'.a-CardView-media--square:before {',
'    padding-top: 150%; /* 2:3 ratio */',
'}',
'',
'/* set position of the Card badge */',
'.a-CardView-badge {',
'    position: absolute;',
'    top: 12px;',
'    right: 12px;',
'    margin: 0;',
'}',
'',
'/* style the movie rating under the movie title */',
'    .movie-rating {',
'    margin-top: 4px;',
'}',
'',
'/* style both the movie rating and the star icon under the movie title */',
'.movie-rating,',
'.movie-rating .fa {',
'    font-size: 12px;',
'    line-height: inherit;',
'    vertical-align: bottom;',
'    opacity: 0.75;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_page_component_map=>'23'
,p_last_updated_by=>'LOW_CODER'
,p_last_upd_yyyymmddhh24miss=>'20220819133527'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21237667291838188334)
,p_plug_name=>'Popular Movies'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(22241459493641055063)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(22266759957212684487)
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ads.id,',
'       ads.adult,',
'       ads.title,',
'       ads.video,',
'       ads.overview,',
'       ads.popularity,',
'       ads.vote_count,',
'       ads.poster_path,',
'       ads.release_date,',
'       ads.vote_average,',
'       ads.backdrop_path,',
'       ads.original_title,',
'       ads.original_language,',
'       case when w.watched_yn = ''Y'' then ''Watched''',
'            when w.watched_yn = ''N'' then ''Added''',
'            end as badge_label,',
'       case when w.watched_yn = ''N'' then ''u-success''',
'            end as badge_color',
'  from #APEX$SOURCE_DATA# ads',
'LEFT OUTER JOIN',
'    -- doing inline select to limit rows to current user',
'    (select * from watchlist where user_id = :USER_ID) w',
'    ON w.movie_id = ads.ID'))
,p_source_post_processing=>'SQL'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_show_total_row_count=>false
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P2_SEARCH'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(21237667378268188335)
,p_region_id=>wwv_flow_imp.id(21237667291838188334)
,p_layout_type=>'GRID'
,p_grid_column_count=>5
,p_title_adv_formatting=>false
,p_title_column_name=>'TITLE'
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="movie-rating">',
'<span aria-hidden="true" class="fa fa-star"></span> &VOTE_AVERAGE.</div>'))
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_badge_column_name=>'BADGE_LABEL'
,p_badge_css_classes=>'&BADGE_COLOR.'
,p_media_adv_formatting=>false
,p_media_source_type=>'STATIC_URL'
,p_media_url=>'https://image.tmdb.org/t/p/w500&POSTER_PATH.'
,p_media_display_position=>'FIRST'
,p_media_appearance=>'SQUARE'
,p_media_sizing=>'COVER'
,p_pk1_column_name=>'ID'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(22632500222142448004)
,p_card_id=>wwv_flow_imp.id(21237667378268188335)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::P3_ID,P3_PREVIOUS_PAGE_ID:&ID.,2'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(21237667417713188336)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_imp.id(22266760635659684488)
,p_page_plug_id=>wwv_flow_imp.id(21237667291838188334)
,p_value_type=>'STATIC'
,p_value=>'en-US'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(21237667564723188337)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_imp.id(22266761018389684488)
,p_page_plug_id=>wwv_flow_imp.id(21237667291838188334)
,p_value_type=>'STATIC'
,p_value=>'1'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21237667681676188338)
,p_plug_name=>'Searched Movies'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(22241459493641055063)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(22266753916841684482)
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ads.id,',
'       ads.adult,',
'       ads.title,',
'       ads.video,',
'       ads.overview,',
'       ads.popularity,',
'       ads.vote_count,',
'       ads.poster_path,',
'       ads.release_date,',
'       ads.vote_average,',
'       ads.backdrop_path,',
'       ads.original_title,',
'       ads.original_language,',
'       case when w.watched_yn = ''Y'' then ''Watched''',
'            when w.watched_yn = ''N'' then ''Added''',
'            end as badge_label,',
'       case when w.watched_yn = ''N'' then ''u-success''',
'            end as badge_color',
'  from #APEX$SOURCE_DATA# ads',
'LEFT OUTER JOIN',
'    -- doing inline select to limit rows to current user',
'    (select * from watchlist where user_id = :USER_ID) w',
'    ON w.movie_id = ads.ID'))
,p_source_post_processing=>'SQL'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows=>25
,p_plug_query_num_rows_type=>'SET'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_show_total_row_count=>false
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2_SEARCH'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(21237667979477188341)
,p_region_id=>wwv_flow_imp.id(21237667681676188338)
,p_layout_type=>'GRID'
,p_grid_column_count=>5
,p_title_adv_formatting=>false
,p_title_column_name=>'TITLE'
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="movie-rating">',
'<span aria-hidden="true" class="fa fa-star"></span> &VOTE_AVERAGE.</div>'))
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_badge_column_name=>'BADGE_LABEL'
,p_badge_css_classes=>'&BADGE_COLOR.'
,p_media_adv_formatting=>false
,p_media_source_type=>'STATIC_URL'
,p_media_url=>'https://image.tmdb.org/t/p/w500&POSTER_PATH.'
,p_media_display_position=>'FIRST'
,p_media_appearance=>'SQUARE'
,p_media_sizing=>'COVER'
,p_pk1_column_name=>'ID'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(22632500329921448005)
,p_card_id=>wwv_flow_imp.id(21237667979477188341)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::P3_ID,P3_PREVIOUS_PAGE_ID:&ID.,2'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(21237668054458188342)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_imp.id(22266755408422684483)
,p_page_plug_id=>wwv_flow_imp.id(21237667681676188338)
,p_value_type=>'STATIC'
,p_value=>'false'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(21237668126241188343)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_imp.id(22266754696869684482)
,p_page_plug_id=>wwv_flow_imp.id(21237667681676188338)
,p_value_type=>'STATIC'
,p_value=>'en-US'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(21237668235463188344)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_imp.id(22266755016586684482)
,p_page_plug_id=>wwv_flow_imp.id(21237667681676188338)
,p_value_type=>'ITEM'
,p_value=>'P2_SEARCH'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21237668322516188345)
,p_plug_name=>'Search Bar'
,p_region_css_classes=>'padding-sm'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(22241456623640055059)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21237668425982188346)
,p_name=>'P2_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(21237668322516188345)
,p_prompt=>'Search'
,p_placeholder=>'Search for a movie...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(22241587805841055234)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_imp_page.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_imp.id(22241616386904055324)
,p_name=>'Movie Details'
,p_alias=>'MOVIE-DETAILS'
,p_page_mode=>'MODAL'
,p_step_title=>'Movie Details'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Customize Movie Header Card */',
'.movie-header-card.a-CardView {',
'    /* Increase the font sizes for movie name and tag line */',
'    --a-cv-title-font-size: 24px;',
'    --a-cv-subtitle-font-size: 16px;',
'',
'    /* Add additional spacing around the header content */',
'    --ut-cv-subtitle-margin: 16px 0 0 0;',
'    display: flex;',
'    padding: 24px 0;',
'}',
'.movie-header-card .a-CardView-body {',
'    /* Remove unnecessary padding */',
'    padding-top: 0;',
'}',
'.movie-details {',
'    /* Center align Card Body text */',
'    text-align: center;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_page_component_map=>'23'
,p_last_updated_by=>'LOW_CODER'
,p_last_upd_yyyymmddhh24miss=>'20220819132718'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21237668846962188350)
,p_plug_name=>'Header'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(22241459493641055063)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(22266748668760684477)
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'       title,',
'       ''https://image.tmdb.org/t/p/w500''||poster_path as poster_url,',
'       ''https://image.tmdb.org/t/p/w500''||backdrop_path as backdrop_url,',
'       release_date,',
'       runtime,',
'       trunc(runtime/60) || ''hr '' ||',
'            extract (minute from numtodsinterval((runtime/60), ''HOUR'' )) || ''min''',
'            as runtime_friendly,',
'       vote_average,',
'       tagline',
'  from #APEX$SOURCE_DATA#'))
,p_source_post_processing=>'SQL'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(22632500810082448010)
,p_region_id=>wwv_flow_imp.id(21237668846962188350)
,p_layout_type=>'ROW'
,p_component_css_classes=>'movie-header-card'
,p_title_adv_formatting=>false
,p_title_column_name=>'TITLE'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'TAGLINE'
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="movie-details">',
'    <span title="Release Date">Released &RELEASE_DATE.</span> &middot; ',
'    <span title="Runtime">&RUNTIME_FRIENDLY.</span> &middot;',
'    <span title="&VOTE_AVERAGE. out of 10"><span class="fa fa-star" aria-hidden="true"></span> &VOTE_AVERAGE.</span>',
'</div>'))
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'URL'
,p_icon_image_url=>'&POSTER_URL.'
,p_icon_css_classes=>'w100 h150'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_media_source_type=>'DYNAMIC_URL'
,p_media_url_column_name=>'BACKDROP_URL'
,p_media_display_position=>'BACKGROUND'
,p_media_sizing=>'COVER'
,p_pk1_column_name=>'ID'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(22632501292946448014)
,p_page_id=>3
,p_web_src_param_id=>wwv_flow_imp.id(22266749376057684477)
,p_page_plug_id=>wwv_flow_imp.id(21237668846962188350)
,p_value_type=>'ITEM'
,p_value=>'P3_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22632406297889432843)
,p_plug_name=>'Movie Details'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(22241456623640055059)
,p_plug_display_sequence=>10
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(22266748668760684477)
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(22632406797574432846)
,p_page_id=>3
,p_web_src_param_id=>wwv_flow_imp.id(22266749376057684477)
,p_page_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_value_type=>'ITEM'
,p_value=>'P3_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22632421822681432865)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_imp.id(22241506840845055122)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22632501315804448015)
,p_plug_name=>'Overview'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_plug_template=>wwv_flow_imp.id(22241520656036055138)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>'&P3_OVERVIEW.'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22632502128836448023)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(22632421822681432865)
,p_button_name=>'ADD_TO_WATCHLIST'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(22241590606246055248)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add To Watchlist'
,p_button_position=>'NEXT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from watchlist',
' where movie_id = :P3_ID',
'   and user_id = :USER_ID'))
,p_button_condition_type=>'NOT_EXISTS'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22632502474766448026)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(22632421822681432865)
,p_button_name=>'REMOVE_FROM_WATCHLIST'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(22241590606246055248)
,p_button_image_alt=>'Remove From Watchlist'
,p_button_position=>'NEXT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from watchlist',
' where movie_id = :P3_ID',
'   and user_id = :USER_ID'))
,p_button_condition_type=>'EXISTS'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22632502599359448027)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(22632421822681432865)
,p_button_name=>'MARK_WATCHED'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(22241590606246055248)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'I''ve Watched This'
,p_button_position=>'NEXT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from watchlist',
' where movie_id =:P3_ID',
'   and user_id = :USER_ID',
'   and watched_yn = ''N'''))
,p_button_condition_type=>'EXISTS'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22632422224976432865)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(22632421822681432865)
,p_button_name=>'BACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(22241590713761055249)
,p_button_image_alt=>'Back'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_button_condition=>'P3_PREVIOUS_PAGE_ID'
,p_button_condition2=>'2'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(22632502848064448030)
,p_branch_name=>'Redirect to previous page'
,p_branch_action=>'f?p=&APP_ID.:&P3_PREVIOUS_PAGE_ID.:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632407125397432847)
,p_name=>'P3_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(22241589892635055243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632407531820432848)
,p_name=>'P3_ADULT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'ADULT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632407993415432848)
,p_name=>'P3_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'TITLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632408337476432849)
,p_name=>'P3_VIDEO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'VIDEO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632408704064432849)
,p_name=>'P3_BUDGET'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'BUDGET'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632409190564432850)
,p_name=>'P3_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'STATUS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632409507367432851)
,p_name=>'P3_IMDB_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'IMDB_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632409957762432851)
,p_name=>'P3_REVENUE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'REVENUE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632410348699432852)
,p_name=>'P3_RUNTIME'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'RUNTIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632410791971432852)
,p_name=>'P3_TAGLINE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'TAGLINE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632411159969432853)
,p_name=>'P3_HOMEPAGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'HOMEPAGE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632411541654432853)
,p_name=>'P3_OVERVIEW'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'OVERVIEW'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632411909475432854)
,p_name=>'P3_POPULARITY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'POPULARITY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632412318253432854)
,p_name=>'P3_VOTE_COUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'VOTE_COUNT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632412798667432855)
,p_name=>'P3_POSTER_PATH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'POSTER_PATH'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632413105839432855)
,p_name=>'P3_RELEASE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'RELEASE_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632413529736432857)
,p_name=>'P3_VOTE_AVERAGE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'VOTE_AVERAGE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632413927052432858)
,p_name=>'P3_BACKDROP_PATH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'BACKDROP_PATH'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632414394123432858)
,p_name=>'P3_ORIGINAL_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'ORIGINAL_TITLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632414733840432859)
,p_name=>'P3_ORIGINAL_LANGUAGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'ORIGINAL_LANGUAGE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632415121381432859)
,p_name=>'P3_BELONGS_TO_COLLECTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_item_source_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_source=>'BELONGS_TO_COLLECTION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22632502925550448031)
,p_name=>'P3_PREVIOUS_PAGE_ID'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(22632406297889432843)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22632424016508432868)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Add movie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into watchlist',
'    (',
'        movie_id,',
'        user_id,',
'        watched_yn,',
'        title,',
'        poster_url,',
'        release_date,',
'        runtime,',
'        vote_average',
'    )',
'values',
'    (',
'        :P3_ID,',
'        :USER_ID,',
'        ''N'',',
'        :P3_TITLE,',
'        ''https://image.tmdb.org/t/p/w500''||:P3_POSTER_PATH,',
'        :P3_RELEASE_DATE,',
'        :P3_RUNTIME,',
'        :P3_VOTE_AVERAGE',
'    );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(22632502128836448023)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22632502651507448028)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove movie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from watchlist ',
' where movie_id = :P3_ID ',
'   and user_id = :USER_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(22632502474766448026)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22632502776588448029)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update movie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update watchlist',
'   set watched_yn = ''Y'',',
'       watched = SYSDATE',
' where movie_id = :P3_ID',
'   and user_id = :USER_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(22632502599359448027)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22632423614523432868)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(22632406297889432843)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Movie Details'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_imp_page.create_page(
 p_id=>9999
,p_user_interface_id=>wwv_flow_imp.id(22241616386904055324)
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'Movies Watchlist - Log In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(22241439980132055031)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'12'
,p_last_updated_by=>'LOW_CODER'
,p_last_upd_yyyymmddhh24miss=>'20220816144854'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22241627418392055386)
,p_plug_name=>'Movies Watchlist'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(22241532137618055154)
,p_plug_display_sequence=>10
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22241629057902055397)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(22241627418392055386)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(22241590606246055248)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'NEXT'
,p_button_alignment=>'LEFT'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22241627935078055390)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(22241627418392055386)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(22241587805841055234)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22241628315252055391)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(22241627418392055386)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(22241587805841055234)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22241628794224055396)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(22241627418392055386)
,p_prompt=>'Remember username'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_display_when=>'apex_authentication.persistent_cookies_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(22241587805841055234)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22241629899072055400)
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22241629493736055399)
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22241630629726055402)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22241630213661055401)
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
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(22288338112530230503)
);
end;
/
prompt --application/deployment/install/install_install_user_watchlist_tables
begin
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(22967129214338890931)
,p_install_id=>wwv_flow_imp.id(22288338112530230503)
,p_name=>'install_user_watchlist_tables'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE TABLE "MOVIE_USERS" ',
'   (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOT NULL ENABLE, ',
'	"USERNAME" VARCHAR2(255 CHAR), ',
'	"CREATED" DATE NOT NULL ENABLE, ',
'	"CREATED_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, ',
'	"UPDATED" DATE NOT NULL ENABLE, ',
'	"UPDATED_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, ',
'	 CONSTRAINT "MOVIE_USERS_ID_PK" PRIMARY KEY ("ID")',
'  USING INDEX  ENABLE, ',
'	 CONSTRAINT "MOVIE_USERS_USERNAME_UNQ" UNIQUE ("USERNAME")',
'  USING INDEX  ENABLE',
'   ) ;',
'',
'CREATE TABLE "WATCHLIST" ',
'   (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOT NULL ENABLE, ',
'	"MOVIE_ID" NUMBER, ',
'	"USER_ID" NUMBER, ',
'	"WATCHED_YN" VARCHAR2(1 CHAR), ',
'	"WATCHED" DATE, ',
'	"TITLE" VARCHAR2(4000 CHAR), ',
'	"POSTER_URL" VARCHAR2(4000 CHAR), ',
'	"RELEASE_DATE" DATE, ',
'	"RUNTIME" NUMBER, ',
'	"VOTE_AVERAGE" NUMBER, ',
'	"CREATED" DATE NOT NULL ENABLE, ',
'	"CREATED_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, ',
'	"UPDATED" DATE NOT NULL ENABLE, ',
'	"UPDATED_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, ',
'	 CONSTRAINT "WATCHLIST_WATCHED_YN_CK" CHECK (watched_yn in (''Y'',''N'')) ENABLE, ',
'	 CONSTRAINT "WATCHLIST_ID_PK" PRIMARY KEY ("ID")',
'  USING INDEX  ENABLE, ',
'	 CONSTRAINT "WATCHLIST_UK" UNIQUE ("MOVIE_ID", "USER_ID")',
'  USING INDEX  ENABLE',
'   ) ;',
'',
'ALTER TABLE "WATCHLIST" ADD CONSTRAINT "WATCHLIST_USER_ID_FK" FOREIGN KEY ("USER_ID")',
'	  REFERENCES "MOVIE_USERS" ("ID") ON DELETE CASCADE ENABLE;',
'',
'CREATE INDEX "WATCHLIST_I1" ON "WATCHLIST" ("USER_ID") ',
'  ;',
'',
'CREATE OR REPLACE EDITIONABLE TRIGGER "MOVIE_USERS_BIU" ',
'    before insert or update  ',
'    on movie_users ',
'    for each row ',
'begin ',
'    if inserting then ',
'        :new.created := sysdate; ',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user); ',
'    end if; ',
'    :new.updated := sysdate; ',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user); ',
'end movie_users_biu; ',
'',
'/',
'',
'',
'ALTER TRIGGER "MOVIE_USERS_BIU" ENABLE;',
'',
'CREATE OR REPLACE EDITIONABLE TRIGGER "WATCHLIST_BIU" ',
'    before insert or update  ',
'    on watchlist ',
'    for each row ',
'begin ',
'    if inserting then ',
'        :new.created := sysdate; ',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user); ',
'    end if; ',
'    :new.updated := sysdate; ',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user); ',
'end watchlist_biu; ',
'',
'/',
'',
'',
'ALTER TRIGGER "WATCHLIST_BIU" ENABLE;',
'',
''))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(22967129385559890937)
,p_script_id=>wwv_flow_imp.id(22967129214338890931)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'MOVIE_USERS_ID_PK'
,p_last_updated_by=>'LOW_CODER'
,p_last_updated_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
,p_created_by=>'LOW_CODER'
,p_created_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(22967129560785890939)
,p_script_id=>wwv_flow_imp.id(22967129214338890931)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'MOVIE_USERS_USERNAME_UNQ'
,p_last_updated_by=>'LOW_CODER'
,p_last_updated_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
,p_created_by=>'LOW_CODER'
,p_created_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(22967129710897890940)
,p_script_id=>wwv_flow_imp.id(22967129214338890931)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'WATCHLIST_I1'
,p_last_updated_by=>'LOW_CODER'
,p_last_updated_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
,p_created_by=>'LOW_CODER'
,p_created_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(22967129978527890940)
,p_script_id=>wwv_flow_imp.id(22967129214338890931)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'WATCHLIST_ID_PK'
,p_last_updated_by=>'LOW_CODER'
,p_last_updated_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
,p_created_by=>'LOW_CODER'
,p_created_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(22967130190686890940)
,p_script_id=>wwv_flow_imp.id(22967129214338890931)
,p_object_owner=>'#OWNER#'
,p_object_type=>'INDEX'
,p_object_name=>'WATCHLIST_UK'
,p_last_updated_by=>'LOW_CODER'
,p_last_updated_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
,p_created_by=>'LOW_CODER'
,p_created_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(22967130383771890940)
,p_script_id=>wwv_flow_imp.id(22967129214338890931)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'MOVIE_USERS'
,p_last_updated_by=>'LOW_CODER'
,p_last_updated_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
,p_created_by=>'LOW_CODER'
,p_created_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(22967130513084890941)
,p_script_id=>wwv_flow_imp.id(22967129214338890931)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'WATCHLIST'
,p_last_updated_by=>'LOW_CODER'
,p_last_updated_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
,p_created_by=>'LOW_CODER'
,p_created_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(22967130717554890941)
,p_script_id=>wwv_flow_imp.id(22967129214338890931)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'MOVIE_USERS_BIU'
,p_last_updated_by=>'LOW_CODER'
,p_last_updated_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
,p_created_by=>'LOW_CODER'
,p_created_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(22967130905489890941)
,p_script_id=>wwv_flow_imp.id(22967129214338890931)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'WATCHLIST_BIU'
,p_last_updated_by=>'LOW_CODER'
,p_last_updated_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
,p_created_by=>'LOW_CODER'
,p_created_on=>to_date('20220819114809','YYYYMMDDHH24MISS')
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
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
