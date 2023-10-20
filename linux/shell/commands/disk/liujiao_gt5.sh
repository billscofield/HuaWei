#! /usr/bin/env bash
# Script: liujiao_gt5.sh
# Author: Bill Scofield
# Email: billscofield@hotmail.com
# Date: 2023-10-20

SCRIPT_NAME=$(readlink -f $0)

if [ ! -d $1 ];then
    echo -e "\033[31m"
    echo -e "The path which to save log file is wrong or doesn't exist"
    echo "\033[0m"
    exit 1
fi

if [ ! -e $2 ];then
    echo -e "\033[31m"
    echo -e "The PATH to operate `du` is wrong or doesn't exist"
    echo "\033[0m"
    exit 1
fi

DATE=$(date +"%Y%m%d")
TIME=$(date +"%H%M%S")

# DollarOne is the location where to save the du log files
DollarOne=${1:-/opt/${SCRIPT_NAME}}

# DollarTwo is the name of location path which will be operated by du -akx
DollarTwo=$(echo $2 | sed --expression='s#/#_,#g')

#DATA_PATH=/opt/liujiao_gt5/${DollarTwo}
#DATA_PATH=${DollarOne}/${DollarTwo}
DATA_PATH=${DollarOne}
mkdir -p ${DATA_PATH}
echo -e "\033[31mLog file will be saved here:${DATA_PATH}\033[0m"

GT5=$(which gt5)

LOGFILE=${DollarTwo}.${DATE}-${TIME}
# 这里是真正的 du 路径
du -akx $2 >> ${DATA_PATH}/${LOGFILE}

NEWEST_LOGFILE=$(ls -t -1 ${DATA_PATH} | head -n1)
EARLIER_LOGFILE=$(ls -t -1 ${DATA_PATH} | head -n2 | tail -n1)

echo -e "\033[31mNewest file is  "${DATA_PATH}/${NEWEST_LOGFILE}
echo -e "Earlier file is "${DATA_PATH}/${EARLIER_LOGFILE}"\033[0m"


timeout --kill-after=4 3  ${GT5} ${DATA_PATH}/${NEWEST_LOGFILE}    ${DATA_PATH}/${EARLIER_LOGFILE}
exit
