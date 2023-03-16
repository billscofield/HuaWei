

    ```
    v=3.8.5; curl -L https://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -o ~/.pyenv/cache/Python-$v.tar.xz; pyenv install $v


    我们也可以创建一个方法，放到 ~/.bashrc 文件中，以后方便直接使用

    function pyinstall() {
        v=$1
        echo '准备按照 Python' $v
        curl -L https://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -o ~/.pyenv/cache/Python-$v.tar.xz
        pyenv install $v
    }

    $ pyinstall 3.8.0

    ```




    以本文说的情况为例：
        执行 pyenv install anaconda3-4.1.0 -v 获取下载链接
        用wget从下载链接中获取文件 Anaconda3-4.1.0-Linux-x86_64.sh
        将安装包移动到 ~/.pyenv/cache/Anaconda3-4.1.0-Linux-x86_64.sh
        重新执行 pyenv install anaconda3-4.1.0 -v 命令。该命令会检查 cache 目录下已有文件的完整性，若确认无误，则会直接使用该安装文件进行安装。
        安装过程中，若出现编译错误，通常是由于依赖包未满足，需要在安装依赖包后重新执行该命令











注意
pyenv-virtualenv: prompt changing will be removed from future release. configure 

`export PYENV_VIRTUALENV_DISABLE_PROMPT=1' 

to simulate the behavior.
执行完上面那条语句后就没有虚拟环境的prompt提示了...
使用python虚拟环境






pyenv是第三方的，开源的多版本的Python管理工具，同时支持Python2和Python3.
pyenv-virtualenv插件是虚拟出同一版本的python但是不同依赖库版本的开发环境。这对于在同一台电脑上开发不同项目非常方便。




https://www.cnblogs.com/weiwei-python/p/9893599.html


### 加速下载 python

/root/.pyenv/plugins/python-build/share/python-build/ 

这里边是每个python的下载地址, 默认用的国外的地址

可以到国内的 mirrors.sohu.com/python/3.8.0/ 进行下载到 ~/.pyenv/cache/ 下

然后 pyenv install 3.8.0 
