## 安装 git

## 安装 pyenv

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

然后配置环境变量
如果你使用 bash，就依次执行如下命令：
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc

最后，在使用 pyenv 之前，重新初始化 shell 环境，执行如下命令
exec $SHELL  或者  source ~/.bashrc


## 安装 pyenv virutalenv

pyenv 托管 python 版本，virtualenv 使用 python 版本

正常来说，pyenv-virtualenv插件是安装pyenv自带的，在pyenv的plugin目录里可以看到它,如果你的目录里没有，从github拉一份下来就好

把插件克隆在刚才已经安装完毕的 pyenv 的 plugins 文件夹中
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

然后配置环境变量
如果你使用 bash，就执行如下命令：
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

source ~/.bashrc

## 使用 pyenv
检查 pyenv 的版本
    pyenv version

查看 pyenv 已经托管了哪些 python 版本
    pyenv versions

安装 3.6.6 版本的 python
    pyenv install 3.6.6

    注意：在这之前安装依赖
    ```
    apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev
    ```

    加速
    ```
    下载需要的版本放到~/.pyenv/cache文件夹下面
    然后执行 pyenv install 版本号 安装对应的python版本
    v=3.7.3;wget http://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -P ~/.pyenv/cache/;pyenv install $v
    ```



## 更新 pyenv
由于我们是 git 克隆的，所以更新非常简单

cd ~/.pyenv 或者 cd $(pyenv root)
git pull

## 卸载 pyenv
由于 pyenv 把一切都放在 ~/.pyenv 下了，所以卸载很方便，两个步骤就行了

首先你需要删除环境变量

然后你需要执行：

rm -rf ~/.pyenv 或者 rm -rf $(pyenv root)


## 使用刚才安装的 python 3.6.6

1. 创建虚拟环境
 pyenv virtual env 3.6.6 liujiao-env-3.6.6

1. 激活虚拟环境
 pyenv activate liujiao-env-3.6.6

 查看当前环境下的 python 版本, pip 版本, pip 路径
    python --version
    pip --version

    ```
    pyenv local my-env
    你会发现已经被激活了，那么 local 命令和刚才有啥不同呢。如果你执行：
    ls -al
    你就会发现，在 ~/test 目录下，有个隐藏文件 .python-version，你可以看到这个文件里面，只写了一句话 my-env
    这样你只要进入 ~/test 目录，就会自动激活虚拟环境

    在虚拟环境下，你如果直接执行
    python
    就会进入到 python 的交互环境
    如果你写了一个文件，名字叫做 app.py ，里面的内容只有一句代码：print(1)
    然后执行：
    python app.py
    这时候，系统就会调用虚拟环境中的 python 解释器来执行这些代码了
    ```

pyenv virtualenvs 　　　　　　　 　　　　　　　 # 列出所有虚拟环境
pyenv activate your_env_name 　　 　　　　　　# 使用某虚拟环境
pyenv deactivate 　　　　　　　　　　　　　　　　# 退出虚拟环境，回到系统环境
pyenv uninstall your_env_name  　　 　　　　 # 卸载虚拟环境
