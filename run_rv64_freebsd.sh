# toolchains.bootlin.com/downloads for minimal linux
# macos 11 install qemu-8.2.2 works

# download.freebsd.org/releases
# 14 have riscv64 version
# 14 have zfs version
# 14 pkg have some unoffical support:lonesome
# so use 14.1 release
# libssl.so.111 libcyrpto.so.111 miss for git
# so use 13.3
# 13.3 pkg boot ok
# 13.3 pkg have most 13774 packages; 14 only 548(now 17000+ 2025.6.21) 
# If pkg not work well havt to use ports, we can still choose 14.1-release-zfs
# or ports make pkg and with pkg since 13.3 has many packages
# pkg install git and port install go
# but 13.3 new build pkg not work 
# back to 14.1-zfs with pure ports (conclusion: 14-zfs+port+raw?) (qcow2 meet permitt busy problem)

# qemu-img resize *.qcow2 +20G
qemu-system-riscv64 \
  -machine virt \
  -m 3G \
  -smp 4 \
  -bios opensbi-1.6-rv-bin/share/opensbi/lp64/generic/firmware/fw_jump.bin \
  -kernel u-boot.bin \
  -drive file=FreeBSD-14.3-RELEASE-riscv-riscv64-zfs.qcow2,id=hd0,if=none \
  -device virtio-blk-pci,drive=hd0 \
  -netdev user,id=net0,ipv6=off,hostfwd=tcp::3322-:22,hostfwd=tcp::7777-:7777 \
  -device virtio-net-device,netdev=net0 \
  -nographic &  # after set sshd
# -nographic # first time set sshd

# gpart show # see freebsd-zfs the size, if not automatically extended, follow init_*.sh
 
# set ssh
# /etc/rc.conf sshd_enable="YES"
# /etc/ssh/sshd_config PermitRootLogin yes
# /etc/rc.d/sshd onestart
 
# set passwd
# passwd 07*3

# set initial sh
# scp -P 3322 init_bsd.sh root@127.0.0.1:/root

# use ssh
# ssh -p3322 root@127.0.0.1
# change pubkey in ~/.ssh/known_hosts if reset image
# scp -P 3322 root@127.0.0.1:/file .
# scp -P 3322 file root@127.0.0.1:/usr/local/projects/

# see init_bsd.sh for more operations
# may need set vim vimrc sh shrc
