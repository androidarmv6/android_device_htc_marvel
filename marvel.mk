# marvel.mk
# Device configuration file. 
# Re-written by Benjamin Gwynn

# Licensed under the Apache License, Version 2.0.
# Copyright (C) 2009 The Android Open Source Project
# Copyright (C) 2011 The CyanogenMod Project
# Copyright (C) 2014 Benjamin Gwynn <http://xenxier.tk>

LOCAL_DIR := device/htc/marvel
LOCAL_PATH := $(LOCAL_DIR)

## Call vendors:
$(call inherit-product, vendor/htc/marvel/marvel-vendor.mk)		# Include marvel vendor

# Permissions
## Copy the following permission files for our hardware.
PRODUCT_COPY_FILES += \
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

## Replacement binaries (fix for akmd)
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/config/bin/linker:system/bin/linker

# Copy configurations 
## Media profiles
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/libaudio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_DIR)/config/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_DIR)/config/media_profiles.xml:system/etc/media_profiles.xml

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
    audio_policy.msm7x27 \
    audio.primary.msm7x27 \
    libtinyalsa

## Sensors
PRODUCT_PACKAGES += \
    sensors.msm7x27 \
    lights.msm7x27

## Camera
#PRODUCT_PACKAGES += \
#    camera.msm7x27 \
#    libcamera

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

## Camera
PRODUCT_PROPERTY_OVERRIDES += \
    ro.htc.camerahack=msm7k

## Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.a1026.nsForVoiceRec = 0 \
    media.a1026.enableA1026 = 1

## Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.phone_storage=0

# Inherit qcom/msm7x27
$(call inherit-product, device/qcom/msm7x27/msm7x27.mk)

# Device overlays
## Tell the compiler to use overlays found in the following folder:
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_DIR)/overlay

# Additional properties
## Application artwork
PRODUCT_LOCALES += mdpi
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

## Disable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
