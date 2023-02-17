# linux 语言

## ubuntu 设置系统使用语言

查看当前系统使用的字符编码
    locale

查看当前系统支持的字符集
    locale -a

查看locale文件
    cat /etc/default/locale

### 更改字体

1. 执行locale-gen zh_CN.UTF-8拉取中文编码(需要root权限)
    locale-gen zh_CN.UTF-8

2. 查看现在系统支持的字符集，发现多了 zh 等中文字符集　
    locale -a

3. 修改文件/etc/default/locale
    LANG="zh_CN"
    LANGUAGE="zh_CN.UTF-8"

4. sudo dpkg-reconfigure locales

接下来重新打开会话就能正常使用中文了，不用重启系统。

文泉驿微米黑（wqy-microhei）
