$(call inherit-product, device/linaro/dragonboard/full.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/drm_hwcomposer/device.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/mesa/device.mk)
$(call inherit-product, device/linaro/dragonboard/shared/graphics/minigbm_msm/device.mk)
$(call inherit-product, device/linaro/dragonboard/rb5/device.mk)

# Product overrides
PRODUCT_NAME := rb5
PRODUCT_DEVICE := rb5
PRODUCT_BRAND := Android
