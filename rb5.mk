ifndef TARGET_KERNEL_USE
TARGET_KERNEL_USE := mainline
endif
RB5_KERNEL_DIR := device/linaro/dragonboard-kernel/android-$(TARGET_KERNEL_USE)

# Inherit the full_base and device configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/linaro/dragonboard/rb5/device.mk)
$(call inherit-product, device/linaro/dragonboard/device-common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Product overrides
PRODUCT_NAME := rb5
PRODUCT_DEVICE := rb5
PRODUCT_BRAND := Android

ifndef RB5_USES_GKI
  RB5_USES_GKI := true
endif

ifeq ($(RB5_USES_GKI), true)
  RB5_MODS := $(wildcard $(RB5_KERNEL_DIR)/*.ko)
  ifneq ($(RB5_MODS),)
    BOARD_VENDOR_RAMDISK_KERNEL_MODULES += $(RB5_MODS)
  endif
endif
