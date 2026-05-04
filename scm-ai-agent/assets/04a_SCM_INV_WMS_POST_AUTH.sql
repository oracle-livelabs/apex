-- Post-Authentication Procedure
-- Automatically registers any APEX workspace user into scm_application_users
-- and assigns them the Warehouse Manager role for PHX-WEST on first sign-in.
--
-- Setup: In the APEX app, go to
--   Shared Components > Authentication Schemes > Oracle APEX Accounts
--   Set "Post-Authentication Procedure Name" to: scm_post_auth_register_user

create or replace procedure scm_post_auth_register_user
as
    l_apex_user      varchar2(255);
    l_user_exists    pls_integer;
    l_user_id        number;
    l_warehouse_id   number;
    l_role_id        number;
    l_workspace_id   apex_workspaces.workspace_id%type;
    l_workspace_name apex_workspaces.workspace%type;
    l_acl_role_id    apex_appl_acl_roles.role_id%type;
    c_app_id         constant number        := apex_application.g_flow_id;
    c_acl_role       constant varchar2(50)  := 'warehouse-manager';
    c_warehouse_code constant varchar2(20)  := 'PHX-WEST';
    c_scm_role_name  constant varchar2(50)  := 'WAREHOUSE MANAGER';
begin
    l_apex_user := upper(apex_application.g_user);

    -- Skip system/anonymous sessions
    if l_apex_user is null
       or l_apex_user in ('NOBODY', 'APEX_PUBLIC_USER', 'ANONYMOUS', 'GUEST')
    then
        return;
    end if;

    -- Check if user already registered in the SCM application
    select count(*)
      into l_user_exists
      from scm_application_users
     where upper(user_name) = l_apex_user;

    if l_user_exists = 0 then

        select warehouse_id
          into l_warehouse_id
          from scm_warehouses
         where warehouse_code = c_warehouse_code;

        select user_role_id
          into l_role_id
          from scm_user_roles
         where upper(role_name) = c_scm_role_name;

        insert into scm_application_users (
            user_name,
            full_name,
            email_address,
            user_status_code,
            default_warehouse_id
        ) values (
            l_apex_user,
            l_apex_user,
            lower(l_apex_user) || '@example.com',
            'ACTIVE',
            l_warehouse_id
        ) returning application_user_id into l_user_id;

        insert into scm_user_role_assignments (
            application_user_id,
            user_role_id,
            assignment_status_code,
            is_primary_role
        ) values (
            l_user_id,
            l_role_id,
            'ACTIVE',
            'true'
        );

    end if;

    -- Assign APEX ACL role if not already assigned
    select workspace
      into l_workspace_name
      from apex_applications
     where application_id = c_app_id;

    select workspace_id
      into l_workspace_id
      from apex_workspaces
     where workspace = l_workspace_name;

    apex_util.set_security_group_id(p_security_group_id => l_workspace_id);

    select role_id
      into l_acl_role_id
      from apex_appl_acl_roles
     where workspace        = l_workspace_name
       and application_id   = c_app_id
       and role_static_id   = c_acl_role;

    apex_acl.add_user_role(
        p_application_id => c_app_id,
        p_user_name      => l_apex_user,
        p_role_id        => l_acl_role_id
    );

    commit;

exception
    when others then
        -- Never block a login due to registration errors
        rollback;
end scm_post_auth_register_user;
/
