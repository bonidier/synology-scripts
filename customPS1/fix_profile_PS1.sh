#!/bin/sh

HERE=$(dirname $0)

# your custom PS1 declaration goes here
CUSTOM_PS1=$HERE/confPS1/ps1.sh

FILES_PROFILE="/root/.profile /etc/profile /opt/etc/profile"
# destination file for your custom script to define PS1
MY_PS1=/etc/myps1.sh
# inclusion line for /etc/profile
INCLUDE_PS1="[ -f $MY_PS1 ] && source $MY_PS1"


[ ! -f "$CUSTOM_PS1" ] && echo "missing file $CUSTOM_PS1" && exit 1

### First step : remove generic PS1 entry ###
echo -e "Removing poor PS1 from default Synology profiles files\n"

read -p "press ENTER to remove PS1 from $FILES_PROFILE, or CTRL+C to quit"

for profile in $FILES_PROFILE
do
  echo "[working on $profile]"
  [ ! -f "$profile" ] && echo "$profile missing, pass" && continue
  
  grep '^PS1' $profile >/dev/null
  [ $? -ne 0 ] && echo "PS1 line already commented" && continue

  sed -e 's/^PS1/#PS1/' -i  $profile
  echo "PS1 line commented"
done


### Second step : add user defined PS1 globally
read -p "press ENTER to add your custom PS1 file $CUSTOM_PS1 to /etc/profile, or CTRL+C to quit"

# copying your source file
cp -f $CUSTOM_PS1 $MY_PS1

# is include line already present ?
grep -F "${INCLUDE_PS1}" /etc/profile >/dev/null && echo "command already in /etc/profile" &&  exit 1

echo "including $MY_PS1 to /etc/profile"
echo $INCLUDE_PS1 >> /etc/profile

echo "all done, reconnect !"

