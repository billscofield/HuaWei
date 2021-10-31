
## termux

### 常用变量

$HOME=/data/data/com.termux/files/home

$PREFIX=/data/data/com.termux/files/usr


### 更改键盘上的常用字符

mkdir /data/data/com.termux/files/home/.termux
cd /data/data/com.termux/files/home/.termux
vi termux.properties

```
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP','<','>'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','[',']'],['$','"','=','{','}','(',')','&','%']]'"']]

```

### 修改源

apt edit-sources

或者 

vi $PREFIX/etc/apt/sources.list

将原来的https://termux.net官方源替换为http://mirrors.tuna.tsinghua.edu.cn/termux


(详情见)[https://mirrors.tuna.tsinghua.edu.cn/help/termux/]

较新的版本推荐使用 termux-change-repo 直接换源


### 安装 ssh 

sshd是包含在openssh包中的

apt install openssh

sshd                //启动sshd 服务

端口号是8023


讲电脑的public key 添加到手机
ssh-copy-id root@192.168.1.1 -p 8022



之前的版本不能执行ssh-copy-id命令,需要这么做

    ```
    ssh user@linux_clinet "cat ~/.ssh/id_rsa.pub" >> ~/.ssh/authorized_keys
    ```

快速登录termux

编辑电脑上的ssh_config文件

vi /etc/ssh/ssh_config

```
Host termux
HostName 192.4.4.9
Port 8022
```



### zsh

apt install zsh

安装.oh-my-zsh

gitee搜索 termux-ohmyzsh, 下载 install.sh 脚本, 然后执行

    https://github.com/Devarajankp/termux-ohmyzsh

会在 $HOME 目录 git clone termux-ohmyzsh项目

编辑$HOME/.zshrc

    ```
    ZSH_THEME="robbyrussell"                //这个主题的PS1比较友好

    # Path to your oh-my-zsh installation.
    export ZSH=$HOME/.oh-my-zsh             //配色、字体等都在这里
    ```




### Installing ArchLinux with termux

https://www.jianshu.com/p/686042528628


git clone https://gitee.com/billscofield/TermuxArch.git

cd TermuxArch

bash ./setTermuxArch.bash   //500M 建议找一个网络好的地方

安装完后在/data/data/com.termux/files/home会多出一个arch文件夹，刚才安装的所有arch系统的文件都在这里

成功安装后会自动进入archlinux环境

1. 退出archlinux环境
    
    exit

1. 进入arch
    
    当关闭termux进程然后重启，默认是termux，执行命令 startarch 便可进入archlinux环境

1. 如果要删除刚安装的arch，查看安装脚本的帮助信息可知只要在脚本根目录下执行

    bash setupTermuxArch.sh purge

查看更多相关信息:

    bash setupTermuxArch.sh help

    提到了purge



创建登录用户，因为使用命令

startarch

默认是以root登录的，平时我们在linux系统下都是以某个用户身份登录操作的，因此需要创建个用户来登录，首先执行命令

    startarch c addauser kindy

这里kindy便是创建的用户名，此命令会直接以用户kindy身份登录archlinux，退出之后要想再次以此用户登录，执行命令

    startarch user kindy

或者

    startarch login kindy

或者

    startarch u kindy

或者

    startarch l kindy

