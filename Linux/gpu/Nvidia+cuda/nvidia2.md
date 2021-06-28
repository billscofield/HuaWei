安装了nvidia会默认安装cuda吗？
    如果安转了，nvcc --version

    如果没有安装，那为什么 nvidia-smi 右上角会有一个 cuda10.0?

方案一
    如果会默认安装cuda10,则卸载cuda
    
    /usr/local/cuda-8.0/bin/uninstall_cuda_8.0.pl

    安装cuda-9.0
    配置环境变量 source ~/.bashrc

    检查当前cuda版本 nvcc --version

    cudnn的升级
    ```
    cudnn的升级方法与cuda的升级方法类似。

    （1）删除旧版本的cudnn

    sudo rm -rf /usr/local/cuda/include/cudnn.h
    sudo rm -rf /usr/local/cuda/lib64/libcudnn
    （2）安装新版本的cudnn

    下载所需要的cudnn版本（点击进入下载界面）

    解压文件，并在解压出的cuda文件夹中打开终端，执行如下命令：

    sudo cp include/cudnn.h /usr/local/cuda/include/
    sudo cp lib64/lib* /usr/local/cuda/lib64/
    （3）建立软链接

    在/usr/local/cuda/lib64目录下打开终端，执行如下指令：

    sudo chmod +r libcudnn.so.7.0.5
    sudo ln -sf libcudnn.so.7.0.5 libcudnn.so.7  
    sudo ln -sf libcudnn.so.7 libcudnn.so     
    sudo ldconfig
    （4）查看当前cudnn的版本

    在终端输入

    cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
    ```


直接安装 cuda, 会进行 nvidia 的安装提示

    不安装 nvidia , 安装 cuda 的时候安装 nvidia 驱动， 结果报错 /var/log/nvidia





## 
WARNING: Incomplete installation! This installation did not install the CUDA Driver. A driver of version at least 384.00 is required for CUDA 9.0 functionality to work.
但是已经安装了 418 的驱动

运行 cuda sample  /root/NVIDIA_CUDA-9.0_Samples/1_Utilities/deviceQuery/deviceQuery

发现
CUDA Driver Version / Runtime Version          10.1 / 9.0

其中 cuda Driver Version 是 nvidia-smi 中显示的, Runtime Version 是实际安装的cuda版本 : /usr/local/cuda






## device has ecc support   : disabled
ECC内存即纠错内存，简单的说，其具有发现错误，纠正错误的功能，一般多应用在高档台式电脑/服务器及图形工作站上，这将使整个电脑系统在工作时更趋于安全稳定
