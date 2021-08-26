ARCH = i386
CC = ./toolchain/compiler/bin/i686-elf-gcc
LD = $(CC)
NASM = nasm
INCLUDE = -I./libc/include -I./kernel/include/

CFLAGS = -ffreestanding $(INCLUDE)
NASMFLAGS = -f elf32
LDFLAGS = -T./kernel/arch/i386/linker.ld -ffreestanding -O2 -nostdlib

C_SOURCES = $(shell find kernel/ libc/ -name '*.c')
ASM_SOURCES = $(shell find kernel/ -name '*.asm')
OBJ_FILES = $(C_SOURCES:.c=.o) $(ASM_SOURCES:.asm=.o)

$(KERNEL_FILE): kernel/arch/$(ARCH)/boot.o $(OBJ_FILES)
	@echo "LD $^"
	@$(LD) $(LDFLAGS) $^ -o $@

%.o: %.c
	@echo "CC $<"
	@$(CC) $(CFLAGS) -c $< -o $@

%.o: %.asm
	@echo "NASM $<"
	@$(NASM) $(NASMFLAGS) $< -o $@
