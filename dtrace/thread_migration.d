#!/usr/sbin/dtrace
sched:::off-cpu
{
self->cpu = cpu;
}
sched:::on-cpu
/self->cpu != cpu/
{
	printf("%s migrated from cpu %d to %d\n",execname,self->cpu,cpu);
	self->cpu = 0;
}
