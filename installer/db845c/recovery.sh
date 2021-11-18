#!/bin/bash

INSTALLER_DIR="`dirname ${0}`"

# for cases that don't run "lunch db845c-userdebug"
if [ -z "${ANDROID_BUILD_TOP}" ]; then
    ANDROID_BUILD_TOP="`readlink -f ${INSTALLER_DIR}/../../../../../`"
fi

FIRMWARE_DIR="${ANDROID_BUILD_TOP}/vendor/linaro_devices"

# TODO: Pull one-time recovery/qdl path out of standard install
# Flash bootloader firmware files
if [ ! -d "${FIRMWARE_DIR}/" ]; then
    echo "RECOVERY: No firmware directory?"
    echo "          Make sure the vendor binaries have been downloaded from"
    echo "          <URL>"
    echo "          and extracted to $ANDROID_BUILD_TOP/"
    exit
fi

QDL="`readlink -f ${FIRMWARE_DIR}/qcom/db845c/qdl/qdl`"

pushd "${FIRMWARE_DIR}/qcom/db845c/dragonboard-845c-bootloader-ufs-aosp" > /dev/null
echo "RECOVERY: Running QDL board recovery tool"
sudo ${QDL} prog_firehose_ddr.elf rawprogram[012345].xml patch[012345].xml
popd > /dev/null

echo
echo
echo "RECOVERY: Please boot the db845c into fastboot mode, and use the flash-all-aosp.sh script!"
echo
