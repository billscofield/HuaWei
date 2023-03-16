## conda pip anaconda miniconda miniforge

[link](https://zhuanlan.zhihu.com/p/518926990)

Anaconda vs Miniconda vs Miniforge

    他们的核心都是包含conda这一工具，来实现python 环境(environment) 和 包
    (package)管理的，（其实不仅仅可以用来管理python，很多语言R, Java, C都支持）；
    然后就可以通过：

安装 包

    conda install numpy 

创建环境

    conda create -n myenv python=3.9 

    Anaconda 和 Miniconda 是一个公司的产品，商用是付费的，个人暂时免费；而
    Miniforge是由社区主导，用GitHub托管，完全免费。Miniconda 和 Miniforge 是差
    不多的产物，代表着轻量化，而Anaconda是完整版，就略显臃肿。

Anaconda vs Miniconda

    (老手) Miniconda = Python + conda (with minimal dependencies, like openssl,
    ncurses...)

    (新手) Anaconda = Python + conda + meta package (about 160 Python pkgs,
    like curl, numpy, pandas...)

    简言之，Anaconda = Miniconda + more packages。Anaconda 一般还包括一个图形界
    面，主要是多了一些基本的包，很省事，不用再单独安装了，但也有一些可能一直用
    不到，白白占用了空间。Miniconda 可以按需求安装库，但也可以借助conda install
    anaconda手动实现anaconda一样的 pre-installed package。一个是安装初期花费更
    多时间下载，一个是后期花更多时间单独安装。我个人倾向于 Miniconda，一切从简。



Miniconda vs Miniforge

    Miniforge 使用conda-forge 作为默认 channel，而 Miniconda 使用anaconda.org
    作为默认channel。channel的含义在这里介绍一下：

    conda channels (源) 是 packages 存储的位置，也即是你是从哪个来源下载这个包，
    对应到conda内部处理则是下载文件的链接。因为不同源会有相同名字的包，因此必须
    指定来源，同时安装conda的时候也会有一个默认的channel。目前主流的就是
    conda-forge，齐全且更新快。如果有多个channel，他们会按顺序确定优先级，优先
    的源上找不到，就会到下一个优先级的源上去找。还可以设置channel的优先级是否
    strict，如果是strict的话，则只会在这一个源上查找。然后 Miniforge 比
    Anaconda\Miniconda 更早支持了Apple M1芯片。2022年5月6日Anaconda官方宣布原生
    支持了Apple M1版本。在苹果官方的Tensorflow加速训练教程中也是推荐的Miniforge。

    简言之，我个人更倾向于 Miniforge，社区万岁。

现在还有新的 Mamba 用来替代 conda，提供更快的速度。使用上用mamba替换掉conda 就
行，其他用法完全一致。
