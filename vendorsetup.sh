#!/bin/bash

# Vendor (fresh clone)
echo "Cloning vendor tree..."
rm -rf vendor/xiaomi/peridot
git clone -b lineage-23.2 https://gitlab.com/blu96/vendor-xiaomi-peridot-yt.git vendor/xiaomi/peridot

# Kernel source (fresh clone)
echo "Cloning kernel source tree..."
rm -rf kernel/xiaomi/sm8635
git clone -b los --depth 1 https://gitlab.com/blu96/xiaomi_sm8635.git kernel/xiaomi/sm8635

rm -rf kernel/xiaomi/sm8635-modules
git clone -b lineage-23.2 --depth 1 https://github.com/ryznstk/kernel_xiaomi_sm8635-modules.git kernel/xiaomi/sm8635-modules

rm -rf kernel/xiaomi/sm8635-devicetrees
git clone -b lineage-23.2 --depth 1 https://github.com/ryznstk/kernel_xiaomi_sm8635-devicetrees.git kernel/xiaomi/sm8635-devicetrees

# Hardware xiaomi (fresh clone)
echo "Cloning hardware xiaomi source..."
rm -rf hardware/xiaomi
git clone -b lineage-23.2 https://github.com/ryznstk/hardware_xiaomi_los.git hardware/xiaomi

# MiuiCamera device tree (fresh clone)
echo "Cloning MiuiCamera device tree..."
rm -rf device/xiaomi/peridot-miuicamera
git clone https://github.com/GuidixX/device_xiaomi_peridot-miuicamera.git device/xiaomi/peridot-miuicamera

# MiuiCamera vendor tree (fresh clone)
echo "Cloning MiuiCamera vendor tree..."
rm -rf vendor/xiaomi/peridot-miuicamera
git clone https://github.com/GuidixX/vendor_xiaomi_peridot-miuicamera.git vendor/xiaomi/peridot-miuicamera

# Gamebar
echo "Cloning Gamebar tree..."
rm -rf packages/apps/GameBar
git clone https://github.com/ryznstk/packages_apps_GameBar.git packages/apps/GameBar

# KProfiles (fresh clone)
echo "Cloning KProfiles..."
rm -rf packages/apps/KProfiles
git clone https://github.com/ryznstk/packages_apps_KProfiles.git packages/apps/KProfiles

rm -rf packages/apps/XiaomiParts

# ViperFX
rm -rf packages/apps/ViPER4AndroidFX
git clone https://github.com/TogoFire/packages_apps_ViPER4AndroidFX.git packages/apps/ViPER4AndroidFX

rm -rf packages/apps/TouchServices
git clone https://github.com/kenway214/packages_apps_TouchServices.git -b lineage-23.2 packages/apps/TouchServices

cd packages/modules/Bluetooth
git fetch https://github.com/LineageOS/android_packages_modules_Bluetooth refs/changes/77/486977/3
git checkout FETCH_HEAD
croot

cd packages/modules/Nfc
git fetch https://github.com/LineageOS/android_packages_modules_Nfc refs/changes/67/488367/1
git checkout FETCH_HEAD
croot

cd packages/apps/CertInstaller
git fetch https://github.com/LineageOS/android_packages_apps_CertInstaller refs/changes/63/486963/2 
git cherry-pick FETCH_HEAD
croot

cd packages/apps/KeyChain
git fetch https://github.com/LineageOS/android_packages_apps_KeyChain refs/changes/65/486965/2
git cherry-pick FETCH_HEAD
croot

cd packages/apps/DocumentsUI
git fetch https://github.com/LineageOS/android_packages_apps_DocumentsUI refs/changes/64/486964/3
git cherry-pick FETCH_HEAD
croot

cd packages/apps/Launcher3
git fetch https://github.com/LineageOS/android_packages_apps_Launcher3 refs/changes/66/486966/3
git cherry-pick FETCH_HEAD
croot

cd external/libpng
git fetch https://github.com/LineageOS/android_external_libpng refs/changes/37/486937/2
git checkout FETCH_HEAD
croot

cd packages/providers/ContactsProvider
git fetch https://github.com/LineageOS/android_packages_providers_ContactsProvider refs/changes/80/486980/2 && git cherry-pick FETCH_HEAD
git fetch https://github.com/LineageOS/android_packages_providers_ContactsProvider refs/changes/81/486981/2 && git cherry-pick FETCH_HEAD
croot

cd packages/providers/MediaProvider
git fetch https://github.com/LineageOS/android_packages_providers_MediaProvider refs/changes/58/488358/1 && git cherry-pick FETCH_HEAD
git fetch https://github.com/LineageOS/android_packages_providers_MediaProvider refs/changes/59/488359/1 && git cherry-pick FETCH_HEAD
croot

cd packages/services/Telephony
git fetch https://github.com/LineageOS/android_packages_services_Telephony refs/changes/62/488362/1 && git cherry-pick FETCH_HEAD
croot

cd packages/apps/Settings
git fetch https://github.com/LineageOS/android_packages_apps_Settings refs/changes/68/486968/4 && git cherry-pick FETCH_HEAD
git fetch https://github.com/LineageOS/android_packages_apps_Settings refs/changes/69/486969/4 && git cherry-pick FETCH_HEAD
git fetch https://github.com/LineageOS/android_packages_apps_Settings refs/changes/70/486970/4 && git cherry-pick FETCH_HEAD
git fetch https://github.com/LineageOS/android_packages_apps_Settings refs/changes/71/486971/4 && git cherry-pick FETCH_HEAD
git fetch https://github.com/LineageOS/android_packages_apps_Settings refs/changes/72/486972/4 && git cherry-pick FETCH_HEAD
git fetch https://github.com/LineageOS/android_packages_apps_Settings refs/changes/73/486973/4 && git cherry-pick FETCH_HEAD
git fetch https://github.com/LineageOS/android_packages_apps_Settings refs/changes/68/488368/2 && git cherry-pick FETCH_HEAD
git fetch https://github.com/LineageOS/android_packages_apps_Settings refs/changes/69/488369/2 && git cherry-pick FETCH_HEAD
croot

cd  external/SQLite
git fetch https://github.com/LineageOS/android_external_sqlite refs/changes/38/486938/2 && git cherry-pick FETCH_HEAD
croot

rm -rf vendor/evolution-priv

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
