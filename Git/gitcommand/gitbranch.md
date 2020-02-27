## git branch

-v, -vv, --verbose
    When in list mode, show sha1 and **commit subject line for each head**, along with relationship to upstream branch (if any).
    If given twice, print the path of the linked worktree (if any) and the name of the upstream branch,
    as well (see also git remote show <remote>). Note that the current worktree’s HEAD will not have its path printed (it will always be your current directory).

-l, --list
    List branches. With optional <pattern>..., e.g.  git branch --list 'maint-*', list only the branches that match the pattern(s).

-r, --remotes
    List or delete (if used with -d) the remote-tracking branches. Combine with --list to match the optional pattern(s).


git branch --list       (list branches)
git branch --list -v    (show commit subject line for each head)
