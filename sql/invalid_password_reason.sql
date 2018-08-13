SELECT username,userhost,returncode
     FROM dba_audit_session
     WHERE username='YJAQUIER'
     ORDER BY sessionid DESC;
