#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# setup dalvik vm configs
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

include $(LOCAL_PATH)/../vendor-package-ver.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Build generic Audio HAL
PRODUCT_PACKAGES += audio.primary.dragonboard_swr

# BootControl HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

# Install scripts to set vendor.* properties
PRODUCT_COPY_FILES += \
    device/linaro/dragonboard/qcom/set_hw.sh:$(TARGET_COPY_OUT_VENDOR)/bin/set_hw.sh \
    device/linaro/dragonboard/qcom/set_udc.sh:$(TARGET_COPY_OUT_VENDOR)/bin/set_udc.sh

# Install scripts to set Ethernet MAC address
PRODUCT_COPY_FILES += \
    device/linaro/dragonboard/db845c/eth_mac_addr.rc:/system/etc/init/eth_mac_addr.rc \
    device/linaro/dragonboard/db845c/eth_mac_addr.sh:/system/bin/eth_mac_addr.sh

PRODUCT_VENDOR_PROPERTIES += ro.soc.manufacturer=Qualcomm
PRODUCT_VENDOR_PROPERTIES += ro.soc.model=dragonboard_swr

# Vulkan
TARGET_VULKAN_SUPPORT := true
TARGET_USES_VULKAN = true

# TODO(b/65201432): Swiftshader needs to create executable memory.
PRODUCT_REQUIRES_INSECURE_EXECMEM_FOR_SWIFTSHADER := true
PRODUCT_PACKAGES += vulkan.pastel

# ANGLE provides an OpenGL implementation built on top of Vulkan.
PRODUCT_PACKAGES += \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.egl=angle \
    ro.hardware.vulkan=pastel

PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=160

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.dragonboard_swr.environ.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.dragonboard_swr.environ.rc

# Copy firmware files
$(call inherit-product-if-exists, vendor/linaro/db845c/$(EXPECTED_LINARO_VENDOR_VERSION)/device.mk)
$(call inherit-product-if-exists, vendor/linaro/rb5/$(EXPECTED_LINARO_VENDOR_VERSION)/device.mk)

TARGET_HARDWARE := dragonboard_swr
TARGET_KERNEL_USE ?= 5.15

include device/linaro/dragonboard/device-common.mk
