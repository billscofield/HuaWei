# podman
<!-- vim-markdown-toc GFM -->

* [运行时](#运行时)
* [podman 特点](#podman-特点)
* [安装](#安装)
* [配置](#配置)
    * [TOML(Tom's Obvious, Minimal Language) 配置语言](#tomltoms-obvious-minimal-language-配置语言)
    * [镜像源（仓库）配置](#镜像源仓库配置)
    * [配置文件](#配置文件)
        * [如何搭建本地镜像缓存？](#如何搭建本地镜像缓存)
        * [What is the differences between `registries` and `unqualified-search-registries`](#what-is-the-differences-between-registries-and-unqualified-search-registries)
* [](#)

<!-- vim-markdown-toc -->

## 运行时

Lxc
Runc
Pkt

OCI(Open Container Initiative) 开放容器倡议规范

## podman 特点

podman 有那些特点
- podman 允许用户在没有root权限的情况下运行容器
- 提供了与 daocker 兼容的指令
- 无守护进程
- systemctl 管理

模块化, 他的工具集包括:
- podman

    同 linux 内核交互

- buildah

    用来代理 docker build 作为容器镜像构建工具

- skopeo    容器镜像检查管理器, 从仓库上传下载管理

    用来代替 docker push, 用于在注册表和容器引擎之间移动容器镜像
- runc

    运行管理, 通过 runC 容器运行时进程而不是 daemon 来管理容器

- crun      可选

和 docker 的区别

## 安装

yum -y install podman

podman version

podman images

podman --help

## 配置

修改podman镜像源（podman默认的镜像拉取镜像地址第一个是红帽的，而且可能要都要涉
及到红帽的一个付费用户才行的，最后一个才是正儿八经的docker的镜像仓库的源，所以
把他这个顺序调整一下，把docker的镜像仓库的源调整到第一位置上去，如果不调整的话，
他装软件他会优先跑到上去，结果红帽的连接不上去，就会导致安装特别慢）

### TOML(Tom's Obvious, Minimal Language) 配置语言

GitHub 联合创始人 Tom Preston-Werner

TOML 是大小写敏感的

使用 `#` 表示注释

布尔值永远是小写
    true
    false

数组使用方括号包裹。空格会被忽略。元素使用逗号分隔。注意，不允许混用数据类型。

1. [table]

    用来定义“表”，表格（也叫哈希表或字典）是键值对的集合

    TOML 中表示键值对的集合，类似于字典，

    [table]（称为表头）单独一行出现，

    其下面（直到另外一个表头出现）的键值对都是这个表的键值对，如：

    ```
    [table-1]
    key1 = "some string"
    key2 = 123

    [table-2]
    key1 = "another string"
    key2 = 456
    ```

    嵌套表格
    ```
    [dog.tater]
    type = "pug"
    ```
    等价于如下的 JSON 结构：

    ```
    { "dog": { "tater": { "type": "pug"  }  }  }
    ```

2. [[array_of_table]]

    表数组

    “表数组”出现的时候，就顺带定义了它的第一个元素，

    后续再次出现这个“表数组”的时候，会在该“表数组”中创建新的元素，也就是说：

    ```
    [[products]] 
    name = "Hammer"
    sku = 738594937

    [[products]] # 数组里第二个元素：空表

    [[products]] # 数组里的第三个元素
    name = "Nail"
    sku = 284758393
    color = "gray"
    ```

    json 结构为：

    ```
    {
      "products": [
        { "name": "Hammer", "sku": 738594937 },
        { },
        { "name": "Nail", "sku": 284758393, "color": "gray" }
      ]
    }
    ```

3. [[ ]] 的 子表

    ```
    [[fruits]] 
    name = "apple" 

    [fruits.physical] # 子表 
    color = "red" 
    shape = "round" 

    [[fruits.varieties]] # 嵌套表数组 
    name = "red delicious" 

    [[fruits.varieties]] 
    name = "granny smith" 

    [[fruits]] 
    name = "banana" 

    [[fruits.varieties]] 
    name = "plantain"
    ```

    json 结构

    ```
    { 
      "fruits": [ 
        { 
          "name": "apple", 
          "physical": { 
            "color": "red", 
            "shape": "round" 
        }, 
          "varieties": [ 
            { "name": "red delicious" }, 
            { "name": "granny smith" } 
          ] 
        }, 
        { 
          "name": "banana", 
          "varieties": [ 
            { "name": "plantain" } 
          ] 
        } 
      ] 
    }
    ```

### 镜像源（仓库）配置

Podman 引入了一个 registry 的概念，

registry（注册表、登记处）就是多个容器镜像源（如，docker.io 就可以是其中之一）

在使用 podman pull 一个镜像的时候，如果镜像使用的是如下的写法，那么就会从指定的
仓库进行下载。

    `podman pull registry.access.redhat.com/rhscl/httpd-24-rhel7`

但是如果使用的是

    `podman pull httpd-24-rhel7`

的时候，也就是没有指明镜像源，会使用配置文件中定义的镜像仓库。

### 配置文件

1. 全局配置文件:/etc/containers/registries.conf

    ```
    [registries.search]
    registries = ['docker.io',''registry.access.redhat.com', 'registry.redhat.io']
    # 在前边添加 docker.io

    unqualified-search-registries = ["docker.io",""]
    ```

2. 用户单独配置文件：~/.config/containers/registries.conf

    The second version of the configuration format allows to specify registry 之前的全部注释掉

    ```
    unqualified-search-registries = ["docker.io"]
    [[registry]]
    prefix = "docker.io"
    location = "xxxxx.mirror.aliyuncs.com" # cr.console.aliyun.com, 为什么要搞一个私人的呢？公共的不行吗
    ```

    Example: Given
    ```
    prefix = "example.com/foo" # 别名
    location = "internal-registry-for-example.net/bar" # 真实地址
    ```

    **Requests for the image example.com/foo/myimage:latest will actually work with
    the internal-registry-for-example.net/bar/myimage:latest image.**

#### 如何搭建本地镜像缓存？

如何搭建镜像缓存(https://mirrors.ustc.edu.cn/help/dockerhub.html)

由于镜像站目前暂不为校外(ustc)提供容器镜像缓存服务，如果需要自行搭建本地镜像缓
存，可以参考以下的方式：

1. Redis 容器

```
docker rm -f redis
docker run \
    --name=redis \
    -itd \
    --net=docker-registry \
    --restart=always \
    redis \
    redis-server --maxmemory 512m
```

2. 镜像缓存容器

```
docker rm -f dockerhub-mirror
docker run -itd \
    --name dockerhub-mirror \
    --restart=always \
    --net=docker-registry \
    -v /srv/docker/dockerhub/data:/var/lib/registry \
    -v /srv/docker/dockerhub/config.yml:/etc/docker/registry/config.yml:ro \
    -p 127.0.0.1:5000:5000/tcp \
    --log-driver=journald \
    --log-opt tag="dockerd-dockerhub" \
    registry:2.5.1
```

`/srv/docker/dockerhub/config.yml` 的参考内容:

```
version: 0.1
log:
    level: error
storage:
    delete:
        enabled: true
    cache:
        blobdescriptor: redis
    filesystem:
        rootdirectory: /var/lib/registry
    maintenance:
        uploadpurging:
            enabled: false
http:
    addr: :5000
    debug:
        addr: localhost:5001
    headers:
        X-Content-Type-Options: [nosniff]
notifications:
    endpoints:
        - name: local-5003
          url: http://localhost:5003/callback
          headers:
              Authorization: [Bearer <an example token>]
          timeout: 1s
          threshold: 10
          backoff: 1s
          disabled: true
        - name: local-8083
          url: http://localhost:8083/callback
          timeout: 1s
          threshold: 10
          backoff: 1s
          disabled: true
health:
    storagedriver:
        enabled: true
        interval: 10s
        threshold: 3

proxy:
    remoteurl: https://registry-1.docker.io
    # 更换为上游的地址。

redis:
    addr: redis:6379
```


#### What is the differences between `registries` and `unqualified-search-registries`

In Podman, the /etc/containers/registries.conf file contains a list of
registries that Podman searches when looking for container images. The
registries configuration specifies the list of fully qualified registry names
that are used when searching for container images.

The unqualified-search-registries configuration, on the other hand, specifies
the list of registries that Podman searches for when an image name is not fully
qualified. For example, when you use docker pull hello-world or podman pull
hello-world, the unqualified-search-registries configuration tells Podman to
search for the hello-world image in the registries specified, using only the
image name without the registry path.

In summary, the difference between registries and unqualified-search-registries
is that registries is used for fully qualified image names, while
unqualified-search-registries is used to search for unqualified image names.



## 
