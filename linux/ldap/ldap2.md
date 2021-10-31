
https://www.digitalocean.com/community/tutorials/how-to-configure-openldap-and-perform-administrative-ldap-tasks

LDAP systems organize the data they store into hierarchical structures called
Directory Information Trees or DITs for short. Starting with version 2.3, the
actual configuration for OpenLDAP servers is managed within a special DIT,
typically rooted at an entry called cn=config.


This configuration system is known as OpenLDAP online configuration, or OLC.


What Does DSE Stand For?

DSE stands for “DSA specific entry”, which is a management or control entry in
an LDAP server. DSA stands for “directory system agent”, which basically means
a directory server that implements the LDAP protocol.



## Accessing the Root DSE

ldapsearch -H ldap:// -x -s base -b "" -LLL "+"

    -H ldap:// command is used to specify an unencrypted LDAP query on the localhost.

    -x without any authentication information lets the server know you want an
       anonymous connection.

    We tell it the search scope and set the search base to null with -s base -b "".

    We suppress some extraneous output with -LLL.

    the "+" specifies that we want to see the operational attributes that would
    normally be hidden (this is where we’ll find the information we need).

```

dn:
structuralObjectClass: OpenLDAProotDSE
configContext: cn=config
monitorContext: cn=Monitor
namingContexts: dc=my-domain,dc=com
supportedControl: 2.16.840.1.113730.3.4.18
supportedControl: 2.16.840.1.113730.3.4.2
supportedControl: 1.3.6.1.4.1.4203.1.10.1
supportedControl: 1.3.6.1.1.22
supportedControl: 1.2.840.113556.1.4.319
supportedControl: 1.2.826.0.1.3344810.2.3
supportedControl: 1.3.6.1.1.13.2
supportedControl: 1.3.6.1.1.13.1
supportedControl: 1.3.6.1.1.12
supportedExtension: 1.3.6.1.4.1.1466.20037
supportedExtension: 1.3.6.1.4.1.4203.1.11.1
supportedExtension: 1.3.6.1.4.1.4203.1.11.3
supportedExtension: 1.3.6.1.1.8
supportedFeatures: 1.3.6.1.1.14
supportedFeatures: 1.3.6.1.4.1.4203.1.5.1
supportedFeatures: 1.3.6.1.4.1.4203.1.5.2
supportedFeatures: 1.3.6.1.4.1.4203.1.5.3
supportedFeatures: 1.3.6.1.4.1.4203.1.5.4
supportedFeatures: 1.3.6.1.4.1.4203.1.5.5
supportedLDAPVersion: 3
entryDN:
subschemaSubentry: cn=Subschema

```


## Find the DITs this Server Manages

what DITs this particular LDAP server is configured to serve. We can find that
as the value of the namingContexts operational attribute that we can see in the
output above.

```
ldapsearch -H ldap:// -x -s base -b "" -LLL "namingContexts"

dn:
namingContexts: dc=example,dc=com
```

The base entry of each DIT on the server is available through the
namingContexts attribute. This is an operational attribute that would normally
be hidden, but calling it out explicitly allows it to be returned.


## Find the Configuration DIT

The DIT that can be used to configure the OpenLDAP server is not returned by a
search for namingContexts. The root entry of the config DIT is instead stored
in a dedicated attribute called configContext.


```

ldapsearch -H ldap:// -x -s base -b "" -LLL "configContext"

dn:
configContext: cn=config

```

ldapsearch -H ldapi:// -Y EXTERNAL -b "cn=config" -LLL -Q

    -Y EXTERNAL to indicate that we want to use a SASL authentication method.

    You also need to change the protocol from ldap:// to ldapi:// to make the
    request over a Unix socket. This allows OpenLDAP to verify the operating
    system user, which it needs to evaluate the access control properties.

    We then use the cn=config entry as the basis of our search.


To get a better idea of the hierarchy in which the information is organized and
stored, let’s just print out the various entry DNs instead:


    ```

    ldapsearch -H ldapi:// -Y EXTERNAL -b "cn=config" -LLL -Q dn

    dn: cn=config

    dn: cn=schema,cn=config

    dn: cn={0}core,cn=schema,cn=config

    dn: olcDatabase={-1}frontend,cn=config

    dn: olcDatabase={0}config,cn=config

    dn: olcDatabase={1}monitor,cn=config

    dn: olcDatabase={2}hdb,cn=config

    ```

Let’s take a look at what settings are handled by each of these entries:

The top-level entry contains some global settings that will apply to the entire
system (unless overridden in a more specific context). You can see what is
stored in this entry by typing:

    ldapsearch -H ldapi:// -Y EXTERNAL -b "cn=config" -LLL -Q -s base


## Find Admin Entry


To find the rootDN for each of your DITs, type:

```

sudo ldapsearch -H ldapi:// -Y EXTERNAL -b "cn=config" "(olcRootDN=*)" olcSuffix olcRootDN olcRootPW -LLL -Q

dn: olcDatabase={2}hdb,cn=config
olcSuffix: dc=my-domain,dc=com
olcRootDN: cn=Manager,dc=my-domain,dc=com

```

## Viewing Schema Information

LDAP schemas define the objectClasses and attributes available to the system


View the Built-In Schema

    ldapsearch -H ldapi:// -Y EXTERNAL -b "cn=schema,cn=config" -s base -LLL -Q | less

View Additional Schema

    ```

    ldapsearch -H ldapi:// -Y EXTERNAL -b "cn=schema,cn=config" -s one -Q -LLL dn

    dn: cn={0}core,cn=schema,cn=config

    ```

    if we wanted to see the cn={3}inetorgperson schema listed above, we could type:
        
        ldapsearch -H ldapi:// -Y EXTERNAL -b "cn={0}core,cn=schema,cn=config" -s base -LLL -Q | less

    If you want to print all of the additional schema, instead type:
        
        ldapsearch -H ldapi:// -Y EXTERNAL -b "cn=schema,cn=config" -s one -LLL -Q | less

    If you want to print out all of the schema, including the built-in schema, use this instead:
        
        ldapsearch -H ldapi:// -Y EXTERNAL -b "cn=schema,cn=config" -LLL -Q | less


If you want to print all of the additional schema, instead type:

    
