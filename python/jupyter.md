Jupyter Notebook（此前被称为 IPython notebook）是一个交互式笔记本，支持运行 40 多种编程语言。
Jupyter Notebook 的本质是一个 Web 应用程序，便于创建和共享文学化程序文档，支持实时代码，数学方程，可视化和 markdown。 用途包括：数据清理和转换，数值模拟，统计建模，机器学习等等

用户可以通过电子邮件，Dropbox，GitHub 和 Jupyter Notebook Viewer，将 Jupyter Notebook 分享给其他人。
在Jupyter Notebook 中，代码可以实时的生成图像，视频，LaTeX和JavaScript。

数据挖掘领域中最热门的比赛 Kaggle 里的资料都是Jupyter 格式

Shift+Enter : 运行本单元，选中下个单元
Ctrl+Enter : 运行本单元
Alt+Enter : 运行本单元，在其下插入新单元
Y：单元转入代码状态
M：单元转入markdown状态
A ：在上方插入新单元
B：在下方插入新单元
X：剪切选中的单元
Shift +V：在上方粘贴单元


## 安装
pip install jupyter

## 根据提示输入密码
jupyter notebook password

## 启动jupyter,默认端口是8888
nohup jupyter notebook --no-browser --ip=0.0.0.0  --port=10000 &> jupyter.log &

nohup 命令
    nohup is a POSIX command to ignore the HUP (hangup) signal. 
    The HUP signal is, by convention, the way a terminal warns dependent processes of logout. 
    Output that would normally go to the terminal goes to a file called nohup.out if it has not already been redirected.

jupyter notebook
同时，会在你开启 notebook 的文件夹中启动 Jupyter 主界面

https://www.cnblogs.com/nxld/p/6566380.html

