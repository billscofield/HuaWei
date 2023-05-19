# Pyside6

## 准备环境

1. pyside6

    pyenv versions 3.10.6 pyside6

    pip install pyside6 -i https://pypi.tuna.tsinghua.edu.cn/simple
        /root/.pyenv/versions/3.10.6/envs/pyside6/lib/python3.10/site-packages

        pyside6-designer
        pyside6-uic(User Interface Compiler)
        pyside6-rcc(Resource Compiler)

    sys.executable

    pyside6-uic -o output.py input.ui

2. [zeal](https://zealdocs.org/)

    Zeal is an offline documentation browser for software developers.

    Cross Platforms

    apt-get install zeal

    需要使用普通用户执行行, 提示--no-sandbox 却报错了

    或者可以使用在线类似网站: [devdocs](https://devdocs.io/)


## pyside6-uic

In the context of PySide6, the "uic" stands for "User Interface Compiler".
PySide6-uic is a command-line tool that is used to convert Qt Designer UI files
(.ui files) into Python code that can be used with PySide6 to create graphical
user interfaces (GUIs).

The Qt Designer tool allows developers to visually design their user interfaces
and save them as .ui files. The PySide6-uic tool can then be used to convert
these .ui files into Python code, which can be integrated into the developer's
application.

## pyside6-rcc

In the context of PySide6, the "rcc" stands for "Resource Compiler".
PySide6-rcc is a command-line tool that is used to compile external resource
files (.qrc files) into binary files that can be used with PySide6.

External resource files can contain various types of data such as images, icons,
audio, and other binary data that the PySide6 application needs to access
during runtime. The PySide6-rcc tool can be used to compile these external
resource files into binary files that can be directly accessed by the PySide6
application, reducing the overall size of the application and improving its
performance.


## how to let pylint to recognize pyside

### vim plugins for pyside6

pip install -y pylint

[PyQt6-stubs](https://github.com/python-qt-tools/PyQt6-stubs)

The Stubs are not yet on pypi
    git clone https://github.com/TilmanK/PyQt6-stubs.git

Configure Pylint to use the pyqt6-stubs package. You can do this by adding the
following lines to your Pylint configuration file (e.g., pylintrc):

