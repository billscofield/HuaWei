

-R
    ping only. Record route. 
    Includes the RECORD_ROUTE option in the ECHO_REQUEST packet and displays the route buffer on returned packets. 

    Note that the IP header is only large enough for nine such routes.
    **Many hosts ignore or discard this option.**



-Q tos
    Set Quality of Service -related bits in ICMP datagrams.  tos can be decimal (ping only) or hex number.

    In RFC2474, these fields are interpreted as 8-bit Differentiated Services (DS), consisting of: 
    bits 0-1 (2 lowest bits) of separate data, and 
    bits 2-7 (highest 6 bits) of Differentiated Services Codepoint (DSCP). 
    
    In RFC2481 and RFC3168, bits 0-1 are used for ECN.

    Historically (RFC1349, obsoleted by RFC2474), these were interpreted as: 
    bit 0 (lowest bit) for reserved (currently being redefined as congestion control), 
    1-4 for Type of Service and 
    bits 5-7 (highest bits) for Precedence.

