TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://www.freedesktop.org/wiki/Software/icon-theme/
TERMUX_PKG_DESCRIPTION="Freedesktop.org Hicolor icon theme"
TERMUX_PKG_VERSION=0.17
TERMUX_PKG_REVISION=3
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_make_install()
{
    install -Dm644 "${TERMUX_PKG_BUILDER_DIR}/index.theme" "${TERMUX_PREFIX}/share/icons/hicolor/index.theme"
}

termux_step_create_debscripts()
{
    cp "${TERMUX_PKG_BUILDER_DIR}/postinst" ./postinst
}
