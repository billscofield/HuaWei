# layui

为后端程序员量身定制
更多是面向后端开发者

layui 官网将于 2021年10月13日 进行下线。

还有一些镜像站, 如:
    [官网](http://layui.org.cn/)
    layui.site

[github](https://github.com/layui/layui.git)

[下载链接](http://layui.org.cn/upload/lib/layui-v2.7.6.zip)

目录结构
├── css/
│   ├── layui.css               // 核心样式文件
│   └── modules/                // 模块 css 目录
│       ├── code.css
│       ├── laydate/
│       └── layer/
├── font/                       // 字体图标目录
│   ├── iconfont.eot
│   ├── iconfont.svg
│   ├── iconfont.ttf
│   ├── iconfont.woff
│   └── iconfont.woff2
└── layui.js                    // 核心库

## 栅格系统

### 1. 布局

12等分

固定宽度
    layui-container

完整宽度
    layui-fluid

    ```
    layui-col-xs*       <768px
    layui-col-sm*       >=768px
    layui-col-md*       >=992px
    layui-col-lg*       >=1200px
    ```
行

    layui-row

列边距

    layui-col-space*    px [1,30]
    是padding

列偏移

    layui-col-md-offset*        //向右移动*列

列嵌套

    layui-col-md6
        layui-row
            layui-col-md4

### 2. 按钮

基础按钮
    layui-btn
    不会改变 block 或 inline 身份

颜色
    原始    class="layui-btn layui-btn-primary"     
    默认    class="layui-btn"
    百搭    class="layui-btn layui-btn-normal"
    暖色    class="layui-btn layui-btn-warm"
    警告    class="layui-btn layui-btn-danger"
    禁用    class="layui-btn layui-btn-disabled"

尺寸
    大型class="layui-btn layui-btn-lg"
    默认class="layui-btn"
    小型class="layui-btn layui-btn-sm"
    迷你class="layui-btn layui-btn-xs"

圆角
    layui-btn-radius

图标
    <button type="button" class="layui-btn layui-btn-sm layui-btn-primary">
        <i class="layui-icon layui-icon-left"></i>
    </button>

导航
    layui-nav           // 水平导航
    layui-nav-item      // 导航项
    layui-this          // 选中的
    layui-nav-child     // 二级菜单，dl 标签

    <span class="layui-badge">9</span>  // 徽章

    layui-nav layui-nav-tree                    // 垂直导航
    layui-nav layui-nav-tree layui-nav-side     // 侧边导航, 占屏幕整个高度

导航主题颜色
        layui-bg-cyan（藏青）
        layui-bg-molv（墨绿）
        layui-bg-blue（艳蓝）
        ...

面包屑导航

    <span class="layui-breadcrumb">
        lay-separator="-"               自定义分隔符

静态表格属性

    不是写在 class 里，是标签属性

    layui-table

    lay-even            // 隔行换色, 

    lay-size="lg"

表单

    layui-form
    layui-form-item
        layui-form-label
        layui-input-block / layui-input-inline
            layui-input
            required                        必填字段
            lay-verify                      需要验证的类型
                lay-verify="required"       必填, 电话啊，邮箱啊
            autocomplete="off"              当有缓存name属性的值时，是否自动填充

### 3. 表单

提交有问题，先不看这个了
