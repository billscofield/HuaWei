# WINE

[link](https://techviewleo.com/install-and-use-wine-on-rocky-linux/)
```

dnf -y update
reboot
dnf -y install epel-release
dnf config-manager --set-enabled powertools
dnf groupinstall 'Development Tools' -y

yum -y install libxslt-devel libpng-devel libX11-devel zlib-devel libtiff-devel freetype-devel libxcb-devel  libxml2-devel libgcrypt-devel dbus-devel libjpeg-turbo-devel  fontconfig-devel gnutls-devel gstreamer1-devel libXcursor-devel libXi-devel libXrandr-devel libXfixes-devel libXinerama-devel libXcomposite-devel mesa-libOSMesa-devel libpcap-devel libusb-devel libv4l-devel libgphoto2-devel gstreamer1-devel libgudev SDL2-devel gsm-devel libvkd3d-devel libudev-devel

curl -O https://dl.winehq.org/wine/source/7.x/wine-7.22.tar.xz

tar xvf wine-*.tar.xz

cd wine-*/
mkdir build && cd build
../configure --prefix=/opt/wine722 --enable-win64
make
sudo make install

winecfg

You will be required to install Wine Mono package
Also install Wine Gecko:

wine64 --version
wine64 --help
```

## wine mono

Mono is an open-source and cross-platform implementation of the .NET Framework. Wine can use a Windows build of Mono to run .NET applications.

[Wine 和 Mono 版本对应关系](https://wiki.winehq.org/Mono)




## wine gecko

Wine implements its own version of Internet Explorer. The implementation is based on a custom version of Mozilla's Gecko Layout Engine

[Wine 和 Gecko 版本对应关系](https://wiki.winehq.org/Gecko)
