标准输入指的是键盘

< 将文件内容作为另一个程序的标准输入
    grep passwd < file.txt
    wall < 文件名

$TERM   screen-256color
$LANG
$PS1
    \W  当前目录名
    \w  绝对路径名
$PS2
    次一级的输出提示符，如 telnet
$MAIL
    如 /var/mail/root



echo $MAIL
echo ${MAIL}



man bash

查询是否为 bash 的内置命令(外部命令: 其他非 bash 所提供的命令)
    type 命令


## 自定义变量
变量名=变量值

将某个变量设为只读
    readonly 变量

    在变量赋值后使用    
        
    在变量赋值前使用    
        有卵用啊，都不能赋值了

需要其他额外的命令提供信息时
    1. `date +%Y`
    1. $(date +%Y)

    ```
    work="/root/git/imi/a/b/c/d/"
    cd $work

    ```

## 注销
exit 或 logout

## mesg
允许接收 write 否
mesg n
mesg y
mesg



who am i 比 whoami 多显示终端名称和登录时间
whoami 只显示谁

```
字符串匹配
find . -name "s*[!'e']"

test -d /etc/passwd && echo 'yes'
test -d /etc/passwd || echo 'not a directory'

T型管道
ip a | tee ip.txt | grep ens

$? 0True 1False 2错误
```

## 关于 && ||  \& -a -o !
貌似 && || 用在命令行中,而 -a -o ! 用在 shell script 中???

```

```
## expr





## 变量内容的删除、取代和替换
### 删除
1. 从左到右 懒惰

    ```
    ${变量#起始字符*终止字符} [,]
    ${path#/*bin:}
    ```

1. 从左到右 贪婪

    ```
    ${变量##起始字符*终止字符} [,]
    ${path##*bin}
    ```
1. 从右至左 懒惰

    ```
    ${变量%起始字符*终止字符} [,]
    ${path%/*bin:}
    ```
1. 从右到左 贪婪

    ```
    ${变量%%起始字符*终止字符} [,]
    ${path%%*bin}
    ```

起始字符串左边
终止字符串右边

### 替换
${变量/旧字符串/新字符串}   第一个
${变量//字符串/新字符串}    全部



变量的测试
vara=${变量-默认值}
    如果变量没有设置，则输出 默认值
    如果变量 设置过, 比如 name=
        echo ${name-hello} 不会有输出，因为name设置过了

vara=${变量:-默认值}
    变量为空 或者未设置，都会以默认值显示

vara=${变量=默认值}
    变量也被改变了

vara=${变量?未设置提示} 仅当变量未设置时，进行提示, 为空时，不提示



/etc/issue
    man issue
    登录前的信息

/etc/motd
    登录后的信息


stdin   0>
stdout  1>
stderr  2>
stdout+stderr &>
