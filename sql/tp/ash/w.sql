DEF filter=&1

PROMPT What's going on? Showing top timed events of last minute from ASH...
@ashtop session_state,event &filter sysdate-1/24/60 sysdate

PROMPT Showing top SQL and wait classes of last minute from ASH...
@ashtop sql_id,session_state,wait_class &filter sysdate-1/24/60 sysdate

