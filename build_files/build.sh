#!/bin/bash

set -ouex pipefail

### Install packages from Fedora repos
FEDORA_PACKAGES=(
    tmux
)

echo "Installing ${#FEDORA_PACKAGES[@]} packages from Fedora repos..."
dnf5 -y install "${FEDORA_PACKAGES[@]}"


### Install packages from COPR
# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

# Install newer OpenConnect version.
dnf5 -y copr enable "dwmw2/openconnect"
dnf5 -y install "openconnect" "NetworkManager-openconnect"
dnf5 -y copr disable "dwmw2/openconnect" 


### Cleanup
dnf5 clean all
