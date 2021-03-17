

find . -perm /040
    权限有一个符合的即可, / 代表或

find . -perm 040
    精确

find .. -print0
    -print0   以空(NULL)分开所有结果

    默认的是空格分隔

    'a b.log'
    find . *.log | xargs rm -f    会报错

    find . *.log -print0 | xargs rm -f    
