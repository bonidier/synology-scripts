# fix_ipkg_dsm_path.sh

Each time you upgrade your DSM release,
the path to your IPKG binary is lost

this script include, if needed, the IPKG profile file to /etc/profile

As root :

    path/to/fix_ipkg_dsm_path.sh

Or under sudo user :

    /opt/bin/sudo ./fix_ipkg_dsm_path.sh


Just reconnect, and check :

    ipkg -v




