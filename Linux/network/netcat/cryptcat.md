## cryptcat

netcat 的加密版本

A lightweight version netcat extended with twofish encryption

apt-cache show cryptcat



-k secret 
    Change the shared secret password to be used to establish a connection.


    ```
    服务器端
        cryptcat -k [pass] -l -p 9999

    客户端
        cryptcat -k [pass] [ip] [port]

    ```

