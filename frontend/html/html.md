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
    
    <!DOCTYPE> 声明不区分大小写

## 注释

` <!-- -->

## html 属性

body
    <body bgcolor='#ff0'>

    <body background=''>
        平铺


font
    <font color="" size=''>

i
b
strong
u
s   删除线
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
    &copy;
    &times;     乘以
    &divide;    除法


    <div>   -> &lt;div&gt;
    &copy;长生科技

span

ul
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


dl
    dt      块标记
    dd      这个会有一个缩进,是块标记

img
    alt
    title='xxx'     鼠标放上去时显示的文字, 如果没有alt, 图片又不存在，就会显示title的内容
    width
    height
    border='0'
    align='left/right'       要放在块级别元素如 div 中, 但是 body 中也可以。。。, 没有 center

    文字不会在图片下方

    hspace          // img 左右和其他元素的距离, 实际是margin
    hspace          // img 上下和其他元素的距离, 实际是margin

    热点
        <img src='xx' usemap='#图片名称'
        <map name="图片名称">
            <area shape='rect' coords="左上角坐标，右下角坐标" href="http:xxx" target="_blank">
            <area shape='rect' coords="1,1,50,50" href="http:xxx" target="_bland">
            <area shape='circle/poly' >
        </map>
        
        target
            _blank
            _self
            _parent 框架中
            _top    框架中

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
    alt='图片不能显示的提示文字'

a(anchor)
    target='_blank'
    href='tel:18888888888'                              //打电话
    href='mailto:a@a.com'                               //发邮件
    href='javascript:function(){console.log("hello")}'  //协议限定符
    href='javascript:while true{alert("hello")}'  

form
    action=

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
            
            checkbox

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
                
            
            隐藏域
                <input type='hidden name='' value=''>

            <textarea rows=' ' cols=' '></textarea>
            
        name    传给服务器的值
        value   传给服务器的值
