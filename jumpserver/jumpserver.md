首先安装pyenv这个工具：

```
git clone git://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
exec $SHELL -l
```
　　

可以通过下面这个命令查看可以安装的python的版本：

pyenv install --list

## 在安装python之前，要先安装python的一些依赖包：

apt-get install libc6-dev gcc
apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm

然后就可以安装python了：

pyenv install 3.6.5 -v

安装完以后需要更新一下数据库：

pyenv rehash

查看当前安装的python的版本：
pyenv versions
```
* system (set by /home/seisman/.pyenv/version)
3.6.5
```

设置全局的python版本：
pyenv global 3.6.5
pyenv versions
```
system
* 3.6.5 (set by /home/seisman/.pyenv/version)
```
现在python的版本变成3.6.5了，可以使用pyenv local或pyenv shell临时改变python的版本。


cd /opt
$ git clone --depth=1 https://github.com/jumpserver/jumpserver.git

cd /opt/jumpserver/requirements
Ubuntu: apt-get install -y $(cat deb_requirements.txt)

$ pip install -r requirements.txt
确保已经载入 py3 虚拟环境, 中间如果遇到报错一般是依赖包没装全, 可以通过 搜索引擎 解决


apt install redis-server

apt install -y mysql-server
    ```
    create database jumpserver default charset 'utf8';　　//创建一个数据库jumpserver
    grant all on jumpserver.* to 'jumpserver'@'127.0.0.1' identified by '密码';　//创建一个用户jumpserver，把jumpserver数据库授权给他
    ```


cd /opt/jumpserver
$ cp config_example.yml config.yml
