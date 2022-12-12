

yum install -y python3
pip3 install requests

```
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import requests
import json
import sys
import os

headers = {'Content-Type': 'application/json;charset=utf-8'}
api_url = "https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=2f829cdd-6bfb--a3fe-34dc4bcec40b" #这就是先前的webhook地址
def msg(text):
    json_text= {
     "msgtype": "text",
        "text": {
            "content": text
        },
    }
    print requests.post(api_url,json.dumps(json_text),headers=headers).content

if __name__ == '__main__':
    text = sys.argv[1]
    msg(text)
```




提示“/tmp/weixin.log” 脚本运行会生成一个日志文件，删掉即可。
