#!/usr/bin/env bash
# Author: Bill Scofield
# Ctime : 2021-12-09
# Description:	

target_path="/lca/mirrors/rhel/"

epel7_path="${target_path}epel/7/x86_64/"

base_path="${target_path}centos/7/"
extras_path="${target_path}centos/7/extras/x86_64/"
updates_path="${target_path}centos/7/updates/x86_64/"



#rsync -vrt --bwlimit=3000 --exclude=debug/ rsync://rsync.mirrors.ustc.edu.cn/epel/7/x86_64/ $epel7_path

#rsync -vrt --bwlimit=2048 rsync://rsync.mirrors.ustc.edu.cn/repo/debian /lca/mirrors/
#rsync -vrt --bwlimit=20480 rsync://rsync.mirrors.ustc.edu.cn/repo/debian /lca/mirrors/
#rsync -vrt --bwlimit=10240 mirrors.tuna.tsinghua.edu.cn::debian /lca/


#rsync -vrt --bwlimit=20480 rsync://rsync.mirrors.ustc.edu.cn/repo/debian /lca/mirrors/

# 这个可能是软连接
#rsync -vrt  rsync://rsync.mirrors.ustc.edu.cn/repo/debian/dists/Debian11.2 /lca/mirrors/debian/dists/

#rsync -vrt  rsync://rsync.mirrors.ustc.edu.cn/repo/debian/dists/bullseye /lca/mirrors/debian/dists/


rsync -vrt  --bwlimit=2048 rsync://rsync.mirrors.ustc.edu.cn/repo/debian/pool /lca/mirrors/debian/


rsync --list-only mirrors.tuna.tsinghua.edu.cn::centos/7/os/x86_64

# [link](https://blog.csdn.net/zdl244/article/details/108547089)


