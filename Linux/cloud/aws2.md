## 创建一个 AWS Global 账号

The AWS Free Tier 适用于 Global 账号

包含大部分 AWS 服务

适用于所有新注册账号

账号创建后，一年之内使用 Good for one year from the day the account is created

[更多信息](http://aws.amazon.com/free/)


1. 创建一个 AWS Global 账号

    [登录链接](https://aws.amazon.com)

    需要绑定信用卡


1. 创建一个 AWS 中国区账号

    [登录链接](http://www.amazonaws.cn/sign-up/)

## 创建 IAM Users

使用 AWS Identity and Access Manager (IAM), 可以创建和管理 AWS 用户和组

可以控制每一个用户的访问权限

可以基于硬件或软件为需要 Multi-Factor Authentication 的用户提供 token, 防止密码或者 key 的泄露

可以在 IAM users 和 root account 使用

创建

    IAM -> 用户组 -> 策略 ->


    AdministratorAccess: 所有权限

    ```
    {
        "Version": "2012-10-17",
            "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*"
            }
            ]
    }
    ```

    用户添加

    ```

    选择 AWS 访问类型

        1. 编程访问
            
            为 AWS API, CLI, SDK 和其他开发工具启用访问秘钥 ID 和私有访问秘钥

        2. AWS 管理控制台访问(网页)
            
            密码


    用户名                          xxxxxx
    亚马逊云科技 访问类型           亚马逊云科技 管理控制台访问 - 使用密码
    控制台密码类型                  自动生成
    需要重置密码                    是
    权限边界                        未设置权限边界
    ```
