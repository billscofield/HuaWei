/etc/network/interface 恢复为默认的配置后，service network-manager 会正常工作(需要等待几秒钟)

# the difference of NetworkManager and network in centos

In CentOS, NetworkManager and network are two different ways to manage the
network configuration.

NetworkManager is a daemon that manages network connectivity and is used in
modern desktop environments such as GNOME and KDE. NetworkManager can be used
to manage wired and wireless connections, and it can also be used to manage
VPNs, mobile broadband, and other types of network connections. NetworkManager
stores network settings in a configuration file called NetworkManager.conf and
uses a GUI interface to manage connections.

On the other hand, network is the traditional network configuration system in
CentOS, and it is controlled by a set of scripts in the
/etc/sysconfig/network-scripts/ directory. The scripts in this directory are
used to configure network interfaces, routing tables, and other network
settings. Network does not have a graphical user interface and is usually
configured through the command line.

Overall, NetworkManager provides a more modern and user-friendly way to manage
network connections in CentOS, while the network configuration system provides
more fine-grained control and flexibility for advanced network configurations.

## 配置工具

1. nmcli 由 NetworkManager 提供

2. nm-connection-editor
    centos上图形化的默认的那个管理器

3. nmtui

## i was working on a linux without nmcli , i am using the netwoking not networkmanager

If you are not using Network Manager and nmcli is not available, you can
manually configure network settings by editing the appropriate configuration
files in the /etc/sysconfig/network-scripts/ directory.

For example, to configure a network interface named eth0, you would edit the
file /etc/sysconfig/network-scripts/ifcfg-eth0. Here is an example of what the
file might look like:

```makefile
DEVICE=eth0
BOOTPROTO=static
ONBOOT=yes
IPADDR=192.168.1.100
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
DNS1=8.8.8.8
DNS2=8.8.4.4
```

The DEVICE parameter specifies the name of the network interface, and BOOTPROTO
specifies the protocol used to obtain an IP address. If BOOTPROTO is set to
static, you must also specify an IP address, netmask, gateway, and DNS servers.

Once you have made changes to the configuration file, you can restart
networking by running the command:

    sudo systemctl restart network

This will apply the new configuration settings.

### what is BOOTPROTO

BOOTPROTO stands for "**boot protocol**" and is a parameter used in network
configuration files on Linux systems. It specifies the **boot-time protocol used
by the network interface to obtain its IP address, netmask, gateway, and other
related network settings**.

There are different protocols that can be used to obtain these settings, such
as **DHCP** (Dynamic Host Configuration Protocol), **BOOTP** (Bootstrap Protocol), or
**static** IP configuration.

When setting up a network interface, you can use the BOOTPROTO parameter to
specify which protocol the interface should use to obtain its network
configuration at boot time. For example, if you want the interface to use DHCP
to obtain its IP address and other settings, you would set BOOTPROTO to "dhcp".
If you want to manually configure the interface's network settings, you would
set BOOTPROTO to "none" or "static".

### what is the difference of value  none and static of BOOTPROTO

In the context of network configuration, BOOTPROTO is a parameter that
specifies how the network interface should obtain its IP address configuration.

When BOOTPROTO is set to none, the interface does not attempt to obtain an IP
address through any means, and must be manually configured with a static IP
address.  When BOOTPROTO is set to static, the interface is assigned a static
IP address that is specified in the configuration file.  In summary, none means
that the interface will not have an IP address assigned automatically, while
static means that a specific IP address is set for the interface in the
configuration file.

The difference between BOOTPROTO=none and BOOTPROTO=static is that with
BOOTPROTO=none, the network interface is not automatically configured with an
IP address, netmask, gateway, etc. when the system boots up. This means that
you would need to manually configure the network settings using commands such
as ifconfig, route, and ip.

On the other hand, with BOOTPROTO=static, the network interface is configured
with a static IP address, netmask, gateway, etc. at boot time, based on the
settings in the `ifcfg-<interface>` file. This means that the network
configuration is automatically set up, without requiring manual intervention.

So, the difference between none and static is that none means no automatic
configuration, while static means automatic configuration with the settings
specified in the `ifcfg-<interface>` file.

If you set BOOTPROTO=none and also specify the IP address, gateway, netmask,
and DNS in the `ifcfg-<interface>` file, then your Linux system will use the
static IP configuration that you specified when the interface is brought up at
boot time. This means that your system will not use DHCP to obtain an IP
address from a DHCP server.

### what about if I was noting using the NetworkManager, which program will be used to generate the uuid

If you are not using NetworkManager, the UUID can be generated using the
**uuidgen** command in Linux. You can run the command in a terminal to generate a
new UUID and then add it to the UUID field in the `ifcfg-<interface>` file
manually. The UUID is used to identify the network interface and should be
unique for each interface.

### so the uuid can be changable , as long as it is unique?

The UUID (Universally Unique Identifier) is intended to be a unique identifier
that should not change over time, even if the network interface name or
physical location changes. However, it is possible to change the UUID value for
a network interface manually. It is not recommended to change the UUID value
unless it is necessary, as it may cause problems with network configuration and
management tools that rely on the UUID value to identify network interfaces.


### ip a output

1. is LOWER_UP short for something?

**LOWER_UP** is short for "Lower Layer is Up", which indicates that **the network
link layer is active and connected.**

The possible states include UP, DOWN, UNKNOWN, LOWER_UP, and LOWER_DOWN.
    1. UP: the interface is administratively enabled and has an active IP address.
    2. DOWN: the interface is administratively disabled.
    3. UNKNOWN: the interface state is unknown, which can happen when a module
       or driver is not working correctly.
    4. LOWER_UP: the interface is physically connected to the network and has
       been enabled.
    5. LOWER_DOWN: the interface is physically disconnected from the network.


The ip a command in Linux is used to display network interface information.
Here is an example output of the command:

```text
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
        valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
        valid_lft forever preferred_lft forever

2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:3a:f4:60 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.101/24 brd 192.168.1.255 scope global noprefixroute dynamic eth0
        valid_lft 581sec preferred_lft 581sec
    inet6 fe80::a0b7:b234:57d1:e9e6/64 scope link noprefixroute
        valid_lft forever preferred_lft forever
```

- 1: and 2: are the interface numbers assigned by the kernel to each network interface.

- lo and eth0 are the names of the network interfaces. lo stands for loopback
  interface and eth0 is an Ethernet interface.

- `<LOOPBACK,UP,LOWER_UP>` and `<BROADCAST,MULTICAST,UP,LOWER_UP>` are the
  flags for each interface.
    1. UP means the interface is enabled and running,
    2. LOWER_UP means that the link layer is up and the interface is ready to
       send and receive packets,
    3. LOOPBACK and BROADCAST indicate the type of interface.

- mtu is the Maximum Transmission Unit, which is the largest size of a packet
  that can be sent over the interface.

- qdisc is the queuing discipline used by the interface.

- state shows the state of the interface. UNKNOWN means the state is not known,
  UP means the interface is up and running, and DOWN means the interface is
  down.

- group is the multicast group that the interface belongs to.

- qlen is the length of the transmit queue of the interface.

- link/loopback and link/ether are the link types of the interfaces. loopback
  means the interface is a loopback interface, and ether means it is an
  Ethernet interface.

- 00:00:00:00:00:00 and 00:0c:29:3a:f4:60 are the MAC addresses of the
  interfaces.

- brd ff:ff:ff:ff:ff:ff and 192.168.1.255 are the broadcast addresses for the
  interfaces.

- inet 127.0.0.1/8 and inet 192.168.1.101/24 are the IP addresses assigned to
  the interfaces. The numbers after the slash represent the network prefix
  length.

- scope shows the scope of the IP address. host means the IP address is
  assigned to the host, and global means it is assigned to the network.

- valid_lft and preferred_lft are the lifetimes of the

### BROADCAST indicate the type of interface, what is broadcast interface?

In the context of networking, a broadcast interface is a network interface that
is capable of sending broadcast packets. Broadcast packets are special packets
that are sent to all devices on the network, regardless of their IP address or
MAC address.

A common use case for broadcast packets is for service discovery protocols like
DHCP or mDNS, where a device needs to discover services or configuration
information on the network. A broadcast packet is sent to all devices on the
network, and any device that is listening for that type of packet will respond
if it has the requested service or information.

Broadcast interfaces are typically used for network interfaces that are
connected to a local network, like a LAN or Wi-Fi network, rather than a WAN or
the internet.

### is there any network interface cannot send boradcast?

No, all network interfaces can send broadcast messages. Broadcasting is a
fundamental mechanism in computer networking that allows a message to be sent
to all devices on a network. It is used for various purposes such as network
discovery, service discovery, and sending network-wide announcements. All
network interfaces have the ability to send broadcast messages, which are
typically addressed to the broadcast address of the network.

### as all network interfaces can send broadcast messages, why `ip a` command say BROADCAST

In the output of ip a command, the **BROADCAST flag** is not indicating that the
network interface is capable of sending broadcast messages. Instead, **it
indicates whether the interface has the ability to receive and process
broadcast messages.** When this flag is present, it means that the network
interface is in **promiscuous mode**, which allows it to receive all network
traffic on the network segment, including broadcast messages.

So, the BROADCAST flag is not related to the interface's ability to send
broadcast messages, but rather its ability to receive them.


