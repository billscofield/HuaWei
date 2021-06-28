#!/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-02-19
# Description:	

set `seq 10`

sum=0

for i in $*;do
    let sum+=$i
done

echo $sum
