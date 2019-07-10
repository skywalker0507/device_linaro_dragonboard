#!/bin/bash

INSTALLER_DIR="`dirname ${0}`"

QDL="`readlink -f ${INSTALLER_DIR}/qdl`"
FIRMWARE_DIR="dragonboard-845c-bootloader-ufs-aosp-14"

# for cases that don't run "lunch linaro_db845c-userdebug"
if [ -z "${ANDROID_BUILD_TOP}" ]; then
    ANDROID_BUILD_TOP=${INSTALLER_DIR}/../../../../../
    ANDROID_PRODUCT_OUT="${ANDROID_BUILD_TOP}/out/target/product/linaro_db845c"
fi

if [ ! -d "${ANDROID_PRODUCT_OUT}" ]; then
    echo "error in locating out directory, check if it exist"
    exit
fi

echo "android out dir:${ANDROID_PRODUCT_OUT}"

# TODO: Pull one-time recovery/qdl path out of standard install
# Flash bootloader firmware files
if [ ! -d "${INSTALLER_DIR}/${FIRMWARE_DIR}/" ]; then
    echo "No firmware directory? Make sure binaries have been provided"
    exit
fi

pushd "${INSTALLER_DIR}/${FIRMWARE_DIR}"
sudo "${QDL}" prog_firehose_ddr.elf rawprogram[012345].xml patch[012345].xml
popd

# Flash AOSP images
# Timeout (atleast 10sec) to let db845c reboot in fastboot mode
sleep 15

# Set HDMI monitor output
fastboot oem select-display-panel foobar
fastboot reboot bootloader

# Slot _a is already marked as active by bootloader but just in case..
fastboot set_active a
fastboot flash system_a "${ANDROID_PRODUCT_OUT}"/super.img
fastboot flash userdata "${ANDROID_PRODUCT_OUT}"/userdata.img
# Mostly redundant but we run into following flashing error at times
# FAILED (remote: 'Failed to load/authenticate boot image: Load Error')
# so set the active slot again just in case..
fastboot set_active a
fastboot flash boot "${ANDROID_PRODUCT_OUT}"/boot.img
fastboot reboot
