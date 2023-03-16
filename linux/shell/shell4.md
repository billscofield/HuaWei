## yes

output a string repeatedly until killed

感觉很没用？其实它是很有用的,安装程序的时候，有的程序需要你不断地按y和回车，安
装进程才能继续工作。yes命令可以解救你！它帮你输入y和回车

```
yes | sh boring_installation.sh

```

如今，这个命令被放在 GNU coreutils 中，当前这个版本用了整整128行代码来完成这个
功能，你可以在github上找到它的源码：

    https: //github.com/coreutils/coreutils/blame/master/src/yes.c

已经过了25年，这个命令居然仍然在更新中！最近一次更新大概在一年前。它的效率非常
高

http://www.sohu.com/a/199363999_470018

## shell 选项标志

${-}

    当前shell的选项标志, 具体什么意思???

        569JNRXZghiklms
        
        i 代表交互式shell
        
        ```
        echo "---"
        echo ${-}   //输出hB
        echo "---"
        ```

登陆shell执行startup文件为：/etc/profile、~/.bash_profile、~/.bashrc（这里只是
从现象上得出的推论，这种推论是有问题的，稍后讨论），而非登陆shell执行的startup
文件仅为：~/.bashrc。

登录shell：是需要用户名、密码登录后才能进入的shell（或者通过--login”选项生成的shell）。

非登录shell：当然就不需要输入用户名和密码即可打开的Shell，例如：直接命令“bash”
就是打开一个新的非登录shell，在Gnome或KDE中打开一个“终端”（terminal）窗口程序也
是一个非登录shell。

执行exit命令，退出一个shell（登录或非登录shell）；
执行logout命令，退出登录shell（不能退出非登录shell）。

    ```
    交互式登录：(清除掉所有变量，通过文件重新读入)

    (1)直接通过终端输入账号密码登录
    (2)使用“su - UserName”切换的用户

    执行顺序：（影响该shell的配置文件）
    /etc/profile --> /etc/profile.d/*.sh --> ~/.bash_profile--> ~/.bashrc--> /etc/bashrc

    非交互式登录：（会继承上一个shell的全部变量）

    (1)su UserName
    (2)图形界面下打开的终端
    (3)执行脚本   （当我们执行脚本的时候.我们就已经进入到了一个子shell）
    (4)任何其它的bash实例

    执行顺序：（影响该shell的配置文件）
    ~/.bashrc--> /etc/bashrc--> /etc/profile.d/*.sh
    ```

su :switch user

/etc/sudoers

授权用户/组 主机=[(切换到哪些用户或组)] [是否需要输入密码验证] 命令1,命令2,...
who where pseudo['sjuːdəʊ]'] what

    where: ALL表示所有; 如果该字段不为ALL,表示授权用户只能在某些机器上登录本服
    务器来执行sudo命令

    what: 命令都是使用绝对路径, 这是为了避免目录下有同名命令被执行，从而造成安
    全隐患。如果你将授权写成如下安全性欠妥的格式:

        lucy ALL=(ALL) chown,chmod,useradd

    　　那么用户就有可能创建一个他自己的程序, 也命名为userad, 然后放在它的本地
    路径中, 如此一来他就能够使用root来执行这个"名为useradd的程序"。这是相当危险
    的!


    root ALL=(ALL) ALL

    当用户以"sudo passwd"或者"sudo passwd root"方式运行命令的时候，可以直接把
    root用户的密码改掉，这真是太危险了，必须要把这两条命令禁止调，在命令前面加
    上"!"来表示不可执行的命令

    root ALL=(ALL) !/usr/bin/passwd root,/bin/kill

    %组名 ALL=(ALL) ALL


系统文档推荐的做法，不是直接修改/etc/sudoers文件，而是将修改写在/etc/sudoers.d/
目录下的文件中。如果使用这种方式修改sudoers，需要在/etc/sudoers文件的最后行，加
上#includedir /etc/sudoers.d一行(默认已有):

    ```
    #includedir /etc/sudoers.d

    任何在/etc/sudoers.d/目录下，不以~号结尾的文件和不包含.号的文件，都会被解析
    成/etc/sudoers的内容。
    ```

通配符以及取消命令

    papi ALL=/usr/sbin/*,/sbin/*,!/usr/sbin/fdisk

## 输入密码时有反馈

　　当使用sudo后输入密码，并不会显示任何东西 —— 甚至连常规的星号都没有。有个办
法可以解决该问题。打开/etc/sudoers文件找到下述一行:

    Defaults env_reset
　　修改成:
    Defaults env_reset,pwfeedback

## 修改sudo会话时间

　　如果你经常使用sudo 命令，你肯定注意到过当你成功输入一次密码后，可以不用再输
入密码就可以运行几次sudo命令。但是一段时间后，sudo 命令会再次要求你输入密码。默
认是15分钟，该时间可以调整。添加timestamp_timeout=分钟数即可。时间以分钟为单位，
-1表示永不过期，但强烈不推荐。

　　比如我希望将时间延长到1小时，还是打开/etc/sudoers文件找到下述一行:

    Defaults env_reset
　　修改成:
    Defaults env_reset,pwfeedback,timestamp_timeout=60

    如果timestamp_timeout设置为0，sudo总是询问密码。

## 环境变量

sudo -E 
alias sudo='sudo -E'

/etc/sudoers 
    Default !env_reset

secure_path

当你使用sudo去执行一个程序时，处于安全的考虑，这个程序将在一个新的、最小化的环
境中执行，也就是说，诸如PATH这样的环境变量，在sudo命令下已经被重置成默认状态了。
所以当一个刚初始化的PATH变量中不包含你所要运行的程序所在的目录，用sudo去执行，
你就会得到"command not found"的错误提示。

要想改变PATH在sudo会话中的初始值，用文本编辑器打开/etc/sudoers文件，找到
"secure_path"一行，当你执行sudo 命令时，"secure_path"中包含的路径将被当做默认
PATH变量使用。

添加所需要的路径(如 /usr/local/bin）到"secure_path"下，在开篇所遇见的问题就将迎
刃而解。)这个修改会即刻生效

## defaults

Defaults    lecture=
    "always"
    "once"
    "never"
    为 sudo 用户提示命令用法

Defaults    env_reset
Defaults    mail_badpass
Defaults    secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
Defaults    logfile="/var/log/sudo.log"
Defaults    badpass_message="Password is wrong, please try again"
Defaults    passwd_tries=5
Defaults    insults 羞辱

警告: /etc/sudoers格式错误会导致sudo不可用
Defaults    log_input,log_output


## shell 配置文件加载

login shell

    ```perl
    /etc/profile
        /etc/bash.bashrc
        /etc/profile.d/*.sh
    ~/.profile
        ~/.bashrc
    ```

none login shell

    ```perl
    /etc/bash.bashrc
    ~/.bashrc
    ```

验证是否是login shell

    echo $0

输出结果有 "-"前导符的是login shell,例如 -bash,-zsh,-su
