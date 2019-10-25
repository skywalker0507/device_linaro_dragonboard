# Inherit the full_base and device configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/linaro/dragonboard/db845c/device.mk)
$(call inherit-product, device/linaro/dragonboard/device-common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Product overrides
PRODUCT_NAME := db845c
PRODUCT_DEVICE := db845c
PRODUCT_BRAND := Android

ifneq ($(DB845C_USES_GKI),)
# The path here need to be finalized (ideally in the dragonboard-kernel dir)
DB845C_MOD_DIR := device/linaro/dragonboard/db845c-mods/
DB845C_MODS := $(wildcard $(DB845C_MOD_DIR)/*.ko)
ifneq ($(DB845C_MODS),)
  BOARD_VENDOR_KERNEL_MODULES += $(DB845C_MODS)
  BOARD_VENDOR_RAMDISK_KERNEL_MODULES += $(DB845C_MODS)
endif
endif
