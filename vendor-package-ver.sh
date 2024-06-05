#!/bin/bash

export EXPECTED_LINARO_VENDOR_VERSION=20240405
#make sure to use sha512sum here
export EXPECTED_LINARO_VENDOR_SHA=b287858201bb3d3eaac4f2fa2626e2a594b5ea4364ad9fff8910c572e4c1b1a81283c48d342c1dc86984990fbd13720cdf4469e180a70624a739ccd168b50837
export VND_PKG_URL=https://releases.devboardsforandroid.linaro.org/vendor-packages/20240405/extract-linaro_devices-20240405.tgz

if [ "$1" = "url" ]; then
 echo $VND_PKG_URL
elif [ "$1" = "ver" ]; then
 echo $EXPECTED_LINARO_VENDOR_VERSION
elif [ "$1" = "sha" ]; then
 echo $EXPECTED_LINARO_VENDOR_SHA
fi
