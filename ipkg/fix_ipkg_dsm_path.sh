#!/bin/sh

which ipkg && echo "ipkg already in path" && exit 1

OPTWARE_PROFILE=/opt/etc/profile

FIX_OPTWARE_PATH="[ -f $OPTWARE_PROFILE ] && source $OPTWARE_PROFILE"

echo "** searching fix line into /etc/profile **"

grep -F "${FIX_OPTWARE_PATH}" /etc/profile && echo "command already in /etc/profile" &&  exit 1
echo $FIX_OPTWARE_PATH >> /etc/profile && echo "fix applied, reconnect to load OPTWARE path"
