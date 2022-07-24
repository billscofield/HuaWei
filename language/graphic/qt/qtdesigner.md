## 

pip install pyside2
    包含 qt 库， designer 等工具



## designer 安装

1. 通过安装 anaconda

2. 通过安装官方的工具

3. 通过安装 pyqt5-tools
    pyuic5

## .ui 文件

designer 路径

    /opt/Qt/6.2.4/gcc_64/bin/designer

uic 路径

    /opt/Qt/Tools/QtDesignStudio-2.3.0-preview/qt5_design_studio_reduced_version/bin/uic

```
➜  bin ./uic --help
Usage: ./uic [options] [uifile]
Qt User Interface Compiler version 5.15.5
```

QWidget

QDialog
    没有最大化

QMainWindow
    菜单栏
    工具栏
    状态栏

窗口位置和大小
    void move(intx, inty);
    void resize(intx, inty);


