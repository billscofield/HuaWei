import cv2
cv2.imread('图片',类型)
    0 灰度
    1 彩色
cv2.imshow('窗体名',读到的图片)

cv2.waitKey(0)  暂停

## 主要模块
core
dnn 和神经网络相关
features2d  和匹配相关
imgcodecs
imgproc
ml 机器学习
objdetect
photo


## imread
    1. 完成了文件的读取
    1. 封装格式解析
        jpg png
            1. 文件头
            1. 文件数据
    1. 数据解码
    1. 数据加载


## 文件的写入
imwrite('图片名',图片)


图片质量压缩
    cv2.imwrite('a.jpg',img0,[cv2.IMWRITE_JPEG_QUALITY,0]) 
        [0,100]
        0 质量最差,压缩比越高


png 
    是无损压缩(压缩后不会像jpg那样变模糊)
    透明度属性

    [cv2.IMWRITE_PNG_COMPRESSION,0]
        [0,9]
        0 质量最好,压缩比越低


## 像素

RGB
深度 8bit [0,255]
    255的三次方

JPG图像大小 = 宽 * 高 * 3 * 8(bit) / 8(变成B) 
    640*480 0.87MB
PNG 还有 alpha通道

bgr blue,green,red


坐标系
    原点左上角

opencv 是 bgr
    单个像素点的 rgb 值的获取
        b,g,r = img[水平轴坐标,垂直轴坐标]

    画线(第10行，第一列到第100列)



img[行,列] = [255,255,255]


## tensorflow

类比 语法 api 原理

基础数据类型
运算符
流程
字典
数据

import tensorflow as tf

常量
    data1 = tf.constant(2.4)
    data2 = tf.Variable(10,name='var')

    直接print(data1) 是描述信息, sess.run(data1) 才是值




### 运行警告
Your CPU supports instructions that this TensorFlow binary was not compiled to use: AVX2 AVX512F FMA

为了提升CPU计算速度的。若你有支持cuda的GPU，则可以忽略这个问题，因为安装SSE4.1, SSE4.2, AVX, AVX2, FMA, 仅仅提升CPU的运算速度（大概有3倍）。

忽视警告，并屏蔽警告
    开头输入如下：
    import os
    os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

或者 安装 tensorflow-1.10.0-cp35-cp35m-linux_x86_64.whl 之后就只有一个报警了




## 概念

与 HTML 类似，TensorFlow 是用于表示某种类型的计算抽象（称为「计算图」）的框架。
但我们用 Python 操作 TensorFlow 时，我们用 Pyhton 代码做的第一件事就是构建计算图。
一旦完成，我们做的第二件事就是与它进行交互（启动 TensorFlow 的「会话」）。
但重要的是，要记住计算图不在变量内部；而是处在全局命名空间中。






tensor 是 tensorflow基础的一个概念——张量。 

Tensorflow用到了数据流图，数据流图包括数据（Data）、流（Flow）、图（Graph）。Tensorflow里的数据用到的都是tensor，所以谷歌起名为tensorflow。 

rank 维度
rank 为0,1,3,4,N
    0   scalar      标量
    1   Vector      向量
    2   Matrix      矩阵
    3   3D Array    3阶张量
    N   ND Array    N阶张量
这些标量、向量、矩阵和张量里每一个元素被称为tensor element（张量的元素），且同一个张量里元素的类型是保持一样的
