
## es + kibana

1. es 暴露的端口很多

1. es 十分耗内存

1. es 的数据一般需要放置到安全目录! 挂载

1. --net somenetwork 网络配置

docker run -d --name elasticsearch -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:7.6.2

docker stats 容器

-e 修改环境, 增加内存限制

    docker run -d --name elasticsearch -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e ES_JAVA_OPTS="-Xms64 -Xmx512m" elasticsearch:7.6.2



