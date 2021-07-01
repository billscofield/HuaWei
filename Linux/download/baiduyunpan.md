
github 上搜索对应的 release
    https://github.com/qjfoidnh/BaiduPCS-Go

unzip BaiduPCS-Go-v3.5.3-linux-amd64.zip
chmod +x BaiduPCS-Go-v3.5.3-linux-amd64
cd BaiduPCS-Go-v3.5.3-linux-amd64


## 使用方法

1. 绑定账户

    ./BaiduPCS-Go login #普通登录绑定
    ./BaiduPCS-Go login -bduss=<BDUSS>  #BDUSS绑定，建议

2. 设置需要下载到的目录

    ./BaiduPCS-Go config set -savedir /home/Download  #下载文件的储存目录

3. 列出百度网盘中的文件

    ./BaiduPCS-Go ls

4. 设置最大并发量

    ./BaiduPCS-Go config set -max_parallel 150

5. 下载百度云目录

    ./BaiduPCS-Go cd /
    ./BaiduPCS-Go d 千锋PHP教学视频：基础知识精讲 &
