
GECOS:用户的详细信息（如姓名，年龄，电话等）

The newusers command reads a file (or the standard input by default) and uses this information to update a
set of existing users or to create new users. Each line is in the same format as the standard password file
(see passwd(5)) with the exceptions explained below:

pw_name:pw_passwd:pw_uid:pw_gid:pw_gecos:pw_dir:pw_shell

