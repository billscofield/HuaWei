#!/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-02-19
# Description:	

FILE=/etc/passwda

function Calrows(){
    local i=0
    while read line;do
        let i++
    done < $FILE

    echo "There are $i rows in the file $FILE"
}

if [ ! -f $FILE ];then
    echo  "$FILE 不存在"

else
    Calrows
fi


