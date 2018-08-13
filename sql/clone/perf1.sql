select action, sum(executions_delta) exec_count, sum(disk_reads_delta+DIRECT_WRITES_DELTA) totalphio,
sum(buffer_gets_delta) lio, sum(CPU_TIME_DELTA) cpu
from DBA_HIST_SQLSTAT
where instance_number=1
and snap_id between
(select min(snap_id) from  dba_hist_snapshot where
trunc(begin_interval_time,'DD')>=trunc(sysdate,'DD') -1) and
(select max(snap_id) from  dba_hist_snapshot where
trunc(begin_interval_time,'DD')<=trunc(sysdate,'DD') -1)
group by rollup(action)
order by 3 desc;
