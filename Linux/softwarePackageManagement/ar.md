
## ar

t   Display a table listing the contents of archive, or those of the files listed in member... that are present in the archive.  
    Normally only the member name is shown, but if the modifier O is specified, then the
    corresponding offset of the member is also displayed.  Finally, in order to see the modes (permissions), timestamp, owner, 
    group, and size the v modifier should be included.

    If you do not specify a member, all files in the archive are listed.

    If there is more than one file with the same name (say, fie) in an archive (say b.a), ar t b.a fie lists only the first instance;
    to see them all, you must ask for a complete listing---in our example, ar t b.a.


