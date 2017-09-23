BUILD_DIR = build

# Bootable Image
BOOT_IMAGES = $(BUILD_DIR)/images/boot.iso $(BUILD_DIR)/images/boot.usb
UBUNTU = $(BUILD_DIR)/ubuntu/boot.ipxe $(BUILD_DIR)/ubuntu/ks.cfg

build: $(BOOT_IMAGES) $(BUILD_DIR)/boot.ipxe $(UBUNTU)

# Build the boot image
$(BOOT_IMAGES): boot/embed.ipxe
	mkdir -p $(BUILD_DIR)/images
	cd boot/ipxe/src && make EMBED=../../embed.ipxe
	cp boot/ipxe/src/bin/ipxe.iso $(BUILD_DIR)/images/boot.iso
	cp boot/ipxe/src/bin/ipxe.usb $(BUILD_DIR)/images/boot.usb

# Copy main ipxe script
$(BUILD_DIR)/boot.ipxe: boot/boot.ipxe
	cp boot/boot.ipxe $(BUILD_DIR)/boot.ipxe


# Copy Ubuntu boot script and kickstart config
$(UBUNTU): boot/ubuntu/boot.ipxe boot/ubuntu/preseed.cfg
	mkdir -p $(BUILD_DIR)/ubuntu
	cp boot/ubuntu/boot.ipxe $(BUILD_DIR)/ubuntu/boot.ipxe
	cp boot/ubuntu/preseed.cfg $(BUILD_DIR)/ubuntu/preseed.cfg


# Deploy website to boot.dividat.com
deploy: build
	aws s3 sync $(BUILD_DIR) "s3://boot.dividat.com" --region="eu-central-1" --delete --cache-control max-age=5


.PHONY: clean
clean:
	cd boot/ipxe/src && make clean
	rm -r $(BUILD_DIR)
