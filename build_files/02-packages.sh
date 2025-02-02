#!/bin/bash

set -ouex pipefail

# this installs a package from fedora repos
# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

dnf install -y \
    p7zip \
    p7zip-plugins \
    wl-clipboard \
    wireguard-tools \
    veracrypt \
    solaar \
    git-credential-libsecret \
    input-remapper \
    lm_sensors \
    rclone \
    restic \
    setools-console \
    openssh-askpass \
    epson-inkjet-printer-escpr \
    epson-inkjet-printer-escpr2 \
    printer-driver-brlaser \
    simple-scan \
    foo2zjs \
    hplip \
    firewall-config \
    gnome-shell-extension-system-monitor \
    gnome-shell-extension-appindicator \
    gnome-shell-extension-blur-my-shell \
    gnome-shell-extension-caffeine \
    ulauncher \
    code \
    python3-pip \
    libxcrypt-compat \
    distrobox \
    ublue-brew \
    zoxide \
    stow \
    git \
    zsh \
    fastfetch \
    ghostty \
    gcc \
    g++ \
    make \
    automake \
    autoconf \
    glibc-devel \
    libstdc++-devel \
    binutils \
    kernel-devel \
    ghostty \
    veracrypt
