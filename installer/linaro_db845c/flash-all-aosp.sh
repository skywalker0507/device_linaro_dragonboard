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

pushd "${INSTALLER_DIR}/${FIRMWARE_DIR}" > /dev/null
sudo "${QDL}" prog_firehose_ddr.elf rawprogram[012345].xml patch[012345].xml
popd > /dev/null

# Flash AOSP images if rebooted into fastboot mode
echo "   **********   Flash AOSP images."
# Timeout (atleast 20sec) to let db845c reboot in fastboot mode
echo "FLASH-ALL-AOSP: Sleep 20sec to let db845c reboot in fastboot mode post QDL flashing"
sleep 20

FASTBOOT_DEVICE=$(fastboot devices | grep fastboot)
if [[ -z ${FASTBOOT_DEVICE} ]]; then
    echo "FLASH-ALL-AOSP: db845c has not rebooted into fastboot mode."
    echo "   **********   Abort flashing of AOSP images."
    exit
fi

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
echo "FLASH-ALL-AOSP: Flash boot image"
fastboot flash boot "${ANDROID_PRODUCT_OUT}"/boot.img
fastboot reboot
