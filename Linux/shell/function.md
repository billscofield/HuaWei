
## 函数只能返回数字，如何返回字符串呢? 直接用 echo 变相来实现

```
get_str(){
    echo "string"
}

echo $(get_str)
```
