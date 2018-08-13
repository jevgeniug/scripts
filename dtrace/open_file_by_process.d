dtrace -n 'syscall::open*:entry /execname == "sqlplus" && strstr(copyinstr(arg1),"login.sql") != NULL && (int)arg0 == -3041965/ { printf("%s\n",copyinstr(arg1)); }'
