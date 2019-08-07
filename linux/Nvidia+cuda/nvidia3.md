## 安装 nvidia 显卡驱动
lsmod | grep nouveau

    ```
    nouveau              1601536  0
    mxm_wmi                16384  1 nouveau
    video                  40960  1 nouveau
    i2c_algo_bit           16384  2 ast,nouveau
    ttm                    98304  2 ast,nouveau
    drm_kms_helper        151552  2 ast,nouveau
    drm                   352256  5 ast,nouveau,ttm,drm_kms_helper
    wmi                    16384  2 mxm_wmi,nouveau


    apt remove --purge nvidia*
    ```

vi /etc/modprobe/blacklist.conf
    
    ```
    blacklist nouveau
    options nouveau modeset=0

    update-initramfs -u

    重启后，执行：lsmod | grep nouveau。如果没有屏幕输出，说明禁用nouveau成功。

    service lightdm status

         lightdm status
        ● lightdm.service - Light Display Manager
           Loaded: loaded (/lib/systemd/system/lightdm.service; enabled; vendor preset: enabled)
          Drop-In: /lib/systemd/system/display-manager.service.d
                   └─xdiagnose.conf
           Active: active (running) since 三 2019-08-07 19:20:13 CST; 49s ago
             Docs: man:lightdm(1)
          Process: 1287 ExecStartPre=/bin/sh -c [ "$(basename $(cat /etc/X11/default-display-manager 2>/dev/null))" = "lightdm"  ] (code=exited, status=0/SUCCESS)
         Main PID: 1294 (lightdm)
           CGroup: /system.slice/lightdm.service
                   ├─1294 /usr/sbin/lightdm
                   ├─1337 /usr/lib/xorg/Xorg -core :0 -seat seat0 -auth /var/run/lightdm/root/:0 -nolisten tcp vt7 -novtswitch
                   └─1725 lightdm --session-child 12 19

        8月 07 19:20:17 hjimi-X11DAi-N lightdm[1657]: PAM unable to dlopen(pam_kwallet.so): /lib/security/pam_kwallet.so: cannot open shared object file: No such file or directory
        8月 07 19:20:17 hjimi-X11DAi-N lightdm[1657]: PAM adding faulty module: pam_kwallet.so
        8月 07 19:20:17 hjimi-X11DAi-N lightdm[1657]: PAM unable to dlopen(pam_kwallet5.so): /lib/security/pam_kwallet5.so: cannot open shared object file: No such file or directory
        8月 07 19:20:17 hjimi-X11DAi-N lightdm[1657]: PAM adding faulty module: pam_kwallet5.so
        8月 07 19:20:17 hjimi-X11DAi-N lightdm[1657]: pam_unix(lightdm-greeter:session): session opened for user lightdm by (uid=0)
        8月 07 19:20:19 hjimi-X11DAi-N lightdm[1725]: PAM unable to dlopen(pam_kwallet.so): /lib/security/pam_kwallet.so: cannot open shared object file: No such file or directory
        8月 07 19:20:19 hjimi-X11DAi-N lightdm[1725]: PAM adding faulty module: pam_kwallet.so
        8月 07 19:20:19 hjimi-X11DAi-N lightdm[1725]: PAM unable to dlopen(pam_kwallet5.so): /lib/security/pam_kwallet5.so: cannot open shared object file: No such file or directory
        8月 07 19:20:19 hjimi-X11DAi-N lightdm[1725]: PAM adding faulty module: pam_kwallet5.so
        8月 07 19:20:19 hjimi-X11DAi-N lightdm[1725]: pam_succeed_if(lightdm:auth): requirement "user ingroup nopasswdlogin" not met by user "hjimi"
        注意上边的 PAM unable ... 我在 更换桌面的时候就是这样的，然后不能登录

    service lightdm stop

    ./NVIDIA.run -no-opengl-files -no-x-check -no-nouveau-check
        不安装OpenGL文件。这个参数不可省略，否则会导致登陆界面死循环

    注意no-opengl-files
    
    nvidia-smi
    ```

## cuda

./cuda.run -no-opoengl-libs 表示只安装驱动文件，不安装OpenGL文件。必需参数，
    我没有写这个参数,看看吧

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

    ld config /usr/local/cuda/lib64/
    
    vi /etc/.bashrc
        export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
        export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
        export CUDA_HOME=/usr/local/cuda

    sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
    ```

    依次安装 runtime.deb、 dev.deb、doc.deb

    

## opencv
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

mkdir build;cd build
cmake -D CMAKE_INSTALL_PREFIX=/usr/local/opencv3.4.0 -D CMAKE_BUILD_TYPE=Release ..

make -j 30

make install
