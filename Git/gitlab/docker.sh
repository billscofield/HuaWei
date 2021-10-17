#!/usr/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-09-09
# Description:	

#!/bin/bash

gitlab_home='/opt/docker/gitlab/'

docker run \
    -itd  \
    -p 19443:443 \
    -p 1980:1980 \
    -p 1922:1922 \
    -v ${gitlab_home}'etc':/etc/gitlab  \
    -v ${gitlab_home}'log':/var/log/gitlab \
    -v ${gitlab_home}'var/opt':/var/opt/gitlab \
    --restart always \
    --privileged=true \
    --name gitlab.lca \
    gitlab/gitlab-ce:latest


# gitlab-ce-14初装以后，把密码放在了一个临时文件中了 /etc/gitlab/initial_root_password
# 网页登陆用户名 root
# 这个文件将在首次执行reconfigure后24小时自动删除

# external_url 'http://192.168.61.110:1980' 这个是docker 内部的监听端口
# gitlab_rails['gitlab_ssh_host'] = '192.168.61.110'
# gitlab_rails['gitlab_shell_ssh_port'] = 1922, 这个端口好像是外部的

# gitlab-ctl recofigure
# gitlab-ctl restart

# 这样用 ssh 还是不行的，需要更改 ssh 端口为 1922
