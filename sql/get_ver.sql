col variablename for a30
col variablevalue for a15
SELECT variablename, variablevalue FROM core.serverconf WHERE variablename LIKE '%release%' 
ORDER BY 1;
