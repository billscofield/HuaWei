
## “区域”相关的环境变量
  简而言之，LANG、LC_TYPE等等都是环境变量，很多程序的运行行为在全球不同的地域、语言环境中是不一样的，例如date程序（命令）的行为就受LC_TIME的影响：

    ```
    $ LC_TIME=en_US.UTF-8 date
    Fri Oct 31 19:51:16 CST 2014
    $ LC_TIME=fi_FI.UTF-8 date
    pe 31.10.2014 19.52.00 +0800
    $ LC_TIME=zh_CN.UTF-8 date
    2014年 10月 31日 星期五 19:53:07 CST
    ```

通过在系统命令行中输入locale可以打印所有相关的环境变量以及对应的值，变量包括：

    ```
    1、语言符号及其分类(LC_CTYPE) 
    2、数字(LC_NUMERIC) 
    3、比较和排序习惯(LC_COLLATE) 
    4、时间显示格式(LC_TIME) 
    5、货币单位(LC_MONETARY) 
    6、信息主要是提示信息,错误信息,状态信息,标题,标签,按钮和菜单等(LC_MESSAGES) 
    7、姓名书写方式(LC_NAME) 
    8、地址书写方式(LC_ADDRESS) 
    9、电话号码书写方式(LC_TELEPHONE) 
    10、度量衡表达方式 (LC_MEASUREMENT) 
    11、默认纸张尺寸大小(LC_PAPER) 
    12、对locale自身包含信息的概述(LC_IDENTIFICATION)。
    ```

LANG，LANGUAGE和LC_ALL”，这三个比较特殊：

    ```
    1、 LANG是一个缺省值，所有没有显式设置值的LC_*变量都会取L
    2、 LANGUAGE的优先级比较高，会覆盖所有设置过的LC_*的值
    3、 LC_ALL并不是一个环境变量，而是一个glibc中定义的一个宏，LC_ALL=C这样的语法实际上是调用了setlocale把所有的LC_*的变量设置了一遍，所以在终端中直接echo $LC_TIME等可以输出对应变量的值，但是echo $LC_ALL，不好意思，啥都没有，因为它压根就不是一个变量。
    ```

从优先级的角度，变量生效的优先顺序从高到低如下：

    ```
    1、 LANGUAGE 优先级最高，指定个人对语言环境值的主次偏好，例如zh_CN:en_US:en，冒号分隔的是多种选择。
    2、 LC_ALL 设置的值
    3、 LC_* 可设定locale各方面（category）的值，可以覆盖LANG的值。
    4、 LANG 指定默认使用的locale值
    ```

## 如何设置这些环境变量
  locale认为只要语言、地域确定了，那么表示的格式和习惯也就确定了，所以这些变量的值实际上都是设置语言、地域的值。Linux中（Windows中格式不同）LC_*这些变量的值的格式是[language][_TERRITORY][.CODESET][@modifier]，例如LC_TIME=en_US.UTF-8，其中en代表为英语，US代表美国，使用的是UTF-8编码集。还有两个比较特殊的值是C和POSIX分别代表C标准和POSIX标准，这两种标准对于数据的显示方式、排序方式等都有各自的规定。modifier是修正符，有些地方会用到，例如：de_DE@euro使用的是欧洲的排序、比较和缩进习惯，而de_DE用的是德国的标准习惯，这是两套不同的标准。
  使用locale -a可以列出本机目前可以使用的值。locale -av还可以具体查看这些值更详细的信息。

## 修改方式

通过创建或编辑/etc/locale.conf来做系统级的设置
通过创建或编辑~/.config/locale.conf


export LC_TIME=xxxx可以在当前shell设置某个值
通过localectl命令来修改，比如localectl set-locale LANG=en_US.utf8，localectl是查询和设置区域和键盘布局的命令，其他用法此处不详述。

