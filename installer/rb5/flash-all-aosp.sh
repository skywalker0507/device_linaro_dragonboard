#!/bin/bash

INSTALLER_DIR="`dirname ${0}`"

FIRMWARE_DIR="rb5-bootloader-ufs-aosp"

# for cases that don't run "lunch rb5-userdebug"
if [ -z "${ANDROID_BUILD_TOP}" ]; then
    ANDROID_BUILD_TOP=${INSTALLER_DIR}/../../../../../
    ANDROID_PRODUCT_OUT="${ANDROID_BUILD_TOP}/out/target/product/rb5"
fi

if [ ! -d "${ANDROID_PRODUCT_OUT}" ]; then
    echo "FLASH-ALL-AOSP: error in locating out/target directory, check if it exist"
    exit
fi

echo "android out dir:${ANDROID_PRODUCT_OUT}"

# TODO: Pull one-time recovery/qdl path out of standard install
# Flash bootloader firmware files
if [ ! -d "${INSTALLER_DIR}/${FIRMWARE_DIR}/" ]; then
    echo "FLASH-ALL-AOSP: No firmware directory? Make sure binaries have been provided"
    exit
fi

pushd "${INSTALLER_DIR}/${FIRMWARE_DIR}" > /dev/null
./flashall
popd > /dev/null

echo "FLASH-ALL-AOSP: Flash boot img"
fastboot flash boot "${ANDROID_PRODUCT_OUT}"/boot.img
echo "FLASH-ALL-AOSP: Flash super/dynamic image"
fastboot flash super "${ANDROID_PRODUCT_OUT}"/super.img
echo "FLASH-ALL-AOSP: Flash userdata image"
fastboot flash userdata "${ANDROID_PRODUCT_OUT}"/userdata.img
echo "FLASH-ALL-AOSP: Flash vendor_boot image"
fastboot flash vendor_boot "${ANDROID_PRODUCT_OUT}"/vendor_boot.img
echo "FLASH-ALL-AOSP: Formatting metadata"
fastboot format:ext4 metadata

fastboot reboot
