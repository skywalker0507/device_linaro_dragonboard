$(call inherit-product, device/linaro/dragonboard/full.mk)
$(call inherit-product, device/linaro/dragonboard/dragonboard_swr/device.mk)

# Target is using software rendering
TARGET_USES_SWR := true

# Product overrides
PRODUCT_NAME := dragonboard_swr
PRODUCT_DEVICE := dragonboard_swr
PRODUCT_BRAND := Android
