
## mysql password function

[mysql password](https://stackoverflow.com/questions/52320576/in-mysql-server-8-0-the-password-function-not-working)

OP's MySQL Server version is 8.0.12. From MySQL Documentation, PASSWORD function has been deprecated for version > 5.7.5:

```
Note

The information in this section applies fully only before MySQL 5.7.5, and only
for accounts that use the mysql_native_password or mysql_old_password
authentication plugins. Support for pre-4.1 password hashes was removed in
MySQL 5.7.5. This includes removal of the mysql_old_password authentication
plugin and the OLD_PASSWORD() function. Also, secure_auth cannot be disabled,
and old_passwords cannot be set to 1.

As of MySQL 5.7.5, only the information about 4.1 password hashes and the
mysql_native_password authentication plugin remains relevant.

```

Instead, of the PASSWORD function, you can use much better and secure
encryption functions from [here](https://dev.mysql.com/doc/refman/8.0/en/encryption-functions.html). More de]tails from the MySQL server team can be
seen [here](https://blogs.oracle.com/mysql/post/mysql-8-0-4-new-default-authentication-plugin-caching_sha2_password).


The manual for that function has said for years that it's for use by MySQL's system tables only. Use SHA2() instead. 
