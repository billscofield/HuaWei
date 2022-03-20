
## PHP (Hypertext Preprocessor)


apt install php7.3

apt install php7.3-dev
    安装了php-devel以后就会有phpize和php-config这两个脚本


## phpize

apt-get install php7.3-dev




## xdebug

apt install php-xdebug

或者

git clone 

phpize
    输出:
    Configuring for:
    PHP Api Version:         20200930
    Zend Module Api No:      20200930
    Zend Extension Api No:   420200930
    config.m4:12: warning: file `build/pkg.m4' included several times
    config.m4:12: warning: file `build/pkg.m4' included several times

./configure

make

make install

会复制 moudles/xdebug.so 到 /usr/lib/php/201XXX/

/etc/php/7.3/cli/php.ini 中添加
    [XDebug]
    zend_extension=/usr/lib/php/20180731/xdebug.so
    xdebug.remote_autostart=1
    xdebug.remote_host=localhost
    xdebug.remote_port=8000
    xdebug.remote_enable=1



之前失败的原因是有多个php, 解决方法就是只剩下一个，其他的全部卸载

    apt remove --purge php8.0
        发现 php8.0 -v  还是可以用, 
    apt purge php8.0-common


php -m | grep 


### how to remove php

https://askubuntu.com/questions/768737/how-to-remove-php-5-6



## 


## 

php -v
    输出:
    Xdebug requires Zend Engine API version 420200930.
    The Zend Engine API version 320180731 which is installed, is outdated.


vi /var/www/html/a.php

<?php
    phpinfo();
?>



## 

### include 和 require 的区别

require 一般放在 PHP 文件的最前面，程序在执行前就会先导入要引用的文件；
include 一般放在程序的流程控制中，当程序执行时碰到才会引用，简化程序的执行流程。

require 引入的文件有错误时，执行会中断，并返回一个致命错误；
include 引入的文件有错误时，会继续执行，并返回一个警告。

include会尝试着去包含，如果包含不到，会提示警告错误，但是不会影响当前自身脚本的执行；
require一定会去包含文件，而且包含的文件必须不能出错，否则会终止当前自身脚本的执行



关于包含文件后作用域问题总结如下：

    1. 所有在被包含文件中定义的函数和类在被包含后，在包含文件里都具有全局作用域

    2. 被包含文件的变量的作用域，随着包含位置的变化而变化。比如如果是在函数中包
       含，被包含文件的变量是局部变量



## php中，函数内引用函数外的变量三种方法：

1.函数外global声明，函数内使用$GLOBALS数组引用。

2.函数内global声明，函数内$GLOBALS数组或者直接引用。

3.在调用函数的时候用一个参数传递。



```
1.在外部用global定义直接输出：

global $mytext;

$mytext=”nihao”;

function chao_echo(){

echo $mytext;

}

chao_echo();

结果：没有输出。


2.用GLOBALS数组输出：

global $mytext;

$mytext=”nihao”;

function chao_echo(){

echo $GLOBALS['mytext'];

}

chao_echo();

结果：输出正常。


3.在函数内全局申明函数外的变量：

$mytext=”nihao”;

function chao_echo(){

global $mytext;

echo $mytext;

echo $GLOBALS['mytext'];


}

chao_echo();
结果：直接输出或者用GLOBALS全局数组输出都行。


4.将函数外部变量用参数传递进去：

$mytext=”nihao”;

function chao_echo($mytext){
    echo $mytext;
}

chao_echo($mytext);

结果：可以输出。
```




## 文件包含

项目中要注意不要使用相对路径来做脚本的嵌套包含，嵌套包含应该采用绝对路径的形式去包含。



包含文件时的路径其实有三种选择。

分别是

一 绝对路径                                      例：/aaa/bbb/ccc/c.php
    无论写这条语句的php文件是否被其他文件所包含，dirname(__FILE__)都总是指向写这条语句的php文件所在的绝对路径。

二 相对路径（当前目录使用./）           例：./ccc/c.php
    相对路径的基准目录就是程序执行的入口文件所在的目录，不管包含嵌套多少层。

    a include ./b/b.php
        b.php include ./c/c.php
        
    最终结果是:
        a/b/b.php
        a/c/c.php

三 相对路径（当前目录不使用./）       例：ccc/c.php

    分两步处理，首先以程序入口文件所在目录为基准沿相对路径来寻找，找到存在的文件则包含成功退出
    。如果找不到，则走第二步处理。即在写require语句的php文件所在目录来和require中包含的路径进行拼接，还是以入口
    文件所在目录为基准，沿这个拼接得到的相对路径来搜寻，文件存在则包含成功，否则表示被包含文件不存在。


    看例子理解比较容易。
    例：  

    作为入口文件的a.php： require './b/b.php';

    b.php： require 'c/c.php';  //请注意这里包含c目录时没有使用./  

    那么，首先会在入口文件a.php所在的目录下搜寻c/c.php，如果有，则包含成功。

    如果没找到，接下来就将b.php的所在路径(./b/b.php)和b.php中require的路径（c/c.php）进行拼接，得到拼接后的相对路径./b/c/c.php。在入口文件a.php所在的目录下搜寻./b/c/c.php，存在就包含成功，否则即出错。





https://blog.csdn.net/xiaoxiaodongxie/article/details/51828471
