#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/monkeos.kernel isodir/boot/monkeos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "monkeos" {
	multiboot /boot/myos.kernel
}
EOF
grub-mkrescue -o monkeos.iso isodir
