include device/linaro/dragonboard/BoardConfigCommon.mk

# Board Information
TARGET_BOOTLOADER_BOARD_NAME := linaro_db845c
TARGET_BOARD_PLATFORM := linaro_db845c

# Bootloader/Kernel Configuration
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := firmware_class.path=/vendor/firmware/ androidboot.hardware=linaro_db845c
BOARD_KERNEL_CMDLINE += init=/init androidboot.boot_devices=soc/1d84000.ufshc printk.devkmsg=on

# Image Configuration
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864 #64M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 21474836480 #20G
BOARD_FLASH_BLOCK_SIZE := 512
# Super partition
BOARD_SUPER_PARTITION_SIZE := 10737418240 #10G
BOARD_DB_DYNAMIC_PARTITIONS_SIZE := 10737418240 #10G
BOARD_SUPER_PARTITION_METADATA_DEVICE := super
