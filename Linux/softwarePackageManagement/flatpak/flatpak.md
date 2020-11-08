
##


## Flatpak 介绍

用户也完全不用担心库和依赖的问题了，所有的东西都和 app 打包在了一起。更重要的是 Flatpak app 们都自带沙箱，而且与宿主操作系统的其他部分隔离。对了，Flatpak 还有一个很棒的特性，它允许用户在同一个系统中安装同一应用的多个版本，例如 VLC 播放器的 2.1 版、2.2 版、2.3 版。这使开发者测试同一个软件的多个版本变得更加方便。

### 安装flatpak

apt install flatpak

Gnome 提供了一个 Flatpak 插件，安装它就可以使用图形界面来安装 Flatpak app 了。插件的安装命令为：

    $ sudo apt install gnome-software-plugin-flatpak

### 添加 Flathub 仓库：

Flathub 是一个包含了几乎所有 flatpak 应用的仓库。
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    ```
    Note that the directories

    '/var/lib/flatpak/exports/share'
    '/root/.local/share/flatpak/exports/share'

    are not in the search path set by the XDG_DATA_DIRS environment variable, so        //这个变量是写到哪里了???
    applications installed by Flatpak may not appear on your desktop until the
    session is restarted.

    ```

对于流行应用来说，Flathub 已经可以满足需求。如果你想试试 GNOME 应用的话，可以添加 GNOME 的仓库。


### 删除软件仓库

删除软件仓库, 例如 flathub，用这条命令：

    $ sudo flatpak remote-delete flathub

    这里的 flathub 是软件仓库的名字。

### 查看软件仓库

要查看已经添加的软件仓库，执行下面的命令：

    $ flatpak remotes 

###

## Flatpak 应用

### 要安装一个应用，只要一条命令就能完成：

    $ sudo flatpak install flathub com.spotify.Client

如果不希望应用安装在 系统级(system-wide)，而只安装在 用户级(per-user)，那么你可以这样安装软件：

    $ flatpak install --user <name-of-app>

    所有的应用都会被存储在 $HOME/.var/app/ 目录下.

### 执行 Flatpak 应用

你可以直接使用 应用启动器(application launcher)来运行已安装的 Flatpak 应用。如果你想从命令行启动的话，以 Spotify 为例，执行下面的命令：

    $ flatpak run com.spotify.Client

### 列出已安装的 Flatpak 应用

要查看已安装的应用程序和运行时环境，执行：

    $ flatpak list

想只查看已安装的应用，那就用这条命令：

    $ flatpak list --app

如果想查询已添加的软件仓库中的可安装程序和可安装的运行时环境，使用命令：

    $ flatpak remote-ls

只列出可安装的应用程序的命令是：

    $ flatpak remote-ls --app

查询指定远程仓库中的所有可安装的应用程序和运行时环境，这里以 gnome-apps 为例，执行命令：

    $ flatpak remote-ls gnome-apps

只列出可安装的应用程序，这里以 flathub 为例：

    $ flatpak remote-ls flathub --app

### 获取应用详情

执行下面的命令来查看已安装应用程序的详细信息：

    $ flatpak info io.github.mmstick.FontFinder


### 更新应用程序

更新所有的 Flatpak 应用程序，执行：

    $ flatpak update

更新指定的 Flatpak 应用程序，执行：

    $ flatpak update com.spotify.Client

### 删除应用程序

要删除一个 Flatpak 应用程序，这里以 spotify 为例，执行：

    $ sudo flatpak uninstall com.spotify.Client



### 安装 Flatpak 应用 

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.github.muriloventuroso.easyssh

    ```
    Looking for matches…
    Required runtime for com.github.muriloventuroso.easyssh/x86_64/stable (runtime/org.gnome.Platform/x86_64/3.36) found in remote flathub
    Do you want to install it? [Y/n]: y

    com.github.muriloventuroso.easyssh permissions:
        ipc     network     ssh-auth     wayland     x11     dri     file access [1]

        [1] home


    ID                                                    Arch               Branch            Remote             Download
    1. [ ] org.gnome.Platform                                    x86_64             3.36              flathub              313.8 kB / 326.0 MB
    2. [ ] org.gnome.Platform.Locale                             x86_64             3.36              flathub            < 323.1 MB (partial)
    3. [ ] org.freedesktop.Platform.GL.default                   x86_64             19.08             flathub             < 89.1 MB
    4. [ ] org.freedesktop.Platform.VAAPI.Intel                  x86_64             19.08             flathub              < 8.7 MB
    5. [ ] org.freedesktop.Platform.openh264                     x86_64             2.0               flathub              < 1.5 MB
    6. [ ] com.github.muriloventuroso.easyssh                    x86_64             stable            flathub             < 20.6 MB
    7. [ ] com.github.muriloventuroso.easyssh.Locale             x86_64             stable            flathub            < 333.1 kB (partial)

    ```
    速度很慢

用如下命令运行 EasySSH：

flatpak run com.github.muriloventuroso.easyssh


## 参考链接

https://www.sohu.com/a/290266944_100034897






