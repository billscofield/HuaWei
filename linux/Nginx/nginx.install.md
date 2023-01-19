
debian
    apt install pcre2-utils
    apt-get install libpcre2 libpcre2-dev
    apt-get install libpcre3 libpcre3-dev

    apt install libssl-dev
    apt install openssl




    1. ./configure
        --prefix=PATH
        --with-http_ssl_module


        /nginx-1.22.0/objs 目标文件
            /nginx-1.22.0/objs/ngx_modules.c    编译时，哪些模块会编译


    2. make

    3. make install


## modules

1. autoindex
    location / {
        autoindex on;
    }

2. ngx_http_core_module

    $limit_rate
        setting this variable enables response rate limiting; 

3. log
    
    定义某个日志格式
        
        log_format main '$remote_addr - $remote_user [$time_local]';
            这些变量是 ngx_http_core_module 等模块中的变量
            请查阅 http://nginx.org/en/docs/http/ngx_http_core_module.html#limit_rate

            $gzip_ratio


        server 中引用日志格式
            access_log logs/bitbeings.com main;

4. ngx_http_proxy_module

    http {
        proxy_cache_path proxy_cache_path levels=1:2 max
                         缓存目录

        server {
            ...
            location /{
                proxy_cache my_cache;
                proxy_cache_key $host$uri$cookie_user;
                proxy_cache_valid 
            }
        }
    }

    proxy_cache_valid
        Sets caching time for different response codes. For example, the following directives

        proxy_cache_valid 200 302 10m;
        proxy_cache_valid 404      1m;
        set 10 minutes of caching for responses with codes 200 and 302 and 1 minute for responses with code 404.

5. ngx_http_ssl_module

```
server {
    listen              443 ssl;
    keepalive_timeout   70;

    ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers         AES128-SHA:AES256-SHA:RC4-SHA:DES-CBC3-SHA:RC4-MD5;
    ssl_certificate     /usr/local/nginx/conf/cert.pem;
    ssl_certificate_key /usr/local/nginx/conf/cert.key;
    ssl_session_cache   shared:SSL:10m;
    ssl_session_timeout 10m;

    ...
}
```

    ssl on | off;
    ssl_certificate_key file;

