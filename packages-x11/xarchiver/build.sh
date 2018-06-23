TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://github.com/ib/xarchiver
TERMUX_PKG_DESCRIPTION="GTK+ frontend to various command line archivers"
TERMUX_PKG_VERSION=0.5.4.13
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/ib/xarchiver/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=617154435731554b793ab00cc373d957c066dc29444c6189029299a89430776c
TERMUX_PKG_DEPENDS="binutils, bzip2, cpio, gzip, libgtk3, lzip, lzop, p7zip, tar, unrar, unzip, xz-utils, zip, zstd"
TERMUX_PKG_RM_AFTER_INSTALL="usr/share/icons/hicolor/icon-theme.cache"
