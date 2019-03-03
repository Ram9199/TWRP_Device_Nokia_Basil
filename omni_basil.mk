#
# Copyright 2018 The Android Open Source Project
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

# Release name
PRODUCT_RELEASE_NAME := basil

$(call inherit-product, build/target/product/embedded.mk)

# Inherit language packages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/nokia/basil/basil.mk)

# A/B updater
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor \
    keymaster \
    splash

# A/B OTA dexopt package
PRODUCT_PACKAGES += otapreopt_script

# Crypto
#PRODUCT_PACKAGES += \
#   libcryptfs_hw

PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# Setup dm-verity configs
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/soc/c0c4000.sdhci/by-name/system
PRODUCT_VENDOR_VERITY_PARTITION := /dev/block/platform/soc/c0c4000.sdhci/by-name/vendor
$(call inherit-product, build/target/product/verity.mk)

# Treble Enabled
PRODUCT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true

	# Partitions (listed in the file) to be wiped under recovery.
TARGET_RECOVERY_WIPE := \
    device/nokia/basil/recovery/root/etc/recovery.wipe

# OEM Unlock reporting
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1

# Define time zone data path
ifneq ($(wildcard bionic/libc/zoneinfo),)
    TZDATAPATH := bionic/libc/zoneinfo
else ifneq ($(wildcard system/timezone),)
    TZDATAPATH := system/timezone/output_data/iana
endif

# Time Zone data for Recovery
ifdef TZDATAPATH
PRODUCT_COPY_FILES += \
    $(TZDATAPATH)/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata
endif

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := basil
PRODUCT_NAME := omni_basil
PRODUCT_BRAND := Nokia
PRODUCT_MODEL := 7 Plus
PRODUCT_MANUFACTURER := Nokia

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=Nokia7Plus \
    BUILD_PRODUCT=Nokia7Plus \
    TARGET_DEVICE=Nokia7Plus

