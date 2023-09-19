$(call inherit-product, device/linaro/dragonboard/full.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/drm_hwcomposer/device.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/minigbm_msm/device.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/swangle/device.mk)
$(call inherit-product, device/linaro/dragonboard/linaro_swr/device.mk)

# Target is using software rendering
TARGET_USES_SWR := true

# Product overrides
PRODUCT_NAME := linaro_swr
PRODUCT_DEVICE := linaro_swr
PRODUCT_BRAND := Android
