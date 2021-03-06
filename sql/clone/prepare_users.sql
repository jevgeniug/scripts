set serveroutput on
spool create_users.sql
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

        for u in (select username from dba_users where username not in ('ANONYMOUS', 'APPQOSSYS', 'CTXSYS', 'DBSNMP', 'DIP', 'ORACLE_OCM', 'OUTLN', 'SYS', 'SYSTEM', 'TRACESVR', 'TSMSYS', 'WMSYS', 'XDB', 'XS$NULL') and profile = 'USERS')
loop
begin
        x := dbms_metadata.get_ddl('USER', u.username);
        dbms_output.put_line(x);
end;
end loop;
end;
/
spool off;
