TERMUX_PKG_HOMEPAGE=http://www.xfce.org/
TERMUX_PKG_DESCRIPTION="simple client-server configuration storage and query system"
_MAJOR_VERSION=4.12
TERMUX_PKG_VERSION=${_MAJOR_VERSION}.1
TERMUX_PKG_MAINTAINER="lokesh @hax4us"
TERMUX_PKG_SRCURL=http://archive.xfce.org/src/xfce/xfconf/${_MAJOR_VERSION}/xfconf-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=35f48564e5694faa54fdc180cd3268e16fc2352946a89a3c2fc12cbe400ada36
TERMUX_PKG_DEPENDS="libxfce4util, dbus-glib"
