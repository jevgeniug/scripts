COLUMN percent FORMAT 999.99 

select sid, to_char(start_time,'hh24:mi:ss') stime, 
message,( sofar/totalwork)* 100 percent 
from v$session_longops
where sofar/totalwork < 1;
