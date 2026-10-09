-- SCM Inventory and Warehouse Management uninstall
-- Drops all database objects with the SCM_ prefix.

set define off

begin
    for rec in (
        select object_type, object_name
          from user_objects
         where object_name like 'SCM\_%' escape '\'
         order by case object_type
                      when 'PROCEDURE' then 1
                      when 'FUNCTION'  then 1
                      when 'PACKAGE'   then 1
                      when 'VIEW'      then 2
                      when 'INDEX'     then 3
                      when 'TABLE'     then 4
                      else 5
                  end
    ) loop
        begin
            if rec.object_type = 'TABLE' then
                execute immediate 'drop table ' || rec.object_name || ' cascade constraints purge';
            else
                execute immediate 'drop ' || rec.object_type || ' ' || rec.object_name;
            end if;
        exception
            when others then null;
        end;
    end loop;
end;
/
