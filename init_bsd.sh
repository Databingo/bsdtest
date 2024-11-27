mkdir /usr/local/projects
# pkg for riscv64
mkdir -p  /usr/local/etc/pkg/repos
touch /usr/local/etc/pkg/repos/lonesome.com.conf
# config
# add to /usr/local/etc/pkg/repos/lonesome.com.conf
echo '
 lonesome.com: {
  url: "http://lonesome.com/FreeBSD/${ABI}/latest",
  mirror_type: "http",
  signature_type: "none",
  enabled: yes
 }' > /usr/local/etc/pkg/repos/lonesome.com.conf
# create FreeBSD.conf and enable: no
echo '
 FreeBSD: {
  url: "http://lonesome.com/FreeBSD/${ABI}/latest",
  mirror_type: "http",
  signature_type: "none",
  enabled: no
 }' > /usr/local/etc/pkg/repos/FreeBSD.conf
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

