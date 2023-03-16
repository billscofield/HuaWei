# nohup

nohup - run a command immune to hangups, with output to a non-tty

## what is then difference between `nohup` and redirection `>` and `>>`

`nohup` and redirection operators `>` and `>>` are used to run a command or a
process in the background and to detach it from the current terminal session.
However, there are some differences between them:

- `nohup`: `nohup` is used to run a command or a process in the background, and
  **it prevents the process from receiving the hangup signal (`SIGHUP`) when
  the terminal session is closed.** This means that the process will continue
  to run even if the user logs out or closes the terminal session. For example,

    nohup python myscript.py &

    will run the myscript.py in the background, and any output from the script
    will be redirected to the `nohup.out` file.

- `>` and `>>`: These redirection operators are used to redirect the output of
  a command to a file. The `>` operator overwrites the contents of the file if
  it exists, while the >> operator appends the output to the end of the file.
  For example,

    ls > output.txt

    will redirect the output of the `ls` command to the `output.txt` file.

In summary, **`nohup` is used to keep a process running even when the terminal
session is closed**, while redirection operators are used to redirect the output
of a command to a file.
