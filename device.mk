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
	device/ti/am335xevm/init.am335xevm.rc:root/init.am335xevm.rc \
	device/ti/am335xevm/init.var-som-am33.rc:root/init.var-som-am33.rc \
	device/ti/am335xevm/init.am335xevm.usb.rc:root/init.am335xevm.usb.rc \
	device/ti/am335xevm/init.var-som-am33.usb.rc:root/init.var-som-am33.usb.rc \
	device/ti/am335xevm/ueventd.am335xevm.rc:root/ueventd.am335xevm.rc \
	device/ti/am335xevm/ueventd.var-som-am33.rc:root/ueventd.var-som-am33.rc \
	device/ti/am335xevm/vold.fstab:system/etc/vold.fstab \
	device/ti/am335xevm/fstab.am335xevm:root/fstab.am335xevm \
	device/ti/am335xevm/fstab.var-am33-som-nand:root/fstab.var-am33-som-nand \
	device/ti/am335xevm/media_codecs.xml:system/etc/media_codecs.xml \
	device/ti/am335xevm/media_profiles.xml:system/etc/media_profiles.xml \
	device/ti/am335xevm/mixer_paths.xml:system/etc/mixer_paths.xml \
	device/ti/am335xevm/audio_policy.conf:system/etc/audio_policy.conf

# Bluetooth support
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf

# WLAN support
PRODUCT_COPY_FILES +=\
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# Hardware Features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	device/ti/am335xevm/android.hardware.screen.xml:system/etc/permissions/android.hardware.screen.xml

PRODUCT_COPY_FILES += \
	device/ti/am335xevm/apns-full-conf.xml:system/etc/apns-conf.xml

PRODUCT_COPY_FILES += \
	device/ti/am335xevm/ppp/ip-up-datakey:system/etc/ppp/ip-up-datakey \
	device/ti/am335xevm/ppp/ip-down-datakey:system/etc/ppp/ip-down-datakey \
	device/ti/am335xevm/usbmodeswitch.conf:system/etc/usbmodeswitch.conf

# KeyPads
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/matrix-keypad.kl:system/usr/keylayout/matrix-keypad.kl \
    $(LOCAL_PATH)/power-key.kl:system/usr/keylayout/power-key.kl \
    $(LOCAL_PATH)/ti-tsc.idc:system/usr/idc/ti-tsc.idc

PRODUCT_PROPERTY_OVERRIDES := \
	hwui.render_dirty_regions=false \
	persist.sys.usb.config=mtp,adb

# Explicitly specify dpi, otherwise the icons don't show up correctly with SGX enabled
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1

PRODUCT_CHARACTERISTICS := tablet

DEVICE_PACKAGE_OVERLAYS := \
    device/ti/am335xevm/overlay

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

PRODUCT_PACKAGES += \
	libaudioutils \
	libsrec_jni

PRODUCT_PACKAGES += \
        audio.primary.am335xevm \
        tinycap \
        tinymix \
        tinyplay

PRODUCT_PACKAGES += \
	dhcpcd.conf

PRODUCT_PACKAGES += \
	camera.omap3

# WI-Fi
PRODUCT_PACKAGES += \
	hostapd.conf \
	wifical.sh \
	TQS_D_1.7.ini \
	TQS_D_1.7_127x.ini \
	TQS_S_2.6.ini \
	crda \
        regulatory.bin \
	calibrator

PRODUCT_PROPERTY_OVERRIDES += \
	 wifi.interface=wlan0
# BT
 PRODUCT_PACKAGES += \
	 libbt-vendor

# Bluetooth A2DP audio support
PRODUCT_PACKAGES += \
	audio.a2dp.default

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs

# BlueZ test tools
PRODUCT_PACKAGES += \
	hciconfig \
	hcitool

PRODUCT_PACKAGES += \
	lights.am335xevm

PRODUCT_PACKAGES += \
	sensors.am335xevm

# Accelerometer-based demo game
PRODUCT_PACKAGES += \
	Amazed

PRODUCT_PACKAGES += \
	FileManager-1.1.6

PRODUCT_PACKAGES += \
	TemperatureWidget

PRODUCT_PACKAGES += \
	rild

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, hardware/ti/wpan/wl12xx-bluetooth/wl12xx_bt_products.mk)
$(call inherit-product-if-exists, hardware/ti/wlan/mac80211/firmware/wl12xx_wlan_fw_products.mk)
