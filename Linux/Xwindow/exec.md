
## exec 

在看 i3wm 的时候有很多的 exec 命令，看不明白, 所以研究一下


---

fork()是用于建立进程的手段之一，但是fork()只能建立相同程序的副本。幸运的是，Linux系统还提供了系统调用exec系列。它可用于新程序的运行。

如果exec调用成功，调用进程将被覆盖，然后从新程序的入口开始执行。这样就产生了一个新的进程，但是它的进程标识符与调用进程相同。这就是说，exec没有建立一个与调用进程并发的新进程，而是用新进程取代了原来的进程。所以，对exec调用成功后，没有任何数据返回，这与fork()不同。

下面给出了exec系列调用在Linux系统中unistd.h中的函数声明：

```
int execl(const char *path, const *arg, ...);
int execlp(const char *file, const char *arg, ...);
int execle(const char *path, const char *arg, ..., char* const envp[]);
int execv(const char *path, char* const argv[]);
int execvp(const char *file, char* const argv[]);
```

下面来看一个exec函数的示例：

```

#include <stdio.h>
#include <unistd.h>

int main()
{
    printf("Executing ls\n");
        execl("/bin/ls", "ls", "-la", NULL);
            printf("------End of execl()\n");
                // 输出了下面的语句就表明execl调用失败了
                    perror("execl failed to run ls");
                        return 0;
                        
}
运行结果：

Executing ls
总用量 56
drwxrwxr-x  2 zcm zcm 4096 11月  2 16:26 .
drwxr-xr-x 11 zcm zcm 4096 10月 17 11:26 ..
-rwxrwxr-x  1 zcm zcm 5396  9月 21 11:17 p0
-rw-r--r--  1 zcm zcm  455  9月 21 11:16 p0.c
-rwxrwxr-x  1 zcm zcm 5195 11月  2 16:26 p1
-rw-r--r--  1 zcm zcm  259 11月  2 16:26 p1.c
-rwxrwxr-x  1 zcm zcm 5051  9月 21 10:23 p2
-rw-r--r--  1 zcm zcm  152  9月 21 10:23 p2.c
-rwxrwxr-x  1 zcm zcm 5489 10月 17 09:26 travel
-rw-rw-r--  1 zcm zcm 1405 10月 17 09:26 travel.c
[zcm@c #64]$

```

注意到了吗：没有“printf("------End of execl()\n"); “的输出噢。这正好说明了：exec没有建立一个与调用进程并发的新进程，而是用新进程取代了原来的进程。


---



### 在 i3wm 手册中的相关接收

4.18. Automatically starting applications on i3 startup

By using the exec keyword outside a keybinding, you can configure which commands will be performed by i3 on initial startup. exec commands will not run when restarting i3, if you need a command to run also when restarting i3 you should use the exec_always keyword. These commands will be run in order.

See [command_chaining] for details on the special meaning of ; (semicolon) and , (comma): they chain commands together in i3, so you need to use quoted strings (as shown in [exec_quoting]) if they appear in your command.


Syntax:

exec [--no-startup-id] <command>
exec_always [--no-startup-id] <command>


Examples:

exec chromium
exec_always ~/my_script.sh

Execute the terminal emulator urxvt, which is not yet startup-notification aware.
exec --no-startup-id urxvt
The flag --no-startup-id is explained in [exec].






6.1. Executing applications (exec)

The --no-startup-id parameter disables startup-notification support for this particular exec command. With startup-notification, i3 can make sure that a window appears on the workspace on which you used the exec command. Also, it will change the X11 cursor to watch (a clock) while the application is launching. So, if an application is not startup-notification aware (most GTK and Qt using applications seem to be, though), you will end up with a watch cursor for 60 seconds.

If the command to be executed contains a ; (semicolon) and/or a , (comma), the entire command must be quoted. For example, to have a keybinding for the shell command notify-send Hello, i3, you would add an entry to your configuration file like this:

Example:

```
# Execute a command with a comma in it
bindsym $mod+p exec "notify-send Hello, i3"
If however a command with a comma and/or semicolon itself requires quotes, you must escape the internal quotation marks with double backslashes, like this:
```

Example:

```
# Execute a command with a comma, semicolon and internal quotes

bindsym $mod+p exec "notify-send \\"Hello, i3; from $USER\\""

```



