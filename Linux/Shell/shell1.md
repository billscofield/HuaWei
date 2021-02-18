
## 变量

自定义变量
系统环境变量
位置参数变量
预先定义变量
内置变量
    continue、break、exit

### 条件判断

if else

### 循环语句

for、while


### 流程控制

case

### 函数

function

### 数组 array

### 正则表达式


### 案例


## bash 特性

tab补全

history

alias/unalias

常用快捷键

前后台作业控制
    bg fg jobs tmux screen


输入输出重定向

    >, >>, 1>, 2>>, &>, cat <

    cat < /etc/services > a.sql


管道 | tee

命令排序

    ;   没有逻辑关系
    &&  前者成功才执行后者
    ||  前面不成功才执行后者

shell 通配符

    - * 匹配任意多个字符
    ?   匹配任意一个字符
    []  匹配括号中的任意一个字符a-z,0-9,A-Z,a,Z
    ()  在子shell中执行
    {}  集合 touch file{1..9}
    \   转义符

echo 输出颜色

printf 格式化输出
