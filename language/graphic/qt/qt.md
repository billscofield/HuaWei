[link1](https://www.bilibili.com/video/BV1g4411H78N?p=4)
[link2](https://www.bilibili.com/video/BV1M5411K7KG?p=6&spm_id_from=pageDriver)

## 什么是 Qt

夸平台的 C++ 图形用户界面应用程序框架.

## Qt 的发展

1. 1991 年 QT 最早由芬兰**奇趣科技**开发

2. 1996 年进入商业领域，也是 KDE 的基础

3. 2008 年，奇趣科技被诺基亚收购, 成为诺基亚旗下的编程基础

4. 2012 年, QT 又被 Digia 公司(芬兰一家软件公司)收购

5. 2014 年4月, 夸平台的集成开发环境 Qt Creator 3.1.0 发布，同年5月20日配发了
   Qt5.3 正式版，至此 Qt 实现了对 IOS, Android, WP 等平台的全面支持

## Qt 的优势

1. 夸平台，几乎支持所有的平台
    一次编写，随处编译

2. 接口简单

3. 一定程度上简化了内存回收机制

4. 开发效率高, 能够快速构建应用程序

5. 有很好的社区氛围

6. 可以进行嵌入式开发

## Qt 版本

1. 商业版

2. 开源版本 LGPL


## 成功案例

1. 桌面环境 KDE

2. WPS Office

3. Skype

4. Google earth

5. VLC

6. VirtualBox

7. AutoDesk

## 安装

在线安装, onlineinstall 版本号


## Qt Creator

集成开发环境
可管理项目代码、具有可视化设计界面

这个的版本和 Qt 框架的版本不一样

版本号例如: 4.3.1

VS, Eclipse 等也可以开发 Qt



F4 
    .h 文件和 .cpp 文件的切换

编译并运行
    Ctrl + r

函数
    F2

字体大小
    Ctrl + 鼠标滚轮

注释
    选中, Ctrl + /


类的命名
    单词首字母大写, 单词之间直接连接,无需连接字符
    如: QPlusButton

函数的命名
    第二个单词开始首字母大写

**每一个类文件都对应一个同名的头文件, 类型,头文件和类命名相同**


## Qt 框架

框架代码和相关框架库

版本号例如: 5.9.0

MFC 是 windows 的库


## 编译器

MSVC
    需要安装 VS >= 2015
    windows 上的 C, C++ 编译器

MinGW
    Windows 环境下的 gcc, g++ Minimallist GNU 的缩写

gcc g++
    Linux 环境下的 c, c++ 编译器



## 环境设置

    ```
    export QTVER=6.2.2
    export QTDIR=/opt/Qt/
    export PATH=${QTDIR}${QTVER}/gcc_64/bin/:$PATH
    export PATH=${QTDIR}Tools/QtCreator/bin/:$PATH
    export LD_LIBRARY_PATH=${QTDIR}${QTVER}/gcc_64/lib/:$LD_LIBRARY_PATH

    ```

    qmake --version






## problems

QT下 cannot find -IGL的解决办法

    [link](https://blog.csdn.net/wangzhen209/article/details/66972973)

    > apt install libgl1-mesa-dev







## Qt Widgets Application

widgets: 控件 -> 窗口

|           QWidget
|              |
|       +------+-------+
|       |              |
|   QMainWindow     QDialog

基类
    1. QWidget

    2. QMainWindow
        继承自 QWidget
        有菜单栏，工具栏

    3. QDialog
        继承自 QWidget
        没有最大化最小化

创建工程
    类名
    基类
    头文件
    源文件
    创建界面
    界面文件

    1. .pro 文件
    2. main.cpp

    Filter Tree
        Simply Tree(简化树形视图)


### pro文件

    ```
    QT       += core gui                // 包含的模块

    greaterThan(QT_MAJOR_VERSION, 4): QT += widgets     // 大于4版本包含这个 widgets, 因为4的时候是属于 gui 的

    CONFIG += c++11                     // CONFIG用来告诉qmake关于应用程序的配置信息

    # You can make your code fail to compile if it uses deprecated APIs.
    # In order to do so, uncomment the following line.
    #DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

    SOURCES += \
    main.cpp \
    helloworld.cpp

    HEADERS += \
    helloworld.h

    // 指定目标文件名TARGET = filename; 如果不设置该项目，目标名会被自动设置为跟项目文件一样的名称

    # Default rules for deployment.
    qnx: target.path = /tmp/$${TARGET}/bin
    else: unix:!android: target.path = /opt/$${TARGET}/bin
    !isEmpty(target.path): INSTALLS += target

    // 添加界面文件(ui)  INTERFACES = filename.ui

    // 摸板, 模板变量告诉qmake为这个应用程序生成哪种makefile。下面是可供使用的选择：
        // A> app - 建立一个应用程序的makefile。这是默认值，所以如果模板没有被指定，这个将被使用。
        // B> lib - 建立一个库的makefile。
        // C> vcapp - 建立一个应用程序的Visual Studio项目文件。
        // D> vclib - 建立一个库的Visual Studio项目文件。
        // E> subdirs - 这是一个特殊的模板，它可以创建一个能够进入特定目录并且为一个项目文件生成makefile并且为它调用make的makefile。

    ```

### main

    ```
    #include "helloworld.h"
    #include <QApplication>

    int main(int argc, char *argv[])
    {
        QApplication a(argc, argv);         // 应用程序对象,有且仅能有一个
        helloworld w;                       // 实例化窗口对象
        w.show();                           // show 是以等层级来显示的
        return a.exec();                    // 让应用程序对象进入消息循环, 让代码阻塞到本行
    }

    ```

 Q_OBJECT           // 允许类中使用信号和槽的机制

### lambda

### 信号和槽

connect(信号的发送者, 具体信号, 信号的接收者,信号的处理(槽))

1. 自定义信号
    1. 自定义信号写在 signal 下
    2. 返回值是 void, 只需要声明,不需要实现
    3. 可以有参数,可以重载

```teacher.h
signals:
    void hungry();
```

1. 自定义槽
    1. 低版本必须写在 public slots 下, 高版本可以写在 public 下
    2. 返回值是 void, 需要声明, **也需要实现**
    3. 可以有参数,可以发生重载

```student.h
public slots:
    void treat();
```

``` student.c
include <QDebug>
void Student::treak(){
    qDebug()<<"请老师吃饭"
}
```

```
this->tea = new Teacher(this);
this->stu = new Student(this);

connect(tea,&Teacher::hungry,stu,&Student::treat);
```





#### 图形化

右键 -> Go to slot

1. 点击按钮在控制台输出字符串

    ```helloworld.h
    #include <iostream>
    using namespace std;
    ```

    ```helloworld.cpp
    void helloworld::on_pushButton_clicked()
    {
        cout << "hello world" << endl;
        
    }
    ```

2. 点击按钮在控制台输出 textedit 的字符串 

    ```helloworld.h
    #include <iostream>
    using namespace std;
    ```

        ```helloworld.cpp
    void helloworld::on_pushButton_clicked()
    {
        cout << ui->textEdit->toPlainText().toStdString() <<endl;
    }
    ```

#### 不同平台文字尺寸问题

font 单位是 pointsize, 从ui 文件可知

1. 两种方法设置为 px

    方法一:
        在构造函数中:
            this->setStyleSheet("Qwidget{font-size:20px}");

    方法二:
        使用 QtDesigner 打开 ui 文件, 在 styleSheet 中输入属性
            > QWidget{font-size:20px}


1. 不同系统不同设置

    通过宏指定

    ```
    #ifdef Q_OS_MAC
        QWidget{font-size:30px}
    #else
        QWidget{font-size:20px}
    #endif

    ```

### QT的核心类库 QString

QT 对 c++ 字符串的封装

1. 拼接字符串

    方法1：

    ```
    QString str1 = "hello";
    str1 = "hello" + "world";
    str1 +="!!!";

    cout << str1.toStdString() << endl;
    ```

    方法2：

    ```
    QString str1 = "hello";
    QString str1 = "hello";
    str1.append(str2);          // 更改了 str1
    cout << str1.toStdString() << endl;
    ```

    方法3：arg 函数

    ```
    QString str1;
    str1 = QString("hello %1 %2").args("world").arg("!!!");
    ```

    方法4：
    ```
    QString str1;
    str1 = str1.asprintf("%s","welcome");
    ```
