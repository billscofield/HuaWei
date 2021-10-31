python2 中 bytes 和 str 一样，python3 中不一样了
    文本和二进制做了明确的区分
    '￥'.encode('utf8')
    b'xxx'.decode('utf8')

    .encode() 和 .decode() 好像都有默认的格式utf8

    socket中必须通过bytes格式


set
    # 交集 &
    set_a.intersection(set_b)
    set_a & set_b

    # 并集 |
    set_a.union(set_b)
    set_a | set_b

    # 差集,a有，b没有的 -
    set_a.difference(set_b)
    set_a - set_b

    # 子集 <
    set_a.issubset(set_b)
    set_a < set_b

    # 父集 >
    set_a.issuperset(set_b)
    set_a > set_b
    
    # 对称差集(并集 - 交集) ^
    set_a.symmetric_difference(set_b)
    set_a ^ set_b

    # .isdisjoint()
    没有交集返回True


    # 添加
    set_a.add(1)
    set_a.update([1,2,3])

    # 删除
    set_a.remove(x) //没有这个元素会报错,不返回值
    set_a.discard(x)    //没有这个元素不会报错,不返回值
    set_a.pop() //随机删除一个，没有元素的话会报错
    


    ''' 作死
    def say():
        global name
        name = 'xian'
    print(name)     //输出 xian

    '''


decorator针对线上运行的代码进行无风险，透明的功能增加
