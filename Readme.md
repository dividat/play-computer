# Play Computer

This repo contains tools for setting up a computer for usage with Divdat Play.

Following components are included and/or built:

-   [iPXE](http://ipxe.org/) based boot image
-   Support website for boot image hosting iPXE scripts and install configurations
-   [Preseed](https://help.ubuntu.com/lts/installation-guide/amd64/apb.html) for automatic installation
-   [Ansbile](https://www.ansible.com/) playbooks for post-installation configuration
-   Utilities

## Directories

-   `boot/`: Files for creating boot images and the boot website
-   `roles/`: Ansible roles
-   `utils/`: Utilities

## Boot image

Build boot images, scripts and configurations for boot website:

      make

Deploy site to <http://boot.dividat.com/> ([AWS CLI](https://aws.amazon.com/cli/) required):

      make deploy

## Ansible playbooks

-   `ubuntu.yml`: Configure a Ubuntu system to run Dividat Play.
