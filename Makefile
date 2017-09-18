BUILD_DIR = build

# Bootable Image
BOOT_ISO = $(BUILD_DIR)/images/boot.iso

all: $(BOOT_ISO)

$(BOOT_ISO): boot/embed.ipxe
	mkdir -p $(BUILD_DIR)/images
	cd boot/ipxe/src && make EMBED=../../embed.ipxe
	cp boot/ipxe/src/bin/ipxe.iso $(BOOT_ISO)

.PHONY: clean
clean:
	cd boot/ipxe/src && make clean
	rm -r $(BUILD_DIR)


