#! /bin/bash +e

# --------------------------------------------
#
# shim.sh
# Calls shim.py.
# 04012016-1#
# --------------------------------------------

# Copyright (c) 2016 Userify Corp.

static_host="static.userify.com"
touch /opt/userify/userify_config.py
source /opt/userify/userify_config.py
[ "x$self_signed" == "x1" ] && SELFSIGNED='k' || SELFSIGNED=''

# keep userify-shim.log from getting too big
touch /var/log/userify-shim.log
[[ $(find /var/log/userify-shim.log -type f -size +524288c 2>/dev/null) ]] &&     mv -f /var/log/userify-shim.log /var/log/userify-shim.log.1
touch /var/log/userify-shim.log
chmod -R 600 /var/log/userify-shim.log

# kick off shim.py
[ -z "$PYTHON" ] && PYTHON="$(which python)"
curl -1 -f${SELFSIGNED}Ss https://$static_host/shim.py | $PYTHON -u >>/var/log/userify-shim.log 2>&1

if [ $? != 0 ]; then
    # extra backoff in event of failure,
    # randomized between one and seven minutes
    sleep $(($RANDOM%360+60))
fi

sleep 5

# call myself. fork before exiting.
/opt/userify/shim.sh &
