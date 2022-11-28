
## Restrict Commands for SSH Users

1. The authorized_keys File

    SSH comes with a few configuration files, and authorized_keys is one of
    them. We use it to manage the different hosts and users connecting to the
    SSH server. Using this configuration file, we can set up an auto-login to
    the remote server. We can find the authorized_keys file in the ~/.ssh/
    folder. However, we can set a different path in the /etc/ssh/sshd_config.

    To restrict the commands, we need to modify the authorized_keys file. A
    sample configuration would be as below:

    ```
    from="192.168.1.10",command="/usr/bin/ls" ssh-rsa AAAAB3NzaC1yc2E...OrsMdr bluelake@Pacific
    ```

    This configuration in the authorized_keys will limit the user to run only
    the ls command.

    The relevant attributes are from and command. The from attribute specifies
    the client which is trying to connect to the SSH server. We can specify the
    hostname or IP here. If there are multiple hosts, we can mention all of
    them **separated by a comma.**

    Finally, the command specifies the command allowed to run. We have to
    supply the command with a full path to it here. Unfortunately, **we cannot
    specify multiple commands here**

    Even though this is a powerful feature, there is no real utility in this
    since there is only one command the user can run.

    !!! **If we exit the server and try to log in again via SSH, the ls command
    will execute, and the connection to the server will be closed.**

2. using a script

    Instead of specifying the command, if we specify a script, we can enable
    the user to do more.

    Let’s modify the configuration to allow this behavior as below:

    ``` ~/.ssh/authorized_keys
    from="192.168.1.10",command="/usr/local/bin/select.sh" ssh-rsa AAAAB3NzaC1yc2E...OrsMdr bluelake@Pacific
    ```
    chmod +x /usr/local/bin/select.sh


    The only change is that the command ls is replaced by a select.sh script.

    The contents of the script are as below:

    ```
    #!/bin/bash
    echo "1. ls"
    echo "2. ping 8.8.8.8 -c 5"
    echo "3. top"
    read -p 'Choice: ' choice # Read the choice from user
    case $choice in
        1)
            ls
            ;;
        2)
            ping 8.8.8.8 -c 5
            ;;
        3)
            top
            ;;
        *)
            exit
            ;;
    esac
    ```

    This is a simple script. It reads the user’s input at line 5 and runs the
    commands depending on the user’s choice.

    执行完毕就退出了

    This actually gives us more flexibility in running different commands. If
    this is put inside a loop, then the user can run multiple commands in a
    single session.:w



