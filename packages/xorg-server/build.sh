TERMUX_PKG_VERSION=1.19.6
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://www.x.org/archive/individual/xserver/xorg-server-$TERMUX_PKG_VERSION.tar.bz2
TERMUX_PKG_SHA256=a732502f1db000cf36a376cd0c010ffdbf32ecdd7f1fa08ba7f5bdf9601cc197
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--disable-libdrm
--disable-glx
--enable-composite
--enable-mitshm
--enable-xres
--enable-record
--disable-xv
--disable-xvmc
--disable-screensaver
--enable-present
--disable-xace
--disable-dbe
--disable-dpms
--disable-xfree86-utils
--disable-vgahw
--disable-vbe
--disable-int10-module
--disable-pciaccess
--disable-dri
--disable-input-thread
--disable-glamor
--disable-xf86vidmode
--disable-xf86bigfont
--disable-clientids
--disable-linux-acpi
--disable-linux-apm
--disable-strict-compilation
--disable-visibility
--disable-xnest
--disable-xquartz
--disable-xwin
--disable-xwayland
--disable-standalone-xpbproxy
--disable-kdrive
--disable-kdrive-evdev
--disable-kdrive-kbd
--disable-xephyr
--disable-xfake
--disable-xfbdev
--disable-secure-rpc
--enable-input-thread
--enable-xtrans-send-fds
--disable-xorg
--enable-xvfb
--disable-dmx
--enable-ipv6
--with-sha1=libcrypto
--with-fontrootdir=$TERMUX_PREFIX/share/fonts
--with-xkb-path=$TERMUX_PREFIX/share/X11/xkb
LIBS=-landroid-shmem"
TERMUX_PKG_DEPENDS="libandroid-shmem, libx11, libxfont2, libxkbfile, libxau, libpixman, openssl, xorg-xkbcomp, libxinerama"

termux_step_pre_configure () {
	CFLAGS="$CFLAGS -DFNDELAY=O_NDELAY"
	if [ -n "$TERMUX_DEBUG" ]; then
		TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --enable-debug"
	fi
}

termux_step_post_make_install () {
	rm -f "${TERMUX_PREFIX}/usr/share/X11/xkb/compiled"
}

if [ "$#" -eq 1 ] && [ "$1" == "xorg_server_flags" ]; then
        echo $TERMUX_PKG_EXTRA_CONFIGURE_ARGS
        return 
fi
