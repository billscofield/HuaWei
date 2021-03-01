links:

    https://www.jianguoyun.com/s/downloads/linux#build_from_src

## aarch raspbian 4B

How to install from source code

1. Resolve package dependencies

    apt install libgtk2.0-dev libnautilus-extension-dev

2. Download source code of Nutstore plugin for Nautilus: nutstore_linux_src_installer.tar.gz

    ```
    wget https://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz

    ```
3. Decompress，compile and install the plugin

    $> tar zxf nutstore_linux_src_installer.tar.gz
    $> cd nutstore_linux_src_installer && ./configure --build=arm && make
    $> sudo make install

4. Relauch Nautilus

    $> nautilus -q

5. Run this command to download and install other binary files

    $> ./runtime_bootstrap


    ```报错信息如下，可以是没有 aarch64 的编译包吧
    nutstore_linux_src_installer ./runtime_bootstrap
    ********************************************
    fetching distribution package


    --2021-02-28 17:26:34--  http://www.jianguoyun.com/static/exe/installer/nutstore_linux_dist_aarch64.tar.gz
    Resolving www.jianguoyun.com (www.jianguoyun.com)... 118.186.60.195
    Connecting to www.jianguoyun.com (www.jianguoyun.com)|118.186.60.195|:80... connected.
    HTTP request sent, awaiting response... 404 Not Found
    2021-02-28 17:26:34 ERROR 404: Not Found.
    ```



You can also read the README file in the source code.
