set serveroutput on
set long 20000 longchunksize 20000 pagesize 0 linesize 1000 feedback off verify off trimspool on
column ddl format a1000
spool create_profiles.sql

begin
        dbms_metadata.set_transform_param (dbms_metadata.session_transform, 'SQLTERMINATOR', true);
        dbms_metadata.set_transform_param (dbms_metadata.session_transform, 'PRETTY', true);
end;
/

select dbms_metadata.get_ddl('PROFILE', profile) as profile_ddl
from   (select distinct profile
        from   dba_profiles);

set linesize 80 pagesize 14 feedback on verify on
spool off;
