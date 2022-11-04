
## float

### 初衷: 文字环绕效果。最初的互联网啥都没有，弄好排版就不错了

```
<img src="pic.jpb" alt="">
<p>Lorem tempora porro sapiente nihil veniam Veritatis quod incidunt natus maiores ex Beatae illo in laudantium consequuntur eos, cumque Totam mollitia nihil inventore in perferendis Laborum accusamus fuga autem veniam?</p>
<p>Lorem tempora porro sapiente nihil veniam Veritatis quod incidunt natus maiores ex Beatae illo in laudantium consequuntur eos, cumque Totam mollitia nihil inventore in perferendis Laborum accusamus fuga autem veniam?</p>
<p>Lorem tempora porro sapiente nihil veniam Veritatis quod incidunt natus maiores ex Beatae illo in laudantium consequuntur eos, cumque Totam mollitia nihil inventore in perferendis Laborum accusamus fuga autem veniam?</p>


XXX
------
------

上面是图片一行，文字一行


<img src="pic.jpb" style="float:left;margin:0 10px 5px 0;">
<p>Lorem tempora porro sapiente nihil veniam Veritatis quod incidunt natus maiores ex Beatae illo in laudantium consequuntur eos, cumque Totam mollitia nihil inventore in perferendis Laborum accusamus fuga autem veniam?</p>
<p>Lorem tempora porro sapiente nihil veniam Veritatis quod incidunt natus maiores ex Beatae illo in laudantium consequuntur eos, cumque Totam mollitia nihil inventore in perferendis Laborum accusamus fuga autem veniam?</p>
<p>Lorem tempora porro sapiente nihil veniam Veritatis quod incidunt natus maiores ex Beatae illo in laudantium consequuntur eos, cumque Totam mollitia nihil inventore in perferendis Laborum accusamus fuga autem veniam?</p>


XXX ---
XXX ---
-------

上边这段代码就是文字环绕效果了
```


### 包裹与破坏

包裹: 
    1. 收缩，水平方向至最窄
    1. 高度: 
    1. 隔绝: BFC

具有包裹性的元素

    display: inline-block / table-cell

    position: aboulute / fixed / sticky

    overflow: hidden / scroll

破坏: 父元素高度塌陷

具有破坏性的元素
    
    display:none

    position: absolute / fixed / sticky



### strut

with a zero-width inline box with the elements's font and line height
properties

In case of an empty span (having display:inline ) the browser will generate 0
line box.

Same logic if you add an empty inline-block element. Even empty, an
inline-block will trigger the creation of a line box.


To use easy words, an inline-block element is still considered as an existing
element and we need to generate a line box to hold it.

An empty inline element will be considered by the browser as a non-existing
element so we don't need any line box to hold something that doesn't really
exist.

Line boxes are created as needed to hold inline-level content within an
**inline formatting context.**


Line boxes are created as needed to hold inline-level content within an inline formatting context.
Line boxes that contain

    1. no text,
    2. no preserved white space,
    3. and do not end with a preserved newline

    4. no inline elements with non-zero margins, padding, or borders,
    5. and no other in-flow content (such as images, inline blocks or inline tables),

must be treated as zero-height line boxes for the purposes of determining the
positions of any elements inside of them, and must be treated as not existing
for any other purpose .
