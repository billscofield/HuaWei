# maya

## 操作界面

标题栏

菜单栏
    通用菜单栏
        - File
        - Edit
        - Create
        - Modify
        - Display
        - Windows
    模块菜单栏

    工作区
        常规(General)

工具栏

工具架(Shelf)
    标题栏
    工具
        - Curves(曲线)
        - Survaces(曲面)
        - Poly Modeling(多边形建模)
        - Sculpting(雕刻)
        - UV Editing(UV编辑)
        - Rigging(绑定)
        - Animation(动画)
        - Rendering(渲染)
        - FX
        - FX Caching(FX 缓存)
        - Custom(自定义)
        - MASH
        - Motion Graphics(运动图形)
        - XGen

视图面板
    面板菜单
    面板工具栏

左侧工具箱
    可以双击, 选择 重置

左侧快速布局按钮

左侧搜索工具(Ctrl F)

左侧 Outliner(大纲视图)

下方的时间线面板

下方的帮助提示
下方的命令栏(MEL)

右侧的通道盒

## 操作

### 基本视图操作

Alt lmb : 旋转
Alt mmb : 平移
Alt rmb : 缩放

视图切换:
    空格+鼠标右键选择
    左侧快速布局按钮
        四视图中,鼠标悬停选择一个, + 空格键: 最大化该视图
    Ctrl + Space : 专家模式, 专家工作区

a: 将整个场景剧中到视图
f: 将物体居中到视图

alt + b : 切换背景颜色

在3D导航器上右键: OrthOgripic View(正交视图), 否则是透视图

### 创建图形

默认单位是1cm

方式1:
    菜单栏 / Create 
        鼠标放点击双层省略号可以将子菜单拖出来

        Polygon Primitives(多边形即本体)

        可以勾选`交互式创建`

方式2:
    工具架

方式3:

    shift 鼠标右键

        多边形(Poly Surface 貌似只能这么创建)

123     质量依次升高
4       开启线框模式显示
5       实体模式显示
        实体模式+线框(默认没有快捷键)
6       纹理作色显示(贴图Textured)
7       灯光显示

### 基本编辑

q: 选择
    右键,可以选择点线面
        edge
        vertex(顶点)
        vertex face(顶点面)
        face(面)

移动 w

旋转 e

缩放 r

shift 加选
ctrl  减选

环选点/线/面
    先选择一个点,然后
    点模式好像有点问题,总是将所有点选中

坐标轴
    ctrl shift 鼠标右键选择
    object: 对象坐标轴
    world:  世界坐标轴
    组件(component):   法线
    custom:

    d: 移动坐标轴的位置

    中心枢轴(modify / Pivot / Center Pivot),重置坐标轴: Poly Modeling 工具架 / Center Pivot
    右边的一个工具是 按类型删除历史记录
        Edit / Delete / Delete by type / history {alt shift d}
    Freeze Transformations
        但是此时对象坐标轴就没有了, 可以使用 自定义 坐标轴
        选中物体, d , 调整好后, d

捕捉
    捕捉到栅格 x
    捕捉到曲线 移动物体,按住 c 键, 鼠标中键选中曲线移动
    捕捉到点 v
    捕捉到投影中心
    捕捉到视图平面: 创建立体的面
    激活选定对象:
        右侧 modeling toolkit(建模工具包)
            Quad Draw(四边形绘制), 左键加点, shift 连成面

## 文件管理和工程设置

File / Project
    Project Window(项目窗口)
    Set Project

ma : maya ascii
mb : maya binary

参考图导入
    前视图 正交视图
    工作区的视图(view) / 图像平面(image plane) / 导入图像(import image)

    向后移动下

    右侧的通道盒 / Display / Create a new layer
        右键 / 添加选定对象
        v: 显示否
        p: 动画时显示否
        R: 锁定 ; T 线框形式锁定

    右侧的通道盒 / Display / Create a new layer and assign selected objects

复制
    Edit / Duplicate
        - Duplicate (Ctrl D)
            shift 拖动
        - ctrl c; ctrl v
        - Duplicate Special (Ctrl Shift D)
            点击 Edit / Duplicate / Duplicate Special 右侧的图标, 弹出窗
                instance: 同步,类似硬链接
        - Duplicate with transform (Shift D)
            shift d 变换; 然后 shift d; shift d; 相当于一个宏
        Transfer Attribute Values
