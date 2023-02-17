# bootstrap

## 栅格系统

### 布局容器

1. container

    <div class="container">
      ...
    </div>

2. container-fluid 类用于 100% 宽度，占据全部视口（viewport）的容器

    <div class="container-fluid">
      ...
    </div>

row
    xs < 768px
    sm < 992px
    md < 1200px
    lg >= 1200px

    col-md-1

嵌套列

列偏移

    col-md-offset-*

列排序
    改变列的方向，就是改变左右浮动

    右: col-md-push-2
    左: col-md-pull-


## 排版

### 标题

h1 h6

还提供了 .h1 到 .h6 类，为的是给内联（inline）属性的文本赋予标题的样式。

在标题内还可以包含 <small> 标签或赋予 .small 类的元素，可以用来标记副标题。

### 段落

p

通过添加 .lead 类可以让段落突出显示

使用 <small> 标签包裹，其内的文本将被设置为父容器字体大小的 85%。标题元素中嵌套的 <small> 元素被设置不同的 font-size 。

你还可以为行内元素赋予 .small 类以代替任何 <small> 元素。

对齐
    通过文本对齐类，可以简单方便的将文字重新对齐

    <p class="text-left">Left aligned text.</p>
    <p class="text-center">Center aligned text.</p>
    <p class="text-right">Right aligned text.</p>
    <p class="text-justify">Justified text.</p>
    <p class="text-nowrap">No wrap text.</p>

改变大小写
    通过这几个类可以改变文本的大小写。

### 辅助类

text-muted
text-primary
text-success
text-info
text-warning
text-danger






```
orem3      单个单词
lorem*3 3   3个 div
```

ms-auto

    margin start = margin left
    end 就是 right


d-flex
    display flex


my-4
    y 纵轴
    margin top 和 margin-bottom 

p-5
    paddin


w-50
    width


底层样式
组件


输入框和按钮的组合   input group


g-4
    gap
