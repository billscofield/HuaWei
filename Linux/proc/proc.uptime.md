## /proc/uptime

The first value represents the total number of seconds the system has been up.

The second value is the sum of how much time each core has spent idle, in
seconds. Consequently, the second value may be greater than the overall system
uptime on systems with multiple cores.

cat /proc/uptime

    622544.68 2471547.71

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/s2-proc-uptime
