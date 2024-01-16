#!/bin/bash

export EXPECTED_LINARO_VENDOR_VERSION=20240116
#make sure to use sha512sum here
export EXPECTED_LINARO_VENDOR_SHA=296bd7b7caef406419e6f2543a5ab6b75faada6c35486be5030b0c760b40b81f90ace79b40e9b5326ca2a36975b75438cb0a211037ae18db84115a8a22871c39
export VND_PKG_URL=https://releases.devboardsforandroid.linaro.org/vendor-packages/20240116/extract-linaro_devices-20240116.tgz

if [ "$1" = "url" ]; then
 echo $VND_PKG_URL
elif [ "$1" = "ver" ]; then
 echo $EXPECTED_LINARO_VENDOR_VERSION
elif [ "$1" = "sha" ]; then
 echo $EXPECTED_LINARO_VENDOR_SHA
fi
