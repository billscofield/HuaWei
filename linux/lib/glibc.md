## 手动编译安装 glibc-2.18 (centos7)


wget http://mirrors.ustc.edu.cn/gnu/libc/glibc-2.18.tar.gz

tar xf glibc-2.18.tar.gz

cd glibc-2.18

mkdir build && cd build

../configure --prefix=/opt/glibc2.18

make -j 12 && make install

LD_PRELOAD=/opt/glibc2.18/lib/libc-2.18.so
ln -s /opt/glibc2.18/lib/libc-2.18.so /lib64/libc.so.6


恢复
ln -s /lib64/libc-2.17.so /lib64/libc.so.6
