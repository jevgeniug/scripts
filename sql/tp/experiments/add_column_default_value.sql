DROP TABLE t;

CREATE TABLE t (a int) TABLESPACE users;
INSERT /*+ APPEND */ INTO t SELECT rownum FROM dba_source;
COMMIT;
--ALTER TABLE t ADD b INT DEFAULT 123 NOT NULL;

PAUSE Hit enter to add column
ALTER TABLE t ADD c VARCHAR2(100) DEFAULT 'taneltest' NOT NULL;
PAUSE Hit enter to change default value
ALTER TABLE t MODIFY c VARCHAR2(100) DEFAULT 'not testing anymore';


