## 安装

从 Python 3.4 开始就已经自带了pip和easy_install（setuptools 包带的命令） 包管理
命令，可以在 /usr/local/python3/bin/ 目录下看到这些安装的扩展包：

pip3 install asciinema


或者  apt install asciinema


## 使用

rec                 Record terminal session                                     # 记录终端会话
play                Replay terminal session                                     # 播放重播终端会话
cat                 Print full output of terminal session                       # 打印终端会话的全部输出
upload              Upload locally saved terminal session to asciinema.org      # 上传本地保存的终端会话到asciinema.org
auth                Manage recordings on asciinema.org account                  # 管理asciinema.org帐户上的记录

示例用法:

1. 记录终端并将其上传到asciinema.org

    asciinema rec  

    按 enter 后，会上传至网站，匿名用户

2. 将终端记录到本地文件

    asciinema rec demo.cast

3. 记录终端并将其上传到asciinema.org，指定标题："my aslog1"

    asciinema rec -t "my aslog1"

4. 将终端记录到本地文件，将空闲时间限制到最大2.5秒

    asciinema rec -i 2.5 demo.cast

5. 从本地文件重放终端记录

    asciinema play demo.cast

6. 重放托管在asciinema.org上的终端记录

    asciinema play https://asciinema.org/a/difqlgx86ym6emrmd8u62yqu8

7. 打印记录的会话的全部输出

    asciinema cat demo.cast


录制

    press <ctrl-d> or type "exit" when you're done

    press <enter> to upload to asciinema.org, <ctrl-c> to save locally

