#!/bin/bash

export EXPECTED_LINARO_VENDOR_VERSION=20220106
export EXPECTED_LINARO_VENDOR_SHA=2359c501cd213c824fc8eb9782fc4f9ef36c8bf75a03e326730ffeb900ad67bf389fb90f659a5a0941fe73c07309ab0720590f94ee0bf9a87ccdc649290f279b
export VND_PKG_URL=https://releases.linaro.org/android/aosp-linaro-vendor-package/extract-linaro_devices-20220106.tgz

if [ "$1" = "url" ]; then
 echo $VND_PKG_URL
elif [ "$1" = "ver" ]; then
 echo $EXPECTED_LINARO_VENDOR_VERSION
elif [ "$1" = "sha" ]; then
 echo $EXPECTED_LINARO_VENDOR_SHA
fi
