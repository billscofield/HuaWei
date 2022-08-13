
## brew

1. 安装homebrew

    ` /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    ruby 方式已经废弃，使用 shell 方式

    ` /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    

2. 配置brew国内

    切换brew源为ustc源

    cd "$(brew --repo)" && git remote set-url origin git://mirrors.ustc.edu.cn/brew.git

3. 查看brew源是否安装成功

    cd "$(brew --repo)"  && git remote get-url origin

4. brew config

    查看配置

4. brew doctor


## 使用国内源安装 brew

```
cho 'export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"' >> ~/.zshrc
echo 'export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"' >> ~/.zshrc
source ~/.zshrc
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


## mount 

mac将远程linux服务器目录挂载(mount)到本地

mac通过使用sshfs，可以将远程linux服务器的目录挂载(mount)到本地，就像访问本地目
录一样操作远程目录，非常方便

1. 安装 sshfs

    brew install sshfs

2. 挂载远程服务器目录到本地

    挂在远程目录到本地，输入密码即可，若要免密，创建sshkey即可

    sshfs -C -o reconnect xxxx@x.x.x.x:/home/xq.he /xxxx/mount_remote

3. 卸载

    umount /xxxx/mount_remote

## Mac 命令行安装 dmg文件

1. 安装 dmg 文件

    hdiutil attach jdk-9.0.1_osx-x64_bin.dmg

2. 会挂载在 /Volumes 目录下

3. 安装pkg文件（可以 man installer 查看命令的参数）

    sudo installer -pkg JDK\ 9.0.1.pkg -target /

4. 卸载

　　卸载镜像：

　　　　hdiutil detach /Volumes/JDK\ 9.0.1/

    卸载JDK：

　　　　sudo rm -rf /Library/Java/JavaVirtualMachines

　　APP的话一般安装在/Applications ：

　　　　cd /Applications

　　　　rm -rf Google Chrome.app


## [hdiutil](https://ss64.com/osx/hdiutil.html)

Manipulate disk images (attach, verify, burn, etc).

yntax
      hdiutil verb [options]

DESCRIPTION

    hdiutil uses the DiskImages framework to manipulate disk images.  Common
    verbs include attach, detach, verify, create, convert, compact, and burn.

    The rest of the verbs are currently: help, info, checksum, chpass,
    erasekeys, unflatten, flatten, imageinfo, isencrypted, mountvol, unmount,
    plugins, udifrez, udifderez, internet-enable, resize, segment, makehybrid,
    and pmap.
