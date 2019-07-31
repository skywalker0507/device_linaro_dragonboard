TARGET_PREBUILT_KERNEL ?= Image.gz-dtb-db845c

# Inherit the full_base and device configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/linaro/dragonboard/linaro_db845c/device.mk)
$(call inherit-product, device/linaro/dragonboard/device-common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Product overrides
PRODUCT_NAME := linaro_db845c
PRODUCT_DEVICE := linaro_db845c
PRODUCT_BRAND := Android
