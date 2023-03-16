## ldapsearch 

ldapsearch <options> filter [attrs...]

ldapsearch opens a connection to an LDAP server, binds, and performs a search
using specified parameters.   

The filter should conform to the string representation for search filters as
defined in RFC 4515.  If not provided, the default filter, (objectClass=\*), is
used.


If ldapsearch finds one or more entries, the attributes specified by attrs are returned.  
    If * is listed, all user attributes are returned.  
    If + is listed, all operational attributes are returned.  
    If no attrs are listed, all user attributes are  returned.

-b searchbase

    Use searchbase as the starting point for the search instead of the default.

-s {base|one|sub|children}

    Specify the scope of the search to be one of base, one, sub, or children to
    specify a base object, one-level, subtree, or children search.  The default
    is sub.  Note: children scope requires LDAPv3 subordinate feature
    extension.

    The base search scope means that only the entry given will be returned.

-H ldapuri

    Specify URI(s) referring to the ldap server(s); a list of URI, separated by
    whitespace or commas is expected; only the protocol/host/port fields are
    allowed.  As an exception, if no host/port is specified, but a DN is, the
    DN is used to look  up  the corresponding host(s) using the DNS SRV
    records, according to RFC 2782.  The DN must be a non-empty sequence of
    AVAs whose attribute type is "dc" (domain component), and must be escaped
    according to RFC 2396.

    -H ldap:// command is used to specify an unencrypted LDAP query on the localhost.

    -H ldapi:// to make the request over a Unix socket.

-x     Use simple authentication instead of SASL.

 -L     

    Search results are display in LDAP Data Interchange Format detailed in ldif(5).  

    A single -L restricts the output to LDIFv1.

    A second -L disables comments.  

    A third -L disables printing of the LDIF version.  

    The default is to use an extended version of LDIF.

-Y mech

    Specify the SASL mechanism to be used for authentication. If it's not
    specified, the program will choose the best mechanism the server knows.

    -Y EXTERNAL to indicate that we want to use a SASL authentication method.

-Q     Enable SASL Quiet mode.  Never prompt.
