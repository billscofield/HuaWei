
默认只抓前68个字节

-i interface
    --interface=interface
       Listen on interface.  If unspecified, tcpdump searches the system interface list for the lowest num‐
       bered, configured up interface (excluding  loopback),  which  may  turn  out  to  be,  for  example,
       ``eth0''.

       On  Linux systems with 2.2 or later kernels, an interface argument of ``any'' can be used to capture
       packets from all interfaces.  Note that captures on the ``any'' device will not be done in promiscuous mode.

       If  the  -D flag is supported, an interface number as printed by that flag can be used as the interface argument, if no interface on the system has that number as a name.


-S
    --absolute-tcp-sequence-numbers
        Print absolute, rather than relative, TCP sequence numbers.



-s snaplen
    --snapshot-length=snaplen
        Snarf snaplen bytes of data from each packet rather than the default of 262144 bytes.  
        Packets truncated because of a limited snapshot are indicated in the output with ``[|proto]'',  where  proto  is
        the  name of the protocol level at which the truncation has occurred.  
        Note that taking larger snapshots both increases the amount of time it takes to process packets and, effectively, decreases  the amount  of  packet  buffering.   
        This may cause packets to be lost.  
        You should limit snaplen to the smallest number that will capture the protocol information you're interested in.  
        Setting snaplen to 0  sets it to the default of 262144, for backwards compatibility with recent older versions of tcpdump.


-w file
    Write the raw packets to file rather than parsing and printing them out.  
    They can later be  printed with the -r option.  Standard output is used if file is ``-''.

    This  output  will  be  buffered if written to a file or pipe, so a program reading from the file or
    pipe may not see packets for an arbitrary amount of time after they are received.  Use the  -U  flag
    to cause packets to be written as soon as they are received.

    The  MIME  type application/vnd.tcpdump.pcap has been registered with IANA for pcap files. The file‐
    name extension .pcap appears to be the most commonly used along with .cap and .dmp.  Tcpdump  itself
    doesn't  check  the  extension  when reading capture files and doesn't add an extension when writing
    them (it uses magic numbers in the file header instead). However, many operating systems and  appli‐
    cations will use the extension if it is present and adding one (e.g. .pcap) is recommended.

    See pcap-savefile(5) for a description of the file format.

    -w a.pcap



-n     Don't convert addresses (i.e., host addresses, port numbers, etc.) to names.

-N     Don't  print domain name qualification of host names.  E.g., if you give this flag then tcpdump will
       print ``nic'' instead of ``nic.ddn.mil''.

-c count
    Exit after receiving count packets.

host
    using host, you can see traffic that’s going to or from hostValue

src / dst
    If you only want to see traffic in one direction or the other, you can use src and dst.

net???
    To find packets going to or from a particular network or subnet, use the net option.


src host 192.168.200.2 | src 192.168.200.2
dst host 192.168.200.2 | dst 192.168.200.2

tcpdump -n tcp port 53 -r 文件.pcat
tcpdump -n udp port 53 -r 文件.pcat



-x  When parsing and printing, in addition to printing  the  headers  of  each  packet,
    print the data of each packet (minus its link level header) in hex.  The smaller of
    the entire packet or snaplen bytes will be printed.  Note that this is  the  entire
    link-layer  packet,  so for link layers that pad (e.g. Ethernet), the padding bytes
    will also be printed when the higher layer packet is shorter than the required pad‐
    ding.

-xx When  parsing  and  printing,  in  addition to printing the headers of each packet,
    print the data of each packet, including its link level header, in hex.

-X  When parsing and printing, in addition to printing  the  headers  of  each  packet,
    **print the data of each packet (minus its link level header) in hex and ASCII.**  This
    is very handy for analysing new protocols.

-XX When parsing and printing, in addition to printing  the  headers  of  each  packet,
    print the data of each packet, including its link level header, in hex and ASCII.














-r file
Read packets from file (which was created with the -w option or by other tools that  write  pcap  or pcap-ng files).  
Standard input is used if file is ``-''.

A     Print each packet (minus its link level header) in ASCII.  Handy for capturing web pages.






tcpdump -i ens18 -n -s 0 -w test.pcap      全部的流量

tcpdump -i ens18 -n -s 1 port 22 -w test.pcap

tcpdump -A -r test.pcap

tcpdump -A -n 'tcp[13]=24' -r http.cap
tcp报文 flags 为24(push + ack)






组播地址：239.255.255.250是SSDP(简单服务发现协议)，这是路由器的UPNP服务使用的协议。
