## PyTorch

2017年1月, FAIR(Facebook AI Search ) 发布PyTorch

是在Torch基础上用Python语言重新打造的一款深度学习框架

Torch是采用Lua语言为接口的机器学习框架, 因为Lua比较小众，所以知名度不高

## 优点

上手快，掌握Numpy和基本深度学习概念即可上手
代码简洁灵活
Debug方便
文档规范: https://pytorch.org/docs/
资源多：arXiv中的新算法大多有PyTorch实现


## PyTorch 文件命名规则

cuda版本或cpu版本   pytorch版本号   python版本号    操作系统

cu92/torch-1.2.0%2Bcu92-cp37-cp37m-win_amd64.whl
cuda    torch           python      windows


### cuda版本：

去官网查看支持的版本

然后会给出相应的命令

也可以手动下载安装，需要下载 torch 和 torchvision
下载当当前目录后 直接 pip install 文件 即可





如果你使用conda install pytorch torchvision cudatoolkit=9.0 -c pytorch来安装pytorch，并且添加了清华镜像源，但还是由于网络原因下载失败，你只需要把-c pytorch去掉：

conda install pytorch torchvision cudatoolkit=9.0
这是因为-c参数指明了下载pytorch的通道，优先级比清华镜像更高。


### 非cuda版本

pip install torch===1.3.0 torchvision===0.4.1 -f https://download.pytorch.org/whl/torch_stable.html -i https://pypi.tuna.tsinghua.edu.cn/simple
不用清华源的话很慢

## 使用pytorch

import torch
print("hello {}".format(torch.__version__))     查看版本

print(torch.cuda.is_available())                查看是否支持GPU

