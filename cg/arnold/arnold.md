# arnold

Solid Angle is a computer graphics software company that specializes in
creating rendering software for the film, television and animation industries.
Their main product is Arnold

Solid Angle was acquired by Autodesk in 2016

## Network License Manager (NLM)

https://knowledge.autodesk.com/search-result/caas/sfdcarticles/sfdcarticles/Autodesk-Arnold-2018-Arnold-SDK-5-0-1-0-network-licensing.html

1. Network License Manager (NLM)
    
    get the NLM from https://www.autodesk.com/support/download-install/admins/network-licenses/install-licensing-software

    1. Install NLM

        1. Download NLM for Linux.

            https://download.autodesk.com/us/support/files/network_license_manager/linux/nlm11.18.0.0_ipv4_ipv6_linux64.tar.gz

        2. Open a shell as a superuser (using su).

        3. Extract the NLM package from the compressed file that you downloaded
           or navigate to the NetworkLicenseManager directory on your product
           installation media.

        4. Enter the following command, where # is the package number: rpm -ivh
           adlmflexnetserver-#.rpm

        Note: By default, NLM tools are installed in /opt/flexnetserver<.

    2. Uninstall NLM

        1. Stop the license server before you uninstall NLM.

        2. Open a shell as a superuser.

        3. Enter the following command to verify the package number of the
           Network License Manager software that you installed:

            rpm -qa | grep adlm

        4. Enter the following command to uninstall the Network License Manager
           package, where # is the package number:

            rpm -e adlmflexnetserver-#.rpm

        If you edited your rc.local file to configure your license server (for
        example, to start lmgrd), remove those commands from the rc.local file.

2. Get the Arnold license file

    Generate the Arnold license file from the Autodesk Account: Generate a
    Network License File in Autodesk Account (Video)

3. Install and Configure the NLM

    Install and configure the NLM on the server following the steps indicated
    here, depending on the OS used:

4. Set up the ADSKFLEX_LICENSE_FILE Environment Variable

    An Environment Variable is needed for Arnold to know where to pull a
    license.

    The below steps s needs to be done on the workstation where C4DtoA will
    run.

    Use a text editor to create a **flexlmrc.txt** file.

    Its content should look like below, except with the name or IP address of
    your license server:

        ADSKFLEX_LICENSE_FILE=@SERVER_HOSTNAME_OR_IP
     
    If the license server is on the same machine as Arnold, the flexlmrc file
    will look like this:
      
        ADSKFLEX_LICENSE_FILE=@localhost

    Save the txt file anywhere on the machine.

    Open a Terminal window and type open ~ to open the Home folder.

    Drag and drop the flexlmrc.txt file there.

    Type cd ~ to move the terminal to the Home folder.

    Finally run mv flexlmrc.txt .flexlmrc to make the file a configuration file.

5. Confirm Arnold is working

    Run a simple render (or batch render) with Arnold - if no watermarks are
    shown, Arnold is then pulling the license from the server correctly.
