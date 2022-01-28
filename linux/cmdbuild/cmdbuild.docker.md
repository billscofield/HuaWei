## cmdbuild docker

[link](https://wandouduoduo.github.io/articles/4fcc594d.html)

### 1. PostgreSQL

cmdbuild数据存储是在PostgreSQL中的，生产环境建议建立PostgreSQL数据库集群，这里
为单点。

docker pull postgres

docker run \
    --name pgsql \
    -p 5432:5432 \
    -e POSTGRES_PASSWORD=sunxu123 \
    -v /data/postgres:/var/lib/postgresql/data \
    -d \
    postgres:latest


如做迁移，需要导入数据。如新建可跳过这步。

    ```
    #复制备份文件到容器中
    docker cp ./cmdbuild_db_dump_2018-07-13.sql pgsql:/tmp/
    # 进入容器后操作
    docker exec -it pgsql /bin/bash
    # 进Postgresql账号
    su postgres
    # 建库
    createdb -O postgres cmdbuild
    # 导数据
    psql -U postgres -d cmdbuild < /tmp/cmdbuild_db_dump_2018-07-13.sql
    # 退出容器
    ```


### 2. cmdbuild 安装

1. 拉取镜像

    docker pull quentinv/cmdbuild

2. 启动容器

    docker run --name cmdbuild -p 8080:8080 -d quentinv/cmdbuild

