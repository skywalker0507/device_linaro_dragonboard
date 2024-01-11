ifneq ($(filter db845c db845c_mini linaro_swr, $(TARGET_DEVICE)),)

ifeq ($(TARGET_SDCARD_BOOT), true)
DB845C_DTS_OVERLAY := device/linaro/dragonboard/shared/utils/sdcard-boot/db845c-overlay.dts
DTC := $(HOST_OUT)/bin/dtc
FDTOVERLAY := $(HOST_OUT)/bin/fdtoverlay

$(PRODUCT_OUT)/dtb.img: $(DTC) $(FDTOVERLAY) $(TARGET_KERNEL_DIR)/sdm845-db845c.dtb $(DB845C_DTS_OVERLAY)
	$(DTC) -@ -I dts -O dtb -o $(PRODUCT_OUT)/db845c-overlay.dtbo $(DB845C_DTS_OVERLAY)
	$(FDTOVERLAY) -i $(TARGET_KERNEL_DIR)/sdm845-db845c.dtb -o $(PRODUCT_OUT)/dtb.img $(PRODUCT_OUT)/db845c-overlay.dtbo
	rm $(PRODUCT_OUT)/db845c-overlay.dtbo
else
$(PRODUCT_OUT)/dtb.img: $(TARGET_KERNEL_DIR)/sdm845-db845c.dtb $(wildcard $(TARGET_KERNEL_DIR)/qrb5165-rb5.dtb)
	cat $^ > $@
endif

droidcore: $(PRODUCT_OUT)/dtb.img

endif
