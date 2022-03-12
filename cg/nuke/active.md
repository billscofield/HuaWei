[link](http://www.gfxcamp.com/nuke-12/)

1. 安装Nuke,莫启动。

1. 安装FLT7.1v1里面的FLT7.1v1-win-x86-release-64.exe

3. 停止Foundry License Server服务

4. 拷贝Crack文件夹里面的rlm.foundry.exe文件到C:\Program Files\The
   Foundry\LicensingTools7.1\bin\RLM\替换里面的rlm.foundry.exe

5. 用记事本打开xf_foundry.lic，

    填上自己电脑的信息

    例：[HOST PCname 946956C44A06]

    HOST HOST_NAME,MAC_ADDRESS,PORT

    HOST (主机名【计算机全名】，MAC地址【不要中间的冒号或者横线】，端口【不想填写端口可以把这个单词删除】)

    注意 
        
        1.前面必须有[HOST ] 【HOST空格】
        
        2.一定要是以太网适配器 本地连接下面的物理地址
        
        A.获取主机名和MAC地址可以通过CMD命令行下输入ipconfig/all
        
        B.获取主机名和MAC地址方法：主机名获取方法右击/我的电脑/属性即可看到，物
        理地址获取方法：网络右键属性/ 本地连接/点击详细信息即可查看                 // 一定是本地连接的,不是其他网卡的
        
        保存

6. 拷贝xf_foundry.lic到C:\ProgramData\The Foundry\RLM

7. 重启RLM Server，默认在C:\Program Files\The Foundry\LicensingTools7.1
   （Foundry License Utility(以管理员身份)，RLM services选项卡，点击Start
   Server）

8. 运行Nuke

9. 依次选择1.Install License 2.Use Server，地址栏输入：端口号@ip地址

    许可证默认的端口为5053，那么这里就是5053@127.0.0.1，如果你指定了特定的端口，
    那么这里就输入：指定端口号@127.0.0.1
