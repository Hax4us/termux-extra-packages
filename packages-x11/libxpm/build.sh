TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://xorg.freedesktop.org/
TERMUX_PKG_DESCRIPTION="X11 pixmap library"
TERMUX_PKG_VERSION=3.5.12
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL=https://xorg.freedesktop.org/releases/individual/lib/libXpm-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=fd6a6de3da48de8d1bb738ab6be4ad67f7cb0986c39bd3f7d51dd24f7854bdec
TERMUX_PKG_DEPENDS="libxext, libxt"
TERMUX_PKG_DEPENDS="xorg-util-macros"
