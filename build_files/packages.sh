#!/bin/bash

set -ouex pipefail

# this installs a package from fedora repos
# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# setup rpmfusion
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# Cleanup unnecessary apps
dnf remove -y gnome-tour \
    firefox \
    firefox-langpacks \
    toolbox

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
    kernel-devel
    # ffmpeg \
    # gstreamer1-plugin-libav \
    # gstreamer1-plugins-bad-free-extras \
    # gstreamer1-plugins-bad-freeworld \
    # gstreamer1-plugins-ugly \
    # gstreamer1-vaapi \
    # mesa-va-drivers-freeworld \
    # mesa-vdpau-drivers-freeworld \
    # libva-nvidia-driver \
    # steam-devices \
    # intel-media-driver \
    # libva-intel-driver \
    
# Cleanup unnecessary apps
dnf remove -y gnome-extensions-app