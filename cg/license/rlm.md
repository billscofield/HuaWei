# RLM License Server

It can support a wide range of licensing models, including node-locked,
floating, subscription-based, and software-as-a-service (SaaS) licensing.

Additionally, RLM License Server supports integrations with popular license
management tools, such as FlexNet and Sentinel RMS.

1. solidangel

    license ISV Server Name: arnold
    网页端口默认 5054
    arnold

2. katana

    license ISV Server Name: foundry
    网页端口默认 4102

3. nuke

4. peregrinel

5. [boris fx](https://borisfx.com/support/documentation/rlm-license-server/#linux)

6. 

## other License Management Software

- Quick License Manager (QLM)
- Nalpeiron Zentitle
- [链接](https://sourceforge.net/software/license-management/)

## Ultimate RLM floating license server (credits to AMPED)

AMPED 是个组织？个人？

(bard)AMPED acquired Reprise Software in 2019.

AMPED in "AMPED rlm license server" stands for 
    (chatgpt)"**Advanced Multi-Platform Engine for Distributed license serving**".
    (bard)"**Advanced Management Platform for Effective Distribution**"

The AMPED license server is used to manage
the distribution and activation of software licenses for a variety of products,
including computer software and hardware. It provides a centralized platform
for managing licenses and ensures that the number of concurrent users does not
exceed the number of available licenses.

The "rlm" in "AMPED rlm license server" refers to Reprise License Manager,
which is the technology used to implement the license server.  (From chatGPT)

(chatgpt)The name "AMPED" is a term that is often used to refer to a group of
individuals or a community that is involved in cracking and distributing
software without authorization. This group is often associated with the illegal
distribution of pirated software, including cracking software license
protections.  It is unclear where the name "AMPED" specifically came from, but
it is likely used as a sort of code name or handle by the group as a way to
remain anonymous and avoid being traced or prosecuted for their activities. The
use of this name, as well as other aliases and handles, is common among
individuals and groups operating in the dark web or illegal markets.

## RLM License Administration

ISV: Independent Software Vendor

[RLM License Administration](extension://bfdogplmndidlpjfhoijckpakkdjkkil/pdf/viewer.html?file=https%3A%2F%2Fwww.reprisesoftware.com%2FRLM_License_Administration.pdf)

- the rlm (generic) license server provided by Reprise Software, called "rlm"
  on Unix systems, or "rlm.exe" on Windows. This is the same for every ISV who
  uses RLM.
- the rlm utilities ("rlmutil" on Unix, "rlmutil.exe" on Windows) provided by
  Reprise Software. This is the same for every ISV who uses RLM.
- **A custom license server**, built from components from Reprise Software by your
  ISV. This server will have a different name for each ISV.
- a license file to describe your rights to the product. This license file is
  unique to your site.

In addition to these components which your ISV supplies, you can create an ISV
options file to control various aspects of operation of each licensed product.

 RLM consists of 3 major components:
    1. a client library
    2. a license server (RLM has 2 license servers - a generic server called
       rlm and an ISV- specific server.)
    3. a text file which describes the licenses granted (the license file).

Your ISVs application is linked with the client library which provides access
to the license management functions.

License Administrator, have the ability to control certain aspects of the
license server's operations by specifying options in a file called the ISV
Options File.

### Installing an RLM-licensed Product

1. ISV provide an installation procedure that installs the license management
   components.

2. Your ISV will not provide you an installation procedure for the license
   server

    you need the three required licensing components for the license server:

        - The generic license server, rlm on Unix, rlm.exe on Windows.
        - The ISV's license server, either a settings file named isv.set, or a
          binary named isv on Unix, isv.exe on Windows.
        - The license file which describes your rights to the product.

    Optionally, you might want the RLM utilities - rlmutil on Unix, rlmutil.exe
    on Windows.  These utilities are often installed as their separate command
    names.

### License Administration Tools

 While the RLM web interface is the preferred method to administer RLM license
 servers, the command-line tools are provided as a convenience for use in
 administration scripts and programs. License Administrators can manage rlm by
 using the administration tools, as described in detail below:
    - rlmadduser
    - rlmanon
    - rlmdebug
    - rlmdown
    - rlmhostid
    - rlmnewlog,
    - rlmremove
    - rlmreread
    - rlmstat
    - rlmswitch
    - rlmswitchr.

On UNIX platforms, **rlmutil is an all- in-one utility which is installed with
hard links to all the utility program names.**

On windows, separate .exe files are provided for each utility.

<font color=red>RLM Client</font>

    ST hostname 023402380fc 5053

    ISV starnet port=57889
    
    - The RLM server gets the requests from the RLM client, looks up the ISV
      (in its internal list of ISV servers), and forwards the RLM client to the
      correct ISV server port number.

    - The RLM client then connects to the ISV server and sends a "check out"
      request for the requested license.

    - The RLM client needs to 'know' only the RLM server host name and port
      number.

## 说明

TCP: 5053 — RLM server port
TCP: 5054 — Web server port
TCP: 57889 — StarNet ISV port(ISV的端口可以不设置，使用随机端口)

    应该是这样的一个流程，client 首先连接 port5053, rlm 服务器找到相应的license
    server port, 然后告诉 client 连接指定的 port

Ports are specified in the license file. You can change the default listening
ports by modifying the port numbers in the license file

    ```
    HOST hostname 023402380fc 5053
    ISV starnet port=57889
    LICENSE ...
    ```
