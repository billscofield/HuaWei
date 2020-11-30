
apt-cache show arping

## arp 使用方法

arping [-AbDfhqUV] [-c count] [-w deadline] [-s source] [-I interface] destination

-V : print version and exit
-c count : how many packets to send
-I device : which ethernet device to use
-f : quit on first reply
    如果不加次数，永不停滞

-q : be quiet
    不回显结果，这有啥用

-b : keep broadcasting, don't go unicast

-D : duplicate address detection mode
-U : Unsolicited ARP mode, update your neighbours
-A : ARP answer mode, update your neighbours

-w timeout : how long to wait for a reply
-s source : source ip address
destination : ask for what ip address


---

arping  [-0aAbBdDeFhpqrRuUv] [-S host/ip] [-T host/ip] [-s MAC]    [-t MAC] [-c count] [-i interface] [ -w
seconds ] [ -W seconds  ] [ -V vlan  ] [ -Q priority  ] [ -g group  ] <host | -B>



The arping utility sends ARP and/or ICMP requests to the specified host and displays the replies. 
The host may be specified by its hostname, its IP address, or its MAC address.

同时返回 ip 和 mac 

One request is sent each second.

When pinging an IP an ARP who-has query is sent. When pinging a MAC address a directed broadcast ICMP Echo
request is sent. For more technical explanation and an FAQ, see the README file.




-0     Use this option to ping with source IP address 0.0.0.0. Use this when you haven’t  configured  your
interface yet.  Note that this may get the MAC-ping unanswered.  This is an alias for -S 0.0.0.0.

-a     Audible ping.
       这个当有reply回来的时候，你的电脑有喇叭的话，就会滴滴的叫 

-A     Only  count addresses matching requested address (This *WILL* break most things you do. Only useful
       if you are arpinging many hosts at once. See arping-scan-net.sh for an example).

-b     Like -0 but source broadcast source address (255.255.255.255).  Note that this may get  the  arping
       unanswered since it’s not normal behavior for a host.

-B     Use instead of host if you want to address 255.255.255.255.

-c count
    Only send count requests.

-C count
    Only wait for count replies, regardless of -c and -w.

-d     Find duplicate replies. Exit with 1 if there are answers from two different MAC addresses.

-D     Display answers as exclamation points and missing packets as dots.  Like flood ping on a Cisco.

-e     Like -a but beep when there is no reply.

-F     Don’t  try to be smart about the interface name. Even if this switch is not given, -i disables this smartness.

-g group
       setgid() to this group instead of the nobody group.

-h     Displays a help message and exits.

-i interface
       Don’t guess, use the specified interface.

-m type
       Type of timestamp to use for incoming packets.  Use -vv when pinging to list available ones.

-p     Turn on promiscious mode on interface, use this if you don’t "own" the MAC address you are using.

-P     Send ARP replies instead of requests. Useful with -U.

-q     Does not display messages, except error messages.

-Q priority
       802.1p priority to set. Should be used with 802.1Q tag (-V).  Defaults to 0.

-r     Raw output: only the MAC/IP address is displayed for each reply.

-R     Raw output: Like -r but shows "the other one", can be combined with -r.

-s MAC Set source MAC address. You may need to use -p with this.

-S IP  
    Like -b and -0 but with set source address.  Note that this may get the arping  unanswered  if  the
    target does not have routing to the IP. If you don’t own the IP you are using, you may need to turn
    on promiscious mode on the interface (with -p). With this switch you can find out what IP-address a
    host has without taking an IP-address yourself.

-t MAC 
    Set target MAC address to use when pinging IP address.

-T IP  
    Use  -T as target address when pinging MACs that won’t respond to a broadcast ping but perhaps to a
    directed broadcast.

    Example:

    To check the address of MAC-A, use knowledge of MAC-B and IP-B.

    $ arping -S <IP-B> -s <MAC-B> -p <MAC-A>

-u     Show index=received/sent instead of just index=received when
       pinging MACs.

-U     Send unsolicited ARP. This sets the destination MAC address in
       the ARP frame to the broadcast address. Unsolicited ARP is used
       to update the neighbours’ ARP caches.

    Example:

    $ arping -i <interface> -U <interface IP>

-v     Verbose output. Use twice for more messages.

-V vlan
    VLAN tag to set. Defaults to no VLAN tag.

-w sec Specify a timeout before ping exits regardless of how many packets have been sent or received.

-W sec Time to wait between pings.

