select NAME,COMPLETION_TIME from v$archived_log where COMPLETION_TIME > sysdate - 0.1 order by 2;
