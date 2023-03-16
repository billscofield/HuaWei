-c      count

-f      Flood ping

-i      interval

    Real number allowed with dot as a decimal separator (regardless locale
    setup). The default is to wait for one second between each packet normally,
    or not to wait in flood mode.  Only super-user may set interval to values
    less than 0.2 seconds.

-q

ping -c 1000 -i 0.01 xxx
