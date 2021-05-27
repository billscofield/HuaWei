
iostat command monitor the I/O (Input/Output) devices loading by means of
observing the time(通过时间进行观察), devices are active with respect to their
average transfer rates. This command is especially helpful for generating
reports that we can use to optimize the system’s input & output load.


iostat command generally generates two reports:

    CPU utilization report

    All disks i/o statistics report

To generate the reports, iostat command reads some of the system files . These
files are,

    /proc/diskstats for disk stats

    /proc/stat for system stats

    /sys for block device stats

    /proc/devices for persistent device names

    /proc/self/mountstats for all  the network filesystems

    /proc/uptime for information regarding system uptime
