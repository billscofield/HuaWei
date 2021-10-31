links:

    https://blog.csdn.net/feimeng116/article/details/105837483      正常安装




pycharm 历史版本下载

    https://www.jetbrains.com/pycharm/download/other.html


rm -rf .cache/JetBrains/
rm -rf .config/JetBrains/


active软件和使用说明在坚果云文件夹




### 自行建立桌面快捷方式

```
cat /usr/share/applications/jetbrains-pycharm.desktop 
[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm Professional Edition
Icon=/opt/pycharm/pycharm-2020.1/bin/pycharm.svg
Exec="/opt/pycharm/pycharm-2020.1/bin/pycharm.sh" %f
Comment=Python IDE for Professional Developers
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-pycharm
```
