## history brief

1993 标签语言第一版

1995 html2.0

1996 html3.2  w3c推荐标准

1999 html4.0.1  w3c推荐标准
 |
 +->2000 xhtml1.0  w3c推荐标准
 |  2001 xhtml1.1  w3c推荐标准
 |
 +->2008 html5 草案发布
    2014.10 html5 正式发布

蒂姆 伯纳斯 李
    万维网之父
    html设计者
    w3c 创始人


w3c world wide web consortium 万维网联盟

    1994年10月在麻省理工学院计算机科学实验室成立




！DOCTYPE，一个文档类型标记是一种标准通用标记语言的**文档类型声明**，它的目的是
要告诉标准通用标记语言解析器，它应该使用什么样的**文档类型定义（DTD）**来解析文
档。
    
    <!DOCTYPE> 声明不区分大小写; 文档类型声明


## 注释

` <!-- -->


结构    structure       HTML
样式    Presentation    CSS
行为    behavior        Javascript
WEB标准



## html 属性


runoob.com

<html lang='en'>

    cmn-hans


body
    <body bgcolor='#ff0'>

    <body background=''>
        平铺


font
    <font color="" size=''>

em i
strong b
ins(insert) u(underline)   下划线
del s   删除线
sub 下标
sup 上标

hr
    size 粗细
    color
    width 固定或百分比
    默认居中

pre 要顶格写

实体字符
    &lt;
    &gt;
    &nbsp;
    &yen;
    &copy;      版权
    &times;     乘以
    &divide;    除法


    <div>   -> &lt;div&gt;
    &copy;长生科技

span

ul
    只能放 li 元素，不能再放其他的标签
    li 之间是可以放其他标签的

    type            html4.01 已经废弃, 但是好像还可以用
        disc        实心圆
        circle      空心圆
        dot         实心圆
        square      实心方块


ol
    type
        i           小写罗马数字
        I           大写罗马数字
        1
        a
        A

    start='数字'


dl                  定义列表
    dt      块标记, title
    dd      这个会有一个缩进,是块标记, description, dd 的个数没有限制

    <dl>
        <dt>HTML</dt>
        <dd>What is HTML</dd>
    </dl>

img
    alt
    title='xxx'     鼠标放上去时显示的文字, 如果没有alt, 图片又不存在，就会显示title的内容
    width
    height
    align='left/right'       要放在块级别元素如 div 中, 但是 body 中也可以。。。, 没有 center

    文字不会在图片下方


    hspace          // img 左右和其他元素的距离, 实际是margin HTML5 不支持。HTML 4.01 已废弃。 规定图像左侧和右侧的空白。
    vspace          // img HTML5 不支持。HTML 4.01 已废弃。 规定图像顶部和底部的空白。
    border='0'      HTML5 不支持。HTML 4.01 已废弃。


    热点
        <img src='xx' usemap='#图片名称'
        <map name="图片名称">
            <area shape='rect' coords="左上角坐标，右下角坐标" href="http:xxx" target="_blank">
            <area shape='rect' coords="1,1,50,50" href="http:xxx" target="_blank">
            <area shape='circle' >
            <area shape='poly coords=' '>       多边形
        </map>


        href: hyper reference(引用)
        
        target
            _blank
            _self
            _parent 框架中
            _top    框架中

figure
    将 img 和相关内容的容器
    figcaption  标题

    <figure>
        <figcaption><h2>helloworld</h2></figcaption>
        <p>...</p>
    </figure>


video
    src=""                      mp4, webm 等格式
    controls="controls"         显示控件, 只有两种状态,**bool 属性可以不写属性值**
    autoplay                    bool属性
    muted                       bool属性，静音播放
    loop                        bool属性，循环播放


    <video controls>                这样写有更好的兼容性视频格式
        <source src="a.mp4">
        <source src="a.webm">
    </video>

audio
    src=""                      mp3
    controls="controls"         显示控件, 只有两种状态,**bool 属性可以不写属性值**
    autoplay                    bool属性
    muted                       bool属性，静音播放
    loop                        bool属性，循环播放


marquee([mɑːrˈkiː] 移动字幕效果)     滚动标记
    跑马灯
    direction
        up(向上)/down(向下), left/right
    width=
    height
    
    scrollamount=1        滚动步长
    scrolldelay           步长停留, 毫秒为单位
    bgcolor=
    loop='4'              滚动几次

embed 嵌入
    src                     多媒体路径, 视频
    width
    height

    <embed src='a.mp4'></embed>     mp4
    <embed src='a.mp3'></embed>     mp3
    <embed src='a.swf'></embed>     swf

锚点

    ```
    <a name="top">
    <a href="#top">

    也可跨越不同的页面
    <a href="./news.html#top"
    ```

    功能链接
        执行JS脚本:<a href="javascript:alert('hello')">
        发邮件: <a href="mailto:123@qq.com">
        打电话: <a href="tel:123">

        target 
            _self
            _blank
        title 提示

路径
    站内资源
    站外资源
        **当目标协议和当前协议一致时，可以省略协议**
        <a href="//renren.com">     两个// 不能省略

    相对路径
    绝对路径
        协议名://主机名:端口号/路径




meta
    <meta name='keywords' content='...'>            // 关键字,给搜索引擎用的
    <meta name='description' content='xxx'>
    <meta name='author' content='xxx'>
    <meta http-equiv='refresh' content='30'>        // 每30秒刷新当前页面
        它可以向浏览器传回一些有用的信息，以帮助正确和精确地显示网页内容

        1. Expires(期限) 
            说明：可以用于设定网页的到期时间。一旦网页过期，必须到服务器上重新传输。 
            用法：
            <meta http-equiv="expires" content="Wed, 20 Jun 2007 22:33:00 GMT">
            
            注意：必须使用GMT的时间格式。 

        2. Pragma(cache模式) 
            说明：是用于设定禁止浏览器从本地机的缓存中调阅页面内容，设定后一旦离开网页就无法从Cache中再调出 
            用法：
            <meta http-equiv="Pragma" content="no-cache">
            
            注意：这样设定，访问者将无法脱机浏览。 

        3. Refresh(刷新) 
            说明：自动刷新并指向新页面。 
            用法：
            <meta http-equiv="Refresh" content="2;URL=http://www.net.cn/">
            
            注意：其中的2是指停留2秒钟后自动刷新到URL网址。 

        4. Set-Cookie(cookie设定) 
            说明：如果网页过期，那么存盘的cookie将被删除。 
            用法：
            <meta http-equiv="Set-Cookie" content="cookievalue=xxx;expires=Wednesday, 20-Jun-2007 22:33:00 GMT； path=/">
            
            注意：必须使用GMT的时间格式。 

        5. Window-target(显示窗口的设定) 
            说明：强制页面在当前窗口以独立页面显示。
            用法：
            <meta http-equiv="Window-target" content="_top">
            
            注意：用来防止别人在框架里调用自己的页面。

        6. content-Type(显示字符集的设定) 
            说明：设定页面使用的字符集。 
            用法：
            <meta http-equiv="content-Type" content="text/html; charset=gb2312">
            
            <meta charset='UTF-8'>      html5

        7. 清除缓存（再访问这个网站要重新下载！） 
            <meta http-equiv="cache-control" content="no-cache"> 


## 

ol  type='1'     //默认
    type='a'
    type='A'
    type='i'    //罗马
    type='I'    //罗马

    reversed='reversed'

    start='2'

ul type='circle'
   type= 

    css
        list-style:none;

img
    src='./a.jpg'
    alt='图片不能显示的提示文字'
    title 提示信息

a(anchor)
    target='_blank'
    href='tel:18888888888'                              //打电话
    href='mailto:a@a.com'                               //发邮件
    href='javascript:function(){console.log("hello")}'  //协议限定符
    href='javascript:while true{alert("hello")}'  

form
    收集信息; 表单域，表单空间，提示信息
    action=



    maxlength
        input


    method='post'
    method='get'
        页面路径?参数名称=值&参数名称=值&...
        <a href="./userinfo.php?name=xxx&gender=xxx&password=xxx">提交</a>

    action='who'

    input 
        type='placeholder'
            onfocus='this.value=""'                         //获得焦点
            onblur='if(this.value="请输入"){this.value=""}' //失去焦点
            
            text
            password
            
            radio
                label 绑定
                第一种方式:
                
                <input type="radio" id="radioA" name="radio1" /><label for="radioA">这是radioA</label>
                <input type="radio" id="radioB" name="radio1" /><label for="radioB">这是radioB</label>
                 
                
                 第二种方式:
                
                 <label><input type="radio"  name="radio2">这是radioA</label>
                 <label><input type="radio"  name="radio2">这是radioB</label>

                 checked
            
            checkbox
                checked

            select 下拉框
                <select id='' name=''>
                    <option value=''>a</option>
                </select>
            
            submit      提交
            image       也是提交
                src=''
            
            reset

            button      // 和 js 关联使用

            file
                name=''
                必须在 form 中设置数据传递方式, 图片/文本/视频
                enctype=application/x-www-form-urlencoded   默认
                enctype="multipart-form-data"               上传文件时, 写在 form 中
                enctype='text/plani'                        纯文本, 邮件必须是这种
                
            
            隐藏域 hidden
                <input type='hidden name='' value=''>

            <textarea rows=' ' cols=' '></textarea>
                没有 placeholder, 提示内容写在标签之间
                实际上不是用 cols 和 rows 的, 都是用css来处理的
            
        name    传给服务器的值
        value   传给服务器的值



### 容器元素

div

header  页头, 文章的头部

footer  页脚，文章的底部

article 表示整篇文章
    article
        header
        section
        footer

section     章节
aside       附加信息


### 元素包含关系

之前:
    块级元素可以包含行级元素，行级元素不可以包含块级元素，a 元素除外


现在:
    由元素的**内容类别**来决定


h1 是否可以包含 p 元素

    百度 h1 mdn

        Permitted content: Phrasing content
        没有 p , 所以 hN 不能包含 p

1. 容器元素可以包含任何元素

2. a 元素几乎可以包含任何元素

3. 某些元素有固定的子元素(ul>li, ol>li dl>dt+dd)

4. 标题元素和段落元素不能相互嵌套，并且不能包含容器元素

百度所有  内容类别 mdn


### CSS

层叠性
继承性
优先级


1. 内联/行内
    <h1 style="color:red; background:white">

2. 内部样式表
    <style>
        ...
    </style>

3. 外部
    
    <link rel="stylesheet" href="../css/index.css">

    可以缓存，加快响应时间
    代码分离


一般都用小写(虽然大写也可以)

一般选择器后边一个空格，属性冒号后边一个空格





#### 常见样式

1. color
    1. 预设值
    2. rgb:
        RGB(222,1,1)
        #rrggbb

2. background-color

3. font-size
    
    1. px


    em相对于父元素，rem相对于根元素

    Pixels (px) are considered **absolute units**, although they are relative
    to the DPI and resolution of the viewing device. But on the device itself,
    the PX unit is fixed and does not change based on any other element. Using
    PX can be problematic for responsive sites, but they are useful for
    maintaining consistent sizing for some elements. If you have elements that
    should not be resized, then using PX is a good choice.


    user agent stylesheet(F12 浏览器默认添加的样式)

4. font-weight

    lighter
    normal  400
    bold    700
    bolder

5. font-family

    font-family: consolas, 微软雅黑, Arial, sans-serif

    sans-serif: 非衬线自体
    serif: 用于印刷, 如宋体

6. font-style
    
    normal
    italic      // 斜体, em
    oblique     // 

    i 元素一般用来做一个图标(icon)

    em: 强调

    strong: 

    font-style, font-variant, font-weight, font-stretch, font-size, line-height, and font-family.
        
        font-size/line-height
    

文本属性

7. text-decoration
    
    del     
    s       过期

    overline            // 上边
    line-through
    underline

8. text-indent
    首行缩进

    2em
    10px

    可以是负数

9. ???line-height
    
    纯数字: 相对于当前文字大小, 不用 em, 事关继承

    和 height 相等，则居中
    < height, 偏上
    > height, 偏下

10. letter-spacing

    文字间隙

11. text-align

    left/right/center

#### 选择器

1. ID选择器
2. 类选择器
3. 元素选择器
4. 通配符选择器
5. 属性选择器
    [href]{ }    所有有 href 的元素
    [href="https://www.a.com"]{ }    所有有 href="xxx" 的元素
6. 伪类选择器

    链接伪类
        a:link      未访问过的颜色
        a:visited   访问过后的颜色
        a:hover     
        a:active    激活，按下的时候

    焦点
        :focus




7. 伪元素选择器
    ::before
    ::after

    span::before{}


选择器的组合

    1. 后代选择器
        
        ul li {}

    2. 直接子元素
        
        ul>li{}
        li 必须是直接的子元素，如果没有是不行的

    3. 下一个相邻兄弟元素
        +
        .special+li{}

    4. 后边的所有兄弟元素

        ~
        .special~li{}


### 层叠

color:red !important;


1. 
    important
    自定义的样式
    浏览器默认样式


2. 比较特殊性

    千: 内联
    百: id选择器
    十: class、属性、伪类
    个: 标签，伪元素

3. 重置样式

    减少浏览器在默认行高度、边距和标题字体大小等方面的不一致性。

    normalize.css
    reset.css
    meyer.css



### 继承

并不是素有属性都可以继承

简写顺序可以参考 mdn

可继承的属性
    跟文字相关的


### 属性值的计算

一个一个依次进行渲染，按照页面文档的树形目录结构进行

渲染每个元素的前提条件: 该元素的所有CSS属性必须有值

一个属性从没有值到所有的属性都有值的这个过程叫做属性的计算过程

1. 确定声明值: **参考样式表中没有冲突的声明，直接作为CSS属性值**
    程序员声明的
    **浏览器声明的**

2. 层叠冲突: 对幼童的声明使用层叠规则，确定CSS属性值

3. 使用继承：对仍然么有值的属性，若可以继承，继承副元素的值
    :inherit 强制继承

4. 使用默认值: 对仍然没有属性值的属性，使用默认值
    :initial 将该属性设为初始值, 强制使用默认值


## 盒模型

盒子类型
    1. 行盒: display 为 inline 的元素
    2. 块盒: display 为 block 的元素

行级元素的说法是错误的，表现是CSS的功能

边框的颜色默认是 font 的颜色

box-sizing:
    border-box
    content-box
    inherit
    initial

背景覆盖范围
    默认覆盖 border-box
    可以通过 background-clip 进行修改
        border-box
        padding-box
        content-box

溢出处理

    overflow:
        visible
        hidden
        overflow-y
        auto

断词规则
    word-break
        normal: CJK 在文字位置截断，其他单词位置截断
        break-all: 都在字符处截断
        keep-all: 都在单词处截断


空白处理

    white-sapce:nowrap;
    overflow:hidden;
    text-overflow: ellipsis;


### 行盒盒模型

包含**具体内容**的元素, span, a, em, i, strong, video, audio

宽度和高度均取决于内容
padding 水平有效，垂直仅仅影响背景色，对所占据的空间没有影响
border 同padding一样，不会占据空间
margin: 水平有效，垂直无效



### 行块盒

display:inline-block   行内块
    img
    input
    td

不单独占据一行，宽和高都有效

常用来做分页，就是 1 2 3 4 5 6 下一页

**空白折叠发生在行盒（行块盒）内部 或行盒（行块盒）之间**


可替换元素和不可替换元素
    大部分元素，页面上的显示结果取决于元素的内容，称为**非可替换元素**

    少部分元素，页面上的现实结果取决于元素属性，称为**可替换元素**
        img, video, audio
        大部分为行盒
        类似行块盒，宽高可调
        border 占据尺寸
        object-fit:
            contain: 保持比例,全部显示，会缩放
            fill: 全部显示，不保持比例
            cover: 填充满，保持比例，部分不会显示



## 流

盒模型是规定单个元素的，

**视觉格式化模型(布局规则)**: 页面中多个盒子排列的规则

视觉格式化模型大体上将页面盒子的排列分为3种方式
    1. 常规流
    2. 浮动
    3. 定位


### 1. 常规流

所有元素，默认情况下都是常规流布局

总体规则：块盒独占一行，行盒水平依次排列

**包含块(Containing block)**
    每个盒子都有它的包含块，包含块决定了盒子的排列区域
    大部分情况下，盒子的包含块，为其父元素的**内容盒**


块盒
    水平方向
        每个块盒的总宽度(margin,border,padding,content),必须等于父元素的内容盒
        宽度的默认值是auto, 将剩余的空间占满
        margin:auto 也是将生于空间占满
        若margin,border,padding,content 计算后还有剩余空间，剩下的都归给 margin-right

        常规流中，块盒在包含块中居中

        margin为负数， 内容盒子要增加，以正好等于父盒的内容盒

    垂直方向

    百分比取值
        width:50%
        所有百分比相对于包含块的**宽度**, 和高度没关系

        包含块的高度取决于子元素的高度时，设置百分比无效
        包含块的高度不取决于子元素的高度时，百分比相对父元素高度

    上下外边距合并
        两个常规流块盒(兄弟或父子)，上下margin相邻，会进行合并,取大值

        不合并的方法
            方法一：
                父元素添加 border-top/padding-top, 加在子元素上没有作用的, 没有隔离margin
                
            方法二:
                overflow:hidden
                是针对 内容盒的

### 2. 浮动 float

小心再小心

应用场景:
    1. 文字环绕
    2. 横向排列

float:
    left 靠左上
    right 靠右上
    none

当一个元素浮动后，必定为块盒

浮动元素的包含块，和常规流一样，为父元素的内容盒

盒子尺寸
    宽度为auto时: 自动适应内容元素
    高度为auto时: 总是适应内容高度
    margin 为 auto 时， 总为0
    百分比与常规一样，包含块为计算基础

盒子排列
    1. 靠左排列
    2. 靠右排列
    3. 浮动盒子在包含块中排列时，会避开常规盒子
    4. **常规块盒在排列时，无视浮动盒子(所以顺序很重要)**
    5. 行盒在排列时，会避开浮动盒子
        照片+文字环绕
            常规块盒在排列时，无视浮动盒子(所以顺序很重要)
        
        **如果文字没有在行盒中，浏览器会给文字生成一个行盒包裹文字,叫匿名行盒**
    6. 高度坍塌
        常规流的自动高度是适应内容，不考虑浮动盒子

        ul::after{
            display:block;
            content:'';
            clear:left;
        }

        clear:left
            该元素必须排列在前边所有浮动元素的下方


### 3. 定位 position

手动控制元素在包含块中的精准位置

    1. static(default)
    2. relative
    3. absolute
    4. fixed

定位元素会脱离文档流(relative 除外)

脱离文档流的元素的特点
    文档流中的元素摆放时，会忽略脱离了文档流的元素
    文档流中元素计算自动高度时，会忽略脱离了文档流的元素


1. relative

    避免设置冲突的值，以left,top为准

2. absolute

    宽高为auto时，适应内容
    包含块变化: 找祖先元素中最近的定位元素，该元素的**填充盒(padding-box)**为其包含块
        如果找不到，则整个网页为其包含块

3. fixed

    **包含块固定为视口**,其他和绝对定位一样

    1. 某个方向上居中
        1. 定宽（高）
        2. 四周距离都设置为0
        3. margin:auto              // 上下这里可以


    2. 多个定位元素重叠时

        堆叠上下文

        z-index 越大，越靠近用户
        只有定位元素设置 z-index 才有效
        常规元素会覆盖 z-index 为负数的定位元素

absolute,fixed
    一定是块盒, 会自动加上 display:block
    一定不是浮动
    没有margin合并



### 二级菜单(决定定位)

### 弹出框

.modal
    position:fixed;
    width:100%;
    heigth:100%;
    left:0;
    top:0;
    background-color:rgba(0, 0, 0, .5)      // 小数可以省略整数部分

a
    cursor:pointer(手)


## 选择器

1. 伪类选择器(父类里面的x个元素)
    
    :first-chid
    :last-child
    :nth-child(2n)      2n == even      2n+1 == odd

    a:first-of-type
    a:last-of-type
    a:nth-of-type

2. 伪元素选择器

    ::first-letter
    ::first-line
    ::selection         框选的



## 更多的样式

opacity [0,1]


cursor:url("images/a.ico"), auto;       如果前边那个不生效，使用 auto

visibility:hidden

!!!背景图

    img 是 html的
    背景图是 css 的

    当图片属于网页内容时，使用 img
    当图片仅用于美化网页时，使用 CSS


    background-image:url("images/images.jpg")

    background-repeat:no-repeat
    background-repeat-x:repeat
    background-repeat:repeat-x

    background-sizea:
        contain         // 不改比例， 全部显示
        cover           // 
        数值/百分比     // 水平  垂直
        
    backgrounp-position: center;        // 水平垂直居中
        center top                      // 水平居中，垂直top
        
        top,right,bottom,left           // 距离上右下左的距离

        spirit 图
            width:30px;
            height:30px;
            background-postion: -30px -30px;

    background-attachment 背景固定
        fixed       // 相对于视口位置
        scroll      // 滚动(default)

    背景图和背景色混合

    background: 位置 位置/尺寸

        没有顺序的要求


    **背景图片非常容易控制位置**


## iframe

可替换元素
通常是行盒
内容取决于属性
CSS 不能完全控制其属性

iframe name='xxx'
a target='xxx'



## 表单元素

input
    name

    value

    placeholder

    type
        text
        password
        data        有兼容性的问题
        search
        range       滑块
            min
            max
        color       颜色选择
        number      数字输入框，只能输入数字
            min
            max
            step
        radio

        checkbox

        file

        submit
        reset
        button
            尽量就用button，功能交给js

        select multiple
            <optgroup label="球类">
            <option selected>
            </optgroup>

textarea
    cols
    rows
    内容写到标签中，而不是 value 属性中

button
    type
        reset
        submit(default)
        button

配合表单的元素

    <label for='genderid'>男</lable>

    datalist
        该元素不会显示在页面，配合
        
        请输入:<input type='text' list='hhh'>
        
        <datalist id='hhh'>
            <option value='1'>1</option>
            <option value='2'>2</option>
        </datalist>


form
    www.baidu.com/?name=abc&pass=123


fieldset
    表单分组

    <fieldset>
        <legend>用户信息</legend>
        input:text
    </fieldset>


表单状态
    readonly    bool属性
    disabled    bool属性



文字类元素中不要放块元素
    p > div
    a 例外, 可以放块元素


???vertical-align: middle;
    div中的文字没有效果
