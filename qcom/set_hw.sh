#! /vendor/bin/sh
# Set vendor.hw property to run device specific services
#
# grep the device name from /proc/device-tree/compatible

HW=`/vendor/bin/cat /proc/device-tree/compatible | /vendor/bin/grep rb5`

if [ -z "${HW}" ]; then
    setprop vendor.hw db845c
    setprop vendor.sound_card DB845c
else
    setprop vendor.hw rb5
    setprop vendor.sound_card Qualcomm-RB5-WSA8815-Speakers-DMIC0
fi
