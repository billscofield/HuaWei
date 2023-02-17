
## 1. Git - 协议

https://git-scm.com/book/zh/v2/服务器上的-Git-协议

Git 可以使用四种不同的协议来传输资料：本地协议（Local），HTTP 协议，SSH（Secure
Shell）协议及 Git 协议。

1. 本地协议

2. HTTP 协议

3. SSH 协议

    useradd -m -s /bin/bash git
    添加公钥
    mkdir /home/git/code_repository/
    git init abc
    
    git remote add origin2 ssh://gituser@1.1.1.1:/code_repository/abc
    git push  -u origin2 master
    git pull  ssh://gituser@1.1.1.1:/code_repository/abc

4. Git 协议


## 2. Gitolite

[官方文档](https://github.com/sitaramc/gitolite)

可以为用户分配权限，但没有web界面，适合个人或小团队使用


## 3. gitlab

GitLab 有着开源并免费的版本 GitLab CE

最少2核心4GB内存, 否则跑不起来

而 GitLab 原生就集成了一套强大的 CI 功能，而且就像 GitHub Action 与 GitHub 那样，
它与 GitLab 有着极为紧密的结合。



## 4. Gitea

Gitea 是完全开源免费的项目

Gitea 没有提供内置的 CI/CD 支持，但是可以用 Gitea 提供的 API 与其他 CI 集成，目
前推荐的比较多的似乎是是自部署 Drone CI，但也可以与 Travis CI 这类现成的CI 集成
