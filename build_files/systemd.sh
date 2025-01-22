#!/bin/bash

set -ouex pipefail

# systemd units
systemctl enable podman.socket
systemctl enable check-sb-key.service

# brew
systemctl enable brew-upgrade.timer
systemctl enable brew-update.timer
