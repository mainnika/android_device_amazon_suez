TARGET_SCREEN_WIDTH := 1200
TARGET_SCREEN_HEIGHT := 1920

$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/amazon/suez/device.mk)

# Product Charateristics
PRODUCT_RUNTIMES := runtime_libart_default
PRODUCT_CHARACTERISTICS := tablet

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := cm_suez
PRODUCT_DEVICE := suez
PRODUCT_BRAND := google
PRODUCT_MODEL := Fire
PRODUCT_MANUFACTURER := Google

PRODUCT_GMS_CLIENTID_BASE := android-google
