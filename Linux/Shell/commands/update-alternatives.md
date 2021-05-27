
## update-alternatives

update-alternatives - maintain symbolic links determining default commands


--display name

    name Display information about the link group.  Information displayed
    includes the group's  mode  (auto  or  manual),  the master  and slave links,
    which alternative the master link currently points to, what other alternatives
    are available (and their corresponding slave alternatives), and the highest
    priority alternative currently installed.

    看到一个命令的所有可选命令
        
        update-alternatives -- display editor


--config name

    这个选项使我们可以选择其中一个命令
        
        update-alternatives --config editor


---

update-alternatives在一般情况下是由postinst和prerm这样的安装脚本自动调用的，所
以一个alternative的状态有两种：自动和手动。每个alternative的初始状态都是自动，
如果系统发现管理员手动修改了一个alternative，它的状态就从自动变成了手动，这样安
装脚本就不会更新它了。如果你希望将一个alternative变回自动，只要执行代码：

    sudo update-alternatives --auto editor




http://www.linuxeye.com/Linux/alternatives.html
