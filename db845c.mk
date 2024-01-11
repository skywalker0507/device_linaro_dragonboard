$(call inherit-product, device/linaro/dragonboard/full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/drm_hwcomposer/device.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/mesa/device.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/minigbm_msm/device.mk)
$(call inherit-product, device/linaro/dragonboard/db845c/device.mk)

ifeq ($(TARGET_KERNEL_USE),5.4)
  TARGET_USES_BOOT_HDR_V3 := true
else
  TARGET_USES_BOOT_HDR_V3 ?= false
endif

TARGET_SDCARD_BOOT ?= false
ifeq ($(TARGET_SDCARD_BOOT),true)
  # Older kernel versions define mmc@ nodes as sdhci@ nodes in their device tree
  TARGET_KERNEL_VER := $(wildcard 5*4 5*10 5*15)
endif

# Product overrides
PRODUCT_NAME := db845c
PRODUCT_DEVICE := db845c
PRODUCT_BRAND := Android
