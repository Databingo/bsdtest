#/bin/sh

#mkdir -p /usr/local/etc/pkg/repos &&
#echo 'FressBSD:{url:"https://mirrors.ustc.edu.cn/freebsd-pkg/${ABI}/latest",mirror_type:"NONE"}' > /usr/local/etc/pkg/repos/FreeBSD.conf &&

# sysctl kern.geom.debugflags=16
# gpart resize -i 4 -s 20G -a 4k vtbd0
# gpart recover vtbd0
# growfs /dev/vtbd0p4 # for ufs
# service growfs onestart
# zpool online -e root /dev/vtbd0p4 # for zfs

#pkg install git
#pkg install go

# if system check failed:
# fsck -y
# reboot

# shutdown -p now # for power off

# pkg install xorg 
# pkg install xfce 
# pkg install -f xinit
# pkg install -f pixman
# pkg install -f xorg-drivers
# pkg install -f xorg-server
# pkg install xf86-video-intel
# pkg install xf86-video-amdgpu
# pkg install -f libpciaccess
# pkg install -f libfont2
# pkg install -f libxshmfence
# pkg install -f xf86-input-evdev
# pkg install -f libudev-devd
# pkg install -f libdrm
# pkg install -f libxcvt
# pkg install -f libfontenc
# pkg install -f freetype2
# pkg install -f png
# pkg install -f brotli
# pkg install -f xauth
# pkg install -f libxext
# pkg install -f libxmu
# pkg install -f x11/xrandr
# pkg install -f xf86-video-vesa 
# pkg install -f mesa-demos
# pkg install -f mesa-dri
# pkg install -f xf86-input-keyboard
# pkg install -f xkeyboard-config
# pkg install -f xkbcomp
# pkg install -f libxkbfile
# pkg install -f libsm
# pkg install -f libice
# pkg install -f devel/glib20
# pkg install -f libiconv
# pkg install -f libxrender
# pkg install -f libxres
# pkg install -f fontconfig
# pkg install -f libepoxy
# pkg install -f libxi
# pkg install -f libxfixes
# pkg install -f wayland
# pkg install -f libxcursor
# pkg install -f libxdamage
# pkg install -f libxcomposite
# pkg install -f libxrandr
# pkg install -f libxinerama
# pkg install -f libglvnd
# pkg install -f xcb-util
# pkg install -f libepoll-shim
# pkg install -f libinput
# pkg install -f mesa-libs
# pkg install -f libmtdev


Failed loadModule glx
Failed libGL.so.1
Failed libglx.so
Failed loadModule modesetting
Failed libgbm.so.1 modesetting_drv.so
Failed loadModule scfb
Failed vesa
no drivers available

