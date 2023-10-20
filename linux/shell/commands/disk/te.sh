#! /usr/bin/env bash
# Script: te.sh
# Author: Bill Scofield
# Email: billscofield@hotmail.com
# Date: 2023-10-20
#
SCRIPT_NAME=$(basename $(readlink -f $0))

#echo $1


DollarOne=${1:-"/opt/${SCRIPT_NAME}"}

echo $DollarOne
