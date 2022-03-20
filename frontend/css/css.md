## 引入

1. 行间 

1. 内部样式表

1. 外部样式表
    1、链接式
    <link type="text/css" rel="styleSheet"  href="CSS文件路径" />

    2、导入式
    <style type="text/css">
      @import url("css文件路径");
    </style>

## 定位

position
    static
    relative
        占据原来的空间
    absolute
        相对于有 position(非static) 的父元素进行定位
    fixed
        相对视口进行定位
    sticky
        1. 必须要设置top才会起作用
        1. https://www.cnblogs.com/s1nker/p/4835079.html
    
    注意
        凡是 position:absolute \|\| float:left/right 的元素，display 就转换成了 block

z-index
    auto
    适用于：定位元素。即定义了position为非static的元素
    值越大，离用户越近，可以是负值

top
    length 
    percentage
    absolute是指定元素相对于最近的position值为非 static 定位祖先元素的偏移的
right
bottom
left

clip
    auto:对象无剪切，这个属性好像是废弃了
    rect(number\|auto number\|auto number\|auto number\|auto)：依据上-右-下-左的顺序提供自对象左上角为(0,0)坐标计算的四个偏移数值，其中任一数值都可用auto替换，即此边不剪切。
    他们之间需要用逗号隔开
    clip属性只能在元素设置了“position:absolute”或者“position:fixed”属性起作用著作权归作者所有。
    top 和 bottom 的值定义的都是距离顶部边界的偏移量，而 left 和 rigjt 的值定义的都是距离左边界的偏移量。 
    img 还是那么大，只是只显示指定的区域，top left 的作用和没有clip时一致
    
    一个典型的应用

    ```
    img 
    {
        position:absolute;
        clip:rect(100px,200px,300px,0px);
    }
    
    <img src="./tennis.jpg" alt="">
    ```

## 布局

display
    1. inline
    1. block
    1. inline-block
        * 如果 inline-block 元素内没有文字，紧挨着 inline-block 的行内级 文本 元素 和 inline-block的底边对齐
        * 如果 inline-block 元素内有文字，则和 inline-block 内的文本 对齐
    1. list-item
    1. table
        * display:table
        * **table-layout 表格布局**
            * fixed 在固定表格布局中，水平布局仅取决于表格宽度、列宽度、表格边框宽度、单元格间距，**而与单元格的内容无关。**
                * 通过使用固定表格布局，用户代理在接收到第一行后就可以显示表格。
                * 列宽由表格宽度和列宽度设定。
            * auto(default) 在自动表格布局中，**列的宽度是由列单元格中没有折行的最宽的内容设定的。**
                * 此算法有时会较慢，这是由于它需要在确定最终的布局之前访问表格中所有的内容。
                * 列宽度由单元格内容设定。

    1. flex
    1. inline-flex
    1. **注意**
        * block 和 inline区别
            * 内容决定大小
            * CSS 能否控制 width/height

        * float 与 margin 塌陷 
            * **浮动元素不会影响后续块级盒子与前面块级盒子的外边距塌陷**

            * **clearance(闭合浮动)**

            ```

            但当我们利用bottom清除浮动时
            .bottom{
                background:#00ff0088;
                margin-top:20px;
                clear:both;
            }
            ```

            * 使用清除浮动属性的元素，它的外边距塌陷规则变成如下规则：
                * 闭合浮动的盒子的border-top始终和浮动元素的margin-bottom底部重合。
                * 而在闭合浮动的盒子的margin-top上方，直到top盒子的margin-bottom底部这段距离，就是我们所说的clearance。
                * 浮动元素与border，padding这样的屏蔽外边距塌陷的属性不同，浮动元素是脱离文档流的，当浮动元素没有大到足以分开BFC中的相邻盒子时，相邻盒子的垂直margin还是会重叠的

                    <!-- <img src="./images/html/clearance.webp"> -->

                    <img src="http://www.刘蛟.中国/images/html/clearance.webp">

                * **如果clearance的值⼤于0，两个元素就不会发⽣margin collapse**

float(图文混排)
    none
    left
    right
    注意
      * 浮动元素产生了浮动流，所有产生浮动流的元素
          * 普通块级元素看不到它们
          * BFC元素可以看到它们
          * 文本类元素可以看到它们

clear
    1. none
    1. left
    1. right
    1. both
    **注意**
      * 只能用于块级元素

          ```
          ::after{
              content:'';
              display:block;
              clear:both;
          }
          ```

    **指定一个元素是否可以在 "它之前的 浮动元素"旁边，或者必须向下移动(清除浮动) 在它的下面**
    clear 属性适用于浮动 和 非浮动元素。

    clear:left/right的际⽤ ---> <a href="http://www.zhangxinxu.com/wordpress/2014/06/understand-css-clear-left-right-and-use/">垂直环绕布局</a>

      <img src="http://www.刘蛟.中国/images/html/clear.left.right实际用途.png">

      “头像img”和“姓”放在同⼀父级容器中，⽽这个父级容器左浮动；右侧的信息元素浮动跟随（⾃适应布局）,这是业界的主流做法，实际上，头像、姓、⾃我描述应该是平级的兄弟N系。从语义来看，貌似“头像、姓”硬⽣⽣变成⼉⼦和⼉是不妥的吧~~

    ```
        <div class="wrap">
            <div class="box one"></div>
            <div class="box two"></div>
            <div class="box three"></div>
        </div>

        .wrap{
            overflow:hidden;
        }
        .one,.two{
            width: 100px;
            height: 100px;
            border:1px solid green;
            float:left;
        }
        .two{
            clear:left;
        }
        .three{
            margin-left:120px;
            width: 200px;
            height: 100px;
            border:1px solid red;
        }
    ```

visibility
    1. visible
    1. hidden
    1. collapse:主要用来隐藏表格的行或列。隐藏的行或列能够被其他内容使用。对于表格外的其他对象，其作用等同于hidden。
    1. 同 display:none 的区别

overflow
    1. visible	默认值。内容不会被修剪，会呈现在元素框之外。
    	. hidden	内容会被修剪，并且其余内容是不可见的。
    	. scroll	内容会被修剪，但是浏览器会显示滚动条以便查看其余的内容。
    	. auto	如果内容被修剪，则浏览器会显示滚动条以便查看其余的内容。
    	. inherit	规定应该从父元素继承 overflow 属性的值。
overflow-x
overflow-y

## 尺寸

width
    * auto 
    * length:不允许负值
    * percentage

min-width
    * length
    * percentage

max-width
height
min-height
max-height
注意
    如果min-width属性的值大于max-width属性的值，max-width将会自动以min-width的值作为自己的值。

## 外补白

margin
    1. 默认为 0
    1. 对齐
        1. 左对齐：margin-right:auto;
        1. 右对齐：margin-left:auto;
        1. 居中：margin: 0 auto;
margin-top
margin-right
margin-bottom
margin-left

## 内补白

padding
padding-top
padding-right
padding-bottom
padding-left

## 边框

border:&lt;line-width&gt; \|\| &lt;line-style&gt; \|\| &lt;color&gt;
  * border-width: &lt;length&gt; \| thin \| medium \| thick
  * border-style:none(default) \| hidden \| dotted \| dashed \| solid \| double \| groove \| ridge \| inset \| outset
  * border-color

border-top
border-right
border-bottom
border-left

border-radius
  * border-top-left-radius
  * border-bottom-right-radius
      * 设置或检索对象使用圆角边框。提供2个参数，2个参数以“/”分隔，每个参数允许设置1~4个参数值，第1个参数表示水平半径，第2个参数表示垂直半径，如第2个参数省略，则默认等于第1个参数
      * 水平半径：如果提供全部四个参数值，将按上左(top-left)、上右(top-right)、下右(bottom-right)、下左(bottom-left)的顺序作用于四个角。 

      * 如果只提供一个，将用于全部的于四个角。
      * 如果提供两个，第一个用于上左(top-left)、下右(bottom-right)，第二个用于上右(top-right)、下左(bottom-left)。
      * 如果提供三个，第一个用于上左(top-left)，第二个用于上右(top-right)、下左(bottom-left)，第三个用于下右(bottom-right)。
      * 垂直半径也遵循以上4点。
  * 圆角大值特性，值很大的时候，只会使用能够渲染的圆角大小渲染
  * 圆角等比例特性，就是水平半径和垂直半径的比例是恒定不变的。

---

box-shadow
    * x-shadow	必需。水平阴影的位置。允许负值
    	 y-shadow	必需。垂直阴影的位置。允许负值。
    	 blur	    可选。模糊距离。
    	 spread	可选。阴影的尺寸。
    	 color	    可选。阴影的颜色。
    	 inset	    可选。将外部阴影 (outset) 改为内部阴影。

text-shadow
    * x-shadow	必需。水平阴影的位置。允许负值。
    	 y-shadow	必需。垂直阴影的位置。允许负值。
    	 blur	可选。模糊的距离。	测试
    	 color	可选。阴影的颜色。
    * 注意
        * 可以写多个，如

            ```
            text-shadow:1px 1px 0 red,1px -1px 0 green;
            ```
---

border-image
    1. border-image-source	用在边框的图片的路径。
    1. border-image-slice	图片边框向内偏移。
    1. border-image-width	图片边框的宽度。
    1. border-image-outset	边框图像区域超出边框的量。
    1. border-image-repeat	图像边框是否应平铺(repeated)、铺满(rounded)或拉伸(stretched)。

## 背景

background
    * background-color

    * background-image

    * background-repeat
        * repeat-x
        * repeat-y
        * repeat(Default)
        * no-repeat
        * round：???背景图像自动缩放直到适应且填充满整个容器。（CSS3）
        * space：???背景图像以相同的间距平铺且填充满整个容器或某个方向。（CSS3）

    * background-attachment
        * fixed
        * scroll
        * local：???背景图像相对于元素内容固定，也就是说当元素随元素滚动时背景图像也会跟着滚动，因为背景图像总是要跟着内容。

    * background-position
        * percentage：用百分比指定背景图像填充的位置。可以为负值。
        * length：用长度值指定背景图像填充的位置。可以为负值。雪碧图sprite
        * center：背景图像横向和纵向居中。
        * left：背景图像在横向上填充从左边开始。
        * right：背景图像在横向上填充从右边开始。
        * top：背景图像在纵向上填充从顶部开始。
        * bottom：背景图像在纵向上填充从底部开始

    * background-origin(3)
        * padding-box	背景图像相对于内边距框来定位。
        	 border-box	背景图像相对于边框盒来定位。
        	 content-box	背景图像相对于内容框来定位。

    * background-clip:规定背景的绘制区域(3)
        * border-box	背景被裁剪到边框盒。(default)
        	 padding-box	背景被裁剪到内边距框。
        	 content-box	背景被裁剪到内容框。

    * background-size(3)
        1. length  设置背景图像的高度和宽度。
            * 第一个值设置宽度，第二个值设置高度。
            * 如果只设置一个值，则第二个值会被设置为 "auto"。
            * 如果两个都设置成具体值，背景图像可能会变形
        1. percentage  
            * 以父元素的百分比来设置背景图像的宽度和高度。
            * 第一个值设置宽度，第二个值设置高度。
            * 如果只设置一个值，则第二个值会被设置为 "auto"。
            * 如果两个都设置成具体值，背景图像可能会变形
        1. cover   
            * 把背景图像扩展至足够大，以使背景图像完全覆盖背景区域。
            * **背景图像的某些部分也许无法显示在背景定位区域中。**
            * 保持图像纵横比
        1. contain 把图像图像扩展至最大尺寸，以使其宽度和高度完全适应内容区域。
            * 可能会repeat
            * 保持图像纵横比


        ```
        length	
            设置背景图像的高度和宽度。
            第一个值设置宽度，第二个值设置高度。
            如果只设置一个值，则第二个值会被设置为 "auto"。
    
        percentage	
            以父元素的百分比来设置背景图像的宽度和高度。
            第一个值设置宽度，第二个值设置高度。
            如果只设置一个值，则第二个值会被设置为 "auto"。
    
        cover	
            把背景图像扩展至足够大，以使背景图像完全覆盖背景区域。
            背景图像的某些部分也许无法显示在背景定位区域中。
    
        contain	
            把图像图像扩展至最大尺寸，以使其宽度和高度完全适应内容区域。
        ```

## 颜色

color
opacity
    * 不透明度。值被约束在[0.0-1.0]范围内，如果超过了这个范围，其计算结果将截取到与之最相近的值。
    * 全部的颜色,包括文字的和背景色的，不同于background:#ff0000aa

## 字体

font
    * font-style
        * normal：指定文本字体样式为正常的字体
        * italic：指定文本字体样式为斜体。对于没有设计斜体的特殊字体，如果要使用斜体外观将应用oblique
        * oblique：指定文本字体样式为倾斜的字体。人为的使文字倾斜，而不是去选取字体中的斜体字

    * font-variant
        * normal：正常的字体
        * small-caps：小型的大写字母字体

    * font-weight: normal \| bold \| bolder \| lighter \| &lt;integer&gt;

    * font-size: &lt;absolute-size&gt; \| &lt;relative-size&gt; \| &lt;length&gt; \| &lt;percentage&gt;
        默认16px
        * &lt;absolute-size&gt; = xx-small \| x-small \| small \| medium \| large \| x-large \| xx-large
        * &lt;relative-size&gt; = smaller \| larger
        * 是 字的 高度

    * font-family
        以逗号隔开。如果字体名称包含空格或中文，则应使用引号括起

    * 英文四条线
        1. top
        1. middle
        1. base
        1. bottom

## 文本

text-transform
    none	默认。定义带有小写字母和大写字母的标准的文本。
    	 capitalize	文本中的每个单词以大写字母开头。
    	 uppercase	定义仅有大写字母。
    	 lowercase	定义无大写字母，仅有小写字母。
    	 inherit	规定应该从父元素继承 text-transform 属性的值。

tab-size
    * &lt;integer&gt;：用整数值指定制表符的长度。不允许负值。
    * &lt;length&gt;：用长度值指定制表符的长度。不允许负值。

---

text-overflow
    * clip	修剪文本。(截取)
    	 ellipsis	显示省略符号来代表被修剪的文本。

white-space:规定段落中的文本不进行换行

    * 用来处理 空白符 和 换行

      | ---------- |   换行符     | 空格和制表符 | 文字转行 |
      | ---------- | ------------ | ------------ | -------- |
      | `normal`   | 合并         | 合并         | 转行     |
      | `nowrap`   | 合并         | 合并         | 不转行   |
      | `pre`      | 保留         | 保留         | 不转行   |
      | `pre-wrap` | 保留         | 保留         | 转行     |
      | `pre-line` | 保留         | 合并         | 转行     |

word-break
    * normal	使用浏览器默认的换行规则。(CJK的一个字符是一个letter,也是一个单词，换行的话把CJK当成单词了，默认可以换行)
    	 keep-all	不允许CJK文本中的单词换行，只能在‘半角空格’或‘连字符’处换行。针对CJK文本
    	 break-all	允许非CJK文本间的单词内换行。针对西方文本
    * break-world 非官方的

word-wrap(overflow-wrap):允许长单词换行到下一行
    * normal：允许内容顶开或溢出指定的容器边界。
    * break-word：内容将在边界内换行。如果需要，单词内部允许断行。

overflow-wrap

注意
    * CSS3中将 &lt;word-wrap&gt; 改名为 &lt;overflow-wrap&gt;；由于历史原因，当你使用 &lt; overflow-wrap &gt; 时，最好同时使用 &lt; word-wrap &gt; 作为备选，作向前兼容。
    * 当 word-break:keep-all 和 word-wrap:break-world 同时存在且冲突时，word-wrap:break-world 生效
    * white-space:nowrap 和 word-wrap:break-word 冲突时，white-space:nowrap生效
    * overflow text-overflow white-space word-break word-wrap(overflow-wrap)

---

text-align
    * left	    把文本排列到左边。默认值：由浏览器决定。
    	 right	    把文本排列到右边。
    	 center	把文本排列到中间。
    	 justify	实现两端对齐文本效果。
    	 inherit	规定应该从父元素继承 text-align 属性的值。
    * start     内容对齐开始边界。（CSS3）
    * end       内容对齐结束边界。（CSS3）
    * text-align只控制行内内容(文字、行内元素、行内块级元素)如何相对他的块父元素对齐
    * 用于父标签

text-align-last:设置或检索一个块内的最后一行（包括块内仅有一行文本的情况，这时既是第一行也是最后一行）或者被强制打断的行的对齐方式

word-spacing
    * normal：默认间隔
    * length：用长度值指定间隔。可以为负值。
    * percentage：用百分比指定间隔。可以为负值。（CSS3）

letter-spacing
    * normal：默认间隔
    * length：用长度值指定间隔。可以为负值。
    * percentage：用百分比指定间隔。可以为负值。（CSS3）

text-indent:文本块中首行文本的缩进
    * length：用长度值指定文本的缩进。可以为负值。
    * percentage：用百分比指定文本的缩进。可以为负值。
    * each-line：定义缩进作用在块容器的第一行或者内部的每个强制换行的首行，软换行不受影响。（CSS3）
    * hanging：反向所有被缩进作用的行。（CSS3）
    * hanging和each-line关键字紧随在缩进数值之后

        ```
        div{text-indent:2em each-line;}
        以上代码将使得div内部的第一行及每个强制换行的首行都拥有2em的缩进
        ```

vertical-align
    * 设置元素的垂直对齐方式, **不应该放在父元素上，而是放在目标元素上**
    * baseline：将支持valign特性的对象的内容与基线对齐
    * sub：垂直对齐文本的下标
    * super：垂直对齐文本的上标
    * top：将支持valign特性的对象的内容与对象顶端对齐
    * text-top：将支持valign特性的对象的文本与对象顶端对齐
    * middle：将支持valign特性的对象的内容与对象中部对齐
        * vertical-align:middle属性的表现与否，仅仅与其父标签有关，至于我们通常看到的与后面的文字垂直居中显示那都是假象！
    * bottom：将支持valign特性的对象的文本与对象底端对齐
    * text-bottom：将支持valign特性的对象的文本与对象顶端对齐
    * percentage：用百分比指定由基线算起的偏移量。可以为负值。基线对于百分数来说就是0%。
        * vertical-align的百分比值不是相对于字体大小或者其他什么属性计算的，而是相对于line-height计算的
    * length：用长度值指定由基线算起的偏移量。可以为负值。基线对于数值来说为0。（CSS2）

    * **将行框内的内联元素统一一条线对齐(内联元素都有4条线，顶中基底)**
    * **一般放在比较特别的元素上，比如 img**

line-height

text-size-adjust

## 文本装饰

text-decoration
    * text-decoration-line
        * none：指定文字无装饰
        * underline：指定文字的装饰是下划线
        * overline：指定文字的装饰是上划线
        * line-through：指定文字的装饰是贯穿线
        * blink：指定文字的装饰是闪烁。
    * text-decoration-color
    * text-decoration-style
        * solid：实线
        * double：双线
        * dotted：点状线条
        * dashed：虚线
        * wavy：波浪线
    * text-decoration-skip
    * text-underline-position
        * auto：用户代理可能会使用任意算法确定下划线的位置。
        * under：下划线的定位与元素内容盒子的下边缘相关
        * left：下划线的定位与元素内容盒子的左边缘相关
        * right：下划线的定位与元素内容盒子的右边缘相关

## 书写模式

direction
    * ltr：文本流从左到右。
    * rtl：文本流从右到左。
unicode-bidi
writing-mode

## 列表

list-style
    * list-style-image
    * list-style-position
        * outside：列表项目标记放置在文本以外，且环绕文本不根据标记对齐
        * inside：列表项目标记放置在文本以内，且环绕文本根据标记对齐
    * list-style-type
        * disc：实心圆(CSS1)
        * circle：空心圆(CSS1)
        * square：实心方块(CSS1)
        * decimal：阿拉伯数字(CSS1)
        * lower-roman：小写罗马数字(CSS1)
        * upper-roman：大写罗马数字(CSS1)
        * lower-alpha：小写英文字母(CSS1)
        * upper-alpha：大写英文字母(CSS1)
        * none：不使用项目符号(CSS1)

## 表格

table-layout
border-collapse
border-spacing
caption-side
empty-cells

## 内容

content:content 属性与 :before 及 :after 伪元素配合使用，来插入生成内容。
    * content-increment
    * counter-reset
    * quotes

## 用户界面

appearance

outline:outline （轮廓）是绘制于元素周围的一条线，位于边框边缘的外围，可起到突出元素的作用,轮廓线不会占据空间，也不一定是矩形。
    * outline-width
    * outline-style
    * outline-color
    * outline-offset:outline-offset是以border边界作为参考点的，从0开始，正值从border边界往外延，负值从border边界往里缩
    * 一般用于表单元素，如 input

cursor:规定要显示的光标的类型（形状）
    pointer
    help   
    
   

zoom:设置或检索对象的缩放比例。

box-sizing
    * content-box
    * border-box

## 替换元素
1. object-fit
    1. fill
        * 被替换的内容大小可以填充元素的内容框。 整个对象将完全填充此框。 如果对象的高宽比不匹配其框的宽高比，那么该对象将被拉伸以适应。
    1. contain
        * 被替换的内容将被缩放，以在填充元素的内容框时保持其宽高比。 整个对象在填充盒子的同时保留其长宽比，因此如果宽高比与框的宽高比不匹配，该对象将被添加“黑边”。
    1. cover
        * 被替换的内容大小保持其宽高比，同时填充元素的整个内容框。 如果对象的宽高比与盒子的宽高比不匹配，该对象将被剪裁以适应。
    1. none
        * 被替换的内容尺寸不会被改变。
    1. scale-down
        * 内容的尺寸就像是指定了none或contain，取决于哪一个将导致更小的对象尺寸。


## 动画 Animation

### Transition 过渡

transition
    * transition-property:检索或设置对象中的参与过渡的属性
        * none：不指定过渡的css属性
        * all：所有可以进行过渡的css属性
        * IDENT：指定要进行过渡的css属性
    * transition-duration
    * transition-timing-function
        * linear：线性过渡。等同于贝塞尔曲线(0.0, 0.0, 1.0, 1.0)
        * ease：平滑过渡。等同于贝塞尔曲线(0.25, 0.1, 0.25, 1.0)
        * ease-in：由慢到快。等同于贝塞尔曲线(0.42, 0, 1.0, 1.0)
        * ease-out：由快到慢。等同于贝塞尔曲线(0, 0, 0.58, 1.0)
        * ease-in-out：由慢到快再到慢。等同于贝塞尔曲线(0.42, 0, 0.58, 1.0)
        * step-start：等同于 steps(1, start)
        * step-end：等同于 steps(1, end)
        * steps(integer[, [ start \| end ] ]?)：接受两个参数的步进函数。第一个参数必须为正整数，指定函数的步数。第二个参数取值可以是start或end，指定每一步的值发生变化的时间点。第二个参数是可选的，默认值为end。
        * cubic-bezier(<number>, <number>, <number>, <number>)：特定的贝塞尔曲线类型，4个数值需在[0, 1]区间内

    * transition-delay

    * 实例

    ```
    简写 -> transition:property duration timing-function delay;
    .one{
        width: 100px;
        height: 100px;
        background:#00ff00cc;
        transition-porperty:width;
        transition-duration:1s;
        transition-timing-function:linear;
        transition-delay:0;
    }
    .one:hover{
        width: 200px;
        height: 100px;
        background:#00ff00cc;
        transition:width 1s linear;
     }

    <div class="one"></div>
    ```

### Transform 变形2D
transform
    * rotate 旋转
        * rotateX()
        * rotateY()
        * rotateZ()
        * 注意

            ```
            transform:rotate(10deg);
            ```

    * skew 倾斜
        * skewX()
        * skewY()
        * skewZ()
        * 或者 skew(x,y);
        * 注意
            * x' = x + y tanθ
            * y' = y + x tanθ
            * 数学坐标系    

    * scale
        * scaleX()
        * scaleY()
        * scale(both)

        * scale(x,y)
        * scaleZ()
            * scaleZ 单独使用看不到效果，配合其他 transform 动作即可看出来
                ```
                transform:scaleZ(10) rotateY(45deg);
                ```

    * translate 位移
        * translateX()
        * translateY()
        * translateZ()
        * 修改 transform-origin 无实际意义

属性
    1. transform-origin:设置对象中的变换所参照的原点
        * x-axis
            * 定义视图被置于 X 轴的何处
            * left/center/right/length/%
        * y-axis
            * 定义视图被置于 y 轴的何处
            * top/center/bottom/length/%
        * z-axis
            * 定义视图被置于 z 轴的何处
            * length

        ```
        transform-origin:left top;
        ```

    1. transform-style:
        * flat：指定子元素位于此元素所在平面内
        * preserve-3d：指定子元素定位在三维空间内
        * 注意
            * ???该属性必须与 transform 属性一同使用
            * **写在变形元素的父标签上**

    1. perspective(透视):指定观察者与「z=0」平面的距离
        * none：不指定透视
        * length：指定观察者距离「z=0」平面的距离，为元素及其内容应用透视变换。不允许负值
        * **一般写在祖先标签上 或 父标签上**

        ```
        两种
        1. 写在祖先标签上 或 父标签上
        perspective:2000px;

        2. **写在本身上**
        transform:perspective(2000px);

        * 不同点
            1. 父元素下面有很多变换的元素时，各不相同
            1. 都相同
        ```

    1. perspective-origin:指定观察者在哪个位置进行观看（x轴，y轴)
        * left、center、right、length和%
        * top、center、bottom、length和%

    1. backface-visibility:指定元素背面面向用户时是否可见
        * visible：指定元素背面可见，允许显示正面的镜像。
        * hidden：指定元素背面不可见


        ```
        1. rotate
        .one{
            margin:200px;
            width: 100px;
            height: 100px;
            background:#00ff00cc;
        }
        .one:hover{
            transform:rotateZ(45deg);
            transition:all 1s;
        }

        2. skew
        .one{
            margin:200px;
            width: 100px;
            height: 100px;
            background:#00ff00cc;
        }
        .one:hover{
            transform:skew(15deg,15deg);
            transition:all 1s;
        }

        3. 综合
        transform:skew(15deg) scale(2);
        ```

    
### Animation
animation-name
animation-duration:动画执行时间
animation-timing-function

    <a href="https://www.cnblogs.com/aaronjs/p/4642015.html">详细内容参考</a>

    <a href="https://designmodo.com/steps-css-animations/" title="参考内容">参考内容2</a>

    * steps(n,start/end)  
        * 帧动画效果
        * 第一个参数指定了时间函数中的间隔数量（必须是正整数），是 @keyframes [动画名] 中的两帧之间插入帧的数量
        * 第二个参数可选，接受 start 和 end 两个值，指定在每个间隔的起点或是终点发生阶跃变化，默认为 end。
            * step-start在变化过程中，都是以下一帧的显示效果来填充间隔动画，即不显示第一帧（系统重新整理的帧）
            * step-end与上面相反，都是以上一帧的显示效果来填充间隔动画，即不显示最后一帧（系统重新整理的帧）
            * 例如 
                * 秒针，如果设置为 animation-timing-function:steps(6,start),@keyframes SECONDS(0{} 100%{}),第一帧位置是6秒，而不是0秒
                * 如果设置为steps(6,end),第一帧位置是0秒。这是默认设置，也更符合常理。
        * steps(<number\_of\_steps>, <direction>)

        * The second parameter defines the point at which the action declared in our @keyframes will occur. This value is optional and will default to “end” if left unspecified.  A direction of “start” denotes a left-continuous function and our animation’s first step will be completed as soon as the animation begins. It will jump immediately to the end of the first step and stay there until the end of this step duration.

        * A direction of “end” denotes([dɪˈnəʊt] 代表，指代，意思是) a right-continuous function and directs the movement to stay put until the duration of the first step is completed. Each option essentially moves the element from a different side and will produce different positioning for the same animation.
        * Here’s a visual:

        <img src="http://www.刘蛟.中国/resources/CSS-Cheat-Sheet/stepsvisual.webp">

animation-delay:动画延迟

animation-iteration-count
    * infinite
    * n

animation-direction
    * normal：正常方向
    * reverse：反方向运行
    * alternate：动画先正常运行再反方向运行，并持续交替运行
    * alternate-reverse：动画先反运行再正方向运行，并持续交替运行


animation:name duration timing-function delay count direction


**animation-play-state**
    * running
    * paused

**animation-fill-mode:动画结束后的状态**
    1. none
        * none为默认值，在动画执行前和动画执行后，对元素的样式不会产生影响。 
        * 动画执行前和执行后的状态和无动画的状态是一致的，动画执行前和执行后对元素没有产生任何样式影响。动画执行后跳到无动画状态。

    1. forwards当使用这个值时，告诉浏览器：动画结束后，元素的样式将设置为动画的最后一帧的样式。 
        * 值为forwards时，动画执行前的状态和无动画状态一致，但是动画执行后状态却不一样，查看动画效果，你会发现他的状态和动画最后一帧的状态相同。

    1. backwards当使用这个值时，告诉浏览器：动画开始前，元素的样式将设置为动画的第一帧的样式。 
        * 值为backwards时，动画执行前的状态和无动画状态 不一致，可以看出，它的状态和动画第一帧相同，但是动画执行后状态却和无动画时的状态相同。

    1. both
        * 当使用这个值时，告诉浏览器：同时使用forwards和backwards两个属性值的效果。 
        * 动画执行前是动画第一帧的效果，动画执行后是动画最后一帧的效果。

    1. 最后animation-fill-mode的状态和animation-direction的值有关。 
        * 当animation-direction为normal 或 alternate时，和上面的状态相同。 
        * 当animation-direction为alternate-reverse 或reverse 时，状态刚好和上面相反。从100%到0%执行。


    ```
    @keyframes [name]{
        0%{
            transform:translate(200px,200px);
        }
        50%{
            transform:translate(400px,400px);
        }
        100%{
            transform:translate(200px,200px);
        }
    }
    @keyframes{
        from
        to
    }

    animation-name:move;
    animation-duration:1s;
    animation-iteration-count:infinite
    animation-direction:alternative-reverse;
    ```

### 一般步骤

```
父元素：
transform-style:perserve-3d;

transform-origin:

perspective:景深;//或者在子元素上设置 transform:perspective(length)    

```

CSS 3 动画案例

<p data-height="366" data-theme-id="dark" data-slug-hash="XqzrBv" data-default-tab="css,result" data-user="billscofield" data-embed-version="2" data-pen-title="CSS3 旋转立方体" data-preview="true" class="codepen">See the Pen <a href="https://codepen.io/billscofield/pen/XqzrBv/">CSS3 旋转立方体</a> by billscofield (<a href="https://codepen.io/billscofield">@billscofield</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>


## 选择器

层叠的原则
    * 特殊性(specificity)
        * 指定选择器的具体程度
    * 顺序(order)
    * 重要性(importance)
        * !important;

1. ID
    * \#id-name{}

1. Class
    * .class-name{}

1. 属性
    * E[att]	        CSS2	选择具有att属性的E元素。
    	 E[att="val"]	    CSS2	选择具有att属性且属性值等于val的E元素。
    	 E[att~="val"]	    CSS2	选择具有att属性，且属性值为一个用空格分隔的字词列表，其中一个等于val 的E元素。
    	 E[att^="val"]	    CSS3	选择具有att属性，且属性值为以val开头的字符串的E元素。
    	 E[att$="val"]	    CSS3	选择具有att属性，且属性值为以val结尾的字符串的E元素。
    	 E[att\*="val"]	CSS3	选择具有att属性，且属性值为 包含val的字符串的E元素。
    	 E[att\|="val"]	    CSS2	选择具有att属性，且属性值为 以val开头并用连接符"-"分隔的字符串的E元素，如果属性值仅为val，也将被选择。

1. 伪类选择器
    * E:link
    * E:visited
    * E:hover
    * E:active
    * E:focus
    * E:not(s):匹配不含有s选择符的元素E。

    ``` 
    li:not(:last-child) {
        border-bottom: 1px solid #ddd;
    }
     给该列表中除最后一项外的所有列表项加一条底边线
     
    p:not(.first-graph){
    }
    ```

    * E:first-child
        * 匹配父元素的第一个子元素E。**E必须是它的兄弟元素中的第一个元素**
        * E的父元素最高是body，即E可以是body的子元素
    * E:last-child
    * E:only-child
    * E:nth-child(n)
    * E:nth-last-child(n)
    * E:first-of-type
        * 匹配同类型中的 第一个同级兄弟元素E。
        * E的父元素最高是html，即E可以是html的子元素

    * E:last-of-type
    * E:only-of-type
    * E:nth-of-type(n)
    * E:nth-last-of-type(n)
    * E:empty:匹配没有任何子元素（包括text节点）的元素E
    * E:checked
    * E:enabled:匹配用户界面上处于可用状态的元素E。
    * E:disabled

1. 标签
    * E{}

1. 伪元素
    * E::first-letter
    * E::first-line
    * E::before
    * E::after
        * 清除浮动
        * 伪元素是 行级元素
    * E::placeholder
    * E::selection

1. 通配符:\*

1. 父子选择器
    * f s{}
    * 空格分隔

1. 直接子元素选择器
    * div &gt;ul &gt;li{}

1. 并列选择器
    * a.class-name{} 

1. 分组选择器
     * ","分隔 

1. 相邻选择符(E+F):选择紧贴在E元素之后的那"一个" F 元素

     * 只选择一个,不论 E 后面有几个连续的 F 

1. 兄弟选择符(E~F):选择E元素后面的所有兄弟元素F
     * 不论相邻与否，只要和 E 同级，F 同类

### 选择器权重

|选择器|权重|
|:-:|:-|
|!important|Infinity|
|行间|1.0.0.0|
|ID|0.1.0.0|
|class、属性、伪类| 0.0.1.0|
|标签选择器|0.0.0.1|
|通配符|0.0.0.0|

注意
    1. !important 要写在每一个属性的后边。


### 视觉格式化模型
FC
    * 页面中的一块区域，并且有一套渲染规则，它决定了其子元素将如何定位，以及和其他元素的关系以及相互作用。

box:CSS 布局基本单位
    1. Block Formatting Context(BFC)
        * absolute
        * inline-block
        * float
        * overflow:hidden
        * 思考
            * absolute 和 float 在user agent处都是inline-block,这是浏览器厂商的原因，而absolute float 成为BFC是CSS协会的原因。但是也可能和浏览器厂商有关系???
    1. Inline Formatting Context

    1. GFC

    1. FFC
收缩
    absolute
    inline-block
    float
    table

## 单位
* <a href='http://pxtoem.com/'>PXtoEM</a>
* px
    * px 是直接设置像素大小
* em
    * em 是相对于父级元素的字体大小
* %
* rem
    * rem 是相对于根元素的字体大小
* vh
* vw
* vm


### 具体实例
1. 单行文本溢出

```
div.one{
    width:100px;
    border:1px solid green;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
div.one:hover{
    text-overflow:visible;
}
```

1. 水平垂直居中

```
div{
    position:absolute;
    top:50%;
    left:50%;
    margin-left:一半;
    margin-top:一半;
}
```


## 清除浮动
有疑问???为什么table可以清除，而block不可以。table是很远古的东西,

```
.clearfix::before{
    content:'';
    display:table;
}

上面的css可以预防margin-top塌陷(而block却是不可以的)
.one{width:200px;height:200px;}
.two{width:100px;height:100px;  margin-top:100px;}

div.one>div.two
```









## 张鑫旭

border-width:
    thin:1px
    medium:3px default
    thick:5px
    上述值大小为 Firefox 中的设定
