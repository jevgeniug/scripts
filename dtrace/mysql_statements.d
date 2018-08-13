#!/usr/sbin/dtrace -qs
pid$1::*\dispatch_command*\:entry
{
	printf("%d::%s\\n", tid, copyinstr(arg2));
}
