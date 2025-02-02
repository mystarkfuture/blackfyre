#!/bin/bash

set -ouex pipefail

# Cleanup unnecessary apps
dnf remove -y gnome-tour \
    firefox \
    firefox-langpacks \
    toolbox \
    gnome-extensions-app

# Remove copr repos
dnf5 -y copr disable pgdev/ghostty 
dnf5 -y copr disable robot/veracrypt
dnf5 -y copr disable ublue-os/staging