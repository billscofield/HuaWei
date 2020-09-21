
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


