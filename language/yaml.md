## YAML

最开始叫 yet another markup language

后来叫 YAML Ain't Markup Language

key: value          会有类型猜测, 会有猜错的时候
    冒号后的空格是必须的

username: nick
age: 30

age: !!str 30                       强制为字符串
score: !!float 12.0                 强制为float
number: 1.32e+5
male: true
book: null
birthday: 1920-11-12 13:29:11 +8    日期时间



interest:
  - basketball                      数组，空格个数不限制，但是要求对齐, YAML 中不得使用tab键
  - football

``` 数组
hobbies:
- GNU
- LFS
- Debian


hobbies[0]=GNU
hobbies[1]=LFS
hobbies[2]=Debian
```





interest:
  - basketball                  数组，空格个数不限制，但是要求对齐, YAML 中不得使用tab键
  - football
    - Linux






interest:
  basketball: true              字典
  football: true
  Linux: true




friends:                        对象
  - name: fool
    age: 27
  - name: fool2
    age: 29


comment:
  简介简介简介简介简
  介简介简介简介简介简介简介简介


comment1: >
  简介简介简介简介简
  介简介简介简介简介简介简介简介        这里会有\n


comment1: |                             每一行都会有\n
  简介简介简介简介简
  介简介简介简介简介简介简介简介        




father: &father_info                    指针
  name: a
  age: 30

monitor: *father_info                   指向指针的


## YAML JSON XML

YAML 可扩展

YAML 2 JSON
嵌套不会很深，美观一些

