## curl

-S, --show-error

    When used with -s, --silent, it makes curl show an error
    message if it fails.

-s, --silent

    Silent or quiet mode. Don't show progress meter or error
    messages.  Makes Curl mute. It will still output the data
    you ask for, potentially even to the terminal/stdout unless
    you redirect it.

-w, --write-out <format>

    Make curl display information on stdout after a completed transfer. The
    format is a string that may contain plain text mixed with any number of
    variables. The format can be specified as a literal "string", or  you can
    have curl read the format from a file with "@filename" and to tell curl to
    read the format from stdin you write "@-".


    http_code      The numerical response code that was found in the last retrieved HTTP(S) or FTP(s) transfer. In 7.18.2 the alias response_code was added to show the same info.

    time_total     The total time, in seconds, that the full operation lasted.

-o, --output <file>
    Write output to <file> instead of stdout. If you are using {} or [] to fetch multiple documents, you can use '#' followed by a number in the <file> specifier. That variable will be replaced with the current string
    for the URL being fetched. Like in:

    curl http://{one,two}.example.com -o "file_#1.txt"

    or use several variables like:

    curl http://{site,host}.host[1-5].com -o "#1_#2"

    You may use this option as many times as the number of URLs you have. For example, if you specify two URLs on the same command line, you can use it like this:

    curl -o aa example.com -o bb example.net

    and the order of the -o options and the URLs doesn't matter, just that the first -o is for the first URL and so on, so the above command line can also be written as

    curl example.com example.net -o aa -o bb

    See also the --create-dirs option to create the local directories dynamically. Specifying the output as '-' (a single dash) will force the output to be done to stdout.

    See also -O, --remote-name and --remote-name-all and -J, --remote-header-name.


