include device/linaro/dragonboard/BoardConfigCommon.mk

# Board Information
TARGET_BOOTLOADER_BOARD_NAME := db845c
TARGET_BOARD_PLATFORM := db845c

TARGET_NO_KERNEL := false
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_USES_BOOT_HDR_V3 ?= true
ifeq ($(TARGET_USES_BOOT_HDR_V3), true)
 BOARD_BOOT_HEADER_VERSION := 3
 BOARD_KERNEL_PAGESIZE := 4096
 BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 103079215104 #96M
else
 BOARD_BOOT_HEADER_VERSION := 2
 BOARD_KERNEL_PAGESIZE := 2048
endif
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := earlycon firmware_class.path=/vendor/firmware/ androidboot.hardware=db845c
BOARD_KERNEL_CMDLINE += init=/init androidboot.boot_devices=soc@0/1d84000.ufshc printk.devkmsg=on
BOARD_KERNEL_CMDLINE += deferred_probe_timeout=30
BOARD_KERNEL_CMDLINE += pcie_pme=nomsi #For WiFi to work on rb5

# Image Configuration
BOARD_BOOTIMAGE_PARTITION_SIZE := 103079215104 #96M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 21474836480 #20G
BOARD_FLASH_BLOCK_SIZE := 512
# Super partition
BOARD_SUPER_PARTITION_SIZE := 12437225472
BOARD_DB_DYNAMIC_PARTITIONS_SIZE := 12433031168 # Reserve 4M for DAP metadata
BOARD_SUPER_PARTITION_METADATA_DEVICE := super
BOARD_SUPER_IMAGE_IN_UPDATE_PACKAGE := true
