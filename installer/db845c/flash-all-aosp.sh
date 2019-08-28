#!/bin/bash

INSTALLER_DIR="`dirname ${0}`"

FIRMWARE_DIR="dragonboard-845c-bootloader-ufs-aosp-20"

# for cases that don't run "lunch db845c-userdebug"
if [ -z "${ANDROID_BUILD_TOP}" ]; then
    ANDROID_BUILD_TOP=${INSTALLER_DIR}/../../../../../
    ANDROID_PRODUCT_OUT="${ANDROID_BUILD_TOP}/out/target/product/db845c"
fi

if [ ! -d "${ANDROID_PRODUCT_OUT}" ]; then
    echo "FLASH-ALL-AOSP: error in locating out directory, check if it exist"
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

# Set HDMI monitor output
echo "FLASH-ALL-AOSP: Set HDMI monitor output"
fastboot oem select-display-panel foobar
fastboot reboot bootloader

# Slot _a is already marked as active by bootloader but just in case..
echo "FLASH-ALL-AOSP: Mark _a slot as active"
fastboot set_active a
echo "FLASH-ALL-AOSP: Flash super/dynamic image"
fastboot flash super "${ANDROID_PRODUCT_OUT}"/super.img
echo "FLASH-ALL-AOSP: Flash userdata image"
fastboot flash userdata "${ANDROID_PRODUCT_OUT}"/userdata.img

if [ "$1" != "" ]; then
    ANDROID_BUILD_TOP=${INSTALLER_DIR}/../../../../../
    ANDROID_OUT_HOST_BIN="${ANDROID_BUILD_TOP}/out/host/linux-x86/bin"

    echo "FLASH-ALL-AOSP: Building boot image with user provided ${1} kernel image"
    ${ANDROID_OUT_HOST_BIN}/mkbootimg --kernel ${1} --ramdisk ${ANDROID_PRODUCT_OUT}/ramdisk.img --base 0x80000000 --pagesize 2048 --cmdline "firmware_class.path=/vendor/firmware/ androidboot.hardware=db845c init=/init androidboot.boot_devices=soc/1d84000.ufshc printk.devkmsg=on buildvariant=userdebug" --output ${ANDROID_PRODUCT_OUT}/boot.img

    echo "FLASH-ALL-AOSP: Flash boot image"
    fastboot flash boot ${ANDROID_PRODUCT_OUT}/boot.img
    fastboot reboot
fi
