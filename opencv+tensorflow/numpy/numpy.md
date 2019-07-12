
## 

pass_file = numpy.genfromtxt('文件名',delimiter='分隔符',dtype=str)

print(type(pass_file))  -> numpy.ndarray

print(pass_file)



## numpy.array
vector = numpy.array([2,4,6,8])   就是numpy.ndarray

print(vector.shape)
    形状, 如 
(3,) ??? 一维数组是3行?
    单行数据显示(列数,)
    单列数据显示正常
        单行单列显示(列数,)
    多行多列显示正常

vector.dtype -> dtype('int64')
print(vector.dtype)


取数据
    [3]     第三行
    [:3]    前三行  [:3]
    [:,2]   全部行  第二列
    [:,2:5] 全部行  [2:5]列

    **行和列之间用 ',' 分割,冒号还是切片**
    [1:3,2,4]   [1:3]行,[2:4]列



都必须是同一类型的
有一个是 float 就都转成 float
有一个是 str 就都转成 str

matrix == 7
    会返回 boolean 形式矩阵,这也是一个索引,可以返回元素值

    ```
    boolean matrix 索引
    one = [
        [1,2,3],
        [4,5,6],
        [7,8,9]
    ]

    index = (one == 6)

    print(one[index]) 输出[6]

    二、 取第1列那一行为 True 的数据
    second_column_8 = (one[:,1]==8)
    print(second_column_8) ->[False False True]
    print(one[second_column_8,:])   -> [[7 8 9]]

    也可以自定义
    bill = [True, False, False] -> 一个True 返回一行
    bill = [True,True, False]   -> 两个True 返回两行

    
    三、& 和 |;  没有'and',没有'or'
    equal_5_and_10 = (vector == 5) & (vector == 10)   不可能
    equal_5_and_10 = (vector == 5) | (vector == 10)
    

    四、类型转换
    vector = ["1","2","3"]
    print(vector.dtype)

    vector.astype(float)    as
    print(vector.dtype)


    五、求和
    vector.sum(axis = 1)    每一行各自求sum
    vector.sum(axis = 0)    每一列各自求sum
    
    六、reshape
    np.arange(15)        创建一个15[0,15)个元素的一维matrix
    np.arange(15).reshape(3,5)  行,列


    ndim属性，1维 2维 3维
              1   2   3

    size属性 元素个数

    初始化一个全为0 或1的矩阵
    np.zeros((3,4))
    np.zeros((3,4),dtype=np.int32)

    np.ones((2,3,4),dtype=np.int32)
    np.ones((2,3,4),dtype=np.str)

    
    np.arange(start,max,step)  ＋step


    随机
    np.random.random(2,3)   2行3列矩阵  (-1,1) 之间

    np.linspace(start,end,) 

    ```



## 函数
1. .genfromtxt(skip_header,skip_footer,还有很多参数)

## 帮助
    help(np.genfromtxt)
