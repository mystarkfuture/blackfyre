#!/bin/bash

set -ouex pipefail

# systemd units
systemctl enable podman.socket
systemctl enable check-sb-key.service

# brew
systemctl enable brew-upgrade.timer
systemctl enable brew-update.timer

# udev rules restart - limit battery charge to 70%
udevadm control --reload-rules
systemctl restart upower
