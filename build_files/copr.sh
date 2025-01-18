#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


# ghostty
curl -Lo /etc/yum.repos.d/_copr_pgdev-ghostty-fedora-"${RELEASE}".repo https://copr.fedorainfracloud.org/coprs/pgdev/ghostty/repo/fedora-"${RELEASE}"/pgdev-ghostty-fedora-"${RELEASE}".repo

# veracrypt
curl -Lo /etc/yum.repos.d/_copr_robot-veracrypt-fedora-"${RELEASE}".repo https://copr.fedorainfracloud.org/coprs/robot/veracrypt/repo/fedora-"${RELEASE}"/robot-veracrypt-fedora-"${RELEASE}".repo
