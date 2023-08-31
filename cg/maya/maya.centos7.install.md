1. may 主程序

    rpm -ivh Maya2023_64-2023.3-2072.x86_64.rpm
    Preparing...                          ################################# [100%]
    Updating / installing...
       1:Maya2023_64-2023.3-2072          ################################# [100%]
    /var/tmp/rpm-tmp.Ag4htq: line 41: /opt/Autodesk/AdskLicensing/12.1.0.7121/helper/AdskLicensingInstHelper: No such file or directory
    /var/tmp/rpm-tmp.Nudqii: line 41: /opt/Autodesk/AdskLicensing/12.1.0.7121/helper/AdskLicensingInstHelper: No such file or directory

    图标文件: /usr/autodesk/maya2023/desktop/maya.png

    // if we just extract this rpm or install it, it will warning that: error
    while loading shared libraries: libpng15.so.15: cannot open shared object
    file: No such file or directory

    yum list | grep libpng15
    yum install -y libpng15

    yum list | grep libGLU
    yum install -y libGLU libGLU-devel

    // after the upper two installing, we run ./maya2023, and errors is like this:
    ```
    maya: Autodesk MAYA 2023

    A licensing error occurred that Autodesk systems were not able to handle
    for you. Please contact Autodesk Customer Support for help in resolving
    this error.

    adlsdkAuthorize returned with error code: ADLSDK_STATUS_ADLS_NOT_FOUND

    The default location for log files to help diagnose the issue is:
    "/usr/tmp/MayaCLM-23-08-2023.log"

    ```

    if we replace the maya.bin with cracked one, errors is like this:

    ```
    ./maya2023: line 203: 33418 Segmentation fault      (core dumped) /root/2023/Packages/Maya2023_64-2023.3-2072.x86_64.rpm.unpack/usr/autodesk/maya2023/bin/maya.bin
    ```

/usr/share/desktop-directories/Autodesk-Maya2023.directory -> /usr/autodesk/maya2023/desktop/Autodesk-Maya.directory

2. bifrost 插件

    rpm -ivh Bifrost2023-2.5.1.0-2.5.1.0-1.x86_64.rpm 
    Preparing...                          ################################# [100%]
    Updating / installing...
       1:Bifrost2023-2.5.1.0-2.5.1.0-1    ################################# [100%]

        - /usr/autodesk/ApplicationPlugins/
        - /usr/autodesk/bifrost/
            tree -L 3 /usr/autodesk/bifrost/
                bifrost/
                └── maya2023
                    └── 2.5.1.0             // 可以单独下载安装, maya官网，maya 2023 linux, 更多，扩展
                        ├── bifrost
                        ├── bifrost.mod     // 默认复制到了 /usr/autodesk/modules/maya/2023/
                        ├── vnn
                        └── vnn.mod         // 默认复制到了 /usr/autodesk/modules/maya/2023/
        - /usr/autodesk/modules/

3. MayaUSD2023-202211021008-b68700b-0.20.0-1.x86_64.rpm

    rpm -ivh MayaUSD2023-202211021008-b68700b-0.20.0-1.x86_64.rpm

    Preparing...                          ################################# [100%]
    Updating / installing...
       1:MayaUSD2023-202211021008-b68700b-################################# [100%]

        - /usr/autodesk/mayausd/

        tree -L 3 mayausd/
        mayausd/
        └── maya2023
            └── 0.20.0_202211021008-b68700b
                ├── mayausd
                └── mayausd.mod            // 默认复制到了 /usr/autodesk/modules/maya/2023/

4. AdobeSubstance3DforMaya-2.3.1-2023-Linux.rpm

    rpm -ivh AdobeSubstance3DforMaya-2.3.1-2023-Linux.rpm
    Preparing...                          ################################# [100%]
    Updating / installing...
       1:Substance_in_Maya-2023-2.3.1-1.el################################# [100%]

    安装位置: /opt/Allegorithmic/Substance_in_Maya/2023

    /opt/Allegorithmic/Substance_in_Maya/2023/substance2.mod 会复制到/usr/autodesk/modules/maya/2023/


5. Pymel2023_64-2023.0-23.0.0.0.x86_64.rpm

    rpm -ivh Pymel2023_64-2023.0-23.0.0.0.x86_64.rpm

    Preparing...                          ################################# [100%]
    Updating / installing...
       1:Pymel2023_64-2023.0-23.0.0.0     ################################# [100%]

    WARNING: Running pip as the 'root' user can result in broken permissions
    and conflicting behaviour with the system package manager. It is
    recommended to use a virtual environment instead: https:
    //pip.pypa.io/warnings/venv

    WARNING: You are using pip version 21.2.4; however, version 23.1.2 is
    available.  You should consider upgrading via the
    '/usr/autodesk/maya2023/bin/mayapy -m pip install --upgrade pip' command.


    /usr/autodesk/pymel2023/pymel/pymel.txt

    /usr/autodesk/maya2023/bin/mayapy


    chmod 777 -R /usr/autodesk

    if we run ./maya2023 right now , the same error as step 1 comes:

    ```
    ./maya2023
    maya: Autodesk MAYA 2023

    A licensing error occurred that Autodesk systems were not able to handle for
    you. Please contact Autodesk Customer Support for help in resolving this error.

    adlsdkAuthorize returned with error code: ADLSDK_STATUS_ADLS_NOT_FOUND

    The default location for log files to help diagnose the issue is: 
    "/usr/tmp/MayaCLM-23-08-2023.log"

    ```

    "/usr/tmp/MayaCLM-23-08-2023.log":

    ```
    2023-08-23 21:01:16: ====== BEGIN MAYA CLM LICENSE DIAGNOSTICS (level 2) ======
    2023-08-23 21:01:16: INFO: MAYA VERSION: Autodesk MAYA 2023.3
    2023-08-23 21:01:16: INFO: Desktop Licensing Runtime Version: 6.3.1.44
    2023-08-23 21:01:16: INFO: Desktop Licensing API version in Maya: 6.3.1.44
    2023-08-23 21:01:16: INFO: initialize: GetInstance (Success)
    2023-08-23 21:01:27: INFO: Received LicenseUpdateCallback for Maya 2023 (ADLSDK_UPDATE_REASON_LICENSE_UPDATE): NOT Authorized
    2023-08-23 21:01:27: ERROR: Error Information: Maya 2023 : Retry limit exceeded connecting to the Service
    2023-08-23 21:01:27: ERROR: adlsdkAuthorize returned with error code: ADLSDK_STATUS_ADLS_NOT_FOUND
    2023-08-23 21:01:27: ERROR: checkinLicense: unable to release authentication handle
    2023-08-23 21:01:27: INFO: shutdown: normal exit

    ```


6. 和谐

    /usr/autodesk/maya2023/bin/maya.bin

6.1

    https://www.autodesk.com/support/technical/article/caas/sfdcarticles/sfdcarticles/Use-Installer-Helper.html

    /root/2023/Packages/adsklicensing12.1.0.7121-0-0.x86_64.rpm.unpack/opt/Autodesk/AdskLicensing/12.1.0.7121/helper/AdskLicensingInstHelper list

    reading configuration file /var/opt/Autodesk/AdskLicensingService/AdskLicensingService.data failed: open /var/opt/Autodesk/AdskLicensingService/AdskLicensingService.data: no such file or directory

7. 去除和 Autodesk 的通讯程序

    rm -f /usr/autodesk/maya2023/bin/ADPClientService
    启动后再去除一个文件的所有权限, 下边是收集的我们计算机的信息
    chomd 000 ~/.autodesk/UI/Autodesk/ADPSDK/JSON

    ~/.autodesk/CER         可以删除
    ~/.autodesk/Logs        可以删除

8. 启动

    /usr/autodesk/maya/bin/maya
    /usr/autodesk/maya/bin/maya.bin
    /usr/autodesk/maya/bin/maya2023

debian 问题

    rsync -av ODIS/libpng15.so.15 /mnt/usr/autodesk/maya2023.3/lib/

root 问题

    [12514:12514:0606/183216.759702:ERROR:zygote_host_impl_linux.cc(89)] Running as root without --no-sandbox is not supported. See https://crbug.com/638180.
    Stack trace:
    1Writing crash report in /usr/tmp/untitled[Recovered-root.2023-06-06-18.32].crash
    ./maya: line 203: 12514 Segmentation fault      /usr/autodesk/maya/bin/maya.bin


关闭启动欢迎界面问题

    windows / SettingsPreferences / Preferences
        Interface / Home Screen 
        去掉 Show Home Screen on startup

启动一次后就启动不了的问题

    https://forums.autodesk.com/t5/maya-forum/maya-2023-3-on-linux-fedora-error-corrupted-size-vs-prev-size/td-p/11663850

    The error is caused by the presence of this line in the userPrefs.mel file:

    -iv "isFirstTimeRunningMaya" 

    If you remove this line, then Maya will start up perfectly fine, of course
    when you save the preferences it adds the line back to the preferences file
    and you have to do it all over again next time you want to launch Maya.


    /home/liujiao/maya/2023/prefs/userPrefs.mel
    删掉 -iv "isFirstTimeRunningMaya" 0
    但是每次重启 maya , 这个文件都会被回复出厂设置，chattr +i , 但是就保存不了新的配置了

    maya.sh
    ```
    sed -i '/isFirstTimeRunningMaya/d' ~/home/maya/2023/prefs/userPrefs.mel
    /usr/autodesk/maya2023/bin/maya2023
    ```

9. 启动图标

    /usr/share/applications/

10. 安装arnold

    https://help.autodesk.com/view/ARNOL/ENU/?guid=arnold_for_maya_install_am_Installing_Arnold_for_Maya_on_Linux_html

    sh MtoA-5.3.1.1-linux-2024.run

    输入 accept

    安装模式
        1) 自动
        2）解压

    安装路径
        /usr/autodesk/arnold/maya2023

        如果是手动解压安装的话，就把 mtoa.mod 复制到 /usr/autodesk/modules/maya/2023/

        Windows / Settings/Preferences / Plug in Manager / mtoa.so
            (/usr/autodesk/arnold/maya2023/plug-ins)
            勾选 loaded
            勾选 autoload

    和谐 arnold

         /usr/autodesk/arnold/maya2023/license/installer/Autodesk_Licensing-13.0.0.8122_01.run

         echo solidangle_LICENSE=5053@localhost >> /root/maya/2023/Maya.env

         或者使用 license 服务器

         solidangle_LICENSE=6053@10.0.0.5 >> /root/maya/2023/Maya.env

11. Krakatoa My(amazone)

    Thinkbox Krakatoa

    chmod +x KrakatoaMY_2.12.1_linux-x64.run
    ./KrakatoaMY_2.12.1_linux-x64.run

         --installDir <installDir>      Default: /opt/Thinkbox/Krakatoa Maya/

         --enable-components <enable-components>     Comma-separated list of components
             Default: krakatoaMY,maya2019Krakatoa,maya2020Krakatoa,maya2022Krakatoa,maya2023Krakatoa
             Allowed: krakatoaMY maya2019Krakatoa maya2020Krakatoa maya2022Krakatoa maya2023Krakatoa

         --maya2019InstallDir <maya2019InstallDir> Default: /opt/Autodesk/Maya2019
         --maya2020InstallDir <maya2020InstallDir> Default: /opt/Autodesk/Maya2020
         --maya2022InstallDir <maya2022InstallDir> Default: /opt/Autodesk/Maya2022
         --maya2023InstallDir <maya2023InstallDir> Default: /opt/Autodesk/Maya2023

    是一个体积粒子渲染器插件

    Windows / Settings/Preferences / Plug in Manager / MayaKrakatoa.so
        勾选 loaded
        勾选 autoload

    卸载

         /opt/Thinkbox/Krakatoa Maya/uninstall

12. Yeti 毛发插件

    https://peregrinelabs.com/pages/yeti-download
    不需要登陆

    Yeti-v4.2.8_Maya2023-linux.tar.gz

    直接解压到某个路径

    编辑 pgYetiMaya.mod


    然后复制到 /usr/autodesk/modules/maya/maya2023/

    Windows / Settings/Preferences / Plug in Manager / pgYetiMaya.so
        勾选 loaded
        勾选 autoload

    还需要复制 /usr/autodesk/Yeti-v5.2.4_Maya2023-linux/plug-ins/pgYetiArnoldMtoa.so 到
    /usr/autodesk/arnold/maya2023/extensions/

    /usr/autodesk/Yeti-v5.2.4_Maya2023-linux/plug-ins/ 这个文件夹有多种渲染器的连接器

    还需要复制 /usr/autodesk/Yeti-v5.2.4_Maya2023-linux/bin/pgYetiArnold.so 到
    /usr/autodesk/arnold/maya2023/shaders/


Maya.env

    // 关闭启动时显示主屏幕, Windows > Settings/Preferences > Preferences> Interface> Show Home Screen on startup
    MAYA_NO_HOME=1

    // 关闭CLIC IPM登入功能，可以大幅提升启动Maya的效率
    MAYA_DISABLE_CLIP_IPM=1

    // 关闭Customer Involvement Program (CIP)，可以加速关闭Maya时间
    MAYA_DISABLE_CIP=1

    // 关闭Customer Error Reporting (CER)，可以加速Maya错误时的需要提交反馈的关闭时间。
    MAYA_DISABLE_CER=1

    // LC_ALL确保Maya与系统颜色校正一起使用。
    LC_ALL=C

    solidangle_LICENSE=5053@localhost

    // deadline
    MAYA_MODULE_PATH=/media/share/DeadlineRepository10/submission/Maya/Client/Allusers


加速启动
