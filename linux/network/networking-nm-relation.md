
当系统内没有第三方网络管理工具（比如nm）时，系统默认使用interfaces文件内的参数进行网络配置。（就像Server版本一样）

接着，当系统内安装了 nm之后，nm默认接管了系统的网络配置，使用nm 自己的网络配置参数来进行配置。

但是，如果用户在安装nm之后（Desktop版本默认安装了nm），自己手动修改了interfaces 文件，那nm 就自动停止对系统网络的管理，系统改使用interfaces 文件内的参数进行网络配置。

此时，再去修改nm 内的参数，不影响系统实际的网络配置。若要让nm 内的配置生效，必须重新启用nm 接管系统的网络配置。


如果用户希望在Desktop版本中，直接使用interfaces 进行网络配置，那最好删除network-manager 。

如果在出现上述问题之后，希望能继续使用nm 来进行网络配置，则需要进行如下操作：

```
sudo servicenetwork-manager stop # 停止 nm服务

sudo rm/var/lib/NetworkManager/NetworkManager.state # 移除nm 的状态文件

sudo gedit/etc/NetworkManager/nm-system-settings.conf # 打开nm 的配置文件

里面有一行：managed=true
如果你手工改过/etc/network/interfaces，nm会自己把这行改成：managed=false
将false 修改成true

sudo servicenetwork-manager start
```


debian/ubuntu管理网络连接的有两个东西，图形化的NetworkManager和文字的 ifup/ifdown，如果在 /etc/network/interfaces里设置了网卡信息，那么NetworkManager就不会接管该网卡，
如果没有设置NetworkManager默认是会接管网卡的. NetworkManager最方便的地方是个人电脑用无线连网的时候，因为文字界面的 iwlist wlan0 scan 并不是非常好用，
而NetworkManger可以像windows那样列出所有可用的wifi热点，如果有中文乱码的，也一样可以连接，但如果你的机子是用来做服务器的，或者是在办公室里使用，有固定的路由环境，
一般来说，也会有固定的ip，因为这样可以方便内网共享资源。总之不是个人用的，而且不用移来移去的话，最好是关掉这个NetworkManager，当然如果你经常带着本子跑，想去咖啡馆蹭网的话，
就一定要打开这个NetworkManager，自动搜索无线非常方便了。

