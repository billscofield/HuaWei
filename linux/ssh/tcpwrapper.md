
/etc/hosts.deny

man 5 hosts_options
man 5 hosts_access

sshd:192.168.1.1

立即生效




ldd $(which sshd)

    libwrap.so.0        有这个才可以被限制， 而 telnet server 没有调用


