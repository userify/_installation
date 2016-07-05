= Userify Installation


This repo shows what happens when Userify is first installed and what a working
Userify installation looks like.


Immediately after installation, this will be displayed on screen:


       
                             _--_
                            (    \
                         --/      )
                    .-- /   \      \
                  ./   \            ) _  __
                 /_   _ ___  ___ _ __(_)/ _|_   _
                 | | | / __|/ _ \ '__| | |_  | | |
                 | |_| \__ \  __/ |  | |  _| |_| |
                  \__,_|___/\___|_|  |_|_|  \__, |
                                            |___/  tm
    
                    Installing Userify now..                     
    -------------------------------------------------------------
    Tip: to understand how the shim works, read the source at
    https://github.com/userify/shim/
    
    Creating Userify directory (/opt/userify/)
    Creating uninstall script (/opt/userify/uninstall.sh)
    Creating API login config (/opt/userify/creds.py)
    Creating shim (/opt/userify/shim.{sh,py})
    Removing exit 0 from rc.local (if there)
    Checking Shim Startup
    Adding Linux Startup Script to /etc/rc.local
    Setting Permissions
    Launching shim.sh
    
    Finished. Userify shim has been completely installed.
    /opt/userify/uninstall.sh as root to uninstall.
    debug=1 is enabled in /opt/userify/userify_config.py for extra verbosity.
    Please review shim output in /var/log/userify-shim.log
    
    cat /var/log/userify-shim.log
    
    Thanks for using Userify!
    
    -------------------------------------------------------------



The following files will be created and any user accounts specified in
the Userify console will be instantly created, SSH keys created, and sudo
rights granted (if applicable).


+    [opt/userify/userify_config.py](opt/userify/userify_config.py)
+    [opt/userify/creds.py](opt/userify/creds.py)
+    [opt/userify/shim.sh](opt/userify/shim.sh)
+    [var/log/userify_shim.log](var/log/userify_shim.log)
+    [uninstall.sh](uninstall.sh)


Depending on the type of system, /opt/userify/shim.sh will be set up to
execute on boot using the least invasive way possible (many systems
will just get a line appended  /etc/rc.local: /opt/userify/shim.sh &).


That's all there is to it! More info available at the Userify shim
source repo: https://github.com/userify/shim/



Copyright © 2016 Userify Corporation

