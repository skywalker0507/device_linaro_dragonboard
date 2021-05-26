#! /system/bin/sh
# Update lt9611uxc firmware to v43.
#
# Stock/Factory RB5 devices are flashed older firmware
# version (v40?) of lt9611uxc, so the display doesn't
# work with upstream kernel without the firmware ugrade.
# 
# This script will flash lt9611uxc_fw.bin on the systems
# running lt9611uxc firmware v42 or lower.

for f in /sys/bus/i2c/drivers/lt9611uxc/* ; do
	[ -L $f ] || continue
	version=`cat $f/lt9611uxc_firmware`
	if [ "$version" -lt "43" ] ; then
		echo > $f/lt9611uxc_firmware
	fi
done
