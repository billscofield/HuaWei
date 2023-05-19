https://github.com/tmux/tmux/wiki/Getting-Started

https://dev.to/iggredible/useful-tmux-configuration-examples-k3g

## 

For keys that control tmux itself, a special key must be pressed first - this
is called the prefix key.

In tmux, modifier keys are shown by prefixing a key with C- for the control key,
M- for the meta key (normally Alt on modern computers) and S- for the shift
key.  These may be combined together, so C-M-x means pressing the control key,
meta key and x together.


When the prefix key is pressed, tmux waits for another key press and that
determines what tmux command is executed. Keys like this are shown here with a
space between them: C-b c means first the prefix key C-b is pressed, then it is
released and then the c key is pressed. Care must be taken to release the Ctrl
key after pressing C-b if necessary - C-b c is different from C-b C-c.

## Help keys

Every default tmux key binding has a short description to help remember what
the key does. A list of all the keys can be seen by pressing C-b ?.

C-b ? enters **view mode** to show text.

 A pane in view mode has its own key bindings which do not need the prefix key.

 These broadly follow emacs(1). 
 
 The most important are Up, Down, C-Up, C-Down to scroll up and down, and q to
 exit the mode. 
 
 The line number of the top visible line together with the total number of
 lines is shown in the top right.

 Alternatively, the same list can be seen from the shell by running:

    $ tmux lsk |more    // github上是 tmux lsk -N | more, 但是 -N 有问题

-d By default, attaching to a session does not detach any other clients
attached to the same session. The -d flag does this: tmux attach -dtmysession这
个最开始说的好像不是很好理解，但是 man 手册里边解释的很清楚了多读几遍就明白了，
默认不分离，但是 -d 选项可以If -d is specified, any other clients attached to
the session are detached.  

-r signifies the client is read-only (only keys bound to the detach-client or
switch-client commands have any effect)

## quick source

> bind r source-file ~/.tmux.conf \; display "Reloaded!"

注意有一个\

---

mkdir ~/.tmux/
git clone https://github.com/tmux-plugins/tpm       ~/.tmux/plugins/tpm
git clone https://gitee.com/billscofield/tpm.git    ~/.tmux/plugins/tpm

git clone https://github.com/tmux-plugins/tmux-resurrect.git
git clone https://gitee.com/billscofield/tmux-resurrect.git

git clone https://github.com/tmux-plugins/tmux-continuum.git
git clone https://gitee.com/billscofield/tmux-continuum.git

将下边的语句添加到 .tmux.conf 中
run-shell ~/.tmux/tmux-resurrect/resurrect.tmux
run-shell ~/.tmux/tmux-continuum/continuum.tmux

## dracula 主题

部分开源

/root/.tmux/plugins/tmux/scripts/dracula.sh

    tmux set-option -g pane-active-border-style "fg=${light_purple}"    #默认是紫色

