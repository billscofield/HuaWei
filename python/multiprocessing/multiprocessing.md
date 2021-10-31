

## multiprocessing


导入模块
创建子进程
开启子进程


1. 导入进程包

    import multiprocessing

1. Process进程类的说明

    Process([group[,target[,name[,args[,kwargs]]]]])

    1. group: 指定进程组，目前只能用 None
    1. target: 执行的目标任务名, 函数
    1. name : 进程名字
    1. args: 以元组形式传参
    1. kwargs: 以字典形式传参

    Process 创建的实例对象的常用方法

    1. start() 启动进程实例(创建子进程)
    1. join()  等待子进程执行结束
    1. terminated() 不管任务是否完成，立即终止子进程

    Process创建的实例对象的常用属性

    
