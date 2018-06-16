TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://feh.finalrewind.org/
TERMUX_PKG_DESCRIPTION="Fast and light imlib2-based image viewer"
TERMUX_PKG_VERSION=2.25.1
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://feh.finalrewind.org/feh-$TERMUX_PKG_VERSION.tar.bz2
TERMUX_PKG_SHA256=0c5ef21601c11e1aeccb3531a84658c4b67aeb9ab8db92a1da6d8cbad0a9faa4
TERMUX_PKG_DEPENDS="imlib2, libcurl, libexif, libxinerama, libxt"
TERMUX_PKG_BUILD_IN_SRC=true

TERMUX_PKG_EXTRA_MAKE_ARGS="
bin_dir=${TERMUX_PREFIX}/libexec/feh
exif=1
help=1
verscmp=0
"

termux_step_pre_configure()
{
    CFLAGS+=" -I${TERMUX_PREFIX}/include"
}

termux_step_post_make_install()
{
    ## Create a wrapper with workaround for 'Bad system call'
    {
        echo "#!${TERMUX_PREFIX}/bin/sh"
        echo "##"
        echo "## Workaround for 'Bad system call' error."
        echo "##"
        echo
        echo "export LD_PRELOAD=${TERMUX_PREFIX}/lib/libandroid-shmem.so"
        echo
        echo "exec ${TERMUX_PREFIX}/libexec/feh/feh \"\${@}\""
    } > ${TERMUX_PREFIX}/bin/feh

    chmod 700 ${TERMUX_PREFIX}/bin/feh
}
