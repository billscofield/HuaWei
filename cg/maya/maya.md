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
    adskflexnetserverIPV6-11.18.0-0.x86_64.rpm
    Bifrost2023-2.5.1.0-2.5.1.0-1.x86_64.rpm
    Maya2023_64-2023.3-2072.x86_64.rpm
    MayaUSD2023-202211021008-b68700b-0.20.0-1.x86_64.rpm
    Pymel2023_64-2023.0-23.0.0.0.x86_64.rpm

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
    adskflexnetclient-11.16.0-0.x86_64.rpm
    adlmapps25-25.0.3-0.x86_64.rpm
    adsklicensing12.1.0.7121-0-0.x86_64.rpm

    adskflexnetserverIPV6-11.18.0-0.x86_64.rpm  // install.sh 中没有安装这个

    install.sh

    pkg.adlmapps.xml
    pkg.adskflexnetclient.xml
    pkg.licensing.xml





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

    ADSKFlexNetServer is a license management software that is used by Autodesk
    products to manage licenses on a network. Autodesk software products are
    typically licensed on a per-seat basis, which means that each computer that
    runs the software must have a license. The ADSKFlexNetServer allows
    licenses to be shared across a network of computers, making it easier to
    manage licenses for multiple users.

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

    To use the ADSKFlexNetServer, you must first obtain a license server host
    ID from Autodesk and purchase the necessary licenses for your Autodesk
    products. Then, you can install and configure the ADSKFlexNetServer on your
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

    The FlexNet license software is developed by [Flexera](https://www.flexera.com/),
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
           ADSKFLEX_LICENSE_FILE environment variable to the path of the
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


