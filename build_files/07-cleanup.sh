#!/bin/bash

set -ouex pipefail

# Cleanup unnecessary apps
dnf remove -y gnome-tour \
    firefox \
    firefox-langpacks \
    toolbox \
    gnome-extensions-app \
    gnome-shell-extension-background-logo \
    gnome-shell-extension-apps-menu

# Remove copr repos
dnf5 -y copr disable pgdev/ghostty 
dnf5 -y copr disable robot/veracrypt
dnf5 -y copr disable ublue-os/staging