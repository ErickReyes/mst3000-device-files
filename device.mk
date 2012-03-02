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


PRODUCT_COPY_FILES := \
	device/ti/am335xevm/init.rc:root/init.rc \
	device/ti/am335xevm/vold.fstab:system/etc/vold.fstab \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

# Bluetooth support
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf


# KeyPads
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/matrix-keypad.kl:system/usr/keylayout/matrix-keypad.kl

PRODUCT_PROPERTY_OVERRIDES := \
	wifi.interface=wlan0 \
	hwui.render_dirty_regions=false

PRODUCT_CHARACTERISTICS := tablet,nosdcard

DEVICE_PACKAGE_OVERLAYS := \
    device/ti/am335xevm/overlay

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

PRODUCT_PACKAGES += \
	libaudioutils

# Bluetooth A2DP audio support
PRODUCT_PACKAGES += \
	audio.a2dp.default

PRODUCT_PACKAGES += \
        audio.primary.am335xevm \
        tinycap \
        tinymix \
        tinyplay

PRODUCT_PACKAGES += \
	dhcpcd.conf \
	TQS_D_1.7.ini \
	calibrator

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs

# BlueZ test tools
PRODUCT_PACKAGES += \
	hciconfig \
	hcitool

$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, hardware/ti/wlan/mac80211/firmware/wl12xx_wlan_fw_products.mk)
$(call inherit-product-if-exists, hardware/ti/wpan/wl12xx-bluetooth/wl12xx_bt_products.mk)
