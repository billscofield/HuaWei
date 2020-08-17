
rich set of graph drawing tools

## 

apt install graphviz

graph 表示的是这幅图是 无向图

digraph 表示有向图

图片的描述，是在 {} 里进行，并且也支持注释，注释风格与 C 语言类似，// 用于单行注释， /**/ 用于多行注释。

graphviz包含3中元素

    1. 图 graph
        
        其中graph 又包括有向图（directed graph） digraph 和 无向图graph

    1. 节点 node

    1. 边 edge(那些节点之间连接的线条)

    在图内，{} 大括号中定义的内容（节点和边）叫做 subgraph

    当ID（Name/名称）含有关键字或空白字符时要使用双引号括起来

    结尾的分号 ; 可要可不要


```
无向图

graph{          //没有定义图
    a -- b      //可以没有分号
    b -- d      //没有定义边
    c -- d
}


如果有线条的指向，可以不用先声明点

graph{
    a
    b
    a--b
}


有向图

digraph{
    a -> b;     //可以没有分号
    b -> d;
    c -> d;
}


graph pic1 {    //图的名字叫 pic1
    a -- b
    a -- b
    b -- a [color=blue]     
} 

```



## 主要的键值对

### label 显示的文字信息

label="流程图"

start[label="启动游戏"]

### rankdir

rankdir=LR|RL|BT requests a left‐to‐right, right‐to‐left, or bottom‐to‐top, drawing.

首尾的方向




### shapes

http://www.graphviz.org/doc/info/shapes.html (通过man dot 查到的，但是man手册中的那个地址失效了，百度的 graphviz.org/content/shapes)


```
Node Shapes（节点形状）：https://graphviz.gitlab.io/_pages/doc/info/shapes.html
Arrow Shapes（箭头形状）：https://graphviz.gitlab.io/_pages/doc/info/arrows.html
```



常见的有

box         矩形
ellipse     椭圆
circle
point       点
triangle    三角形
diamond     菱形
square      正方形
start       五角星
note        一张纸(右上角有折角)



### style    连接线 和 节点的边

style=filled solid dashed dotted bold invis




## 输出格式

dot -Tpng -o a.png 源文件

-Tdot (Dot format containing layout infomation),
-Txdot (Dot format containing complete layout infomation),
-Tps (PostScript),
-Tpdf (PDF),
-Tsvg -Tsvgz (Structured Vector Graphics),
-Tfig (XFIG graphics),
-Tpng (png bitmap graphics),
-Tgif (gif bitmap graphics),
-Tjpg -Tjpeg (jpeg bitmap graphics),
-Tjson (xdot information encoded in JSON),
-Timap (imagemap files for httpd servers for each node or edge that has a non‐null href attribute.),
-Tcmapx (client‐side imagemap for use in html and xhtml).
    Additional less common or more special‐purpose output formats can be found at 
    http://www.graphviz.org/content/output-formats.

