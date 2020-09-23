
## nmcli

command-line tool for controlling NetworkManager and
reporting network status. It can be utilized as a replacement for
nm-applet or other graphical clients.  nmcli is used to create,
display, edit, delete, activate, and deactivate network
connections, as well as control and display network device
status.


Usage: nmcli [OPTIONS] OBJECT { COMMAND | help }

OPTIONS
  -o[verview]                                    overview mode (hide default values)
  -t[erse]                                       terse output
  -p[retty]                                      pretty output
  -m[ode] tabular|multiline                      output mode
  -c[olors] auto|yes|no                          whether to use colors in output
  -f[ields] <field1,field2,...>|all|common       specify fields to output
  -g[et-values] <field1,field2,...>|all|common   shortcut for -m tabular -t -f
  -e[scape] yes|no                               escape columns separators in values
  -a[sk]                                         ask for missing parameters
  -s[how-secrets]                                allow displaying passwords
  -w[ait] <seconds>                              set timeout waiting for finishing operations
  -v[ersion]                                     show program version
  -h[elp]                                        print this help

OBJECT
  g[eneral]       NetworkManager's general status and operations
  n[etworking]    overall networking control
  r[adio]         NetworkManager radio switches
  c[onnection]    NetworkManager's connections
  d[evice]        devices managed by NetworkManager
  a[gent]         NetworkManager secret agent or polkit agent
  m[onitor]       monitor NetworkManager changes




## general

Usage: nmcli general { COMMAND | help }

COMMAND := { status | hostname | permissions | logging }

  status

  ```
  STATE      CONNECTIVITY  WIFI-HW  WIFI     WWAN-HW  WWAN     
  connected  full          enabled  enabled  enabled  disabled 
  ```

  hostname [<hostname>]
  ```
  debian

  nmcli general hostname 新的主机名
  ```

  permissions
  ```
  PERMISSION                                                        VALUE 
  org.freedesktop.NetworkManager.enable-disable-network             yes   
  org.freedesktop.NetworkManager.enable-disable-wifi                yes   
  org.freedesktop.NetworkManager.enable-disable-wwan                yes   
  org.freedesktop.NetworkManager.enable-disable-wimax               yes   
  org.freedesktop.NetworkManager.sleep-wake                         yes   
  org.freedesktop.NetworkManager.network-control                    yes   
  org.freedesktop.NetworkManager.wifi.share.protected               yes   
  org.freedesktop.NetworkManager.wifi.share.open                    yes   
  org.freedesktop.NetworkManager.settings.modify.system             yes   
  org.freedesktop.NetworkManager.settings.modify.own                yes   
  org.freedesktop.NetworkManager.settings.modify.hostname           yes   
  org.freedesktop.NetworkManager.settings.modify.global-dns         yes   
  org.freedesktop.NetworkManager.reload                             yes   
  org.freedesktop.NetworkManager.checkpoint-rollback                yes   
  org.freedesktop.NetworkManager.enable-disable-statistics          yes   
  org.freedesktop.NetworkManager.enable-disable-connectivity-check  yes   

  ```

  logging [level <log level>] [domains <log domains>]
  ```
  LEVEL  DOMAINS                                                                                                                                                                                                                       
  INFO   PLATFORM,RFKILL,ETHER,WIFI,BT,MB,DHCP4,DHCP6,PPP,IP4,IP6,AUTOIP4,DNS,VPN,SHARING,SUPPLICANT,AGENTS,SETTINGS,SUSPEND,CORE,DEVICE,OLPC,INFINIBAND,FIREWALL,ADSL,BOND,VLAN,BRIDGE,TEAM,CONCHECK,DCB,DISPATCH,AUDIT,SYSTEMD,PROXY 
  
  ```

## networking

Usage: nmcli networking { COMMAND | help }

COMMAND := { [ on | off | connectivity ] }

  on

  off

  connectivity [check]      //双工? 输出 full


## device        devices managed by NetworkManager

Usage: nmcli device { COMMAND | help }

COMMAND := { status | show | set | connect | reapply | modify | disconnect | delete | monitor | wifi | lldp }

  status    //默认
  ```
  DEVICE     TYPE      STATE        CONNECTION 
  wlp4s0     wifi      connected    HJIMI-A    
  enp0s31f6  ethernet  unavailable  --         
  docker0    bridge    unmanaged    --         
  lo         loopback  unmanaged    --         
  ```

  show [<ifname>]   //网卡名称
  ```
  GENERAL.DEVICE:                         wlp4s0
  GENERAL.TYPE:                           wifi
  GENERAL.HWADDR:                         1C:1B:B5:10:A8:38
  GENERAL.MTU:                            1500
  GENERAL.STATE:                          100 (connected)
  GENERAL.CONNECTION:                     HJIMI-A
  GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveConnection/7
  IP4.ADDRESS[1]:                         172.16.21.4/24
  IP4.GATEWAY:                            172.16.21.254
  IP4.ROUTE[1]:                           dst = 0.0.0.0/0, nh = 172.16.21.254, mt = 600
  IP4.ROUTE[2]:                           dst = 172.16.21.0/24, nh = 0.0.0.0, mt = 600
  IP4.ROUTE[3]:                           dst = 169.254.0.0/16, nh = 0.0.0.0, mt = 1000
  IP4.DNS[1]:                             202.106.0.20
  IP4.DNS[2]:                             202.106.196.115
  IP6.ADDRESS[1]:                         fe80::1af8:c418:2797:3347/64
  IP6.GATEWAY:                            --
  IP6.ROUTE[1]:                           dst = fe80::/64, nh = ::, mt = 600
  IP6.ROUTE[2]:                           dst = ff00::/8, nh = ::, mt = 256, table=255
  ```

  set [ifname] <ifname> [autoconnect yes|no] [managed yes|no]

  connect <ifname>

  reapply <ifname>

  modify <ifname> ([+|-]<setting>.<property> <value>)+

  disconnect <ifname> ...

  delete <ifname> ...
    Usage: nmcli device delete { ARGUMENTS | help }

    ARGUMENTS := <ifname> ...

    Delete the software devices.
    The command removes the interfaces. It only works for software devices
    (like bonds, bridges, etc.). Hardware devices cannot be deleted by the
    command.


  monitor <ifname> ...

  wifi [list [ifname <ifname>] [bssid <BSSID>]]

  wifi connect <(B)SSID> [password <password>] [wep-key-type key|phrase] [ifname <ifname>]
                         [bssid <BSSID>] [name <name>] [private yes|no] [hidden yes|no]

  wifi hotspot [ifname <ifname>] [con-name <name>] [ssid <SSID>] [band a|bg] [channel <channel>] [password <password>]

  wifi rescan [ifname <ifname>] [[ssid <SSID to scan>] ...]

  lldp [list [ifname <ifname>]]


## radio         NetworkManager radio switches



## connection    NetworkManager's connections

Usage: nmcli connection { COMMAND | help }

COMMAND := { show | up | down | add | modify | clone | edit | delete | monitor | reload | load | import | export }

  show [--active] [--order <order spec>]
  show [--active] [id | uuid | path | apath] <ID> ...

  up [[id | uuid | path] <ID>] [ifname <ifname>] [ap <BSSID>] [passwd-file <file with passwords>]

  down [id | uuid | path | apath] <ID> ...

  add COMMON_OPTIONS TYPE_SPECIFIC_OPTIONS SLAVE_OPTIONS IP_OPTIONS [-- ([+|-]<setting>.<property> <value>)+]

  modify [--temporary] [id | uuid | path] <ID> ([+|-]<setting>.<property> <value>)+

  clone [--temporary] [id | uuid | path ] <ID> <new name>

  edit [id | uuid | path] <ID>
  edit [type <new_con_type>] [con-name <new_con_name>]

  delete [id | uuid | path] <ID>

  monitor [id | uuid | path] <ID> ...

  reload

  load <filename> [ <filename>... ]

  import [--temporary] type <type> file <file to import>

  export [id | uuid | path] <ID> [<output file>]


### nmcli connection add

Usage: nmcli connection add { ARGUMENTS | help }

ARGUMENTS := COMMON_OPTIONS TYPE_SPECIFIC_OPTIONS SLAVE_OPTIONS IP_OPTIONS [-- ([+|-]<setting>.<property> <value>)+]

  COMMON_OPTIONS:
                  type <type>
                  ifname <interface name> | "*"
                  [con-name <connection name>]
                  [autoconnect yes|no]
                  [save yes|no]
                  [master <master (ifname, or connection UUID or name)>]
                  [slave-type <master connection type>]

  TYPE_SPECIFIC_OPTIONS:
    ethernet:     [mac <MAC address>]
                  [cloned-mac <cloned MAC address>]
                  [mtu <MTU>]

    wifi:         ssid <SSID>
                  [mac <MAC address>]
                  [cloned-mac <cloned MAC address>]
                  [mtu <MTU>]
                  [mode infrastructure|ap|adhoc]

    wimax:        [mac <MAC address>]
                  [nsp <NSP>]

    pppoe:        username <PPPoE username>
                  [password <PPPoE password>]
                  [service <PPPoE service name>]
                  [mtu <MTU>]
                  [mac <MAC address>]

    gsm:          apn <APN>
                  [user <username>]
                  [password <password>]

    cdma:         [user <username>]
                  [password <password>]

    infiniband:   [mac <MAC address>]
                  [mtu <MTU>]
                  [transport-mode datagram | connected]
                  [parent <ifname>]
                  [p-key <IPoIB P_Key>]

    bluetooth:    [addr <bluetooth address>]
                  [bt-type panu|nap|dun-gsm|dun-cdma]

    vlan:         dev <parent device (connection UUID, ifname, or MAC)>
                  id <VLAN ID>
                  [flags <VLAN flags>]
                  [ingress <ingress priority mapping>]
                  [egress <egress priority mapping>]
                  [mtu <MTU>]

    bond:         [mode balance-rr (0) | active-backup (1) | balance-xor (2) | broadcast (3) |
                        802.3ad    (4) | balance-tlb   (5) | balance-alb (6)]
                  [primary <ifname>]
                  [miimon <num>]
                  [downdelay <num>]
                  [updelay <num>]
                  [arp-interval <num>]
                  [arp-ip-target <num>]
                  [lacp-rate slow (0) | fast (1)]

    bond-slave:   master <master (ifname, or connection UUID or name)>

    team:         [config <file>|<raw JSON data>]

    team-slave:   master <master (ifname, or connection UUID or name)>
                  [config <file>|<raw JSON data>]

    bridge:       [stp yes|no]
                  [priority <num>]
                  [forward-delay <2-30>]
                  [hello-time <1-10>]
                  [max-age <6-40>]
                  [ageing-time <0-1000000>]
                  [multicast-snooping yes|no]
                  [mac <MAC address>]

    bridge-slave: master <master (ifname, or connection UUID or name)>
                  [priority <0-63>]
                  [path-cost <1-65535>]
                  [hairpin yes|no]

    vpn:          vpn-type vpnc|openvpn|pptp|openconnect|openswan|libreswan|ssh|l2tp|iodine|...
                  [user <username>]

    olpc-mesh:    ssid <SSID>
                  [channel <1-13>]
                  [dhcp-anycast <MAC address>]

    adsl:         username <username>
                  protocol pppoa|pppoe|ipoatm
                  [password <password>]
                  [encapsulation vcmux|llc]

    tun:          mode tun|tap
                  [owner <UID>]
                  [group <GID>]
                  [pi yes|no]
                  [vnet-hdr yes|no]
                  [multi-queue yes|no]

    ip-tunnel:    mode ipip|gre|sit|isatap|vti|ip6ip6|ipip6|ip6gre|vti6
                  remote <remote endpoint IP>
                  [local <local endpoint IP>]
                  [dev <parent device (ifname or connection UUID)>]

    macsec:       dev <parent device (connection UUID, ifname, or MAC)>
                  mode <psk|eap>
                  [cak <key> ckn <key>]
                  [encrypt yes|no]
                  [port 1-65534]


    macvlan:      dev <parent device (connection UUID, ifname, or MAC)>
                  mode vepa|bridge|private|passthru|source
                  [tap yes|no]

    vxlan:        id <VXLAN ID>
                  remote <IP of multicast group or remote address>
                  [local <source IP>]
                  [dev <parent device (ifname or connection UUID)>]
                  [source-port-min <0-65535>]
                  [source-port-max <0-65535>]
                  [destination-port <0-65535>]

    wpan:         [short-addr <0x0000-0xffff>]

                  [pan-id <0x0000-0xffff>]

                  [mac <MAC address>]

    6lowpan:      dev <parent device (connection UUID, ifname, or MAC)>
    dummy:

  SLAVE_OPTIONS:
    bridge:       [priority <0-63>]
                  [path-cost <1-65535>]
                  [hairpin yes|no]

    team:         [config <file>|<raw JSON data>]

  IP_OPTIONS:
                  [ip4 <IPv4 address>] [gw4 <IPv4 gateway>]
                  [ip6 <IPv6 address>] [gw6 <IPv6 gateway>]



nmcli connection add con-name static-hbsi ifname ens224 type ethernet ipv4.method manual ipv4.addresses 192.168.0.1/24 ipv4.gateway 192.168.0.2

## agent         NetworkManager secret agent or polkit agent
## monitor       monitor NetworkManager changes
