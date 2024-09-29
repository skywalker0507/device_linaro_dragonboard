ifneq ($(filter db845c db845c_mini linaro_swr sm8x50, $(TARGET_DEVICE)),)

DTC := $(HOST_OUT)/bin/dtc
FDTOVERLAY := $(HOST_OUT)/bin/fdtoverlay

SM8X50_STAGING_DIR := $(call intermediates-dir-for,PACKAGING,dtb)

SM8X50_BOARDS ?= sm8450-hdk sm8450-qrd sm8550-hdk sm8550-qrd sm8650-hdk sm8650-mtp sm8650-qrd
SM8X50_DTBS := $(foreach board,$(SM8X50_BOARDS),$(wildcard $(TARGET_KERNEL_DIR)/$(board).dtb))
SM8X50_DTBS := $(addprefix $(SM8X50_STAGING_DIR)/,$(notdir $(SM8X50_DTBS)))
SM8X50_DTBOS := $(patsubst %.dtb,%.dtbo,$(SM8X50_DTBS))

# generate the .dtbo which contains the msm-id and board-id
$(SM8X50_DTBOS): $(SM8X50_STAGING_DIR)/%.dtbo: device/linaro/dragonboard/sm8x50/dtb-overlays/%.dts $(DTC)
	-$(DTC) -@ -I dts -O dtb -o $@ $<

# apply the above .dtbo to the prebuilt .dtb
$(SM8X50_DTBS): $(SM8X50_STAGING_DIR)/%.dtb: $(TARGET_KERNEL_DIR)/%.dtb $(SM8X50_STAGING_DIR)/%.dtbo | $(FDTOVERLAY)
	-$(FDTOVERLAY) -o $@ -i $^

DB845C_DTB := $(TARGET_KERNEL_DIR)/sdm845-db845c.dtb
RB5_DTB := $(wildcard $(TARGET_KERNEL_DIR)/qrb5165-rb5.dtb)

$(PRODUCT_OUT)/dtb.img: $(SM8X50_DTBS) $(RB5_DTB) $(DB845C_DTB)
	-cat $(SM8X50_DTBS) $(RB5_DTB) $(DB845C_DTB) > $@

droidcore: $(PRODUCT_OUT)/dtb.img

endif
