## 网页的构造

一个网页主要包括以下三个部分

    1. 文本内容(text content)
    2. 对其他文件的引用( references to other files )
    3. 标记(markup)

HTML元素描述的是内容是什么，而非看起来是什么样

标签的组成
    元素
    属性
    值

    空元素不包含任何文本内容，如 img
    属性值两边的引号是可选的，但建议写上

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

蒂姆 伯纳斯 李(Tim Berners-Lee)
    万维网之父
    html设计者
    w3c 创始人


w3c world wide web consortium(/ kənˈsɔːtiəm /联合企业，财团)万维网联盟

    1994年10月在麻省理工学院计算机科学实验室成立

whatwg
    超文本应用技术工作组(Web Hypertext Application Technology Working Group)；
    超文本应用程序技术工作组

    WHATWG（Web Hypertext Application Technology Working GroupWeb 超文本应用程
    序技术工作组）是一个负责维护与开发 Web 标准的社区，他们的工作成果包括 DOM、
    Fetch API，和 HTML。一些来自 Apple、Mozilla，和 Opera 的员工在 2004 年建立
    了 WHATWG。

    https://html.spec.whatwg.org/multipage/#toc-semantics


！DOCTYPE，一个文档类型标记是一种标准通用标记语言的**文档类型声明**，它的目的是
要告诉标准通用标记语言解析器，它应该使用什么样的**文档类型定义（DTD）**来解析文
档。
    
    <!DOCTYPE> 声明不区分大小写; 文档类型声明

    http-equiv="X-UA-Compatible" content='IE=dege'

## 开发工具

dreamweaver
sublime
webstorm
hbuilder
vscode
    live server
    auto rename tag
    easy less
    open in browser         文件的方式，而不是网站的方式
    chinese(simplified) Language Pack fro VS Code

    ctrl +
    ctrl -

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
    告诉浏览器或者搜索引擎这是一个英文网站，本页面采用英文来显示，会出现翻译成中文否, 但是我的没有,why???

body
    <body bgcolor='#ff0'>

    <body background=''>
        平铺


    仅仅设置body的背景色, body里只有一行文字
    body 还是一行高，只不过 html 采用了和 body 一样的颜色


font
    <font color="" size=''>

p
    默认 margin:字体大小 0;

em  重点,如 come <em>here</em>
i
strong  强调语气, 如 <strong>This is important</strong>
b

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

wbr(Word Break Opportunity) 

    ```
    <p>
        http://this.is.a.really.long.example.com/With/deeper/level/pages/deeper/level/pages/deeper/level/pages/deeper/level/pages/deeper/level/pages
    </p>

    <p>
        http://this<wbr />.is<wbr />.a<wbr />.really<wbr />.long<wbr />.example<wbr />.com/With<wbr />/deeper<wbr />/level<wbr />/pages<wbr />/deeper<wbr />/level<wbr />/pages<wbr />/deeper<wbr />/level<wbr />/pages<wbr />/deeper<wbr />/level<wbr />/pages<wbr />/deeper<wbr />/level<wbr />/pages
    </p>
    ```


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

base
    <base target="_blank">
    <base href='https://www.baidu.com'>


ul
    只能放 li 元素，不能再放其他的标签
    li 之间是可以放其他标签的

    type            html4.01 已经废弃, 但是好像还可以用
        disc        唱片，实心圆(默认)
        circle      空心圆
        dot         1. 2. **ul 也会是1234带编号的实心方块(chrome)**, 只有正序，没有倒序(reversed)
        square      实心方块

    li 的 list-style 会继承 ul 的, 所以设置 ul 的
    list-style-position

li
    display:list-item;
    display的属性值为list-item的标签也属于块状元素

    ul
        div     // display:list-item; list-style-type:circle;

    
    导航栏每个li后边的分隔线一般用::after, position 定位

    ```
    ::after{
        display:block;      会换行到 li 下边
        content:'';
        width:2px;
        height:1em;
        background:red;
        position:absolute;
        top:5px;
        right:0;
    }
    li:
    ```

ol
    type
        i           小写罗马数字
        I           大写罗马数字
        1
        a
        A

    start='数字'

    start=N reversed    减法


dl  自定义列表

    底部栏
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
    align='left/right'       要放在块级别元素如 div 中, 但是 body 中也可以。。。, 没有 center, **实际是 float**
        Aligns the image with its surrounding context. Use the float and/or vertical-align CSS properties instead of this attribute. Allowed values:

        top
            Equivalent to vertical-align: top or vertical-align: text-top

        middle
            Equivalent to vertical-align: -moz-middle-with-baseline

        bottom
            The default, equivalent to vertical-align: unset or vertical-align: initial

        left
            Equivalent to float: left

        right
            Equivalent to float: right

    文字不会在图片下方, 不会被图片覆盖


    hspace          // img 左右和其他元素的距离, 实际是margin, HTML5 不支持。HTML 4.01 已废弃。 规定图像左侧和右侧的空白。
    vspace          // img HTML5 不支持。HTML 4.01 已废弃。 规定图像顶部和底部的空白。
    border='0'      HTML5 不支持。HTML 4.01 已废弃。


    热点
    ```
        <img src='xx' usemap='#图片名称'>           **注意有个 #, 是指向 name** , 即使 map 有不同的 id
        <map name="图片名称">
            <area shape='rect' coords="左上角坐标，右下角坐标" href="http:xxx" target="_blank">
            <area shape='rect' coords="1,1,50,50" href="http:xxx" target="_blank">
            <area shape='circle' coords='100,100,20' href='xxx'>
            <area shape='poly' coords=' '>       多边形
        </map>
    ```


        href: hyper reference(引用)
        
        target
            _blank
            _self
            _parent 框架中
            _top    框架中

figure
    将 img 和相关内容的容器
    figcaption  标题
    一般包含 h1~h6

    <figure>
        <img ...>
        <p>...</p>
        <figcaption><h2>helloworld</h2></figcaption>        // 一般写在最后或最前
    </figure>


bdo 标签用来覆盖默认的文本方向。 BiDirectional(双向的；双向作用的) Override
    dir='ltr/rtl'

    ```
    <p>该段落文字从左到右显示。</p>  
    <p><bdo dir="rtl">该段落文字从右到左显示。</bdo></p>


    <p> hi <bdo dir='rtl'>obala</bdo> - 1st</p>
    <p> hi <bdi> <bdo dir='rtl'>obala</bdo> </bdi> - 1st</p>
    ```

bdi Bi-directional Isolation
    标签允许您设置一段文本，**使其脱离其父元素的文本方向设置**, 一般是语言，如阿拉伯语
    Browsers implement the Unicode Bidirectional Algorithm to handle this.


    ```

    No bdi with RTL text

    This example lists the winners of a competition using <span> elements only,
    and one of the winners has a name consisting of RTL text.

    In this case the "- 1", which consists of characters with neutral or weak
    directionality, will adopt the directionality of the RTL text, and the
    result will be garbled:

    <ul>
        <li><span class="name">اَلأَعْشَى</span> - 1st place</li>
        <li><span class="name">Jerry Cruncher</span> - 2nd place</li>
    </ul>
    1 - اَلأَعْشَى st place
    Jerry Cruncher - 2nd place


    Using bdi with LTR and RTL text

    This example lists the winners of a competition using <bdi> elements. These
    elements instruct the browser to treat the name in isolation from its
    embedding context, so the example output is properly ordered:

    <ul>
        <li><bdi class="name">اَلأَعْشَى</bdi> - 1st place</li>
        <li><bdi class="name">Jerry Cruncher</bdi> - 2nd place</li>
    </ul>
    أَعْشَى - 1st place
    Jerry Cruncher - 2nd place


    ```


video
    src=""                      mp4, webm 等格式
    controls="controls"         显示控制控件, 只有两种状态,**bool 属性可以不写属性值**
                                在各个浏览器里样式不太一样，一般不用这个，而是用 js 实现
    autoplay                    bool属性
                                google 必须添加 muted 属性才可以 autoplay
    muted                       bool属性，静音播放
    loop                        bool属性，循环播放
    width
    height
    preload                     auto/none; 是否预先加载视频(如果有了 autoplay, 则忽略该属性)
    poster                      ='images/img' 等待时的加载的画面



    <video src="a.mp4" autoplay></video>


    <video controls>                这样写有更好的兼容性视频格式
        <source src="a.mp4">
        <source src="a.webm">
        您的浏览器不支持视频标签
    </video>

    目前只支持3种格式:
        mp4(推荐)
        webm
        ogg

audio
    src=""                      mp3
    controls="controls"         显示控件, 只有两种状态,**bool 属性可以不写属性值**
    autoplay                    bool属性
                                google chrome 也禁用了
    muted                       bool属性，静音播放
    loop                        bool属性，循环播放


    mp3(都支持)
    wav
    ogg


marquee([mɑːrˈkiː] 移动字幕效果)     滚动标记
    (Deprecated)
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

    <embed type="video/webm" src="/media/cc0-videos/flower.mp4" width="250" height="200">

a 锚点

    ```
    <a name="top">
    <a href="#top">

    id相同，前者优先，先到先得

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

    如果 href 是文件，则是下载


    让一个超链接点击后不链接到任何地方，而鼠标移上去仍然显示手指形状的图标，就用javascript:void(0)。

    然后真实执行的操作，是在这个a标签后面加onclick="xxxxx"。



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

        If the http-equiv attribute is set, the <meta> element is a pragma
        directive, providing information equivalent to what can be given by a
        similarly-named HTTP header.
        如果设置了 http-equiv 属性，meta 元素则是编译指令，提供的信息与类似命名的 HTTP 头部相同。

        它可以向浏览器传回一些有用的信息，以帮助正确和精确地显示网页内容


        x-ua-compatible If specified, the content attribute must have the value "IE=edge". User agents are required to ignore this pragma.(编译指示)

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

ul type=
    disc
    'circle'
    dot
    square

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

    表单域

    action=

    input
        maxlength 最大字符数
        css -> outline:

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
                label 绑定 **使用 id 属性**
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
            
                <select name="city" id="">
                    <optgroup label="河北">
                        <option value="">邯郸市</option>
                        <option value="">邢台市</option>
                    </optgroup>
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

                
                textarea { resize:none; }
            
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

三大特性
    层叠性
    继承性
    优先级


1. 内联/行内/行间
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
        RGB(222,1,1,.1)
        #rrggbb

2. background-color
    background-image
    
    颜色: linear-gradient(方向, 颜色1 百分比开始位置 百分比结束位置, 颜色2 百分比开始位置,百分比结束位置 ,...)
        方向:
            to top left
            0deg     向上
            90deg    向右
            180deg   向下
            270deg   向左
            
        background:linear-gradient(to top, red 20%, blue 20% 50%, green 50%)

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
        'Microsoft YaHei'
        monospace: 单一间隔；划一字距，等宽字体

    sans-serif: 非衬线自体
    serif: 用于印刷, 如宋体

6. font-style
    
    normal
    italic      // 斜体, em
    oblique     // / əˈbliːk /


    i 元素一般用来做一个图标(icon)

    em: 强调

    strong: 

    font-style, font-variant, font-weight, font-stretch, font-size, line-height, and font-family.
    font-style,  font-weight,  font-size/line-height, font-family.
        
        必须有的: font-size/line-height font-family
            line-height 是 纯数字会继承这个数字

    

文本属性

7. text-decoration

    overline            // 上边
    line-through
    underline
    
    del     
    s       废弃
    ins


8. text-indent
    首行缩进

    2em
    10px

    可以是负数

    要块盒和行块盒上

9. ???line-height
    
    纯数字: 相对于当前文字大小, 不用 em, 事关继承

    上间距
    文字
    下间距

    和 height 相等，则居中
    < height, 偏上
    > height, 偏下

10. letter-spacing

    文字间隙

11. text-align

    **要给父元素设置**

    left/right/center

#### emmet

Zen-o



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

3. CSS重置样式

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
        list-item

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

background-origin 规定了指定背景图片background-image 属性的原点位置的背景相对区域。
    初始值  padding-box
    background-origin: padding-box
    background-origin: border-box
    background-origin: content-box

    background-origin: inherit

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


当元素没有设置 width 属性时，padding 就不会撑开盒子
    width:100%; padding:10px; 也会撑开盒子, 出现滚动条(因为默认 width 是content-box)


body 默认 margin:8px;


大量文字就用 p

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
    1. 常规流/文档流/标准流
    2. 浮动
    3. 定位


### 1. 常规流/文档流/标准流

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
    3. 浮动盒子在包含块中排列时，会避开常规盒子(浮动只会影响**浮动后边**的标准流元素)
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


        ::after,::before{display:table;} 转换为块级元素并且**在一行显示**

            +---------------------------------+
            | +------+ +----+ +----+ +-------+|
            | |before| | xx | | xx | | after ||
            | +------+ +----+ +----+ +-------+|
            +---------------------------------+

        clear:left
            该元素必须排列在前边所有浮动元素的下方

    7. 浮动的盒子顶端对齐
    8. 浮动后变为 display:inline-block
    9. 由标准流的父元素约束



清除浮动
    1. 额外标签(块元素，clear:both)
    2. 父元素 overflow: hidden/auto(自动滚动条)/scroll
        触发BFC使父级元素自适应为子元素的高度
    3. :after 伪元素
    4. 双伪元素 :before, :after
        :before清除掉collapse造成的影响, margin collapse, 父元素有 margin-top



### 3. 定位 position

**手动控制元素在包含块中的精准位置**

定位组成
    1. static(default)
    2. relative
    3. absolute
    4. fixed

    边偏移
        top
        left
        right
        bottom

定位元素会脱离文档流(relative 除外)

脱离文档流的元素的特点
    文档流中的元素摆放时，会忽略脱离了文档流的元素
    文档流中元素计算自动高度时，会忽略脱离了文档流的元素


0. static
    不能使用边偏移

1. relative

    避免设置冲突的值，以left,top为准

    不脱离常规文档流

2. absolute

    宽高为auto时，适应内容, 收缩shrink
    包含块变化: 找祖先元素中最近的定位元素，该元素的**填充盒(padding-box)**为其包含块
        如果找不到，则整个网页(document)为其包含块

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

    sticky粘性定位技巧
        固定在版心右侧位置

        left:50%;
        margin-left:1/2 版心宽度


absolute,fixed
    **一定是块盒, 会自动加上 display:block**
    一定不是浮动
    没有margin合并


只有定位的盒子有 z-index 属性

绝对定位居中
    绝对定位的盒子是不能通过 margin: 0 auto; 水平居中的

    position:absolute;
    left:50%;
    margin-left:-一半自己的宽度

    top:50%;
    margin-top:-一半自己的高度


案例

    焦点图(轮播图)

    +-----------+
    |           |
    |<         >|
    |           |
    |    ...    |
    +-----------+

定位的元素慎用 overflow:hidden


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

visibility:
    visible(default)
    hidden

!!!背景图

    img 是 html的
    背景图是 css 的

    当图片属于网页内容时，使用 img
    当图片仅用于美化网页时，使用 CSS


    background-image:url("images/images.jpg")

    background-repeat:no-repeat
    background-repeat:repeat-x

    background-size:
        contain         // 不改比例， 全部显示
        cover           // 
        数值/百分比     // 水平  垂直
        
    backgrounp-position: center;        // 水平垂直居中
        center top                      // 水平居中，垂直top
        
        top,right,bottom,left           // 距离上右下左的距离
        默认是居中对齐

        精灵图/雪碧图/spirit 图

            减少IO请求

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


## table

不同的语言对于cellspacing具有完全不同的语法，例如在CSS中使用
"**border-spacing**"属性，而在HTML中使用“cellspacing”。默认2px

border-spacing:0
border-collapse:collapse;


cellspacing=0
cellpadding=0


```
<table cellspacing='20'>

table{
    cell-spacing:20px;
    border-collapse:collapse;   设置表格的边框是否被合并为一个单一的边框
}
```

较旧版本的HTML支持cellpadding命令，但更高版本的HTML5不允许使用cellpadding，因此替代CSS用于在需要时提供相同的格式。

可以设置 vertical-align

```
<table align='center'>

```



### colgroup

```
<table border="1">
<colgroup>
    <col span="2" style="background-color:red">    span=number  规定列组应该横跨的列数
    <col style="background-color:yellow">
</colgroup>

<tr>
    <th>ISBN</th>
    <th>Title</th>
    <th>Price</th>
</tr>
<tr>
    <td>3476896</td>
    <td>My first HTML</td>
    <td>$53</td>
</tr>
</table>
```

<colgroup> 标签用于对表格中的列进行组合，以便对其进行格式化。

通过使用 <colgroup> 标签，可以向整个列应用样式，而不需要重复为每个单元格或每一行设置样式。

注释：只能在 <table> 元素之内，在任何一个 <caption> 元素之后，在任何一个 <thead>、<tbody>、<tfoot>、<tr> 元素之前使用 <colgroup> 标签。


使用 position:relative 进行精确定位



### blockquote

```
<figure>
    <blockquote cite="https://www.huxley.net/bnw/four.html">
        <p>Words can be like X-rays, if you use them properly—they’ll go through anything. You read and you’re pierced.</p>
    </blockquote>
    <figcaption>—Aldous Huxley, <cite>Brave New World</cite></figcaption>
</figure>
```

定义一个摘自另一个源的块引用：


### cite

使用 <cite> 标签来定义作品的标题

```
<img src="img_the_scream.jpg" width="220" height="277" alt="The Scream">
<p><cite>The Scream</cite> by Edward Munch. Painted in 1893.</p>
```

### q

```
<p>WWF's goal is to: 
<q>Build a future where people live in harmony with nature.</q>
We hope they succeed.</p>
```

标记一个短的引用


### abbr

```
The<abbr title="World Health Organization">WHO</abbr> was founded in 1948.
```


### ruby rb rt

```
<ruby>
    汉 <rp>(</rp><rt>Han</rt><rp>)</rp>
    字 <rp>(</rp><rt>zi</rt><rp>)</rp>
</ruby>
```

<ruby> 标签定义 ruby 注释（中文注音或字符）。

在东亚使用，显示的是东亚字符的发音。

将 <ruby> 标签与 <rt> 和 <rp> 标签一起使用：
<ruby> 元素由一个或多个需要解释/发音的字符和一个提供该信息的 <rt> 元素组成，还包括**可选的 <rp> 元素**，定义当浏览器不支持 "ruby" 元素时显示的内容


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
    h > div
    a 例外, 可以放块元素


**vertical-align: middle;**

    图片，表单，文字的垂直居中, 只有行内元素，行内块元素

    **图片，文字： 默认是 base 对齐**

    textarea 是行内块

**图片底部空白的问题**
    div>img

    方法一： img{vertical-align:bottom}  不是 base即可
    方法二： img{display:block;}         只有行内，行内块元素才有 vertical-align 属性


通栏




## 切图

1. 图层切图

    ctrl e 合并图层

    右键图层 / 快速导出为png

2. 切片工具 C

    文件 / 导出 / 存储为 Web 所用格式 / jpeg / 存储 / **选中的切片**

    png 需要将背景隐藏

    移动切片
        切片移动工具

3. ps 插件 Cutterman (必须是安装版，查看方法: 窗口/扩展功能/item 如果是可以使用的就ok)
    
    收费工具

    www.cutterman.cn/zh/cutterman


CSS 属性书写顺序

    建议遵循以下顺序:

    1. 布局定位属性
        
        display / position / float / clear / visibility / overflow

    2. 自身属性
        
        width / height / margin / padding / border / background

    3. 文本属性

        color / font / text-decoration / text-align / vertical-align / white-space / break-word

    4. 其他属性(css3)
        
        content / cursor / border-radius / box-shadow / text-shadow / background:linear-gradient


## 字体图标

本质是文字,不会失真

可以更改颜色

比图片轻量级

### icomoon

1. 下载
    icomoon.io
        icomoon app / 选择 / Generate Font / Download
    iconfont.cn

2. 引用

    把 fonts 目录放在根目录

    通过css方式引用 style.css 中的第一段代码

    demo.html 是展示页面

    span {font-family: icomoon;}

    <span></span> 这里是复制 demo.html 中的方块

    <span>\编码</span>
    
3. 追加
    
    还是打开 icomoon , import icons 选择 之前已经下载过的selection.json, 我们之
    前用的自体就已经被导入了，然后继续追加选择，重新下载替换就可以了


### iconfont

https://www.iconfont.cn/

可以变更大小，要不然大的图标会有bug

复制 demo_index.html 中的css


## 鼠标样式

cursor
    default 白色箭头
        <p style='cursor:default'></p>
    pointer     小手
    move        十字移动
    text        文字
    not-allowed 禁止



表单轮廓线outline
    蓝色的轮廓线

    outline:none

    input{outline:none}


文本域禁止右下角拖拽
    
    textarea { resize:none; }



单行文本省略号
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;

多行文本省略号





## 布局技巧

1. margin负值
    
    淘宝 多个商品边框1像素
    margin-left:-1px;

    第一个元素左移，第二个渲染，然后左移，所以可以覆盖，不会出现bug
    右边的 li 的边框的左边框压住左边的 li 的右边框

    relative 会压住常规流
    ul li:hover {
        position:relative;
        border-color:red;
    }

    如果每个 li 都有 relative 定位, 可以用 z-index, 因为其他的 z-index 都是 auto

    ul li:hover {
        z-index:1;
        border-color:red;
    }


2. 文字围绕浮动元素

    +-------------------+   图片浮动即可
    |+-------+          |
    ||       |          |
    || 图片  |   文字   |
    ||       |          |
    |+-------+          |
    +-------------------+

3. 用行内块做页码导航

    .box{
        text-align:center;
    }
    .box a{
        display:inline-block;
        widht:20px;
        height:20px;
        line-height:20px;
    }

4. 三角形





## html5 新特性

head
nav
article
section
aside
footer

|   +---------------------------------+
|   | +-----------------------------+ |
|   | |             head            | |
|   | +-----------------------------+ |
|   | +-----------------------------+ |
|   | |              nav            | |
|   | +-----------------------------+ |
|   | +-------------+  +------------+ |
|   | |             |  |            | |
|   | | article     |  | aside      | |
|   | | +-------+   |  |            | |
|   | | |section|   |  |            | |
|   | | +-------+   |  |            | |
|   | |             |  |            | |
|   | +-------------+  +------------+ |
|   | +-----------------------------+ |
|   | |             footer          | |
|   | +-----------------------------+ |
|   +---------------------------------+


input type
    search
    email
    url
    date
    time
    month
    week
    number
    tel         ???这个好像不好用
    color



表单属性

    <input
        required
        placeholder

            input::placeholder{color:red;}

        autofocus
        autocomplete="on/off"    必须有name
            当键入时，浏览器基于之前键入的值，进行候选

        multiple    多选


css3
    1. 属性选择器
    ```
    <input type='text' value='123' ...>
    <input type='text' ...>

    input[value] {}     input 中有 value 属性的元素

    ---

    input[value="xxx"] {}     input 中 value='xxx' 的元素

    ---

    div[class^="ico"] {}      所有class的属性值以 ico 开头的元素

    ---

    div[class$="ico"] {}      所有class的属性值以 ico 结尾的元素

    ---

    div[class*="ico"] {}      所有class的属性值中有 ico 的元素
        权重: div + 属性 = 1 + 10 = 11
        div.icon1

    ```


    2. 结构伪类选择器(当前元素父元素的子元素)

    ```
    E 是后代选择器

    E :first-child            匹配父元素E中的第一个子元素
    E x:first-child           x 的父元素下的第一个x元素

    E :last-child             匹配父元素E中的最后一个子元素
    E x:last-child            

    E :nth-child(n)           匹配父元素E中的第n个子元素
    E x:nth-child(n)          

        n 可以是数字
          可以是**关键字**: even(偶数)  odd(奇数)   隔行变色
          可以是公式, 从0开始，依次加1
          ol li:nth-child(n){ }     所有子元素
          ol li:nth-child(2n){ }    所有偶数子元素
          ol li:nth-child(2n+1){ }  所有奇数数子元素
          ol li:nth-child(5n){ }    所有...
          ol li:nth-child(n+5){ }   第五个开始
          ol li:nth-child(-n+5){ }  前5个(-0+5, -1+5, -2+5,...)



    ul>li*10

    ul :first-child
    ul li:first-child
    li:first-child




    :first-of-type          指定元素排序, nth-child 是所有子元素排序
    :last-of-type
    :nth-of-type(n)


    section div:first-child(1)
        步骤一: :first-child(1)
        步骤二: 是div, 如果不是div 就失败了

    section div:first-of-type(1)
        步骤一: div
        步骤二: :first-of-type
    ```



    3. 伪元素选择器
        不需要 HTML 标签，简化 HTML 结构

        ::before
        ::after

        老式的写法是一个冒号

        div::before
            div 里边的最前面


        使用场景
            1. 配合字体图标

            2. 图片遮罩层
                .tudou:hover::before{}

            3. 清除浮动





## box-shadow

h-shadow    必需的。水平阴影的位置。允许负值
v-shadow    必需的。垂直阴影的位置。允许负值
blur        可选。模糊距离
spread      可选。阴影的大小
color       可选。阴影的颜色。在CSS颜色值寻找颜色值的完整列表
inset       可选。从外层的阴影（开始时）改变阴影内侧阴影


## text-shadow

h-shadow    必需的。水平阴影的位置。允许负值
v-shadow    必需的。垂直阴影的位置。允许负值
blur        可选。模糊距离
color       可选。阴影的颜色。在CSS颜色值寻找颜色值的完整列表

## 盒模型

calc 函数

子元素永远比父元素小30px

.son{
    width:calc(100% - 30px);
}



## css3 滤镜 

1. filter 滤镜

    filter: 函数();

        blur(px)    高斯模糊
        brightness(%)   0% 全黑; 100% 无变化; >100% 更亮
        contrast(%)     0% 全黑; 100% 无变化; >100% 对比度更低

    filter: blur(5px); 模糊处理






## css3 过渡

经常配合 :hover 使用

transition: 要过渡的属性 花费时间 运动曲线 何时开始
    时间: 必须写单位 s
    曲线: easy


```
div{
    width:100px;
    height:100px;
    background-color:red;
    transition: width 1s, height 2s;           写在这里，而不是 hover, 逗号分隔多个属性
    transition: all 1s;
}

div:hover{
    width:800px;
    height:200px;
    background-color:green;
}
```


免费空间
    free.3v.do


## 2D转换

不会影响其它元素的位置
对行内元素没有效果
百分比单位是相对于自身元素的

transform, 变形
    translate   移动, 类似定位
    rotate      旋转
    scale       缩放


### translate

transform: translate(100px, 50px)
transform: translateX(100px)
transform: translateY(50px)


水平居中(结合 position):
    transform: translate(-50%,-50%); 代替 margin-top 和 margin-left


### rotate

transform: rotate(45deg);       顺时针
transform: rotate(-45deg);      逆时针

### **设置中心点**

    transform-origin
    transform-origin: x y;

    transform-origin: 50% 50%;  default

        像素
        方为名词
            left bottom
            right top
            center


    transition:all 1s;
    transform-origin: left bottom;
    transform-origin: 50px 50px;


    三维

    transform-origin: x y z;

### 缩放 scale

transform: scale(x,y);

transform: scale(2);        x,y 都缩放为2



transform: tranlate(50px,50px) rotate(10deg) scale(x,y);
    顺序会有比较大的影响, 先写位移



## 动画

1. 用 keyframes 定义动画

```
@keyframes 动画名称{
    0%{                                 // 可以用 from 替换
        transform: translateX(0x);
    }

    100%{                               // 可以用 to 替换
        transform: translateX(1000x);
    }
}

```

2. 使用动画

```
div {
    animation-name: 动画名称;
    animtion-duration: 持续时间;
}
```



@keyframes      
1. animation-name
2. animation-duration          完成所需时间
3. animation-timing-function
    ease    低速开始，加快，减慢
    linear  匀速
    ease-in
    ease-out
    ease-in-out
    steps(几个步长)
        打字机效果

4. animation-delay             何时开始
    0s

5. animation-iteration-count   播放次数
    infinite    无限循环
    1(default)

6. animation-direction         是否反方向播放
    normal      返回从新开始
    alternate   轮流的

7. animation-fill-mode         结束后的状态（位置）
    backwards       回到初始位置
    forwards        停在结束状态状态

8. animation-play-state        动画运行或暂停
    paused  暂停


动画简写
    animation: 动画名称 持续时间 | 运动曲线 何时开始 播放次数 是否反方向 结束状态


## 3D 转换

1. 3D移动 translate3d

    transform: translateX()
    transform: translateY()
    transform: translateZ()     一般只用 px, 需要结束透视

    简写
    transform: translateX(x) translateY(y) translateZ(z);
    transform: translate3d(xpx,ypx,zpx)

2. 透视 perspective

    **写在被观察元素的父盒子上,可以写在祖先元素上**

    ```
    body{
        perspective:200px;
    }

    div{
        transform: translate3d(0,0,100px);
    }
    ```


    视距: 人眼到屏幕的距离
    z轴:  物体在Z轴上的距离

    视距 - z轴

3. 3D旋转 rotate3d

    transform: rotateX(10deg)       向后倒为正, 左手法则
    transform: rotateY(10deg)       左手法则, 大拇哥指向正方向，四指指向正方向
    transform: rotateZ(10deg)
    transform: rotate3d(x,y,z,Ndeg);
        transform: rotate3d(1,1,0,45deg);   x,y 的矢量

4. 3d呈现 transform-style
    
    控制子元素是否开启三维立体环境
    transform-style: flat           子元素不开启3D立体空间(default)
    transform-style: preserve-3d    子元素开启3D立体空间
    代码写在直接父级元素上







## 移动端

### 视口 viewport

浏览器显示页面内容的屏幕区域, 分为 布局视口、视觉视口和理想视口

1. 布局视口 layout viewport

    早期的网页都是为电脑写的，为了将电脑上的网页放到手机上，设置了布局视口

    980px, 大多书网页都能在手机上呈现，只不过元素看上去很小

2. 视觉视口

    视觉视口是指用户正在看到的网站的区域，这个区域的宽度等同于移动设备的浏览器
    窗口的宽度

    当我们在手机中缩放网页的时候，操作的是视觉视口，而布局视口仍然保持原来的宽度。

3. 理想视口

    理想视口是指对设备来讲最理想的视口尺寸。采用理想视口的方式，可以使网页在移
    动端浏览器上获得最理想的浏览和阅读的宽度。

    在理想视口情况下，**布局视口的大小和屏幕宽度是一致的**，这样就不需要左右滚
    动页面了。

    在开发中，为了实现理想视口，需要给移动端页面添加标签配置视口，通知浏览器来
    进行处理。


meta 视口标签

```
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-sclae=1.0, minium-scale=1.0">

    user-scalable=no    // 不允许用户缩放

    视口宽度应该和设备宽度一致
    不允许用户自行缩放
    视口默认比例为1.0
    最大比例1.0
    最小比例1.0
```


### 二倍图

物理像素

物理像素比

PC端页面， 1px 就是1个物理像素

**1px 能显示的物理像素点的个数，称为物理像素比或屏幕像素比**
    iphone 12 pro   4032×3024
        但是 400宽度 就占满了, 3024/400 = 7.56, 7.56个物理像素显示一个像素
    iphone8     1334x750
        但是375px 就占满了, 750/375 = 2

    google chrome 浏览器上 F12 显示的是虚拟像素点，是由多个物理像素点组成的, 例
    如 iphone8的 375x667; iphone 12 pro 的 390x844


Retina 可以把更多的物理像素压缩至一块屏幕，从而达到更高的分辨率，提高显示的细腻程度


50x50的图片放在 iphone 8 上会变为2倍,100x100,就会模糊，此时我们放一个100x100的图片，手动缩小为 50x50

就是根据设备的实际像素来找图片


背景缩放
    background-size 宽 高;

    background:url(a.jpg);
    backgorund-size:100px 200px;        可能会变形
    backgorund-size:100px;              等比缩放
    backgorund-size:50%;                相对父元素的宽度
        cover:      不变形完全覆盖,会显示不全
        contain:    不变形扩展至最大尺寸, 不能完全覆盖, 会有空白区域


    切图 cutterman 多被图


### 移动端开发选择

1. 单独制作移动端页面(主流)

    推荐 normalize.css 初始化

2. 响应式布局

    制作麻烦，花很大精力去调



### 几个特殊样式

a 点击时是高亮显示的，会有一个背景色, -webkit-tap-hightlight-color:transparent;

input{
    -webkit-appearance: none;       // 去掉外观样式
}


禁止长按页面时的弹出菜单
    img,a{
        -webkit-touch-callout: none;
    }




### 移动端布局

单独开发
    1. 流式布局（宽度百分比布局）
    2. flex 弹性布局(推荐)
    3. less + rem + 媒体查询
    4. 混合布局


响应式兼容移动端
    1. 媒体查询
    2. bootstrap


### 流式布局

m.jd.com

就是百分比布局，非固定像素布局

通过盒子的宽度设置成百分比来根据屏幕的宽度进行伸缩，不受固定像素的限制，内容向两侧填充

是移动 web 开发中比较常见的布局方式

max-width:
min-width: 320px;

body{
    width:100%;
    min-width:320px;
    max-width:640px;
    font-family: -apple-system, Helvetica, sans-serif;
}


### flex 布局

布局原理:
    flex 是 flexible box 的缩写，意味弹性布局, 任何一个容器都可以指定为弹性布局

    当为父盒子设为 flex 布局以后，子元素的 float、clear和 vertical-align 属性将失效
    伸缩布局 = 弹性布局 = 伸缩盒布局 = 弹性盒布局 = flex布局

    采用 flex 布局的元素，称为 flex 容器(flex container), 简称“容器”, 它的所有
    子元素自动成为容器成员，称为 Flex 项目,简称“项目”

    项目默认横向排列，也可以纵向排列

    通过给父盒子添加 flex 属性来控制子元素的排列

父元素属性
    flex-direction: 设置主轴方向
    flex-wrap:  子元素是否换行

    justify-content: 主轴上的子元素排列方式

    align-content:  侧轴上的子元素的排列方式（多行）
    align-items:    侧轴上的子元素的排列方式（单行）

    flex-flow:      复合属性，相当于同事设置了 flex-direction flex-wrap
        flex-flow: column wrap;

    主轴和侧轴
        默认主轴是x, 侧轴是y
        元素跟着主轴来排序

        flex-direction:
            row
            row-reverse     翻转，从右向左
            column
            column-reverse

    主轴上的排列方式
        justify-content:
            flex-start(default)
            flex-end            右对齐
            center              居中对齐
            space-around        平分剩余空间
            space-between       两边贴边，然后再平分剩余空间
            space-evenly        每个 gap 都一样大

    默认情况下，项目都排在一条线上，子元素不换行，宽度不够则缩小子元素的宽度来添加
        flex-wrap:
            no-wrap
            wrap

    align-items:  侧轴上的子元素的排列方式（单行）
        flex-start  从上到下
        flex-end    从下到上
        center      居中
        stretch     拉伸(默认)
            子元素不能设置对应方向的宽度和高度

    align-content:  侧轴上的子元素的排列方式（多行）
        子项排列中出现换行的情况
      flex-start
      flex-end
      center
      space-around      平分剩余空间/ margin-box
      space-between     子项在侧轴先贴边，再平分
      stretch           

子元素属性
    flex        子项目占的剩余空间的份数, default 0
    align-self  控制子项自己在侧轴上的排列方式
    order       定义了子项的排列顺序(前后顺序)
        default 0
        越小越靠前



### 2倍精灵图

精灵图缩小为一半进行测量
background-size 也一半


.dpj 图片格式，jd 出品
.webp 图片格式, google 出品






img 比 div 尺寸大，才不会考虑 div 



## rem em

em : 相对于父元素的文字大小

rem : 相对于html元素的文字大小

## 媒体查询

@media mediatype and | no t| only (media feature)

mediatype
    all
    print
    screen

    @media screen and (max-width:800px){

    }


媒体查询引入资源
    
    <link rel="stylesheet" href="" media="screen and (min-width:320px)">


## less

```a.less
@color:pink;
body{
    background-color:@color
}
```


### less 编译
    vscode 插件: easy less


### 嵌套
    
```
.header {
    width:200px;
    background-color: pink;
    a {
        color:#fff;

        &:hover{

        }
    }

}
```


    &：伪类,伪元素，交集需要加 &


### 注释

//

### 运算

    ```
    @border:5px;
    @border:5px + 5;

    div{
        width:10px * 2;
        width:100px - 50;
        width:10px;
        border:@border solid green;
    }

    ```

**运算符左右要有空格**

单位：只要有一个有单位即可
**如果两个都有单位，且不一样，以第一个为准**


## rem 适配方案

高度宽度都等比例变化


## favicon 图标

放在网站根目录下

**没有配置域名，当以绝对路径访问项目时，不能正常引入favicon.ico**


## seo

search engine optimization

页面必须有3个标签来符合 SEO 优化

TDK
    title
    description
    keyword






## 品优购案例

客户沟通
签订合同
预付定金 30%
初稿审核
前台页面设计/后台功能开发
测试验收
上线培训
后期维护


首页
列表页
注册页

命名用下划线




### 

一个元素里只用一套 position:absolute 吧, 做shortcut 时的感悟, 又分割线，又下拉三角的




## border-imaage


top right bottom left

border-image-source

border-image-slice

border-image-width

border-image-repeat
    repeat  平铺
    round   铺满
    stretch(default)


    ```
    border-image-source:url()
    border-image-slice:30 30 30 30;     //没有单位
    border-image-width: 30px;           // 可以大于 border-width, 不会占据空间
    ```

