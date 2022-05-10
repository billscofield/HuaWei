## whl 文件



## 1. Python 包管理工具 setuptools

setuptools管理Python的第三方包，将包安装到site-package下，安装的包后缀一般为
.egg，实际为ZIP格式。

默认从 http://pypi.python.org/pypi 下载包，能够解决Python包的依赖关系；

安装了setuptools之后即可用 easy_install 命令安装包


### Python2.7安装setuptools

```
$ yum install python-setuptools

$ tar xvf setuptools-7.0.tar.gz

$ cd setuptools-7.0

$ python2.7 setup.py install

$ ln -s /usr/local/python27/bin/easy_install /usr/local/bin/easy_install
```

## 2. pip

pip 是一个安装和管理 Python 包的工具 , 是 easy_install 的一个替换品。

pip 是基于 setuptools的

pip也是一个Python的包管理工具，它和setuptools类似，但是pip比setuptools更好用，
现在安装python包基本都是使用pip了。如果使用virtualenv工具，会自动安装一个pip

### Python2.7安装pip

```
$ easy_install pip

$ yum install python-pip

$ wget "https://pypi.python.org/packages/source/p/pip/pip-1.5.4.tar.gz#md5=834b2904f92d46aaa333267fb1c922bb" --no-check-certificate

$ tar xvf pip-1.5.4.tar.gz

$ cd pip-1.5.4

$ python2.7 setup.py build

$ python2.7 setup.py install

$ ln -s /usr/local/python27/bin/pip /usr/local/bin/pip
```


[Python包工具setuptools、wheel、pip的详解](https://www.huoxiaoqiang.com/experience/pythone/2880.html)

1. distlib

    distlib 是一个库，它实现了与 Python 软件的打包和分发相关的低级功能。它包含
    packagingPython 包中的部分函数，​​该包旨在作为 Python 3.3 的一部
    分发布，但在 Python 3.3 进入 beta 测试前不久被删除。

2. distutils

    传统的构建和安装 Python 模块的工具，目前已被setuptools包构建和分发工具和pip
    包管理工具替代。

3. setuptools

    setuptools是 Python distutils的增强集合，使您可以更轻松地构建和分发 Python
    包。支持生成 .exe、.tar.gz、.tar.bz2、.tgz、.zip、.egg、.egg.zip或.wheel
    格式文件。

4. .egg格式

    setuptools分发项目的一种二进制格式，目前已被wheel替代。

5. Easy Install

    Easy Install 是一个与setuptools捆绑在一起的 Python 模块 ( easy_install  )
    ，可以让您自动下载、构建、安装和管理 Python 包。支持源码包和.egg二进制包。
    Easy Install不是构建打包工具。

6. .whl格式

    旨在替代egg格式的一种二进制包。wheel目前受pip支持。

7. pip

    pip可以安装源码包或wheel包，优先安装兼容的wheel。

    如果pip找不到可安装的wheel，它将在本地构建一个wheel并将其缓存以备将来安装，
    而不是在将来重新构建源代码包。

总结：使用 setuptools 构建和打包源分支 和 wheel，使用 pip 下载、构建、安装、管理包。
