
## windows

openvpn 要满足一定的版本，否则可能不能使用


## Linux

https://askubuntu.com/questions/187511/how-can-i-use-a-ovpn-file-with-network-manager

### console/terminal

sudo apt-cache show openvpn

sudo apt-get install -y openvpn

sudo openvpn --config ./vpn-config.ovpn

---

sudo nmcli connection import type openvpn file /path/to/your.ovpn


### Desktop

First, install the OpenVPN Network Manager plugin:
