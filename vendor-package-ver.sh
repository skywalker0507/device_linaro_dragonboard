#!/bin/bash

export EXPECTED_LINARO_VENDOR_VERSION=20240817
#make sure to use sha512sum here
export EXPECTED_LINARO_VENDOR_SHA=e87364277b1872430604cb7b1075e52837050ef7946bc5064f1056601013554734ccd077e7f19bc438a1aef3e316883118e7508504d907fa613cb45e3fa6a64b
export VND_PKG_URL=https://releases.devboardsforandroid.linaro.org/vendor-packages/20240817/extract-linaro_devices-20240817.tgz

if [ "$1" = "url" ]; then
 echo $VND_PKG_URL
elif [ "$1" = "ver" ]; then
 echo $EXPECTED_LINARO_VENDOR_VERSION
elif [ "$1" = "sha" ]; then
 echo $EXPECTED_LINARO_VENDOR_SHA
fi
