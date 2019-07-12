Open Source Computer Vision Library

1982年计算机视觉作为独立学科
OpenCV框架 intel开发
2004年人脸算法  富士通就加到自己的相机里了
2006年 发布 OpenCV 1.0   
openCV 2.x后将其开源，交给开源社区管理
Intel公司贡献出来的，尔罗斯工程师贡献大部分C/C++代码

https://github.com/opencv/opencv
http://opencv.org


教程地址
    https://www.bilibili.com/video/av24998616/?p=2

pip install opencv-python
pip install opencv-contrib-python   扩展的,这两个二选一即可,不要两个都安装
    https://pypi.org/project/opencv-python/

?如何查看opencv-python的版本呢？cv2就是3.X的版本，

## 加载修改保存图像
1. 加载图像    cv::imread       //blue,green,red
    1. 成为一个Mat对象
    1. imread(图像文件名,图像类型)
        -1: 解码得到的方式读入图像
        0:  imread按单通道的方式读入图像，即灰白图像
        1:  imread按三通道方式读入图像，即彩色图像

        cv2.imread('tupian.jpg',0)
            0 灰度
            1 彩色
        
        cv2.imshow('窗体名称',读到的图片)
        

        支持jpg,png,tiff等常见格式
    
1. 修改图像    cv::cvtColor
    1. cvtColor是Opencv里的**颜色空间**转换函数，可以实现RGB颜色向HSV，HSI等颜色空间的转换，也可以转换为灰度图像
    1. cvt is short for convert
    1. RGB的亮度不是一个单一的通道,最后再转换回来即可, 方便调节亮度，饱和度等
    
1. 保存图像    cv::imwrite


## 什么是图像
1. 结构化存储的数据信息
1. 图像的属性
    1. 通道数目
    1. 高与宽
    1. 像素数据
    1. 图像类型

## 加载显示
1. 加载
1. 保存

```
def get_image_info(image):
    pirnt(type(image))  #numpy.ndarray
    print(image.shape)  #(400,800,3)  高，宽，3个通道 ;  宽高颜色一共3个通道
    
    print(image.size)   //高×宽×通道 400*800*3
    pirnt(image.dtype)  //uint8 8bit 一个字节 np.unit8 数据类型，np.float32

    height = image.shape[0]
    weight = image.shape[1]
    channel = image.shape[2]

    for row in range(height):
        for col in range(width):
            for c in range(chanels):
                pv = image[row,col,c]
                image[row,col,c] = 255 - pv
    cv.imshow("demo",image)


def video_demo:
    capture = cv.VideoCapture(0)    #第零个摄像头,读取的视频没有声音，大小貌似有限制
    while(True):
        ret,frame = capture.read()  //return,frame
        frame = cv.flip(frame,1)    //左右镜像

        cv.imshow("video",frame)    //显示图像
        c = cv.waitKey(1000)        //每张frame延迟1s,那是不是越积越多?

        if c== 27:
            break
    


def create_image():
    img = np.zeros([400,400,3],np.uint8)
    img = np.ones([400,400,1],np.uint8)
    cv.imshow("new image",img)


img = cv2.imread('boqiu.jpg')
cv2.namedWindow('input image',cv2.WINDOW_AUTOSIZE)
cv2.imshow('input image',img)
# 上边的函数
cv2.waitKey(0)
cv2.destroyAllWindows()
```


## 识别图像中的头像
1. import cv2 as cv
1. cv.imread
1. cv.namedWindow() //没有也可以
1. cv.imshow
1. cv.waitKey(0)                暂停窗口
1. cv.destroyAllWindows()       关闭窗口


