

---
https://stackoverflow.com/questions/23981098/how-forward-and-reverse-dns-works

how reverse dns lookup works. 
Let's say if I want to find out what domain name is for the ip 12.34.56.78. I run the command dig -x 12.34.56.78. 
If my local dns server does not know the answer, which server does it further ask? Is it 12.in-addr.arpa., or 34.12.in-addr.arpa.? 
If this is the case, are these names like 12.in-addr.arpa. valid domain names? 
And where should they be deployed so that the reverse lookup requests will know whom to ask?


```How a reverse DNS lookup is accomplished:

The DNS resolver reverses the IP, and adds it to ".in-addr.arpa" (or ".ip6.arpa" for IPv6 lookups), turning 192.0.2.25 into 25.2.0.192.in-addr.arpa.
The DNS resolver then looks up the PTR record for 25.2.0.192.in-addr.arpa.
The DNS resolver asks the root servers for the PTR record for 25.2.0.192.in-addr.arpa.
The root servers refer the DNS resolver to the DNS servers in charge of the Class A range (192.in-addr.arpa, which covers all IPs that begin with 192).
In almost all cases, the root servers will refer the DNS resolver to a "RIR" ("Regional Internet Registry"). These are the organizations that allocate IPs. In general, ARIN handles North American IPs, APNIC handles Asian-Pacific IPs, and RIPE handles European IPs.
The DNS resolver will ask the ARIN DNS servers for the PTR record for 25.2.0.192.in-addr.arpa.
The ARIN DNS servers will refer the DNS resolver to the DNS servers of the organization that was originally given the IP range. These are usually the DNS servers of your ISP, or their bandwidth provider.
The DNS resolver will ask the ISP's DNS servers for the PTR record for 25.2.0.192.in-addr.arpa.
The ISP's DNS servers will refer the DNS resolver to the organization's DNS servers.
The DNS resolver will ask the organization's DNS servers for the PTR record for 25.2.0.192.in-addr.arpa.
The organization's DNS servers will respond with "host.example.com".

```

## what is rDNS

### what is arpa

The .arpa domain is the “Address and Routing Parameter Area” 
    **now** renamed the Address and Routing Parameter Area

The .arpa domain currently includes the following second-level domains:
DOMAIN                  USAGE / REFERENCE
arpa                    Reserved exclusively to support operationally-critical infrastructural identifier spaces as advised by the Internet Architecture Board
RFC 3172
as112.arpa              For sinking DNS traffic for reverse IP address lookups and other applications
RFC 7535
e164.arpa               For mapping E.164 numbers to Internet URIs
RFC 6116
home.arpa               For non-unique use in residential home networks
RFC 8375
in-addr-servers.arpa    For hosting authoritative name servers for the in-addr.arpa domain
RFC 5855
in-addr.arpa            For mapping IPv4 addresses to Internet domain names
RFC 1035
ip6-servers.arpa        For hosting authoritative name servers for the ip6.arpa domain
RFC 5855
ip6.arpa                For mapping IPv6 addresses to Internet domain names
RFC 3152
ipv4only.arpa           For detecting the presence of DNS64 and for learning the IPv6 prefix used for protocol translation
RFC 7050
iris.arpa               For locating Internet Registry Information Services
RFC 4698
uri.arpa                For resolving Uniform Resource Identifiers according to the Dynamic Delegation Discovery System
RFC 3405 draft-hardie-dispatch-rfc3405-update
urn.arpa                For resolving Uniform Resource Names according to the Dynamic Delegation Discovery System
RFC 3405

以上信息来自 https://www.iana.org/domains/arpa


###

## Pro DNS and BIND 10.pdf

Although sometimes this is required for diagnostic purposes, more frequently these days it is used for security
reasons to trace a hacker or spammer; indeed, most modern mailing systems use reverse mapping to
provide simple authentication by using DNS lookup policies (for instance, IP-to-name and name-to-IP)
to confirm that the specified IP address does represent the indicated host.

In order to perform reverse mapping using normal recursive and iterative queries, the DNS
designers defined a special (reserved) domain name called IN-ADDR.ARPA. The next section describes how
this special domain is constructed and used.

 the separators between fields can be either spaces or tabs. 


