LOCAL_PATH := $(call my-dir)

include device/linaro/dragonboard/utils.mk

# Adreno firmware files copied from
# http://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/RB3_firmware_20190529180356-v2.zip
firmware_files_display := \
    a630_gmu.bin \
    a630_sqe.fw  \
    a630_zap.b00 \
    a630_zap.b01 \
    a630_zap.b02 \
    a630_zap.elf \
    a630_zap.mdt

$(foreach f, $(firmware_files_display), $(call add-qcom-firmware, $(f), $(TARGET_OUT_VENDOR)/firmware/qcom/))
