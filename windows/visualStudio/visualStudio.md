# visual studio

## 如何下载离线安装包

1. 下载vs引导程序

    https://learn.microsoft.com/en-us/visualstudio/releases/2019/history#release-dates-and-build-numbers

    放到 d:/visualstudio/ 文件夹下

2. 找到自己需要安装的vs工作负载和组件id

    https://learn.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community?view=vs-2019&preserve-view=true#visual-studio-core-editor-included-with-visual-studio-community-2019

3. 下载离线安装包

    管理员方式运行 cmd 

    命令含义：
        
        vs_community.exe：前一步下载的 Visual Studio 引导程序
        --layout：  指定 VS2019 相关组件的下载目录
        --add：     添加将要下载的工作负载，添加的是 NativeDesktop、ManagedDesktop
        --includeRecommended：  安装相关工作负载的推荐组件
        --includeOptional:      将会下载选定的工作负载中可选的组件，会导致下载的安装包过大
        --lang：    下载指定的语言包，本人下载了英文(en-US)、中文(zh-CN)

    1. 对于 c++ 桌面开发

        vs_enterprise.exe --layout ./localVScache --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended --lang en-US

    2. 帮助查看器属于独立工作负载，也需要单独下载

        vs_enterprise.exe --layout ./localVScache--add Microsoft.Component.HelpViewer --lang en-US zh-CN

    创建完整的全部缓存:

        vs_enterprise.exe --layout ./localVScache --lang en-US

        需要 50G 左右的空间

4. 安装

    点击 vs_setup.exe 进行离线安装

    如果后续想要添加其他的组件和工作负载，可以继续通过引导程序在此文件夹中通过命令下载离线安装包

    安装完成后需要重启计算机

5. 激活

    1. 启动vs2019，提示我们登陆，我们选择以后再说

    2. 接着选择VS的启动主题

    3. 然后就会进入到visual studio 2019的操作向导了，我们可以选择右侧的创建新建
       项或者继续无需代码，然后就会进入到visual studio 2019的界面了

    4. 接下来进行激活，我们点击 “帮助-注册产品”

    5. 选择 “使用产品密钥解锁”

    6. 输入激活密钥

        2019:
            企业版：BF8Y8-GN2QH-T84XB-QVY3B-RC4DF
            专业版：NYWVH-HT4XC-R2WYW-9Y3CM-X4V3Y
        2022
            Enterprise：    VHF9H-NXBBB-638P6-6JHCY-88JWH
            Professional：  TD244-P4NB7-YQ6XK-Y8MMM-YWV2J

