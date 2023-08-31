# WINE

Wine （“Wine Is Not an Emulator” 的首字母缩写）是一个能够在多种POSIX-compliant
操作系统（诸如 Linux，macOS 及 BSD 等）上运行 Windows 应用的兼容层。Wine 不是像
虚拟机或者模拟器一样模仿内部的 Windows 逻辑，而是將 Windows API 调用翻译成为动
态的 POSIX 调用，免除了性能和其他一些行为的内存占用，让你能够干净地集合 Windows
应用到你的桌面。

Wine is a compatibility layer that allows users to run Windows applications on
Linux, macOS and other Unix-like operating systems. Wine is an open-source
software, and it's available for free under the GNU Lesser General Public
License.

**WineHQ, on the other hand, is the official website of the Wine project.** WineHQ
provides documentation, support, and a community for Wine users and developers.
WineHQ hosts a database of compatible Windows applications and provides
instructions on how to install and run them on different operating systems.

Overall, while Wine is the actual software that allows you to run Windows
applications on Linux and other Unix-like systems, WineHQ is an online space
where users can find more information and get support for using Wine.


64bit 依赖
```
yum install -y libX11-devel freetype-devel zlib-devel libxcb-devel libXcursor-devel libXi-devel libXext-devel libXxf86vm-devel
libXrandr-devel libXinerama-devel libXcomposite-devel libGLU-devel mesa-libOSMesa-devel libpcap-devel hal-devel libv4l-devel
pulseaudio-libs-devel gsm-devel lcms2-devel alsa-lib-devel audiofile-devel cups-devel dbus-devel fontconfig-devel giflib-devel lcms-
devel libICE-devel libjpeg-turbo-devel libpng-devel libSM-devel libusb-devel libXau-devel libxml2-devel libXrender-devel libxslt-
devel libXt-devel libXv-devel mesa-libGL-devel mesa-libGLU-devel ncurses-devel openldap-devel openssl-devel pkgconfig sane-backends-
devel xorg-x11-proto-devel prelink fontforge flex bison openal-soft-devel samba-winbind
```

32bit 依赖
```
yum install -y audiofile-devel.i686 dbus-devel.i686 fontconfig-devel.i686 freetype.i686 freetype-devel.i686 giflib-devel.i686 lcms-devel.i686
libICE-devel.i686 libjpeg-turbo-devel.i686 libpng-devel.i686 libSM-devel.i686 libusb-devel.i686 libX11-devel.i686 libXau-devel.i686
libXcomposite-devel.i686 libXcursor-devel.i686 libXext-devel.i686 libXi-devel.i686 libXinerama-devel.i686 libxml2-devel.i686
libXrandr-devel.i686 libXrender-devel.i686 libxslt-devel.i686 libXt-devel.i686 libXv-devel.i686 libXxf86vm-devel.i686
mesa-libGL-devel.i686 mesa-libGLU-devel.i686 ncurses-devel.i686 openldap-devel.i686 openssl-devel.i686 zlib-devel.i686
sane-backends-devel.i686 glibc-devel.i686 libstdc++-devel.i686 pulseaudio-libs-devel.i686 gnutls-devel.i686 libgphoto2-devel.i686
openal-soft-devel.i686 isdn4k-utils-devel.i686 gsm-devel.i686 libv4l-devel.i686 cups-devel.i686 libtiff-devel.i686 gstreamer-devel.i686
gstreamer-plugins-base-devel.i686 gettext-devel.i686 libmpg123-devel.i686 lcms2-devel.i686 mesa-libOSMesa-devel.i686 libpcap-devel.i686
hal-devel.i686
```

[编译安装所需依赖](https://wiki.winehq.org/Building_Wine#head-6d87f1d37a9c2a482007eb047a9281be699dd3f0)

rocky8 32bit
    1. ../../configure --prefix=/opt/wine --with-wine64=../wine64 时候:
        Cannot build a 32-bit program, you need to install 32-bit development libraries.

        yum install -y glibc-devel.i686
        yum install -y libstdc++-devel.i686

    2. configure: error: X 32-bit development files not found. Wine will be
       built without X support, which probably isn't what you want. You will
       need to install 32-bit development packages of Xlib at the very least.
       Use the --without-x option if you really want this.

        [link](https://www.systutorials.com/install-32-bit-wine-1-8-centos-7/)
        yum install -y libX11-devel.i686

    3. configure: error: FreeType 32-bit development files not found. Fonts
       will not be built.  Use the --without-freetype option if you really want
       this.

       yum install glibc-devel.{i686,x86_64} libgcc.{i686,x86_64} libX11-devel.{i686,x86_64} freetype-devel.{i686,x86_64} gnutls-devel.{i686,x86_64} libxml2-devel.{i686,x86_64} libjpeg-turbo-devel.{i686,x86_64} libpng-devel.{i686,x86_64} libXrender-devel.{i686,x86_64} alsa-lib-devel.{i686,x86_64} -y 

       yum install -y fontconfig-devel.i686

       添加 --without-freetype

编译安装
```
mkdir build
cd build
mkdir wine64
cd wine64
../../configure --prefix=/opt/wine --enable-win64
make -j12
cd ..
mkdir wine32
cd wine32
../../configure --prefix=/opt/wine --with-wine64=../wine64
../../configure --prefix=/opt/wine --with-wine64=../wine64 --without-freetype
make -j12

make install

cd ../wine64
make install
```

echo "export PATH=$PATH:/opt/wine/bin" >>/etc/profile

winecfg

https://www.pianshen.com/article/19421412853/
https://zhuanlan.zhihu.com/p/141107518
