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

TARGET_BOOTLOADER_BOARD_NAME := marvel
TARGET_SPECIFIC_HEADER_PATH := device/htc/marvel/include

### Board config
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := msm7x27
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp

TARGET_PROVIDES_LIBLIGHTS := true

### Kernel
TARGET_KERNEL_SOURCE := kernel/htc/msm7227
TARGET_KERNEL_CONFIG := cyanogen_msm7227_defconfig

### Kernel related stuff
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x12c00000
BOARD_KERNEL_PAGESIZE := 2048

### USB Mass Storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

### Wifi related defines
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcm4329
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext

#WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcm4329/parameters/firmware_path"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_NAME          := "bcm4329"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/proc/calibration iface_name=wlan"
BOARD_WLAN_DEVICE_REV            := bcm4329
WIFI_BAND                        := 802_11_ABG

### Graphics
# Option for choosing texture target on old adrenos
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_CFG := device/htc/marvel/egl.cfg

COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_SF_BYPASS := false
TARGET_HAVE_BYPASS := false
TARGET_USES_OVERLAY := false
TARGET_QCOM_HDMI_OUT := false
TARGET_GRALLOC_USES_ASHMEM := false
TARGET_USES_GENLOCK := true

# Backwards compatibility with ICS GPU drivers
# Remove when (and if) Qualcomm releases Jelly Bean drivers for ARMv6
#COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT

# for modified libstagefright
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX

# Disable HW VSYNC, kernel does not support it (yet)
TARGET_NO_HW_VSYNC := true

COMMON_GLOBAL_CFLAGS += -DQCOM_MISSING_PIXEL_FORMATS -DQCOM_NO_SECURE_PLAYBACK

### Camera
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT

### Recovery

#BOARD_USES_RECOVERY_CHARGEMODE := true
BOARD_CUSTOM_GRAPHICS := ../../../device/htc/marvel/recovery/graphics.c
BOARD_USES_MMCUTILS := false
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_USES_MSM7X27_RECOVERY := true
TARGET_RECOVERY_INITRC = device/htc/marvel/recovery/init.htc.rc

### Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_PREBUILT_LIBAUDIO := false
BOARD_USES_QCOM_AUDIO_VOIPMUTE := true
BOARD_USES_QCOM_AUDIO_RESETALL := true

### Partitions

# # cat /proc/mtd (marvel)
#dev:    size   erasesize  name
#mtd0: 00100000 00040000 "misc"
#mtd1: 00500000 00040000 "recovery"
#mtd2: 00340000 00040000 "boot"
#mtd3: 10400000 00040000 "system"
#mtd4: 02300000 00040000 "cache"
#mtd5: 09600000 00040000 "userdata"
#mtd6: 00a00000 00040000 "devlog"

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00340000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x10400000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x09600000
BOARD_FLASH_BLOCK_SIZE := 262144

### Compass
BOARD_VENDOR_COMPASS_HARDWARE := akm8975

### Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

### FM radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

BOARD_VENDOR_QCOM_AMSS_VERSION := 4735

### Boot animation
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

### Dalvik
# If WITH_JIT is configured, build multiple versions of libdvm.so to facilitate
# correctness/performance bugs triage
WITH_JIT := true

### Webkit
TARGET_FORCE_CPU_UPLOAD := true

### Browser
JS_ENGINE := v8
HTTP := chrome
ENABLE_JSC_JIT := true
ENABLE_WEBGL := true





## common






# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TARGET_SPECIFIC_HEADER_PATH := device/htc/msm7x27-common/include

# Make sure this folder exists so display stuff doesn't fail
$(shell mkdir -p $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/)

# inherit from common msm7x27 Recovery
-include device/htc/msm7x27-common/recovery/BoardConfigCommon.mk

TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_ARCH_LOWMEM := true
TARGET_BOARD_PLATFORM := msm7x27
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
COMMON_GLOBAL_CFLAGS += -DTARGET_MSM7x27

### Board config
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_PROVIDES_LIBLIGHT := true
TARGET_PROVIDES_LIBAUDIO := true

### USB Mass Storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

### Wifi related defines
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := bcm4329
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/firmware/fw_bcm4329.bin nvram_path=/proc/calibration iface_name=wlan0"
WIFI_DRIVER_MODULE_NAME := "bcm4329"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/fw_bcm4329_apsta.bin"
#WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcm4329/parameters/firmware_path"
BOARD_WLAN_DEVICE_REV := bcm4329
WIFI_BAND := 802_11_ABG

### Graphics
# Option for choosing texture target on old adrenos
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_CFG := device/htc/msm7x27-common/egl.cfg
TARGET_QCOM_DISPLAY_VARIANT := legacy

COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE -DQCOM_NO_SECURE_PLAYBACK -DQCOM_LEGACY_OMX -DQCOM_ICS_COMPAT
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_SF_BYPASS := false
TARGET_HAVE_BYPASS := false
TARGET_USES_OVERLAY := false
TARGET_QCOM_HDMI_OUT := false
TARGET_GRALLOC_USES_ASHMEM := false
TARGET_USES_GENLOCK := true
TARGET_NO_HW_VSYNC := true
COMMON_GLOBAL_CFLAGS += -DQCOM_MISSING_PIXEL_FORMATS
BOARD_EGL_NEEDS_LEGACY_FB := true

#TARGET_NO_HW_OVERLAY := true
#BOARD_NEEDS_MEMORYHEAPPMEM := true
#TARGET_DISABLE_TRIPLE_BUFFERING := true


### Camera
#BOARD_USES_LEGACY_CAMERA := true
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
#TARGET_DISABLE_ARM_PIE := true

### Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_PREBUILT_LIBAUDIO := false
BOARD_USES_QCOM_AUDIO_VOIPMUTE := true
BOARD_USES_QCOM_AUDIO_RESETALL := true

### Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/msm7x27-common/bluetooth/include
BOARD_BLUEDROID_VENDOR_CONF := device/htc/msm7x27-common/bluetooth/vnd_msm7x27.txt

### Boot animation
TARGET_BOOTANIMATION_USE_RGB565 := true
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

### QCOM
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_USE_QCOM_PMEM := true

###GPS moved here temporarily
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 20000

### RIL
BOARD_USES_LEGACY_RIL := true
BOARD_USE_NEW_LIBRIL_HTC := true

## Minimal fonts
SMALLER_FONT_FOOTPRINT := true

### Dalvik
# If WITH_JIT is configured, build multiple versions of libdvm.so to facilitate
# correctness/performance bugs triage
WITH_JIT := true

### Webkit
TARGET_FORCE_CPU_UPLOAD := true

### Browser
JS_ENGINE := v8
HTTP := chrome
ENABLE_JSC_JIT := true
ENABLE_WEBGL := true
