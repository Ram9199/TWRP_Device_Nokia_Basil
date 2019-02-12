LOCAL_PATH := device/nokia/basil

# Enable update engine sideloading by including the static version of the
# boot_control HAL and its dependencies.
PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sdm660 \
    librecovery_updater_msm \
    libsparse

PRODUCT_PACKAGES += \
    update_engine_sideload

