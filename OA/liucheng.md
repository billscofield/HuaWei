
## 创建表单

### 表单的创建或引用

流程引擎 》表单管理 》新建
    数据库表名：formtable_main_145

    明细表表名：formtable_main_145_dt2

    添加字段

    公共选择框维护地址：流程引擎》表单管理》公共选择框维护

    两个选择框进行关联，比如带薪假
        带薪假字段 》选项维护》关联子字段(会请你从本表单中的选择框字段中选择)》子字段选项(根据是否带薪假进行设定即可)

    [时间] 和 [日期] 分开的浏览按钮 可以进行计算，[日期时间] 浏览按钮 不可以进行计算

    单行文本框-金额转换：自动转换为大写

    特殊字段-自定义链接
    特殊字段-描述性文字


    行字段规则：明细表中单行数据的计算, 例如 明细字段中有 [总价]、[单价]、[数量] 字段时就可以这么用
        结果在前
    
    列字段规则: 明细表中哪些字段要进行列汇总，并可以赋值给主表中数字类型的字段


### 路径

可以新建路径类型

选择上一步中的自定义表单

审批可以退回
提交不可以


非会签
会签
依次逐个处理


一个操作组中
    两行操作者都是会签, 多行操作者【批次】相同时，则是非会签关系，

---

    多个操作组才是会签关系

---

    一行里边是两个人呢？

    一行以内根据会签属性来定，一个操作组内根据批次来定，一个节点是会签
        

---

    一个操作组内，两个批次:
        从批次最小的开始检测，检测操作者是否有效，直至找到有效地审批人即停止
        用来兜底

    一个操作组内，同样的批次：
        就是非会签
        


    抄送类的会签属性在归档节点是会发起待办的





    转发
    传阅
        传阅后通知

    转办：流程的审批人变成了其他人
    意见征询:审批人未变，可以结束征询
    流转设定: 节点操作者自主选择加塞审批者,然后进入下一节点


    节点前附加操作：只能做固定字段的赋值
    节点后附加操作：还可以做两个字段的运算
        归档节点的节点后附加操作永远实现不了


    前标题:【流转设置】【节点信息】【三个点】只在待办信息里边显示，标题前附加【（标题内容）】
    主标题: 表单内的标题,【基础设着】【功能设置】【使用默认标题】
    后标题: 同前标题，显示当前表单中的某个字段，9版本才有


    签字意见设置:【节点信息】【三个点】
        仅退回必填



   【启用流程超时功能】：流程引擎 -> 应用设置

    记录表单修改日志 【基础设置】【功能设置】【记录表单修改日志】
        在流程中右键【表单日志】

       【新建流程可导入表单内容】
            右键-> 导入流程
            适合周期性的流程

       【不需同步字段】
            创建字段同步所有节点时, 哪些字段不同步值

        附件大小：内容引擎中选中目录进行设置

    导出xml ：测试服务器，导出进生产服务器


#### 分叉

分叉结束点
    1. 通过分支数合并
    1. 指定通过分支合并（会出现选择，哪些必须通过）
    1. 比例合并  通过分支数/分支数综合=比例


