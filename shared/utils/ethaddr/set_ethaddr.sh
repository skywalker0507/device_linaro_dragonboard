#! /system/bin/sh
# Set eth0 mac address.
#
# Get the unique board serial number from /proc/cmdline or
# /proc/bootconfig, prepend '0's to the serial number to
# fill 5 LSBs of the MAC address and prepend "02" as MSB to
# prepare a 6 byte locally administered unicast MAC address.
#
# Format the output in xx:xx:xx:xx:xx:xx format for the "ip"
# set address command to work.

ETHADDR=`cat /proc/cmdline | grep -o serialno.* | cut -f2 -d'=' |\
	 awk '{printf("02%010s\n", $1)}' | sed 's/\(..\)/\1:/g' |\
	 sed '$s/:$//'`
if [ -z "${ETHADDR}" ]
then
ETHADDR=`cat /proc/bootconfig | grep -o serialno.* |\
	 cut -f2 -d'=' | cut -c 3-10 |\
	 awk '{printf("02%010s\n", $1)}' | sed 's/\(..\)/\1:/g' |\
	 sed '$s/:$//'`
fi

ip link set dev eth0 down
ip link set dev eth0 address "${ETHADDR}"
ip link set dev eth0 up
