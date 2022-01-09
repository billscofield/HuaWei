# MacOS

## 虚拟机安装 MacOS

### 安装 Vmware Workstation Pro 

进入 BIOS 激活虚拟化功能

好像是因为windows 10 没有激活的原因，VMware 不能安装 64 位虚拟机，所以可以试验一下

默认 VMware 是不支持虚拟 MacOS 的，需要使用 unlocker 设置, 在安装 unlocker 的时候请关闭 VMware


### 版本

Mojave      莫哈维

catalina    卡特琳娜

    Catalina已经全面舍弃了32位软件改为64位


### 苹果镜像

dmg

    一般是官方的原版, 会有一个验证过程，不验证完成不能写入U盘 ,是MAC苹果机上的压缩镜像文件，相当于在Windows上常见的iso文件。

　　在Windows PC上可以通过命令行软件dmg2iso.exe/darwiniso转换成ISO文件。

　　命令运行格式：dmg2iso.exe 空格 filename（待转换文件名）.dmg 空格 filename（转换后文件名）.iso 确定。

　　dmg2iso是一个免费软件，但其功能相对有限，某些情况下目标dmg文件无法成功转换为iso。这种情况下可以使用UltraISO等商业软件进行格式转换。

    这个也是从苹果商店下载的镜像格式

        appstore 下载后的路径是:
        
        /Applications/Install\ macOS\ Catalina.app/Contents/SharedSupport/InstallESD.dmg 
        
        7.2G


        原版系统安装
        
            1. 将dmg 文件打开,将里边的app文件拖放到 application 中
            2. 执行如下命令:

                > sudo /Application/Install macOS Sierra.app/Contents/Resources/createinstallmedia  --volume /Volumes/U盘名称 --applicationpath /Applications/Install macOS Sierra.app --nointeraction




crd 

    是懒人版别人打包的，crd 在mac下可以直接写入U盘。


### 安装过程中的报错

1. 这个macOS Mojave应用程序副本已损坏,不能用

    (This copy of the install macOS High Sierra application is damaged, and can't be used to install macOS)

    打开终端 （顶部菜单下拉选项中）

    ifconfig en0 down

    date 032208102018.20
        月日时分年.秒   // 一说改成版本发布的年份, Mojave 确实是18年发布的, 但是是6月5日 苹果全球开发者大会
    date 071014102018   // Sierra

    再次安装即可

    第二条命令是设置电脑时间为以前的一个时间

    如果不输入第一条命令可能第二条命令输了也没有效果(除非断开网线)

1. 蓝屏

    若果在安装中出现蓝屏boot manager的现象，一般都是跟下载的镜像文件有问题导致。建议你可以重新找些cdr镜像文件。


### 按键

符号	苹果的键盘	    普通的键盘

⌘	    command	        window

⌥	    option	        alt



### homebrew 的安装

Homebrew 对于使用 Mac 的开发者来说，是再熟悉不过的了，它可以在 macOS 中方便的安装和管理各种系统并不自带的开发包。

不知道为什么访问不了github, 只能使用国内源了

```
/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"

```


brew 是从下载源码解压然后 ./configure && make install ，同时会包含相关依存库。并自动配置好各种环境变量，而且易于卸载。
这个对程序员来说简直是福音，简单的指令，就能快速安装和升级本地的各种开发环境。

而 brew cask 是 已经编译好了的应用包 （.dmg/.pkg），仅仅是下载解压，放在统一的目录中（/opt/homebrew-cask/Caskroom），省掉了自己去下载、解压、拖拽（安装）等蛋疼步骤，同样，卸载相当容易与干净。这个对一般用户来说会比较方便，包含很多在 AppStore 里没有的常用软件。
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。



脚本内容

```
:r!cat /Homebrew.sh

#HomeBrew自动安装脚本
#cunkai.wang@foxmail.com
#路径表.
HOMEBREW_PREFIX="/usr/local"
HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"
HOMEBREW_CACHE="${HOME}/Library/Caches/Homebrew"

STAT="stat -f"
CHOWN="/usr/sbin/chown"
CHGRP="/usr/bin/chgrp"
GROUP="admin"

#获取前面两个.的数据
major_minor() {
  echo "${1%%.*}.$(x="${1#*.}"; echo "${x%%.*}")"
}

#获取系统版本
macos_version="$(major_minor "$(/usr/bin/sw_vers -productVersion)")"
#获取系统时间
TIME=$(date "+%Y-%m-%d %H:%M:%S")

JudgeSuccess()
{
    if [ $? -ne 0 ];then
        echo '\033[1;31m此步骤失败 '$1'\033[0m'
        if [[ "$2" == 'out' ]]; then
          exit 0
        fi
    else
        echo "\033[1;32m此步骤成功\033[0m"

    fi
}
# 判断是否有系统权限
have_sudo_access() {
  if [[ -z "${HAVE_SUDO_ACCESS-}" ]]; then
    /usr/bin/sudo -l mkdir &>/dev/null
    HAVE_SUDO_ACCESS="$?"
  fi

  if [[ "$HAVE_SUDO_ACCESS" -ne 0 ]]; then
    echo "\033[1;31m开机密码输入错误，获取权限失败!\033[0m"
  fi

  return "$HAVE_SUDO_ACCESS"
}


abort() {
  printf "%s\n" "$1"
  exit 1
}

shell_join() {
  local arg
  printf "%s" "$1"
  shift
  for arg in "$@"; do
    printf " "
    printf "%s" "${arg// /\ }"
  done
}

execute() {
  if ! "$@"; then
    abort "$(printf "\033[1;31m此命令运行失败（再次运行脚本或者手动运行此命令测试权限）:sudo %s\033[0m" "$(shell_join "$@")")"
  fi
}

# 管理员运行
execute_sudo() 
{
  # local -a args=("$@")
  # if [[ -n "${SUDO_ASKPASS-}" ]]; then
  #   args=("-A" "${args[@]}")
  # fi
  if have_sudo_access; then
    execute "/usr/bin/sudo" "$@"
  else
    execute "sudo" "$@"
  fi
}
#添加文件夹权限
AddPermission()
{
  execute_sudo "/bin/chmod" "-R" "a+rwx" "$1"
  execute_sudo "$CHOWN" "$USER" "$1"
  execute_sudo "$CHGRP" "$GROUP" "$1"
}
#创建文件夹
CreateFolder()
{
    echo '-> 创建文件夹' $1
    execute_sudo "/bin/mkdir" "-p" "$1"
    JudgeSuccess
    AddPermission $1
}

RmCreate()
{
    sudo rm -rf $1
    CreateFolder $1
}

#git提交
git_commit(){
    git add .
    git commit -m "your del"
}

#version_gt 判断$1是否大于$2
version_gt() {
  [[ "${1%.*}" -gt "${2%.*}" ]] || [[ "${1%.*}" -eq "${2%.*}" && "${1#*.}" -gt "${2#*.}" ]]
}
#version_ge 判断$1是否大于等于$2
version_ge() {
  [[ "${1%.*}" -gt "${2%.*}" ]] || [[ "${1%.*}" -eq "${2%.*}" && "${1#*.}" -ge "${2#*.}" ]]
}
#version_lt 判断$1是否小于$2
version_lt() {
  [[ "${1%.*}" -lt "${2%.*}" ]] || [[ "${1%.*}" -eq "${2%.*}" && "${1#*.}" -lt "${2#*.}" ]]
}

#一些警告判断
warning_if(){
  git_https_proxy=$(git config --global https.proxy)
  git_http_proxy=$(git config --global http.proxy)
  if [[ -z "$git_https_proxy"  &&  -z "$git_http_proxy" ]]; then
  echo "未发现Git代理（属于正常状态）"
  else
  echo "\033[1;33m
      提示：发现你电脑设置了Git代理，如果Git报错，请运行下面两句话：

              git config --global --unset https.proxy

              git config --global --unset http.proxy\033[0m
  "
  fi
}

echo '
              \033[1;32m开始执行Brew自动安装程序\033[0m
             \033[1;36m[cunkai.wang@foxmail.com]\033[0m
           ['$TIME']['$macos_version']
       \033[1;36mhttps://zhuanlan.zhihu.com/p/111014448\033[0m
'
#选择一个下载源
echo '\033[1;32m
请选择一个下载镜像，例如中科大，输入1回车。
源有时候不稳定，如果git克隆报错重新运行脚本选择源。cask非必须，有部分人需要。
1、中科大下载源 2、清华大学下载源 3、腾讯下载源(不稳定) 4、阿里巴巴下载源(缺少cask源)\033[0m'
read "MY_DOWN_NUM?请输入序号: "
case $MY_DOWN_NUM in
"2")
    echo "
    你选择了清华大学下载源"
    USER_HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
    #HomeBrew基础框架
    USER_BREW_GIT=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
    #HomeBrew Core
    USER_CORE_GIT=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
    #HomeBrew Cask
    USER_CASK_GIT=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
    USER_CASK_FONTS_GIT=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
    USER_CASK_DRIVERS_GIT=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-drivers.git
;;
"3")
    echo "
    你选择了腾讯下载源"
    USER_HOMEBREW_BOTTLE_DOMAIN=https://mirrors.cloud.tencent.com/homebrew-bottles
    #HomeBrew基础框架
    USER_BREW_GIT=https://mirrors.cloud.tencent.com/homebrew/brew.git 
    #HomeBrew Core
    USER_CORE_GIT=https://mirrors.cloud.tencent.com/homebrew/homebrew-core.git
    #HomeBrew Cask
    USER_CASK_GIT=https://mirrors.cloud.tencent.com/homebrew/homebrew-cask.git
;;
"4")
    echo "
    你选择了阿里巴巴下载源(阿里缺少cask源)"
    USER_HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
    #HomeBrew基础框架
    USER_BREW_GIT=https://mirrors.aliyun.com/homebrew/brew.git 
    #HomeBrew Core
    USER_CORE_GIT=https://mirrors.aliyun.com/homebrew/homebrew-core.git
    #HomeBrew Cask
    USER_CASK_GIT=https://mirrors.aliyun.com/homebrew/homebrew-cask.git
;;
*)
  echo "
  你选择了中国科学技术大学下载源"
  #HomeBrew 下载源 install
  USER_HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
  #HomeBrew基础框架
  USER_BREW_GIT=https://mirrors.ustc.edu.cn/brew.git
  #HomeBrew Core
  USER_CORE_GIT=https://mirrors.ustc.edu.cn/homebrew-core.git
  #HomeBrew Cask
  USER_CASK_GIT=https://mirrors.ustc.edu.cn/homebrew-cask.git
;;
esac
echo '\033[1;32m'
read "MY_Del_Old?此脚本将要删除之前的brew(包括它下载的软件)，请自行备份。
->是否现在开始执行脚本（N/Y）"
echo '\033[0m'
case $MY_Del_Old in
"y")
echo "--> 脚本开始执行"
;;
"Y")
echo "--> 脚本开始执行"
;;
*)
echo "你输入了 $MY_Del_Old ，自行备份老版brew和它下载的软件, 如果继续运行脚本应该输入Y或者y
"
open /usr/local/
exit 0
;;
esac
echo '==> 通过命令删除之前的brew、创建一个新的Homebrew文件夹
(设置开机密码：在左上角苹果图标->系统偏好设置->"用户与群组"->更改密码)
(如果提示This incident will be reported. 在"用户与群组"中查看是否管理员)
\033[1;36m请输入开机密码，输入过程不显示，输入完后回车\033[0m'
# 让环境暂时纯粹，重启终端后恢复
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
RmCreate ${HOMEBREW_REPOSITORY}
sudo rm -rf /Users/$(whoami)/Library/Caches/Homebrew/
sudo rm -rf /Users/$(whoami)/Library/Logs/Homebrew/
RmCreate ${HOMEBREW_PREFIX}/Caskroom
RmCreate ${HOMEBREW_PREFIX}/Cellar
RmCreate ${HOMEBREW_PREFIX}/var/homebrew
directories=(bin etc include lib sbin share var opt
             share/zsh share/zsh/site-functions
             var/homebrew var/homebrew/linked
             Cellar Caskroom Homebrew Frameworks)
for dir in "${directories[@]}"; do
  if ! [[ -d "${HOMEBREW_PREFIX}/${dir}" ]]; then
    CreateFolder "${HOMEBREW_PREFIX}/${dir}"
  fi
  AddPermission ${HOMEBREW_PREFIX}/${dir}
done

git --version
if [ $? -ne 0 ];then
  sudo rm -rf "/Library/Developer/CommandLineTools/"
  echo '\033[1;36m安装Git\033[0m后再运行此脚本，\033[1;31m在系统弹窗中点击“安装”按钮
如果没有弹窗的老系统，需要自己下载安装：https://git-scm.com/downloads \033[0m'
  xcode-select --install
  exit 0
fi

echo '
\033[1;36m下载速度觉得慢可以ctrl+c或control+c重新运行脚本选择下载源\033[0m
==> 克隆Homebrew基本文件(32M+)
'
warning_if
sudo git clone $USER_BREW_GIT ${HOMEBREW_REPOSITORY}
JudgeSuccess 尝试再次运行自动脚本选择其他下载源或者切换网络 out
echo '==> 创建brew的替身'
find ${HOMEBREW_PREFIX}/bin -name brew -exec sudo rm -f {} \;
sudo ln -s ${HOMEBREW_PREFIX}/Homebrew/bin/brew ${HOMEBREW_PREFIX}/bin/brew
JudgeSuccess
echo '==> 克隆Homebrew Core(224M+) 
\033[1;36m此处如果显示Password表示需要再次输入开机密码，输入完后回车\033[0m'
sudo mkdir -p ${HOMEBREW_PREFIX}/Homebrew/Library/Taps/homebrew/homebrew-core
sudo git clone $USER_CORE_GIT ${HOMEBREW_PREFIX}/Homebrew/Library/Taps/homebrew/homebrew-core/
JudgeSuccess 尝试再次运行自动脚本选择其他下载源或者切换网络 out
echo '==> 克隆Homebrew Cask(248M+) 类似AppStore 
\033[1;36m此处如果显示Password表示需要再次输入开机密码，输入完后回车\033[0m'
if [[ "$MY_DOWN_NUM" -eq "3" ]];then
  echo '\033[1;33m阿里源没有Cask 跳过\033[0m'
else
  sudo mkdir -p ${HOMEBREW_PREFIX}/Homebrew/Library/Taps/homebrew/homebrew-cask
  sudo git clone $USER_CASK_GIT ${HOMEBREW_PREFIX}/Homebrew/Library/Taps/homebrew/homebrew-cask/
  if [ $? -ne 0 ];then
      sudo rm -rf ${HOMEBREW_PREFIX}/Homebrew/Library/Taps/homebrew/homebrew-cask
      echo '\033[1;31m尝试切换下载源或者切换网络,不过Cask组件非必须模块。可以忽略\033[0m'
  else
      echo "\033[1;32m此步骤成功\033[0m"

  fi
fi
echo '==> 配置国内镜像源HOMEBREW BOTTLE'
if [[ -f ~/.zshrc ]]; then
  AddPermission ~/.zshrc
fi
echo "
# HomeBrew
export HOMEBREW_BOTTLE_DOMAIN=${USER_HOMEBREW_BOTTLE_DOMAIN}
export PATH=\"/usr/local/bin:\$PATH\"
export PATH=\"/usr/local/sbin:\$PATH\"
# HomeBrew END
" >> ~/.zshrc
if [[ -f ~/.bash_profile ]]; then
  AddPermission ~/.bash_profile
fi
echo "
# HomeBrew
export HOMEBREW_BOTTLE_DOMAIN=${USER_HOMEBREW_BOTTLE_DOMAIN}
export PATH=\"/usr/local/bin:\$PATH\"
export PATH=\"/usr/local/sbin:\$PATH\"
# HomeBrew END
" >> ~/.bash_profile
JudgeSuccess
source ~/.zshrc
source ~/.bash_profile
echo '
==> 安装完成，brew版本
'
#判断系统版本
if version_gt "$macos_version" "10.14"; then
    echo "$macos_version"
else
    echo '\033[1;31m检测到你不是最新系统，会有一些报错，请稍等Ruby下载安装;\033[0m
    '
fi

AddPermission ${HOMEBREW_REPOSITORY}
#先暂时设置到清华大学源，中科大没有Ruby下载镜像
HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
echo 'brew -v
'
brew -v
if [ $? -ne 0 ];then
    echo '
    \033[1;31m失败 查看下面文章第二部分的常见错误
    https://zhuanlan.zhihu.com/p/111014448
    如果没有解决，把运行脚本过程截图发到 cunkai.wang@foxmail.com --end
    \033[0m'
    exit 0
else
    echo "\033[1;32mBrew前期配置成功\033[0m"
fi
echo '
==> brew update
'
HOMEBREW_BOTTLE_DOMAIN=${USER_HOMEBREW_BOTTLE_DOMAIN}
brew update
if [ $? -ne 0 ];then
    echo '
    \033[1;31m失败 去下面文章看一下第二部分的常见错误解决办法
    https://zhuanlan.zhihu.com/p/111014448
    如果没有解决，把运行脚本过程截图发到 cunkai.wang@foxmail.com \033[0m
    '
else
    echo "
        \033[1;32m上一句如果提示Already up-to-date表示成功\033[0m
            \033[1;32mBrew自动安装程序运行完成\033[0m
              \033[1;32m国内地址已经配置完成\033[0m

                初步介绍几个brew命令

        本地软件库列表：brew ls
        查找软件：brew search google（其中google替换为要查找的软件关键字）
        查看brew版本：brew -v  更新brew版本：brew update
\033[1;32m
现在可以输入命令open ~/.zshrc -e 或者 open ~/.bash_profile -e 整理一下重复的语句(运行 echo \$SHELL 可以查看应该打开那一个文件修改)

        https://zhuanlan.zhihu.com/p/111014448  欢迎来给点个赞\033[0m
    "
fi
```



### 网络

如果选择 "桥接", 配了IP，却没有网络时，需要看下主机有几块网卡，并在 VMware中进行桥接网卡的设置


### 有用的软件

1. better menubar   //用于显示cpu, 内存，硬盘，网络状态


### 其它的优化

1. dock 默认没有开启放大功能，
    
    System Preference / 搜索dock / 勾选 Magnification, 并选择放大比例

    也可以在dock上右键，选择 Magnification on

1. 与主机共享文件夹

    vmware 开启共享文件夹

    macos 中 Finder / preferences / sidebar / Locations / 勾选 XXX的Mac / 重启

1. 录屏/截屏

    shift + command + 5


1. 显示桌面(默认F11)

    System Preference / Mission Control / 

1. 多屏幕展示 系统默认按control+向上键

    切换屏幕 系统默认按control+左／右

1. 快速当前应用切换

    command+tab

1. 显示launchpad

    option／alt + space空格 (设置)

    系统偏好设置 > keyboard中设置

1. 浏览器的table切换

    control + table

    关闭标签页

        command + w

1. 屏幕显示按键

    keycastr

    brew cask install keycastr

    ```
    Could not create keyDown event tap!

    Please grant KeyCastr access to the Accessibility API.

    If KeyCastr already has access, please remove it and add it again.

    按照指引进行设置即可

    ```

1.  Spotlight 
    
    Command + Space

1. 切换shell

    chsh -s /bin/bash

1. 安装zsh

    git clone https://gitee.com/billscofield/ohmyzsh.git ~/.oh-my-zsh

    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

    source ~/.zshrc

    各种主题的效果和名称

        https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

1. iTerm2

    官网上下载压缩包，放到mac上用unzip解压, 然后进入文件夹，将app文件托摘到拖拽到 application

    菜单栏 / iTerm2 / Install Shell Integration

    


#### zsh 插件

1. incr 自动补全插件

    mkdir ~/.oh-my-zsh/plugins/incr

    将 incr-0.2.zsh 放入 ~/.oh-my-zsh/plugins/incr/

    vim ~/.zshrc

        source ~/.oh-my-zsh/plugins/incr/incr*.zsh

1. zsh-autosuggestion


1. zsh-syntax-highlighting
    
    你输入的命令正确与否会有不同的颜色


### fzf

brew install fzf


### ranger

终端下的文件管理器

brew install ranger
