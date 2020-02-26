
## 瀑布式管理

```
需求分析
  ▲     |
  |     ▼
  ----- 方案设计
          ▲    |
          |    ▼
          ---- 实施编码
                  ▲   |
                  |   ▼
                  --- 测试/评估
                         ▲    |
                         |    ▼
                         ---- 维护
```

### 生存场景

1. 军工国防，基础软件居多，对软件品质要求严格
1. 软件以物理介质发行为主要途径
1. 软件售出后升级，修复的成本比较高
1. 行业竞争节奏相对平缓

后来发生了变化
    互联网兴起, B/S架构的应用成为主流
    软件的交付手段发生了重大变化，在线更新、网络下载
    各种各样的应用软件蓬勃发展（需求无限大）
    竞争速度越来越快

### 缺点

周期长
依赖于前期的需求分析，结果往往相差较大


## 敏捷开发

敏捷不是万能药，敏捷项目的失败率也一直居高不下

不论喜欢与否，**迭代开发**成为主流

敏捷的目的是为了快速交付有价值和质量的产品服务


### 研发项目常见问题

没有产品经理负责产品，往往是项目经理兼任, 代表的利益是不同的

做出来的功能不是用户真正想要的

产品不能按期交付

需求无休止的变更

...

对项目的估计偏于乐观，每月30天，每天8小时

1. 研发
    缺少统一的编码规范，或形同虚设
    架构不合理
    缺少安全和性能意识

1. 测试
    项目前期无法展开测试，测试人员只能等
    研发无法

1. 沟通

### 敏捷价值观

1. 交付
    目标是通过今早且持续地交付有价值的软件来满足客户
    欢迎对需求提出变更，即使是在项目后期
    不断交付可用的软件，周期越短越好（1-4周）
    可用的软件是衡量进度的主要指标
    倡导可持续的开发，形成开发、销售和客户稳定的节奏

1. 沟通
    业务人员和开发人员在一起工作
    激励项目团队，给他们所需要的资源，并信任他们
    最有效的沟通方法是面对面的交谈

1. 团队
    团队的敏捷性依赖于对技术、过程和架构持续的改进
    保持简洁，尽最大可能减少不必要的工作，着眼于当下的需求

Scrum 模型
    你有什么需求，随便提，需求库，从中选择几个来做，然后再做其他的

    是从橄榄球中采用 scrummage 这个词改变过来的

    在犯规后重新开始比赛的方法

    将交付成果 和 里程碑 分解成更小的部分，并让整个团队聚焦在一个目标上，直到完成

    实证性的工作更像是一个科学实验，不像工程建筑，

    你尝试一下，检查结果，如果它不工作，你尝试别的东西, 建造房屋可定不能这样


agile [ˈædʒaɪl]  Manifesto [ˌmænɪˈfestəʊ]   (敏捷宣言)



## 极限编程