links:
    https://knowledge.broadcom.com/external/article/164907/test-smtp-authentication-with-messaging.html

1. In a telnet client such as PuTTY, connect to the SMG appliance:

    telnet <SMG_IP_address>  587

1. Greet the mail server:

    EHLO mailserver.com

    这一步随便输入都会提示下一步输入, shit

1. Tell SMG you want to authenticate with it:

    AUTH LOGIN  // 认证类型，如 PLAIN, LOGIN, 

1. The server should return the following, which is a base64 encoded string that requires your username:

    334 VXNlcm5hbWU6

    ```
    echo "VXNlcm5hbWU6" | base64 -d
    username:

    这一步随便输入都会提示下一步输入, shit
    ```

1. Paste the base64 encoded username. For example:

    dXNlcm5hbWUuY29t

1. The server should return the following, which is a base64 encoded string that requires your password:

    334 UGFzc3dvcmQ6

    ```
    echo "UGFzc3dvcmQ6" | base64 -d
    password:
    ```

1. Paste the base64 encoded password for the username. For example:

    bXlwYXNzd29yZ$4





## smtp 认证类型

links:

    https://blog.mailtrap.io/smtp-auth/

1. PLAIN – the server requests the client to authorize using the username and password. These credentials are transmitted as one string encoded in Base64.

1. LOGIN – the server requests the client to authorize using the username and password. The difference from PLAIN is that the credentials encoded in Base64 are transmitted one by one – username and password.

1. CRAM-MD5 – the server requests the client to solve a computational challenge using the password. The client response is a string containing a username and a 16-byte digest in hexadecimal notation. The string is BASE64 encoded. 

CRAM-MD5 provides a higher level of security compared to the plaintext authentication mechanisms, PLAIN and LOGIN. The protocol uses a challenge-response principle. The server sends a challenge string. The client decodes the server challenge and replies with an HMAC (Hash-based Message Authentication Code) calculation using the password as a secret key. After that, the hashed challenge is converted to a string of lowercase hex digits. Also, the client prepends the username and a space character to the string. The server gets this concatenation BASE64-encoded. 

Spoofers cannot:

decode credentials since they aren’t actually transferred by the client in text or in code
duplicate the hash because they need to know the password
simulate the hash, because the computational challenge is mutable and changes with each login



## Code 535 – Authentication failed and other SMTP AUTH errors 

The SMTP server can reply both positively and negatively to the AUTH command. Positive response codes are:

    334 – the requested security mechanism is accepted
    235 – authentication is successful

The most frequent negative response is 535 - Authentication failed. It’s likely that you’ll be able to fix this error if you know what has caused it.

    1. Incorrect credentials
        Either the username or password (or both) is incorrect. Usually, the username is the same as your email address. And the password is the same as for your email account.
        
    1. Account disabled 
        There could be different reasons for this like spamming issues or payment arrears. The best way to fix this is to contact your mail server provider or administrator.
        
    1. SSL/TLS connection required  
        Some servers may respond with 535 when an encrypted connection is required. 
        
    1. SMTP authentication is not enabled 
        Make sure that both your client and server has the SMTP AUTH enabled. 
        
    1. Authentication mechanism is not supported 
        The client does not support any of the mechanisms the server uses for authentication. In this case, it’s recommended to enable the basic authentication mechanism on the server and use it. 


Besides 535, you may face other errors with the AUTH command:

    530 – authentication problem that mostly requires the STARTTLS command to run 
    538 – encryption required for a requested authentication mechanism

Code 550 denotes that your email server requires SMTP authentication. It’s mostly a response to the attempt to send a message. For more on SMTP commands and responses, read our dedicated blog post. 



### How to test the SMTP authentication
Some time ago we blogged about testing SMTP server with a manual Telnet session. Now, let’s use the Telnet client to test SMTP authentication on your mail server. 

Step 1: 
    Make sure the Telnet client is installed/activated on your operating system. This 
    mostly refers to Windows users who need to perform some manipulations to get it enabled. 

Step 2: 
    Establish a TCP connection (port 25) with the SMTP server using telnet smtp.yourserver.com 25 
    The server will reply with 220 smtp.yourserver.com This means the SMTP session has begun.

Step 3: 
    Say hello to the server with EHLO smtp.yourserver.com The server will welcome you 
    back and offer a selection of authentication mechanisms. For example: 250-AUTH PLAIN LOGIN CRAM-MD5

    **关键是这一个返回 网易 不返回该信息，只是返回 ok**

Step 4: 
    Let’s authenticate via LOGIN. But before, make sure to encode your credentials in Base64. 
    You can use this tool for encoding. Enter the AUTH LOGIN command. As you remember, the server 
    will reply with 334 followed by the Base64 encoded text. First is the request for username, 
    and then – password. Reply with your Base64 encoded credentials respectively. If authentication 
    is successful, the server replies with 235 OK. The SMTP AUTH test was passed. 

SMTP authentication is what you can use to protect your mail server from spoofing and phishing. At the same time, there are many other threats like Malware, DoS attacks, and so on. Read our blog post to learn how to make SMTP secure and protect against all possible vulnerabilities.



## 用telnet发邮件的一个例子

```
telnet smtp.163.com 25
helo smtp.163.com                           // 这个可以随便写 helo xxx
auth plain <base64 加密的用户名和密码>      // echo "\0用户名\0密码" | base64     , https://www.jb51.cc/c/111597.html
mail from: <这个邮箱的发件地址>             // < > 这两个尖括号不能丢
rcpt to: <目的地址>                         // < > 这两个尖括号不能丢
data                                        // 正文
from: a@a.com                               // 邮件来源名称, 一定写 邮件全称 abc@163.com, 否则判定为 554 DT:SPM
to: b@b.com                                 // 邮件收件人名称, 一定写邮件全称, bcd@163.com 否则判定为 554 DT:SPM
subject: this is a test telnet smtp mail    // 主旨
date: $(date)
                                            // 标题和正文之间有一个空行
正文

.                                           // 单独一行英文句号,表示发送
quit                                        // 退出

```

网易邮箱常见错误返回信息

554 DT:SPM      发送的邮件内容包含了未被网易许可的信息，或违背了网易的反垃圾服务条款。



