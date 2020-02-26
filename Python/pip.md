

## install
pip install SomePackage              # 最新版本
pip install SomePackage==1.0.4       # 指定版本
pip install 'SomePackage>=1.0.4'     # 最小版本

-i https://pypi.tuna.tsinghua.edu.cn/simple
    /root/.pip/pip.conf || $HOME/.config/pip/pip.conf
        [global]
        index-url=https://pypi.tuna.tsinghua.edu.cn/simple

    ** 注意： **如果使用http链接，需要指定trusted-host参数
        [global]
        timeout = 60
        index-url = http://pypi.douban.com/simple
        trusted-host = pypi.douban.com


安装一个不存在的ipython版本5.xx,然后就会出现所有可以安装ipython版本

## 升级
pip install -U SomePackage
pip install --upgrade SomePackage

pip install -U
    ERROR: You must give at least one requirement to install (see "pip help install")
    不会全部进行升级


## 卸载包

pip uninstall SomePackage

## 搜索包

pip search SomePackage

## 显示安装包信息

pip show SomePackage

## 查看指定包的详细信息

pip show -f SomePackage

## 列出已安装的包

pip list

## 查看可升级的包

pip list -o

## 如果 Python2 和 Python3 同时有 pip，则使用方法如下：

Python2：
    python2 -m pip install XXX

Python3:
    python3 -m pip install XXX


pip --version 可以看到是那个 python 的 pip

    ```
    root@ubuntu:mail# pip --version
    pip 19.2.1 from /usr/local/lib/python3.5/dist-packages/pip (python 3.5)
    ```


## 

sudo pip3 install packagename

代表进行全局安装，安装后全局可用。如果是信任的安装包可用使用该命令进行安装。

pip3 install --user packagename

代表仅该用户的安装，安装后仅该用户可用。处于安全考虑，尽量使用该命令进行安装。
