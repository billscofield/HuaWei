

-B NUM, --before-context=NUM

    Print NUM lines of leading context before matching lines.  Places a line
    containing a group separator (--)  between contiguous groups of matches.  With
    the -o or --only-matching option, this has no effect and a warning is given.

    匹配行之前的几行也打印出来


-A NUM, --after-context=NUM

    Print  NUM lines of trailing context after matching lines.
    Places a line containing a group separator (--) between
    contiguous groups of matches.  With the -o or --only-matching
    option, this has no effect and a warning is given.

    匹配行之前的几行也打印出来


-C NUM, -NUM, --context=NUM

    Print  NUM  lines  of output context.  Places a line containing a group
    separator (--) between contiguous groups of matches.  With the -o or
    --only-matching option, this has no effect and a warning is given.

    -A + -B


---

-n, --line-number

    Prefix each line of output with the 1-based line number within its input file.

-v, --invert-match

    Invert the sense of matching, to select non-matching lines.

-l, --files-with-matches

    Suppress normal output; instead print the name of each input file from
    which output would normally have been printed.  The scanning will stop on
    the first match.

    to show only matching file

-L, --files-without-match

    Suppress normal output; instead print the name of each input file from
    which no output would normally have been printed.  The scanning will stop
    on the first match.

