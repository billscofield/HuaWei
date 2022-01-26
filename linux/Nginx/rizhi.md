
/etc/logrotate.d/nginx

## 日志模块

模块名称: ngx_http_log_module

相关指令

    log_format
        log_format 名称 "$remote_addr ...";          // 定义日志格式, 下边的 Server 可以进行调用

    access_log
        access_log /var/log/nginx/access.log main;

    error_log

    open_log_file_cache
