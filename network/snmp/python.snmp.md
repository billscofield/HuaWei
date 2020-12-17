
## debian 安装 easysnmp 方法


看官方文档: https://easysnmp.readthedocs.io/en/latest/


1. Easy SNMP has been tested and is supported on systems running Net-SNMP 5.7.x.

If your OS ships with this version of Net-SNMP, then you can install it without compiling it via your package manager:

    sudo apt-get install libsnmp-dev snmp-mibs-downloader

1. If your OS doesn’t ship with Net-SNMP 5.7.x, please follow instructions provided on the [Net-SNMP install page](http://www.net-snmp.org/docs/INSTALL.html) to build and install Net-SNMP 5.7.x on your system.

You’ll also need to ensure that you have the following packages installed so that Easy SNMP installs correctly:

    sudo apt-get install gcc python-dev

1. Install Easy SNMP via pip as follows:

    pip install easysnmp





## Quick Start

https://easysnmp.readthedocs.io/en/latest/


There are primarily two ways you can use the Easy SNMP library.

The first is with the use of a Session object which is most suitable when you are planning on requesting multiple pieces of SNMP data from a source.
    ```
    from easysnmp import Session

    # Create an SNMP session to be used for all our requests
    session = Session(hostname='localhost', community='public', version=2)

    # You may retrieve an individual OID using an SNMP GET
    location = session.get('sysLocation.0')

    # You may also specify the OID as a tuple (name, index)
    # Note: the index is specified as a string as it can be of other types than
    # just a regular integer
    contact = session.get(('sysContact', '0'))

    # And of course, you may use the numeric OID too
    description = session.get('.1.3.6.1.2.1.1.1.0')

    # Set a variable using an SNMP SET
    session.set('sysLocation.0', 'The SNMP Lab')

    # Perform an SNMP walk
    system_items = session.walk('system')

    # Each returned item can be used normally as its related type (str or int)
    # but also has several extended attributes with SNMP-specific information
    for item in system_items:
    print '{oid}.{oid_index} {snmp_type} = {value}'.format(
            oid=item.oid,
            oid_index=item.oid_index,
            snmp_type=item.snmp_type,
            value=item.value
            )
    ```


    You may also use Easy SNMP via its simple interface which is intended for one-off operations where you wish to specify all details in the request:

    ```
    from easysnmp import snmp_get, snmp_set, snmp_walk

    # Grab a single piece of information using an SNMP GET
    snmp_get('sysDescr.0', hostname='localhost', community='public', version=1)

    # Perform an SNMP SET to update data
    snmp_set(
        'sysLocation.0', 'My Cool Place',
            hostname='localhost', community='public', version=1
            
            )

    # Perform an SNMP walk
    snmp_walk('system', hostname='localhost', community='public', version=1)
    ```




    https://easysnmp.readthedocs.io/en/latest/session_api.html#easysnmp.Session.walk

    walk(oids=u'.1.3.6.1.2.1')

        Uses SNMP GETNEXT operation using the prepared session to automatically retrieve multiple pieces of information in an OID.

        Parameters: oids – you may pass in a single item (multiple values currently experimental) which may be a string representing 
                    the entire OID (e.g. ‘sysDescr.0’) or may be a tuple containing the name as its first item and index as its second (e.g. (‘sysDescr’, 0))

        Returns:    a list of SNMPVariable objects containing the values that were retrieved via SNMP
