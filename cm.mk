# Licensed under the Apache License, Version 2.0.
# Copyright (C) 2014 The Android Open Source Project
# Copyright (C) 2014 The CyanogenMod Project

# Call our device's AOSP device config.
$(call inherit-product, device/htc/marvel/full_marvel.mk)

# Inherit common CM stuff
$(call inherit-product, vendor/cm/config/mini.mk)

# Bootanimation
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

# Overrides for CM
PRODUCT_NAME := cm_marvel
PRODUCT_DEVICE := marvel

# Release name and versioning
PRODUCT_RELEASE_NAME := WildfireS