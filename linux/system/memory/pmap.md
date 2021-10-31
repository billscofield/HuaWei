
## pmap

report memory map of a process

SYNOPSIS

    pmap [options] pid [...]


total 还可以通过 /proc/[pid]/smaps 计算得到

    total=$(cat /proc/[pid]/smaps | grep -E "^Res" | awk '{sum +=$2}END{print sum}');


