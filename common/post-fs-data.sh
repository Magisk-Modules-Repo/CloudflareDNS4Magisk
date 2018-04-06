#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

# Set CF DNS servers address
setprop net.eth0.dns1 1.1.1.1
setprop net.eth0.dns2 1.0.0.1

setprop net.dns1 1.1.1.1
setprop net.dns2 1.0.0.1

setprop net.ppp0.dns1 1.1.1.1
setprop net.ppp0.dns2 1.0.0.1

setprop net.rmnet0.dns1 1.1.1.1
setprop net.rmnet0.dns2 1.0.0.1

setprop net.rmnet1.dns1 1.1.1.1
setprop net.rmnet1.dns2 1.0.0.1

setprop net.pdpbr1.dns1 1.1.1.1
setprop net.pdpbr1.dns2 1.0.0.1

setprop 2606:4700:4700::1111
setprop 2606:4700:4700::1001



# Edit the resolv conf file if it exist

if [ -a /system/etc/resolv.conf ]; then
	mkdir -p $MODDIR/system/etc/
	printf "nameserver 1.1.1.1\nnameserver 1.0.0.1" >> $MODDIR/system/etc/resolv.conf
	chmod 644 $MODDIR/system/etc/resolv.conf
fi
