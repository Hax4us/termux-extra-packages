TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=http://pypanel.sourceforge.net/
TERMUX_PKG_DESCRIPTION="A lightweight panel/taskbar for X11 window managers written in python."
TERMUX_PKG_VERSION=2.4
TERMUX_PKG_REVISION=4
TERMUX_PKG_DEPENDS="imlib2, libxft, python2, python2-xlib, libx11"
TERMUX_PKG_SRCURL=http://downloads.sourceforge.net/sourceforge/pypanel/PyPanel-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=4e612b43c61b3a8af7d57a0364f6cd89df481dc41e20728afa643e9e3546e911
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_CONFFILES="etc/pypanelrc"

termux_step_make () {
	return
}

termux_step_make_install () {
    "${CC}" -DNDEBUG \
            -fwrapv \
            -Wall \
            -Wstrict-prototypes \
            -fno-strict-aliasing \
            -Oz \
            -fPIC \
            -DHAVE_XFT=1 \
            -DIMLIB2_FIX=1 \
            -I/data/data/com.termux/files/usr/include \
            -I/data/data/com.termux/files/usr/include/freetype2 \
            -I/data/data/com.termux/files/usr/include/libpng16 \
            -c ppmodule.c \
            -o ppmodule.o \

    "${CC}" -shared \
            ppmodule.o \
            -L/data/data/com.termux/files/usr/lib \
            -lfreetype \
            -lXft \
            -lImlib2 \
            -lpython2.7 \
            -lX11 \
            -o ppmodule.so

    $STRIP --strip-unneeded ppmodule.so
    $TERMUX_ELF_CLEANER ppmodule.so

    mkdir -p "${TERMUX_PREFIX}/bin"
    cp -f pypanel "${TERMUX_PREFIX}/bin/pypanel"
    chmod 755 "${TERMUX_PREFIX}/bin/pypanel"

    mkdir -p "${TERMUX_PREFIX}/etc"
    cp -f pypanelrc "${TERMUX_PREFIX}/etc/pypanelrc"
    chmod 644 "${TERMUX_PREFIX}/etc/pypanelrc"

    mkdir -p "${TERMUX_PREFIX}/lib/python2.7/site-packages"
    cp ppmodule.so "${TERMUX_PREFIX}/lib/python2.7/site-packages/ppmodule.so"
    chmod 644 "${TERMUX_PREFIX}/lib/python2.7/site-packages/ppmodule.so"

    mkdir -p "${TERMUX_PREFIX}/lib/python2.7/site-packages/pypanel"
    cp -f COPYING README pypanelrc ppicon.png "${TERMUX_PREFIX}/lib/python2.7/site-packages/pypanel/"
    chmod 644 ${TERMUX_PREFIX}/lib/python2.7/site-packages/pypanel/*
}
