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
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Copy low-level system files
## Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/ramdisk/fstab.marvel:root/fstab.marvel \
    $(LOCAL_PATH)/config/ramdisk/init.marvel.rc:root/init.marvel.rc \
    $(LOCAL_PATH)/config/ramdisk/init.marvel.bluez.rc:root/init.marvel.bluez.rc \
    $(LOCAL_PATH)/config/ramdisk/ueventd.marvel.rc:root/ueventd.marvel.rc

## Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/ramdisk/fstab.marvel:recovery/root/etc/fstab.marvel \
    $(LOCAL_PATH)/config/ramdisk/twrp.fstab:recovery/root/etc/twrp.fstab

## Replacement binaries (fix for akmd)
#PRODUCT_COPY_FILES += \
#    $(LOCAL_DIR)/config/bin/linker:system/bin/linker

# Copy configurations
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
## Sensors
PRODUCT_PACKAGES += \
    sensors.msm7x27

## GPS
PRODUCT_PACKAGES += \
    gps.marvel \
    librpc

# Install software application packages
## Marvel-supported packages
PRODUCT_PACKAGES += \
    Torch

## Additonal packages
PRODUCT_PACKAGES += \
    Email2 \
    Exchange2 \

## Camera
PRODUCT_PROPERTY_OVERRIDES += \
    ro.htc.camerahack=msm7k

# Device overlays
## Tell the compiler to use overlays found in the following folder:
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_DIR)/overlay

## gps.conf
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# inherit from msm7x27-common
$(call inherit-product, device/htc/msm7x27-common/msm7x27.mk)

# inherit caf vendor only when building caf
$(call inherit-product-if-exists, vendor/msm7227/main.mk)
