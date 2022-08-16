#!/usr/bin/env bash
# Author: Bill Scofield
# Ctime : 2022-08-13
# Description:	

1. get ips from file 

    gawk '/(([0-9]{1,3}\.){3}[0-9])/{print $0}' b

2. hostname -I
    -I, --all-ip-addresses
        Display all network addresses of the host. This option enumerates  all
        configured addresses on all network interfaces. The loopback interface
        and IPv6 link-local addresses are omitted. Contrary to option -i, this
        option does not depend on name resolution. Do not make any assumptions
        about the order of the output.

