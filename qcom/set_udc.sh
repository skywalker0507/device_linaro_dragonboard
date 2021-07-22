#! /vendor/bin/sh
# Grep and set the sys.usb.controller property from /sys/class/udc
# at the boot time.
#
# Upstream commit eb9b7bfd5954 ("arm64: dts: qcom: Harmonize DWC
# USB3 DT nodes name") (v5.14-rc1) changed the DTS USB node names,
# breaking the sys.usb.controller property hardcoded in the
# platfrom specific init.usb.common.rc
#
# This script will get rid of the static/hardcoded proprty name
# and set the property to the available on-board USB controller
# from /sys/class/udc instead. Assuming that we are dealing with
# the probable dummy_udc and only one on-board UDC enabled.

UDC=`/vendor/bin/ls /sys/class/udc/ | /vendor/bin/grep -v dummy | /vendor/bin/head -1`
setprop vendor.usb.controller $UDC
