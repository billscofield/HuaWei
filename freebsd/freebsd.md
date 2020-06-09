
##

### 开启sshd root登录

vi /etc/ssh/sshd_config

PermitRootLogin Yes



### /etc/motd

Welcome to FreeBSD!

Release Notes, Errata: https://www.FreeBSD.org/releases/
Security Advisories:   https://www.FreeBSD.org/security/
FreeBSD Handbook:      https://www.FreeBSD.org/handbook/
FreeBSD FAQ:           https://www.FreeBSD.org/faq/
Questions List: https://lists.FreeBSD.org/mailman/listinfo/freebsd-questions/
FreeBSD Forums:        https://forums.FreeBSD.org/

Documents installed with the system are in the /usr/local/share/doc/freebsd/
directory, or can be installed later with:  pkg install en-freebsd-doc
For other languages, replace "en" with a language code like de or fr.

Show the version of FreeBSD installed:  freebsd-version ; uname -a
Please include that output and any error messages when posting questions.
Introduction to manual pages:  man man
FreeBSD directory layout:      man hier

Edit /etc/motd to change this login announcement.


### vim-lite

pkg install -y vim-lite

cp /usr/share/vim/vim81/vimrc_example.vim ~/.vimrc


system vimrc file: "/usr/local/etc/vim/vimrc"
user vimrc file: "$HOME/.vimrc"
2nd user vimrc file: "~/.vim/vimrc"
user exrc file: "$HOME/.exrc"
system gvimrc file: "/usr/local/etc/vim/gvimrc"
user gvimrc file: "$HOME/.gvimrc"
2nd user gvimrc file: "~/.vim/gvimrc"
defaults file: "$VIMRUNTIME/defaults.vim"
system menu file: "$VIMRUNTIME/menu.vim"
fall-back for $VIM: "/usr/local/etc/vim"
f-b for $VIMRUNTIME: "/usr/local/share/vim/vim82"





vi 
    alias vi    vim
    setenv  EDITOR  vim     //默认编辑器    例如 crontab -e
    setenv  CLICOLOR    yes //使用cli颜色，



source ~/.cshrc


## pkg

pkg install 用于从远程或本地安装软件

安装软件时会自动更新 repository, 除非 pkg.conf 中设置 REPO_AUTOUPDATE 为 NO

一些存在依赖关系的软件在此列表中被检查，并且一些被需要的安装包被添加到此列表等待安装。
这些隐式被安装的软件包都被打上 autoremove 标签. 

安装时依赖的软件包，卸载时，如果没有依赖，也会被删除

autoremove 标签是粘性的, 


pkg query "PKGNAME:%n \t PKGAUTO:%a"    %n:pkgname  %a:是否autoremove
                                                    1:autoremove
                                                    0:手动安装的, 不会被 autoremove


pkg query %a vim    查看单个的软件的 %a(autoremove) 属性

pkg set -A 1 vim    手动设置软件的 %a(autoremove) 属性

pkg update          Updating FreeBSD repository catalogue

pkg upgrade

/etc/pkg/FreeBSD.conf


pkg install xorg gnome3


moused_enable="YES"
moused_nodefault_enable="YES"
dbus_enable="YES"
hald_enable="YES"
linux_enable="YES"
gdm_enable="YES"
