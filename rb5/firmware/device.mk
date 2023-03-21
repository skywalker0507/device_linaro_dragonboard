# Copy firmware files

PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/a650_gmu.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/a650_gmu.bin			\
    $(LOCAL_PATH)/a650_sqe.fw:$(TARGET_COPY_OUT_VENDOR)/firmware/a650_sqe.fw			\
    $(LOCAL_PATH)/a650_zap.b00:$(TARGET_COPY_OUT_VENDOR)/firmware/a650_zap.b00			\
    $(LOCAL_PATH)/a650_zap.b01:$(TARGET_COPY_OUT_VENDOR)/firmware/a650_zap.b01			\
    $(LOCAL_PATH)/a650_zap.b02:$(TARGET_COPY_OUT_VENDOR)/firmware/a650_zap.b02			\
    $(LOCAL_PATH)/a650_zap.elf:$(TARGET_COPY_OUT_VENDOR)/firmware/a650_zap.elf			\
    $(LOCAL_PATH)/a650_zap.mbn:$(TARGET_COPY_OUT_VENDOR)/firmware/a650_zap.mbn			\
    $(LOCAL_PATH)/a650_zap.mdt:$(TARGET_COPY_OUT_VENDOR)/firmware/a650_zap.mdt			\
    $(LOCAL_PATH)/lt9611uxc_fw.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/lt9611uxc_fw.bin		\
    $(LOCAL_PATH)/a650_gmu.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/sm8250/a650_gmu.bin	\
    $(LOCAL_PATH)/a650_sqe.fw:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/sm8250/a650_sqe.fw	\
    $(LOCAL_PATH)/a650_zap.b00:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/sm8250/a650_zap.b00	\
    $(LOCAL_PATH)/a650_zap.b01:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/sm8250/a650_zap.b01	\
    $(LOCAL_PATH)/a650_zap.b02:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/sm8250/a650_zap.b02	\
    $(LOCAL_PATH)/a650_zap.elf:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/sm8250/a650_zap.elf	\
    $(LOCAL_PATH)/a650_zap.mbn:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/sm8250/a650_zap.mbn	\
    $(LOCAL_PATH)/a650_zap.mdt:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/sm8250/a650_zap.mdt

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/qcom/sm8250/adsp.mbn:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/sm8250/adsp.mbn		\
    $(LOCAL_PATH)/qcom/sm8250/adspr.jsn:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/sm8250/adspr.jsn	\
    $(LOCAL_PATH)/qcom/sm8250/adspua.jsn:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/sm8250/adspua.jsn	\
    $(LOCAL_PATH)/qcom/sm8250/cdsp.mbn:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/sm8250/cdsp.mbn		\
    $(LOCAL_PATH)/qcom/sm8250/cdspr.jsn:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/sm8250/cdspr.jsn

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ath11k/QCA6390/hw2.0/amss.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/ath11k/QCA6390/hw2.0/amss.bin	\
    $(LOCAL_PATH)/ath11k/QCA6390/hw2.0/board.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/ath11k/QCA6390/hw2.0/board.bin	\
    $(LOCAL_PATH)/ath11k/QCA6390/hw2.0/m3.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/ath11k/QCA6390/hw2.0/m3.bin		\
    $(LOCAL_PATH)/qca/htbtfw20.tlv:$(TARGET_COPY_OUT_VENDOR)/firmware/qca/htbtfw20.tlv					\
    $(LOCAL_PATH)/qca/htnv20.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/qca/htnv20.bin
