## 1. ethtool

使用 ethtool 命令检查网络接口速度
    
    ethtool eth0 | grep "Speed:"

## 2. ip

检查特定的网络接口的 MAC 地址：

    ip link show enp0s25 | awk '/link/{print $2}'

获取多个网络接口的 MAC 地址：
    ```
    ip a |awk '/state UP/{print $2}' | sed 's/://' | while read output;do  echo $output;  ethtool -P $output; done
    ```

