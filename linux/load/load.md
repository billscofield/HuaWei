
## /proc/loadavg

https://docs.fedoraproject.org/en-US/Fedora/17/html/System_Administrators_Guide/s2-proc-loadavg.html


This file provides a look at the load average in regard to both the CPU and IO
over time, as well as additional data used by uptime and other commands. A
sample /proc/loadavg file looks similar to the following:

0.20 0.18 0.12 1/80 11206

The first three columns measure CPU and IO utilization of the last one, five,
and 15 minute periods. The fourth column shows the number of currently running
processes and the total number of processes. The last column displays the last
process ID used.  In addition, load average also refers to the number of
processes ready to run (i.e. in the run queue, waiting for a CPU share.)



