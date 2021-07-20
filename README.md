<!-- Originally started while listening to the Cramps! -->
# monkeOS
The 32-bit OS for Monkes!
## Running on QEMU:
### Requirements:
1. binutils
2. qemu-i386
### Running
```shell
# Make sure to run this all as root
chmod +x build.sh
chmod +x clean.sh
chmod +x config.sh
chmod +x default-host.sh
chmod +x headers.sh
chmod +x iso.sh
chmod +x qemu.sh
chmod +x target-triplet-to-arch.sh

./qemu.sh
```
