#!/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-02-19
# Description:	

declare -A sh_type

while read line;do
    sh_type_name=$( echo $line | awk -F: '{print $NF}')
    let sh_type[$sh_type_name]++
done < /etc/passwd

#echo ${sh_type[@]}

for i in ${!sh_type[@]};do
    echo "$i : ${sh_type[$i]}"
done


#--------------------------------

# cat /etc/passwd | awk -F: '{print $NF}' | sort | uniq -c
