
## Enable SSH shell access but disable SFTP access

链接:
    https://serverfault.com/questions/653812/enable-ssh-shell-access-but-disable-sftp-access



I've searched for a viable answer to this question, and most of the answers include advice on why to not do it. However, here's the scenario, and what makes it necessary:

I have a console app, and in each user's .profile, there is a startup command for the app, and directly after the command that starts it up, there's an "exit" command, which logs them out of the system. I only want them to be able to access this console app through the interface provided by it. Upon startup, the app presents the user with a list of clients that can be accessed through the app, with each client having their own data directory. Users are granted access to only the clients that they will need access to.

Now here's the problem: If I give the users SSH access, they will also be able to log in using an SFTP client, which will give them direct access to the data directories for the app, which is VERY undesirable, since that will also give them access to the data directories to which they should not have access.

This was such a simple thing to do when using a telnet/FTP combination, but now that I want to give the users access from anywhere on the internet, I haven't been able to find a way to shut them out of SFTP, while still allowing them access to the shell where they can run the app.




