include device/linaro/dragonboard/BoardConfigCommon.mk

# Board Information
TARGET_BOOTLOADER_BOARD_NAME := db845c
TARGET_BOARD_PLATFORM := db845c

TARGET_NO_KERNEL := false
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOT_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := earlycon firmware_class.path=/vendor/firmware/ androidboot.hardware=db845c
BOARD_KERNEL_CMDLINE += init=/init androidboot.boot_devices=soc@0/1d84000.ufshc printk.devkmsg=on
BOARD_KERNEL_CMDLINE += deferred_probe_timeout=30
# fw_devlink=on, https://android-review.googlesource.com/c/1305327, broke android-mainline
# Set fw_devlink=permissive for the time being
BOARD_KERNEL_CMDLINE += fw_devlink=permissive

# Image Configuration
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864 #64M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 21474836480 #20G
BOARD_FLASH_BLOCK_SIZE := 512
# Super partition
BOARD_SUPER_PARTITION_SIZE := 10737418240 #10G
BOARD_DB_DYNAMIC_PARTITIONS_SIZE := 10737418240 #10G
BOARD_SUPER_PARTITION_METADATA_DEVICE := super
BOARD_SUPER_IMAGE_IN_UPDATE_PACKAGE := true
