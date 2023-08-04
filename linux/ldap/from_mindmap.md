使用 mindmap 打开是思维导图的样子


# CentOS7使用Kerberos加入Windows AD域，不使用SSSD

## 安装Kerberos客户端
- 使用yum命令安装Kerberos客户端软件包：`yum install krb5-workstation`

## 配置Kerberos客户端
1. 打开Kerberos客户端配置文件`/etc/krb5.conf`，编辑以下内容：
```markdown
[logging]
 default = FILE:/var/log/krb5libs.log
 kdc = FILE:/var/log/krb5kdc.log
 admin_server = FILE:/var/log/kadmind.log

[libdefaults]
 default_realm = YOUR-REALM
 dns_lookup_realm = false
 dns_lookup_kdc = false
 ticket_lifetime = 24h
 renew_lifetime = 7d
 forwardable = true

[realms]
 YOUR-REALM = {
  kdc = your-ad-server.your-domain.com
  admin_server = your-ad-server.your-domain.com
 }

[domain_realm]
 .your-domain.com = YOUR-REALM
 your-domain.com = YOUR-REALM
```
2. 替换`YOUR-REALM`为你的域名，`your-ad-server.your-domain.com`为你的AD服务器地址。

## 配置Kerberos认证
1. 创建Kerberos认证配置文件`/etc/krb5.keytab`，并设置权限：
   - `touch /etc/krb5.keytab`
   - `chmod 600 /etc/krb5.keytab`
2. 使用`kadmin`命令生成Kerberos主体并存储到`/etc/krb5.keytab`文件中：
   - `kadmin -p adminuser/admin -w adminpassword -q "addprinc -randkey host/your-hostname.your-domain.com"`
   - `kadmin -p adminuser/admin -w adminpassword -q "ktadd -k /etc/krb5.keytab host/your-hostname.your-domain.com"`

## 配置Kerberos PAM模块
1. 打开PAM配置文件`/etc/pam.d/system-auth`，添加以下内容：
```markdown
auth        required      pam_krb5.so minimum_uid=1000
account     required      pam_krb5.so minimum_uid=1000
password    required      pam_krb5.so minimum_uid=1000
session     required      pam_krb5.so minimum_uid=1000
```
2. 保存并关闭文件。

## 配置Kerberos NSS模块
1. 打开NSSwitch配置文件`/etc/nsswitch.conf`，找到`passwd`和`group`行，将`sss`改为`files`：
```markdown
passwd:     files sss
group:      files sss
```
2. 保存并关闭文件。

## 重启系统服务
- 使用以下命令重启系统服务使配置生效：
  - `systemctl restart sshd`
  - `systemctl restart sssd`
  - `systemctl restart nscd`

## 验证Kerberos加入域是否成功
- 使用以下命令验证Kerberos是否成功加入Windows AD域：
  - `kinit username@YOUR-REALM`
  - `klist`

以上是在CentOS7上使用Kerberos加入Windows AD域的步骤，不使用SSSD。希望对你有帮助！
