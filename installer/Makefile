out ?= build

# Ubuntu fies
UBUNTU_FILES = $(out)/ubuntu/boot.ipxe $(out)/ubuntu/preseed.cfg

all: $(out)/installer.usb $(out)/boot.ipxe $(UBUNTU_FILES)
install: all

$(out)/installer.usb: $(IPXE_USB)
	mkdir -p $(out)
	cp $(IPXE_USB) $(out)/installer.usb

# Copy main ipxe script
$(out)/boot.ipxe: boot.ipxe
	mkdir -p $(out)
	cp boot.ipxe $(out)/boot.ipxe

# Copy Ubuntu boot script and preseed config
$(out)/ubuntu/boot.ipxe: ubuntu/boot.ipxe
	mkdir -p $(out)/ubuntu
	cp ubuntu/boot.ipxe $(out)/ubuntu/boot.ipxe

$(out)/ubuntu/preseed.cfg: ubuntu/preseed.cfg
	mkdir -p $(out)/ubuntu
	cp ubuntu/preseed.cfg $(out)/ubuntu/preseed.cfg

# Deploy website to boot.dividat.com
deploy: clean all
	aws s3 sync $(out) "s3://boot.dividat.com" --region="eu-central-1" --delete --cache-control max-age=5

.PHONY: qemu
qemu: $(out)/installer.usb
	@# Qemu requires write access to disk image
	chmod +w $<
	qemu-system-x86_64 -hda $<

.PHONY: clean
clean:
	rm -rf $(out)
