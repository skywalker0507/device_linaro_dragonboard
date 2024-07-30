$(call inherit-product, device/linaro/dragonboard/full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Target boots with software rendering by default
TARGET_USES_SWR ?= true
$(call inherit-product, device/linaro/dragonboard/shared/graphics/drm_hwcomposer/device.mk)
ifeq ($(TARGET_USES_SWR), true)
  $(call inherit-product, device/linaro/dragonboard/shared/graphics/swangle/device.mk)
else
  $(call inherit-product, device/linaro/dragonboard/shared/graphics/mesa/device.mk)
  TARGET_USES_VULKAN := true
  PRODUCT_VENDOR_PROPERTIES += debug.hwui.renderer=skiagl
  PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.environ.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.environ.rc
endif
$(call inherit-product, device/linaro/dragonboard/shared/graphics/minigbm_msm/device.mk)

$(call inherit-product, device/linaro/dragonboard/sm8x50/device.mk)

#Boot from mmc-sdcard
TARGET_SDCARD_BOOT ?= true

# Product overrides
PRODUCT_NAME := sm8x50
PRODUCT_DEVICE := sm8x50
PRODUCT_BRAND := Android
