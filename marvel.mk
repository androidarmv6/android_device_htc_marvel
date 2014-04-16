# marvel.mk
# Device configuration file. 
# Re-written by Benjamin Gwynn

# Licensed under the Apache License, Version 2.0.
# Copyright (C) 2009 The Android Open Source Project
# Copyright (C) 2011 The CyanogenMod Project
# Copyright (C) 2014 Benjamin Gwynn <http://xenxier.tk>

# Inherit makefiles
## Call common makefiles:
$(call inherit-product, build/target/product/full_base_telephony.mk)	# Telephony configuration
$(call inherit-product, build/target/product/languages_full.mk)		# Build with all languages
$(call inherit-product, device/common/gps/gps_eu_supl.mk)		# Build with GPS support
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)		# Mini configuration
$(call inherit-product, vendor/cm/config/gsm.mk)			# GSM configuration

## Call vendors:
$(call inherit-product, vendor/htc/marvel/marvel-vendor.mk)		# Include marvel vendor
$(call inherit-product, vendor/qcom/msm7x27/qcom-vendor.mk)		# Include QCOM vendor

# Device overlays
## Tell the compiler to use overlays found in the following folder:
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_DIR)/overlay

# Permissions
## Copy the following permission files for our hardware.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Copy low-level system files
## Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/config/ramdisk/fstab.marvel:root/fstab.marvel \
    $(LOCAL_DIR)/config/ramdisk/init.marvel.rc:root/init.marvel.rc \
    $(LOCAL_DIR)/config/ramdisk/init.marvel.usb.rc:root/init.marvel.bluez.rc \
    $(LOCAL_DIR)/config/ramdisk/init.marvel.usb.rc:root/init.marvel.usb.rc \
    $(LOCAL_DIR)/config/ramdisk/ueventd.marvel.rc:root/ueventd.marvel.rc

## Firmware Files
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/config/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    $(LOCAL_DIR)/config/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    $(LOCAL_DIR)/config/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin

## Replacement binaries
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/config/bin/linker:system/bin/linker

# Copy configurations 
## Media profiles
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/libaudio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_DIR)/config/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_DIR)/config/media_profiles.xml:system/etc/media_profiles.xml

## Bluetooth Configuration
PRODUCT_COPY_FILES += \
        system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

## Touchscreen Configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/config/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    $(LOCAL_DIR)/config/idc/cy8c-touchscreen.idc:system/usr/idc/cy8c-touchscreen.idc

## Keylayout configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/config/key/marvel-keypad.kl:system/usr/keylayout/marvel-keypad.kl \
    $(LOCAL_DIR)/config/key/marvel-keypad.kcm.bin:system/usr/keychars/marvel-keypad.kcm.bin \
    $(LOCAL_DIR)/config/key/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    $(LOCAL_DIR)/config/key/cy8c-touchscreen.kl:system/usr/keylayout/cy8c-touchscreen.kl

# Install hardware packages
## Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm7x27 \
    audio.primary.msm7x27 \
    libtinyalsa \
    libaudioutils

## Sensors
PRODUCT_PACKAGES += \
    sensors.msm7x27 \
    lights.msm7x27

## Video Playback
PRODUCT_PACKAGES += \
    copybit.msm7x27 \
    gralloc.msm7x27 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer

## Camera
PRODUCT_PACKAGES += \
    camera.msm7x27 \
    libcamera

## QCOM OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore

## GPS
PRODUCT_PACKAGES += \
    gps.msm7x27 \
    librpc

## WiFi
PRODUCT_PACKAGES += \
    brcm_patchram_plus

## USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

## Radio
PRODUCT_PACKAGES += \
    rild

## Filesystem
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Install software application packages
## Marvel-supported packages
PRODUCT_PACKAGES += \
    Superuser \
    Torch

## Additonal packages
PRODUCT_PACKAGES += \
    Email2 \
    Exchange2 \

# Property overrides
## Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.opengles.surface.rgb565=true \
    com.qc.hardware=true \
    debug.enabletr=false \
    debug.hwui.render_dirty_regions=false \
    debug.qctwa.statusbar=1 \
    debug.qctwa.preservebuf=1 \
    hwui.print_config=choice \
    persist.sys.strictmode.visual=false

## Stagefright
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true

## Camera
PRODUCT_PROPERTY_OVERRIDES += \
    debug.camcorder.disablemeta=1 \
    ro.htc.camerahack=msm7k

## Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.a1026.nsForVoiceRec = 0 \
    media.a1026.enableA1026 = 1

## Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.phone_storage=0

# Additional properties
## Application artwork
PRODUCT_LOCALES += mdpi
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

## Disable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
