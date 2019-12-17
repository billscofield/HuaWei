## requests

pip install requests


baidu = requests.get('https://www.baidu.com')
print(baidu.encoding)
print(baidu.status_code)
baidu.encoding = 'utf8'

badiu.headers
print(baidu.text)


    ```
    r = requests.get(url,params=None,**kwargs)       //返回Response对象
    r.status_code           //http请求的返回状态,200成功

    r.text                  //http相应内容的字符串形式,即url对应的页面
    r.encoing               //从http header中猜测的响应内容编码方式 
        如果header中不存在 charset, 则认为编码为 ISO-8859-1
        通常将  r.encoding = r.apparent_encoding
    r.apparent_encoding     //从内容中分析出的响应内容编码方式(备选编码方式) 这个更准确(看源码)

    r.content               //http相应内容的二进制形式   
    ```



## 爬取网页 通用代码框架

requests.ConnectionError
requests.HTTPError
requests.URLRequired
requests.TooManyRedirects
requests.ConnectTimeout
requests.Timeout





r.raise_for_status()        //如果不是200，引发HTTPError异常
