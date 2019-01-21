/etc/network/interface

auto eth0
iface eth0 inet dhcp





auto: the interface should be configured during boot time.

iface : interface

inet: interface uses TCP/IP networking.


That means interface eth0 should be configured during boot time , and interface name eth0

uses TCP/IP protocol and can be configured by Dhcp .



here is another 
    1. https://unix.stackexchange.com/questions/128439/good-detailed-explanation-of-etc-network-interfaces-syntax
