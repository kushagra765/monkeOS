ARCH = i386
CC = ./toolchain/compiler/bin/i686-elf-gcc
AS = ./toolchain/compiler/bin/i686-elf-as
LD = $(CC)
INCLUDE = -I./src/kernel/include/ -I./src/libc/include/
KERNEL_FILE = kernel.bin
ISO_FILE = monkeOS.iso

CFLAGS = -ffreestanding $(INCLUDE)
LDFLAGS = -T./src/kernel/arch/$(ARCH)/linker.ld -ffreestanding -O2 -nostdlib

C_SOURCES = $(shell find src/kernel/ src/libc/ -name '*.c')
ASM_SOURCES = $(shell find src/kernel/ -name '*.S')
OBJ_FILES = $(C_SOURCES:.c=.o) $(ASM_SOURCES:.S=.o)

$(ISO_FILE): $(KERNEL_FILE)
	@mkdir -p isodir/boot/grub/
	@cp grub.cfg isodir/boot/grub/
	@cp $(KERNEL_FILE) isodir/boot/
	@grub-mkrescue -o $(ISO_FILE) isodir

$(KERNEL_FILE): $(OBJ_FILES)
	@echo "LD $^"
	@$(LD) $(LDFLAGS) $^ -o $@

%.o: %.c
	@echo "CC $<"
	@$(CC) $(CFLAGS) -c $< -o $@

%.o: %.S
	@echo "AS $<"
	@$(AS) $< -o $@
	
clean:
	@rm $(OBJ_FILES)
	@rm $(KERNEL_FILE) $(ISO_FILE)
	
run:
	@qemu-system-i386 $(ISO_FILE)
