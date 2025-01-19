#!/bin/bash

set -ouex pipefail

# ublue staging 
curl --retry 3 -Lo /etc/yum.repos.d/ublue-os-staging-fedora-"$(rpm -E %fedora)".repo \
    https://copr.fedorainfracloud.org/coprs/ublue-os/staging/repo/fedora-"$(rpm -E %fedora)"/ublue-os-staging-fedora-"$(rpm -E %fedora)".repo


# ghostty
curl --retry 3 -Lo /etc/yum.repos.d/_copr_pgdev-ghostty-fedora-"$(rpm -E %fedora)".repo \
    https://copr.fedorainfracloud.org/coprs/pgdev/ghostty/repo/fedora-"$(rpm -E %fedora)"/pgdev-ghostty-fedora-"$(rpm -E %fedora)".repo

# veracrypt
curl --retry 3 -Lo /etc/yum.repos.d/_copr_robot-veracrypt-fedora-"$(rpm -E %fedora)".repo \
    https://copr.fedorainfracloud.org/coprs/robot/veracrypt/repo/fedora-"$(rpm -E %fedora)"/robot-veracrypt-fedora-"$(rpm -E %fedora)".repo