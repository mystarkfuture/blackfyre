#!/bin/bash

set -ouex pipefail

# modifications to /etc/
# ZRAM conf
cp /usr/lib/systemd/zram-generator.conf /usr/lib/systemd/zram-generator.conf.bkp
echo -e "\n# Default algorithm changed from lzo-rle to zstd \ncompression-algorithm = zstd" | tee -a /usr/lib/systemd/zram-generator.conf
echo -e "# zram conf copied from PopOS\nvm.swappiness = 180\nvm.watermark_boost_factor = 0\nvm.watermark_scale_factor = 125\nvm.page-cluster = 0" | tee -a /etc/sysctl.d/99-vm-zram-parameters.conf

# WiFi powersave off
echo -e "[connection]\nwifi.powersave=2\n" | tee -a /etc/NetworkManager/conf.d/wifi-powersave-off.conf

# udev rules to limit laptop battery charge to 85% - TODO : remove on gnome 48 
# echo -e 'SUBSYSTEM=="power_supply", ENV{POWER_SUPPLY_ONLINE}=="1", RUN+="/bin/sh -c '\''echo 85 > /sys/class/power_supply/BAT0/charge_control_end_threshold'\''"' | tee -a /etc/udev/rules.d/r_battery.rules