#!/bin/bash

export EXPECTED_LINARO_VENDOR_VERSION=20220629
#make sure to use sha512sum here
export EXPECTED_LINARO_VENDOR_SHA=344c60c78b36b991e966cec79534ca4a41224b792619296575d2f05c6cd4f2987bd6614fa1f093256ae69f430674ae36483839458cf8002b6c8eff08da721de4
export VND_PKG_URL=https://releases.linaro.org/android/aosp-linaro-vendor-package/extract-linaro_devices-20220629.tgz

if [ "$1" = "url" ]; then
 echo $VND_PKG_URL
elif [ "$1" = "ver" ]; then
 echo $EXPECTED_LINARO_VENDOR_VERSION
elif [ "$1" = "sha" ]; then
 echo $EXPECTED_LINARO_VENDOR_SHA
fi
