# visual studio

[创建和维护 Visual Studio 的网络安装](https://learn.microsoft.com/zh-cn/visualstudio/install/create-a-network-installation-of-visual-studio?view=vs-2022#download-the-visual-studio-bootstrapper-to-create-the-layout)

[创建 Visual Studio 的脱机安装包以进行本地安装](https://learn.microsoft.com/zh-cn/visualstudio/install/create-an-offline-installation-of-visual-studio?view=vs-2022)

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
            --lang en-US de-DE ja-JP

        --includeOptional/--includeRecommended：安装所选的工作负载组里面的推荐项/安装所选工作负载里面全部可选项




        --layout 离线安装包路径
        --add 安装的各种组件，一个组件一个 --add

        ID： Microsoft.VisualStudio.Workload.CoreEditor　　　　　　　　Visual Studio 核心编辑器
        ID： Microsoft.VisualStudio.Workload.ManagedDesktop　　　　    .NET 桌面开发　　　
        ID： Microsoft.VisualStudio.Workload.NativeDesktop　　　　　　 C++ 的桌面开发　文章来源地址https://www.yii666.com/blog/399479.html
        ID： Microsoft.VisualStudio.Workload.NetCoreTools      　　　  .NET Core 跨平台开发

        ```
        工作负载对应                        id
        Visual Studio 核心编辑器            Microsoft.VisualStudio.Workload.CoreEditor
        .NET 桌面开发                       Microsoft.VisualStudio.Workload.ManagedDesktop
        使用 C++ 的桌面开发                 Microsoft.VisualStudio.Workload.NativeDesktop
        使用 C++ 的移动开发                 Microsoft.VisualStudio.Workload.NativeMobile
        使用 .NET 的移动开发                Microsoft.VisualStudio.Workload.NetCrossPlat
        ASP.NET 和 Web 开发                 Microsoft.VisualStudio.Workload.NetWeb
        通用 Windows 平台开发               Microsoft.VisualStudio.Workload.Universal
        Visual Studio 扩展开发              Microsoft.VisualStudio.Workload.VisualStudioExtension
        .NET Core 跨平台开发                Microsoft.VisualStudio.Workload.NetCoreTools
        使用 C++ 的游戏开发                 Microsoft.VisualStudio.Workload.NativeGame
        ```




        vs_Enterprise.exe --layout D:\VS2019\installer --add Microsoft.VisualStudio.Workload.NativeDesktop　--includeOptional --lang zh-CN

    1. 对于 c++ 桌面开发

        vs_enterprise.exe --layout ./localVScache --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended --lang en-US

    2. 帮助查看器属于独立工作负载，也需要单独下载

        vs_enterprise.exe --layout ./localVScache--add Microsoft.Component.HelpViewer --lang en-US zh-CN

    创建完整的全部缓存:

        vs_enterprise.exe --layout ./localVScache --lang en-US

        需要 50G 左右的空间

        ...
        Layout progress: 97.11%
        Download of 'https://go.microsoft.com/fwlink/?linkid=2168183' succeeded using engine 'WebClient'
        已成功完成安装。
        按任意键继续...

4. 安装

    进入下载目录，D:\VS2019\installer

    点击 vs_setup.exe 进行离线安装

    如果后续想要添加其他的组件和工作负载，可以继续通过引导程序在此文件夹中通过命令下载离线安装包

    安装完成后需要重启计算机

    ---

    vs_setup.exe --noweb --add 工作负载 --includeOptional/--includeRecommended

        回车后还会弹出图形界面，还可以再选择其他的

        --noweb: 确保安装程序安装产品时不会尝试访问 Internet

        这里的 --add 的工作组件和安装推荐组件还是全部可选组件的选项参数，需要和上述离线下载时所用的命令行选项相同；

    .NET桌面开发工作负载中的推荐组件的离线包，那么启动离线安装的命令：

        vs_setup.exe --noweb --add Microsoft.VisualStudio.Workload.ManagedDesktop --includeRecommended --includeOptional

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
            Professional：      TD244-P4NB7-YQ6XK-Y8MMM-YWV2J
            Enterprise:　　     VHF9H-NXBBB-638P6-6JHCY-88JWH
