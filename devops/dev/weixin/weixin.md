
2017年1月9日, 微信小程序上线, 最初不能超过1M, 后来不能超过2M

百度搜索:微信公众平台 (mp.weixin.qq.com)

    选择小程序(一个帐号只能注册一个)
    
    开发文档
        https://developers.weixin.qq.com/miniprogram/dev/framework/

    开发工具
        https://developers.weixin.qq.com/miniprogram/dev/devtools/

    Flex 布局


## 移动端

1. 物理像素

1. 设备独立像素(DPR) & css像素
    
    设备独立像素(device independent pixels, 也叫密度无关像素), 像是虚拟层, 如: iphone 6 物理像素: 750x1334, 然而 376x667

    设备独立像素和css像素没有必然关系
        在手机中查看图片的尺寸, 放大缩小

1. css 像素仅存在于浏览器中, 虚拟单位
    
    CSS像素(CSS pixels): 又称为逻辑像素，是为web开发者创造的，在CSS和javascript中使用的一个抽象的层

    每一个CSS声明和几乎所有的javascript属性都使用CSS像素，因此实际上从来用不上设备像素 ，唯一的例外是screen.width/height

    我们通过CSS和javascript代码设置的像素都是逻辑像素
        
        width:300px;
        font-size:16px;

    位图像素, 一张图片的大小, 默认和css像素1:1, 如果添加了width, 会更改比例, css 像素就变了, 但是位图像素是不会变的


    dpr: 物理像素宽度/设备独立像素宽度, iphone 的dpr=2
    PPI: 一英寸显示屏上的像素点个数
    DPI: 最早指的是打印机在单位面积上打印的墨点数

1. 视口

    1. 布局视口
        html 标签
        用于绘制所有的内容, 实指HTML元素(CSS像素)

    2. 视觉视口
        是用于限制我们能看到的内容, 实指手机屏幕, 这个视口变不了, 所以我们将布局视口宽度设置为视觉视口宽度就是完美视口
        
        下面两种方式都可以:
            <meta name='viewport' content='width=device-width'> 
            <meta name='viewport' content='initial-scale=1'>    = 视觉视口宽度/布局视口宽度
            
            以上两个属性值优先级: 谁计算的**布局视口宽度**结果值大,以谁为准

    3. 理想视口
        布局视口正好等于视觉视口


    案例: 图片占据**屏幕**一半宽度
        
        1. width:50;   // 父元素必须和视觉视口宽度一致
        
        2. vw,vh 单位, 视觉单位, 100vw 是100% 视口单位, 但是兼容性较差, 是C3单位
        
        3. em 是相对于父节点, rem 是相对于根节点
            将当前屏幕的宽度，作为根节点的字体大小
        
            ```
            // 获取当前屏幕宽度(视觉矢口宽度), 由于无法获得视觉视口宽度, 改为使用布局视口宽度的关系
            
            const width = document.documentElement.clientWidth;
            document.documentElement.style.fontSize=width+"px";
            document.body.style.fontSize="16px";
            
            img width=0.5rem;
            ```

### 小程序特点

1. 没有 DOM(Document Object Model, W3C制定)
    标签是HMTL的, DOM 是 js的

2. 组件化开发, 所有标签都是组件

3. 体积小,单个压缩包体积不能大于2M, 否则无法上线

4. 小程序的4个重要的文件
    
    1. .js
    2. .wxml -> view 结构 -> html
    3. .wxss -> view 样式 -> css
    4. .json -> view 数据 -> json   // 微信小程序中的 json 文件一定是配置文件

5. 小程序的适配方案:rpx(responsive pixel 响应式像素单位)
    
    1. 小程序适配单位: rpx
    1. 规定屏幕宽度为 750rpx(屏幕750等分的rem)
    1. Iphone6 下, 1rpx = 1 物理像素 = 0.5css

    rpx :   布局视口    :   视觉视口    :   物理像素
    750     375             375             750         (iphone6为例)
    750     414             414             1242        (iphone6plus为例), dpr=3



## 

1. sitemap: 索引, 类似 seo

1. project.config.json     // 当前项目的配置
    appid
    projectname

1. app.wxss                // css, 不能使用预处理器

1. app.json                // 整个项目的配置

1. app.js                  //

1. Pages
    index
        index.js
        index.json
        index.wxml
            view 相当于 div
            text 相当于 span
            button
        index.wxss
    logs
1. utils
    


网页文档

    框架: 配置
        框架接口

    组件(标签)

    API: 方法
