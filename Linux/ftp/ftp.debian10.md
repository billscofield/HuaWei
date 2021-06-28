
## apt install vsftpd

```apt install vsftpd

Reading package lists... Done
Building dependency tree
Reading state information... Done
The following NEW packages will be installed:
  vsftpd
0 upgraded, 1 newly installed, 0 to remove and 158 not upgraded.
Need to get 147 kB of archives.
After this operation, 357 kB of additional disk space will be used.
Get:1 http://mirrors.tuna.tsinghua.edu.cn/debian buster/main arm64 vsftpd arm64 3.0.3-12 [147 kB]
Fetched 147 kB in 1s (109 kB/s)
Preconfiguring packages ...
Selecting previously unselected package vsftpd.
(Reading database ... 106516 files and directories currently installed.)
Preparing to unpack .../vsftpd_3.0.3-12_arm64.deb ...
Unpacking vsftpd (3.0.3-12) ...
Setting up vsftpd (3.0.3-12) ...
Created symlink /etc/systemd/system/multi-user.target.wants/vsftpd.service → /lib/systemd/system/vsftpd.service.
[vsftpd.conf:1] Line references path below legacy directory /var/run/, updating /var/run/vsftpd/empty → /run/vsftpd/empty; please update the tmpfiles.d/ drop-in file accordingly.
Processing triggers for man-db (2.8.5-2) ...
Processing triggers for systemd (241-7~deb10u4) ...
```


