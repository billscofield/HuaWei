

ICMP header format
+---------------------------------------------------------------------------------------------+
|       0         |             1         |             2           |               3         |
+-----------------|-----------------------|-------------------------|-------------------------+
| 0 1 2 3 4 5 6 7 | 8 9 10 11 12 13 14 15 | 16 17 18 19 20 21 22 23 | 24 25 26 27 28 29 30 31 |
+-----------------|-----------------------|---------------------------------------------------+
| Type            | Code                  | Checksum                                          |
+---------------------------------------------------------------------------------------------+
| Rest of header                                                                              |
+---------------------------------------------------------------------------------------------+
| Data                                                                                        | 
+---------------------------------------------------------------------------------------------+


ICMP error messages contain a data section that includes a copy of the entire IPv4 header, plus at least the first eight bytes of data from the IPv4 packet that caused the error message. 

The maximum length of ICMP error messages is 576 bytes. 
This data is used by the host to match the message to the appropriate process. 
If a higher level protocol uses port numbers, they are assumed to be in the first eight bytes of the original datagram's data.

The variable size of the ICMP packet data section has been exploited. 
In the "Ping of death", large or fragmented ICMP packets are used for denial-of-service attacks. 
ICMP data can also be used to create covert channels for communication. These channels are known as ICMP tunnels.



windows系统，默认传输32bytes，内容是abcdefghijklmnopqrstuvwabcdefghi，共32bytes

