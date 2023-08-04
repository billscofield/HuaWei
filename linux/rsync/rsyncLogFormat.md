# log format

This parameter allows you to specify the format used for logging file transfers
when transfer logging is enabled.  The format is a text string containing
embedded single-character escape sequences prefixed with a percent (%)
character.

An optional numeric field width may also be specified between the percent and
the escape letter (e.g.  "%-50n %8l %07p").

In addition, one or more apostrophes(撇号) may be specified prior to a
numerical escape  to  indicate that the numerical value should be made more
human-readable.  The 3 supported levels are the same as for the
--human-readable command-line option, though the default is for
human-readability to be off.  Each added apostrophe increases the level (e.g. "%
''l %'b %f").

The default log format is **"%o %h [%a] %m (%u) %f %l"**, and a **"%t [%p]"** is always
prefixed when using the "log file" parameter.  (A perl script that will
summarize this default log format is included in the rsync  source code
distribution in the "support" subdirectory: rsyncstats.)


The single-character escapes that are understood are as follows:

    - %t the current date time
        2023/07/28 08:18:51
    - %p the process ID of this rsync session
        [16976]

    - %o the operation, which is
        "send",
        "recv",
        "del." (the latter includes the trailing period)

    - %h the remote host name (only available for a daemon)
    - %a the remote IP address (only available for a daemon)
    - %m the module name
    - %u the authenticated username or an empty string
    - %f the filename (long form on sender; no trailing "/")
    - %l the length of the file in bytes

---

    - %b the number of bytes actually transferred

    - %B the permission bits of the file (e.g. rwxrwxrwt)

    - %c the total size of the block checksums received for the basis file (only when sending)

    - %C  the  full-file checksum if it is known for the file. For older rsync
      protocols/versions, the checksum was salted, and is thus not a useful
      value (and is not displayed when that is the case). For the checksum to
      output for a file, either the --checksum option must be in-effect or the
      file must have been transferred without a salted checksum being used.
      See the --checksum-choice option for a way to choose  the  algo‐rithm.

    - %G the gid of the file (decimal) or "DEFAULT"

    - %i an itemized list of what is being updated

        1. The "%i" escape has a cryptic output that is 11 letters long.

        2. The general format is like the string **YXcstpoguax**,                 <---
            - where Y is replaced by the type of update being done,
            - X is replaced by the file-type,
            - and the other letters represent attributes that may be output if they are being modified.


        3. The update types that replace the Y are as follows:

            - A < means that a file is being transferred to the remote host (sent).
            - A > means that a file is being transferred to the local host (received).
            - A c means that a local change/creation is occurring for the item (such as the creation of a directory or the changing of a symlink, etc.).          ??????? 外边的传到本地呢???
            - A h means that the item is a hard link to another item (requires --hard-links).
            - A . means that the item is not being updated (though it might have attributes that are being modified).
            - A * means that the rest of the itemized-output area contains a message (e.g. "deleting").                                                           ???????

        4. The file-types that replace the X are: 
            - f for a file, 
            - a d for a directory,
            - an L for a symlink,
            - a D for a device,
            - a S for a special file (e.g. named sockets and fifos).

        5. The other letters in the string above are the actual letters that
           will be output if the associated attribute for the item is being
           updated or a "." for no change.  Three exceptions to this are:

           - a newly created item replaces each letter with a "+"
           - an identical item replaces the dots with spaces
           - an unknown attribute replaces each letter with a "?" (this can happen when talking to an older rsync)

        6. The attribute that is associated with each letter is as follows:(YXcstpoguax)

            1. A c means either that a regular file has a different checksum
               (requires --checksum) or that a symlink, device, or special file
               has a changed value. Note that if you are sending files to an
               rsync prior to 3.0.1, this change flag will be present only for
               checksum-differing regular files.

            2. A s means the size of a regular file is different and will be
               updated by the file transfer.

            3. A t means the modification time is different and is being
               updated to the sender’s value (requires --times). An alternate
               value of T means that the modification time will be set to the
               transfer time, which happens when a file/symlink/device is
               updated without --times and when a symlink is changed and the
               receiver can’t set its time. (Note: when using an rsync 3.0.0
               client, you might see the s flag combined with t instead of the
               proper T flag for this time-setting failure.)

            4. A p means the permissions are different and are being updated to
               the sender’s value (requires --perms).

            5. An o means the owner is different and is being updated to the
               sender’s value (requires --owner and super-user privileges).

            6. A g means the group is different and is being updated to the
               sender’s value (requires --group and the authority to set the
               group).

            7. The u slot is reserved for future use.

            8. The a means that the ACL information changed.

            9. The x means that the extended attribute information changed.

            One other output is possible: when deleting files, the "%i" will
            output the string "*deleting" for each item that is being removed
            (assuming that you are talking to a recent enough rsync that it
            logs deletions instead of outputting them as a verbose message).

            [link](https://stackoverflow.com/questions/4493525/what-does-f-mean-in-rsync-logs)


    ```
    YXcstpoguax  path/to/file
    |||||||||||
    ||||||||||╰- x: The extended attribute information changed
    |||||||||╰-- a: The ACL information changed
    ||||||||╰--- u: The u slot is reserved for future use
    |||||||╰---- g: Group is different
    ||||||╰----- o: Owner is different
    |||||╰------ p: Permission are different
    ||||╰------- t: Modification time is different
    |||╰-------- s: Size is different
    ||╰--------- c: Different checksum (for regular files), or
    ||              changed value (for symlinks, devices, and special files)
    |╰---------- the file type:
    |            f: for a file,
    |            d: for a directory,
    |            L: for a symlink,
    |            D: for a device,
    |            S: for a special file (e.g. named sockets and fifos)
    ╰----------- the type of update being done::
                 <: file is being transferred to the remote host (sent)
                 >: file is being transferred to the local host (received)
                 c: local change/creation for the item, such as:
                    - the creation of a directory
                    - the changing of a symlink,
                    - etc.
                 h: the item is a hard link to another item (requires 
                    --hard-links).
                 .: the item is not being updated (though it might have
                    attributes that are being modified)
                 *: means that the rest of the itemized-output area contains
                    a message (e.g. "deleting")
    ```

    Some example output from rsync for various scenarios:

        >f+++++++++     some/dir/new-file.txt
        .f....og..x     some/dir/existing-file-with-changed-owner-and-group.txt
        .f........x     some/dir/existing-file-with-changed-unnamed-attribute.txt
        >f...p....x     some/dir/existing-file-with-changed-permissions.txt
        >f..t..g..x     some/dir/existing-file-with-changed-time-and-group.txt
        >f.s......x     some/dir/existing-file-with-changed-size.txt
        >f.st.....x     some/dir/existing-file-with-changed-size-and-time-stamp.txt 
        cd+++++++++     some/dir/new-directory/
        .d....og...     some/dir/existing-directory-with-changed-owner-and-group/
        .d..t......     some/dir/existing-directory-with-different-time-stamp/


Capturing rsync's output (focused on the bit flags):

In my experimentation, both the --itemize-changes flag and the -vvv flag are
needed to get rsync to output an entry for all file system changes. Without the
triple verbose (-vvv) flag, I was not seeing directory, link and device changes
listed. It is worth experimenting with your version of rsync to make sure that
it is observing and noting all that you expected.

One handy use of this technique is to add the --dry-run flag to the command and
collect the change list, as determined by rsync, into a variable (without
making any changes) so you can do some processing on the list yourself.
Something like the following would capture the output in a variable:

file_system_changes=$(rsync --archive --acls --xattrs \
    --checksum --dry-run \
    --itemize-changes -vvv \
    "/some/source-path/" \
    "/some/destination-path/" \
    | grep -E '^(\.|>|<|c|h|\*).......... .')

In the example above, the (stdout) output from rsync is redirected to grep (via
stdin) so we can isolate only the lines that contain bit flags.




I'm a couple of years late, but "t" vs "T" is explained in the man page: A t
means the modification time is different and is being updated to the sender's
value (requires --times). An alternate value of T means that the modification
time will be set to the transfer time, which happens when a file/symlink/device
is updated without --times and when a symlink is changed and the receiver can't
set its time. (Note: when using an rsync 3.0.0 client, you might see the s flag
combined with t instead of the proper T flag for this time-setting failure.)


---

        YXcstpoguax
        >f.st......
        0123456789a

        >f.st......

            > - the item is received
            f - it is a regular file
            s - the file size is different
            t - the time stamp is different

        YXcstpoguax
        .d..t......

            . - the item is not being updated (though it might have attributes that are being modified)
            d - it is a directory
            t - the time stamp is different

        YXcstpoguax
        >f+++++++++

            > - the item is received
            f - a regular file
            +++++++++ - this is a newly created item






    - %L the string "-> SYMLINK", "=> HARDLINK", or "" (where SYMLINK or HARDLINK is a filename)

    - %M the last-modified time of the file

    - %n the filename (short form; trailing "/" on dir)

    - %P the module path

    - %U the uid of the file (decimal)

For a list of what the characters mean that are output by "%i", see the
--itemize-changes option in the rsync manpage.

Note that some of the logged output changes when talking with older rsync
versions.  For instance, deleted files were only output as verbose messages
prior to rsync 2.6.4.


2023/07/29 10:21:18 [2937] .d...p.....  a.txt

1. The first column shows the date and time the message was logged in the format YYYY/MM/DD HH:MM:SS

2. The second column shows the PID (process ID) of the rsync process. In your example log message, the PID is [2937]

3. The third column shows the file type and any special attributes. In your example log message, the file type is . and the attributes are d...p.....



---

## last lines of log

```
...
sent 138,895,954,425 bytes  received 8,257,552 bytes  43,618,845.02 bytes/sec
total size is 44,119,018,972,986  speedup is 317.62
```
sent            138,895,954,425 bytes
received              8,257,552 bytes  43,618,845.02 bytes/sec
total size   44,119,018,972,986 bytes
speedup is 317.62

### 1. sent & received 

the `sent` and `received` values in the rsync command output only represent the
amount of data that was sent from the source to the destination, and vice versa,
respectively. They do not include other factors, such as file compression,
protocol overhead, and network latency, which can affect the total amount of
data transferred.

### 2. total size

On the other hand, the total size mentioned in the output refers to the size of
the files being transferred, including any metadata and other associated data.

This size can be different from the amount of data actually sent and received
in the transfer operation, which may be compressed, deduplicated, or otherwise
optimized to reduce the amount of redundant data transmitted over the network.

Therefore, it's possible for the total size to be different from the sum of
sent and received values, depending on the specific circumstances of the
transfer operation, such as the type and size of files being transferred, the
network bandwidth, and the optimization options used.

### 3. sppedup

The "speedup" value represents the ratio between the amount of data transmitted
over the network and the amount that would have been transmitted if the files
were copied from scratch.

A value of 1 means that the files were not present on the destination, and the
full file content needed to be transmitted.

A value greater than 1 means that some files were already present on the
destination, and only the difference between the source and destination files
needed to be transmitted.


