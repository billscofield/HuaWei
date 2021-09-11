#!/usr/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-09-09
# Description:	

#!/bin/bash

gitlab_home='/opt/docker/gitlab/'

docker run \
    -itd  \
    -p 9980:9980 \
    -p 9922:9922 \
    -v ${gitlab_home}'etc':/etc/gitlab  \
    -v ${gitlab_home}'log':/var/log/gitlab \
    -v ${gitlab_home}'var/opt':/var/opt/gitlab \
    --restart always \
    --privileged=true \
    --name gitlab.lca \
    gitlab/gitlab-ce:latest

