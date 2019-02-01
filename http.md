# HTTPЭ��
https://www.bilibili.com/video/av33617468?p=2

## httpЭ������״̬Э��
ͬһ���ͻ��˵���������֮��û���κι�ϵ���ӷ������ĽǶ���˵������֪����������������ͬһ���ͻ��ˡ�
�Ͳ�������ʷ�����й�ϵ����ʱ�����绷���ȽϲӲ���豸Ҳ�Ƚϲ��Ҫ�������Ϸ���û�н���������

## COOKIE
ʹ��COOKIE�����httpЭ����״̬��ȱ��    

1. ��ֵ����Ϣ
1. �����ÿ�η�������ʱ�������COOKIE����������
1. ��һ��client && server �������ݵļ���
1. server����ͨ���ж���Щ��Ϣ����ȷ����������Ƿ��֮ǰ�������й�ϵ
1. һ����˵cookie��Ϣ���ڷ����������ɣ����ظ��ͻ��˵�
1. �ͻ��˿����Լ�����cookie��Ϣ
1. ���ܿ���
1. ���ı��棬���Ĵ���


1. û�н�����ݰ�ȫ������

## URL (uniform resource locator ͳһ��Դ��λ��)

```
schema://host[:port#]/path/.../[;url-params][?query-string][#anchor]

schema://host[:port#]/path/.../[?query-string][#anchor]

?query-string   ��ѯ�ַ���
    1. ? ������ǲ����ˣ�key=value
    1. & �����ָ���

```

1. schema
    1. http
    1. https
    1. ftp
    1. file
    1. mailto





## session

Response Headers
Request Headers

```
COOKIE:
_ga=GA1.2.431673896.1540965504; 
_gid=GA1.2.1002287600.1548811242; 
Hm_lvt_3eec0b7da6548cf07db3bc477ea905ee=1548661018,1548811241,1548895697; 
Hm_lpvt_3eec0b7da6548cf07db3bc477ea905ee=1548895702
```



## HTTP ��Ϣ

Request
            1. ���� 
            1. ·��
            1. Э��Ͱ汾
            1. CRLF �س����з�

Response

����
    ���󷽷�
        GET
        POST
        HEAD

    1. get
        **���󷽷�   ����·��   Э�鼰�汾CRLF(�س�����)**

        GET / HTTP/1.1
    
        ```
        GET /w/6/b/b.php?i=08pl9s6reeg&t=pm6mgj HTTP/1.1
        Host: ra.revolvermaps.com
        Connection: keep-alive
        User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36
        Accept: */*
        Referer: http://ra.revolvermaps.com/w/8/a/a2.php?i=08pl9s6reeg&m=0&c=ff0000&cr1=ffffff&f=arial&l=33
        Accept-Encoding: gzip, deflate
        Accept-Language: zh-CN,zh;q=0.9

        �����Chrome�����>Network>Request Headers>view source
        https �� http �����ԣ���Щ��Դ��view sourceѡ���Щû�У����Լ���
        ```
        
        get��������Ķ��������� request headers �еĵ�һ��,�� GET /...  HTTP1.1

        û��request body
        
    1. post
        
        ```
        POST /w/6/b/b.php?i=08pl9s6reeg&t=pm6mgj HTTP/1.1       //����е� /w/6/b/b.php?i=08pl9s6reeg&t=pm6mgj  �в�ѯ�ַ���
        HOST: 127.0.0.1:9999
        content-length:26
        content-type: application/x-www

        age=58&weight=80&height=170     //�����

        Ӧ���Ƕ���ת��get�ˣ�

        ```
        
        

    1. HEAD
        ��GET���ƣ�������������Ϣ���ģ�������
   
��Ӧ 
    һ����body 

    header 
        **Э�鼰�汾  ״̬��  ״̬˵��**
        
        ```
        HTTP/1.1 200 OK
        Accept-Ranges: bytes
        Cache-Control: max-age=315360000
        Content-Length: 7877
        Content-Type: image/png                     (MIME�ĵ�����)
        Date: Wed, 23 Jan 2019 00:57:40 GMT
        Etag: "1ec5-502264e2ae4c0"
        Expires: Sat, 20 Jan 2029 00:57:40 GMT
        Last-Modified: Wed, 03 Sep 2014 10:00:27 GMT
        Server: Apache
        ```
        
        ״̬��
            1xx ��ʾ��Ϣ����ʾ�����ѱ��ɹ����գ���������
            2xx ��ʾ������Ӧ
                200 ������������ҳ����
            3xx �ض���
                301 ҳ�����������ߣ������ض��򡣷����µ�URL,���������ݷ��ص�url�����µ�request����
                302 ��ʱ�ض���
                304 ��Դδ�޸ģ������ʹ�ñ��ػ���

                ������յ������Ϣ��������ת
            4xx �ͻ����������
                1. 404 Not Found, �ͻ����������Դ�д�
                1. 400 �����﷨����
                1. 401 ����Ҫ�������֤
                1. 403 �������ܾ�����
            5xx �������˴���
                1. 500 �������ڲ�����
                1. 502 ���з�������������nginx��������ʱ��
                    ��502��һ�����д����������

                **���Ҫ���ε����Լ�дһ��ͳһ�Ļظ�ҳ�棬��Ȼ��¶���Լ��Ĵ�����**
            
## ��״̬ ������ ������
1. ��״̬

1. �����ӣ�����TCP/IP

1. �����ӣ�
    Http 1.1 ֮ǰ������һ������һ�����ӣ���TCP�����Ӵ������ٳɱ��ߣ��Է������кܴ�ѹ����
    ������Http1.1��ʼ��֧��keep-alive,Ĭ��Ҳ����(true)��һ�����Ӵ򿪺󣬻ᱣ��һ��ʱ�䣨�����ã���������ٷ��ʸ÷�������ʹ�����TCP���ӣ������˷�������ѹ���������Ч��

��HTTPȨ��ָ�ϡ�


## WSGI

<img src="./materials/WSGI.png">

WSGI Server ������HTTPЭ��Ĳ���,������key-values��װ��environ ���� �Լ�д��WSGI APP
    1. key-values
    1. WSGI APP��Ӧ�����HTTP״̬�롢����ͷ�ķ���

WSGI APP 
    1. ������key-values,�������ĸ�WSGI Server
    1. ���������HTTP״̬�롢����ͷ

WSGI Server �����ķ����������


WSGI ��Ҫ���ǽ��Server��APP֮��ĽӿڵĹ�ϵ


## WSGI������-wsgiref
һ���ο��������в��ã�����OSI-RM

    ```
    from wsgiref.util import setup_testing_defaults
    from wsgiref.simple_server import make_server

    # A relatively simple WSGI application. It's going to print out the
    # environment dictionary after being updated by setup_testing_defaults
    def simple_app(environ, start_response):    //������ͷ��װ��environ�ֵ�, start-response����
        setup_testing_defaults(environ)

        status = '200 OK'   //״̬�� ״̬˵��
        headers = [('Content-type', 'text/plain; charset=utf-8')]

        start_response(status, headers)     //״̬�룬ͷ

        ret = [("%s: %s\n" % (key, value)).encode("utf-8")
            for key, value in environ.items()]
        return ret  //����Ҫ��ɵ����������ľ�������б��Ԫ�أ�������һ��Ԫ��-�ַ���

    with make_server('0.0.0.0', 8000, simple_app) as httpd:     //����server, �������˾�ȥ���� simple_app(WSGI APP)
    print("Serving on port 8000...")
    httpd.serve_forever()
    ```











