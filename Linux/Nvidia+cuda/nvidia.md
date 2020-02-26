

nvidia-smi是用来查看GPU使用情况的。我常用这个命令判断哪几块GPU空闲

+-----------------------------------------------------------------------------+
| NVIDIA-SMI 430.34       Driver Version: 430.34       CUDA Version: 10.1     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  TITAN V             Off  | 00000000:04:00.0 Off |                  N/A |
| 34%   48C    P2    36W / 250W |  11700MiB / 12066MiB |     25%      Default |
+-------------------------------+----------------------+----------------------+
|   1  TITAN V             Off  | 00000000:05:00.0 Off |                  N/A |
| 34%   49C    P2    39W / 250W |  11700MiB / 12066MiB |     23%      Default |
+-------------------------------+----------------------+----------------------+
|   2  TITAN V             Off  | 00000000:08:00.0 Off |                  N/A |
| 32%   47C    P2    38W / 250W |  11700MiB / 12066MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+
|   3  TITAN V             Off  | 00000000:09:00.0 Off |                  N/A |
| 34%   49C    P2    38W / 250W |  11700MiB / 12066MiB |     16%      Default |
+-------------------------------+----------------------+----------------------+
|   4  TITAN V             Off  | 00000000:84:00.0 Off |                  N/A |
| 32%   47C    P2    38W / 250W |   2611MiB / 12066MiB |      7%      Default |
+-------------------------------+----------------------+----------------------+
|   5  TITAN V             Off  | 00000000:85:00.0 Off |                  N/A |
| 29%   43C    P8    N/A /  N/A |      0MiB / 12066MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+
|   6  TITAN V             Off  | 00000000:88:00.0 Off |                  N/A |
| 29%   43C    P8    N/A /  N/A |      0MiB / 12066MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+
|   7  TITAN V             Off  | 00000000:89:00.0 Off |                  N/A |
| 28%   42C    P8    N/A /  N/A |      0MiB / 12066MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID   Type   Process name                             Usage      |
|=============================================================================|
|    0     19347      C   /usr/local/anaconda3/bin/python            11689MiB |
|    1     19347      C   /usr/local/anaconda3/bin/python            11689MiB |
|    2     19347      C   /usr/local/anaconda3/bin/python            11689MiB |
|    3     19347      C   /usr/local/anaconda3/bin/python            11689MiB |
|    4     20006      C   python                                      1207MiB |
|    4     32754      C   python                                      1393MiB |
+-----------------------------------------------------------------------------+

Fan                     有的设备不会返回转速，因为它不依赖风扇冷却而是通过其他外设保持低温
Temp                    是温度，单位摄氏度
Pwr                     是能耗，上方的Persistence-M：是持续模式的状态，持续模式虽然耗能大，但是在新的GPU应用启动时，花费的时间更少，这里显示的是off的状态。 
Bus-Id                  是涉及GPU总线的东西，domain:bus:device.function 
Disp.A                  是Display Active，表示GPU的显示是否初始化。
Memory Usage            是显存使用率
GPU-Util                GPU利用率
Volatile Uncorr. ECC    是否开启错误检查和纠正技术，0/DISABLED, 1/ENABLED
Compute M               是计算模式, 0/DEFAULT, 1/EXCLUSIVE_PROCESS, 2/PROHIBITED

显存占用和GPU占用是两个不一样的东西，显卡是由GPU和显存等组成的，显存和GPU的关系有点类似于内存和CPU的关系。我跑caffe代码的时候显存占得少，GPU占得多，师弟跑TensorFlow代码的时候，显存占得多，GPU占得少。


1. nvidia-smi -L       查询所有 GPU 的 id
    GPU 0: TITAN V (UUID: GPU-fdeec88a-60dc-851b-0fb1-a703a972b17d)
    GPU 1: TITAN V (UUID: GPU-efb000b7-bb74-86f9-e818-88342f6f08cb)
    GPU 2: TITAN V (UUID: GPU-eb179472-1ea6-c7b7-f161-81e1bb32ee39)
    GPU 3: TITAN V (UUID: GPU-80edfdd3-15b0-a136-8f9d-a8b3f775f7b3)
    GPU 4: TITAN V (UUID: GPU-758c67be-e884-bc18-d207-478f1fd0f5ae)
    GPU 5: TITAN V (UUID: GPU-b7259218-65c1-7b4e-e8bd-1a85fc09e0e8)
    GPU 6: TITAN V (UUID: GPU-fdc7d03d-6d23-80a8-8c90-7fa79d3ce414)
    GPU 7: TITAN V (UUID: GPU-f6210b3d-e249-b5b7-26cf-87a0237afc78)

1. nvidia-smi -i --id  查看某个 GPU

1. -l,   --loop=               Probe until Ctrl+C at specified second interval.
    nvidia-smi -l 10        不能指定GPU，是全部刷新,默认 5s 刷新一次

1. -f,   --filename=           Log to a specified file, rather than to stdout.
    将 nvidia-smi 的结果输出到指定文件


## nvidia-smi -q       查询所有GPU的当前详细信息

1. -q,   --query               Display GPU or Unit info
    所有GPU的信息, 前几行会显示 attached gpus 个数, 我的服务器实例是 8

1. nvidia-smi –q –u        显示单元而不是GPU的属性???单元是什么
    -u,   --unit                Show unit, rather than GPU, attributes.
nvidia-smi –q –i xxx    指定具体的GPU或unit信息
    每一个 GPU 172 行
nvidia-smi –q –f xxx    将查询的信息输出到具体的文件中，不在终端显示
nvidia-smi -q –d xxx    指定显示GPU卡某些信息，xxx参数可以为
                            MEMORY, 
                            UTILIZATION, 
                            ECC,
                            TEMPERATURE,
                            POWER,CLOCK,
                            COMPUTE,
                            PIDS,
                            PERFORMANCE,
                            SUPPORTED_CLOCKS,
                            PAGE_RETIREMENT,
                            ACCOUNTING

nvidia-smi –q –l 10    动态刷新信息，按Ctrl+C停止，可指定刷新频率，以秒为单位






## TensorFlow 指定 GPU 训练模型
### 第一种方法
如果要指定只用第0块 GPU 训练，可以在 python 代码中如下指定：
    ```
    import os
    os.environ['CUDA_VISIBLE_DEVICES']='0'
    运行 python 程序后，可发现就只有第0块 GPU 显示被占用
    ```

如果要指定多块 GPU，可以如下：
    ```
    os.environ['CUDA_VISIBLE_DEVICES']='1,2'
    ```

当然，上述这种方法不太方便，每次运行若换用 GPU 训练都需要改代码，可以在运行 python 程序的时候进行指定：
    ```
    CUDA_VISIBLE_DEVICES=0 python textCnn.py   
    ```

在训练模型的时候，使用了第2块GPU，并且其它几块GPU也没有被占，这种就相当于在我们运行程序的时候，将除第2块以外的GPU全部屏蔽了，只有第2块GPU对当前运行的程序是可见的。

### 第二种方法
tf.device('/gpu:2')

虽然指定了第2块GPU来训练，但是其它几个GPU也还是被占用，只是模型训练的时候，是在第2块GPU上进行




## cuda

cuda_8.0.61_375.26_linux.run
    前面的cuda_8.0.61代表cuda的版本，后面的375.26代表的对应的NVIDIA驱动的版本

### 安装 CUDA
安装 CUDA 的时候注意不要覆盖原来的 NVIDIA 驱动
注意是否创建软连接

    ```
    ...
    ===========
    = Summary =
    ===========
    Driver:   Not Selected
    Toolkit:  Installed in /usr/local/cuda-8.0
    Samples:  Installed in /root, but missing recommended libraries
     
    Please make sure that
     -   PATH includes /usr/local/cuda-8.0/bin
     -   LD_LIBRARY_PATH includes /usr/local/cuda-8.0/lib64, or, add /usr/local/cuda-8.0/lib64 to /etc/ld.so.conf and run ldconfig as root
     
    To uninstall the CUDA Toolkit, run the uninstall script in /usr/local/cuda-8.0/bin
     
    Please see CUDA_Installation_Guide_Linux.pdf in /usr/local/cuda-8.0/doc/pdf for detailed information on setting up CUDA.
     
    ***WARNING: Incomplete installation! This installation did not install the CUDA Driver. A driver of version at least 361.00 is required for CUDA 8.0 functionality to work.
     
    To install the driver using this installer, run the following command, replacing <CudaInstaller> with the name of this run file:
     
        sudo <CudaInstaller>.run -silent -driver
     
    Logfile is /tmp/cuda_install_6388.log   
    ```

### 配置CUDA相关环境变量 
修改~/.bashrc文件（或~/.zhsrc） 在文件末尾添加环境变量

    ```
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
    export PATH=$PATH:/usr/local/cuda/bin
    export CUDA_HOME=$CUDA_HOME:/usr/local/cuda

    但是发现 还要设置一个 LIBRARY_PATH
    export LIBRARY_PATH=/usr/local/cuda版本/lib64:$LIBRARY_PATH
    ```




CC compute capability

NVIDIA 算力表
    https://developer.nvidia.com/cuda-gpus
