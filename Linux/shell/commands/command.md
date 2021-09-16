无视shell脚本中的“同名”函数，执行特定的命令


```SHELL
a.sh
#!/usr/bin/env bash

function ls(){
    echo "this is a sh file"
}

ls

command ls
```
