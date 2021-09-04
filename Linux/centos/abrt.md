
# CHAPTER 28. AUTOMATIC BUG REPORTING TOOL (ABRT)

[Red Hat Enterprise Linux 6 Deployment Guide](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/pdf/deployment_guide/red_hat_enterprise_linux-6-deployment_guide-en-us.pdf)

搜索  abrt

The Automatic Bug Reporting Tool, commonly abbreviated as ABRT, consists of the
abrtd daemon and a number of system services and utilities to process, analyze,
and report detected problems. The daemon runs silently in the background most
of the time, and springs into action when an application crashes or a kernel
oops is detected. The daemon then collects the relevant problem data such as a
core file if there is one, the crashing application's command-line parameters,
and other data of forensic utility.
