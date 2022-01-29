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

rsync -vrt --bwlimit=1024 rsync://rsync.mirrors.ustc.edu.cn/repo/centos /lca/mirrors/


