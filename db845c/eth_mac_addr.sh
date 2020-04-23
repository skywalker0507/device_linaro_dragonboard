#! /system/bin/sh
# Set eth0 mac address.
# Get the unique board serial number from /proc/cmdline,
# do '0' padding to make it a 12 digit number and format
# the output in xx:xx:xx:xx:xx:xx format for the "ip"
# set address command to work.

SERIALNO=`cat /proc/cmdline | grep -o serialno.* | cut -f2- -d= | awk '{printf("%012s\n", $1)}' | sed 's/\(..\)/\1:/g' | sed '$s/.$//'`

/system/bin/ip link set dev eth0 down
/system/bin/ip link set dev eth0 address "$SERIALNO"
/system/bin/ip link set dev eth0 up
