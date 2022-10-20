#!/bin/bash

export EXPECTED_LINARO_VENDOR_VERSION=20221011
#make sure to use sha512sum here
export EXPECTED_LINARO_VENDOR_SHA=aa7cc267985be207beac3c67c80ce9bffb12562fa970de49f3832f997996a03299147b94e24738c74d2a68783f29129ba6ac127146b730a5c10b6eb8f1d0da51
export VND_PKG_URL=https://releases.linaro.org/android/aosp-linaro-vendor-package/extract-linaro_devices-20221011.tgz

if [ "$1" = "url" ]; then
 echo $VND_PKG_URL
elif [ "$1" = "ver" ]; then
 echo $EXPECTED_LINARO_VENDOR_VERSION
elif [ "$1" = "sha" ]; then
 echo $EXPECTED_LINARO_VENDOR_SHA
fi
