cuda

./cuda.run -no-opoengl-libs 表示只安装驱动文件，不安装OpenGL文件。必需参数，
    我没有写这个参数,看看吧

export PATH=/usr/local/cuda/bin:${PATH}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}
export CUDA_HOME=/usr/local/cuda

sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*


安装完后进入 sample
    cd /root/NVIDIA_CUDA-9.0_Samples/1_Utilities/deviceQuery
    make -j 20
    ./deviceQuery
    
    看是否有输出，有正常输出就是安装成功了



## cudnn

    ```
    tar -zxf cudnn...tar.gz

    cp cuda/include/cudnn.h /usr/local/cuda/include/
    cp cuda/lib64/libcudnn* /usr/local/cuda/lib64/
        注意 源文件中是有软连接关系的，复制过去之后也要是软连接关系
        (ln -sf /usr/local/cuda-8.0/lib64/libcudnn.so.5.0.5 /usr/local/cuda-8.0/lib64/libcudnn.so.5)

    ldconfig /usr/local/cuda/lib64/
    
    ```

    依次安装 runtime.deb、 dev.deb、doc.deb

验证

    ```
    cd  cudnn_samples_v7/mnistCUDNN
    make && make install
    ./mnistCUDNN
    ```

    

## opencv
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

mkdir build;cd build
cmake -D CMAKE_INSTALL_PREFIX=/usr/local/opencv3.4.0 -D CMAKE_BUILD_TYPE=Release ..

make -j 30

make install


## opencv 

查看 opencv 版本
    pkg-config opencv --modversion

https://blog.csdn.net/qq_33431368/article/details/84717053

https://blog.csdn.net/qq_33431368/article/details/84754421
