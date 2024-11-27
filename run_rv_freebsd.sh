# toolchains.bootlin.com/downloads for minimal linux

# download.freebsd.org/releases
# 14 have riscv64 version
# 14 have zfs version
# 14 pkg have some unoffical support 
# so 14.1 release

# ssh -p3322 root@127.0.0.1
# scp -P 3322 root@127.0.0.1:/file .
# scp -P 3322 file root@127.0.0.1:/usr/local/projects/
qemu-system-riscv64 \
  -machine virt \
  -m 2048M \
  -smp 2 \
  -bios opensbi-1.5.1-rv-bin/share/opensbi/lp64/generic/firmware/fw_jump.bin \
  -kernel u-boot.bin \
  -drive file=FreeBSD-14.1-RELEASE-riscv-riscv64-zfs.qcow2,format=qcow2,id=hd0 \
  -device virtio-blk-pci,drive=hd0 \
  -netdev user,id=net0,ipv6=off,hostfwd=tcp::3322-:22,hostfwd=tcp::7777-:7777,guestfwd=tcp:10.0.2.15:7890-tcp:127.0.0.1:7890 \
  -device virtio-net-device,netdev=net0 \
  -nographic \
 #-monitor none &

# ssh
# /etc/rc.conf sshd_enable="YES"
# /etc/ssh/sshd_config PermitRootLogin yes
# /etc/rc.d/sshd onestart
# passwd
# scp -P 3322 init_bsd.sh root@127.0.0.1:/root

# pkg for riscv64
# config
# add to /usr/local/etc/pkg/repos/lonesome.com.conf
# lonesome.com: {
#  url: "http://lonesome.com/FreeBSD/${ABI}/latest",
#  mirror_type: "http",
#  signature_type: "none",
#  enabled: yes
# }
# create FreeBSD.conf and enable: no
# or
# static
# fetch http://lonesome.com/FreeBSD/FreeBSD:13:riscv64/latest/Latest/pkg.txz
# tar xf ./pkg.txz -s ",/.*/,,g" "*/pkg-static"
# create /usr/local/etc/pkg.conf:
# ABI = "FreeBSD:13:riscv64"
# or add in ~/.shrc and run . ~/.shrc :
# alias pkg='/usr/local/projects/bin/pkg-static -o ABI=FreeBSD:13:riscv64'


# bigger
# qemu-img resize *.qcow2 +19G
# qemu-img info *.qcow2
# gpart show
# gpart recover vtbd0 # becasue resize hurt part record
# gpart resize -i 4 -s 20G -a 4k vtbd0 # 4 is the partitaion
# growfs /dev/vtbd0p4 # for ufs
# if not work: growfs /dev/rootfs 
# service growfs onestart
# zpool online -e root /dev/vtbd0p4 # for zfs

