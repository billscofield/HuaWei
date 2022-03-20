
## 注释

```

1. 单行 //

2. 单行 #

3. 多行

    ```

    ```

```

变量**区分大小写**

### 可变变量

```
$name="bill";
$bill='hello world';
echo $name;
echo $$name;
```

### 变量的引用赋值

```
$name = 'hello';
$newname = $name;           // 普通变量赋值

$newname = &$name;          // 引用变量赋值

```

### 变量类型

var_dump($a)

基础数据类型
    int
        二进制: $numa = 0b1111;
    float
        不区分单双精度，都是双精度
        科学计数法
    string
        涵盖字符
        单双引号
            单引号,不解析变量, 但是可以转义字符和本身
            
            需要使用 pre 看效果
            
            echo "my name is {$name}!!!"
            
            字符串连接
                echo "Hello".$name;
            
            尽量简单的
        定界符
            $a = <<<liu
                xxx
            liu;
            
            会解析变量，转义字符
        var_dump 返回字节数

    boolean
        true/false
        不区分大小写: True/TRUE
        
        **echo 输出 true 为 1， false 输出空(没有输出)**

        flase:
            null
            0
            0.0

            ''
            '0'

            []          // 空数组
            object      // 对象都为真
            resource    // resource 都为真

        is_bool($a);

复合数据类型
    array
        $a = [1,2,3,4,5,"hello"];
        $a = array(1,2,'nihao',true);

    object(类)
        ```
        class Person{
            var $name = 'liujaio';
                var $gender = "boy";
                function say(){
                        echo "my name is $this->name, i am a $this->gender";
                            
                }
                
        }
        $liujiao = new Person;
        $liujiao->say();
        ```

特殊数据类型
    resource
        php程序之外的任何东西
        $file = fopen("./top.html",'r');
        var_dump($file);

    null
        unset($a);
        isset($a);
            false:
                未定义
                null
                unset

    empty()
        0
        0.0
        false

        ''
        '0'

        []          // 空数据
        null

        对象和资源都不为空

### 类型转换

1. 获取类型
    
    gettype($a);
        float 的返回值是 double
        integet             is_integer()
        double              is_float() / is_double()
        string              is_string()
        boolean             is_boolean()

        array               is_array()
        null                is_null()
        resource            is_resource()
        object              is_object()


        is_scalar()         标量
        is_numeric()        包含 integer 和 float/double 还有**纯的数字字符串**

2. 自动类型转换

    仅作用于标量

    1. 数学运算

    2. 判断
        if($a > '110a'){
            echo "$a is bigger";
        }

    3. boolean
        true:1
        false:0

3. 强制类型转换

    1. 语言结构
        $a = 123;
        $b = (string)$a;
        (object)
        
        (resource)          错误, 不能转换
        (null)              错误, 不能转换

    2. 相应的函数
        
        strval()
        intval()
        floatval()

        settype($a,float);  返回成功与否, 
            settype($a,boolean);

            resource 依然不可以

    3. 通用


### 常量

不能使用变量提示符

两种声明方式

尽量大写

7.3 之后的值可以是除了对象类型之外的任意类型，之前的只能是标量

1. define
    
    define('xxx', 'zhangsan');      // 7.3 之前有第三个参数，不区分大小写，默认为 false
    echo xxx;

    一般在页面中用这个


2. const
    
    const NAME = "ABC";

    一般在类中声明


3. 系统魔术常量

    __FILE__        当前文件的绝对路径文件名
    __LINE__        当前行
    __FUNCTION__    当前函数名
    __CLASS__       当前类名
    __METHOD__      当前方法, 输出如 Person::say

    constant(常量); 获取常量值
    constant($a);   获取常量值      //!!!
        ```
        const NAME = "Liu Jiao";
        echo NAME;                  // Liu Jiao
        
        $a = 'NAME';
        echo $a."\n";               // NAME
        
        $b = constant($a);
        echo $b;                    // Liu Jiao
        ```

    get_defined_constants()     // 页面中所有的常量的数组
        
        M_PI    圆周率

    defined(XXX)                // 是否定义了 XXX 这个常量

### 运算符

1. 算数运算符
    +
    -
    x
    /
    %
    ++
    --

    {} 不能在这用, 只能用于字符串中

    ++ 和 -- 对 boolean 无效，true 还是1
    ++ 和 -- 对 null 无效

2. 字符串运算发

    .

3. 赋值运算符
    
    =
    +=
    -=
    x=
    /=
    %=
    

4. 比较运算符
    ==          // '2' == 2;    true
    ===         // '2' === 2;   false
    !=
    !==

    <=>         // a-b>0 ? 1 : -1

    >
    >=
    <
    <=

5. 逻辑运算符
    
    &&

    ||

    !

    xor     // 异或, 如果 $x 和 $y 有且仅有一个为 true，则返回 true。 不是位运算的 xor

    and or not 的优先级比较低

6. 位运算

    1. &

    2. | 

    3. ^(异或)

    4. >> 

    5. <<

    6. ~(按位非)

7. 错误抑制符

    echo @$name;

8. 三元运算符

    条件 ? expression1 : expression2

    $name = isset($name) ? $name : 'mingzi';

9. null

    null 合并运算

    $result = $gender??'girl';

    如果设置了 $gender 就赋值 result 为 $gender, 否则赋值 result 'girl'

    $age ??= 20;

    如果没有设置 $age, 则赋值 20

    $res = $a ?? $b ?? $c ?? $d ?? "final value";


10. 反引号

    执行系统命令

    var_dump(`ls -l`);




### 流程控制

1. 循环


2. 分支

    else if 可以写成 elseif

---

    switch($score){
    case 100:                   // 这里竟然还可以写分号!!!
        echo "100";break;
    default:
        echo "no";
    }

---

mt_rand(1,100)              // [1,100] 随机数

3. 其他语句
    
    1. break
        break 1; 退出一层循环
        break 2; 退出两层循环

    2. continue
        continue 1;
        continue 2;

    3. goto
        同一个文件，
        同一个类
        同一个函数

        ```
        label:
            echo "hello";
        goto label;
        ```

### 未看

https://www.bilibili.com/video/BV1Yt4y1Y7vF?p=20&spm_id_from=333.880.my_history.page.click

20 21 22 23 24 25

### 数组

$name['a'] = 'A';
$name['b'] = 'B';

$name = array('zhangsan','boy',30);     // 索引数组
$name = array('name'=>'zhangsan','gender'=>'boy','age'=>30);    // 关联数组
$name = array(1=>'zhangsan',2=>'boy',3=>30);
$name = array('zhangsan','gender'=>'boy',3=>30);        // 混合数组

---

$arr = ['zhangsan','lisi','wangwu'];
$arr = ['name1'=>'zhangsan','name2'=>'lisi','name3'=>'wangwu'];
$arr = ['zhangsan','name2'=>'lisi',5=>'wangwu'];

---

$arr[] = 'a';
$arr[] = 'b';
$arr[] = 'c';
$arr[] = 'd';
$arr[] = 'e';

---

$arr['a'] = 'a';
$arr['b'] = 'b';
$arr['c'] = 'c';
$arr['d'] = 'd';
$arr['e'] = 'e';


//格式1
foreach (array_expression as $value){
    statement
}

//格式2
foreach (array_expression as $key => $value){
    statement
}

#### 数组的操作

1. 增


2. 删
    unset($name[0]);

    然后添加元素下标同mysql

    删除数组
        unset($arr);

    清空
        $arr = [];
        $arr = array();

3. 改

4. 查


var_dump($arr);     // 会输出类型信息
print_r($arr);      // 不会输出类型信息
不可以用 echo 直接输出




#### 数组的遍历

数组长度函数: count()
    count($arr);

1. 一维索引数组



2. 二纬数组




#### 分页

array_slice($arr,offset:0,length:3,preserve_keys:true);

    ``` 分页程序
    <?php

    $arr = array(
        array('id'=>1,'name'=>'1zhangsan','gender'=>1,'age'=>23),
        array('id'=>2,'name'=>'2lisi','gender'=>1,'age'=>24),
        array('id'=>3,'name'=>'3alice','gender'=>0,'age'=>21),
        array('id'=>4,'name'=>'4boy','gender'=>1,'age'=>21),
        array('id'=>5,'name'=>'5juce','gender'=>0,'age'=>25),
        array('id'=>6,'name'=>'6tom','gender'=>1,'age'=>22),
        array('id'=>7,'name'=>'7bill','gender'=>1,'age'=>24),
        array('id'=>8,'name'=>'8tomy','gender'=>1,'age'=>24),
        array('id'=>9,'name'=>'9wood','gender'=>1,'age'=>24),
        array('id'=>10,'name'=>'10dragon','gender'=>1,'age'=>25),
        array('id'=>11,'name'=>'11liming','gender'=>1,'age'=>20),
        array('id'=>12,'name'=>'12helo','gender'=>0,'age'=>27),
        array('id'=>13,'name'=>'13will','gender'=>1,'age'=>23),
    );

    # 起始点, 长度
    # 起始点 = 第n页 * 每页个数
    # 每页个数 = 总个数 / 要分几页, 手动指定为3
    # 第n页：(n-1) * 3
    echo '<form>';
    echo 'nth: <input type="text" name="nth">';
    echo '<input type="submit">';
    echo '</form>';

    $nth = $_GET['nth']-1;

    echo '<hr/>';
    echo $nth;
    echo '<hr/>';


    $new = array_slice($arr,$nth * 3,3,true);

    echo '<pre>';
    #var_dump($new);
    print_r($new);
    echo '</pre>';

    echo '<table border="1" width="900">';
    for($i = $nth*3; $i < $nth*3+3; $i++){
        echo '<tr>';
        foreach($new[$i] as $key=>$val){
            echo '<td>'.$val.'</td>';
        }
        echo '</tr>';
    }

    echo '</table>';
    ```
