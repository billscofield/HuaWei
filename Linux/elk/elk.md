
## ELK 日志采集分析框架

ElasticSearch   弹性的 [ɪˈlestɪk]       全文检索基于lucene
Logstash        日志数据收集采集框架
Kibana          报表展示工具，类似 echarts, 使用JS编写




基于 RESTful web 接口开发

全文检索的需求：因为数据库已经解决不了海量数据的快速查询，所以引入了全文索引

最原生的是 lucene, 经过封装出现 solr, solr 有个缺点，在建立索引的时候，搜索性能下降，后来出现 es，性能最高


非结构化数据查找方法
    1. 顺序扫描法
    1. 全文检索（Full-text Search）
        例如字典
        先建立索引，在对索引进行搜索的过程就叫做全文索引

        采集数据 
        创建索引
        用户搜索
        索引库


## ELK 日志协议栈

集中式日志系统

使用 Logstash 采集数据，存储到 ES 中，使用 Kibana 展示 ES 库中的

ElasticSearch 权威指南

2013年 Github 抛弃了 solr, 采用 ES 来做 PB 级的搜索

维基百科，采用 ElasticSearch

百度：
新浪：
阿里：

仅支持 json 文件格式


Relational DB   ->    Database  ->   table  ->  row       -> Column 
ElasticSearch   ->    Indexes   ->   Types  ->  Documents -> Field
