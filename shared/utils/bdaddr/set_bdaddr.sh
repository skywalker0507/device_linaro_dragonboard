#! /vendor/bin/sh
# Set Bluetooth address (BT_ADDR).
#
# Get the unique board serial number from /proc/cmdline,
# prepend '0's to the serial number to fill 5 LSBs of the
# BT address and prepend "C0" as MSB to prepare a 6 byte
# Bluetooth Random Static Address. Reference:
# https://www.bluetooth.com/wp-content/uploads/2022/05/Bluetooth_LE_Primer_Paper.pdf [Page 23]
#
# Format the output in xx:xx:xx:xx:xx:xx format for the
# "bdaddr" command to work.

BTADDR=`/vendor/bin/cat /proc/cmdline | vendor/bin/grep -o serialno.* |\
	/vendor/bin/cut -f2 -d'=' | /vendor/bin/awk '{printf("C0%010s\n", $1)}' |\
	/vendor/bin/sed 's/\(..\)/\1:/g' | /vendor/bin/sed '$s/:$//'`

/vendor/bin/hw/bdaddr "${BTADDR}"
