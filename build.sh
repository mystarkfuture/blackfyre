#!/bin/bash

set -ouex pipefail

# Copy fsroot/ to /
rsync -rvK /tmp/ctx/fsroot/ /

chmod +x /tmp/ctx/build_files/*

/tmp/ctx/build_files/01-copr.sh
/tmp/ctx/build_files/02-packages.sh
/tmp/ctx/build_files/03-brew.sh
/tmp/ctx/build_files/04-systemd.sh
/tmp/ctx/build_files/05-mods.sh
/tmp/ctx/build_files/06-cleanup.sh
