
## 安装

brew install launchctl
brew install launchctl-completion


## launchctl 使用

launchctl 帮助

$ launchctl help
Usage: launchctl <subcommand> ... | help [subcommand]

Subcommands:
    bootstrap       Bootstraps a domain or a service into a domain.
    bootout         Tears down a domain or removes a service from a domain.
    enable          Enables an existing service.
    disable         Disables an existing service.
    uncache         Removes the specified service name from the service cache.
    kickstart       Forces an existing service to start.
    attach          Attach the system's debugger to a service.
    debug           Configures the next invocation of a service for debugging.
    kill            Sends a signal to the service instance.
    blame           Prints the reason a service is running.
    print           Prints a description of a domain or service.
    print-cache     Prints information about the service cache.
    print-disabled  Prints which services are disabled.
    plist           Prints a property list embedded in a binary (targets the Info.plist by default).
    procinfo        Prints port information about a process.
    hostinfo        Prints port information about the host.
    resolveport     Resolves a port name from a process to an endpoint in launchd.
    limit           Reads or modifies launchd's resource limits.
    runstats        Prints performance statistics for a service.
    examine         Runs the specified analysis tool against launchd in a non-reentrant manner.
    config          Modifies persistent configuration parameters for launchd domains.
    dumpstate       Dumps launchd state to stdout.
    dumpjpcategory  Dumps the jetsam properties category for all services.
    reboot          Initiates a system reboot of the specified type.
    bootshell       Brings the system up from single-user mode with a console shell.
    load            Bootstraps a service or directory of services.
    unload          Unloads a service or directory of services.
    remove          Unloads the specified service name.
    list            Lists information about services.
    start           Starts the specified service.
    stop            Stops the specified service if it is running.
    setenv          Sets the specified environment variables for all services within the domain.
    unsetenv        Unsets the specified environment variables for all services within the domain.
    getenv          Gets the value of an environment variable from within launchd.
    bsexec          Execute a program in another process' bootstrap context.
    asuser          Execute a program in the bootstrap context of a given user.
    submit          Submit a basic job from the command line.
    managerpid      Prints the PID of the launchd controlling the session.
    manageruid      Prints the UID of the current launchd session.
    managername     Prints the name of the current launchd session.
    error           Prints a description of an error.
    variant         Prints the launchd variant.
    version         Prints the launchd version.
    help            Prints the usage for a given subcommand.
