include device/linaro/dragonboard/BoardConfigCommon.mk

# Primary Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_VARIANT := kryo385
TARGET_CPU_ABI := arm64-v8a

# Secondary Arch
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_VARIANT := kryo385
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi

# Board Information
TARGET_BOOTLOADER_BOARD_NAME := db845c
TARGET_BOARD_PLATFORM := db845c

TARGET_NO_KERNEL := false
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
ifeq ($(TARGET_SDCARD_BOOT), true)
  BOARD_BOOT_HEADER_VERSION := 2
  # Older kernel versions define mmc@ nodes as sdhci@ nodes in their device tree
  ifneq ($(filter 5.4 5.10 5.15, $(TARGET_KERNEL_USE)),)
    BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc@0/8804000.sdhci
  else
    BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc@0/8804000.mmc
  endif
  BOARD_KERNEL_CMDLINE += androidboot.hardware=db845c
  BOARD_KERNEL_CMDLINE += androidboot.verifiedbootstate=orange
  # In case we are booting from U-Boot directly and androidboot.slot_suffix
  # is not set. Otherwise we run into the following error:
  # "init: [libfstab] Error updating for slotselect"
  BOARD_KERNEL_CMDLINE += androidboot.slot_suffix=_a
else ifeq ($(TARGET_USES_BOOT_HDR_V3), true)
    BOARD_BOOT_HEADER_VERSION := 3
    BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc@0/1d84000.ufshc
    BOARD_KERNEL_CMDLINE += androidboot.hardware=db845c
    BOARD_KERNEL_CMDLINE += androidboot.verifiedbootstate=orange
  else
    BOARD_BOOT_HEADER_VERSION := 4
    BOARD_BOOTCONFIG += androidboot.boot_devices=soc@0/1d84000.ufshc
    BOARD_BOOTCONFIG += androidboot.hardware=db845c
    BOARD_BOOTCONFIG += androidboot.verifiedbootstate=orange
endif
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE += earlycon firmware_class.path=/vendor/firmware/
BOARD_KERNEL_CMDLINE += init=/init printk.devkmsg=on
BOARD_KERNEL_CMDLINE += deferred_probe_timeout=30
BOARD_KERNEL_CMDLINE += pcie_pme=nomsi #For WiFi to work on rb5
BOARD_KERNEL_CMDLINE += qcom_geni_serial.con_enabled=1
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200n8

# Image Configuration
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296 #96M
BOARD_FLASH_BLOCK_SIZE := 4096
ifeq ($(TARGET_SDCARD_BOOT), true)
  BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648 #2G
  BOARD_SUPER_PARTITION_SIZE := 4294967296 #4G
  BOARD_DB_DYNAMIC_PARTITIONS_SIZE := 4290772992 # Reserve 4M for DAP metadata
  BOARD_SEPOLICY_DIRS += device/linaro/dragonboard/shared/utils/sdcard-boot/sepolicy/
else
  BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296 #96M
  BOARD_USERDATAIMAGE_PARTITION_SIZE := 21474836480 #20G
  BOARD_SUPER_PARTITION_SIZE := 12437225472
  BOARD_DB_DYNAMIC_PARTITIONS_SIZE := 12433031168 # Reserve 4M for DAP metadata
endif
BOARD_SUPER_PARTITION_METADATA_DEVICE := super
BOARD_SUPER_IMAGE_IN_UPDATE_PACKAGE := true
BOARD_DB_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor system_ext product

# dlkm partitions
include device/linaro/dragonboard/shared/utils/dlkm_loader/BoardConfig.mk
BOARD_DB_DYNAMIC_PARTITIONS_PARTITION_LIST += system_dlkm vendor_dlkm
BOARD_SEPOLICY_DIRS += device/linaro/dragonboard/shared/utils/dlkm_loader/sepolicy/

# Graphics
include device/linaro/dragonboard/shared/graphics/drm_hwcomposer/BoardConfig.mk
include device/linaro/dragonboard/shared/graphics/mesa/BoardConfig.mk
BOARD_SEPOLICY_DIRS += device/linaro/dragonboard/shared/graphics/minigbm_msm/sepolicy/
