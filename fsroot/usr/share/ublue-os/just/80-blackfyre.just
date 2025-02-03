# Install system flatpaks
_install-blackfyre-flatpaks:
    #!/bin/bash
    BLACKFYRE_FLATPAK_LIST="$(curl https://raw.githubusercontent.com/mystarkfuture/blackfyre/main/flatpaks/blackfyre_flatpaks | tr '\n' ' ')"
    echo "Installing Blackfyre Flatpaks.."
    flatpak --system -y install ${BLACKFYRE_FLATPAK_LIST}
