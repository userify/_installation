#! /bin/sh +e

# --------------------------------------------
#
# uninstall.sh
# This script uninstalls the entire Userify agent and kills
# off any shim processes that are still running.
#
# --------------------------------------------

# Copyright (c) 2016 Userify Corp.

echo
echo
echo -------------------------------------------------------------
echo "Removing Userify..."

if [ "0" != "0" ]; then
    echo 'Need to have root privileges.'
    exit 1;
fi

# Debian, Ubuntu, RHEL:
sed -i "s/\/opt\/userify\/shim.sh \&//"     /etc/rc.local 2>/dev/null

# SUSE:
sed -i "s/\/opt\/userify\/shim.sh \&//"     /etc/init.d/after.local 2>/dev/null

# Fedora:
# systemctl disable userify-shim.service 2>/dev/null
# rm -f /etc/systemd/system/userify-shim.service 2>/dev/null

# Wipe out entire /opt/userify directory
rm -Rf /opt/userify/

# Kill off remaining shim processes
pkill shim. > /dev/null 2>&1

echo 

echo Finished!
echo Userify has been removed, but the user accounts it created still
echo exist and no changes have been made to them.
echo You can now install a new Userify shim as desired.
echo -------------------------------------------------------------
echo
echo

