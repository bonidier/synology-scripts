#!/bin/sh
[ $(id -u) -ne 0 ] && echo "should be runned as root or sudo" && exit 1

HERE=$(dirname $0)

# your custom MOTD declaration goes here
FILE_CUSTOM_MOTD=$HERE/conf/motd.txt
FILE_CUSTOM_SSHD_BANNER=$HERE/conf/sshbanner.txt

DEST_SSHD_BANNER=/etc/issue.net

SSHD_CONFIG=/etc/ssh/sshd_config

### Step 1 : MOTD banner ###
[ ! -f "$FILE_CUSTOM_MOTD" ] && echo "missing file $FILE_CUSTOM_MOTD" && exit 1
read -p "press ENTER to set MOTD or CTRL+C to quit"
cp -fv $FILE_CUSTOM_MOTD /etc/motd

### Step 2 : SSH banner ###
[ ! -f "$FILE_CUSTOM_SSHD_BANNER" ] && echo "missing file $FILE_CUSTOM_SSHD_BANNER" && exit 
read -p "press ENTER to set SSH Banner or CTRL+C to quit"
cp -fv $FILE_CUSTOM_SSHD_BANNER /etc/issue.net

echo "You should reload sshd service to apply the banner !"

# Checking if banner is already set in sshd config
grep "^Banner $DEST_SSHD_BANNER" $SSHD_CONFIG >/dev/null && exit 

# set banner in sshd config
sed -i -e  's|\(.*Banner \).*$|\1'$DEST_SSHD_BANNER'|' $SSHD_CONFIG
sed -i -e  's|^#\(.*Banner.*\)$|\1|' $SSHD_CONFIG

echo "$DEST_SSHD_BANNER result :"
grep Banner $SSHD_CONFIG


