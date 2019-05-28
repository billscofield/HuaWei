
可以在没有安装Python解释器的机器上运行了

## 安装
要在Windows上运行
pip install pyinstaller

## 使用
pyinstaller hello.py

## 选项
-D, --onedir   打包成一个文件夹，Default
-F, --onefile  打包成一个exe文件
-p DIR, --paths DIR     添加路径，一般用来添加程序所用到的包的所在位置
-c, --console, --nowindowed     无视窗，程序后台运行
-w, --windowed, --noconsole     提供程序视窗，程序没有命令行输出，Default
-i <file.ico or file.exe>, --icon <file.ico or file.exe>


