## double dash

man bash

-- 
    A  --  signals  the end of options and disables further option processing.
    Any arguments after the -- are treated as filenames and argu‐ments.  An
    argument of - is equivalent to --.





What does “–” (double-dash) mean? (also known as “bare double dash”)

https://www.wikitechy.com/technology/double-dash-mean-also-known-bare-double-dash/


Double dash:

    1. The double dash “–” means end of command line flags i.e. it tells the
       preceding command not to try to parse what comes after command line
       options.

    1. It is actually part of the POSIX standard that — can be used to separate
       options from other arguments, so you will see it on commands like cp and
       mv (which are not part of Bash).

    1. — works to separate options from regular expressions in grep, but the
       canonical way is to use -e/–regexp 

Example use:

    you want to grep a file for the string -v – normally -v would be considered
    as the option to reverse the matching meaning (only show lines that do not
    match), but with — you can grep for string -v like this:

        Bash Code
        grep -- -v file

    A double dash ( — ) is used in bash built-in commands and there are more
    other commands to signify the end of command options, after which only
    positional parameters are accepted

    Example:

        Suppose you have a file named path/to/file.txt in my Git repository,
        and you want to revert changes on it.
        
        Bash Code
        git checkout path/to/file.txt


    Now suppose that the file is named master…

        Bash Code
        git checkout master

    Whoops! That changed branches instead. The — helps to separate the tree you
    want to check out from the files you want to check out.

        Bash Code
        git checkout -- master

    It also helps us if some freako added a file named -f to our repository:
        
        Bash Code
        git checkout -f      # wrong
        git checkout -- -f   # right


