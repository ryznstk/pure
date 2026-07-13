#!/bin/bash

# Vendor (fresh clone)
echo "Cloning vendor tree..."
rm -rf vendor/xiaomi/peridot
git clone -b los https://gitlab.com/blu96/vendor-xiaomi-peridot-yt.git vendor/xiaomi/peridot

# Kernel source (fresh clone)
echo "Cloning kernel source tree..."
rm -rf kernel/xiaomi/sm8635
git clone -b resuki --depth 1 https://gitlab.com/blu96/xiaomi_sm8635.git kernel/xiaomi/sm8635

rm -rf kernel/xiaomi/sm8635-modules
git clone -b ll --depth 1 https://github.com/ryznstk/kernel_xiaomi_sm8635-modules.git kernel/xiaomi/sm8635-modules

rm -rf kernel/xiaomi/sm8635-devicetrees
git clone -b lineage-23.2 --depth 1 https://github.com/ryznstk/kernel_xiaomi_sm8635-devicetrees.git kernel/xiaomi/sm8635-devicetrees

cd kernel/xiaomi/sm8635
curl -LSs "https://raw.githubusercontent.com/ReSukiSU/ReSukiSU/main/kernel/setup.sh" | bash
croot

# Hardware xiaomi (fresh clone)
echo "Cloning hardware xiaomi source..."
rm -rf hardware/xiaomi
git clone -b lineage-23.2 https://github.com/ryznstk/hardware_xiaomi_los.git hardware/xiaomi

# MiuiCamera device tree (fresh clone)
echo "Cloning MiuiCamera device tree..."
rm -rf device/xiaomi/peridot-miuicamera
git clone https://github.com/ryznstk/android_device_xiaomi_peridot-miuicamera.git device/xiaomi/peridot-miuicamera

# MiuiCamera vendor tree (fresh clone)
echo "Cloning MiuiCamera vendor tree..."
rm -rf vendor/xiaomi/peridot-miuicamera
git clone https://gitlab.com/blu96/proprietary_vendor_xiaomi_peridot-miuicamera.git vendor/xiaomi/peridot-miuicamera

# Gamebar
echo "Cloning Gamebar tree..."
rm -rf packages/apps/GameBar
git clone https://github.com/ryznstk/packages_apps_GameBar.git packages/apps/GameBar

# KProfiles (fresh clone)
echo "Cloning KProfiles..."
rm -rf packages/apps/KProfiles
git clone https://github.com/ryznstk/packages_apps_KProfiles.git packages/apps/KProfiles

rm -rf packages/apps/XiaomiParts

cd frameworks/base
git fetch https://github.com/Lunaris-AOSP/frameworks_base test
git reset --hard FETCH_HEAD
croot

cd packages/apps/Singularity
git fetch https://github.com/ryznstk/packages_apps_Singularity test
git reset --hard FETCH_HEAD
croot

cd packages/apps/Settings
git fetch https://github.com/ryznstk/packages_apps_Settings test
git reset --hard FETCH_HEAD
croot

#cd system/sepolicy
#git fetch https://github.com/ryznstk/lunaris_system_sepolicy test
#git reset --hard FETCH_HEAD
#croot

#cd vendor/lineage
#git fetch https://github.com/Lunaris-AOSP/vendor_lineage test
#git reset --hard FETCH_HEAD
#croot

# ViperFX
rm -rf packages/apps/ViPER4AndroidFX
git clone https://github.com/TogoFire/packages_apps_ViPER4AndroidFX.git packages/apps/ViPER4AndroidFX

rm -rf packages/apps/AxionFx
git clone https://github.com/AxionAOSP/android_packages_apps_AxionFx.git packages/apps/AxionFx

rm -rf external/steam-audio
git clone -b lineage-23.2 https://github.com/AxionAOSP/android_external_steam-audio.git external/steam-audio

rm -rf packages/apps/TouchServices
git clone https://github.com/kenway214/packages_apps_TouchServices.git -b lineage-23.2 packages/apps/TouchServices

cd external/pffft
git fetch https://github.com/AxionAOSP/android_external_pffft lineage-23.2
git reset --hard FETCH_HEAD
croot

cd hardware/interfaces
git fetch https://github.com/ryznstk/lunaris_hardware_interfaces 16.2
git reset --hard FETCH_HEAD
croot

cd frameworks/av
git fetch https://github.com/AxionAOSP/android_frameworks_av lineage-23.2
git cherry-pick 463cdb4267ceece8c7b630cb0339ea26e985075c
croot

cd system/media
git fetch https://github.com/ryznstk/system_media bq2
git reset --hard FETCH_HEAD
croot

#cd packages/apps/Launcher3
#git fetch https://github.com/Lunaris-AOSP/packages_apps_Launcher3 16.2
#git reset --hard FETCH_HEAD
#croot

rm -rf vendor/evolution-priv
rm -rf vendor/voltage-priv

# Refresh signing keys
if [ -d vendor/lineage-priv/keys ]; then
  echo "Removing existing signing keys..."
  rm -rf vendor/lineage-priv/keys
fi
echo "Cloning fresh signing keys..."
git clone https://github.com/droidcore/private_key.git -b main vendor/lineage-priv/keys

# Always back to root at the end
if command -v croot &>/dev/null; then
  croot
else
  cd "$ANDRID_BUILD_TOP" || true
fi

echo "vendorsetup.sh execution complete."
