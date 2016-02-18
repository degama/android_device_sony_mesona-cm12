# Copyright (C) 2011 The Android Open Source Project
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

# proprietary side of the device
# Inherit from those products. Most specific first

# Inherit the proprietary counterpart
$(call inherit-product-if-exists, vendor/sony/mesona/mesona-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/mesona/overlay

# Inherit the tamsui-common definitions
$(call inherit-product, device/sony/tamsui-common/tamsui.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal mdpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.device.rc:root/init.device.rc \
    $(LOCAL_PATH)/rootdir/init.sony.usb.rc:root/init.sony.usb.rc \
    $(LOCAL_PATH)/rootdir/fstab.sony:root/fstab.sony

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/sbin/rmt_storage:root/sbin/rmt_storage \
    $(LOCAL_PATH)/rootdir/sbin/ta_rmt_service:root/sbin/ta_rmt_service \
    $(LOCAL_PATH)/rootdir/sbin/tad:root/sbin/tad \
    $(LOCAL_PATH)/rootdir/sbin/wait4tad:root/sbin/wait4tad

# Device specific part for two-stage boot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/bootrec-device:recovery/bootrec-device

# Offline Charging
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/animations/charging_animation_01.rle:system/etc/chgani/ca01.rle \
    $(LOCAL_PATH)/animations/charging_animation_02.rle:system/etc/chgani/ca02.rle \
    $(LOCAL_PATH)/animations/charging_animation_03.rle:system/etc/chgani/ca03.rle \
    $(LOCAL_PATH)/animations/charging_animation_04.rle:system/etc/chgani/ca04.rle \
    $(LOCAL_PATH)/animations/charging_animation_05.rle:system/etc/chgani/ca05.rle \
    $(LOCAL_PATH)/animations/charging_animation_06.rle:system/etc/chgani/ca06.rle \
    $(LOCAL_PATH)/animations/charging_animation_07.rle:system/etc/chgani/ca07.rle

# Key layouts and touchscreen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/usr/idc/cyttsp_i2c_tma340.idc:system/usr/idc/cyttsp_i2c_tma340.idc \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/cyttsp_i2c_tma340.kl:system/usr/keylayout/cyttsp_i2c_tma340.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/fih_gpio-keys.kl:system/usr/keylayout/fih_gpio-keys.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/simple_remote_appkey.kl:system/usr/keylayout/simple_remote_appkey.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/synaptics-t1320-tskey.kl:system/usr/keylayout/synaptics-t1320-tskey.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keychars/7x27a_kp.kcm:system/usr/keychars/7x27a_kp.kcm \
    $(LOCAL_PATH)/rootdir/system/usr/keychars/cyttsp_i2c_tma340.kcm:system/usr/keychars/cyttsp_i2c_tma340.kcm \
    $(LOCAL_PATH)/rootdir/system/usr/keychars/fih_gpio-keys.kcm:system/usr/keychars/fih_gpio-keys.kcm \
    $(LOCAL_PATH)/rootdir/system/usr/keychars/simple_remote_appkey.kcm:system/usr/keychars/simple_remote_appkey.kcm \
    $(LOCAL_PATH)/rootdir/system/usr/keychars/synaptics-t1320-tskey.kcm:system/usr/keychars/synaptics-t1320-tskey.kcm

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/sony/mesona/mesona-vendor.mk)

# Wifi
BOARD_WLAN_DEVICE_REV := bcm4330_b1
WIFI_BAND             := 802_11_ABG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
