#!/bin/bash

set -ouex pipefail

# this installs a package from fedora repos
# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1


io_utils=(
    "wl-clipboard"
    "solaar"
    "input-remapper"
    "openssh-askpass" 
    "epson-inkjet-printer-escpr"
    "epson-inkjet-printer-escpr2"
    "printer-driver-brlaser"
    "simple-scan"
    "lm_sensors"
    "foo2zjs"
    "hplip"
)

system_utils=(
    "p7zip"
    "p7zip-plugins"
    "wireguard-tools"
    "setools-console" 
    "firewall-config"
    "libxcrypt-compat"
    "rclone"
    "restic"
    "distrobox"
    "ulauncher"
    "veracrypt"
    "zoxide"
    "stow"
    "git"
    "zsh"
    "fastfetch"
    "ghostty"
    "input-leap"
)

gnome_shell_extensions=(
    "gnome-shell-extension-system-monitor"
    "gnome-shell-extension-appindicator"
    "gnome-shell-extension-blur-my-shell"
    "gnome-shell-extension-caffeine"
)

development_utils=(
    "git-credential-libsecret"
    "code"
    "python3-pip"
    "ublue-brew"
    "gcc"
    "g++"
    "make"
    "automake"
    "autoconf"
    "glibc-devel"
    "libstdc++-devel"
    "binutils"
    "kernel-devel"
    "devpod"
)

packages=(
  ${io_utils[@]}
  ${system_utils[@]}
  ${gnome_shell_extensions[@]}
  ${development_utils[@]}
)

# install rpms
dnf install -y ${packages[@]}