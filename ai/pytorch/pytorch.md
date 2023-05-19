## GOOGLE 阵营

Theano
Tensorflow1
    在Theano 基础上开发
Tensorflow2
    TF2.0 Eager Execution 已经引入动态图

    贾扬清是AI架构领域最厉害的华人之一，他创建了知名深度学习框架Caffe，还是
    TensorFlow、Pytorch的核心成员和共同领导者。

+Keras

可视化

部署方便
    TF serving

## Theano 阵营Tensorboard

## Facebook 阵营

Torch7
Caffe(华人)
PyTorch + Caffee2
    可视化通过visdom

    Visdom is a Python-based web server and toolkit for visualizing and
    monitoring the training of deep learning models. It was developed by
    Facebook Research to provide a flexible and interactive way to visualize
    and analyze training data in real-time.


## Amazon

MXnet(华人)

## 不同之处

动态图优先还是静态图优先

## Torch 发展

通用的机器学习框架

1. 2002 年 Torch
2. 2011 年 Torch7
    一直是 Lua 语言
3. 2016 年， fabu  0.1 THNN后端
4. 2018 1.0, CAFFE2 后端,弥补了工业上部署的不足
5. 2019.5 发布1.1
6. Facebook AI Research

借鉴了 Chainer 的接口设计

## pytorch 安装

### cuda

what is cuda

    CUDA (Compute Unified Device Architecture) is a parallel computing platform
    and application programming interface (API) developed by NVIDIA for use
    with its graphics processing units (GPUs).

    CUDA enables developers to harness the power of GPUs to perform
    general-purpose computing tasks, in addition to their traditional use in
    rendering graphics for video games and other visual applications.

    By using CUDA, developers can write software programs that can take
    advantage of the massively parallel nature of GPUs to achieve significant
    speedups over traditional CPU-based processing.

    CUDA is widely used in various fields such as scientific computing, machine
    learning, and image and video processing.

google 搜 cuda download

    Installation Instructions:

    1. wget https://developer.download.nvidia.com/compute/cuda/12.1.0/local_installers/cuda-repo-debian11-12-1-local_12.1.0-530.30.02-1_amd64.deb
    2. dpkg -i cuda-repo-debian11-12-1-local_12.1.0-530.30.02-1_amd64.deb
    3. sudo cp /var/cuda-repo-debian11-12-1-local/cuda-*-keyring.gpg /usr/share/keyrings/
    4. add-apt-repository contrib
    5. apt-get update
    6. apt-get -y install cuda

    报错:
        nvidia-libopencl1: conflicts: libopencl1
        ocl-icd-libopencl1: conflicts: libopencl1

        解决:
            apt remove ocl-icd-libopencl1:amd64
        还要确定重新安装驱动

    报错:
        | Mismatching nvidia kernel module loaded                                                                   │
        │                                                                                                           │
        │ The NVIDIA driver that is being installed (version 525.89.02) does not match the nvidia kernel module     │
        │ currently loaded (version 515.76).                                                                        │
        │                                                                                                           │
        │ The X server, OpenGL, and GPGPU applications may not work properly.                                       │
        │                                                                                                           │
        │ The easiest way to fix this is to reboot the machine once the installation has finished. You can also     │
        │ stop the X server (usually by stopping the login manager, e.g. gdm3, sddm, or xdm), manually unload the   │
        │ module ("modprobe -r nvidia"), and restart the X server.                                                  │

nvcc: cuda的编译器

nvcc -V


### pytorch

安装 pytorch

官方文档

验证 pytorch 安装完成

```
import torch

print(torch.__version__)
print('gpu ', torch.cuda.is_available())
```


torch.hub.load('facebookresearch/pytorchvideo', 'slow_r50', pretrained=True) 报错
pip install fvcore


torch.hub.help('pytorch/vision', 'resnet18', force_reload=True) 报错

### cudnn

[下载](https://developer.nvidia.com/rdp/cudnn-download)

dpkg -i

export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

[cuda-samples](https://github.com/NVIDIA/cuda-samples.git)

As of CUDA 11.6, all CUDA samples are now only available on the GitHub
repository. They are no longer available via CUDA toolkit.

```
cd /usr/local/cuda/samples/1_Utilities/deviceQuery
make (Use -Wno-deprecated-gpu-targets to suppress warning).
mkdir -p ../../bin/x86_64/linux/release
cp deviceQuery ../../bin/x86_64/linux/release

/usr/local/cuda/samples/1_Utilities/deviceQuery# ./deviceQuery
```

输出

    deviceQuery, CUDA Driver = CUDART, CUDA Driver Version = 12.0, CUDA Runtime Version = 11.8, NumDevs = 1
    Result = PASS

    PASS 表示成功

    配置 /etc/ld.so.conf.d/cuda.conf
        默认是这个：/usr/local/cuda-11/targets/x86_64-linux/lib/

        /usr/local/cuda/lib64/

    应该都是一样的，都是134个文件
    比较了md5值，是一样的
    
