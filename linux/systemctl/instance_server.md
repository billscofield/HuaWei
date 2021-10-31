

## 脚本文件


```/var/systemliujiao.sh
#!/bin/bash

echo $$ >> /var/run/liujiao.pid

while true
do
echo $(date +"%F %T") >> /var/systemliujiao
sleep 1
done
```


## service 文件

```
[Unit]
Description=liujiao's systemctl instance

[Service]
Type=Simple                                     
PIDFile=/var/run/liujiao.pid                    # 这个写在 /var/systemliujiao.sh 脚本里边了
ExecStart=/usr/bin/bash /var/systemliujiao.sh   # 最简单的只要有这个就行了
ExecStop=/usr/bin/kill -s TERM $MAINPID


[Install]
WantedBy=Multi-user.target
```



systemctl daemon-reload
systemctl status liujiao.service
systemctl start  liujiao.service

