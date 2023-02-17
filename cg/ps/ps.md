# PS

Ctrl K -> Preference
    File Handling(文件处理)
        自动存储
    Performance(性能)
        Use Graphics Processor(使用图形处理器)
        History State(历史记录状态)
    Scratch Disks(暂存盘)
        不要勾选c盘


存储为      save a copy as
导出为

close
close all

undo        meta z
redo        meta shift z

Tab group   选项卡组(历史记录那个)

JPEG        单一图层,内存小
    存储为
    导出为

GIF
    动图
    导出/ Web 所用格式

PNG         无背景,透明背景

PSD

视图
    视图菜单/ proof colors(校验颜色): 以CMYK展示，方便你进行校验，Tab栏也会显示出 CMYK

    视图菜单/ Gamut Warning(色域警告)

    视图菜单/ Pixel Aspect Ratio(像素长宽比)

显示
    放大缩小:   alt 滚轮
    空格键:     抓手

    屏幕模式
        标准屏幕模式            f
        带有菜单栏的全屏模式
        全屏模式

    TAB 是否显示所有菜单/工具栏/工具箱

    标尺 ctrl r
    参考线(guides)
        视图/参考线(guides)/
            锁定
            清空

    对齐
        视图/对齐到(snap to)

    窗口/排列(arrange)
        双联水平
        四联

    窗口/工作区/复位基本功能(Reset Essentials)

    窗口/工作区/键盘快捷键

颜色模式
    位图模式
        位图：点阵图
        位图模式: 只使用黑白两种颜色显示
            图像/模式(mode)/位图

    灰度模式
        由黑白灰三种颜色表示，拾色器最左侧一列

    RGB模式
        滤色(lighten), 电子屏幕等可以发光的

    CMYK, 反射
        正片叠底(darken), 也可以得到所有颜色
        颜色没有 RGB 鲜艳

    RGB 转成 CMYK
        亮度会变暗

    CMYK 转成 RGB
        亮度也不会提升

    LAB模式
        理论上包括了人眼可以看见的所有色彩的色彩模式
        马蹄图那个最大的色域就是 LAB

        L 明度, 物体本身的明亮程度
        A 
        B

色相(H)

    12色相环
饱和度
    加黑色，拾色界面垂直向下
    颜色的鲜艳程度
    黑色加的越少，越鲜艳

明度
    加白色，拾色界面水平向左
    颜色的明亮程度

编辑/填充(fill)
    前景色 alt del
    后景色 ctl del

拾色器默认前景色黑色，背景色白色，快捷键 d
    前景色后景色切换 x

颜色深度


选区
    选中选取后，所有的操作都被限制在这个选定的区域
    加选 shift
    减选 alt
    交叉 shift alt

    选择/全部
    取消选取： 选择/取消  ctrl d

    反选        选择/反选   ctrl shift i
    修改选区    选择/修改/{扩展选区/收缩/边界(选择边界而不是内部)/羽化}
    变换选区    选择/变换选区(Transform Selection)
    存储选区    选择/存储选区(save selection)
    载入选区    选择/载入选区(load selection)

    复制选区    ctrl c/ ctrl j

    羽化
        一般是先调节羽化值, 否则就只能调节了


图层菜单

选择菜单

试图菜单



## problems

1. PS 2019 无响应

    进入ps cc 的安装文件夹，找到 CRWindowsClientService.exe 删除掉试试

    这个问题由 AdobeCreative Cloud辅助程序引起！

    Adobe Creative Cloud用于支持软件运行的相关功能，这个出现异常，可能是禁止网
    络或者延迟运行引起的，一般选择重新安装Adobe Creative Cloud即可解决！Adobe
    Creative Cloud同时检测软件的正版授权问题！简单处理方法：

        1. 采用【Process 程序进程管理大师】把其拉入黑名单，彻底禁止运行！
        
        2. 进入AdobePhotoshop CC 2019的安装文件夹，找到CRWindowsClientService.exe文件，右键【压缩并删除它】！
