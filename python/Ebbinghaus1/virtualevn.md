python的虚拟环境，把你需要的工作环境与系统环境相隔离，互不影响
python有很多版本，第三方包也有很多版本，


## 安装
1. 确定有python
1. 安装pip
    apt install python-pip python-dev build-essential
    pip install --upgrade pip

    配置镜像
        ~/.pip/pip.conf
        [global]
        index-url = http://mirrors.aliyun.com/pypi/simple/
        [install]
        trusted-host=mirrors.aliyun.com

1. pip install virtualenv

## 创建虚拟环境
1. python2
    ```
    virtualenv -p python2 项目文件名    //创建一个项目文件夹
        virtualenv -p /usr/bin/python2 py2env
    source .py2/bin/activate            //激活当前项目的虚拟环境
    pip install django==1.9             //在当前项目中安装django==1.9的版本
    pip list
    deactivate                          //退出当前项目的虚拟环境
    ```
    virtualenv -p python2 项目文件名    //创建一个项目文件夹

1. python3
    ```
    virtualenv -p python3 项目文件名    //创建一个项目文件夹
    source .py3/bin/activate            //激活当前项目的虚拟环境
    pip install django==1.9             //在当前项目中安装django==1.9的版本
    pip list
    virtualenv -p python2 项目文件名    //创建一个项目文件夹
    deactivate                          //退出当前项目的虚拟环境
    ```
创建独立运行环境-命名
virtualenv --no-site-packages --python=python3  venv#得到独立第三方包的环境，并且指定解释器是python3
–no-site-packages 参数意思是将系统Python环境中的第三方包不会复制来，这样得到一个纯净的工作环境
考虑向后兼容性

原理
virtualenv是如何创建“独立”的Python运行环境的呢？原理很简单，就是把系统Python复制一份到virtualenv的环境，用命令source venv/bin/activate进入一个virtualenv环境时，virtualenv会修改相关环境变量，让命令python和pip均指向当前的virtualenv环境。

生成依赖关系清单
    pip freeze > requirements.md
    pip3 install -r requirements.txt

这个目录下的bin、include、lib分别对环境操作工具、依赖库、安装的库进行分别管理




## virtualenvwrapper
virtaulenvwrapper是virtualenv的扩展包，用于更方便管理虚拟环境,它的主要亮点有：
    1.可以将所有的虚拟环境整合到一个目录下，方便管理，而不是像virtualenv那样将虚拟环境放置在和项目同一个目录， 这样将每个环境与项目剥离开，使得每个环境的多次使用非常方便。
    2.可以非常方便地对虚拟环境进行添加、删除、复制等管理操作，还可以很方便地对使用的环境进行切换。

https://www.cnblogs.com/weiwei-python/p/9893599.html

pip install virtualenvwrapper

编辑 ~/.zshrc
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
    会创建 VIRTUALENVWRAPPER_PYTHON, 默认是 `which python`,因此如果想指定python3,需要手工在.zshrc中配置

    ```
    if [ "${VIRTUALENVWRAPPER_PYTHON:-}" = "" ]
    then
        VIRTUALENVWRAPPER_PYTHON="$(command \which python)"
    fi

    ```

source ~/.zshrc


mkvirtualenv test : 创建运行环境test
    -p PYTHON_EXE, --python=PYTHON_EXE
workon : 查看当前的虚拟环境目录
workon test : 工作在test环境或切换到test环境
deactivate : 退出当前环境
rmvirtualenv test : 删除运行环境test
mkproject test : 创建test项目和运行环境
mktempenv : 创建临时运行环境
lsvirtualenv : 列出可用的运行环境
lssitepackages : 列出当前环境安装了的包

cdvirtualenv
    导航到当前激活的虚拟环境的目录中，比如说这样您就能够浏览它的 site-packages 。
    首先要在一个激活的虚拟环境中
cdsitepackages
    和上面的类似，但是是直接进入到 site-packages 目录中。
lssitepackages
    显示 site-packages 目录中的内容。

