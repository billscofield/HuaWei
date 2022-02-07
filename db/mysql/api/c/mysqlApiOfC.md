
/usr/include/mysql/mysql.h

C APIs包含在mysqlclient库文件当中，与MySQL的源代码一块发行，用于连接到数据库和
执行数据库查询

gcc main.c -o main -l mysqlclient

1. 获取mysql客户端的版本号
    
    ```
    #include <mysql/mysql.h>
    printf("Version:[%s]",mysql_get_client_info());
    ```

1. MYSQL

    ```
    MYSQL *conn;    //声明一个conn指针指向一个MYSQL结构体，这个结构体就是一个数据库连接句柄。

    conn = mysql_init(NULL);    // 函数mysql_init将返回一个链接句柄。

    mysql_real_connect建立一个到mysql数据库的链接。

    函数mysql_query执行sql语句，在本示例中，将建立一个新的数据库。

    mysql_close(conn);
    ```





1. MYSQL

```
typedef struct st_mysql {
    NET         net;                    /* Communication parameters */
    void  *unused_0;
    char *host,*user,*passwd,*unix_socket,*server_version,*host_info;
    char *info,*db;
    const struct ma_charset_info_st *charset;      /* character set */
    MYSQL_FIELD *fields;
    MA_MEM_ROOT field_alloc;
    unsigned long long affected_rows;
    unsigned long long insert_id;               /* id if insert on table with NEXTNR */
    unsigned long long extra_info;              /* Used by mysqlshow */
    unsigned long thread_id;            /* Id for connection in server */
    unsigned long packet_length;
    unsigned int port;
    unsigned long client_flag;
    unsigned long server_capabilities;
    unsigned int protocol_version;
    unsigned int field_count;
    unsigned int server_status;
    unsigned int server_language;
    unsigned int warning_count;          /* warning count, added in 4.1 protocol */
    struct st_mysql_options options;
    enum mysql_status status;
    my_bool     free_me;                /* If free in mysql_close */
    my_bool     unused_1;
    char                scramble_buff[20+ 1];
    /* madded after 3.23.58 */
    my_bool       unused_2;
    void          *unused_3, *unused_4, *unused_5, *unused_6;
    LIST          *stmts;
    const struct  st_mariadb_methods *methods;
    void          *thd;
    my_bool       *unbuffered_fetch_owner;
    char          *info_buffer;
    struct st_mariadb_extension *extension;

} MYSQL;
```


1. mysql_init

```
MYSQL *         STDCALL mysql_init(MYSQL *mysql);
```


1. mysql_real_connect

```
MYSQL *         STDCALL mysql_real_connect(
    MYSQL *mysql,
    const char *host,
    const char *user,
    const char *passwd,
    const char *db,
    unsigned int port,
    const char *unix_socket,
    unsigned long clientflag);

```
