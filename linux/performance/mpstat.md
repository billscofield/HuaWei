-P { cpu_list | ALL  }

    Indicate the processors for which statistics are to be reported.  cpu_list is a list of comma-separated values or  range  of  values

    (e.g.,  0,2,4-7,12-).   Note  that processor 0 is the first processor, and processor all is the global average among all processors.

    The ALL keyword indicates that statistics are to be reported for all processors.  Offline processors are not displayed.


[ interval [ count  ]  ]

    The interval parameter specifies the amount of time in seconds between each report.  

    A value of 0 (or no parameters at all) indicates  that processors  statistics  are  to  be reported for the time since system startup (boot). 

    The count parameter can be specified in conjunction with the interval parameter if this one is not set to zero. 

    The value of count determines the number of reports generated at interval  seconds apart. 

    If the interval parameter is specified without the count parameter, the mpstat command generates reports continuously.


-I { keyword [,...] | ALL  }

    Report interrupts statistics.


