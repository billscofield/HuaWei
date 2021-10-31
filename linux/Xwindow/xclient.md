
xset - user preference utility for X

1. s

    The s option lets you set the screen saver parameters.  
    This option accepts up to two numerical parameters, 
    a 'blank/noblank' flag, 
    an 'expose/noexpose'  flag,  
    an 'on/off' flag, 
    an 'activate/reset' flag, 
    or the 'default' flag.  

    If no parameters or the 'default' flag is used, the system will be set to
    its default screen saver characteristics.  

    The 'on/off' flags simply turn the screen saver functions on or off.  

    The 'activate' flag forces activation of screen saver even  if  the  screen
    saver  had been turned off.  

    The 'reset' flag forces deactivation of screen saver if it is active.  

    The 'blank' flag sets the preference to blank the video (if the hardware
    can do so) rather than display a background pattern, while 'noblank' sets
    the preference to display a pattern rather than blank the video.   

    The 'expose' flag  sets  the  preference to allow window exposures (the
    server can freely discard window contents), while 'noexpose' sets the
    preference to disable screen saver unless the server can regenerate the
    screens without causing exposure events.  

    The length and period parameters for the screen saver function determines
    how  long the  server  must be inactive for screen saving to activate, and
    the period to change the background pattern to avoid burn in.  

    The arguments are specified in sec‐onds.  If only one numerical parameter
    is given, it will be used for the length.





把屏保功能关了：

    exec --no-startup-id xset 0

然后黑屏、睡眠、断电时间分别设为6000s，8000s，9000s，也可以只写前一个，不必三个都写

 exec --no-startup-id xset dpms 6000 8000 9000


dpms flags...

    The  dpms  option  allows  the  DPMS  (Energy Star) parameters to be set.
    The option can take up to three numerical values, or the `force' flag
    followed by a DPMS state.  

    The `force' flags forces the server to immediately switch to the DPMS state
    specified.  

    The DPMS state can be one of `standby', `suspend', `off', or  `on'.  When
    numerical  values  are  given,  they  set the inactivity period (in units
    of seconds) before the three modes are activated.  

    The first value given is for the `standby' mode, the second is for the
    `suspend' mode, and the third is for the `off' mode.  

    Setting these values implicitly enables the DPMS features.  A value  of
    zero disables a particular mode.


