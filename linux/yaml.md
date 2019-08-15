
YAML ain't Markup Language

## 编写规则
1. 区分大小写
1. 使用缩进表示层级关系


## 注释 
    ```
    #
    ```
键值对
    键: 值

    键:
        - 键: 值    (若干个并列的键值对)

    键:
        - 值(list)
        - 值(list)
        - 值(list)
        - 值(list)

不能用tab键,要使用两个空格

## 字符串
```
正常情况下字符串不用写引号
str: 这是一行字符串
# 字符串内有空格或者特殊字符时需要加引号
str: '内容： 字符串'
```

## NULL
```
null
# conf.yml
parent: ~
.yml 中 ~ 表示 null，转换为 json 为：

{ "parent": null  }
```
