
## router


copy running-config startup-config




### 命令

更改mac地址

```
conf t 
int f0/0
mac-address 1.1.1
do sh run inter f0/0            //do show running-config interface f0/0


普通模式下直接 show running-config int f0/0
其他模式下均要加上 do   : do show running-config int f0/0
```
