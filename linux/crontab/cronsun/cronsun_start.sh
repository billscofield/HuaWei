#! /usr/bin/env bash
# Script: cronsun_start.sh
# Author: Liu Jiao
# Email: liujiao@lightchaseranimation.com
# Date: 2023-08-08
#

SCRIPT_PATH=$(dirname $(readlink -f $0))

# 1. mongodb
# db.createUser({user:"admin", pwd:"Db0AdMiN1!", roles:[{role:"root", db:"admin"}]})
systemctl restart mongodb

# 2. etcd
${SCRIPT_PATH}/etcd-v3.5.9-linux-amd64/etcd --listen-client-urls 'http://0.0.0.0:2379' --quota-backend-bytes=10240000000 --advertise-client-urls http://0.0.0.0:2379

# 3. cronweb
${SCRIPT_PATH}/cronsun-v0.3.5/cronweb -conf ${SCRIPT_PATH}/cronsun-v0.3.5/conf/base.json
