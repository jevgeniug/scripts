#!/usr/sbin/dtrace

syscall::fstatat:entry
/(int)arg0 == -3041965 && execname == "sqlplus" && strstr(copyinstr(arg1), "login.sql") != NULL/

{
printf("%s\n", copyinstr(arg1));
}
