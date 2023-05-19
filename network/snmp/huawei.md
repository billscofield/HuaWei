# HUAWEI SNMP

```
# 使能snmp服务
snmp-agent

# 设置读团体名:public
# 如果团体值不符合复杂程度，如 public, 会报错:Error: Wrong parameter found at '^' position.
snmp-agent community read public

# 设置写团体名:private
snmp-agent community write private

# 设置联系方式
snmp-agent sys-info contact Mr.Deng-Tel:161

# 设置设备位置
snmp-agent sys-info location sjhl-3f-a1-k01-12U

# 配置snmp版本允许V1（默认只允许v3）
snmp-agent sys-info version v1 v3

# 允许向网管工作站（NMS）10.1.1.2 发送Trap报文，使用的团体名为public
snmp-agent target-host trap address udp-domain 10.1.1.2  params securityname public

# 允许向网管工作站（NMS）10.1.1.2 发送inform报文，使用的团体名为public
snmp-agent target-host inform address udp-domain 10.1.1.2 params securityname public v2c


# 验证配置结果
display snmp-agent sys-info version

# 查看告警的目标主机。
display snmp-agent target-host
```
