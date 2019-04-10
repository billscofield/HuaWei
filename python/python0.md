# Python

>>> import this
Python 之禅

## 版本
1. 3.x 始于2008年，3.5版本发布于2015年
1. pythonclock.org      //2.x的倒计时

1. 2.x 和 3.x区别
    1. 语句函数话，如 print(1,2) 打印出1 2，但是 2.x 中意思是print语句打印元组，3.x中意思时函数的2个参数
    1. 整除，如1/2和1//2，3.x版本中/为自然除
    1. round函数，在3.x中i.5的取整变为距离最近的偶数
        round(2.5)  返回2
        round(1.5)  返回2
        round(3.5)  返回4
    1. 3.x 中raw_input 命名为input , 不再使用 raw_input
    1. 字符串统一使用Unicode
    1. 异常的捕获、抛出的语法改变





## 工具
1. Python多版本管理工具
    1. 管理python解释器
    1. 管理python版本
    1. 管理python的虚拟环境

        1. 例如
            1. Pyenv
            1. https://www.bilibili.com/video/av33616020
        1. virtualenv


1. ipython

### pyenv 
1. 安装

1. 使用
    1. pyenv install -l //列出可用的python版本
    1. pyenv install -v 3.5.3 

    ```
    //cd .pyenv
    //cd versions //所有的版本
    原理就是下载到 cache目录，再安装
    mkdir cache
    cp Python 3.5.3.tar.gz
    cp Python 3.5.3.tar.xz
    cp Python 3.5.3.tar.tgz
    
    pyenv install 3.5.3 
    ```
    
    pyenv version   显示当前的python版本
    pyenv versions  显示所有可用的python版本,和当前shell

    pyenv global 3.5.3
    pyenv version
    pyenv versions
    
    pyenv global system


    1. local
        pyenv local 3.5.3
        pyenv -V
        这个目录和这个python -local 进行绑定
    1. global
    1. shell
        pyenv shell 3.5.3   //只影响当前shell
        

## 推荐书籍
1. Python Cookbook
1. Learn Python the Hard Way
1. Google's Python Class
1. 简明Python教程
