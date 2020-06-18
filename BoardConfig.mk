#
# Copyright (C) 2020 The LineageOS Project
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
#

DEVICE_PATH := device/amlogic/q201

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := gxm
TARGET_BOARD_HARDWARE := amlogic

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_VARIANT := cortex-a9
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi

# Asserts
TARGET_OTA_ASSERT_DEVICE := q201,q201_n,q201_N

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

# HWC
TARGET_USES_HWC2 := true

# Kernel
BOARD_KERNEL_BASE := 0x01078000
BOARD_KERNEL_OFFSET := 0x00008000
TARGET_KERNEL_ARCH := arm64
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage
ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_KERNEL_CONFIG := q201_defconfig
TARGET_KERNEL_SOURCE := kernel/amlogic/q201
endif
BOARD_KERNEL_CMDLINE :=  androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := zImage

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USES_MKE2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 536870912
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27963424768

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.amlogic
TARGET_RECOVERY_FORCE_PIXEL_FORMAT := "RGB_565"
LZMA_RAMDISK_TARGETS := recovery

# Seccomp
BOARD_SECCOMP_POLICY := device/amlogic/q201/seccomp

# SELinux
BOARD_SEPOLICY_DIRS += device/amlogic/q201/sepolicy

# TWRP
ifeq ($(WITH_TWRP),true)
include $(DEVICE_PATH)/twrp.mk
endif

WIFI_DRIVER := AP6255
WIFI_DRIVER_MODULE_PATH := /system/lib/dhd.ko
WIFI_DRIVER_MODULE_NAME := dhd
WIFI_DRIVER_MODULE_ARG  := "firmware_path=/etc/wifi/6255/fw_bcm43455c0_ag.bin nvram_path=/etc/wifi/6255/nvram.txt"
WIFI_DRIVER_FW_PATH_STA := /etc/wifi/6255/fw_bcm43455c0_ag.bin
WIFI_DRIVER_FW_PATH_AP  := /etc/wifi/6255/fw_bcm43455c0_ag_apsta.bin
WIFI_DRIVER_FW_PATH_P2P := /etc/wifi/6255/fw_bcm43455c0_ag_p2p.bin
WIFI_EXT_MODULE_PATH := "/system/lib/cfg80211.ko"
WIFI_EXT_MODULE_NAME := "cfg80211"
BOARD_WLAN_DEVICE := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"

WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd

# Inherit from the proprietary version
include vendor/amlogic/q201/BoardConfigVendor.mk
