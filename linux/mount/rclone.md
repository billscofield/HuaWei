
# 在Debian/Ubuntu上使用rclone挂载Google Drive网盘

## 1.安装


安装rclone依赖fuse

    Debian/Ubantu
        apt-get update && apt-get install -y fuse

    CentOS
        yum install -y fuse


To install rclone on Linux/macOS/BSD systems, run:

    curl https://rclone.org/install.sh | sudo bash

For beta installation, run:

    curl https://rclone.org/install.sh | sudo bash -s beta

Note that this script checks the version of rclone installed first and won't
re-download if not needed.


## 2. 设置rclone配置文件

./rclone config

```
Google Application Client Id
Setting your own is recommended.
See https://rclone.org/drive/#making-your-own-client-id for how to create your own.
If you leave this blank, it will use an internal key which is low performance.
Enter a string value. Press Enter for the default ("").
client_id>  #留空


Google Application Client Secret
Setting your own is recommended.
Enter a string value. Press Enter for the default ("").
client_secret>   #留空


Scope that rclone should use when requesting access from drive.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
 1 / Full access all files, excluding Application Data Folder.
    \ "drive"


ID of the root folder
Leave blank normally.


Edit advanced config? (y/n)
    #输入n


Configure this as a team drive?
    n


```


## 3. 挂载指令

1. ./rclone mount "添加时云盘名称":"云盘指定目录" "挂载至本地的目录" [--添加参
   数]

2. --allow-other：允许非当前 rclone 用户外其它用户进行访问

3. --attr-timeout 5m：文件属性缓存，（大小，修改时间等）的时间。如果 VPS 配置比
   较低，建议适当提高这个值，避免过多内核交互，降低资源占用。

4. --vfs-cache-mode full：开启 VFS 文件缓存，可减少 rclone 与 API 交互，同时可
   提高文件读写效率

5. --vfs-cache-max-age 24h：VFS 文件缓存时间，这里设置 24 小时，如果文件很少更
   改，建议设置更长时间

6. --vfs-cache-max-size 10G：VFS文件缓存上限大小，请根据服务器剩余磁盘自行调节

7. --vfs-read-chunk-size-limit 100M：分块读取大小，这里设置的是100M，可提高文件
   读的效率，比如1G的文件，大致分为10个块进行读取，但与此同时API请求次数也会增
   多

8. --buffer-size 100M：设置内存缓存，请根据服务器内存大小自行设置

9. --daemon：后台运行程序

案例

./rclone mount GoogleDrive:GoIndex /www/wwwroot/drive --copy-links --allow-other --allow-non-empty --umask 000 --attr-timeout 5m --vfs-cache-mode full --vfs-cache-max-age 3h --vfs-cache-max-size 30G --buffer-size 300M --daemon


rclone mount gdrive: /LCA/gdrive --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --umask 000



## 4. 设置开机自动挂载

1. 新建rclone.service文件
    vim /usr/lib/systemd/system/rclone.service

2. 写入内容

```
[Unit]
Description = rclone

[Service]
User = root
ExecStart = "此处自行填写挂载指令"
Restart = on-abort

[Install]
WantedBy = multi-user.target
```

3. 查看/更改状态

    重载daemon
        systemctl daemon-reload

    启动rclone
        systemctl start rclone

    设置开机启动
        systemctl enable rclone

    停止rclone
        systemctl stop rclone

    查看rclone运行状态
        systemctl status rclone

    查看挂载状况
        df -h

    取消挂载
        fusermount -qzu /GoogleDrive
