ifneq ($(filter db845c db845c_mini linaro_swr sm8x50, $(TARGET_DEVICE)),)

DTC := $(HOST_OUT)/bin/dtc
FDTOVERLAY := $(HOST_OUT)/bin/fdtoverlay
SM8550HDK_DTS_OVERLAY := device/linaro/dragonboard/sm8x50/dtb-overlays/sm8550-hdk.dts
SM8550QRD_DTS_OVERLAY := device/linaro/dragonboard/sm8x50/dtb-overlays/sm8550-qrd.dts
SM8650QRD_DTS_OVERLAY := device/linaro/dragonboard/sm8x50/dtb-overlays/sm8650-qrd.dts

DB845C_DTB := $(TARGET_KERNEL_DIR)/sdm845-db845c.dtb
RB5_DTB := $(wildcard $(TARGET_KERNEL_DIR)/qrb5165-rb5.dtb)
SM8550HDK_DTB := $(wildcard $(TARGET_KERNEL_DIR)/sm8550-hdk.dtb)
SM8550QRD_DTB := $(wildcard $(TARGET_KERNEL_DIR)/sm8550-qrd.dtb)
SM8650QRD_DTB := $(wildcard $(TARGET_KERNEL_DIR)/sm8650-qrd.dtb)

$(PRODUCT_OUT)/dtb.img: $(DTC) $(FDTOVERLAY)
	-$(DTC) -@ -I dts -O dtb -o $(PRODUCT_OUT)/sm8550-hdk.dtbo $(SM8550HDK_DTS_OVERLAY)
	-$(FDTOVERLAY) -i $(SM8550HDK_DTB) -o $(PRODUCT_OUT)/sm8550-hdk.dtb $(PRODUCT_OUT)/sm8550-hdk.dtbo
	-$(DTC) -@ -I dts -O dtb -o $(PRODUCT_OUT)/sm8550-qrd.dtbo $(SM8550QRD_DTS_OVERLAY)
	-$(FDTOVERLAY) -i $(SM8550QRD_DTB) -o $(PRODUCT_OUT)/sm8550-qrd.dtb $(PRODUCT_OUT)/sm8550-qrd.dtbo
	-$(DTC) -@ -I dts -O dtb -o $(PRODUCT_OUT)/sm8650-qrd.dtbo $(SM8650QRD_DTS_OVERLAY)
	-$(FDTOVERLAY) -i $(SM8650QRD_DTB) -o $(PRODUCT_OUT)/sm8650-qrd.dtb $(PRODUCT_OUT)/sm8650-qrd.dtbo
	-cat $(DB845C_DTB) $(RB5_DTB) $(PRODUCT_OUT)/sm8550-hdk.dtb $(PRODUCT_OUT)/sm8550-qrd.dtb $(PRODUCT_OUT)/sm8650-qrd.dtb > $@
	-rm $(PRODUCT_OUT)/sm8*dtb*

droidcore: $(PRODUCT_OUT)/dtb.img

endif
