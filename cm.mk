# Boot animation
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH  := 480

DEVICE_PACKAGE_OVERLAYS += device/sony/mesona/overlay

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/sony/mesona/full_mesona.mk)

PRODUCT_RELEASE_NAME := Xperia miro
PRODUCT_GMS_CLIENTID_BASE := android-sony-rev

# Product name
PRODUCT_NAME := ST23i_1257-4009
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := mesona
PRODUCT_MODEL := Xperia miro ST23i
PRODUCT_MANUFACTURER := Sony
PRODUCT_CHARACTERISTICS := phone

#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=mesona BUILD_ID=LRX22C BUILD_FINGERPRINT=sony_europe/sony_mesona/mesona:5.0.1/LRX22C/87995:user/release-keys
#PRIVATE_BUILD_DESC="ST23i-user 6.1.A.0.452 O_5_zw test-keys"
