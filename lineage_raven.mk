# Boot animation
TARGET_SCREEN_HEIGHT := 3120
TARGET_SCREEN_WIDTH := 1440

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/raviole/aosp_raven.mk)
$(call inherit-product, device/google/raviole/device-lineage.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_raven
PRODUCT_MODEL := Pixel 6 Pro
PRODUCT_BRAND := google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=raven \
    PRIVATE_BUILD_DESC="raven-user 12 SD1A.210817.037 7862242 release-keys"

BUILD_FINGERPRINT := google/raven/raven:12/SD1A.210817.037/7862242:user/release-keys

$(call inherit-product, vendor/google/raven/raven-vendor.mk)