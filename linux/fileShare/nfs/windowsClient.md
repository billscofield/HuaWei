
## windows挂载nfs的中文乱码问题的解决

使用windows内置nfs挂载工具挂载nfs共享盘，会出现中文文件名称的乱码。linux 系统正
常显示.

原因是windows内置的nfs挂载工具所支持的文字编码太有限了，不支持utf-8

解决方案

主要有三种方案

1. 换解决方案，使用smb 共享，这等于不是解决方法。

2. 使用第三方nfs 客户端，比如 ms-nfs41-client 软件。

3. windows 官方给了一个beta版本的解决方案


```
mount --help

-o lang = euc-jp | euc-tw | euc-kr | shift-jis | big5 | ksc5601 | gb2312-80 | asni
```

只能支持的文字编码：euc-jp|euc-tw|euc-kr|shift-jis|big5|ksc5601|gb2312-80|ansi


### 1. 可以通过ms-nfs41-client 工具进行挂载

比如把192.168.154.10的photo共享文件夹挂载到本机的Z盘，就可以使用以下命令：

```
nfs_mount Z: 192.168.154.10:/photo
```


### 2. beta 选项

运行 intl.cpl

管理 / 更改系统区域设置 / Beta版: 使用 Unicode UTF-8 提供全球语言支持



## open ssh server

所有设置 / 应用 / 可选功能 / 添加功能 / ssh server
