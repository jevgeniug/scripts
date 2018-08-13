set heading off 
set feedback off 
set trimspool on 
set escape off
set echo off
set timing off 
set long 1000 linesize 1000 pagesize 0
col SEQDDL format A300
execute dbms_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SQLTERMINATOR',true);

 select 
dbms_metadata.get_ddl('SEQUENCE',sequence_name,sequence_owner) SEQDDL
 from dba_sequences
 where sequence_owner not in
 (select name
 from system.logstdby$skip_support
 where action=0);
