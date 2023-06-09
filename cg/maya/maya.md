# maya

设置英文/中文显示:
    windows:
        方法一
            新建一个环境变量:
                Maya_ui_language -> en_US
                zh_CN

        方法二:
            安装文件夹/resources/I10n/zh_CN     //使用的是中文版，就是 zh_CN, 改为 en_US 就是英文

CPU 建议

    Modeling and animation in Maya are primarily single-threaded, so you want a CPU
    with the highest possible clock speed – but core count is not particularly
    important. 

GPU 建议

    Do I need to use a Quadro card for Maya or is GeForce okay?

    Maya needs a fairly powerful video card, unless you are exclusively
    rendering, and Autodesk’s official stance is that NVIDIA’s professional
    graphics cards (formerly Quadro) are certified for this application. They
    do also test GeForce cards, so those should work fine for most users and
    may be preferred for those working in game dev, but pro-grade cards are
    optimized by NVIDIA to be more reliable in the long-term.

## Linux

How to install Maya to a custom path on Linux?

[官方说明](https://knowledge.autodesk.com/support/maya/learn-explore/caas/sfdcarticles/sfdcarticles/How-to-install-Maya-to-a-custom-path-on-Linux.html)

Some installation files have embedded multiple configuration paths for Maya to
run properly. Any service packs or add ins installed would probably not work if
Maya was installed (or moved) to a custom location. For that reason there is no
recommended process to install Maya to a different path (location). Anyone
trying to do so would be discouraged because of the reasons above.

主要安装了哪些文件?

/usr/autodesk/
    chmod +x /usr/autodesk/bin/maya.bin
/opt/Autodesk
/var/flexlm
/var/opt/Autodesk

直接 mv /usr/autodesk 到 共享盘即可

---

./Setup --help

```
Usage:
  --access_install_type arg    Type of installation from Access
  --install_type arg           Type of installation
  --download_id arg            Download ID
  --analytics_id arg           Analytics ID
  --delegate_type arg          Launch DDA-Core as delegate
  --tmp_dir arg                Temporary folder path
  --skip_process_manager       Pass this flag to avoid process manager 
                               starting.
  --offline_mode               Product should be installed as trial
  --installer_version arg      ODIS installer version from the installer 
                               manifest
  --trigger_point arg          [inProduct|system|local|web|access]
  --trial_mode                 Product should be installed as trial
  --exclude_odis_install       Exclude ODIS installation
  -u [ --url_root ] arg        Download host sub domain
  -e [ --extract_path ] arg    Download extraction location
  -a [ --auxiliary_path ] arg  Location of program auxiliaries
  -l [ --language_code ] arg   Language code for install
  --extension_manifest arg     Manifest extension file location
  --component_tests            Running of Component Tests
  --session_id arg             Session ID of install
  --props arg                  Properties for use during Install
  -x [ --manifest_xsd ] arg    Manifest schema location
  -r [ --retryLimit ] arg      Remaining retry limit in case of auto-update
  -c [ --config ] arg          Config file location
  -d [ --install_dest ] arg    Install destination location
  --odi_command_name arg       Command name for On-Demand-Install (ODI) 
                               workflow
  -h [ --help ]                Print help message
  --release arg                Release year of the product, as part of the UPI1
  --hide_eula                  hide EULA page or not
  --ui_mode arg                [full|basic|silent]
  --portal_session_id arg      Portal Session ID
  -m [ --manifest ] arg        Manifest file location
  --auth_param arg             Download link authentication token
  --extension_manifest_xsd arg Schema extension file location
  --mount_point arg            Mount point of bundle to get clean up
  -p [ --program_path ] arg    Location of program executable
  --suppress_uac               Run in suppress UAC mode, process manager will 
                               be launched by TaskHost service
  -o [ --deployment ] arg      Deployment manifest
  --manifest_id arg            GUID value representing the manifest to load
  --installation_id arg        installation ID
  -s [ --install_source ] arg  Install source location
  --plc arg                    Product line code of the product, as part of the
                               UPI1
  -q [ --silent ]              Silent mode
  --auto_update                Installation is an auto-update
  -i [ --install_mode ] arg    [install|modify|uninstall|deploy]

```





QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/var/tmp/runtime-root'
QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/var/tmp/runtime-root'
process 38451: D-Bus library appears to be incorrectly set up; failed to read machine uuid: UUID file '/etc/machine-id' should contain a hex string of length 32, not length 36, with no other text
See the manual page for dbus-uuidgen to correct this issue.
  D-Bus not built with -rdynamic so unable to print a backtrace
./maya2023: line 203: 38451 Aborted                 /usr/autodesk/maya2023/bin/maya.bin



## 2023 安装

Package 目录结构
    AdobeSubstance3DforMaya-2.3.1-2023-Linux.rpm
    Bifrost2023-2.5.1.0-2.5.1.0-1.x86_64.rpm
    Maya2023_64-2023.3-2072.x86_64.rpm
    MayaUSD2023-202211021008-b68700b-0.20.0-1.x86_64.rpm
    Pymel2023_64-2023.0-23.0.0.0.x86_64.rpm

    // RokokoMotionLibraryMaya2022? 运动捕捉库/插件, 2023 中没有这个

    adskflexnetserverIPV6-11.18.0-0.x86_64.rpm      这个不用安装

    Licensing/

    package.zip
    pkg.bifrost.xml
    pkg.mayausd.xml
    pkg.maya.xml
    pkg.mtoa.xml
    pkg.pymel.xml
    pkg.substance.xml

    unix_installer.py
    unix_installer.sh


Package/Licensing 目录结构
    这几个不用安装
    adlmapps25-25.0.3-0.x86_64.rpm
    adskflexnetclient-11.16.0-0.x86_64.rpm
    adskflexnetserverIPV6-11.18.0-0.x86_64.rpm  // install.sh 中没有安装这个
    adsklicensing12.1.0.7121-0-0.x86_64.rpm

    install.sh

    pkg.adlmapps.xml
    pkg.adskflexnetclient.xml
    pkg.licensing.xml

    这个目录存在的目的：

        如果升级了maya, 老版本的maya可能就不能使用新版本的许可管理, 或者许可管
        理坏掉了，就可以重新安装, 运行 install.sh


### centos 尝试安装

packages 中删除所有licensing 中有的rpm包

    yum install -y ./Packages/*

    rpm -ivh Maya2023_64-2023.3-2072.x86_64.rpm
    AdobeSubstance3DforMaya-2.3.1-2023-Linux.rpm
    Bifrost2023-2.5.1.0-2.5.1.0-1.x86_64.rpm
    MayaUSD2023-202211021008-b68700b-0.20.0-1.x86_64.rpm
    Pymel2023_64-2023.0-23.0.0.0.x86_64.rpm

### 附录

1. Adobe Substance 3D for Maya

    Adobe Substance 3D plugins for Maya are a set of plugins provided by Adobe
    for integrating Substance 3D application functionalities into Autodesk
    Maya. These plugins allow Maya users to import, edit, and manipulate
    Substance 3D materials.

    After installing the plugins, users can access the Substance 3D features
    from within the Maya interface. The Substance 3D nodes can be added to the
    Maya Hypershade editor and used to apply Substance materials to Maya
    objects.

2. adskflexnetserverIPV6-11.18.0-0.x86_64.rpm

    ADSK FlexNetServer is a license management software that is used by
    Autodesk products to manage licenses on a network. Autodesk software
    products are typically licensed on a per-seat basis, which means that each
    computer that runs the software must have a license. The ADSKFlexNetServer
    allows licenses to be shared across a network of computers, making it
    easier to manage licenses for multiple users.

    The ADSKFlexNetServer software runs on a server computer and manages
    licenses for Autodesk products that are installed on client computers.
    Clients connect to the server to obtain a license for the software they
    want to use. The server tracks the number of licenses that are in use and
    ensures that clients do not exceed the number of licenses that are
    available.

    The ADSKFlexNetServer software is typically installed on a dedicated server
    computer that runs continuously. The server can be configured to
    automatically start when the computer boots up and to start the license
    service automatically.

    To use the ADSKFlexNetServer, **you must first obtain a license server host
    ID from Autodesk and purchase the necessary licenses for your Autodesk
    products.** Then, you can install and configure the ADSKFlexNetServer on your
    server computer. Client computers can then be configured to connect to the
    server to obtain licenses as needed.

3. what is FlexNet license client software

    FlexNet license client software is the program that manages the validation
    and communication of software licenses for products that use FlexNet
    licensing technology. The software client handles the communication with
    the licensing server and verifies that the end user is authorized to use
    the licensed software. Many software products use FlexNet licensing
    technology, including Autodesk products, which use a specific
    implementation of the FlexNet licensing system called "adskflexnetclient".
    The FlexNet licensing system is also used by other software companies to
    manage their licensing models and help protect their intellectual property.

4. which company developed the FlexNet license software

    The FlexNet license software is developed by **[Flexera](https://www.flexera.com/)**,
    a company that specializes in providing software and hardware asset
    management solutions, software monetization solutions, as well as
    installation and packaging solutions for software vendors. The FlexNet
    licensing technology is one of the core products developed by Flexera,
    aimed at helping software vendors manage the licensing models and protect
    their intellectual property.

5. how to configure flexnet client configure in linux

    To configure the FlexNet client in Linux, you will need to follow the steps
    outlined in the product-specific documentation for the software that you
    are using. Generally, the process involves installing the adskflexnetclient
    package, obtaining a license file from the software vendor, and configuring
    the FlexNet client to use that license file. Here is an example of the
    steps to configure the FlexNet client for an Autodesk product on a Linux
    system:

        1. Install the adskflexnetclient package using your Linux package
           manager.

        2. Obtain a license file from Autodesk or your software reseller.

        3. Copy the license file to a location on your Linux system.

        4. Configure the FlexNet client to use the license file by setting the
           **ADSKFLEX_LICENSE_FILE** environment variable to the path of the
           license file. For example:

        5. export ADSKFLEX_LICENSE_FILE=/path/to/licensefile.lic

6. What is adlmapps

    ADLMAPPS is a component that is used by Autodesk products to manage product
    licensing and activation. It is a set of libraries and executables used by
    Autodesk software to communicate with the Autodesk licensing servers and
    validate product licenses.

    ADLMAPPS is responsible for verifying the authenticity and validity of the
    license key used by the product. It also manages online activation and
    deactivation of licenses. It interfaces with other Autodesk licensing
    components like the Autodesk Licensing Service and ADSKFLEX license server
    technology.

    ADLMAPPS is typically installed automatically alongside other Autodesk
    software. However, it may need to be updated or reinstalled separately in
    some cases. The software is available for Windows, macOS, and Linux
    operating systems.

    ADLMAPPS is an important component for Autodesk software products, as it
    ensures that the software is properly licensed and that users have access
    to the features and functionality that they paid for.


### record

2022 的 license file

    /var/flexlm/maya.lic
    ```
    SERVER 10.0.0.5 0
    USE_SERVER
    ```

    mudbox.lic
    ```
    SERVER 10.0.0.6 0
    USE_SERVER
    ```



## plugins

### ziva

ISV Servers Name: zivadyn

2.1 的linux rlm server 里边没有 ziva 的license, 需要从1.8 的里边拿过来，并且在**网页端**重启 server

客户端上的license地址设置:

    /home/liangshu/maya/modules/ZivaVFX-Maya-2_1/zivavfx.lic

    ```
    HOST 10.0.6.140 ANY 5053
    ```

## 网络部署安装

[How to create an Autodesk Maya 2020 network deployment](https://www.autodesk.com/support/technical/article/caas/sfdcarticles/sfdcarticles/How-to-create-Maya-2020-network-deployment-Windows.html)


## License File

### 格式

1.  The format of the SERVER line is:

    SERVER host hostid [port] [PRIMARY_IS_MASTER] [HEARTBEAT_INTERVAL=seconds]

    For example:

    SERVER my_server 17007ea8 21987

    - host

        The system host name or IP address. String returned by the UNIX
        hostname or uname -n command.

    - hostid

        Usually the string returned by the lmhostid command. This is changed
        only by your publisher.

    - port

        TCP/IP port number to use. You can edit this value either directly in
        the license file or using lmadmin. In the latter case, the port number
        specified in lmadmin takes precedence over any port set in the license
        file, either before or after the port is specified using lmadmin.
        Therefore, editing the port number using lmadmin is only recommended if
        no port number is specified in the license file.  If a port number is
        already specified in the license file and the port is subsequently
        changed in lmadmin, during the next restart the vendor daemon will exit
        with a “port mismatch” error.

        A valid number is any unused port number in the range 1 to 65535. On
        UNIX, choose a port >1024, since those <1024 are privileged port
        numbers.

        If you specify a port number greater than 65535, the client fails to
        establish a connection with the license server manager (lmgrd or
        lmadmin).

        If no port number is specified, one of the default ports in the range
        27000 to 27009 is used.

        You must specify a port number when the SERVER line defines license
        servers configured for three-server redundancy.

    - PRIMARY_IS_MASTER

        Used with license servers configured for three-server redundancy to indicate
    how master control is transferred between the primary and secondary servers.

            1. If this is set and the primary server goes down, when the
               primary server comes back up again, it will always become the
               master.

            2. If this is not set and the primary server goes down, the
               secondary server becomes the master and remains the master even
               when the primary server comes back up. The primary can only
               become the master again when the secondary license server fails.

        If both primary and secondary go down, licenses are no longer served.
        The tertiary server never becomes the master.

        This parameter is optional and is placed on the first SERVER line in
        the license file. You must be running a version 10.8 or later vendor
        daemon to use this parameter.

    - HEARTBEAT_INTERVAL=seconds

        Used with license servers configured for three-server redundancy to
        indicate how long a license server waits to receive a heartbeat from
        another license server in the triad before shutting itself down. The
        seconds value is used in the following equation to calculate the
        timeout:

        timeout = (3 x seconds) + (seconds - 1)

        Valid timeout value is 0-120. If not specified, the default value for
        seconds is 20, equating to an actual timeout value of 79 seconds. Valid
        values for the seconds value are 0–30.

2. vendor lines

    The VENDOR line specifies the daemon name and path. The license server uses
    this line to start the vendor daemon, **and the vendor daemon reads it to
    find its options file.** The format of the VENDOR line is shown below.

    VENDOR vendor [vendor_daemon_path] [[OPTIONS=]options_file_path] [[PORT=]port]

    - vendor

        Name of the vendor daemon used to serve some features in the file. This name
    cannot be changed.

    - vendor_daemon_path

        Optional path to the executable for this daemon. Generally, the license
        administrator is free to install the vendor daemon in any directory. It
        is recommended, however, that it be installed in a local directory on
        the license server.

        If omitted, the license server looks for the vendor daemon binary in:

            1. the current directory (lmgrd only)

            2. the path specified in the license server’s $PATH environment variable

            3. in the directory where the license server is located

        If vendor_daemon_path is blank, then any option or TCP/IP port number
        specifications require the OPTIONS= and PORT= strings.


    - options_file_path

        Full path to the options file for this daemon. An options file is not
        required.

        If omitted, the vendor daemon, by default, looks for a file called
        vendor.opt (where vendor is the vendor daemon name) located in the same
        directory as the license file.

    -port

        Vendor daemon TCP/IP port number.

        A valid number is any unused port number in the range 0 to 65535. On
        UNIX, choose a port >1024, since those <1024 are privileged port
        numbers.

        If port is not specified or if a port value of 0 is specified, an
        ephemeral port is chosen by the operating system at run-time. Sites
        with Internet firewalls need to specify the TCP/IP port number the
        daemon uses. If a TCP/IP port number is specified on the VENDOR line,
        there may be a delay restarting the vendor daemon.

3. USE_SERVER Line

    The USE_SERVER line takes no arguments and has no impact on the license
    server. When the application sees the USE_SERVER line, it ignores
    everything in the license file except the preceding SERVER lines and
    transfers checkout validation to the vendor daemon.

    USE_SERVER is recommended since it improves performance when a license
    server is used. For uncounted features, USE_SERVER is used to force logging
    of usage by the daemons.

4. FEATURE and INCREMENT Lines

    



## NLM(Network License Manager)

m0nkrus 俄罗斯大神

### 有哪些授权方式

Specify Maya 2020 licensing method to one of the following:
    - MayaNetworkLicense (this is the default selection)
    - MayaDistributedNetworkLicense
    - MayaRedundantNetworkLicense
    - MayaStandaloneLicense
    - MayaUserLicense


### linux

安装 NLM

1. 下载 [NLM for Linux](https://www.autodesk.com/support/technical/article/caas/tsarticles/ts/2HEQiQ5PtCDDk6WX0ox1mq.html)

    nlm11.18.0.0_ipv4_ipv6_linux64.rpm(安装的时候发现就是 adskflexnetserverIPV6-11.18.0-0.x86_64)

2. 以超级用户身份（使用 su）打开 shell。

3. 从下载的压缩文件中解压 NLM 软件包或导航到产品安装介质上的 NetworkLicenseManager 目录。

4. 输入以下命令，其中 # 是软件包编号：

    rpm -ivh adlmflexnetserver-#.rpm

注意：默认情况下，NLM 工具安装在 /opt/flexnetserver 中。

    /opt/flexnetserver
    ├── adskflex
    ├── LicenseAdministration.pdf
    ├── lmgrd
    └── lmutil

卸载 NLM

1. 先停止许可服务器，然后再卸载 NLM。

2. 以超级用户身份打开 shell。

3. 输入以下命令以验证安装的 Network License Manager 软件的软件包编号：

    rpm -qa | grep adlm

4. 输入以下命令以卸载 Network License Manager 软件包，其中 # 是软件包编号：

    rpm -e adlmflexnetserver-#.rpm

如果您编辑了 rc.local 文件来配置许可服务器（例如启动 lmgrd），请从 rc.local 文件中删除这些命令。





License server manager—lmadmin (or lmgrd)

License file

    Created by your software supplier. In this document the supplier of a
    FlexEnabled application is referred to as the publisher.

Vendor daemon

    Created by the publisher. Each publisher has their own vendor daemon. If
    you have FlexEnabled applications from several publishers, you will need to
    install multiple vendor daemons.

Debug log

    Written by the license server manager.





lmadmin—The configuration settings are permanent and mainly set using the user
interface. For details see lmadmin Online help and Using lmadmin.

lmgrd—The configuration settings are set when lmgrd is started. They are not
persistent. For details see License Server Manager “lmgrd”.



## How to specify Multi-user license type and license servers after Maya 2020 installation.

https://www.autodesk.com/support/technical/article/caas/sfdcarticles/sfdcarticles/Maya-2020-Automatic-Licensing.html#:~:text=Open%20a%20terminal%20window%20and%20run%20following%20commands%3A,name%20or%20its%20IP%20address%2C%20replace%20it%20accordingly.

1. cd /opt/Autodesk/AdskLicensing/9.2.1.2399/helper/
2. sudo ./AdskLicensingInstHelper change -pk 657L1 -pv 2020.0.0.F -lm NETWORK -lt SINGLE -ls 2080@192.168.198.1

- 192.168.198.1 is a place holder for the license server computer name or its
  IP address, replace it accordingly.

- If Autodesk Desktop Licensing Service update has been installed on your Linux
  system, replace 9.2.1.2399 in the command path, (step 1) with Current, as its
  with macOS and Windows command line.

- Explanation of the AdskLicensingInstHelper command switches:

    -pk 657L1 is Maya 2020 product key

    -pv 2020.0.0.F is Maya version

    -lm is Maya licensing method, NETWORK indicates Multi-user license

    -lt is network license server model. SINGLE indicates single license server model.

    -ls specifies license server computer and TCP port number.  The computer can be specified with hostname (a.k.a. computer name) or IP address.



## 破解团体

### "MAGNiTUDE" 

"MAGNiTUDE" is the name of a software cracking group that has been active since
the late 1990s. Software cracking refers to the process of modifying software
to remove copy protection or other forms of software security, typically to
enable the software to be used without purchasing a license or to make illegal
copies of software.

The MAGNiTUDE group is known for releasing cracks for a wide range of software
products, including popular design and engineering software such as AutoCAD,
SolidWorks, and CATIA. The group has been associated with the release of "warez,
" which are pirated copies of software that have been modified to remove copy
protection.

It's important to note that using pirated software is illegal and can have
serious consequences, including legal action and damage to computer systems.
It's always recommended to use legitimate software and obtain licenses legally.



m0nkrus is a well-known username and nickname in the digital design and
publishing industry, particularly in the field of Adobe software. Dmitry
Malinovsky, who uses the nickname m0nkrus, is a Russian digital artist who is
known for creating and distributing repacked versions of Adobe software, which
are modified versions of the original software that often include additional
features and capabilities.

Malinovsky is known for his expertise in reverse engineering Adobe software and
creating custom installations that include multiple Adobe applications. His
repacked versions of Adobe software are widely used in the design and
publishing industry, particularly in Russia and other countries where Adobe
software can be expensive to purchase.

It's worth noting that the use of repacked or modified versions of Adobe
software is technically illegal and can lead to potential legal issues,
particularly if the software is used commercially. It's always recommended to
use legitimate software and obtain licenses legally.
