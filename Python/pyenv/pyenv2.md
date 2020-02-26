## 原理
pyenv 的工作原理，修改系统环境变量 PATH 

对于系统环境变量 PATH ，里面包含了一串由冒号分隔的路径，例如 /usr/local/bin:/usr/bin:/bin 。每当在系统中执行一个命令时，例如 python 或 pip ，操作系统就会在 PATH 的所有路径中从左至右依次寻找对应的命令。因为是依次寻找，因此排在左边的路径具有更高的优先级。

而 pyenv 做的，就是在 PATH 最前面插入一个 $(pyenv root)/shims 目录。这样， pyenv 就可以通过控制 shims 目录中的Python版本号，来灵活地切换至我们所需的Python版本。
    $(pyenv root)/shims:/usr/local/bin:/usr/bin:/bin

Through a process called rehashing, pyenv maintains shims in that directory to match every Python command across every installed version of Python—python, pip, and so on.




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

查看 pyenv 的版本
    pyenv --version

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
 pyenv virtualenv 3.6.6 liujiao-env-3.6.6

1. 激活虚拟环境
 pyenv activate liujiao-env-3.6.6
    可能会提示：
    ```
    pyenv-virtualenv: prompt changing will be removed from future release. configure export PYENV_VIRTUALENV_DISABLE_PROMPT=1' to simulate the behavior.``
    ```
    说的是 取消掉 在PS1 中的 python版本名称 前导符, 将来的版本中将会成为默认

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




## 删除虚拟环境 或 由 pyenv 下载的 python
### pyenv uninstall 3.7.0
    这个会首先提示 删除遍历到的每一个 由 3.7.0 派生的虚拟环境，最后会提示是否删除 3.7.0 这个python版本


### 手动删除 python 虚拟环境
.pyenv/versions

删除掉软连接 和 真实目录即可

```
➜  versions git:(master) pwd
/root/.pyenv/versions
➜  versions git:(master) tree -L 2
.
├── 3.6.9
│   ├── bin
│   ├── include
│   ├── lib
│   └── share
├── 3.7.3
│   ├── bin
│   ├── envs
│   ├── include
│   ├── lib
│   └── share
└── liujiao373 -> /root/.pyenv/versions/3.7.3/envs/liujiao373

```

