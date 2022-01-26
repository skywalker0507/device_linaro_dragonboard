#!/bin/bash
# fetch, check & extract the current vendor package
set -e

if [ -z "${ANDROID_BUILD_TOP}" ]; then
    echo "Error: ANDROID_BUILD_TOP not defined, please run lunch"
    exit
fi

. "${ANDROID_BUILD_TOP}/device/linaro/dragonboard/vendor-package-ver.sh"

PKG_FILE=extract-linaro_devices-${EXPECTED_LINARO_VENDOR_VERSION}

pushd ${ANDROID_BUILD_TOP}
wget -nc ${VND_PKG_URL}

# generate expected sha512sum, check & cleanup
echo "${EXPECTED_LINARO_VENDOR_SHA}  ${PKG_FILE}.tgz" > ${PKG_FILE}.tgz.sha
sha512sum -c ${PKG_FILE}.tgz.sha
rm ${PKG_FILE}.tgz.sha

tar -xf ${PKG_FILE}.tgz
./${PKG_FILE}.sh
popd
