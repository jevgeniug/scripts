set serveroutput on
spool create_roles.sql
/*
set long 20000 longchunksize 20000 pagesize 0 linesize 1000 feedback off verify off trimspool on
column ddl format a1000
*/

declare
        no_grant exception;
        pragma exception_init (no_grant, -31608);
        x varchar(4000);

begin
        dbms_metadata.set_transform_param (dbms_metadata.session_transform, 'SQLTERMINATOR', true);
        dbms_metadata.set_transform_param (dbms_metadata.session_transform, 'PRETTY', true);

        for r in (select role from dba_roles where role not in ('CONNECT', 'RESOURCE', 'DBA'))
loop
begin
        x := dbms_metadata.get_ddl('ROLE', r.role);
        dbms_output.put_line(x);
exception
        when no_grant then x := '-- no profile grants';
        dbms_output.put_line(x);
end;
end loop;
end;
/
spool off;
