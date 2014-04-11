# Include GSM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit mini configuration
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/marvel/marvel.mk)

# Bootanimation
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := marvel
PRODUCT_NAME := cm_marvel
PRODUCT_BRAND := htc_europe
PRODUCT_MODEL := Wildfire S A510e
PRODUCT_MANUFACTURER := HTC
PRODUCT_CHARACTERISTICS := phone

# Release name and versioning
PRODUCT_RELEASE_NAME := WildfireS
PRODUCT_VERSION_DEVICE_SPECIFIC :=

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=htc_marvel \
	BUILD_FINGERPRINT=cyanogenmod/htc_marvel/marvel:4.3.1/$(BUILD_ID)/v0.1:user/test-keys