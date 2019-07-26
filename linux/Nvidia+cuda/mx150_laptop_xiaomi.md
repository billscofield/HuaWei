## 什么是 CUDA
CUDA(Compute Unified Device Architecture)，是显卡厂商NVIDIA推出的运算平台。 CUDA™是一种由NVIDIA推出的通用并行计算架构，该架构使GPU能够解决复杂的计算问题。

## 什么是CUDNN?
NVIDIA cuDNN是用于深度神经网络的GPU加速库。它强调性能、易用性和低内存开销。NVIDIA cuDNN可以集成到更高级别的机器学习框架中，如加州大学伯克利分校的流行caffe软件。
简单的，插入式设计可以让开发人员专注于设计和实现神经网络模型，而不是调整性能，同时还可以在GPU上实现高性能现代并行计算。

## Nvidia 驱动
https://www.geforce.com/drivers

GeForce
GeForce MX100 Series(Notebook)
GeForce MX150
Linux 64-bit

run文件权限更改, 添加可执行权限


## 安装 nvidia 驱动

### 禁用nouveau
vi /etc/modprobe.d/blacklist.conf

blacklist nouveau
options nouveau modeset=0

杀掉所有 GPU 进程
    ```
    fuser -v /dev/nvidia*
    ```
查看 nvidia-smi

### 删除原有NVIDIA驱动

```
sudo apt-get --purge remove nvidia-*
sudo apt-get --purge remove xserver-xorg-video-nouveau
```

重启电脑，按Ctrl + Alt +F1到第一控制台（+F7是回到桌面），首先登录账号，然后结束图形化界面
    service lightdm stop

./NVIDIA-Linux-x86_64-390.77.run --no-x-check --no-nouveau-check --no-opengl-files

--no-x-check 安装驱动时，不检查 x 服务
--no-nouveau-check 安装驱动时不检查 nouveau
--no-opengl-files 只安装驱动文件，不安装OpenGL文件
-Z, --disable-nouveau：禁用nouveau。此参数非必需，因为之前已经手动禁用了nouveau。

    因为NVIDIA的驱动默认会安装OpenGL，而Ubuntu的内核本身也有OpenGL、且与GUI显示息息相关，一旦NVIDIA的驱动覆写了OpenGL，在GUI需要动态链接OpenGL库的时候就引起问题。


### 安装过程
1. 可能会出现提示The distribution-provided pre-install script failed are you sure you want to continue，没关系，继续进行

1. Would you like to register the kernel module sources with DKMS?This will allow DKMS to auomatically build a new module,if you install a different kernel later，选择No

1. Nvidia's 32-bit compatibility libraries，选择no即可

安装完成

sudo service lightdm start

### 验证驱动
nvidia-smi      若列出GPU的信息列表，表示驱动安装成功
nvidia-settings 若弹出设置对话框，亦表示驱动安装成功, 这个在服务器和小米笔记本上均没有成功?


## 安装CUDA
### 下载cuda

去掉第一个选项"安装驱动"


安装完成后会提示将下面两个加入到PATH
    export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
写入 .bashrc, source ~/.bashrc 即可
/etc/profile

### 验证 cuda 安装成功否

切换到 cuda 的 bin 目录，nvcc -V

或

CUDA Sample测试：

```
#编译并测试设备 deviceQuery：
cd /usr/local/cuda-8.0/samples/1_Utilities/deviceQuery
sudo make
./deviceQuery

#编译并测试带宽 bandwidthTest：
cd ../bandwidthTest
sudo make
./bandwidthTest
```

如果这两个测试的最后结果都是Result = PASS，说明CUDA安装成功啦

## cuDNN
1. 下载cuDNN，并解压缩
    tar xzvf cudnn-10.1-linux-x64-v7.6.0.64.tgz

1. 验证 cuDNN 安装成功

```
cp -r /usr/src/cudnn_samples_v7/ $HOME
cd  $HOME/cudnn_samples_v7/mnistCUDNN
make clean && make
./mnistCUDNN
```


## tensorlfow
pip install tensorflow-gpu
