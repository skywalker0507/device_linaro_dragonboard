PIXEL3_KERNEL_DIR := device/linaro/dragonboard-kernel/pixel3_mainline/

$(call inherit-product, device/linaro/dragonboard/pixel3_mainline/device.mk)
$(call inherit-product, device/linaro/dragonboard/full.mk)

# Product overrides
PRODUCT_NAME := pixel3_mainline
PRODUCT_DEVICE := pixel3_mainline
PRODUCT_BRAND := Android

ifndef PIXEL3_USES_GKI
PIXEL3_USES_GKI := true
endif

ifeq ($(PIXEL3_USES_GKI), true)
PIXEL3_MODS := $(wildcard $(PIXEL3_KERNEL_DIR)/*.ko)
ifneq ($(PIXEL3_MODS),)
  BOARD_VENDOR_KERNEL_MODULES += $(PIXEL3_MODS)
  P3_ONLY_VENDOR := %/msm.ko %/dwc3.ko %/dwc3-qcom.ko %/hci_uart.ko %/btqca.ko %/incrementalfs.ko
  P3_ONLY_VENDOR += %/ath10k_core.ko %/ath10k_pci.ko %/ath10k_snoc.ko %/ath.ko

  BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(filter-out $(P3_ONLY_VENDOR),$(PIXEL3_MODS))
endif
endif

PRODUCT_SHIPPING_API_LEVEL := 31

# Dynamic partitions
PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

PRODUCT_SOONG_NAMESPACES += \
    device/linaro/dragonboard \
    external/mesa3d \
    vendor/linaro/linux-firmware/$(EXPECTED_LINARO_VENDOR_VERSION) \
    vendor/linaro/db845c/$(EXPECTED_LINARO_VENDOR_VERSION) \
    vendor/linaro/rb5/$(EXPECTED_LINARO_VENDOR_VERSION)
