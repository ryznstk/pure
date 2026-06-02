#!/bin/bash

# Vendor (fresh clone)
echo "Cloning vendor tree..."
rm -rf vendor/xiaomi/peridot
git clone -b lineage-23.2 https://gitlab.com/blu96/vendor-xiaomi-peridot-yt.git vendor/xiaomi/peridot

# Kernel source (fresh clone)
echo "Cloning kernel source tree..."
rm -rf kernel/xiaomi/sm8635
git clone -b test6 --depth 1 https://gitlab.com/blu96/kernel_xiaomi_sm8635_peridot.git kernel/xiaomi/sm8635

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

# LMO
echo "fetching LMOfreeroam tree..."
cd packages/apps/LMOFreeform
git fetch https://github.com/kenway214/packages_apps_LMOFreeform.git sixteen-qpr2
git reset --hard FETCH_HEAD
croot

# KProfiles (fresh clone)
echo "Cloning KProfiles..."
rm -rf packages/apps/KProfiles
git clone https://github.com/ryznstk/packages_apps_KProfiles.git packages/apps/KProfiles

rm -rf packages/apps/XiaomiParts

# ViperFX
rm -rf packages/apps/ViPER4AndroidFX
git clone https://github.com/TogoFire/packages_apps_ViPER4AndroidFX.git packages/apps/ViPER4AndroidFX

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
