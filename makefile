previewer = ./previewer
iso-pack-path = $(previewer)/iso
iso-path = $(previewer)/grub.iso
test-theme = $(previewer)/iso/boot/test-theme
theme-path = ./theme

preview: make-iso
	qemu-system-x86_64 -boot d -cdrom $(iso-path)

clean-theme:
	rm -r $(test-theme)
	mkdir $(test-theme)

copy-theme: clean-theme
	cp -r $(theme-path)/* $(test-theme)

make-iso: copy-theme
	grub-mkrescue -o $(previewer)/grub.iso $(iso-pack-path)