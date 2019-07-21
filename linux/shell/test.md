需要配合 $? 看

## 文件判断

-d  目录
-f  普通文件
-s  如果文件存在且至少有一个字符则为真
-e  是否存在
-r  文件存在且设置了读权限
-w  文件存在且设置了写权限, 对应的用户看到对应的结果
-x  文件存在且设置了执行权限

```
cd /bin
if test -e ./bash
then
    echo '文件已存在!'
else
    echo '文件不存在!'
fi


另外，Shell还提供了与( -a  )、或( -o  )、非( !  )三个逻辑操作符用于将测试条件连接起来，其优先级为："!"最高，"-a"次之，"-o"最低。例如：

cd /bin
if test -e ./notFile -o -e ./bash
then
    echo '至少有一个文件存在!'
else
    echo '两个文件都不存在'
fi
```

## 整数判断
-eq 等于则为真
-ne 不等于则为真
-gt 大于则为真
-ge 大于等于则为真
-lt 小于则为真
-le 小于等于则为真

```
num1=100
num2=100
if test $[num1] -eq $[num2]
then
    echo '两个数相等！'
else
    echo '两个数不相等！'
fi




代码中的 [] 执行基本的算数运算，如：

#!/bin/bash

a=5
b=6

result=$[a+b]
result=$[ a + b ] 也对

echo "result 为： $result"
```

## 字符串判断
=   等于则为真
!=  不相等则为真
-z 字符串   字符串的长度为零则为真
-n 字符串   字符串的长度不为零则为真

```
num1="ru1noob"
num2="runoob"
if test $num1 = $num2
then
    echo '两个字符串相等!'
else
    echo '两个字符串不相等!'
fi
```

## bash shell中[[ ]]与[ ]的区别

请使用 bash, zsh 或其他的 shell 不完全一样

[] 和 test 是一样的


