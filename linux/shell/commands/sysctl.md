# sysctl

sysctl - configure kernel parameters at runtime

sysctl is used to modify kernel parameters at runtime.  The parameters
available are those listed under /proc/sys/.  Procfs is required for sysctl
support  in  Linux.   You  can  use sysctl to both read and write sysctl data.

    -p[FILE], --load[=FILE]
        Load in sysctl settings from the file specified or /etc/sysctl.conf  if  none  given.

    -a, --all
        Display all values currently available.

    -w, --write
        Use this option when you want to change a sysctl setting.


echo "fs.nr_open = 1000000" >>/etc/sysctl.conf    或者 sysctl -w fs.nr_open=1000000
sysctl -p



