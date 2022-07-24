/

## [Qt History](https://wiki.qt.io/Qt_History)

In the summer of 1990 Haavard [Nord] and Eirik [Chambe-Eng] were working
together on a C++ database application for ultrasound images. The system needed
to be able to run with a GUI on Unix, Macintosh, and Windows. One day that
summer, Haavard and Eirik went outside to enjoy the sunshine, and as they sat
on a park bench, Haavard said, "We need an object-oriented display system." The
resulting discussion laid the intellectual foundation for the object-oriented
cross-platform GUI framework they would soon go on to build.

1995 Troll Tech(奇趣公司) 1st public release on 20 May. Qt 0.90 for X11/Linux.
Commercial & open source (FreeQt license)

2008 Nokia acquires Trolltech, "Qt Software at Nokia"

2012 Digia acquires all right to Qt, "Digia, Qt". Qt 5.0 major overhaul, new
modularized codebase, consolidation of QPA (Qt Platform Abstraction), Qt Quick
2, and more support for mobile (WinRT).

2014 "Digia, Qt" becomes its own entity "The Qt Company", subsidiary of Digia



## 几种 UI 框架

1. Tkinter

2. wxpython

3. PySide2 

    https://doc.qt.io

    https://www.bilibili.com/video/BV1WZ4y1x7Qx?from=search&seid=4058818275488621534&spm_id_from=333.337.0.0

4. PyQt5

maya，houdini 都是默认的 pyside2

Qt库是 C++ 开发的, PySide2, PyQt5 可以让我们通过 Python 语言访问 Qt 库

|                    另外一个机构开发的
|                   +-------+
|       +---<-<-----| PyQt5 |---<----<--+
|      \|/          +-------+           |
|   +-------+                       +---+----------------+
|   | Qt 库 |                       | Our Python Program |
|   +-------+                       +---+----------------+
|      /|\          +---------+         |
|       +---<--<----| PySide2 |-<----<--+
|                   +---------+
|                    Qt的亲儿子


PyQt5 出现的比 PySide2 早

## python 环境准备

1. pyenv

    ``` 
    git clone https://github.com/pyenv/pyenv.git .pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/shims:$PATH"' >> ~/.bashrc
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
    source .bashrc
    pyenv       // 安装成功
    ```

2. virtualenv

    ```
    https://github.com/pyenv/pyenv-virtualenv
    
    1. Check out pyenv-virtualenv into plugin directory

        git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

    2. (OPTIONAL) Add pyenv virtualenv-init to your shell to enable auto-activation of virtualenvs. This is entirely optional but pretty useful. See "Activate virtualenv" below.

        echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
    
    3. Restart your shell to enable pyenv-virtualenv
        $ exec "$SHELL"
    ```

3. 安装环境

    1. pyenv install --list
    
    2. 首先安装编译 python 所需依赖

        ` yum install -y gcc make patch gdbm-devel openssl-devel sqlite-devel readline-devel zlib-devel bzip2-devel ncurses-devel libffi-devel

    3. pyenv install -v 3.9.7

        有的时候网络不好，下载源码包比较慢这时我们可以在 .pyenv 目录内创建 cache
文件夹，然后使用内网的 ftp 服务器下载指定的 python版本，然后再使用 pyenv install
安装，这样可以节省时间

        完成上面的操作后，再次使用 pyenv install 命令安装对应的 python
版本时，会跳过下载软件包的过程，直接使用 cache 路径下的源码包。
    

## 界面动作处理 (signal 和 slot)

在 Qt 系统中， 当界面上一个控件被操作时，比如
被点击、被输入文本、被鼠标拖拽等， 就会发出 信号 ，英文叫 **signal**
。就是表明一个事件（比如被点击、被输入文本）发生了。

我们可以预先在代码中指定 处理这个 signal 的函数，这个处理 signal 的函数 叫做
**slot** 。

比如，我们可以像下面这样定义一个函数

    ```
    def handleCalc():
        print('统计按钮被点击了')
    ```

然后， 指定 如果 发生了button 按钮被点击 的事情，需要让 handleCalc 来处理，像这样

    ` button.clicked.connect(handleCalc)

用QT的术语来解释上面这行代码，就是：把 button 被 点击（clicked） 的信号（signal）， 连接（connect）到了 handleCalc 这样的一个 slot上

大白话就是：让 handleCalc 来 处理 button 被 点击的操作。



## 1. 安装 qt5

从5.15开始，收费了呀，329$每年

安装必要的库

    yum install -y mesa-libGL-devel mesa-libGLU-devel freeglut-devel

    yum install libxcb libxcb-devel libXrender libXrender-devel xcb-util-wm xcb-util-wm-devel xcb-util xcb-util-devel xcb-util-image xcb-util-image-devel xcb-util-keysyms xcb-util-keysyms-devel

    yum install xcb-util-renderutil


### 版本说明

https://www.qt.io/download

1. 商业版

2. 商业试用版

3. 开源版本
    
    我们下载这个版本

    下载的是一个下载器,需要登陆帐号

        https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-unified-linux-x64-4.1.1-online.run

    添加执行权限, 执行安装:

        ```
        chmod +x qt-unified-linux-x64-4.1.1-online.run
        ./qt-unified-linux-x64-4.1.1-online.run
        ```

4. UI 设计工具

    1. qtcreator 组件

        echo 'export PATH=$PATH:/opt/Qt/Tools/QtCreator/bin' >> /root/.zshrc

    2. designer 组件

        echo 'export PATH=$PATH:/opt/Qt/Tools/QtDesignStudio/qt5_design_studio_reduced_version/bin' >> /root/.zshrc

    设置成debug模式(不清楚是哪个部分的了)

        export QT_DEBUG_PLUGINS=1

#### designer 

pip install pyqt5-tools
而我是从 qt 官网下载安装的

发现还有一个 pyside2-designer ，运行的时候提示缺少库, 使用 yum whatprovides 进行安装，还是提示缺少该库, why?

    ```
    $ which pyside2-designer
    /root/.pyenv/shims/pyside2-designer

    /root/.pyenv/versions/virtual-3.9.7-pyqt5/lib/python3.9/site-packages/PySide2/designer
    ```



Form -> preview (Ctrl + r)

文件名后缀 .ui, 其实就是 xml 文件


##### 控件

1. 界面布局 layout

    1. QHBoxLayout 水平布局

    2. QVBoxLayout 垂直布局

    3. Grid Layout

        表格, 可以合并

    4. Form Layout

        两列的表格

2. spacers 控件

3. button 控件

    QWidget / sizePolicy / 
        1. Horizontal Policy
        2. Vertical Policy
            Minimum 上层控制的最小值
            Fixed
        3. Horizontal Stretch(水平伸展), 默认为0, 没有比例, 比例=当前值/总和
        4. Vertical Stretch(垂直伸展)

    Layout
        layoutLeftMargin
        layoutTopMargin
        layoutRightMargin
        layoutBottomMargin
        layoutSpacing
        layoutStretch
            控制 layout 里边的控件的比例, 有几个控件就有几个数字
        layoutSizeConstraint


    radioButton
    
        同一个 layout 中

        一个 GroupBox 中

Input Widgets

    lineEdit
        .test() 方法, 获取输入的 string

Containers
    tab widget 控件
        
        它的 layout 要在父级别控件操作

    图标
        主窗口图标

            ```
            from PySide2.QtGui import QIcon
            
            app = QApplication([])
            app.setWindowIcon(QIcon('logo.png'))
            ```
    
        应用程序图标
            
            ```
            pyinstaller target.py --noconsole --hidden-import PySide2.QtXml --icon='logo.ico'
            
            在线网站生成
                https://www.easyicon.net/covert/
            ```
    




    工具栏 / "signal/slot"
            
1. QSS

    Qt Style Sheet, 类似 CSS

    ```
    控件的 styleSheet 属性

    QPushButton {
        color:red;
        font-size:15px;
    }
    ```

    selector 

        ```
        1. universal selector    
            *        匹配所有的界面元素
            * {
                font-size:16px;
            }

        2. Type Selector    
            QPushButton  所有 QPushButton 类型, 包括子类

        3. Class Selector
            .QPushButton  所有 QPushButton 类型, 不包括子类

        4. ID Selector
            QPushButton#okButton    就是属性名,对象名

        5. Propertay Selector
            QPushButton[flat='flase']   所有 flast 属性值为 false 的 QPushButton 类型

        6. Descendant Selector
            QDialog QPushButton         所有 QDialog 内部的 QPushButton 类型

        7. Child Selector
            QDialog > QPushButton         所有 QDialog 的直接 QPushButton 子节点

        Pseduo-States
            :hover
            
        ```




1. ui 文件的加载

    ```
    def __init__(self):
        qfile = QFile("ui.ui")
        qfile.open(QFile.ReadOnly)
        qfile.close()

        self.ui = QUiLoader().load(qfile)
        ...
    ```

    ui 文件可以通过  pyuic5(pyside2 还是 pyqt5 提供的) 转换为 python 文件

        
2. ui 文件转换

    python -m PyQt5.uic.pyuic demo.ui -o demo.py

    方法一: designer -> Form -> View Python code
    
    方法二: 

    ```
    which pyuic5
    /root/.pyenv/shims/pyuic5
    ```
    pyyuic5 -x -o target.py source.ui

        -p, --preview         show a preview of the UI instead of generating code
        -o FILE, --output=FILE  write generated code to FILE instead of stdout
        -x, --execute           generate extra code to test and display the class



#### 正式发布程序

PyInstaller

    pip install pyinstaller


pyinstaller target.py --noconsole --hidden-import PySide2.QtXml
    target.py 入口文件
    会产生一个 dist 目录
    会自动分析所需要的库, 但是ui文件等不会, 手动放进来

    --noconsole: 运行的时候不要出现命令行窗口

    --hidden-import PySide2.QtXml  参数是因为这个 QtXml库是动态导入, Pyinstaller 没法分析出来，显示告诉它





## 2. Pyside2

1. 安装 pyside2(大约160M)

    pip install pyside2 -i https://pypi.tuna.tsinghua.edu.cn/simple

2. 安装 pyqt5

    pip install --user pyqt5-tools -i https://pypi.tuna.tsinghua.edu.cn/simple


qtdesigner: 生成 ui 文件
pyuic: 将ui文件转成 py 文件
pyrcc: 将图片转为 icon 文件






