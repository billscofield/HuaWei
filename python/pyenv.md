## 安装
### 方法1

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

系统是会告诉你怎么做的（即将最后的三行追加到~/.bash_profile,做环境变量）


### 方法2
git clone https://github.com/yyuu/pyenv.git ~/.pyenv 

同样是做环境变量

```
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile 
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile 
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
```

source ~/.bashrc

重启shell
    exec "$SHELL"


## 安装python的不同版本

安装 Python 的依赖包
在编译 Python 过程中会依赖一些其他库文件，因而需要首先安装这些库文件，已知的一些需要预先安装的库如下。在 Ubuntu下：
sudo apt-get update
sudo apt-get install make build-essential libssl-dev zlib1g-dev
sudo apt-get install libbz2-dev libreadline-dev libsqlite3-dev wget curl
sudo apt-get install llvm libncurses5-dev libncursesw5-dev


pyenv install --list    查看可以安装的python版本

pyenv install -v 3.6.7  安装python

pyenv uninstall 3.6.7   卸载python

注意
    在使用pyenv install安装python，可能会比较慢，甚至下载安装不成功

    <1>.这时最好使用是下载好python源码包，然后通过pyenv进行安装（可以下载到境外云服务器）
    <2>.将python源码包放置在~/.pyenv/cache/目录中（不要解压 ; 如没有cache就创建一个）
    <3>.执行pyenv install 3.6.4

    以本文说的情况为例：
        执行 pyenv install anaconda3-4.1.0 -v 获取下载链接
        用wget从下载链接中获取文件 Anaconda3-4.1.0-Linux-x86_64.sh
        将安装包移动到 ~/.pyenv/cache/Anaconda3-4.1.0-Linux-x86_64.sh
        重新执行 pyenv install anaconda3-4.1.0 -v 命令。该命令会检查 cache 目录下已有文件的完整性，若确认无误，则会直接使用该安装文件进行安装。
        安装过程中，若出现编译错误，通常是由于依赖包未满足，需要在安装依赖包后重新执行该命令

更新数据库
    在安装 Python 或者其他带有可执行文件的模块之后，需要对数据库进行更新：
    pyenv rehash

设置全局的 python 版本
$ pyenv global anaconda3-4.1.0
$ pyenv versions
system
* anaconda3-4.1.0 (set by /home/seisman/.pyenv/version)
当前全局的 python 版本已经变成了 anaconda3-4.1.0。也可以使用 pyenv local 或 pyenv shell 临时改变 python 版本。

还原全局设置
pyenv global system

执行pyenv local 3.5.3后，只有在这个目录是3.5.3的版本，别的目录使用默认的版本.需要 pyenv rehash


本地设置,作用在执行该语句的目录下，该目录下的子目录都继承该设置。
本地设置
    pyenv local 3.6.6 
取消本地设置
    pyenv local --unset

全局设置，影响用户的的环境变量
如果使用root用户执行该命令，会产生可怕的影响，禁止。
全局设置
    pyenv global 3.6.6
还原全局设置
    pyenv global system


pyenv --version         查看pyenv版本

pyenv versions          查看当前python版本(system代表当前系统的python版本)

pyenv version           查看当前正在使用的python版本

pyenv update            更新pyenv及其插件

pyenv global 3.6.4      切换python版本
    pyenv version
    pyenv versions


创建虚拟python环境

1.安装插件

创建虚拟的python环境需要pyenv-virtualenv的插件，试着pyenv virtual补全一下，如果存在无需安装

如果不存在，执行如下操作
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
echo ‘eval “$(pyenv virtualenv-init -)”’ >> ~/.bash_profile
source ~/.bash_profile

2.创建虚拟环境
pyenv virtualenv 2.7.13 env2713

这是创建了一个名为env2713的python虚拟环境，这个环境的目录位于：~/.pyenv/versions/



创建一个3.6.2的虚拟环境
$ pyenv virtualenv 3.6.2 env362
这条命令在本机上创建了一个名为env362的python虚拟环境，这个环境的真实目录位于：~/.pyenv/versions/
再次输入
$ pyenv versions
env362是3.6.2/envs/env362的软连接
3.6.2是官方版本

设置本地虚拟环境
pyenv local test

临时使用3.6.2的虚拟环境
$ pyenv activate env362


关闭3.6.2的虚拟环境
$ pyenv deactivate

卸载3.6.2的虚拟环境
$ pyenv uninstall env362

https://www.cnblogs.com/magichand/p/7406381.html

```
注意
pyenv-virtualenv: prompt changing will be removed from future release. configure 

`export PYENV_VIRTUALENV_DISABLE_PROMPT=1' 

to simulate the behavior.
执行完上面那条语句后就没有虚拟环境的prompt提示了...
```


3.查看python版本

    pyenv versions
    * system (set by /root/.pyenv/version)
    2.7.13
    2.7.13/envs/env2713
    3.6.4
    3.6.4/envs/env364
    env2713
    env364

使用python虚拟环境

1.使用虚拟环境

[xxx]#pyenv activate env364
pyenv-virtualenv: prompt changing will be removed from future release. configure `export PYENV_VIRTUALENV_DISABLE_PROMPT=1’ to simulate the behavior.v364)

[xxx]# python
Python 3.6.4 (default, Apr 19 2018, 10:35:10)
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)] on linux
Type “help”, “copyright”, “credits” or “license” for more information.

2.退出虚拟环境

pyenv deactivate

3.环境迁移
pyenv virtualenv 2.7.13 env2713

<1>~./pyenv/versions/下名为2.7.14的文件夹拷贝到要迁移的服务器上
<2>修改env364/pyvenv.cfg文件中的home路径(迁移的服务器无需安装任何东西)

    [xxx env364]# cat pyvenv.cfg
    home =/root/.pyenv/versions/2.7.13/bin
    include-system-site-packages = false
    version = 2.7.13

注意事项

1.在使用环境的时候不要用sudo,否则就变成使用全局环境了（例如安装django,直接pip install django就行了,不要用sudo pip install. ）

2.迁移时，python3由于依赖于相对高一点的glibc库，要注意迁移与被迁移服务器的glibc的版本问题，版本不同时还需要手动安装,更新时注意
(glibc是GNU发布的libc库，即c运行库;glibc是linux系统中最底层的api，几乎其它任何运行库都会依赖于glibclinux系统的依赖)



https://blog.csdn.net/GX_1_11_real/article/details/80237064

https://www.linuxidc.com/Linux/2018-04/151988.htm

https://www.cnblogs.com/saneri/p/7642316.html



pyenv是第三方的，开源的多版本的Python管理工具，同时支持Python2和Python3.
pyenv-virtualenv插件是虚拟出同一版本的python但是不同依赖库版本的开发环境。这对于在同一台电脑上开发不同项目非常方便。





