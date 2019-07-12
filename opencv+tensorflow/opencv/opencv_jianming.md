import cv2
cv2.imread('图片',类型)
    0 灰度
    1 彩色
cv2.imshow('窗体名',读到的图片)

cv2.waitKey(0)  暂停,毫秒

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
    
