https://blog.csdn.net/weixin_40390964/article/details/98082252

## 安装

apt install -y dosbox

vi $(dosbox -printconf)     //编辑dosbox配置文件

    ```
    mount c /root/dos
    c:
    ```

第一步只安装了虚拟环境，但是汇编的编译器和链接器等还没有就位。此处使用老师提供的 masm.7z
https://sst.st/p/530


解压 masm 

dosbox
mount c /home/bill/masm

debug                       验证
-r
