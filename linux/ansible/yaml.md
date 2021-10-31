
# YAML

特点
    hash 为注释

    .yml    。yaml

    文件以 --- 开始, 以 ... 结束, 但是是可选的


基本语法
    1. 大小写敏感
    2. 缩进表示层级关系(几个未做规定,建议空格)
    3. 统计元素要对齐

数据结构
    1. 字符串
    2. 列表
    3. 字典


    
1. 可以不使用引号，即使里边有空格的时候; 单引号，双引号也没有错

    ```
    this is a string
    'this is a string'
    "this is a string"

    ```
2. 换行

    | 或者 >

3. 列表

    以短横线开头 加空格加 具体的值

    ```
    - red
    - blue
    - green

    等价于
    ['red', 'blue','gree']
    ```

4. 字典

    key:空格 value      有没有引号无所谓
    name: using ansible
    age: 29

    等价于
    {'name': 'using ansible', 'age': 29}

5. 混合结构


```
    ---
    class:
        - name: stu1
          num: 001
        - name: stu2
          num: 002
    ...

    等价于
        {'class':[{'name': 'stu1','num': 001},{'name': 'stu2','num': 2}}

```


验证 YAML 语法

    python -c 'import yaml,sys; print yaml.load(sys.stdin)'< myyaml.yml
    python -c 'import yaml,sys; print yaml.safe_load(sys.stdin)'< myyaml.yml
    python3 -c 'import yaml,sys; print(yaml.load(sys.stdin))'< myyaml.yml

    pip3 install pyyml
