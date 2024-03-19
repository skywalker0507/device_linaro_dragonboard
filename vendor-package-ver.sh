#!/bin/bash

export EXPECTED_LINARO_VENDOR_VERSION=20240318
#make sure to use sha512sum here
export EXPECTED_LINARO_VENDOR_SHA=5adf8f15aaed3d36c4fc7531a77e3bc0daf88fbf1532482804b157c0d4a18ed1f43c273bfd4f05e531adb5815913d71c1172d42bd41034a3dbd1a3d51ac7e4f4
export VND_PKG_URL=https://releases.devboardsforandroid.linaro.org/vendor-packages/20240318/extract-linaro_devices-20240318.tgz

if [ "$1" = "url" ]; then
 echo $VND_PKG_URL
elif [ "$1" = "ver" ]; then
 echo $EXPECTED_LINARO_VENDOR_VERSION
elif [ "$1" = "sha" ]; then
 echo $EXPECTED_LINARO_VENDOR_SHA
fi
