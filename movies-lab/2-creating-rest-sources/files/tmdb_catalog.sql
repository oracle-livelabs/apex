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
,p_default_workspace_id=>13049315968741382764
);
end;
/
prompt --workspace/rest-source-catalogs//tmdb
begin
wwv_web_src_catalog_api.create_catalog(
 p_id=>wwv_flow_imp.id(29212085783740236785)
,p_name=>'TMDB'
,p_internal_name=>'TMDB'
,p_description=>'A REST Source Catalog containing 4 REST data sources from The Movie Database: Popular Movies, Search Movies, Movie Details, and Movie Cast.'
,p_format=>'APEX'
);
end;
/
prompt --workspace/rest-source-catalogs/services//movie_cast
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '{'||wwv_flow.LF||
'"data_profile":{'||wwv_flow.LF||
'"name":"Movie Cast"'||wwv_flow.LF||
',"format":"JSON"'||wwv_flow.LF||
',"has_header_row":"N"'||wwv_flow.LF||
',"row_selector":"cast"';
wwv_flow_imp.g_varchar2_table(2) := ''||wwv_flow.LF||
',"is_single_row":"N"'||wwv_flow.LF||
',"columns":['||wwv_flow.LF||
'{'||wwv_flow.LF||
'"name":"NAME"'||wwv_flow.LF||
',"sequence":2'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":';
wwv_flow_imp.g_varchar2_table(3) := '"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector"';
wwv_flow_imp.g_varchar2_table(4) := ':"name"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"ADULT"'||wwv_flow.LF||
',"sequence":3'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length';
wwv_flow_imp.g_varchar2_table(5) := '":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"adult"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"O';
wwv_flow_imp.g_varchar2_table(6) := 'RDER_"'||wwv_flow.LF||
',"sequence":4'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"';
wwv_flow_imp.g_varchar2_table(7) := 'N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"order"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"GENDER"'||wwv_flow.LF||
',"sequence":5'||wwv_flow.LF||
',"is_primary_key":"N"';
wwv_flow_imp.g_varchar2_table(8) := ''||wwv_flow.LF||
',"data_type":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"gende';
wwv_flow_imp.g_varchar2_table(9) := 'r"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"CAST_ID"'||wwv_flow.LF||
',"sequence":6'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":';
wwv_flow_imp.g_varchar2_table(10) := '"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"cast_id"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"ID"'||wwv_flow.LF||
',"sequence":1'||wwv_flow.LF||
',"is_';
wwv_flow_imp.g_varchar2_table(11) := 'primary_key":"N"'||wwv_flow.LF||
',"data_type":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"';
wwv_flow_imp.g_varchar2_table(12) := 'selector":"id"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"CHARACTER"'||wwv_flow.LF||
',"sequence":7'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',';
wwv_flow_imp.g_varchar2_table(13) := '"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"character"';
wwv_flow_imp.g_varchar2_table(14) := ''||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"CREDIT_ID"'||wwv_flow.LF||
',"sequence":8'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4';
wwv_flow_imp.g_varchar2_table(15) := '000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"credit_id"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"';
wwv_flow_imp.g_varchar2_table(16) := 'POPULARITY"'||wwv_flow.LF||
',"sequence":9'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidd';
wwv_flow_imp.g_varchar2_table(17) := 'en":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"popularity"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"PROFILE_PATH"'||wwv_flow.LF||
',"sequence":10'||wwv_flow.LF||
',"is';
wwv_flow_imp.g_varchar2_table(18) := '_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',';
wwv_flow_imp.g_varchar2_table(19) := '"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"profile_path"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"ORIGINAL_NAME"'||wwv_flow.LF||
',"sequence":11'||wwv_flow.LF||
',"is_prima';
wwv_flow_imp.g_varchar2_table(20) := 'ry_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_fi';
wwv_flow_imp.g_varchar2_table(21) := 'lterable":"Y"'||wwv_flow.LF||
',"selector":"original_name"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"KNOWN_FOR_DEPARTMENT"'||wwv_flow.LF||
',"sequence":12'||wwv_flow.LF||
',"is_pri';
wwv_flow_imp.g_varchar2_table(22) := 'mary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_';
wwv_flow_imp.g_varchar2_table(23) := 'filterable":"Y"'||wwv_flow.LF||
',"selector":"known_for_department"'||wwv_flow.LF||
'}'||wwv_flow.LF||
']'||wwv_flow.LF||
'}'||wwv_flow.LF||
',"plugin_attributes":{'||wwv_flow.LF||
'"5":"1"'||wwv_flow.LF||
',"8":"OFFSET';
wwv_flow_imp.g_varchar2_table(24) := '"'||wwv_flow.LF||
',"10":"EQUALS"'||wwv_flow.LF||
',"11":"true"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',"operations":['||wwv_flow.LF||
'{'||wwv_flow.LF||
'"operation":"GET"'||wwv_flow.LF||
',"database_operation":"FETCH_COL';
wwv_flow_imp.g_varchar2_table(25) := 'LECTION"'||wwv_flow.LF||
',"url_pattern":"."'||wwv_flow.LF||
',"allow_fetch_all_rows":"N"'||wwv_flow.LF||
',"parameters":['||wwv_flow.LF||
']'||wwv_flow.LF||
'}'||wwv_flow.LF||
']'||wwv_flow.LF||
',"parameters":['||wwv_flow.LF||
'{'||wwv_flow.LF||
'"nam';
wwv_flow_imp.g_varchar2_table(26) := 'e":"movie_id"'||wwv_flow.LF||
',"param_type":"URL_PATTERN"'||wwv_flow.LF||
',"is_required":"N"'||wwv_flow.LF||
',"direction":"IN"'||wwv_flow.LF||
',"value":"505"'||wwv_flow.LF||
',"is_s';
wwv_flow_imp.g_varchar2_table(27) := 'tatic":"N"'||wwv_flow.LF||
',"is_array":"N"'||wwv_flow.LF||
',"omit_when_null":"N"'||wwv_flow.LF||
',"is_query_param":"N"'||wwv_flow.LF||
'}'||wwv_flow.LF||
']'||wwv_flow.LF||
'}'||wwv_flow.LF||
'';
wwv_web_src_catalog_api.create_catalog_service(
 p_id=>wwv_flow_imp.id(20095142581855705815)
,p_catalog_id=>wwv_flow_imp.id(29212085783740236785)
,p_name=>'Movie Cast'
,p_base_url=>'https://api.themoviedb.org/3/'
,p_service_path=>'movie/:movie_id/credits'
,p_plugin_internal_name=>'NATIVE_HTTP'
,p_authentication_type=>'HTTP_QUERY_STRING'
,p_details_json=>wwv_flow_imp.g_varchar2_table
,p_version=>'20220802'
);
end;
/
prompt --workspace/rest-source-catalogs/services//movie_details
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '{'||wwv_flow.LF||
'"data_profile":{'||wwv_flow.LF||
'"name":"Movie Details"'||wwv_flow.LF||
',"format":"JSON"'||wwv_flow.LF||
',"has_header_row":"N"'||wwv_flow.LF||
',"is_single_row":"N';
wwv_flow_imp.g_varchar2_table(2) := '"'||wwv_flow.LF||
',"columns":['||wwv_flow.LF||
'{'||wwv_flow.LF||
'"name":"BACKDROP_PATH"'||wwv_flow.LF||
',"sequence":18'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"';
wwv_flow_imp.g_varchar2_table(3) := ''||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"backdrop';
wwv_flow_imp.g_varchar2_table(4) := '_path"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"ORIGINAL_TITLE"'||wwv_flow.LF||
',"sequence":19'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"m';
wwv_flow_imp.g_varchar2_table(5) := 'ax_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"original_tit';
wwv_flow_imp.g_varchar2_table(6) := 'le"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"ORIGINAL_LANGUAGE"'||wwv_flow.LF||
',"sequence":20'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"m';
wwv_flow_imp.g_varchar2_table(7) := 'ax_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"original_lan';
wwv_flow_imp.g_varchar2_table(8) := 'guage"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"BELONGS_TO_COLLECTION"'||wwv_flow.LF||
',"sequence":21'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHA';
wwv_flow_imp.g_varchar2_table(9) := 'R2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"belon';
wwv_flow_imp.g_varchar2_table(10) := 'gs_to_collection"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"VOTE_COUNT"'||wwv_flow.LF||
',"sequence":14'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"NUMBER';
wwv_flow_imp.g_varchar2_table(11) := '"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"vote_count"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"P';
wwv_flow_imp.g_varchar2_table(12) := 'OSTER_PATH"'||wwv_flow.LF||
',"sequence":15'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_ti';
wwv_flow_imp.g_varchar2_table(13) := 'me_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"poster_path"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"RELEASE_DA';
wwv_flow_imp.g_varchar2_table(14) := 'TE"'||wwv_flow.LF||
',"sequence":16'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"DATE"'||wwv_flow.LF||
',"format_mask":"YYYY\"-\"MM\"-\"DD"'||wwv_flow.LF||
',"h';
wwv_flow_imp.g_varchar2_table(15) := 'as_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"release_date"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"VOTE';
wwv_flow_imp.g_varchar2_table(16) := '_AVERAGE"'||wwv_flow.LF||
',"sequence":17'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidde';
wwv_flow_imp.g_varchar2_table(17) := 'n":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"vote_average"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"ID"'||wwv_flow.LF||
',"sequence":1'||wwv_flow.LF||
',"is_primary_k';
wwv_flow_imp.g_varchar2_table(18) := 'ey":"N"'||wwv_flow.LF||
',"data_type":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector"';
wwv_flow_imp.g_varchar2_table(19) := ':"id"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"ADULT"'||wwv_flow.LF||
',"sequence":2'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":';
wwv_flow_imp.g_varchar2_table(20) := '4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"adult"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"TIT';
wwv_flow_imp.g_varchar2_table(21) := 'LE"'||wwv_flow.LF||
',"sequence":3'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":';
wwv_flow_imp.g_varchar2_table(22) := '"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"title"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"VIDEO"'||wwv_flow.LF||
',"sequence":4'||wwv_flow.LF||
',"is';
wwv_flow_imp.g_varchar2_table(23) := '_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',';
wwv_flow_imp.g_varchar2_table(24) := '"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"video"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"BUDGET"'||wwv_flow.LF||
',"sequence":5'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"d';
wwv_flow_imp.g_varchar2_table(25) := 'ata_type":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"budget"'||wwv_flow.LF||
'}';
wwv_flow_imp.g_varchar2_table(26) := ''||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"STATUS"'||wwv_flow.LF||
',"sequence":6'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',';
wwv_flow_imp.g_varchar2_table(27) := '"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"status"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"IMDB_ID"';
wwv_flow_imp.g_varchar2_table(28) := ''||wwv_flow.LF||
',"sequence":7'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"';
wwv_flow_imp.g_varchar2_table(29) := ''||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"imdb_id"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"REVENUE"'||wwv_flow.LF||
',"sequence":8'||wwv_flow.LF||
',"i';
wwv_flow_imp.g_varchar2_table(30) := 's_primary_key":"N"'||wwv_flow.LF||
',"data_type":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(31) := ',"selector":"revenue"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"RUNTIME"'||wwv_flow.LF||
',"sequence":9'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"NUMBER';
wwv_flow_imp.g_varchar2_table(32) := '"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"runtime"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"TAGL';
wwv_flow_imp.g_varchar2_table(33) := 'INE"'||wwv_flow.LF||
',"sequence":10'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone';
wwv_flow_imp.g_varchar2_table(34) := '":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"tagline"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"HOMEPAGE"'||wwv_flow.LF||
',"sequence"';
wwv_flow_imp.g_varchar2_table(35) := ':11'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidde';
wwv_flow_imp.g_varchar2_table(36) := 'n":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"homepage"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"OVERVIEW"'||wwv_flow.LF||
',"sequence":12'||wwv_flow.LF||
',"is_primar';
wwv_flow_imp.g_varchar2_table(37) := 'y_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_fil';
wwv_flow_imp.g_varchar2_table(38) := 'terable":"Y"'||wwv_flow.LF||
',"selector":"overview"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"POPULARITY"'||wwv_flow.LF||
',"sequence":13'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"';
wwv_flow_imp.g_varchar2_table(39) := 'data_type":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"populari';
wwv_flow_imp.g_varchar2_table(40) := 'ty"'||wwv_flow.LF||
'}'||wwv_flow.LF||
']'||wwv_flow.LF||
'}'||wwv_flow.LF||
',"plugin_attributes":{'||wwv_flow.LF||
'"5":"1"'||wwv_flow.LF||
',"8":"OFFSET"'||wwv_flow.LF||
',"10":"EQUALS"'||wwv_flow.LF||
',"11":"true"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',"operations":[';
wwv_flow_imp.g_varchar2_table(41) := ''||wwv_flow.LF||
'{'||wwv_flow.LF||
'"operation":"GET"'||wwv_flow.LF||
',"database_operation":"FETCH_COLLECTION"'||wwv_flow.LF||
',"url_pattern":"."'||wwv_flow.LF||
',"allow_fetch_all_r';
wwv_flow_imp.g_varchar2_table(42) := 'ows":"N"'||wwv_flow.LF||
',"parameters":['||wwv_flow.LF||
']'||wwv_flow.LF||
'}'||wwv_flow.LF||
']'||wwv_flow.LF||
',"parameters":['||wwv_flow.LF||
'{'||wwv_flow.LF||
'"name":"movie_id"'||wwv_flow.LF||
',"param_type":"URL_PATTERN"'||wwv_flow.LF||
',"is_';
wwv_flow_imp.g_varchar2_table(43) := 'required":"N"'||wwv_flow.LF||
',"direction":"IN"'||wwv_flow.LF||
',"value":"505"'||wwv_flow.LF||
',"is_static":"N"'||wwv_flow.LF||
',"is_array":"N"'||wwv_flow.LF||
',"omit_when_null":"N';
wwv_flow_imp.g_varchar2_table(44) := '"'||wwv_flow.LF||
',"is_query_param":"N"'||wwv_flow.LF||
'}'||wwv_flow.LF||
']'||wwv_flow.LF||
'}'||wwv_flow.LF||
'';
wwv_web_src_catalog_api.create_catalog_service(
 p_id=>wwv_flow_imp.id(20095244659938813178)
,p_catalog_id=>wwv_flow_imp.id(29212085783740236785)
,p_name=>'Movie Details'
,p_base_url=>'https://api.themoviedb.org/3/'
,p_service_path=>'movie/:movie_id'
,p_plugin_internal_name=>'NATIVE_HTTP'
,p_authentication_type=>'HTTP_QUERY_STRING'
,p_details_json=>wwv_flow_imp.g_varchar2_table
,p_version=>'20220802'
);
end;
/
prompt --workspace/rest-source-catalogs/services//popular_movies
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '{'||wwv_flow.LF||
'"data_profile":{'||wwv_flow.LF||
'"name":"Popular Movies"'||wwv_flow.LF||
',"format":"JSON"'||wwv_flow.LF||
',"has_header_row":"N"'||wwv_flow.LF||
',"row_selector":"r';
wwv_flow_imp.g_varchar2_table(2) := 'esults"'||wwv_flow.LF||
',"is_single_row":"N"'||wwv_flow.LF||
',"columns":['||wwv_flow.LF||
'{'||wwv_flow.LF||
'"name":"ID"'||wwv_flow.LF||
',"sequence":1'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_t';
wwv_flow_imp.g_varchar2_table(3) := 'ype":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"id"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name';
wwv_flow_imp.g_varchar2_table(4) := '":"ADULT"'||wwv_flow.LF||
',"sequence":2'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_';
wwv_flow_imp.g_varchar2_table(5) := 'zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"adult"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"TITLE"'||wwv_flow.LF||
',"sequence":';
wwv_flow_imp.g_varchar2_table(6) := '3'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden"';
wwv_flow_imp.g_varchar2_table(7) := ':"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"title"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"VIDEO"'||wwv_flow.LF||
',"sequence":4'||wwv_flow.LF||
',"is_primary_key":"N';
wwv_flow_imp.g_varchar2_table(8) := '"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":';
wwv_flow_imp.g_varchar2_table(9) := '"Y"'||wwv_flow.LF||
',"selector":"video"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"OVERVIEW"'||wwv_flow.LF||
',"sequence":5'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VAR';
wwv_flow_imp.g_varchar2_table(10) := 'CHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"ov';
wwv_flow_imp.g_varchar2_table(11) := 'erview"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"POPULARITY"'||wwv_flow.LF||
',"sequence":6'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"NUMBER"'||wwv_flow.LF||
',"has_tim';
wwv_flow_imp.g_varchar2_table(12) := 'e_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"popularity"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"VOTE_COUNT"'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(13) := ',"sequence":7'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is';
wwv_flow_imp.g_varchar2_table(14) := '_filterable":"Y"'||wwv_flow.LF||
',"selector":"vote_count"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"POSTER_PATH"'||wwv_flow.LF||
',"sequence":8'||wwv_flow.LF||
',"is_primary_key":';
wwv_flow_imp.g_varchar2_table(15) := '"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable';
wwv_flow_imp.g_varchar2_table(16) := '":"Y"'||wwv_flow.LF||
',"selector":"poster_path"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"RELEASE_DATE"'||wwv_flow.LF||
',"sequence":9'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"dat';
wwv_flow_imp.g_varchar2_table(17) := 'a_type":"DATE"'||wwv_flow.LF||
',"format_mask":"YYYY\"-\"MM\"-\"DD"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filter';
wwv_flow_imp.g_varchar2_table(18) := 'able":"Y"'||wwv_flow.LF||
',"selector":"release_date"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"VOTE_AVERAGE"'||wwv_flow.LF||
',"sequence":10'||wwv_flow.LF||
',"is_primary_key":"N"';
wwv_flow_imp.g_varchar2_table(19) := ''||wwv_flow.LF||
',"data_type":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"vote_';
wwv_flow_imp.g_varchar2_table(20) := 'average"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"BACKDROP_PATH"'||wwv_flow.LF||
',"sequence":11'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"';
wwv_flow_imp.g_varchar2_table(21) := 'max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"backdrop_pa';
wwv_flow_imp.g_varchar2_table(22) := 'th"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"ORIGINAL_TITLE"'||wwv_flow.LF||
',"sequence":12'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_';
wwv_flow_imp.g_varchar2_table(23) := 'length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"original_title"';
wwv_flow_imp.g_varchar2_table(24) := ''||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"ORIGINAL_LANGUAGE"'||wwv_flow.LF||
',"sequence":13'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_';
wwv_flow_imp.g_varchar2_table(25) := 'length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"original_langua';
wwv_flow_imp.g_varchar2_table(26) := 'ge"'||wwv_flow.LF||
'}'||wwv_flow.LF||
']'||wwv_flow.LF||
'}'||wwv_flow.LF||
',"plugin_attributes":{'||wwv_flow.LF||
'"5":"1"'||wwv_flow.LF||
',"8":"OFFSET"'||wwv_flow.LF||
',"10":"EQUALS"'||wwv_flow.LF||
',"11":"true"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',"operations":[';
wwv_flow_imp.g_varchar2_table(27) := ''||wwv_flow.LF||
'{'||wwv_flow.LF||
'"operation":"GET"'||wwv_flow.LF||
',"database_operation":"FETCH_COLLECTION"'||wwv_flow.LF||
',"url_pattern":"."'||wwv_flow.LF||
',"allow_fetch_all_r';
wwv_flow_imp.g_varchar2_table(28) := 'ows":"N"'||wwv_flow.LF||
',"parameters":['||wwv_flow.LF||
']'||wwv_flow.LF||
'}'||wwv_flow.LF||
']'||wwv_flow.LF||
',"parameters":['||wwv_flow.LF||
'{'||wwv_flow.LF||
'"name":"language"'||wwv_flow.LF||
',"param_type":"QUERY_STRING"'||wwv_flow.LF||
',"is';
wwv_flow_imp.g_varchar2_table(29) := '_required":"N"'||wwv_flow.LF||
',"direction":"IN"'||wwv_flow.LF||
',"value":"en-US"'||wwv_flow.LF||
',"is_static":"N"'||wwv_flow.LF||
',"is_array":"N"'||wwv_flow.LF||
',"omit_when_null"';
wwv_flow_imp.g_varchar2_table(30) := ':"N"'||wwv_flow.LF||
',"is_query_param":"N"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"page"'||wwv_flow.LF||
',"param_type":"QUERY_STRING"'||wwv_flow.LF||
',"is_required":"N"'||wwv_flow.LF||
',"dire';
wwv_flow_imp.g_varchar2_table(31) := 'ction":"IN"'||wwv_flow.LF||
',"value":"1"'||wwv_flow.LF||
',"is_static":"N"'||wwv_flow.LF||
',"is_array":"N"'||wwv_flow.LF||
',"omit_when_null":"N"'||wwv_flow.LF||
',"is_query_param":"N';
wwv_flow_imp.g_varchar2_table(32) := '"'||wwv_flow.LF||
'}'||wwv_flow.LF||
']'||wwv_flow.LF||
'}'||wwv_flow.LF||
'';
wwv_web_src_catalog_api.create_catalog_service(
 p_id=>wwv_flow_imp.id(20095172982177811492)
,p_catalog_id=>wwv_flow_imp.id(29212085783740236785)
,p_name=>'Popular Movies'
,p_base_url=>'https://api.themoviedb.org/3/'
,p_service_path=>'movie/popular'
,p_plugin_internal_name=>'NATIVE_HTTP'
,p_authentication_type=>'HTTP_QUERY_STRING'
,p_details_json=>wwv_flow_imp.g_varchar2_table
,p_version=>'20220802'
);
end;
/
prompt --workspace/rest-source-catalogs/services//search_movies
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '{'||wwv_flow.LF||
'"data_profile":{'||wwv_flow.LF||
'"name":"Search Movies"'||wwv_flow.LF||
',"format":"JSON"'||wwv_flow.LF||
',"has_header_row":"N"'||wwv_flow.LF||
',"row_selector":"re';
wwv_flow_imp.g_varchar2_table(2) := 'sults"'||wwv_flow.LF||
',"is_single_row":"N"'||wwv_flow.LF||
',"columns":['||wwv_flow.LF||
'{'||wwv_flow.LF||
'"name":"ID"'||wwv_flow.LF||
',"sequence":1'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_ty';
wwv_flow_imp.g_varchar2_table(3) := 'pe":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"id"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name"';
wwv_flow_imp.g_varchar2_table(4) := ':"ADULT"'||wwv_flow.LF||
',"sequence":2'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_z';
wwv_flow_imp.g_varchar2_table(5) := 'one":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"adult"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"TITLE"'||wwv_flow.LF||
',"sequence":3';
wwv_flow_imp.g_varchar2_table(6) := ''||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":';
wwv_flow_imp.g_varchar2_table(7) := '"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"title"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"VIDEO"'||wwv_flow.LF||
',"sequence":4'||wwv_flow.LF||
',"is_primary_key":"N"';
wwv_flow_imp.g_varchar2_table(8) := ''||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"';
wwv_flow_imp.g_varchar2_table(9) := 'Y"'||wwv_flow.LF||
',"selector":"video"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"OVERVIEW"'||wwv_flow.LF||
',"sequence":5'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARC';
wwv_flow_imp.g_varchar2_table(10) := 'HAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"ove';
wwv_flow_imp.g_varchar2_table(11) := 'rview"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"POPULARITY"'||wwv_flow.LF||
',"sequence":6'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"NUMBER"'||wwv_flow.LF||
',"has_time';
wwv_flow_imp.g_varchar2_table(12) := '_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"popularity"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"VOTE_COUNT"'||wwv_flow.LF||
',';
wwv_flow_imp.g_varchar2_table(13) := '"sequence":7'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_';
wwv_flow_imp.g_varchar2_table(14) := 'filterable":"Y"'||wwv_flow.LF||
',"selector":"vote_count"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"POSTER_PATH"'||wwv_flow.LF||
',"sequence":8'||wwv_flow.LF||
',"is_primary_key":"';
wwv_flow_imp.g_varchar2_table(15) := 'N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable"';
wwv_flow_imp.g_varchar2_table(16) := ':"Y"'||wwv_flow.LF||
',"selector":"poster_path"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"RELEASE_DATE"'||wwv_flow.LF||
',"sequence":9'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data';
wwv_flow_imp.g_varchar2_table(17) := '_type":"DATE"'||wwv_flow.LF||
',"format_mask":"YYYY\"-\"MM\"-\"DD"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filtera';
wwv_flow_imp.g_varchar2_table(18) := 'ble":"Y"'||wwv_flow.LF||
',"selector":"release_date"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"VOTE_AVERAGE"'||wwv_flow.LF||
',"sequence":10'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(19) := ',"data_type":"NUMBER"'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"vote_a';
wwv_flow_imp.g_varchar2_table(20) := 'verage"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"BACKDROP_PATH"'||wwv_flow.LF||
',"sequence":11'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"m';
wwv_flow_imp.g_varchar2_table(21) := 'ax_length":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"backdrop_pat';
wwv_flow_imp.g_varchar2_table(22) := 'h"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"ORIGINAL_TITLE"'||wwv_flow.LF||
',"sequence":12'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_l';
wwv_flow_imp.g_varchar2_table(23) := 'ength":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"original_title"'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(24) := '}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"ORIGINAL_LANGUAGE"'||wwv_flow.LF||
',"sequence":13'||wwv_flow.LF||
',"is_primary_key":"N"'||wwv_flow.LF||
',"data_type":"VARCHAR2"'||wwv_flow.LF||
',"max_l';
wwv_flow_imp.g_varchar2_table(25) := 'ength":4000'||wwv_flow.LF||
',"has_time_zone":"N"'||wwv_flow.LF||
',"is_hidden":"N"'||wwv_flow.LF||
',"is_filterable":"Y"'||wwv_flow.LF||
',"selector":"original_languag';
wwv_flow_imp.g_varchar2_table(26) := 'e"'||wwv_flow.LF||
'}'||wwv_flow.LF||
']'||wwv_flow.LF||
'}'||wwv_flow.LF||
',"plugin_attributes":{'||wwv_flow.LF||
'"1":"PAGE_NUMBER_FIXED_SIZE"'||wwv_flow.LF||
',"4":"page"'||wwv_flow.LF||
',"5":"1"'||wwv_flow.LF||
',"6":"20"'||wwv_flow.LF||
',"8":"OF';
wwv_flow_imp.g_varchar2_table(27) := 'FSET"'||wwv_flow.LF||
',"10":"EQUALS"'||wwv_flow.LF||
',"11":"true"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',"operations":['||wwv_flow.LF||
'{'||wwv_flow.LF||
'"operation":"GET"'||wwv_flow.LF||
',"database_operation":"FETCH';
wwv_flow_imp.g_varchar2_table(28) := '_COLLECTION"'||wwv_flow.LF||
',"url_pattern":"."'||wwv_flow.LF||
',"legacy_ords_fixed_page_size":20'||wwv_flow.LF||
',"allow_fetch_all_rows":"N"'||wwv_flow.LF||
',"para';
wwv_flow_imp.g_varchar2_table(29) := 'meters":['||wwv_flow.LF||
']'||wwv_flow.LF||
'}'||wwv_flow.LF||
']'||wwv_flow.LF||
',"parameters":['||wwv_flow.LF||
'{'||wwv_flow.LF||
'"name":"language"'||wwv_flow.LF||
',"param_type":"QUERY_STRING"'||wwv_flow.LF||
',"is_required":"N"'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(30) := ',"direction":"IN"'||wwv_flow.LF||
',"value":"en-US"'||wwv_flow.LF||
',"is_static":"N"'||wwv_flow.LF||
',"is_array":"N"'||wwv_flow.LF||
',"omit_when_null":"N"'||wwv_flow.LF||
',"is_query';
wwv_flow_imp.g_varchar2_table(31) := '_param":"N"'||wwv_flow.LF||
'}'||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"query"'||wwv_flow.LF||
',"param_type":"QUERY_STRING"'||wwv_flow.LF||
',"is_required":"N"'||wwv_flow.LF||
',"direction":"IN"'||wwv_flow.LF||
',"';
wwv_flow_imp.g_varchar2_table(32) := 'value":"harry potter"'||wwv_flow.LF||
',"is_static":"N"'||wwv_flow.LF||
',"is_array":"N"'||wwv_flow.LF||
',"omit_when_null":"N"'||wwv_flow.LF||
',"is_query_param":"N"'||wwv_flow.LF||
'}';
wwv_flow_imp.g_varchar2_table(33) := ''||wwv_flow.LF||
',{'||wwv_flow.LF||
'"name":"include_adult"'||wwv_flow.LF||
',"param_type":"QUERY_STRING"'||wwv_flow.LF||
',"is_required":"N"'||wwv_flow.LF||
',"direction":"IN"'||wwv_flow.LF||
',"value';
wwv_flow_imp.g_varchar2_table(34) := '":"false"'||wwv_flow.LF||
',"is_static":"N"'||wwv_flow.LF||
',"is_array":"N"'||wwv_flow.LF||
',"omit_when_null":"N"'||wwv_flow.LF||
',"is_query_param":"N"'||wwv_flow.LF||
'}'||wwv_flow.LF||
']'||wwv_flow.LF||
'}'||wwv_flow.LF||
'';
wwv_web_src_catalog_api.create_catalog_service(
 p_id=>wwv_flow_imp.id(20095096050852703681)
,p_catalog_id=>wwv_flow_imp.id(29212085783740236785)
,p_name=>'Search Movies'
,p_base_url=>'https://api.themoviedb.org/3/'
,p_service_path=>'search/movie'
,p_plugin_internal_name=>'NATIVE_HTTP'
,p_authentication_type=>'HTTP_QUERY_STRING'
,p_details_json=>wwv_flow_imp.g_varchar2_table
,p_version=>'20220802'
);
end;
/
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
