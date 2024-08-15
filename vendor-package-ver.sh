#!/bin/bash

export EXPECTED_LINARO_VENDOR_VERSION=20240723
#make sure to use sha512sum here
export EXPECTED_LINARO_VENDOR_SHA=95e5225a4fdc191c262eae2d0c42c311317e93fa357518d7633f8ff91c107319d9dbef1a7751a9322c78de79293083359e0bfc7690b0e2ed8056debe94ca2109
export VND_PKG_URL=https://releases.devboardsforandroid.linaro.org/vendor-packages/20240723/extract-linaro_devices-20240723.tgz

if [ "$1" = "url" ]; then
 echo $VND_PKG_URL
elif [ "$1" = "ver" ]; then
 echo $EXPECTED_LINARO_VENDOR_VERSION
elif [ "$1" = "sha" ]; then
 echo $EXPECTED_LINARO_VENDOR_SHA
fi
