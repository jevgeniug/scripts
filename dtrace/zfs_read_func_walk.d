#!/usr/sbin/dtrace

syscall::read:entry
/execname == "cat"/
{
	self->t = 1;
}

syscall::read:return
/self->t/
{
	self->t = 0;
	exit(0);
}

sdt:::, fbt:::entry, fbt:::return
/self->t/
{
}
