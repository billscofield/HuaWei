

### 直接在线安装

pip install PySide2 -i https://pypi.tuna.tsinghua.edu.cn/simple


如果提示缺少库文件的话，可以先 find 一下

    echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/python2.7/site-packages/PySide2/Qt/lib/'>>~/.bashrc

    source ~/.bashrc


### 下载到本地后安装

pip download -d /home/bill/Downloads/Pyside2/ -i https://pypi.tuna.tsinghua.edu.cn/simple

进入已下载好的目录，如果有非whl包的模块，先解压后执行以下命令安装

    ```
    python setup.py build
    python setup.py install

    使用pip install *.whl命令来安装其余的whl格式的包
    ```

