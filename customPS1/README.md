# CustomPS1

## What is it ?

The default PS1 prompt on Synology NAS only contains the hostname.

Most of people custom their PS1 under a user account (root,admin), or globally in /etc/profile, but each time you upgrade your DSM release, PS1 goes back to default value


## What does it do ?

1/ PS1 removed from this profile files (if exists, and if needed)

    /root/.profile
    /etc/profile
    /opt/etc/profile (ipkg)

2/ Copy your personal file to /etc/myps1.sh, and include it in /etc/profile if necessary


## Configuration

Create your personal PS1 definition in confPS1/ps1.sh, see example file

## Usage

As root, or under a user with sudo privileges (install it from ipkg)
(and each time you update your DSM release)

    (sudo) sh customPS1/fix_profile_PS1.sh

Just reconnect, under any users, your global prompt should appears :-)



