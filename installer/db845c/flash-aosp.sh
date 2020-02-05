#!/bin/bash

INSTALLER_DIR="`dirname ${0}`"

# for cases that don't run "lunch db845c-userdebug"
if [ -z "${ANDROID_BUILD_TOP}" ]; then
    ANDROID_BUILD_TOP=${INSTALLER_DIR}/../../../../../
    ANDROID_PRODUCT_OUT="${ANDROID_BUILD_TOP}/out/target/product/db845c"
fi

if [ ! -d "${ANDROID_PRODUCT_OUT}" ]; then
    echo "FLASH-AOSP: error in locating out/target directory, check if it exist"
    exit
fi

echo "android out dir:${ANDROID_PRODUCT_OUT}"

# Set HDMI monitor output
echo "FLASH-AOSP: Set HDMI monitor output"
fastboot oem select-display-panel foobar
fastboot reboot bootloader

# Slot _a is already marked as active by bootloader but just in case..
echo "FLASH-AOSP: Mark _a slot as active"
fastboot set_active a
echo "FLASH-AOSP: Flash boot img"
fastboot flash boot "${ANDROID_PRODUCT_OUT}"/boot.img
echo "FLASH-AOSP: Flash super/dynamic image"
fastboot flash super "${ANDROID_PRODUCT_OUT}"/super.img
echo "FLASH-AOSP: Flash userdata image"
fastboot flash userdata "${ANDROID_PRODUCT_OUT}"/userdata.img

fastboot reboot
