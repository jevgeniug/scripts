SELECT TRUNC(first_time, 'HH'), COUNT(*)
FROM v$archived_log
WHERE first_time > sysdate - 23/24
AND dest_id = &destid
GROUP BY TRUNC(first_time, 'HH')
ORDER BY 1
;
