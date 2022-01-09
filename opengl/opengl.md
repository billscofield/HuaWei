
[link1](https://www.bilibili.com/video/BV1f7411Z7Dj)

[link2](https://www.bilibili.com/video/BV1uB4y1u7eB?from=search&seid=4256423893120418186&spm_id_from=333.337.0.0)

[link3](https://www.bilibili.com/video/BV1vU4y1w7Ke)


## OpenGL 简介

OpenGL 是一套由 SGI 公司发展出来的绘图函数库，它是一组 C 语言的函数，用于 2D 与
3D 图形应用程序的开发上。

OpenGL 让程序开发人员不需要考虑到各种显示卡底层运作是否相同的问题，硬件由
OpenGL 核心去沟通，因此只要显示卡支援 OpenGL，那么程序就不需要重新再移植，而程
序开发人员也不需要重新学习一组函数库来移植程序。


## 1. 安装OpenGL

1. 安装【编译器与基本的函式库】
    sudo apt-get install build-essential

2. 安装【OpenGLLibrary】
    sudo apt-get install libgl1-mesa-dev

3. 安装【OpenGL Utilities】
    sudo apt-get install libglu1-mesa-dev

    OpenGL Utilities 是一组建构于 OpenGL Library 之上的工具组，提供许多很方便的
    函数，使 OpenGL 更强大且更容易使用。

4. 安装【OpenGLUtility Toolkit】

    apt-get install libglut-dev

    OpenGL Utility Toolkit 是建立在 OpenGL Utilities 上面的工具箱，除了强化了 OpenGL Utilities 的不足之外，也增加了 OpenGL 对于视窗介面支援。

    注意：在这一步的时候，可能会出现以下情况，shell提示：

    Reading package lists... Done
    Building dependency tree
    Reading state information... Done
    E: Unable to locate package libglut-dev
    将上述 

        > sudo apt-get install libglut-dev
        
        改成
        
        > sudo apt-get install freeglut3-dev即可。
        
        话说 GLUT, FreeGLUT (已淘汰), https://cloud.tencent.com/developer/article/1638145?from=15425

    GLFW

        ```
        git clone https://gitee.com/billscofield/glfw.git
        cd glfw && mkdir build && cd build ^^ cmake .. && make -j 20 && make install
        ```

    GLAD是继GL3W，GLEW之后，当前最新的用来访问OpenGL规范接口的第三方库
        [安装方法](https://blog.csdn.net/qq_37996632/article/details/100518269)
        
        https://glad.dav1d.de
            language : c/c++
            specification: opengl
            gl Version 3.x
            profile: core
        随后点击页面右下角的GENERATE，接着跳入新的页面点击glad.zip进行下载。
        
        解压 glad的压缩包，cd进目录，将include目录下的两个文件夹glad和KHR复制到/usr/local/include中
        
        需要将 glad.c 放在工程目录下

5. 安装【其他开发包】
    sudo apt-get install libfreetype6-dev
    sudo apt-get install libglew-dev
    sudo apt-get install libglm-dev
    sudo apt-get install libsdl2-dev
    sudo apt-get install libsdl2-image-dev

6. 测试

示例test.c源码

```
nclude <GL/glut.h>


void init(void)
{
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glMatrixMode(GL_PROJECTION);
    glOrtho(-5, 5, -5, 5, 5, 15);
    glMatrixMode(GL_MODELVIEW);
    gluLookAt(0, 0, 10, 0, 0, 0, 0, 1, 0);

    return;

}

void display(void)
{
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(1.0, 0, 0);
    glutWireTeapot(3);
    glFlush();

    return;

}

int main(int argc, char *argv[])
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_RGB | GLUT_SINGLE);
    glutInitWindowPosition(0, 0);
    glutInitWindowSize(300, 300);
    glutCreateWindow("OpenGL 3D View");
    init();
    glutDisplayFunc(display);
    glutMainLoop();

    return 0;

}

编译程序时，执行以下指令：

gcc -o test test.c -lGL -lGLU -lglut

```

## 

1. opengl 中的4种光:

    1. 辐射光
    2. 环境光
    3. 镜面光
    4. 漫射光

2. opengl 组成

    1. opengl 核心库:      gl
        包含了 115 个基本的命令函数, 以 gl 为前缀,可以在任何 opengl 的工作平台上应用
        派生出来的函数原型有300多个

    2. opengl 实用编程库:  glu
        含有43个函数以 glu 为前缀,可以在任何 opengl 的工作平台上应用
        
        这部分函数通过调用核心库的函数,来实现一些较为复杂的操作,如纹理映射,坐标
        变换,网格化,曲线曲面以及二次物体(圆柱,球体等)绘制等
    
    3. opengl 编程辅助库:  aux
        包含31个函数,以 aux 为前缀,但他们不能在所有的 opengl 平台上使用
        主要用于窗口管理,输入输出处理以及绘制一些简单的三维物体

    4. opengl 实用程序工具包: (OpenGL utility toolkit, GLUT): glut
        包含30多个函数,以 glut 为前缀,
        主要提供基于窗口的工具,如窗口系统的初始化,多窗口管理,菜单管理,字体以及一些较复杂物体的绘制等.
        
        由于 glut 库中的窗口管理函数是不依赖于运行环境的,可以在任何 opengl 的工作平台上应用

    5. windows 专用库:     wgl
    6. win32 API 函数库

函数命名规则

    <库前缀><根命令><可选的参数个数><可选的参数类型>

    例如 glColor3f(...)
        来自 gl.h
        color 表示该函数用于颜色设定
        3f 表示这个函数采用了三个浮点数参数


数据类型
    和C语言一致

    GLbyte      char
    GLshort     short
    GLint       long
    GLfloat     float
    GLdouble    double
    GLubyte     unsigned char
    GLuint      unsigned long

库文件位置
    /usr/include/GL


## OpenGL 程序实例

1. 窗口管理

    1. 初始化(glutInit)

    2. 创建窗口(glutCreateWindow)

    3. 窗口的显示模式(glutInitDisplayMode)

    4. 窗口位置和大小(glutWindowPosition 和 glutInitWindowSize)

    5. 指定窗口的显示内容函数(glutDisplayFunc)

    6. 运行框架(glutMainLoop)

1. 绘制图形

    1. 指定窗口背景色(glClearColor)

        颜色管理,使用 RGB 颜色模型, 一种颜色用 RGB 三种颜色成分混合而成,每种颜
        色成分使用 [0.0,1.0] 之间的任意有效浮点数来表示

    2. 刷新窗口的缓冲区(glClear)

    3. 设定投影参数
        
        ```
        glMatrixMode(GL_PROJECTION);
        gluOrtho2D(0.0,200.0,0.0,150.0);
        ```

    4. 绘制图形
        
        > glRectf(50.0f,100.0f,150.0f,50.0f);


## MVP 变换

Model transform 模型变换
    通过矩阵对模型进行平移,旋转,缩放等变幻,只是针对模型本身

View transform 观察变换
    计算模型在摄像机坐标系下的位置, **摄像机永远看向摄像机坐标系的 -z 轴**

Projection transform 投影变换
    将摄像机坐标系中的物体,投影到建材平面中,从而进行光栅化


## shader 语言

在 GPU 编程所用的东西 - GLSL


## OpenGL 渲染管线概览

Vertex Data

Vertex Shader

Shaper Assembly

Geometry Shader

Rasterization

Fragment shader

Tests and blending(混合)
