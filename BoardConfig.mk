## TODO

# Copyright (C) 2011 The CyanogenMod Project
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

# Make sure this folder exists so display stuff doesn't fail
$(shell mkdir -p $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/)

-include device/qcom/msm7x27/BoardConfigCommon.mk

TARGET_DEVICE := marvel
TARGET_BOOTLOADER_BOARD_NAME := marvel
TARGET_SPECIFIC_HEADER_PATH := device/htc/marvel/include

TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_PROVIDES_LIBLIGHTS := true
TARGET_PROVIDES_LIBLIGHT := true
TARGET_PROVIDES_LIBAUDIO := true

### Kernel
TARGET_KERNEL_SOURCE := kernel/htc/msm7227
TARGET_KERNEL_CONFIG := marvel_defconfig

### Kernel related stuff
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null androidboot.hardware=marvel 
BOARD_KERNEL_BASE := 0x12c00000
BOARD_KERNEL_PAGESIZE := 2048

# Releasetools
#TARGET_OTA_EXTRAS_FILE := device/htc/marvel/releasetools/extras.txt
TARGET_OTA_ASSERT_DEVICE := marvel

### USB Mass Storage
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH  := /sys/devices/platform/usb_mass_storage/lun0/file

### Wifi related defines
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcm4329
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext

#WIFI_DRIVER_FW_PATH_PARAM       := "/sys/module/bcm4329/parameters/firmware_path"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_NAME          := "bcm4329"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/etc/firmware/fw_bcm4329.bin nvram_path=/proc/calibration iface_name=wlan"
BOARD_WLAN_DEVICE_REV            := bcm4329
WIFI_BAND                        := 802_11_ABG

### Graphics
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_SF_BYPASS := false
TARGET_HAVE_BYPASS := false
TARGET_USES_OVERLAY := false
TARGET_USES_HWC_FENCE_SYNC := true
TARGET_QCOM_HDMI_OUT := false
TARGET_GRALLOC_USES_ASHMEM := false
TARGET_USES_GENLOCK := true

# Disable HW VSYNC, kernel does not support it (yet)
TARGET_NO_HW_VSYNC := true

COMMON_GLOBAL_CFLAGS += -DQCOM_MISSING_PIXEL_FORMATS
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60

### Camera
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT

### Recovery

-include device/htc/marvel/config/recovery/BoardConfigCommon.mk
#BOARD_USES_RECOVERY_CHARGEMODE := true
BOARD_CUSTOM_GRAPHICS := ../../../device/htc/marvel/config/recovery/graphics.c
BOARD_USES_MMCUTILS := false
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_MISC_PARTITION := true
TARGET_RECOVERY_FSTAB := device/htc/marvel/config/ramdisk/fstab.marvel

### Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_PREBUILT_LIBAUDIO := false
BOARD_USES_QCOM_AUDIO_VOIPMUTE := true
BOARD_USES_QCOM_AUDIO_RESETALL := true

### Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 3824192
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 11860608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x10400000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x09600000
BOARD_FLASH_BLOCK_SIZE := 262144

### Compass
BOARD_VENDOR_COMPASS_HARDWARE := akm8975

### Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
#BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/marvel/bluetooth/include
BOARD_BLUEDROID_VENDOR_CONF := device/htc/marvel/bluetooth/vnd_msm7x27.txt

### FM radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

BOARD_VENDOR_QCOM_AMSS_VERSION := 4735

### Bootanimation
TARGET_BOOTANIMATION_USE_RGB565 := true
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

### QCOM
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_USE_QCOM_PMEM := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := marvel
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 20000

### RIL
BOARD_USES_LEGACY_RIL := true
BOARD_USE_NEW_LIBRIL_HTC := true


## Minimal fonts
SMALLER_FONT_FOOTPRINT := true
MINIMAL_FONT_FOOTPRINT := true

### Browser
ENABLE_WEBGL := true

## TEMPORARY HACK: skip building external/chromium_org/
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes
