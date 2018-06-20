TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=http://aterm.sourceforge.net/
TERMUX_PKG_DESCRIPTION="An xterm replacement with transparency support"
TERMUX_PKG_VERSION=1.0.1
TERMUX_PKG_SRCURL=http://downloads.sourceforge.net/sourceforge/aterm/aterm-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=a161c3b2d9c7149130a41963899993af21eae92e8e362f4b5b3c7c4cb16760ce
TERMUX_PKG_DEPENDS="libjpeg-turbo, librsvg, libxinerama, libxt"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--enable-transparency=yes
--enable-background-image
--enable-fading
--enable-menubar
--enable-graphics
"
