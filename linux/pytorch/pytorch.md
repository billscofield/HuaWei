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


## 张量

张量是根据一共具有多少坐标轴来定义

张量能够被转换和操作，从而使列变为行或者行变为列






numpy           数学计算框架
scipy           物理计算框架
pandas          数据分析框架
matplotlib      绘图框架
scikit-learn    机器学习框架
tensorflow      深度学习框架
kared           对tensorflow的封装(?)


人工智能 -> 机器学习 -> 深度学习




模型就相当于某种规律, 利用此模型来预测, 很多参数，例如 y = x + bx 中的a,b

算法是模型，模型是参数


y = a + bx
x,y 都是已知的数据
求模型(参数)a,b


机器学习分类
    1. 有监督的机器学习: 有y
        分类(y是分类号)
            预测结果是哪个类别
            
        回归(y区间是政府无穷) regression to the mean
            预测结果具体的值
                
            最简单的线性回归：简单线性回归
                一元一次方程组
                一元指的是一个x
                一次指的是x的变化
                x:影响y的因素，也叫维度
                
            做机器学习就是要以最快的速度，找到误差最小的最优解
            
            目标函数/损失函数/test function
         
            多元线性回归


    1. 无监督的机器学习: 无y
        相当于自学成才，类似Will
        聚类
            在没有y的情况下，把数据分类
        降维
            x1,,,,Xn 维度多，n特别大的时候，需要为了更快的解方程组，减少x数量的







数据    算法    模型    预测

对数据：特征工程
算法调优


机器学习是一门交叉学科
    1. 模式识别
    1. 数据挖掘
    1. 统计学习
    1. 计算机视觉
    1. 语音识别
    1. 自然语言处理
        情感分析
        文本分类
        去重(论文作弊)

机器学习子类:深度学习

Siri, Cortana, Now(Google 手机)    NLP(natural language process)自然语言处理





W: 权重 weight
Ws: 很多权重
这个特征的重要程度, 越大，对输出影响越大
每个w对应一个x(特征)

y = a + bx
a：W0, 我们设为1

W会初始化一个值

``` 有监督机器学习训练流程
---------------------------------------------
|训练集                                     |
|                                           |
|   ------------         ------------       |
|   |用户特征 x|         |健康状况 y|       |
|   ------------         ------------       |
|      1|                     |             |
|       |                     |             |
--------|---------------------|--------------
        |                     |
        |                     ↓
        |                ------------
        |                | 错    误 |
        |                ------------
        |              -    4 ↑
        |             -       |
        |            -        |
        |     调整  -         |
        |          -          |
        |         -           |
        |        -            |
        |       -             |
        |      -              |
       2↓     ↙ 5       3     |
    -------------       -------------------
    |  W        |------>| 预测健康状况 y拔|
    -------------       -------------------

评估W是否准确，比较y和y拔，直到这个差值不再变化(最出名的梯度下降法)

```


### scikit-learn

Machine Learning in Python

Build on NumPy, SciPy, and matplotlib

封装了一些算法

Scikit-learn项目最早由数据科学家David Cournapeau 在2007 年发起，需要NumPy和SciPy等其他包的支持，是Python语言中专门针对机器学习应用而发展起来的一款开源框架。

它不支持深度学习和强化学习，这在今天已经是应用非常广泛的技术。此外，它也不支持图模型和序列预测，不支持Python之外的语言，不支持PyPy，也不支持GPU加速。

看到这里可能会有人担心Scikit-learn的性能表现，这里需要指出的是：如果不考虑多层神经网络的相关应用，Scikit-learn的性能表现是非常不错的。究其原因，一方面是因为其内部算法的实现十分高效，另一方面或许可以归功于Cython编译器；通过Cython在Scikit-learn框架内部生成C语言代码的运行方式，Scikit-learn消除了大部分的性能瓶颈。


1. Classifiction 分类
    identifying to which category an object belongs to
1. Regression 回归
    Predicting a continuous-valued attribute associated with an object.
1. Clustering 聚类
    Automatic grouping of similar objects into sets.
1. Dimensionality reduction 降维
    Reducing the number of random variables to consider.
1. Model selection 模型选择
    Comparing, validating and choosing parameters and models.
1. Preprocessing 预处理
    Feature extraction and normalization(归一化).



### 回归

大自然让我们回归到一定的区间之内

正态分布，高斯分布

线性回归
    两个变量之间存在“一次方”函数关系，就称他们之间存在线性关系。例如 y=a+bx
    y = ax^n(n!=1) 就不是线性回归
    
    有两个假设
        1. 假设数据x,y 成线性变化的
        1. 假设数据服从正态分布
