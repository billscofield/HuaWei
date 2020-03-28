## 更改mac address

hw class address
    Set the hardware address of this interface, if the device driver supports this operation.  The keyword must be followed by the name of the hardware class and the printable ASCII equivalent of  the
    hardware address.  Hardware classes currently supported include ether (Ethernet), ax25 (AMPR AX.25), ARCnet and netrom (AMPR NET/ROM).

    ifconfig eth0 hw ether 00:00:45:11:34:f1

永久修改
vi /etc/network/interfaces
    在 iface eth0 inet stat下边添加
    hwaddress ether AA:BB:CC:DD:EE:FF
