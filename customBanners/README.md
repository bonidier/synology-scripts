# CustomBanners

## What is it ?

This script set MOTD and SSH banners from custom files

Each time you upgrade your DSM release, MOTD or SSH Banners may goes back to default value


## What does it do ?

1/ Copy your MOTD to /etc/motd 

2/ Copy your SSH banner file to /etc/issue.net and activate this Banner in /etc/ssh/sshd_config if necessary

## Configuration

- Create your personal MOTD in conf/motd.txt
- Create your personal SSH Banner in conf/sshbanner.txt

## Usage

As root, or under a user with sudo privileges (install it from ipkg)
(and each time you update your DSM release)

    (sudo) customBanners/set_motd_and_sshBanner.sh

All you need after that is to reload SSHD daemon to apply his Banner



