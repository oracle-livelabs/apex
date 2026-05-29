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
,p_default_workspace_id=>3001962467824647
,p_default_application_id=>101
,p_default_id_offset=>18014033506041179
,p_default_owner=>'AI-VISION'
);
end;
/
 
prompt APPLICATION 101 - APEX Social Media
--
-- Application Export:
--   Application:     101
--   Name:            APEX Social Media
--   Date and Time:   09:10 Friday May 29, 2026
--   Exported By:     SOCIAL-MEDIA-ADMIN
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                      3
--       Items:                   10
--       Processes:                6
--       Regions:                  5
--       Buttons:                  3
--       Dynamic Actions:          7
--     Shared Components:
--       Logic:
--         Processes:              1
--         Build Options:          2
--       Navigation:
--         Lists:                  2
--         Breadcrumbs:            1
--       Security:
--         Authentication:         1
--         Authorization:          1
--       User Interface:
--         Themes:                 1
--         Templates:
--         Plug-ins:               1
--       PWA:
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--       Install scripts:          1
--   Version:         26.1.0
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
,p_owner=>nvl(wwv_flow_application_install.get_schema,'AI-VISION')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'APEX Social Media')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'APEX-SOCIAL-MEDIA48866101')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'90BDCEEAC89CBC80D89ADAD9A7AF6BD736DDE3B597794D0B8ADD1B0D536C5C53'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'21.2'
,p_accessible_read_only=>'N'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix=>nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(7715188987048723514)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'APEX Social Media'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_pass_ecid=>'N'
,p_authorize_batch_job=>'N'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_modernization_available=>'Y'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'APEX Instagram'
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>7
,p_version_scn=>'11428000'
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'Y'
,p_pwa_manifest_display=>'standalone'
,p_pwa_manifest_orientation=>'any'
,p_pwa_is_push_enabled=>'N'
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(233112119192677804375)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>2469215554099805162
,p_nav_list_template_options=>'#DEFAULT#:js-defaultCollapsed:js-navCollapsed--hidden:t-TreeNav--styleA'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(233112719463326804473)
,p_nav_bar_list_template_id=>2849019392706229583
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/com_oracle_apex_enhanced_file_uploader
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(243133285270761082090)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.ORACLE.APEX.ENHANCED_FILE_UPLOADER'
,p_display_name=>'Enhanced File Uploader'
,p_apexlang_name=>'enhancedFileUploader'
,p_category=>'EXECUTE'
,p_image_prefix=>nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','COM.ORACLE.APEX.ENHANCED_FILE_UPLOADER'),'')
,p_javascript_file_urls=>'#PLUGIN_FILES#enhancedFileUpload#MIN#.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render(',
'             p_dynamic_action in apex_plugin.t_dynamic_action,',
'             p_plugin         in apex_plugin.t_plugin )',
'    return apex_plugin.t_dynamic_action_render_result is',
'',
'    l_result                    apex_plugin.t_dynamic_action_render_result;',
'',
'    c_enable_image_resize       constant boolean          := case when p_dynamic_action.attribute_01 = ''Y'' then true else false end;',
'    c_max_image_size            constant number           := p_dynamic_action.attribute_02;',
'    c_enable_image_preview      constant boolean          := case when p_dynamic_action.attribute_03 = ''Y'' then true else false end;',
'    c_preview_container         constant varchar2( 255 )  := p_dynamic_action.attribute_04;',
'    c_items_to_submit           constant varchar2( 4000 ) := p_dynamic_action.attribute_08;',
'    c_show_processing           constant boolean          := case when p_dynamic_action.attribute_09 = ''Y'' then true else false end;',
'    c_cancel_uploads_esc        constant boolean          := case when p_dynamic_action.attribute_10 = ''Y'' then true else false end;',
'    c_file_processing_function  constant varchar2( 4000 ) := coalesce( p_dynamic_action.attribute_11, ''null'' );',
'',
'    l_component_config_json     clob := empty_clob();',
'',
'    function get_da_item_element( p_action_id in number ) return varchar2 is',
'      l_da_element  apex_application_page_da.when_element%type;',
'      c_app_id      constant number := nv( ''APP_ID'' );',
'',
'      cursor l_cur_da_element is',
'        select aapda.affected_elements',
'          from apex_application_page_da_acts aapda',
'         where aapda.application_id = c_app_id',
'           and aapda.action_id = p_action_id',
'           and aapda.affected_elements_type_code = ''ITEM'';',
'    begin',
'      open l_cur_da_element;',
'      fetch l_cur_da_element',
'        into l_da_element;',
'      close l_cur_da_element;',
'',
'      return l_da_element;',
'',
'    end get_da_item_element;',
'',
'  begin',
'    -- build component config json',
'    apex_json.initialize_clob_output;',
'    apex_json.open_object();',
'    ',
'    apex_json.write( ''affectedElement'',',
'                     get_da_item_element( p_action_id => p_dynamic_action.id ) );',
'    apex_json.write( ''enableImageResize'',',
'                     c_enable_image_resize );',
'    apex_json.write( ''maxImageSize'',',
'                     c_max_image_size );',
'    apex_json.write( ''enableImagePreview'',',
'                     c_enable_image_preview );',
'    apex_json.write( ''previewContainer'',',
'                     c_preview_container );',
'    apex_json.write( ''itemsToSubmit'',',
'                     c_items_to_submit );',
'    apex_json.write( ''showProcessing'',',
'                     c_show_processing );',
'    apex_json.write( ''cancelWithEscape'',',
'                     c_cancel_uploads_esc );',
'    apex_json.write( ''ajaxIdentifier'',',
'                     apex_plugin.get_ajax_identifier );',
'    apex_json.close_object();',
'    --',
'    l_component_config_json := apex_json.get_clob_output;',
'    apex_json.free_output;',
'    -- da javascript function',
'    l_result.javascript_function := ''function(){apex.da.enhancedFileUpload(this,'' || l_component_config_json ||',
'                                    '','' || c_file_processing_function || '');}'';',
'    --',
'    return l_result;',
'    --',
'  end render;',
'',
'function ajax(',
'             p_dynamic_action in apex_plugin.t_dynamic_action,',
'             p_plugin         in apex_plugin.t_plugin )',
'  return apex_plugin.t_dynamic_action_ajax_result is',
'',
'  l_result               apex_plugin.t_dynamic_action_ajax_result;',
'',
'  c_storage_collection   constant varchar2( 50 ) := ''COLLECTION'';',
'  c_storage_plsql        constant varchar2( 50 ) := ''PLSQL'';',
'',
'  c_save_in              constant varchar2( 50 )   := coalesce( p_dynamic_action.attribute_05, c_storage_collection );',
'  c_collection_name      constant varchar2( 255 )  := p_dynamic_action.attribute_06;',
'  c_plsql_code           constant varchar2( 4000 ) := p_dynamic_action.attribute_07;',
'  c_items_to_submit      constant varchar2( 4000 ) := p_dynamic_action.attribute_08;',
'  c_apex_storage_name    constant varchar2( 255 )  := apex_application.g_f01(1);',
'  c_file_metadata        constant varchar2( 4000 ) := apex_application.g_x03;',
'  c_plsql_code_upper     constant varchar2( 4000 ) := upper( c_plsql_code );',
'  ',
'  l_parameters           apex_exec.t_parameters;',
'  l_items_to_submit_arr  apex_t_varchar2;',
'',
'begin',
'  -- save in APEX collection',
'  if c_save_in = c_storage_collection then',
'      if not apex_collection.collection_exists( p_collection_name => c_collection_name ) then',
'          apex_collection.create_collection( p_collection_name => c_collection_name );',
'      end if;',
'',
'      for l_rec_file in ( select aaf.filename,',
'                                 aaf.mime_type,',
'                                 aaf.doc_size,',
'                                 aaf.blob_content',
'                            from apex_application_files aaf',
'                           where aaf.name = c_apex_storage_name ) loop',
'',
'          apex_collection.add_member(',
'              p_collection_name => c_collection_name,',
'              p_c001            => l_rec_file.filename,',
'              p_c002            => l_rec_file.mime_type,',
'              p_c003            => c_file_metadata,',
'              p_d001            => sysdate,',
'              p_n001            => l_rec_file.doc_size,',
'              p_blob001         => l_rec_file.blob_content',
'          );',
'',
'    end loop;',
'',
'  end if;',
'',
'  -- save using custom PL/SQL',
'  if c_save_in = c_storage_plsql then',
'      -- add parameters / bind variables',
'      l_items_to_submit_arr := apex_string.split( p_str => c_items_to_submit, p_sep => '','' );',
'      for i in 1..l_items_to_submit_arr.count',
'      loop',
'          if instr( c_plsql_code_upper, l_items_to_submit_arr(i) ) > 0 then',
'              apex_exec.add_parameter(',
'                  p_parameters => l_parameters,',
'                  p_name       => l_items_to_submit_arr(i),',
'                  p_value      => v( l_items_to_submit_arr(i) ) );',
'          end if;',
'      end loop;',
'      ',
'      if instr( c_plsql_code_upper, ''APEX$STORAGENAME'' ) > 0 then',
'          apex_exec.add_parameter(',
'              p_parameters => l_parameters,',
'              p_name       => ''APEX$STORAGENAME'',',
'              p_value      => c_apex_storage_name );',
'      end if;',
'      if instr( c_plsql_code_upper, ''APEX$FILENAME'' ) > 0 then',
'          apex_exec.add_parameter(',
'              p_parameters => l_parameters,',
'              p_name       => ''APEX$FILENAME'',',
'              p_value      => apex_application.g_x01 );',
'      end if;',
'      if instr( c_plsql_code_upper, ''APEX$MIMETYPE'' ) > 0 then',
'          apex_exec.add_parameter(',
'              p_parameters => l_parameters,',
'              p_name       => ''APEX$MIMETYPE'',',
'              p_value      => apex_application.g_x02 );',
'      end if;',
'      if instr( c_plsql_code_upper, ''APEX$METADATA'' ) > 0 then',
'          apex_exec.add_parameter(',
'              p_parameters => l_parameters,',
'              p_name       => ''APEX$METADATA'',',
'              p_value      => c_file_metadata );',
'      end if;',
'    ',
'      -- execute pl/sql',
'      apex_exec.execute_plsql(',
'          p_plsql_code      => c_plsql_code,',
'          p_auto_bind_items => false,',
'          p_sql_parameters  => l_parameters );',
'  end if;',
'',
'  -- delete original file',
'  delete from apex_application_files aaf',
'     where aaf.name = c_apex_storage_name;',
'  ',
'  sys.htp.init;',
'  sys.htp.p( ''{"success":true}'' );',
'',
'  return l_result;',
'exception when others then',
'    sys.htp.init;',
'    sys.htp.p( ''{"success":false}'' );',
'end ajax;'))
,p_api_version=>1
,p_render_function=>'render'
,p_ajax_function=>'ajax'
,p_standard_attributes=>'ITEM:REQUIRED:STOP_EXECUTION_ON_ERROR:WAIT_FOR_RESULT'
,p_substitute_attributes=>true
,p_version_scn=>'11427442'
,p_help_text=>'Dynamic Action plugin which enhances the functionality of the built-in File Browse item and uploads files using AJAX.'
,p_version_identifier=>'1.0.0'
,p_about_url=>'https://oracle.github.io/apex/'
,p_files_version=>235
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(243133377193450101872)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'attribute_01'
,p_prompt=>'Enable Image Resize'
,p_apexlang_name=>'enableImageResize'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'This option enables image resizing before the file is uploaded to the server.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(243133429169298112224)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'attribute_02'
,p_prompt=>'Max. Image Size'
,p_apexlang_name=>'maxImageSize'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'1024'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(243133377193450101872)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'This option downscales the image to fit into max * max size.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(243133439768236114634)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'attribute_03'
,p_prompt=>'Enable Image Preview'
,p_apexlang_name=>'enableImagePreview'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(243133377193450101872)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'This option enables previewing the downscaled image within a given HTML container element.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(243133169102011408768)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'attribute_04'
,p_prompt=>'Preview Container Selector'
,p_apexlang_name=>'previewContainerSelector'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(243133439768236114634)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_examples=>'.my_element, #MY_ELEMENT'
,p_help_text=>'This option defines the HTML container element which is used to render the image preview. Use an valid jQuery selector'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(234211343562649170419)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'attribute_05'
,p_prompt=>'Save Files In'
,p_apexlang_name=>'saveFilesIn'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'COLLECTION'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Either store the uploaded files in an APEX Collection by just providing the collection name or by providing custom PL/SQL code. The latter gives you full control over the saving logic.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(234211343861336172339)
,p_plugin_attribute_id=>wwv_flow_imp.id(234211343562649170419)
,p_display_sequence=>10
,p_display_value=>'APEX Collection'
,p_return_value=>'COLLECTION'
,p_apexlang_name=>'apexCollection'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(234211344336369173443)
,p_plugin_attribute_id=>wwv_flow_imp.id(234211343562649170419)
,p_display_sequence=>20
,p_display_value=>'PL/SQL'
,p_return_value=>'PLSQL'
,p_apexlang_name=>'plSql'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(234211344739457177822)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_static_id=>'attribute_06'
,p_prompt=>'Collection Name'
,p_apexlang_name=>'collectionName'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(234211343562649170419)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'COLLECTION'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'select seq_id,',
'       c001    as file_name,',
'       c002    as mime_type,',
'       c003    as file_metadata,',
'       d001    as upload_date,',
'       n001    as file_size,',
'       blob001 as file_content',
'  from apex_collections',
' where collection_name = ''<YOUR_COLLECTION_NAME>''',
'</pre>'))
,p_help_text=>'Enter the name of the APEX Collection storing the uploaded files.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(243133526997723134319)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_static_id=>'attribute_07'
,p_prompt=>'PL/SQL Code'
,p_apexlang_name=>'plSqlCode'
,p_attribute_type=>'PLSQL'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(234211343562649170419)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PLSQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'declare',
'    l_collection  varchar2( 255 )  := ''FILE_UPLOAD_COLLECTION'';',
'begin',
'    if not apex_collection.collection_exists( p_collection_name => l_collection ) then',
'        apex_collection.create_collection( p_collection_name => l_collection );',
'    end if;',
'',
'    for l_rec_file in ( select aaf.filename,    -- file name',
'                               aaf.mime_type,   -- mime type',
'                               aaf.doc_size,    -- file size in byte',
'                               aaf.blob_content -- file content as blob',
'                          from apex_application_files aaf',
'                         where aaf.name = :APEX$STORAGENAME ) loop',
'      ',
'        apex_collection.add_member(',
'            p_collection_name => l_collection,',
'            p_c001            => l_rec_file.filename,',
'            p_c002            => l_rec_file.mime_type,',
'            p_c003            => :APEX$METADATA,',
'            p_c004            => :P99_ITEM1 || '', '' || :P99_ITEM2,',
'            p_n001            => l_rec_file.doc_size,',
'            p_blob001         => l_rec_file.blob_content',
'        );',
'',
'    end loop;',
'',
'end;',
'</pre>'))
,p_help_text=>'This option defines the PL/SQL Code which is used to process the uploaded files. This can be used to store the files to a given table or collection.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(243133793552688160126)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_static_id=>'attribute_08'
,p_prompt=>'Page Items to Submit'
,p_apexlang_name=>'pageItemsToSubmit'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(234211343562649170419)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PLSQL'
,p_help_text=>'This options defines the page items which will get submitted to the server during file upload. The session state of these items is then available on the server.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(243152633126529870646)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_static_id=>'attribute_09'
,p_prompt=>'Show Processing'
,p_apexlang_name=>'showProcessing'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'This option enables a waiting indicator during file upload to show a user that something is processing in the background.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(234211331795086927251)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_static_id=>'attribute_10'
,p_prompt=>'Cancel Uploads using ESC Key'
,p_apexlang_name=>'cancelUploadsUsingEscKey'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Should it be possible to cancel file uploads pressing the ESC key? This will only cancel the particular file which is uploaded, if multiple file uploads are configured, the next file will be processed.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(234211303476530763226)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_static_id=>'attribute_11'
,p_prompt=>'File Processing JavaScript Function'
,p_apexlang_name=>'fileProcessingJavascriptFunction'
,p_attribute_type=>'JAVASCRIPT'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'async function( file ) {',
'    file._metadata = { "field1": "value1", "field2": "value2" };',
'    return file;',
'}',
'</pre>',
'',
'<pre>',
'async function( file ) {',
'',
'    if ( file.type.startsWith( "image/" ) ) {',
'        file._metadata = await getEXIFMetadata( file );',
'    }',
'',
'    if ( file.type.startsWith( "audio/" ) ) {',
'        const tags = await getAudioMetadata( file );',
'        file._metadata = {',
'            artist: tags.artist,',
'            title: tags.title,',
'            album: tags.album,',
'            year: tags.year',
'        }',
'    }',
'',
'    if ( file.name.toLowerCase().endsWith( ".txt" ) ) {',
'        file._cancel = true;',
'    }',
'',
'    return file;',
'}',
'</pre>'))
,p_help_text=>'Provide an optional async JavaScript function to do file manipulations before the file gets uploaded to the server. To add metadata to a file use <i>file._metadata = {}</i>, this can then be used with the bind variable <i>:APEX$METADATA</i> on the se'
||'rver. To cancel the upload of a given file, just add <i>file._cancel = true</i> flag.'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(243151695571501466398)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_name=>'enhancedfileuploadercomplete'
,p_display_name=>'File Upload Complete'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(243151695219928466397)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_name=>'enhancedfileuploadererror'
,p_display_name=>'File Upload Error'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(234211329146885655441)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_name=>'enhancedfileuploaderfilecancel'
,p_display_name=>'FIle Upload Canceled'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(234211190081222905635)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_name=>'enhancedfileuploaderfileprogress'
,p_display_name=>'File Upload Progress'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(243151694854937466393)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_name=>'enhancedfileuploadersuccess'
,p_display_name=>'File Upload Success'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(234211190456963905636)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_name=>'enhancedfileuploadertotalprogress'
,p_display_name=>'Total Upload Progress'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A210A20436F707972696768742028632920323032322C204F7261636C6520616E642F6F722069747320616666696C69617465732E20416C6C207269676874732072657365727665642E0A202A2F0A282066756E6374696F6E20282064612C20757469';
wwv_flow_imp.g_varchar2_table(2) := '6C2C206974656D2C206576656E742C206D6573736167652C20656E762C2064656275672C20242029207B0A202020202275736520737472696374223B0A0A202020202F2A2A0A20202020202A20496E697469616C697A6174696F6E2066756E6374696F6E';
wwv_flow_imp.g_varchar2_table(3) := '20666F7220456E68616E6365642046696C652055706C6F6164657220444120706C7567696E0A20202020202A0A20202020202A204069676E6F72650A20202020202A2040706172616D207B6F626A6563747D2070416374696F6E0A20202020202A0A2020';
wwv_flow_imp.g_varchar2_table(4) := '2020202A2040706172616D207B6F626A6563747D20704F7074696F6E73205265717569726564206F7074696F6E73206F626A6563742E0A20202020202A2040706172616D207B737472696E677D20704F7074696F6E732E6166666563746564456C656D65';
wwv_flow_imp.g_varchar2_table(5) := '6E740A20202020202A2040706172616D207B626F6F6C65616E7D20704F7074696F6E732E656E61626C65496D616765526573697A650A20202020202A2040706172616D207B6E756D6265727D20704F7074696F6E732E6D6178496D61676553697A650A20';
wwv_flow_imp.g_varchar2_table(6) := '202020202A2040706172616D207B626F6F6C65616E7D20704F7074696F6E732E656E61626C65496D616765507265766965770A20202020202A2040706172616D207B737472696E677D20704F7074696F6E732E70726576696577436F6E7461696E65720A';
wwv_flow_imp.g_varchar2_table(7) := '20202020202A2040706172616D207B61727261797D20704F7074696F6E732E6974656D73546F5375626D69740A20202020202A2040706172616D207B626F6F6C65616E7D20704F7074696F6E732E73686F7750726F63657373696E670A20202020202A20';
wwv_flow_imp.g_varchar2_table(8) := '40706172616D207B737472696E677D20704F7074696F6E732E616A61784964656E7469666965720A20202020202A0A20202020202A2040706172616D207B66756E6374696F6E7D207046696C6550726F63657373696E6746756E6374696F6E0A20202020';
wwv_flow_imp.g_varchar2_table(9) := '202A2F0A2020202064612E656E68616E63656446696C6555706C6F6164203D2066756E6374696F6E20282070416374696F6E2C20704F7074696F6E732C207046696C6550726F63657373696E6746756E6374696F6E2029207B0A2020202020202020636F';
wwv_flow_imp.g_varchar2_table(10) := '6E737420504C5547494E203D2022434F4D2E4F5241434C452E415045582E454E48414E4345445F46494C455F55504C4F41444552222C0A20202020202020202020202020204556454E545F505245464958203D2022656E68616E63656466696C6575706C';
wwv_flow_imp.g_varchar2_table(11) := '6F61646572222C0A20202020202020202020202020204556454E545F414A41585F53554343455353203D204556454E545F505245464958202B202273756363657373222C0A20202020202020202020202020204556454E545F414A41585F4552524F5220';
wwv_flow_imp.g_varchar2_table(12) := '3D204556454E545F505245464958202B20226572726F72222C0A20202020202020202020202020204556454E545F55504C4F41445F434F4D504C455445203D204556454E545F505245464958202B2022636F6D706C657465222C0A202020202020202020';
wwv_flow_imp.g_varchar2_table(13) := '20202020204556454E545F46494C455F43414E43454C203D204556454E545F505245464958202B202266696C6563616E63656C222C0A20202020202020202020202020204556454E545F46494C455F50524F4752455353203D204556454E545F50524546';
wwv_flow_imp.g_varchar2_table(14) := '4958202B202266696C6570726F6772657373222C0A20202020202020202020202020204556454E545F544F54414C5F50524F4752455353203D204556454E545F505245464958202B2022746F74616C70726F6772657373222C0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(15) := '2020202046494C4542524F5753455F434F4E5441494E45525F454C454D454E54203D20226469762E617065782D6974656D2D66696C6564726F70222C0A202020202020202020202020202046494C455F5354415455535F5354415254203D202273746172';
wwv_flow_imp.g_varchar2_table(16) := '74222C0A202020202020202020202020202046494C455F5354415455535F55504C4F4144203D202275706C6F6164222C0A202020202020202020202020202046494C455F5354415455535F53554343455353203D202273756363657373222C0A20202020';
wwv_flow_imp.g_varchar2_table(17) := '2020202020202020202046494C455F5354415455535F4552524F52203D20226572726F72223B0A0A20202020202020206C65742064656661756C744F7074696F6E73203D207B0A2020202020202020202020206166666563746564456C656D656E743A20';
wwv_flow_imp.g_varchar2_table(18) := '22222C0A202020202020202020202020656E61626C65496D616765526573697A653A2066616C73652C0A2020202020202020202020206D6178496D61676553697A653A20313032342C0A202020202020202020202020656E61626C65496D616765507265';
wwv_flow_imp.g_varchar2_table(19) := '766965773A2066616C73652C0A20202020202020202020202070726576696577436F6E7461696E65723A2022222C0A2020202020202020202020206974656D73546F5375626D69743A205B5D2C0A20202020202020202020202073686F7750726F636573';
wwv_flow_imp.g_varchar2_table(20) := '73696E673A20747275652C0A20202020202020202020202063616E63656C576974684573636170653A2066616C73652C0A202020202020202020202020616A61784964656E7469666965723A2022220A20202020202020207D3B0A0A2020202020202020';
wwv_flow_imp.g_varchar2_table(21) := '6C6574206F7074696F6E73203D20242E657874656E6428207B7D2C2064656661756C744F7074696F6E732C20704F7074696F6E7320292C0A2020202020202020202020206974656D4964203D207574696C2E65736361706543535328206F7074696F6E73';
wwv_flow_imp.g_varchar2_table(22) := '2E6166666563746564456C656D656E7420292C0A2020202020202020202020206974656D456C656D203D20646F63756D656E742E676574456C656D656E744279496428206974656D496420292C0A2020202020202020202020206974656D24203D202428';
wwv_flow_imp.g_varchar2_table(23) := '20222322202B206974656D49642C20617065782E6750616765436F6E746578742420292C0A202020202020202020202020616374696F6E203D2070416374696F6E2C0A20202020202020202020202066696C6550726F63657373696E6746756E6374696F';
wwv_flow_imp.g_varchar2_table(24) := '6E203D207046696C6550726F63657373696E6746756E6374696F6E2C0A20202020202020202020202070726F63657373656446696C6573203D205B5D2C0A202020202020202020202020786872526571756573742C0A2020202020202020202020206669';
wwv_flow_imp.g_varchar2_table(25) := '6C65496E666F203D207B7D2C0A20202020202020202020202061626F7274457363617065203D2066616C73652C0A2020202020202020202020207370696E6E6572243B0A0A202020202020202069662028206F7074696F6E732E6974656D73546F537562';
wwv_flow_imp.g_varchar2_table(26) := '6D697420262620747970656F66206F7074696F6E732E6974656D73546F5375626D6974203D3D3D2022737472696E67222029207B0A2020202020202020202020206F7074696F6E732E6974656D73546F5375626D6974203D206F7074696F6E732E697465';
wwv_flow_imp.g_varchar2_table(27) := '6D73546F5375626D69742E73706C69742820222C2220293B0A20202020202020207D0A0A202020202020202064656275672E696E666F2820504C5547494E2C20616374696F6E2C206F7074696F6E732C2066696C6550726F63657373696E6746756E6374';
wwv_flow_imp.g_varchar2_table(28) := '696F6E20293B0A0A20202020202020202F2A2A0A2020202020202020202A20436865636B206966206120676976656E206F626A656374206F72207661726961626C6520697320612066756E6374696F6E0A2020202020202020202A204066756E6374696F';
wwv_flow_imp.g_varchar2_table(29) := '6E20697346756E6374696F6E0A2020202020202020202A2040706172616D207B6F626A6563747D207046756E6374696F6E0A2020202020202020202A204072657475726E207B626F6F6C65616E7D0A2020202020202020202A2F0A202020202020202066';
wwv_flow_imp.g_varchar2_table(30) := '756E6374696F6E20697346756E6374696F6E28207046756E6374696F6E2029207B0A20202020202020202020202072657475726E207046756E6374696F6E20696E7374616E63656F662046756E6374696F6E3B0A20202020202020207D0A0A2020202020';
wwv_flow_imp.g_varchar2_table(31) := '2020202F2A2A0A2020202020202020202A20436865636B206966206120676976656E206F626A656374206F72207661726961626C652069732061206F626A6563740A2020202020202020202A204066756E6374696F6E2069734F626A6563740A20202020';
wwv_flow_imp.g_varchar2_table(32) := '20202020202A2040706172616D207B6F626A6563747D20704F626A6563740A2020202020202020202A204072657475726E207B626F6F6C65616E7D0A2020202020202020202A2F0A202020202020202066756E6374696F6E2069734F626A656374282070';
wwv_flow_imp.g_varchar2_table(33) := '4F626A6563742029207B0A20202020202020202020202072657475726E20704F626A65637420696E7374616E63656F66204F626A6563743B0A20202020202020207D0A0A20202020202020202F2A2A0A2020202020202020202A20436865636B20696620';
wwv_flow_imp.g_varchar2_table(34) := '6120676976656E2066696C6520697320616E20696D6167650A2020202020202020202A204066756E6374696F6E20697346696C65496D6167650A2020202020202020202A2040706172616D207B6F626A6563747D207046696C65206F626A6563740A2020';
wwv_flow_imp.g_varchar2_table(35) := '202020202020202A204072657475726E207B626F6F6C65616E7D0A2020202020202020202A2F0A202020202020202066756E6374696F6E20697346696C65496D61676528207046696C652029207B0A20202020202020202020202072657475726E207046';
wwv_flow_imp.g_varchar2_table(36) := '696C65202626207046696C652E747970652E73706C69742820222F2220295B305D203D3D3D2022696D616765223B0A20202020202020207D0A0A20202020202020202F2A2A0A2020202020202020202A2053686F7720612070726F63657373696E672073';
wwv_flow_imp.g_varchar2_table(37) := '70696E6E65722C20656974686572206F6E207468652066696C652062726F777365206974656D207768656E20737570706F727465642C206F72206F6E2074686520706167650A2020202020202020202A204066756E6374696F6E2073686F775370696E6E';
wwv_flow_imp.g_varchar2_table(38) := '65720A2020202020202020202A2F0A202020202020202066756E6374696F6E2073686F775370696E6E65722829207B0A2020202020202020202020206C65742066696C6542726F777365436F6E7461696E657224203D206974656D242E6E657874282046';
wwv_flow_imp.g_varchar2_table(39) := '494C4542524F5753455F434F4E5441494E45525F454C454D454E5420293B0A0A20202020202020202020202069662028206F7074696F6E732E73686F7750726F63657373696E672029207B0A20202020202020202020202020202020696620282066696C';
wwv_flow_imp.g_varchar2_table(40) := '6542726F777365436F6E7461696E6572242026262066696C6542726F777365436F6E7461696E6572242E6C656E677468203E20302029207B0A202020202020202020202020202020202020202066696C6542726F777365436F6E7461696E6572242E6164';
wwv_flow_imp.g_varchar2_table(41) := '64436C61737328202269732D6C6F6164696E672220293B0A202020202020202020202020202020207D20656C7365207B0A20202020202020202020202020202020202020207370696E6E657224203D207574696C2E73686F775370696E6E657228202428';
wwv_flow_imp.g_varchar2_table(42) := '2022626F647922202920293B0A202020202020202020202020202020207D0A2020202020202020202020207D0A20202020202020207D0A0A20202020202020202F2A2A0A2020202020202020202A2048696465202F2052656D6F7665207468652070726F';
wwv_flow_imp.g_varchar2_table(43) := '63657373696E67207370696E6E65722C20656974686572206F6E207468652066696C652062726F777365206974656D207768656E20737570706F727465642C206F72206F6E2074686520706167650A2020202020202020202A204066756E6374696F6E20';
wwv_flow_imp.g_varchar2_table(44) := '686964655370696E6E65720A2020202020202020202A2F0A202020202020202066756E6374696F6E20686964655370696E6E65722829207B0A2020202020202020202020206C65742066696C6542726F777365436F6E7461696E657224203D206974656D';
wwv_flow_imp.g_varchar2_table(45) := '242E6E657874282046494C4542524F5753455F434F4E5441494E45525F454C454D454E5420293B0A0A20202020202020202020202069662028206F7074696F6E732E73686F7750726F63657373696E672029207B0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(46) := '20696620282066696C6542726F777365436F6E7461696E6572242026262066696C6542726F777365436F6E7461696E6572242E6C656E677468203E20302029207B0A2020202020202020202020202020202020202020696620282066696C6542726F7773';
wwv_flow_imp.g_varchar2_table(47) := '65436F6E7461696E6572242E686173436C61737328202269732D6C6F6164696E672220292029207B0A20202020202020202020202020202020202020202020202066696C6542726F777365436F6E7461696E6572242E72656D6F7665436C617373282022';
wwv_flow_imp.g_varchar2_table(48) := '69732D6C6F6164696E672220293B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020207D20656C7365207B0A202020202020202020202020202020202020202069662028207370696E6E6572242026262073';
wwv_flow_imp.g_varchar2_table(49) := '70696E6E6572242E6C656E677468203E20302029207B0A2020202020202020202020202020202020202020202020207370696E6E6572242E72656D6F766528293B0A20202020202020202020202020202020202020207D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(50) := '202020207D0A2020202020202020202020207D0A20202020202020207D0A0A20202020202020202F2A2A0A2020202020202020202A20526573697A65206120676976656E20696D61676520746F206D6178202A206D61782064696D656E73696F6E732028';
wwv_flow_imp.g_varchar2_table(51) := '206F7074696F6E732E6D6178496D61676553697A6520290A2020202020202020202A204066756E6374696F6E20726573697A65496D6167650A2020202020202020202A2040706172616D207B6F626A6563747D2070496D61676546696C650A2020202020';
wwv_flow_imp.g_varchar2_table(52) := '202020202A204072657475726E207B50726F6D6973657D0A2020202020202020202A2F0A20202020202020206173796E632066756E6374696F6E20726573697A65496D616765282070496D61676546696C652029207B0A20202020202020202020202072';
wwv_flow_imp.g_varchar2_table(53) := '657475726E206E65772050726F6D697365282028207265736F6C76652029203D3E207B0A20202020202020202020202020202020636F6E7374206D61785769647468203D206F7074696F6E732E6D6178496D61676553697A652C0A202020202020202020';
wwv_flow_imp.g_varchar2_table(54) := '202020202020202020202020206D6178486569676874203D206F7074696F6E732E6D6178496D61676553697A653B0A0A20202020202020202020202020202020696620282070496D61676546696C652029207B0A20202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(55) := '202020206C657420726561646572203D206E65772046696C6552656164657228293B0A0A20202020202020202020202020202020202020202F2F205365742074686520696D61676520666F72207468652046696C655265616465720A2020202020202020';
wwv_flow_imp.g_varchar2_table(56) := '2020202020202020202020207265616465722E6F6E6C6F6164203D2066756E6374696F6E202820652029207B0A2020202020202020202020202020202020202020202020206C657420696D67203D206E657720496D61676528293B0A0A20202020202020';
wwv_flow_imp.g_varchar2_table(57) := '2020202020202020202020202020202020696D672E6F6E6C6F6164203D2066756E6374696F6E202829207B0A202020202020202020202020202020202020202020202020202020202F2F206372656174652063616E7661730A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(58) := '20202020202020202020202020202020206C65742063616E766173203D20646F63756D656E742E637265617465456C656D656E7428202263616E7661732220293B0A202020202020202020202020202020202020202020202020202020206C6574206374';
wwv_flow_imp.g_varchar2_table(59) := '78203D2063616E7661732E676574436F6E7465787428202232642220293B0A202020202020202020202020202020202020202020202020202020206374782E64726177496D6167652820696D672C20302C203020293B0A0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(60) := '202020202020202020202020202020206C657420696D675769647468203D20696D672E77696474682C0A2020202020202020202020202020202020202020202020202020202020202020696D67486569676874203D20696D672E6865696768742C0A2020';
wwv_flow_imp.g_varchar2_table(61) := '202020202020202020202020202020202020202020202020202020202020726573697A6557696474682C0A2020202020202020202020202020202020202020202020202020202020202020726573697A654865696768743B0A0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(62) := '2020202020202020202020202020202020202F2F2061646420726573697A696E67206C6F6769630A202020202020202020202020202020202020202020202020202020206966202820696D675769647468203E20696D674865696768742029207B0A2020';
wwv_flow_imp.g_varchar2_table(63) := '202020202020202020202020202020202020202020202020202020202020726573697A655769647468203D20696D675769647468203E206D61785769647468203F206D61785769647468203A20696D6757696474683B0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(64) := '20202020202020202020202020202020202020726573697A65486569676874203D20696D675769647468203E206D61785769647468203F20696D67486569676874202A2028206D61785769647468202F20696D6757696474682029203A20696D67486569';
wwv_flow_imp.g_varchar2_table(65) := '676874202A202820696D675769647468202F206D6178576964746820293B0A202020202020202020202020202020202020202020202020202020207D20656C7365207B0A2020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(66) := '726573697A65486569676874203D20696D67486569676874203E206D6178486569676874203F206D6178486569676874203A20696D674865696768743B0A2020202020202020202020202020202020202020202020202020202020202020726573697A65';
wwv_flow_imp.g_varchar2_table(67) := '5769647468203D20696D67486569676874203E206D6178486569676874203F20696D675769647468202A2028206D6178486569676874202F20696D674865696768742029203A20696D675769647468202A202820696D67486569676874202F206D617848';
wwv_flow_imp.g_varchar2_table(68) := '656967687420293B0A202020202020202020202020202020202020202020202020202020207D0A0A202020202020202020202020202020202020202020202020202020202F2F20737065636966792074686520726573697A696E6720726573756C740A20';
wwv_flow_imp.g_varchar2_table(69) := '20202020202020202020202020202020202020202020202020202063616E7661732E7769647468203D20726573697A6557696474683B0A2020202020202020202020202020202020202020202020202020202063616E7661732E686569676874203D2072';
wwv_flow_imp.g_varchar2_table(70) := '6573697A654865696768743B0A0A20202020202020202020202020202020202020202020202020202020637478203D2063616E7661732E676574436F6E7465787428202232642220293B0A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(71) := '2020206374782E64726177496D6167652820696D672C20302C20302C20726573697A6557696474682C20726573697A6548656967687420293B0A0A202020202020202020202020202020202020202020202020202020202F2F2072657475726E20746865';
wwv_flow_imp.g_varchar2_table(72) := '20726573697A656420626C6F6220617320612066696C65206F626A6563740A2020202020202020202020202020202020202020202020202020202063616E7661732E746F426C6F62280A2020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(73) := '20202020202066756E6374696F6E202820626C6F622029207B0A2020202020202020202020202020202020202020202020202020202020202020202020207265736F6C766528206E65772046696C6528205B626C6F625D2C2070496D61676546696C652E';
wwv_flow_imp.g_varchar2_table(74) := '6E616D652C207B20747970653A2070496D61676546696C652E747970652C206C6173744D6F6469666965643A206E6577204461746528292E67657454696D652829207D202920293B0A202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(75) := '20202020207D2C0A202020202020202020202020202020202020202020202020202020202020202070496D61676546696C652E747970652C0A2020202020202020202020202020202020202020202020202020202020202020302E38350A202020202020';
wwv_flow_imp.g_varchar2_table(76) := '20202020202020202020202020202020202020202020293B0A2020202020202020202020202020202020202020202020207D3B0A202020202020202020202020202020202020202020202020696D672E737263203D20652E7461726765742E726573756C';
wwv_flow_imp.g_varchar2_table(77) := '743B0A20202020202020202020202020202020202020207D3B0A20202020202020202020202020202020202020207265616465722E7265616441734461746155524C282070496D61676546696C6520293B0A202020202020202020202020202020207D0A';
wwv_flow_imp.g_varchar2_table(78) := '2020202020202020202020207D20293B0A20202020202020207D0A0A20202020202020202F2A2A0A2020202020202020202A2052656E64657273206120676976656E20696D6167652066696C6520746F206120646566696E656420636F6E7461696E6572';
wwv_flow_imp.g_varchar2_table(79) := '20444F4D20656C656D656E740A2020202020202020202A204066756E6374696F6E2072656E646572496D616765507265766965770A2020202020202020202A2040706172616D207B6F626A6563747D207046696C650A2020202020202020202A2F0A2020';
wwv_flow_imp.g_varchar2_table(80) := '20202020202066756E6374696F6E2072656E646572496D6167655072657669657728207046696C652029207B0A2020202020202020202020206C65742070726576696577436F6E7461696E657224203D202428206F7074696F6E732E7072657669657743';
wwv_flow_imp.g_varchar2_table(81) := '6F6E7461696E65722C20617065782E6750616765436F6E746578742420293B0A0A202020202020202020202020696620282070726576696577436F6E7461696E6572242E70726F702820227461674E616D65222029203D3D3D2022494D47222029207B0A';
wwv_flow_imp.g_varchar2_table(82) := '2020202020202020202020202020202070726576696577436F6E7461696E6572242E61747472282022737263222C2055524C2E6372656174654F626A65637455524C28207046696C65202920293B0A2020202020202020202020207D20656C7365207B0A';
wwv_flow_imp.g_varchar2_table(83) := '2020202020202020202020202020202070726576696577436F6E7461696E6572242E70726570656E642820242820223C696D673E222C207B207372633A2055524C2E6372656174654F626A65637455524C28207046696C652029207D202920293B0A2020';
wwv_flow_imp.g_varchar2_table(84) := '202020202020202020207D0A20202020202020207D0A0A20202020202020202F2A2A0A2020202020202020202A204765742074686520746F74616C2073697A65206F6620616C6C2066696C6573206F6620616E2075706C6F616420616374696F6E0A2020';
wwv_flow_imp.g_varchar2_table(85) := '202020202020202A204066756E6374696F6E20676574546F74616C46696C657353697A650A2020202020202020202A204072657475726E207B6E756D6265727D0A2020202020202020202A2F0A202020202020202066756E6374696F6E20676574546F74';
wwv_flow_imp.g_varchar2_table(86) := '616C46696C657353697A652829207B0A2020202020202020202020206C65742066696C6573203D206974656D456C656D2E66696C65732C0A20202020202020202020202020202020746F74616C53697A65203D20303B0A0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(87) := '666F722028206C65742069203D20303B2069203C2066696C65732E6C656E6774683B20692B2B2029207B0A202020202020202020202020202020206C65742066696C65203D2066696C65735B695D2C0A2020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(88) := '70726F63657373656446696C65203D2070726F63657373656446696C65735B70726F63657373656446696C65732E66696E64496E646578282028206F626A2029203D3E206F626A2E66696C652E6E616D65203D3D3D2066696C652E6E616D6520295D3B0A';
wwv_flow_imp.g_varchar2_table(89) := '0A202020202020202020202020202020206966202820697346696C65496D616765282066696C6520292026262070726F63657373656446696C652026262070726F63657373656446696C652E66696C652026262070726F63657373656446696C652E6669';
wwv_flow_imp.g_varchar2_table(90) := '6C652E73697A65203C2066696C652E73697A652029207B0A2020202020202020202020202020202020202020746F74616C53697A65202B3D2070726F63657373656446696C652E66696C652E73697A65207C7C20303B0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(91) := '2020207D20656C7365207B0A2020202020202020202020202020202020202020746F74616C53697A65202B3D2066696C652E73697A65207C7C20303B0A202020202020202020202020202020207D0A2020202020202020202020207D0A0A202020202020';
wwv_flow_imp.g_varchar2_table(92) := '20202020202072657475726E20746F74616C53697A653B0A20202020202020207D0A0A20202020202020202F2A2A0A2020202020202020202A20476574207468652073697A65206F6620616C6C2066696C65732077686963682061726520616C72656164';
wwv_flow_imp.g_varchar2_table(93) := '792070726F63657373656420616E642075706C6F616465640A2020202020202020202A204066756E6374696F6E2067657450726F63657373656446696C657353697A650A2020202020202020202A204072657475726E207B6E756D6265727D0A20202020';
wwv_flow_imp.g_varchar2_table(94) := '20202020202A2F0A202020202020202066756E6374696F6E2067657450726F63657373656446696C657353697A652829207B0A2020202020202020202020206C65742070726F63657373656453697A65203D20303B0A0A20202020202020202020202066';
wwv_flow_imp.g_varchar2_table(95) := '6F722028206C65742069203D20303B2069203C2070726F63657373656446696C65732E6C656E6774683B20692B2B2029207B0A2020202020202020202020202020202069662028205B46494C455F5354415455535F535543434553532C2046494C455F53';
wwv_flow_imp.g_varchar2_table(96) := '54415455535F4552524F525D2E696E636C75646573282070726F63657373656446696C65735B695D2E73746174757320292029207B0A202020202020202020202020202020202020202070726F63657373656453697A65202B3D2070726F636573736564';
wwv_flow_imp.g_varchar2_table(97) := '46696C65735B695D2E66696C652E73697A65207C7C20303B0A202020202020202020202020202020207D0A2020202020202020202020207D0A0A20202020202020202020202072657475726E2070726F63657373656453697A653B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(98) := '7D0A0A20202020202020202F2A2A0A2020202020202020202A2053686F777320616E206572726F72206E6F74696669636174696F6E207573696E6720617065782E6D6573736167652E73686F774572726F72730A2020202020202020202A204066756E63';
wwv_flow_imp.g_varchar2_table(99) := '74696F6E2073686F774572726F720A2020202020202020202A2040706172616D207B737472696E677D20704572726F724D6573736167650A2020202020202020202A2F0A202020202020202066756E6374696F6E2073686F774572726F72282070457272';
wwv_flow_imp.g_varchar2_table(100) := '6F724D6573736167652029207B0A2020202020202020202020206D6573736167652E636C6561724572726F727328293B0A2020202020202020202020206D6573736167652E73686F774572726F727328205B0A202020202020202020202020202020207B';
wwv_flow_imp.g_varchar2_table(101) := '0A2020202020202020202020202020202020202020747970653A20226572726F72222C0A20202020202020202020202020202020202020206C6F636174696F6E3A205B2270616765225D2C0A202020202020202020202020202020202020202070616765';
wwv_flow_imp.g_varchar2_table(102) := '4974656D3A206974656D49642C0A20202020202020202020202020202020202020206D6573736167653A20704572726F724D6573736167652C0A2020202020202020202020202020202020202020756E736166653A2066616C73650A2020202020202020';
wwv_flow_imp.g_varchar2_table(103) := '20202020202020207D0A2020202020202020202020205D20293B0A20202020202020207D0A0A20202020202020202F2A2A0A2020202020202020202A204D616B657320616E20466F726D4461746120414A4158207265717565737420746F207468652044';
wwv_flow_imp.g_varchar2_table(104) := '42207365727665722075706C6F6164696E67206120706172746963756C61722066696C650A2020202020202020202A204066756E6374696F6E206D616B65466F726D44617461526571756573740A2020202020202020202A2040706172616D207B6F626A';
wwv_flow_imp.g_varchar2_table(105) := '6563747D2070466F726D446174610A2020202020202020202A2040706172616D207B6F626A6563747D207046696C650A2020202020202020202A204072657475726E207B6F626A6563747D0A2020202020202020202A2F0A20202020202020206173796E';
wwv_flow_imp.g_varchar2_table(106) := '632066756E6374696F6E206D616B65466F726D4461746152657175657374282070466F726D446174612C207046696C652029207B0A202020202020202020202020636F6E737420746F74616C46696C657353697A65203D20676574546F74616C46696C65';
wwv_flow_imp.g_varchar2_table(107) := '7353697A6528292C0A20202020202020202020202020202020202070726F63657373656446696C657353697A65203D2067657450726F63657373656446696C657353697A6528293B0A0A20202020202020202020202070726F63657373656446696C6573';
wwv_flow_imp.g_varchar2_table(108) := '5B70726F63657373656446696C65732E66696E64496E646578282028206F626A2029203D3E206F626A2E66696C652E6E616D65203D3D3D207046696C652E6E616D6520295D2E737461747573203D2046494C455F5354415455535F55504C4F41443B0A0A';
wwv_flow_imp.g_varchar2_table(109) := '202020202020202020202020747279207B0A20202020202020202020202020202020636F6E737420726573706F6E7365203D20617761697420242E616A617828207B0A2020202020202020202020202020202020202020747970653A2022504F5354222C';
wwv_flow_imp.g_varchar2_table(110) := '0A202020202020202020202020202020202020202075726C3A20227777765F666C6F772E616A6178222C0A202020202020202020202020202020202020202064617461547970653A20226A736F6E222C0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(111) := '2070726F63657373446174613A2066616C73652C0A2020202020202020202020202020202020202020636F6E74656E74547970653A2066616C73652C0A2020202020202020202020202020202020202020646174613A2070466F726D446174612C0A2020';
wwv_flow_imp.g_varchar2_table(112) := '2020202020202020202020202020202020202F2F207868722066756E6374696F6E20666F722066696C652075706C6F61642070726F6772657373206576656E7420737570706F72740A20202020202020202020202020202020202020207868723A206675';
wwv_flow_imp.g_varchar2_table(113) := '6E6374696F6E202829207B0A20202020202020202020202020202020202020202020202078687252657175657374203D20242E616A617853657474696E67732E78687228293B0A0A20202020202020202020202020202020202020202020202078687252';
wwv_flow_imp.g_varchar2_table(114) := '6571756573742E75706C6F61642E6F6E70726F6772657373203D2066756E6374696F6E202820652029207B0A202020202020202020202020202020202020202020202020202020206966202820652E6C656E677468436F6D70757461626C652029207B0A';
wwv_flow_imp.g_varchar2_table(115) := '20202020202020202020202020202020202020202020202020202020202020206576656E742E7472696767657228206974656D242C204556454E545F46494C455F50524F47524553532C207B0A2020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(116) := '202020202020202020202020206E616D653A207046696C652E6E616D652C0A202020202020202020202020202020202020202020202020202020202020202020202020747970653A207046696C652E747970652C0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(117) := '20202020202020202020202020202020202020202073697A653A207046696C652E73697A652C0A20202020202020202020202020202020202020202020202020202020202020202020202070726F67726573733A202820652E6C6F61646564202F20652E';
wwv_flow_imp.g_varchar2_table(118) := '746F74616C2029202A203130302C0A2020202020202020202020202020202020202020202020202020202020202020202020206C6F616465643A20652E6C6F616465642C0A20202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(119) := '2020202020746F74616C3A20652E746F74616C0A20202020202020202020202020202020202020202020202020202020202020207D20293B0A0A20202020202020202020202020202020202020202020202020202020202020206C657420746F74616C50';
wwv_flow_imp.g_varchar2_table(120) := '726F6772657373203D202820282070726F63657373656446696C657353697A65202B20652E6C6F616465642029202F20746F74616C46696C657353697A652029202A203130303B0A0A202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(121) := '20202020206576656E742E7472696767657228206974656D242C204556454E545F544F54414C5F50524F47524553532C207B0A20202020202020202020202020202020202020202020202020202020202020202020202070726F67726573733A20746F74';
wwv_flow_imp.g_varchar2_table(122) := '616C50726F6772657373203E20313030203F20313030203A20746F74616C50726F67726573732C0A2020202020202020202020202020202020202020202020202020202020202020202020206C6F616465643A2070726F63657373656446696C65735369';
wwv_flow_imp.g_varchar2_table(123) := '7A65202B20652E6C6F61646564203E20746F74616C46696C657353697A65203F20746F74616C46696C657353697A65203A2070726F63657373656446696C657353697A65202B20652E6C6F616465642C0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(124) := '2020202020202020202020202020202020746F74616C3A20746F74616C46696C657353697A650A20202020202020202020202020202020202020202020202020202020202020207D20293B0A202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(125) := '202020207D0A2020202020202020202020202020202020202020202020207D3B0A0A20202020202020202020202020202020202020202020202072657475726E20786872526571756573743B0A20202020202020202020202020202020202020207D0A20';
wwv_flow_imp.g_varchar2_table(126) := '2020202020202020202020202020207D20293B0A0A2020202020202020202020202020202072657475726E20726573706F6E73653B0A2020202020202020202020207D2063617463682028206572726F722029207B0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(127) := '2020696620282061626F72744573636170652029207B0A202020202020202020202020202020202020202061626F7274457363617065203D2066616C73653B0A202020202020202020202020202020202020202072657475726E207B2073756363657373';
wwv_flow_imp.g_varchar2_table(128) := '3A2074727565207D3B0A202020202020202020202020202020207D0A0A2020202020202020202020202020202072657475726E207B20737563636573733A2066616C73652C206572726F723A206572726F72207D3B0A2020202020202020202020207D0A';
wwv_flow_imp.g_varchar2_table(129) := '20202020202020207D0A0A20202020202020202F2A2A0A2020202020202020202A205772617070696E672066756E6374696F6E20746F2075706C6F616420612073696E676C652066696C65207573696E6720414A41582E2048657265207765206275696C';
wwv_flow_imp.g_varchar2_table(130) := '642074686520466F726D44617461206F626A65637420616E642063616C6C2074686520726571756573742066756E6374696F6E0A2020202020202020202A204066756E6374696F6E2075706C6F616446696C650A2020202020202020202A204070617261';
wwv_flow_imp.g_varchar2_table(131) := '6D207B6F626A6563747D207046696C650A2020202020202020202A204072657475726E207B6F626A6563747D0A2020202020202020202A2F0A20202020202020206173796E632066756E6374696F6E2075706C6F616446696C6528207046696C65202920';
wwv_flow_imp.g_varchar2_table(132) := '7B0A2020202020202020202020206C657420666F726D44617461203D206E657720466F726D4461746128292C0A20202020202020202020202020202020726573756C743B0A0A202020202020202020202020666F726D446174612E617070656E64282022';
wwv_flow_imp.g_varchar2_table(133) := '705F72657175657374222C2022504C5547494E3D22202B206F7074696F6E732E616A61784964656E74696669657220293B0A202020202020202020202020666F726D446174612E617070656E64282022705F666C6F775F6964222C20656E762E4150505F';
wwv_flow_imp.g_varchar2_table(134) := '494420293B0A202020202020202020202020666F726D446174612E617070656E64282022705F666C6F775F737465705F6964222C20656E762E4150505F504147455F494420293B0A202020202020202020202020666F726D446174612E617070656E6428';
wwv_flow_imp.g_varchar2_table(135) := '2022705F696E7374616E6365222C20656E762E4150505F53455353494F4E20293B0A202020202020202020202020666F726D446174612E617070656E64282022705F6465627567222C20247628202270646562756722202920293B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(136) := '20202020666F726D446174612E617070656E64282022463031222C207046696C652C207046696C652E6E616D6520293B0A202020202020202020202020666F726D446174612E617070656E64282022583031222C207046696C652E6E616D6520293B0A20';
wwv_flow_imp.g_varchar2_table(137) := '2020202020202020202020666F726D446174612E617070656E64282022583032222C207046696C652E7479706520293B0A0A20202020202020202020202069662028207046696C652E5F6D657461646174612026262069734F626A65637428207046696C';
wwv_flow_imp.g_varchar2_table(138) := '652E5F6D6574616461746120292029207B0A20202020202020202020202020202020666F726D446174612E617070656E64282022583033222C204A534F4E2E737472696E6769667928207046696C652E5F6D65746164617461202920293B0A2020202020';
wwv_flow_imp.g_varchar2_table(139) := '202020202020207D0A0A202020202020202020202020666F722028206C65742069203D20303B2069203C206F7074696F6E732E6974656D73546F5375626D69742E6C656E6774683B20692B2B2029207B0A20202020202020202020202020202020666F72';
wwv_flow_imp.g_varchar2_table(140) := '6D446174612E617070656E64282022705F6172675F6E616D6573222C206F7074696F6E732E6974656D73546F5375626D69745B695D20293B0A2020202020202020202020207D0A202020202020202020202020666F722028206C65742069203D20303B20';
wwv_flow_imp.g_varchar2_table(141) := '69203C206F7074696F6E732E6974656D73546F5375626D69742E6C656E6774683B20692B2B2029207B0A20202020202020202020202020202020666F726D446174612E617070656E64282022705F6172675F76616C756573222C206974656D28206F7074';
wwv_flow_imp.g_varchar2_table(142) := '696F6E732E6974656D73546F5375626D69745B695D20292E67657456616C7565282920293B0A2020202020202020202020207D0A0A202020202020202020202020726573756C74203D206177616974206D616B65466F726D446174615265717565737428';
wwv_flow_imp.g_varchar2_table(143) := '20666F726D446174612C207046696C6520293B0A0A20202020202020202020202072657475726E20726573756C743B0A20202020202020207D0A0A20202020202020202F2A2A0A2020202020202020202A204D61696E2066756E6374696F6E2077686963';
wwv_flow_imp.g_varchar2_table(144) := '682068616E646C6573207468652070726F63657373696E67206F6620616C6C2066696C6573206F6620616E2066696C652062726F777365206974656D0A2020202020202020202A204066756E6374696F6E2070726F6365737346696C65730A2020202020';
wwv_flow_imp.g_varchar2_table(145) := '202020202A2040706172616D207B61727261797D207046696C65730A2020202020202020202A2040706172616D207B66756E6374696F6E7D2063616C6C6261636B0A2020202020202020202A2F0A20202020202020206173796E632066756E6374696F6E';
wwv_flow_imp.g_varchar2_table(146) := '2070726F6365737346696C657328207046696C65732C2063616C6C6261636B2029207B0A2020202020202020202020206C657420726573756C742C0A202020202020202020202020202020206861734572726F72203D2066616C73653B0A0A2020202020';
wwv_flow_imp.g_varchar2_table(147) := '2020202020202070726F63657373656446696C6573203D205B5D3B0A0A202020202020202020202020666F722028206C65742069203D20303B2069203C207046696C65732E6C656E6774683B20692B2B2029207B0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(148) := '206C65742066696C65203D207046696C65735B695D2C0A202020202020202020202020202020202020202066696C654D65746164617461203D207B7D3B0A0A202020202020202020202020202020202F2F20616C6C2066696C65732073686F756C642068';
wwv_flow_imp.g_varchar2_table(149) := '61766520612076616C6964206D696D6520747970650A2020202020202020202020202020202069662028202166696C652E747970652029207B0A202020202020202020202020202020202020202066696C65203D206E65772046696C6528205B66696C65';
wwv_flow_imp.g_varchar2_table(150) := '5D2C2066696C652E6E616D652C207B20747970653A20226170706C69636174696F6E2F6F637465742D73747265616D222C206C6173744D6F6469666965643A206E6577204461746528292E67657454696D652829207D20293B0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(151) := '2020202020207D0A0A202020202020202020202020202020202F2F206966206120646576656C6F70657220686173207370656369666965642061206F7074696F6E616C2066696C652070726F63657373696E67202F206D616E6970756C6174696F6E2066';
wwv_flow_imp.g_varchar2_table(152) := '756E6374696F6E207765206578656375746520697420686572650A202020202020202020202020202020202F2F20626573696465206D616E6970756C6174696E67207468652066696C6520697473656C662C20646576732063616E206164642066696C65';
wwv_flow_imp.g_varchar2_table(153) := '2E5F6D6574616461746120616E642066696C652E5F63616E63656C20746F2063616E63656C207468652075706C6F6164206F6620746869732066696C650A20202020202020202020202020202020696620282066696C6550726F63657373696E6746756E';
wwv_flow_imp.g_varchar2_table(154) := '6374696F6E20262620697346756E6374696F6E282066696C6550726F63657373696E6746756E6374696F6E20292029207B0A202020202020202020202020202020202020202066696C65203D2061776169742066696C6550726F63657373696E6746756E';
wwv_flow_imp.g_varchar2_table(155) := '6374696F6E282066696C6520293B0A0A202020202020202020202020202020202020202066696C654D65746164617461203D2066696C652E5F6D657461646174613B0A0A2020202020202020202020202020202020202020696620282066696C652E5F63';
wwv_flow_imp.g_varchar2_table(156) := '616E63656C2029207B0A2020202020202020202020202020202020202020202020206576656E742E7472696767657228206974656D242C204556454E545F46494C455F43414E43454C2C207B206E616D653A2066696C652E6E616D652C20747970653A20';
wwv_flow_imp.g_varchar2_table(157) := '66696C652E747970652C2073697A653A2066696C652E73697A65207D20293B0A202020202020202020202020202020202020202020202020636F6E74696E75653B0A20202020202020202020202020202020202020207D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(158) := '202020207D0A0A202020202020202020202020202020202F2F20696620696D61676520726573697A696E6720697320656E61626C65642077652065786563757465206F7572206C6F67696320616E64206F7074696F6E616C6C792072656E646572206120';
wwv_flow_imp.g_varchar2_table(159) := '696D61676520707265766965770A2020202020202020202020202020202069662028206F7074696F6E732E656E61626C65496D616765526573697A6520262620697346696C65496D616765282066696C6520292029207B0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(160) := '202020202020202066696C65203D20617761697420726573697A65496D616765282066696C6520293B0A0A202020202020202020202020202020202020202069662028206F7074696F6E732E656E61626C65496D616765507265766965772029207B0A20';
wwv_flow_imp.g_varchar2_table(161) := '202020202020202020202020202020202020202020202072656E646572496D61676550726576696577282066696C6520293B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020207D0A0A2020202020202020';
wwv_flow_imp.g_varchar2_table(162) := '20202020202020202F2F2069662066696C652E5F6D65746164617461206973206C6F73742C20652E672E20627920696D61676520726573697A696E672C2077652061646420697420616761696E0A20202020202020202020202020202020696620282021';
wwv_flow_imp.g_varchar2_table(163) := '66696C652E5F6D657461646174612029207B0A202020202020202020202020202020202020202066696C652E5F6D65746164617461203D2066696C654D65746164617461207C7C207B7D3B0A202020202020202020202020202020207D0A0A2020202020';
wwv_flow_imp.g_varchar2_table(164) := '20202020202020202020202F2F206275696C64206120676C6F62616C2066696C65496E666F206F626A6563742077686963682063616E2062652075736564206F757473696465206F6620746869732070726F63657373696E672066756E6374696F6E0A20';
wwv_flow_imp.g_varchar2_table(165) := '2020202020202020202020202020202F2F20616E6420776974686F7574206C65616B696E67207468652077686F6C652066696C650A2020202020202020202020202020202066696C65496E666F203D207B0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(166) := '20206E616D653A2066696C652E6E616D652C0A2020202020202020202020202020202020202020747970653A2066696C652E747970652C0A202020202020202020202020202020202020202073697A653A2066696C652E73697A650A2020202020202020';
wwv_flow_imp.g_varchar2_table(167) := '20202020202020207D3B0A0A202020202020202020202020202020202F2F206E6F772075706C6F6164207468652066696C650A2020202020202020202020202020202070726F63657373656446696C65732E7075736828207B2066696C653A2066696C65';
wwv_flow_imp.g_varchar2_table(168) := '2C207374617475733A2046494C455F5354415455535F5354415254207D20293B0A0A20202020202020202020202020202020726573756C74203D2061776169742075706C6F616446696C65282066696C6520293B0A0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(169) := '20206966202820726573756C742E737563636573732029207B0A202020202020202020202020202020202020202070726F63657373656446696C65735B70726F63657373656446696C65732E66696E64496E646578282028206F626A2029203D3E206F62';
wwv_flow_imp.g_varchar2_table(170) := '6A2E66696C652E6E616D65203D3D3D2066696C652E6E616D6520295D2E737461747573203D2046494C455F5354415455535F535543434553533B0A20202020202020202020202020202020202020206576656E742E7472696767657228206974656D242C';
wwv_flow_imp.g_varchar2_table(171) := '204556454E545F414A41585F535543434553532C207B206E616D653A2066696C652E6E616D652C20747970653A2066696C652E747970652C2073697A653A2066696C652E73697A65207D20293B0A202020202020202020202020202020207D20656C7365';
wwv_flow_imp.g_varchar2_table(172) := '207B0A202020202020202020202020202020202020202070726F63657373656446696C65735B70726F63657373656446696C65732E66696E64496E646578282028206F626A2029203D3E206F626A2E66696C652E6E616D65203D3D3D2066696C652E6E61';
wwv_flow_imp.g_varchar2_table(173) := '6D6520295D2E737461747573203D2046494C455F5354415455535F4552524F523B0A20202020202020202020202020202020202020206576656E742E7472696767657228206974656D242C204556454E545F414A41585F4552524F522C207B206E616D65';
wwv_flow_imp.g_varchar2_table(174) := '3A2066696C652E6E616D652C20747970653A2066696C652E747970652C2073697A653A2066696C652E73697A652C206572726F723A20726573756C742E6572726F72207D20293B0A202020202020202020202020202020202020202073686F774572726F';
wwv_flow_imp.g_varchar2_table(175) := '722820726573756C742E6572726F722E7374617475735465787420293B0A0A20202020202020202020202020202020202020206966202820216861734572726F722029207B0A202020202020202020202020202020202020202020202020686173457272';
wwv_flow_imp.g_varchar2_table(176) := '6F72203D20747275653B0A20202020202020202020202020202020202020207D0A202020202020202020202020202020207D0A0A2020202020202020202020202020202064656275672E696E666F2820504C5547494E2C2066696C652E6E616D652C2072';
wwv_flow_imp.g_varchar2_table(177) := '6573756C7420293B0A2020202020202020202020207D0A20202020202020202020202063616C6C6261636B28206861734572726F7220293B0A20202020202020207D0A0A20202020202020202F2F2069662063616E63656C207769746820657363206B65';
wwv_flow_imp.g_varchar2_table(178) := '7920697320656E61626C6564207765206164642061206576656E74206C697374656E657220666F7220746861740A202020202020202069662028206F7074696F6E732E63616E63656C576974684573636170652029207B0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(179) := '242820646F63756D656E7420292E6B65797570282066756E6374696F6E202820652029207B0A202020202020202020202020202020206966202820652E6B6579203D3D3D2022457363617065222029207B0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(180) := '20206966202820786872526571756573742029207B0A2020202020202020202020202020202020202020202020206576656E742E7472696767657228206974656D242C204556454E545F46494C455F43414E43454C2C2066696C65496E666F20293B0A20';
wwv_flow_imp.g_varchar2_table(181) := '202020202020202020202020202020202020202020202061626F7274457363617065203D20747275653B0A202020202020202020202020202020202020202020202020786872526571756573742E61626F727428293B0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(182) := '202020202020207D0A202020202020202020202020202020207D0A2020202020202020202020207D20293B0A20202020202020207D0A0A20202020202020202F2F2069662066696C6573206172652070726573656E74206F6E207468652066696C652062';
wwv_flow_imp.g_varchar2_table(183) := '726F777365206974656D2077652073746172742070726F63657373696E67207468652075706C6F6164730A202020202020202069662028206974656D456C656D2E66696C6573202626206974656D456C656D2E66696C65732E6C656E677468203E203020';
wwv_flow_imp.g_varchar2_table(184) := '29207B0A20202020202020202020202073686F775370696E6E657228293B0A0A20202020202020202020202070726F6365737346696C657328206974656D456C656D2E66696C65732C2066756E6374696F6E2028206572726F724F636375727265642029';
wwv_flow_imp.g_varchar2_table(185) := '207B0A20202020202020202020202020202020686964655370696E6E657228293B0A0A202020202020202020202020202020206576656E742E7472696767657228206974656D242C204556454E545F55504C4F41445F434F4D504C45544520293B0A2020';
wwv_flow_imp.g_varchar2_table(186) := '20202020202020202020202020206974656D242E76616C2820222220292E6368616E676528293B0A0A2020202020202020202020202020202064612E726573756D652820616374696F6E2E726573756D6543616C6C6261636B2C206572726F724F636375';
wwv_flow_imp.g_varchar2_table(187) := '7272656420293B0A2020202020202020202020207D20293B0A20202020202020207D0A202020207D3B0A7D20292820617065782E64612C20617065782E7574696C2C20617065782E6974656D2C20617065782E6576656E742C20617065782E6D65737361';
wwv_flow_imp.g_varchar2_table(188) := '67652C20617065782E656E762C20617065782E64656275672C20617065782E6A517565727920293B0A';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(234211355704602023541)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_file_name=>'enhancedFileUpload.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260529090939Z')
,p_updated_on=>wwv_flow_imp.dz('20260529090939Z')
,p_created_by=>'SOCIAL-MEDIA-ADMIN'
,p_updated_by=>'SOCIAL-MEDIA-ADMIN'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2866756E6374696F6E28652C742C612C6E2C692C732C722C6F297B2275736520737472696374223B652E656E68616E63656446696C6555706C6F61643D66756E6374696F6E286C2C702C63297B66756E6374696F6E206D2865297B72657475726E206520';
wwv_flow_imp.g_varchar2_table(2) := '696E7374616E63656F662046756E6374696F6E7D66756E6374696F6E20642865297B72657475726E206520696E7374616E63656F66204F626A6563747D66756E6374696F6E20752865297B72657475726E2065262622696D616765223D3D3D652E747970';
wwv_flow_imp.g_varchar2_table(3) := '652E73706C697428222F22295B305D7D66756E6374696F6E206728297B6C657420653D242E6E6578742841293B582E73686F7750726F63657373696E67262628652626652E6C656E6774683E303F652E616464436C617373282269732D6C6F6164696E67';
wwv_flow_imp.g_varchar2_table(4) := '22293A4E3D742E73686F775370696E6E6572286F2822626F6479222929297D66756E6374696F6E206628297B6C657420653D242E6E6578742841293B582E73686F7750726F63657373696E67262628652626652E6C656E6774683E303F652E686173436C';
wwv_flow_imp.g_varchar2_table(5) := '617373282269732D6C6F6164696E6722292626652E72656D6F7665436C617373282269732D6C6F6164696E6722293A4E26264E2E6C656E6774683E3026264E2E72656D6F76652829297D6173796E632066756E6374696F6E20782865297B72657475726E';
wwv_flow_imp.g_varchar2_table(6) := '206E65772050726F6D69736528743D3E7B636F6E737420613D582E6D6178496D61676553697A652C6E3D582E6D6178496D61676553697A653B69662865297B6C657420693D6E65772046696C655265616465723B692E6F6E6C6F61643D66756E6374696F';
wwv_flow_imp.g_varchar2_table(7) := '6E2869297B6C657420733D6E657720496D6167653B732E6F6E6C6F61643D66756E6374696F6E28297B6C657420693D646F63756D656E742E637265617465456C656D656E74282263616E76617322292C723D692E676574436F6E74657874282232642229';
wwv_flow_imp.g_varchar2_table(8) := '3B722E64726177496D61676528732C302C30293B6C6574206F2C6C2C703D732E77696474682C633D732E6865696768743B703E633F286F3D703E613F613A702C6C3D703E613F632A28612F70293A632A28702F6129293A286C3D633E6E3F6E3A632C6F3D';
wwv_flow_imp.g_varchar2_table(9) := '633E6E3F702A286E2F63293A702A28632F6E29292C692E77696474683D6F2C692E6865696768743D6C2C723D692E676574436F6E746578742822326422292C722E64726177496D61676528732C302C302C6F2C6C292C692E746F426C6F622866756E6374';
wwv_flow_imp.g_varchar2_table(10) := '696F6E2861297B74286E65772046696C65285B615D2C652E6E616D652C7B747970653A652E747970652C6C6173744D6F6469666965643A286E65772044617465292E67657454696D6528297D29297D2C652E747970652C2E3835297D2C732E7372633D69';
wwv_flow_imp.g_varchar2_table(11) := '2E7461726765742E726573756C747D2C692E7265616441734461746155524C2865297D7D297D66756E6374696F6E20792865297B6C657420743D6F28582E70726576696577436F6E7461696E65722C617065782E6750616765436F6E7465787424293B22';
wwv_flow_imp.g_varchar2_table(12) := '494D47223D3D3D742E70726F7028227461674E616D6522293F742E617474722822737263222C55524C2E6372656174654F626A65637455524C286529293A742E70726570656E64286F28223C696D673E222C7B7372633A55524C2E6372656174654F626A';
wwv_flow_imp.g_varchar2_table(13) := '65637455524C2865297D29297D66756E6374696F6E206828297B6C657420653D472E66696C65732C743D303B666F72286C657420613D303B613C652E6C656E6774683B612B2B297B6C6574206E3D655B615D2C693D715B712E66696E64496E6465782865';
wwv_flow_imp.g_varchar2_table(14) := '3D3E652E66696C652E6E616D653D3D3D6E2E6E616D65295D3B75286E292626692626692E66696C652626692E66696C652E73697A653C6E2E73697A653F742B3D692E66696C652E73697A657C7C303A742B3D6E2E73697A657C7C307D72657475726E2074';
wwv_flow_imp.g_varchar2_table(15) := '7D66756E6374696F6E207728297B6C657420653D303B666F72286C657420743D303B743C712E6C656E6774683B742B2B295B4F2C465D2E696E636C7564657328715B745D2E73746174757329262628652B3D715B745D2E66696C652E73697A657C7C3029';
wwv_flow_imp.g_varchar2_table(16) := '3B72657475726E20657D66756E6374696F6E205F2865297B692E636C6561724572726F727328292C692E73686F774572726F7273285B7B747970653A226572726F72222C6C6F636174696F6E3A5B2270616765225D2C706167654974656D3A6B2C6D6573';
wwv_flow_imp.g_varchar2_table(17) := '736167653A652C756E736166653A21317D5D297D6173796E632066756E6374696F6E206228652C74297B636F6E737420613D6828292C693D7728293B715B712E66696E64496E64657828653D3E652E66696C652E6E616D653D3D3D742E6E616D65295D2E';
wwv_flow_imp.g_varchar2_table(18) := '7374617475733D4C3B7472797B636F6E737420733D6177616974206F2E616A6178287B747970653A22504F5354222C75726C3A227777765F666C6F772E616A6178222C64617461547970653A226A736F6E222C70726F63657373446174613A21312C636F';
wwv_flow_imp.g_varchar2_table(19) := '6E74656E74547970653A21312C646174613A652C7868723A66756E6374696F6E28297B72657475726E20553D6F2E616A617853657474696E67732E78687228292C552E75706C6F61642E6F6E70726F67726573733D66756E6374696F6E2865297B696628';
wwv_flow_imp.g_varchar2_table(20) := '652E6C656E677468436F6D70757461626C65297B6E2E7472696767657228242C6A2C7B6E616D653A742E6E616D652C747970653A742E747970652C73697A653A742E73697A652C70726F67726573733A652E6C6F616465642F652E746F74616C2A313030';
wwv_flow_imp.g_varchar2_table(21) := '2C6C6F616465643A652E6C6F616465642C746F74616C3A652E746F74616C7D293B6C657420733D28692B652E6C6F61646564292F612A3130303B6E2E7472696767657228242C522C7B70726F67726573733A733E3130303F3130303A732C6C6F61646564';
wwv_flow_imp.g_varchar2_table(22) := '3A692B652E6C6F616465643E613F613A692B652E6C6F616465642C746F74616C3A617D297D7D2C557D7D293B72657475726E20737D63617463682865297B72657475726E204A3F284A3D21312C7B737563636573733A21307D293A7B737563636573733A';
wwv_flow_imp.g_varchar2_table(23) := '21312C6572726F723A657D7D7D6173796E632066756E6374696F6E20492865297B6C657420742C6E3D6E657720466F726D446174613B6E2E617070656E642822705F72657175657374222C22504C5547494E3D222B582E616A61784964656E7469666965';
wwv_flow_imp.g_varchar2_table(24) := '72292C6E2E617070656E642822705F666C6F775F6964222C732E4150505F4944292C6E2E617070656E642822705F666C6F775F737465705F6964222C732E4150505F504147455F4944292C6E2E617070656E642822705F696E7374616E6365222C732E41';
wwv_flow_imp.g_varchar2_table(25) := '50505F53455353494F4E292C6E2E617070656E642822705F6465627567222C247628227064656275672229292C6E2E617070656E642822463031222C652C652E6E616D65292C6E2E617070656E642822583031222C652E6E616D65292C6E2E617070656E';
wwv_flow_imp.g_varchar2_table(26) := '642822583032222C652E74797065292C652E5F6D6574616461746126266428652E5F6D657461646174612926266E2E617070656E642822583033222C4A534F4E2E737472696E6769667928652E5F6D6574616461746129293B666F72286C657420653D30';
wwv_flow_imp.g_varchar2_table(27) := '3B653C582E6974656D73546F5375626D69742E6C656E6774683B652B2B296E2E617070656E642822705F6172675F6E616D6573222C582E6974656D73546F5375626D69745B655D293B666F72286C657420653D303B653C582E6974656D73546F5375626D';
wwv_flow_imp.g_varchar2_table(28) := '69742E6C656E6774683B652B2B296E2E617070656E642822705F6172675F76616C756573222C6128582E6974656D73546F5375626D69745B655D292E67657456616C75652829293B72657475726E20743D61776169742062286E2C65292C747D6173796E';
wwv_flow_imp.g_varchar2_table(29) := '632066756E6374696F6E205328652C74297B6C657420612C693D21313B713D5B5D3B666F72286C657420743D303B743C652E6C656E6774683B742B2B297B6C657420733D655B745D2C6F3D7B7D3B732E747970657C7C28733D6E65772046696C65285B73';
wwv_flow_imp.g_varchar2_table(30) := '5D2C732E6E616D652C7B747970653A226170706C69636174696F6E2F6F637465742D73747265616D222C6C6173744D6F6469666965643A286E65772044617465292E67657454696D6528297D29292C5726266D285729262628733D617761697420572873';
wwv_flow_imp.g_varchar2_table(31) := '292C6F3D732E5F6D657461646174612C732E5F63616E63656C293F6E2E7472696767657228242C762C7B6E616D653A732E6E616D652C747970653A732E747970652C73697A653A732E73697A657D293A28582E656E61626C65496D616765526573697A65';
wwv_flow_imp.g_varchar2_table(32) := '262675287329262628733D617761697420782873292C582E656E61626C65496D61676550726576696577262679287329292C732E5F6D657461646174617C7C28732E5F6D657461646174613D6F7C7C7B7D292C483D7B6E616D653A732E6E616D652C7479';
wwv_flow_imp.g_varchar2_table(33) := '70653A732E747970652C73697A653A732E73697A657D2C712E70757368287B66696C653A732C7374617475733A447D292C613D617761697420492873292C612E737563636573733F28715B712E66696E64496E64657828653D3E652E66696C652E6E616D';
wwv_flow_imp.g_varchar2_table(34) := '653D3D3D732E6E616D65295D2E7374617475733D4F2C6E2E7472696767657228242C452C7B6E616D653A732E6E616D652C747970653A732E747970652C73697A653A732E73697A657D29293A28715B712E66696E64496E64657828653D3E652E66696C65';
wwv_flow_imp.g_varchar2_table(35) := '2E6E616D653D3D3D732E6E616D65295D2E7374617475733D462C6E2E7472696767657228242C432C7B6E616D653A732E6E616D652C747970653A732E747970652C73697A653A732E73697A652C6572726F723A612E6572726F727D292C5F28612E657272';
wwv_flow_imp.g_varchar2_table(36) := '6F722E73746174757354657874292C697C7C28693D213029292C722E696E666F287A2C732E6E616D652C6129297D742869297D636F6E7374207A3D22434F4D2E4F5241434C452E415045582E454E48414E4345445F46494C455F55504C4F41444552222C';
wwv_flow_imp.g_varchar2_table(37) := '503D22656E68616E63656466696C6575706C6F61646572222C453D502B2273756363657373222C433D502B226572726F72222C543D502B22636F6D706C657465222C763D502B2266696C6563616E63656C222C6A3D502B2266696C6570726F6772657373';
wwv_flow_imp.g_varchar2_table(38) := '222C523D502B22746F74616C70726F6772657373222C413D226469762E617065782D6974656D2D66696C6564726F70222C443D227374617274222C4C3D2275706C6F6164222C4F3D2273756363657373222C463D226572726F72223B6C657420552C4E2C';
wwv_flow_imp.g_varchar2_table(39) := '4D3D7B6166666563746564456C656D656E743A22222C656E61626C65496D616765526573697A653A21312C6D6178496D61676553697A653A313032342C656E61626C65496D616765507265766965773A21312C70726576696577436F6E7461696E65723A';
wwv_flow_imp.g_varchar2_table(40) := '22222C6974656D73546F5375626D69743A5B5D2C73686F7750726F63657373696E673A21302C63616E63656C576974684573636170653A21312C616A61784964656E7469666965723A22227D2C583D6F2E657874656E64287B7D2C4D2C70292C6B3D742E';
wwv_flow_imp.g_varchar2_table(41) := '65736361706543535328582E6166666563746564456C656D656E74292C473D646F63756D656E742E676574456C656D656E7442794964286B292C243D6F282223222B6B2C617065782E6750616765436F6E7465787424292C423D6C2C573D632C713D5B5D';
wwv_flow_imp.g_varchar2_table(42) := '2C483D7B7D2C4A3D21313B582E6974656D73546F5375626D6974262622737472696E67223D3D747970656F6620582E6974656D73546F5375626D6974262628582E6974656D73546F5375626D69743D582E6974656D73546F5375626D69742E73706C6974';
wwv_flow_imp.g_varchar2_table(43) := '28222C2229292C722E696E666F287A2C422C582C57292C582E63616E63656C5769746845736361706526266F28646F63756D656E74292E6B657975702866756E6374696F6E2865297B22457363617065223D3D3D652E6B65792626552626286E2E747269';
wwv_flow_imp.g_varchar2_table(44) := '6767657228242C762C48292C4A3D21302C552E61626F72742829297D292C472E66696C65732626472E66696C65732E6C656E6774683E302626286728292C5328472E66696C65732C66756E6374696F6E2874297B6628292C6E2E7472696767657228242C';
wwv_flow_imp.g_varchar2_table(45) := '54292C242E76616C282222292E6368616E676528292C652E726573756D6528422E726573756D6543616C6C6261636B2C74297D29297D7D2928617065782E64612C617065782E7574696C2C617065782E6974656D2C617065782E6576656E742C61706578';
wwv_flow_imp.g_varchar2_table(46) := '2E6D6573736167652C617065782E656E762C617065782E64656275672C617065782E6A5175657279293B';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(234211355977222023543)
,p_plugin_id=>wwv_flow_imp.id(243133285270761082090)
,p_file_name=>'enhancedFileUpload.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260529090939Z')
,p_updated_on=>wwv_flow_imp.dz('20260529090939Z')
,p_created_by=>'SOCIAL-MEDIA-ADMIN'
,p_updated_by=>'SOCIAL-MEDIA-ADMIN'
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(18014233729041193)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>'11427401'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(233112115045063804373)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>'41053651417115'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(233112115361347804373)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_behavior', 'MONTH-PICKER:YEAR-PICKER',
  'days_outside_month', 'VISIBLE',
  'show_on', 'FOCUS',
  'time_increment', '15')).to_clob
,p_version_scn=>'41053651417135'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(233112115915162804373)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'background', 'default',
  'display_as', 'LIST',
  'map_preview', 'POPUP:ITEM',
  'match_mode', 'RELAX_HOUSE_NUMBER')).to_clob
,p_version_scn=>'41053651417154'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(18015129088041193)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>'11427403'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(233112116237969804373)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>'41053651417166'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(233112116515960804373)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>'41053651417169'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(233112116894461804374)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>'41053651417181'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(18014777052041193)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'match_mode', 'RELAX_HOUSE_NUMBER')).to_clob
,p_version_scn=>'11427403'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(233112117170133804374)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'Y')).to_clob
,p_version_scn=>'41053651417183'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(233112117427770804374)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>'41053651417194'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(233112117758693804374)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>'41053651417717'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7714562941665049592)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>'41053651416084'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(18014625675041193)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>'11427401'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_bar
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(233112719463326804473)
,p_name=>'Navigation Bar'
,p_static_id=>'navigation-bar'
,p_version_scn=>'11427406'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(234700434640085336376)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'About this Application'
,p_static_id=>'about-this-application'
,p_list_item_link_target=>'#action$open-about'
,p_list_item_icon=>'fa-info-circle-o'
,p_list_text_02=>'icon-only'
,p_required_patch=>wwv_flow_imp.id(234700432890733336372)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(233112731780268804491)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'&APP_USER.'
,p_static_id=>'app-user'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(233112731413550804491)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Install App'
,p_static_id=>'install-app'
,p_list_item_link_target=>'#action$a-pwa-install'
,p_list_item_icon=>'fa-cloud-download'
,p_list_text_02=>'a-pwaInstall'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(233112732283651804491)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'---'
,p_static_id=>'list_item'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(233112731780268804491)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(234099528954272196087)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Map'
,p_static_id=>'map'
,p_list_item_link_target=>'#action$open-map'
,p_list_item_icon=>'fa-map'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(233112732601774804492)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Sign Out'
,p_static_id=>'sign-out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_imp.id(233112731780268804491)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_menu
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(233112119192677804375)
,p_name=>'Navigation Menu'
,p_static_id=>'navigation-menu'
,p_version_scn=>'11427405'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(233112729897021804488)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_static_id=>'home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/listentry
begin
null;
end;
/
prompt --application/shared_components/files/icons_app_icon_192_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000C0000000C0080600000052DC6C07000000017352474200AECE1CE90000157349444154785EED5D696C5CD775FE383B392487FB22899B284AD44E299664B78E253B4594D47114474DA502B195B6A9FCAB6E';
wwv_flow_imp.g_varchar2_table(2) := '81024651203F82B640E1A23F6AFF286CD780E504A8653B892D274EEDD8B162BAB0255936294A145791342571196E437286B37086C579C3797CA44891D4BC377CBCF75CC0A045BE3973EE77CEF7EE76EE3969C33F7D6806DC18014911486302486A79EEB6';
wwv_flow_imp.g_varchar2_table(3) := '820013801D416A049800529B9F3BCF04601F901A012680D4E6E7CE3301D807A446800920B5F9B9F34C00F601A9116002486D7EEE3C13807D406A049800529B9F3BCF04601F901A012680D4E6E7CE3301D807A446800920B5F9B9F34C00F601A911600248';
wwv_flow_imp.g_varchar2_table(4) := '6D7EEE3C13807D406A049800529B9F3BCF04601F901A012680D4E6E7CE3301D807A446800920B5F9B9F34C00F601A9116002486D7EEE3C13807D406A049800529B9F3BCF04601F901A012680D4E6E7CE3301D807A446800920B5F9B9F34C00F601A91160';
wwv_flow_imp.g_varchar2_table(5) := '02486D7EEE3C13807D406A049800529B9F3BCF04601F901A012680D4E6E7CE3301D807A446800920B5F9B9F34C00F601A9116002486D7EEE3C13807D406A049800529B9F3BCF04601F901A012680D4E6E7CE3301D807A446800920B5F9B9F34C00F601A9';
wwv_flow_imp.g_varchar2_table(6) := '116002486D7EEE3C13807D406A04980006993F1A9B41201243683A86E9D80CC2D11822D119D0EFA333F413CAFF53B35AD260B500D634FA9906BB350D0EAB45FDE976586149334851C9C5320174740072F6F1E034C64351F8C351CCC4FD3BE99696061009';
wwv_flow_imp.g_varchar2_table(7) := 'B29D5664BB6C70DA2C49CB640171049800497A42383A83B1A9084602D3CADB3E15CD65B72037DD86DC74BB324A70BB77049800F788DD4820EEF4F4A65FAAB93DB9C8C8F2C099950367660E2C9634B8728B6071386173A4C3E629523E3AED1BC474780AD1';
wwv_flow_imp.g_varchar2_table(8) := '7008A1D141C46233088EF6231C0CC23F3186806F6CE9EF705891EFB62B84E0B67A049800ABC48C1C7F60328CF0F4E2F39BECC2121455D5C253BE0DF69CB88327DB22638318EB6985B7BB05E3DEFE45C5D1B4A838CBC1445825D84C801502363A358DBEF1';
wwv_flow_imp.g_varchar2_table(9) := '90B2905DD88A366F435E792D324B2B60737B5628F1DE1E9BF6FB30DEDB8AD15BDDF076B5DE2184885092E5400E8F082B029809B00C4C817014B7C6430884E7CFEFAD4E27B63CF02D782AB6C16277AE086CBD1F8A454218ED6CC48D4BE7110D85E689A745';
wwv_flow_imp.g_varchar2_table(10) := 'F3468F13E9765E30DF0D7726C012E8D09B9E1CDF37353DEF09ABC389F2BD0FA068C741A4AD91E32F5479261282B7F9227A1A3F55D611DA46234169B6130E5E2C2F6A6926C022B0F882D3E8190DCEDBC6A4ADC8F2FD8751BCF390B28835638B8543B87DE9';
wwv_flow_imp.g_varchar2_table(11) := '7DDC6A69B843F7CA5C97B285CA6D3E024C000D1EB46FDF3711827732320FA5D2DA3A6CA8FB3AEC9939EBC27F229363B8DD508FBE968679FA1665DA95D180DB1C024C80592CE850B67B640A13A1B96D4D9AE7EFFECE29B8728BD7A5CF044707D0F4EB33F3';
wwv_flow_imp.g_varchar2_table(12) := 'D607D92E2B2A72D3F96479D6A24C00DA878FCDE0C6F014A622730BDDAC8212D4FEE913B03A5CEBD2F9134AD368D0F6C11B98189ADB3EA585F1E6FC74D838BE824F82E924B77338306F5FBFB4762FCA0F1D35CD22375906D222B9BBFE1C066EB4A8A21CB6';
wwv_flow_imp.g_varchar2_table(13) := '3454E76748BF38967A04A0D085F6A12935288DBC63CBC12328D8F3F5647DCE949FF736D6A3F3D27955379B350D35057293405A02D0B4A7CD1B500FB668BEBFF391C791B1B1C694CEAB9752FEEEAB68AE7F575D17D048402490753A242501280CB95333E7';
wwv_flow_imp.g_varchar2_table(14) := '27E7AF7BEC47BA852EE8E5AC46C9A1D08A8673AFA86706B426D8529021E5C2583A02D0562739BF36886DCFB74F0AFFE65F48A6C9AE265CFDF02DF5D7994E2B36E7A583CE3B646AD211E0A62F8461FFDC3E7FCDA123C8DF2DE69C7F39471E6EAA47FB85B9';
wwv_flow_imp.g_varchar2_table(15) := '354161A61D1B243B27908A007459A56B24A8FAC586ED7528FFE3C796F313A1FFDEF5D19B18E8BCAEF691B647B39C56A1FBACED9C3404A0D89E16AF1FB1D9AD7E4F5109B67FFB49C024F13C6BE67191109ADF7D550DB3A62B99B545F22C8AA52140D7C814';
wwv_flow_imp.g_varchar2_table(16) := 'C683F1535EBBCB857D279E5EB328CE3573F625BE9842AC1B7FF52222C1F8E848017415B9EBFB0070A5184B4180C9505459F852A345DEBEE34FC1A1D3659595026DF6E782835FA1F19D336A10DD968274E51EB2E84D7802D0AE0F4D7D1237B82A77ED43C9';
wwv_flow_imp.g_varchar2_table(17) := 'FDDF11DDAEF7D4BFFECF7E8DEEAB5F2A9FA58B35DB0A3384DF15129E00031361F44F8415A35A2CC07D279F8625C3D85B5BF7E47D26F850D4EFC3E5B3CFA9EBA40DD90E14663A4CA099712A084D003AF0BA36E09F1BD60F1D4181A45B9E2B7521ED28402F';
wwv_flow_imp.g_varchar2_table(18) := '8C1D456E255791A84D6802D09B9F46006A36A70B5F3BF9B430016E46392405CE7DFEDA7FAAA112A5D90E14093C0A084B008AEFBF3630A90EE7321F78AD962C434DF5E8983D20A3B7FF8E62B7B06112C212C03B19C6ED717EFBAFD6F9E9791A052EBFF61C';
wwv_flow_imp.g_varchar2_table(19) := 'A643F16D51BA5C5FE0B6DF8B28D37F4658025C1F9CDBF9A97DE47BC8D9BCDBF4C6309382DA3009DA11A2C331119B9004A0542614E74F8DF6FD0F3EF90CCFFD57E9BD340A5C7CF5597503616B61869029568424C02D5F0843B3016F8555B5A8FEC60F5669';
wwv_flow_imp.g_varchar2_table(20) := 'FEBB3FEEBD520F6F573C4B1B6582A3EF284CF1259A54E8D0F9E11B4A3FA9891A28272401AEF6FBD55B5E7A4F7F9ADF7E69D1F48444841DC7FE4657A22D252C553A8CB67C8ED64F7EABA8418BE15D25EE94F42F955F221C0128CEBF6376FA4340DEF7174F';
wwv_flow_imp.g_varchar2_table(21) := 'EB96AE90DEBA9D17E7C287171AAAFAE011C3478254EA4017EA2FBFF6BCDACD9A82746408161E211C01B427BF598525D8A9E35B79A9376FC24352310AA45A876B6FBDA4669410F14C403802507A93446E1FBDDFC89FFDF73F2F3B3ADFFFE39F2CFB4C320F';
wwv_flow_imp.g_varchar2_table(22) := 'A45A87FECF3F4077C3A78ACA9453A82A2F3D19F54DF759A10840816F4DFD93EACEC5FEE3A7E1D031A9D5B5B75FC2C412E9C9C9B27A8F388B794BAA75088F0EE08B5FBCA8EEA8ED29CD349D1327A390500408466268F506143C5C5939A83BF1B7C96073C7';
wwv_flow_imp.g_varchar2_table(23) := '675339FF5E4AF1B5D0A1E1ECF3084EC48B74D0798048259A8422C0D8543CA92DB5A2B22A6C3EFA435D0940C2967A03A7E2ED9FE84CAA75E87CEFE7F0F676295F5F99E78247A024BB421140BB00DEB4BD0E9B0CBAEF4B09A606BB5B94E910397E51652D0A';
wwv_flow_imp.g_varchar2_table(24) := 'F7A6F6627D2A75E839FF26FA3AE2F786455B080B45007AFBD328404DEF05B0EE43C93A1238D8F8316E5CFA83A2716E860DE539E25C97148A00ED4301B5924BCDA18791BFFBC175E466E65575B8E913B45FF8485190AE49D27549519A5004681EF0ABA90E';
wwv_flow_imp.g_varchar2_table(25) := '777DEB243237899DE630554E38D1DB8E6BEFBDA67C1DA552DC5E24CE89B05004D08640EC3B760ACEC2F254F988D0DF13F47E8586B7CF287DA484BA3B8B9900A634F895BEB93380FB7EF0945A87D794CAAE23A52897E8E5375F5034A66B92BB4BC4390B10';
wwv_flow_imp.g_varchar2_table(26) := '6A0468BC3DA9BAD5A1BFFE89F0190D52C5A19999195C78F95F94AFA3F072910EC384228076046002E8470F3A61BFF0723C0C8409A01FAEBA4BA2308844EAC3FD7FC6C9AFF402383C36882F66A740BC08D60B5503E4687781EA8E9D828B17C1BAA04C59E3';
wwv_flow_imp.g_varchar2_table(27) := '1ACEC517C1BC0DAA0BA4C60869190C80CA1E51DB79F424B2CA92DF06A5D89B6E2A40BDA012BB313DD04F2A15FDA8DCFB802EF713B4DBA09E741BA8E6B0284DA83500E5FFA43CA0D4F43A086B7CFD794C8DC703C1D65BD32B3E497B419EB243509608519A';
wwv_flow_imp.g_varchar2_table(28) := '5004E81D0B6224100F85D87CE0308AF63E94B49D3ADEFB39866603C19216966201056555D8A24340E040E3C7E89A0D85102D5DA25004189C0CA36F3617D0C6ED7528D32118AEF7FFDEC1ADEBF18AEB753FFC4764EE4C6DD0DB6A3933D95C8F869FFD9BF2';
wwv_flow_imp.g_varchar2_table(29) := '31BD30E8FEE84DF4CF16D128CF752137DDB65AB54CFBBC5004D08643179655A15A87B79F36FEBEFAC8E3283DFA63D31A9314EBFFED0BE8F8F89CA2A35E0181DA51B03A3F1D544F4C94261401A8D23B953EA5A6D78518ED0E4841552D6A4FFF87A96DDFFC';
wwv_flow_imp.g_varchar2_table(30) := '5F7F8F91AFDAE323D6774FC155945C38089D0134BCFE1C42133E45265F8831B1F9291FE855CD95C8BAE3A7E14AF24A242588BA70E659A5D7696916DCFF4FAFC29A996B4A14A2FE517CFAAF4F207127F4D0A9E41382054706D0F0CBF895480A83D8559C29';
wwv_flow_imp.g_varchar2_table(31) := 'D409BB5023001949BB13A4D742B8E79373E86B69549C60D7637F859C3F3A6E4A020CD5BF8E9677E3FBF5A5B57B51F1E07793D653BB0016B174927004D02E84F5DA061CEF6D43F37B67156772179460DF3FBC9CB4631921E0CB7FFF4BF8470615D13B8E9E';
wwv_flow_imp.g_varchar2_table(32) := '4076D9D6A4BFA6E9572FC23F3CA0C8116D01AC8CEAC33F7D682669944C24409B1794D4D22B31D6A59F3DBB6E0EC3E810ECC013CF246D152A9EF7F9FF3C373BFD8312062D5AB10CE10840D6A2AA30D3D138AFF54A8DA89D0A24ED59060BA83A7018C53A9C';
wwv_flow_imp.g_varchar2_table(33) := '818CB45C42DB27FFAB684BB583A986B0684D48026893E31655D562B30EC9716931DCF0CB17D4DD10B33A8233CB83BAEF3FA54B36EC8E0FDEC050773C39AEA83502842480763B94C2770F3CF98C2E3581277ADB706D762D404EB16DEB56B833D7F672887F';
wwv_flow_imp.g_varchar2_table(34) := '7212AD6D6D2A1F771E3D812C1DE6FEB1703C3D7AA2519518BB55BC5A614212808C36AF40C6C3C79053BD479797B6F650C8E674606BCD36B81C6B533D25188EA0ADBD15D3A178251CBD421F48D670CB25B4CF4E7FD2ED16507D00119BB004585822693F55';
wwv_flow_imp.g_varchar2_table(35) := '8677241FC4159E1C53AAAA27A243ED196EECD8B615561A6A52D8A23333686E6D4324E057BE9516BE7B1F3F0D47664ED25A44C3217C7176AE509E68F13F5A8084250095486D1EF4AB1764F43A1320F0E88248C3DBAF2016092958666665A37A4B75CA4840';
wwv_flow_imp.g_varchar2_table(36) := 'CEDFD9D189C98971E5FB2D7627EA8EFD088E9CA2A49D9F046817FC74F8B5B338938BE4E9826C8A8568CBA45A1D4EEC3FF977A09F7AB485EB01B7DB8D8ACA4AB89CFAC85F4AC7602884CEAE2E8402F1900F6A3B1F7D0259A5957A740BCADB9FCAA486E3E4';
wwv_flow_imp.g_varchar2_table(37) := '2ECE72A0244BDC62D9C28E0064BC8585B22B0F1C46890EDB83094FF3DD68C2F5DFBFA53A5E9AD5864D656528CC332654C23B328A9BBDBD9889C643BEA96D7FE47BF0E85800F0D6C5DFA1F7CA678A6C9AD589B8F7AF7D53084D00EAA87614208352B16C9B';
wwv_flow_imp.g_varchar2_table(38) := 'DBA3CBDB9284844607D0FCFED979DBA339B9B9D8B471031C3A8D36E17008376FDDC6D8E8A8AA376D77EEF8E60938938C75D202A13DF8A2DFD39B9F4600919BF004A068465A0B240EC6366CAF43B90EF704B44E41D385F60F5FC7D8ADEE79BE92E5C9417E';
wwv_flow_imp.g_varchar2_table(39) := '7E3E3C9EEC55AF0F689EEFF38D6378781813BEF937D2723656A2E61B7FAEDB742EA1B436E689B63C29035C8AD7F629E79AF0042044B5F704E8DF7BBF7F1AE979C5BA833DD271053D97CFDF71584653A35C4F16DCEE4CD81C4E389D4E58AC56B8ECF18B25';
wwv_flow_imp.g_varchar2_table(40) := '81F034108B22140A613A1C82DF3F8951DFC4BCA90E3D476FFD8AAF1D41DE167DB674B50050BC0FC5FD249A6869D09732B61404A0CE53E13C2AA0478D16C2FB8E3FA5EB542801309D180F355F44F715FD2ED22B17DCF73C80823D0F22CD8057324D7DBEFC';
wwv_flow_imp.g_varchar2_table(41) := 'C50BEAC2972EBCD0C517199A3404084767D0EA9DDB16CD2C28C68E474FE97242BC98A310117C5FB561A4E73A867ABBD52DD3953A156D6D16945522AF623B3CE55B75096D58ECBB69FAD6FC9B336AC4276D7BD6168A79EABB58FFA5210075DE179C46F748';
wwv_flow_imp.g_varchar2_table(42) := 'BC820C35BD62E697736A4A2D18B8D50E9FB71FFE811EE5F189C980729E40CD9557047746FCA4D55D5C014F61093236D618F2B65FA8EB8D8FCF61B02D7ED7811A05BC51E09B2C4D2A0290516FFA42189EAD224FFFD6EBDEEC7A74988511AEA2A53C59894D';
wwv_flow_imp.g_varchar2_table(43) := 'A42300ED0AB50D054005F5124DC65A02135D4DB8F6E1DC19868BE27D0A3284DFF559480AE9084000D07AA06328A016D350E2681ED32F9460256F9EB57C263C3A88C6775E5117BDB4E55953902164B4E772384B490002855228760C4FA9E70344821D0F3F';
wwv_flow_imp.g_varchar2_table(44) := '0EB7E05565FCDD57D15CFFAE1ACC47052FC8F91D02863A2FE7FCF4776909B01809E87735878E207FB7B9935FADC4B08B3D33D4548F8E0BE7D53F91F36FC94F17AAEEEF6AB1919A008B4D87E877745A5C76F09B866D3DAED648C93E4F5BB2BD17DFC7EDD9';
wwv_flow_imp.g_varchar2_table(45) := '0C77248FD29C57E7CBFBE64F602A3D010888E9D88C924E45BB30F6149560DB9F9C8025233B59FF5BD3CFC702E368FDE02C7C83FDAA1E74C185B63B6D96D4DE6158532096F87226C02C301439DA3D1A54B34BD3AFED2E17763D7A0ACE5C7DE2EC53ED00A1';
wwv_flow_imp.g_varchar2_table(46) := 'D1415CFDCD19448273671F74CA5B95972E6C7CFF6A3166026810A32DD2BE8910BC9311F5B7147940496637D41D5E37A34134308EBE863F28497DA94F8956946947499653BAADCEBB918209B0083A5463A0672CA8EE1029BB056940C56CC109BD2ED5ACF6';
wwv_flow_imp.g_varchar2_table(47) := '6DB5DCF314D640C97C7B1A3F9DE7F8B4D8ADC8710995D476392C56FA7726C01248D194E8F67848AD3790782C517925BFF6A02E778C576AA8BB3D47191C86AE5F404FE367EADE7EE2F97CB71DA5590EE1125AE9819BF262132D339C5EC024E450A6B95E5F';
wwv_flow_imp.g_varchar2_table(48) := '68DE0299FE6673BAB0F9C0117836EFD13D2E7FA57DA037FED88D2BB871E9A33BB2D6D1C96E99C7890C873C713D2BC54DFB1C136005A8D13C7AC81F46DF4478DED422F1D182CA5AE46EAA84A76CAB2121D65A152974D9D7DB86919B5D18EE6EBD437B9AAA';
wwv_flow_imp.g_varchar2_table(49) := 'D11BBFC0EDE0B9FE0A6CCB04580148894768BB9402E986029179EB03AD080AB32EACAA85A76C9B725D31D9F07D221F5DBBF4F5B6C2DBD582C9A178A2DA858DE6F9051976D09487B737576E5426C0CAB19AF7E4702082D1C0B47AC966313176B707199E1C';
wwv_flow_imp.g_varchar2_table(50) := 'D81DE9C8C82F56626D1C39C570B85CB0DA5DB02B694C661019F3221A09221C0C223C36A0C42805860710094F21E01B43C41F2F4EB158A3D0654A5B9E97B136C9B9EE113ED37C8C0990A42928B06E6C2AA22C9613255A931479D78F5376E66C9715D94E1B';
wwv_flow_imp.g_varchar2_table(51) := 'B25D36DECF4F126C264092006A3F4E04A06B97F1FF62BA11C269B3C0434EEFB22985AAB9E9870013403F2CEF9044259B829128A6A663CA2E121184D61194F1211A8BE72DA22B88768B4589C654A648560B683E4F3FE3BFB3F05BDE401B31010C0497459B';
wwv_flow_imp.g_varchar2_table(52) := '1F012680F96DC41A1A880013C0407059B4F911600298DF46ACA1810830010C0497459B1F012680F96DC41A1A880013C0407059B4F911600298DF46ACA1810830010C0497459B1F012680F96DC41A1A880013C0407059B4F911600298DF46ACA181083001';
wwv_flow_imp.g_varchar2_table(53) := '0C0497459B1F012680F96DC41A1A880013C0407059B4F911600298DF46ACA1810830010C0497459B1F012680F96DC41A1A880013C0407059B4F911600298DF46ACA1810830010C0497459B1F012680F96DC41A1A880013C0407059B4F911600298DF46AC';
wwv_flow_imp.g_varchar2_table(54) := 'A1810830010C0497459B1F012680F96DC41A1A880013C0407059B4F911600298DF46ACA1810830010C0497459B1F012680F96DC41A1A880013C0407059B4F911600298DF46ACA1810830010C0497459B1F012680F96DC41A1A880013C0407059B4F91160';
wwv_flow_imp.g_varchar2_table(55) := '0298DF46ACA1810830010C0497459B1F012680F96DC41A1A880013C0407059B4F911600298DF46ACA1810830010C0497459B1F012680F96DC41A1A880013C0407059B4F911600298DF46ACA1810830010C0497459B1F012680F96DC41A1A880013C04070';
wwv_flow_imp.g_varchar2_table(56) := '59B4F911600298DF46ACA1810830010C0497459B1F012680F96DC41A1A880013C0407059B4F911F87FBC241888FC74A61A0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(233112720800364804478)
,p_file_name=>'icons/app-icon-192.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_32_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000000017352474200AECE1CE900000215494441545847637CDB68F79F610001E3A8034643603404866C087CF9F997E1C79F7FE0128483858981879D99ACD284E472E0';
wwv_flow_imp.g_varchar2_table(2) := 'CD4F260616192D06013935060E2109B0A53FDEBD60F8F0E816C39F27D71844D8218E221610ED80EFBFFF317CE5966490B4F46660E1E6C76AFE9FAF1F199E1FDFCAC0FDF53903272B13516E20DA016FD8C419645DA28832F4F19E650C22BF5E12A5962807';
wwv_flow_imp.g_varchar2_table(3) := '80825DD22D01A7CFD16D0287C4AE05444507510EF820AACB2069EA02B6E7DFAF9F0C5F9EDC62E053D245B1F7CB93DB0C9C42E20CCC5C7C60F1E7A7F73008BCBE4C3014083A0094DA79ADC31838C4E4C0867DBC7799E1C199030CFA61B928865F5C359941';
wwv_flow_imp.g_varchar2_table(4) := 'D1C401EEB01FAF1E317C3EBA8A60EE20E880375F7F3348FBE73330B1B113F40DB282FFBF7F323CD9309141849B15AF3E921DF0FAD261BC068AEAD9C2A3EAE9462A3800230A1EDE6210768AC3EA8897DBA63308AB1B42CA066A4501C830E444084A5C5F9E';
wwv_flow_imp.g_varchar2_table(5) := 'DF63E060452DF97EFCFECBC023A9044FAC544B84200780B2A1947B22388583E2F6C181750C5C4C7F1878F805C1BEFDF2F13DC3B77F2C0C0A0E410C8CACEC0C7FBF7D6278B6733EF5B221D8116805D1F7970F19BEBE831436DC42E20C9CE2F2F068A17A41';
wwv_flow_imp.g_varchar2_table(6) := '04321956144B59F9C0F33A7A4200FBFCD816DA14C530CB2095913683A0BC1A039B803858F8D787970CEF1F822AA3AB44053BB2C30966435C796EC0AA63924A232214931D0244984D949251078C86C068080000690115909EE3073E0000000049454E44AE';
wwv_flow_imp.g_varchar2_table(7) := '426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(233112720565043804476)
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
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000200000002000806000000F478D4FA000000017352474200AECE1CE90000200049444154785EEDDD777024D79D27F86F7903540128788F460368873664934D6F9B14BD91444994D9D1482BEDECCDEDCEED4C';
wwv_flow_imp.g_varchar2_table(2) := 'C4FD717711BBB77137F7C7EDDDC5DDEEC6686777461A196A24D1CA34BDF714C9F6166DD00DEF5140797FF1AA090E4521ABB20A59E6657E3382436A98F9F2BDCFEF35F35799CF9816FFFDCD19F0A000052840010A50C05002262600868A371B4B010A5080';
wwv_flow_imp.g_varchar2_table(3) := '0214C80A30016047A000052840010A18508009800183CE2653800214A000059800B00F50800214A000050C28C004C0804167932940010A5080024C00D8072840010A5080020614600260C0A0B3C914A000052840012600EC0314A00005284001030A3001';
wwv_flow_imp.g_varchar2_table(4) := '3060D0D9640A50800214A0001300F6010A50800214A080010598001830E86C32052840010A50800900FB00052840010A50C080024C000C187436990214A0000528C004807D800214A00005286040012600060C3A9B4C010A508002146002C03E40010A50';
wwv_flow_imp.g_varchar2_table(5) := '80021430A000130003069D4DA600052840010A3001601FA000052840010A18508009800183CE2653800214A000059800B00F50800214A000050C28C004C0804167932940010A5080024C00D8072840010A5080020614600260C0A0B3C914A00005284001';
wwv_flow_imp.g_varchar2_table(6) := '2600EC0314A00005284001030A30013060D0D9640A50800214A0001300F6010A50800214A080010598001830E86C32052840010A50800900FB00052840010A50C080024C000C187436990214A0000528C004807D800214A00005286040012600060C3A9B';
wwv_flow_imp.g_varchar2_table(7) := '4C010A508002146002C03E40010A5080021430A000130003069D4DA600052840010A3001601FA000052840010A18508009800183CE2653800214A000059800B00F50800214A000050C28C004C0804167932940010A5080024C00D8072840010A50800206';
wwv_flow_imp.g_varchar2_table(8) := '14600260C0A0B3C914A000052840012600EC0314A00005284001030A30013060D0D9640A50800214A0001300F6010A50800214A080010598001830E86C32052840010A50800900FB00052840010A50C080024C000C187436990214A0000528C004807D80';
wwv_flow_imp.g_varchar2_table(9) := '0214A00005286040012600060C3A9B4C010A508002146002C03E40010A5080021430A000130003069D4DA600052840010A3001601FA000052840010A18508009800183CE2653800214A000059800B00F50800214A000050C28C004C0804167932940010A';
wwv_flow_imp.g_varchar2_table(10) := '5080024C00D8072840010A5080020614600260C0A0B3C914A000052840012600EC0314A00005284001030A30013060D0D9640A50800214A0001300F6010A50800214A080010598001830E86C32052840010A50800900FB00052840010A50C080024C000C';
wwv_flow_imp.g_varchar2_table(11) := '187436990214A0000528C004807D800214A00005286040012600060C3A9B4C010A508002146002C03E40010A5080021430A000130003069D4DA600052840010A3001601FA000052840010A18508009800183CE2653800214A000059800B00F50800214A0';
wwv_flow_imp.g_varchar2_table(12) := '00050C28C004C0804167932940010A5080024C00D8072840010A5080020614600260C0A0B3C914A000052840012600EC0314A00005284001030A30013060D0D9640A50800214A0001300F6010A50800214A080010598001830E86C32052840010A508009';
wwv_flow_imp.g_varchar2_table(13) := '00FB00052840010A50C080024C000C187436990214A0000528C004807D800214A00005286040012600060C3A9B4C010A508002146002C03E40010A5080021430A000130003069D4DA600052840010A3001601FA000052840010A18508009800183CE2653';
wwv_flow_imp.g_varchar2_table(14) := '800214A000059800B00F50800214A000050C28C004C0804167932940010A5080024C00D8072840010A5080020614600260C0A0B3C914A000052840012600EC0314A00005284001030A30013060D0D9640A50800214A0001300F6010A50800214A0800105';
wwv_flow_imp.g_varchar2_table(15) := '98001830E86C32052840010A50800900FB00052840010A50C080024C000C187436990214A0000528C004807D800214A00005286040012600060C3A9B4C010A508002146002C03E40010A5080021430A000130003069D4DA600052840010A3001601FA000';
wwv_flow_imp.g_varchar2_table(16) := '052840010A18508009800183CE2653800214A000059800B00F50800214A000050C28C004C0804167932940010A5080024C00D8072840010A5080020614600260C0A0B3C914A000052840012600EC0314A00005284001030A30013060D0D9640A50800214';
wwv_flow_imp.g_varchar2_table(17) := 'A0001300F6010A50800214A080010598001830E86C32052840010A50800900FB00052840010A50C080024C000C187436990214A0000528C004807D800214A00005286040012600060C3A9B4C010A508002146002C03E40010A5080021430A00013000306';
wwv_flow_imp.g_varchar2_table(18) := '9D4DA600052840010A3001601FA000052840010A18508009800183CE2653800214A000059800B00F50800214A000050C28C004C0804167932940010A5080024C00D8072840010A5080020614600260C0A0B3C914A000052840012600EC0314A000052840';
wwv_flow_imp.g_varchar2_table(19) := '01030A30013060D0D9640A50800214A0001300F6010A50800214A080010598001830E86C32052840010A50800900FB00052840010A50C080024C000C187436990214A0000528C004807D800214A00005286040012600060C3A9B4C010A508002146002C0';
wwv_flow_imp.g_varchar2_table(20) := '3E40010A5080021430A000130003069D4DA600052840010A3001601FA000052840010A18508009800183CE2653800214A000059800B00F50800214A000050C28C004C0804167932940010A5080024C00D8072840010A5080020614600260C0A0B3C9C616';
wwv_flow_imp.g_varchar2_table(21) := 'C864800C808CF80700269309A6ECDF8DEDC2D653C068024C008C1671B6575702895406C9740689541A89740669F15706486732486580543A93FD4BFCFF32F8E4EF979FFB7F748804C09CFDCB94FDBB480C2C9FFC6F8BD904ABD984B5BFAFFDB35D9CC083';
wwv_flow_imp.g_varchar2_table(22) := '02149052800980946163A58D22F0E9C3FC9387F8DA835E3CF863C974F6E12E1EFCF1541AE974795444A2E0B49AB30981D56282CD6C82CD6286C36ACEFEF3E544E272B22012091E14A040750A3001A8CEB8B0560616100FF5603C85402C85503C55D687BB';
wwv_flow_imp.g_varchar2_table(23) := '56EC663360B798E17158E07158E1B699B309010F0A50A07A049800544F2C5813030A647FC1A7320827528824D2D907BFF8DFE215FE279FE8A557116F04C4C3DF6535C36533C369B364FFD969334BDF36368002320B300190397AACBB9402E29B7D3491CE';
wwv_flow_imp.g_varchar2_table(24) := '3EF4C52FFC68328D7852E1C3BC942DCC5D69911088B7032219106F066AEC16D83FF9A4A0C3E6B24914A85A012600551B1A564C6F02C1580A8BE1045663C9B27DAF97C550BC21F03A2D6874DBB209010F0A50A0F4024C004A6FCC3B185440BCDE0F27D258';
wwv_flow_imp.g_varchar2_table(25) := '8926B11A4D6647EBEBE5B57EA942BA36C0706DEC80784BC0B103A5D266B94617600260F41EC0F66B2A201EF06244BE18C0271EFAA144AAECBFF6D7E6F37F3AAF3F3BADCF929DE86FCA8ECCCFCEFA87598CD4339B904EA5C4BCC1EC34C1ECDA00994CF6FF';
wwv_flow_imp.g_varchar2_table(26) := '27FEB738D6929672272FE2C12F3E11789D56D439ADD959075CAB40D3EECAC20C2EC004C0E01D80CDD746403C1CC52FFDE54822FBF02FF7C3D26631C169B7C2E972C355E381C5EE84C56E87C5EE86D9E184D9EE84D9E682D92EFE12FFDB0193C59AAD6726';
wwv_flow_imp.g_varchar2_table(27) := '1943261E432611413A1ECDFE958A897F8E209D88221113FF3B8A68348C682482483C999D7E58CE368A07BF782B203E118859054C04B4E9B72CC5D8024C008C1D7FB67E830262E4BE78E8FB23C9ECE8FD521E36B7079E7A1FDC1E0F1C6E0F1C9EBAECDF2D';
wwv_flow_imp.g_varchar2_table(28) := 'AE5A989CB53099AD30992D80F8652F9E909FFCD2170BFA885FFCD9FFBF9A23BBA08078C0A72F2F1928FECFDAFF4FBC1948C6908E85918A04110B05100FAD22125C4534144068791EB14844CD5D8A3E4734C7E7B6659301F18980070528509C001380E2DC';
wwv_flow_imp.g_varchar2_table(29) := '7895C105C4F7FCC550020BE104925A3FF84D26D81C4E383D5ED4F8DA51D3D80A87A71E76572D2C0E17ACE2816FB5555504D2D12052F118D28918E2913022C1150467C710599ECF2607C958F49FBE25685473B10891D761414BAD3DBB08110F0A50A03001';
wwv_flow_imp.g_varchar2_table(30) := '26008579F16C830B88E97B73A178F617BF96AFC04D2633EC6E173CBE56D4B7F7C0D3D90FBBAF23BB1CAFCC47269D467C7112C1E951F8A7C7B0B238974D10B4C413440D2E2B1301993B0AEB5E110126001561E74D651310DFF7174289ECBC7DAD1EFC356E';
wwv_flow_imp.g_varchar2_table(31) := '277C9DBDA86DEF87BBBD1FD65A9FEEBF6D8B4186A9C012427363084C5D807F7214A1704433D3B5A9841C2720DB9F30D6B712024C002AA1CE7B4A21201EF48158323B775F8B817D668B0535F58DA86BED447DF7005C4D9D30DB9C55F73ABF5CC1C9A41248';
wwv_flow_imp.g_varchar2_table(32) := '468288CE8D61796A0C2B739388AC2C229DDAD8A60662A843ADDD82D65A3BDC5C53A05CE1E47D241460022061D058E5D20BC453194CAFC6B2AFFA377298CCE6EC88FBE6CE5EF87AB7A1A6A503965ADF468AD4EDB5E9E01282F39358183D03FFDC04E2A1E0';
wwv_flow_imp.g_varchar2_table(33) := '863F15D4BBAC68F73AC05D0B75DB6DD8B00D083001D8001E2FD59F8018C93F178C632992D8D0FC7DBBC3015FD76634F66F87BB731016AB557F58256C91184C189C3C8FA58B27317FE93C528978D177136304C440C1A61A5B762D011E14A0C065012600EC';
wwv_flow_imp.g_varchar2_table(34) := '0914F864B11B7F3489D9403CBBCD6E31875864A7AE7B0B5A0677C2D3DE07ABDDA9FB6FFAC53815728DF80C938C47119E1BC7ECE983F04F9CBFBC705111875862582401626121E6014500F212DD093001D05D48D9A04205C45CFE99400CABD1E21E2C669B';
wwv_flow_imp.g_varchar2_table(35) := '030DBD43681BDA85DA966EC37ED32FD4BDD0F333C90402B363981D3982E5F1F3D9058B8A39C440C10EAF8353078BC1E335BA126002A0AB70B231850888EFFCB38118968B9CD267B6DAD1D23780D6EDFBE06CEEE6AFFD42F037786E442402A70F62FEE269';
wwv_flow_imp.g_varchar2_table(36) := 'A41289824B139F05C44242E2D38058459107058C28C004C0885137789BC532B6625ADF5C3051D4EB7EABC38EB6AD57A269EBD570D4D6493F575FD6EE203E0FC45697317BE25DCC9E3D8A74A2F0019B76AB299B04F85C362670B27604D6BB6801260045D3';
wwv_flow_imp.g_varchar2_table(37) := 'F1421905C4423ED345BEEE77787D6819DA8DA6815D70D47A656CBE6EEB2C660CCC9FF9083323C791082E17DCCE3A9735FB5980B3050AA6E305120B3001903878AC7A6102623EFFE44AACE04567C4D2BBEDDBF7A2B97F07EC758D85DD94679755201158C2';
wwv_flow_imp.g_varchar2_table(38) := 'ECC8614C1DFF28BB2C712187D87DB0DD6BCF7E1AE04101230830013042940DDE4631B56F3E14C77CB0C06FC526137C7DDBD075F57EB83CF57C452C493F129F0622AB4B18FFFDCB581E1B29682D81B58D86DA3D768884800705F42CC00440CFD165DBB2DF';
wwv_flow_imp.g_varchar2_table(39) := 'F8C7FDB1EC12BE851C4E5F2B7AF7ED475D473FCC7C1014425735E78A658797274771E9FD1710F32F1454AF5A87055D759C2950101A4F964E80098074216385D50A88B5FBA7560B7BE56F71BAD1BEFD6AB40D5F0BABDDAEF6563CAF8A05929110664E7E88';
wwv_flow_imp.g_varchar2_table(40) := '99D30721FE59ED21DE00B4792E2F20C483027A146002A0C7A81ABC4D62AB5EF1AD5F8CF457BD718FC984A6FE6DE8D8753D5CBE76BEEED7591F12FD2034378EC9436F6179E2BCEAD671BAA06A2A9E28A10013000983C62A2B0B8851FE63FE28C4E23E6A0F';
wwv_flow_imp.g_varchar2_table(41) := 'B149CFE65B1E42C3A6ED304BBEFDAEDA361BF5BC743A83C5734770F1FD17918AAB1F24283E09747A1D70DACC46A563BB7528C004408741356A9396C428FFD558416BF8FB7A87D0B7EF0E8EEE3758A749049631FAFE8B58BA34A2BAE52237DCE473C1E3B0';
wwv_flow_imp.g_varchar2_table(42) := 'A8BE862752A09A05980054737458375502E2F5AE98E227E6F7A755FEF0B7D81DE81CDE87D6E1EB61E1B77E55CE7A3B29158F62F6C4079838FC8EEAFD054412D059E7E05441BD750683B68709804103AF9766A733C07C308E9980FADDE21CDE7A6CBEF62E';
wwv_flow_imp.g_varchar2_table(43) := '78BA87F8AD5F2F1D6103ED58191BC1F9B77E87780103043BBC7634D77290E806D8796915083001A88220B00AC5098887FFB83F0A7F44FD12B0CD9B87D17BC3BDB0DA1DC5DD9457E95220115AC5C5779FC5E2A5B3AADBD75863CB8E0BE0B011D5643CB1CA';
wwv_flow_imp.g_varchar2_table(44) := '049800545940581D750262239F097F148198BAF9FD56A71BDD7B6E40F3B6AB60B658D5DD8467194A40AC1C387FEA238C1D7A1BA984BA374AF59F2C21CC0D850CD55574D3582600BA09A5711A52E8E23EEEB5457DBA361B07892D2D5A20307116236F1D40';
wwv_flow_imp.g_varchar2_table(45) := '22145055861814D8D3E084950B46A9F2E249D523C004A07A62C19AA810100FFFF38B1188E57DD51CDED64E0CDEF665D86AEBD49CCE7328901588FBE731F2F2E308FA17558938AC666CF23921FECE8302B2083001902552AC67F675FFE85244F5E23E6D83';
wwv_flow_imp.g_varchar2_table(46) := 'C3E8BDF10198F8CA9FBDA7088144248CD1971EC3D2DC8CAAABC5C35FCC10E03441555C3CA90A0498005441105885FC02E2E17F7139A27A9A5FD7AE6BD1B9F7363EFCF3D3F28C1C02A95804A3AF3D8E85894BAA9CC45880DE06276AEC5C2B4015184FAAA8';
wwv_flow_imp.g_varchar2_table(47) := '0013808AF2F3E66A04C46BFF33F361D5BFFCFBAEBA156DBB6F004C7C1DABC697E7E416C8A492987CEB694C9C3BAD8ACA6C06061ADD7071D540555E3CA972024C002A67CF3BAB10104BFB5E5852F7CDDF6C3663F0E6FBD130B05B45C93C8502EA0532E934';
wwv_flow_imp.g_varchar2_table(48) := '163E7E11178E7EA82A11150FFFEE7A279300F5C43CB302024C002A80CE5BAA1310BFFC2F2DAB5BD7DF5EEBC1D04DF7A3B673405DE13C8B02850AA4D3583AFA06CE1D122B07E61F842A3E03F4F9383BA050669E5F3E012600E5B3E69D0A10103BFA89D1FE';
wwv_flow_imp.g_varchar2_table(49) := 'E20D40BEC355D780ADB73E04477377BE53F9EF29B031814C068193EFE0CC476F239948E42D4B2401FD8D2E7086605E2A9E50010126001540E72D730BA4D2195C5C8E22A862919FDAFA060CDDF928EC754D64A540D904A2170EE2E45B2F209EC8BF0AA5CF';
wwv_flow_imp.g_varchar2_table(50) := '6D45579D932B06962D3ABC915A0126006AA5785E5904C4C37F6A3586A570FEFFB03ABD0DD87E171FFE65090C6FF24702D1B19338F1EAD34824F3BFA56AF5D8D1E6E1DE01EC46D525C004A0BAE261F8DA4CAEC4B010CAFF6AD55EEBC58EFD5FE26B7FC3F7';
wwv_flow_imp.g_varchar2_table(51) := '98CA02844EBD8393EFBF8E542A7F12D05C6B4387977B50543662BCFB67059800B03F548DC06C208ED9603CEF286B8BD58A1D777D0DEEF6FEAAA93B2B625C01FFC72FE0CCE1DFE7EDB742A8BBDE019FDB665C2CB6BCAA0498005455388C5B99703C85738B';
wwv_flow_imp.g_varchar2_table(52) := 'F957F9133BAFEDB8FBEB1CED6FDCAE527D2DCFA431FFC1B3B870E250DE2440AC11D0D7E0E26A81D5174543D688098021C35E5D8D1623FECF2D4420A6FDE53A4C2633B6DCF805D46FB9BABA1AC0DA185E402C1634F3CEAF7169E4645E0BB164F060930B16';
wwv_flow_imp.g_varchar2_table(53) := '4E0DC86BC5134A2BC004A0B4BE2C5D858018F1BF12C93FE8AF7FDFED68D975838A12790A05CA2F90492630F5EACF313E3696F7E6621BE19E7ACE0CC80BC5134A2AC004A0A4BC2C3C9FC07C308EA9D5FC7BAFF75D713DDAAEBC1D9C4B954F94FFBE9202E9';
wwv_flow_imp.g_varchar2_table(54) := '4800975EFD0566A7F36F20C4F100958C14EF2D049800B01F544C40ED77FFF6A15DE8BDF9A18AD59337A6402102E9F02ACE3EFB0F58F6AFE4BC8C7B0614A2CA734B21C004A014AA2C33AF80F8DE3FBA14CDFBDDDFD7D58FC13BBE0A939523A7F3A2F284AA';
wwv_flow_imp.g_varchar2_table(55) := '11882FCD60E4B99F221889E6AC93D833607323C703544DE00C56112600060B783534379301C657A258CEB3D88FCB5B87ADFB1F81A3B1A31AAACD3A50A02081D0D90F71E2AD17914EE71EDC5AE7B2A297E3010AB2E5C9DA083001D0C691A5142030178C63';
wwv_flow_imp.g_varchar2_table(56) := '5AC577FF2D6267BFA12B0A2899A752A08A0432192CBCF734CE9D3C91B7521C0F909788279440800940095059A4B240289ECA6EF223DE02E43A3AB7EC42F70D0F00E243290F0A482A900EAF60F4955F627E7636670BC494C0BE06276A1D16495BCA6ACB28';
wwv_flow_imp.g_varchar2_table(57) := 'C00440C6A8495AE7442A83D1A508227976F873D73560F8E1EFC36CE3B2A992869AD5FE8C407C6E0CA75F780CE158EEA9AEE2E12F9200AE0FC0EE532E012600E592E67D302396FA0DE49EF26775D8B1EDD68751D3BD856214D08D40F0EC419C78F340DE37';
wwv_flow_imp.g_varchar2_table(58) := '5FDC3448372197A2214C00A40893FC951453FE4697A348A672BFFB1FB8E23A34EDBD43FE06B30514F89CC0CC9B4FE0E2C8A99C2E62A9EB2DCD6E88D5027950A0D4024C004A2DCCF2B3026717C208C7738F866EEAE846FF6D8FC0ECAAA51A05742720C603';
wwv_flow_imp.g_varchar2_table(59) := '8CBCF84BF817728F07F0B9ADE8AAE32A81BAEB0055D8202600551814BD55693992C4D872EEF9D0668B09573CF81DD81A3BF5D67CB687029F0A44C74FE1E4EBBF463C967BCB6BB136000704B2E3945A800940A9850D5EBED8E847FCFA8F27F3BCFABFEA26';
wwv_flow_imp.g_varchar2_table(60) := '34EDB9D5E05A6CBE1104168FBC8EB31FBE95B3A96281A0812637B85F90117A44E5DAC804A072F686B8B318F42706FFE53A1A9B9B3170FF3F87C9C2D5FE0CD1290CDEC8742A89D34FFD0D5657722F15CC018106EF2865683E138032201BF51662E0DF85A5';
wwv_flow_imp.g_varchar2_table(61) := '285269E55FFF668B05C3B73D0077DF4EA332B1DD0614085F3C81A32F3F95B3E562098C2DCD35B05B4C06146293CB21C004A01CCA06BDC785C50802B154CED6F76CDD858E1BB9D18F41BB88719B9DC960F4F97FC0ECE4444E8306B715DD1C1068DC7E52E2';
wwv_flow_imp.g_varchar2_table(62) := '9633012831B0518B5F89267169399A73DEB3CDE1C09E87BE0B8BB7C9A84C6CB7810562739770EAA5C7118D44722AF4F99CA8735A0D2CC5A6974A800940A9640D5CAE9A817F62BEF3E035B7C3377C8381A5D874430B88BD020EBF86731FBF9393A1C66EC1';
wwv_flow_imp.g_varchar2_table(63) := '261F570834745F2951E399009408D6C8C5AAD9ECA7A1DE8B2D0FFF39C06D7E8DDC550CDFF6547019232FFE23569616152D44B2DCE175A0A98683640DDF6134066002A031A8D18B53B3DEBFC56AC1F65B1F424DDF0EA373B1FD144064EC048EBEF454CECF';
wwv_flow_imp.g_varchar2_table(64) := '6576AB095B9B6B2092011E14D04A80098056922C272B301F8C632ACF56BFDD035BD179CB23E07FCDD869287059E0FC0B3FC3FCF8684E0E8E05606FD15A800980D6A2062E4F6CF17B7A3E9473D11F8BD58C2BEEFB16ACCDBD069662D329F08702D1990B38';
wwv_flow_imp.g_varchar2_table(65) := 'FEFC2F914C2AEF18285606DCE473717120761ECD0498006846C98256A3498C2EE55EF2B77BFB15E8BCF65E404C72E641010A7C2A30FEEA3F62F2C239BE05609F289B001380B251EBFB4662AD9FF38BB937FCB15A4CD8F5C077606FE27AFFFAEE0D6C5D31';
wwv_flow_imp.g_varchar2_table(66) := '02B1E97338FAC2AF904A2AAF9D51E7B2A2B79E1B0515E3CB6BFE588009007B85260262C11FB1F04FAEA3A36F337AF63F0A98F8EB5F137416A22B814C228E89B79FC6E4F911C5768917679B1AB85190AE025FC1C63001A820BE9E6E2D16FDF14794BF5F9A';
wwv_flow_imp.g_varchar2_table(67) := '2D66ECBCE75B70B5F1DBBF9EE2CEB6682B20DE021C7EF61F73CE08F03A2F8F05E041818D0A3001D8A820AFCF2EF77B713982745A19A3BDAB1BBD777D9B23FFD95F28904320934CE0EC811F62697E4EF12C3115705B4B0D6CDC23807D6983024C003608C8';
wwv_flow_imp.g_varchar2_table(68) := 'CB915DF237F7AF7F0B76DFF94538BAB6918B0214C82310BA7412C75F7E32E75B80965A1BDABD0E5A526043024C0036C4C78BC5E0BF5373212453CA3BFE3575F562F39D5FE776BFEC2E1450239049E3DCEFFE1E0BB3338A678B01B5434D6EBE0550E3C973';
wwv_flow_imp.g_varchar2_table(69) := '94DF262DFEFB9B95FFCB4D380AE411580C2730E18FE57C5DB9E3B68750DBBF8B9614A0804A81C099DFE3D43B2F219DE3BB5A6F8313F52E6E12A49294A7AD23C03700EC16450B88857FCE2F46108AE798B6D4D2816D777F03B073D052D1D0BCD07002E944';
wwv_flow_imp.g_varchar2_table(70) := '1CE79FFF091667A715DB2E0603F635B8B8A0A6E17A87760D6602A09DA5E14A8A26D238331FCED9EEADB7DC8FFAC12B0C67C3065360A30281738771E2F5DFE6FC0CD0EF73C165E3B4DA8D5A1BF57A2600468DBC06ED5E082530B9A2FCFADF6EB360D757FF';
wwv_flow_imp.g_varchar2_table(71) := '07585D351ADC8D4550C05802A995391C7CFAEF722E0CD4E6B1A3D56337160C5BAB99001300CD288D55502A9DC98EFE175300958E8EDE7E74DFF14D63BCA24CA79149C521E6429AEC4E2E76A4F51F87740A99643C5BAAC96A07CC16ADEF5075E589F65E7A';
wwv_flow_imp.g_varchar2_table(72) := 'EB3798397F4AB16EE2D7FF50B3BBEAEACE0AC921C004408E38555D2DF3CEFD3799B0EBF607E0DEB4BBEAEAAE558532E90CC22B8B082E4C21383B89F0CA3C32A9246A9A3A51DBD28DDAE676B83D753071DF83A2C833990CC2AB2B08CE8E2130338ED0D20C';
wwv_flow_imp.g_varchar2_table(73) := 'CC562B6A1A5A50D3D289DAA64EB8EB1B759D6006468FE1E4ABCF284E09146B026C6976C361E56780A23A99C12F620260F00E506CF3275662580C25142FB73B5DD8F3953F87D9A1BF5F27A964128BA73FC6E4C90F110FAC2093597F052493D9029BDB8D9E';
wwv_flow_imp.g_varchar2_table(74) := '2B6F816F700FCCDCCC5D55774BA733583C7B0813C77E8FF8EA22320A23E14D2633EC758DE81EDE07DFD01E987598686562611C7BFC3F211CBDFCF663BDA3DD6B474B2D3F03A8EA5C3CE90F049800B043142570723684448EB9FF5D83DBD075CB2345955D';
wwv_flow_imp.g_varchar2_table(75) := 'CD1745162671FEC337119ABAA0F8E0FFA3FA9B4CA8EBDB8ABE2B6E82CBD75ACDCDAB78DD22CB7338F7EE0B08CF8CA9F6158980ABA50B4337DD0B677D73C5DBA0690532198CBDFA4B4C8D9E552CD6693363A0D1058BD9A4E9AD5998FE059800E83FC69AB7';
wwv_flow_imp.g_varchar2_table(76) := '302836FE598A28BE96345B2CD8B9FF21B87A76687EEF4A16B83C7A12E7DE790EA968EE990F4A75B4BABD18B8EE4ED46FDA5EC96654EDBD572E9EC2C89BBF432A9E7B4B69A506581C4E6CB9E521787B86AAB68DC5542C74E9048EBDFC34722D0DD8DFE882';
wwv_flow_imp.g_varchar2_table(77) := 'C7A1FF7111C5F8F11A65012600EC1D050B8CF9A3580E2B6FFCD3D0DC86A12F7C0D2697B7E0B2ABF582F0E2348E3DF343D5BF4A95DA21C6030C3FF43DD434F24DC0678D420BD338F9DC6348C572EF2899AF7F581C2E6CBBEB51D4B674E53B559A7F2F12A2';
wwv_flow_imp.g_varchar2_table(78) := 'D34FFD00816050B1CE5C1A589A705655459900545538AABF3262F4BF98FB9FEBF5FFE0D537A371F72DD5DF1895354C462338F6BB1F23E69F577945EED36ADA3761DB1D5F86D5C1C59184543299C4B1DFFE18B1C5294D7CED75CDD8FDC5EFC162D5CF2A79';
wwv_flow_imp.g_varchar2_table(79) := '73EFFE06174E1E51F4A9B15BD0E773C2CACF009AF421A314C204C02891D6A89DF916FF11E3DC763FF81D389B75F20B2C93C1C4A1373071F02D8D042F17D37DC54DE8DC7BABA665CA5AD8F8072F61F2D8FB9A56BF6BCF0DE8BAEA764DCBAC6461B1895338';
wwv_flow_imp.g_varchar2_table(80) := 'F2F2334827D77FF326F606E8AD77A2969F012A1926E9EECD0440BA9055B6C24BE104C673ACFDDFDCD185FE2F7CF3F25C6D1D1CC9A5697CFCCC8F90492BAF77504C33CD361BAE7CE83BB0D61BFB534072650E1F3FF9779AFB8A19187BBFFC3D58EB5A8A09';
wwv_flow_imp.g_varchar2_table(81) := '4FD55D938E8571FAF99F63755E796960CE06A8BAB0557D859800547D88AAA78262EDFF89952896727CFF1FDA77337C3B6F865E26672F7CF422CE1DFEA02441D8BCE71A345FF58592942D4BA18BC7DEC1D90F5E2D497587AEDD0FDFF0F52529BB12854E7D';
wwv_flow_imp.g_varchar2_table(82) := 'F002C68EFD5EF1D6626F804D3E7E56AA446C64BD271300592357817AC792E9ECEA7F91C4FAF3DE4595F63CF02770B6F656A076A5B9E5B9579EC0C2A8F24A6C1BB96B63773F06EFFAE6468A90FADA4C22860BEF3C87F973C74AD28ED6AD5760D30DF7E926';
wwv_flow_imp.g_varchar2_table(83) := '190D8C9DC1A9977F25169B5CF7B0594CD8DECA65B74BD299745A2813009D06B614CD5A8D26717139AA381BC962B313A59127000020004944415462EFD7FF1266B114AE4E8E63CF3E969DF35F8AC3D9D0843D5FFA33C32E1B9C890470F4C55F2132AFCDE0';
wwv_flow_imp.g_varchar2_table(84) := 'BFCFC7C8D33D84EDB7DC0793B3B614E12B7B99A9E0128E3CF903C415127031FE665B4B0D4422C083026A049800A851E2395981D9401C3301E515C91A5ADA30F4C0F7F5F2F61FC8A471F4773F4378F652497A80C5E9C2555FFF4B982CC69CBF9D0E2CE0E3';
wwv_flow_imp.g_varchar2_table(85) := '5FFFB8E87515F205C5DDDA83E1DB1E80B9D697EF5429FE7D261EC1D9977F85A5A931C5FAF6363851EFD2CFEC0729022371259900481CBC72577D742982D5A8F260B8BE5D57A36DDFDDE5AE5649EF77ECC0CF109A1E2DC93D6C6E0FF63EFA17800E97B055';
wwv_flow_imp.g_varchar2_table(86) := '03960EAFE0E873BF4074794ECDE9059FE36EEBC3F0ED0FC2ECAE2BF8DAAABC2093C6ECC1D7307AE85DC5EAF9DC5674D539F59384576520F453292600FA8965C95B726A2E847832B3EE7D2C363B76DCF600DC3DFA5AE5EECC2B4F60B94463006A5B3A30FC';
wwv_flow_imp.g_varchar2_table(87) := 'C07775F38DBAD00E287ED19E79E3B7F05F3A53E8A5AACEF70DECC2E00D77C36473A83A5F86938293E771FCB99F2B56D56E3561B0C9CDF50064086615D4910940150441862A88F9FF230B61C5EFFF2E6F3D76DEFF6D98DDFA59FD4FC465FCF72F61F2A8B6';
wwv_flow_imp.g_varchar2_table(88) := '73D4D7E2DDB1ED4AF488416A063E260EBEAEF91A0B6B9C3DFBF6A363977E660188762522611CFBD5FF8B7842F94DDCD616EE0E68E03F5205359D0940415CC63D792194C0E44A4CF9D563472F86EEFD13DD01AD8C9EC0A9579ED2BC5D62039BA19BEE41C3';
wwv_flow_imp.g_varchar2_table(89) := 'D0959A972D5381FE8BA771FAE5C74B52E5ED773D0A6FF76049CAAE54A1E94C06E79EF90196161715ABD0D3E04403C701542A4452DD97098054E1AA4C65C5FCFF4BFE285622CAEBFFF75D713DDAF6EEAF4C054B78D7446805C77EF733C4034B9ADE452C57';
wwv_flow_imp.g_varchar2_table(90) := 'BBEBFE6FC1EAD2C708F5627192B1080E3FFE0324A3A1628B58F73AB127C0155FFB0B58EDFA5890EAB38D9C7DEFB7183D7158D1ABB9D6860EAF7E3E7B68DA3158D81F0830016087C82B20D6FF17AFFF95BEFF8B02B6EDFF12EA36E96BF7BF3598A9334731';
wwv_flow_imp.g_varchar2_table(91) := 'F6D6AFF33AA93EC16442F7D577A073D7B5AA2FD1F3891387DE86F814906BB7BB82DA6F32A1EBCA5BD175C58D055D26CBC9A10B4770ECF50380C2EA945C1048964856BE9E4C002A1F83AAAF41329DC1C9D990F2FC7F8B05C3F7FF095C7A59FFFF73111109';
wwv_flow_imp.g_varchar2_table(92) := 'D089DFFE10618DE6ABD7760D61FB9D8F406C9BCC0348259338FAF4DF22B6A2CD5B16574B3786EFFB13582C665DF226FD7338FCECCF910C07D66D9FD818484C07E47A00BA0CBFA68D6202A029A73E0B132B009E9E0B2B36AEBEA51D9B6FFD226CDE467D02';
wwv_flow_imp.g_varchar2_table(93) := '00082FCFE3F8AF7F887452791D04358D375BEDD8F5E53F83D353AFE674C39C139A1BC789671F433A99D8509B2D4E37C4B7FF9AE6CE0D9553CD176752491C79E6EF105D5E7F774A3113A0A7DE099108F0A0402E012600EC1F790582B114CE2F2AEFD3DE36';
wwv_flow_imp.g_varchar2_table(94) := 'B8033DD7DC0DB3D39DB72C994FF09F3B8291F75E42BAC83DEB2D2E0F866EBA17753D43323394ACEEABE36771FAD5A7904E149764996D0E6CBDE3CBF0766E2E591DABA1603126E7F4B33FC1CAF4FA0B54891501BBEA1CF0B96DD5505DD6A18A0598005471';
wwv_flow_imp.g_varchar2_table(95) := '70AAA56AF97600D4EB00C0F5FCC3D3A31879EF654497660A0A8FBBB91D03D7DF03B78E7F991604A270B2587571E4ADE710F5AFFFEB56E91E8E3A1FB6DCF200DC2D3D5A54A3EACBB8F8C6D398397B5CB19E6D1E3B5A3DFA1B0059F58191AC824C00240B58';
wwv_flow_imp.g_varchar2_table(96) := '25AA9B6F09E02D37DF67A8E96CE29BF5F807CF63F6F4116432CA1B2365636532A163E7B5E8DC7B1B2CFCE6AFAAFB8A3700E31FBD8A99531F23A3B4F3CD272599CC66B46DBF0A5D57ED87C56A9C2570678FBC85D10F5F57F46C705BB39F01785020970013';
wwv_flow_imp.g_varchar2_table(97) := '00F68FBC02E3FEDC5B00EFBCF71BA8E9D0F76BD7F590E2C15504E7271109AC201AF0231609661F58CEDA3AB83CF57037B6C2ED6B85DDC92D5AF376B2754E4844C308CE8E23BCB284587005916020BB6F82C3590367AD076E6F3DDCADBD70B88DB703DED2';
wwv_flow_imp.g_varchar2_table(98) := '998338FBF601C581B9E2FBFF4013FB5D31FDCE48D730013052B48B68AB980130B61C4520A6BCF2D8555FFD7358753C00B008365E4281920A8427CEE0C48B8F43CC5059EFE0D6C025E5D74DE14C007413CAD234241C4F61CC1F839809B0DE21A6B2EDFDC6';
wwv_flow_imp.g_varchar2_table(99) := 'BF81C5A1EF0180A5D165A914284E20BE38991D30195EF1AF5B80C56CC28ED61A6E0A541CAF61AE620260985017D7D09568129796A38AAF1AEDEE5AEC79E4CF61B673E5B1E2847915050A174887FC1879ED19F867C6D74FCCCDC096E61AD82DA6C20BE715';
wwv_flow_imp.g_varchar2_table(100) := '8611600260985017D7D07C7B00D4B77561CBDDDF82C9CA2947C509F32A0A142730FAC633983D7B6CDD8BC554C07E9F0BB50EAE05509CAE31AE6202608C3817DDCA99401C621680D2D13EB4133D373C901D9CC5830214289FC0E447AF62FCF03B8A0900D7';
wwv_flow_imp.g_varchar2_table(101) := '02285F2C64BD131300592357A67A4FACC4B0185A7F75363105AB67F77568DB730B138032C583B7A1C09AC0ECF10F30FAFE8B8A0940BBC78EE65AAE05C01EA32CC00480BD23A7C0983F8AE5F0FABB009ACC16F45F7D1B9A765C03910CF0A00005CA27B038';
wwv_flow_imp.g_varchar2_table(102) := '721067DF3CA0980034D7D8D0E671702060F94222DD9D98004817B2F256F8E2B2F236C066AB158337DC8DFA812BF81F99F2868577A30096CF1FC399D79E514C001ADD36B47B1D30731C207B8B82001300768D9C02A34B11AC46D75F03C062B361E8968750';
wwv_flow_imp.g_varchar2_table(103) := 'D7B78D8A14A0409905562E9EC2A9979F50BCAB580DB0ABCEC904A0CC7191E9764C00648A5605EA2A3601129B01AD7758ED766CBDFDCBA8ED1AA840CD784B0A185B6065E23C4E3DFF734504AFD3925D0E58AC09C08302EB09300160BFC829903B017060F8';
wwv_flow_imp.g_varchar2_table(104) := '9EAFC3D9DC4D450A50A0CC0281E94B3871E0278A771553007B1B9CB03201287364E4B91D1300796255919A9E5B8820145FFF0D80CDE9C2F0BDFF0C0E5F6B45EAC69B52C0C802A185291C7BE6EF1509DC763336F95C4C008CDC49F2B49D09003B474E81B3';
wwv_flow_imp.g_varchar2_table(105) := '0B6184E3EB2F03EC70B9307CFF7760AB6BA4220528506681887F01479EF881E25D1D56333637BA20F605E041017E02601F285860643E8C4862FD04C0E9AEC1F0C3DF83D5ED2DB85C5E40010A6C4C20EA9FC7E127FE8B6221568B09834D6E2E07BC31665D';
wwv_flow_imp.g_varchar2_table(106) := '5FCD3700BA0EEFC61A97C900230B614415120097C783E187FE052C4E6E04B431695E4D81C205A22B8B38F2E40F9051D811500CFE1B6C7241BC09E04101BE01601F2848205F0250E3ADC78E87BF0FB3DD5950B93C990214D8B8406C7519479EF81BA4D30A';
wwv_flow_imp.g_varchar2_table(107) := '3B759A81A1263713808D53EBB604BE01D06D6837DEB0BC09405D03763CFC2F60B671B9D18D6BB3040A1426100F2CE3F0133F403AB5FE205DB138271380C24C8D76361300A345BCC0F6E61A03E0F6D66513000BDF0014A8CAD329B071817C6F00F80960E3';
wwv_flow_imp.g_varchar2_table(108) := 'C67A2F810980DE23BCC1F6E59A05E0AAADC58E87BE0FABAB768377E1E514A040A102620CC0A1C7FF064A63FCC5E8FF010E022C94D550E733013054B80B6F6CAE75001C2E37763EF45D586B1B0A2F98575080021B12882CCFE3C893CAB300380D7043BC86';
wwv_flow_imp.g_varchar2_table(109) := 'B898098021C25C7C2373AD046873B8B0F3C13F85BDAEA9F81BF04A0A50A02881F0F21C8E3EF9B78AD7BA6C66F4377221A0A2700D721113008304BAD866E64E009C18BEF71B703476165B3CAFA300058A1408CD4DE0D86F7EA478758DDD823E1F97022E92';
wwv_flow_imp.g_varchar2_table(110) := 'D7109731013044988B6FE485C508024A9B0139ECD876C7D750D3DE57FC0D782505285094C0EAE4284E3EF733C56BB9195051AC86BA880980A1C25D7863736D077C7937C02FA1B66BB0F082ABF90A31FF9187FE044CFA5A12D77FE90C4EBFF42BC538713B';
wwv_flow_imp.g_varchar2_table(111) := '60FD7561AD5BC404406B519D957769390A7F24B96EAB2C361B066EBC0F0D9B774ADDEAE4EA02E6460E63616214894818198579D55237929507CC66386ABDF075F4A0757037AC75CD52AB2C8F9EC499579E5CB70D22D769AEB1A1D5E3003703943ACC25AD';
wwv_flow_imp.g_varchar2_table(112) := '3C138092F2CA5FF8B83F8AA5F0FA0980C962C1E67DFBD1B8FD1AC8FAE32ABD3A8F336F3D8B95E931F983C516A816F036B660EB9D5F81B9D6A7FA9A6A3B71F1EC119C7DE3378A09406BAD1DCDB5762600D516B82AAA0F13802A0A46355665722586855062';
wwv_flow_imp.g_varchar2_table(113) := 'FDAA994CE8BBE27AB4EEB91526B1EC9884C7E2E1D770F6A3B725AC39ABBC5181A16BF7C3377CFD468BA9D8F573273EC085F75E544C00DA3D9713001E1450126002C0BE9153607A3586B9A0420200A07DCB2EF4DCF080B409C0B9E77E8C8549FEFA37E21F';
wwv_flow_imp.g_varchar2_table(114) := '838EED57A2E7FAFBA46DFAC447AF62E2F03B8A0940579D033EB74DDAF6B1E2A5176002507A63A9EF301F8C636A35AED886FAF61E6CBDFB9B80C52A653B479E7F0C4B1317A4AC3B2BBD3181B66D7BD177C3BD1B2BA45257A7D3B8F0E633983B77423101D8';
wwv_flow_imp.g_varchar2_table(115) := 'E473C1E3B054AA86BCAF04024C0024085225ABB81C49626C39AA5805478D177B1EF9EF60927443A04B6FFE1AD323472B49CC7B5748A07BCF0DE8BCEAF60ADD7D63B74D079770E6F55F636566423101D8D2CC9D0037A6ACFFAB9900E83FC61B6A613096C2';
wwv_flow_imp.g_varchar2_table(116) := 'F84A14F1E4FA53E3CC1633F63EFA6F6071D56CE83E95BA78F6F01B18FDE8CD4ADD9EF7ADA0C0C0F55F40D3F66B2A5883E26F9D589CC089171F4734145CB710B111D0F6D61A0E002C9ED8105732013044988B6F642C99C6B83F86507CFD2D4745C9577CF9';
wwv_flow_imp.g_varchar2_table(117) := 'CFE0686829FE2615BC72F9DC518CBC750099D4FA331D2A5835DEBAC402DBEEFE06EABA3697F82EA5293E383E82932FFD12E9F4FAE5DBAD266C6B9133292F8D184B5D4F800900FB455E815C6B01888B87EF7E54DAC58042339770FAF5DF2011F4AFEBD036';
wwv_flow_imp.g_varchar2_table(118) := 'B41B03DFF93FF21AF184EA1338FBA3FF19B32347D6AF98C9845D0F7F0FEEC6B6EAABB88A1A2D9E3988736F1F80D29A55B50E0B3637BA5494C4538C2CC004C0C8D157D9F67C3301866EBA17BE2D7B5596565DA7C523219C7AE197882C4CAE5B318BDD8EEB';
wwv_flow_imp.g_varchar2_table(119) := 'FED7A720ED4207D5C55DBEDA643278EFDF7D09A9C4FA0358AD6E2F763DF86DD86BEBCB57270DEF34F5F1AB183BB4FE0C00711B9FDB8AEE7AA7867764517A146002A0C7A86ADCA6C5700213FE9862A97D7B6F44DB15B7697CD7F21497C96470E2C527101C';
wwv_flow_imp.g_varchar2_table(120) := '3FAD78C36BFEF23FC3D6B2A93C15E25D341148CC9CC707FFDF5F289655D335841DB73F04B35DCE87E4F9577E85F9D1338AED6BF3D8D1EAE11A009A74261D17C20440C7C1D5AA696220A0D81550E9681B1A46DF8D0F026639A71C9D7BE7792C9CFA50B17D';
wwv_flow_imp.g_varchar2_table(121) := '3B1FF957A8DB7B8F569C2CA70C022B1F1DC0B127FF46F14E2D3BAF47FFD5B765970796ED10AFFD4F1EF8310233CAEB5774D7730D00D9E25A89FA3201A884BA64F78CA73238351B52AC755D6B27066E7908366FA3642DBB5CDDA9E3BFC7D8FB2F28D6BDF7';
wwv_flow_imp.g_varchar2_table(122) := 'EAFDE8FED25F49D936A3567AECC9FF0B631FBDA6D8FCBE9B1E44DB96DD52F2A493091CFDF50F115D9E5BB7FE6200604FBD13623B601E14C825C00480FD23AF40329DC1C9D990E28023BBCB85ED5FF81A9CCDDD79CBAAC61356C7CFE2E40BBF50AC5A6D73';
wwv_flow_imp.g_varchar2_table(123) := '3BF6FCD5DF5563D55927058143FFE13B082DADFF8014970C3FF01DD4B67649E9175F9EC1B1E77F89446875DDFA8B07BF7803E0B0CAF77643CA80485C6926001207AF5C554F678091F930C49440A563DB1D8FA0AE6F5BB9AAA4E97DA20B9338FCCC0F7396';
wwv_flow_imp.g_varchar2_table(124) := '79FDBFFD05CC2E8FA6F76561A511480797F1EE5F7F2B67E1577EE32F6177D796A602252E3578F1384EBEFE3B883701EB1D752E2BFA1AE41CDB50623A16FF39012600EC127905C43747B118D0B2C2AE80A280EE9D57A3F39ABBF396558D27A482CB38F4CC';
wwv_flow_imp.g_varchar2_table(125) := '8F908C2A7FE6B8F2BBFF16EE4139178DA946F352D62974FA5D1CFAF15F2BDEC26277E2AA6FFE15C46E96B21DE2CFE2DC87CF63F4A8F29895965A1BDABD0ED99AC6FA564080094005D065BCA59809207606549A779CDD13E0BE6FCBD8346492719C7DED69';
wwv_flow_imp.g_varchar2_table(126) := '2C5D1A51AC7FDF7577A3EBC17F2D65FB8C56E9F1A7FF1F5CFAFD2B8ACDF675F660E81E39FB6A3A9DC1C86FFE2BFC0BCA9F377A1B9CA877C9B93787D1FA6AA5DBCB04A0D21190E4FEE2F5FFC8425871E531A7D787E17BBF016B6D83242DFAC36A2E9EF908';
wwv_flow_imp.g_varchar2_table(127) := '67DF7A4EB1EE568713D7FC2F3F87C9C65F56D51CE04C2286F7FFB7AF219550DEC27AF0DAFD68DC715D353743B16E895814871EFBBF91565A021080D803C069E3F77F29035CE64A33012833B8CCB73B351752DC13C062B363EB2DF7C3D3B743CA2626C301';
wwv_flow_imp.g_varchar2_table(128) := '7CFC8BFF884C8EFFB0EEFAFA5FC1BB6BBF94ED334AA5570EBE80638FFF47E5D7FF0E37F63CFC1DD83C3E294902531770E2D9C714EB2E66000C36B961359BA46C1F2B5D5E012600E5F596FA6E63FEDCE300BA86AF46D7B5728E03108139FEDB7F4070765C';
wwv_flow_imp.g_varchar2_table(129) := '3146CD9B7760CBF7FE4FA963A8F7CA9FFADBBFC2E245E50572EAFBB661EB1D8FC8C990C960F2D09B183FA8BC7955835801B0CEC9852BE58C70D96BCD04A0ECE4F2DE703E18C7D4EAFA4BAB8A56D536B660C7C37F26ED7F7C16468EE0FC5BBF4326A33CDB';
wwv_flow_imp.g_varchar2_table(130) := 'E1BAFFF1BFC1E2EB9037883AAE7972690AEFFF87EF2BB6D0643663E0D687D0D83F2CA5422611C7C84BFF88E529E505807A1A9C68E0F77F29E35B894A3301A884BAA4F70CC452101B03A5C4BCC0750EB3D98CBDDFFC4B581C6E295B98884670F8C9BF452A';
wwv_flow_imp.g_varchar2_table(131) := '1250ACFFD01D5F41CBFE3F95B27D7AAFF4CC8B7F8F73AF3DA5D84C477D0BB6DFF555383C728E5389079671ECA91F2091587F674E9309D8DA5203BB85AFFFF5DED7B56A1F1300AD240D504E2295C92600B9B606DEF5C0B7E16EED915663E4CD03581A39A8';
wwv_flow_imp.g_varchar2_table(132) := '587FA7A71E57FD4F3FE3E640D516E1740A1FFCF5A34884C3CA9F70765E8FCDD7C83B866365FC2C4EBFF80BC59938368B09DB5BB90570B575CD6AAE0F13806A8E4E15D66D622586C590C2086B009BAFB91DCDC3D74BFB80F48F9FC5C82B4F219D54FED471';
wwv_flow_imp.g_varchar2_table(133) := 'E577FF1DDC83FBAA303AC6AD52F8CC7B38F80FFF7B4E801D0F7E179E964E6991263E7E1D1387DE52ACBFD769C1261FB7009636C015A83813800AA0CB7CCBE5481263CB51C526F83A7A3170E7A330DBE4DC892C9D88E3C40BBF4068E692CC6162DD3F27E0';
wwv_flow_imp.g_varchar2_table(134) := '6AEAC0CE07BE0DB345CEF9F1997814275F791281C90BEBC656BCFEEFF03AD0546363EC29A05A8009806A2A9E2804F26D0C64B698B0FB917F058747CE7DD6451BA78EBC83B10F5F65C07524D077DD5D68DB21EF5B9BE8FC388EBFF8049291E0BA5111AFFF';
wwv_flow_imp.g_varchar2_table(135) := 'C5F2BF6E6E00A4A35E5BFAA6300128BDB1AEEEA0665F80811BEF41D3D6ABA46D776C6511879FF82F39670348DB380356DC6C7360CF57FF7BD85DF27E1F9F3FF226CE7FF88662F46A1D166C6EE4EB7F0376EF0D359909C086F88C79F14C208ED980F237F2';
wwv_flow_imp.g_varchar2_table(136) := '86AE7E0CEDFF324C36493724C96470EE8DA7B170EE843103ACB356376EDA86C1FD92CEFD072096FF3DF3EC8FB03233A91899368F1DAD1E393FBBE9ACBB49D51C26005285AB3A2A2B96053E331F561C8D6CB13BB0E3CEAFC0DDBEA93A2A5C442D222B8B38';
wwv_flow_imp.g_varchar2_table(137) := 'CAB70045C855D725624AEAF0BDDF84ABB1ADBA2A56406DC273133876E0A7C8A492EB5E25BEFF8BE57FB9FD6F01A83C352BC004801DA12801B13D7024A1BC604ED7AE7DE8DA7757516557CB45A3EF3D8FD913CABBAE554B3D590F6581F62B6F41EF95374B';
wwv_flow_imp.g_varchar2_table(138) := '4D34F1DEB39838F171CED7FF62F43F57FF953ACC15A93C13808AB0CB7FD37C9F015C0D2DD8F5C5EF43ACBE26EB110F0570F2857F44746956D62618BADE8E8656ECB8FB51D86BBCD23AA4E2311C7FEA3F2312545EDFA0ABDE81463747FF4B1BE40A569C09';
wwv_flow_imp.g_varchar2_table(139) := '4005F165BE75389EC2E87214C9D4FAAB029ACC16ECBCF71B70B7F5C9DC4C4C9F3E8CB1770E7040A08451DC74FB57D0DABF55C29AFF539583339770E2C04F143FB78933C5E23F6216000F0A142AC004A050319E9F1510B3012E2D47B01A5D7F5952714ED7';
wwv_flow_imp.g_varchar2_table(140) := 'B6DDE8BCFE4169F706106D48261238FDEA53088E8FE48C7C5B5B1B3A3AB8474039FE784C4D4D61666626E7ADDCEDFDD871CF376091F9BD78268D8BEFBF88991C9FA16AEC160C3471F47F39FA9D1EEFC104408F512D539B96C2098CFB638A77B3391CD8FD';
wwv_flow_imp.g_varchar2_table(141) := 'D5BF80D521E96C804F5AE65F9CC7995FFF3764D2CAC98E3875606033BCDEBA32E91BF336FE95155C387F3E67E3C5C0BFC1BBBF85FAE656A99192413F8E1EF819C41E00EB1D5CFC47EAF05645E59900544518E4AC44329DC1C9D950CED793C3F77C1DB59D';
wwv_flow_imp.g_varchar2_table(142) := '037236F0935A6732C0B9779EC3E2E98F72B6C36CB562DB962D70381C52B7B75A2B1F8BC570EACC19A493EB8F865FAB77D3B6ABB1F9FABBA57EF324DAE23F7B08A7DFF89D6238C4A8FF4D3E2747FF576B8795A05E4C00240852B556513C182FE6F90CD0D4';
wwv_flow_imp.g_varchar2_table(143) := 'B7059B6FFB224C16B9072965770AFCD57F82189495EB70D6D460CBD0102CE2E7190FCD0452990CCE8C8C201A0AE52CD35EDF829DF77D0B368917FD110D146F9BCE3EFF332CE5D8FAD7E7B6A2BB5EEEB76B9A7510165494001380A2D878D19AC04A34898B';
wwv_flow_imp.g_varchar2_table(144) := '4BCA7B03982D96EC48EC9AF67EE9D1664F1FC4E8DB07F2B6A3BEC187FE4D720F7ECCDBC8329F7061F422FCCB4B79EF3A78E7D7D0D83B94F7BC6A3F2130791EA75E7A22E7A654BD0D4ED4BBE4DCDBA0DAFD8D523F260046897489DA994A677022CF678096';
wwv_flow_imp.g_varchar2_table(145) := '8161F4DFFAC512D5A07CC56652299C7DE7392C8D1CCA7BD396D6567475CABBF35CDE0696F18489C949CCCDE69F8AE91BDC83C19BEE937AEA69F6D77F0638FBC24FB134715151D96E3561A0D1CDD1FF65EC877ABC1513003D46B5CC6DCAB745B0C5EEC4AE';
wwv_flow_imp.g_varchar2_table(146) := 'BBBF0A474B6F996BA6FDEDE2C1559C7AE50944E69597655DBB6B6B7B073ADBE55D814E7BBDC24B9C989EC6DCF474DE0B9D0D2D18BEFFDBD20F38150D0D2DCEE2C4AFFF0EE9B4F2425B5CFA376F97E0092A049800A840E229B905C48A801796228A6B0288';
wwv_flow_imp.g_varchar2_table(147) := 'ABDB07B6A1E79647A41F9825DA120EACE2E46FFE5E7167B6CF6AB57674A2B34DEED1E895EAFF13D333989B9ECA7B7BABDB83EDF7FD09DC75BEBCE7CA70C2F9D79FC6FCB9E38A5515C34BB6B570EEBF0CB1ACF63A3201A8F6084952BF717F144B61E5D1D9';
wwv_flow_imp.g_varchar2_table(148) := '6284FCEE2FFD4B38BC0D92B428773597A62EE2C2EBCF20190EE46D4F5B47273A9804E475FAEC095333B39899CAFF96C5EA7463F3FEAFA0A1BDA7A0F2ABF5E4B87F0E079FFCAF97BF03281C752E6B76EB5F1E14D8A80013808D0AF2FAAC403491C6C882F2';
wwv_flow_imp.g_varchar2_table(149) := '0641E29C8E1D7BD173DDBDBA1013FF7D9E3E7B1413EF3D8F7422F7CC00D1E0D6B6367472A12055B19F9C9AC26C9E857EB205994CE8BBEDAB68DD34A48B374B994C06931FBE8C89A3EF2B3A89858DC4D43FB100100F0A6C548009C0460579FDA7029796A3';
wwv_flow_imp.g_varchar2_table(150) := 'F04794DF02586C36ECF9CABF86CD2DEFBEEC9F0D773A93C1F8F10F31FDC10BAA7A41637333BABBBAB9698B8296585D726C7C0C4B0B0BF93D4D26745C771FBAB6ED815927532E230BD33876E0274827726CB5EDB6A28753FFF2F70F9EA14A8009802A269E';
wwv_flow_imp.g_varchar2_table(151) := 'A446408C0510BB04E63A7AF7DE84F62B6E55539C14E7885910173F7E13F347DE54555FB7C78BFEBE5ED86D72AF8BA0AAB1059C144F2470FEE2454402F93FA988629B77DF84BEBDB7C8BDD4EFE77CC6DF7B0E932794179B1279CE40A30B6EFEFA2FA067F1';
wwv_flow_imp.g_varchar2_table(152) := 'D45C024C00D83F3415B8B0184120A6BC64AEBDB60E3BEFFD266CDE464DEF5BC9C2441270F6F5A7E1BF704255352C363B36F5F5C0EB9177973A550D5579D26A6015A317C790CAF1CBF7B345356DDF874DFBEE80C5AA9FD7E051FF3C4E3CFB1324C2CA09B4';
wwv_flow_imp.g_varchar2_table(153) := '98F32F7EFDEBE48587CADEC1D34A29C004A094BA062C5B7C0218F347732E0FDCBDEB5A745C7DA7AEFE43968CC731F2FAD3581DCBBD69D067BB447B473BDA5ADB75E5504897CF8EA39899C68C8A697E6BE5D6F76EC1E02D0FC162D7D772CB23CF3F86A589';
wwv_flow_imp.g_varchar2_table(154) := '0B8A7CE2A13FD8E486CB26EFF6DA85F40D9E5B1E012600E57136CC5DC477DCD1A5088239DE0288D50177DDF37538DB36E9CA45FC823DFDDC4F1198CB3F756DADE1351E0F7ABABAE072196B47B7702482F189098454BEF2175E9E964E6CBDFB9BBA7BF807';
wwv_flow_imp.g_varchar2_table(155) := 'A72FE2F8819FE6FCB3C05DFF74F59F8AAA690C1380AA09857E2A926F7960D1D2FAD64E6CB9EF4FA55FB5EDF351131BD55C7CF759CC8D1C2928A04DAD623BE1765875FE7E576C2035393D8DC5D9DCDBF97E1EAF656837FAAEBB0B669BBE7EF98BA4F1CCF3';
wwv_flow_imp.g_varchar2_table(156) := '3FC5EAAC72D228BA8458F3BF81CBFE16F4678A27E717600290DF8867142820DE0288B100A178EEED73876EFF227CFDC305965EFDA78BE95C5347DEC6E491F7544D115C6B9178ADDDD9D18EC6069FEE3E0B88D7FD0B4B4B989A9ECEBBA1D267236CB6DAD1';
wwv_flow_imp.g_varchar2_table(157) := 'BDEF76B46DB912268B7EBEF9AFB571E1F44738F7F673393BB5D769C1269FB1DE1055FF9F727DD49009803EE25875AD100FFF730B919CF5B2B96BB1FBA17F0E6B8D3E07C3F9C7CFE1FCBBCF23A1B09FBB128ECBE3417B5B1BEA3D9EAA8B6B3115F2070298';
wwv_flow_imp.g_varchar2_table(158) := '9E9E4124A86E84FFDA3DC40A7F03373F80FAAECDC5DCB6EAAF89F91770E285C7100FAC2AD655FCFAEFF7B950EBD05FF253F50132400599001820C8956AE2C5E5285672AC0B20EAD5BDF36A74EC937FEF7625E348380CB1B46B704A798097622250EB455B';
wwv_flow_imp.g_varchar2_table(159) := '6B2BEABC1EE9D60E106F81FCABAB989D9D4324A8FC80536ABBA76B00FD37DE0757AD3E9343D1EE0B6F3C83B9B3C772FEF16CAEB5A1DDE3D0DD1BA14AFD3789F7FD43012600EC11251310EB028801818994F2B2A666870BC3777D0DEE96EE92D5A3D205A7';
wwv_flow_imp.g_varchar2_table(160) := '92098C1D7A07B347DE2AAA2A36B71BAD4DCDF0F97CB09A4D459551AE8BC437FEC5A525CC2DCCE79CD2A6541FB3D586965D37A26B781FAC767BB9AA5DF6FB84E626B203FF32A91C0B67994DD8DAE2AEFA98971D8F37D44C80098066942C683D81B9601CD3';
wwv_flow_imp.g_varchar2_table(161) := 'ABCA2B9B896B7C3D9B3178E7D761D2F10038312E60E1FC098CBEF36C41E3023E6B2AF653F0D637A0BEC1076F4DF53C18C4437F3514867F7909ABFE65888190C51CE2957FFF0DF7A0A1472CED5BDD894E31ED5BBB269D4CE0E4811F2338AFBCCBA1687E87';
wwv_flow_imp.g_varchar2_table(162) := 'D781A61A2E18B5116B5E9B5B8009007B484905C4223962A7C0705C796B5351812DFBBF8C864DDB4B5A976A283CBAB28891D79E4278A1B051F09FAFBBD862D9E3AD437DBD179EDA5AD8CAFC662091CE20100C62D9BF82E0EA2A52F1E88678DD4DEDD87ADB';
wwv_flow_imp.g_varchar2_table(163) := 'C3B0D7356DA81C192E1633442EBCF99B9C5515DFFCC5C0BF328755063ED651430126001A62B2A8F505C26240E06224E7E240E235F7AE87BE0F9B4E07047E5646FC025C1E3D818B1FBF8D447079C3DDC664B1A2A6A606624D0197CB0DB7CB05BBD5A2D9C3';
wwv_flow_imp.g_varchar2_table(164) := '437CCF8F27531073F723E11082C120C2A150CED7D76A1BE5686845CFF05EF806F6E87294FFE71DA2AB7E9C7AFE6788AD2AC75DFCFA17BBFD799D56B58C3C8F0245093001288A8D17152A20C602AC46734F0B6C1AD885FE1BEF8759474BBCE6724A464298';
wwv_flow_imp.g_varchar2_table(165) := '3EFE2EE62F8C201E582A9454F97C9309169B034EA7136E97130EBB1D569B0D56AB15168B35BB84AEC562C9BE35100FF754265C2F445B000019374944415483542A85543285542A89643289642281583C8E70248A68348A94D8F130C716B585565E2C05DD';
wwv_flow_imp.g_varchar2_table(166) := 'BEFD2AB40CEE82D5618CAD6DC567A073AF3D85C50B27737235D6D8D055A7AFF50E0AED1F3CBF3C024C00CAE36CF8BB880181E71723109F04721D7DD7DF83B6ED5719CA2B16F063FACC61CC9DFA08E958EEA993B2C3589D3568DA7615DAB7EC8143C723FC';
wwv_flow_imp.g_varchar2_table(167) := 'D78BD3E4E13731FEF19B391329B1DD2F07FEC9DECBE5A93F13007962257D4DE783714CE5191028B60CDE7AE757E1E9E897BEBD853620168D62FAF8FB983BF141CE2D610B2DB71ACE1763165A86AF41EBF67DD93713463B82F35338F19B1F2193C93D16A6';
wwv_flow_imp.g_varchar2_table(168) := 'DD6B474BAD7E673F182DEED5DE5E2600D51E211DD54FCD3E01A2B90E4F3D763EF85D585D353A6ABDFAA6448301CC9EFE180B678F20112A7C0EBDFA3B95FE4C5B4D1D9A8676A36DC73E389CC65CCD2E1A58C1E9177F8EE8F2424E70B7DD8C814637E7FC97';
wwv_flow_imp.g_varchar2_table(169) := 'BE5BF20E9F083001605728AB403C95C1C87C38EFA78096C19DD874E303861818B66E003219445616B170FE1816C72E2011F423158F68FA1DBE14813799CC30DB9DB0D578D0B479279A376D85C3DB508A5B4951A698E77FF6EDDF6129CF823FE2D5FF40A3';
wwv_flow_imp.g_varchar2_table(170) := '0B4EEEF627455CF5524926007A89A444ED58082530B51ACB3BA66CF09607D038B847A29695A6AA62DC44786E3CBB5DAC7FF202C412B2E964BCAA9201B166BFC3D78686EE7E34740FA2C6D70AB3C1E7B0893193E273CEE8FB2FE6ED187D3E27EA38EA3FAF';
wwv_flow_imp.g_varchar2_table(171) := '134FD056800980B69E2C4DA5C0983F8AE570EE0563AC2E37B67EE151D43677AA2C55FFA78964201A8B21383F83E5B133084D8C64DF0E54E270D435C3DDD18FBAAE01785A3AE07438207EC9F2B82C109819C3C9E71ECB3B5DB2DE65456F83F1C645B09F54';
wwv_flow_imp.g_varchar2_table(172) := '5E800940E56360C81A88D5E3C48E81627640AEC3D9D88AE1FBFF14561B07467DDE29934E23118F22165C4568690ED1E02A62E11092912092D130D2F13092E1005245CE2CB0BABDB0385CB038DCB038DDB0BA6AE110EB0CD4FBE0AA6B84A3C60B9BC3A9EB';
wwv_flow_imp.g_varchar2_table(173) := '55FB8AFDC399080771E2B73F84F8FE9FEB10DFFDC5663F4C9C8A95E6751B116002B0113D5EBB218158328D918530D2B973003476F563F39D8FC2ACC3ED603704B8CEC56931A73F0D24A221C445421009211A0A21115EFDA7C42016CE6EC99B49A7207EAF';
wwv_flow_imp.g_varchar2_table(174) := '8B8584CC76C7671EF41ED8DD1E38DC35B0BBDC70D637C16AB5C16A061FF62A0296492670E1BD17317FE660CEB3C5435F2CF8C39DFE54A0F2949208300128092B0B552BA0763C40F7EEEBD0B1773F4C7CC5AC96F68FCE130BD1AC2DC3205663106F102092';
wwv_flow_imp.g_varchar2_table(175) := '00ABED722220FE32F1215F34B030CD643071E82D4C1E7C236F315DF50E34BAB9D67F5E289E503201260025A365C16A05C6FD512CE5190F209E4C3D7B6F45C79E1BD516CBF32850560131E86FF2D01B983CFCF6E5E42AC7D1E0B6A2A79EDFFDCB1A20DEEC';
wwv_flow_imp.g_varchar2_table(176) := '8F049800B053545C404C0DBCB8947F3C80D82A76D3BEDBD0B4ED1ACE95AE78D45881CF0BCC9D39840BEF3C977DAB92EBA8B18B8D7E9CFCEECF2E5471012600150F012B2004D46C1824CE1349C0D6FD5F86B77B907014A81A01FFC55338F3EAD3D97115B9';
wwv_flow_imp.g_varchar2_table(177) := '0EABE5F2777F9104F0A040A5059800543A02BCFFA702CB9124C696F36F2B2B960BDE76D7D751DBD64B3D0A545C6075E21C4EBDF40432A944CEBA88F115628B5F8F830FFF8A078D15C80A30016047A82A01312870722596B74E768F175B6E7E1035ED9BF2';
wwv_flow_imp.g_varchar2_table(178) := '9ECB1328502A81D599718CBCF238C4CE8EB90EF1F0EFF03AD054C3417FA58A05CB2D5C800940E166BCA2C402B381386602F1BC7771363461DB6D5FCCAE40C78302E51688FAE771E2B9C7900805F2DEBAD563479B876B59E485E2096515600250566EDE4C';
wwv_flow_imp.g_varchar2_table(179) := 'ADC0C44A0C8BA1DCAF544559CEBA466CBFEB51D8BD3EB545F33C0A6C58402CBE74FCB73F52B5591347FC6F989B059448800940896059ECC604C494AA891515D30301D8DDB5D87AFB97E0E698808DA1F36A5502AB531771EE8DA7110F05F39E2FBEF7F7F9';
wwv_flow_imp.g_varchar2_table(180) := '5CE0F21579A978420504980054009DB7542720960B166B04AC46738FAC16A559DD1E6CB9FE0BF0F46D575738CFA2401102AB63231879EB3748462279AF162BFC89657EC5F77F1E14A846012600D51815D6E95301B1F9CDD98508C4B2C1F90EABC389811B';
wwv_flow_imp.g_varchar2_table(181) := 'EF41FDA6E17CA7F2DF53A030814C064BE78FE3DCDB07904EE6FF34E5B299D1DFE882953FFD0B73E6D96515600250566EDEAC1801F1F0BFB41CCDBB7190283B3BD5EABA2FA0998B051543CD6BD611109FA3668FBF874BBF7F15994CFE44D4663161B0C90D';
wwv_flow_imp.g_varchar2_table(182) := 'F1771E14A866012600D51C1DD6ED5381503C85717F4CD59B009105F4EEBE166D5772EF0076A18D0988257D273E7A1953C73FCCBBBCAFB89378E86F6E74C121764EE241812A17600250E50162F5FE4940BC09B8B014413C29B6B2C973984C681BDA89DEEB';
wwv_flow_imp.g_varchar2_table(183) := 'EF8789BB08E6D3E2BF5F47201D8F62ECA3D73073EA63B1CB4F5E233EFCF312F1842A1360025065016175720B887D0326FC510462F907068A929AFAB7A1EF86FB21C607F0A0805A814438888B1FBC84C5F3C7555D2296F6ED6D70F2B5BF2A2D9E542D024C';
wwv_flow_imp.g_varchar2_table(184) := '00AA2512AC876A0191044CAEA89B1D200AADF135A1FFE68751D3D4AEFA1E3CD19802E2877E78710AE75E7F0611FFA22A0431DA5FACEF6FE1803F555E3CA97A049800544F2C58930204C4BEF663FE285622495557599D6EF45E79239AB75E0598B916BB2A';
wwv_flow_imp.g_varchar2_table(185) := '34839D944925317FE6635CFCFD6BAA46FA0B1EB1C84F779D9353FD0CD657F4D25C26007A89A441DB31B51AC37C30FFB42CC1633299D13AB8131D57DC04BBA7C1A0626CF67A0289801FE387DEC0DCC851554062B68958D7BFDDE3E0C35F95184FAA460126';
wwv_flow_imp.g_varchar2_table(186) := '00D51815D649B58078653B1F8A637A35FFDE016B85D6D63762F34DF7C3D5DAA3FA3E3C51BF02E1D94B38F7E66F115E5956D548F1F06FA9E5DAFEAAB07852550B3001A8EAF0B0726A05D4EE22B8569ED96CC6E62BAF47E3CE1B010B776853EBACABF33269';
wwv_flow_imp.g_varchar2_table(187) := 'CC1E7C15A387DE53DD2CEEEAA79A8A274A20C004408220B18AEA0456A2C9EC56C28954FE295B6B2536F50CA077EF4DB03576A9BB09CFD28540DC3F8F898F5EC1DCC5B3AADB63B79AD055E78458DF9F0705F420C004400F51641B3E158824D2D924402C1C';
wwv_flow_imp.g_varchar2_table(188) := 'A4F6A8F178D0BFF746D46CBE1230710117B56E329E974EC4B13A7A0CE387DF4568D5AFBA09E2A1DFE175C06963FF508DC613AB5E800940D58788152C5440CC10103B092E87D5CD10582BBFB9A5155DD77C018ED6BE426FC9F3251088CF5DC4A5F75FC0E2';
wwv_flow_imp.g_varchar2_table(189) := 'DC5C41B51523FDC52F7FCEF22B888D274B20C004408220B18A850B88C1814B9144F66D808A45DC3EBD81D96241D7E62D68D9732BACDEC6C26FCC2BAA4E20B9328799A3EF62FAFC49A492EADF0C8979FDED5E3B1ADD1C23527541658534116002A009230B';
wwv_flow_imp.g_varchar2_table(190) := 'A95681B0D8436025866822FF262E9F6D83A7AE0E5D7B6E82B7772B4C7657B5368FF5CA21904926B07AE1082E1D7A07E1C06A4156622DFFCE3A07BFF717A4C69365136002205BC458DF820592E90CC6FDEA570EFCEC0D5ABAFBD0B5F756D89BBA0BBE2F2F';
wwv_flow_imp.g_varchar2_table(191) := 'A89C406C6102131FBE82F9C9B1822BE1755AB2AFFCB99B5FC174BC403201260092058CD52D4E606DBD809940BCA04F02E26E6633D03D348CE6DD37C3EAE16781E222509EAB92AB0B9839F40626CF9D2C38CE628A5F9BC78EE61A3B17F7294FB878970A0B';
wwv_flow_imp.g_varchar2_table(192) := '3001A8700078FBF20A2C4792980DC4D56D2BFCB9AAB96BBDE8DCBA0BF59B77C152EB134B0B96B7F2BC9BA240C23F87C0E8514C8E1C47281028588A53FC0A26E3053A106002A08320B209850988CD84A65763F0ABDC47E0F3A5D7F91AD1D2BF15F5FDBB60';
wwv_flow_imp.g_varchar2_table(193) := '116F049808141600ADCECE64905899877FF40426478E225AE077FEB56AD4B9ACE8F43AF8CA5FABB8B01C6904980048132A56546B01B15680781BA0766BE1CFDFDF66B3A07D6018CD3BAE85ADBE45EBEAB13C05814C2683F0D23CE68EBF8BB9F3C79111F3';
wwv_flow_imp.g_varchar2_table(194) := '3E8B38C42E7EE295BFD8CA9707058C28C004C08851679B3F1510CF8E602C89C9D518E2C9E21E24568B092D3D9BD1BC752F9CED03308941033C34174826E2084D9DC7F4C98FB13A7309E95461333BD62A2406F735D7D8E073DBB885AFE651628132093001';
wwv_flow_imp.g_varchar2_table(195) := '90295AAC6BC904C44C01B16640B19F0544C52C361B5A3BBAD13CB41B8EC60E98DDF5974710F2285A20934E23115A817FF20266CF1C4678690E62DBDE620EF1A5A6DE65456BAD1D629A1F0F0A185D800980D17B00DBFF0702E2B3809829108CA95F30663D';
wwv_flow_imp.g_varchar2_table(196) := '4287CB85D6CD3BD0D0B71DCEE64E982C564A172090884511989DC4E2D8085627CF231150B7539FD22DC4EBFE768F1D6EBEEE2F200A3C55EF024C00F41E61B6AF6001F15960299C80D86130962CEE35F3DA4DC50B008FC78BA64D5BE0EDDB097B63074C1C';
wwv_flow_imp.g_varchar2_table(197) := '34F8473111D33453E93442731358BE700C0B174F211989141CBBCF5FE0B299B3AFFA1B5C56BEEEDFB0260BD09B001300BD4594EDD14C407C16580E27301F4A14B4C3A05205C432C30D0D0D68ECDB0A6FF700AC0D1D80D9D803D0D28918228BD358BC7806';
wwv_flow_imp.g_varchar2_table(198) := '4B13A38805968B7EC5FF597731ADAFC96D43638D9D6BF86BF6278205E94D800980DE22CAF6682E207E9D8AAD86E7437184E31B7B23B056398BD385BA962ED4776D424D63075CDE7A986C0E982C36FD4E2BCC642096E74DC463880457B03A3B8195897388';
wwv_flow_imp.g_varchar2_table(199) := '2CCE2015DBF8AF7D612B46F437D5D850E7B47276A6E67F1258A0DE049800E82DA26C4FC90452E94C3611580A27114EA40A5E694EF1CD8019B03BDDF0B4F6A0AEAD0BEEA64ED8BC4DB03A5DD27F2E48A7D348C62288AF2C60756E12ABD39710981B472A16';
wwv_flow_imp.g_varchar2_table(200) := 'D32C4EE28B4AADDD927DD52FB6ED159BF8F0A00005F20B3001C86FC43328F007026B898018231029709321B594769B15B5DE3AD435B5A2B6B903765F3BAC75AD2253A8DAA440CCCFCF448348FA6711F3CF21383F8595F919ACAEAC4024025A1FE2C12F7E';
wwv_flow_imp.g_varchar2_table(201) := 'F18BDDFAC4E87E1E14A04061024C000AF3E2D914F854407C1A10B306C4A781D5E8C6660DE4623599CCB0389CB03A9C70389C70D6D4C259E381C3EB83A3D60B9BCB03ABB3062687ABF43B17A6D34887FD4845434844428885828805FD08FB17108F84118D';
wwv_flow_imp.g_varchar2_table(202) := '84908846914EC621A6F095E2100F7EF14BBFDDE380D3C6E97CA5306699C6106002608C38B395251410B306A28914566329AC46938826D39A7D1EC8556D31C3C004132C16135C75CD70D437C1EEF1C15EE381C56A87C5668749FCDDEE80C56A05CC5698CC';
wwv_flow_imp.g_varchar2_table(203) := '1698CDE2AA7F7A4D2E6625A43319A4D329209584580E29954C641FF2E29B7D321E472A11CD3EF0E38165C4822B8887FC8887C3D9EB442254EA433CF49D5633BC4E2BEA9DD6EC3C7E4EA628B53ACBD7BB001300BD4798ED2BAB809839209616F64712D9BF';
wwv_flow_imp.g_varchar2_table(204) := '97E3E1584803C5DB04B3D502B3C59A4D0AB2D3EF9271A493C9CBAFE9ABACC2629545F17D5FBCE217AFFBADFCBE5F48B8792E05720A30016007A1408904D696195E8A24118889076C896EA4B362C59B0D318ABFC165CB3EF4F9CCD75980D99CAA11600250';
wwv_flow_imp.g_varchar2_table(205) := '35A16045F42A207E5427D299EC9E03E1441AD1441AB1541AC95419DE9D4B802A46ED8BD7FBE27BBE78E0BB6D66D82D7CC52F41E85845C9059800481E40565F3E01F199402401622AA1184428920231B3A0CADEBE970C567CBB170F7DF1A0BFFCC0B7641F';
wwv_flow_imp.g_varchar2_table(206) := 'FE7CBD5F3272164C8175059800B06350A0C202E2C11F4FA5118CA7B2E3064452A0B7B703E25BBE18B92FBEE78B873E7FE157B8D3F1F61400C00480DD80025524209201F18640BC111009819851104FA6B39F1012A94CD946DD174B221EF4E297BCDD22FE';
wwv_flow_imp.g_varchar2_table(207) := 'BAFC5A5FFCC2175BF05A4C268EDC2F1696D751A004024C004A80CA2229A0B580D894482403220910FF2CDE18887F1689C1E7A7E295EA53C267A7DD897F165309C5837DED612FA6E65DFEDFE6EC377D4ED3D3BA17B03C0A682BC004405B4F964681B20AAC';
wwv_flow_imp.g_varchar2_table(208) := 'BD311009C15A829048A521C6176657E6CB00623642062251B83CCB2F9B30E0F23F5F7E905FFEBB59FC42C7E5BF8B91F7D97FF7C93F8BFF9FC504D8C5603DEBE5417AE2973E1FF2650D376F46014D05980068CAC9C228505901F150BFFC70BFFC9017C7DA';
wwv_flow_imp.g_varchar2_table(209) := '1B81CFCE3910FFFEB3C7DA16C56BCB03AD2506E29CCF6E5FCC2979958D2FEF4E012D05980068A9C9B22840010A50800292083001902450AC26052840010A50404B0126005A6AB22C0A50800214A08024024C00240914AB49010A50800214D05280098096';
wwv_flow_imp.g_varchar2_table(210) := '9A2C8B0214A000052820890013004902C56A52800214A00005B4146002A0A526CBA200052840010A4822C004409240B19A14A000052840012D05980068A9C9B22840010A50800292083001902450AC26052840010A50404B0126005A6AB22C0A50800214';
wwv_flow_imp.g_varchar2_table(211) := 'A08024024C00240914AB49010A50800214D052800980969A2C8B0214A000052820890013004902C56A52800214A00005B4146002A0A526CBA200052840010A4822C004409240B19A14A000052840012D05980068A9C9B22840010A508002920830019024';
wwv_flow_imp.g_varchar2_table(212) := '50AC26052840010A50404B0126005A6AB22C0A50800214A08024024C00240914AB49010A50800214D052800980969A2C8B0214A000052820890013004902C56A52800214A00005B4146002A0A526CBA200052840010A4822C004409240B19A14A0000528';
wwv_flow_imp.g_varchar2_table(213) := '40012D05980068A9C9B22840010A50800292083001902450AC26052840010A50404B0126005A6AB22C0A50800214A08024024C00240914AB49010A50800214D052800980969A2C8B0214A000052820890013004902C56A52800214A00005B4146002A0A5';
wwv_flow_imp.g_varchar2_table(214) := '26CBA200052840010A4822C004409240B19A14A000052840012D05980068A9C9B22840010A50800292083001902450AC26052840010A50404B0126005A6AB22C0A50800214A08024024C00240914AB49010A50800214D052800980969A2C8B0214A00005';
wwv_flow_imp.g_varchar2_table(215) := '2820890013004902C56A52800214A00005B4146002A0A526CBA200052840010A4822C004409240B19A14A000052840012D05980068A9C9B22840010A50800292083001902450AC26052840010A50404B0126005A6AB22C0A50800214A08024024C002409';
wwv_flow_imp.g_varchar2_table(216) := '14AB49010A50800214D052800980969A2C8B0214A000052820890013004902C56A52800214A00005B4146002A0A526CBA200052840010A4822C004409240B19A14A000052840012D05980068A9C9B22840010A50800292083001902450AC26052840010A';
wwv_flow_imp.g_varchar2_table(217) := '50404B0126005A6AB22C0A50800214A08024024C00240914AB49010A50800214D052800980969A2C8B0214A000052820890013004902C56A52800214A00005B4146002A0A526CBA200052840010A4822C004409240B19A14A000052840012D05980068A9';
wwv_flow_imp.g_varchar2_table(218) := 'C9B22840010A50800292083001902450AC26052840010A50404B0126005A6AB22C0A50800214A08024024C00240914AB49010A50800214D052800980969A2C8B0214A000052820890013004902C56A52800214A00005B4146002A0A526CBA20005284001';
wwv_flow_imp.g_varchar2_table(219) := '0A4822C004409240B19A14A000052840012D05980068A9C9B22840010A50800292083001902450AC26052840010A50404B0126005A6AB22C0A50800214A08024024C00240914AB49010A50800214D052800980969A2C8B0214A000052820890013004902';
wwv_flow_imp.g_varchar2_table(220) := 'C56A52800214A00005B4146002A0A526CBA200052840010A4822C004409240B19A14A000052840012D05980068A9C9B22840010A50800292083001902450AC26052840010A50404B0126005A6AB22C0A50800214A08024024C00240914AB49010A508002';
wwv_flow_imp.g_varchar2_table(221) := '14D052800980969A2C8B0214A000052820890013004902C56A52800214A00005B4146002A0A526CBA200052840010A4822C004409240B19A14A000052840012D05980068A9C9B22840010A50800292083001902450AC26052840010A50404B0126005A6A';
wwv_flow_imp.g_varchar2_table(222) := 'B22C0A50800214A08024024C00240914AB49010A50800214D052800980969A2C8B0214A000052820890013004902C56A52800214A00005B4146002A0A526CBA200052840010A4822C004409240B19A14A000052840012D05980068A9C9B22840010A5080';
wwv_flow_imp.g_varchar2_table(223) := '0292083001902450AC26052840010A50404B0126005A6AB22C0A50800214A08024024C00240914AB49010A50800214D052800980969A2C8B0214A000052820890013004902C56A52800214A00005B4146002A0A526CBA200052840010A4822C004409240';
wwv_flow_imp.g_varchar2_table(224) := 'B19A14A000052840012D05980068A9C9B22840010A50800292083001902450AC26052840010A50404B0126005A6AB22C0A50800214A08024024C00240914AB49010A50800214D052800980969A2C8B0214A000052820890013004902C56A52800214A000';
wwv_flow_imp.g_varchar2_table(225) := '05B4146002A0A526CBA200052840010A4822C004409240B19A14A000052840012D05980068A9C9B22840010A50800292083001902450AC26052840010A50404B0126005A6AB22C0A50800214A08024024C00240914AB49010A50800214D052800980969A';
wwv_flow_imp.g_varchar2_table(226) := '2C8B0214A000052820890013004902C56A52800214A00005B4146002A0A526CBA200052840010A4822C004409240B19A14A000052840012D05980068A9C9B22840010A50800292083001902450AC26052840010A50404B0126005A6AB22C0A50800214A0';
wwv_flow_imp.g_varchar2_table(227) := '8024024C00240914AB49010A50800214D052800980969A2C8B0214A000052820890013004902C56A52800214A00005B4146002A0A526CBA200052840010A4822C004409240B19A14A000052840012D05980068A9C9B22840010A50800292083001902450';
wwv_flow_imp.g_varchar2_table(228) := 'AC26052840010A50404B0126005A6AB22C0A50800214A08024024C00240914AB49010A50800214D052800980969A2C8B0214A000052820890013004902C56A52800214A00005B4146002A0A526CBA200052840010A4822C004409240B19A14A000052840';
wwv_flow_imp.g_varchar2_table(229) := '012D05980068A9C9B22840010A50800292083001902450AC26052840010A50404B0126005A6AB22C0A50800214A08024024C00240914AB49010A50800214D052800980969A2C8B0214A000052820890013004902C56A52800214A00005B4146002A0A526';
wwv_flow_imp.g_varchar2_table(230) := 'CBA200052840010A4822F0FF03E15F18A56978A1730000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(233112721115894804480)
,p_file_name=>'icons/app-icon-512.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(233112722407297804481)
,p_name=>'Administration Rights'
,p_static_id=>'administration-rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'plsql_function_body', 'return true;')).to_clob
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_version_scn=>'11427409'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_processes/save_photo
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(233380822117737876286)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_name=>'SAVE_PHOTO'
,p_static_id=>'save-photo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_photo_clob clob;',
'  l_photo_blob blob;',
'begin',
'  l_photo_clob := apex_application.g_clob_01;',
'',
'  l_photo_blob := apex_web_service.clobbase642blob(',
'                    p_clob => l_photo_clob',
'                  );',
'',
'  if not apex_collection.collection_exists(''PHOTOS'') then',
'    apex_collection.create_collection(p_collection_name => ''PHOTOS'');',
'  end if;',
'',
'  apex_collection.add_member(p_collection_name => ''PHOTOS'', p_blob001 => l_photo_blob);',
'',
'  apex_json.open_object;',
'  apex_json.write(',
'    p_name => ''result'',',
'    p_value => ''success''',
'  );',
'  apex_json.close_object;',
'exception',
'  when others then',
'    apex_json.open_object;',
'    apex_json.write(',
'      p_name => ''result'',',
'      p_value => ''fail''',
'    );',
'    apex_json.close_object;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>'41053651417829'
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
 p_id=>wwv_flow_imp.id(233112722774551804482)
,p_group_name=>'Administration'
,p_static_id=>'administration'
);
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(233112118623393804375)
,p_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
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
 p_id=>wwv_flow_imp.id(233112697225209804459)
,p_theme_id=>42
,p_static_id=>'universal-theme'
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'26.1'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_current_theme_style_id=>3294906487728305352
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
 p_id=>wwv_flow_imp.id(233112118041866804374)
,p_build_option_name=>'Commented Out'
,p_static_id=>'commented-out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>'41053651448189'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(234700432890733336372)
,p_build_option_name=>'Feature: About Page'
,p_static_id=>'feature-about-page'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>'41053651448197'
,p_feature_identifier=>'APPLICATION_ABOUT_PAGE'
,p_build_option_comment=>'About this application page.'
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
prompt --application/shared_components/security/authentications/apex_accounts
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(7715188987048723514)
,p_name=>'APEX accounts'
,p_static_id=>'apex-accounts'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>'11427441'
,p_created_on=>wwv_flow_imp.dz('20260529090939Z')
,p_updated_on=>wwv_flow_imp.dz('20260529090939Z')
,p_created_by=>'SOCIAL-MEDIA-ADMIN'
,p_updated_by=>'SOCIAL-MEDIA-ADMIN'
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
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Timeline'
,p_alias=>'TIMELINE'
,p_step_title=>'Timeline'
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.actions.add([{',
'    name: "like",',
'    action: (event, element, args) => {',
'        apex.items.P1_ACTION_ID.value = args.id;',
'        apex.event.trigger(document, ''action-like'');',
'    }',
'}, {',
'    name: "delete",',
'    action: (event, element, args) => {',
'        apex.items.P1_ACTION_ID.value = args.id;',
'        apex.event.trigger(document, ''action-delete'');',
'    }',
'}, {',
'    name: "open-map",',
'    action: () => {',
'        apex.event.trigger(document, ''action-open-map'');',
'    }',
'}, {',
'    name: "open-about",',
'    action: () => {',
'        apex.event.trigger(document, ''action-open-about'');',
'    }',
'}]);'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.user-has-liked {',
'    color: red;',
'}',
'',
'@media (max-width: 640px) {',
'    .new-post-button {',
'        position: fixed;',
'        bottom: 24px;',
'        right: 24px;',
'        z-index: 1000;',
'    }',
'}'))
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(234124767810576308404)
,p_plug_name=>'About'
,p_static_id=>'about'
,p_region_name=>'about'
,p_region_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_plug_template=>1662449473392619772
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This application demonstrates many out-of-the-box features of APEX while also showing how an APEX developer can enhance and extend functionality with some custom HTML, mininmal CSS and some Javascript. Further, this application should behave beautifu'
||'lly on either Desktop or Mobile devices!',
'<h3>App Development concepts</h3>',
'<ul>',
'<li>Single Page Application</li>',
'<li>Progressive Web App</li>',
'<li>Mobile Friendly - can use device location and camera</li>',
'<li>File upload</li>',
'<li>Activity locations map</li>',
'</ul>',
'<h3>Database & APEX concepts</h3>',
'<ul>',
'<li>Page Designer</li>',
'<li>QuickSQL and relational datamodel</li>',
'<li>Form Region</li>',
'<li>Cards Region</li>',
'<li>Dialogs</li>',
'<li>Working with BLOBs</li>',
'<li>Javascript</li>',
'<li>Dynamic Actions</li>',
'<li>Custom Events</li>',
'<li>Custom HTML and CSS styling</li>',
'</ul>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(233119999116981477122)
,p_plug_name=>'Post'
,p_static_id=>'post'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize:js-headingLevel-1'
,p_plug_template=>2674150083631647148
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'SM_POSTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(233848999625360306333)
,p_plug_name=>'Post and Like Locations'
,p_static_id=>'post-and-like-locations'
,p_region_name=>'map'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2674150083631647148
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct lat, lon, created_by as who, apex_util.get_since(created) since from ',
'(',
'    select lat, lon, created_by, created from SM_POSTS ',
'union ',
'select lat, lon, created_by, created from SM_REACTIONS',
')'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_MAP_REGION'
);
wwv_flow_imp_page.create_map_region(
 p_id=>wwv_flow_imp.id(233848999698174306334)
,p_region_id=>wwv_flow_imp.id(233848999625360306333)
,p_height=>300
,p_navigation_bar_type=>'FULL'
,p_navigation_bar_position=>'END'
,p_init_position_zoom_type=>'QUERY_RESULTS'
,p_init_position_from_browser=>true
,p_layer_messages_position=>'BELOW'
,p_legend_position=>'END'
,p_features=>'MOUSEWHEEL_ZOOM:RECTANGLE_ZOOM:SCALE_BAR:INFINITE_MAP:BROWSER_LOCATION'
);
wwv_flow_imp_page.create_map_region_layer(
 p_id=>wwv_flow_imp.id(233848999810290306335)
,p_map_region_id=>wwv_flow_imp.id(233848999698174306334)
,p_name=>'Locations'
,p_static_id=>'locations'
,p_layer_type=>'POINT'
,p_display_sequence=>10
,p_location=>'REGION_SOURCE'
,p_has_spatial_index=>false
,p_geometry_column_data_type=>'LONLAT_COLUMNS'
,p_longitude_column=>'LON'
,p_latitude_column=>'LAT'
,p_point_display_type=>'SVG'
,p_point_svg_shape=>'Default'
,p_feature_clustering=>false
,p_tooltip_adv_formatting=>true
,p_tooltip_html_expr=>'&WHO. @ &SINCE.'
,p_info_window_adv_formatting=>false
,p_display_in_legend=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(233120867589514971397)
,p_plug_name=>'Timeline'
,p_static_id=>'timeline'
,p_region_name=>'timeline'
,p_region_css_classes=>'t-Chat'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2074200852440250129
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    p.id,',
'    p.created_by AS user_name,',
'    p.post_comment AS comment_text,',
'    p.file_blob,',
'    p.file_mime,',
'    ',
'    apex_util.get_since(p.created) post_date,',
'',
'    (',
'        select count(*) from SM_REACTIONS smr ',
'        where smr.post_id=p.id',
'    ) as REACTIONS,',
'',
'    (',
'        select ''user-has-liked'' from SM_REACTIONS smr ',
'        where smr.post_id=p.id and created_by=:APP_USER',
'    ) USER_REACTION_CSS',
'',
'  from SM_POSTS p ',
'',
'  order by p.created desc'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(233150504106463631035)
,p_region_id=>wwv_flow_imp.id(233120867589514971397)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'USER_NAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'POST_DATE'
,p_body_adv_formatting=>false
,p_body_column_name=>'COMMENT_TEXT'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'USER_NAME'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_media_source_type=>'BLOB'
,p_media_blob_column_name=>'FILE_BLOB'
,p_media_display_position=>'FIRST'
,p_media_appearance=>'WIDESCREEN'
,p_media_sizing=>'COVER'
,p_media_css_classes=>'selectDisable '
,p_media_description=>'&COMMENT_TEXT.'
,p_pk1_column_name=>'ID'
,p_mime_type_column_name=>'FILE_MIME'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(233150504283084631036)
,p_card_id=>wwv_flow_imp.id(233150504106463631035)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>10
,p_label=>'&REACTIONS.'
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$like?id=&ID.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-heart &USER_REACTION_CSS.'
,p_action_css_classes=>'js-heart-button'
,p_is_hot=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(233150504471223631038)
,p_card_id=>wwv_flow_imp.id(233150504106463631035)
,p_action_type=>'BUTTON'
,p_position=>'SECONDARY'
,p_display_sequence=>20
,p_label=>'Delete'
,p_static_id=>'action-2'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$delete?id=&ID.'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-trash-o'
,p_is_hot=>false
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>'trim(:user_name)=trim(:APP_USER)'
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(85399693018312242016)
,p_button_sequence=>10
,p_button_name=>'ADD_POST'
,p_static_id=>'add-post'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Add Post'
,p_button_position=>'AFTER_LOGO'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'new-post-button'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(233120004331817477127)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(233119999116981477122)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'NEXT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'post-button'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(233150504622268631040)
,p_name=>'P1_ACTION_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(233120867589514971397)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_item_comment=>'This ITEM has a DA on it that is set by the url''s calling JS code for the purpose, which initiates the server side code aspect easily'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(59645115737007858046)
,p_name=>'P1_FILE_BLOB'
,p_source_data_type=>'BLOB'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(233119999116981477122)
,p_item_source_plug_id=>wwv_flow_imp.id(233119999116981477122)
,p_prompt=>'Photo'
,p_source=>'FILE_BLOB'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_grid_label_column_span=>0
,p_field_template=>2042262243893469891
,p_item_css_classes=>'file-upload'
,p_item_icon_css_classes=>'fa-camera-retro'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'display_as', 'DROPZONE_BLOCK',
  'display_download_link', 'N',
  'dropzone_title', 'Share a photo...',
  'file_types', 'image/*',
  'filename_column', 'FILE_NAME',
  'max_file_size', '10000',
  'mime_type_column', 'FILE_MIME',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(233119999441412477123)
,p_name=>'P1_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(233119999116981477122)
,p_item_source_plug_id=>wwv_flow_imp.id(233119999116981477122)
,p_source=>'ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(233824491284522765825)
,p_name=>'P1_LAT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(233119999116981477122)
,p_item_source_plug_id=>wwv_flow_imp.id(233119999116981477122)
,p_source=>'LAT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(233824491334824765826)
,p_name=>'P1_LON'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(233119999116981477122)
,p_item_source_plug_id=>wwv_flow_imp.id(233119999116981477122)
,p_source=>'LON'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(59645115655323858045)
,p_name=>'P1_POST_COMMENT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(233119999116981477122)
,p_item_source_plug_id=>wwv_flow_imp.id(233119999116981477122)
,p_prompt=>'Comment'
,p_source=>'POST_COMMENT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(233150504813590631042)
,p_name=>'action-delete'
,p_static_id=>'action-delete'
,p_event_sequence=>90
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'action-delete'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(233150505150348631045)
,p_event_id=>wwv_flow_imp.id(233150504813590631042)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'DELETE Confirm dialog'
,p_static_id=>'delete-confirm-dialog'
,p_action=>'NATIVE_CONFIRM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'message', 'You are about to delete this post. Are you sure?',
  'title', 'Are you sure?')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(233150504953838631043)
,p_event_id=>wwv_flow_imp.id(233150504813590631042)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'DELETE - do database work'
,p_static_id=>'delete-do-database-work'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P1_ACTION_ID',
  'language', 'PLSQL',
  'plsql_code', 'delete from SM_POSTS where id=:P1_ACTION_ID and created_by=:APP_USER;',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(233768386319612699999)
,p_event_id=>wwv_flow_imp.id(233150504813590631042)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'DELETE - remove post in UI'
,p_static_id=>'delete-remove-post-in-ui'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''[data-id=''+apex.items.P1_ACTION_ID.value+'']'').remove();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(69109390337412105010)
,p_name=>'action-like'
,p_static_id=>'action-like'
,p_event_sequence=>100
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'action-like'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(69109390892391105015)
,p_event_id=>wwv_flow_imp.id(69109390337412105010)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'LIKE - do database work'
,p_static_id=>'like-do-database-work'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P1_ACTION_ID,P1_LAT,P1_LON',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    -- try to store this posts'' reaction from this user',
    '    insert into SM_REACTIONS (post_id, reaction, lat, lon) values (:P1_ACTION_ID, ''LIKED'', :P1_LAT, :P1_LON);',
    '    exception when dup_val_on_index then',
    '        -- remove it as it already existed',
    '        delete from SM_REACTIONS where post_id=:P1_ACTION_ID and created_by=:APP_USER;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(69109390766793105014)
,p_event_id=>wwv_flow_imp.id(69109390337412105010)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'LIKE - update UI (adjust count + heart color)'
,p_static_id=>'like-update-ui-adjust-count-heart-color'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'const button = $(''[data-id="''+ apex.items.P1_ACTION_ID.value +''"] .js-heart-button''); // get the card',
    '',
    'const label = button.find(''.a-CardView-buttonLabel''); // get the likes count section',
    '',
    'const icon = button.find(''.a-CardView-buttonIcon''); // gets the element if its liked already',
    '',
    'let likeCount = label.text(); // get the like count',
    '',
    'if (icon.hasClass(''user-has-liked'')) { ',
    '    // user has liked this already, and they are unliking it now, decrement',
    '    label.text(--likeCount); ',
    '',
    '} else { ',
    '    // user is just now liking this, increment',
    '    label.text(++likeCount);',
    '}',
    '',
    'icon.toggleClass(''user-has-liked''); // either add this class or remove it')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(62967432506239530010)
,p_name=>'action-open-about'
,p_static_id=>'action-open-about'
,p_event_sequence=>120
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'action-open-about'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(62967432831108530014)
,p_event_id=>wwv_flow_imp.id(62967432506239530010)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(234124767810576308404)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(62967432191948530007)
,p_name=>'action-open-map'
,p_static_id=>'action-open-map'
,p_event_sequence=>110
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'action-open-map'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(62967432780751530013)
,p_event_id=>wwv_flow_imp.id(62967432191948530007)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(233848999625360306333)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(69109391217018105019)
,p_name=>'get device location'
,p_static_id=>'get-device-location'
,p_event_sequence=>150
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(69109391383069105020)
,p_event_id=>wwv_flow_imp.id(69109391217018105019)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-get-current-position'
,p_action=>'NATIVE_GET_CURRENT_POSITION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_high_accuracy', 'N',
  'latitude_item', 'P1_LAT',
  'longitude_item', 'P1_LON',
  'return_type', 'lat_long')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(85399693082766242017)
,p_name=>'Open Post Dialog'
,p_static_id=>'open-post-dialog'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(85399693018312242016)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(85399693236733242018)
,p_event_id=>wwv_flow_imp.id(85399693082766242017)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(233119999116981477122)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(69109391101603105017)
,p_name=>'Submit post'
,p_static_id=>'submit-post'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(233120004331817477127)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(69109391138749105018)
,p_event_id=>wwv_flow_imp.id(69109391101603105017)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'request_button_name', 'SAVE',
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(233120869773225971419)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(233119999116981477122)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'init form'
,p_static_id=>'init-form'
,p_internal_uid=>233102855739719930240
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(233120871587623971437)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(233119999116981477122)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'insert post'
,p_static_id=>'insert-post'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(233120004331817477127)
,p_process_success_message=>'Posted!'
,p_internal_uid=>233102857554117930258
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_imp_page.create_page(
 p_id=>9999
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'APEX Instagram - Log In'
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
 p_id=>wwv_flow_imp.id(233112723334979804483)
,p_plug_name=>'APEX Social Media'
,p_static_id=>'apex-social-media'
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
 p_id=>wwv_flow_imp.id(233112725398021804485)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(233112723334979804483)
,p_button_name=>'LOGIN'
,p_static_id=>'login'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'NEXT'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(233112724275814804484)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(233112723334979804483)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>2042262243893469891
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(233112725013289804485)
,p_name=>'P9999_PERSISTENT_AUTH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(233112723334979804483)
,p_prompt=>'Remember me'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_display_when=>'apex_authentication.persistent_auth_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>2042262243893469891
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(233112724663412804485)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(233112723334979804483)
,p_prompt=>'Remember username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_display_when=>'apex_authentication.persistent_cookies_enabled and not apex_authentication.persistent_auth_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>2042262243893469891
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(233112723824361804484)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(233112723334979804483)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>2042262243893469891
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(233112729537382804488)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_static_id=>'clear-page-s-cache'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>233094715503876763309
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(233112729129153804487)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_static_id=>'get-username-cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>233094715095647763308
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(233112725720051804486)
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
,p_internal_uid=>233094711686545763307
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(233112726736331804486)
,p_page_process_id=>wwv_flow_imp.id(233112725720051804486)
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
 p_id=>wwv_flow_imp.id(233112727277220804487)
,p_page_process_id=>wwv_flow_imp.id(233112725720051804486)
,p_page_id=>9999
,p_name=>'p_set_persistent_auth'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>3
,p_value_type=>'ITEM'
,p_value=>'P9999_PERSISTENT_AUTH'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(233112726237188804486)
,p_page_process_id=>wwv_flow_imp.id(233112725720051804486)
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
 p_id=>wwv_flow_imp.id(233112727688340804487)
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
,p_internal_uid=>233094713654834763308
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(233112728617806804487)
,p_page_process_id=>wwv_flow_imp.id(233112727688340804487)
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
 p_id=>wwv_flow_imp.id(233112728107215804487)
,p_page_process_id=>wwv_flow_imp.id(233112727688340804487)
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
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(233457076731547117388)
,p_deinstall_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_last_updated_on=>wwv_flow_imp.dz('20260529090939Z')
);
end;
/
prompt --application/deployment/install/install_db_objects
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '-- create tables'||wwv_flow.LF||
'create table sm_posts ('||wwv_flow.LF||
'    id                             number generated by defa';
wwv_flow_imp.g_varchar2_table(2) := 'ult on null as identity '||wwv_flow.LF||
'                                   constraint sm_posts_id_pk primary key,'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3) := '   post_comment                   varchar2(4000 char),'||wwv_flow.LF||
'    file_blob                      blob,'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(4) := 'file_mime                      varchar2(255 char),'||wwv_flow.LF||
'    file_name                      varchar2(255 c';
wwv_flow_imp.g_varchar2_table(5) := 'har),'||wwv_flow.LF||
'    lat                            number,'||wwv_flow.LF||
'    lon                            number,'||wwv_flow.LF||
'    crea';
wwv_flow_imp.g_varchar2_table(6) := 'ted                        date not null,'||wwv_flow.LF||
'    created_by                     varchar2(255 char) not ';
wwv_flow_imp.g_varchar2_table(7) := 'null,'||wwv_flow.LF||
'    updated                        date not null,'||wwv_flow.LF||
'    updated_by                     varchar2(';
wwv_flow_imp.g_varchar2_table(8) := '255 char) not null'||wwv_flow.LF||
')'||wwv_flow.LF||
';'||wwv_flow.LF||
''||wwv_flow.LF||
'create table sm_reactions ('||wwv_flow.LF||
'    id                             number genera';
wwv_flow_imp.g_varchar2_table(9) := 'ted by default on null as identity '||wwv_flow.LF||
'                                   constraint sm_reactions_id_pk';
wwv_flow_imp.g_varchar2_table(10) := ' primary key,'||wwv_flow.LF||
'    post_id                        number'||wwv_flow.LF||
'                                   constrain';
wwv_flow_imp.g_varchar2_table(11) := 't sm_reactions_post_id_fk'||wwv_flow.LF||
'                                   references sm_posts on delete cascade,'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(12) := '    reaction                       varchar2(16 char),'||wwv_flow.LF||
'    lat                            number,'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(13) := ' lon                            number,'||wwv_flow.LF||
'    created                        date not null,'||wwv_flow.LF||
'    create';
wwv_flow_imp.g_varchar2_table(14) := 'd_by                     varchar2(255 char) not null,'||wwv_flow.LF||
'    updated                        date not nu';
wwv_flow_imp.g_varchar2_table(15) := 'll,'||wwv_flow.LF||
'    updated_by                     varchar2(255 char) not null'||wwv_flow.LF||
')'||wwv_flow.LF||
';'||wwv_flow.LF||
''||wwv_flow.LF||
'-- table index'||wwv_flow.LF||
'create index ';
wwv_flow_imp.g_varchar2_table(16) := 'sm_reactions_i1 on sm_reactions (post_id);'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'-- triggers'||wwv_flow.LF||
'create or replace trigger sm_posts_biu'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(17) := 'before insert or update '||wwv_flow.LF||
'    on sm_posts'||wwv_flow.LF||
'    for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'    if inserting then'||wwv_flow.LF||
'        :new.c';
wwv_flow_imp.g_varchar2_table(18) := 'reated := sysdate;'||wwv_flow.LF||
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);';
wwv_flow_imp.g_varchar2_table(19) := ''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    :new.updated := sysdate;'||wwv_flow.LF||
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION''';
wwv_flow_imp.g_varchar2_table(20) := ',''APP_USER''),user);'||wwv_flow.LF||
'end sm_posts_biu;'||wwv_flow.LF||
'/'||wwv_flow.LF||
''||wwv_flow.LF||
'create or replace trigger sm_reactions_biu'||wwv_flow.LF||
'    before inser';
wwv_flow_imp.g_varchar2_table(21) := 't or update '||wwv_flow.LF||
'    on sm_reactions'||wwv_flow.LF||
'    for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'    if inserting then'||wwv_flow.LF||
'        :new.created :';
wwv_flow_imp.g_varchar2_table(22) := '= sysdate;'||wwv_flow.LF||
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end';
wwv_flow_imp.g_varchar2_table(23) := ' if;'||wwv_flow.LF||
'    :new.updated := sysdate;'||wwv_flow.LF||
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_US';
wwv_flow_imp.g_varchar2_table(24) := 'ER''),user);'||wwv_flow.LF||
'end sm_reactions_biu;'||wwv_flow.LF||
'/'||wwv_flow.LF||
''||wwv_flow.LF||
'---- EXTRA CONFIGURATION'||wwv_flow.LF||
'-- used to ensure only 1 vote per pers';
wwv_flow_imp.g_varchar2_table(25) := 'on per post'||wwv_flow.LF||
'CREATE UNIQUE INDEX  "SM_REACTIONS_IDX1" ON  "SM_REACTIONS" ("POST_ID", "CREATED_BY"); '||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(26) := '/'||wwv_flow.LF||
'-- load data'||wwv_flow.LF||
'';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(68802687052932822411)
,p_install_id=>wwv_flow_imp.id(233457076731547117388)
,p_name=>'db objects'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
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
