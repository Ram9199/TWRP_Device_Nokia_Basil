LOCAL_PATH := device/nokia/basil

# Getting this to build in my local omni tree proved quite difficult so just using a prebuilt update_engine_sideload for now.
# Oddly enough, OnePlus stock recovery does not include an update_engine_sideload binary either.
# Enable update engine sideloading by including the static version of the
# boot_control HAL and its dependencies.
#PRODUCT_STATIC_BOOT_CONTROL_HAL := \
#    bootctrl.sdm660 \
#    librecovery_updater_msm \
#    libsparse


