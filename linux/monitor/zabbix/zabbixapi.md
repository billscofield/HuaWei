
## Based on 6.0

Zabbix API 是基于 Web 的API，作为 Web 前端的一部分提供。它使用 JSON-RPC 2.0 协
议

大多数API至少包含四种方法：get,create, update 和 delete ，分别是检索，创建，更
新和删除数据，但是某些API提供一套完全不同的方法。

当完成了前端的安装配置后，你就可以使用远程HTTP请求来调用API。为此，需要向位于前
端目录中的 api_jsonrpc.php 文件发送 HTTP POST 请求

```
POST http://example.com/zabbix/api_jsonrpc.php HTTP/1.1 
Content-Type: application/json-rpc 

{
  "jsonrpc": "2.0",
  "method": "apiinfo.version",
  "id": 1,
  "auth": null,
  "params": {}
}
```

请求的 Content-Type 头部必须设置为以下值之一：
    application/json
    application/json-rpc
    application/jsonrequest。



## 示例工作流

### 1. 认证

在访问 Zabbix 中的任何数据之前，你需要登录并获取身份认证 token。这可以使用
user.login 方法完成。我们假设你想要以标准 Zabbix Admin 用户身份登录。那么，你的
JSON 请求将如下所示：

```
{
    "jsonrpc": "2.0",
    "method": "user.login",
    "params": {
        "user": "Admin",
        "password": "zabbix"
    },
    "id": 1,
    "auth": null
}
```

jsonrpc - API 使用的 JSON-RPC 协议的版本; Zabbix API 实现的 JSON-RPC 版本是2.0；
method - 被调用的 API 方法；
params - 将被传递给API方法的参数；
id - 请求的任意标识符；
auth - 用户认证 token；因为我们还没有，它被设置为 null。

如果你正确提供了凭据，API 返回的响应将包含用户身份认证 token：

```
{
    "jsonrpc": "2.0",
    "result": "0424bd59b807674191e7d77572075f33",
    "id": 1
}
```

响应对象包含以下属性：

    - jsonrpc - JSON-RPC 协议的版本；
    - result - 方法返回的数据；
    - id - 对应请求的标识符。

## 2. 检索主机


