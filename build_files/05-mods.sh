#!/bin/bash

set -ouex pipefail

# modifications to /etc/
# ZRAM conf
cp /usr/lib/systemd/zram-generator.conf /usr/lib/systemd/zram-generator.conf.bkp
echo -e "\n# Default algorithm changed from lzo-rle to zstd \ncompression-algorithm = zstd" | tee -a /usr/lib/systemd/zram-generator.conf
echo -e "# zram conf copied from PopOS\nvm.swappiness = 180\nvm.watermark_boost_factor = 0\nvm.watermark_scale_factor = 125\nvm.page-cluster = 0" | tee -a /etc/sysctl.d/99-vm-zram-parameters.conf

# WiFi powersave off
echo -e "[connection]\nwifi.powersave=2\n" | tee -a /etc/NetworkManager/conf.d/wifi-powersave-off.conf

# WiFi iwlwifi settings to disable 
echo -e "options iwlwifi disable_11ax=Y 11n_disable=8 power_save=0 \noptions iwlmvm power_scheme=1 \noptions iwlwifi bt_coex_active=N" | tee -a /etc/modprobe.d/iwlwifi.conf