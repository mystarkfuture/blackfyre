#!/bin/bash

set -ouex pipefail

# this installs a package from fedora repos
# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Cleanup unnecessary apps
dnf remove -y gnome-tour
dnf remove -y firefox-langpacks
dnf remove -y firefox
dnf remove -y toolbox

# # use these to disable system update modules
# dnf remove gnome-software-rpm-ostree
# dnf remove ublue-os-update-services
# dnf remove podman-docker

# printer / scanner utils
dnf install -y epson-inkjet-printer-escpr
dnf install -y epson-inkjet-printer-escpr2
dnf install -y printer-driver-brlaser
dnf install -y simple-scan
dnf install -y foo2zjs
dnf install -y hplip
dnf install -y firewall-config

# utilities
dnf install -y p7zip
dnf install -y p7zip-plugins
dnf install -y wl-clipboard
dnf install -y wireguard-tools
dnf install -y veracrypt
dnf install -y solaar
dnf install -y git-credential-libsecret
dnf install -y input-remapper
dnf install -y lm_sensors
dnf install -y rclone
dnf install -y restic
dnf install -y setools-console
dnf install -y openssh-askpass

# DE tools
dnf install -y gnome-shell-extension-system-monitor
dnf install -y gnome-shell-extension-appindicator
dnf install -y gnome-shell-extension-blur-my-shell
dnf install -y gnome-shell-extension-caffeine
dnf install -y ulauncher

# Development
dnf install -y code
dnf install -y python3-pip
dnf install -y libxcrypt-compat
dnf install -y distrobox
dnf install -y ublue-brew

# Terminal tools
dnf install -y zoxide
dnf install -y stow
dnf install -y git
dnf install -y zsh
dnf install -y fastfetch
dnf install -y ghostty

# essentials for homebrew
dnf install -y gcc
dnf install -y g++
dnf install -y make
dnf install -y automake
dnf install -y autoconf
dnf install -y glibc-devel
dnf install -y libstdc++-devel
dnf install -y binutils
dnf install -y kernel-devel

# Cleanup unnecessary apps
dnf remove -y gnome-extensions-app

