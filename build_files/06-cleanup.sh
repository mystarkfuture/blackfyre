#!/bin/bash

set -ouex pipefail

# Cleanup unnecessary apps
dnf remove -y gnome-tour \
    firefox \
    firefox-langpacks \
    toolbox \
    gnome-extensions-app