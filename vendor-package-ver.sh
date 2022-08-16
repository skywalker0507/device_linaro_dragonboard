#!/bin/bash

export EXPECTED_LINARO_VENDOR_VERSION=20220726
#make sure to use sha512sum here
export EXPECTED_LINARO_VENDOR_SHA=62ff5d98eb9ab568aff035857379fa1cc2dbd69e5cdb13124e577ac1abd70ff21013c19956b5ae9834e1f5dbed672f52663c22d404c060c2cb7fff8aa85067f1
export VND_PKG_URL=https://releases.linaro.org/android/aosp-linaro-vendor-package/extract-linaro_devices-20220726.tgz

if [ "$1" = "url" ]; then
 echo $VND_PKG_URL
elif [ "$1" = "ver" ]; then
 echo $EXPECTED_LINARO_VENDOR_VERSION
elif [ "$1" = "sha" ]; then
 echo $EXPECTED_LINARO_VENDOR_SHA
fi
