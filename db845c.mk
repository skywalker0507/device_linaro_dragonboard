# Target defaults to 64- and 32-bit
TARGET_64BIT_ONLY ?= false

# Target can boot 16K kernels - defaults to false
# If BOOTS_16K is set, enable 64BIT_ONLY as well
# since that's a prerequisite
TARGET_BOOTS_16K ?= false
ifeq ($(TARGET_BOOTS_16K), true)
  TARGET_64BIT_ONLY := true
endif

$(call inherit-product, device/linaro/dragonboard/full.mk)
ifeq ($(TARGET_64BIT_ONLY), true)
  $(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
else
  $(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
endif
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/drm_hwcomposer/device.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/mesa/device.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/minigbm_msm/device.mk)
$(call inherit-product, device/linaro/dragonboard/db845c/device.mk)

#Boot with Android boot image header v3
ifeq ($(TARGET_KERNEL_USE),5.4)
  TARGET_USES_BOOT_HDR_V3 := true
else
  TARGET_USES_BOOT_HDR_V3 ?= false
endif

#Boot from mmc-sdcard
TARGET_SDCARD_BOOT ?= false

#Target uses GBL efi app
ifeq ($(TARGET_SDCARD_BOOT), true)
  TARGET_USES_GBL ?= false
else
  TARGET_USES_GBL := false
endif

#Load kernel modules in parallel
ifneq ($(filter 5.15 6.1 6.6, $(TARGET_KERNEL_USE)),)
  TARGET_USES_LMP ?= false
else
  TARGET_USES_LMP := false
endif

# Product overrides
PRODUCT_NAME := db845c
PRODUCT_DEVICE := db845c
PRODUCT_BRAND := Android
