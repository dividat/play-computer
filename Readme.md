# Play Computer

This repo contains tools for setting up a computer for usage with Divdat Play.

Following components are included and or built:

-   [iPXE](http://ipxe.org/) based bootloader
-   Website hosting iPXE scripts and install configurations
-   Ubuntu Kickstart configuration for automatic installation

## Directories

-   `boot/`: Files for creating boot images and the boot website

## Quickstart

Build boot images, scripts and configurations for boot website:

      make

Deploy site to <http://boot.dividat.com/> ([s3cmd](https://github.com/s3tools/s3cmd) required):

      make deploy
