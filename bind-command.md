bind: bind [-lpsvPSVX] [-m keymap] [-f filename] [-q name] [-u name] [-r keyseq] [-x keyseq:shell-command] [keyseq:readline-function or readline-command]
    Set Readline key bindings and variables.
    
    Bind a key sequence to a Readline function or a macro, or set a
    Readline variable.  The non-option argument syntax is equivalent to
    that found in ~/.inputrc, but must be passed as a single argument:
    e.g., bind '"\C-x\C-r": re-read-init-file'.
    
    Options:
      -m  keymap         Use KEYMAP as the keymap for the duration of this
                         command.  Acceptable keymap names are emacs,
                         emacs-standard, emacs-meta, emacs-ctlx, vi, vi-move,
                         vi-command, and vi-insert.
      -l                 List names of functions.
      -P                 List function names and bindings.
      -p                 List functions and bindings in a form that can be
                         reused as input.
      -S                 List key sequences that invoke macros and their values
      -s                 List key sequences that invoke macros and their values
                         in a form that can be reused as input.
      -V                 List variable names and values
      -v                 List variable names and values in a form that can
                         be reused as input.
      -q  function-name  Query about which keys invoke the named function.
      -u  function-name  Unbind all keys which are bound to the named function.
      -f  filename       Read key bindings from FILENAME.

      **-r  keyseq         Remove the binding for KEYSEQ.**
      **-x  keyseq:shell-command	Cause SHELL-COMMAND to be executed when KEYSEQ is entered.**

      -X                 List key sequences bound with -x and associated commands
                         in a form that can be reused as input.
    
    Exit Status:
    bind returns 0 unless an unrecognized option is given or an error occurs.

---
keyseq可以使用showkey -a命令来获取,按哪个键，就出现哪个按键的keyseq, Ctrl+D终止

列出指定功能的按键和按键组合
    bind -q





## 配置文件

/etc/inputrc    是对所有用户的快捷方式都生效;
~/.inputrc.是对当前用户快捷方式生效;

man 5 keyboard








