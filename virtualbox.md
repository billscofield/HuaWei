## 菜单栏没有后
    1. Ctrl+C ：自动缩放模式
    1. Ctrl+A：自动调整窗口大小

## VirtualBox虚拟机克隆迁移步骤
有的时候需要对虚拟机进行迁移。比如我们原来的服务器，使用的win10操作系统，上面利用VirtualBox安装了多个虚机作为服务器，tomcat服务器，virtuoso数据库服务器，mysql服务器等，由于win10物理机出现了问题，需要将虚机迁出，所以尝试着将虚机迁移到另一台win2008的系统中。

VirtualBox保存虚机数据的是vdi文件，简单来说就是拷贝vdi文件，然后在新的物理机上，安装VirtualBox打开这个vdi文件。具体步骤如下。

1. 获取vdi文件
每个虚机都对应一个或多个vdi文件，在VirtualBox中的全局设置，可以查看虚机vdi文件的存放目录，每个虚机的数据都保存在以虚机名称为文件夹里面。
    1. vdi文件可以看作虚机的基础数据。如果虚拟保存了快照（备份），还有一个snapshot目录，里面保存的是虚机快照。
    1. 快照的vdi可以看作是虚机的状态信息，
    1. 基础数据和状态信息加在一起是虚机的所有数据.
    1. 一般我们可以关闭虚机，然后再删除快照，这样就剩下根目录的vdi，也就是虚机的vdi数据，这个vdi就是我们要的vdi。

2. 克隆vdi数据
    如果直接拷贝vdi数据，在新的VirtualBox中不能打开
    1. 因为每个vdi文件都包含了一个uuid的数据，如果直接拷贝，uuid在新的VirtualBox中是不能用的，所以会打开失败，
    1. 我们需要给在原来vdi的基础上，生成新的vdi数据，包含新的uuid，可以在VirtualBox中打开。
    1. 这个包含新uuid的vdi数据可以通过VirtualBox命令生成。

此处用了克隆的方法，也可以直接拷贝过去，然后再通过VirtualBox命令处理。
    1. 克隆的方法，进入cmd命令行，然后进入VirtualBox的安装目录，比如VitualBox的安装目录是C:\Program Files\Oracle\VirtualBox，原有vdi文件在d盘，生成新的vdi放到e盘。命令为

    ```
    C:\Program Files\Oracle\VirtualBox>vboxmanage.exe  clonehd  "d:\xxx.vdi" "e:\xxx.vdi"
    ```

    回车之后出现0%...，需要点时间才能生成vdi文件，10多G的数据可能要10来分钟时间。执行完成后会出现0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%类似的信息。这样克隆vdi数据文件的工作完成了。

3 利用vdi数据创建虚机

在新的VirtualBox中创建新的虚机，给虚机起个名字，选择操作系统。点击下一步，使用已有vdi文件创建虚机，选择刚生成的vdi文件创建。

这样虚机的迁移任务就完成了。


链接：
    1. https://www.cnblogs.com/coodream2009/p/8578216.html
    1. https://www.linuxidc.com/Linux/2017-08/146130.htm   和上边那个一样，有截图
