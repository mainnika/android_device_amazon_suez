DEVICE_COMMON := device/amazon/suez
VENDOR_COMMON := vendor/amazon/suez
KERNEL_COMMON := kernel/amazon/suez

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_COMMON)/overlay

# Install init.d scripts
PRODUCT_COPY_FILES += \
    $(DEVICE_COMMON)/configs/99exfat-support:system/etc/init.d/99exfat-support

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal large xlarge hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# BootAnimation
TARGET_SCREEN_WIDTH := 1200
TARGET_SCREEN_HEIGHT := 1920

TARGET_PREBUILT_KERNEL := $(KERNEL_COMMON)/out/arch/arm64/boot/Image.gz-dtb
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_COMMON)/rootdir,root)

# Config files
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(DEVICE_COMMON)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(DEVICE_COMMON)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(DEVICE_COMMON)/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg

# Mediatek build
MTK_PROJECT_NAME := $(DEVICE)/ProjectConfig.mk

# Init
PRODUCT_PACKAGES += \
    fix-symlinks.sh \
    fstab.mt8173 \
    init.mt8173.rc \
    init.mt8173.usb.rc \
    ueventd.mt8173.rc \
    rgx.fw \
    md32_d.bin \
    md32_p.bin

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.stub \
    libalsautils \
    libaudio-resampler \
    libtinyalsa \
    libtinycompress \
    libtinyxml \
    libaudioroute \
    libaudiospdif \
    libeffects
    
# Bluetooth
PRODUCT_PACKAGES += \
	bluetooth.default
	
# Graphics
PRODUCT_PACKAGES += \
    libion

# Lights
PRODUCT_PACKAGES += \
    lights.mt8173

# Power
PRODUCT_PACKAGES += \
	power.default

# network
PRODUCT_PACKAGES += \
    netd

# Wifi
PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli \
    lib_driver_cmd_mt66xx \
    wpa_supplicant

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

WITH_EXFAT := true

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# call dalvik heap config
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, $(VENDOR_COMMON)/suez-vendor.mk)
