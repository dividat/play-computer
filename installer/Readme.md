# Play Computer Installer

Installer for (as much as possible) automized installation of Ubuntu based system for usage with Dividat Play.

## Overview

The built artifacts are:

-   `installer.usb`: A bootable USB image
-   `boot.ipxe`: An iPXE script
-   `ubuntu/`: Ubuntu specific iPXE script and preseed configuration

The bootable USB image is based on [iPXE](http://ipxe.org/) with an [embeded script](./ipxe/embed.ipxe) that will load the script [`boot.ipxe`](boot.ipxe) which is deployed to <https://boot.dividat.com>.

The script [`boot.ipxe`](boot.ipxe) will present a menu and ask for confirmation to continue with installation. Installation continues by loading the script [`ubuntu/boot.ipxe`](ubuntu/boot.ipxe).

The script [`ubunut/boot.ipxe`](ubuntu/boot.ipxe) downloads and starts an Ubuntu installer with [preseed](https://help.ubuntu.com/lts/installation-guide/s390x/apb.html).

The [preseed configuration](ubuntu/preseed.cfg) will run `ansible-pull` to set up system as play-computer.

## Development

### Prerequisites

-   [Nix](https://nixos.org/nix) is required for installing dependencies and providing a suitable development environment.
-   Qemu can be used for testing the created boot images

### Quick start

`nix-shell --command make`

### Testing with Qemu

`nix-shell --command 'make clean && make qemu'`

### Deploying to `boot.dividat.com`

`nix-shell --command 'make deploy'`

### Flashing

-   The USB image can be written directly to a drive:

    `cat build/installer.usb | sudo tee /dev/sdX`

    Take care to identify that `sdX` is the right disk, as all previous contents will be removed.

### Caveats

-   The iPXE image is built by Nix as a buildInput to this derivation. If you start a `nix-shell`, make changes to the `ipxe/` folder and run `make` the changes in the `ipxe/` folder will not be picked up. This can be fixed by some Makefile hacking. An easy way out: restart your `nix-shell`. A nicer way: build using `nix-build -o build`. A subsequent `make deploy` will work as `awscli` follows symlinks.
