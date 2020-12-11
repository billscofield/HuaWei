

## 添加摄像头

通道管理 


## 摄像头密码重设



## NVR密码重设



acl number 3000
rule 1 permit ip destination 10.0.0.253 0
rule 5 permit ip destination 10.0.0.8 0
rule 10 permit ip destination 10.0.0.250 0
rule 15 permit udp destination 192.168.10.131 0 destination-port range bootps bootpc
rule 20 deny ip destination 10.0.0.0 0.0.1.255
rule 25 deny ip destination 192.168.10.0 0.0.0.255

traffic-filter vlan 172 inbound acl 3000


