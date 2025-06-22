mkdir -p /usr/local/projects/bin

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
# run pkg install git

# (freebsd13 use opensslv1)
# or pkg static 
fetch http://lonesome.com/FreeBSD/FreeBSD:14:riscv64/latest/Latest/pkg.txz
tar xf ./pkg.txz -s ",/.*/,,g" "*/pkg-static"
mv pkg-static /usr/local/projects/bin/pkg
# create /usr/local/etc/pkg.conf:
# ABI = "FreeBSD:13:riscv64" ?
# or add in ~/.shrc and run . ~/.shrc :
echo "export PATH=$PATH:/usr/local/projects/bin/" >> ~/.shrc
echo "alias pkg='/usr/local/projects/bin/pkg'" >> ~/.shrc

#echo "export http_proxy=http://10.0.2.15:7890" >> ~/.shrc
#echo "export https_proxy=https://10.0.2.15:7890" >> ~/.shrc
#echo "export all_proxy=socks5://10.0.2.15:7890" >> ~/.shrc

. ~/.shrc

#pkg install vim-tiny
#echo "set -o vi" >> ~/.shrc
#echo "alias vi='vim'" >> ~/.shrc   

#. ~/.shrc

#pkg install tmux
#pkg install git

# or just use ports:
#fetch http://github.com/freebsd/freebsd-ports/archive/refs/heads/main.zip
#tar -xf main.zip -C /usr
#cd /usr/ports && make fetchindex
# then cd /usr/ports/lang/go123 make install clean will install go and dependences pkg 

# bigger
# !raw extend before the first time boot will automatically exteng file system
# qemu-img resize *.qcow2 +19G
# --------
# qemu-img info *.qcow2
# gpart show
# gpart recover vtbd0 # becasue resize hurt part record
# gpart resize -i 3 -s 20G -a 4k vtbd0 # 3 is the partitaion
# ufs:
# growfs /dev/vtbd0p4 # for ufs
# if not work: growfs /dev/rootfs 
# service growfs onestart
# zfs:
# zpool stauts
# zpool online -e zroot /dev/vtbd0p3 # for zfs
# zpool list

# raw 
#truncate -s 20G FreeBSD*.raw
#first boot fs will grow
#also can same as qcow2




