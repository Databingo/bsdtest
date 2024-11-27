# toolchains.bootlin.com/downloads

qemu-system-riscv64 \
  -machine virt \
  -m 2048M \
  -smp 2 \
  -nographic \
  -bios opensbi-1.5.1-rv-bin/share/opensbi/lp64/generic/firmware/fw_jump.bin \
  -kernel u-boot.bin \
  -drive file=FreeBSD-15.0-CURRENT-riscv-riscv64-zfs-20241115-79af8f72b3af-273651.qcow2,format=qcow2,id=hd0 \
  -device virtio-blk-pci,drive=hd0 \
  -netdev user,id=net0,ipv6=off,hostfwd=tcp::3322-:22,hostfwd=tcp::7777-:7777,hostfwd=tcp::7778-:7778 \
  -device virtio-net-device,netdev=net0 \
 #-d cpu,mmu
 #-nographic
 #-bios riscv64-lp64d--glibc--bleeding-edge-2024.05-1-fw_jump.elf \
 #-monitor stdio \
 #-device virtio-blk-pci,drive=hd0 \
# -vga std \
# -display cocoa \
 #-bios  fw_jump.elf \
# -netdev user,id=vmnic,hostfwd=tcp::2222-:22,hostfwd=tcp::7777-:7777,hostfwd=tcp::7778-:7778 \
# -device virtio-net,netdev=vmnic \
# -drive file=new10G.img,id=new10G,format=qcow2,if=none \
# -device virtio-blk-pci,drive=new10G \
# git clone qemu
# mkdir build
# python3 -m pip install sphinx==5.3.0    
# python3 -m pip install sphinx_rtd_theme>=0.5
# cd build
# ../cofigure
# make

# pkg for riscv64
# fetch http://lonesome.com/FreeBSD/FreeBSD:13:riscv64/latest/Latest/pkg.txz
# tar xf ./pkg.txz -s ",/.*/,,g" "*/pkg-static"

# create /usr/local/etc/pkg.conf:
# ABI = "FreeBSD:13:riscv64"

# or add in ~/.shrc and run . ~/.shrc :
# alias pkg='/usr/local/projects/bin/pkg-static -o ABI=FreeBSD:13:riscv64'
