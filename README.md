# image-template

# Purpose

This repository is meant to be a template for building your own custom Universal Blue image. This template is the recommended way to make customizations to any image published by the Universal Blue Project:

- [Aurora](https://getaurora.dev/)
- [Bazzite](https://bazzite.gg/)
- [Bluefin](https://projectbluefin.io/)
- [uCore](https://projectucore.io/)
- [main](https://github.com/ublue-os/main/)
- [hwe](https://github.com/ublue-os/hwe/)

This template includes a Containerfile and a Github workflow for building the container image. As soon as the workflow is enabled in your repository, it will build the container image and push it to the Github Container Registry.

# Prerequisites

Working knowledge in the following topics:

- Containers
  - https://www.youtube.com/watch?v=SnSH8Ht3MIc
  - https://www.mankier.com/5/Containerfile
- bootc
  - https://containers.github.io/bootc/
- Fedora Silverblue (and other Fedora Atomic variants)
  - https://docs.fedoraproject.org/en-US/fedora-silverblue/
- Github Workflows
  - https://docs.github.com/en/actions/using-workflows

# How to Use

## Template

Select `Use this Template` and create a new repository from it. To enable the workflows, you may need to go the `Actions` tab of the new repository and click to enable workflows.

## Containerfile

This file defines the operations used to customize the selected image. It contains examples of possible modifications, including how to:

- change the upstream from which the custom image is derived
- add additional RPM packages
- add binaries as a layer from other images

## Building an ISO

Modify `iso.toml` to point to your custom image before generating an ISO.

- (Steps in progress)

## Workflows

### build.yml

This workflow creates your custom OCI image and publishes it to the Github Container Registry (GHCR). By default, the image name will match the Github repository name.

#### Container Signing

Container signing is important for end-user security and is enabled on all Universal Blue images. It is recommended you set this up, and by default the image builds _will fail_ if you don't.

This provides users a method of verifying the image.

1. Install the [cosign CLI tool](https://edu.chainguard.dev/open-source/sigstore/cosign/how-to-install-cosign/#installing-cosign-with-the-cosign-binary)

2. Run inside your repo folder:

   ```bash
   cosign generate-key-pair
   ```

   - Do NOT put in a password when it asks you to, just press enter. The signing key will be used in GitHub Actions and will not work if it is encrypted.

> [!WARNING]
> Be careful to _never_ accidentally commit `cosign.key` into your git repo.

3. Add the private key to GitHub

   - This can also be done manually. Go to your repository settings, under Secrets and Variables -> Actions
     ![image](https://user-images.githubusercontent.com/1264109/216735595-0ecf1b66-b9ee-439e-87d7-c8cc43c2110a.png)
     Add a new secret and name it `SIGNING_SECRET`, then paste the contents of `cosign.key` into the secret and save it. Make sure it's the .key file and not the .pub file. Once done, it should look like this:
     ![image](https://user-images.githubusercontent.com/1264109/216735690-2d19271f-cee2-45ac-a039-23e6a4c16b34.png)

   - (CLI instructions) If you have the `github-cli` installed, run:

   ```bash
   gh secret set SIGNING_SECRET < cosign.key
   ```

4. Commit the `cosign.pub` file to the root of your git repository.

# Community

- [**bootc discussion forums**](https://github.com/containers/bootc/discussions) - Nothing in this template is ublue specific, the upstream bootc project has a discussions forum where custom image builders can hang out and ask questions.
- Index your image on [artifacthub.io](https://artifacthub.io), use the `artifacthub-repo.yml` file at the root to verify yourself as the publisher.

## Community Examples

- [m2os](https://github.com/m2giles/m2os)
- [bos](https://github.com/bsherman/bos)
- [homer](https://github.com/bketelsen/homer/)

## Rebase

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/mystarkfuture/blackfyre:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/mystarkfuture/blackfyre:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

## Scratchpad

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mystarkfuture/blackfyre:latest
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/mystarkfuture/blackfyre:latest


rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/bluefin-dx:latest
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/ublue-os/bluefin-dx:latest

sudo usermod -s /user/bin/zsh $USERNAME


[Unit]
Description=Set battery charge thresholds TODO : this needs to be removed in Gnome 48
After=multi-user.target
StartLimitBurst=0

[Service]
Type=oneshot
Restart=on-failure
RemainAfterExit=yes
ExecStart=/bin/bash -c 'echo 80 > /sys/class/power_supply/BAT0/charge_control_start_threshold; echo 85 > /sys/class/power_supply/BAT0/charge_control_end_threshold'
ExecStop=/bin/bash -c 'echo 100 > /sys/class/power_supply/BAT0/charge_control_end_threshold; echo 99 > /sys/class/power_supply/BAT0/charge_control_start_threshold'

[Install]
WantedBy=multi-user.target


systemctl enable battery-charge-thresholds


# udev rules to limit laptop battery charge to 85% - TODO : this needs to be removed in Gnome 48
echo -e 'SUBSYSTEM=="power_supply", ENV{POWER_SUPPLY_ONLINE}=="1", RUN+="/bin/sh -c '\''echo 85 > /sys/class/power_supply/BAT0/charge_control_end_threshold'\''"' | tee -a /etc/udev/rules.d/r_battery.rules

```

## Generate ISO

```bash
sudo podman run --rm --privileged \
    --volume .:/build-container-installer/build \
    --security-opt label=disable --pull=newer \
    ghcr.io/jasonn3/build-container-installer:latest \
    IMAGE_REPO="ghcr.io/mystarkfuture" \
    IMAGE_NAME="blackfyre" \
    IMAGE_TAG="latest" \
    VARIANT="Silverblue"

```

## Install Flatpaks

After rebase, you will need to run the command below to install all flatpaks that are shipped with Bazzite and Isengard

```bash
ujust _install-blackfyre-flatpaks
```

list of flatpaks held back

```
app/org.onlyoffice.desktopeditors/x86_64/stable
app/io.github.sigmasd.stimulator/x86_64/stable
```
