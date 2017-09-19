BUILD_DIR = build

# Bootable Image
BOOT_ISO = $(BUILD_DIR)/images/boot.iso
UBUNTU = $(BUILD_DIR)/ubuntu/boot.ipxe $(BUILD_DIR)/ubuntu/ks.cfg

build: $(BOOT_ISO) $(BUILD_DIR)/boot.ipxe $(UBUNTU)

# Build the boot image
$(BOOT_ISO): boot/embed.ipxe
	mkdir -p $(BUILD_DIR)/images
	cd boot/ipxe/src && make EMBED=../../embed.ipxe
	cp boot/ipxe/src/bin/ipxe.iso $(BOOT_ISO)

# Copy main ipxe script
$(BUILD_DIR)/boot.ipxe: boot/boot.ipxe
	cp boot/boot.ipxe $(BUILD_DIR)/boot.ipxe


# Copy Ubuntu boot script and kickstart config
$(UBUNTU): boot/ubuntu/boot.ipxe boot/ubuntu/ks.cfg
	mkdir -p $(BUILD_DIR)/ubuntu
	cp boot/ubuntu/boot.ipxe $(BUILD_DIR)/ubuntu/boot.ipxe
	cp boot/ubuntu/ks.cfg $(BUILD_DIR)/ubuntu/ks.cfg


# Deploy website to boot.dividat.com
deploy: build
	s3cmd sync $(BUILD_DIR) s3://boot.dividat.com/


.PHONY: clean
clean:
	cd boot/ipxe/src && make clean
	rm -r $(BUILD_DIR)
