


私钥 -> 公钥

内容 + private -> 签名

签名 + 公钥 -> 内容


公钥 签名 内容 是公开的



任何内容(一个区块) 通过sha256算法 -> 加密的数据

101010110101010101011110111101111   这个区块的内容
000000000000010101011110111101111   目标值（挖矿的目标值）

得到这个目标值的内容是什么放到这个区块的底部,同时放到下一个区块的顶部, 构成了链接, 形成了链

如果出现了多条链， 我们只需信任最常的那条链