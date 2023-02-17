## Virt a mate

porn / pɔːrn /n. adj. 色情（或淫秽）作品

### 1. 下载安装

    google Virt a mate download

    https://www.patreon.com/posts/downloading-and-32794384

    VaM_Updater.zip


    mkdir vam; 解压到这个文件夹

    1.21.1 版本的激活码是 C91927

### 2. 目录结构

AddonPackages/
    .var 包文件
    就是个压缩文件，可以解压出来看看

AddonPackagesBuilder/
    打包过程的缓存目录，打完包后可以将其清空

AddonPackagesUserPrefs/
    收藏的包场景文件
    隐藏的包场景文件


BepInEx/
    汉化

Custom/         // 所有的资源
    Assets/
    Hair/
    Clothing/
    Sounds/
    Scripts/
    ...

    红色背景的是从 AddonPackages 中读取的，
    白色背景的是从 Custom 中读取的

Saves/          // 保存存档



VaM(Config).bat
    起动器面板
    windowed: 窗口模式
    分辨率
    选择显示器
    显示质量

VaM.exe

VaM_Updater.exe
    可以选择桌面还是VR模式


---

vam hub 类似 github, 是一个商城
    用户首选项，安全，启用 Hub, 才能打开



### 3. 场景

1. 新建

    'open main ui' / File / 'New Empty Scene'

2. 保存

    红色的 'Save Scene'


saves/scene/helloworld
    helloworld.json
    helloworld.jpg
    helloworld.json.hide    // 0字节，有这个文件说明是设置了隐藏


存档场景
    在 Scene Browser 中，齿轮上可以删除的就是存档场景

包场景
    在 Scene Browser 中，齿轮上不可以删除(没有删除选项)的就是存档场景
    AddonPackages/


打包

    1. 'Package Builder'
    2. 包名
    3. 添加文件（选择 json 文件会自动把缩略图文件带进去）
    4. Prep Package
    5. Finalize Package

    文件命名规则
        作者名.文件名.版本号.var
        打包时如果文件名一样，版本号加一
        没有层次的结构，可以放在文件夹中
