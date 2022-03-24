
## Obsidian in Linux

.AppImage 文件

vault n. （银行）保险库，金库

palette [ˈpælət] n. 调色板；（画家或一幅画所用的）一组颜色；（计算机程序中的）选项板


ctrl 单击文件是在工作区新打开一个窗口展示点击的文件

---

在一个文件中选择文本，然后可以拖动到第二个文件中，以进行复制

同一个文件中是移动选中的文本到新的位置

---

三个小圆点/link with pane... 与其他面板同步

点击 链条 即可解除同步

---

## 链接

[[另一个文件]]          编辑模式下，ctrl + 鼠标悬浮 可以进行预览

如果这个文件不存在, 退出 vim 编辑模式后，lms(鼠标左键单击)会自动创建该文件并进入该文件

backlinks
    哪些文件链接了当前文件, 会在右边栏显示出来
    入链: 从哪些文件的链接进入到当前文件

outgoing links(默认关闭的，插件里边找)
    出链: 从当前文件可以链接到哪些文件


右侧栏:
    Linked mentions
        有一个笔记提到你了，而且链接到了你

    Unlinked mentions
        那些没有链接的文件，但是内容中提到了当前文件名的
        有一个笔记提到你了，但是没有链接到你
        此时可以点击 link 进行关联，那么这个时候提到当前文件名的那篇文章中的文件名就会变成一个指向当前文件的超链接


链接到
    1. 笔记 [[Linus Torvalds]]
    2. 标题 [[Linux Torvalds#]]             // to link heading
    3. 文本块 [[Linux Torvalds^]]           // to link block

    |: to change display text               // [[Linus Torvalds|李纳丝]]


    [[^^关键字]]                                  // 搜索所有出现关键字的文档块


## 粘贴

ctrl v: 带链接粘贴, 链接会转为 markdown 的格式

ctrl shift v: 只粘贴纯文本


文件和路径默认位置
File & Links
    Default location for new attachments

    ![[图片|一个数字代表宽度]]
    ![[图片|数字宽度*数字高度]]

PDF/音频/视频 也可以嵌入

## Plugins 插件

1. 工作区(workspaces) 插件

    左侧栏 / Manage Workspaces

2.  tag pane


3. Outline(大纲)

    display the outline of the current file or linked pane.

    一级标题/二级标题/...

4. Daily note
    
    Plugin Options
        ...

    日记模板位置

5. Templates
   
    模板文件夹路径

    整个文件的模板


6. 


## problems

how to stop cursor form blinking???


## 嵌入

![[文件名]]

指针


## 搜索

path:
file:
line:()

tag:
    标签

    > #tag-name   没有空格, 有点不方便, 如 Linus Torvalds

    plugin: tag pane


section:
    search keywords under same heading
    ![[keywords#]]          // 同一个标题下



## 语法

1. 高亮

    ==高亮文本==


## settings

### Editor

1. Readable line length(缩减栏宽)
    
    Limit maximum line length.

    很宽的时候还是在固定宽度的界面显示

2. Fold heading(折叠标题)
    
    将该标题下的文本折叠，类似 vim 的折叠

3. Fold indent(折叠缩进)

4. Show line number



## 命令

ctrl p      // 左侧的 open command palette
    insert current date


## 模板变量

{{date}}
{{time}}
{{title}}


## meta data

```
---
tags: tagname1 tagname2                 // meta data like
---

关闭 front-matter

这样导出就不显示 tags 了

```


## 帮助



