$(call inherit-product, device/linaro/dragonboard/full.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/drm_hwcomposer/device.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/mesa/device.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/minigbm_msm/device.mk)
$(call inherit-product, device/linaro/dragonboard/db845c/device.mk)

ifeq ($(TARGET_KERNEL_USE),5.4)
  TARGET_USES_BOOT_HDR_V3 := true
else
  TARGET_USES_BOOT_HDR_V3 ?= false
endif

# Product overrides
PRODUCT_NAME := db845c
PRODUCT_DEVICE := db845c
PRODUCT_BRAND := Android
