if [ $# -ne 1 ];then
    echo "Follow the script name with an argument"
fi

case $1 in

    rrqm)
        iostat -dxk |grep -w sda |tail -1 |awk '{print $2}'
        ;;

    wrqm)
        iostat -dxk |grep -w sda |tail -1 |awk '{print $3}'
        ;;

    rps)
        iostat -dxk |grep -w sda |tail -1 |awk '{print $4}'
        ;;

    wps)
        iostat -dxk |grep -w sda |tail -1 |awk '{print $5}'
        ;;

    rKBps)
        iostat -dxk |grep -w sda |tail -1 |awk '{print $6}'
        ;;

    wKBps)
        iostat -dxk |grep -w sda |tail -1 |awk '{print $7}'
        ;;

    avgrq-sz)
        iostat -dxk |grep -w sda | tail -1  |awk '{print $8}'
        ;;

    avgqu-sz)
        iostat -dxk |grep -w sda |tail -1  |awk '{print $9}'
        ;;

    await)
        iostat -dxk |grep -w sda|tail -1 |awk '{print $10}'
        ;;

    svctm)
        iostat -dxk |grep -w sda |tail -1 |awk '{print $13}'
        ;;

    util)
        iostat -dxk |grep -w sda |tail -1 |awk '{print $14}'
        ;;

    *)
        echo -e "\e[033mUsage: sh $0 [rrqm|wrqm|rps|wps|rKBps|wKBps|avgqu-sz|avgrq-sz|await|svctm|util]\e[0m"
esac
