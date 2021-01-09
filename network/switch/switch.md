
## 交换机架构

ingress	英[ˈɪnɡres] 美[ˈɪnɡres]
    n.	进入; 进入权; 入境权;

egress 英[ˈiːɡres] 美[ˈiːɡres]
    n.	外出; 离开;





### Full-Mesh 交换架构

   业务线卡        背板

    +----+     +------------+
 -> |    |     |            |
    |LC#1|-----|------+     |
 <- |    |-----|--+   |     |
    +----+     |  |   |     |
               |  |   |     |
    +----+     |  |   |     |
 -> |    |-----|--+   |     |
    |LC#2|     |      |     |
 <- |    |-----|--+   |     |
    +----+     |  |   |     |
               |  |   |     |
    +----+     |  |   |     |
 -> |    |-----|--+   |     |
    |LC#3|-----|------+     |
 <- |    |     |            |
    +----+     +------------+



所有业务线卡通过背板走线连接到其它线卡，因为 Full-Mesh 不需要外部的交换芯片，而是任意两个节点间都有直接连接，故得名全连接。

由于各线卡需要 Full-Mesh 互联，一个节点数为 N 的 Full-Mesh，连接总数为【N×(N-1)】÷2，所以随着节点数量增加连接总数也急剧上升，
因而可扩展性较差，仅适用于槽位数量较少的核心设备。


### Crossbar 矩阵交换架构

https://wenku.baidu.com/view/7481bf2d4b73f242326c5f04.html

https://www.tutorialspoint.com/telecommunication_switching_systems_and_networks/telecommunication_switching_systems_and_networks_crossbar_switching.htm











### 基于 Cell 的 CLOS 交换架构
