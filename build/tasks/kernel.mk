$(PRODUCT_OUT)/dtb.img: $(DB845C_KERNEL_DIR)/sdm845-db845c.dtb
	-cat $(DB845C_KERNEL_DIR)/sdm845-db845c.dtb $(DB845C_KERNEL_DIR)/qrb5165-rb5.dtb > $@

droidcore: $(PRODUCT_OUT)/dtb.img
