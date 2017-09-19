# Play Computer

This repo contains tools for setting up a computer for usage with Divdat Play.

Following components are included and/or built:

-   [iPXE](http://ipxe.org/) based boot image
-   Support website for boot image hosting iPXE scripts and install configurations
-   [Kickstart](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Installation_Guide/ch-kickstart2.html) configuration for automatic installation
-   [Ansbile](https://www.ansible.com/) playbooks for post-installation configuration

## Directories

-   `boot/`: Files for creating boot images and the boot website
-   `roles/`: Ansible roles

## Boot image

Build boot images, scripts and configurations for boot website:

      make

Deploy site to <http://boot.dividat.com/> ([s3cmd](https://github.com/s3tools/s3cmd) required):

      make deploy

## Ansible playbooks

-   `ubuntu.yml`: Configure a Ubuntu system to run Dividat Play.
