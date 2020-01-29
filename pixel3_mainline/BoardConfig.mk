include device/linaro/dragonboard/BoardConfigCommon.mk

# Board Information
TARGET_BOOTLOADER_BOARD_NAME := pixel3_mainline
TARGET_BOARD_PLATFORM := pixel3_mainline

ifeq ($(PIXEL3_KERNEL_FOUND), true)
    # Bootloader/Kernel Configuration
    TARGET_NO_KERNEL         := false
    BOARD_KERNEL_BAS         := 0x00000000
    BOARD_KERNEL_PAGESIZE    := 4096
    BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
    BOARD_RAMDISK_OFFSET     := 0x02000000
    BOARD_KERNEL_CMDLINE     := firmware_class.path=/vendor/firmware/ androidboot.hardware=pixel3_mainline efi=noruntime
    BOARD_KERNEL_CMDLINE     += init=/init androidboot.boot_devices=soc/1d84000.ufshc printk.devkmsg=on
    BOARD_KERNEL_CMDLINE     += androidboot.super_partition=system_b #system_b is super partition
endif

# Image Configuration
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x04000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10737418240
BOARD_FLASH_BLOCK_SIZE := 131072
# Super partition
BOARD_SUPER_PARTITION_SIZE := 2952790016
BOARD_DB_DYNAMIC_PARTITIONS_SIZE := 2952790016
BOARD_SUPER_PARTITION_METADATA_DEVICE := system_b
