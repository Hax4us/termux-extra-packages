TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=http://dri.freedesktop.org
TERMUX_PKG_VERSION=2.4.80
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL=https://dri.freedesktop.org/libdrm/libdrm-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=a82a519601e9cdfad795e760807eb07ac8913b225e25fc8fe9bc03e3be6549f1
TERMUX_PKG_CLANG=no

termux_step_pre_configure () {
    CFLAGS="${CFLAGS} -DANDROID"
}
