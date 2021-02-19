
1. dc      Domain Component 
    域名的部分，其格式是将完整的域名分成几部分，如域名为example.com变成dc=example,dc=com（一条记录的所属位置）
1. uid     User Id 
    用户ID songtao.xu（一条记录的ID）
1. ou      Organization Unit 
    组织单位，组织单位可以包含其他各种对象（包括其他组织单元），如“oa组”（一条记录的所属组织）
1. cn      Common Name 
    公共名称，如“Thomas Johansson”（一条记录的名称）
1. sn      Surname 
    姓，如“许” 
1. dn      Distinguished Name 
    “uid=songtao.xu,ou=oa组,dc=example,dc=com”，一条记录的位置（唯一）
1. rdn     Relative dn 
    相对辨别名，类似于文件系统中的相对路径，它是与目录树结构无关的部分，如“uid=tom”或“cn= Thomas Johansson”

Directory   目录，用于存放信息的单元
Entry   条目，LDAP的基本信息单元
DN：Distinguished Name  条目中用于唯一区别该条目的信息
LDIF：LDAP Interchange Format   在RFC2849中定义的标准，用于规范LDAP的配置和目录内容等详细信息的保存，后续的例子中将会较多地使用LDIF进行增删改查的操作。

每个Entry都可以有多个属性，而每个属性都有特定的类型和一个或多个取值，比如cn（Common Name）就是一个属性
因为LDAP概念很多，这里会根据例子展开相关的最小程度的概念，更为详细的可以查看上文的RFC的文档。


OpenLDAP
    OpenLDAP的服务器本身，这个东西其实只相当于是一个mysql数据库，它是没有酷炫的图形界面的

phpLDAPadmin
    图形界面

PWM
    给用户提供一个修改密码的地方

yum install openldap openldap-clients openldap-servers

service slapd start


